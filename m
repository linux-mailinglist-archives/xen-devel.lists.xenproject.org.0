Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA17E60E246
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 15:37:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430585.682445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ongae-0007SM-7K; Wed, 26 Oct 2022 13:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430585.682445; Wed, 26 Oct 2022 13:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ongae-0007PN-47; Wed, 26 Oct 2022 13:37:04 +0000
Received: by outflank-mailman (input) for mailman id 430585;
 Wed, 26 Oct 2022 13:37:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ANQJ=23=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ongac-0007NX-E1
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 13:37:02 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44ab19b1-5533-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 15:37:00 +0200 (CEST)
Received: from MW4PR04CA0303.namprd04.prod.outlook.com (2603:10b6:303:82::8)
 by LV2PR12MB5965.namprd12.prod.outlook.com (2603:10b6:408:172::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 26 Oct
 2022 13:36:56 +0000
Received: from CO1NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::ca) by MW4PR04CA0303.outlook.office365.com
 (2603:10b6:303:82::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Wed, 26 Oct 2022 13:36:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT070.mail.protection.outlook.com (10.13.175.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 26 Oct 2022 13:36:56 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 08:36:17 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Wed, 26 Oct 2022 08:36:16 -0500
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
X-Inumbo-ID: 44ab19b1-5533-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oee8nAeZ0e7IMaYnjTdBV+jz0cNT04wyfQn51D8oJH9i+h7BbvHPsDQNiIH1ikM/4eRUm/uu0mvNQhM5aODyeAJ+W7pomJGOEOOTxXa6uhSFzlnq9t+bd5XNbG9QLv0aqrWAX0x+yJRd6vxTT2gU3ivGK51ywFLDV+vxZR1RFav9S/ao7NbSP3leyOQZAKcSTJVi/+elXkA4aLxm96klqk51mBeYkn3q7uRT3gN5LWlxGqgfaT6q6RtojDAOsBTOp8DDJVmErkD5zGsfpQoLDwjzuUBPCoPA7Q7XIvZt01G7AKrgy9Guyu2ZNuJVWvl+nKAzV7GbaOIV8yxk91Sv9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwEyZHBa3dPSOxtzUwSKMcWCHBoTLECu3tT8+ePe6jE=;
 b=LroUwE2ZuOcCu7KUrZ3tGnR0J/ndhpHh2FEdDIOb/ZdNtWndoApO08fIIg1YTAP/UeoN6xftf6J29C0jfMt5qYddMTjIIG/wcLD2zC/NXwgrWF0I2z7iXH9yug3EP0do3QpV+F3sWLTDnrDsio51luxZWBCIuzO8in47w5eCljdcT2j85F+T78r3xr94awpOunVz78qIY+s5pLaQnPaLhhea98X+iPyIzPHA8c4mjgNEMt7OdJsIBkXVW+CorTEJvHcG0heJC6/Bp/BJSheG1PIGZ2C09XSKQP5OwN0lbAKp57cOih8EuPMMdUlma6rOx5ERpBGx4Rf6eSixa4kkaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwEyZHBa3dPSOxtzUwSKMcWCHBoTLECu3tT8+ePe6jE=;
 b=ZFObGO8/IXn898KvloihPTeiIpmpMLNt/EsiFRsw/q+9bV9l/N8sVyTBbFzbsDlglZRHk7+TekEVOLLrwU0qu478KFQDUTGTBwlfu6BMBjwQaBF8QSc/hQ7SwjQyJVyB/C9+E16Y6Bu8nAyNjHoJdZ2IPrAgjs3uSztlonT4U0A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andre.przywara@arm.com>, <Henry.Wang@arm.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
Subject: [XEN v3] xen/arm: vGICv3: Emulate properly 32-bit access on GICR_PENDBASER
Date: Wed, 26 Oct 2022 14:35:40 +0100
Message-ID: <20221026133540.52191-1-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT070:EE_|LV2PR12MB5965:EE_
X-MS-Office365-Filtering-Correlation-Id: dea28037-51af-454a-6297-08dab75726b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rWntPbS4r9y3KnRr2bGGR3DfIto9M/NIcHRmColpSwvPmtOcBFZ3XsL8FcdRtjajv43FV4duECzEAMdXkXA4k/bZLgkwPxtB9w3wjQuTz9Av4ELwB+BsuCRFoPI1ZRZK3ZOjG3Lf9eWX+Nus9/LEq/vWI2TGWrMpvQl40rSOjrBIHzxXkm88jJ3lfnVni4yurR5Vu08Fyp27yUXU1heQ+eOlsy6sbM9VHu50MJwtfiMhO7Jp7RKUC6fZ1/5AyNfnfyctfcYGF3aXwLOyDT0PUF9GZC1FtmUVpj3h2a8ax+WFRokwKXSf3yzNXvvoC8hSCJ8J/Cq/zlQDeAXpKq1kiUBPmvb2wYMEAOo8HoWDKStgseSEv9r95ZzHgMs41MxA1VxbKgKOmdZrN/zxpHtQXLkm/cG2fPOJN0xxR1OgZq8kxfRrNr19px6Y/wS2FWHLRWUINdLfIBmzvx9WakC5ebqVTsdAfVwPRy5Nmr3pIx0BgILW0JGVAZC3R8nCk8cldR+yUAAv7I3K1O2Okw6qFnHtGrtuL95KlQ5bI4M1QR6T3xKhsvtB9jAl8MXDPAGChnDSBg9xiChUlAw72RCWWzhm5jIky13+qJK2IIi2XQGKOhqNPTGkBwoApPX172Nx+7tres9vyh3PZyNduLlqK2DFZbTNkjwy66FUFTa7Dd5GeckEzZ2eer7DX8vfjJvyjz3WWsc+hQPX5b3uJA3r15cpvUUTdg5wGhNvL/LpPyA+s/rULkeXAn4dvazGtB0Ce32RYddP4BtAnCiY3QCOaGkkcnny23DIq4ShqLMTwRq7pqPJP3ZOPbxv7LCIY2Fq
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199015)(40470700004)(46966006)(36840700001)(82310400005)(41300700001)(6666004)(5660300002)(82740400003)(316002)(26005)(4326008)(356005)(54906003)(81166007)(40460700003)(36756003)(478600001)(40480700001)(8936002)(70206006)(83380400001)(8676002)(47076005)(426003)(336012)(186003)(6916009)(2616005)(1076003)(36860700001)(2906002)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 13:36:56.4202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dea28037-51af-454a-6297-08dab75726b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5965

If a guest is running in 32 bit mode and it tries to access
"GICR_PENDBASER + 4" mmio reg, it will be trapped to Xen. vreg_reg64_extract()
will return the value stored "v->arch.vgic.rdist_pendbase + 4".
This will be stored in a 64bit cpu register.
So now we have the top 32 bits of GICR_PENDBASER (a 64 bit MMIO register) stored
in the lower 32 bits of the 64bit cpu register.

This 64bit cpu register is then modified bitwise with a mask (ie
GICR_PENDBASER_PTZ, it clears the 62nd bit). But the PTZ (which is bit 30 in the
64 bit cpu register) is not cleared as expected by the specification.

The correct thing to do here is to store the value of
"v->arch.vgic.rdist_pendbase" in a temporary 64 bit variable. This variable is
then modified bitwise with GICR_PENDBASER_PTZ mask. It is then passed to
vreg_reg64_extract() which will extract 32 bits from the given offset.

Fixes: fe7fa1332dabd9ce4 ("ARM: vGICv3: handle virtual LPI pending and property tables")
Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Release-acked-by: Henry Wang <Henry.Wang@arm.com>
---

Changes from:-

v1 - 1. Extracted this fix from "[RFC PATCH v1 05/12] Arm: GICv3: Emulate
GICR_PENDBASER and GICR_PROPBASER on AArch32" into a separate patch with an
appropriate commit message.

v2 - 1. Removed spin_lock_irqsave(). Used read_atomic() to read 
v->arch.vgic.rdist_pendbase in an atomic context.
2. Rectified the commit message to state that the cpu register is 64 bit.
(because currently, GICv3 is supported on Arm64 only). Reworded to make it
clear.

 xen/arch/arm/vgic-v3.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 0c23f6df9d..958af1532e 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -249,16 +249,16 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
 
     case VREG64(GICR_PENDBASER):
     {
-        unsigned long flags;
+        uint64_t val;
 
         if ( !v->domain->arch.vgic.has_its )
             goto read_as_zero_64;
         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
 
-        spin_lock_irqsave(&v->arch.vgic.lock, flags);
-        *r = vreg_reg64_extract(v->arch.vgic.rdist_pendbase, info);
-        *r &= ~GICR_PENDBASER_PTZ;       /* WO, reads as 0 */
-        spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
+        val = read_atomic(&v->arch.vgic.rdist_pendbase);
+        val = v->arch.vgic.rdist_pendbase;
+        val &= ~GICR_PENDBASER_PTZ;      /* WO, reads as 0 */
+        *r = vreg_reg64_extract(val, info);
         return 1;
     }
 
-- 
2.17.1


