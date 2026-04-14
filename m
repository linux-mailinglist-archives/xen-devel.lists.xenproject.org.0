Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tFgUBTuh3Wl8hAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 04:06:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 925643F4E4A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 04:06:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281393.1564306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCTAF-000705-11; Tue, 14 Apr 2026 02:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281393.1564306; Tue, 14 Apr 2026 02:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCTAE-0006x2-UV; Tue, 14 Apr 2026 02:06:06 +0000
Received: by outflank-mailman (input) for mailman id 1281393;
 Tue, 14 Apr 2026 02:06:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wCTAD-0006ww-5r
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 02:06:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCTAC-001RYj-1V;
 Tue, 14 Apr 2026 02:06:04 +0000
Received: from [116.84.110.196] (helo=[10.158.125.74])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCTAC-001VdL-0b;
 Tue, 14 Apr 2026 02:06:04 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=XaWnSOD31kbNTVXa8LLDZ78YYn+M2bU6cCp9h8fe9Qg=; b=o275si6sn9VPmUiSTnyq3eITuX
	P9G8zdKf/2EI8LPde9jZBeoyEkqQIzXpHW0FzDRY1dC5Bj9+pkTrG9GYDrPCU6/XxeBZmGzx8S+Yr
	hSv9qy4F9+9RaI4la4e4MA/yUPjosKOxFwkc7d8kBFzw9JMBJJl3LYkVDYxLnG1yixyI=;
Message-ID: <83786d8b-d57a-4c79-8e8b-7115d4276568@xen.org>
Date: Tue, 14 Apr 2026 11:06:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: gic-v3: Introduce CONFIG_GICV3_NR_LRS
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260318140900.3795710-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260318140900.3795710-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,xen.org:dkim,xen.org:mid];
	FORGED_RECIPIENTS(0.00)[m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 925643F4E4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ayan,

On 18/03/2026 23:09, Ayan Kumar Halder wrote:
> One key requirement of Xen functional safety is to reduce the number
> of lines of code to be safety certified. Besides, a safety certified
> Xen requires a static hardware configuration to be defined. This static
> hardware configuration is described as per the test hardware/emulator
> hardware configuration against which Xen is verified.
> 
> Introduce GICV3_NR_LRS with the two aims in mind:

Out of interest, why is this limited to GICv3?

> 1. User should set the number of GICV3 list registers as per the test
> hardware so that the unwanted code can be removed using GCC's dead
> code elimination or preprocessor's config.

We discussed this offline, I am not fully convinced you can rely on dead 
code elimination to always remove the BUG() in gicv3_ich_read_lr(). If 
you want to rely on dead code eliminitation, then you will want to call 
a function which have a prototype defined but not implemented (similar 
to what we do for bitops with __bad_atomic_read()) which would fail a 
link time if the compiler didn't remove the code.

> 2. By doing #1, one can ensure that there is no untested code due to
> unsupported hardware platform and thus there is no safety impact due
> to untested code.
> 
> However if the user does not set GICV3_NR_LRS, then it is set to 0.
> Thus Xen will fallback to the default scenario (i.e. read the hardware
> register to determine the number of LRS).
> 
> 1. In gicv3_save_lrs()/gicv3_restore_lrs(), use the number of list
> registers from GICV3_NR_LRS (if defined) instead of gicv3_info.nr_lrs.
> This ensures that if the hardware does not support more than 4 LRs
> (for example), the code accessing LR 4-15 is never reached. The
> compiler can eliminate the unsupported cases as the switch case uses a
> constant conditional.
> 
> 2. RAZ/WI for the unsupported LRs.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changelog:
> 
> v1 - 1. s/lrs/LRS
> 2. Implement RAZ/WI instead of panic
> 
> Few comments which were not addressed
> 1. Do "gicv3_info.nr_lrs to LRS" in gicv3_hyp_init() and keep the code
> unchanged in gicv3_save_lrs()/gicv3_restore_lrs() -- This prevents the
> compiler from doing dead code elimination as the switch condition cannot
> be evaluated at compile time.
> I am not sure how to get around this issue.
> 
>   xen/arch/arm/Kconfig  |  9 +++++++++
>   xen/arch/arm/gic-v3.c | 14 ++++++++++++--
>   2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 2f2b501fda..6540013f97 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -276,6 +276,15 @@ config PCI_PASSTHROUGH
>   
>   endmenu
>   
> +config GICV3_NR_LRS
> +	int "Number of GICv3 Link Registers supported" if EXPERT

Supported by who? The hardware? Xen? Asking, because I could forsee an 
integrator wanted to limit the number of LRs to something smaller than 
what the HW supports (in a lot of cases, 2 LRs is sufficient).

> +	depends on GICV3
> +	range 0 16
> +	default 0
> +	help
> +	  Controls the number of Link registers to be accessed.
> +	  Keep it set to 0 to use a value obtained from a hardware register.

I still strongly think that if GICV3_NR_LRS is set, then it needs to be 
checked against the value read by the hardware

> +
>   menu "ARM errata workaround via the alternative framework"
>   	depends on HAS_ALTERNATIVE
>   
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index bc07f97c16..eaae95eb4d 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -51,6 +51,8 @@ static DEFINE_PER_CPU(void __iomem*, rbase);
>   #define GICD                   (gicv3.map_dbase)
>   #define GICD_RDIST_BASE        (this_cpu(rbase))
>   #define GICD_RDIST_SGI_BASE    (GICD_RDIST_BASE + SZ_64K)
> +#define LRS                    (CONFIG_GICV3_NR_LRS ?: \
> +                                gicv3_info.nr_lrs)

IMHO, LRS is a little bit vague. What about MAX_LRS? Or maybe NR_LRS?

>   
>   /*
>    * Saves all 16(Max) LR registers. Though number of LRs implemented
> @@ -59,7 +61,7 @@ static DEFINE_PER_CPU(void __iomem*, rbase);
>   static inline void gicv3_save_lrs(struct vcpu *v)
>   {
>       /* Fall through for all the cases */
> -    switch ( gicv3_info.nr_lrs )
> +    switch ( LRS )
>       {
>       case 16:
>           v->arch.gic.v3.lr[15] = READ_SYSREG_LR(15);
> @@ -121,7 +123,7 @@ static inline void gicv3_save_lrs(struct vcpu *v)
>   static inline void gicv3_restore_lrs(const struct vcpu *v)
>   {
>       /* Fall through for all the cases */
> -    switch ( gicv3_info.nr_lrs )
> +    switch ( LRS )
>       {
>       case 16:
>           WRITE_SYSREG_LR(v->arch.gic.v3.lr[15], 15);
> @@ -178,6 +180,10 @@ static inline void gicv3_restore_lrs(const struct vcpu *v)
>   
>   static uint64_t gicv3_ich_read_lr(int lr)
>   {
> +    /* RAZ for unsupported LR */
> +    if ( lr >= LRS )
> +        return 0;
> +
>       switch ( lr )
>       {
>       case 0: return READ_SYSREG_LR(0);
> @@ -203,6 +209,10 @@ static uint64_t gicv3_ich_read_lr(int lr)
>   
>   static void gicv3_ich_write_lr(int lr, uint64_t val)
>   {
> +    /* WI for unsupported LR */

AFAIU, this path is really not meant to happen. So I don't think we want 
to silently ignore the write as it would mean an interrupt is missing. I 
think in debug build, we probably want to use ASSERT_UNREACHABLE(). If 
we want something for production as well, then we could instead use WARN().

Cheers,

-- 
Julien Grall


