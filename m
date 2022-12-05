Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7D6642C69
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 17:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454025.711670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Dts-0002lu-Tg; Mon, 05 Dec 2022 16:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454025.711670; Mon, 05 Dec 2022 16:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Dts-0002iV-Qi; Mon, 05 Dec 2022 16:01:00 +0000
Received: by outflank-mailman (input) for mailman id 454025;
 Mon, 05 Dec 2022 16:00:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/AS2=4D=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1p2Dtr-0002iP-8j
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 16:00:59 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 015a57bb-74b6-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 17:00:57 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BC54BB81144;
 Mon,  5 Dec 2022 16:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D945AC433B5;
 Mon,  5 Dec 2022 16:00:54 +0000 (UTC)
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
X-Inumbo-ID: 015a57bb-74b6-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670256055;
	bh=trNrKrfKjsfA/iJHoM4RlcQMgCcsX15/LCiL4T/xuJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EXkPiPH9jpu2QDhpC1k592OE6zoYsvZ6Cm6TtkRBZj9flj8DPe/+/ck94MscE/Hy+
	 PVn+ynbqHg6LhzriIAOKH+7f1fPldEuUHPztcK+v0tQmwdicxIaCw7If8OtrPmpjh+
	 OYAzWhpAg9ucHwpcZ/6qG8GRvR0WojmPy76I8FYg=
Date: Mon, 5 Dec 2022 17:00:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dawei Li <set_pte_at@outlook.com>
Cc: johannes@sipsolutions.net, robert.jarzmik@free.fr, jgross@suse.com,
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
	roger.pau@citrix.com, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] Make remove() of any bus based driver void returned
Message-ID: <Y44VtN/rmjIU6sDC@kroah.com>
References: <TYCP286MB23234ABCCF40E3FC42FD09A4CA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB23234ABCCF40E3FC42FD09A4CA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>

On Mon, Dec 05, 2022 at 11:36:38PM +0800, Dawei Li wrote:
> For bus-based driver, device removal is implemented as:
> device_remove() => bus->remove() => driver->remove()
> 
> Driver core needs no feedback from bus driver about the result of
> remove callback. In which case, commit fc7a6209d571 ("bus: Make
> remove callback return void") forces bus_type::remove be void-returned.
> 
> Now we have the situation that both 1st & 2nd part of calling chain
> are void returned, so it does not make much sense for the last one
> (driver->remove) to return non-void to its caller.
> 
> So the basic idea behind this patchset is making remove() callback of
> any bus-based driver to be void returned.
> 
> This patchset includes changes for drivers below:
> 1. hyperv
> 2. macio
> 3. apr
> 4. xen
> 5. ac87
> 6. soundbus

Then that should be 6 different patchsets going to 6 different
subsystems.  No need to make this seems like a unified set of patches at
all.

> Q: Why not platform drivers?
> A: Too many of them.(maybe 4K+)

That will have to be done eventually, right?

thanks,

greg k-h

