Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FC972563E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 09:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544427.850210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ns6-00007f-RU; Wed, 07 Jun 2023 07:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544427.850210; Wed, 07 Jun 2023 07:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ns6-00005t-OG; Wed, 07 Jun 2023 07:46:22 +0000
Received: by outflank-mailman (input) for mailman id 544427;
 Wed, 07 Jun 2023 07:46:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/6g=B3=bombadil.srs.infradead.org=BATV+e57f13fd7911cf5fc1b0+7227+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1q6ns5-00005n-8l
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 07:46:21 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 640123a6-0507-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 09:46:20 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1q6ns0-004nZS-2l; Wed, 07 Jun 2023 07:46:16 +0000
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
X-Inumbo-ID: 640123a6-0507-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zx7QiNnFC0Cpwen1yiSTOeTK/8rpSNjru1sqAkfYhQU=; b=yAWYaRs/exv9l4aW3kRh15uGCe
	26FluPYMyAqbRNSSIKILK5H+P/HRb+mLP2AVCZD8Q6/dOrzSkIWCs7Epg5moTHRi1Pj0dpEWULnsO
	O7NYmBvnRZqEt+xSMqI3EI3MQfvt5yQ42VPSZsOOdcFokDphTUPA66kyZ6YO1YnkrYywoCHQYV3Ea
	0MDsIqEqxuTqVM0/S2p9YhiyYiGf5LX7u3r4ZZIlUTMCZAFMMuz8srwGclvl/WuS8PZXb9qms4iiV
	jkrDp65eAYRHr6bzEzcpMFs/3lcXVHwIJ6nXcIQysCnXcIa9qte7v7qw+LV/9Oskk3ET3QhPsIhKZ
	nl2txkrA==;
Date: Wed, 7 Jun 2023 00:46:16 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] xen-blkback: Inform userspace that device has been
 opened
Message-ID: <ZIA1yLiJyfcJ45vD@infradead.org>
References: <20230601214823.1701-1-demi@invisiblethingslab.com>
 <20230601214823.1701-3-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601214823.1701-3-demi@invisiblethingslab.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

> --- a/drivers/block/xen-blkback/xenbus.c
> +++ b/drivers/block/xen-blkback/xenbus.c
> @@ -3,6 +3,20 @@
>      Copyright (C) 2005 Rusty Russell <rusty@rustcorp.com.au>
>      Copyright (C) 2005 XenSource Ltd
>  
> +In addition to the Xenstore nodes required by the Xen block device
> +specification, this implementation of blkback uses a new Xenstore
> +node: "opened".  blkback sets "opened" to "0" before the hotplug script
> +is called.  Once the device node has been opened, blkback sets "opened"
> +to "1".

This is a really odd comment style, and a really strange place for it.
To me it feels like this should just be a file in Documentation as it
relates to how to use the driver, and doesn't really explain the code.

