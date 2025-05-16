Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6178ABA67F
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 01:22:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987718.1372972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4NK-00073Y-OG; Fri, 16 May 2025 23:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987718.1372972; Fri, 16 May 2025 23:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4NK-00070D-Fu; Fri, 16 May 2025 23:21:58 +0000
Received: by outflank-mailman (input) for mailman id 987718;
 Fri, 16 May 2025 23:21:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iQOe=YA=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uG4NI-0005s2-M2
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 23:21:56 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2412::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e5915ea-32ac-11f0-9eb6-5ba50f476ded;
 Sat, 17 May 2025 01:21:55 +0200 (CEST)
Received: from CH0PR03CA0427.namprd03.prod.outlook.com (2603:10b6:610:10e::30)
 by PH7PR12MB9253.namprd12.prod.outlook.com (2603:10b6:510:30d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Fri, 16 May
 2025 23:21:48 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::51) by CH0PR03CA0427.outlook.office365.com
 (2603:10b6:610:10e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Fri,
 16 May 2025 23:21:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8746.27 via Frontend Transport; Fri, 16 May 2025 23:21:48 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 18:21:47 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 18:21:47 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 16 May 2025 18:21:46 -0500
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
X-Inumbo-ID: 8e5915ea-32ac-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N48k9fDCm8AVH1vOEgCH4zBs4bk7c80SjG3qyO47bAB54rcAosn7JTDslQ63+0Y1QrM84c99Cl2J9L45RgglPn++X0cCMcHf1qywv69WshZ0Rc0BVM4buCw0Un7HhOmrOVB7eZmb7nJpI/lOm2JlMO3TjXpbtT+s8y34MM0G7zKkCGdNlsXc7TT0s3RXMZzxYIlxETGuGDA/7UIpu1/A9BF+LvN0HMe6bW1vSP5B2AxIOs0t9MN8njLEdMakrILAHQ6QCAei6pR6uZvLplveiQ+JRLVpuWc6d68gyZJE9hREcE7V8QDCDVmVnRBFcjLDqShIMhC3bu9Odc0qd+Es+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57V9Nd7Q2z6fh1EUxxPXh8g4JtB/sK8KIr3H3tt5FC0=;
 b=RgqtonA+hPeHS2wHXU0H0nn9XIGhKwvRhnKo8r4QfRVbgHkaSGZzSr/ZLZoPDBpCnDWw2+96ZyjqlDIC0WysihaJVAeI5FOvNtTjgHmnrur+0U/HKWQRQXjxDtRt6h4xz2JglEU9nVJP1bgxWU5rHATOqfUxeior5zjkU9byWX6mqUhDCCbdqzkj7kjtOUS0Ye2ARxaCLgI+0HF0fBd8ga7RQIVeLPiLFyDasqsM/vKF7hXjLYcnzPPel2IXU3FuCtKzyAgUOeoMcvh5ow08fKCEZioVq7FNfrtM7RUdQWy/GxxPJKKBo4norIABPTE3nhB5UuRwufQ36JMAnadovg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57V9Nd7Q2z6fh1EUxxPXh8g4JtB/sK8KIr3H3tt5FC0=;
 b=3pjvcGzeemkOKnkD40JJuwZ3Z40UJ5INMqPZTSPCgwfuL6Egc5OumHnzoUELueenoZvNVhlA5ZsrKZhh3skcvZP5GsToMJ5RSIO3H2DuW7xJDxgHatHs3TKa4eYjnGk7vQRdianV0XdY79Z5KX/fgJil9TSiHNU4yOvwG5N7neo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <michal.orzel@amd.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <roger.pau@citrix.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, Federico Serafini
	<federico.serafini@bugseng.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH 4/6] xen: refactor include guards
Date: Fri, 16 May 2025 16:21:28 -0700
Message-ID: <20250516232130.835779-4-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|PH7PR12MB9253:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c29a5e5-071d-463c-c03b-08dd94d06e48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GQspYlvZQDBymHqomv21D0KcsBZtzoy/cYmN4qXNJJ17E4GV4MRNkeIy2Ppa?=
 =?us-ascii?Q?ZCAPTO1ppVLgK2M//Jtomfm1srPqt+Y0pkIPIdOejEOxVvfpvNekUw8Ahz5E?=
 =?us-ascii?Q?Odv4LwymtYlLP+gqSFXTtyLJ2Bg+O6Th9xfwuOZyHKILD0++i73msKpZvEHs?=
 =?us-ascii?Q?dF6U/j2q99+NURY5ZR3dpT0vq1/h3gNWS4Rac+5tqW7h+OSZW27cTM6yfBjb?=
 =?us-ascii?Q?+aJAKca0VQlX2QWVYMxIVAq5mqjeUFWGOwXU8/upwNmke32mqzgLZ/KTXXeo?=
 =?us-ascii?Q?NCxcJoO1fHItPdPofjaAwIO9IES8M5LnnOLvqjSlC+ddSrhMPkVoQxpLCGqT?=
 =?us-ascii?Q?nrfoM6eOXxnz7pIVTuRKc2G9U63Pg37lQCX2ZZ/WngSEdWgKndZoCowNRlDD?=
 =?us-ascii?Q?lui321tLATdokVkIfEAE6NMc/1dk8tq1lJGgbFVHQVEE3cyYwrnYzTFXmjJW?=
 =?us-ascii?Q?jwR/FpaeJsSlI36n1uB6xP2nOPj8fPSIbtCWSA/hbLKeDPMtL5BX/orj02Rd?=
 =?us-ascii?Q?WJMqrTSdxm0Kc3eVHoS/ypjH9+sS+/dG4icTqRHDJTRfveYIJOYBHOov3733?=
 =?us-ascii?Q?t98dhI3sK1AUQ6jvMCZKBtkK/IlPtjyZTXk/9mysYj557WHaCTpWk47TRXBU?=
 =?us-ascii?Q?LJmqY/eIjqK+sQm9hjY7ijuFrHHV5bkv12M8H4apsmSuIMtlrv9vkMfpkN4B?=
 =?us-ascii?Q?xJ4rtGulmBhiHofMIx4wkF/DNqTQwBR3DGCbRnqSROLlqIFi29Nc6LgF26OV?=
 =?us-ascii?Q?mv+DUohg6Y/Un+qIwfBqCiGt1WSTPSQVNqrA0kQSOkpyxRq1xNPhpSj22e96?=
 =?us-ascii?Q?lAjaa82hwRiUE+7LcPhzlF+puHk0a3xdjZojD0UU6Gm14q4/7XeaM9NpkLz9?=
 =?us-ascii?Q?QRAagRwb2/p4zx1Z3Sipm+FBze6CD7ziCm80Sp8KkFIOBz6SmBLK4Eon7bLp?=
 =?us-ascii?Q?fAbEvTImiaLkcSm6r1w1Htfa5GrVXBRyy7/W6OoQQZbZegaqlk1UPNVspdoB?=
 =?us-ascii?Q?S2vGEACW3tR4syFjKTqwVxj2Aia+f2ntjbz7MJXNsozU7I9y2BIV+mnx7VtV?=
 =?us-ascii?Q?WIP2aFBD/105un/ZIa/tTPyRH+PADhenX6kZs9GmQKcnmb+52AGWw3I0V57v?=
 =?us-ascii?Q?yvWNR6J/DIFolDg/duMwpXEr3Zr195iwHDRQg0XHD98MzWDEZ2+ZGCOy26aN?=
 =?us-ascii?Q?9PAML6S0xo2JhHwBrtit6zJlpLIc0fzf22jwIL/qPh5dA5TGazzsOFIHjM4L?=
 =?us-ascii?Q?Dy0F27AcTazRBMgTrgOa8MdbS8p7BPsRMncBMzCYMjyrMX8cs9jG+wHsGfvy?=
 =?us-ascii?Q?/6vLdizIQv2wjQXQ0PyQigSeO+XI0jYKraFd9XwfwMfpZuSeA3L3adr+YDtv?=
 =?us-ascii?Q?Q3D2xCWLwWeP/85hPUeDlI+rBXt6gwHU7tft/UBFaKYDm9RsZUBLNnqVqDqX?=
 =?us-ascii?Q?uIGUy3rSuyLAXVwHUHIw7kVyZo49IiYUZDm7eunYsthjQ71YuBEmPzCnrKne?=
 =?us-ascii?Q?QiZuxeVpM5/RbWaD+mkZrEQjBtn7QrF7VLQ0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 23:21:48.0301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c29a5e5-071d-463c-c03b-08dd94d06e48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9253

From: Federico Serafini <federico.serafini@bugseng.com>

Refactor inclusion guards:
1) use a syntax that is more likely to be recognized by static
   analyzers;
2) follow the CODING_STYLE.

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/include/xen/err.h     | 10 +++++++---
 xen/include/xen/softirq.h | 10 +++++++---
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/xen/include/xen/err.h b/xen/include/xen/err.h
index cbdd1bf7f8..5bdf8b215c 100644
--- a/xen/include/xen/err.h
+++ b/xen/include/xen/err.h
@@ -1,5 +1,7 @@
-#if !defined(__XEN_ERR_H__) && !defined(__ASSEMBLY__)
-#define __XEN_ERR_H__
+#if !defined(XEN_ERR_H)
+#define XEN_ERR_H
+
+#if !defined(__ASSEMBLY__)
 
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
index 33d6f2ecd2..5593c7b0a9 100644
--- a/xen/include/xen/softirq.h
+++ b/xen/include/xen/softirq.h
@@ -1,5 +1,7 @@
-#if !defined(__XEN_SOFTIRQ_H__) && !defined(__ASSEMBLY__)
-#define __XEN_SOFTIRQ_H__
+#if !defined(XEN_SOFTIRQ_H)
+#define XEN_SOFTIRQ_H
+
+#if !defined(__ASSEMBLY__)
 
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


