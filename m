Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D02F5BEADC
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 18:10:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409528.652501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oafp1-0000d5-Um; Tue, 20 Sep 2022 16:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409528.652501; Tue, 20 Sep 2022 16:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oafp1-0000Zv-Rd; Tue, 20 Sep 2022 16:10:07 +0000
Received: by outflank-mailman (input) for mailman id 409528;
 Tue, 20 Sep 2022 16:10:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mZ4K=ZX=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1oafp0-0000VN-GD
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 16:10:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afdcf945-38fe-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 18:10:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6D8961F7D
 for <xen-devel@lists.xenproject.org>; Tue, 20 Sep 2022 16:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A66C433D6
 for <xen-devel@lists.xenproject.org>; Tue, 20 Sep 2022 16:10:03 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id p5so3543262ljc.13
 for <xen-devel@lists.xenproject.org>; Tue, 20 Sep 2022 09:10:02 -0700 (PDT)
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
X-Inumbo-ID: afdcf945-38fe-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663690203;
	bh=ZNN6ncUcdAz2eSrp+5TLDtDbHWa6EBPbqOwU++0pIM8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dK+52DWq56dL/V2oG40eG/iPjZjgtnJnW0GukYXFh1UdHi3+77Kh4okbkDdGrGy5X
	 aitMWU6ubzNPzFXz3eM/ZgfJPP5cSdjHLAC9hmzCH+kilPt5yOHJ4WMHL6Zf52ksq7
	 6a6OwmDTD7hkUOhWYOs3AisgAz3OXwQ/bfiDmIhfB6INiCiyY4Wv0uwULl/C704Fzg
	 pc1Ga4/V6YIxD2EWDSXvV8BvQb3GY6qbBmRekTN6qPezGJ7nydgmzYVfHvw1fv9RBX
	 SYymNSal905z5SAhJKTBjFJfyRMbY/NT4rXB/MCvJ3kPrhttHpWOnT73bwGUie7HiN
	 Ijh5dQL7bbVqw==
X-Gm-Message-State: ACrzQf3XbamNQ64Gk/JyofYsb6ON+ObRUjxWXhC+amlJjHgcS+F3e8Ub
	53wVTCiBd9C2P90TOBp3E+lwzTuMqc3fwGrEgis=
X-Google-Smtp-Source: AMsMyM7dTMlqxXVyh1AyPoQQR0QTi9dh4SPvuXEYjqfXORBnB1Nu4cVXsu8mIVxRHgGU3ZkCf49okUpRMugykIZnXig=
X-Received: by 2002:a2e:7314:0:b0:26a:ca18:60eb with SMTP id
 o20-20020a2e7314000000b0026aca1860ebmr6723118ljc.69.1663690201047; Tue, 20
 Sep 2022 09:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220919193257.2031-1-demi@invisiblethingslab.com>
 <CAMj1kXEBfJUfTQ3THqqKxsU09_S98B_TjTECKwGM0WAv_5tZaA@mail.gmail.com> <7930b617-d473-94dd-c7e4-33ffa19da13e@suse.com>
In-Reply-To: <7930b617-d473-94dd-c7e4-33ffa19da13e@suse.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 20 Sep 2022 18:09:49 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEJ9d3-8xa7rkczY7ur2zDm9CjqM7u1eEdHHmPG=Oo=xA@mail.gmail.com>
Message-ID: <CAMj1kXEJ9d3-8xa7rkczY7ur2zDm9CjqM7u1eEdHHmPG=Oo=xA@mail.gmail.com>
Subject: Re: [PATCH v3] Support ESRT in Xen dom0
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Demi Marie Obenour <demi@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Sept 2022 at 17:54, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 20.09.2022 17:36, Ard Biesheuvel wrote:
> > On Mon, 19 Sept 2022 at 21:33, Demi Marie Obenour
> > <demi@invisiblethingslab.com> wrote:
> >>
> >> fwupd requires access to the EFI System Resource Table (ESRT) to
> >> discover which firmware can be updated by the OS.  Currently, Linux does
> >> not expose the ESRT when running as a Xen dom0.  Therefore, it is not
> >> possible to use fwupd in a Xen dom0, which is a serious problem for e.g.
> >> Qubes OS.
> >>
> >> Before Xen 4.16, this was not fixable due to hypervisor limitations.
> >> The UEFI specification requires the ESRT to be in EfiBootServicesData
> >> memory, which Xen will use for whatever purposes it likes.  Therefore,
> >> Linux cannot safely access the ESRT, as Xen may have overwritten it.
> >>
> >> Starting with Xen 4.17, Xen checks if the ESRT is in EfiBootServicesData
> >> or EfiRuntimeServicesData memory.  If the ESRT is in EfiBootServicesData
> >> memory, Xen allocates some memory of type EfiRuntimeServicesData, copies
> >> the ESRT to it, and finally replaces the ESRT pointer with a pointer to
> >> the copy.  Since Xen will not clobber EfiRuntimeServicesData memory,
> >> this ensures that the ESRT can safely be accessed by the OS.  It is safe
> >> to access the ESRT under Xen if, and only if, it is in memory of type
> >> EfiRuntimeServicesData.
> >>
> >
> > Thanks for the elaborate explanation. This is really helpful.
> >
> > So here, you are explaining that the only way for Xen to prevent
> > itself from potentially clobbering the ESRT is by creating a
> > completely new allocation?
>
> There are surely other ways, e.g. preserving BootServices* regions
> alongside RuntimeServices* ones. But as the maintainer of the EFI
> code in Xen I don't view this as a reasonable approach.
>

Why not?

> > What about other assets that may be passed
> > via EFI boot services data regions?
>
> These would need handling similarly then.
>
> > So first of all, EfiRuntimeServicesData has a special purpose: it is
> > used to carry data that is part of the EFI runtime service
> > implementations themselves. Therefore, it has to be mapped into the
> > EFI page tables by the OS kernel, and carved out of the linear map (to
> > prevent inadvertent access with mismatched attributes). So unless you
> > are writing the code that backs GetVariable() or SetVariable(), there
> > are never good reasons to use EfiRuntimeServicesData.
>
> That's a rather strict interpretation of the spec. Even back when
> I started dealing with EFI, when it was still quite new, I know
> RuntimeServices* was already used for similar purposes.
>

I'm not saying it is never used inappropriately. But using a memory
type that gets mapped into the runtime services page tables every time
a runtime service call is made is pointless, fragments both the EFI
page tables as well as the kernel direct map for no reason.

> > If you want to use a memory type that is suitable for firmware tables
> > that are intended for consumption by the OS only (and not by the
> > runtime services themselves), you might consider EfiAcpiReclaimMemory.
>
> Personally I consider this type less appropriate than the one we
> currently use. It's intended to be used by ACPI, which doesn't
> come into play here.

In spite of the name, that is not really true. It is reclaimable
memory, which means that the OS can use the memory as conventional
memory after consuming its contents, or discarding them.

> It comes quite close to using e.g.
> EfiUnusableMemory here ...

No, that is something completely different. Using unusable memory for
anything would be silly.

> We might be able to (ab)use
> EfiLoaderData for this, but that would again require special
> casing (inside Xen) when deciding whether the memory can be used
> as general-purpose memory.
>

EFI loader data and EFI boot services data are the exact same thing
from this POV. They have no significance to the runtime firmware, and
can be used as ordinary available memory after ExitBootServices().

> > TBH I still don't think this is a scalable approach. There are other
> > configuration tables that may be passed in EFI boot services memory,
> > and MS especially were pushing back in the UEFI forum on adding table
> > types that were passed in anything other the EfiBootServicesData.
>
> Within Xen we might abstract the approach currently implemented in
> case more such pieces of data appear.
>
> While I can easily believe MS might be advocating for this model,
> I view it as problematic not only for Xen. How would you pass on
> this information across kexec, for example, without introducing
> further producer-consumer dependencies requiring separate protocols
> to be followed?
>

In this case, I don't think this is unreasonable for configuration
tables, which only have a GUID and a base address. If the OS knows the
GUID, and knows how to interpret the contents, it can decide for
itself whether or not to preserve it. If it doesn't know the GUID, the
memory is just treated as available memory [after EBS()]

I personally think reclaimable memory is more suitable for these
cases, which is why I am willing to consider that as well. Note that
the EFI spec now also mandates device trees on ARM to be passed via
EfiAcpiReclaimMemory, simply because it is the memory type suitable
for firmware tables that only the OS consumes.

