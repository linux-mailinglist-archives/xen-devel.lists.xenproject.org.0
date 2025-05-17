Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B588ABA6F8
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 02:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987848.1373076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG58E-0003UZ-AL; Sat, 17 May 2025 00:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987848.1373076; Sat, 17 May 2025 00:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG58E-0003S3-77; Sat, 17 May 2025 00:10:26 +0000
Received: by outflank-mailman (input) for mailman id 987848;
 Sat, 17 May 2025 00:10:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C0cA=YB=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uG58D-0003De-3Y
 for xen-devel@lists.xenproject.org; Sat, 17 May 2025 00:10:25 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20604.outbound.protection.outlook.com
 [2a01:111:f403:2415::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52a380a4-32b3-11f0-9ffb-bf95429c2676;
 Sat, 17 May 2025 02:10:22 +0200 (CEST)
Received: from DS7PR05CA0102.namprd05.prod.outlook.com (2603:10b6:8:56::22) by
 CY8PR12MB8244.namprd12.prod.outlook.com (2603:10b6:930:72::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.32; Sat, 17 May 2025 00:10:18 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:8:56:cafe::95) by DS7PR05CA0102.outlook.office365.com
 (2603:10b6:8:56::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.11 via Frontend Transport; Sat,
 17 May 2025 00:10:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:18 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 19:10:17 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 19:10:17 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 16 May 2025 19:10:16 -0500
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
X-Inumbo-ID: 52a380a4-32b3-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buAAEHRU1YORHJJuiu/nB4rf5mkgP0keKqv38GgoNQsE2oWhm4J5vveH+vRnEAchf1ZDFK+fqpGGKW0EvdxUDsQEqRWrDWqcQfzCA9AQup2we/6ck3FaL7PgBSvFThM1RJqcLVQ8OZLCdOvDjEe0kafoY2QVget28omJlYvgvukciiw6hCDYnfuq+IPfPy2Y20bQTM2Q60bq2jJeJN8jVCApZuE3vucfrWTzg+LD5EroGDCtXnXuKLRAmpu4zYEpiyoGaeDBOnnKhao8FHgrMWYYOYF8aryC6bjxK4Rezx+NXngXRf6hiMSRDJWqtZFHVdskWQiKF6GcOb2E6+xq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGrahaZmw62enb+JyxIjlzeO4SXgBzF+7p04fVlxdwA=;
 b=KlyRAbyLSQnsxwUYv+u7+H7+6NUr1qu2vFTAPvy9PllkVHtF6rGZZORJCsmb7kmU8qJ8j382ji+DsR8DqzwflP63CmJVRaARnfrRq2AbEzAMOjTfIrEhnCF5iCllsbcagQ3T/7c8UokVZWBcWmC1j1RWxh9qXQ8qvLdNFhSa6vao8oGFd55mlKCbcU04dCklPji8nmfdczXQKO4oQ+gwDVbWNZQlSOb5MEnBLg+YUZtzAmh3+PAS3V84BeaQ7OAZvBt8ErQvGK6SOzv75v9oRNXal6eppjFQKtSRVq7pOZ24Q425PleSnCj9v6gM2R2V60u7vOiT8i5y3CYQT8USOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGrahaZmw62enb+JyxIjlzeO4SXgBzF+7p04fVlxdwA=;
 b=2uZsGtBJUM17nk8d1ba45vWTUAl5L3c8UJ/E7smaSDcGmLGBm9dX8UNQEdAsV7qgqKCdwSiUQqYGqNtK+vhOCTHWUZ4CmPvooSq1Z7bFlpvUlNnWA3feePsJzEZIi8xVy8Z2ORcRLq1TOJh8OyzI6f73TDyVdmhbzlTRLFowxB4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <michal.orzel@amd.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <roger.pau@citrix.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, Federico Serafini
	<federico.serafini@bugseng.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v2 4/6] xen: refactor include guards
Date: Fri, 16 May 2025 17:10:05 -0700
Message-ID: <20250517001005.860657-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <d1bcab8a-873c-42ed-b7e8-071c009bcc3a@citrix.com>
References: <d1bcab8a-873c-42ed-b7e8-071c009bcc3a@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|CY8PR12MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d4bb7a-f8a6-46cb-e5da-08dd94d734fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YWf0aa9CPog5gLA89IvjPJX7RHBEL1sMqX70AsoqIE3N2ZonIWF0EdWAElvt?=
 =?us-ascii?Q?vALyOXAUFiQ/5NGbfMqsblqiSmwnnXvBG/Htp3B0oo8nY2qgjBx9EaGkmrI0?=
 =?us-ascii?Q?RAVHXHvFKAPTkhttXv6toLkL18aU+uQ6flPEnIJBv8HyWKB0gYA5qWuzJLMj?=
 =?us-ascii?Q?/35v9Ot8E6uXKgKu2RFOgs80uxrnxuhZ5K+5VctgXx/FD+eNSix5cQEuB/dQ?=
 =?us-ascii?Q?TAD3Brzzkjl5eDM2gOtfKdl6twuSs8ipYJjFwN25LMQ2Y//EEgPRFlaJ4phE?=
 =?us-ascii?Q?YryAvbhvyIGjgdLxG33B8v4+S5u021cJ5RqnJP0EYsCUYjW29Z/OgzuyKxwy?=
 =?us-ascii?Q?/bCPXDltESSLtI2slaJrvJfIF5R5BrXWjW54aUU/B5dlY7xaMwfL8R5a9WUM?=
 =?us-ascii?Q?Wg34t2jxtemR//XGqHUQUHqle00Cul5kEuOfW2wzmcjLFMYupyNRr4AMbLhp?=
 =?us-ascii?Q?xEJltmZROB1W6drMgcRZkQAWfih7LgglnnQ5SRVPD97jDhxsgheZI5Jtzy5L?=
 =?us-ascii?Q?34ULtK2hq5IMkBjXyk9OVpXxKcH7VVF0NCBKF8xSAMGHh0B8JQjy5ESIDe7H?=
 =?us-ascii?Q?xMv1Z44fc5nTTU1awLBtQQm8cBm1q1FVV2XBR2qVqCrG12InCM+L0klar5yp?=
 =?us-ascii?Q?ca38LhWDwtwogmhjXTYJxeFj6bXkwtBojWJiE4EkyMxtl3lyzYcPjfotIseA?=
 =?us-ascii?Q?5KlhHnnuNhd7i20uLTOMVoNJPYgy7IJE1SEBf7G9XxedU3Kk48MyVou79g/g?=
 =?us-ascii?Q?7dauU4+k8wcGF3MnSmUMqmeln1a3shacvOcEqDze5qffxkjJU/9L3RazEJ91?=
 =?us-ascii?Q?PFiNbmZNZjQrMku0xwR4aMTZLd2ZfPB1fD9QyqIuFNVa1fbWjYMdxQ1+RzjT?=
 =?us-ascii?Q?2jo5oUatVWBwLIeobNI8mk5459XcFuQVRme+PJVRl505velWb3CNgJUdb3HA?=
 =?us-ascii?Q?lAxiO3R0GD+12bhvIHiSeFU+CKoq9YlAG+90Z6nKBLdFOMBgpDT9loza3IAU?=
 =?us-ascii?Q?bTaV4+eiVCMretLBlRfkXY/1XHB1BupAk/QmCwrdatUIFBlieX4ePSJl9+WT?=
 =?us-ascii?Q?JO0nsevgPckQnOLCNzX6qFXlRCJifl24Zohz9wxFJy2VyMpHW9Iv3mAl5uVp?=
 =?us-ascii?Q?aQAckWRIG0UmMrxee7EFCMVzzgiXW6GJ3/wRRHL872f3HIGXVZfiiswVy3bT?=
 =?us-ascii?Q?0hY3rJ6hxaZ0CIs9sW+vvLBjnZX/T3ukHJZsIaKJ37PN6MtFIKqKAIOpBCeQ?=
 =?us-ascii?Q?IPH/HA9cY9ajWSS+6EaIXwovgZW96QH2v82CzWnp/+K7CC9F8zz7JwYOFarj?=
 =?us-ascii?Q?YGuynrHCbprNSoy/CqpIqD7SmxYxZ/GmgqRyI3KRkeTNLEPIuBXZmYg5Pjvo?=
 =?us-ascii?Q?DPRuNmypqo8B1GXWP3a+4sApO7hXqB2jHgUELadgg2deG/MuOVPyNTHtjtAR?=
 =?us-ascii?Q?ykMM9a31tNvEhhiDeRmR/6CeNnRoZYJn7m2NdclG35fGIGiw1cn8ditUZi9b?=
 =?us-ascii?Q?NE6aU1xvSY2ylyRQ0yv9o55PVFInQRY9A9ey?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:18.3466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d4bb7a-f8a6-46cb-e5da-08dd94d734fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8244

From: Federico Serafini <federico.serafini@bugseng.com>

Refactor inclusion guards:
1) use a syntax that is more likely to be recognized by static
   analyzers;
2) follow the CODING_STYLE.

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- use normal #ifndef
---
 xen/include/xen/err.h     | 10 +++++++---
 xen/include/xen/softirq.h | 10 +++++++---
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/xen/include/xen/err.h b/xen/include/xen/err.h
index cbdd1bf7f8..a5971e290c 100644
--- a/xen/include/xen/err.h
+++ b/xen/include/xen/err.h
@@ -1,5 +1,7 @@
-#if !defined(__XEN_ERR_H__) && !defined(__ASSEMBLY__)
-#define __XEN_ERR_H__
+#ifndef XEN_ERR_H
+#define XEN_ERR_H
+
+#ifndef __ASSEMBLY__
 
 #include <xen/compiler.h>
 #include <xen/errno.h>
@@ -41,4 +43,6 @@ static inline int __must_check PTR_RET(const void *ptr)
 	return IS_ERR(ptr) ? PTR_ERR(ptr) : 0;
 }
 
-#endif /* __XEN_ERR_H__ */
+#endif /* __ASSEMBLY__ */
+
+#endif /* XEN_ERR_H */
diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
index 33d6f2ecd2..e9f79ec0ce 100644
--- a/xen/include/xen/softirq.h
+++ b/xen/include/xen/softirq.h
@@ -1,5 +1,7 @@
-#if !defined(__XEN_SOFTIRQ_H__) && !defined(__ASSEMBLY__)
-#define __XEN_SOFTIRQ_H__
+#ifndef XEN_SOFTIRQ_H
+#define XEN_SOFTIRQ_H
+
+#ifndef __ASSEMBLY__
 
 /* Low-latency softirqs come first in the following list. */
 enum {
@@ -40,4 +42,6 @@ void cpu_raise_softirq_batch_finish(void);
  */
 void process_pending_softirqs(void);
 
-#endif /* __XEN_SOFTIRQ_H__ */
+#endif /* __ASSEMBLY__ */
+
+#endif /* XEN_SOFTIRQ_H */
-- 
2.25.1


