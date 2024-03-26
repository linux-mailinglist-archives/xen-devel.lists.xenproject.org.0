Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB68088D034
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 22:39:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698213.1089719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpEVj-0006wW-Be; Tue, 26 Mar 2024 21:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698213.1089719; Tue, 26 Mar 2024 21:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpEVj-0006tA-7V; Tue, 26 Mar 2024 21:39:11 +0000
Received: by outflank-mailman (input) for mailman id 698213;
 Tue, 26 Mar 2024 21:39:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfY0=LA=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rpEVh-0005qH-Jw
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 21:39:09 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45bb9f4e-ebb9-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 22:39:07 +0100 (CET)
Received: from BYAPR01CA0043.prod.exchangelabs.com (2603:10b6:a03:94::20) by
 SJ2PR12MB7799.namprd12.prod.outlook.com (2603:10b6:a03:4d3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.28; Tue, 26 Mar
 2024 21:39:04 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:94:cafe::32) by BYAPR01CA0043.outlook.office365.com
 (2603:10b6:a03:94::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Tue, 26 Mar 2024 21:39:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 26 Mar 2024 21:39:03 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 26 Mar
 2024 16:39:02 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 26 Mar 2024 16:39:01 -0500
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
X-Inumbo-ID: 45bb9f4e-ebb9-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hw6oZ3dbFjT78Uq8gPrlFnjvHDrr8oFTozbQkUpX11+de4mwTS+EKS4FyZ/ivQcZjSpG8ekzILF2bk+i5dqrVXxK00QB5bg6uHMOyMR3/t4yVcnb/TqZxbfN41tUv/eg86ajBJZpz6qcVlj7cqxXlS1xvDfZUnm9sUlITE5KNQEoWW7aIw03x4I6P0I6R31e3fENRDxI0HwEtJ2StDQxUydviAx2Rg0/gFPt1jRlVgg9hSYbJG4kd0mMFUzttvqt2N38vR/bVmOQil14mk+hEu0Sc21k3zTmKekyl/SHMMfsOuc1NnTyr4JwhnzgkLUni0JlWfbv8Gjyq1ieE2dICg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUHahSKteoMzLlSudCvzefdtpHOZ4svXrCedT2722Zc=;
 b=HuHpV+LxuynrTNOoWg51b/y5xYh+tRmwzVEbnhlyKqEXNBrb66u20qqKdIl8XGCmg0yWE+AcwXP+jXMEzYaQvyrQsMU9BDe9Fhkl50ibEzjHfnsRDO/KiLKurUaXB+P1H3XqZslFJJvvCUb6Hj9BzUZznyzNhfYm2+y+8N1b5XBGKFbpcrbkAZg7Ep13kToklvURy7yvfj3gCBVTZGDKucLlL1I95TZ1HZCHiqNO3RBQ15DHPcvFXnAsEjLQSUfmK71VDldz+QIBGlxQYWL77505rhZ7uu6JHxd0SZk5H1hPtNAbmzL+I7Lxp32I0L0OX+Lu/O6weytg1nUb4KKplA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUHahSKteoMzLlSudCvzefdtpHOZ4svXrCedT2722Zc=;
 b=ZNq2YrdAVCpyFimtJkDeYIUEWaSXA9hm4d8r3rgHa2E2WaFu6rvQqM91vE2RBSrMjP6FQ8Mx2xtbirvvwniZq9hGP1z2ukMYf7yPZ/hsdnTC7Yhi9rgKOFB9EOEl98wtNv5DIHpgBIy2a+Xe2p7q1qWPe3bwQDVYSJYG+upfdIc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v5 5/6] xen/elfnote: Specify ELF Notes are x86-specific
Date: Tue, 26 Mar 2024 17:38:46 -0400
Message-ID: <20240326213847.3944-6-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326213847.3944-1-jason.andryuk@amd.com>
References: <20240326213847.3944-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|SJ2PR12MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 1093dde7-b8e2-4534-6c27-08dc4ddd2827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/mA7qSIhMpCL9jKqXHz54+2tHRlGxMN+H7hNYfjfTHk1cBi25venHSjdJ9OT9XHPBSdQSwF658Fq7bwDsl2weLYtrlygG0coQOOOmXWEXPIS9IiC+OuLmtXNG7ebryD3Fgkwr4HWwG6h8oQzJvcjabt8gWN41NJKeZ5N6QATe/pfLo+8LZQgrFBdIU7+gvWoFRYr2aEZfYTX87MKEJ3PuXRl3M5zSOyXQxYP5xgRq+aV16BCn+BI2KHzmLN59E7BvzTK2bYEv0Xa/MD3/Wz1mYEr6nRdKb700lJ9DTMxwQqs6/V/tm8nTp9hX0D0Jrl1hhoaXLy4tP9P7DZgQur3StsnOmbf4HWUu97jHvct+FWopImw8HxZosaW7qeJyJ4hXvlpIlZRNlX3Zv40TYLy4RHq7On9BdRjNYRuKMYFFiACZjtoVNYt/juZqjZs3eFco4jrqF3qLG3zCgdxhDF+FYx8kDI+YQmrQT8VZK3748mkfkr4y8n4IpPaMPWknpct2ci0H+HJB1Jp31EVSMq84inQ9ytaBeIDanQRIGG0xPI1jsBv/XcahF4NFU52nJf64kW1n5WGfNvghOCXIqpEPS4EwyGltxKg2V3oLKhRaokk1KnxnJcTsYIHETq1t7iAxWxXTsSko0n2ac6gbIG0fUE7KJVtfgKpaSsslBWphim4gVPp6v4X7yD05LDBRwic2kOBhCx00TxpKahyc5MOVzLEzRU6JNQSYhqellHrrvIv4L860bLJTzrl0T7j/j/T
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 21:39:03.4051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1093dde7-b8e2-4534-6c27-08dc4ddd2827
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7799

The Xen ELF Notes are only used with x86.  libelf's elf_xen_note_check()
exits early for ARM binaries with "ELF: Not bothering with notes on
ARM".

Add a comment to the top of elfnote.h specifying that Notes are only used
with x86 binaries.  This is to avoid adding disclaimers for individual
notes.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/include/public/elfnote.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/public/elfnote.h b/xen/include/public/elfnote.h
index 8bf54d035b..1d84b05f44 100644
--- a/xen/include/public/elfnote.h
+++ b/xen/include/public/elfnote.h
@@ -24,6 +24,8 @@
  *
  * String values (for non-legacy) are NULL terminated ASCII, also known
  * as ASCIZ type.
+ *
+ * Xen only uses ELF Notes contained in x86 binaries.
  */
 
 /*
-- 
2.44.0


