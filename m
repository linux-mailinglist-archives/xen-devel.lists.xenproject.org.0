Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55A68001C0
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 03:48:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645241.1007287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tZT-0007or-9K; Fri, 01 Dec 2023 02:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645241.1007287; Fri, 01 Dec 2023 02:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tZT-0007mu-6W; Fri, 01 Dec 2023 02:48:03 +0000
Received: by outflank-mailman (input) for mailman id 645241;
 Fri, 01 Dec 2023 02:48:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmaB=HM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8tZR-0007mm-L2
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 02:48:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0952d427-8ff4-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 03:47:59 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DA8D460CEB;
 Fri,  1 Dec 2023 02:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E9EC433C7;
 Fri,  1 Dec 2023 02:47:55 +0000 (UTC)
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
X-Inumbo-ID: 0952d427-8ff4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701398877;
	bh=g4p11Ro4acHQFbeiu4ECYRDfuq+IlT0D/eCjHEd5kXE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t3ElGgkyHHSeeqA9TzyHnwdPRpyRZsVuE85vQzz4ypDzaeV/Cg6NTtbVtjz4OWRsw
	 ulgQJMFAdi5RbV2S3u4NQYyZxk7XCDa087eAKHIoMexbp0euccOxRHW4OfuojL8bJ6
	 jTw1iE1s4TGv3RiLBh+AGw5ks4PmrCccCMe9szEOfRXenz1s9KrWH3Q2GvkTyQWJyw
	 qePLfFzbeC+9SSQ5Ra4E2edSdvAi1V0GbWp4R06zWi9SuGzCxVcMFXOEnQwVyZ5lAN
	 uam+dVI42dwamexACYG+KasHhlykEE3i1GMMa9U0m0FTOMSZtNxff+xciPsdfPvZpB
	 BoK10OZRFmYyg==
Date: Thu, 30 Nov 2023 18:47:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, bertrand.marquis@arm.com, julien@xen.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 7/7] xen/page_alloc: deviate first_valid_mfn for
 MISRA C Rule 8.4
In-Reply-To: <1ee69d2f0b9e9a704bf869e2b2700f88a8069343.1701270983.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311301847300.110490@ubuntu-linux-20-04-desktop>
References: <cover.1701270983.git.nicola.vetrini@bugseng.com> <1ee69d2f0b9e9a704bf869e2b2700f88a8069343.1701270983.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 29 Nov 2023, Nicola Vetrini wrote:
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> The preferred way to deviate is to use asmlinkage, but this modification is only
> the consequence of NUMA on ARM (and possibly PPC) being a work in progress.
> As stated in the comment above the textual deviation, first_valid_mfn will
> likely then become static and there would be no need for the comment anymore.
> This works towards having the analysis for this rule clean (i.e. no violations);
> the interest in having a clean rule is that then it could be used to signal
> newly introduced violations by making the analysis job fail.

Please add this text as part of the commit message. It can be done on
commit. With that:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/page_alloc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 9b5df74fddab..794d7689b179 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -258,6 +258,7 @@ static PAGE_LIST_HEAD(page_broken_list);
>   * first_valid_mfn is exported because it is use in ARM specific NUMA
>   * helpers. See comment in arch/arm/include/asm/numa.h.
>   */
> +/* SAF-1-safe */
>  mfn_t first_valid_mfn = INVALID_MFN_INITIALIZER;
>  
>  struct bootmem_region {
> -- 
> 2.34.1
> 

