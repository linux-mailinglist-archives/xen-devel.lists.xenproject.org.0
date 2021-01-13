Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27862F524F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 19:37:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66699.118568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzl1c-0001xT-1k; Wed, 13 Jan 2021 18:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66699.118568; Wed, 13 Jan 2021 18:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzl1b-0001x4-Uf; Wed, 13 Jan 2021 18:37:43 +0000
Received: by outflank-mailman (input) for mailman id 66699;
 Wed, 13 Jan 2021 18:37:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kzl1b-0001wz-17
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 18:37:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzl1Y-00025h-G6; Wed, 13 Jan 2021 18:37:40 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzl1Y-0005sK-8j; Wed, 13 Jan 2021 18:37:40 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=wXtyxP1rq//GiBJZ5TtufOpohWD+oETwm9gypmyRU0M=; b=c3iQOYy4ZYqFyxVkeElyRBByLs
	eF0EcXcXzlF/OuBd7A25MUcCRdu7XEhLrZIljd6WaqniA66SxhdcKg3pe17Ktr84EdPWf3EDMCfS8
	skc9Cco0jf7crCPvCe3pNHb0uOzeRyuL4qfU0PMfqqxOKfOTWTNPpTHyquA+TTqjchhI=;
Subject: Re: [PATCH v2] lib: drop (replace) debug_build()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ae31ccf1-7334-cdf9-9b90-edac7ca4e148@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <43b30335-500c-47a4-947d-45935322e311@xen.org>
Date: Wed, 13 Jan 2021 18:37:38 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <ae31ccf1-7334-cdf9-9b90-edac7ca4e148@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/12/2020 16:05, Jan Beulich wrote:
> Its expansion shouldn't be tied to NDEBUG - down the road we may want to
> allow enabling assertions independently of CONFIG_DEBUG. Replace the few
> uses by a new xen_build_info() helper, subsuming gcov_string at the same
> time (while replacing the stale CONFIG_GCOV used there) and also adding
> CONFIG_UBSAN indication.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

For the Arm code:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> v2: Introduce xen_build_info() including also gcov and ubsan info.
> 
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -175,14 +175,14 @@ static void print_xen_info(void)
>   {
>       char taint_str[TAINT_STRING_MAX_LEN];
>   
> -    printk("----[ Xen-%d.%d%s  %s  debug=%c " gcov_string "  %s ]----\n",
> +    printk("----[ Xen-%d.%d%s  %s  %s  %s ]----\n",
>              xen_major_version(), xen_minor_version(), xen_extra_version(),
>   #ifdef CONFIG_ARM_32
>              "arm32",
>   #else
>              "arm64",
>   #endif
> -           debug_build() ? 'y' : 'n', print_tainted(taint_str));
> +           xen_build_info(), print_tainted(taint_str));
>   }
>   
>   #ifdef CONFIG_ARM_32
> --- a/xen/arch/x86/x86_64/traps.c
> +++ b/xen/arch/x86/x86_64/traps.c
> @@ -29,9 +29,9 @@ static void print_xen_info(void)
>   {
>       char taint_str[TAINT_STRING_MAX_LEN];
>   
> -    printk("----[ Xen-%d.%d%s  x86_64  debug=%c " gcov_string "  %s ]----\n",
> +    printk("----[ Xen-%d.%d%s  x86_64  %s  %s ]----\n",
>              xen_major_version(), xen_minor_version(), xen_extra_version(),
> -           debug_build() ? 'y' : 'n', print_tainted(taint_str));
> +           xen_build_info(), print_tainted(taint_str));
>   }
>   
>   enum context { CTXT_hypervisor, CTXT_pv_guest, CTXT_hvm_guest };
> --- a/xen/common/version.c
> +++ b/xen/common/version.c
> @@ -70,6 +70,30 @@ const char *xen_deny(void)
>       return "<denied>";
>   }
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
> +
>   static const void *build_id_p __read_mostly;
>   static unsigned int build_id_len __read_mostly;
>   
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -1002,10 +1002,10 @@ void __init console_init_preirq(void)
>       spin_lock(&console_lock);
>       __putstr(xen_banner());
>       spin_unlock(&console_lock);
> -    printk("Xen version %d.%d%s (%s@%s) (%s) debug=%c " gcov_string " %s\n",
> +    printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
>              xen_major_version(), xen_minor_version(), xen_extra_version(),
> -           xen_compile_by(), xen_compile_domain(),
> -           xen_compiler(), debug_build() ? 'y' : 'n', xen_compile_date());
> +           xen_compile_by(), xen_compile_domain(), xen_compiler(),
> +           xen_build_info(), xen_compile_date());
>       printk("Latest ChangeSet: %s\n", xen_changeset());
>   
>       /* Locate and print the buildid, if applicable. */
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -48,21 +48,13 @@
>   #define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
>   #endif
>   
> -#ifdef CONFIG_GCOV
> -#define gcov_string "gcov=y"
> -#else
> -#define gcov_string ""
> -#endif
> -
>   #ifndef NDEBUG
>   #define ASSERT(p) \
>       do { if ( unlikely(!(p)) ) assert_failed(#p); } while (0)
>   #define ASSERT_UNREACHABLE() assert_failed("unreachable")
> -#define debug_build() 1
>   #else
>   #define ASSERT(p) do { if ( 0 && (p) ) {} } while (0)
>   #define ASSERT_UNREACHABLE() do { } while (0)
> -#define debug_build() 0
>   #endif
>   
>   #define ABS(_x) ({                              \
> --- a/xen/include/xen/version.h
> +++ b/xen/include/xen/version.h
> @@ -16,6 +16,7 @@ const char *xen_extra_version(void);
>   const char *xen_changeset(void);
>   const char *xen_banner(void);
>   const char *xen_deny(void);
> +const char *xen_build_info(void);
>   int xen_build_id(const void **p, unsigned int *len);
>   
>   #ifdef BUILD_ID
> 

-- 
Julien Grall

