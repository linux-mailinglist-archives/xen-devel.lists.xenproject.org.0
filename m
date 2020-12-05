Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22772CF7EC
	for <lists+xen-devel@lfdr.de>; Sat,  5 Dec 2020 01:19:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45137.80635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klLIH-0005yM-JW; Sat, 05 Dec 2020 00:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45137.80635; Sat, 05 Dec 2020 00:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klLIH-0005xx-G3; Sat, 05 Dec 2020 00:19:21 +0000
Received: by outflank-mailman (input) for mailman id 45137;
 Sat, 05 Dec 2020 00:19:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2iti=FJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1klLIF-0005xs-KZ
 for xen-devel@lists.xenproject.org; Sat, 05 Dec 2020 00:19:19 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9b0eeeb-b21e-4960-9b8b-198204a6c2ee;
 Sat, 05 Dec 2020 00:19:18 +0000 (UTC)
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
X-Inumbo-ID: d9b0eeeb-b21e-4960-9b8b-198204a6c2ee
Date: Fri, 4 Dec 2020 16:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607127558;
	bh=5IcshQBi5KsJRE/oFzfLJbrrl1vS9oE/5TgIXxD8o6I=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=FpWRNc6+h5MKQg81DNWEpioOArimv0Zo63n0xY7CYbE6/ngNaPZMknIdPDsTe9kOo
	 5m+XZTjFYqBvEN1cEvZPs+9xnr936/N4dau8t4m0fNrCbGIsFq5fNQXOqVrLs3Scmy
	 pfEyyt6wEm3s1LD4Xu/PET674XmeotzQYWiglflG8K/WJNCccI6UYytWY/Yi4NfftW
	 +IULPiJwBBKpCyn2NvhgcU/okAwuucjetx4ifTvBuuBoPBA4xohAUPWRf0INKlT/dM
	 7x6QVjRbe0FKz6ez6Hh12Q7XihfrcCVkNdoYs2T3jM1YNvdFHFUElpp8jMFLME6N5v
	 +zs25j8zuQKxw==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 4/7] xen/arm: Add handler for ID registers on arm64
In-Reply-To: <6db611491b25591829b9408267bd9bd50e266fe2.1606742184.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2012041617510.32240@sstabellini-ThinkPad-T480s>
References: <cover.1606742184.git.bertrand.marquis@arm.com> <6db611491b25591829b9408267bd9bd50e266fe2.1606742184.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Nov 2020, Bertrand Marquis wrote:
> Add vsysreg emulation for registers trapped when TID3 bit is activated
> in HSR.
> The emulation is returning the value stored in cpuinfo_guest structure
> for most values and the hardware value for registers not stored in the
> structure (those are mostly registers existing only as a provision for
> feature use but who have no definition right now).
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in V2: rebase
> ---
>  xen/arch/arm/arm64/vsysreg.c | 49 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index 8a85507d9d..970ef51603 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -69,6 +69,14 @@ TVM_REG(CONTEXTIDR_EL1)
>          break;                                                          \
>      }
>  
> +/* Macro to generate easily case for ID co-processor emulation */
> +#define GENERATE_TID3_INFO(reg,field,offset)                            \

In addition to Volodymyr's comment, this should be for code style:

  GENERATE_TID3_INFO(reg, field, offset)


> +    case HSR_SYSREG_##reg:                                              \
> +    {                                                                   \
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr,   \
> +                          1, guest_cpuinfo.field.bits[offset]);         \
> +    }
> +
>  void do_sysreg(struct cpu_user_regs *regs,
>                 const union hsr hsr)
>  {
> @@ -259,6 +267,47 @@ void do_sysreg(struct cpu_user_regs *regs,
>           */
>          return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
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
>      /*
>       * HCR_EL2.TIDCP
>       *
> -- 
> 2.17.1
> 

