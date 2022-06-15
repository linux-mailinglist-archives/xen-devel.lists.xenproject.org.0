Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6BF54C76A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 13:25:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350032.576254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1R8P-0001bx-Tx; Wed, 15 Jun 2022 11:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350032.576254; Wed, 15 Jun 2022 11:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1R8P-0001aB-QT; Wed, 15 Jun 2022 11:24:29 +0000
Received: by outflank-mailman (input) for mailman id 350032;
 Wed, 15 Jun 2022 11:24:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGfn=WW=bombadil.srs.infradead.org=BATV+cd04db8a85bff7cd13dc+6870+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1o1R8O-0001a5-0d
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 11:24:28 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b52e7928-ec9d-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 13:24:26 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o1R8I-00E9lp-6L; Wed, 15 Jun 2022 11:24:22 +0000
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
X-Inumbo-ID: b52e7928-ec9d-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BK8bIaaa2wq3VpZdMmSbQMojkUO+GHs4/AOKLZKBl7Q=; b=UB+Jljv2uYmYDQ6VXlacVbsXef
	dqTRZnATTAR/5b7GUWgSzE2FyUwMS4FTTKpvLECUeCtZ50iJ1WdKIYoleKOcawth62F9jFMifLH48
	PAt5nKttUO4No+iT6DksuV0nbb73d28QWyXshaWvgzjsMgR7Oiy/6VA9EiKsjGoL/SOxns4rzYxQj
	/nN7UlP7WD9hOWDF1/jaod4Gu888DPsfRrTbvJxkllsilOnIN5u15pb8xTD1Qgi4f4RZPzZZKC4MK
	QRVBML5IGUKiQeW7tocw75XsUZrep09UuxgSrXGIMzD7EXwzqK/rvezMjvOxA9v2PTZgTAzI7kpte
	P3e2OYXQ==;
Date: Wed, 15 Jun 2022 04:24:22 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen: don't require virtio with grants for non-PV guests
Message-ID: <YqnBZhiLOHnoalbC@infradead.org>
References: <20220615084835.27113-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615084835.27113-1-jgross@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

I don't think this command line mess is a good idea.  Instead the
brand new grant devices need to be properly advertised in the device
tree, and any device that isn't a grant device doesn't need
VIRTIO_F_ACCESS_PLATFORM.  No need for a command line or user
intervention.


