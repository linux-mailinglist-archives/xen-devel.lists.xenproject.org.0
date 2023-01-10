Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7815D663BF0
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:55:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474471.735733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAPf-0003bg-0L; Tue, 10 Jan 2023 08:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474471.735733; Tue, 10 Jan 2023 08:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAPe-0003Yg-Sk; Tue, 10 Jan 2023 08:55:18 +0000
Received: by outflank-mailman (input) for mailman id 474471;
 Tue, 10 Jan 2023 08:55:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K1Mu=5H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFAP2-0005s6-6C
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:54:40 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2040.outbound.protection.outlook.com [40.107.13.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a8f16e9-90c4-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 09:54:39 +0100 (CET)
Received: from AM5PR1001CA0039.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::16) by AS2PR08MB9546.eurprd08.prod.outlook.com
 (2603:10a6:20b:60d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:31 +0000
Received: from AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::f8) by AM5PR1001CA0039.outlook.office365.com
 (2603:10a6:206:15::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT013.mail.protection.outlook.com (100.127.140.191) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:30 +0000
Received: ("Tessian outbound 8038f0863a52:v132");
 Tue, 10 Jan 2023 08:54:30 +0000
Received: from e1b2afb5b038.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4B3EF0B9-F4C2-42BD-BA0C-7BA60B2A73B3.1; 
 Tue, 10 Jan 2023 08:54:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e1b2afb5b038.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 08:54:24 +0000
Received: from FR3P281CA0152.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a2::6) by
 AM9PR08MB5972.eurprd08.prod.outlook.com (2603:10a6:20b:280::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:23 +0000
Received: from VI1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a2:cafe::fa) by FR3P281CA0152.outlook.office365.com
 (2603:10a6:d10:a2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.11 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:23 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT037.mail.protection.outlook.com (100.127.145.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:22 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:54:20 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:18 +0000
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
X-Inumbo-ID: 6a8f16e9-90c4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2FodgFJQlHN+jEOT1icBJJm4ueZE52nEYnjQXW8aSU=;
 b=5ngaVJMMfdKPRJlMeUfRk87msXv9iG3rhV8PHtIs0yLFbAQw+JyiFdmkhk9lmlnZDxvL0knByp0c8fDtUfkBtPGsDImLyA73TktN8cvfK4V+dBTGMkRW+Pb/DYrWdnfj1leJotguqtOh3r6CAM5ZkpdiEDXC3Qh4PeqOt3KzZFY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 48f0738268577f07
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gujj+nN2Tey337Kxfu8v7LxzA1GHQGNgyOxScgmPs4VFlQSubR3PJqovA6W8jzFw1QJvS8hRPa2o4Bl0AseM1RIa2b65qX7NkR0xpaVo7yu8o8TDR8E/cvaiRfoCUVN5mBLp/r7Ss53ed1FA+2fxNeLw9+xPpBInTUxhvZOe4l2oI1W/VkNhNiL9jIrPG+zgGoncNTMpVNNiHcKmCrqAZDAX4ysxhwDzao8/G/gBwulqiC8PEYiXejY/RbeXTDy4h3gfr6QIs3u2dU7dfcFmcEQaizfLQ1+qlkUWQgOUV8VBra5dTs6GaVFb0kGdHG+30ez70uHnSei4VxaADegBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2FodgFJQlHN+jEOT1icBJJm4ueZE52nEYnjQXW8aSU=;
 b=eOcBKIioqxKMO2/XlvTtP7J6moNy8nfLr9220mQ29ujOm8cTT8YKQXZtkC3PID2Y7y+9d40qmDPsNVjnObb96n2Lz9rl5QRwnRJuM5Sgl7ZOmClXvnU5s2qhHZwW/I/lV9YAETaJ4lxclLwh1PulVG+d3EhT3/IoMToyMtaX62+prFI5ULh3gARcl5hMnZh+n4UIs6iREgG6ECu8Gui7zXrh4/0ICWcEBqWLIiBNeE0BLCyXEot2PBxj68S+ZhfjUWrz/G/Y7mq/VWqntoBhpX3w/0//5d9dLLk0iCeHFu5UxH3FEtG8Y+C/35XDHve4foKfV9CUsMxIhjowK5EsHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2FodgFJQlHN+jEOT1icBJJm4ueZE52nEYnjQXW8aSU=;
 b=5ngaVJMMfdKPRJlMeUfRk87msXv9iG3rhV8PHtIs0yLFbAQw+JyiFdmkhk9lmlnZDxvL0knByp0c8fDtUfkBtPGsDImLyA73TktN8cvfK4V+dBTGMkRW+Pb/DYrWdnfj1leJotguqtOh3r6CAM5ZkpdiEDXC3Qh4PeqOt3KzZFY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 13/17] xen/arm: implement numa_node_to_arch_nid for device tree NUMA
Date: Tue, 10 Jan 2023 16:49:26 +0800
Message-ID: <20230110084930.1095203-14-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230110084930.1095203-1-wei.chen@arm.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT037:EE_|AM9PR08MB5972:EE_|AM7EUR03FT013:EE_|AS2PR08MB9546:EE_
X-MS-Office365-Filtering-Correlation-Id: f51d712c-b003-4132-0f9a-08daf2e849c5
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KRxgqa5aoyZuuqh55H8XFhW9AR9ToiSWX1xcdhlzXNSg8e2OnrXSELdc9ro+dfZrIeaDHQQfKY6jdl/hCHOfY9KTC7y+eBTH66fwp2yNFOZKgnBVfTYrFPQA2hKxFfYezNJogunfDSLH7gdAOaxgd12hoNYDg5xEKMBmO4kQoK19ihwUlgjZOoO3CaL4pE/9vAzPHzXP7oWFFN2Z+GYJujreylGNLJuUvPs1M5ywaXcPFA+AmS8lXgwu9yxiFkZQpBLAmkCL/8tw7P9O4UhH/9TBSAsE2li4WA9WSWOAt+frdMgoGqqtr13xaOU7w/KZ3jutEHKFbQzlxCXGXPqcRkiQj1HTBlNj0XcHOyxiZ9mrMh9U4G32ufaRBytgSeActm0RJ4iXOBD/LotuXkS1tkefsylm7b1INBzjHdTOgzR0mh+JxBQWPRI2GxX4ugpPU0x5e6Q8rL7Ujz51v+jcvWnr525AxdH9P8U4M5ZKhGLv5ioPHx+bAMyLkS5C1Py4O5t6d5qCPYXOhyqC4abojlK1JF9w8W2uvc/dgI8ndQM5VhHyWsedHVtDH4m/sDpX5PT1b5gjI10hnieKfAAAy4hW9yvxlsQqqGo5ySIfwkBBEc6GbK9T2ahrVIL1dEqi+XqvHZCaLfBvNHV/V2f0B8CM4OAAtQesZqgKjxaf2zXOaNQG5P+66t5ZbJVdBJ7c88GH2QhP2Q7zFKKirYq5Vw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(46966006)(36840700001)(5660300002)(4744005)(44832011)(8936002)(41300700001)(2906002)(36756003)(54906003)(83380400001)(8676002)(70586007)(70206006)(4326008)(316002)(6916009)(7696005)(26005)(81166007)(186003)(6666004)(86362001)(478600001)(336012)(1076003)(2616005)(40480700001)(47076005)(82740400003)(356005)(426003)(82310400005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5972
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fe8c08a8-489c-4652-ba7a-08daf2e844b3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jssQLk84BYGbldLfDpzDNyi8hXCoJrKgNGph29yW253pBcFp8/j/11QDHeiM0ReBjjJHXFD2u7rz5vMTt1mITL6TYSBgKiNPMvim7Tju1F/hshB7lAsU90AlIaLuRX3Z6QEt9M6XV+DJNXTala26ADwGlCF49LpeJH1FO5jZ9Byerpts5v7vzs6INWnVw2srBvvA83bparPt04yodbjQbXEwMPqRQwa1hhw/IUK4WBixGdlnykCoIhQsOh8hjse1qi8lQKjofCAtmDOsNn22fcsOIXJncqydGh7fyxTH7czdF3UShQ5ulOMD+I9VoMWA9ANb0M6WLx7XsSsLn9x1iMSFtLjLJXG/V1xWY1MBYmKOdXzGPKFuOOSz/mNkuxML00oZggh8L/oWdyG7Pp8pJ7ChAuItRyzRm2fFpAkCulZ2vDRCyzG8h4EFSQETrtxSpk+15zlEPYsQmBAYGz5VYV1NZce+6P6vqTOZWesUbCgNZk4D7Wwd0mE1FJD6RDFsk8uvuumSr7TlV04tjSDaoQNl9JCyyeSXIeCCA2jt8VeTevL0DAcShX5fm2iScZ389gd4dbwecRMhIcByhGlP4D0JKWumK3tQANvlywQNxDuQtt3C0ECevmaE/xHHQobzZb56TGbtyvjIyJvBMULdh2wUaRdZ/AfkmkFOzSENRUXDvBgKbPmYVgLMa5Y/0ivcoxGD1nHlaj1UwWgmZ/HHHA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199015)(46966006)(36840700001)(40470700004)(36860700001)(1076003)(86362001)(5660300002)(4744005)(44832011)(186003)(2906002)(26005)(36756003)(40480700001)(7696005)(6666004)(83380400001)(478600001)(40460700003)(107886003)(70586007)(8676002)(4326008)(41300700001)(336012)(70206006)(47076005)(54906003)(81166007)(426003)(6916009)(316002)(82740400003)(8936002)(82310400005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:54:30.9707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f51d712c-b003-4132-0f9a-08daf2e849c5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9546

Device tree based NUMA doesn't have the proximity domain like
ACPI. So we can return node id directly as arch nid.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Use numa_node_to_arch_nid instead of dummy node_to_pxm.
---
 xen/arch/arm/include/asm/numa.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 34eec9378c..a0b8d7a11c 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -47,6 +47,15 @@ extern void numa_detect_cpu_node(unsigned int cpu);
 extern int numa_device_tree_init(const void *fdt);
 extern void numa_init(void);
 
+/*
+ * Device tree NUMA doesn't have architecural node id.
+ * So we can just return node id as arch nid.
+ */
+static inline unsigned int numa_node_to_arch_nid(nodeid_t n)
+{
+    return n;
+}
+
 #else
 
 /* Fake one node for now. See also node_online_map. */
-- 
2.25.1


