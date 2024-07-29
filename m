Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1054C93F7A9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 16:24:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766792.1177322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRIo-0002rx-MP; Mon, 29 Jul 2024 14:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766792.1177322; Mon, 29 Jul 2024 14:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRIo-0002qL-It; Mon, 29 Jul 2024 14:24:42 +0000
Received: by outflank-mailman (input) for mailman id 766792;
 Mon, 29 Jul 2024 14:24:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lVSF=O5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sYRIn-0002bd-JW
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 14:24:41 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2009::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a650f01-4db6-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 16:24:41 +0200 (CEST)
Received: from DS7PR03CA0109.namprd03.prod.outlook.com (2603:10b6:5:3b7::24)
 by MW6PR12MB8757.namprd12.prod.outlook.com (2603:10b6:303:239::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 14:24:36 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:5:3b7:cafe::bb) by DS7PR03CA0109.outlook.office365.com
 (2603:10b6:5:3b7::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Mon, 29 Jul 2024 14:24:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Mon, 29 Jul 2024 14:24:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 09:24:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 09:24:34 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 29 Jul 2024 09:24:34 -0500
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
X-Inumbo-ID: 4a650f01-4db6-11ef-bc01-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYfAt38wHfrYbCzKvgvscqLAJGiBQWVjXQHc6BMuJa0bsfhyjBol90pM8IsQCPhwBRvbYS5/d2OH9hTPxngQV2Cm41V64iGqTTUHzbmUKBW8GbTHSS6A1Zo907XKhbJY7qR248DeobidCQJYJaBfnp9SeSlSxuJUFmZFKn2evdYoljxxPG3PeoWlixWQBWKaYqiMSQms0CHNzSzeyXtNcR1vCdaefbsuhOXAMCUMRAgz95EbaNse/woRoXAjhZiyiEVfQ+fin0hXizsG2KQb8+OhUVtsVUM+6AETtoj5YSqClHcNI31NAwfY5MgxhFSUKGlkydEaCGY0U5nJAxYxDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qpd/3sEoVyoP99DEMD3O6+ZaTL/UJPyUlDVvloH+sA8=;
 b=zBJTnkO9yDntjlddEsPrXUd3sMIbVp3GJ4lE4sOKse2rBHqf2man61B4+h4dGciO+T4faNrAoU6QJqFyyW6xteXNRtk3L0tmrl9pGtl7gqY+BdXGY47aPlqHEZJWRBgULHU2qHISLfAZrzAW/yvgAP8i/JsEAe6RKaCCYt1nfN+lDKRlnNhrXM5sh5wqXV7bygTx9Um5ovwf92/u6MtKgG6uJuOpZ3OxVFs6XGQeNwU6qJJz/VF1f75vyj0qTB+s9MUVwrPP9qGbRR2jWuJvgLr/H2tttxX080SNFv6AOdWQZx9vwLds11VgsrvCAiPdxcwsfw1Av+Ns5x+DlsQBJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qpd/3sEoVyoP99DEMD3O6+ZaTL/UJPyUlDVvloH+sA8=;
 b=mLu6WFhG/p97bmM4yr4UIcpWApsJ/luNV4n652aQjL2nWdGYY/L3qlsKQNz1ljNaeT5pEVrIrLqoIjjMxTOaJ0w5MjPsMuOpQD7r70j+77vnIfW90pSTC3hQyTxgbQojLaKMRgabCn3J5XDC/zYcWTuBRZfyBQw8IFXpZE+8XLw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH 1/3] xen: add no_instrument_function attributes
Date: Mon, 29 Jul 2024 10:24:15 -0400
Message-ID: <20240729142421.137283-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729142421.137283-1-stewart.hildebrand@amd.com>
References: <20240729142421.137283-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|MW6PR12MB8757:EE_
X-MS-Office365-Filtering-Correlation-Id: 81cb6bc6-a952-4dc2-b27a-08dcafda2c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OT6s7LNjrd4WTXde1/FTwFntz/jxUPE9GORxkoMI40z+7u3SVpowdOk3gS1n?=
 =?us-ascii?Q?chUQFVC6fxmSW50yxHwOSkFBQAmuwjU1fzKahsJw2wjQsVD9nF1weUqa5edF?=
 =?us-ascii?Q?/iNvbzh66IvvgA+C9EkDLjaIFR1iEm3NsXEIAiS3Fvfp0H21iv182/pq6DCD?=
 =?us-ascii?Q?MkY8J++wtU0JuBCvVp5rK9vPP6nmLCeYh7F2Qp2rwv75uKp5X2miSn4fjlcc?=
 =?us-ascii?Q?Ee/5aDYdzlaJnNyzCkdIBPSLPGc12oTRosIoFu0KXeAhAB3Ld/1gRhsSh0e5?=
 =?us-ascii?Q?KKwkzrr8a0IxWd51vz7HNeGcojeFQtIP+smMxTxyzDZFTzIWMB+GkwVM7ZcC?=
 =?us-ascii?Q?DYgxgd9BVQpsK0BJUMujOFf+eTWVvzj6K0QHxzg7h4nFFDRfwDe07SvE4sus?=
 =?us-ascii?Q?4GPy0lLL5SclzO9FMZcVTK38KJvF0mH9YlkjunVSBXefSWnmWBtaJSc0vrfD?=
 =?us-ascii?Q?6b2vE608+QriAe8i0pa3ayf1+vAsBsZbJv61jrae9EWbI4Dw91G4y7wFpHwt?=
 =?us-ascii?Q?d+2Atk0c9FhnhGGTkG2gBbtEgEx6Vga8YYlMKEK9W5avyIZrZwCyR8dD8Mwn?=
 =?us-ascii?Q?V+hkxt2YZNBE5V1nrCtkfXIEegU9w/Sn81G0Bukp6AimFiMLDgwGXJb7pE+6?=
 =?us-ascii?Q?kmmmF1dC+5+sff6DXIosngoCtwBMV1pVGWHlHRYAlFUDqTNxanseCYnRu0vh?=
 =?us-ascii?Q?qIUKBBVLAIHkngRpn79pV0CYMLaPIH++wI/W8kWyWTedcb21W3Ae0vRs/X18?=
 =?us-ascii?Q?xtaUum5lBm0YSz5kwEm4gGGAoL0HKLNFocALCHF+EvZKOb90/YJAqYms6gQK?=
 =?us-ascii?Q?hoRmbDq2oIAede3fHAWOjzaqNifO2u1Zl1xNSkOpBbNUnIFCmPBrISOCqb2c?=
 =?us-ascii?Q?bLAEgg397ckiG84mtzp7Ua2ANiCcTTDyq0PmZTyEqT7Q4Cj1+09uFWMnBtEc?=
 =?us-ascii?Q?0AmZHnHLgF0VcBf1k7HZz8GA01j/W2/BCXeMwiclvkvNzAgTRSRi6ly2TLn+?=
 =?us-ascii?Q?bg2XgdWv0tTvWmoYn+j4yUaj6YZYq/4SwpCtEXMby7NXD5UVBgYlWSQWCIVY?=
 =?us-ascii?Q?f5AXwffdk1hTI9H2x7vlXFV9D0/m6DYy2KoHU0d95PfTi8/IHjfNgANdlTNj?=
 =?us-ascii?Q?pN+7wsDidDX1t45g6K+DM/5QTbppOQfeMgxbtiIK7FCPyxp/hEVaHgnlL9bR?=
 =?us-ascii?Q?KpOI8UX4NmMSQJXnvB49UsByNuC4fv8sJDiVF4eLuS42OYrAHEdlDzkkDrfO?=
 =?us-ascii?Q?6ds30J8R9mGnyUatI21q/Y1w4QsGgcnt2GLJCnMUltP4A5lG2eVQxZe0uFsj?=
 =?us-ascii?Q?NQYxKLAXIyGHfhpAtvp+XYucSUQcKer/g0G6vaTG7lHIsTjOAl/wPErk6uRG?=
 =?us-ascii?Q?CWqn4Xvq5GXtvmj9j/CJ2DzuGm9Kcq9JqwXvJHgFVZus3K5RedN5epWTxMXP?=
 =?us-ascii?Q?eDsdCIJ2I7AG81XoRH4CpvUEujQmgvhc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 14:24:35.9130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81cb6bc6-a952-4dc2-b27a-08dcafda2c42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8757

In preparation for using -finstrument-functions option, we need to tag a
few functions that don't work well with such instrumentation. If we
don't intervene, we would end up with linker errors such as undefined
reference to __bad_cmpxchg.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/arch/arm/include/asm/arm64/cmpxchg.h | 4 ++++
 xen/arch/arm/include/asm/arm64/sve.h     | 1 +
 xen/arch/arm/include/asm/atomic.h        | 2 ++
 xen/arch/arm/include/asm/guest_atomics.h | 1 +
 xen/include/xsm/dummy.h                  | 1 +
 5 files changed, 9 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm64/cmpxchg.h b/xen/arch/arm/include/asm/arm64/cmpxchg.h
index f160e8e7bcf9..acabd42ca986 100644
--- a/xen/arch/arm/include/asm/arm64/cmpxchg.h
+++ b/xen/arch/arm/include/asm/arm64/cmpxchg.h
@@ -5,6 +5,7 @@
 
 extern void __bad_xchg(volatile void *ptr, int size);
 
+__attribute__((no_instrument_function))
 static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size)
 {
 	unsigned long ret, tmp;
@@ -102,6 +103,7 @@ __CMPXCHG_CASE(w, h, 2)
 __CMPXCHG_CASE(w,  , 4)
 __CMPXCHG_CASE( ,  , 8)
 
+__attribute__((no_instrument_function))
 static always_inline bool __int_cmpxchg(volatile void *ptr, unsigned long *old,
 					unsigned long new, int size,
 					bool timeout, unsigned int max_try)
@@ -122,6 +124,7 @@ static always_inline bool __int_cmpxchg(volatile void *ptr, unsigned long *old,
 	ASSERT_UNREACHABLE();
 }
 
+__attribute__((no_instrument_function))
 static always_inline unsigned long __cmpxchg(volatile void *ptr,
 					     unsigned long old,
 					     unsigned long new,
@@ -145,6 +148,7 @@ static always_inline unsigned long __cmpxchg(volatile void *ptr,
  * The helper will return true when the update has succeeded (i.e no
  * timeout) and false if the update has failed.
  */
+__attribute__((no_instrument_function))
 static always_inline bool __cmpxchg_timeout(volatile void *ptr,
 					    unsigned long *old,
 					    unsigned long new,
diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/asm/arm64/sve.h
index a71d6a295dcc..3090e1cb784b 100644
--- a/xen/arch/arm/include/asm/arm64/sve.h
+++ b/xen/arch/arm/include/asm/arm64/sve.h
@@ -48,6 +48,7 @@ unsigned int get_sys_vl_len(void);
 
 #define opt_dom0_sve     0
 
+__attribute__((no_instrument_function))
 static inline bool is_sve_domain(const struct domain *d)
 {
     return false;
diff --git a/xen/arch/arm/include/asm/atomic.h b/xen/arch/arm/include/asm/atomic.h
index 517216d2a846..31c3b3c3745b 100644
--- a/xen/arch/arm/include/asm/atomic.h
+++ b/xen/arch/arm/include/asm/atomic.h
@@ -74,6 +74,7 @@ build_add_sized(add_u32_sized, "", WORD, uint32_t)
 void __bad_atomic_read(const volatile void *p, void *res);
 void __bad_atomic_size(void);
 
+__attribute__((no_instrument_function))
 static always_inline void read_atomic_size(const volatile void *p,
                                            void *res,
                                            unsigned int size)
@@ -99,6 +100,7 @@ static always_inline void read_atomic_size(const volatile void *p,
     }
 }
 
+__attribute__((no_instrument_function))
 static always_inline void write_atomic_size(volatile void *p,
                                             void *val,
                                             unsigned int size)
diff --git a/xen/arch/arm/include/asm/guest_atomics.h b/xen/arch/arm/include/asm/guest_atomics.h
index 8893eb9a55d7..f5f4ba0df0b1 100644
--- a/xen/arch/arm/include/asm/guest_atomics.h
+++ b/xen/arch/arm/include/asm/guest_atomics.h
@@ -86,6 +86,7 @@ static inline void guest_clear_mask16(struct domain *d, uint16_t mask,
     domain_unpause(d);
 }
 
+__attribute__((no_instrument_function))
 static always_inline unsigned long __guest_cmpxchg(struct domain *d,
                                                    volatile void *ptr,
                                                    unsigned long old,
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 00d2cbebf25a..7b42f8faa61c 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -75,6 +75,7 @@ void __xsm_action_mismatch_detected(void);
 
 #endif /* CONFIG_XSM */
 
+__attribute__((no_instrument_function))
 static always_inline int xsm_default_action(
     xsm_default_t action, struct domain *src, struct domain *target)
 {
-- 
2.45.2


