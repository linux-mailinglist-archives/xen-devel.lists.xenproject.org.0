Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF461E6672
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 17:42:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeKex-0004an-Pp; Thu, 28 May 2020 15:41:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WTQv=7K=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jeKew-0004ai-72
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 15:41:30 +0000
X-Inumbo-ID: b1f10e80-a0f9-11ea-a7f8-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1f10e80-a0f9-11ea-a7f8-12813bfff9fa;
 Thu, 28 May 2020 15:41:29 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: gaa51i9pdfbywEsCwMif99Nv/ljXkDveN50Kbw1wRdwu2docxTAk5zPX9cwm7G2xvHG+sqsyxH
 aO+HJlkQM4NkAdXNiFpxnI9QIzTISxVtx1id6kfOqN8rBllA1yWjolu5jVdPy2orIWrNF1oXNf
 s9XCK8SMVwuz/xnQ/oe9Vl46gGrEVoaeKVsKBfDsZrtY/JZQNQ5iOI3pPP/GvdIAOx/H6EjnkH
 UDRVqQ8l+VF9Kr5ss51BOfrLog0gTysMYVGDdVfUKLCkzBP37WSVOHZV78f9NqNyA9UVQ9EHvL
 Tmo=
X-SBRS: 2.7
X-MesageID: 18673932
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,445,1583211600"; d="scan'208";a="18673932"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24271.56227.367257.277033@mariner.uk.xensource.com>
Date: Thu, 28 May 2020 16:41:23 +0100
To: Julien Grall <julien@xen.org>
Subject: Re: [OSSTEST PATCH 22/38] buster: Extend guest bootloader workaround
In-Reply-To: <d4fc0391-9f40-86ad-f304-70bb0cd73e9b@xen.org>
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
 <20200519190230.29519-23-ian.jackson@eu.citrix.com>
 <7747c676-f9da-cb97-bd93-78dc13138d03@xen.org>
 <24261.17724.382954.918761@mariner.uk.xensource.com>
 <e4e7e515-587a-ad81-c9b7-b7cfa69108be@xen.org>
 <24271.53336.125796.634580@mariner.uk.xensource.com>
 <d4fc0391-9f40-86ad-f304-70bb0cd73e9b@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Julien Grall writes ("Re: [OSSTEST PATCH 22/38] buster: Extend guest bootloader workaround"):
> On 28/05/2020 15:53, Ian Jackson wrote:
> > It's Complicated.  There are several options, but the usual ones are:
> > 
> > 1. pygrub: Install some version of grub, which generates
> >     /boot/grub.cfg.  It doesn't matter very much which version of grub
> >     because grub.cfg is read by pygrub in dom0 and that fishes out the
> >     kernel and initrd.  Many of osstest's tests do this.
> > 
> > 2. host kernel: Simply pass the dom0 kernel *and initramfs* as the
> >     kernel image to the guest.  This works if the kernel has the right
> >     modules for the guest storage, which it can easily do.  On x86 an
> >     amd64 kernel can run an i386 userland.
> > 
> > 3. pvgrub.
> 
> Thanks for the explanation. How do you select it in the Osstest today?

I think osstest does all three (not very sure about (2).  Installs
made with the Debian xen-tools package tend to do (2) by default.
Installs made with d-i can do (2) or (3).

> > Is this the same as "EADK" ?  I'm afraid I don't follow...
> 
> Sorry, I should have been more precise. I meant that we are able to boot 
> a Arm guest using UEFI as we added support in EDK2 (I think in Xen we 
> use the term ovmf).

Right.

> When using EFI, the guest can boot exactly the same way as it would on 
> baremetal. The toolstack is just loading the firmware in the guest memory.
> 
> IIRC we have already regular EFI testing on x86 in Osstest. I am 
> thinking to extend them to Arm at some point.

Our arm64 boxes are all booting via UEFI right now.

We have to do a different bodge to load xen.efi rather than grub;
osstest makes a xen.cfg.  That bodge is extended to buster by

  Subject: [OSSTEST PATCH 34/38] buster: grub, arm64: extend
      chainloading workaround

> > Where should I do that ?  I guess I mean, in which bugtracker ?
> 
>  From the comment in the code, I would assume this is a bug/enhancement 
> against the Debian installer. But I may have misundertood it.

Oh I see.  I think amybe the problem was the lack of grub support.  Is
that all sorted in current Debian unstable/testing ?  If so it may
well all come out in the wash.

Ian.

