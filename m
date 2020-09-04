Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D84325E02C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 18:49:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEEtD-0000kt-3X; Fri, 04 Sep 2020 16:48:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YEB=CN=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kEEtB-0000ko-ML
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 16:48:37 +0000
X-Inumbo-ID: 42ef7789-e49d-490f-aa50-ca4fca4dc4c5
Received: from mail-40133.protonmail.ch (unknown [185.70.40.133])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42ef7789-e49d-490f-aa50-ca4fca4dc4c5;
 Fri, 04 Sep 2020 16:48:36 +0000 (UTC)
Date: Fri, 04 Sep 2020 16:48:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1599238114;
 bh=2V/xAQH8QxM9Bj+9JJFmyxvZHJy/nPmc7eqfltbln40=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=DDWdlpB/qij+EqTQwwH7phi0NKF46Ge/ILLiVnmI2cB0YurihOca9yEUM8f2hbgGT
 eFcdXVMX/pYyg0WnUgb5gKPwh2Mz6kxAeM1CX980NOpn+BHVPxgWjCDw+AMiT5UjUN
 otWgOZ8YmV/XzOD8kKq2YAb8y0I1As9rUdRhAS8g=
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] EFI: Enable booting unified hypervisor/kernel/initrd
 images
Message-ID: <2ilj0fgrgiQ2mlSeil5uuMfPGIOOw-IQCrVdB_BWde2paShrWOdD7GM3_2bLkLB_4k48zorwaYBcmQgoMc4D6T4ZgA3MZFiLH7E0q9-OZ3w=@trmm.net>
In-Reply-To: <20200904130225.GQ753@Air-de-Roger>
References: <EGZ7EZE5F-c5YJVD9p0TtccTz06ZsdMcL21-BcB64dk9V3x8eKrB3dSDsLbGL4peCaENcp55uRsnWUONZYvrRaQh0tToALcaHRr-QMYNsH0=@trmm.net>
 <20200904130225.GQ753@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Friday, September 4, 2020 9:02 AM, Roger Pau Monn=C3=A9 <roger.pau@citri=
x.com> wrote:
> On Fri, Aug 28, 2020 at 11:51:35AM +0000, Trammell Hudson wrote:
> >     diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> >     index 0273f79152..ba691b1890 100644
> >     --- a/xen/arch/x86/xen.lds.S
> >     +++ b/xen/arch/x86/xen.lds.S
> >     @@ -156,6 +156,7 @@ SECTIONS
> >     __note_gnu_build_id_end =3D .;
> >     } :note :text
> >     #elif defined(BUILD_ID_EFI)
> > -   . =3D ALIGN(32); /* workaround binutils section overlap bug */
>
> Is this a separate bugfix?
>
> That's the only change to the linker script, so is this bug somehow
> triggered by the new code additions this commit makes?
>
> It might also be nice to have some reference to the bug if possible,
> so that we know when the bug has been fixed and thus we can drop the
> workaround.

I've split this into a separate commit with links to the mailing list
discussion and bug fix applied to the binutils:
https://gitlab.com/xen-project/xen/-/merge_requests/4/diffs?commit_id=3Dacf=
d8f85de8954bb08b726419a680e7ba5aba499

As Jan pointed out, it doesn't directly affect the xen build process
since the xen.efi is the end-product, although it does prevent users
from making further changes to the executable (such as merging the
pieces into the unified image) without having a bleeding edge version
of binutils.

> > -          file->need_to_free =3D true;
>
> Don't you need to set need_to_free after AllocatePages has returned
> successfully?

Yes, I think so. I've fixed this in the gitlab PR.

> Also the error handling in read_file is horrible to follow IMO.

Yeah, I'm a fan of early-return error handling rather than the "what ?: wtf=
"
style, although I left it as is.

> [...]
> For future patches it might be helpful to split non-functional changes
> into a separate patch. For example the inclusion of display_file_info
> could be a pre-patch, and that would help reduce the size of the diff.

Things like display_file_info() were separate commits that ended squashed
during one of the merges as the patch was being reworked.  They could
probably be out if someone wanted to rebase it again.

> > -   return secboot =3D=3D 1 && setupmode =3D=3D 0;
>
> Does this need to be strictly 1, or any value !=3D 0?

We discussed this briefly here on xen-devel without any real conclusion;
the UEFI spec says that all other values are reserved. I'm not sure in prac=
tice
if any others ever show up.

> [...]
> I have to admit I know very little, but don't you need to verify the
> ramdisk also, like you verify the kernel? Or is the kernel the one
> that's supposed to verify it's ramdisk before using it?

With the unified image there is no need to do so; the xen.efi, config,
kernel, initrd, flash, and ucode are all signed as one file and the
shim protocol is not necessary.

For the non-unified case, well, that's what started me on this patch.
I was quite surprised that all of the Secure Boot support in Linux
distrbutions and Xen did not sign the initrd or command lines,
only the kernel image.  So, yes, it seems like it should be signed,
but that's not what the wider community decided to do.

> [...]
> > -   -   Derived from https://github.com/systemd/systemd/blob/master/src=
/boot/efi/pe.c
>
> Is it worth adding the commit that you used as the base for this file?

Done.  The code hasn't seen any updates in months, although it is worth not=
ing
where it came from.

> > +/*
> > -   -   The "Unified" kernel image can be generated by adding additiona=
l
> > -   -   sections to the Xen EFI executable with objcopy, similar to how
> > -   -   systemd-boot uses the stub to add them to the Linux kernel:
> [...]
>
> This must be in a doc somewhere, likely in misc/efi.pandoc? People
> trying to use such functionality shouldn't resort to reading a comment
> on a source file IMO.

Thanks for the location suggestion. I wasn't sure where to store it.
Moved the comment into there and markdown'ed it.

I think I've addressed all of the style guide issues that you and others
brought up in the latest version on the gitlab site:

https://gitlab.com/xen-project/xen/-/merge_requests/4

--
Trammell

