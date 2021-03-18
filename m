Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1080B3409E8
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 17:18:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99045.188126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMvKa-0001ti-3O; Thu, 18 Mar 2021 16:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99045.188126; Thu, 18 Mar 2021 16:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMvKa-0001tJ-03; Thu, 18 Mar 2021 16:17:04 +0000
Received: by outflank-mailman (input) for mailman id 99045;
 Thu, 18 Mar 2021 16:17:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YepO=IQ=casper.srs.infradead.org=batv+3da9058682ed8a08391b+6416+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1lMvKX-0001tE-Mg
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 16:17:02 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c0d6296-b286-44c9-82a3-025209e06be1;
 Thu, 18 Mar 2021 16:16:58 +0000 (UTC)
Received: from 089144199244.atnat0008.highway.a1.net ([89.144.199.244]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMvK6-003Cyb-Sl; Thu, 18 Mar 2021 16:16:40 +0000
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
X-Inumbo-ID: 2c0d6296-b286-44c9-82a3-025209e06be1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=rjzqCoXPd0DSY0h2TMvxPFkgf9ifPYkw6FECGpmC4c0=; b=qrHiJp69lC0mUjzOZxkbiQY1vH
	RjF7mCLDZQnhGmlcLuA8E6EF5g9h6D4/rJfvTDeJHWwXFvMxkh8pUqaX8FJBORDFGleNpyhLUeZqQ
	SR5E3LOLO9UYhbb6RVnJERw+qKRkfMQNTVXPnuPwMl5xO64fuRpLV64sQi6gmft2ANo8rZSNeH8nD
	4zXDTLBX3+xKb34YQR9bPptQ4GcmSQXeHmuwcyO6saX63tq0moDxzj9fhvGF/w/4/5t5rq9XCQy1a
	nQJ66+9c8lGKHcw2CSM56PQynNopNaM20O/Q2h8fhxcqYfEbbvaJeQUICVMs623BlBpww+YoUlPR0
	k5yjh5jg==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	Claire Chang <tientzu@chromium.org>,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org
Subject: swiotlb cleanups v3
Date: Thu, 18 Mar 2021 17:14:21 +0100
Message-Id: <20210318161424.489045-1-hch@lst.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Hi Konrad,

this series contains a bunch of swiotlb cleanups, mostly to reduce the
amount of internals exposed to code outside of swiotlb.c, which should
helper to prepare for supporting multiple different bounce buffer pools.

Changes since v2:
 - fix a bisetion hazard that did not allocate the alloc_size array
 - dropped all patches already merged

Changes since v1:
 - rebased to v5.12-rc1
 - a few more cleanups
 - merge and forward port the patch from Claire to move all the global
   variables into a struct to prepare for multiple instances

