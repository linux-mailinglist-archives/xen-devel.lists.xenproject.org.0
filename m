Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B0A41F141
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 17:29:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200764.355333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWKT7-0005CC-4i; Fri, 01 Oct 2021 15:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200764.355333; Fri, 01 Oct 2021 15:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWKT7-00059c-1i; Fri, 01 Oct 2021 15:29:01 +0000
Received: by outflank-mailman (input) for mailman id 200764;
 Fri, 01 Oct 2021 15:28:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xS6=OV=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1mWKT5-00059W-Fm
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 15:28:59 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4bdfbcfe-22cc-11ec-bdb4-12813bfff9fa;
 Fri, 01 Oct 2021 15:28:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E40661A6F;
 Fri,  1 Oct 2021 15:28:57 +0000 (UTC)
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
X-Inumbo-ID: 4bdfbcfe-22cc-11ec-bdb4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1633102138;
	bh=niK2N0n5hIFSNGOKBWBl+J6uRun5yG+bcgN8gmYM7Vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SyK+OXYcQH6Wu+IUyJxCMR2ZWu1juVPrb3ea9UOVZDOOpROfob9jNNaA+8fYyV+Cv
	 6o3VzanXkwB27G4TBqHFvvFW/wZYrzziqcnqGnF7rbafo40YlnXkB+Yh9sYtN6dvlB
	 CtNrCP/W8ZfGE6Gu0rJw5761qvZXLCTVvz1ylZ9A=
Date: Fri, 1 Oct 2021 17:28:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 0/3] xen, usb: support pvUSB frontend driver
Message-ID: <YVcpNwTtnm2KAnP+@kroah.com>
References: <20211001150039.15921-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001150039.15921-1-jgross@suse.com>

On Fri, Oct 01, 2021 at 05:00:36PM +0200, Juergen Gross wrote:
> This series adds XEN guest pvUSB support. With pvUSB it is possible to
> use physical USB devices from a XEN domain.
> 
> Since V4 a lot of time (several years) has passed. This is a revived
> attempt to get the frontend into the kernel.
> 
> The support consists of a frontend in form of a virtual hcd driver in
> the unprivileged domU passing I/O-requests to the backend in a driver
> domain (usually Dom0). The backend is not part of this patch series,
> as it is supported via qemu.
> 
> The code is taken (and adapted) from the original pvUSB implementation
> done for Linux 2.6 in 2008 by Fujitsu.
> 
> Normal operation of USB devices by adding and removing them dynamically
> to/from a domain has been tested using various USB devices (USB 1.1,
> 2.0 and 3.0) using the qemu based backend.
> 
> Changes in V5:
> - added interface documentation to patch 1
> - frontend no longer trusts backend to return only sane values

You forgot to send patch 3/3 to the linux-usb list :(

