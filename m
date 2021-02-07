Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1509D3125D8
	for <lists+xen-devel@lfdr.de>; Sun,  7 Feb 2021 17:10:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82432.152269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8mdS-0004pZ-Rm; Sun, 07 Feb 2021 16:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82432.152269; Sun, 07 Feb 2021 16:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8mdS-0004mi-Lb; Sun, 07 Feb 2021 16:10:06 +0000
Received: by outflank-mailman (input) for mailman id 82432;
 Sun, 07 Feb 2021 16:10:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QIBx=HJ=casper.srs.infradead.org=batv+661ee30cee4f8a507613+6377+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1l8mdR-00042X-Ib
 for xen-devel@lists.xenproject.org; Sun, 07 Feb 2021 16:10:05 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6bd119b-0684-4d90-873e-2567b3034fd2;
 Sun, 07 Feb 2021 16:09:49 +0000 (UTC)
Received: from [2001:4bb8:184:7d04:4590:5583:6cb7:77c7] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l8md5-004tmP-JA; Sun, 07 Feb 2021 16:09:44 +0000
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
X-Inumbo-ID: b6bd119b-0684-4d90-873e-2567b3034fd2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tHBexmHGDU8sjj38AZ8OoEmgptCGTXSoPlkiz2alw+s=; b=PBdwbGIJlKrg+agS8u5um5z3+E
	lRbcNlTzG3ntexPbto0mi2062ImrpQVKR3XGI4/cKR3mfaGRiJgDHdqMFG0mP1KLhbe2zWELau6xh
	YOi37Sez5qoaovImrcBXFeSYI28UxhVa7x6E+3aB/UaioGgM4KIS8iunU4KBsKMISwsyXxkncv/EY
	ltEqLzdq2KfRLnJTlX6hBx+PgpoKnaxT0DPfw5Cg0VXBcqnxvcAYaken/jlwA5MX8p28MsZpw1aey
	uebkJGJud2BW7OZYmg4y//+8KPP9MHqx0t9vTK7eomCKEuKDWTNHRowqZmVS/2c7Yhr8Mk8ky1CZU
	OASFkWow==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	Claire Chang <tientzu@chromium.org>,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 4/8] xen-swiotlb: remove xen_set_nslabs
Date: Sun,  7 Feb 2021 17:09:30 +0100
Message-Id: <20210207160934.2955931-5-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210207160934.2955931-1-hch@lst.de>
References: <20210207160934.2955931-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

The xen_set_nslabs function is a little weird, as it has just one
caller, that caller passes a global variable as the argument,
which is then overriden in the function and a derivative of it
returned.  Just add a cpp symbol for the default size using a readable
constant and open code the remaining three lines in the caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/xen/swiotlb-xen.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 4298f74a083985..57f8d5fadc1fcd 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -138,16 +138,6 @@ xen_swiotlb_fixup(void *buf, size_t size, unsigned long nslabs)
 	} while (i < nslabs);
 	return 0;
 }
-static unsigned long xen_set_nslabs(unsigned long nr_tbl)
-{
-	if (!nr_tbl) {
-		xen_io_tlb_nslabs = (64 * 1024 * 1024 >> IO_TLB_SHIFT);
-		xen_io_tlb_nslabs = ALIGN(xen_io_tlb_nslabs, IO_TLB_SEGSIZE);
-	} else
-		xen_io_tlb_nslabs = nr_tbl;
-
-	return xen_io_tlb_nslabs << IO_TLB_SHIFT;
-}
 
 enum xen_swiotlb_err {
 	XEN_SWIOTLB_UNKNOWN = 0,
@@ -170,6 +160,9 @@ static const char *xen_swiotlb_error(enum xen_swiotlb_err err)
 	}
 	return "";
 }
+
+#define DEFAULT_NSLABS		ALIGN(SZ_64M >> IO_TLB_SHIFT, IO_TLB_SEGSIZE)
+
 int __ref xen_swiotlb_init(int verbose, bool early)
 {
 	unsigned long bytes, order;
@@ -179,8 +172,10 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 
 	xen_io_tlb_nslabs = swiotlb_nr_tbl();
 retry:
-	bytes = xen_set_nslabs(xen_io_tlb_nslabs);
-	order = get_order(xen_io_tlb_nslabs << IO_TLB_SHIFT);
+	if (!xen_io_tlb_nslabs)
+		xen_io_tlb_nslabs = DEFAULT_NSLABS;
+	bytes = xen_io_tlb_nslabs << IO_TLB_SHIFT;
+	order = get_order(bytes);
 
 	/*
 	 * IO TLB memory already allocated. Just use it.
-- 
2.29.2


