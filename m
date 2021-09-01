Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 621D43FD9DF
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 14:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176367.320940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLPmB-0000Ek-Oh; Wed, 01 Sep 2021 12:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176367.320940; Wed, 01 Sep 2021 12:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLPmB-0000CT-Lh; Wed, 01 Sep 2021 12:55:35 +0000
Received: by outflank-mailman (input) for mailman id 176367;
 Wed, 01 Sep 2021 12:55:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mLPmA-0000CN-I3
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 12:55:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLPm6-0002Dm-PT; Wed, 01 Sep 2021 12:55:30 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLPm6-0007By-Hy; Wed, 01 Sep 2021 12:55:30 +0000
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
	bh=2jdGvkMeJGwBMQ7U7T6XK/oCun6VmqB1B0FRR7GMfzI=; b=dtAyaE/e4bARK5hKVTA1wVYfVO
	l3n2kZkw2WaHB57QZzLrXIrWn+uwBcorCRlr6Xb6sR7Av3cLGZIWSGpiAsXiqTpDiXv9aPHoWMkwE
	wzL5m0nuyYYXTHozaFytCXDtHsJ9lcKQ8jYKmgJiSO0ds/E0LgDGM6djJmak31SKh+w4=;
Subject: Re: [PATCH] xen/arm: Introduce pmu_access parameter
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210901124308.31573-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <599515f0-4b8a-3a71-caea-b17ec27c9123@xen.org>
Date: Wed, 1 Sep 2021 13:55:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901124308.31573-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 01/09/2021 13:43, Michal Orzel wrote:
> Introduce new Xen command line parameter called "pmu_access".
> The default value is "trap": Xen traps PMU accesses.
> In case of setting pmu_access to "native", Xen does not trap
> PMU accesses allowing all the guests to access PMU registers.
> However, guests cannot make use of PMU overflow interrupts as
> PMU uses PPI which Xen cannot route to guests.
> 
> This option is only intended for development and testing purposes.
> Do not use this in production system.
I am afraid your option is not safe even in development system as a vCPU 
may move between pCPUs.

However, even if we restricted the use to pinned vCPU *and* dedicated 
pCPU, I am not convinced that exposing an half backed PMU (the overflow 
interrupt would not work) to the guest is the right solution. This 
likely means the guest OS would need to be modified and therefore the 
usage of this option is fairly limited.

So I think the first steps are:
   1) Make the PPI work. There was some attempt in the past for it on 
xen-devel. You could have a look.
   2) Provide PMU bindings

With that in place, we can discuss how to expose the PMU even if it is 
unsafe in some conditions.

> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com> > ---
>   docs/misc/xen-command-line.pandoc | 18 +++++++++++++++++
>   xen/arch/arm/traps.c              | 33 ++++++++++++++++++++++++++++++-
>   2 files changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index b175645fde..03637a9f6d 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1813,6 +1813,24 @@ paging controls access to usermode addresses.
>   ### ple_window (Intel)
>   > `= <integer>`
>   
> +### pmu_access (arm)
> +> `= trap | native`
> +
> +> Default: `trap`
> +
> +Controls for accessing Performance Monitor Unit (PMU).
> +
> +By default Xen traps Performance Monitor accesses.
> +When setting pmu_access to `native`, Xen does not trap PMU accesses allowing
> +the guests to access PMU registers. This option is intended to aid monitoring
> +and measuring the performance. Setting pmu_access to `native` allows
> +all the guests to access PMU, however, there is no mechanism for forwarding
> +PMU overflow interrupt requests.
> +
> +*Warning*
> +This option is only intended for development and testing purposes.
> +Do not use this in production system.
> +
>   ### psr (Intel)
>   > `= List of ( cmt:<boolean> | rmid_max:<integer> | cat:<boolean> | cos_max:<integer> | cdp:<boolean> )`
>   
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 219ab3c3fb..d30e78b4d6 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -34,6 +34,7 @@
>   #include <xen/symbols.h>
>   #include <xen/version.h>
>   #include <xen/virtual_region.h>
> +#include <xen/warning.h>
>   
>   #include <public/sched.h>
>   #include <public/xen.h>
> @@ -77,12 +78,19 @@ static int debug_stack_lines = 40;
>   #define stack_words_per_line 4
>   #endif
>   
> +static const char __initconst warning_pmu_access[] =
> +    "WARNING: PMU ACCESSES ARE NOW ENABLED\n"
> +    "This option is intended to aid monitoring and measuring\n"
> +    "the performance by allowing the guests to access PMU registers.\n"
> +    "It has implications on the security of the system.\n"
> +    "Please *DO NOT* use this in production.\n";
> +
>   integer_param("debug_stack_lines", debug_stack_lines);
>   
>   static enum {
>   	TRAP,
>   	NATIVE,
> -} vwfi;
> +} vwfi, pmu_access;
>   
>   static int __init parse_vwfi(const char *s)
>   {
> @@ -95,6 +103,29 @@ static int __init parse_vwfi(const char *s)
>   }
>   custom_param("vwfi", parse_vwfi);
>   
> +static int __init parse_pmu_access(const char *s)
> +{
> +    if ( !strcmp(s, "native") )
> +        pmu_access = NATIVE;
> +    else
> +        pmu_access = TRAP;
> +
> +    return 0;
> +}
> +custom_param("pmu_access", parse_pmu_access);
> +
> +static int __init update_pmu_access(void)
> +{
> +    if ( pmu_access == NATIVE )
> +    {
> +        WRITE_SYSREG(READ_SYSREG(MDCR_EL2) &~ (HDCR_TPM|HDCR_TPMCR), MDCR_EL2);
> +        warning_add(warning_pmu_access);
> +    }
> +
> +    return 0;
> +}
> +__initcall(update_pmu_access);
> +
>   register_t get_default_hcr_flags(void)
>   {
>       return  (HCR_PTW|HCR_BSU_INNER|HCR_AMO|HCR_IMO|HCR_FMO|HCR_VM|
> 

Cheers,

-- 
Julien Grall

