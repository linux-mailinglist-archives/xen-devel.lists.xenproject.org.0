Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD4E95E31B
	for <lists+xen-devel@lfdr.de>; Sun, 25 Aug 2024 13:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783122.1192527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siBUl-0008KI-Fg; Sun, 25 Aug 2024 11:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783122.1192527; Sun, 25 Aug 2024 11:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siBUl-0008In-Cq; Sun, 25 Aug 2024 11:33:19 +0000
Received: by outflank-mailman (input) for mailman id 783122;
 Sun, 25 Aug 2024 11:33:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DkcR=PY=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1siBUk-0008Ih-IJ
 for xen-devel@lists.xenproject.org; Sun, 25 Aug 2024 11:33:18 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d13436a3-62d5-11ef-8776-851b0ebba9a2;
 Sun, 25 Aug 2024 13:33:15 +0200 (CEST)
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
X-Inumbo-ID: d13436a3-62d5-11ef-8776-851b0ebba9a2
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724585594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=traTpRXPEY3SvX85V4UNHLV9avrLQDajKAbi9KW9Mas=;
	b=qn2bhicOfVHkdU7ck2v9tQF6W6WaJTXtqZEiWMHDfSL0Ev8o4KvGgHaALZgsyIAuFmttgs
	z5VnO+/6JY/fpXdhsiJya6hJDEm92zNzekboN60EFMExyIDu4ptFxzhH4F3Ic/cIAkD5Z3
	eTpykbtlXrP26a2G14buyr1ILLvcF3Fwjw+fU4Ds0yx9zmYL070XfvOjMbFbx0+G7GP/qN
	QWk0cMlQW6lVQzcayW3GOUwF4N5MKvBs+rCVlIVgoMHKGRHCRYdZj9qmfE8WafyxZ6YmSX
	+njM55adqgFTMeTO5hcBsEL9u4XGST4sctn9iwM/3LHcUT2tKJnm1xD+iixu3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724585594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=traTpRXPEY3SvX85V4UNHLV9avrLQDajKAbi9KW9Mas=;
	b=362fE7OT8P33AoXzNCnYkmiiNxEZ9GS9ZEvhn7ufxaWm1AsSruiz/SNKSgf7TwmCNyijB9
	4r4ytqAeRlb3O+Cg==
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
 <robin.murphy@arm.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] dma-mapping: clear mark DMA ops as an architecture feature
In-Reply-To: <20240824035817.1163502-2-hch@lst.de>
References: <20240824035817.1163502-1-hch@lst.de>
 <20240824035817.1163502-2-hch@lst.de>
Date: Sun, 25 Aug 2024 13:33:13 +0200
Message-ID: <87ed6cg7ly.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Aug 24 2024 at 05:57, Christoph Hellwig wrote:
> DMA ops are a helper for architectures and not for drivers to override
> the DMA implementation.  Unfortunately driver authors keep ignoring
> this.  Make this more clear by renaming the symbol to ARCH_DMA_OPS,
> have the three drivers overriding it depend on that.  They should
> probably also be marked broken, but we can give them a bit of a grace
> period for that.

One week :)

> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

