Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 376C69ECD9F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 14:46:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854822.1267925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLN2p-00037x-5T; Wed, 11 Dec 2024 13:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854822.1267925; Wed, 11 Dec 2024 13:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLN2p-00036S-1r; Wed, 11 Dec 2024 13:46:27 +0000
Received: by outflank-mailman (input) for mailman id 854822;
 Wed, 11 Dec 2024 13:46:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z/jY=TE=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1tLN2m-00036B-Ru
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 13:46:25 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ea288f0-b7c6-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 14:46:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5C369A420DF;
 Wed, 11 Dec 2024 13:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15CFC4CED2;
 Wed, 11 Dec 2024 13:46:20 +0000 (UTC)
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
X-Inumbo-ID: 4ea288f0-b7c6-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733924781;
	bh=HWXtI3f+E3Tiyx/D2Axaq2OXYBsQB19LK8Y6k/NMFa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GNzfBd674DDIOAg5OzFCuPFaVwl6fbNgxNIu1CkZanOXGwI+NrhDOXBsHHeBPkeTt
	 UrNtTMANfXbCfoJE2TQTtQHOA9Oan73/P823xcRHVCqUJjbwBCE3R/+oipXBUom/gA
	 +wKAaoiJkQqd627paFrzhARWOUajZ4uSAjbZC84c=
Date: Wed, 11 Dec 2024 14:46:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	=?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	regressions@lists.linux.dev,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [REGRESSION] Linux 6.6.64 crashes when booting as PVH domU
Message-ID: <2024121144-false-playtime-968e@gregkh>
References: <Z1l6XbHP6BTTZSwr@mail-itl>
 <fe8db5b2-7524-49ea-ab8e-21f831dc009f@suse.com>
 <CAMj1kXHSiCo7FH0Mo-_R9HjxhthddPUZfgm5c8yj7vjGvgfTPg@mail.gmail.com>
 <Z1mF0UZPNLjYAJI7@mail-itl>
 <CAMj1kXFVd+2n1fRoOriwmAPH8yX22gSy7_m_1SVjtoG3r_=-Tw@mail.gmail.com>
 <Z1mWFcm_036BrvEq@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1mWFcm_036BrvEq@mail-itl>

On Wed, Dec 11, 2024 at 02:39:33PM +0100, Marek Marczykowski-Górecki wrote:
> On Wed, Dec 11, 2024 at 01:37:52PM +0100, Ard Biesheuvel wrote:
> > (cc Greg)
> > 
> > On Wed, 11 Dec 2024 at 13:30, Marek Marczykowski-Górecki
> > <marmarek@invisiblethingslab.com> wrote:
> > >
> > > On Wed, Dec 11, 2024 at 01:24:08PM +0100, Ard Biesheuvel wrote:
> > > > On Wed, 11 Dec 2024 at 12:53, Jürgen Groß <jgross@suse.com> wrote:
> > > > >
> > > > > Jason, Ard,
> > > > >
> > > > > I guess there are some prereq patches missing in stable 6.6.y branch?
> > > > >
> > > > >
> > > > > Juergen
> > > > >
> > > > > On 11.12.24 12:41, Marek Marczykowski-Górecki wrote:
> > > > > > Hi,
> > > > > >
> > > > > > With Linux 6.6.64 I get the following crash on domU boot:
> > > > > >
> > > > > > (XEN) d5v0 Triple fault - invoking HVM shutdown action 1
> > > > > > (XEN) *** Dumping Dom5 vcpu#0 state: ***
> > > > > > (XEN) ----[ Xen-4.19.0  x86_64  debug=n  Tainted:  M     ]----
> > ...
> > > > > >
> > > > > > Linux 6.6.63 works fine.
> > > > > >
> > > > > > Looking at the changes, I suspect one of those:
> > > > > >
> > > > > >      83d123e27623 x86/pvh: Call C code via the kernel virtual mapping
> > > > > >      f662b4a69e1d x86/pvh: Set phys_base when calling xen_prepare_pvh()
> > > > > >
> > > >
> > > > The second patch shouldn't have been backported. It is unnecessary,
> > > > given that in the old situation, the kernel image needs to be loaded
> > > > at a fixed address. And it assumes  that %rbp is set to the physical
> > > > load offset, but those patches were not backported.
> > >
> > > It has this tag:
> > >
> > >     Stable-dep-of: e8fbc0d9cab6 ("x86/pvh: Call C code via the kernel virtual mapping")
> > >
> > 
> > That was added by the stable maintainers - someone grabbed a patch
> > from the middle of an unrelated series to make e8fbc0d9cab6 apply
> > without lexical conflicts.
> > 
> > > Does it mean neither of them should be backported?
> > >
> > > But then, the e8fbc0d9cab6 has "Fixes:" tag (pointing at very old
> > > commit).
> > >
> > 
> > If someone thinks e8fbc0d9cab6 should be backported, they should
> > rebase it onto v6.6.y, not backport random other patches until
> > git-apply stops complaining. And ideally, someone would build and boot
> > the result to check whether it works.
> > 
> > For now, it would be better to revert both.
> 
> I can confirm that reverting both commits fixes the issue.

Ok, thanks, let me go rip all of these out and do a new release now to
fix the issue.  Sorry about that, and thanks so much for the testing and
letting us know!

greg k-h

