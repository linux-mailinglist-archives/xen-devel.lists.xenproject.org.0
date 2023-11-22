Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 998397F3B85
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 02:52:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638375.994906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5cPf-0000SI-3D; Wed, 22 Nov 2023 01:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638375.994906; Wed, 22 Nov 2023 01:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5cPe-0000Qc-VS; Wed, 22 Nov 2023 01:52:22 +0000
Received: by outflank-mailman (input) for mailman id 638375;
 Wed, 22 Nov 2023 01:52:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5cPd-0000QW-KD
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 01:52:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c58230a7-88d9-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 02:52:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0657C61BCE;
 Wed, 22 Nov 2023 01:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9540C433C8;
 Wed, 22 Nov 2023 01:52:15 +0000 (UTC)
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
X-Inumbo-ID: c58230a7-88d9-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700617938;
	bh=YIb2PJeHkp6aweW4KT3j/3v3Ht0T9weeGLRThzbFXDQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k0f9IuK/KQsItk2W2gU0x7w+FtWXbVMnbAIatVVUB7nmo24il0yubXBdUuXnxCxNn
	 MawegR5NCzXC690FzZyfnv1h24LQWm8EvRJ8bOVuEtl1AH1erRkPGitjKjY5fKuQs3
	 FeyBKZaSOEZk9cFxagvuLuDVk+bUQghPY6rX120uVCW1E8mB+BuNe7qw0MS2LgJGn9
	 ODOzh+h/q/rGSUwWAFBlOfh3qKIgjvaUuzuss+hAYj9VFIGcVIYpdgb/zFk/AUe3N/
	 WOX5rVXDZZLuNFc5IrydSUbAll0KUdxzdUfok/QejJCoctVbnmQz+LX+5J1qRJG5cl
	 B1mdtYmFGyVIg==
Date: Tue, 21 Nov 2023 17:52:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, Jun Nakajima <jun.nakajima@intel.com>, 
    Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v6 0/8] Fix or deviate various instances
 of missing declarations
In-Reply-To: <ec649a67-63c9-4275-a228-c14dea558eb0@suse.com>
Message-ID: <alpine.DEB.2.22.394.2311211751530.2053963@ubuntu-linux-20-04-desktop>
References: <cover.1698829473.git.nicola.vetrini@bugseng.com> <ec649a67-63c9-4275-a228-c14dea558eb0@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 21 Nov 2023, Jan Beulich wrote:
> On 01.11.2023 10:30, Nicola Vetrini wrote:
> > The patches in this series aim to fix or deviate various instances where a
> > function or variable do not have a declaration visible when such entity is
> > defined (in violation of MISRA C:2012 Rule 8.4).
> > An exception listed under docs/misra/rules.rst allows asm-only functions and
> > variables to be exempted, while the other instances are either changed
> > (e.g., making them static) or a missing header inclusion is added.
> > 
> > Nicola Vetrini (8):
> >   xen: modify or add declarations for variables where needed
> >   x86: add deviation for asm-only functions
> >   x86: add asmlinkage macro to variables only used in asm code
> >   x86/grant: switch included header to make declarations visible
> >   x86/vm_event: add missing include for hvm_vm_event_do_resume
> >   xen/console: remove stub definition in consoled.h
> >   x86/mem_access: make function static
> >   docs/misra: exclude three more files
> 
> While I committed most of the patches from this series, the situation with
> patch 2 has become sufficiently unclear to me, such that I refrained from
> committing that and the dependent patch 3.
> 
> Stefano, assuming you know what exact massaging it wants done while
> committing, please can I leave that to you?

Done

