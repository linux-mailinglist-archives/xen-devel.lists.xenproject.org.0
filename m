Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 898CF91745C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 00:44:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748133.1155718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMEtD-0003w8-In; Tue, 25 Jun 2024 22:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748133.1155718; Tue, 25 Jun 2024 22:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMEtD-0003ts-GE; Tue, 25 Jun 2024 22:43:51 +0000
Received: by outflank-mailman (input) for mailman id 748133;
 Tue, 25 Jun 2024 22:43:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wboy=N3=linux-foundation.org=akpm@srs-se1.protection.inumbo.net>)
 id 1sMEtC-0003tj-1R
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 22:43:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 620abea4-3344-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 00:43:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4E80861780;
 Tue, 25 Jun 2024 22:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3666BC32781;
 Tue, 25 Jun 2024 22:43:45 +0000 (UTC)
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
X-Inumbo-ID: 620abea4-3344-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1719355426;
	bh=TXSHlymv2cQdW6Cq8S2aO79qhvv/iUOqt59Pv0/5CXU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LalejVUMAXCZLbTrD760WCKxVsMt+y/H6z57ZUZWJ8bcVEpj19D2HYs0wTGwNfn50
	 lWMnhSd6uPZeT602t95YLigRh7bMgkNVpbcXDY0b13d+wNFpIToVB/OIU9+bzKAotf
	 ohw/Pr2e6FkpvNZtWPIghnTGjZ2Dym6GlV1UmDWg=
Date: Tue, 25 Jun 2024 15:43:44 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 xen-devel@lists.xenproject.org, kasan-dev@googlegroups.com, Mike Rapoport
 <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu
 <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?ISO-8859-1?Q?P=E9rez?=
 <eperezma@redhat.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH v1 0/3] mm/memory_hotplug: use PageOffline() instead of
 PageReserved() for !ZONE_DEVICE
Message-Id: <20240625154344.9f3db1ddfe2cb9cdd5583783@linux-foundation.org>
In-Reply-To: <20240607090939.89524-1-david@redhat.com>
References: <20240607090939.89524-1-david@redhat.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

afaict we're in decent state to move this series into mm-stable.  I've
tagged the following issues:

https://lkml.kernel.org/r/80532f73e52e2c21fdc9aac7bce24aefb76d11b0.camel@linux.intel.com
https://lkml.kernel.org/r/30b5d493-b7c2-4e63-86c1-dcc73d21dc15@redhat.com

Have these been addressed and are we ready to send this series into the world?

Thanks.

