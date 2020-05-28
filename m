Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C6A1E64BD
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 16:53:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeJuI-0007vN-0C; Thu, 28 May 2020 14:53:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WTQv=7K=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jeJuG-0007vH-Jx
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 14:53:16 +0000
X-Inumbo-ID: f5a360ea-a0f2-11ea-a7e7-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5a360ea-a0f2-11ea-a7e7-12813bfff9fa;
 Thu, 28 May 2020 14:53:15 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: KsjsF3/PIY/VQi7ER7HxCfPCEmqvkVIg6mZOtHHy90LIffC+dQZN6474J4Mi5yYc7LSO33N7cu
 3FoDa/ykZCXchY+CpnX+7q0nbhRfuCM0Xu9v5xnCimOpJ7od3NCdC+foWQG3k+TEbBRAQXed2G
 MH/htsFJzEW5za5tWFq7MvTgWxDysGeW/cFn7mzushHd55FySO0maXd/9JivQLVNgv7KQo0cLx
 0juo//xEdJBKPcKh2e1b4d1NTZX9M29A27weM2OCY4tvbmoe2bTZ8h6DF0C9/aocS6FraE4NOn
 7V4=
X-SBRS: 2.7
X-MesageID: 19021734
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,445,1583211600"; d="scan'208";a="19021734"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24271.53336.125796.634580@mariner.uk.xensource.com>
Date: Thu, 28 May 2020 15:53:12 +0100
To: Julien Grall <julien@xen.org>
Subject: Re: [OSSTEST PATCH 22/38] buster: Extend guest bootloader workaround
In-Reply-To: <e4e7e515-587a-ad81-c9b7-b7cfa69108be@xen.org>
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
 <20200519190230.29519-23-ian.jackson@eu.citrix.com>
 <7747c676-f9da-cb97-bd93-78dc13138d03@xen.org>
 <24261.17724.382954.918761@mariner.uk.xensource.com>
 <e4e7e515-587a-ad81-c9b7-b7cfa69108be@xen.org>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Julien Grall writes ("Re: [OSSTEST PATCH 22/38] buster: Extend guest bootloader workaround"):
> On 20/05/2020 15:57, Ian Jackson wrote:
> > Julien Grall writes ("Re: [OSSTEST PATCH 22/38] buster: Extend guest bootloader workaround"):
> >> On 19/05/2020 20:02, Ian Jackson wrote:
> >>>    	# Debian doesn't currently know what bootloader to install in
> >>>    	# a Xen guest on ARM. We install pv-grub-menu above which
> >>
> >> OOI, what does Debian install for x86 HVM guest? Is there any ticket
> >> tracking this issue?
> > 
> > On x86, it installes grub.  (grub2, x86, PC, to be precise.)
> 
> I have just realized that on x86 you will always have a firmware in the 
> guest. On Arm we commonly boot the kernel directly.

Yes.  At leave, for HVM.

> So maybe we are closer to PV here. Do you also install GRUB in that case?

It's Complicated.  There are several options, but the usual ones are:

1. pygrub: Install some version of grub, which generates
   /boot/grub.cfg.  It doesn't matter very much which version of grub
   because grub.cfg is read by pygrub in dom0 and that fishes out the
   kernel and initrd.  Many of osstest's tests do this.

2. host kernel: Simply pass the dom0 kernel *and initramfs* as the
   kernel image to the guest.  This works if the kernel has the right
   modules for the guest storage, which it can easily do.  On x86 an
   amd64 kernel can run an i386 userland.

3. pvgrub.

> Note that we do support EDK2 at least on Arm64. It would be nice to get 
> some tests for it in Osstest in the future.

Is this the same as "EADK" ?  I'm afraid I don't follow...

> > I'm not aware of any ticket or bug about this.
> 
> It might be worth creating one then.

Where should I do that ?  I guess I mean, in which bugtracker ?

Thanks,
Ian.

