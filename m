Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4272689DB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 13:19:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHmW1-0002K3-LW; Mon, 14 Sep 2020 11:19:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lZiK=CX=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kHmVz-0002Jy-VX
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 11:19:20 +0000
X-Inumbo-ID: 1ac60564-bbb6-46e6-8193-7c65d43ff894
Received: from mail-40133.protonmail.ch (unknown [185.70.40.133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ac60564-bbb6-46e6-8193-7c65d43ff894;
 Mon, 14 Sep 2020 11:19:17 +0000 (UTC)
Date: Mon, 14 Sep 2020 11:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1600082356;
 bh=J4rJQxLBx0CDPyGfZ9cXQriwiRA1q9eafZo5cdAo1oI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=dcrw0xRIuGOPoet0fSS5RFcpZ4cTc3j5lsX/tyo4zBtcyPnYhuqg0a16QE7d0bB7A
 +dLgXpVY3mhn2/DN2kRlDCj0YdLmPU2I0CPjrlIgYingQITc3GbnlgphiotRJhGxXv
 23RI6P5za049JDrkISaFtAA0o6I1xRtq7rKN96OI=
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 3/4] efi: Enable booting unified
 hypervisor/kernel/initrd images
Message-ID: <3anr6Udui7bFFb1CwaGT9tU_oq3rEh_DwgajzdD_hzmYsvfJX3WGAXUYRzGzBKdgdoxuEfSLM6O1ipl5EitDiRGkgT3vUI8WGzLWM9P2Qdg=@trmm.net>
In-Reply-To: <20200914100609.GC753@Air-de-Roger>
References: <20200907190027.669086-1-hudson@trmm.net>
 <20200907190027.669086-4-hudson@trmm.net> <20200914100609.GC753@Air-de-Roger>
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

On Monday, September 14, 2020 6:06 AM, Roger Pau Monn=C3=A9 <roger.pau@citr=
ix.com> wrote:
> On Mon, Sep 07, 2020 at 03:00:26PM -0400, Trammell Hudson wrote:
> > [...]
> > It is inspired by systemd-boot's unified kernel technique and borrows t=
he
> > function to locate PE sections from systemd's LGPL'ed code. During EFI
> > boot, Xen looks at its own loaded image to locate the PE sections for
> > the Xen configuration (`.config`), dom0 kernel (`.kernel`), dom0 initrd
> > (`.initrd`), and XSM config (`.xsm`), which are included after building
>
> Could we name this kernel_payload or maybe just payload instead of
> initrd?
>
> That's a Linux specific concept.

Perhaps "ramdisk" is better, since that is the name of the module in the
Xen config file?  That was what I used elsewhere (and messed up in the docs=
,
as you had noticed).

> [...]
> > -   --change-section-vma .initrd=3D0xffff82d042000000 \
>
> Why do you need to adjust the VMA, is this not set to a suitable
> default value?
>
> How can users find a suitable VMA value?

The default is to put the new sections at virtual address 0, which causes
load errors.  It seemed to be necessary to have it above the hypervisor
image, although I'm also borrowing that from the systemd-boot code.
I wish objcopy had an "--append-section" that would add after the last
section in the file...

An earlier version of the patch series had a shell script to do this proces=
s,
although it was not as general as people wanted, so it was dropped in favor=
 of
documenting how to build the images with objcopy.

> [...]
> > -   file->ptr =3D (void *)pe_find_section(image->ImageBase, image->Imag=
eSize,
>
> This already returns a void *, so there's no need for the cast.

It returns const void *, but file has a non-const pointer.  Perhaps files s=
hould
be immutable and that could be addressed in a const-correctness patch serie=
s.

The style guide issues will also be addressed in the v4 of the patch, to
be posted soon.

--
Trammell

