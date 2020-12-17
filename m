Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC6D2DDBF1
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 00:38:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56239.98342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq2qR-0004kP-Gf; Thu, 17 Dec 2020 23:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56239.98342; Thu, 17 Dec 2020 23:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq2qR-0004k0-DE; Thu, 17 Dec 2020 23:38:03 +0000
Received: by outflank-mailman (input) for mailman id 56239;
 Thu, 17 Dec 2020 23:38:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHja=FV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kq2qQ-0004ju-Dx
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 23:38:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6abec9ff-643f-445c-bd8f-27faea984d89;
 Thu, 17 Dec 2020 23:38:01 +0000 (UTC)
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
X-Inumbo-ID: 6abec9ff-643f-445c-bd8f-27faea984d89
Date: Thu, 17 Dec 2020 15:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608248281;
	bh=9Wt/uaSVeHyiRKnHpHcxuvPNK6VeH4101Z3VK/JyMjI=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=Sn8bB/SjfXjHrj4rZDoY2XUciRiA9IPCBCEL4v7c8qWmohF1zGeTMAH1KyUH870L0
	 PjEMi6QA2zEG328hXoLQwO9IX+d2RoJsDnh2Ohx9G1kFRR1Ezsat268kA2E527Ftdi
	 UHGK/6xkcEzUBljp5EiUZUkzeIFZPRLwL35tsaDhC/jkHGRTnd5EBTO8mGCpNq9SD5
	 clnSt1S/m1hdfXNDp8T0LdoxfDfMTbvk5my8O6w5rN+IoYTA5vgcN6zO4x95pitlom
	 7nGo5HI7dyHJC4g7zT5zZxqREaeF9QWZNYNdDW9Lu/h8xgwxcJ88rZgV4oLnb9Fok3
	 K/lnr6iT3w9Qg==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 6/8] xen/arm: Add handler for cp15 ID registers
In-Reply-To: <c1c68e89683913dbf71a8f370dc6fd896a9e8cce.1608214355.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2012171533410.4040@sstabellini-ThinkPad-T480s>
References: <cover.1608214355.git.bertrand.marquis@arm.com> <c1c68e89683913dbf71a8f370dc6fd896a9e8cce.1608214355.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Dec 2020, Bertrand Marquis wrote:
> Add support for emulation of cp15 based ID registers (on arm32 or when
> running a 32bit guest on arm64).
> The handlers are returning the values stored in the guest_cpuinfo
> structure for known registers and RAZ for all reserved registers.
> In the current status the MVFR registers are no supported.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in V2: Rebase
> Changes in V3:
>   Add case definition for reserved registers
>   Add handling of reserved registers as RAZ.
>   Fix code style in GENERATE_TID3_INFO declaration
> Changes in V4:
>   Fix comment for missing t (no to not)
>   Put cases for reserved registers directly in the code instead of using
>   a define in the cpregs.h header.
> 
> ---
>  xen/arch/arm/vcpreg.c | 65 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index cdc91cdf5b..1fe07fe02a 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -155,6 +155,24 @@ TVM_REG32(CONTEXTIDR, CONTEXTIDR_EL1)
>          break;                                                      \
>      }
>  
> +/* Macro to generate easily case for ID co-processor emulation */
> +#define GENERATE_TID3_INFO(reg, field, offset)                      \
> +    case HSR_CPREG32(reg):                                          \
> +    {                                                               \
> +        return handle_ro_read_val(regs, regidx, cp32.read, hsr,     \
> +                          1, guest_cpuinfo.field.bits[offset]);     \

This line is misaligned, but it can be adjusted on commit

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



> +    }
> +
> +/* helper to define cases for all registers for one CRm value */
> +#define HSR_CPREG32_TID3_CASES(REG)     case HSR_CPREG32(p15,0,c0,REG,0): \
> +                                        case HSR_CPREG32(p15,0,c0,REG,1): \
> +                                        case HSR_CPREG32(p15,0,c0,REG,2): \
> +                                        case HSR_CPREG32(p15,0,c0,REG,3): \
> +                                        case HSR_CPREG32(p15,0,c0,REG,4): \
> +                                        case HSR_CPREG32(p15,0,c0,REG,5): \
> +                                        case HSR_CPREG32(p15,0,c0,REG,6): \
> +                                        case HSR_CPREG32(p15,0,c0,REG,7)
> +
>  void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>  {
>      const struct hsr_cp32 cp32 = hsr.cp32;
> @@ -286,6 +304,53 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>           */
>          return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
>  
> +    /*
> +     * HCR_EL2.TID3
> +     *
> +     * This is trapping most Identification registers used by a guest
> +     * to identify the processor features
> +     */
> +    GENERATE_TID3_INFO(ID_PFR0, pfr32, 0)
> +    GENERATE_TID3_INFO(ID_PFR1, pfr32, 1)
> +    GENERATE_TID3_INFO(ID_PFR2, pfr32, 2)
> +    GENERATE_TID3_INFO(ID_DFR0, dbg32, 0)
> +    GENERATE_TID3_INFO(ID_DFR1, dbg32, 1)
> +    GENERATE_TID3_INFO(ID_AFR0, aux32, 0)
> +    GENERATE_TID3_INFO(ID_MMFR0, mm32, 0)
> +    GENERATE_TID3_INFO(ID_MMFR1, mm32, 1)
> +    GENERATE_TID3_INFO(ID_MMFR2, mm32, 2)
> +    GENERATE_TID3_INFO(ID_MMFR3, mm32, 3)
> +    GENERATE_TID3_INFO(ID_MMFR4, mm32, 4)
> +    GENERATE_TID3_INFO(ID_MMFR5, mm32, 5)
> +    GENERATE_TID3_INFO(ID_ISAR0, isa32, 0)
> +    GENERATE_TID3_INFO(ID_ISAR1, isa32, 1)
> +    GENERATE_TID3_INFO(ID_ISAR2, isa32, 2)
> +    GENERATE_TID3_INFO(ID_ISAR3, isa32, 3)
> +    GENERATE_TID3_INFO(ID_ISAR4, isa32, 4)
> +    GENERATE_TID3_INFO(ID_ISAR5, isa32, 5)
> +    GENERATE_TID3_INFO(ID_ISAR6, isa32, 6)
> +    /* MVFR registers are in cp10 not cp15 */
> +
> +    /*
> +     * Those cases are catching all Reserved registers trapped by TID3 which
> +     * currently have no assignment.
> +     * HCR.TID3 is trapping all registers in the group 3:
> +     * coproc == p15, opc1 == 0, CRn == c0, CRm == {c2-c7}, opc2 == {0-7}.
> +     * Those registers are defined as being RO in the Arm Architecture
> +     * Reference manual Armv8 (Chapter D12.3.2 of issue F.c) so handle them
> +     * as Read-only read as zero.
> +     */
> +    case HSR_CPREG32(p15,0,c0,c3,0):
> +    case HSR_CPREG32(p15,0,c0,c3,1):
> +    case HSR_CPREG32(p15,0,c0,c3,2):
> +    case HSR_CPREG32(p15,0,c0,c3,3):
> +    case HSR_CPREG32(p15,0,c0,c3,7):
> +    HSR_CPREG32_TID3_CASES(c4):
> +    HSR_CPREG32_TID3_CASES(c5):
> +    HSR_CPREG32_TID3_CASES(c6):
> +    HSR_CPREG32_TID3_CASES(c7):
> +        return handle_ro_raz(regs, regidx, cp32.read, hsr, 1);
> +
>      /*
>       * HCR_EL2.TIDCP
>       *
> -- 
> 2.17.1
> 

