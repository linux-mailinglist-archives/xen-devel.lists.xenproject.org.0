Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E694C2D4B15
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 20:55:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48689.86121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn5Xw-0003RO-J2; Wed, 09 Dec 2020 19:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48689.86121; Wed, 09 Dec 2020 19:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn5Xw-0003Qz-FJ; Wed, 09 Dec 2020 19:54:44 +0000
Received: by outflank-mailman (input) for mailman id 48689;
 Wed, 09 Dec 2020 19:54:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kn5Xv-0003Qu-4q
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 19:54:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0391753-0872-4ce6-b992-5df83792284d;
 Wed, 09 Dec 2020 19:54:42 +0000 (UTC)
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
X-Inumbo-ID: c0391753-0872-4ce6-b992-5df83792284d
Date: Wed, 9 Dec 2020 11:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607543681;
	bh=bUu9X1geTL8M/GRL58coGcKFEnZEH5lzro/be4YmT74=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=pLg3Ih70pXOFULvXM8uvkooxLIRpGfsGn7QGkW+xZMzyZWBWeXUa66vc7QrgSePF4
	 B7GMNcsTgHal8F/SA+mnr0b7/6oGMpHya9nmY+0Tb23fG6wBpNPuu8lNSuxu5NTiz5
	 +RyuexWbSD68EoRrFQNMboAx+a8XdHr5E6NGWbjbwkA2MpgKCMmI5OWnSQ3a5ifnxs
	 VFvelzr0rhX+cWeqqx9ueKZUv6QLAfnhaXKUVhbL4/l4CyRdwHh/pqH5d+Sx+f77D6
	 6gmB+hT7cttJ9bcgsYVnjJzS7JHWSG5o7aUfwp+elxAVFcMNZ9Sr9YVG3c1NxuzRfH
	 7sPU7zG48Qung==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 5/7] xen/arm: Add handler for cp15 ID registers
In-Reply-To: <5a36325410f485dbdddc0f6088378cacc54c5243.1607524536.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2012091153400.20986@sstabellini-ThinkPad-T480s>
References: <cover.1607524536.git.bertrand.marquis@arm.com> <5a36325410f485dbdddc0f6088378cacc54c5243.1607524536.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Dec 2020, Bertrand Marquis wrote:
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
> 
> ---
>  xen/arch/arm/vcpreg.c        | 39 ++++++++++++++++++++++++++++++++++++
>  xen/include/asm-arm/cpregs.h | 25 +++++++++++++++++++++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index cdc91cdf5b..d371a1c38c 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -155,6 +155,14 @@ TVM_REG32(CONTEXTIDR, CONTEXTIDR_EL1)
>          break;                                                      \
>      }
>  
> +/* Macro to generate easily case for ID co-processor emulation */
> +#define GENERATE_TID3_INFO(reg, field, offset)                      \
> +    case HSR_CPREG32(reg):                                          \
> +    {                                                               \
> +        return handle_ro_read_val(regs, regidx, cp32.read, hsr,     \
> +                          1, guest_cpuinfo.field.bits[offset]);     \
> +    }
> +
>  void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>  {
>      const struct hsr_cp32 cp32 = hsr.cp32;
> @@ -286,6 +294,37 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
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
> +    /* MVFR registers are in cp10 no cp15 */
> +
> +    HSR_CPREG32_TID3_RESERVED_CASE:
> +        /* Handle all reserved registers as RAZ */
> +        return handle_ro_raz(regs, regidx, cp32.read, hsr, 1);

Same question as for the aarch64 case: do we need to do write-ignore
for the reserved registers?


>      /*
>       * HCR_EL2.TIDCP
>       *
> diff --git a/xen/include/asm-arm/cpregs.h b/xen/include/asm-arm/cpregs.h
> index 2690ddeb7a..5cb1ad5cbe 100644
> --- a/xen/include/asm-arm/cpregs.h
> +++ b/xen/include/asm-arm/cpregs.h
> @@ -133,6 +133,31 @@
>  #define VPIDR           p15,4,c0,c0,0   /* Virtualization Processor ID Register */
>  #define VMPIDR          p15,4,c0,c0,5   /* Virtualization Multiprocessor ID Register */
>  
> +/*
> + * Those cases are catching all Reserved registers trapped by TID3 which
> + * currently have no assignment.
> + * HCR.TID3 is trapping all registers in the group 3:
> + * coproc == p15, opc1 == 0, CRn == c0, CRm == {c2-c7}, opc2 == {0-7}.
> + */
> +#define HSR_CPREG32_TID3_CASES(REG)     case HSR_CPREG32(p15,0,c0,REG,0): \
> +                                        case HSR_CPREG32(p15,0,c0,REG,1): \
> +                                        case HSR_CPREG32(p15,0,c0,REG,2): \
> +                                        case HSR_CPREG32(p15,0,c0,REG,3): \
> +                                        case HSR_CPREG32(p15,0,c0,REG,4): \
> +                                        case HSR_CPREG32(p15,0,c0,REG,5): \
> +                                        case HSR_CPREG32(p15,0,c0,REG,6): \
> +                                        case HSR_CPREG32(p15,0,c0,REG,7)
> +
> +#define HSR_CPREG32_TID3_RESERVED_CASE  case HSR_CPREG32(p15,0,c0,c3,0): \
> +                                        case HSR_CPREG32(p15,0,c0,c3,1): \
> +                                        case HSR_CPREG32(p15,0,c0,c3,2): \
> +                                        case HSR_CPREG32(p15,0,c0,c3,3): \
> +                                        case HSR_CPREG32(p15,0,c0,c3,7): \
> +                                        HSR_CPREG32_TID3_CASES(c4): \
> +                                        HSR_CPREG32_TID3_CASES(c5): \
> +                                        HSR_CPREG32_TID3_CASES(c6): \
> +                                        HSR_CPREG32_TID3_CASES(c7)

The following are missing, is it a problem?

p15,0,c0,c0,2
p15,0,c0,c0,3
p15,0,c0,c0,4
p15,0,c0,c0,6
p15,0,c0,c0,7

