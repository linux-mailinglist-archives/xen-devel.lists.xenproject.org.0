Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 694D5666193
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 18:17:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475651.737406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFeib-0003hq-S9; Wed, 11 Jan 2023 17:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475651.737406; Wed, 11 Jan 2023 17:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFeib-0003f6-Oj; Wed, 11 Jan 2023 17:16:53 +0000
Received: by outflank-mailman (input) for mailman id 475651;
 Wed, 11 Jan 2023 17:16:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pFeiZ-0003f0-Sl
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 17:16:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFeiZ-0005tZ-IU; Wed, 11 Jan 2023 17:16:51 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.5.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFeiZ-0007er-Ce; Wed, 11 Jan 2023 17:16:51 +0000
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
	bh=2bzw1WLg844SYQ5XotTV+5/B3cmddNxNxoBmTA6gcb8=; b=1nF2crPSUbKxCLzolKIeIHrBeT
	cQn+vtmsWm2WbeErVdql+YJ4BsQqgbJCO3+bajdXDDUZIAZnxAMJGf4XVkiSzVuJREn8AkyPDXCWJ
	zVaA3M96h7m5xeQATefgrqOaU6cLpdGMlrqObZxFz+syQ/z6OkvFdnQ7rTBbuMQeXT3c=;
Message-ID: <e37e5564-e7b9-c9d2-1360-171c014649c7@xen.org>
Date: Wed, 11 Jan 2023 17:16:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 1/8] xen/arm: enable SVE extension for Xen
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230111143826.3224-1-luca.fancellu@arm.com>
 <20230111143826.3224-2-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230111143826.3224-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

As this is an RFC, I will be mostly making general comments.

On 11/01/2023 14:38, Luca Fancellu wrote:
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 99577adb6c69..8ea3843ea8e8 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -181,6 +181,8 @@ static void ctxt_switch_to(struct vcpu *n)
>       /* VGIC */
>       gic_restore_state(n);
>   
> +    WRITE_SYSREG(n->arch.cptr_el2, CPTR_EL2);

Shouldn't this need an isb() afterwards do ensure that any previously 
trapped will be accessible?

[...]

> @@ -122,6 +137,7 @@ __initcall(update_serrors_cpu_caps);
>   
>   void init_traps(void)
>   {
> +    register_t cptr_bits = get_default_cptr_flags();
>       /*
>        * Setup Hyp vector base. Note they might get updated with the
>        * branch predictor hardening.
> @@ -135,17 +151,15 @@ void init_traps(void)
>       /* Trap CP15 c15 used for implementation defined registers */
>       WRITE_SYSREG(HSTR_T(15), HSTR_EL2);
>   
> -    /* Trap all coprocessor registers (0-13) except cp10 and
> -     * cp11 for VFP.
> -     *
> -     * /!\ All coprocessors except cp10 and cp11 cannot be used in Xen.
> -     *
> -     * On ARM64 the TCPx bits which we set here (0..9,12,13) are all
> -     * RES1, i.e. they would trap whether we did this write or not.
> +#ifdef CONFIG_ARM64_SVE
> +    /*
> +     * Don't trap SVE now, Xen might need to access ZCR reg in cpufeature code,
> +     * trapping again or not will be handled on vcpu creation/scheduling later
>        */

Instead of enable by default at boot, can we try to enable/disable only 
when this is strictly needed?

> -    WRITE_SYSREG((HCPTR_CP_MASK & ~(HCPTR_CP(10) | HCPTR_CP(11))) |
> -                 HCPTR_TTA | HCPTR_TAM,
> -                 CPTR_EL2);
> +    cptr_bits &= ~HCPTR_CP(8);
> +#endif
> +
> +    WRITE_SYSREG(cptr_bits, CPTR_EL2);
>   
>       /*
>        * Configure HCR_EL2 with the bare minimum to run Xen until a guest

Cheers,
-- 
Julien Grall

