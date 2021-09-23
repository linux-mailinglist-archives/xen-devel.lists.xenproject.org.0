Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300A54155D6
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 05:12:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193328.344418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9u-0000CD-Im; Thu, 23 Sep 2021 03:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193328.344418; Thu, 23 Sep 2021 03:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9u-00009n-EW; Thu, 23 Sep 2021 03:12:26 +0000
Received: by outflank-mailman (input) for mailman id 193328;
 Thu, 23 Sep 2021 03:12:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qvJY=ON=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mTF9t-0004kC-CQ
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 03:12:25 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.63]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3eef12a7-de91-4816-ab8e-198bc8c41755;
 Thu, 23 Sep 2021 03:12:02 +0000 (UTC)
Received: from DB6PR07CA0054.eurprd07.prod.outlook.com (2603:10a6:6:2a::16) by
 VI1PR08MB4573.eurprd08.prod.outlook.com (2603:10a6:803:e7::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16; Thu, 23 Sep 2021 03:11:58 +0000
Received: from DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::50) by DB6PR07CA0054.outlook.office365.com
 (2603:10a6:6:2a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:58 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT016.mail.protection.outlook.com (10.152.20.141) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:58 +0000
Received: ("Tessian outbound b324a1dbd9be:v103");
 Thu, 23 Sep 2021 03:11:57 +0000
Received: from 198723602d40.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F9D104AC-E4B8-4AFA-86B6-D6B946F524CE.1; 
 Thu, 23 Sep 2021 03:11:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 198723602d40.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 03:11:46 +0000
Received: from AM6P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::29)
 by AM0PR08MB5153.eurprd08.prod.outlook.com (2603:10a6:208:163::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 03:11:37 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::35) by AM6P195CA0016.outlook.office365.com
 (2603:10a6:209:81::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:37 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:37 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 03:11:36 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 03:11:35 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:34 +0000
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
X-Inumbo-ID: 3eef12a7-de91-4816-ab8e-198bc8c41755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qC0WX9sJbstRrjXlzSjejZBynjOxc/CK8y9qTDR6lQ4=;
 b=Gfs4QB5l8MAA0dweywDLLlgFiSLA2/af2fo75Ni1hwK/0nc+4YFdMpa+r6jvArtfXllOEO9A/39VUJFykBbZFZZXx0sEhn1+Q6daBkUgBX4ejafzwGaiKj8VWrNe7KdGS7VLNZ9Wku10UUl/ylz7DlJhDAnbCGjmRBUyNqmx0mw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: eb2696ad9cb63629
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxXRhu7kduSPdz13U+dMnxRE6p4Yw0a1TbfNuvbJFtDLttKzocU4WnaxLb1ocJS6zrGcXiCWMoTCYgm2pjmkxB09Vu0TRg9cvZJZSPtqeWUtfgalqlmXKI6inwmpEXMYv+4QWh5nYWlNvvG4LXxnKPUMvOcyKgOb/fuQLg8nZql7MkhL92nlWyaZc4/NBtUA0PDeFE7let5ha1QVHCEoFZex2168adlyzeA/XmMLreW11w1vg8urwLjWtl0hqLIra+D9Y7vjS8zsuhKoal82HcZ6/ksTblFdfvVjY806cLa6dsQBCxbmIdmBxv3udTVrYr7JxF0bNAO7FZyAgvg89Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qC0WX9sJbstRrjXlzSjejZBynjOxc/CK8y9qTDR6lQ4=;
 b=kFknQQB/tiF61OPW+ctwU2+t2YP49sbpNus/4Fv90UhC3uDKrVdqJS0INicbYoJiP4pJGSrW6CNM5IdZF6wcY8wGQ+jaYMKXdJXpU/VCnbu13GxLOHkvL8JU0GxPCHGnavw7fom15zUaj3V+O/Mc8VJuLzwAwprhX1vSVjc/57/HGo0ltowpKrLh5m8gQK2z2JHvrYwE88ZMwWWqJArwFI6vLnEY/qz/dbwjLFDV0GaB79y148Js/k0IfXjRMH7DqOaY2CsRef/B9X+/C7EffWJf48fXfmoEnJy69zn+bHdzXxWmN0duDW8qsn6SwxAU0ZGN2prTU7fuOjJf57GYFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qC0WX9sJbstRrjXlzSjejZBynjOxc/CK8y9qTDR6lQ4=;
 b=Gfs4QB5l8MAA0dweywDLLlgFiSLA2/af2fo75Ni1hwK/0nc+4YFdMpa+r6jvArtfXllOEO9A/39VUJFykBbZFZZXx0sEhn1+Q6daBkUgBX4ejafzwGaiKj8VWrNe7KdGS7VLNZ9Wku10UUl/ylz7DlJhDAnbCGjmRBUyNqmx0mw=
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
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH 06/11] xen/arm: new vgic: update vgic_cpu_base
Date: Thu, 23 Sep 2021 03:11:10 +0000
Message-ID: <20210923031115.1429719-7-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923031115.1429719-1-penny.zheng@arm.com>
References: <20210923031115.1429719-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b464054-658e-4d32-8440-08d97e3fe794
X-MS-TrafficTypeDiagnostic: AM0PR08MB5153:|VI1PR08MB4573:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB45732942D0756ECDB76E918FF7A39@VI1PR08MB4573.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4M0NxTjWlG1Ilt6az62awmewDr3GItBbAXJHmqHmB/cxObbHKzfmFn3mul+vTirRds0AXVJfnLbselQdSkaXQcre/gs0hwnyZT6OML7IW1CtB7hqhbIbKEt8vQStDTrgrSi48zPxG1vWiT/wFM4Fu6UlLd+3jOm5QnCKmKJNNHUWi3jC9gKAAQdUCHdG912HlSFMsrtCa3G/49OhEkMOYxracn1bHFQ74M/SOKCDCRq6jeGp2JuoewLZq4/lGi1WWNvUl4cYUuDynFCkG1que+I86HqjCk9bfLZ0O76GuBxcXT4xv63wklxAVDOCdDpKCZ/IA291T6be3Iq9XsXoY825v7XMhwGEZ38VXIr7M/jRs6LWfHQUoTdJppbYRxSC3xG9sXY0wO8PSxUh+ylUJQ/d914U3WqakO5imbDtOPiDKBtY2CiBGKQqmhhOtYR8vS4lF3Vaje7horSPDcR2BdzrojJoJlw5UOn7NDbdG5GhYhpoEC0igSoNuRqIsiXY4JOWeVfMcURVqCWTAecQOKYIV9azpEi6dogn/q0EwqKzDN71eFlvLqtg4BTDDiGm3t8K6i1fQ8v1TY8Tr/Vy2MNj3JoO5y/1CPlYCAJcNlu/qozb0P0K9gR3iSjyTwawlS5oB/c2S9eZN/8X8bT55cTdN8AC11DtQ1rvxYLSqgQSKP21FiyfutgBj67rKeJEGDxa1Qk+Yok0FQ6ZF765DjGyGpahUTm03e1s6wJj6EM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(44832011)(316002)(2616005)(1076003)(54906003)(110136005)(8676002)(426003)(336012)(82310400003)(508600001)(5660300002)(70206006)(81166007)(356005)(70586007)(7696005)(8936002)(186003)(83380400001)(4326008)(86362001)(36860700001)(26005)(47076005)(2906002)(6666004)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5153
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3f7393c9-fdd9-4779-f8f4-08d97e3fdb28
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lpmazvuv7ipXPDHPZv3SEPH25U5DLAB3SNflQiGP1x8PQwoB0USRVfE6o5U494AVO3JqVPA0zZZDRRwcDe2Zxc/7xAbxmPuAkd1YQWWm+k1DOikZLmfr89DJOcOBn+D/PUS0Q3ScXOvwvfMwnynwiez/WFQcUoszbTsDBo38sTqpGETkXLf2L5IFqQr3y6D5g9lE4ZfCwmgjLh6JjIft92hci1fAjY/Y6eF3ccarcpbVGTHNS2EeQiaqIccqWJqTDrGpSh0ferrRPNEoFKjWtn9zg4i2BPEIG8KHmRjic5lT98LUuhIaIKlLndtNwWE1rAJn7KP+bBB6qymz633Lsx7VDeQk/rKvjd8FzBdVsSnifqJ0ld7rnSSTjW5UBL9IWMBvB5pChO7FwfX4kUHLRsX91y35xSUrgPYXWVKybGIa719oKft7akmtXa3wIqyTdF65AnQu82Xz0AdkbwX1lUv76y+QhH9WBIwB0yMFd5I0BPcJBcbyUjyECpXSZ1ElFV0IctCttqMvwo3Lf+fjKsyxivF5xbirvpzc+Yjp8aDcdTuRSoSdJOQJSrVW0C9vEFI0x4kpcwmnaR7x6VGpRGS+0wKilfov8Qf6yksBH7u8hak1Za84vO2ZnG8sk16eoF6uqJKb2dZ2JTQAjL7ZgO/iWI+ZxPHhbAZW1twS7+Lz8gaw4PoYA1+y3pk3HYBNEdPkXikVjmPRd7F34sVTiA==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36860700001)(86362001)(5660300002)(82310400003)(316002)(26005)(70586007)(7696005)(83380400001)(8936002)(44832011)(508600001)(1076003)(336012)(4326008)(2616005)(426003)(81166007)(2906002)(47076005)(186003)(70206006)(8676002)(110136005)(6666004)(54906003)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 03:11:58.2885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b464054-658e-4d32-8440-08d97e3fe794
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4573

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

In vgic_v2_map_resources, use the new vgic_cpu_base field of struct
vgic_dist instead of original local variable.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/vgic/vgic-v2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
index b5ba4ace87..fd452fcb5a 100644
--- a/xen/arch/arm/vgic/vgic-v2.c
+++ b/xen/arch/arm/vgic/vgic-v2.c
@@ -258,7 +258,7 @@ void vgic_v2_enable(struct vcpu *vcpu)
 int vgic_v2_map_resources(struct domain *d)
 {
     struct vgic_dist *dist = &d->arch.vgic;
-    paddr_t cbase, csize;
+    paddr_t csize;
     paddr_t vbase;
     int ret;
 
@@ -276,7 +276,7 @@ int vgic_v2_map_resources(struct domain *d)
          * Note that we assume the size of the CPU interface is always
          * aligned to PAGE_SIZE.
          */
-        cbase = gic_v2_hw_data.cbase;
+        d->arch.vgic.vgic_cpu_base = gic_v2_hw_data.cbase;
         csize = gic_v2_hw_data.csize;
         vbase = gic_v2_hw_data.vbase;
     }
@@ -290,7 +290,7 @@ int vgic_v2_map_resources(struct domain *d)
          * region.
          */
         BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
-        cbase = GUEST_GICC_BASE;
+        d->arch.vgic.vgic_cpu_base = GUEST_GICC_BASE;
         csize = GUEST_GICC_SIZE;
         vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
     }
@@ -308,8 +308,8 @@ int vgic_v2_map_resources(struct domain *d)
      * Map the gic virtual cpu interface in the gic cpu interface
      * region of the guest.
      */
-    ret = map_mmio_regions(d, gaddr_to_gfn(cbase), csize / PAGE_SIZE,
-                           maddr_to_mfn(vbase));
+    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.vgic_cpu_base),
+                           csize / PAGE_SIZE, maddr_to_mfn(vbase));
     if ( ret )
     {
         gdprintk(XENLOG_ERR, "Unable to remap VGIC CPU to VCPU\n");
-- 
2.25.1


