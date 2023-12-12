Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1251C80EE8C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 15:20:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653170.1019508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD3cB-0005Ve-1l; Tue, 12 Dec 2023 14:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653170.1019508; Tue, 12 Dec 2023 14:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD3cA-0005QB-Uo; Tue, 12 Dec 2023 14:20:02 +0000
Received: by outflank-mailman (input) for mailman id 653170;
 Tue, 12 Dec 2023 14:20:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Qa1=HX=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rD3c8-0005AY-Rq
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 14:20:00 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 881d6632-98f9-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 15:19:59 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c2db2ee28so60267545e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 06:19:59 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c4f9500b0040b36ad5413sm16310403wmq.46.2023.12.12.06.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 06:19:58 -0800 (PST)
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
X-Inumbo-ID: 881d6632-98f9-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702390799; x=1702995599; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9FAI7uzbx1boNO4jdXWmLoa3VhRnZzRtn67+r1dQPVg=;
        b=IqMNXSyQRmPNGMCPb98dvYxXuKCaixzofDCW74gT5FrIUqcWw7u4GB5vtLXKAXtlRg
         ZKom2suuDvHF658mmSPKf1OALoo0EsXGibXrIxyrMo50yetcQkK3KcV1VaoeTQc8njcA
         EsRXX2g97+EMpbb49RyM6X5efQsxyNyMTKd04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702390799; x=1702995599;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9FAI7uzbx1boNO4jdXWmLoa3VhRnZzRtn67+r1dQPVg=;
        b=ESeG1oW3i4STjqnDfXRs9j7RDoHxIzdc0cWqmlyFh0dR0WnDiXmsa1fvSdTWYrk7B7
         MZDeCXA+aob9HByaGsNEI0RoswLgMNBFgWqCWtfngJqp/5Q1ARYDLJpBo5aMyF0BTltQ
         Sa1kzS8uIc8gxxkgqUCqHvsgpnyp9yloxccvwg266BrCAKEE6v6F3XVk3zDJj1C2yghR
         NHsvcIw2CCso+M/zjTOggcVGQsNSNBkLETMpD5mE8jh58qZ5NF7ZjUEGln/Y5i1oE8Sc
         AhBmPdzHmwogXDGAhqp0CfRfPF9k4NJ0zdtA1HMe8Af9MgDbk6oDnVHEsAhwoBGvUJHb
         /ajA==
X-Gm-Message-State: AOJu0YxBArgBFbykUT0y1qMSa/qRb3cCJdp99RbBjBgdInQZ6W0Cq0OX
	8XRbYuc1OMVa1tLa1631wfIZrQ==
X-Google-Smtp-Source: AGHT+IHMf4wc+LjrEtjZfWSxgAjvqtb7DfFrjTR+mRfO3I0NS7/jpv8Zlatopp2RJfNs/iBeMkOl8A==
X-Received: by 2002:a05:600c:2b0e:b0:40c:337e:f059 with SMTP id y14-20020a05600c2b0e00b0040c337ef059mr3258621wme.65.1702390798868;
        Tue, 12 Dec 2023 06:19:58 -0800 (PST)
Date: Tue, 12 Dec 2023 14:19:57 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Vikram Garhwal <vikram.garhwal@amd.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Michael Young <m.a.young@durham.ac.uk>, qemu-devel@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] fix qemu build with xen-4.18.0
Message-ID: <8be72952-88b6-4c74-b696-fecfa8313c96@perard>
References: <277e21fc78b75ec459efc7f5fde628a0222c63b0.1701989261.git.m.a.young@durham.ac.uk>
 <ZXLg_YCHM-P6drQV@redhat.com>
 <alpine.DEB.2.22.394.2312081422490.1703076@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2312081422490.1703076@ubuntu-linux-20-04-desktop>

On Fri, Dec 08, 2023 at 02:49:27PM -0800, Stefano Stabellini wrote:
> On Fri, 8 Dec 2023, Daniel P. Berrangé wrote:
> > On Thu, Dec 07, 2023 at 11:12:48PM +0000, Michael Young wrote:
> > > Builds of qemu-8.2.0rc2 with xen-4.18.0 are currently failing
> > > with errors like
> > > ../hw/arm/xen_arm.c:74:5: error: ‘GUEST_VIRTIO_MMIO_SPI_LAST’ undeclared (first use in this function)
> > >    74 |    (GUEST_VIRTIO_MMIO_SPI_LAST - GUEST_VIRTIO_MMIO_SPI_FIRST)
> > >       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > > 
> > > as there is an incorrect comparision in include/hw/xen/xen_native.h
> > > which means that settings like GUEST_VIRTIO_MMIO_SPI_LAST
> > > aren't being defined for xen-4.18.0
> > 
> > The conditions in arch-arm.h for xen 4.18 show:
> > 
> > $ cppi arch-arm.h | grep -E '(#.*if)|MMIO'
> > #ifndef __XEN_PUBLIC_ARCH_ARM_H__
> > # if defined(__XEN__) || defined(__XEN_TOOLS__) || defined(__GNUC__)
> > # endif
> > # ifndef __ASSEMBLY__
> > #  if defined(__XEN__) || defined(__XEN_TOOLS__)
> > #   if defined(__GNUC__) && !defined(__STRICT_ANSI__)
> > #   endif
> > #  endif /* __XEN__ || __XEN_TOOLS__ */
> > # endif
> > # if defined(__XEN__) || defined(__XEN_TOOLS__)
> > #  define PSR_MODE_BIT  0x10U /* Set iff AArch32 */
> > /* Virtio MMIO mappings */
> > #  define GUEST_VIRTIO_MMIO_BASE   xen_mk_ullong(0x02000000)
> > #  define GUEST_VIRTIO_MMIO_SIZE   xen_mk_ullong(0x00100000)
> > #  define GUEST_VIRTIO_MMIO_SPI_FIRST   33
> > #  define GUEST_VIRTIO_MMIO_SPI_LAST    43
> > # endif
> > # ifndef __ASSEMBLY__
> > # endif
> > #endif /*  __XEN_PUBLIC_ARCH_ARM_H__ */
> > 
> > So the MMIO constants are available if __XEN__ or __XEN_TOOLS__
> > are defined. This is no different to the condition that was
> > present in Xen 4.17.
> > 
> > What you didn't mention was that the Fedora build failure is
> > seen on an x86_64 host, when building the aarch64 target QEMU,
> > and I think this is the key issue.
> 
> Hi Daniel, thanks for looking into it.
> 
> - you are building on a x86_64 host
> - the target is aarch64
> - the target is the aarch64 Xen PVH machine (xen_arm.c)
> 
> But is the resulting QEMU binary expected to be an x86 binary? Or are
> you cross compiling ARM binaries on a x86 host?
> 
> In other word, is the resulting QEMU binary expected to run on ARM or
> x86?
> 
> 
> > Are we expecting to build Xen support for non-arch native QEMU
> > system binaries or not ?
> 
> The ARM xenpvh machine (xen_arm.c) is meant to work with Xen on ARM, not
> Xen on x86.  So this is only expected to work if you are
> cross-compiling. But you can cross-compile both Xen and QEMU, and I am
> pretty sure that Yocto is able to build Xen, Xen userspace tools, and
> QEMU for Xen/ARM on an x86 host today.
> 
> 
> > The constants are defined in arch-arm.h, which is only included
> > under:
> > 
> >   #if defined(__i386__) || defined(__x86_64__)
> >   #include "arch-x86/xen.h"
> >   #elif defined(__arm__) || defined (__aarch64__)
> >   #include "arch-arm.h"
> >   #else
> >   #error "Unsupported architecture"
> >   #endif
> > 
> > 
> > When we are building on an x86_64 host, we not going to get
> > arch-arm.h included, even if we're trying to build the aarch64
> > system emulator.
> > 
> > I don't know how this is supposed to work ?
> 
> It looks like a host vs. target architecture mismatch: the #if defined
> (__aarch64__) check should pass I think.


Building qemu with something like:
    ./configure --enable-xen --cpu=x86_64
used to work. Can we fix that? It still works with v8.1.0.
At least, it works on x86, I never really try to build qemu for arm.
Notice that there's no "--target-list" on the configure command line.
I don't know if --cpu is useful here.

Looks like the first commit where the build doesn't work is
7899f6589b78 ("xen_arm: Add virtual PCIe host bridge support").

Could we get that fixed?

I'm sure distribution will appreciate to be able to build a single qemu
package for xen and other, rather than having a dedicated qemu-xen
package.

Cheers,

-- 
Anthony PERARD

