Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FB585B5CA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 09:50:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683232.1062640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLom-0006W9-Bk; Tue, 20 Feb 2024 08:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683232.1062640; Tue, 20 Feb 2024 08:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLom-0006Ty-82; Tue, 20 Feb 2024 08:49:36 +0000
Received: by outflank-mailman (input) for mailman id 683232;
 Tue, 20 Feb 2024 08:49:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JDQo=J5=bombadil.srs.infradead.org=BATV+d5dc426667c65ded4f96+7485+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rcLok-0006Sb-Oz
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 08:49:35 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6b1af53-cfcc-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 09:49:32 +0100 (CET)
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rcLof-0000000DnT3-1reG; Tue, 20 Feb 2024 08:49:29 +0000
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
X-Inumbo-ID: f6b1af53-cfcc-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=6SfuAW972KnH6xK9mYEnu2XAsI1rZD/avgu8EQxehHo=; b=Y5mx2woS3KFrn6CgZJLKOsBj+J
	Xwmwlm0FH7ap7OXCaFYehCJOmmEicnpNRO0Hl3KlNxFgwMkGAcfCcb0mKdslDzLJpaVi4ICjcyc2c
	2+xuChxrG3o/ecPy0dwxKDLLgMNm5N9L8aU5j/RpV+HRRJkL7kKPPU0kE8n7Oce1Twm26S3iaZz7k
	VpaSnYugMXaMxnipTxpMcb/zio2et/Glx3VsFtRm+9HJSkhCDwV064YHupdN+U8f34/63JREO8GmQ
	6Dhn8HBm4NPhr8Bbn6+Sloc6MXlIcauVH5Q+rF4utCQfPY0VwG042LTNq2Yg3ICoUch7V/3Tl27hS
	ivNp54AQ==;
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: convert xen-blkfront to atomic queue limit updates
Date: Tue, 20 Feb 2024 09:49:31 +0100
Message-Id: <20240220084935.3282351-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi all,

this series converts xen-blkfront to the new atomic queue limits update
API in the block tree.  I don't have a Xen setup so this is compile
tested only.

Diffstat:
 xen-blkfront.c |   53 +++++++++++++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 26 deletions(-)

