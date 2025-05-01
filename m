Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F05AA640E
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 21:25:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974265.1362166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAZWS-0002TT-7a; Thu, 01 May 2025 19:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974265.1362166; Thu, 01 May 2025 19:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAZWS-0002RL-3M; Thu, 01 May 2025 19:24:40 +0000
Received: by outflank-mailman (input) for mailman id 974265;
 Thu, 01 May 2025 19:24:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUVx=XR=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uAZWQ-0002RF-5i
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 19:24:38 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2413::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e82e7f78-26c1-11f0-9ffb-bf95429c2676;
 Thu, 01 May 2025 21:24:32 +0200 (CEST)
Received: from SJ2PR07CA0016.namprd07.prod.outlook.com (2603:10b6:a03:505::16)
 by DS5PPF5E0E7945E.namprd12.prod.outlook.com (2603:10b6:f:fc00::650)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 1 May
 2025 19:24:29 +0000
Received: from SJ1PEPF000023D6.namprd21.prod.outlook.com
 (2603:10b6:a03:505:cafe::72) by SJ2PR07CA0016.outlook.office365.com
 (2603:10b6:a03:505::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.42 via Frontend Transport; Thu,
 1 May 2025 19:24:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D6.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Thu, 1 May 2025 19:24:28 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 May
 2025 14:24:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 May
 2025 14:24:27 -0500
Received: from ubuntu-linux-20-04-desktop.tail503a2a.ts.net (10.180.168.240)
 by SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 1 May 2025 14:24:26 -0500
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
X-Inumbo-ID: e82e7f78-26c1-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FyFzfuNWvW8dMt1OiJluOSd1znOerC+pmns6m8HOArnq8HkPGkEaYyF4G3v/5WptQf0zhd63Kh6YDZ8JROF8xVyF/YpPes7mWAgDY/qdPvJb4T+AFTtKFb1ddu42s/5fxY4uRdHHJvdEWP/o7sRQmNx+jyUE59GEmhLnY2GszpVSrFgyeeA+JlFlbCl9o4fdDFhqDh9/QJOsGaSiVFoREMh6zzSh5QvL38JBU1dRG88tobepygL6LKX+CV4aB5u49NnOVMUWg37X+7JtL/jTg39o/ZssV/Vlc8lehWZKox3zl0vnEKwIlVoAuauPSNyt4zLXuoZOowMFobxk52HPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWFyBkGcolLP6ZBoxo2upVGUXUcmgDq+Pw6vE898w6o=;
 b=l+YfmmyhEK73xh4WvpJex34VZycsiNbsW4fRm82NL8lrT+L7GLVhNtZaP2KwValnu+X71hbPeDOfteGnj1muYjngqseUQIq5fJQLuZku6+hE/JsR20KOvGfpmfafg9gO67SpFQrjoVMvvC9/L/DYxd4ZYaQR2ptaaiQykYFpQKztAw7AFkl2dtzxpF0f1yOCHLg1e1sRxOLP7uRgSCm36K9qRl6cSSnD+cayNvzhQRPEE8hAL95niX+a8GKqOetbaM7MVGUmXxqUq05KlTmVdaGMoc1n6PuLc3Q0MEzSfkSeHwGn3PGp47gKqLPBMPPu6J8RbSUFq1PVGmfNJMTjUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWFyBkGcolLP6ZBoxo2upVGUXUcmgDq+Pw6vE898w6o=;
 b=GZxWC5AN+fKgeXswHrvjLAMGSqcoibMgRjPIWht/nQYGWqycUR0tVsgqCT8jrCIHXk0bHgPcpPbRQwd0GDlWJJYYthsbjSzGBewDbMq07CaevWcHNmuLkmLSdqndRMkExm02xfyA3mKDpMt+N0VMXn6jWJH4xT6HEd8k17fsGeA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <nicola.vetrini@bugseng.com>,
	<michal.orzel@amd.com>, <andrew.cooper3@citrix.com>,
	<anthony.perard@vates.tech>, <jbeulich@suse.com>, <julien@xen.org>,
	<roger.pau@citrix.com>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] misra: update list of GCC extensions used by Xen
Date: Thu, 1 May 2025 12:24:24 -0700
Message-ID: <20250501192424.197012-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D6:EE_|DS5PPF5E0E7945E:EE_
X-MS-Office365-Filtering-Correlation-Id: 544175a4-4f19-454a-7655-08dd88e5cad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6wKNAZydmQVlQjL9Ju3Rpz48XHcFyP9j3uyB89a9f6EhNP5trIVOFCqH7124?=
 =?us-ascii?Q?1d2CAk4WejA9bWZSAynNBkKn1HOirLu5AyuNI6Oh5BGN3OiJJlkua8bwaadm?=
 =?us-ascii?Q?kjZ8e7LPH0/PXaM4cGK+An4PoGxUzlZVuJt9RNWcsYw0tWfBLw350mmAOABE?=
 =?us-ascii?Q?p9Ho5yZLnOdjPa51m+9rGXUO4nCCFCA/nPMrc7osT47OOi9ZtyraGyyEX3QN?=
 =?us-ascii?Q?8ZTDStTyXyKmzft7xD+bawgcUQTPw8oeQU7qzAw7pQacTk+79HXnHPi5TrU1?=
 =?us-ascii?Q?CIL/39jJji0qBQieGGt6uIP4/rLQ7R5fLBIPn/G2HYbI2R9ExGawRXS2Azux?=
 =?us-ascii?Q?NIJNKNLcvI4vjEoWLgknCxZEgcMPwkoxZUCEnXNgvwOcAPaTauoZEqoahA0G?=
 =?us-ascii?Q?auzvCJTlrmGNVK/6gdRs5YWkL6kkmBlVlLwJfRYdIagZ2b2Q6npAYWdUPgeD?=
 =?us-ascii?Q?QF9ZMpDhk3hmyw+r5I39/4OF+sp/uuZrKVvoXMHQMAjZcjpR26r+KObyIuH9?=
 =?us-ascii?Q?nsZL4ZTv49DtMnHl8HVoaJDjXFS1YcPvUgi4cgf7sQcyetIWJLC9n5INknRf?=
 =?us-ascii?Q?RCfQrtD6CiEnB6eb6O1nn9hHbL92mvLoQDDoTHx4jn54nxX0CRbWwCHNiIcs?=
 =?us-ascii?Q?WRPY8cc4N5KHmslZ62TMEoee6wKVPx//0bnkbroBdOaY610Rw1rXRemGlfOU?=
 =?us-ascii?Q?xIPRe/q+GrTyzHKgvft20bqjBe97zFqdV/slbM6yXsRSFqx8zVT/w3VANwz5?=
 =?us-ascii?Q?5uQnDijn0hAncToSrIXpPfVQcw+A9fv28c45npva9eGrNYVg6oP3EpeDz8OW?=
 =?us-ascii?Q?tnqFjIJdr+3gHsn8YYNDjbAO0I63r+VORj+FZvckzQa1njSmrcZZ7/r9K/pv?=
 =?us-ascii?Q?B2j4xizZ5ztQYNcBfsl+rhJ1mShiZrHaNAHeWO07SGL2iB7RAUm40Ly0iLJm?=
 =?us-ascii?Q?1NL2HRi6i8A9qOdFd/2uIMPKXVfBDJ8uhknoGVFuKR43sQy/snm3yIcF5ryP?=
 =?us-ascii?Q?1MlTksV+TMwoOHbXHvIB6IHOlhAKqieNGZ89etx8naGyLB/Z0bFNSP8jQhcA?=
 =?us-ascii?Q?wCB3C86E7zyACWCCH/p4FmCjZX1IkcQpfLOYogLNC/+t6+s3a6U2ozXPpcgE?=
 =?us-ascii?Q?aj8Jj5CeSIfxn6CFInZ3dxDOs4Bj0oqy5Et5+TOcOgDYzdp5N/Oi3N/El1wD?=
 =?us-ascii?Q?O1kTS/YONWbGSsFH5/az//P+xJ9KnJeRBZjBj7BNS2Z35aQbg9k7cWKcrEWf?=
 =?us-ascii?Q?bFU37YpM5dSDKF9r0h/RkOJP2gQ4Y84T6Jz22l2jMe+0P2ySvhX+1Tmq5hP6?=
 =?us-ascii?Q?0vSJG9IMH0razt9IDntDkL0cxXhk/IbjMeDEIp0zVkKDcYOw1+XVXEPyUhDc?=
 =?us-ascii?Q?tlLiBVDpu5OuTVbCdOQgz5nrdec6PtuQn7MZklsqaZz7C/sAq9UX6Oojr79a?=
 =?us-ascii?Q?XE3Jz4PXzf00Iy8h1UcNUi0yAnL/5hIAfShfS/xah4SWqhP3r5SSAy7mTYwU?=
 =?us-ascii?Q?nS+hMN4dK0CaDmWMgAl6EkcrJ+OkKouHH9tL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 19:24:28.7187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 544175a4-4f19-454a-7655-08dd88e5cad9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5E0E7945E

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

__inline and __inline__ are already handled by ECLAIR but
C-language-toolchain.rst doesn't reflect that. Update the doc.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 docs/misra/C-language-toolchain.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
index 5ddfe7bdbe..3a1ce651d7 100644
--- a/docs/misra/C-language-toolchain.rst
+++ b/docs/misra/C-language-toolchain.rst
@@ -86,6 +86,8 @@ The table columns are as follows:
           see Sections "6.48 Alternate Keywords" and "6.47.2.1 Volatile" of GCC_MANUAL.
        __const__:
           see Section "6.48 Alternate Keywords" of GCC_MANUAL.
+       __inline, __inline__:
+          see Section "6.48 Alternate Keywords" of GCC_MANUAL.
        typeof, __typeof__:
           see Section "6.7 Referring to a Type with typeof" of GCC_MANUAL.
        __alignof__, __alignof:
-- 
2.25.1


