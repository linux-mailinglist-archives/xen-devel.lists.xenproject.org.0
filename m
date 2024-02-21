Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F7385D889
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 13:59:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684013.1063651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcmBf-0007eo-BZ; Wed, 21 Feb 2024 12:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684013.1063651; Wed, 21 Feb 2024 12:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcmBf-0007bi-7t; Wed, 21 Feb 2024 12:58:59 +0000
Received: by outflank-mailman (input) for mailman id 684013;
 Wed, 21 Feb 2024 12:58:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RCxi=J6=bombadil.srs.infradead.org=BATV+bafd7931fd2c4139f05c+7486+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rcmBc-0007bV-4N
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 12:58:57 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5b8fee7-d0b8-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 13:58:52 +0100 (CET)
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rcmBU-00000000wAK-1ase; Wed, 21 Feb 2024 12:58:48 +0000
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
X-Inumbo-ID: f5b8fee7-d0b8-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=TLqbe5eB45zE6JDeJk2bwZfFOKKXQJ5aMNlrvDgw0Fs=; b=TLLFdF3hIPpuyvuEvHNUa/tPbJ
	D3wPfOyi+liltFjp06FdZVYZl+ndpbqTNHOg5WaQMvN51FsQpycpPo3LWgpFdF5ECcChTDVyXrmEx
	G1cdzOrAuFLGwBEL/r69hIkvu31pidcEkYJMDDUfndvC8oyVBi16xG3UXLKpsBq+dqTmlN7rbEqlC
	ML7OCIydIMJk4sFKe53MLlbOxWekXLOyGWNXZJKO3aU9WvULwUnlAVVHC9/N3saQ4RxUxI2lB3rFv
	/8Z80oV7eGgtrXTGM9ZJsi/1kgv6jg404yDrtwwkh5dQWFxSHtp2sQZXyQkYMeuZZWcn8SS1IXva9
	3TFHREWg==;
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: convert xen-blkfront to atomic queue limit updates v2
Date: Wed, 21 Feb 2024 13:58:41 +0100
Message-Id: <20240221125845.3610668-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi all,

this series converts xen-blkfront to the new atomic queue limits update
API in the block tree.  I don't have a Xen setup so this is compile
tested only.

Changes since v1:
 - constify the info argument to blkif_set_queue_limits
 - remove a spurious word from a commit message

Diffstat:
 xen-blkfront.c |   53 +++++++++++++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 26 deletions(-)

