Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B92523E8EB6
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165753.302967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWM-0000xS-FM; Wed, 11 Aug 2021 10:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165753.302967; Wed, 11 Aug 2021 10:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWL-0000eq-NX; Wed, 11 Aug 2021 10:31:37 +0000
Received: by outflank-mailman (input) for mailman id 165753;
 Wed, 11 Aug 2021 10:31:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlR5-0002Qj-GD
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:26:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.41]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a1ddb68-fa8e-11eb-a052-12813bfff9fa;
 Wed, 11 Aug 2021 10:25:41 +0000 (UTC)
Received: from DB9PR02CA0019.eurprd02.prod.outlook.com (2603:10a6:10:1d9::24)
 by DB9PR08MB7097.eurprd08.prod.outlook.com (2603:10a6:10:2c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Wed, 11 Aug
 2021 10:25:39 +0000
Received: from DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::64) by DB9PR02CA0019.outlook.office365.com
 (2603:10a6:10:1d9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT049.mail.protection.outlook.com (10.152.20.191) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:39 +0000
Received: ("Tessian outbound ab45ca2b67bc:v101");
 Wed, 11 Aug 2021 10:25:39 +0000
Received: from dfd3347eb500.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 22735298-353D-4C27-9057-2E4937A724BF.1; 
 Wed, 11 Aug 2021 10:25:33 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dfd3347eb500.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:33 +0000
Received: from DB7PR02CA0004.eurprd02.prod.outlook.com (2603:10a6:10:52::17)
 by DB7PR08MB3723.eurprd08.prod.outlook.com (2603:10a6:10:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Wed, 11 Aug
 2021 10:25:26 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::9a) by DB7PR02CA0004.outlook.office365.com
 (2603:10a6:10:52::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:26 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:26 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:18 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 11
 Aug 2021 10:25:18 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:16 +0000
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
X-Inumbo-ID: 7a1ddb68-fa8e-11eb-a052-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odN0lHZAsbsVRMXgR2b8ZeF2f7UGOUcwvUmC6yeEvE4=;
 b=6caHZsM8dl0fYrGEkXxCuR/NxH88PHAEWUJnYT+ZOlRi55rWMQYDuqNscdtNySFnum62J+L0QIvTG1S9aEtujZOJMp+lw9Lixz3+STGKDvErX+5GbY0ywp7wovMXAGsQM8IzGW815RL/IXkih3waBcBHs6tCZhSrDFUVrRrACvA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c2c8e51570f7c19c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Daizj4Q/2uR2wt2v6T5yYeW8wZNh53EQj9oHSwk5dEDu+9uL2E9XJzDCopF7lbYcaK8WyFUExF0WjNFQrY0nw/3GdmKCbts+pTu6l++VmvjlmLBl7GlPWaDStdtZ/LeHmZ7qp3Gr13I35SMMeYN+RnUbs0Iu4pYKoDURVA5jl85mBl5aM2NJQWr31wFcmlQU+oFAHOSIriPtTEGxYDd4+k3DmHmCQ0fFaDaBuTKYfE6Sr6Kfw6U68FtD5Zbd6gtYQK4bJZo/I/TAyFZtkNeXHLpIgZPU5HgQkue/k6KLQn48B1UJfgsfnSNGS6IIZ69sEzDE6N7pijgJ34jlPGrEew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odN0lHZAsbsVRMXgR2b8ZeF2f7UGOUcwvUmC6yeEvE4=;
 b=is5MiMPxrb9RZuFR7mTGsa/PVLhRuxTwc8gdJ45Ss+7PfQQj7RvMOGDFEyw/8Xc0ckVWelMu48AbJKmfz7j2vSoxNYurz7EZZ08vfRd75sZsSnByXPgUXabFVud7csH3qEbAkBfacLRrTbDVqKDEHrtnMGn+euZOYsBKzNLde98OumMuuFZXJfhK5KhETRJLtXsL5BmQf9eBr5kleM2qdjHX2ItzDmYA3hauXOBeEkUlu5fuUtF9ObWzCKz6RfTWdB5dWDo1e+HPS1EU/NC7Nj3pYO107I4uLYJkQ7JuQUV8GyDALxNH+r0T1RF33mG+snbsPrkkT+vqE1n7RKRVUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odN0lHZAsbsVRMXgR2b8ZeF2f7UGOUcwvUmC6yeEvE4=;
 b=6caHZsM8dl0fYrGEkXxCuR/NxH88PHAEWUJnYT+ZOlRi55rWMQYDuqNscdtNySFnum62J+L0QIvTG1S9aEtujZOJMp+lw9Lixz3+STGKDvErX+5GbY0ywp7wovMXAGsQM8IzGW815RL/IXkih3waBcBHs6tCZhSrDFUVrRrACvA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>
Subject: [XEN RFC PATCH 19/40] xen: fdt: Introduce a helper to check fdt node type
Date: Wed, 11 Aug 2021 18:24:02 +0800
Message-ID: <20210811102423.28908-20-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b70631d2-6414-45de-1775-08d95cb25ddf
X-MS-TrafficTypeDiagnostic: DB7PR08MB3723:|DB9PR08MB7097:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB7097956E502EC8F7072192059EF89@DB9PR08MB7097.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1KO5nXSYrpAx0UcAhvulIaLhpBurXeXLojtp9FQJR2gDA4+LT3abMGIModWEzul+Y09boyTwAGmHuDUM7ykitAAHrMWF2HBmtgSTvUrE5htJoOhyhfTT8bJv2uR7+6V8n93Ga3TwEHtRnJOtYq+0/rKkomYjS2lQDDKA3pE0yrXsAJEETBz0JnkK98Y6U2wDIzI3V97eco6ppvmCP6gyuCaHTPsUaDs2wW+LuOPpoICjo41wZlaU/a1n1v3DVLahcQZccoCzemQFEUidz0FqOOloMO3XpP7NrL2S40BnsaQt4EdYn9jQ8iRwgqJJBWODtFRaAIl/DHnvdlh1Ja+Hya7GjDXMl4G8yE1DAgFBAuZE7BNI6f68zbIUKFieos3j1cB6E0atj4OIQ3fRBtcEJ9lp6Ea0xqcI+jMx2G11hfIR3IGzHvAo984nICuE7dW8BMAouVjOLlujwRCB5eVqIPe+MY9+B3A+KV44uEjG+ndtR3vAhqAADaICWXiEwNiDZKfI0y/Lnji5sVHhBaDbnTTuNTLYFw1+NUHF5PS5oGeRQLtPVtirEY5BWOLlN5GeCuelBkOnZSz1QFT1FVGSLxcJfLnJWxLxnJ/yiw88kXK+Dw0VldHzwuJQEo4g9uV39Xg4jtg3JiCejbaHKsSAQEZ1EgXgvt0Ol2BDl34t/tIDcUnFwsEcnzjbGw6lu47DogjpskPIGiHoZakzd3X+a4kX8ZKjn1Agtt6N7SXU9aARehKzfJ6TjnV4H2S4jUQoozjzVUi/d26JIuo15WMIgdxHOJ90h96i5AsSxvQ8/4c=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2616005)(336012)(86362001)(2906002)(186003)(36860700001)(1076003)(47076005)(5660300002)(7696005)(36756003)(82310400003)(4326008)(70586007)(70206006)(356005)(44832011)(8936002)(8676002)(26005)(426003)(34070700002)(508600001)(81166007)(316002)(110136005)(6666004)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3723
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	15f0bff1-bb77-4f6e-3f2e-08d95cb255a2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RoIUMMmpKDtBrNFzT0L6HqQ6Glr5bL0Fi/Zc/5YL7oMiitid2/ISmxq3M98Q+2/JXFU+lPCk6fVrWjaxFFVut7eV2NZXjeEJKBiLNV+mHk0l5aPrwTQ89eNh/UuBwz+dNqEfWlBdtkNZPBD4aBcVJRmY2Cxdmg0Ie7slulAbQ74xNkaKpnCLT3WfN1XdHk8YLkU+JFdD1Use6mfkOp9h0g3g7GLycfCTV1rV7A0+ETx6QydYLOqQYocw2LKzh+0eRSU55WmX/7il35mPO0Prv8IIc+5jUZuW2SBTonB2ATZk06igPqRDfUFBqEKcJVDSCVeBFF+hydIgriLKQnpuVLC1Cg2DBkFb2Bi+tkpB5do9JYSKmEti12jm6Ho0tgSDw7XJhE47KOD76vJcdWbMxrmJkPymD9nhOfqoGVcYH8MlorfMQoSL3fqexPnvnT+envXrldcyX6SR88KQzmzSjI+isFF/6noqOIFqQD8Lba8wlSaJcHP+nviopyQcvgdFgLB6fb52TBLeRnbyinyGwWYmxNq4kxqD51WLb24rUccpsk4uTRtTjg3uiBSugWOJOeczR/dpagPInP1P3HcH5qJhPcRpskMnXb9aEuRyA+Gh6wiZxPaK1Pwrc39SyWerii3yz4337b8oa6k99Xb4XMB39EL4RC9RR5mkVY+WVIGphFYAdBA6KC6X/ltmMBMqnR/lKAHtfy8oR7YRH6q4YtYAq/hlxsczDcydyMjEL4c=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(46966006)(36840700001)(110136005)(186003)(426003)(8936002)(82740400003)(36860700001)(26005)(8676002)(478600001)(7696005)(44832011)(316002)(86362001)(47076005)(1076003)(2616005)(6666004)(336012)(70206006)(2906002)(5660300002)(82310400003)(36756003)(81166007)(70586007)(4326008)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:39.8401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b70631d2-6414-45de-1775-08d95cb25ddf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7097

In later patches, we will parse CPU and memory NUMA information
from device tree. FDT is using device type property to indicate
CPU nodes and memory nodes. So we introduce fdt_node_check_type
in this patch to avoid redundant code in subsequent patches.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/common/libfdt/fdt_ro.c      | 15 +++++++++++++++
 xen/include/xen/libfdt/libfdt.h | 25 +++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/xen/common/libfdt/fdt_ro.c b/xen/common/libfdt/fdt_ro.c
index 36f9b480d1..ae7794d870 100644
--- a/xen/common/libfdt/fdt_ro.c
+++ b/xen/common/libfdt/fdt_ro.c
@@ -545,6 +545,21 @@ int fdt_node_check_compatible(const void *fdt, int nodeoffset,
 		return 1;
 }
 
+int fdt_node_check_type(const void *fdt, int nodeoffset,
+			      const char *type)
+{
+	const void *prop;
+	int len;
+
+	prop = fdt_getprop(fdt, nodeoffset, "device_type", &len);
+	if (!prop)
+		return len;
+	if (fdt_stringlist_contains(prop, len, type))
+		return 0;
+	else
+		return 1;
+}
+
 int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
 				  const char *compatible)
 {
diff --git a/xen/include/xen/libfdt/libfdt.h b/xen/include/xen/libfdt/libfdt.h
index 7c75688a39..7e4930dbcd 100644
--- a/xen/include/xen/libfdt/libfdt.h
+++ b/xen/include/xen/libfdt/libfdt.h
@@ -799,6 +799,31 @@ int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle);
 int fdt_node_check_compatible(const void *fdt, int nodeoffset,
 			      const char *compatible);
 
+/**
+ * fdt_node_check_type: check a node's device_type property
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of a tree node
+ * @type: string to match against
+ *
+ *
+ * fdt_node_check_type() returns 0 if the given node contains a 'device_type'
+ * property with the given string as one of its elements, it returns non-zero
+ * otherwise, or on error.
+ *
+ * returns:
+ *	0, if the node has a 'device_type' property listing the given string
+ *	1, if the node has a 'device_type' property, but it does not list
+ *		the given string
+ *	-FDT_ERR_NOTFOUND, if the given node has no 'device_type' property
+ * 	-FDT_ERR_BADOFFSET, if nodeoffset does not refer to a BEGIN_NODE tag
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE, standard meanings
+ */
+int fdt_node_check_type(const void *fdt, int nodeoffset,
+			      const char *type);
+
 /**
  * fdt_node_offset_by_compatible - find nodes with a given 'compatible' value
  * @fdt: pointer to the device tree blob
-- 
2.25.1


