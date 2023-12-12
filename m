Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C017780F27C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 17:30:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653317.1019767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD5e2-0003I7-TZ; Tue, 12 Dec 2023 16:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653317.1019767; Tue, 12 Dec 2023 16:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD5e2-0003H0-QE; Tue, 12 Dec 2023 16:30:06 +0000
Received: by outflank-mailman (input) for mailman id 653317;
 Tue, 12 Dec 2023 16:30:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2zfk=HX=gmail.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rD5e1-00037m-Ko
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 16:30:05 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3c33528-990b-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 17:30:04 +0100 (CET)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-589d4033e84so3403343eaf.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 08:30:04 -0800 (PST)
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
X-Inumbo-ID: b3c33528-990b-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702398603; x=1703003403; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=at5EiOX0b+pH+NFntsGsmIwUlK3jTtTR5le1bopqG9U=;
        b=iN+V9re7F4PUM3UKoJ3FtZQFAJAFO75ZvyuL3alxpyErUPCYJ8vum4GlY5tW7hXhgw
         sMvtlN7mQpK5Kh4sQxBNWO8savLSE+z1eE7H8iVHRYrpaWtxM1DImbh9yvTHcL3fTAV6
         BK5WgCCrvZ4yOeH13xUOsbCEsJImN7yGBK1aCxWa0/Xzmd0A2ApByYT4NvxYLDvmnaCp
         4QT9cxG9JJ4mayLqA9TJT3MEcGC1YuU09V5I+tk3fVkGewh912zUwKHwL/eydkWpCJEd
         WsvwEI0G0Hq8vgyygyjGIZUSPOTkjkVo8ZAfmkcAbFNYs24kUgkwXFgQTvjko4l1IGWb
         R8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398603; x=1703003403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=at5EiOX0b+pH+NFntsGsmIwUlK3jTtTR5le1bopqG9U=;
        b=H9L18reZf+KxOo55eTEAb5+7ioGpX4irOi4fOFCJ2t3VRHCS/dA+ZVTsFy2LPiPH5d
         3O1SSsi0rY/2HQMggfYsMF8bBwgGkMozqEFnWk5s7d61VZpxOETjqzZJG1Zti4ZMbuau
         7FmMfir2dXcjVD+Fk4GcmQ0+yz8i5uMXOBv8pAPhYvwiVYUVyEeVMZK8a0RZsEXW8/Ks
         MFFY4Bg9t+ZOHDWPqng9rNlaqfNa5P+YYGREPr9kwcP1WbWcT7JIi3J6gAb/TVP5OsMn
         zPYXaYTeC9PLsbXvB8G63swgafnAwUisz7C/vHwQu0dQtSP2auyI8hELSKwAiV9iGlIk
         Iw8A==
X-Gm-Message-State: AOJu0YyuiJVliHD2gh7AFWyEXYdL4roZOgjBltYjfKTPMAkkbI7ep9Ny
	PGAuSkirEFpil0ML+ZYLSQjvpp9OFJW2MzDoZzk=
X-Google-Smtp-Source: AGHT+IEu+dOeOt6iU/2HhXno+a9IveRq+bb92faD0+s1kUkqQhA2o1p/AaZw5Szi8AAHXzvr3SjjYymIvolv14ogzp0=
X-Received: by 2002:a05:6820:820:b0:58d:7171:c27 with SMTP id
 bg32-20020a056820082000b0058d71710c27mr7315512oob.8.1702398602542; Tue, 12
 Dec 2023 08:30:02 -0800 (PST)
MIME-Version: 1.0
References: <277e21fc78b75ec459efc7f5fde628a0222c63b0.1701989261.git.m.a.young@durham.ac.uk>
 <ZXLg_YCHM-P6drQV@redhat.com> <alpine.DEB.2.22.394.2312081422490.1703076@ubuntu-linux-20-04-desktop>
 <8be72952-88b6-4c74-b696-fecfa8313c96@perard> <87wmtj77sl.fsf@epam.com>
 <CAJSP0QUytnP60HyWwG4AhjMZwCS6b+pJJm7AOWd8P8pu1SqJ=Q@mail.gmail.com> <87plzb76je.fsf@epam.com>
In-Reply-To: <87plzb76je.fsf@epam.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 12 Dec 2023 11:29:50 -0500
Message-ID: <CAJSP0QWYH0eh8s9tFOCAf-wJ-iX=4xXgW0HspohtjqhjyMasmA@mail.gmail.com>
Subject: Re: [PATCH] fix qemu build with xen-4.18.0
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Vikram Garhwal <vikram.garhwal@amd.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Michael Young <m.a.young@durham.ac.uk>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Dec 2023 at 11:02, Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
>
> Hi Stefan,
>
> Stefan Hajnoczi <stefanha@gmail.com> writes:
>
> > On Tue, 12 Dec 2023 at 10:36, Volodymyr Babchuk
> > <Volodymyr_Babchuk@epam.com> wrote:
> >>
> >> Hi Anthony
> >>
> >> Anthony PERARD <anthony.perard@citrix.com> writes:
> >>
> >> > On Fri, Dec 08, 2023 at 02:49:27PM -0800, Stefano Stabellini wrote:
> >> >> On Fri, 8 Dec 2023, Daniel P. Berrang=C3=A9 wrote:
> >> >> > On Thu, Dec 07, 2023 at 11:12:48PM +0000, Michael Young wrote:
> >> >> > > Builds of qemu-8.2.0rc2 with xen-4.18.0 are currently failing
> >> >> > > with errors like
> >> >> > > ../hw/arm/xen_arm.c:74:5: error: =E2=80=98GUEST_VIRTIO_MMIO_SPI=
_LAST=E2=80=99 undeclared (first use in this function)
> >> >> > >    74 |    (GUEST_VIRTIO_MMIO_SPI_LAST - GUEST_VIRTIO_MMIO_SPI_=
FIRST)
> >> >> > >       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >> >> > >
> >> >> > > as there is an incorrect comparision in include/hw/xen/xen_nati=
ve.h
> >> >> > > which means that settings like GUEST_VIRTIO_MMIO_SPI_LAST
> >> >> > > aren't being defined for xen-4.18.0
> >> >> >
> >> >> > The conditions in arch-arm.h for xen 4.18 show:
> >> >> >
> >> >> > $ cppi arch-arm.h | grep -E '(#.*if)|MMIO'
> >> >> > #ifndef __XEN_PUBLIC_ARCH_ARM_H__
> >> >> > # if defined(__XEN__) || defined(__XEN_TOOLS__) || defined(__GNUC=
__)
> >> >> > # endif
> >> >> > # ifndef __ASSEMBLY__
> >> >> > #  if defined(__XEN__) || defined(__XEN_TOOLS__)
> >> >> > #   if defined(__GNUC__) && !defined(__STRICT_ANSI__)
> >> >> > #   endif
> >> >> > #  endif /* __XEN__ || __XEN_TOOLS__ */
> >> >> > # endif
> >> >> > # if defined(__XEN__) || defined(__XEN_TOOLS__)
> >> >> > #  define PSR_MODE_BIT  0x10U /* Set iff AArch32 */
> >> >> > /* Virtio MMIO mappings */
> >> >> > #  define GUEST_VIRTIO_MMIO_BASE   xen_mk_ullong(0x02000000)
> >> >> > #  define GUEST_VIRTIO_MMIO_SIZE   xen_mk_ullong(0x00100000)
> >> >> > #  define GUEST_VIRTIO_MMIO_SPI_FIRST   33
> >> >> > #  define GUEST_VIRTIO_MMIO_SPI_LAST    43
> >> >> > # endif
> >> >> > # ifndef __ASSEMBLY__
> >> >> > # endif
> >> >> > #endif /*  __XEN_PUBLIC_ARCH_ARM_H__ */
> >> >> >
> >> >> > So the MMIO constants are available if __XEN__ or __XEN_TOOLS__
> >> >> > are defined. This is no different to the condition that was
> >> >> > present in Xen 4.17.
> >> >> >
> >> >> > What you didn't mention was that the Fedora build failure is
> >> >> > seen on an x86_64 host, when building the aarch64 target QEMU,
> >> >> > and I think this is the key issue.
> >> >>
> >> >> Hi Daniel, thanks for looking into it.
> >> >>
> >> >> - you are building on a x86_64 host
> >> >> - the target is aarch64
> >> >> - the target is the aarch64 Xen PVH machine (xen_arm.c)
> >> >>
> >> >> But is the resulting QEMU binary expected to be an x86 binary? Or a=
re
> >> >> you cross compiling ARM binaries on a x86 host?
> >> >>
> >> >> In other word, is the resulting QEMU binary expected to run on ARM =
or
> >> >> x86?
> >> >>
> >> >>
> >> >> > Are we expecting to build Xen support for non-arch native QEMU
> >> >> > system binaries or not ?
> >> >>
> >> >> The ARM xenpvh machine (xen_arm.c) is meant to work with Xen on ARM=
, not
> >> >> Xen on x86.  So this is only expected to work if you are
> >> >> cross-compiling. But you can cross-compile both Xen and QEMU, and I=
 am
> >> >> pretty sure that Yocto is able to build Xen, Xen userspace tools, a=
nd
> >> >> QEMU for Xen/ARM on an x86 host today.
> >> >>
> >> >>
> >> >> > The constants are defined in arch-arm.h, which is only included
> >> >> > under:
> >> >> >
> >> >> >   #if defined(__i386__) || defined(__x86_64__)
> >> >> >   #include "arch-x86/xen.h"
> >> >> >   #elif defined(__arm__) || defined (__aarch64__)
> >> >> >   #include "arch-arm.h"
> >> >> >   #else
> >> >> >   #error "Unsupported architecture"
> >> >> >   #endif
> >> >> >
> >> >> >
> >> >> > When we are building on an x86_64 host, we not going to get
> >> >> > arch-arm.h included, even if we're trying to build the aarch64
> >> >> > system emulator.
> >> >> >
> >> >> > I don't know how this is supposed to work ?
> >> >>
> >> >> It looks like a host vs. target architecture mismatch: the #if defi=
ned
> >> >> (__aarch64__) check should pass I think.
> >> >
> >> >
> >> > Building qemu with something like:
> >> >     ./configure --enable-xen --cpu=3Dx86_64
> >> > used to work. Can we fix that? It still works with v8.1.0.
> >> > At least, it works on x86, I never really try to build qemu for arm.
> >> > Notice that there's no "--target-list" on the configure command line=
.
> >> > I don't know if --cpu is useful here.
> >> >
> >> > Looks like the first commit where the build doesn't work is
> >> > 7899f6589b78 ("xen_arm: Add virtual PCIe host bridge support").
> >>
> >> I am currently trying to upstream this patch. It is in the QEMU mailin=
g
> >> list but it was never accepted. It is not reviewed in fact. I'll take =
a
> >> look at it, but I don't understand how did you get in the first place.
> >
> > Hi Volodymyr,
> > Paolo Bonzini sent a pull request with similar code changes this
> > morning and I have merged it into the qemu.git/staging branch:
> > https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/comm=
it/eaae59af4035770975b0ce9364b587223a909501__;!!GF_29dbcQIUBPA!yFgSxAEgXPjc=
kF8piSt0T77bbeggSgwC-6-xDuZmzq4a8U7HEP8XxGnxwIhgA9iyFVie-fdVgAVA5wVipnewbLN=
p$
> > [gitlab[.]com]
> >
> > If you spot something that is not correct, please reply here.
> >
>
> No, it is all fine in that pull request. I was talking about patch
> "xen_arm: Add virtual PCIe host bridge support" which is still on
> review:
> https://patchwork.kernel.org/project/qemu-devel/patch/20231202014108.2017=
803-7-volodymyr_babchuk@epam.com/
>
> I was surprised when Anthony mentioned that this patch breaks the
> build, because the patch is not included in QEMU tree.

Ah, I jumped straight to the last email and didn't realize :).

Stefan

