Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2F87E876F
	for <lists+xen-devel@lfdr.de>; Sat, 11 Nov 2023 02:24:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630853.984020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1cj2-0000wA-3L; Sat, 11 Nov 2023 01:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630853.984020; Sat, 11 Nov 2023 01:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1cj2-0000tu-0l; Sat, 11 Nov 2023 01:23:52 +0000
Received: by outflank-mailman (input) for mailman id 630853;
 Sat, 11 Nov 2023 01:23:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mrjv=GY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r1cj0-0000tn-F9
 for xen-devel@lists.xenproject.org; Sat, 11 Nov 2023 01:23:50 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5fc1d27-8030-11ee-98da-6d05b1d4d9a1;
 Sat, 11 Nov 2023 02:23:48 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1B769CE1712;
 Sat, 11 Nov 2023 01:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50BCEC433C8;
 Sat, 11 Nov 2023 01:23:39 +0000 (UTC)
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
X-Inumbo-ID: f5fc1d27-8030-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699665820;
	bh=r7KKMfeOi+/NW7ECYa23LukpsKR+JX21zTZ203uYrdQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GqRhhjXx6x/sKUXg/pGKZN19I3SfTdDUeEG8a5gvOgg7a42QSg3UvBugzmBRcn7mm
	 2tF4mPYc1ptWNYVxOw10lqOMh9HYAxWWJYwdzG9U6r8FcCRWluGJ+Y/I64hNPtIIdW
	 UqZ90lgSh0ZAczNVFGvoIvilbX7NZtn4H8xkXwgGP4vpE7roxrqOOBKnJaN+F6Q1Bp
	 Ds2q/S6NxBmhha3Q/WnVl3GP9SjRFdLD/OBpI4HrgUMw+4KpSw4YWqcSeJfM4DGv3c
	 /plTJZMZ1h/DWDkZBytfP/0qQWDFMts9OEQV5cQTBhrnQoFnWXs0qjTqkn7ZaT25zG
	 39CBPjSS/RX9A==
Date: Fri, 10 Nov 2023 17:23:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [RFC 1/4] x86/ioemul: address MISRA C:2012 Rule 9.3
In-Reply-To: <9888aa5c298584c22cf55b13befeaaa6@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311101719120.3478774@ubuntu-linux-20-04-desktop>
References: <cover.1698155925.git.nicola.vetrini@bugseng.com> <76c9f78179a8bb5b4f99b34f163933394f79066c.1698155925.git.nicola.vetrini@bugseng.com> <60e26ad6-7366-2604-e9b2-ed401cee6e73@suse.com> <alpine.DEB.2.22.394.2310241317030.271731@ubuntu-linux-20-04-desktop>
 <41562c7a-6260-3104-b2d4-d6fd4df0cffc@suse.com> <4e88d7ab94b9fc73554eee5b78612b63@bugseng.com> <8cb336ca-41ed-8adc-957a-28b5585c84f1@suse.com> <alpine.DEB.2.22.394.2310271419260.271731@ubuntu-linux-20-04-desktop>
 <9888aa5c298584c22cf55b13befeaaa6@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 Nov 2023, Nicola Vetrini wrote:
> > > > There's also this functionally equivalent alternative, with or without
> > > > the zeros, which
> > > > doesn't incur in the risk of mistakenly attempting to initialize the
> > > > same element twice,
> > > > while also giving an explicit cue to the reader that all elements are
> > > > truly zero-initialized.
> > > >
> > > >           .matches = {
> > > >               DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> > > >               DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL5"),
> > > > +            {0}, {0}
> > > >           },
> > > 
> > > Adding a dependency on the array actually having 4 elements (while iirc
> > > we have seen already that we could in principle go down to 3). A change
> > > of this number would then require touching all these sites, which is
> > > what we'd like to avoid.
> > 
> > How often the array needs to change though? Looking at the git history
> > it doesn't seem the number of elements ever changed. So I think it is a
> > good tradeoff, and I would go with this type of fix (maybe also at the
> > other locations mechanically too although I haven't looked at them in
> > details).
> 
> Hi, any updates on this? Considering the opinions expressed above, what would
> be the path preferred by the community?

Hi Jan, to bring this discussion to a conclusion, I think we have these
options:

1) fix these violations by adding {}, {}
2) fix these violations by adding [0]=xxx,[1]=xxx
3) deviate these violations by adding /* SAF-safe-xxx */
4) remove the MISRA rule 9.3 from docs/misra/rules.rst

Let's make a decision. My preference is 1) as we only have ~50
violations.

