Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 846984D5820
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 03:26:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288649.489542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSUy9-00074m-N7; Fri, 11 Mar 2022 02:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288649.489542; Fri, 11 Mar 2022 02:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSUy9-00071e-JM; Fri, 11 Mar 2022 02:25:29 +0000
Received: by outflank-mailman (input) for mailman id 288649;
 Fri, 11 Mar 2022 02:25:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8RDm=TW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nSUy7-00071Y-LE
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 02:25:27 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8235b9e3-a0e2-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 03:25:26 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7BE92CE26D0;
 Fri, 11 Mar 2022 02:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A767C340E8;
 Fri, 11 Mar 2022 02:25:19 +0000 (UTC)
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
X-Inumbo-ID: 8235b9e3-a0e2-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646965519;
	bh=yHKa0cSP1NYreZiHqCrhYlTJ0pBTR4aEa6N0TsokFGM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ML1TAeMTxI/MLZD0ZjVD+xcYKJf4S1SFl9TlTjJNb0VJB66vlvQJOhx+6r3qzmECM
	 NyNLYHQ3XusLuT8n0afsyF91h46B2A216uP565fxr5DcXVg2H4IkbrYzH2wyDfqiHa
	 WQ5+fVr4YWYNABHlkSWIhWrSaT67+vHuxjPahR4VPuzoLzPCkuQVsYvemONCtrtnGV
	 8FrkzvPFrtN8pFEK7mGRwUXzOG6xd8ZciCqkhqU/m5RrJwW0zqPGvnIK6uvncu5FiT
	 Jn67hvDOGzvVSW5nK+uFQ70JP9vvIBL8R16bQnJjRW8OwSVGfxkCm4WCwyITxohMJ8
	 9S3/XD1RDbNjg==
Date: Thu, 10 Mar 2022 18:25:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefanos@xilinx.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org, 
    roger.pau@citrix.com, Ayan Kumar Halder <ayankuma@xilinx.com>
Subject: Re: [XEN v10 4/4] xen/arm64: io: Handle data abort due to cache
 maintenance instructions
In-Reply-To: <20220310174501.62040-5-ayankuma@xilinx.com>
Message-ID: <alpine.DEB.2.22.394.2203101813030.3261@ubuntu-linux-20-04-desktop>
References: <20220310174501.62040-1-ayankuma@xilinx.com> <20220310174501.62040-5-ayankuma@xilinx.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Mar 2022, Ayan Kumar Halder wrote:
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
>  xen/arch/arm/include/asm/mmio.h |  1 +
>  xen/arch/arm/io.c               | 20 ++++++++++++++++++++
>  xen/arch/arm/ioreq.c            | 15 ++++++++++++++-
>  3 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
> index ca259a79c2..79e64d9af8 100644
> --- a/xen/arch/arm/include/asm/mmio.h
> +++ b/xen/arch/arm/include/asm/mmio.h
> @@ -35,6 +35,7 @@ enum instr_decode_state
>       * instruction.
>       */
>      INSTR_LDR_STR_POSTINDEXING,
> +    INSTR_CACHE,                    /* Cache Maintenance instr */
>  };
>  
>  typedef struct
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index e6c77e16bf..c5b2980a5f 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -139,6 +139,17 @@ void try_decode_instruction(const struct cpu_user_regs *regs,
>          return;
>      }
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
>      /*
>       * Armv8 processor does not provide a valid syndrome for decoding some
>       * instructions. So in order to process these instructions, Xen must
> @@ -177,6 +188,15 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>          return rc;
>      }
>  
> +    /*
> +     * When the data abort is caused due to cache maintenance and the address
> +     * belongs to an emulated region, Xen should ignore this instruction.
> +     */
> +    if ( info->dabt_instr.state == INSTR_CACHE )
> +    {
> +        return IO_HANDLED;
> +    }
>      /*
>       * At this point, we know that the instruction is either valid or has been
>       * decoded successfully. Thus, Xen should be allowed to execute the
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index cc9bf23213..0dd2d452f7 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -29,10 +29,14 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
>      const struct hsr_dabt dabt = hsr.dabt;
>      /* Code is similar to handle_read */
>      register_t r = v->io.req.data;
> +    const struct instr_details instr = v->io.info.dabt_instr;
>  
>      /* We are done with the IO */
>      v->io.req.state = STATE_IOREQ_NONE;
>  
> +    if ( instr.state == INSTR_CACHE )
> +        return IO_HANDLED;

It might be possible to get rid of this check here by rearranging the
code in try_handle_mmio a little bit so that handle_ioserv is not called
when INSTR_CACHE. But I don't have an opinion about it.

The patch does what it says on the tin and as far as I can tell followed
Julien's requests so:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

