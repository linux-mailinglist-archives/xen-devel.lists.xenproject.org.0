Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8864D57E9
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 03:06:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288645.489531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSUfp-0004iW-2R; Fri, 11 Mar 2022 02:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288645.489531; Fri, 11 Mar 2022 02:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSUfo-0004gC-Vj; Fri, 11 Mar 2022 02:06:32 +0000
Received: by outflank-mailman (input) for mailman id 288645;
 Fri, 11 Mar 2022 02:06:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8RDm=TW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nSUfn-0004g6-IV
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 02:06:31 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dddc47aa-a0df-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 03:06:30 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AB4DFB829B8;
 Fri, 11 Mar 2022 02:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2AC5C340E8;
 Fri, 11 Mar 2022 02:06:27 +0000 (UTC)
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
X-Inumbo-ID: dddc47aa-a0df-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646964388;
	bh=+gN9ASdsAqbrPChnsiLbZRYTMat+zAXKK6CDtuMVhjc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FG6MngYkq3kYMOxB5tNBEnIB7Fk+jP8KZcYAJJV6YbLrQZyge8jIzgP394fp23cZe
	 IA9RdtGkvkO+zGp4udVel2rDcSiBSR5DoSB6V4jPHJf6RBqQ51wmvLKTXIaCF79om1
	 1SSBqO3lqbUOaAx+eJMywUzslkAVtji9DxYU+yw5xfIbJRXGZCS2TC97ZwBZJSN6bc
	 96/BhnDSKUJfdqIFEi2lq8c6tpBQ5/5KvZyGMPijktkiH45hlLscsBnYRKbcG1sItE
	 jJu8csoRERKQUjv3nFmmsdrR2Womzg+9idxa/AVommWY5n6Wov20eymlELUIBInM+V
	 ctyzcXvcJO9kA==
Date: Thu, 10 Mar 2022 18:06:26 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefanos@xilinx.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org, 
    roger.pau@citrix.com, Ayan Kumar Halder <ayankuma@xilinx.com>
Subject: Re: [XEN v10 3/4] xen/arm64: io: Handle the abort due to access to
 stage1 translation table
In-Reply-To: <20220310174501.62040-4-ayankuma@xilinx.com>
Message-ID: <alpine.DEB.2.22.394.2203101805360.3261@ubuntu-linux-20-04-desktop>
References: <20220310174501.62040-1-ayankuma@xilinx.com> <20220310174501.62040-4-ayankuma@xilinx.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Mar 2022, Ayan Kumar Halder wrote:
> If the abort was caused due to access to stage1 translation table, Xen
> will try to set the p2m entry (assuming that the Stage 1 translation
> table is in the non MMIO region).
> If there is no such entry found, then Xen will try to map the address as
> a MMIO region (assuming that the Stage 1 translation table is in the
> direct MMIO region).
> 
> If that fails as well, then there are the two following scenarios:-
> 1. Stage 1 translation table being in the emulated MMIO region - Xen
> can read the region, but it has no way to return the value read to the
> CPU page table walker (which tries to go through the stage1 tables to
> resolve the translation fault).
> 
> 2. Stage 1 translation table address is invalid.
> 
> In both the above scenarios, Xen will forward the abort to the guest.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
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
>  xen/arch/arm/io.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index fd903b7b03..e6c77e16bf 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -128,6 +128,17 @@ void try_decode_instruction(const struct cpu_user_regs *regs,
>          return;
>      }
>  
> +    /*
> +     * At this point, we know that the stage1 translation table is either in the
> +     * emulated MMIO region or its address is invalid . This is not expected by
                                                        ^

This looks OK to me now, but I'll let Julien ack/comment as he has been
following more closely.


> +     * Xen and thus it forwards the abort to the guest.
> +     */
> +    if ( info->dabt.s1ptw )
> +    {
> +        info->dabt_instr.state = INSTR_ERROR;
> +        return;
> +    }
>      /*
>       * Armv8 processor does not provide a valid syndrome for decoding some
>       * instructions. So in order to process these instructions, Xen must
> -- 
> 2.17.1
> 
> 

