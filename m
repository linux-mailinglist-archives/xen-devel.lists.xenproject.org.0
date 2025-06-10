Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF81AD3B11
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 16:23:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011010.1389292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzsj-0004ZS-Rp; Tue, 10 Jun 2025 14:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011010.1389292; Tue, 10 Jun 2025 14:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzsj-0004XC-Or; Tue, 10 Jun 2025 14:23:17 +0000
Received: by outflank-mailman (input) for mailman id 1011010;
 Tue, 10 Jun 2025 14:23:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ghGr=YZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uOzsi-0004X6-QZ
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 14:23:16 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20631.outbound.protection.outlook.com
 [2a01:111:f403:2416::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71a8f31d-4606-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 16:23:14 +0200 (CEST)
Received: from SJ0PR03CA0179.namprd03.prod.outlook.com (2603:10b6:a03:338::34)
 by DS0PR12MB7607.namprd12.prod.outlook.com (2603:10b6:8:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Tue, 10 Jun
 2025 14:23:10 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::4f) by SJ0PR03CA0179.outlook.office365.com
 (2603:10b6:a03:338::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 10 Jun 2025 14:23:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 14:23:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 09:23:08 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Jun 2025 09:23:07 -0500
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
X-Inumbo-ID: 71a8f31d-4606-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2FLm4Wj2uC4k3gelN2BYFixuvS7L/3o2+w8NeQJEIy6/WFyasXNdE/PvHzv9le5r0n+DMsuxw5OBXmYn4iIfA+rGbvxrMZAiZuZv9NssReidwreMw8nf4qqO7OgEQc+anMhNAudvkS40DSZcy4oJmHuZULxMv6zzz7wKkdrfHnCDHmFz48XcAeaPCvMGcShov07kYM8phHfdnOsSl0mbOlAAJIGjm1XrihGUuVNXrth5I0SW0TxzVR5UgSYRZaCi3R9u4KvlHIi8TD/KoLaAHOoMxWSC7Ckqg586nGk+6fR6aM1cEJgGD/A/WQf4IxmsZA+cJmbsNwXqE1vA97XTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5U8wbQNi3yTZwoPAKZ6ACj9OUN82gA50PwezWKLsZ4=;
 b=jKS8a3M5se0al4KW7WR/9YksMtN/9hjv/NbKxZ/SYbiNWLVx5Xn3fR+qAZGwFF2jNmsaKFRlnA3esfSkrYOZAGSG5w8Cj0Va+UCABCEJa0L4ItT/L08GQu8S8RuwdcDikABMLiNbroriikdF6UXZgYt8/eISLtIdZKJewj3Yrw+ZQ4TPiL6XfTVHL+1+fwW6CvOpR5g5ybnsiB5ZOMhlVxe3zp74+5LdXwc+YotX7WgbtsvocSWhZRS2BJqBifYhtyh9F8Yl8kJj8JOZom1GrvtDydWyYHve7vRBIA10MyO4mrZsQD8MGcrWnW4Orvk0lx96MTFWRAF2tCzYdZJ2mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5U8wbQNi3yTZwoPAKZ6ACj9OUN82gA50PwezWKLsZ4=;
 b=qdNuQr2GSruOFmOwIA+DMqVTkwFaHsBKImQ7tv11N13sb2ZrnUg+UWwVRllpebvATcYdJNlgMhJP+0a+adAIXb1XkQajEIrNN5odhPKis+rGZFXu1K+P6KPSXAxSWoed3F+6xdxD9c4Va5bNInvowtALxrsSDBErgj3p9EuvT3g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2] xen/arm: fix build with HAS_PCI
Date: Tue, 10 Jun 2025 10:22:57 -0400
Message-ID: <20250610142300.197599-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|DS0PR12MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: b11feb22-2881-4f14-a3f3-08dda82a52eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXhLMm93QmZPTVdTSDNwc0trYk9HYmhoTVR6eFRmbzVoU1JkTTFJNlVJQ3R1?=
 =?utf-8?B?UFlFajdOUEx0SmhqSFNlS0p6dkx4aUNYcGsrSkJZVjBDM3ZWSm1oMlJFa0F1?=
 =?utf-8?B?dWJxUnhoR1ZmaFFFTlR4YzNCUndqUlgxdStUVmFrb1VmTWdwRys1dnZuV2h1?=
 =?utf-8?B?eEgxdUYzMDJJL1VVNXo3WGx2SFpxNXQ5MlBmQWNzODB5aUlKQXlVZklnazh3?=
 =?utf-8?B?WmIrYlZZUHhiSVI4azRuejVBQ24vMEI2dDNMbHdYWS9TTWdyRjRRNVAyMnp6?=
 =?utf-8?B?UG8xb3VURjFJM05iU2xvUlUxTGZOUzZEbGRsOHZZT2ZaN1pKelFuREJ3em9j?=
 =?utf-8?B?d2U3UmhPYldCcW5ua2FNZklGV0lOUzM3MkNweDlNT2owNWtnaEtBRzRwcVgv?=
 =?utf-8?B?cWZhdW5zS1dTZ0ZOc1REcEp4Vk5ia200VEl5YVBiK3FMSUxBTGt1NE9nc1pU?=
 =?utf-8?B?NDhqbFp2RTBzN0loY3RqVHRNRElQbEJMc0htWXpJenNna3p5Q0RTL2REZDN0?=
 =?utf-8?B?K3VuSVY3K3dKbWI1Wm9SYWJpVjQ4bXJlbklwdm5ldmd3VzRhNEhoa0Y1cW1G?=
 =?utf-8?B?YUVNbTJYMU1YL3hySmhUN3ArVXFJYjZ6WExQOE1HLzEya0tUd1hCRHJLQjBn?=
 =?utf-8?B?bkI2UEdTOWVNSFJKZWIzeFJCV3VCTDB1NW9XMEFHOUwzTmtSNCs1eVB5QWFP?=
 =?utf-8?B?SjdQVUN4Mi8zOTkzV3VpTU5pbWwxREtMeFdDV3pHb0xKai8xcm5oSFRlTDFh?=
 =?utf-8?B?ZGs1cm8yaVZoZlBrMEwrUnpieERsQ1MvTmx3bm1uUEo5SU5Ldm8xQjA1N1NO?=
 =?utf-8?B?UkFhUGhQZkN4RkVlK05VTFFEUUx6cGtubmp4UDhwNVBSQXFWUXpyRTdpbHh4?=
 =?utf-8?B?SlhqYlprc0NEQ2hrUCt2TnV3VXJSTTUxdG5McS9uMmNGOVZNZFJCNWpzRTFo?=
 =?utf-8?B?OXdWOXNlbTJTaTVtQUcyd29kT2pBdnRNWWQ2REZhTHRYeVNRWFlhbGppVElU?=
 =?utf-8?B?Y0t5VHR3Z1BVaXlFNWEvVTdRbm9hTUxZTUpMREM2WGViOEVvaUZIUDdNSzJ0?=
 =?utf-8?B?UG1wMHlZUWJTVGxmRDNSSmN2dGlvWkozYmVPeVdCbEYyTUtNWHNqWmw0N2tW?=
 =?utf-8?B?aVlEa3dORy8wWmFRekNGUENoN0VkSHZtWkJ0TlJGMDg1SW1CVmJqaUtJRThp?=
 =?utf-8?B?ZmFOeWZIVHV6WVRaanhaT0JsOGNKT3ZBT1JyVmMraTFPVkUvZDQ1NldpRUNw?=
 =?utf-8?B?V1RXM25DeHN1MjJqUkFBYUZRUzdMVXFiTkg1V3dGSitWQStNV0c2RzdqRTVJ?=
 =?utf-8?B?MkE0eG41L1NyZHQzb1haUWx0VjNLQWU4TVpSVk1iNXVFa2N4R2hqNXQ3bVhF?=
 =?utf-8?B?RnpoZUlINnR3MDZ0WXNtUHVHdkxaaU5SVWdTRmNxMUxteGdoMDNSajREN0dl?=
 =?utf-8?B?L1JwTEtvLzhIcjhiNDhQUm5jUm5jc0YwSmQzakQwT3RFajdoNFdlbDhLei8w?=
 =?utf-8?B?emd2VzZaTEY1R1NMWCtKME44bVZVZm1OQkdNNzl0SVE4TDdNdGlsTDBxZFBV?=
 =?utf-8?B?YjArMU9SLzYreVRkKzd5R1ZyVXhFamtrTDVyK1JGeFVCTmh6SU84VGhrU3Aw?=
 =?utf-8?B?aXlGekZMVkhWS2UyeWNqM3FqZWpDdHFySWxCRGNaTS8rUG02d2RlenRMcVJK?=
 =?utf-8?B?VFVsOEZCTU56bU1VYXNtcmZndytCUXNzZWVwd01tWk9IbHBkU0QyNG9nWE9P?=
 =?utf-8?B?dExIZURYUzJaZDBUbVB0S00xQjhYODFXdjZVeTlManV1NXlSMVFzVFREMGNq?=
 =?utf-8?B?MnozT0hRRklGU1A0V2p5Z0ZwMXlxaTFYbWJYWTVrcTEyM3hzMEJ2YktzQ1lZ?=
 =?utf-8?B?MnRaVHBUZllSWnprd3JWZWJDRytrY1RvOW92eFNtano3TWZzZ0hRbUdCQkhV?=
 =?utf-8?B?MllSaUxOS041N2RGS3RDTFl0UUZBcGl6YnJCU21Rbzd0TU5JY2VyTldlS01B?=
 =?utf-8?B?WjBUN2p4TU1zc1FxaGZUTDNsUUlxUEtlY04wMDJjS1RWUVJ5cjAvcDhtV0Ja?=
 =?utf-8?Q?xUpOQ/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 14:23:08.8476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b11feb22-2881-4f14-a3f3-08dda82a52eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7607

In file included from ./include/xen/pci.h:72,
                 from drivers/pci/pci.c:8:
./arch/arm/include/asm/pci.h:131:50: error: ‘struct rangeset’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
  131 | static inline int pci_sanitize_bar_memory(struct rangeset *r)
      |                                                  ^~~~~~~~
cc1: all warnings being treated as errors

Fixes: 4acab25a9300 ("x86/vpci: fix handling of BAR overlaps with non-hole regions")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v1->v2:
* forward declare instead of #include
---
 xen/arch/arm/include/asm/pci.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
index 1605ec660d0b..64f0e6ce7e3b 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -23,6 +23,8 @@
 
 extern bool pci_passthrough_enabled;
 
+struct rangeset;
+
 /* Arch pci dev struct */
 struct arch_pci_dev {
     struct device dev;

base-commit: 86a12671c5d33063b6f958bdcca7c9d14cd5aac8
-- 
2.49.0


