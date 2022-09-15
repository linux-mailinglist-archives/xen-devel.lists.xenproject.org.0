Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D01825BA13B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 21:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407640.650205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYuZl-0004Y2-OV; Thu, 15 Sep 2022 19:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407640.650205; Thu, 15 Sep 2022 19:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYuZl-0004Ur-L8; Thu, 15 Sep 2022 19:31:05 +0000
Received: by outflank-mailman (input) for mailman id 407640;
 Thu, 15 Sep 2022 19:31:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SgkS=ZS=dornerworks.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1oYuZj-0004Uh-0s
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 19:31:03 +0000
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0073.outbound.protection.office365.us [23.103.209.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec32966b-352c-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 21:30:59 +0200 (CEST)
Received: from PH1P110MB1652.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18e::22)
 by PH1P110MB1171.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Thu, 15 Sep
 2022 19:30:54 +0000
Received: from PH1P110MB1652.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e8ff:cf87:d387:3e7c]) by PH1P110MB1652.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e8ff:cf87:d387:3e7c%4]) with mapi id 15.20.5612.023; Thu, 15 Sep 2022
 19:30:54 +0000
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
X-Inumbo-ID: ec32966b-352c-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=lrAcqohAWlbj/qj8V281t3Z2rSzAyVa7ZcQn/U14GgbPRR5xVdcEwFRIfPkZGkDi78GFIetxDG8il35PtSm9w+38gJPMFYJo96ZuLLpjOwWIhgbPDRlS7xFMRf0DmaRm5eOgMRbndlUd0G7UI+ISTG5cfrpbraSg/O6ObMEBx9cf+JMQrDfgvHvkAcYGw0DfcBMH9uNGFGeRK/2gpT1Jnt5XHlKP8qSM3J0az7v2+TNdDvu6VrZ//aCqxgN2vdO/CH2jv7jYWRxQW880OKz2sZswWbR/Q/uhvsiIGSkMfvG+sOjnssHw4/zAni1rEPepxrBWvOW9YHdgietkLo4WFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnMJAcq7J1Niq1aAZycGEXxEibBg4ArBiRZzO5o3Abs=;
 b=cuSM6dLppH7MywCmAvMZrhEJ4L5QQQ/or8hedpSZnHwI5Ow6cqIUvbjtVnINtGIpT5aH4/CWMZlDRHZpTn3QpWAe48hUVt+x9ceIgfsPHZSx+jGLSp5ibQRGSmS7B461sgZlDQ2OdATKKwoFfkacoH3LGjNWPieVAQtw4BuMqjOTJgXCzlNddfB8hbH3LaClMMepZHm/+YHpWIQyHbur9RHPCI8ieaSRZEjtFNV2y0j7y+hmz7pMneaSakozKdDzsfE7E8rQkkS7rbmEFMhuCYSyg/Fk95rXeNt0PQA+whaBZ1QCnVLSTDrETriT2/1Xo7TTQlyY9X1yf45TGXWzww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnMJAcq7J1Niq1aAZycGEXxEibBg4ArBiRZzO5o3Abs=;
 b=LhFY4eysvnrM086znWWyWXruVR0CDFrRBr37orwsvkYCwU8R3e5kmbtHQm+bxGwaJUs9h7MTQo4VBZBLx51GNYvgNIGX5uGCoXZwoqFAPf3doLsbLMkRTDwStPtyUYsb0gbTBPHNDSKNZffASs7MtgX1/yKXkvnexxbneGneKqZdcrvycyeS8nQYPgYqTBgeS1nRTaX5iF2WkJLVWQtPVLlY/VkWIiymEGmS/G0DBE7XMJHxzwvb1GEgcUWyfqxEfD+fb5GO9Dtskyo5iEPcHV8cmuaMDPUZ4NfbICvLQkf1yPQfNyYPk181J7f6t9O/5UtYP4FuvltzIr0UitJz0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dornerworks.com;
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: xen-devel@lists.xenproject.org
Cc: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Jeff Kubascik <jeff.kubascik@dornerworks.com>,
	Nathan Studer <nathan.studer@dornerworks.com>,
	Robbie VanVossen <robert.vanvossen@dornerworks.com>,
	xen-devel@dornerworks.com,
	Stewart Hildebrand <stewart@stew.dk>
Subject: [PATCH] MAINTAINERS: change my email
Date: Thu, 15 Sep 2022 15:30:27 -0400
Message-Id: <20220915193027.3166-1-stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.37.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY1P110CA0043.NAMP110.PROD.OUTLOOK.COM
 (2001:489a:200:400::13) To PH1P110MB1652.NAMP110.PROD.OUTLOOK.COM
 (2001:489a:200:18e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH1P110MB1652:EE_|PH1P110MB1171:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dea7828-e4d6-47c3-de9e-08da9750ce1c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ar9jFq0YbMpGxSsBH1liWRK3b7zlc2ne3m3ZhDv9Waw+dJt3RVw3u32XptLjfe9d1j41K1SX7fV2Gv0y7InEMiSY3FlKD/d1PUy2KZcS15nxMN7vy+ANDEGxyhS8sNsQwhS3PvPXLzePSGpRgX6ZdMBRcm4VH1JVS+e58odXLZCj+GLEZu3JoCnnm/xRmOzexSxf8WCMuTVJfw4v7v2BZcaPgDlIGogwZcZL76Hb9dlqMJi8S0DP3yQEal4O8SDGaAX0RFVQwJ6aMfI3y3j/3KrFN7jTDM8CgU68rGEMkk4TdeGmtAQZtoY6vFClPK0bNvhLKYB6v/4uOIZ+2PAwTi9TpHm0A+2zBj2/KhO3Ya5EzA2BcW1yefHY6yiQHcY/5nVoLxwdSf/2rnGxM2jJlfk851aNc2Oju0/Sp8xt4QB+tQRe/Ur3CsizPT3iL7n4O3eM+C8Aho3EhXa+vG2tDtk1dXQnzST/qmN2EfhKx/Ke1VUKK3MxKNYiNmdNKMITrUqdr6jIGqWBfWZl5Mg608qf+x64WttW4Z7Dokv/ok6KkESrBwoCwslpBvFwR5xpAsMGgMj+RVe5e3FWjhfKZCGXjuQMnPeR33dPwYcF8fIMAx2pQAuFGlXWZ84XJurSJFBuabBi8Zw9G3BuAPBVitu7rfIsh9ZkYXf0MehQmIIjPtYGez17LqFKFMVeRNpR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1652.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39830400003)(396003)(366004)(136003)(451199015)(1076003)(6486002)(6916009)(54906003)(86362001)(6506007)(52116002)(38100700002)(2616005)(66946007)(38350700002)(4326008)(8676002)(66476007)(66556008)(186003)(41320700001)(8936002)(6666004)(508600001)(4744005)(41300700001)(36756003)(83380400001)(26005)(5660300002)(44832011)(6512007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TshBsLVxj0+t4gOJURWs2tsdor6H+QgYORpX7PeCcNIa5DP66QNLfF7D0B3WwPBtYkOwb/OZm1MGSSkG5qpL5dOwpxyIKvWhBg4k8IdxY2APa1qY0wEri/gtUO7lGuwCkHf860BQd3rNTbo3xeHwq5rc8/hFTZZab8rz3cPwYt9tA1uR5KElA0p381u+MiES7a0Y6IsJxU3/std9cSLpphLZVcsPUdmKrT/iVKvtSUj7pOtO+IJCO8DWMb6ziEJdIOadax6HNPgI7IxykZJJj0xcR/B1T+83LD848boXYLluXzVzYtfCnjp+UANfnwg6qGl37PnJxZmg+gLxGFIFLjYV7S23arnm8oowvRoUvT5VWUzMTARIHA8IC62nyXzh2qOIMibDybjqMjXDK97dubRAOFhwK/2YERIajKBiRPo=
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dea7828-e4d6-47c3-de9e-08da9750ce1c
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1652.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 19:30:54.0959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1171

I am departing DornerWorks. I will still be working with Xen in my next
role, and I still have an interest in maintaining the ARINC 653
scheduler, so change to my personal email address. Also change status to
Maintained.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e12c499a28..f674b5f7ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -221,8 +221,8 @@ F:	xen/include/xen/argo.h
 F:	xen/common/argo.c
 
 ARINC653 SCHEDULER
-M:	Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
-S:	Supported
+M:	Stewart Hildebrand <stewart@stew.dk>
+S:	Maintained
 L:	xen-devel@dornerworks.com
 F:	xen/common/sched/arinc653.c
 F:	tools/libs/ctrl/xc_arinc653.c
-- 
2.37.3


