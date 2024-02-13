Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72910853EC9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 23:34:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680156.1058086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra1LW-0007Qj-1z; Tue, 13 Feb 2024 22:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680156.1058086; Tue, 13 Feb 2024 22:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra1LV-0007Kx-Ty; Tue, 13 Feb 2024 22:33:45 +0000
Received: by outflank-mailman (input) for mailman id 680156;
 Tue, 13 Feb 2024 22:33:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kFBu=JW=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1ra1LU-00072L-F8
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 22:33:44 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0048d57-cabf-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 23:33:42 +0100 (CET)
Received: from BL1PR13CA0329.namprd13.prod.outlook.com (2603:10b6:208:2c1::34)
 by PH8PR12MB7349.namprd12.prod.outlook.com (2603:10b6:510:217::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Tue, 13 Feb
 2024 22:33:38 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::86) by BL1PR13CA0329.outlook.office365.com
 (2603:10b6:208:2c1::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38 via Frontend
 Transport; Tue, 13 Feb 2024 22:33:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 22:33:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 16:33:37 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 16:33:37 -0600
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 13 Feb 2024 16:33:36 -0600
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
X-Inumbo-ID: f0048d57-cabf-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLTmGALbAyL+wry9LrcYzL0YwM1WbKDxmGMJXU11NW2l3zY3jeZAi4u+b7yy5wG33wT2Nt1R5KxCG7apn3Kg5gvw1DEFKpUljtrikZu3OXsx3TrfW/ZBUg/OjS2JhgeDVZD05nJUrKe7nTe333hi9o//G3KuytcPHAIjhACRU8bFT0DzkMF8FjqAKfvjDu5v96lVYQOPaAGCHwy2w9hQagDcgCFaLaGfQnEYVV2NUN1rFpQ3tUJ5tCLaJ6kV3idRGnrBmBB1+AC8apR5lX/2EW/alzB1BIgrbuOYhdSkIdsIZx7jlk7HKdwucWT7j/Ai/mj10Rj3j6entrKYw4tMVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIqzI8kYaY2Zo0nCOY7w4aQD8+SXQqH7qpdvGMs6SHo=;
 b=nCTjsaxSXnPvX0cxEgGQghEbSaTF82yRvL5Qd+ieWIBUKp9/bgFK34ARPn/t+PTqx53Vji4OqgcmEuwt5NDXxVZCNvootdevI3zs5+tUuxdDoST5+tgDBbBevEytpK0ZJRrECV3r7pdYEN8pvcCf6hf73vWSRH+I8sBfwtKH4yH6+DMdOkSYIF2KIN5/TRFNJ/eMysjAq536Fo0cT+4xtF9Q8Du9oc4gnV7u2+WgtGqnmW8bKTm3sVpH7vRNF+aMisFgxit20gkH73hwbgLwOMN+Gw+wNsZG/N56fk/ehZjgOPuPTeDFFEo8ILNOiVQg1cwBZl4RdoGxcMZzIB1BhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIqzI8kYaY2Zo0nCOY7w4aQD8+SXQqH7qpdvGMs6SHo=;
 b=kuIya99sCkprdU4SPSRSRpDgeeuDnrbHAvc/5KyIdCcIkVb67fOk1rPykqR5vgG1DS3Svr/njZXYyQ+d2ervfwQbDywzXyXd6M3MNCiD/5mpVrZyrzcEF4TfZWcWiAgPWQbyzXHhmBw3ygurUJAUff46a6KpzFoYebVJkHvB87E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <andrew.cooper3@citrix.com>,
	<jbeulich@suse.com>, <george.dunlap@citrix.com>, <julien@xen.org>,
	<bertrannd.marquis@arm.com>, <roger.pau@citrix.com>,
	<roberto.bagnara@bugseng.com>, <federico.serafini@bugseng.com>
Subject: [PATCH v2 2/3] docs/misra/rules.rst: add rule 5.5
Date: Tue, 13 Feb 2024 14:33:33 -0800
Message-ID: <20240213223334.3693410-2-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|PH8PR12MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f264f48-f1a9-4513-2662-08dc2ce3d270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9KyuUhoLSi1EwbI6V3sfrIB/Pt8Mw0bCs8WvgzeJb2Uj3X/YSbKyX+91Bs7UHWxKHxDPuoxGCPs0Tdl+sR06tpbYX9vI5qsoNDQnuKMlMT2TQhSzprSf7FjhVND+X0bOemTrpJKHi6xtPI6jM9PMj1VI0U627D8eCBrf3c0SR8sKybpBdWuEF7EJ+uTemZJ7JA3lX3YWbdOj4x28CPUSqxbXXtlrPVYp0tRWErU3idTSjRwyOe3PLSU0XSbjqpnOXdmbPrbpV3SxItnUaDbEN8g9BqinlU59eWJwgRwDsyxbxk8p+06dB9aYMl6J5dzdnKDcwGZ+FsAbcvq7n+FbOttgf2cmg3Fy+UDA8LZiJ92uoNisAvVi7ONd180CNu0IrGdoaoq7FGupTpV3wdR+kDQSKOONpuBG9kgbkvhDOXRaC+85JbyqjeYop/wCQAnIiZc/DBYMVoe+5veMxtLUTODe63uPCaxmPqUtIco9PKOsBvqKyPA5TLEFKkbF1JQ66RM4dEDaA/sdp1NuTBXK4Saiwdjff7uzbbwRw87afOS8Lmp/qoo3Cu+zOBT1h3NbkG02qQ3KDGbZ4lMg6uwvaQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(451199024)(1800799012)(82310400011)(186009)(64100799003)(46966006)(36840700001)(40470700004)(86362001)(8936002)(8676002)(5660300002)(70586007)(82740400003)(4326008)(4744005)(6916009)(36756003)(2906002)(478600001)(44832011)(426003)(336012)(2616005)(26005)(356005)(81166007)(70206006)(1076003)(316002)(54906003)(6666004)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 22:33:37.9062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f264f48-f1a9-4513-2662-08dc2ce3d270
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7349

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 docs/misra/rules.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index c185366966..931158b354 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -181,6 +181,12 @@ maintainers if you want to suggest a change.
        headers (xen/include/public/) are allowed to retain longer
        identifiers for backward compatibility.
 
+   * - `Rule 5.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
+     - Required
+     - Identifiers shall be distinct from macro names
+     - Clashes between function-like macros and non-callable entities
+       are allowed. The pattern #define x x is also allowed.
+
    * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_06.c>`_
      - Required
      - A typedef name shall be a unique identifier
-- 
2.25.1


