Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F42880AFEB
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 23:50:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650821.1016633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBjf4-00016N-MY; Fri, 08 Dec 2023 22:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650821.1016633; Fri, 08 Dec 2023 22:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBjf4-00013g-Jv; Fri, 08 Dec 2023 22:49:34 +0000
Received: by outflank-mailman (input) for mailman id 650821;
 Fri, 08 Dec 2023 22:49:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBjf4-00013a-1x
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 22:49:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c5ee288-961c-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 23:49:31 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3CF76625E4;
 Fri,  8 Dec 2023 22:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033DDC433C8;
 Fri,  8 Dec 2023 22:49:28 +0000 (UTC)
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
X-Inumbo-ID: 0c5ee288-961c-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702075769;
	bh=Str9XyP63a08WIpfTICrG8sa3qrLzGScb0cGu5pCjAY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KP7L0fJ8FKKbwj55yW7m3fIyRWRPC52ATtHCNwdTyX4PMwCDq5kjj+WJ5RH4wsvOk
	 Dlsua+qeG4+pGszMsk9y5Q0VA0FlNm2UWzs4QsQTloINSvGaIAWbwECyLYOJ4B9eIR
	 mfLAMMsOgWxWq49HXubXvHi2P7aIEtCwCh200Tz3l1Ho4krCmRQ74xmUyvYTfg4QiK
	 9pRyNiaeJox6ZVCWbYEaodnzu/MxUhKtw9odGkudkMNg5O79KDOT/D6NCiMyHRym6c
	 zbmRVfVVK9etF1na+DsXM7zBm4JnpFnVGeEajwH/xOASZqfoNNN4atTXMCVPl/zpBs
	 OdxknJSmuMa/w==
Date: Fri, 8 Dec 2023 14:49:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
cc: Michael Young <m.a.young@durham.ac.uk>, qemu-devel@nongnu.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] fix qemu build with xen-4.18.0
In-Reply-To: <ZXLg_YCHM-P6drQV@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2312081422490.1703076@ubuntu-linux-20-04-desktop>
References: <277e21fc78b75ec459efc7f5fde628a0222c63b0.1701989261.git.m.a.young@durham.ac.uk> <ZXLg_YCHM-P6drQV@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-855051027-1702074176=:1703076"
Content-ID: <alpine.DEB.2.22.394.2312081423010.1703076@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-855051027-1702074176=:1703076
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2312081423011.1703076@ubuntu-linux-20-04-desktop>

On Fri, 8 Dec 2023, Daniel P. Berrangé wrote:
> CC'ing the Xen folks
> 
> On Thu, Dec 07, 2023 at 11:12:48PM +0000, Michael Young wrote:
> > Builds of qemu-8.2.0rc2 with xen-4.18.0 are currently failing
> > with errors like
> > ../hw/arm/xen_arm.c:74:5: error: ‘GUEST_VIRTIO_MMIO_SPI_LAST’ undeclared (first use in this function)
> >    74 |    (GUEST_VIRTIO_MMIO_SPI_LAST - GUEST_VIRTIO_MMIO_SPI_FIRST)
> >       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > as there is an incorrect comparision in include/hw/xen/xen_native.h
> > which means that settings like GUEST_VIRTIO_MMIO_SPI_LAST
> > aren't being defined for xen-4.18.0
> 
> The conditions in arch-arm.h for xen 4.18 show:
> 
> $ cppi arch-arm.h | grep -E '(#.*if)|MMIO'
> #ifndef __XEN_PUBLIC_ARCH_ARM_H__
> # if defined(__XEN__) || defined(__XEN_TOOLS__) || defined(__GNUC__)
> # endif
> # ifndef __ASSEMBLY__
> #  if defined(__XEN__) || defined(__XEN_TOOLS__)
> #   if defined(__GNUC__) && !defined(__STRICT_ANSI__)
> #   endif
> #  endif /* __XEN__ || __XEN_TOOLS__ */
> # endif
> # if defined(__XEN__) || defined(__XEN_TOOLS__)
> #  define PSR_MODE_BIT  0x10U /* Set iff AArch32 */
> /* Virtio MMIO mappings */
> #  define GUEST_VIRTIO_MMIO_BASE   xen_mk_ullong(0x02000000)
> #  define GUEST_VIRTIO_MMIO_SIZE   xen_mk_ullong(0x00100000)
> #  define GUEST_VIRTIO_MMIO_SPI_FIRST   33
> #  define GUEST_VIRTIO_MMIO_SPI_LAST    43
> # endif
> # ifndef __ASSEMBLY__
> # endif
> #endif /*  __XEN_PUBLIC_ARCH_ARM_H__ */
> 
> So the MMIO constants are available if __XEN__ or __XEN_TOOLS__
> are defined. This is no different to the condition that was
> present in Xen 4.17.
> 
> What you didn't mention was that the Fedora build failure is
> seen on an x86_64 host, when building the aarch64 target QEMU,
> and I think this is the key issue.

Hi Daniel, thanks for looking into it.

- you are building on a x86_64 host
- the target is aarch64
- the target is the aarch64 Xen PVH machine (xen_arm.c)

But is the resulting QEMU binary expected to be an x86 binary? Or are
you cross compiling ARM binaries on a x86 host?

In other word, is the resulting QEMU binary expected to run on ARM or
x86?


> Are we expecting to build Xen support for non-arch native QEMU
> system binaries or not ?

The ARM xenpvh machine (xen_arm.c) is meant to work with Xen on ARM, not
Xen on x86.  So this is only expected to work if you are
cross-compiling. But you can cross-compile both Xen and QEMU, and I am
pretty sure that Yocto is able to build Xen, Xen userspace tools, and
QEMU for Xen/ARM on an x86 host today.


> The constants are defined in arch-arm.h, which is only included
> under:
> 
>   #if defined(__i386__) || defined(__x86_64__)
>   #include "arch-x86/xen.h"
>   #elif defined(__arm__) || defined (__aarch64__)
>   #include "arch-arm.h"
>   #else
>   #error "Unsupported architecture"
>   #endif
> 
> 
> When we are building on an x86_64 host, we not going to get
> arch-arm.h included, even if we're trying to build the aarch64
> system emulator.
> 
> I don't know how this is supposed to work ?

It looks like a host vs. target architecture mismatch: the #if defined
(__aarch64__) check should pass I think.


The following is a guess. Maybe Xen gets enabled because you have x86
Xen installed, and you are building QEMU for an aarch64 target (aarch64
emulation, running on a x86 host). So this is not meant to work for
xen_arm.c and it would be better to disable xen_arm.c.

On the other hand if you are trying to cross-build a QEMU binary meant
to run on an aarch64 host, cross-building it on an x86_64 host, then yes
this is meant to work and we need to figure out why the #if defined
(__aarch64__) is not passing.



> > Signed-off-by: Michael Young <m.a.young@durham.ac.uk>
> > ---
> >  include/hw/xen/xen_native.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/hw/xen/xen_native.h b/include/hw/xen/xen_native.h
> > index 6f09c48823..04b1ef4d34 100644
> > --- a/include/hw/xen/xen_native.h
> > +++ b/include/hw/xen/xen_native.h
> > @@ -532,7 +532,7 @@ static inline int xendevicemodel_set_irq_level(xendevicemodel_handle *dmod,
> >  }
> >  #endif
> >  
> > -#if CONFIG_XEN_CTRL_INTERFACE_VERSION <= 41700
> > +#if CONFIG_XEN_CTRL_INTERFACE_VERSION >= 41700
> 
> This change is not correct
> 
> We can see the upstream change was introduced in 4.17:
> 
>   $ git describe  2128143c114
>   4.16.0-rc4-967-g2128143c11
> 
> IOW, if we have 4.17 or newer these constants already
> exist. If we have 4.16 or older, then we need to define
> them to provide back compat.
> 
> >  #define GUEST_VIRTIO_MMIO_BASE   xen_mk_ullong(0x02000000)
> >  #define GUEST_VIRTIO_MMIO_SIZE   xen_mk_ullong(0x00100000)
> >  #define GUEST_VIRTIO_MMIO_SPI_FIRST   33
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
--8323329-855051027-1702074176=:1703076--

