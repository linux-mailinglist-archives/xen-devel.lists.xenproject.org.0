Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB729F626E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 11:12:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860095.1272173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNr2i-0006UW-Ni; Wed, 18 Dec 2024 10:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860095.1272173; Wed, 18 Dec 2024 10:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNr2i-0006SI-KU; Wed, 18 Dec 2024 10:12:36 +0000
Received: by outflank-mailman (input) for mailman id 860095;
 Wed, 18 Dec 2024 10:12:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M/38=TL=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1tNr2h-0006CD-5Z
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 10:12:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20614.outbound.protection.outlook.com
 [2a01:111:f403:2612::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98d37f96-bd28-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 11:12:33 +0100 (CET)
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com (2603:10a6:10:312::7)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 10:12:29 +0000
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f]) by DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 10:12:29 +0000
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
X-Inumbo-ID: 98d37f96-bd28-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPBKw+QBXayKwQJA1jzSdjayFgE0irfM2tBWNGDlUufLV9BsYEW2PJb7JhgGawgRFUuA6h1pjDshsuUyyNyjB5/wIRmk/6Okfj4IvExJ+uWjO3BqKDwKaWFURaLuy79PXwjWieq/FBZn/U9LSrDwg+IbAQkHqYvCvx5SjUX7zO9Wu2vC/xIaqHVoZZnXIhPiG8Z0+Bu6FaHCVdhbK05zVq0jeEB6G4XgdJPJLR05uscxnx1oguzCywCp57ccYMVVlv0Lw9yPv4fZx3b3mYrp9FPH24zSWkMLoIA8goj+ZJY8UPeiMm/n3Fo+jTNgoGSLtxhtLrvJaghDpYEFumHb3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXpg2Ow88Eg+MIZFn0qzYuI7h2PxCnhsFX1nq8UccsY=;
 b=fbHAs1OmzPq+ZszFQiADe83xfl7cVaXDWFAWQm+vdafrG7QiOigVL+NPr3cj8BfiEvQ3XxdKDYjtQCuxmtd+gVqY5Cu0hc5njIBgv5EDt3fE8OoCiPZX5rWpfx1JnzbtC1raoKBg/lZFqOEzwIUSO9jyK5jTw6lEd4x/b8W/G6kpfEVJWsPqeJr+joY8oPqhQHMNkPUrV0wOtbiTc9Ci7JzSyqp1grPKhxqvd+xwKqeolxjDTVEhhX5dRMWIvCbwk/DpFdL8cppEVCevEJDDqtIIxGm0F4/0ajh+2Yy6XfqLRICUUar12zxCEI5bx2Gmd88pRGcV88c0h6T0aAFCTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXpg2Ow88Eg+MIZFn0qzYuI7h2PxCnhsFX1nq8UccsY=;
 b=KN/MJuhXzY0sBw8Ia5pbG73W337qVRd0PnyUWvzth9J6XXCVeewVFdaNmf+70EFKkKF9qdEGkh57TJPGgad+VfNRaJNjc9urE228bGnCTyuXxUFVRwb/GlEExe3KJwv77pvq3lijsVQ2MoOaDYbBWnlYOP5+VGPS6VV+tYT5RCG7tgAlqtUeKHxvMsHHTw3qaTqDzrs7yZPDxbSgmV+S8ditBjpUSMuD2dUs9vWugyL80uSImGVT9lO5WA1t8keejfO26TxT1q4Kja/16sq/15A/PCNP10T1smCZsBAyKpS04QfejeM6C0R0xlrBPFb/D0sw1PUzhWXfZdSUQJI6aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: S32@nxp.com,
	andrei.cherechesu@oss.nxp.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 2/6] xen/arm: vsmc: Enable handling SiP-owned SCMI SMC calls
Date: Wed, 18 Dec 2024 12:11:37 +0200
Message-ID: <20241218101142.1552618-3-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0228.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::35) To DU0PR04MB9561.eurprd04.prod.outlook.com
 (2603:10a6:10:312::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9561:EE_|VI1PR04MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d762712-821b-475b-d510-08dd1f4c7ab4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RAerRyetckqOUvIN7YJi4W5NlqPaA7h3kkg1fm1aOb7l0njs1OLT/A1GVlDk?=
 =?us-ascii?Q?bZqV4icz7R3gGdeRYUPb+vpWMGJk2ti/tvfd4ww/vSxlenyEYCPjcaVaHmwj?=
 =?us-ascii?Q?oaiLfiKVQS6/ew+m3FW1yrOknvw20MzDrZa6vvTKef/K3TJsc520DqEy0C0a?=
 =?us-ascii?Q?QyKYAHjbeUQ9uIQ/Xo9+iSDdi8D31+UJ4bZa++yJmwpzo/J8PkiWuKhEUvtO?=
 =?us-ascii?Q?xXNSdMLPrG5aHKljxB37YwKP687JVwmjhcSUqJXry9l7Zuhvv38++weW50Bm?=
 =?us-ascii?Q?s0hi1TXvsj4lt94jL2tzlP1gCXxqpSv9IKBSYRY2Jjx2+aa6I85Bva/fRQ5q?=
 =?us-ascii?Q?iaSXgOG6r46Tv+7Am2a4U7rr3Xx9J/fVMnMSW44/2nW6Wv8MWWyYLA/m+1js?=
 =?us-ascii?Q?U0jJOsmmPq9kzfaup4YQaduozaortBUdGoXctok7AcQTz+liGXbCpNFUtMZP?=
 =?us-ascii?Q?p1bDiYwqfbOVbmt9lDu6ioCMsawO1aZCjwqU11LAn8j+ROK0x/8ALqW0Bjw2?=
 =?us-ascii?Q?nWEemyGGCvAnoF4G0hdMHOyoeUC+ACT0cwx6BxTJImKRGn9RWqyARDfo3nlg?=
 =?us-ascii?Q?gO8TqH4v/aGMavfJeFVii9CmTX9p6aKS8GdTxpS1H2riITdGbZaiC5KtoFAX?=
 =?us-ascii?Q?5TBs0nd/stVGfrDy8yV17FObG/H8W3WeUAqqFmsuoL5S4cpZRIf8gst31/ud?=
 =?us-ascii?Q?R81BE1p5vx1dAMVbte/ViJOEbM3apsSctv/SX+dF6QqhdbRkNmkW6715SqR0?=
 =?us-ascii?Q?4TPZTIvIZRGkkW5Jnf48gk4U832qx40+q4B7xgsykpd2x43ZUOvVQDF29uCj?=
 =?us-ascii?Q?/aBq7EXXPZn+U/WUpK6QJD/1DEbVoBHAT8PyuBwFr189QltfBM183yux+heS?=
 =?us-ascii?Q?1YfRXkbC15UYs+SK4ioxnXtsKa0ZXVrA43XmbhKX3nh5WDyx4jpmi3kRE8YK?=
 =?us-ascii?Q?b9NxlmT54eM80uL/eLwRMyRoVjg/PI4l0GI4v0kXAqUPUI9dztle41FtOlDt?=
 =?us-ascii?Q?IB+vR1/c/wMqCZPBj4bBJE5jQJpcSSIRTONqqBtiONr/K3xEnKU/1nJ/rDkK?=
 =?us-ascii?Q?5kJgOvbTZ+YzzmH650vEBgdYGBHAb2ZrY6NksjfyY2j0OkFbDU4dJX/g5OJR?=
 =?us-ascii?Q?Tr5RCSOMlVaRBJsw7O90trI8wx+1K0UIM9VoIDPU41pIO/gBIgfeYr8BUuPT?=
 =?us-ascii?Q?2ketgd3RmILanYroB4ogNOcWg+QlRju8LJn8uNAKDf1Z8hHL3PhVz2R3iYLh?=
 =?us-ascii?Q?k3wovi1YRLH0wTeC0yMbuWFn2Vd33cYFebK764wJbvvQrAioj3mgad81CUU4?=
 =?us-ascii?Q?Obm0Drrr4SI5oIV+tqQc2/cTNiaJgRJzRTKQ+jXW76m0WYFM4iHhZB8GEpyi?=
 =?us-ascii?Q?B2XBFTbWP//v6AaO1o2et8pWVT1RQoxHNmAO6v6zz5TxBr4FK5NIV4p2Srvi?=
 =?us-ascii?Q?k02gxEYYxgY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9561.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W0w03VaXg7RX7xINlexV8PcQ3wVFWDT22+WI9QQzFKqLvGHuLzcuxo2H6Q1q?=
 =?us-ascii?Q?ks8VMXaYvBdrqo9GJPc2GtUJ1Hz+LDq7TOsXmbugN0311iVujsjET+/l+Q76?=
 =?us-ascii?Q?6pOeoziT5PGlsBisaFcXnLRcxyblJQlCUM5fKn1BGWXeonawABA3LXapDQxz?=
 =?us-ascii?Q?AczuNqVirEj7QeLeZW4CTeBP+Sh3iynxBiaxp7D59EB6gZ1yugU8zuBqALq+?=
 =?us-ascii?Q?r2b8Msw7gbyvMX6U6C9RqdC5x4glviREQkcwc7rZ4BeduE1yQ0ZMhntWK4X2?=
 =?us-ascii?Q?2WiNy7FNfsOxPJuqkD9xMXnx4Lbaj7tX4XBZzyVFnI8TKPLXlpwSOHigai7w?=
 =?us-ascii?Q?n58HJQuzCF5PPQZVD9R6KZK0RPWncigEixsr+gJ0pUSh+QfNhrCaEpHaRTKT?=
 =?us-ascii?Q?24MUuLpxhxKgDnVh12AqFXXuM10C5X6RgS9nr7guIv2eNERKFHXsNJKjY719?=
 =?us-ascii?Q?Onxre3fsnMOdAD8O2NjAxG6cV98cLnuxG3E6b8HwXVYjbBG8eC+KisBt8COc?=
 =?us-ascii?Q?ehlL6HwV1VKj6+WUZbNi6ls/I6RLuyY6rtYALDgnWBH5cVE5KYrf+j5GzLuu?=
 =?us-ascii?Q?x40Nds5QYq7vRLsW6afwM1WRmjfpQ2E5BK/B9g0zzN0lJmUGz6QmabCiVQO+?=
 =?us-ascii?Q?L4b5xXDreclopoGSKeeBizvUcWYdKcTur9NP7BWuHB2gVoxTdwltswawpMa+?=
 =?us-ascii?Q?ux/qy6uhw8lpBdI2E0lPOdO5wRHp76vNsGcOapLf5uPuQUV0wUpdyrBZlzue?=
 =?us-ascii?Q?IzvDNtZ51VxwyRGO/Kx5K7Nkx3woRyvr07WsMpaWGw2FxoNSjagjPzng30Gk?=
 =?us-ascii?Q?mxjkeseISwiNyCg7IXqQPi5iHdeKEdjZJN+jxt8DhdqdzAwG36u+Lk7JeUgA?=
 =?us-ascii?Q?6YzvxSRA+1MewPgobNkIwZWwMBjrvaQYfA4PygXA10tTR4TJoCdhRHzI3cLT?=
 =?us-ascii?Q?cqyyJe0irE2DhI5n7tihjHQ9tSYgcnxvH5zsymKUZ+D2yM6ncdpbNVKpccwM?=
 =?us-ascii?Q?9HZ8Rssxp+85oZ41E7IEabriMz5ueuIVLW1B9RSMjyniZD0OzJi7WvkFAOwt?=
 =?us-ascii?Q?TA+tlp0/Uk839m8L9jgWT4wqvFsRY6AO5FgtLqtjJe2YoFU/kcL+ifuEytUu?=
 =?us-ascii?Q?rXh/X1tJmys3MHIkyBl2QKm80wyobQyRUHum/w+KZVSfPEK2btbgkQycH5pa?=
 =?us-ascii?Q?ZvoKVZPzLZlHLpGn2cMGb044ggoo8aqJkF662vJrnNggEANseO2g8a5KiXND?=
 =?us-ascii?Q?WAFOaSQ+BG35SUqdExKSjAQ/nOJ6C8EnVLcDqmu3K+gQmbgZ29qyuJayvFOr?=
 =?us-ascii?Q?xyXPMfUmMmRFCcPKw9ddK4TKl90iR8LLpd1eWoZNr0yVlKGK/oZEkaNLMhSX?=
 =?us-ascii?Q?VMxXXthSMJprbbOkogchPRymLAI0gSodh+NhkWZZDSCRd/ARx7wQnuvqbEDt?=
 =?us-ascii?Q?IO8ebyRQkYsX5Byz5cu2oDjIgsI6m9ejTKTE/tfzmGR9PMEws2QesMXKk+nn?=
 =?us-ascii?Q?3bpzcQwKD5IA4vAU6FJLOXV/KESa6GssfoTWeUOrLR+RvRld1w8a4PiJmxqt?=
 =?us-ascii?Q?tJoixcMzRLDxLK0ueqOGHO1hsYdHKQerOIMXc7dL2PK0tlPAFS4y5VYGAV5q?=
 =?us-ascii?Q?oQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d762712-821b-475b-d510-08dd1f4c7ab4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9561.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 10:12:29.4744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxAVD+5tjdDDXYp4sVR0U+eRIIv5q3asvbH3iUfKKEBBGHx0/fYb1x0vm+AQdsrfFu5yiwriv0b4JkZRiQqJkMpx9gaczZGfwt6SG6p7vfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Change the handling of SiP SMC calls to be more generic,
instead of directly relying on the `platform_smc()` callback
implementation.

Try to handle the SiP SMC first through the `platform_smc()`
callback (if implemented). If not handled, check if the
SCMI layer is available and try to handle it as SCMI
message.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/vsmc.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index f679cced7f..c4d225c45c 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -20,6 +20,7 @@
 #include <asm/traps.h>
 #include <asm/vpsci.h>
 #include <asm/platform.h>
+#include <asm/firmware/scmi-smc.h>
 
 /* Number of functions currently supported by Hypervisor Service. */
 #define XEN_SMCCC_FUNCTION_COUNT 3
@@ -224,6 +225,19 @@ static bool handle_sssc(struct cpu_user_regs *regs)
     }
 }
 
+/* Secure Calls defined by the Silicon Provider (SiP) */
+static bool handle_sip(struct cpu_user_regs *regs)
+{
+    /* Firstly, let each platform define custom handling for these SMCs */
+    if ( platform_smc(regs) )
+        return true;
+
+    if ( scmi_is_enabled() )
+        return scmi_handle_smc(regs);
+
+    return false;
+}
+
 /*
  * vsmccc_handle_call() - handle SMC/HVC call according to ARM SMCCC.
  * returns true if that was valid SMCCC call (even if function number
@@ -288,7 +302,7 @@ static bool vsmccc_handle_call(struct cpu_user_regs *regs)
             handled = handle_sssc(regs);
             break;
         case ARM_SMCCC_OWNER_SIP:
-            handled = platform_smc(regs);
+            handled = handle_sip(regs);
             break;
         case ARM_SMCCC_OWNER_TRUSTED_APP ... ARM_SMCCC_OWNER_TRUSTED_APP_END:
         case ARM_SMCCC_OWNER_TRUSTED_OS ... ARM_SMCCC_OWNER_TRUSTED_OS_END:
-- 
2.45.2


