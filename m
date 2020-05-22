Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839501DE812
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 15:32:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc7lU-0005i8-IC; Fri, 22 May 2020 13:31:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mwuj=7E=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jc7lS-0005hz-UA
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 13:31:06 +0000
X-Inumbo-ID: 7ccf5000-9c30-11ea-b07b-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ccf5000-9c30-11ea-b07b-bc764e2007e4;
 Fri, 22 May 2020 13:31:06 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q2so12593564ljm.10
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2020 06:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ak1+Sq274vtepf4F/AMOKn+/SUcTSsWehkImMnDWeMg=;
 b=jKgF7CQcaAjDQDVOHthIQ3XotjTb0RDq7FMZ8hkoFVphja0cVBOQAcG6DeZ8tmWkUB
 eqYcZ1ypAK/GMY7ZMmHIEcwvJxEOhk5lQS2thb4Oc0MaFhdtVjo6ubZ8QmblgfjghmI/
 4E7OTkrq2NAY94p2UwBhKXZL/uRNC6ku6yx/mLyPvGv69QM7lR+uQjIyFPfrEfQXbTxm
 zOWQdFHQRiinT2wGHEJvVdwrwzKb3zmOQb+VI0k42e2Mn4o+NiuT71LJO9RA9y+yYE7r
 oXrzCY9HOFdiFXAM+I2sn8R+m7Tv0iqBZvvWA71lhhkvS/ZwGjW9m1CTfJWQx/MmKAU4
 LKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ak1+Sq274vtepf4F/AMOKn+/SUcTSsWehkImMnDWeMg=;
 b=ao4Rp/06dKszFzCABijCH8SUYA8uzV5aHWg4kTRkF2EoeVDOIiZCnHlyQbuG0ivnvL
 EKRI5we9d/QRi+vPYPGddvINqiKbNPg0MMtu6jE5IkIkOFrW93LG3jAFMg31pKC2/xJ+
 PSMrLwmmILYyQr6Mc7N8i+rcbVlmQaZn25V+QYmTvLI3vXK39fdjRQzz4yo3EqsYhCf/
 k8j3QU4Fu6LJSC3SM3vzvCZOBFn4UfX9DLIm87EpPFIZfqsua1m7eFq3NugZULUYBb7o
 +Xcmqh5e9p30i/CVaDXaCRzQsvXDWGUhsw6gcxUttYn6/PJ8KUsPFOv8e+JlwMc1rYip
 SRPQ==
X-Gm-Message-State: AOAM532U55hriMBoDNNpD/3kh1AucgK/JeXx0SFEkosk6FHtOWwikbP2
 kiBcA9MGmJX5rptZkk5v/ZyoRqMBPljmeddDfO8=
X-Google-Smtp-Source: ABdhPJwgaQ/wOSeT5ZTxq4/k1vLcj0qJp4eugiaAjpOEkGHNl9iHrkTNb6GbRJZzueZHfr3F2rAfXc+wfjf9fOfzCZY=
X-Received: by 2002:a2e:b0e7:: with SMTP id h7mr6640951ljl.196.1590154264938; 
 Fri, 22 May 2020 06:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200519015503.115236-1-jandryuk@gmail.com>
 <4510049C-2AD1-4AE4-B0E5-F4231450EDB6@citrix.com>
 <001301d6301f$0b546cd0$21fd4670$@xen.org>
In-Reply-To: <001301d6301f$0b546cd0$21fd4670$@xen.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 22 May 2020 09:30:53 -0400
Message-ID: <CAKf6xptVdXnoU0QVoS6bS_DUS8SkN6Jt2ueGJ0vhX8+SyFLt2g@mail.gmail.com>
Subject: Re: [PATCH v7 00/19] Add support for qemu-xen runnning in a
 Linux-based stubdomain
To: Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 22, 2020 at 5:54 AM Paul Durrant <xadimgnik@gmail.com> wrote:
>
> > -----Original Message-----
> > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of G=
eorge Dunlap
> > Sent: 22 May 2020 10:11
> > To: Jason Andryuk <jandryuk@gmail.com>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>; Julien Grall <julien@x=
en.org>; Samuel Thibault
> > <samuel.thibault@ens-lyon.org>; Wei Liu <wl@xen.org>; Andrew Cooper <An=
drew.Cooper3@citrix.com>; Jan
> > Beulich <jbeulich@suse.com>; Ian Jackson <Ian.Jackson@citrix.com>; Anth=
ony Perard
> > <anthony.perard@citrix.com>; xen-devel <xen-devel@lists.xenproject.org>=
; Daniel De Graaf
> > <dgdegra@tycho.nsa.gov>
> > Subject: Re: [PATCH v7 00/19] Add support for qemu-xen runnning in a Li=
nux-based stubdomain
> >
> >
> > > On May 19, 2020, at 2:54 AM, Jason Andryuk <jandryuk@gmail.com> wrote=
:
> > >
> > > General idea is to allow freely set device_model_version and
> > > device_model_stubdomain_override and choose the right options based o=
n this
> > > choice.  Also, allow to specific path to stubdomain kernel/ramdisk, f=
or greater
> > > flexibility.
> >
> > Excited to see this patch series get in.  But I didn=E2=80=99t really n=
otice any documents explaining how to
> > actually use it =E2=80=94 is there a blog post anywhere describing how =
to get the kernel / initrd image and so
> > on?

Yeah, it's not really collected anywhere, but below are the quick
start instructions.

The cover letter mentioned this repo (forked from Marek's):
https://github.com/jandryuk/qubes-vmm-xen-stubdom-linux
   (branch initramfs-tools, tag for-upstream-v6)

clone it and then run:
$ make get-sources
$ make -f Makefile.stubdom

output:
kernel: build/linux/arch/x86/boot/bzImage
ramdisk: build/rootfs/stubdom-linux-rootfs

To make them available system wide, copy to
/usr/lib/xen/boot/qemu-stubdom-linux-kernel and
/usr/lib/xen/boot/qemu-stubdom-linux-rootfs respectively. Obviously
this should match your installation's "$lib/xen/boot/" location.

A second option is to set paths to those files manually in a VM's
xl.cfg with stubdomain_kernel=3D"/path" and stubdomain_ramdisk=3D"/path"

Update your xl configuration with:
device_model_stubdomain_override =3D 1
device_model_version =3D "qemu-xen"

Start the domain and that should be it.   Maybe additionally use
serial =3D "pty" to access the VM with `xl console -t serial $NAME`.

Some limitations are here:
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Ddocs/misc/stubdom.=
txt;h=3Dc717a95d17d2e562639a5574e89df3c4db8712fa;hb=3DHEAD#l124
Limitations:
 - PCI passthrough require permissive mode
 - only one nic is supported
 - at most 26 emulated disks are supported (more are still available
as PV disks)
 - graphics output (VNC/SDL/Spice) not supported

> > Also, would it be possible to add a follow-up series which modifies SUP=
PORT.md and CHANGELOG.md?
>
> Yes please. In future I think we should encourage the patch to CHANGELOG.=
md to be the last patch of a series such as this.

I can do this.  What is the SUPPORT status for this?

Regards,
Jason

