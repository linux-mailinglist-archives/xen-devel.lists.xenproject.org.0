Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5538832786B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 08:45:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91257.172375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdEr-0002UY-Lv; Mon, 01 Mar 2021 07:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91257.172375; Mon, 01 Mar 2021 07:45:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdEr-0002U9-Is; Mon, 01 Mar 2021 07:45:09 +0000
Received: by outflank-mailman (input) for mailman id 91257;
 Mon, 01 Mar 2021 07:45:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LLJP=H7=casper.srs.infradead.org=batv+bce9324c41c3486454c7+6399+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1lGdEp-0002U2-CL
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 07:45:08 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2144fc4c-6bd5-4041-a05d-8a153779f684;
 Mon, 01 Mar 2021 07:45:03 +0000 (UTC)
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGdEK-00FR4S-Vc; Mon, 01 Mar 2021 07:44:43 +0000
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
X-Inumbo-ID: 2144fc4c-6bd5-4041-a05d-8a153779f684
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=oZQdON2UeZGDjeY8BOuus4h51xz4D0PS1kfJ4kEC/6s=; b=rO8ALAJQqrZEeZ4iEOjPwi1WE+
	6R34dC8dSkDj+qIvIr6UcSiPxULXK+/lCvDQd59+1pjrXB8xmT7INZhQqgIGvc15iyacmBouUpYHq
	Do7OPE+zdqCAtk9VUQgSfWkGNCcxTuVUCNnmCtbqSRZctaKJeHAXhPDtIpyY5e7l26gK4ai4ARYuQ
	OrjO3c1J2ThGSimBb9YbvGnJZi0U/G5QKDNtYkU1CeadFjBoTIqGdPxrVjI5KeB/y+kcasXY76qMt
	ipKwlZlorTKY6C1UI0lpRn30rJKpqd3RD55IINoQG4ssYdZ6Z3/RZxvk8rBrRkpkhd5xp+qwszJTN
	W0EYGG9g==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	Claire Chang <tientzu@chromium.org>,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org
Subject: swiotlb cleanups v2
Date: Mon,  1 Mar 2021 08:44:22 +0100
Message-Id: <20210301074436.919889-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Hi Konrad,

this series contains a bunch of swiotlb cleanups, mostly to reduce the
amount of internals exposed to code outside of swiotlb.c, which should
helper to prepare for supporting multiple different bounce buffer pools.

Changes since v1:
 - rebased to v5.12-rc1
 - a few more cleanups
 - merge and forward port the patch from Claire to move all the global
   variables into a struct to prepare for multiple instances

