Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D68355F123A
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 21:12:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414407.658670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeLQA-0002Ik-8E; Fri, 30 Sep 2022 19:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414407.658670; Fri, 30 Sep 2022 19:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeLQA-0002G6-5F; Fri, 30 Sep 2022 19:11:38 +0000
Received: by outflank-mailman (input) for mailman id 414407;
 Fri, 30 Sep 2022 19:11:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VUOy=2B=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1oeLQ8-0002G0-Fh
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 19:11:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2f3cb5b-40f3-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 21:11:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C1F216242D
 for <xen-devel@lists.xenproject.org>; Fri, 30 Sep 2022 19:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32CDEC43140
 for <xen-devel@lists.xenproject.org>; Fri, 30 Sep 2022 19:11:33 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 10so8286652lfy.5
 for <xen-devel@lists.xenproject.org>; Fri, 30 Sep 2022 12:11:33 -0700 (PDT)
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
X-Inumbo-ID: b2f3cb5b-40f3-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664565093;
	bh=DpuzkSTpdIljztqf44fhe5W4QnPtXnDJDl0MM448ZSA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Yu+WvHfHfGIDERp3rGJw/Xo+T7KR5JXnWliHX2BfVnsPYHNj9dYu9HWaA8emZRFzp
	 WP2RZn3PxpJhCTr/rEvWhDjqSXHIsIszDxu/yDsxYzD+0N1IHgI4eIZ9MvkFBQHPmw
	 DEda+6g0QFLgSxla7ZBIuEgqIHZ3G5tVBO/ydJ9ZzXhMZKMNnkLAoi9NAYAItVLmZH
	 1Yr/20aKScBzpbJjOs1KLfcHUcozKb5yCP0ZOwUPI7fEBY6fA26DkQ6lEoAdZ+Kr8k
	 BkyW4HJA1QtT6HOZXiOXBK8dcomZS9euTg8oRwOdsPMIEd+ryFFcAcebZBOPkeHLKJ
	 vR4dng0BTd5yg==
X-Gm-Message-State: ACrzQf3fGSe/qKvSKRuNDai17ju3DTgpyROd4VSNMVi9LMMAWr9QCaCP
	QDPh3e73qyubNuIJ8EFs4geFCOpHjGuRr/4Ik1U=
X-Google-Smtp-Source: AMsMyM6FMMowE7tQWhR4Sq9LW0sZJqpKjwTPTYH1uPBheNCSsYgu+96uM6IHl9lGbwAD0/no5/Q6kEg0CtZpAWItDo4=
X-Received: by 2002:a05:6512:c0f:b0:49b:1e8c:59fd with SMTP id
 z15-20020a0565120c0f00b0049b1e8c59fdmr3582078lfu.426.1664565091147; Fri, 30
 Sep 2022 12:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664298147.git.demi@invisiblethingslab.com>
 <5649176eacda434267f68676f1733d06c572d19e.1664298147.git.demi@invisiblethingslab.com>
 <CAMj1kXEs-o8jvNqRiW+Ue2i52RBgg4iktg8UONCACk8-Gx4XXA@mail.gmail.com> <YzczpIYop5olD4hj@itl-email>
In-Reply-To: <YzczpIYop5olD4hj@itl-email>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 30 Sep 2022 21:11:19 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHGPzy9T1LcE8LX+woGtUGTzrDgbjDBJabJ+bwDVPbTag@mail.gmail.com>
Message-ID: <CAMj1kXHGPzy9T1LcE8LX+woGtUGTzrDgbjDBJabJ+bwDVPbTag@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] Support ESRT in Xen dom0
To: Demi Marie Obenour <demi@invisiblethingslab.com>, Peter Jones <pjones@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Kees Cook <keescook@chromium.org>, 
	Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Sept 2022 at 20:21, Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
>
> On Fri, Sep 30, 2022 at 06:36:11PM +0200, Ard Biesheuvel wrote:
> > On Fri, 30 Sept 2022 at 01:02, Demi Marie Obenour
> > <demi@invisiblethingslab.com> wrote:
> > >
> > > fwupd requires access to the EFI System Resource Table (ESRT) to
> > > discover which firmware can be updated by the OS.  Currently, Linux does
> > > not expose the ESRT when running as a Xen dom0.  Therefore, it is not
> > > possible to use fwupd in a Xen dom0, which is a serious problem for e.g.
> > > Qubes OS.
> > >
> > > Before Xen 4.17, this was not fixable due to hypervisor limitations.
> > > The UEFI specification requires the ESRT to be in EfiBootServicesData
> > > memory, which Xen will use for whatever purposes it likes.  Therefore,
> > > Linux cannot safely access the ESRT, as Xen may have overwritten it.
> > >
> > > Starting with Xen 4.17, Xen checks if the ESRT is in EfiBootServicesData
> > > or EfiRuntimeServicesData memory.  If the ESRT is in EfiBootServicesData
> > > memory, Xen replaces the ESRT with a copy in memory that it has
> > > reserved.  Such memory is currently of type EFI_RUNTIME_SERVICES_DATA,
> > > but in the future it will be of type EFI_ACPI_RECLAIM_MEMORY.  This
> > > ensures that the ESRT can safely be accessed by the OS.
> > >
> > > When running as a Xen dom0, use the new
> > > xen_config_table_memory_region_max() function to determine if Xen has
> > > reserved the ESRT and, if so, find the end of the memory region
> > > containing it.  This allows programs such as fwupd which require the
> > > ESRT to run under Xen, and so makes fwupd support in Qubes OS possible.
> > >
> > > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> >
> > Why do we need this patch? I'd expect esrt_table_exists() to return
> > false when patch 1/2 is applied.
>
> efi_enabled(EFI_MEMMAP) is false under Xen, so there needs to be an
> alternative way to get the end of the memory region containing the ESRT.
> That is what this patch provides.

OK. I don't think we need that to be honest. When running under Xen,
we should be able to assume that the ESRT does not span multiple
memory regions arbitrarily, so we can just omit this check if
!efi_enabled(EFI_MEMMAP)

IIRC (and Peter would know), we are trying to filter out descriptors
that are completely bogus here: zero lenght, zero address, etc etc. I
don't think we need that for Xen.

