Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5749B452B00
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 07:33:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226090.390667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms1Y-0005Zf-3W; Tue, 16 Nov 2021 06:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226090.390667; Tue, 16 Nov 2021 06:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms1X-0005Um-Vw; Tue, 16 Nov 2021 06:32:55 +0000
Received: by outflank-mailman (input) for mailman id 226090;
 Tue, 16 Nov 2021 06:32:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dk95=QD=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mms1X-0001ym-A5
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 06:32:55 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe06::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 069dd605-46a7-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 07:32:54 +0100 (CET)
Received: from AS9PR05CA0049.eurprd05.prod.outlook.com (2603:10a6:20b:489::9)
 by DB9PR08MB6409.eurprd08.prod.outlook.com (2603:10a6:10:23c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 06:32:50 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:489:cafe::66) by AS9PR05CA0049.outlook.office365.com
 (2603:10a6:20b:489::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Tue, 16 Nov 2021 06:32:50 +0000
Received: ("Tessian outbound c61f076cbd30:v110");
 Tue, 16 Nov 2021 06:32:49 +0000
Received: from 4741c4f88d5b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A9E4A306-56E1-4EB3-B334-D26F1DF04EC3.1; 
 Tue, 16 Nov 2021 06:32:42 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4741c4f88d5b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Nov 2021 06:32:42 +0000
Received: from AM5PR0101CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::48) by PR3PR08MB5595.eurprd08.prod.outlook.com
 (2603:10a6:102:83::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.22; Tue, 16 Nov
 2021 06:32:41 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::9) by AM5PR0101CA0035.outlook.office365.com
 (2603:10a6:206:16::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:41 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.20 via Frontend Transport; Tue, 16 Nov 2021 06:32:41 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 16 Nov
 2021 06:32:26 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Tue, 16
 Nov 2021 06:32:25 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:23 +0000
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
X-Inumbo-ID: 069dd605-46a7-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6yQcz0F6cxrLdZUIW64dYS0xxC/jz2U+B9GDRT6stE=;
 b=yogIbBjuCreQM+VV5rceSr9JTfKLuNTZ93o9EfjCCOSUQcLSBaks/5GxRS76ac6QCBHZg+aiE0SZ3/Y27hrYtqXrXA1BuxjWhqX8q/lOrXbTVnY5uP5QfJEFDO9Ntx2Dh3OSyx/Bhe22pEpv9Fy6QRTcONpgT8/vzD1Zjw5NMMA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dd3784fd744465bc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhzxyDpVh4G6ewt9VzrSNqH+WScYvSlJey4H9EGMsrB+YWqMyfRCCjhAckA58n+5lXKlza6kouBjJydouC3JdoivB2m1krKZMua2pv1Fyjl7Vvdw1ZEl3HeoClTWlvuPLzSl7TpvriKgljqZM6C2PwqPqvgXiGnTEIVW5PzVznbal1ARZs6g70TWGWvdxNX4ot26kMw5uLfOnEK30bA8xeLGgt+i9sOhHeyXqh9mdwQ+aAGfr0WwU9810Ee8wMi9B4d3frdQdhSvNugSiXg8S2gI0SJgJRt24cRZ1qjsVKpujo55PF8OIU+FnBRouuCFkZre0bu/UXgjivEUQd2BEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6yQcz0F6cxrLdZUIW64dYS0xxC/jz2U+B9GDRT6stE=;
 b=hmOW7js3A1rTZVFof8zE+3+YmwHp4qnofIVI0DePsTuAfcfQhUsBS/0sd4gLvToNLuEtzZ2TPRaLmU98p4n9Q445SIHvLbsGjPIs3SOEku7NcEdzesNkq7N7GegrzewI4llR8NAvVsPqzVss/4uY06S1JADKm9BJJkb/8SOm8Qz/ib/74KozvhrNAr7d8IyH4vwehd79fcc1DzuXdmmO/4utReQRZwPkyNZErGBoMJbhJMXOVwKVSrT1+u1zvI2KkErg3z7wwR8NU40iROYFQ7ZS6Y4W4rScssmXlVrCjh+oFf0iQd3ec8tvavT+GoDrIk7KiXNytwh3MSSYR/kJ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6yQcz0F6cxrLdZUIW64dYS0xxC/jz2U+B9GDRT6stE=;
 b=yogIbBjuCreQM+VV5rceSr9JTfKLuNTZ93o9EfjCCOSUQcLSBaks/5GxRS76ac6QCBHZg+aiE0SZ3/Y27hrYtqXrXA1BuxjWhqX8q/lOrXbTVnY5uP5QfJEFDO9Ntx2Dh3OSyx/Bhe22pEpv9Fy6QRTcONpgT8/vzD1Zjw5NMMA=
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
Subject: [PATCH v3 08/10] xen/arm: if direct-map domain use native addresses for GICv3
Date: Tue, 16 Nov 2021 06:31:53 +0000
Message-ID: <20211116063155.901183-9-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116063155.901183-1-penny.zheng@arm.com>
References: <20211116063155.901183-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc5a00a9-c66a-4dde-7b58-08d9a8cae955
X-MS-TrafficTypeDiagnostic: PR3PR08MB5595:|DB9PR08MB6409:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB64096AA6F956704327DBECD5F7999@DB9PR08MB6409.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JLgFzWKd8I2rkZNbtGVPjJC0I9E5MQvOdKHA/sOUWU8c0ecZM0/hNdnF7Kd+3G30SMvTYgDFQ2MXkDwcQx7FdRAdrXCzlCrJ12sky1LshQbZnVOEYag9sPd+boxR/Agad6VhkFCAwW43q6cefDJbQSnobeMCQXxKO3sZWzF87Ty/57RpFx+kA2XldM4AU+yN+F5h//hTk7DZjU7EBNDzQfoK7SWIhpryh8zoN8V/NvQP227I5n1+SEfhnr05jt+LvehHvEHMsqDtKogxGix3jur10Bj2D11G8F+YrFWZZh0VD1+6yqvs1z3lkgpLxhuLJ0/Tma/lyQ1EkjNEUoc5AFvTPSoaBiQ8R6eY8mpx+94IQrCzLd6Xmwqvima2Y7OIUAZdyFYf78h7F1mRdYhxX0xyBLcQS/KdniGvuz4hn092bgmm7OUz1+fSfQmkOuD255u/LxAJlOLki7p9MJboE+Xg7bfm8NGFSKOUr+696Q6kcszybl+iWQG8Ljk/fJdDmEB8x2tk5soXRoBY+FVYLmxlX+o32NxksXIB+N5OHP+8nURcrie6HPD3NrJyF6Q6XUcq4bOdzAVatY40x8hmydS4zcLn1uCP4ZHkcWSjVbhauXHGAQN14GIooO33A/j3ZJeTrckCtaDnCTQj0YQ9rKjg1Z4MO2xck2SOsWa8ARyqCjEShyOzNaDsh97nu4ygYrGnV7uIa88Cb0o8SjCAGprcKlk1EXPJc8b3LrbbENw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2616005)(508600001)(110136005)(26005)(54906003)(47076005)(186003)(83380400001)(36860700001)(36756003)(86362001)(336012)(316002)(7696005)(1076003)(81166007)(8676002)(2906002)(4326008)(8936002)(356005)(82310400003)(426003)(5660300002)(6666004)(44832011)(70586007)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5595
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3f91073c-622e-4d43-38b8-08d9a8cae412
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hB9ekgG70XHoEYDE9+dvIqALpySNYLgUiHRIzMfBVKisptIyBYWKIZaEK+IUk+WX00dLwxAtHncngy+M5pZSnEop8DTnK3eWUs5acAbd8p/Gm9BODog9gOTjZ7mzx9fu6wEE2m8ycX192S4DujJDCxKRFp/FBVVmQYl9i5Od//B+ma9TjhqmlcM/mnlRxwJyfRO1Obx8S5O4TRaYiLL072xyRkr1AxndmVW/CZUTLHlCZKr242Oy+wzsXgLg+eZu6Q+MBQyJP1uZlpynoDzROtiAxRPAIQUsxLmq4QRurmJ4ckBQI0nD+py85AxfHorOIWGc1MmBvH084/HOjkPN8GgLAor7rmT5rO5Ad4Vdl/EwFlN3Az+q5arJ8XWxqxBGwFJbaW5L7tW2aSRmOdL+Xp3AEvozVSCr/7g1yvBzCGM9GKgQulgosVqwwOhna5isfOyrqs1K3/pYspedzCoyt8wwBOLcGnuoeyPfhMYoa3Vn/CN0sE+Nbaxfuvg/Jq9tcplVjeRHMEW70Vry29Imrur0Q+7UeuLIf8l+cr9iJ2RaNr28weuS/0kIOHkshB03aaVFD4IsJsnqvZe0ju8z2EeyeuooJg861ypPhCL8V9FNmQi5AmrimKXPcxPeMMYSd3toyXXBFz3Jeg48QNQtt/J0F5qLJ+P7Z3oylIXjZuKqu6tTG77z4R131Ut470nniFvmY88CF8r/3LLS+bdXlA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(186003)(1076003)(7696005)(70206006)(8676002)(5660300002)(508600001)(70586007)(26005)(83380400001)(316002)(54906003)(2906002)(110136005)(47076005)(6666004)(8936002)(36860700001)(4326008)(36756003)(81166007)(86362001)(82310400003)(44832011)(336012)(2616005)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 06:32:50.0100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5a00a9-c66a-4dde-7b58-08d9a8cae955
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6409

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Today we use native addresses to map the GICv3 for Dom0 and fixed
addresses for DomUs.

This patch changes the behavior so that native addresses are used for
all domain which is using the host memory layout

Considering that DOM0 may not always be directly mapped in the future,
this patch introduces a new helper "domain_use_host_layout()" that
wraps both two check "is_domain_direct_mapped(d) || is_hardware_domain(d)"
for more flexible usage.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
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
 xen/arch/arm/domain_build.c  | 37 +++++++++++++++++++++++++++---------
 xen/arch/arm/vgic-v3.c       | 29 ++++++++++++++++------------
 xen/include/asm-arm/domain.h |  7 +++++++
 3 files changed, 52 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 24f3edf069..61fd374c5d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2284,10 +2284,16 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
 {
     void *fdt = kinfo->fdt;
     int res = 0;
-    __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
-    __be32 *cells;
+    __be32 *reg;
+    const struct domain *d = kinfo->d;
+    /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
+    char buf[38];
+    unsigned int i, len = 0;
 
-    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICV3_GICD_BASE));
+    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
+             vgic_dist_base(&d->arch.vgic));
+
+    res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
 
@@ -2307,13 +2313,26 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
     if ( res )
         return res;
 
-    cells = &reg[0];
-    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICV3_GICD_BASE, GUEST_GICV3_GICD_SIZE);
-    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICV3_GICR0_BASE, GUEST_GICV3_GICR0_SIZE);
+    /* reg specifies all re-distributors and Distributor. */
+    len = (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
+          (d->arch.vgic.nr_regions + 1) * sizeof(__be32);
+    reg = xmalloc_bytes(len);
+    if ( reg == NULL )
+        return -ENOMEM;
 
-    res = fdt_property(fdt, "reg", reg, sizeof(reg));
+    dt_child_set_range(&reg, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                       vgic_dist_base(&d->arch.vgic), GUEST_GICV3_GICD_SIZE);
+
+    for ( i = 0; i < d->arch.vgic.nr_regions; i++)
+    {
+        dt_child_set_range(&reg,
+                           GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                           d->arch.vgic.rdist_regions[i].base,
+                           d->arch.vgic.rdist_regions[i].size);
+    }
+
+    res = fdt_property(fdt, "reg", reg, len);
+    xfree(reg);
     if (res)
         return res;
 
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 65bb7991a6..181b66513d 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1640,14 +1640,15 @@ static inline unsigned int vgic_v3_max_rdist_count(struct domain *d)
      * Normally there is only one GICv3 redistributor region.
      * The GICv3 DT binding provisions for multiple regions, since there are
      * platforms out there which need those (multi-socket systems).
-     * For Dom0 we have to live with the MMIO layout the hardware provides,
-     * so we have to copy the multiple regions - as the first region may not
-     * provide enough space to hold all redistributors we need.
+     * For domain using the host memory layout, we have to live with the MMIO
+     * layout the hardware provides, so we have to copy the multiple regions
+     * - as the first region may not provide enough space to hold all
+     * redistributors we need.
      * However DomU get a constructed memory map, so we can go with
      * the architected single redistributor region.
      */
-    return is_hardware_domain(d) ? vgic_v3_hw.nr_rdist_regions :
-               GUEST_GICV3_RDIST_REGIONS;
+    return domain_use_host_layout(d) ? vgic_v3_hw.nr_rdist_regions :
+                                       GUEST_GICV3_RDIST_REGIONS;
 }
 
 static int vgic_v3_domain_init(struct domain *d)
@@ -1669,10 +1670,14 @@ static int vgic_v3_domain_init(struct domain *d)
     radix_tree_init(&d->arch.vgic.pend_lpi_tree);
 
     /*
-     * Domain 0 gets the hardware address.
-     * Guests get the virtual platform layout.
+     * Since we map the whole GICv3 register memory map(64KB) for
+     * all domain, DOM0 and direct-map domain could be treated the
+     * same way here.
+     * For domain using the host memory layout, it gets the hardware
+     * address.
+     * Other domains get the virtual platform layout.
      */
-    if ( is_hardware_domain(d) )
+    if ( domain_use_host_layout(d) )
     {
         unsigned int first_cpu = 0;
 
@@ -1695,10 +1700,10 @@ static int vgic_v3_domain_init(struct domain *d)
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
 
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 4f2c3f09d4..0eff93197e 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -32,6 +32,13 @@ enum domain_type {
 #define is_domain_direct_mapped(d) \
         (d->options & XEN_DOMCTL_CDF_INTERNAL_directmap)
 
+/*
+ * For domain using the host memory layout, we have to live with the MMIO
+ * layout the hardware provides.
+ */
+#define domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
+                                   is_hardware_domain(d))
+
 struct vtimer {
     struct vcpu *v;
     int irq;
-- 
2.25.1


