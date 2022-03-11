Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E644D6876
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 19:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289213.490699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSk5z-0005qb-9M; Fri, 11 Mar 2022 18:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289213.490699; Fri, 11 Mar 2022 18:34:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSk5z-0005nY-6H; Fri, 11 Mar 2022 18:34:35 +0000
Received: by outflank-mailman (input) for mailman id 289213;
 Fri, 11 Mar 2022 18:34:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nSk5x-0005nQ-Bf
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 18:34:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSk5w-0006v0-MJ; Fri, 11 Mar 2022 18:34:32 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[10.95.172.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSk5w-0007DW-GB; Fri, 11 Mar 2022 18:34:32 +0000
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
	bh=giorpWSsQyc+2JucN0SXJSmKISXlhsmyLyBX+PBatEM=; b=Xr5ug7UrOH7QVoq1wI3uJsJwaN
	L8ZOjM1Bmw7v6WQFbRBflGK4pAv64XIWPtM/GTSWkRw5rJ4WtvgrZDdem7C/di9KJ+0ljyisZlODg
	hSSpUFHlb8BGN77B8lCI8jSetxKbnWDRXnmfHVA25k3AOcVaoYyVTzb+V7c0JEp+HPAA=;
Message-ID: <e2e27a6d-3339-d312-455c-0e61fe410462@xen.org>
Date: Fri, 11 Mar 2022 18:34:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [XEN v10 4/4] xen/arm64: io: Handle data abort due to cache
 maintenance instructions
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org,
 roger.pau@citrix.com, Ayan Kumar Halder <ayankuma@xilinx.com>
References: <20220310174501.62040-1-ayankuma@xilinx.com>
 <20220310174501.62040-5-ayankuma@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220310174501.62040-5-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/03/2022 17:45, Ayan Kumar Halder wrote:
> When the data abort is caused due to cache maintenance for an address,
> there are three scenarios:-
> 
> 1. Address belonging to a non emulated region - For this, Xen should
> set the corresponding bit in the translation table entry to valid and
> return to the guest to retry the instruction. This can happen sometimes
> as Xen need to set the translation table entry to invalid. (for eg
> 'Break-Before-Make' sequence). Xen returns to the guest to retry the
> instruction.
> 
> 2. Address belongs to an emulated region - Xen should ignore the
> instruction (ie increment the PC) and return to the guest.
> 
> 3. Address is invalid - Xen should forward the data abort to the guest.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
> ---
> 
> Changelog:-
> 
> v1...v8 - NA
> 
> v9 - Extracted this change from "[XEN v7 2/2] xen/arm64: io: Support
> instructions (for which ISS is not ..." into a separate patch of its
> own. The reason being this addresses an existing bug in the codebase.
> 
> v10 - 1. To check if the address belongs to an emulated region, one
> needs to check if it has a mmio handler or an ioreq server. In this
> case, Xen should increment the PC
> 2. If the address is invalid (niether emulated MMIO nor the translation
> could be resolved via p2m or mapping the MMIO region), then Xen should
> forward the abort to the guest.
> 
>   xen/arch/arm/include/asm/mmio.h |  1 +
>   xen/arch/arm/io.c               | 20 ++++++++++++++++++++
>   xen/arch/arm/ioreq.c            | 15 ++++++++++++++-
>   3 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
> index ca259a79c2..79e64d9af8 100644
> --- a/xen/arch/arm/include/asm/mmio.h
> +++ b/xen/arch/arm/include/asm/mmio.h
> @@ -35,6 +35,7 @@ enum instr_decode_state
>        * instruction.
>        */
>       INSTR_LDR_STR_POSTINDEXING,
> +    INSTR_CACHE,                    /* Cache Maintenance instr */
>   };
>   
>   typedef struct
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index e6c77e16bf..c5b2980a5f 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -139,6 +139,17 @@ void try_decode_instruction(const struct cpu_user_regs *regs,
>           return;
>       }
>   
> +    /*
> +     * When the data abort is caused due to cache maintenance, Xen should check
> +     * if the address belongs to an emulated MMIO region or not. The behavior
> +     * will differ accordingly.
> +     */
> +    if ( info->dabt.cache )
> +    {
> +        info->dabt_instr.state = INSTR_CACHE;
> +        return;
> +    }
> +
>       /*
>        * Armv8 processor does not provide a valid syndrome for decoding some
>        * instructions. So in order to process these instructions, Xen must
> @@ -177,6 +188,15 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>           return rc;
>       }
>   
> +    /*
> +     * When the data abort is caused due to cache maintenance and the address
> +     * belongs to an emulated region, Xen should ignore this instruction.
> +     */
> +    if ( info->dabt_instr.state == INSTR_CACHE )
> +    {
> +        return IO_HANDLED;
> +    }
> +
>       /*
>        * At this point, we know that the instruction is either valid or has been
>        * decoded successfully. Thus, Xen should be allowed to execute the
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index cc9bf23213..0dd2d452f7 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -29,10 +29,14 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
>       const struct hsr_dabt dabt = hsr.dabt;
>       /* Code is similar to handle_read */
>       register_t r = v->io.req.data;
> +    const struct instr_details instr = v->io.info.dabt_instr;
>   
>       /* We are done with the IO */
>       v->io.req.state = STATE_IOREQ_NONE;
>   
> +    if ( instr.state == INSTR_CACHE )
> +        return IO_HANDLED;

The request will not be forwarded to the IOREQ, so why do we need check 
instr.state here?

> +
>       if ( dabt.write )
>           return IO_HANDLED;
>   
> @@ -47,7 +51,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>                                struct vcpu *v, mmio_info_t *info)
>   {
>       struct vcpu_io *vio = &v->io;
> -    struct instr_details instr = info->dabt_instr;
> +    const struct instr_details instr = info->dabt_instr; >       struct hsr_dabt dabt = info->dabt;
>       ioreq_t p = {
>           .type = IOREQ_TYPE_COPY,
> @@ -78,6 +82,15 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>       if ( !s )
>           return IO_UNHANDLED;
>   
> +    /*
> +     * When the data abort is caused due to cache maintenance and the address
> +     * belongs to an emulated region, Xen should ignore this instruction.
> +     */
> +    if ( instr.state == INSTR_CACHE )
> +    {
> +        return IO_HANDLED;
> +    }
> +
>       ASSERT(dabt.valid);
>   
>       vio->req = p;

Cheers,

-- 
Julien Grall

