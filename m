Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3351409F4D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 23:39:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185956.334714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPteZ-0006rz-MY; Mon, 13 Sep 2021 21:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185956.334714; Mon, 13 Sep 2021 21:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPteZ-0006or-JE; Mon, 13 Sep 2021 21:38:15 +0000
Received: by outflank-mailman (input) for mailman id 185956;
 Mon, 13 Sep 2021 21:38:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+zYr=OD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mPteY-0006ol-64
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 21:38:14 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e58adb22-14da-11ec-b3d0-12813bfff9fa;
 Mon, 13 Sep 2021 21:38:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41FF1610CC;
 Mon, 13 Sep 2021 21:38:12 +0000 (UTC)
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
X-Inumbo-ID: e58adb22-14da-11ec-b3d0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631569092;
	bh=Rdv0jKDD++IGTZnpLfELey+D0L8ESYDKerKIBVDBBvw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aNGistF5nR8gdC4CY6xsJSDI2+bIF3shn7XBhg/PGpLBojUbwcauauwH3IhnOUb2q
	 CVmfjK+xBzjOhR1iB33X6nEDY9L/DD6x0BsG26qMeAqbKQtgygyg7pv4hSy4gBiOT3
	 lrUtsVl4lLtA+6ZHl8jletGKvllaXTOv6gtTqQRcTH7KTuaVJ7de0djrobmsFQHa3L
	 2+g038VR05s9Eficuh9Kdn3DCdZU08Q4ZokeR6P40H3Q7zqX6iimfO5N43Hn3R6m+n
	 2c99Jj4lub37SiT7L2ZzbXxKZIWVqn612ekjsnRExORLywKQLdzY4X4NpDjVaNDgLW
	 h3TzhWNqRX70Q==
Date: Mon, 13 Sep 2021 14:38:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Sai Kiran Kumar Reddy Y <ysaikiran1997@gmail.com>
cc: Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    kannan@cimware.in
Subject: Re: Xen Booting Problem on ARM Machine
In-Reply-To: <CAEsO4uzsCnsTtTmYHAT4NN6=girCY2NHHdAHbH6GG33D7jwe_A@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2109131437030.10523@sstabellini-ThinkPad-T480s>
References: <33C29853-D896-4E4E-91D3-4D2FA89A9B91@hxcore.ol> <eb5fd47b-6bc9-2eec-7f46-9ab9a42c9f1f@xen.org> <CAEsO4uzsCnsTtTmYHAT4NN6=girCY2NHHdAHbH6GG33D7jwe_A@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1012743033-1631569092=:10523"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1012743033-1631569092=:10523
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 13 Sep 2021, Sai Kiran Kumar Reddy Y wrote:
> On Fri, Sep 10, 2021 at 7:30 PM Julien Grall <julien@xen.org> wrote:
> 
> 
>       On 08/09/2021 11:43, Sai Kiran wrote:
>       > Hello,
> 
>       Hi,
> 
>       Thank you for the report. Moving the discussion back to xen-devel
>       because this looks like a potential issue in the UEFI stub in Xen.
> 
>       > I have Xen-4.15.0 on an ARM Machine, with Debian 11 installed on it.
> 
>       Would you be able to give more details on the Arm machine you are using?
>       Also, are you using ACPI or DT to boot?
> 
> 
>    Sai >> DT . ACPI configuration is disabled in Boot settings    
> 
>       >  I
>       > am able to do “make world” and “make install”, after “./configure”, as
>       > specified in README file. When I reboot the system, I get the following
>       > message:
>       >
>       > Warning: All 128 bootinfo mem banks exhausted.
>       >
>       > Warning: All 128 bootinfo mem banks exhausted.
> 
>       Hmmm... This means that you have more than 128 memory regions described
>       in the EFI memory map. That's quite a lot.
> 
>       Although, this should be harmless as it means Xen will not use the extra
>       memory banks.
> 
>       >
>       > Cannot exit boot services: ErrCode: 0x8000000000000002
> 
>       This means EFI_INVALID_PARAMETER. We have code to retry because AFAICT
>       ExitBootServices() may sometime fails (I have CCed Jan may have more
>       idea what's happening).
> 
>       Would you be able to provide more details on the UEFI firmware you are
>       using? Is it EDK2 or U-boot?
> 
> Sai >>  EDK2 
>       Also, do you know if Linux is boot on the same system?
> 
> Sai >> Yes 
>       However, AFAICT, the error message would not prevent Xen to continue
>       booting. So you may get stuck later in the boot process.
> 
>       My suggestion would be to enable earlyprintk for your platform. You can
>       setup it up from the menuconfig in "Debugging Options".
> 
> Sai >> Yes, I have enabled earlyprintk.
> I tried changing NR_MEM_BANKS(in xen/include/asm-arm/setup.h) value to 256, from 128. The error message is no longer seen, but the device
> is stuck in the boot process.

Could you please post the boot logs now that you enabled earlyprintk?
Ideally not a camera picture but a textual copy/paste from the target
serial?

Earlyprintk is pretty verbose, we should be able to figure out where it
gets stuck.
--8323329-1012743033-1631569092=:10523--

