Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5366AE97C5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 10:13:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026004.1401262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUhjM-0000rS-N6; Thu, 26 Jun 2025 08:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026004.1401262; Thu, 26 Jun 2025 08:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUhjM-0000oa-Jt; Thu, 26 Jun 2025 08:13:12 +0000
Received: by outflank-mailman (input) for mailman id 1026004;
 Thu, 26 Jun 2025 08:13:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kW9B=ZJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uUhjL-0000oU-63
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 08:13:11 +0000
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [2607:f8b0:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62c5eefa-5265-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 10:13:05 +0200 (CEST)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-40b1c099511so482530b6e.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 01:13:05 -0700 (PDT)
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
X-Inumbo-ID: 62c5eefa-5265-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750925584; x=1751530384; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9ZticWj5kAENHq8+uBatymybMIvM2nhg2Pt9//5kNE=;
        b=fyQC3dguEVWOvd526voLmGLNOkxsZR6orgU1kOQEOxJBwAcsdqfzMAuIENmMFUR+tP
         Fmk/jm8gxxlbQo6IResOq9bAz1aTh3pVzq/N0coiKY5KntQscdKsnGPQZ3pZ+Y0zj5iV
         Zc2GDC085eIqfeTj3gYTYqNbK6irQNUg2CFvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750925584; x=1751530384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9ZticWj5kAENHq8+uBatymybMIvM2nhg2Pt9//5kNE=;
        b=wXoW+EDJJVL7p0MHsKM8L6s9E6hI1C9h186bheRQqY6GdXtmG9NayiLUVzL86ceDGd
         nNASLJnBViTAbXRkXj5sgZOB2FxB0jvnI3zYZGwOrQ+4/TQVT3SP/GDxtzJS//3CcskN
         LqSxtdC3MzBR3rmogUDFiTiH8JWDv0q+ckEr9l9k+ER1WyY9xyGsEiBjQoGwuPHc82kr
         3/RuvikJWPGs2CdRg1M0EJOpTV7h9lwMrgCsYsmlWUaMGpxUV5cBmhTB7L9vmXOBjrt8
         Qd5RYmb6v0t95R1IMVzNGVZGxkrofgqH8w6r0iUUvpK09c3mStvdg/UCQqHhVUwefiN+
         mVcQ==
X-Gm-Message-State: AOJu0YyY76yg8w2JixPeGiVAmPUGYAUGg0msXk2V7IpzyWaLjDVa8fUa
	AgUuVhsfqJmN2GaAWBPWgZsvdT79fGFY47Z0BlA+O69S6MQkUHSrodWppfTBO5dDaqaqRmNE5L8
	nFIjA719GXUKxzz6u5qH55OeygP20YT2eh9y1FpLATEXDciNRBcdM02cP9Q==
X-Gm-Gg: ASbGncuQwq6vhU1A44g5miS5/XhpMW8Wdo7KUZ5Hmg/GhCyhDJIKpFxQPruSGvs6YT9
	9vnjhC1Ji8WVwnZB4zhQbRmarudcLcBlgoUGLOlNU476+u3gniMo03Bk9coPTSW2+mSfeE8Mryl
	C4SlSHMFMssoHouSTKTPOvDOHw0KCHgpIWVa/kqfYR36wvkXYlzNQ=
X-Google-Smtp-Source: AGHT+IFM8deR5ZSoma45hIBqa3JSfBKh9vQj7/leXkmKK0p9GKN/ib4GzVYcV6p3eEP8yVQ9HgLcj7PwPq4SYsOi0eQ=
X-Received: by 2002:a05:6808:1207:b0:3f6:7091:d297 with SMTP id
 5614622812f47-40b1cd0dffamr1985623b6e.18.1750925584325; Thu, 26 Jun 2025
 01:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
 <CACHz=Zj_YibxBOQytCQAmTAG=yyBXUx2s1Jr+fXqHgxHQmSDOQ@mail.gmail.com> <aFxbi6dnKjydzyNk@mail-itl>
In-Reply-To: <aFxbi6dnKjydzyNk@mail-itl>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 26 Jun 2025 09:12:53 +0100
X-Gm-Features: Ac12FXw5LQPN7oWVRjKAXJTeZptYPZ9q3R-3BEQyJd9s371og-g9kmSRI14xO2c
Message-ID: <CACHz=Zj=LsfbUVMkuKHx-xpy+NMQh13NUJ_-sPSq3OMwSurHPA@mail.gmail.com>
Subject: Re: [PATCH 0/2] xen/efi: Make boot more flexible, especially with GRUB2
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 9:26=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Tue, Jun 24, 2025 at 09:38:42AM +0100, Frediano Ziglio wrote:
> > On Tue, Jun 24, 2025 at 9:32=E2=80=AFAM Frediano Ziglio
> > <frediano.ziglio@cloud.com> wrote:
> > >
> > > The combination of GRUB2, EFI and UKI allows potentially more flexibi=
lity.
> > > For instance is possible to load xen.efi from a no ESP partition leav=
ing
> > > a boot loader like GRUB2 taking care of the file loading.
> > > This however requires some changes in Xen to be less restrictive.
> > > Specifically for GRUB2 these changes allows the usage of "chainloader=
"
> > > command with UKI and reading xen.efi from no ESP (so no DeviceHandle
> > > set) and usage of "linux" and "initrd" commands to load separately
> > > the kernel (embedding using UKI) and initrd (using LoadFile2 protocol=
).
> >
> > I was forgetting. If somebody wants to test "linux" and "initrd"
> > command with these changes be aware that GRUB currently has a problem
> > passing arguments, I posted a patch, see
> > https://lists.gnu.org/archive/html/grub-devel/2025-06/msg00156.html.
> > I also have a workaround for this issue in xen but it would be better
> > to have a fix in GRUB.
>
> Can you tell more how to test this, especially the second variant? When
> trying to use GRUB linux or linuxefi commands on xen.efi, I get "invalid
> magic number" error.
>

That's weird.

Be the way. As usual I have a super complicated script that does everything=
.

But to simplify:
- I compile xen (plain upstream plus my patches) with "make -C
~/work/xen/xen -j O=3Dnormal MAP"
- output xen.efi in "~/work/xen/xen/normal/xen.efi"
- add configuration and kernel with "./add_sections xen.efi
xen.unified.efi .config xen.cfg .kernel vmlinuz-xen"
- boot using patched Grub (or patched Xen, to handle command line, if
you don't care about command line you can use a stock one), the menu
entry is

menuentry 'XenServer (Serial)' {
        search --label --set root EFI-BOOT
        linux /boot/xen.unified.efi -- com1=3D115200,8n1
console=3Dcom1,vga dom0_mem=3D1232M,max:1232M watchdog dom0_max_vcpus=3D1-4
crashkernel=3D256M,below=3D4G -- root=3DLABEL=3Droot-qjhppe ro nolvm
hpet=3Ddisable console=3Dtty0 console=3Dhvc0
        initrd /boot/initrd.img
}

xen.cfg file:
----------
[global]
default=3Dxen

[xen]
----------

add_sections file:
----------
#!/usr/bin/env perl
use strict;

die if $#ARGV < 1;
my $in =3D shift @ARGV;
my $out =3D shift @ARGV;

my $max =3D 0;
open(IN, "objdump -h $in |") or die;
while (<IN>) {
        next if !/^\s*\d+\s+\S+\s+([0-9a-f]+)\s+([0-9a-f]+)\s+/;
        my $val =3D hex($1) + hex($2);
        $max =3D $val if $val > $max;
}
close(IN);

sub up($) {
        my $n =3D shift;
        return ($n + 4095) & -4096;
}

my @args =3D ('objcopy');

my $start =3D up($max);
while ($#ARGV >=3D 1) {
        my $name =3D shift;
        my $fn =3D shift;
        push @args, '--add-section', "$name=3D$fn";
        push @args, '--change-section-vma', sprintf("%s=3D%#x", $name, $sta=
rt);
        $start +=3D -s $fn;
        $start =3D up($start);
}
push @args, $in, $out;
print "Executing @args\n";
system(@args) =3D=3D 0 || die "Error!";
----------

My script creates the initrd, builds a full disk for Qemu and launches
Qemu too with specific options.

Frediano

