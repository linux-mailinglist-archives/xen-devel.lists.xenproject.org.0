Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEB329C8C7
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 20:26:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13075.33643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXUbQ-0000dU-M8; Tue, 27 Oct 2020 19:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13075.33643; Tue, 27 Oct 2020 19:25:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXUbQ-0000d5-Ip; Tue, 27 Oct 2020 19:25:52 +0000
Received: by outflank-mailman (input) for mailman id 13075;
 Tue, 27 Oct 2020 19:25:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o/8F=EC=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1kXUbP-0000d0-Go
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 19:25:51 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 482ff22e-0870-4cb3-a176-cbcf0aa7908c;
 Tue, 27 Oct 2020 19:25:49 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09RJP21A164536;
 Tue, 27 Oct 2020 19:25:45 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 34cc7kuye1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Oct 2020 19:25:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09RJPKpI106279;
 Tue, 27 Oct 2020 19:25:44 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 34cx6wc87t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Oct 2020 19:25:44 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09RJPgg2007991;
 Tue, 27 Oct 2020 19:25:42 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 27 Oct 2020 12:25:42 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 373186A0121; Tue, 27 Oct 2020 15:27:27 -0400 (EDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o/8F=EC=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
	id 1kXUbP-0000d0-Go
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 19:25:51 +0000
X-Inumbo-ID: 482ff22e-0870-4cb3-a176-cbcf0aa7908c
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 482ff22e-0870-4cb3-a176-cbcf0aa7908c;
	Tue, 27 Oct 2020 19:25:49 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09RJP21A164536;
	Tue, 27 Oct 2020 19:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=WWBVSyjATfqcuJQT+Yh6z4CCuAVHsOU2pwiB2KA9sbQ=;
 b=oNpuOKowZ1S862d6HWXEpBF6XqOjSjkj7XINwdr3XhrVVUdwCe0i0DOho17D9z8Sg05U
 acLF8fHnANx0ayghZdiDrEd+f1qcwfMFFWVCuNDgx2etJMa992mU03XWv+iLd5SHHkJg
 dgLwmAaLRANLtQiU/G7FIKEYp5NrNLWuAjFVPq5hQgbdYNZIQvwVgVtDLB2VrP8l89xY
 ADl0KBMePGoYDy7bLoY7+A5Odim6oCuVb72T1DXy+oCRUA9aG5yJuKHNw/uJ7jox/Di9
 I81V/kb0jh3z4LbGrig8E9z7KewsPBuORax86jP+PrHvghqqOXKeppF15dYGuZqqmQk5 AA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2120.oracle.com with ESMTP id 34cc7kuye1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Oct 2020 19:25:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09RJPKpI106279;
	Tue, 27 Oct 2020 19:25:44 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userp3030.oracle.com with ESMTP id 34cx6wc87t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Oct 2020 19:25:44 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09RJPgg2007991;
	Tue, 27 Oct 2020 19:25:42 GMT
Received: from char.us.oracle.com (/10.152.32.25)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 27 Oct 2020 12:25:42 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
	id 373186A0121; Tue, 27 Oct 2020 15:27:27 -0400 (EDT)
Date: Tue, 27 Oct 2020 15:27:27 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Elliott Mitchell <ehem+undef@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org, hch@lst.de
Subject: Re: [PATCH] fix swiotlb panic on Xen
Message-ID: <20201027192726.GA13396@char.us.oracle.com>
References: <alpine.DEB.2.21.2010261653320.12247@sstabellini-ThinkPad-T480s>
 <20201027175114.GA32110@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027175114.GA32110@mattapan.m5p.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9787 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=2
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010270112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9787 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1011 mlxscore=0 suspectscore=2
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010270112

> As the person who first found this and then confirmed this fixes a bug:
> 
> Tested-by: Elliott Mitchell <ehem+xen@m5p.com>

Thank you!!

I changed the title and added the various tags and will put it in
linux-next later this week.

From a1eb2768bf5954d25aa0f0136b38f0aa5d92d984 Mon Sep 17 00:00:00 2001
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
Date: Mon, 26 Oct 2020 17:02:14 -0700
Subject: [PATCH] swiotlb: fix "x86: Don't panic if can not alloc buffer for
 swiotlb"

kernel/dma/swiotlb.c:swiotlb_init gets called first and tries to
allocate a buffer for the swiotlb. It does so by calling

  memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);

If the allocation must fail, no_iotlb_memory is set.

Later during initialization swiotlb-xen comes in
(drivers/xen/swiotlb-xen.c:xen_swiotlb_init) and given that io_tlb_start
is != 0, it thinks the memory is ready to use when actually it is not.

When the swiotlb is actually needed, swiotlb_tbl_map_single gets called
and since no_iotlb_memory is set the kernel panics.

Instead, if swiotlb-xen.c:xen_swiotlb_init knew the swiotlb hadn't been
initialized, it would do the initialization itself, which might still
succeed.

Fix the panic by setting io_tlb_start to 0 on swiotlb initialization
failure, and also by setting no_iotlb_memory to false on swiotlb
initialization success.

Fixes: ac2cbab21f31 ("x86: Don't panic if can not alloc buffer for swiotlb")

Reported-by: Elliott Mitchell <ehem+xen@m5p.com>
Tested-by: Elliott Mitchell <ehem+xen@m5p.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
CC: stable@vger.kernel.org
Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
---
 kernel/dma/swiotlb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 465a567678d9..e08cac39c0ba 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -229,6 +229,7 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
 	}
 	io_tlb_index = 0;
+	no_iotlb_memory = false;
 
 	if (verbose)
 		swiotlb_print_info();
@@ -260,9 +261,11 @@ swiotlb_init(int verbose)
 	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, verbose))
 		return;
 
-	if (io_tlb_start)
+	if (io_tlb_start) {
 		memblock_free_early(io_tlb_start,
 				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
+		io_tlb_start = 0;
+	}
 	pr_warn("Cannot allocate buffer");
 	no_iotlb_memory = true;
 }
@@ -360,6 +363,7 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
 	}
 	io_tlb_index = 0;
+	no_iotlb_memory = false;
 
 	swiotlb_print_info();
 
-- 
2.13.6


