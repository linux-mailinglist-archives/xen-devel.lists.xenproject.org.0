Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1685C3125D5
	for <lists+xen-devel@lfdr.de>; Sun,  7 Feb 2021 17:10:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82428.152221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8md9-00042z-C4; Sun, 07 Feb 2021 16:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82428.152221; Sun, 07 Feb 2021 16:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8md9-00042c-8h; Sun, 07 Feb 2021 16:09:47 +0000
Received: by outflank-mailman (input) for mailman id 82428;
 Sun, 07 Feb 2021 16:09:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QIBx=HJ=casper.srs.infradead.org=batv+661ee30cee4f8a507613+6377+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1l8md7-00042X-RU
 for xen-devel@lists.xenproject.org; Sun, 07 Feb 2021 16:09:46 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7d135a5-d412-43ec-be84-3a518bb3d43e;
 Sun, 07 Feb 2021 16:09:42 +0000 (UTC)
Received: from [2001:4bb8:184:7d04:4590:5583:6cb7:77c7] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l8mcx-004tm1-ER; Sun, 07 Feb 2021 16:09:36 +0000
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
X-Inumbo-ID: c7d135a5-d412-43ec-be84-3a518bb3d43e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=JfVmnK29gWEUJ5mUlngz+CH9M4JMM7XULZkTDufyTkA=; b=ZpbuHAq6KrjfrtW0zuLMXzIh3N
	4cIjBdabhl28Sk7wP/iiwRa2v76qNjRIpgRlC8HWkcgB0CG7d3l24sOFA7L6QMRSl7R+SIgU1GniZ
	SD3B3vfnVEQM1TqvpPdTCYbQM4LUpBE1GSr7bAxUAL5pxA6tM9ejZ89S1aE6/rBJ0gJIiDKUj5ZpG
	hgUsZi32qvg/MGkxiHRJOpQLU2tzbK6xO7Ui2oeEHS8EwDgQUGCO/FWqzI3m30RRBswiQKnsIkqSY
	msDQiTUDyK/2HG5ocr0uGX6DsGHD9/yvzpvRx7dHp46JjY6TbE3yL+8YqgmatGvKVz5WNC02frig9
	oh/LyeNg==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	Claire Chang <tientzu@chromium.org>,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org
Subject: swiotlb cleanups
Date: Sun,  7 Feb 2021 17:09:26 +0100
Message-Id: <20210207160934.2955931-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Hi Konrad,

this series contains a bunch of swiotlb cleanups, mostly to reduce the
amount of internals exposed to code outside of swiotlb.c, which should
helper to prepare for supporting multiple different bounce buffer pools.

