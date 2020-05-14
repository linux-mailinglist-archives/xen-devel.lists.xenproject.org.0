Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB84D1D2C76
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 12:21:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZAyc-0002JO-8i; Thu, 14 May 2020 10:20:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jZAya-0002JJ-Ou
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 10:20:28 +0000
X-Inumbo-ID: 87ad0f7c-95cc-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87ad0f7c-95cc-11ea-9887-bc764e2007e4;
 Thu, 14 May 2020 10:20:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AAD52AEB9;
 Thu, 14 May 2020 10:20:28 +0000 (UTC)
Subject: Re: [PATCH v8 09/12] xen: add runtime parameter access support to
 hypfs
To: Juergen Gross <jgross@suse.com>
References: <20200508153421.24525-1-jgross@suse.com>
 <20200508153421.24525-10-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a6c10680-d570-dabb-61ad-627591d08b0e@suse.com>
Date: Thu, 14 May 2020 12:20:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200508153421.24525-10-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.05.2020 17:34, Juergen Gross wrote:
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -89,6 +89,13 @@ SECTIONS
>         __start_schedulers_array = .;
>         *(.data.schedulers)
>         __end_schedulers_array = .;
> +
> +#ifdef CONFIG_HYPFS
> +       . = ALIGN(8);
> +       __paramhypfs_start = .;
> +       *(.data.paramhypfs)
> +       __paramhypfs_end = .;
> +#endif
>         *(.data.rel)
>         *(.data.rel.*)
>         CONSTRUCTORS

I'm not the maintainer of this code, but I think it would be better
if there was either no blank line inserted, or two (a 2nd one after
your insertion).

> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -52,9 +52,27 @@ static __read_mostly enum {
>      PCID_OFF,
>      PCID_ALL,
>      PCID_XPTI,
> -    PCID_NOXPTI
> +    PCID_NOXPTI,
> +    PCID_END
>  } opt_pcid = PCID_XPTI;

Is this change really needed? The only use looks to be ...

> +#ifdef CONFIG_HYPFS
> +static const char opt_pcid_2_string[PCID_END][7] = {

... here, yet the arry would end up the same when using [][7].

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -85,8 +85,43 @@ struct grant_table {
>      struct grant_table_arch arch;
>  };
>  
> -static int parse_gnttab_limit(const char *param, const char *arg,
> -                              unsigned int *valp)
> +unsigned int __read_mostly opt_max_grant_frames = 64;
> +static unsigned int __read_mostly opt_max_maptrack_frames = 1024;
> +
> +#ifdef CONFIG_HYPFS
> +#define GRANT_CUSTOM_VAL_SZ  12
> +static char __read_mostly opt_max_grant_frames_val[GRANT_CUSTOM_VAL_SZ];
> +static char __read_mostly opt_max_maptrack_frames_val[GRANT_CUSTOM_VAL_SZ];
> +
> +static void update_gnttab_par(struct param_hypfs *par, unsigned int val,
> +                              char *parval)
> +{
> +    snprintf(parval, GRANT_CUSTOM_VAL_SZ, "%u", val);
> +    custom_runtime_set_var_sz(par, parval, GRANT_CUSTOM_VAL_SZ);
> +}
> +
> +static void __init gnttab_max_frames_init(struct param_hypfs *par)
> +{
> +    update_gnttab_par(par, opt_max_grant_frames, opt_max_grant_frames_val);
> +}
> +
> +static void __init max_maptrack_frames_init(struct param_hypfs *par)
> +{
> +    update_gnttab_par(par, opt_max_maptrack_frames,
> +                      opt_max_maptrack_frames_val);
> +}
> +#else
> +#define opt_max_grant_frames_val    NULL
> +#define opt_max_maptrack_frames_val NULL

This looks latently dangerous to me (in case new uses of these
two identifiers appeared), but I guess my alternative suggestion
will be at best controversial, too:

#define update_gnttab_par(par, val, unused) update_gnttab_par(par, val)
#define parse_gnttab_limit(par, arg, valp, unused) parse_gnttab_limit(par, arg, valp)

(placed right here)

> @@ -281,6 +282,36 @@ int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
>      return 0;
>  }
>  
> +int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
> +                       XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)
> +{
> +    struct param_hypfs *p;
> +    char *buf;
> +    int ret;
> +
> +    buf = xzalloc_array(char, ulen);
> +    if ( !buf )
> +        return -ENOMEM;
> +
> +    ret = -EFAULT;
> +    if ( copy_from_guest(buf, uaddr, ulen) )

As just indicated in an extra reply to patch 4, ulen not getting
truncated here silently is well obscured (the max_size field type
and the check against it elsewhere looks to guarantee this).

> +        goto out;
> +
> +    ret = -EDOM;
> +    if ( memchr(buf, 0, ulen) != (buf + ulen - 1) )
> +        goto out;
> +
> +    p = container_of(leaf, struct param_hypfs, hypfs);
> +    ret = p->param->par.func(buf);
> +
> +    if ( !ret )
> +        leaf->e.size = ulen;

Why? For "ept", "no-exec-sp" would yield "exec-sp=0", and hence
you'd wrongly extend the size from what parse_ept_param_runtime()
has already set through custom_runtime_set_var(). It looks to me
as if there's no reason to update e.size here at all; it's the
par.func() handlers which need to take care of this.

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -75,12 +75,35 @@ enum con_timestamp_mode
>      TSM_DATE_MS,       /* [YYYY-MM-DD HH:MM:SS.mmm] */
>      TSM_BOOT,          /* [SSSSSS.uuuuuu] */
>      TSM_RAW,           /* [XXXXXXXXXXXXXXXX] */
> +    TSM_END
>  };

Just like for the PCID enumeration I don't think a sentinel is
needed here.

>  static enum con_timestamp_mode __read_mostly opt_con_timestamp_mode = TSM_NONE;
>  
> +#ifdef CONFIG_HYPFS
> +static const char con_timestamp_mode_2_string[TSM_END][7] = {
> +    [TSM_NONE] = "none",
> +    [TSM_DATE] = "date",
> +    [TSM_DATE_MS] = "datems",
> +    [TSM_BOOT] = "boot",
> +    [TSM_RAW] = "raw"

Add a trailing comma please (and as I notice only now then also
in the similar PCID array).

To the subsequent code the gnttab comment applies as well.

> @@ -80,7 +81,120 @@ extern const struct kernel_param __param_start[], __param_end[];
>  
>  #define __rtparam         __param(__dataparam)
>  
> -#define custom_runtime_only_param(_name, _var) \
> +#ifdef CONFIG_HYPFS
> +
> +struct param_hypfs {
> +    const struct kernel_param *param;
> +    struct hypfs_entry_leaf hypfs;
> +    void (*init_leaf)(struct param_hypfs *par);
> +};
> +
> +extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
> +
> +#define __paramhypfs      __used_section(".data.paramhypfs")
> +
> +#define __paramfs         static __paramhypfs \
> +    __attribute__((__aligned__(sizeof(void *)))) struct param_hypfs

Why the attribute?

> +#define custom_runtime_set_var_sz(parfs, var, sz) \
> +    { \
> +        (parfs)->hypfs.content = var; \
> +        (parfs)->hypfs.e.max_size = sz; \

var and sz want parentheses around them.

> +        (parfs)->hypfs.e.size = strlen(var) + 1; \
> +    }
> +#define custom_runtime_set_var(parfs, var) \
> +    custom_runtime_set_var_sz(parfs, var, sizeof(var))
> +
> +#define param_2_parfs(par) &__parfs_##par
> +
> +/* initfunc needs to set size and content, e.g. via custom_runtime_set_var(). */
> +#define custom_runtime_only_param(_name, _var, initfunc) \

I've started noticing it here, but the issue exists further up
(and down) as well - please can you avoid identifiers with
leading underscores that are in violation of the C standard?
Even more so that here you're not even consistent across
macro parameter names.

> +    __rtparam __rtpar_##_var = \
> +      { .name = _name, \
> +          .type = OPT_CUSTOM, \
> +          .par.func = _var }; \
> +    __paramfs __parfs_##_var = \
> +        { .param = &__rtpar_##_var, \
> +          .init_leaf = initfunc, \
> +          .hypfs.e.type = XEN_HYPFS_TYPE_STRING, \
> +          .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
> +          .hypfs.e.name = _name, \
> +          .hypfs.e.read = hypfs_read_leaf, \
> +          .hypfs.e.write = hypfs_write_custom }
> +#define boolean_runtime_only_param(_name, _var) \
> +    __rtparam __rtpar_##_var = \
> +        { .name = _name, \
> +          .type = OPT_BOOL, \
> +          .len = sizeof(_var) + \
> +                 BUILD_BUG_ON_ZERO(sizeof(_var) != sizeof(bool)), \
> +          .par.var = &_var }; \
> +    __paramfs __parfs_##_var = \
> +        { .param = &__rtpar_##_var, \
> +          .hypfs.e.type = XEN_HYPFS_TYPE_BOOL, \
> +          .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
> +          .hypfs.e.name = _name, \
> +          .hypfs.e.size = sizeof(_var), \
> +          .hypfs.e.max_size = sizeof(_var), \
> +          .hypfs.e.read = hypfs_read_leaf, \
> +          .hypfs.e.write = hypfs_write_bool, \
> +          .hypfs.content = &_var }
> +#define integer_runtime_only_param(_name, _var) \
> +    __rtparam __rtpar_##_var = \
> +        { .name = _name, \
> +          .type = OPT_UINT, \
> +          .len = sizeof(_var), \
> +          .par.var = &_var }; \
> +    __paramfs __parfs_##_var = \
> +        { .param = &__rtpar_##_var, \
> +          .hypfs.e.type = XEN_HYPFS_TYPE_UINT, \
> +          .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
> +          .hypfs.e.name = _name, \
> +          .hypfs.e.size = sizeof(_var), \
> +          .hypfs.e.max_size = sizeof(_var), \
> +          .hypfs.e.read = hypfs_read_leaf, \
> +          .hypfs.e.write = hypfs_write_leaf, \
> +          .hypfs.content = &_var }
> +#define size_runtime_only_param(_name, _var) \
> +    __rtparam __rtpar_##_var = \
> +        { .name = _name, \
> +          .type = OPT_SIZE, \
> +          .len = sizeof(_var), \
> +          .par.var = &_var }; \
> +    __paramfs __parfs_##_var = \
> +        { .param = &__rtpar_##_var, \
> +          .hypfs.e.type = XEN_HYPFS_TYPE_UINT, \
> +          .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
> +          .hypfs.e.name = _name, \
> +          .hypfs.e.size = sizeof(_var), \
> +          .hypfs.e.max_size = sizeof(_var), \
> +          .hypfs.e.read = hypfs_read_leaf, \
> +          .hypfs.e.write = hypfs_write_leaf, \
> +          .hypfs.content = &_var }
> +#define string_runtime_only_param(_name, _var) \
> +    __rtparam __rtpar_##_var = \
> +        { .name = _name, \
> +          .type = OPT_STR, \
> +          .len = sizeof(_var), \
> +          .par.var = &_var }; \
> +    __paramfs __parfs_##_var = \
> +        { .param = &__rtpar_##_var, \
> +          .hypfs.e.type = XEN_HYPFS_TYPE_STRING, \
> +          .hypfs.e.encoding = XEN_HYPFS_ENC_PLAIN, \
> +          .hypfs.e.name = _name, \
> +          .hypfs.e.size = sizeof(_var), \

Is this really correct here?

> +          .hypfs.e.max_size = sizeof(_var), \
> +          .hypfs.e.read = hypfs_read_leaf, \
> +          .hypfs.e.write = hypfs_write_leaf, \
> +          .hypfs.content = &_var }
> +
> +#else
> +
> +struct param_hypfs {
> +};
> +
> +#define param_2_parfs(par)  NULL

Along the lines of the earlier comment, this looks latently dangerous.

Jan

