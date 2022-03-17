Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575784DD0B7
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 23:28:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291779.495484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUybC-00056f-T9; Thu, 17 Mar 2022 22:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291779.495484; Thu, 17 Mar 2022 22:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUybC-00054S-Pk; Thu, 17 Mar 2022 22:28:02 +0000
Received: by outflank-mailman (input) for mailman id 291779;
 Thu, 17 Mar 2022 22:28:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MbXJ=T4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nUybC-00054M-8B
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 22:28:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80590ed6-a641-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 23:28:00 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 55EEC61926;
 Thu, 17 Mar 2022 22:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18305C340E9;
 Thu, 17 Mar 2022 22:27:58 +0000 (UTC)
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
X-Inumbo-ID: 80590ed6-a641-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647556078;
	bh=15uDO03PZ3myBwJXcfVNIG8brzvrnbGmMvvemI6oStw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZT/D7qWp4Cutxk+6c1+VQJy8Qdf3S+TDR00DJ+txVD472jyc6upUATdDBpc4KS5fQ
	 iKeG4/bBHDQix4iS+tAR3Kz6Y+LfZ5B4a1piBaibCfNDg5ji48ToT8+sGOEw+6gqgX
	 k9b49CfJQ5KVCMQDEMyY5XckEWceWT2jYTf41abTECH47fuqFUpQaVooN5rQ3opoCD
	 sS03cMjQ71gaT54fO7VUHpxgd9tCUi+89YGLlgKnESWjgsnYXmgr9xPiFLpRMuC1pO
	 E4FF44Ahd7AbvSDsgEGYNfi+ixsecXrr95qDTHVhFdagVyg1r0/kKYovatpEgB4WAk
	 9jww1plFeqfWw==
Date: Thu, 17 Mar 2022 15:27:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefanos@xilinx.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org, 
    roger.pau@citrix.com, Ayan Kumar Halder <ayankuma@xilinx.com>
Subject: Re: [PATCH v11 2/3] xen/arm64: io: Handle the abort due to access
 to stage1 translation table
In-Reply-To: <20220317140046.64563-3-ayankuma@xilinx.com>
Message-ID: <alpine.DEB.2.22.394.2203171527290.3497@ubuntu-linux-20-04-desktop>
References: <20220317140046.64563-1-ayankuma@xilinx.com> <20220317140046.64563-3-ayankuma@xilinx.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Mar 2022, Ayan Kumar Halder wrote:
> If the abort was caused due to access to stage1 translation table, Xen
> will try to set the p2m entry (assuming that the Stage 1 translation
> table is in a non MMIO region).
> If there is no such entry found, then Xen will try to map the address as
> a MMIO region (assuming that the Stage 1 translation table is in a
> direct MMIO region).
> 
> If that fails as well, then there are the two following scenarios:-
> 1. Stage 1 translation table being in an emulated MMIO region - Xen
> can read the region, but it has no way to return the value read to the
> CPU page table walker (which tries to go through the stage1 tables to
> resolve the translation fault).
> 
> 2. Stage 1 translation table address is invalid.
> 
> In both the above scenarios, Xen will forward the abort to the guest.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>

Tested-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Changelog :-
> 
> v1..v8 - NA
> 
> v9 - 1. Extracted this change from "[XEN v8 2/2] xen/arm64: io: Support
> instructions (for which ISS is not..." into a separate patch of its own.
> The reason being this is an existing bug in the codebase.
> 
> v10 - 1. Enabled checking for stage1 translation table address in the
> MMIO region. The reason being Arm Arm does not have any restrictions.
> 2. Updated the commit message to explain all the possible scenarios.
> 
> v11 - 1. Fixed some wordings in comments and commit message (pointed
> by Julien in v10).
> 
>  xen/arch/arm/io.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index fd903b7b03..6f458ee7fd 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -128,6 +128,17 @@ void try_decode_instruction(const struct cpu_user_regs *regs,
>          return;
>      }
>  
> +    /*
> +     * At this point, we know that the stage1 translation table is either in an
> +     * emulated MMIO region or its address is invalid . This is not expected by
> +     * Xen and thus it forwards the abort to the guest.
> +     */
> +    if ( info->dabt.s1ptw )
> +    {
> +        info->dabt_instr.state = INSTR_ERROR;
> +        return;
> +    }
> +
>      /*
>       * Armv8 processor does not provide a valid syndrome for decoding some
>       * instructions. So in order to process these instructions, Xen must
> -- 
> 2.17.1
> 
> 

