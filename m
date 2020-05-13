Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DB91D2331
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 01:40:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZ0ya-00080m-Dz; Wed, 13 May 2020 23:39:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cgDE=63=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1jZ0yY-00080h-Kv
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 23:39:46 +0000
X-Inumbo-ID: 05f45408-9573-11ea-a42d-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05f45408-9573-11ea-a42d-12813bfff9fa;
 Wed, 13 May 2020 23:39:44 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04DNaPAg065703;
 Wed, 13 May 2020 23:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=WUtDE1uvxFfqtxiGlboxCs/AC9GkRjxAc7zArX6xztU=;
 b=C5wiUZj9WYB1aqt+jnVi12+YGGDEW0nQ8LtsgPIZBkEAcyoj8ADZC37Pgb8kxnOh26fc
 V0Wu+Tja6vN9+8fzF34W6WSFaJS3MWmSIhSwRQ+vnzrXGROUojOCUVlARX/lOQqEVVD7
 k//V+rJYO0LxrgNN4BiAAEXcfnMofRusW62WfQTf32LIqb1LvXaCAnvddFb0CX/vEPEH
 qie2e4zIR7bYHTGuf5jjxqg3eXk0w/iK+w9w+TgtQyM8WtJWZnLsX5s8aApmUa+ZlGgS
 D+8jO2AAKohWG+jzWyQJEO5TVobD6JCTcyU2TMVMpq9Zi8e1UrPMM5Q7wQkbOseCgff5 qQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 3100yfydwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 13 May 2020 23:39:42 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04DNc3Fk100680;
 Wed, 13 May 2020 23:39:42 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 3100yfk17f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 May 2020 23:39:42 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04DNde5Y017022;
 Wed, 13 May 2020 23:39:40 GMT
Received: from localhost.localdomain (/10.211.9.80)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 May 2020 16:39:40 -0700
From: Dongli Zhang <dongli.zhang@oracle.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] xen/manage: enable C_A_D to force reboot
Date: Wed, 13 May 2020 16:34:10 -0700
Message-Id: <20200513233410.18120-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9620
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005130203
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9620
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0
 cotscore=-2147483648 mlxscore=0 suspectscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1011 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005130203
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
Cc: jgross@suse.com, rose.wang@oracle.com, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, joe.jin@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The systemd may be configured to mask ctrl-alt-del via "systemctl mask
ctrl-alt-del.target". As a result, the pv reboot would not work as signal
is ignored.

This patch always enables C_A_D before the call of ctrl_alt_del() in order
to force the reboot.

Reported-by: Rose Wang <rose.wang@oracle.com>
Cc: Joe Jin <joe.jin@oracle.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 drivers/xen/manage.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/xen/manage.c b/drivers/xen/manage.c
index cd046684e0d1..3190d0ecb52e 100644
--- a/drivers/xen/manage.c
+++ b/drivers/xen/manage.c
@@ -204,6 +204,13 @@ static void do_poweroff(void)
 static void do_reboot(void)
 {
 	shutting_down = SHUTDOWN_POWEROFF; /* ? */
+	/*
+	 * The systemd may be configured to mask ctrl-alt-del via
+	 * "systemctl mask ctrl-alt-del.target". As a result, the pv reboot
+	 * would not work. To enable C_A_D would force the reboot.
+	 */
+	C_A_D = 1;
+
 	ctrl_alt_del();
 }
 
-- 
2.17.1


