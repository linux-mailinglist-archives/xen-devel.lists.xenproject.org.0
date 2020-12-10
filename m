Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22E22D6A78
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 23:32:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49954.88331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knUU2-0003iz-M4; Thu, 10 Dec 2020 22:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49954.88331; Thu, 10 Dec 2020 22:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knUU2-0003iZ-Im; Thu, 10 Dec 2020 22:32:22 +0000
Received: by outflank-mailman (input) for mailman id 49954;
 Thu, 10 Dec 2020 22:32:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUBE=FO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1knUU1-0003iU-6I
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 22:32:21 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 211d9d38-0ea4-45b4-a6ae-5700815eb985;
 Thu, 10 Dec 2020 22:32:20 +0000 (UTC)
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
X-Inumbo-ID: 211d9d38-0ea4-45b4-a6ae-5700815eb985
Date: Thu, 10 Dec 2020 14:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607639539;
	bh=W/5uHIYxOBHxbM92gBrbq4qvTGuNeb2AWND1ZJSxW5E=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=K05PJPT56mZPn1F5fDCtkIDBVuHYza/B4RVQcXdUVkyn/rgFti7PDisIgePnmlina
	 PTEzv76ZuM4ALq/BZFyOTMfY8v04vnjiEo+2QaYk4LZMl+npnK9CDUnnMvbRt2etWu
	 LGcMX8JlSTqUgyL0sMVlcHi2OyKGOXY8HTJMTeZ1Ng+mcpm7oO/wbshdo1eAomu2gU
	 4XWfkgu4ShUbmT9k0q5/FcjV0rK2P6qlg1jQqUfI+MgmkanVF8GgAv/7iCaKUier5g
	 slwN78F20D5dTSSqiFc0rQg0dOCGFbdaJjwhoxXiHkTKB9s9rqlU8G/4li6lK7JV3Z
	 KRxpL7nlGxoDw==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 5/7] xen/arm: Add handler for cp15 ID registers
In-Reply-To: <C881A361-12A2-42FF-B64E-7AE8A1F436EC@arm.com>
Message-ID: <alpine.DEB.2.21.2012101429590.20986@sstabellini-ThinkPad-T480s>
References: <cover.1607524536.git.bertrand.marquis@arm.com> <5a36325410f485dbdddc0f6088378cacc54c5243.1607524536.git.bertrand.marquis@arm.com> <alpine.DEB.2.21.2012091153400.20986@sstabellini-ThinkPad-T480s> <C881A361-12A2-42FF-B64E-7AE8A1F436EC@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1306876551-1607639539=:20986"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1306876551-1607639539=:20986
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 10 Dec 2020, Bertrand Marquis wrote:
> > On 9 Dec 2020, at 19:54, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Wed, 9 Dec 2020, Bertrand Marquis wrote:
> >> Add support for emulation of cp15 based ID registers (on arm32 or when
> >> running a 32bit guest on arm64).
> >> The handlers are returning the values stored in the guest_cpuinfo
> >> structure for known registers and RAZ for all reserved registers.
> >> In the current status the MVFR registers are no supported.
> >> 
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> Changes in V2: Rebase
> >> Changes in V3:
> >>  Add case definition for reserved registers
> >>  Add handling of reserved registers as RAZ.
> >>  Fix code style in GENERATE_TID3_INFO declaration
> >> 
> >> ---
> >> xen/arch/arm/vcpreg.c        | 39 ++++++++++++++++++++++++++++++++++++
> >> xen/include/asm-arm/cpregs.h | 25 +++++++++++++++++++++++
> >> 2 files changed, 64 insertions(+)
> >> 
> >> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> >> index cdc91cdf5b..d371a1c38c 100644
> >> --- a/xen/arch/arm/vcpreg.c
> >> +++ b/xen/arch/arm/vcpreg.c
> >> @@ -155,6 +155,14 @@ TVM_REG32(CONTEXTIDR, CONTEXTIDR_EL1)
> >>         break;                                                      \
> >>     }
> >> 
> >> +/* Macro to generate easily case for ID co-processor emulation */
> >> +#define GENERATE_TID3_INFO(reg, field, offset)                      \
> >> +    case HSR_CPREG32(reg):                                          \
> >> +    {                                                               \
> >> +        return handle_ro_read_val(regs, regidx, cp32.read, hsr,     \
> >> +                          1, guest_cpuinfo.field.bits[offset]);     \
> >> +    }
> >> +
> >> void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
> >> {
> >>     const struct hsr_cp32 cp32 = hsr.cp32;
> >> @@ -286,6 +294,37 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
> >>          */
> >>         return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
> >> 
> >> +    /*
> >> +     * HCR_EL2.TID3
> >> +     *
> >> +     * This is trapping most Identification registers used by a guest
> >> +     * to identify the processor features
> >> +     */
> >> +    GENERATE_TID3_INFO(ID_PFR0, pfr32, 0)
> >> +    GENERATE_TID3_INFO(ID_PFR1, pfr32, 1)
> >> +    GENERATE_TID3_INFO(ID_PFR2, pfr32, 2)
> >> +    GENERATE_TID3_INFO(ID_DFR0, dbg32, 0)
> >> +    GENERATE_TID3_INFO(ID_DFR1, dbg32, 1)
> >> +    GENERATE_TID3_INFO(ID_AFR0, aux32, 0)
> >> +    GENERATE_TID3_INFO(ID_MMFR0, mm32, 0)
> >> +    GENERATE_TID3_INFO(ID_MMFR1, mm32, 1)
> >> +    GENERATE_TID3_INFO(ID_MMFR2, mm32, 2)
> >> +    GENERATE_TID3_INFO(ID_MMFR3, mm32, 3)
> >> +    GENERATE_TID3_INFO(ID_MMFR4, mm32, 4)
> >> +    GENERATE_TID3_INFO(ID_MMFR5, mm32, 5)
> >> +    GENERATE_TID3_INFO(ID_ISAR0, isa32, 0)
> >> +    GENERATE_TID3_INFO(ID_ISAR1, isa32, 1)
> >> +    GENERATE_TID3_INFO(ID_ISAR2, isa32, 2)
> >> +    GENERATE_TID3_INFO(ID_ISAR3, isa32, 3)
> >> +    GENERATE_TID3_INFO(ID_ISAR4, isa32, 4)
> >> +    GENERATE_TID3_INFO(ID_ISAR5, isa32, 5)
> >> +    GENERATE_TID3_INFO(ID_ISAR6, isa32, 6)
> >> +    /* MVFR registers are in cp10 no cp15 */
> >> +
> >> +    HSR_CPREG32_TID3_RESERVED_CASE:
> >> +        /* Handle all reserved registers as RAZ */
> >> +        return handle_ro_raz(regs, regidx, cp32.read, hsr, 1);
> > 
> > Same question as for the aarch64 case: do we need to do write-ignore
> > for the reserved registers?
> 
> Arm architecture reference manual is listing all those registers as RO including
> the reserved ones (cf table D12-2). This said I have no objection to make them
> write ignore but from my understanding this would not reflect the hardware
> behaviour.

I think so too, but if you are going to run a test on ARMv8 that's even
better. Then we can apply the same policy (ignore or exception) here
too.

 
> >>     /*
> >>      * HCR_EL2.TIDCP
> >>      *
> >> diff --git a/xen/include/asm-arm/cpregs.h b/xen/include/asm-arm/cpregs.h
> >> index 2690ddeb7a..5cb1ad5cbe 100644
> >> --- a/xen/include/asm-arm/cpregs.h
> >> +++ b/xen/include/asm-arm/cpregs.h
> >> @@ -133,6 +133,31 @@
> >> #define VPIDR           p15,4,c0,c0,0   /* Virtualization Processor ID Register */
> >> #define VMPIDR          p15,4,c0,c0,5   /* Virtualization Multiprocessor ID Register */
> >> 
> >> +/*
> >> + * Those cases are catching all Reserved registers trapped by TID3 which
> >> + * currently have no assignment.
> >> + * HCR.TID3 is trapping all registers in the group 3:
> >> + * coproc == p15, opc1 == 0, CRn == c0, CRm == {c2-c7}, opc2 == {0-7}.
> >> + */
> >> +#define HSR_CPREG32_TID3_CASES(REG)     case HSR_CPREG32(p15,0,c0,REG,0): \
> >> +                                        case HSR_CPREG32(p15,0,c0,REG,1): \
> >> +                                        case HSR_CPREG32(p15,0,c0,REG,2): \
> >> +                                        case HSR_CPREG32(p15,0,c0,REG,3): \
> >> +                                        case HSR_CPREG32(p15,0,c0,REG,4): \
> >> +                                        case HSR_CPREG32(p15,0,c0,REG,5): \
> >> +                                        case HSR_CPREG32(p15,0,c0,REG,6): \
> >> +                                        case HSR_CPREG32(p15,0,c0,REG,7)
> >> +
> >> +#define HSR_CPREG32_TID3_RESERVED_CASE  case HSR_CPREG32(p15,0,c0,c3,0): \
> >> +                                        case HSR_CPREG32(p15,0,c0,c3,1): \
> >> +                                        case HSR_CPREG32(p15,0,c0,c3,2): \
> >> +                                        case HSR_CPREG32(p15,0,c0,c3,3): \
> >> +                                        case HSR_CPREG32(p15,0,c0,c3,7): \
> >> +                                        HSR_CPREG32_TID3_CASES(c4): \
> >> +                                        HSR_CPREG32_TID3_CASES(c5): \
> >> +                                        HSR_CPREG32_TID3_CASES(c6): \
> >> +                                        HSR_CPREG32_TID3_CASES(c7)
> > 
> > The following are missing, is it a problem?
> > 
> > p15,0,c0,c0,2
> > p15,0,c0,c0,3
> > p15,0,c0,c0,4
> > p15,0,c0,c0,6
> > p15,0,c0,c0,7
> 
> HCR.TID3 documentation is saying that access to "coproc == p15, opc1 == 0, 
> CRn == c0, CRm == {c2-c7}, opc2 == {0-7}” are trapped so CRm = c0 is not handled here.

OK, thank you for checking
--8323329-1306876551-1607639539=:20986--

