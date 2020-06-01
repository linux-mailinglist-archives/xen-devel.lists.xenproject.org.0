Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 146431EA7A0
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 18:13:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfn3V-0000KW-VX; Mon, 01 Jun 2020 16:12:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T30I=7O=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jfn3U-0000KR-VT
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 16:12:53 +0000
X-Inumbo-ID: bdfab4ee-a422-11ea-ab2f-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdfab4ee-a422-11ea-ab2f-12813bfff9fa;
 Mon, 01 Jun 2020 16:12:51 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 99760206C3;
 Mon,  1 Jun 2020 16:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591027970;
 bh=KR0RYgpHZ2PN6KaQgrrKmx5yqFIfhICtOodWI3QPFSg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=xRCt56M+uT7gaPF9KQh/HF/wm3gP3GII7msL8Zbv6PT9ucWdLsEBCaDQkIxuiIe6M
 6pxa1R7EWFCPIBI+cNIYRtDIOedxKtUAr2Z+c2rSHU85M1OAkHjTcv7JtGcDTwdiKH
 +rRJ3srZYhb9EyItznW6AOU4X534gC+ih08LHcmw=
Date: Mon, 1 Jun 2020 09:12:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Roman Shaposhnik <roman@zededa.com>
Subject: Re: UEFI support in ARM DomUs
In-Reply-To: <CAMmSBy_djgfQ1NT2TGo+1=7c20PyX-mzf6JiPx5ibnRkFT_5BQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2006010911260.12801@sstabellini-ThinkPad-T480s>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <CAJ=z9a2B1+A8jPXiE9adNSTWHENtULnmAxq2M5v6MxB5thZLfw@mail.gmail.com>
 <CAMmSBy_djgfQ1NT2TGo+1=7c20PyX-mzf6JiPx5ibnRkFT_5BQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, George.Dunlap@citrix.com,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

+ George

On Sun, 31 May 2020, Roman Shaposhnik wrote:
> Hi Julien!
> 
> On Sun, May 31, 2020 at 3:24 PM Julien Grall <julien.grall.oss@gmail.com> wrote:
> >
> > On Sun, 31 May 2020 at 23:05, Roman Shaposhnik <roman@zededa.com> wrote:
> > > Hi!
> > >
> > > with a lot of help from Stefano, we're getting RPi4 support in
> > > Project EVE pretty much on par between KVM and Xen.
> > >
> > > One big area that still remains is supporting UEFI boot sequence
> > > for DomUs. With KVM, given the qemu virt device model this is
> > > as simple as using either stock UEFI build for arm or even U-Boot
> > > EFI emulation environment and passing it via -bios option.
> > >
> > > Obviously with Xen on ARM we don't have the device model so
> > > my understanding is that the easiest way we can support it would
> > > be to port UEFI's OvmfPkg/OvmfXen target to ARM (it seems to
> > > be currently exclusively X64).
> >
> > EDK2 has been supporting Xen on Arm for the past 5 years. We don't use
> > OvmfPkg/OvmfXen but ArmVirtPkg/ArmVirtXen (see [1]).
> > I haven't tried to build it recently, but I should be able to help if
> > there is any issue with it.
> >
> > Cheers,
> >
> > [1] https://github.com/tianocore/edk2/blob/master/ArmVirtPkg/ArmVirtXen.fdf
> 
> This is really, really awesome -- I guess it would be really helpful to document
> this someplace on the ARM/Xen wiki (I can volunteer if someone can grant
> me the karma).

Regarding the wiki: yes please! Let George know if you don't have write access.


> I've built XEN_EFI.fd and the rest worked out like a charm.
> 
> All on Raspberry Pi 4!

Fantastic!

