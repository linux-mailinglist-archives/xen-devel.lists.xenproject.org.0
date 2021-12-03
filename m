Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 548924677A2
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 13:49:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237570.412035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt80G-0006aQ-Hg; Fri, 03 Dec 2021 12:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237570.412035; Fri, 03 Dec 2021 12:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt80G-0006Y5-EV; Fri, 03 Dec 2021 12:49:28 +0000
Received: by outflank-mailman (input) for mailman id 237570;
 Fri, 03 Dec 2021 12:49:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yEHZ=QU=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1mt80E-0006Xz-IL
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 12:49:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 702cfd1f-5437-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 13:49:24 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D256F62A30;
 Fri,  3 Dec 2021 12:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1CDC53FC7;
 Fri,  3 Dec 2021 12:49:20 +0000 (UTC)
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
X-Inumbo-ID: 702cfd1f-5437-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638535761;
	bh=gp94SRYawnm+2OyVuYPvciRbORwhED6UQuA7fvk+mng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rrnhkgXG+JHJZrkhMzsKW6pcdjm64IJORZ170ZEnD0B1qJhscCgGMEC5kiuuNGVlf
	 wIOWmELvcoXTQZTnps4wVOwo3W0Wj6rKWLbHToizoyJBoQ4nueu2nCNp6FOx8bXOBj
	 PRz9KUlJ/Vwuo0X7IxQ/EGZ6VKiTiXICAFsvBy9w=
Date: Fri, 3 Dec 2021 13:49:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/3] usb: Introduce Xen pvUSB frontend (xen hcd)
Message-ID: <YaoSTnkYyCFXOyvJ@kroah.com>
References: <20211123132048.5335-1-jgross@suse.com>
 <20211123132048.5335-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123132048.5335-3-jgross@suse.com>

On Tue, Nov 23, 2021 at 02:20:47PM +0100, Juergen Gross wrote:
> Introduces the Xen pvUSB frontend. With pvUSB it is possible for a Xen
> domU to communicate with a USB device assigned to that domU. The
> communication is all done via the pvUSB backend in a driver domain
> (usually Dom0) which is owner of the physical device.
> 
> The pvUSB frontend is a USB hcd for a virtual USB host connector.
> 
> The code is taken from the pvUSB implementation in Xen done by Fujitsu
> based on Linux kernel 2.6.18.
> 
> Changes from the original version are:
> - port to upstream kernel
> - put all code in just one source file
> - move module to appropriate location in kernel tree
> - adapt to Linux style guide
> - minor code modifications to increase readability
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  drivers/usb/host/Kconfig   |   11 +
>  drivers/usb/host/Makefile  |    1 +
>  drivers/usb/host/xen-hcd.c | 1606 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 1618 insertions(+)
>  create mode 100644 drivers/usb/host/xen-hcd.c

This looks sane to me, but I don't know the HCD interface as well as
others on linux-usb do, like Alan Stern.

What tree do you want this to be merged through, my USB one?

thanks,

greg k-h

