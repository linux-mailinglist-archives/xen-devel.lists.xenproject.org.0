Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D48B030AFC6
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 19:52:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80094.146219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6eIs-0004wE-9p; Mon, 01 Feb 2021 18:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80094.146219; Mon, 01 Feb 2021 18:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6eIs-0004vp-6c; Mon, 01 Feb 2021 18:52:02 +0000
Received: by outflank-mailman (input) for mailman id 80094;
 Mon, 01 Feb 2021 18:52:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l6eIq-0004vk-AF
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 18:52:00 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25eb2018-c5f6-4e41-a5dd-f774b7cfe454;
 Mon, 01 Feb 2021 18:51:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D647464DDF;
 Mon,  1 Feb 2021 18:51:57 +0000 (UTC)
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
X-Inumbo-ID: 25eb2018-c5f6-4e41-a5dd-f774b7cfe454
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612205518;
	bh=S6ELnD9R8YsJ3bwtYYpTrt6x7n/ZBii0HHtjMePRs30=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=e4O5jeImRhPeoiNW44J2TMs+gufMcxE/uqHsGZmXlQj655SF8X82gYJRBl7dHQseR
	 QuDi7aLK06oU3Y188akcPTqgndngkTU98MPKTxQABaDp3RK7Tbhfx1DhDXglfWjgdA
	 i3sN/Ony0TARZwulZ6+ysCBLEUnwXQ7en+ooTAO5+zTVMRdzAu8ap8GAsESfjLpxrO
	 YgGBabCyLYLssbSm6SfvzdXGzj6SQ65ujB0rThFvo1CwWqhWMEA1TNQPzDdn7Nzr4W
	 gaMoDl5RsQ+eF9VwL1LEZ8R0jVRh7dC1cdF5eIZCKpENTYcWGIVGC32Z+HzMUQkfKy
	 sKKboJCz7HttA==
Date: Mon, 1 Feb 2021 10:51:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
cc: Elliott Mitchell <ehem+xen@m5p.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: Xen 4.14.1 on RPI4: device tree generation failed
In-Reply-To: <CABfawhmE20u8PpKK6N2SNwOSjeOyfhqa8U48jykswbw9Yhnpvg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2102011050400.29047@sstabellini-ThinkPad-T480s>
References: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com> <YBc+Iaf1CCgXO0Aj@mattapan.m5p.com> <CABfawhncPyDKy_G2Lz7MaEb_ZoPadHef7S7KAj-fbCbQq6YNGA@mail.gmail.com> <YBdgf4KKcDn0SCOw@mattapan.m5p.com> <CABfawhmrWX6tO-bESuF5oGec5cLbkHdyjdCGsfwX5AVrwQBsKA@mail.gmail.com>
 <CABfawhmE20u8PpKK6N2SNwOSjeOyfhqa8U48jykswbw9Yhnpvg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 31 Jan 2021, Tamas K Lengyel wrote:
> This seems to have been caused by a monitor being attached to the HDMI
> port, with HDMI unplugged dom0 boots OK.

FYI others have reported issues with swiotlb-xen when using graphics:
https://marc.info/?l=xen-devel&m=161201486021603 Disabling swiotlb-xen
makes it work for them.

