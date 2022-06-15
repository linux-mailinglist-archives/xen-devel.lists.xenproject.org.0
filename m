Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254EE54C782
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 13:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350048.576278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1RCW-0003AT-SR; Wed, 15 Jun 2022 11:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350048.576278; Wed, 15 Jun 2022 11:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1RCW-000371-Pe; Wed, 15 Jun 2022 11:28:44 +0000
Received: by outflank-mailman (input) for mailman id 350048;
 Wed, 15 Jun 2022 11:28:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGfn=WW=bombadil.srs.infradead.org=BATV+cd04db8a85bff7cd13dc+6870+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1o1RCU-00036m-0j
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 11:28:42 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e35593e-ec9e-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 13:28:41 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o1RCR-00EB1m-Bb; Wed, 15 Jun 2022 11:28:39 +0000
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
X-Inumbo-ID: 4e35593e-ec9e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ffs70zIAEPDoQR7c4GQM9h5KRYBlcReN8DDYbmuklWA=; b=eVx0xL+TUT9/UozlSGm3BSao4r
	t4A0k50rGvMY5v0y2l2Lu7kInP8Iuuw2lNBBwjXDQve2/BETf31KEI5uWFKraX1UBrrTHQVr9EObw
	MqIxPKjQMHg2b1n6EvewXsvzMTYm15xPMYAnWZ4KXYnarus+p5ywQRg6pwLgh9jcmoX/cfUML8z0A
	wTkEwU+8XR/zRJXGSR1suj47ftkmSZPxPcpjkOcB4FnubiT1DhUT0LpHrm0vdP32doAJvmx5DkMqb
	9L8oBwaINGC5njlF/BxW0fMQy+3UFXFkTvMhDiK3hApgX19XsumxnSJEFRqzfiU55vd0wyBpOzK3a
	sV+lQJXw==;
Date: Wed, 15 Jun 2022 04:28:39 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: Christoph Hellwig <hch@infradead.org>, xen-devel@lists.xenproject.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen: don't require virtio with grants for non-PV guests
Message-ID: <YqnCZ+EKZeZ5AEnr@infradead.org>
References: <20220615084835.27113-1-jgross@suse.com>
 <YqnBZhiLOHnoalbC@infradead.org>
 <9b9785f5-085b-0882-177f-d8418c366beb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b9785f5-085b-0882-177f-d8418c366beb@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Jun 15, 2022 at 01:26:27PM +0200, Juergen Gross wrote:
> On 15.06.22 13:24, Christoph Hellwig wrote:
> > I don't think this command line mess is a good idea.  Instead the
> > brand new grant devices need to be properly advertised in the device
> > tree, and any device that isn't a grant device doesn't need
> > VIRTIO_F_ACCESS_PLATFORM.  No need for a command line or user
> > intervention.
> 
> And on x86?

ACPI tables or whatever mechanism you otherwise use to advertise grant
based DMA.  But that is irrelevant for now, as the code in mainline
only supports DT on arm/arm64 anyay.

