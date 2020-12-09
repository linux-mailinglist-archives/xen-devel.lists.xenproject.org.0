Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6DB2D4E8F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 00:13:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48836.86397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn8eG-0007uO-0s; Wed, 09 Dec 2020 23:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48836.86397; Wed, 09 Dec 2020 23:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn8eF-0007tz-Tu; Wed, 09 Dec 2020 23:13:27 +0000
Received: by outflank-mailman (input) for mailman id 48836;
 Wed, 09 Dec 2020 23:13:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kn8eE-0007tp-Gz
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 23:13:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn8eD-0004jm-7E; Wed, 09 Dec 2020 23:13:25 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn8eD-0000qp-0Q; Wed, 09 Dec 2020 23:13:25 +0000
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
	bh=ZXUAnsjBfLVJAh63qAGiwwR2vLlKdEjO0/ttJkDZziM=; b=Rqngn4u0ggN/GW7X+5Jg7IoFSz
	rFrUmWVAkPgTO+eNIEI8vHlRXKQilVuX4NSc9J+QRxSADAmMuCTATMDuS9yrPPo15PDnAWWO2zOtI
	itdJKlB9bWL8SEg5Tv/2/Gr7sKrbyLhIBtYLiQIh/CVOxa6rO5iNLm+cHyABG6aEqX3s=;
Subject: Re: [PATCH v3 4/7] xen/arm: Add handler for ID registers on arm64
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <e991b05af11d00627709caf847c5de99f487cab0.1607524536.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8a154f7c-f700-5b6f-5645-a122fec45d19@xen.org>
Date: Wed, 9 Dec 2020 23:13:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <e991b05af11d00627709caf847c5de99f487cab0.1607524536.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 09/12/2020 16:30, Bertrand Marquis wrote:
> Add vsysreg emulation for registers trapped when TID3 bit is activated
> in HSR.
> The emulation is returning the value stored in cpuinfo_guest structure
> for know registers and is handling reserved registers as RAZ.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in V2: Rebase
> Changes in V3:
>    Fix commit message
>    Fix code style for GENERATE_TID3_INFO declaration
>    Add handling of reserved registers as RAZ.
> 
> ---
>   xen/arch/arm/arm64/vsysreg.c | 53 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index 8a85507d9d..ef7a11dbdd 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -69,6 +69,14 @@ TVM_REG(CONTEXTIDR_EL1)
>           break;                                                          \
>       }
>   
> +/* Macro to generate easily case for ID co-processor emulation */
> +#define GENERATE_TID3_INFO(reg, field, offset)                          \
> +    case HSR_SYSREG_##reg:                                              \
> +    {                                                                   \
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr,   \
> +                          1, guest_cpuinfo.field.bits[offset]);         \

The indentation looks wrong here. The "1" should be aligned with "regs".

> +    }
> +
>   void do_sysreg(struct cpu_user_regs *regs,
>                  const union hsr hsr)
>   {
> @@ -259,6 +267,51 @@ void do_sysreg(struct cpu_user_regs *regs,
>            */
>           return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>   
> +    /*
> +     * HCR_EL2.TID3
> +     *
> +     * This is trapping most Identification registers used by a guest
> +     * to identify the processor features
> +     */
> +    GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
> +    GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
> +    GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
> +    GENERATE_TID3_INFO(ID_DFR0_EL1, dbg32, 0)
> +    GENERATE_TID3_INFO(ID_DFR1_EL1, dbg32, 1)
> +    GENERATE_TID3_INFO(ID_AFR0_EL1, aux32, 0)
> +    GENERATE_TID3_INFO(ID_MMFR0_EL1, mm32, 0)
> +    GENERATE_TID3_INFO(ID_MMFR1_EL1, mm32, 1)
> +    GENERATE_TID3_INFO(ID_MMFR2_EL1, mm32, 2)
> +    GENERATE_TID3_INFO(ID_MMFR3_EL1, mm32, 3)
> +    GENERATE_TID3_INFO(ID_MMFR4_EL1, mm32, 4)
> +    GENERATE_TID3_INFO(ID_MMFR5_EL1, mm32, 5)
> +    GENERATE_TID3_INFO(ID_ISAR0_EL1, isa32, 0)
> +    GENERATE_TID3_INFO(ID_ISAR1_EL1, isa32, 1)
> +    GENERATE_TID3_INFO(ID_ISAR2_EL1, isa32, 2)
> +    GENERATE_TID3_INFO(ID_ISAR3_EL1, isa32, 3)
> +    GENERATE_TID3_INFO(ID_ISAR4_EL1, isa32, 4)
> +    GENERATE_TID3_INFO(ID_ISAR5_EL1, isa32, 5)
> +    GENERATE_TID3_INFO(ID_ISAR6_EL1, isa32, 6)
> +    GENERATE_TID3_INFO(MVFR0_EL1, mvfr, 0)
> +    GENERATE_TID3_INFO(MVFR1_EL1, mvfr, 1)
> +    GENERATE_TID3_INFO(MVFR2_EL1, mvfr, 2)
> +    GENERATE_TID3_INFO(ID_AA64PFR0_EL1, pfr64, 0)
> +    GENERATE_TID3_INFO(ID_AA64PFR1_EL1, pfr64, 1)
> +    GENERATE_TID3_INFO(ID_AA64DFR0_EL1, dbg64, 0)
> +    GENERATE_TID3_INFO(ID_AA64DFR1_EL1, dbg64, 1)
> +    GENERATE_TID3_INFO(ID_AA64ISAR0_EL1, isa64, 0)
> +    GENERATE_TID3_INFO(ID_AA64ISAR1_EL1, isa64, 1)
> +    GENERATE_TID3_INFO(ID_AA64MMFR0_EL1, mm64, 0)
> +    GENERATE_TID3_INFO(ID_AA64MMFR1_EL1, mm64, 1)
> +    GENERATE_TID3_INFO(ID_AA64MMFR2_EL1, mm64, 2)
> +    GENERATE_TID3_INFO(ID_AA64AFR0_EL1, aux64, 0)
> +    GENERATE_TID3_INFO(ID_AA64AFR1_EL1, aux64, 1)
> +    GENERATE_TID3_INFO(ID_AA64ZFR0_EL1, zfr64, 0)
> +
> +    HSR_SYSREG_TID3_RESERVED_CASE:
> +        /* Handle all reserved registers as RAZ */
> +        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 1);
> +
>       /*
>        * HCR_EL2.TIDCP
>        *
> 

-- 
Julien Grall

