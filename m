Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 531C321B427
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2020 13:37:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtrKK-0007Nm-7Y; Fri, 10 Jul 2020 11:36:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6UOn=AV=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1jtrKI-0007Nh-L8
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 11:36:22 +0000
X-Inumbo-ID: 93e5c426-c2a1-11ea-8f91-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93e5c426-c2a1-11ea-8f91-12813bfff9fa;
 Fri, 10 Jul 2020 11:36:21 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06ABWuaS065848;
 Fri, 10 Jul 2020 11:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=3J30hYgYpoiRAxDBjTQRBuPvFkgjWUboNehE/fIyh6I=;
 b=A6xesikFkn+jf7BmmzdypSPLfM7uax7Tm5Q9BA+O3rs9tZVzawg/nXAf8dEsdWJs/nvg
 Pac5LRoHBaI8rJAylW+77RnG9nj29L1fibHsAVqx6FxcF+cnnOr6qTSiFO2WjARoREkJ
 OIzMfPPpr0rT33FV5L7Tsdq+3+UI1gcN7kPTXRuvoEnHcciSLHq4laUZ4TzqWNZEefCh
 TLJVRU30dL5UXNoMTtvPRq/x7aeJpfWsa1+KnggzGCZAQnGBR4qwPEOs55U1VI9a9WTi
 87s0AgsIza+I0Yaw+l+Q+ZYizZqKu5XMXuFBuDFLno13Bjef8sn2meAWoPdMuhLHOp6C 9Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 325y0apxx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 10 Jul 2020 11:36:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06ABTLDP037869;
 Fri, 10 Jul 2020 11:36:18 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 325k3jqewy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jul 2020 11:36:18 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06ABaGgK013873;
 Fri, 10 Jul 2020 11:36:17 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 10 Jul 2020 04:36:16 -0700
Date: Fri, 10 Jul 2020 14:36:10 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen/xenbus: Fix a double free in xenbus_map_ring_pv()
Message-ID: <20200710113610.GA92345@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9677
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007100082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9677
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 phishscore=0 suspectscore=2
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007100082
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Yan Yankovskyi <yyankovskyi@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kernel-janitors@vger.kernel.org,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When there is an error the caller frees "info->node" so the free here
will result in a double free.  We should just delete first kfree().

Fixes: 3848e4e0a32a ("xen/xenbus: avoid large structs and arrays on the stack")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/xen/xenbus/xenbus_client.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index 4f168b46fbca..786fbb7d8be0 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -693,10 +693,8 @@ static int xenbus_map_ring_pv(struct xenbus_device *dev,
 	bool leaked;
 
 	area = alloc_vm_area(XEN_PAGE_SIZE * nr_grefs, info->ptes);
-	if (!area) {
-		kfree(node);
+	if (!area)
 		return -ENOMEM;
-	}
 
 	for (i = 0; i < nr_grefs; i++)
 		info->phys_addrs[i] =
-- 
2.27.0


