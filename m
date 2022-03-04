Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 961EF4CCB63
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 02:44:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283868.482985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPwzZ-0006VZ-HX; Fri, 04 Mar 2022 01:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283868.482985; Fri, 04 Mar 2022 01:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPwzZ-0006S7-EQ; Fri, 04 Mar 2022 01:44:25 +0000
Received: by outflank-mailman (input) for mailman id 283868;
 Fri, 04 Mar 2022 01:44:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zYUj=TP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nPwzY-0006Qz-62
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 01:44:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c5dd2e7-9b5c-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 02:44:21 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E210A61834;
 Fri,  4 Mar 2022 01:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A873CC004E1;
 Fri,  4 Mar 2022 01:44:18 +0000 (UTC)
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
X-Inumbo-ID: 9c5dd2e7-9b5c-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646358259;
	bh=hCMNUyzaAUdVodLem9QTKTwRgjSCd4NpJgNrmR8+qZo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IKVGsftGFSjWdA5FEcpGojFpiLEGnINXi+57ezYJlGQv4OJyvCMeSYkjPCC2MDoOQ
	 vxdaF/6xzZ+oT0sfWYrWmSwYyWFYO94QUZUCeDUiIySOSqSy5z4xCOv+Dqv/45TcrW
	 1eEqUqE2eunZe734Mzdurp6/Zvmc3IXhkF6a5wobU892PICDviy4BZhgQT4/l61ALE
	 qH8t8h89AXo2iClJ4osslwc9RQfddew3lkSOYlYf//Q1DYYfjuyU44t28h/qrQ50jL
	 ej4mWfuvlmcTUsXqPt8oNCaE5s4s6PBWlgRDAaudyNnweMuX3iLl0uPIuPswRKJJMi
	 bUx8JzVVNqXOg==
Date: Thu, 3 Mar 2022 17:44:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefanos@xilinx.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org, 
    roger.pau@citrix.com, Ayan Kumar Halder <ayankuma@xilinx.com>
Subject: Re: [XEN v9 4/4] xen/arm64: io: Handle data abort due to cache
 maintenance instructions
In-Reply-To: <20220301124022.10168-5-ayankuma@xilinx.com>
Message-ID: <alpine.DEB.2.22.394.2203031744100.3261@ubuntu-linux-20-04-desktop>
References: <20220301124022.10168-1-ayankuma@xilinx.com> <20220301124022.10168-5-ayankuma@xilinx.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Mar 2022, Ayan Kumar Halder wrote:
> When the data abort is caused due to cache maintenance for an address,
> there are two scenarios:-
> 
> 1. Address belonging to a non emulated region - For this, Xen should
> set the corresponding bit in the translation table entry to valid and
> return to the guest to retry the instruction. This can happen sometimes
> as Xen need to set the translation table entry to invalid. (for eg
> 'Break-Before-Make' sequence).
> 
> 2. Address belongs to an emulated region - Xen should ignore the
> instruction (ie increment the PC) and return to the guest.
> 
> We try to deal with scenario#1, by invoking check_p2m(). If this is
> unsuccessful, then we assume scenario#2.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


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
>  xen/arch/arm/include/asm/mmio.h |  3 ++-
>  xen/arch/arm/io.c               | 11 +++++++++++
>  xen/arch/arm/traps.c            |  6 ++++++
>  3 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
> index ef2c57a2d5..75d362d5f5 100644
> --- a/xen/arch/arm/include/asm/mmio.h
> +++ b/xen/arch/arm/include/asm/mmio.h
> @@ -34,7 +34,8 @@ enum instr_decode_state
>       * Instruction is decoded successfully. It is a ldr/str post indexing
>       * instruction.
>       */
> -    INSTR_LDR_STR_POSTINDEXING
> +    INSTR_LDR_STR_POSTINDEXING,
> +    INSTR_IGNORE                    /* Instruction is ignored */
>  };
>  
>  typedef struct
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index ebcb8ed548..7e9dd4bb08 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -139,6 +139,17 @@ void try_decode_instruction(const struct cpu_user_regs *regs,
>          return;
>      }
>  
> +    /*
> +     * When the data abort is caused due to cache maintenance, Xen should ignore
> +     * this instruction as the cache maintenance was caused on an address belonging
> +     * to the emulated region.
> +     */
> +    if ( info->dabt.cache )
> +    {
> +        info->dabt_instr.state = INSTR_IGNORE;
> +        return;
> +    }
> +
>      /*
>       * Armv8 processor does not provide a valid syndrome for decoding some
>       * instructions. So in order to process these instructions, Xen must
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index e491ca15d7..5879640b73 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -2011,6 +2011,12 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>  
>          try_decode_instruction(regs, &info);
>  
> +        if ( info.dabt_instr.state == INSTR_IGNORE )
> +        {
> +            advance_pc(regs, hsr);
> +            return;
> +        }
> +
>          /*
>           * If Xen could not decode the instruction or encountered an error
>           * while decoding, then it should forward the abort to the guest.
> -- 
> 2.17.1
> 

