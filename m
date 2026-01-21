Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAl2C131cGmgbAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 16:48:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C29459728
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 16:48:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209950.1521841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viaRc-0004J0-9m; Wed, 21 Jan 2026 15:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209950.1521841; Wed, 21 Jan 2026 15:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viaRc-0004H4-5r; Wed, 21 Jan 2026 15:48:32 +0000
Received: by outflank-mailman (input) for mailman id 1209950;
 Wed, 21 Jan 2026 15:48:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6Gw=72=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viaRa-0003mT-WB
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 15:48:30 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f3bed62-f6e0-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 16:48:26 +0100 (CET)
Received: from BN9PR03CA0501.namprd03.prod.outlook.com (2603:10b6:408:130::26)
 by IA0PPF1D04084C7.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bca) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 15:48:17 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:130:cafe::1) by BN9PR03CA0501.outlook.office365.com
 (2603:10b6:408:130::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 15:48:05 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 15:48:17 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 21 Jan
 2026 09:48:15 -0600
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
X-Inumbo-ID: 9f3bed62-f6e0-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAJUJmbpeXrzePvjVr6HMMol6P3HK/tLtawa3WKzr+ADubChz6iE191YKFvlIYAIPBGFmBLLxTaJWdIGkQU+52fLFSMGsQmUqYtMRJ4KHoiW/McGvHy8CLpGWcxtoU5alpEc2thYhVEbIhkRAq+XszcVhDmhyCDbqRHke6ED3drI4GoBbb0dWTHaNIJQClyKHr5lflhHyvma+Y0ZS/621iZTqLBsmGruAOx48GNyDecA/zzszLP+HRomBiadLx4UFwOlJjF1UHfyoen6VA6F/R9m6gQ9CzsFKTMai/NKY8YI/7WL81tM/hbkH3zMr5i1iHxS34FoX0VJuTuIJAfkPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0nJyS0lJh1a1xRmIBV+i5/oNc1aFwWikBJTjecHGaQ=;
 b=ef+eY43iqra0xWedgFxhngqiJTlc3StRNe48fv0f2qUJVX0kL1x9n9CnK+kj49C1rdCr7lumjowIY8KWmOn10CGr5TclmbA1C8N+RU3DRhUEaMAq0MaVvpAK/ZG/OI8e3OFMbwdz0/FYpg6MMtjp5brtm0Z0D5fJiWNTO59VLlX26NbtsfJhb2byQnZNAj+1oCgNvhUNCRnSMjUDga+ms4Ila4x9uQGnNFLNbFtZhpmQOcOlRM1a64HwNViP+J9UC2pHjlyPvRtwi4Yj5gHtKEFcVQOe0ibuLarU5iTl6WClfswi/qh5Bt3PjpD4Hvmnt0LmdrWWH4pk0TJbl/ilXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0nJyS0lJh1a1xRmIBV+i5/oNc1aFwWikBJTjecHGaQ=;
 b=dcdLReqsF9dKIPa7E0j7umppyTPnu5RQ+HHkNjEgHajqnIYoDbhuS6UWeh/Y8jI3abq7W4Bxl/SHvTYq/k/XGy5i6dzMKWuJGnGU8S9vTtbxs6gWlWS+e1saENoGDdGasMgtnt7RqhrT8ShB84RzOXruvoa2aRZszOHCcuM4wEU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Nicola
 Vetrini" <nicola.vetrini@bugseng.com>
Subject: [PATCH v5 2/2] earlycpio: lib-ify earlycpio.c
Date: Wed, 21 Jan 2026 16:47:55 +0100
Message-ID: <20260121154757.44350-3-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121154757.44350-1-alejandro.garciavallejo@amd.com>
References: <20260121154757.44350-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|IA0PPF1D04084C7:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa495f3-d856-43b7-31b1-08de59047efb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vLJaaYRPMldccqaHviov5PrVmJtDonlD85C6liRmGauMDWSev2ntau+U1RTy?=
 =?us-ascii?Q?a/IKPN65OKEfn9UNS9ZhJGKUgCk3hS9XH0uf9NXOu7+RsozzL5KSGnjeM4Ai?=
 =?us-ascii?Q?K6ZXzfsvn1/aqy0krJSLwU7jMHetSnUNrGTR14gEJq255chq2D+T0IX39gTb?=
 =?us-ascii?Q?z0/N2cAEzbtSlk4I6Z0Om2j1mEl7Mm7jvvuAQeYqQDwF75b9qcoF2vWYlsni?=
 =?us-ascii?Q?7H8etWuc1se/wE0cM1mJ4vUojex6S4EMEzH+ofXtdg4DMAIxC2jcHxpLyKFV?=
 =?us-ascii?Q?V+efu40xkJLIzQ/h4ylEjbWTMxvg6oFNNVEcIITkKHPTp3O2wpFI8yM7d9i1?=
 =?us-ascii?Q?3UqOQUHaVxLuaFJuU5e4VDK6AHDqwsWlxhIzIDhkcCgusQBjDFY0xTIAWElQ?=
 =?us-ascii?Q?s/erOLuTZXd5NyeBJSiekQLNG6KfXkjQoqSh5Qr0uDvwWSq5+kMV9Dm6kVp0?=
 =?us-ascii?Q?z/PktMAaLg2x1vPt4VCfzN3IW+p6bdDJmS3sKpUAw/jlETBzKkYTy9GjUuB7?=
 =?us-ascii?Q?jnG0An1gR+vEBUS6/jF2DM8/hVAiY57cKN1ygbS15fxh2hTIlEOY9Svh4Q7p?=
 =?us-ascii?Q?BDU+j//rtO1Tw4eCWgt6r1PwO7hheUcaVAG7HeIjXEH5z2ws0LED6dNuk2Rk?=
 =?us-ascii?Q?gr+4oNgbyoYOm0Pl4pV57KJkw3OfT/kMa3yiPruiZc9BkiSLwpyLzIcDKkXQ?=
 =?us-ascii?Q?YdZn+8AXVhBjaUS5htO11OX45GPIparuh+enN8TMjHh4XENpBkeJqcVBxb3b?=
 =?us-ascii?Q?vq0djQ0ZkS+bTSLnhHv1EmuuQd6Egoz8YU6CZkrAQmyZ9iiZRomXBVXF3/wT?=
 =?us-ascii?Q?nLBZ2XsRinM0eqh3pcY2CeXwd9uqf1QNPq/cW3HykoOIRthIZKWcYymbxiSm?=
 =?us-ascii?Q?cVb3SvVtGHXDZFeynw3hn7yCUgyViTSJ+x/BiDkA2Uu7N9CA+ZdfmfI0jgE5?=
 =?us-ascii?Q?stxA6T7UBrQAk5+m1qGHTucYOG1GOxyHlvBJ8ZluxJ0MOB68at+FjAUdaCrV?=
 =?us-ascii?Q?sXSin71cmQQheWH14guHmm/lqNgCW1CoqbnQ10anum3FZozaru5SHLDCDRyl?=
 =?us-ascii?Q?HwlMqPn9pV9SWXH62UAjsABehfcUjSiw493vm4QwUHG7WUa/OZqcNcL+iQF6?=
 =?us-ascii?Q?Gp4l2YGNkxsiruk9dORK/FcJvhtRonl3+LI4onj0ytpsGhRMvGBVs+WRNOzQ?=
 =?us-ascii?Q?5JEr+9/WDssRl8X4V+96BKCo+znvvzsT0Dv8qEq7jWfPgFa0oZCC9BN+7+xk?=
 =?us-ascii?Q?27mjgG93QRUC49jSR0rIV0OxRQTrizXBiAtXfL3l1G67TJ9sri0dwElmVFW0?=
 =?us-ascii?Q?iXSj5RF2MmLuSivW3KQKF7txEQa7IyBbP6at6mTXYHNZziHU8+4kyTjCuARL?=
 =?us-ascii?Q?nLLL/BAGAMxoONomY1IKwaGnTZxGqOQPgfjcsSd6QDfwSfIykfBfnbBw/f1u?=
 =?us-ascii?Q?0uLJt37XMVQc0IX1/XIXhSYqOiZBwPTCVU0Xs/UXbgqHHKkA5PqiYnyv2Jwk?=
 =?us-ascii?Q?yFOiqR/JyY1zp5aoxOCsrjMkBRB38RvgQ+EVADaJurSeURGcKwRpVdAda4mt?=
 =?us-ascii?Q?7a1S79HT1yBss8Xfx3OAyiGidMyLHHhdOLNqCAADzrnCzzPjIEjFNs4TA/dC?=
 =?us-ascii?Q?Rm9rO/HZG05riY79XzNz3FapcpI1TbSp4Sel2KF8PKelUfvp2I+xVC+wodHc?=
 =?us-ascii?Q?N0tztw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 15:48:17.7877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa495f3-d856-43b7-31b1-08de59047efb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF1D04084C7
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,amd.com:email,amd.com:dkim,amd.com:mid,bugseng.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7C29459728
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It's only used for microcode loading on x86. By lib-ifying it we can make
it go away automatically when microcode loading becomes an optional
feature in follow-up patches.

The exclude-list.json file goes stale after the move, so remove the entry
for earlycpio.c now that it's not included in AMD's build.

Its breakages will be fixed in due time and not ignored.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> # lib-ify only
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com> # exclude-list.json
---
 docs/misra/exclude-list.json    | 4 ----
 xen/common/Makefile             | 2 +-
 xen/lib/Makefile                | 1 +
 xen/{common => lib}/earlycpio.c | 0
 4 files changed, 2 insertions(+), 5 deletions(-)
 rename xen/{common => lib}/earlycpio.c (100%)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index 388397dd3b..273e24db4a 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -121,10 +121,6 @@
             "rel_path": "common/bunzip2.c",
             "comment": "Imported from Linux, ignore for now"
         },
-        {
-            "rel_path": "common/earlycpio.c",
-            "comment": "Imported from Linux, ignore for now"
-        },
         {
             "rel_path": "common/gzip/*",
             "comment": "Imported from Linux, ignore for now"
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 92c97d641e..4fc0c15088 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -65,7 +65,7 @@ obj-y += wait.o
 obj-bin-y += warning.init.o
 obj-y += xmalloc_tlsf.o
 
-obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
+obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd,$(n).init.o)
 
 obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
 
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index efca830d92..3b0137902c 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_X86) += x86/
 lib-y += bsearch.o
 lib-y += ctors.o
 lib-y += ctype.o
+lib-y += earlycpio.init.o
 lib-y += find-next-bit.o
 lib-y += generic-ffsl.o
 lib-y += generic-flsl.o
diff --git a/xen/common/earlycpio.c b/xen/lib/earlycpio.c
similarity index 100%
rename from xen/common/earlycpio.c
rename to xen/lib/earlycpio.c
-- 
2.43.0


