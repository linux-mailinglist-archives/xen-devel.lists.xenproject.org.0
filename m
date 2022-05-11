Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D61523381
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 14:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326805.549450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nolv3-0002Mb-Qz; Wed, 11 May 2022 12:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326805.549450; Wed, 11 May 2022 12:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nolv3-0002GE-Li; Wed, 11 May 2022 12:58:21 +0000
Received: by outflank-mailman (input) for mailman id 326805;
 Wed, 11 May 2022 12:58:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I4DC=VT=bombadil.srs.infradead.org=BATV+bd3371fd9649de263009+6835+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nolv2-0002DF-1l
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 12:58:20 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0500bddb-d12a-11ec-a406-831a346695d4;
 Wed, 11 May 2022 14:58:16 +0200 (CEST)
Received: from [2001:4bb8:184:7881:740a:25f7:2c13:ef7a] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noluq-006rdz-Tk; Wed, 11 May 2022 12:58:09 +0000
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
X-Inumbo-ID: 0500bddb-d12a-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=lWal7xDNVRaQCdbknsdqk06u/bYAytOsWgd5tBb7T1Y=; b=LNjy6lTfBvzizjreZ/Kd38DWgl
	YtjrtV+/YFkDGXytY2CU/6HhE7eVkT/0LxMdOr5b1rcvgIYatUNxkRyJxMcR45+ZjYkQpr7UK93Ep
	ETfHeve5kT2fyfK78yWgEDPsh9//+hgoc0r3CiGQyiEl8OcIKQ98epke5lKoCTDJH/6NqDsX77v6Y
	lk4dgtnmVGV5j7ujW0bXzgQ5TpA+97iJ0JAllS9c0+ubGjCpKtpJcTHXFaVbleq2tNqJudA7mcVHB
	aKWfBgVn9QnLnBzEO7KPWhoBKa0WoPhE36qrSfXTImqsXATVqX33lIzdY/cdvc9f6kYxAoy04OwOR
	lMsTAFQA==;
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Conor.Dooley@microchip.com,
	xen-devel@lists.xenproject.org
Subject: swiotlb regression fixe
Date: Wed, 11 May 2022 14:58:02 +0200
Message-Id: <20220511125805.1377025-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi all,

attached are a bunch of fixes for regressions in the recent swiotlb
refactoring.  The first one was reported by Conor, and the other two
are things I found by code inspections while trying to fix what he
reported.

