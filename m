Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C657642BF63
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 14:02:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208298.364374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1macx2-0001IR-Af; Wed, 13 Oct 2021 12:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208298.364374; Wed, 13 Oct 2021 12:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1macx2-0001FZ-6d; Wed, 13 Oct 2021 12:01:40 +0000
Received: by outflank-mailman (input) for mailman id 208298;
 Wed, 13 Oct 2021 12:01:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YJ5V=PB=kroah.com=greg@srs-us1.protection.inumbo.net>)
 id 1macx0-0001Ei-5S
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:01:38 +0000
Received: from wnew1-smtp.messagingengine.com (unknown [64.147.123.26])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49500883-60dd-4a07-b8b7-08b14723f1de;
 Wed, 13 Oct 2021 12:01:37 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 576D32B01147;
 Wed, 13 Oct 2021 08:01:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 13 Oct 2021 08:01:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 08:01:34 -0400 (EDT)
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
X-Inumbo-ID: 49500883-60dd-4a07-b8b7-08b14723f1de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=rWSTPfUE7TPFJmRSRxhKh167/BF
	9qamvvLkRCh+xraU=; b=BnSLwvl8etPnKDZMDCwGFruLeZkA4E0sTOIckHlIQcE
	iHOFRIWF7hYdfjsHi6Cno+mPXAEHvaejeZXrhex5ZTKTrYPAe0+juEwn/3KqgU0c
	2UxnIWfBiwMd4fV1w0dvuA+U3AW/lD+NWzcfpQ6SL5TCkbQgqRUBO/KgA8fa5M+E
	DB8AQ40sQMusqn75Mpya7tFXp62c+G6twWvpXWfA8bZyllWYAF8oZ8c6/AF8vxLw
	MaUqtQr4zPuy4bqifhli/0JLwDVZMV4yf3eShY8h/p/ro6w66yuYz+z+F0cSNXOy
	tyQxngCkycA/UJ18RWUc5LdwbEXXE/QFeGrbhOy8nhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=rWSTPf
	UE7TPFJmRSRxhKh167/BF9qamvvLkRCh+xraU=; b=leJQVqYOo3MK1AKg8I93W9
	poDakF5UaXQBBF2bHZWXF+os/St+iXLxvzMPssyxVES2wmBwPiSz75/y/1xLRtRb
	WawJH0zPEjTvIDfiGTHlF+ef6DzPODmwIoT1QHiyD3uhOzzwqtci4nFgV+zR8Mb/
	ypRbTHoT0/xTNGO+OTeJYIF055130iF6xceJNEwX9pnLXVd4cK7bJozZRu/nHVLO
	QkJwXVs80hzb6mHbfEesObZ2DfQRsiV8322FZ4bkts+rDnjN6p1s5IZCliZe41/X
	y8n6mNHXuORGbgj+jdySTGrKMHCx9W8a1+hpgkQ/gbjDJL4LFC0kYL/BVuwRUZyg
	==
X-ME-Sender: <xms:nspmYVGYX69udfCGH8GMeoaBVhTzR-qQPyLl5uyX2BIOyOuhybvcIA>
    <xme:nspmYaW8Ln-UPe5UVhb7JJ3w0lAV-ecJaDTjakLbE9CXXRPZnM0ki5XdQszyAXtiP
    DFlTQfr_D1RgA>
X-ME-Received: <xmr:nspmYXLo3hk2RSvPCnEtgPHi1fqREDQT7kXmz2jYIygKkau9nkd8pDc1z7TiiO84awA12_n_DaoUJPhJ_uE7FE7UrNr_aetz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:nspmYbHQurJsJju3UTcqVrn7HlgeoGN0KHK-VEWT273tWVLbQFkBbA>
    <xmx:nspmYbWleQ4P5mlKqbAQhWNU66AAqX2bkVMsfgIyyhTmOrycQRVuPA>
    <xmx:nspmYWPIbq72nnLU_PyUxHK9F_UYfqipSYRNXXmSikdMtb0zxFf2Dw>
    <xmx:nspmYUMPmSZrp79yZ1_Yi3EqFcYq0HUkh_YVJQnbbqsQmR4r8WLBhOBiovY>
Date: Wed, 13 Oct 2021 14:01:32 +0200
From: Greg KH <greg@kroah.com>
To: Juergen Gross <jgross@suse.com>
Cc: linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 1/3] usb: Add Xen pvUSB protocol description
Message-ID: <YWbKnEMvHGU/rv96@kroah.com>
References: <20211013075207.13910-1-jgross@suse.com>
 <20211013075207.13910-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013075207.13910-2-jgross@suse.com>

On Wed, Oct 13, 2021 at 09:52:05AM +0200, Juergen Gross wrote:
> Add the definition of pvUSB protocol used between the pvUSB frontend in
> a Xen domU and the pvUSB backend in a Xen driver domain (usually Dom0).
> 
> This header was originally provided by Fujitsu for Xen based on Linux
> 2.6.18.
> 
> Changes are:
> - adapt to Linux kernel style guide
> - use Xen namespace
> - add lots of comments
> - don't use kernel internal defines
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> ---
>  include/xen/interface/io/usbif.h | 421 +++++++++++++++++++++++++++++++
>  1 file changed, 421 insertions(+)
>  create mode 100644 include/xen/interface/io/usbif.h
> 
> diff --git a/include/xen/interface/io/usbif.h b/include/xen/interface/io/usbif.h
> new file mode 100644
> index 000000000000..9494b1c9be99
> --- /dev/null
> +++ b/include/xen/interface/io/usbif.h
> @@ -0,0 +1,421 @@
> +/*
> + * usbif.h
> + *
> + * USB I/O interface for Xen guest OSes.
> + *
> + * Copyright (C) 2009, FUJITSU LABORATORIES LTD.
> + * Author: Noboru Iwamatsu <n_iwamatsu@jp.fujitsu.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to
> + * deal in the Software without restriction, including without limitation the
> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
> + * sell copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + */

Please use a SPDX line and not license "boilerplate" text like this :(

thanks,

greg k-h

