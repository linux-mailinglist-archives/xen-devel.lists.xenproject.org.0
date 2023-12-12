Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2707E80F175
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 16:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653239.1019679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4z6-0001Th-GP; Tue, 12 Dec 2023 15:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653239.1019679; Tue, 12 Dec 2023 15:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4z6-0001QK-DF; Tue, 12 Dec 2023 15:47:48 +0000
Received: by outflank-mailman (input) for mailman id 653239;
 Tue, 12 Dec 2023 15:47:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2zfk=HX=gmail.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rD4z5-0001QE-EB
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 15:47:47 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca7bada3-9905-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 16:47:45 +0100 (CET)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-2030f4d1af0so167886fac.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 07:47:45 -0800 (PST)
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
X-Inumbo-ID: ca7bada3-9905-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702396064; x=1703000864; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozZMWDHeJ0qg54sRNCugGLW80XKaiRIqUq79OKSa2QI=;
        b=jZ+1+2LcYbO+Iyi/e8qZjSg9hN8n76ivdZJNN36kLOSeDE1dbk6A9Oo6H+RZNJtgR3
         rUOs3n8G19d+F07kCu6l33iiNNwdWqR6LHTADX0gr8Up4Iq2oTaANCh08YoG7tNTxQUh
         RBLxpli9Zxk1TXo5sBOc2MUVr6yyKJ555qiuTTsvgRN3fyBNQe+eXRypD3FYBRfFPwAl
         5iW+QfkzjwKYSkvgiv7s2wu6bJZlAMZPqhXxFZUwjnOM0ygCBIAMYTx/rmI48RH2wcrU
         /4yF5vtiHjrL3R9KR8z9Tc4jcSh5zffEWC+RMHbu1TE2ykBOd8JcHsO0RIbFPCTJPcwp
         1MNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702396064; x=1703000864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozZMWDHeJ0qg54sRNCugGLW80XKaiRIqUq79OKSa2QI=;
        b=RBNxqJTVfS0R5hHnKj3p7PxNQLVnsO5owNvuQ9MqnbnkG+pu00jKEgiHJT0KlM0kf3
         feinskSCAGJIZrm5mSSxsZ0XGFmZaepZi4fHYw8fsjWl6llupibOjn87Vaw3ewBbtkQA
         WBdoM6z48xbGcOxvbeD8kAU6HE+m9uHqzSxMD3l8osESpEKxEn7QKBrCPPM1WM0UO1dK
         GGfzQ137TGlYXx1BZduTZwNXL9wrWDGY4l7R5GzPqF+5NoH7JkRobp7GPAG8YsYV5cBe
         Ep5ihk7CM7D/i1sfn7MMglfcdy1w7azVBMZbvQzG+CKWQNLQVVhaq3aB70pUE78UpVDS
         NWLA==
X-Gm-Message-State: AOJu0YznjLY1/hruXJyS4uiAvzCW2kzaiv3Njrt2e6M3CpLCVvvTLcUo
	g5xj5rlZuH5JOzVakW2biiRYJzBbupEj5E9Ijrw=
X-Google-Smtp-Source: AGHT+IHZGshyTQTe5je5WuS4NbHDKq7xJvmq3SZZUHKYPS530Tr2iF1drQOJI0hMI5PazFVs+wj8cIpcgnm4X9gud4k=
X-Received: by 2002:a05:6870:55cd:b0:1fa:ebea:b659 with SMTP id
 qk13-20020a05687055cd00b001faebeab659mr7739683oac.45.1702396064036; Tue, 12
 Dec 2023 07:47:44 -0800 (PST)
MIME-Version: 1.0
References: <277e21fc78b75ec459efc7f5fde628a0222c63b0.1701989261.git.m.a.young@durham.ac.uk>
 <ZXLg_YCHM-P6drQV@redhat.com> <alpine.DEB.2.22.394.2312081422490.1703076@ubuntu-linux-20-04-desktop>
 <8be72952-88b6-4c74-b696-fecfa8313c96@perard> <87wmtj77sl.fsf@epam.com>
In-Reply-To: <87wmtj77sl.fsf@epam.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 12 Dec 2023 10:47:32 -0500
Message-ID: <CAJSP0QUytnP60HyWwG4AhjMZwCS6b+pJJm7AOWd8P8pu1SqJ=Q@mail.gmail.com>
Subject: Re: [PATCH] fix qemu build with xen-4.18.0
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Vikram Garhwal <vikram.garhwal@amd.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Michael Young <m.a.young@durham.ac.uk>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Dec 2023 at 10:36, Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> Hi Anthony
>
> Anthony PERARD <anthony.perard@citrix.com> writes:
>
> > On Fri, Dec 08, 2023 at 02:49:27PM -0800, Stefano Stabellini wrote:
> >> On Fri, 8 Dec 2023, Daniel P. Berrang=C3=A9 wrote:
> >> > On Thu, Dec 07, 2023 at 11:12:48PM +0000, Michael Young wrote:
> >> > > Builds of qemu-8.2.0rc2 with xen-4.18.0 are currently failing
> >> > > with errors like
> >> > > ../hw/arm/xen_arm.c:74:5: error: =E2=80=98GUEST_VIRTIO_MMIO_SPI_LA=
ST=E2=80=99 undeclared (first use in this function)
> >> > >    74 |    (GUEST_VIRTIO_MMIO_SPI_LAST - GUEST_VIRTIO_MMIO_SPI_FIR=
ST)
> >> > >       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >> > >
> >> > > as there is an incorrect comparision in include/hw/xen/xen_native.=
h
> >> > > which means that settings like GUEST_VIRTIO_MMIO_SPI_LAST
> >> > > aren't being defined for xen-4.18.0
> >> >
> >> > The conditions in arch-arm.h for xen 4.18 show:
> >> >
> >> > $ cppi arch-arm.h | grep -E '(#.*if)|MMIO'
> >> > #ifndef __XEN_PUBLIC_ARCH_ARM_H__
> >> > # if defined(__XEN__) || defined(__XEN_TOOLS__) || defined(__GNUC__)
> >> > # endif
> >> > # ifndef __ASSEMBLY__
> >> > #  if defined(__XEN__) || defined(__XEN_TOOLS__)
> >> > #   if defined(__GNUC__) && !defined(__STRICT_ANSI__)
> >> > #   endif
> >> > #  endif /* __XEN__ || __XEN_TOOLS__ */
> >> > # endif
> >> > # if defined(__XEN__) || defined(__XEN_TOOLS__)
> >> > #  define PSR_MODE_BIT  0x10U /* Set iff AArch32 */
> >> > /* Virtio MMIO mappings */
> >> > #  define GUEST_VIRTIO_MMIO_BASE   xen_mk_ullong(0x02000000)
> >> > #  define GUEST_VIRTIO_MMIO_SIZE   xen_mk_ullong(0x00100000)
> >> > #  define GUEST_VIRTIO_MMIO_SPI_FIRST   33
> >> > #  define GUEST_VIRTIO_MMIO_SPI_LAST    43
> >> > # endif
> >> > # ifndef __ASSEMBLY__
> >> > # endif
> >> > #endif /*  __XEN_PUBLIC_ARCH_ARM_H__ */
> >> >
> >> > So the MMIO constants are available if __XEN__ or __XEN_TOOLS__
> >> > are defined. This is no different to the condition that was
> >> > present in Xen 4.17.
> >> >
> >> > What you didn't mention was that the Fedora build failure is
> >> > seen on an x86_64 host, when building the aarch64 target QEMU,
> >> > and I think this is the key issue.
> >>
> >> Hi Daniel, thanks for looking into it.
> >>
> >> - you are building on a x86_64 host
> >> - the target is aarch64
> >> - the target is the aarch64 Xen PVH machine (xen_arm.c)
> >>
> >> But is the resulting QEMU binary expected to be an x86 binary? Or are
> >> you cross compiling ARM binaries on a x86 host?
> >>
> >> In other word, is the resulting QEMU binary expected to run on ARM or
> >> x86?
> >>
> >>
> >> > Are we expecting to build Xen support for non-arch native QEMU
> >> > system binaries or not ?
> >>
> >> The ARM xenpvh machine (xen_arm.c) is meant to work with Xen on ARM, n=
ot
> >> Xen on x86.  So this is only expected to work if you are
> >> cross-compiling. But you can cross-compile both Xen and QEMU, and I am
> >> pretty sure that Yocto is able to build Xen, Xen userspace tools, and
> >> QEMU for Xen/ARM on an x86 host today.
> >>
> >>
> >> > The constants are defined in arch-arm.h, which is only included
> >> > under:
> >> >
> >> >   #if defined(__i386__) || defined(__x86_64__)
> >> >   #include "arch-x86/xen.h"
> >> >   #elif defined(__arm__) || defined (__aarch64__)
> >> >   #include "arch-arm.h"
> >> >   #else
> >> >   #error "Unsupported architecture"
> >> >   #endif
> >> >
> >> >
> >> > When we are building on an x86_64 host, we not going to get
> >> > arch-arm.h included, even if we're trying to build the aarch64
> >> > system emulator.
> >> >
> >> > I don't know how this is supposed to work ?
> >>
> >> It looks like a host vs. target architecture mismatch: the #if defined
> >> (__aarch64__) check should pass I think.
> >
> >
> > Building qemu with something like:
> >     ./configure --enable-xen --cpu=3Dx86_64
> > used to work. Can we fix that? It still works with v8.1.0.
> > At least, it works on x86, I never really try to build qemu for arm.
> > Notice that there's no "--target-list" on the configure command line.
> > I don't know if --cpu is useful here.
> >
> > Looks like the first commit where the build doesn't work is
> > 7899f6589b78 ("xen_arm: Add virtual PCIe host bridge support").
>
> I am currently trying to upstream this patch. It is in the QEMU mailing
> list but it was never accepted. It is not reviewed in fact. I'll take a
> look at it, but I don't understand how did you get in the first place.

Hi Volodymyr,
Paolo Bonzini sent a pull request with similar code changes this
morning and I have merged it into the qemu.git/staging branch:
https://gitlab.com/qemu-project/qemu/-/commit/eaae59af4035770975b0ce9364b58=
7223a909501

If you spot something that is not correct, please reply here.

Thanks!

Stefan

>
> --
> WBR, Volodymyr

