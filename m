Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE1A7EFD3E
	for <lists+xen-devel@lfdr.de>; Sat, 18 Nov 2023 03:47:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635499.991455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4BMk-00036y-UB; Sat, 18 Nov 2023 02:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635499.991455; Sat, 18 Nov 2023 02:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4BMk-00035J-R5; Sat, 18 Nov 2023 02:47:26 +0000
Received: by outflank-mailman (input) for mailman id 635499;
 Sat, 18 Nov 2023 02:47:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+gg=G7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r4BMi-00030l-Sp
 for xen-devel@lists.xenproject.org; Sat, 18 Nov 2023 02:47:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc981893-85bc-11ee-98dd-6d05b1d4d9a1;
 Sat, 18 Nov 2023 03:47:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C5BED61DF1;
 Sat, 18 Nov 2023 02:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33222C433C7;
 Sat, 18 Nov 2023 02:47:19 +0000 (UTC)
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
X-Inumbo-ID: cc981893-85bc-11ee-98dd-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700275641;
	bh=ISIiwafsU/4JwBj9foViVkTrYVgIGpcIZnfOx/QYib4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lNWqHyCw2A0smKOcKWc9bwVPZqc2SYO0rcg1GCyCWc/cjC8nnZXUCCyNJd/lGQgeK
	 GhYQCRPzuJlZEPlruPlIBGCbzuTPK62EHkGH/KmUbxOVpx93Fy5qkG7HatMppjGFxZ
	 pHWXwWQQXXToe86QcihqxG/0u0tjlukxfkLZkEqszMk5vv1MQf49wzq7HNuTqKrcdA
	 ShLr7ZiFW4Kv1FOaoEsFBPDIlS+6ocPCx3jkwIh0jDnnihZIUOQnM3YUu0YdX43BZ/
	 eS19SQ1b03PhCA4PtZt1E6MsXpobSwzCswnkcFVGbo8j/F4165BS2Mf1KwT/bKDR8g
	 zo/mqIoThZ4jQ==
Date: Fri, 17 Nov 2023 18:47:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, bertrand.marquis@arm.com, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v3] xen: replace occurrences of SAF-1-safe with
 asmlinkage attribute
In-Reply-To: <40a3918e-730f-48b9-924f-d8707b197e14@xen.org>
Message-ID: <alpine.DEB.2.22.394.2311171832561.773207@ubuntu-linux-20-04-desktop>
References: <b193825385eae75ae320ab7d8c7f63b61c8c8786.1700125246.git.nicola.vetrini@bugseng.com> <991883873b73e644ccaf8114a80331c0@bugseng.com> <40a3918e-730f-48b9-924f-d8707b197e14@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-750720694-1700274860=:773207"
Content-ID: <alpine.DEB.2.22.394.2311171834320.773207@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-750720694-1700274860=:773207
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2311171834321.773207@ubuntu-linux-20-04-desktop>

On Fri, 17 Nov 2023, Julien Grall wrote:
> On 16/11/2023 09:15, Nicola Vetrini wrote:
> > On 2023-11-16 10:08, Nicola Vetrini wrote:
> > > The comment-based justifications for MISRA C:2012 Rule 8.4 are replaced
> > > by the asmlinkage pseudo-attribute, for the sake of uniformity.
> > > 
> > > Add missing 'xen/compiler.h' #include-s where needed.
> > > 
> > > The text in docs/misra/deviations.rst and docs/misra/safe.json
> > > is modified to reflect this change.
> > > 
> > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > ---
> > > This patch should be applied after patch 2 of this series.
> > > The request made by Julien to update the wording is
> > > contained in the present patch.
> > > https://lore.kernel.org/all/9ad7f6210c15f520297aac00e8af0e64@bugseng.com/
> > > 
> > > Concerns about efi_multiboot2 will be dealt with separately.
> > > 
> > > Changes in v2:
> > > - Edit safe.json.
> > > - Remove mention of SAF-1-safe in deviations.rst.
> > > Changes in v3:
> > > - Sorted #include-s and rebased against
> > > 7ad0c774e474 ("x86/boot: tidy #include-s")
> > > ---
> > >  docs/misra/deviations.rst   |  5 ++---
> > >  docs/misra/safe.json        |  2 +-
> > >  xen/arch/arm/cpuerrata.c    |  7 +++----
> > >  xen/arch/arm/setup.c        |  5 ++---
> > >  xen/arch/arm/smpboot.c      |  3 +--
> > >  xen/arch/arm/traps.c        | 21 +++++++--------------
> > >  xen/arch/x86/boot/cmdline.c |  5 +++--
> > >  xen/arch/x86/boot/reloc.c   |  6 +++---
> > >  xen/arch/x86/extable.c      |  3 +--
> > >  xen/arch/x86/setup.c        |  3 +--
> > >  xen/arch/x86/traps.c        | 27 +++++++++------------------
> > >  xen/common/efi/boot.c       |  5 ++---
> > >  12 files changed, 35 insertions(+), 57 deletions(-)
> > > 
> > 
> > In hindsight I should have added an
> > 
> > Acked-by: Julien Grall <jgrall@amazon.com>
> > 
> > given that the comment has been addressed in my opinion.
> 
> I am a bit confused how you considered it was addressed. I see no update in
> safe.json when I clearly asked for some (I wouldn't have bothered to comment
> in v2 otherwise and just gave an ack).
> 
> To be explicit, I requested to:
>   1. update the description in [1] to clarify that SAF-1 is deprecated.
>   2. This patch is rebased on top and therefore remove completely the mention
> of SAF-1.
> 
> I am well-aware that the end result is technically the same. But patches are
> meant to be self-contained so if we revert the latest, then the meaning is
> still the same.
> 
> This patch is unlikely to be removed and this is now the nth time I asked it
> the same (maybe it was not clear enough?). So I am going to content with the
> current proposal because this is not worth to go further. But I will at least
> express my discontent how this is handled.

Just to be extra clearm, you are not happy with it, but you would
tolerate the patch to be committed as is, right?


> TBH, there are far too many MISRA patches on the ML spread across multiple
> threads. Some are based on top of the others. This makes extremely difficult
> to follow and know what is addressed or not. Can we at least try to condense
> some of work in similar area in the same series? For instance, this patch
> could have been included in the other series [1].
> 
> Lastly, right now, I have 300 emails (31 threads) with MISRA in the title in
> my inbox. It is a little unclear what has been committed/review or require
> input. I am concerned to miss key series (the patch to compile in docs/ was
> nearly missed).
> 
> Do we track anywhere which series are still inflights? Can we consider to
> pause or at least slow down the rate of new MISRA patches until the backlog is
> cleared? (Adding more patches is not really helping).

I cleared out the ones I was tracking and were acked. I hope this helps.
As far as I can tell these are the ones currently under discussion:

- [XEN PATCH v5 0/2] use the documentation for MISRA C:2012 Dir 4.1
- first 4 patches of [XEN PATCH][for-4.19 v4 0/8] address violations of MISRA C:2012 Rule 10.1
- [XEN PATCH][for-4.19 v2 0/2] use the macro ISOLATE_LOW_BIT where appropriate
- [XEN PATCH v2] domain: add ASSERT to help static analysis tools
- [XEN PATCH v3] xen/mm: address violations of MISRA C:2012 Rules 8.2 and 8.3
- [XEN PATCH v2] automation/eclair: add deviations for MISRA C:2012 Rule 8.3
- this patch
- [XEN PATCH 0/5] xen: address some violations of MISRA C:2012 Rule 8.2
--8323329-750720694-1700274860=:773207--

