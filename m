Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D1CAEB7B9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 14:31:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027605.1402185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV8DY-0001P3-N4; Fri, 27 Jun 2025 12:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027605.1402185; Fri, 27 Jun 2025 12:30:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV8DY-0001Nb-KM; Fri, 27 Jun 2025 12:30:08 +0000
Received: by outflank-mailman (input) for mailman id 1027605;
 Fri, 27 Jun 2025 12:30:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hlj0=ZK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uV8DW-0001Cb-GD
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 12:30:06 +0000
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [2607:f8b0:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7185d1c6-5352-11f0-b894-0df219b8e170;
 Fri, 27 Jun 2025 14:30:01 +0200 (CEST)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-40791b6969bso1484345b6e.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jun 2025 05:30:01 -0700 (PDT)
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
X-Inumbo-ID: 7185d1c6-5352-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1751027400; x=1751632200; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFNI9mcf5R9yYVHmC36pUpSASD2VxUVrMsyFj8KJYSs=;
        b=MAwmfE3HDXaYpGNtgg3tQoH45BWl5C5HzE4iWd7xpGmPv6YJQczTmzL+Mlow1vhJ6Z
         0/yIkBRcwm79HZ9lbbBgix/vQOiWxvHp+XWjQ/AI/axRu95mtIfPiUzTEbCo+XuGEAay
         U9x+lt9TsjMedIDfiCfqQoVDKuJta9e9gxHRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751027400; x=1751632200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFNI9mcf5R9yYVHmC36pUpSASD2VxUVrMsyFj8KJYSs=;
        b=HgyH0OTnZHwF40E8aYIzCVbJ+zrivaAvPXazfWDbe0Nrr6JbziVXyP7w/sO+Rom5nn
         nojJ528AokkmSKlzQFKUo6wKzMiUbssNKG0fSIvxtTWKk8BPgE9x0Gwh3JJVF6QkZJNL
         u41yb2DGm5LrqOMxK08xdeUXmXOGgL/t08nwIVXqKRqKg0bfhPyuksu2g71+uzj3m0hM
         LKRXdHza3m2UmCqzGX7OFITW0/EkYRBefY2ZoClrQkcodZeMUbE++uAORlmXRXO66Skb
         0z04XrF5iQ0w5siuGlaX+nHKfL37E72td9uqbBscpjhTwTqO3ZtgKK7yiLDUYIhSXKQd
         gNnA==
X-Gm-Message-State: AOJu0Yx8SbIcLBzYSN3G2P9Freh93CbzgdrLXXH4YLXbQWp6OJgMJEyU
	7HDYDxSkORIk1jp5FTxcnz/uEWR8kvaESGfkWNBgBWGoTmMYqcetaZhm+dIXX22kdQgaiJGwn+k
	vC0/mmiNqXJKmHsmr/51CfcLiO5mlNxwTxtcb/RD9Rw==
X-Gm-Gg: ASbGnctMXfUObxHuATMhzP4FrobrqxhwArpNGidzMIxuL6LRsstmISLdzf9f98s1K7h
	fY51GS5ltV2iMwg7irFhet6z+wJJJky4xlc9ayqNCy6MeyQ44d7hA4dlkhBOUUgX7n2rQgl0Ggl
	hNig/3uM2WcOZevUqIx9LuJu4sC5mL2pFiXlOg2osN
X-Google-Smtp-Source: AGHT+IEmO7syVJy/FYA86P2lJnxOcAGPQTg3et5E0rV2HmZAeXfGK5ui0jg6L20pixIRRFSwLUYeiyBsZ8lxA5+t3rg=
X-Received: by 2002:a05:6870:ef0d:b0:2e9:8ed9:16fc with SMTP id
 586e51a60fabf-2efed4c2f78mr1568703fac.11.1751027399789; Fri, 27 Jun 2025
 05:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
 <CACHz=Zj_YibxBOQytCQAmTAG=yyBXUx2s1Jr+fXqHgxHQmSDOQ@mail.gmail.com>
 <aFxbi6dnKjydzyNk@mail-itl> <CACHz=Zj=LsfbUVMkuKHx-xpy+NMQh13NUJ_-sPSq3OMwSurHPA@mail.gmail.com>
 <aF1hIARPp6a0wWmi@mail-itl>
In-Reply-To: <aF1hIARPp6a0wWmi@mail-itl>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 27 Jun 2025 13:29:48 +0100
X-Gm-Features: Ac12FXyt3PxgmOYwO6Q5hkN3S9cntzINkBmW4KXaS_fRql8tp27ICMjSYB2TL5A
Message-ID: <CACHz=ZiVT-iSzEsG48NjJzJgdd=Ns-+dVTUTZKqVq78Py-kp2A@mail.gmail.com>
Subject: Re: [PATCH 0/2] xen/efi: Make boot more flexible, especially with GRUB2
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 4:03=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Thu, Jun 26, 2025 at 09:12:53AM +0100, Frediano Ziglio wrote:
> > On Wed, Jun 25, 2025 at 9:26=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com> wrote:
> > >
> > > On Tue, Jun 24, 2025 at 09:38:42AM +0100, Frediano Ziglio wrote:
> > > > On Tue, Jun 24, 2025 at 9:32=E2=80=AFAM Frediano Ziglio
> > > > <frediano.ziglio@cloud.com> wrote:
> > > > >
> > > > > The combination of GRUB2, EFI and UKI allows potentially more fle=
xibility.
> > > > > For instance is possible to load xen.efi from a no ESP partition =
leaving
> > > > > a boot loader like GRUB2 taking care of the file loading.
> > > > > This however requires some changes in Xen to be less restrictive.
> > > > > Specifically for GRUB2 these changes allows the usage of "chainlo=
ader"
> > > > > command with UKI and reading xen.efi from no ESP (so no DeviceHan=
dle
> > > > > set) and usage of "linux" and "initrd" commands to load separatel=
y
> > > > > the kernel (embedding using UKI) and initrd (using LoadFile2 prot=
ocol).
> > > >
> > > > I was forgetting. If somebody wants to test "linux" and "initrd"
> > > > command with these changes be aware that GRUB currently has a probl=
em
> > > > passing arguments, I posted a patch, see
> > > > https://lists.gnu.org/archive/html/grub-devel/2025-06/msg00156.html=
.
> > > > I also have a workaround for this issue in xen but it would be bett=
er
> > > > to have a fix in GRUB.
> > >
> > > Can you tell more how to test this, especially the second variant? Wh=
en
> > > trying to use GRUB linux or linuxefi commands on xen.efi, I get "inva=
lid
> > > magic number" error.
> > >
> >
> > That's weird.
> >
> > Be the way. As usual I have a super complicated script that does everyt=
hing.
> >
> > But to simplify:
> > - I compile xen (plain upstream plus my patches) with "make -C
> > ~/work/xen/xen -j O=3Dnormal MAP"
>
> Is there any that would be related to the "invalid magic" error? IIUC
> without your patches options will be mangled, but I don't think I get
> this far.
>

I tried to do some changes and check the CI with your branch. Not hard
to reproduce and the test looks correct.
Looking at GRUB code I can see various "linux" command implementations
and it looks like yours is picking up i386-pc target and not
x86_64-efi one which is really odd to me.

> > - output xen.efi in "~/work/xen/xen/normal/xen.efi"
> > - add configuration and kernel with "./add_sections xen.efi
> > xen.unified.efi .config xen.cfg .kernel vmlinuz-xen"
> > - boot using patched Grub (or patched Xen, to handle command line, if
> > you don't care about command line you can use a stock one), the menu
> > entry is
> >
> > menuentry 'XenServer (Serial)' {
> >         search --label --set root EFI-BOOT
> >         linux /boot/xen.unified.efi -- com1=3D115200,8n1
> > console=3Dcom1,vga dom0_mem=3D1232M,max:1232M watchdog dom0_max_vcpus=
=3D1-4
> > crashkernel=3D256M,below=3D4G -- root=3DLABEL=3Droot-qjhppe ro nolvm
> > hpet=3Ddisable console=3Dtty0 console=3Dhvc0
> >         initrd /boot/initrd.img
> > }
>
> All looks quite similar. FWIW my setup is:
> https://gitlab.com/xen-project/people/marmarek/xen/-/blob/test-uki/automa=
tion/scripts/qemu-smoke-x86-64-efi-uki.sh?ref_type=3Dheads
>
> Booting such UKI from OVMF directly works, as well as with
> "chainloader" grub command:
>
> https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1891308263
>
> CI uses Grub 2.06 from Debian, but I get the same result with 2.12 from
> Fedora too.
>
> >
> > xen.cfg file:
> > ----------
> > [global]
> > default=3Dxen
> >
> > [xen]
> > ----------
> >
> > add_sections file:
> > ----------
> > #!/usr/bin/env perl
> > use strict;
> >
> > die if $#ARGV < 1;
> > my $in =3D shift @ARGV;
> > my $out =3D shift @ARGV;
> >
> > my $max =3D 0;
> > open(IN, "objdump -h $in |") or die;
> > while (<IN>) {
> >         next if !/^\s*\d+\s+\S+\s+([0-9a-f]+)\s+([0-9a-f]+)\s+/;
> >         my $val =3D hex($1) + hex($2);
> >         $max =3D $val if $val > $max;
> > }
> > close(IN);
> >
> > sub up($) {
> >         my $n =3D shift;
> >         return ($n + 4095) & -4096;
> > }
> >
> > my @args =3D ('objcopy');
> >
> > my $start =3D up($max);
> > while ($#ARGV >=3D 1) {
> >         my $name =3D shift;
> >         my $fn =3D shift;
> >         push @args, '--add-section', "$name=3D$fn";
> >         push @args, '--change-section-vma', sprintf("%s=3D%#x", $name, =
$start);
> >         $start +=3D -s $fn;
> >         $start =3D up($start);
> > }
> > push @args, $in, $out;
> > print "Executing @args\n";
> > system(@args) =3D=3D 0 || die "Error!";
> > ----------
> >
> > My script creates the initrd, builds a full disk for Qemu and launches
> > Qemu too with specific options.
> >
> > Frediano
>
> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab

