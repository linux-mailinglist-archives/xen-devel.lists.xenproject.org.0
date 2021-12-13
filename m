Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4243C472E4D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 14:59:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246077.424442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwlqt-0002AZ-7v; Mon, 13 Dec 2021 13:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246077.424442; Mon, 13 Dec 2021 13:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwlqt-00027Y-4D; Mon, 13 Dec 2021 13:58:51 +0000
Received: by outflank-mailman (input) for mailman id 246077;
 Mon, 13 Dec 2021 13:58:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SshG=Q6=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1mwlqr-00027Q-MI
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 13:58:49 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cad679b2-5c1c-11ec-b442-ab1a14567e0c;
 Mon, 13 Dec 2021 14:58:47 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 74B75B80EC1;
 Mon, 13 Dec 2021 13:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD12CC34601;
 Mon, 13 Dec 2021 13:58:44 +0000 (UTC)
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
X-Inumbo-ID: cad679b2-5c1c-11ec-b442-ab1a14567e0c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1639403925;
	bh=yMuVyc4TVgRet2InLRY+bgIaO+2h9DW64nLLI7Las+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bkwud4Z4Makhy+9ZYkFe66k9/JDAvnckgNmbHULq1ycFzFIL7Of5hGfSWm1WDtcfk
	 y2GcLA4riMUt9lyo78RXKGWbBgeEd4qd0YWMCz83/JVYkGVfB9Wal86I7MCdRXBQe8
	 5FtwgpWM99YsYiZ5zl/bg7IgkRhFUNse+WsdDFho=
Date: Mon, 13 Dec 2021 14:58:42 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/3] usb: Introduce Xen pvUSB frontend (xen hcd)
Message-ID: <YbdRkvW/hOH77liY@kroah.com>
References: <20211123132048.5335-1-jgross@suse.com>
 <20211123132048.5335-3-jgross@suse.com>
 <YaoSTnkYyCFXOyvJ@kroah.com>
 <b43c416e-d81a-7d21-5b92-7bc8329bb296@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b43c416e-d81a-7d21-5b92-7bc8329bb296@suse.com>

On Fri, Dec 03, 2021 at 01:50:44PM +0100, Juergen Gross wrote:
> On 03.12.21 13:49, Greg Kroah-Hartman wrote:
> > On Tue, Nov 23, 2021 at 02:20:47PM +0100, Juergen Gross wrote:
> > > Introduces the Xen pvUSB frontend. With pvUSB it is possible for a Xen
> > > domU to communicate with a USB device assigned to that domU. The
> > > communication is all done via the pvUSB backend in a driver domain
> > > (usually Dom0) which is owner of the physical device.
> > > 
> > > The pvUSB frontend is a USB hcd for a virtual USB host connector.
> > > 
> > > The code is taken from the pvUSB implementation in Xen done by Fujitsu
> > > based on Linux kernel 2.6.18.
> > > 
> > > Changes from the original version are:
> > > - port to upstream kernel
> > > - put all code in just one source file
> > > - move module to appropriate location in kernel tree
> > > - adapt to Linux style guide
> > > - minor code modifications to increase readability
> > > 
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > ---
> > >   drivers/usb/host/Kconfig   |   11 +
> > >   drivers/usb/host/Makefile  |    1 +
> > >   drivers/usb/host/xen-hcd.c | 1606 ++++++++++++++++++++++++++++++++++++
> > >   3 files changed, 1618 insertions(+)
> > >   create mode 100644 drivers/usb/host/xen-hcd.c
> > 
> > This looks sane to me, but I don't know the HCD interface as well as
> > others on linux-usb do, like Alan Stern.
> > 
> > What tree do you want this to be merged through, my USB one?
> 
> Either that, or I can carry it through the Xen tree.
> 
> Its your choice. :-)

I've grabbed them now, thanks.

greg k-h

