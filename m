Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A18B12E1F9D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 17:54:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58528.103026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks7Om-00037h-PY; Wed, 23 Dec 2020 16:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58528.103026; Wed, 23 Dec 2020 16:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks7Om-00037H-L3; Wed, 23 Dec 2020 16:54:04 +0000
Received: by outflank-mailman (input) for mailman id 58528;
 Wed, 23 Dec 2020 16:54:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ifz=F3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ks7Ol-00037C-AR
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 16:54:03 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id adf9c0fe-df5e-415a-ae92-cd5b3f3e2391;
 Wed, 23 Dec 2020 16:54:01 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: adf9c0fe-df5e-415a-ae92-cd5b3f3e2391
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608742440;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=+Ow/08H7o3lfn+IMD8GWEhKU7GWxaorSbZkANt5eAH4=;
  b=SCrAluiaE0V+yS/2kYdjKbNGQ6EZVmuVhYwTnB7QWyT38LBhFdMzQkna
   5OcXmHQvmkpTuCl7ELEOTOKU/GCQNDRo9GS2TofNsP6pLPBc6+T6c8vvW
   RP6FXxXnyzIi1PmJ+22VopaCkV4s9Lw+qn6sssPQqH6Q/g8eAD7NBpTTI
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: hTBonwiLKpo/PXjRNigNTipnfjqUbR19Vf9I7uTIUOSXQPFH1h4CmRGo99qqWw6vNSMY4iyB+k
 K6zRlTJPZzcfTW3Eua43a7A3bn0hHwOYC3EhGsp/8+cJKCVHb8+7DgsaHk+1luTOyUJOhTJgOx
 7YUEudbYmW7Wy0CUN/cezI890grXvdAvoi+QQV9f0hkXjTfmpLFSZ5hkloxda/LO2vtlMRKAKY
 cYfNJaKHalyR+XN69PGXzRw5yUKrbHT/Ewi4RQ0R3QYQzVOMTe61MPigAxbe7livZZAQAjI1Na
 368=
X-SBRS: 5.2
X-MesageID: 34204501
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,441,1599537600"; 
   d="scan'208";a="34204501"
Subject: Re: [PATCH v2] lib: drop (replace) debug_build()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ae31ccf1-7334-cdf9-9b90-edac7ca4e148@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bdb96275-c6a4-a4d2-9195-67fd2f3f1bf3@citrix.com>
Date: Wed, 23 Dec 2020 16:53:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ae31ccf1-7334-cdf9-9b90-edac7ca4e148@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 23/12/2020 16:05, Jan Beulich wrote:
> Its expansion shouldn't be tied to NDEBUG - down the road we may want to
> allow enabling assertions independently of CONFIG_DEBUG. Replace the few
> uses by a new xen_build_info() helper, subsuming gcov_string at the same
> time (while replacing the stale CONFIG_GCOV used there) and also adding
> CONFIG_UBSAN indication.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...

> ---
> v2: Introduce xen_build_info() including also gcov and ubsan info.
>
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -175,14 +175,14 @@ static void print_xen_info(void)
>  {
>      char taint_str[TAINT_STRING_MAX_LEN];
>  
> -    printk("----[ Xen-%d.%d%s  %s  debug=%c " gcov_string "  %s ]----\n",
> +    printk("----[ Xen-%d.%d%s  %s  %s  %s ]----\n",
>             xen_major_version(), xen_minor_version(), xen_extra_version(),
>  #ifdef CONFIG_ARM_32
>             "arm32",
>  #else
>             "arm64",
>  #endif
> -           debug_build() ? 'y' : 'n', print_tainted(taint_str));
> +           xen_build_info(), print_tainted(taint_str));
>  }
>  
>  #ifdef CONFIG_ARM_32
> --- a/xen/arch/x86/x86_64/traps.c
> +++ b/xen/arch/x86/x86_64/traps.c
> @@ -29,9 +29,9 @@ static void print_xen_info(void)
>  {
>      char taint_str[TAINT_STRING_MAX_LEN];
>  
> -    printk("----[ Xen-%d.%d%s  x86_64  debug=%c " gcov_string "  %s ]----\n",
> +    printk("----[ Xen-%d.%d%s  x86_64  %s  %s ]----\n",
>             xen_major_version(), xen_minor_version(), xen_extra_version(),
> -           debug_build() ? 'y' : 'n', print_tainted(taint_str));
> +           xen_build_info(), print_tainted(taint_str));
>  }
>  
>  enum context { CTXT_hypervisor, CTXT_pv_guest, CTXT_hvm_guest };
> --- a/xen/common/version.c
> +++ b/xen/common/version.c
> @@ -70,6 +70,30 @@ const char *xen_deny(void)
>      return "<denied>";
>  }
>  
> +static const char build_info[] =
> +    "debug="
> +#ifdef CONFIG_DEBUG
> +    "y"
> +#else
> +    "n"
> +#endif
> +#ifdef CONFIG_COVERAGE
> +# ifdef __clang__
> +    " llvmcov=y"
> +# else
> +    " gcov=y"
> +# endif
> +#endif
> +#ifdef CONFIG_UBSAN
> +    " ubsan=y"
> +#endif
> +    "";
> +
> +const char *xen_build_info(void)
> +{
> +    return build_info;
> +}

... do we really need a function here?

Wouldn't an extern const char build_info[] do?

~Andrew

> +
>  static const void *build_id_p __read_mostly;
>  static unsigned int build_id_len __read_mostly;
>  
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -1002,10 +1002,10 @@ void __init console_init_preirq(void)
>      spin_lock(&console_lock);
>      __putstr(xen_banner());
>      spin_unlock(&console_lock);
> -    printk("Xen version %d.%d%s (%s@%s) (%s) debug=%c " gcov_string " %s\n",
> +    printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
>             xen_major_version(), xen_minor_version(), xen_extra_version(),
> -           xen_compile_by(), xen_compile_domain(),
> -           xen_compiler(), debug_build() ? 'y' : 'n', xen_compile_date());
> +           xen_compile_by(), xen_compile_domain(), xen_compiler(),
> +           xen_build_info(), xen_compile_date());
>      printk("Latest ChangeSet: %s\n", xen_changeset());
>  
>      /* Locate and print the buildid, if applicable. */
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -48,21 +48,13 @@
>  #define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
>  #endif
>  
> -#ifdef CONFIG_GCOV
> -#define gcov_string "gcov=y"
> -#else
> -#define gcov_string ""
> -#endif
> -
>  #ifndef NDEBUG
>  #define ASSERT(p) \
>      do { if ( unlikely(!(p)) ) assert_failed(#p); } while (0)
>  #define ASSERT_UNREACHABLE() assert_failed("unreachable")
> -#define debug_build() 1
>  #else
>  #define ASSERT(p) do { if ( 0 && (p) ) {} } while (0)
>  #define ASSERT_UNREACHABLE() do { } while (0)
> -#define debug_build() 0
>  #endif
>  
>  #define ABS(_x) ({                              \
> --- a/xen/include/xen/version.h
> +++ b/xen/include/xen/version.h
> @@ -16,6 +16,7 @@ const char *xen_extra_version(void);
>  const char *xen_changeset(void);
>  const char *xen_banner(void);
>  const char *xen_deny(void);
> +const char *xen_build_info(void);
>  int xen_build_id(const void **p, unsigned int *len);
>  
>  #ifdef BUILD_ID


