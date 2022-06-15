Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EB654C7F2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 13:54:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350069.576298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Rb4-0007Tb-57; Wed, 15 Jun 2022 11:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350069.576298; Wed, 15 Jun 2022 11:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Rb4-0007Ro-23; Wed, 15 Jun 2022 11:54:06 +0000
Received: by outflank-mailman (input) for mailman id 350069;
 Wed, 15 Jun 2022 11:54:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGfn=WW=bombadil.srs.infradead.org=BATV+cd04db8a85bff7cd13dc+6870+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1o1Rb2-0007Ri-8H
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 11:54:04 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d93a6211-eca1-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 13:54:02 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o1Ray-00EISR-Pg; Wed, 15 Jun 2022 11:54:00 +0000
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
X-Inumbo-ID: d93a6211-eca1-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZvNzq09TdLzqZwexljuHETkJeL+6Sds0r4wzjQ/HMi4=; b=i4MVsHiQuG8LAiV+GqX7FPx/Gk
	/3Tg3rurZJZ8OxfjdxMPfSslNT96JSU/5vr53PlGFmdDVaW7XyInbVmDA+JEuPSBhh4MXvqEtaaRM
	fpnX61iUuQff4KbGQyR/4J3vcwTDMYTn7uekJLv8VQbx7HDBKs+B9GWhfZHVCFSC5c4AFsauHQHVC
	jocf22X585lFpCZk6vhrJZ5Hgwv4SBz/5yMxzYg4iW0hhY5bkDlgmgnK6P0xCy4GcSqKdrCGFPH0v
	Aky09pIl07V83eXE3N+mzaOIoi/xrivF6WMm7zXamcRZsArr+jQwkXru0rQNt8nPgiCtxEuWeHjk/
	mQljCOwg==;
Date: Wed, 15 Jun 2022 04:54:00 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: Christoph Hellwig <hch@infradead.org>, xen-devel@lists.xenproject.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen: don't require virtio with grants for non-PV guests
Message-ID: <YqnIWCXxsGzkfQp7@infradead.org>
References: <20220615084835.27113-1-jgross@suse.com>
 <YqnBZhiLOHnoalbC@infradead.org>
 <9b9785f5-085b-0882-177f-d8418c366beb@suse.com>
 <YqnCZ+EKZeZ5AEnr@infradead.org>
 <c5a521e0-26b1-b1d6-7f7d-00aa9b4b1e0e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5a521e0-26b1-b1d6-7f7d-00aa9b4b1e0e@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Jun 15, 2022 at 01:39:01PM +0200, Juergen Gross wrote:
> No, it doesn't. I'm working on a qemu patch series enabling the qemu
> based backends to support grants with virtio. The code is working fine
> on x86, too (apart from the fact that the backends aren't ready yet).

The code right now in mainline only ever sets the ops for DMA.  So
I can't see how you could make it work.

