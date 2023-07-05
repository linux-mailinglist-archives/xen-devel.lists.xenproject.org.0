Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA31749123
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 00:53:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559537.874588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHBMs-0000qU-Te; Wed, 05 Jul 2023 22:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559537.874588; Wed, 05 Jul 2023 22:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHBMs-0000oM-QV; Wed, 05 Jul 2023 22:53:02 +0000
Received: by outflank-mailman (input) for mailman id 559537;
 Wed, 05 Jul 2023 22:53:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsP3=CX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qHBMr-0000oG-Sg
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 22:53:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0352e9f-1b86-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 00:52:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 95766617C9;
 Wed,  5 Jul 2023 22:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6BD0C433C7;
 Wed,  5 Jul 2023 22:52:55 +0000 (UTC)
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
X-Inumbo-ID: b0352e9f-1b86-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688597578;
	bh=iGnBfSz0mj7OxHHYqpq7lHKTkUFEI66UzH2HHcb/G7w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QHc0u8cbK2oF1vekwuLvuc/qe7EKS0jeevpK++nrfKVz9YvWyHPcnzUT4ODg3iMaG
	 O0H4G2SFX2KTPL6kMOp5ndOD4IOt83vEAcEfwTjJWBr4mDiAp/iU+M371I7DTUFsA4
	 ASvAEbM0bV7VZGfxLAjutPtwI/kCOO4k2I7i5i++QTSUsDOa7Zq9cwgL7PFXW7IlKj
	 qujpkFhpqSuQYzUJtVYz93FN84M2+EmU9LZoar2xQ30iIx9QVIMHzBkdVLQHHl0NFS
	 504WvTC+vRBekIsAm8nPGhTgbylE375IO40+kiHUNCc1YU4F/GZNstx61vZVTkSv5R
	 rCy/Uh3f6r7cw==
Date: Wed, 5 Jul 2023 15:52:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jan Beulich <jbeulich@suse.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, 
    Tamas K Lengyel <tamas@tklengyel.com>, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>, 
    Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 5/5] x86: make parameter names of function declarations
 consistent
In-Reply-To: <alpine.DEB.2.22.394.2307051550070.761183@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2307051552080.761183@ubuntu-linux-20-04-desktop>
References: <cover.1688049494.git.federico.serafini@bugseng.com> <5ee57d7bcd79daa0314f182ecb73e1eb6d8ecc03.1688049495.git.federico.serafini@bugseng.com> <0076f2d6-03b7-0a1c-c423-1f55b7195407@suse.com>
 <alpine.DEB.2.22.394.2307051550070.761183@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Jul 2023, Stefano Stabellini wrote:
> On Tue, 4 Jul 2023, Jan Beulich wrote:
> > On 29.06.2023 17:55, Federico Serafini wrote:
> > > --- a/xen/arch/x86/cpu/mcheck/mce.h
> > > +++ b/xen/arch/x86/cpu/mcheck/mce.h
> > > @@ -44,7 +44,7 @@ extern uint8_t cmci_apic_vector;
> > >  extern bool lmce_support;
> > >  
> > >  /* Init functions */
> > > -enum mcheck_type amd_mcheck_init(struct cpuinfo_x86 *c);
> > > +enum mcheck_type amd_mcheck_init(struct cpuinfo_x86 *ci);
> > 
> > Supported even by ...
> > 
> > >  enum mcheck_type intel_mcheck_init(struct cpuinfo_x86 *c, bool bsp);
> > 
> > ... immediate context, c is the name we use for parameters of this type.
> > You want to change the definition in such cases instead of the
> > declaration.

I should add that if we are going to change some functions in the other
direction then it would be best to move those changes in a separate
patch to make it easier to review.


> > I also think this patch could do with splitting, not the least to
> > reduce the Cc list(s) needed.
> 
> This is a very large patch but it is entirely mechanical (good!)
> 
> How would you see it split? By individual files (too many in my
> opinion), or maybe by directory? By directory it would be something
> like:
> 
> xen/arch/x86/cpu/mcheck
> xen/arch/x86/hvm
> xen/arch/x86/include/asm
> 

