Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B02287BEFE3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 02:48:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614525.955658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq0vN-0002XX-Ln; Tue, 10 Oct 2023 00:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614525.955658; Tue, 10 Oct 2023 00:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq0vN-0002Vo-Iz; Tue, 10 Oct 2023 00:48:37 +0000
Received: by outflank-mailman (input) for mailman id 614525;
 Tue, 10 Oct 2023 00:48:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z25Z=FY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qq0vM-0002Vi-Fv
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 00:48:36 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdb2dcca-6706-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 02:48:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1B757B8092E;
 Tue, 10 Oct 2023 00:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0C1C433C8;
 Tue, 10 Oct 2023 00:48:31 +0000 (UTC)
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
X-Inumbo-ID: bdb2dcca-6706-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696898913;
	bh=0pE8XrCr88TtH3JJfQmdAaCrLPohXKdZOIcYtpxPTAM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cdvVd4+RSeekyD8OEZZn/edNiiDyHFm5Aq0L5ODbM0P+PUjtd9Ku6KSEy/JruAvJ5
	 nN9cpy/SowSmwkozcz2L8rfn5nDsykKoCAMv95B9L+ZgA47CPnFHIqvkJa1mDyOHbC
	 Y45ZU3YHILmwfpwOcNxda7Tme5zjfREWu/kqRBTA5iZ2KRuG3/6w8x2zYKb843UCKw
	 Z2yottJ9cdgdbJA77f1Z2Yejvjmzr20jE+l/QZzqL69fLDgSPeR+SCWiAuQHZAMfJh
	 q2D7pOOQw8OiWaTFceZHwIlD4abKe4PCBZ/DbGUu7fcribrf1BUm9UxqqrofeBGkn1
	 asz6hjb3wEM+g==
Date: Mon, 9 Oct 2023 17:48:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 6/9] x86/io_apic: address violation of MISRA C:2012
 Rule 10.1
In-Reply-To: <7def4be3f63306569a2ac1776c2d6ed24ff24ee2.1696514677.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310091748220.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com> <7def4be3f63306569a2ac1776c2d6ed24ff24ee2.1696514677.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Oct 2023, Nicola Vetrini wrote:
> The definition of IO_APIC_BASE contains a sum of an essentially enum
> value (FIX_IO_APIC_BASE_0) that is positive with an index that, in all
> instances, is unsigned, therefore the former is cast to unsigned, so that
> the operands are of the same essential type.
> 
> No functional change.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/include/asm/io_apic.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
> index a7e4c9e146de..a0fc50d601fe 100644
> --- a/xen/arch/x86/include/asm/io_apic.h
> +++ b/xen/arch/x86/include/asm/io_apic.h
> @@ -14,9 +14,10 @@
>   * Copyright (C) 1997, 1998, 1999, 2000 Ingo Molnar
>   */
>  
> -#define IO_APIC_BASE(idx)                                               \
> -    ((volatile uint32_t *)(__fix_to_virt(FIX_IO_APIC_BASE_0 + (idx))    \
> -                           + (mp_ioapics[idx].mpc_apicaddr & ~PAGE_MASK)))
> +#define IO_APIC_BASE(idx)                                     \
> +    ((volatile uint32_t *)                                    \
> +     (__fix_to_virt((unsigned int)FIX_IO_APIC_BASE_0 + (idx)) \
> +      + (mp_ioapics[idx].mpc_apicaddr & ~PAGE_MASK)))
>  
>  #define IO_APIC_ID(idx) (mp_ioapics[idx].mpc_apicid)
>  
> -- 
> 2.34.1
> 

