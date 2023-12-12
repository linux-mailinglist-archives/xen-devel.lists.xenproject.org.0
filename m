Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C98780F1B7
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 17:01:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653252.1019698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD5BS-00079J-Uv; Tue, 12 Dec 2023 16:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653252.1019698; Tue, 12 Dec 2023 16:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD5BS-00077O-R4; Tue, 12 Dec 2023 16:00:34 +0000
Received: by outflank-mailman (input) for mailman id 653252;
 Tue, 12 Dec 2023 16:00:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Qa1=HX=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rD5BR-000762-DX
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 16:00:33 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9371588e-9907-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 17:00:31 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3363653e180so251677f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 08:00:31 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l12-20020a05600c4f0c00b0040b4b2a15ebsm17070900wmq.28.2023.12.12.08.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 08:00:30 -0800 (PST)
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
X-Inumbo-ID: 9371588e-9907-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702396831; x=1703001631; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F/NRDJQeDGjfVB4trghfjH317bfJe+paebwX1w/yVf4=;
        b=Mk1XSMWM/iOVeBTcoTKeaO+vmsI6NWaKeza+hh3AvvGRpYK6ye1PIaB/TsEGh5E7kb
         KSfr3mfNXPLY33Gr38U+HdQIk2JkSSxoM4P+ImnunLB+ZoBhiQUc3CeObvwTYM+jNhPg
         t0ctjexVtF1cCFYNNyfoAIPq1ql84O6qXFb64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702396831; x=1703001631;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/NRDJQeDGjfVB4trghfjH317bfJe+paebwX1w/yVf4=;
        b=bKRF7cjDT4nCiEfj3TUHpHk/dTZ6+GFug6I1A5y8jyPNhS7UER175+p0ZoNC4b6O3U
         aIzT5iZxo+uxKQmq0gzKQfDt9bUiPQW+KYN87jSrDILh4URbTrvw4/JeHQopoWm5N8oS
         VzvPs8MY8p5f8PmR7lhQsFC01cjLgVO0LkSlUZWTTzxpKtISzl47iptiR5SlOY8Hw2PS
         mmFkT7AZo+QW1AdskbLPmtXfVjfmeMHJEzVQ24sJZhD74lrZfE2En2pvUf4Qe5yJW4Ra
         jZOtfPuemzZEDxX0HT0/0MhPsonmUSTpBXAFnKBea3o7LjmumBroJ6nmH/CsUOgvb2CH
         Qdww==
X-Gm-Message-State: AOJu0YyP5WaPUz6uF6o6Eo4a8jKw7tibkr2Q+Kai0bVkLQaNfeJOcEg6
	P6VD9U2QMC/BlEMKsOe3EN/T+w==
X-Google-Smtp-Source: AGHT+IGs06IQ1RI06a5x+K2ZG/fQL9Wa3udmAW400tHnoMF+uHFv7F8KGhsxRBkQYJNq9Js0xU7gAQ==
X-Received: by 2002:a7b:c5ca:0:b0:40c:3df7:a815 with SMTP id n10-20020a7bc5ca000000b0040c3df7a815mr2481355wmk.228.1702396830730;
        Tue, 12 Dec 2023 08:00:30 -0800 (PST)
Date: Tue, 12 Dec 2023 16:00:29 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	Vikram Garhwal <vikram.garhwal@amd.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Michael Young <m.a.young@durham.ac.uk>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] fix qemu build with xen-4.18.0
Message-ID: <9f0c39eb-f750-4f63-a033-f6edb86fbd79@perard>
References: <277e21fc78b75ec459efc7f5fde628a0222c63b0.1701989261.git.m.a.young@durham.ac.uk>
 <ZXLg_YCHM-P6drQV@redhat.com>
 <alpine.DEB.2.22.394.2312081422490.1703076@ubuntu-linux-20-04-desktop>
 <8be72952-88b6-4c74-b696-fecfa8313c96@perard>
 <87wmtj77sl.fsf@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wmtj77sl.fsf@epam.com>

On Tue, Dec 12, 2023 at 03:35:50PM +0000, Volodymyr Babchuk wrote:
> Hi Anthony
> 
> Anthony PERARD <anthony.perard@citrix.com> writes:
> 
> > On Fri, Dec 08, 2023 at 02:49:27PM -0800, Stefano Stabellini wrote:
> >> On Fri, 8 Dec 2023, Daniel P. Berrangé wrote:
> >> > On Thu, Dec 07, 2023 at 11:12:48PM +0000, Michael Young wrote:
> >> > > Builds of qemu-8.2.0rc2 with xen-4.18.0 are currently failing
> >> > > with errors like
> >> > > ../hw/arm/xen_arm.c:74:5: error: ‘GUEST_VIRTIO_MMIO_SPI_LAST’ undeclared (first use in this function)
> >> > >    74 |    (GUEST_VIRTIO_MMIO_SPI_LAST - GUEST_VIRTIO_MMIO_SPI_FIRST)
> >> > >       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >> > > 
> >> > > as there is an incorrect comparision in include/hw/xen/xen_native.h
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
> >> The ARM xenpvh machine (xen_arm.c) is meant to work with Xen on ARM, not
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
> >     ./configure --enable-xen --cpu=x86_64
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

Sorry, I got the wrong commit pasted, I actually meant:
0c8ab1cddd6c ("xen_arm: Create virtio-mmio devices during initialization")

-- 
Anthony PERARD

