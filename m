Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1372A4B403A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 04:21:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271075.465469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvd-0000os-Du; Mon, 14 Feb 2022 03:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271075.465469; Mon, 14 Feb 2022 03:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvd-0000jR-4i; Mon, 14 Feb 2022 03:21:29 +0000
Received: by outflank-mailman (input) for mailman id 271075;
 Mon, 14 Feb 2022 03:21:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDlx=S5=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nJRva-0007B5-P8
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 03:21:26 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe07::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3069747a-8d45-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 04:21:25 +0100 (CET)
Received: from AM6P195CA0107.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::48)
 by DB9PR08MB6973.eurprd08.prod.outlook.com (2603:10a6:10:2bc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Mon, 14 Feb
 2022 03:21:23 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::aa) by AM6P195CA0107.outlook.office365.com
 (2603:10a6:209:86::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:21:22 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Mon, 14 Feb 2022 03:21:22 +0000
Received: from 8c3fe565e400.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 997CE106-D74D-4D5A-9B62-E657899B0A6C.1; 
 Mon, 14 Feb 2022 03:21:15 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8c3fe565e400.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Feb 2022 03:21:15 +0000
Received: from AS8PR04CA0184.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::9)
 by AM0PR08MB4962.eurprd08.prod.outlook.com (2603:10a6:208:15a::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 03:21:13 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::d8) by AS8PR04CA0184.outlook.office365.com
 (2603:10a6:20b:2f3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:13 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:21:13 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 14 Feb
 2022 03:21:17 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:15 +0000
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
X-Inumbo-ID: 3069747a-8d45-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+EdtF5Eoz17ctXTfNPy+lev1ALcPCfwOoK+hIw6c4I=;
 b=CTRJynQyC4iCAbDP7f8fZnBuGDYP+iYwlf7872YurhlDYqvuiEB2TtR7KBMuvWfY4rwiXRV4+lKHN2dYvBOCryat5qOC4uAFG+JM10h4yKxqF+yY18sCCZnu4hXHyxjbBoCY9S8B1QBGqFuqAECEtBMjgMh/9t7V1JhGUshgztw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9ab8caaaae34ad5f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXskdfmAsQiJ2GqhvhcgHLOdu2Y26E/G0tai+uaEIjBcDbwqh2WBmY/DfZ8Jf2N7+08PTR9rHmGWIjT9kTKMtXJKl3/OWvTQRVjH2yPsCrQRBs5O6HUrqVWomTxDXHK3dPcKC6PaQsBKY89fhnI8cKrGCWYXJeVfq6WRe/6ONMQA+MrJuCRmXK/3XQ8omow6GwM34DwHf8rbkwY4sIQrQYaiZbLnqmdnmL8WfXDAdmhmSh9bNZKQvzQrUegDU6AToQ4/QYE9ZoCQNJAwF7+1JdaLrG9Mt6gLqGlhXZUysbVW/oVYmAnANNeUxKMxTNVK6NIAhfCdo2n9Pokbk77nvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+EdtF5Eoz17ctXTfNPy+lev1ALcPCfwOoK+hIw6c4I=;
 b=HzIeU+bMKjiE0lFR4azwOuSjjrOHbaDOFxLSfmPSXuM64Gyw8RGBeC9OHMSEJSkdIPwplU/85UYPlLmtXyvOPKB5cEkgb6n8kC2KsFAfY/ZvTfl2mHK0mpd/kuFhVdgM2MigKlxQNzj8tpqo01VtXZbcXWp7HTcrx9v8Xi7nlES9qtX8+S9H1NDGpzESkwb23c/M5L7FrYQqfGx70lSrO629Fx7Fc4GTrnQyuzI7uKTMd02VFelX3cKaI4SZ2QBtb/dDumwmbeXhAISJyfU/98a//VfpUY69I5f/VD1xEYVLOeWg8GzA0ouN2WOiUmVHQyhHjy/D90ny7oKRFLqmJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+EdtF5Eoz17ctXTfNPy+lev1ALcPCfwOoK+hIw6c4I=;
 b=CTRJynQyC4iCAbDP7f8fZnBuGDYP+iYwlf7872YurhlDYqvuiEB2TtR7KBMuvWfY4rwiXRV4+lKHN2dYvBOCryat5qOC4uAFG+JM10h4yKxqF+yY18sCCZnu4hXHyxjbBoCY9S8B1QBGqFuqAECEtBMjgMh/9t7V1JhGUshgztw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH v6 09/11] xen/arm: if direct-map domain use native addresses for GICv3
Date: Mon, 14 Feb 2022 03:19:54 +0000
Message-ID: <20220214031956.3726764-10-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214031956.3726764-1-penny.zheng@arm.com>
References: <20220214031956.3726764-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 9f4d2ce9-69f7-4042-8347-08d9ef69136a
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB4962:EE_|VE1EUR03FT042:EE_|DB9PR08MB6973:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB6973D1EDC17951D30028A87AF7339@DB9PR08MB6973.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eHD1O12Kj0SGr1X2cg8fAo0czXNM4i3qXqIH93bbs5Tgl10FM0Ya2ArJKV/Ttle1op80O0Ed+AGOd/gTkxEiRIVwszeuUeD4XPvRCiusKuqpzlFXvnfWx/Pw0C5d+be1+QAv08v6nhfxQ2bhXrLWwOHWwdy1TwkBo0tGmLSvbIy52SP1MxGD5S4FuKIQxkJtzkVIEeAam4cT2ygrokyJ5IG301HbmuX2JIXdzqiJyOlyKV3L2JAamkjDQh0QU7FgOBTxGe0k4/IQ1nbGuvvFKktGmGtJi7r9pZ7Q/C5XTH7W7cDxeWppEiP5rpFZWYBzqK8y6Y6XfE5Rd04zidljMXSd5N1+j55FdhpWT31OAz5iHlh/mBztVWpkxqLTxzcwDVLKHzddPedIEu5V1RSRoaRGYTY6WWyUuR9SR0pF/IbdLwaDVy/bndeosW8IhQxBNuI+6xEVuIgK5oTZk987efIqLQYLEXT7lX3IH+Rvl5XKVbTo26K7wqaN/x5GS65DcGjshKrXBrGgDWRtVK9AiBpTG+TKWiAY5crvUZxyLgSY64MU0oWN3mNfYrJwkYY6j29NqUFlXpiWiHwWvWD/JubWaA2AupoNxSiI92wnfzudm7VcnCy1eMChNVe7Eb++Rujb8SjrQSnRbIFsWTZ9NmUz17sI+T661N5UigScfiCWUqkil/cLye+NjMtkTzAnNgjgZd/i4iNGBuLG7SsFfQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(110136005)(508600001)(4326008)(70586007)(2616005)(8676002)(2906002)(70206006)(81166007)(82310400004)(54906003)(186003)(26005)(356005)(1076003)(316002)(83380400001)(6666004)(8936002)(40460700003)(44832011)(47076005)(7696005)(5660300002)(336012)(426003)(86362001)(36860700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4962
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31ce6402-b8f6-43dd-d7b0-08d9ef690e06
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NSXoTmDLBVYxJoWrTPZgL3LqoImiJ5SLOSii0af5dESizqcHQiMZEX6J7q9xDEeh1u5KCVwbW2F108g24H5SwY5hXWcLGlc6PqoAxdbHhGhjHXeNH476WQlGqihsQkZbE/PWS8yRB2a1vCPRJEVjHnnolHDFPxf/mRmw5Jjd8jtSHq5aVd1tqewAp7Whho98PoC6osQGDRNhrk5TVTzcjZU/cFCS6yQkPKfTSMDypt+1lNHt98Q9Y0DJ+LiJyx3OV4kNuu/i64QeNk5MsbbFbHmuu88N5uKEHqj/i/KS5i37wmWhNaws7AfhQuUPmT8oTcdJAZEr7eqhlIASYt/f6hciJdm0Y7eESOL42u10oh+WgYJHy/nTnBCUsWQz+U1CV0C4v8PDtgJ8QYspCqtAvv/j2EHdewS0yPuM74xRHHF66t1DsoGDpsQjwRZpEOfOH9eTFWaOPvLp9Ek5qC58WlOKYjCUmzOEif9hyrb+iJgDiX1WDTTwWnwGt7kgMd0obw87bObkIzRitFOTovSt+IOlVHEjrSXTsnZ0dNm91+pYdS3btk8ASTKyTkzkb4gZHbNZRSY82pA5xFNqEDcU+4Yvr1EvE6ypLuzI9yWp+yRf5TmUYOwBOgf6h+WJOKHnTij+AYMRM8qJ16i0pyYbUg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(36860700001)(110136005)(7696005)(6666004)(54906003)(2616005)(86362001)(8936002)(36756003)(26005)(83380400001)(186003)(426003)(5660300002)(2906002)(82310400004)(508600001)(336012)(4326008)(1076003)(8676002)(44832011)(47076005)(316002)(81166007)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 03:21:22.4894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4d2ce9-69f7-4042-8347-08d9ef69136a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6973

From: Stefano Stabellini <sstabellini@kernel.org>

Today we use native addresses to map the GICv3 for Dom0 and fixed
addresses for DomUs.

This patch changes the behavior so that native addresses are used for
all domain which is using the host memory layout

Considering that DOM0 may not always be directly mapped in the future,
this patch introduces a new helper "domain_use_host_layout()" that
wraps both two check "is_domain_direct_mapped(d) || is_hardware_domain(d)"
for more flexible usage.

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 changes:
- remove redistributor accessor
- introduce new helper "is_domain_use_host_layout()"
- comment fix
---
v3 changes:
- the comment on top of 'buf' to explain how 38 was found
- fix res getting overwritten
- drop 'cells += (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS)'
- free 'reg' right way
- fix comment
- rename 'is_domain_use_host_layout()' to 'domain_use_host_layout()'
---
v4 changes:
- refine comment
---
v5 changes:
- nothing changed
---
v6 changes:
- refine comment
---
 xen/arch/arm/domain_build.c       | 34 +++++++++++++++++++++++--------
 xen/arch/arm/include/asm/domain.h | 14 +++++++++++++
 xen/arch/arm/vgic-v3.c            | 30 ++++++++++++++-------------
 3 files changed, 56 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a01dc60b55..cff2cb93cc 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2327,10 +2327,16 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
 {
     void *fdt = kinfo->fdt;
     int res = 0;
-    __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
-    __be32 *cells;
+    __be32 *reg, *cells;
+    const struct domain *d = kinfo->d;
+    /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
+    char buf[38];
+    unsigned int i, len = 0;
+
+    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
+             vgic_dist_base(&d->arch.vgic));
 
-    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICV3_GICD_BASE));
+    res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
 
@@ -2350,13 +2356,25 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
     if ( res )
         return res;
 
-    cells = &reg[0];
-    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICV3_GICD_BASE, GUEST_GICV3_GICD_SIZE);
+    /* reg specifies all re-distributors and Distributor. */
+    len = (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
+          (d->arch.vgic.nr_regions + 1) * sizeof(__be32);
+    reg = xmalloc_bytes(len);
+    if ( reg == NULL )
+        return -ENOMEM;
+    cells = reg;
+
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICV3_GICR0_BASE, GUEST_GICV3_GICR0_SIZE);
+                       vgic_dist_base(&d->arch.vgic), GUEST_GICV3_GICD_SIZE);
 
-    res = fdt_property(fdt, "reg", reg, sizeof(reg));
+    for ( i = 0; i < d->arch.vgic.nr_regions; i++ )
+        dt_child_set_range(&cells,
+                           GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                           d->arch.vgic.rdist_regions[i].base,
+                           d->arch.vgic.rdist_regions[i].size);
+
+    res = fdt_property(fdt, "reg", reg, len);
+    xfree(reg);
     if (res)
         return res;
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index aabe942cde..c56f6e4398 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -31,6 +31,20 @@ enum domain_type {
 
 #define is_domain_direct_mapped(d) (d)->arch.directmap
 
+/*
+ * Is the domain using the host memory layout?
+ *
+ * Direct-mapped domain will always have the RAM mapped with GFN == MFN.
+ * To avoid any trouble finding space, it is easier to force using the
+ * host memory layout.
+ *
+ * The hardware domain will use the host layout regardless of
+ * direct-mapped because some OS may rely on a specific address ranges
+ * for the devices.
+ */
+#define domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
+                                   is_hardware_domain(d))
+
 struct vtimer {
     struct vcpu *v;
     int irq;
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 65bb7991a6..e4ba9a6476 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1640,14 +1640,15 @@ static inline unsigned int vgic_v3_max_rdist_count(struct domain *d)
      * Normally there is only one GICv3 redistributor region.
      * The GICv3 DT binding provisions for multiple regions, since there are
      * platforms out there which need those (multi-socket systems).
-     * For Dom0 we have to live with the MMIO layout the hardware provides,
-     * so we have to copy the multiple regions - as the first region may not
-     * provide enough space to hold all redistributors we need.
-     * However DomU get a constructed memory map, so we can go with
-     * the architected single redistributor region.
+     * For domain using the host memory layout, we have to live with the MMIO
+     * layout the hardware provides, so we have to copy the multiple regions
+     * - as the first region may not provide enough space to hold all
+     * redistributors we need.
+     * All the other domains will get a constructed memory map, so we can go
+     * with the architected single redistributor region.
      */
-    return is_hardware_domain(d) ? vgic_v3_hw.nr_rdist_regions :
-               GUEST_GICV3_RDIST_REGIONS;
+    return domain_use_host_layout(d) ? vgic_v3_hw.nr_rdist_regions :
+                                       GUEST_GICV3_RDIST_REGIONS;
 }
 
 static int vgic_v3_domain_init(struct domain *d)
@@ -1669,10 +1670,11 @@ static int vgic_v3_domain_init(struct domain *d)
     radix_tree_init(&d->arch.vgic.pend_lpi_tree);
 
     /*
-     * Domain 0 gets the hardware address.
-     * Guests get the virtual platform layout.
+     * For domain using the host memory layout, it gets the hardware
+     * address.
+     * Other domains get the virtual platform layout.
      */
-    if ( is_hardware_domain(d) )
+    if ( domain_use_host_layout(d) )
     {
         unsigned int first_cpu = 0;
 
@@ -1695,10 +1697,10 @@ static int vgic_v3_domain_init(struct domain *d)
         }
 
         /*
-         * The hardware domain may not use all the re-distributors
-         * regions (e.g when the number of vCPUs does not match the
-         * number of pCPUs). Update the number of regions to avoid
-         * exposing unused region as they will not get emulated.
+         * For domain using the host memory layout, it may not use all
+         * the re-distributors regions (e.g when the number of vCPUs does
+         * not match the number of pCPUs). Update the number of regions to
+         * avoid exposing unused region as they will not get emulated.
          */
         d->arch.vgic.nr_regions = i + 1;
 
-- 
2.25.1


