Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C855880427C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 00:19:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647347.1010392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAIDf-0008A7-C6; Mon, 04 Dec 2023 23:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647347.1010392; Mon, 04 Dec 2023 23:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAIDf-000885-9Q; Mon, 04 Dec 2023 23:19:19 +0000
Received: by outflank-mailman (input) for mailman id 647347;
 Mon, 04 Dec 2023 23:19:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8A84=HP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rAIDd-00081e-Gd
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 23:19:17 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b5513ec-92fb-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 00:19:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 4E122B8159B;
 Mon,  4 Dec 2023 23:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACA2C433C8;
 Mon,  4 Dec 2023 23:19:13 +0000 (UTC)
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
X-Inumbo-ID: 8b5513ec-92fb-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701731955;
	bh=K5vOBrBN+0un2jPiJXMxLI+rVZy/jeyXqClh0diXL2o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qM6gis7LG6OoCDy1Kcip5weUETWGi8ypXtEu61c4RCN3zrv3h3YaJNr90EJnMjkZo
	 aHdADYeHLmmXT7udsyckbTd7mu+U0eG2PcIIxShay3KQSO4164knfI4dXyPGjq2b30
	 2o5SJ0uhLSZT48mDBq3rFVR5SLxmIF9sEDuteez1KeCoMslTLcY9fPYDRywqjpUvYs
	 +ciN6J8rTYj7aNYzaVH2r+pa1nZ6n0Z5Per8V/P8APGIDCyXm6P6k9pYxcNRzmVmLH
	 yuKPy4YThKPPHSYAzHmUeq3ClaCbR5lBsdxLu0t+pD9ziSI0abVc6bJfEoh67duE3i
	 vtpIyfSC5rP5g==
Date: Mon, 4 Dec 2023 15:19:12 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, bertrand.marquis@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [XEN PATCH 7/7] xen/page_alloc: deviate first_valid_mfn for
 MISRA C Rule 8.4
In-Reply-To: <67299896-49cb-4d71-aa93-71a2f18b2d0e@xen.org>
Message-ID: <alpine.DEB.2.22.394.2312041518460.110490@ubuntu-linux-20-04-desktop>
References: <cover.1701270983.git.nicola.vetrini@bugseng.com> <1ee69d2f0b9e9a704bf869e2b2700f88a8069343.1701270983.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2311301847300.110490@ubuntu-linux-20-04-desktop> <21956d5b-08ad-45ac-96ff-22fe7d54ec60@suse.com>
 <alpine.DEB.2.22.394.2312011901450.110490@ubuntu-linux-20-04-desktop> <67299896-49cb-4d71-aa93-71a2f18b2d0e@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 2 Dec 2023, Julien Grall wrote:
> Hi,
> 
> On 02/12/2023 04:03, Stefano Stabellini wrote:
> > On Fri, 1 Dec 2023, Jan Beulich wrote:
> > > On 01.12.2023 03:47, Stefano Stabellini wrote:
> > > > On Wed, 29 Nov 2023, Nicola Vetrini wrote:
> > > > > No functional change.
> > > > > 
> > > > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > > > ---
> > > > > The preferred way to deviate is to use asmlinkage, but this
> > > > > modification is only
> > > > > the consequence of NUMA on ARM (and possibly PPC) being a work in
> > > > > progress.
> > > > > As stated in the comment above the textual deviation, first_valid_mfn
> > > > > will
> > > > > likely then become static and there would be no need for the comment
> > > > > anymore.
> > > > > This works towards having the analysis for this rule clean (i.e. no
> > > > > violations);
> > > > > the interest in having a clean rule is that then it could be used to
> > > > > signal
> > > > > newly introduced violations by making the analysis job fail.
> > > > 
> > > > Please add this text as part of the commit message. It can be done on
> > > > commit.
> > > 
> > > I assume you saw my reply on another of the patches in this series as to
> > > asmlinkage use on variables? IOW I think this paragraph would also need
> > > adjustment to account for that.
> > 
> > I was going to ask you about that: reading your reply
> > https://marc.info/?l=xen-devel&m=170142048615336 it is not clear to me
> > what you are asking or suggesting as next step in regard to asmlinkage
> > use on variables.
> 
> Regardless what Jan wrote there, I think it would be an abuse to add
> asmlinkage for first_valid_mfn because it is not used by assembly code.
> 
> The same goes for the use of SAF-1-safe. This is defined as:
> 
> "Functions and variables used only by asm modules do not need to have a
> visible declaration prior to their definition."
> 
> Now, regarding the violation itself. AFAIU, this would be a violation only on
> x86 because Arm, PPC, RISC-V will all need the declaration as NUMA is not
> supported. For Arm, we may have NUMA support soon, but I doubt this will
> happen in the next couple of years for the others.
> 
> Furthermore, I am sure this is not the only exported variable/function which
> may be used by some archictectures but not others. So I think it would be
> better to declare first_valid_mfn in a common header.

That is true

