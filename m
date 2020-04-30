Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AC01BF7CC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 14:04:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU7v2-0006y4-88; Thu, 30 Apr 2020 12:03:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BIwo=6O=kernel.org=ardb@srs-us1.protection.inumbo.net>)
 id 1jU7ZG-000584-0k
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 11:41:26 +0000
X-Inumbo-ID: 8558e80e-8ad7-11ea-9a2a-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8558e80e-8ad7-11ea-9a2a-12813bfff9fa;
 Thu, 30 Apr 2020 11:41:25 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71CD12076D
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2020 11:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588246884;
 bh=94Cb00cw2YL1QH1+9zuA6LjdU8ZZLvi1vRLitBmfivU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SKBAEyU6gDyezLNM9/YPnha9O7uf7VffoUJaCimYnXWaqr0lJVR4jsXW+sKQp8cmI
 Upj5GDoxafdLiHlr2xF6Kwu1SWuzL3Vj7Mfz3rSmD8jeKSfdh88ahHgbptiNjcbVHJ
 BQKtk3D6grKqHyFpCXK9Sy3ubIg4CnqSF5DmrL2I=
Received: by mail-io1-f47.google.com with SMTP id u11so1091878iow.4
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2020 04:41:24 -0700 (PDT)
X-Gm-Message-State: AGi0PuatvH9nBjPXOZN3jRJV+hksx3aZkqVfJ5NAlH+RA/1rbm6DLqg4
 njPuc1yOGwqnp9nRGvbAVKstNAVo0MCIED+gDoE=
X-Google-Smtp-Source: APiQypIIb8uy4dJ9kuhxCA8nd1ZpGi0t7TUZDtJTwcqSdv1SIbIj17IjDVxzeTtyg/8lb0xjHYR0lmTAyIEiPPHVWX0=
X-Received: by 2002:a02:969a:: with SMTP id w26mr1266527jai.71.1588246883795; 
 Thu, 30 Apr 2020 04:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200429225108.GA54201@bobbye-pc>
 <ebdd7b4a-767b-1b72-a344-78b190f42ceb@suse.com>
 <20200430111501.336wte64pwsfptze@tomti.i.net-space.pl>
In-Reply-To: <20200430111501.336wte64pwsfptze@tomti.i.net-space.pl>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 30 Apr 2020 13:41:12 +0200
X-Gmail-Original-Message-ID: <CAMj1kXF1vRtqbGS-eptB682h1xJ8LYQi74YaTZgM1nyYcpFsYA@mail.gmail.com>
Message-ID: <CAMj1kXF1vRtqbGS-eptB682h1xJ8LYQi74YaTZgM1nyYcpFsYA@mail.gmail.com>
Subject: Re: [RFC] UEFI Secure Boot on Xen Hosts
To: Daniel Kiper <daniel.kiper@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 30 Apr 2020 12:03:54 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: michal.zygowski@3mdeb.com, Bobby Eshleman <bobbyeshleman@gmail.com>,
 olivier.lambert@vates.fr, krystian.hebel@3mdeb.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 piotr.krol@3mdeb.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 30 Apr 2020 at 13:15, Daniel Kiper <daniel.kiper@oracle.com> wrote:
>
> Adding Ard...
>
> On Thu, Apr 30, 2020 at 09:01:45AM +0200, Jan Beulich wrote:
> > On 30.04.2020 00:51, Bobby Eshleman wrote:
> > > Hey all,
> > >
> > > We're looking to develop UEFI Secure Boot support for grub-loaded Xen and
> > > ultimately for XCP-ng (I'm on the XCP-ng team at Vates).
> > >
> > > In addition to carrying the chain-of-trust through the entire boot sequence
> > > into dom0, we would also like to build something akin to Linux's Lockdown for
> > > dom0 and its privileged interfaces.
> > >
> > > It appears that there are various options and we'd like to discuss them with
> > > the community.
> > >
> > > # Option #1: PE/COFF and Shim
> > >
> > > Shim installs a verification protocol available to subsequent programs via EFI
> > > boot services.  The protocol is called SHIM_LOCK and it is currently supported
> > > by xen.efi.
> > >
> > > Shim requires the payload under verification to be a PE/COFF executable.  In
> > > order to support both shim and maintain the multiboot2 protocol, Daniel Kiper's
> > > patchset [1]  (among other things) incorporates the PE/COFF header
> > > into xen.gz and adds dom0 verification via SHIM_LOCK in
> > > efi_multiboot2().
> > >
> > > There appears that some work will be needed on top of this patchset, but not
> > > much as it seems most of the foot work has been done.
> > >
> > > AFAIK, the changes needed in GRUB for this approach are already upstream (the
> > > shim_lock module is upstream), and shim would go untouched.
> > >
> > > # Option #2: Extended Multiboot2 and Shim
> > >
> > > Another approach that could be taken is to embed Xen's signature into a
> > > new multiboot2 header and then modify shim to support it.  This would
> > > arguably be more readable than embedding the PE/COFF header, would add
> > > value to shim, and would fit nicely with the mb2 header code that
> > > already exists in Xen.  The downside being that it would require a shim
> > > fork.  Grub2 would be unchanged.
>
> Here you have to change the Multiboot2 protocol and singing tools too.
> So, I do not consider this as a viable solution.
>
> > > I'm not familliar with Microsoft's signing process.  I do know they
> > > support template submissions based on shim, and I'm not sure if such a
> > > big change would impact their approval process.
> > >
> > > # Option #3: Lean on Grub2's LoadFile2() Verification
> > >
> > > Grub2 will provide a LoadFile2() method to subsequent programs that supports
> > > signature verification of arbitrary files.  Linux is moving in the
> > > direction of using LoadFile2() for loading the initrd [2], and Grub2 will
> > > support verifying the signatures of files loaded via LoadFile2().  This is set
> > > for release in GRUB 2.06 sometime in the latter half of 2020.
>
> s/for release in/after release/
>
> > > In Xen, this approach could be used for loading dom0 as well, offering a very
> > > simple verified load interface.
> > >
> > > Currently the initrd argument passed from Linux to LoadFile2() is a vendor
> > > media device path GUID [3].
> > >
> > > Changes to Xen:
> > > - Xen would need to pass these device paths to Grub
> > > - Xen would be changed to load dom0 with the LoadFile2() interface via boot services
> > >
> > > Changes to Grub:
> > > - Xen dom0 kernel/initrd device paths would need to be introduced to Grub
>
> Maybe partially but certainly there will be some differences...
>
> > > Potential Issues:
> > > - How will Xen handle more boot modules than just a dom0 and dom0
> > >   initrd?
> > > - Would each boot module need a unique vendor guid?
>
> AIUI yes but Ard, who designed this new boot protocol, may say more
> about that.
>
> Anyway, the advantage of this new protocol is that it uses UEFI API to
> load and execute PE kernel and its modules. This means that it will be
> architecture independent. However, IIRC, if we want to add new modules
> types to the Xen then we have to teach all bootloaders in the wild about
> new GUIDs. Ard, am I correct?
>

Well, if you are passing multiple files that are not interchangeable,
each bootloader will need to do something, right? It could be another
GUID, or we could extend the initrd media device path to take
discriminators.

So today, we have

VendorMedia(5568e427-68fc-4f3d-ac74-ca555231cc68)

which identifies /the/ initrd on Linux. As long as this keeps working
as intended, I have no objections extending this to

VendorMedia(5568e427-68fc-4f3d-ac74-ca555231cc68)/File(...)

etc, if we can agree that omitting the File() part means the unnamed
initrd, and that L"initrd" is reserved as a file name. That way, you
can choose any abstract file name you want, but please note that the
loader still needs to provide some kind of mapping of how these
abstract file names relate to actual files selected by the user.

One thing to keep in mind, though, is that this protocol goes away
after ExitBootServices().



> > > - Would this interfere with the DomB proposal?  I suspect not because
> > >   the DomB proposal suggests launching DomUs from an already booted
> > >   DomB, at which point other means could be used.
> > >
> > > We'd just like to get the conversation going on this topic before we
> > > dive too far into implementing something.  Are any of these approaches a
> > > hard no for upstreaming?  Do any stand out as best candidates?  Any
> > > feedback / questions / criticisms would be greatly appreciated.
> >
> > A shim fork doesn't look desirable, which would rule out #2 unless there
> > is an option there to avoid the fork.
> >
> > If the potential issues listed for #3 can be suitably addressed, I can't
> > currently see a reason to prefer either of the two remaining options; I
> > vaguely recall though that Daniel's change for #1 didn't look overly
> > appealing, but perhaps this can be taken care of.
>
> Daniel

