Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB81672BF45
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 12:38:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546973.854114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8ewB-0001hk-CY; Mon, 12 Jun 2023 10:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546973.854114; Mon, 12 Jun 2023 10:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8ewB-0001f1-8Z; Mon, 12 Jun 2023 10:38:15 +0000
Received: by outflank-mailman (input) for mailman id 546973;
 Mon, 12 Jun 2023 10:38:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q8ew9-0001el-UZ
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 10:38:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q8ew9-0003zR-NT; Mon, 12 Jun 2023 10:38:13 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q8ew9-0006fG-ID; Mon, 12 Jun 2023 10:38:13 +0000
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
	bh=Wobk4ZwG0zhfHKyHbAyeE/huMpWbbMl1Bps90AxVHFI=; b=iQF3icNm2t1Hd/2kRGRmgcwZlX
	rd/eDpzOSZDVAZi7K5oOKsQLsujxJV2ru00bA4mj8dHkwH4sevHUEpp/IYfkdmTy1sThtgJ/azqhA
	gYsdeLQa2tzxDyuQPzmFwWL5znIMwvEsWVlrWqwJAlkeV5koAw371c8ysKLqKhyRjSGY=;
Message-ID: <24566db9-e6da-0b2b-e7a3-5edef81d159c@xen.org>
Date: Mon, 12 Jun 2023 11:38:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH] xen/arm: rename guest_cpuinfo in domain_cpuinfo
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <7e18eceb2fb2f4cac991773a8697e9bf50b89aaf.1686316358.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7e18eceb2fb2f4cac991773a8697e9bf50b89aaf.1686316358.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 09/06/2023 14:13, Bertrand Marquis wrote:
> Rename the guest_cpuinfo structure to domain_cpuinfo as it is not only
> used for guests but also for dom0 so domain is a more suitable name.
> 
> While there also rename the create_guest_cpuinfo function to
> create_domain_cpuinfo to be coherent.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>   xen/arch/arm/arm64/vsysreg.c          |  6 ++--
>   xen/arch/arm/cpufeature.c             | 40 +++++++++++++--------------
>   xen/arch/arm/include/asm/cpufeature.h |  2 +-
>   xen/arch/arm/vcpreg.c                 |  2 +-
>   4 files changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index fe31f7b3827f..b5d54c569b33 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -76,7 +76,7 @@ TVM_REG(CONTEXTIDR_EL1)
>       case HSR_SYSREG_##reg:                                              \
>       {                                                                   \
>           return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr,   \
> -                                  1, guest_cpuinfo.field.bits[offset]); \
> +                                  1, domain_cpuinfo.field.bits[offset]); \
>       }
>   
>   void do_sysreg(struct cpu_user_regs *regs,
> @@ -300,7 +300,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>   
>       case HSR_SYSREG_ID_AA64PFR0_EL1:
>       {
> -        register_t guest_reg_value = guest_cpuinfo.pfr64.bits[0];
> +        register_t guest_reg_value = domain_cpuinfo.pfr64.bits[0];
>   
>           if ( is_sve_domain(v->domain) )
>           {
> @@ -336,7 +336,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>            * When the guest has the SVE feature enabled, the whole id_aa64zfr0_el1
>            * needs to be exposed.
>            */
> -        register_t guest_reg_value = guest_cpuinfo.zfr64.bits[0];
> +        register_t guest_reg_value = domain_cpuinfo.zfr64.bits[0];
>   
>           if ( is_sve_domain(v->domain) )
>               guest_reg_value = system_cpuinfo.zfr64.bits[0];
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index b53e1a977601..5f4644865505 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -14,7 +14,7 @@
>   
>   DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
>   
> -struct cpuinfo_arm __read_mostly guest_cpuinfo;
> +struct cpuinfo_arm __read_mostly domain_cpuinfo;
>   
>   #ifdef CONFIG_ARM_64
>   static bool has_sb_instruction(const struct arm_cpu_capabilities *entry)
> @@ -191,45 +191,45 @@ void identify_cpu(struct cpuinfo_arm *c)
>   /*
>    * This function is creating a cpuinfo structure with values modified to mask
>    * all cpu features that should not be published to guest.

I noticed you modified "guests" to "domains" below but not "guest" here. 
Is this intended?

> - * The created structure is then used to provide ID registers values to guests.
> + * The created structure is then used to provide ID registers values to domains.
>    */
> -static int __init create_guest_cpuinfo(void)
> +static int __init create_domain_cpuinfo(void)
>   {
>       /* Use the sanitized cpuinfo as initial guest cpuinfo */

Same question here.

> -    guest_cpuinfo = system_cpuinfo;
> +    domain_cpuinfo = system_cpuinfo;

Cheers,

-- 
Julien Grall

