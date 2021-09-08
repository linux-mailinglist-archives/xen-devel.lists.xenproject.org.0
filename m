Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 499EA403761
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 11:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181628.328904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuI7-0004f4-19; Wed, 08 Sep 2021 09:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181628.328904; Wed, 08 Sep 2021 09:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuI6-0004Z9-OG; Wed, 08 Sep 2021 09:54:50 +0000
Received: by outflank-mailman (input) for mailman id 181628;
 Wed, 08 Sep 2021 09:54:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SEYe=N6=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mNuI4-0001EI-4h
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 09:54:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.44]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4067fc8-108a-11ec-b148-12813bfff9fa;
 Wed, 08 Sep 2021 09:54:32 +0000 (UTC)
Received: from DBBPR09CA0022.eurprd09.prod.outlook.com (2603:10a6:10:c0::34)
 by DBAPR08MB5717.eurprd08.prod.outlook.com (2603:10a6:10:1ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Wed, 8 Sep
 2021 09:54:29 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::ee) by DBBPR09CA0022.outlook.office365.com
 (2603:10a6:10:c0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 09:54:29 +0000
Received: ("Tessian outbound b48d04bf8afd:v105");
 Wed, 08 Sep 2021 09:54:29 +0000
Received: from 0a083f3b0cee.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9541EF8D-BDB2-4C5C-B993-98BB700987A7.1; 
 Wed, 08 Sep 2021 09:54:08 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a083f3b0cee.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Sep 2021 09:54:08 +0000
Received: from DU2PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:10:3b::24)
 by VI1PR08MB2814.eurprd08.prod.outlook.com (2603:10a6:802:1f::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 8 Sep
 2021 09:54:06 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::b8) by DU2PR04CA0019.outlook.office365.com
 (2603:10a6:10:3b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:06 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 09:54:06 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Wed, 8 Sep
 2021 09:54:11 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 8
 Sep 2021 09:54:04 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:08 +0000
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
X-Inumbo-ID: c4067fc8-108a-11ec-b148-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXkdwEjVyQ82/D1j1eSxQZQfJtE5JUO8wUvXNctlD2M=;
 b=jVs9JpcbPL22+ynUZG+fFCTyljcDWMetWM2ISdh4k8/+bhThLAQkxVZPJDB1XHOFI5j6nFG03l/T4bOyv5xx3PpMKLKJ3cL9bBRVytLcw7mn3spvuJEpxlGN5Ef/a9pRWOy0bSBo6Y6/aJRse1gyQyFxyqom0QVM6AGewRGlSyg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8f4fa1b2d57f1ca3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zas51da3cn0wrB+jPtbEhng/oTJ5BGF73p0uZSLmSekv3DJv0LSZca7XA8LXyWL79GI7l6Sa9Ixg289KyhipO5k2UmK3k7IpVqjn3QoR5wAN6XuppM9ZkzDXJkTBjaNnCsSrmYjg6Dr8EITYHLurqupr844BBzImDOqy8PvrnsHlobqNL1RGXsjyfT2Up2QD0HZTJ8V5S36bRZHyNI2tKyYd2kjPAMSLpC9YuU1o5EMrL+SZxzUlM/PO8wohVrU7C3Lb+DHRvA8XkkZ3atZH24rqVlKCug8/AtC1AeQgbTi4ePJGs9CSxibezV00pFKLwW45AL2p4wzVC7dn7ZO4KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=MXkdwEjVyQ82/D1j1eSxQZQfJtE5JUO8wUvXNctlD2M=;
 b=VODPylCXW9DRdpWek+PUtrzAicCTB/ZR0jOGe3By8rltTkEGwh4uIergf3dURf+zThfWiNjEjit8RA1ZUG/GGvocTp1hGfNsYMvJyGDfPD/CCpI/RN5vqukhsHhdMj1VtEEaf0OEvM2Kh3rG7HBZyXWzG18DVnLaU3wSOu2pA+tHSMNMpp/WWTLbl+BJCYyulpSZCUo+ac0PFZO1tw89XSLnRI+CI4Op7rCVy4xjqh8rHRILH8vMx34YOpKB2GHyFxEbRv6tW/eM40N9BZGcUeU5C3ZcHzjizQ86mtDNSJ6HsNbV68uAFK3cHhisWKSzSj+ql051s70vUMKNXSSepw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXkdwEjVyQ82/D1j1eSxQZQfJtE5JUO8wUvXNctlD2M=;
 b=jVs9JpcbPL22+ynUZG+fFCTyljcDWMetWM2ISdh4k8/+bhThLAQkxVZPJDB1XHOFI5j6nFG03l/T4bOyv5xx3PpMKLKJ3cL9bBRVytLcw7mn3spvuJEpxlGN5Ef/a9pRWOy0bSBo6Y6/aJRse1gyQyFxyqom0QVM6AGewRGlSyg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>, <jbeulich@suse.com>
Subject: [PATCH v6 2/7] xen/arm: introduce domain on Static Allocation
Date: Wed, 8 Sep 2021 09:52:43 +0000
Message-ID: <20210908095248.545981-3-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908095248.545981-1-penny.zheng@arm.com>
References: <20210908095248.545981-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14296cbc-908d-4340-a8a5-08d972aea66a
X-MS-TrafficTypeDiagnostic: VI1PR08MB2814:|DBAPR08MB5717:
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB57173A9728FC9D35EE2B3E5DF7D49@DBAPR08MB5717.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LuIu0+pxr56YjVQdUDpyJ+gR2ldmA70kBn2fBEG8oVQJFLdkO/Ul42sid/6FWDHmUtq9gB8w/C2X5evd3wkF141bNGz56MwVH5FsWrH4RO6gD2yvVOxij7+St3XMlUsMY1PRv3VIKPFuqnIgb/ozHdVsH0Yp+/QXn+ikny5wRYCwJjBunpBGS+8wKdnh5gbAzXneE2HsA4VnfHdpMnirLZi+RjbYwCvAaovMCZ4vf9qD3Egl7qS8eMgp+g2AQDW8sKzEDBwVFxBZMijVJUMsLEjM1qiI6RctvfAELYmeN+zamsb2KYTjbnWiT1mgtqmB9fsgm/dFU5zkI0RAkqy1lBczrGvs7RXn8/JiG6CaBX7esACf+OlFeoCJgom04NCXc9ePcyP/pRsYrh3ms3BSeciAl8qox4k0n2WN9V5PTShOuecDIT+Kly0gL0lRUeXOW1DjxJC1PEQ0KDRYe34pVtdALrscJWQLFa7+xWcLvuUqgLxVSD10d3qivcj5NipjEZI/0aKmHh7EKCXk+vtfc3BzSJbXKgX7ZD4xhp8gAUfThRe5R+LZrKo7wXyqS4t2h1VfBZOgFBa8lZAkLZXV2v0YU6HHxEmqctjkRASVxkauRznlMPIEELJCqcrmrj13mR0fyiiC31XS1icdZYkIdMfMtLPbKiyNC4ejuG6Q3VoVPP08ORAHqy+f0p/E9BfUMaTqlBMDcBN+26YdDFeD3ikoR0+6JuPTLKTmkpYPLvo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(36840700001)(46966006)(1076003)(82740400003)(6666004)(83380400001)(2906002)(36756003)(110136005)(5660300002)(86362001)(54906003)(7696005)(82310400003)(44832011)(4326008)(478600001)(47076005)(186003)(36860700001)(81166007)(8936002)(70206006)(356005)(70586007)(336012)(26005)(8676002)(2616005)(316002)(426003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2814
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ca927daa-0fb8-49a1-4a09-08d972ae98bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PeQjW98bbKWCZUD1BXubt1SIO2xgvOs+wnBCilTNnJNJmSN5HtEqwHQWR0l0hxf1tmG1EJZ1xr71Z4F2vxxCbeN4QopyIovKq8b4PeVZiv29fdbKdWDaTS1+uFNzxA29Wvt8BUMgXpBSY5m00SrSacSSQzq2NaWTeO6bsqGAjMHIYmeDgTP86UA2ymW4pwYvdXXASDwHbg44kTia43lZPK1CpAScjmZqid4mVPqMrsOzU9SUEf7YVUwV9uteLu9w51bzNhji57Naoy2HDVt6zm1lVILYkbfU4cO+EZiMd/NE/IRoh1EbFtYRdhFwkSBL4KvQbPUBG1o8nqMw6EMgrda//8hz97RncAmfg8p3y6yXUyKxOyl88XBEYk35dBsgPv3LXlhmftkdZlOd/AVKKrKmvZbwe9MBHrMUN80HpGHGkoDkzYQ6W82TKx5KOjGuzvQ+kcZSmsOoVsUv35A0+I4PLvJMPkk4aMgA04uMfjCF5KjvdJQUC08a5YXB1KU49ueldg+IbXstcq1yl4Xq5tcU9pRj+9Pyxtj2khf5bkWgTlHVuHNTJ1bnzasz1N99JbqzQUA1ZGtRpC9pef3X1tmI/GDAPSUXLYSg/BejjClF2baK5CNR5aWrQzFxEU2BfbHB+rluZ+PFgaZR8k5d8GzrLXAi3/pBxM6Aaiyar8MgxgLwbJ5j4ZCNG90bAiq9y9sn1vfO2nTUgzkZaNW9MA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(46966006)(36840700001)(36860700001)(426003)(81166007)(107886003)(186003)(36756003)(478600001)(5660300002)(316002)(86362001)(336012)(82310400003)(8676002)(70206006)(54906003)(70586007)(26005)(1076003)(82740400003)(110136005)(2616005)(47076005)(2906002)(6666004)(44832011)(7696005)(8936002)(4326008)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 09:54:29.1439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14296cbc-908d-4340-a8a5-08d972aea66a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5717

Static Allocation refers to system or sub-system(domains) for which memory
areas are pre-defined by configuration using physical address ranges.

Those pre-defined memory, -- Static Memory, as parts of RAM reserved in the
beginning, shall never go to heap allocator or boot allocator for any use.

Memory can be statically allocated to a domain using the property "xen,static-
mem" defined in the domain configuration. The number of cells for the address
and the size must be defined using respectively the properties
"#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".

The property 'memory' is still needed and should match the amount of memory
given to the guest. Currently, it either comes from static memory or lets Xen
allocate from heap. *Mixing* is not supported.

The static memory will be mapped in the guest at the usual guest memory
addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
xen/include/public/arch-arm.h.

This patch introduces this new `xen,static-mem` feature, and also documents
and parses this new attribute at boot time.

This patch also introduces a new field "bool xen_domain" in "struct membank"
to tell whether the memory bank is reserved as the whole hardware resource,
or bind to a xen domain node, through "xen,static-mem"

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 docs/misc/arm/device-tree/booting.txt | 42 +++++++++++++++++++++++++++
 xen/arch/arm/bootfdt.c                | 30 +++++++++++++++++--
 xen/include/asm-arm/setup.h           |  1 +
 3 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 5243bc7fd3..44cd9e1a9a 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -268,3 +268,45 @@ The DTB fragment is loaded at 0xc000000 in the example above. It should
 follow the convention explained in docs/misc/arm/passthrough.txt. The
 DTB fragment will be added to the guest device tree, so that the guest
 kernel will be able to discover the device.
+
+
+Static Allocation
+=============
+
+Static Allocation refers to system or sub-system(domains) for which memory
+areas are pre-defined by configuration using physical address ranges.
+
+Memory can be statically allocated to a domain using the property "xen,static-
+mem" defined in the domain configuration. The number of cells for the address
+and the size must be defined using respectively the properties
+"#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".
+
+The property 'memory' is still needed and should match the amount of memory
+given to the guest. Currently, it either comes from static memory or lets Xen
+allocate from heap. *Mixing* is not supported.
+
+The static memory will be mapped in the guest at the usual guest memory
+addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
+xen/include/public/arch-arm.h.
+
+Below is an example on how to specify the static memory region in the
+device-tree:
+
+    / {
+        chosen {
+            domU1 {
+                compatible = "xen,domain";
+                #address-cells = <0x2>;
+                #size-cells = <0x2>;
+                cpus = <2>;
+                memory = <0x0 0x80000>;
+                #xen,static-mem-address-cells = <0x1>;
+                #xen,static-mem-size-cells = <0x1>;
+                xen,static-mem = <0x30000000 0x20000000>;
+                ...
+            };
+        };
+    };
+
+This will reserve a 512MB region starting at the host physical address
+0x30000000 to be exclusively used by DomU1.
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index b01badda3e..afaa0e249b 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -66,7 +66,7 @@ void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
 static int __init device_tree_get_meminfo(const void *fdt, int node,
                                           const char *prop_name,
                                           u32 address_cells, u32 size_cells,
-                                          void *data)
+                                          void *data, bool xen_domain)
 {
     const struct fdt_property *prop;
     unsigned int i, banks;
@@ -97,6 +97,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
             continue;
         mem->bank[mem->nr_banks].start = start;
         mem->bank[mem->nr_banks].size = size;
+        mem->bank[mem->nr_banks].xen_domain = xen_domain;
         mem->nr_banks++;
     }
 
@@ -185,7 +186,8 @@ static int __init process_memory_node(const void *fdt, int node,
                                       u32 address_cells, u32 size_cells,
                                       void *data)
 {
-    return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells, data);
+    return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
+                                   data, false);
 }
 
 static int __init process_reserved_memory_node(const void *fdt, int node,
@@ -339,6 +341,28 @@ static void __init process_chosen_node(const void *fdt, int node,
     add_boot_module(BOOTMOD_RAMDISK, start, end-start, false);
 }
 
+static int __init process_domain_node(const void *fdt, int node,
+                                      const char *name,
+                                      u32 address_cells, u32 size_cells)
+{
+    const struct fdt_property *prop;
+
+    printk("Checking for \"xen,static-mem\" in domain node\n");
+
+    prop = fdt_get_property(fdt, node, "xen,static-mem", NULL);
+    if ( !prop )
+        /* No "xen,static-mem" present. */
+        return 0;
+
+    address_cells = device_tree_get_u32(fdt, node,
+                                        "#xen,static-mem-address-cells", 0);
+    size_cells = device_tree_get_u32(fdt, node,
+                                     "#xen,static-mem-size-cells", 0);
+
+    return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
+                                   size_cells, &bootinfo.reserved_mem, true);
+}
+
 static int __init early_scan_node(const void *fdt,
                                   int node, const char *name, int depth,
                                   u32 address_cells, u32 size_cells,
@@ -357,6 +381,8 @@ static int __init early_scan_node(const void *fdt,
         process_multiboot_node(fdt, node, name, address_cells, size_cells);
     else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
         process_chosen_node(fdt, node, name, address_cells, size_cells);
+    else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
+        rc = process_domain_node(fdt, node, name, address_cells, size_cells);
 
     if ( rc < 0 )
         printk("fdt: node `%s': parsing failed\n", name);
diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
index c4b6af6029..95da0b7ab9 100644
--- a/xen/include/asm-arm/setup.h
+++ b/xen/include/asm-arm/setup.h
@@ -24,6 +24,7 @@ typedef enum {
 struct membank {
     paddr_t start;
     paddr_t size;
+    bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
 };
 
 struct meminfo {
-- 
2.25.1


