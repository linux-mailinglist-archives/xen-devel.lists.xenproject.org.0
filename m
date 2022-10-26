Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A46D60E770
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 20:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430732.682739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onlAX-0002dO-Ap; Wed, 26 Oct 2022 18:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430732.682739; Wed, 26 Oct 2022 18:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onlAX-0002aZ-7y; Wed, 26 Oct 2022 18:30:25 +0000
Received: by outflank-mailman (input) for mailman id 430732;
 Wed, 26 Oct 2022 18:30:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ANQJ=23=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1onlAV-0002aT-Ay
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 18:30:23 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f002040-555c-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 20:30:21 +0200 (CEST)
Received: from MW4PR04CA0122.namprd04.prod.outlook.com (2603:10b6:303:84::7)
 by SJ0PR12MB6926.namprd12.prod.outlook.com (2603:10b6:a03:485::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 18:30:17 +0000
Received: from CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::3f) by MW4PR04CA0122.outlook.office365.com
 (2603:10b6:303:84::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Wed, 26 Oct 2022 18:30:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT096.mail.protection.outlook.com (10.13.175.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 26 Oct 2022 18:30:16 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 13:30:15 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 11:30:14 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Wed, 26 Oct 2022 13:30:13 -0500
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
X-Inumbo-ID: 3f002040-555c-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdhKNPu9B8ZzZTT6g9oc1j14GHbQg97bT0ZTJglye9v4WZ0/US9Eh4WqmR6BQhDIln8tTCZi45nQuZCk6djJFmVmDac0O8yhLGVrCWIdKqwaH4WH7e04/P/QkCparAq7rCtsCQlk1EH3GzzyjJRssCrmJgD2+L/IMWnW/hNp70xDwBymtIcYiGmFp0/ooR6YyyrNppJLOft045mfdVKzdoHXFt5TgDkyJWvBOP60U/HPpF06lQiWsStdUDGcu5V5d9Ca/NmCsRScVrB4szE9+pUaah5pPNew6/QOoPTV/ceKYr/Rknq7p8eW+mEd8jbSca4XU/Cs3ea/3AlrcW3N9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4qxm2rjvz/kxPVyvwj6Tman63HO/M4jCRdkIBDeKOU=;
 b=GygaTpG58WkBkINoQbrPkpjXlixt6i+6emoucXXamL+UtZ+eAijc5D2LEDqKvLxBvaPI+6fX8hwV5+9RhrbtScfhbBmzEJWA2hxNmZpl8cMzo4yvyDdtx4ONopNQn1H5Wsr4+lOu8GNlmnXaaJ4B3LHhwFXlvc0LLKDGOgpR6d6Vx8i4GloItPX+UN7VwmoiBBMuf0vncO+zUeSym6Ss+oil+JNzdNIUU1tZ6bh4Xr5+wuJQafXPbtyOZQ5X+i+wmC7H032ACTEyrmgiqkojLvN4D8fUIPGF0aRNdJ/HxdBYk+VmOPIRqPnyRNHLNEFDVUnNttC+PUEmC0fR+Sobbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4qxm2rjvz/kxPVyvwj6Tman63HO/M4jCRdkIBDeKOU=;
 b=gV8PRoCP09nj0gKK/9y/dqHG3GE41eqHuQR1v0DtD1AXEg3E4wKrv4U/5G3+wUFfF0gmoGCpdW0Gj65rwdyuRllbUI92ZMfvyw4FS1B0UUR7gkNuBPrLdXO7AYlApzJEgwQtSSAEB42uK1M0TZUmQus6P85YI1+L52rq0fL/cT0=
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
Subject: [XEN v4] xen/arm: vGICv3: Emulate properly 32-bit access on GICR_PENDBASER
Date: Wed, 26 Oct 2022 19:30:04 +0100
Message-ID: <20221026183004.7293-1-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT096:EE_|SJ0PR12MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: bb5e8d5d-9603-4c24-ae65-08dab780212e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	acJmEMcM/gKpXLYe3CWDH3RurO8YeoN+a6cmwrNaqVNJBL1yGeLJ/gMDUguiJn/HfqYhEiviXK/torzRZys2DLD+ia8AmCgRwR1VaFIpn1fDnNWPpeeinQVABkldcrcelYO3k3TASX+oXm/P6BtaYiVecZqfaAF9kuT189/S/HRk2O9OHfs/sbo7xO0v+7rEh9DNBt78l/C6AT7rQ242ufHMW1sUc0NeGS+/AhmOK6/70ilBu23n4CRgSKJUo8DOXo30wy92eQJlBkdUBn7XsrwKix0OKkY430ddy7Zxe7L6Gzpw25PtRChRR4nhSS4cBRR/VDczaP2YACibz7W6hsF2OJewS7PP1wkxwncNc+D12w8erJA1l1+0B31q61ZUZH2O8DKoStOqFKxSRcFzkxaZKcRJSaU4U8rVyFA99GU0HnJN/db3nFgBfNPIOATUn6AEqLsgy80nTq4xhGKFRs7jfT+mRWcVaIUJJfQ+ZOwfQOUHlACFD12DGORXKgh6I/NGhk/qZoa3rgMz7OBjgezM/cwrKQcrEjEHfrUZntpbj20ha76lNiclI9fctllh4sCYOh2EqR3qr2SMX/kBC0OVB9eBDYPS55E9/XNJ2jJOGUekXkkaO6eNTEJC89FemfTkCvAY+BY3LxgABwM8+tANyhaRa8zUNFQk0hVVGdXn9BdJZkclspP7w+o+uQ9qwblXRSa1a5dVnp8XAObuH4cTkWV304uyq2nazTBWw6xEzjkIzjyHZZZZWvqdGE7R6DyLKsAM4AIJ/t1tb3uEb94emcuds/+5G3DjopWBHATfL3ohGVKfuiWKRg3V0XQQ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(36756003)(36860700001)(82740400003)(2906002)(40460700003)(336012)(81166007)(2616005)(186003)(1076003)(426003)(8676002)(356005)(5660300002)(47076005)(83380400001)(70586007)(70206006)(26005)(4326008)(54906003)(6666004)(40480700001)(41300700001)(6916009)(82310400005)(8936002)(316002)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 18:30:16.5032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5e8d5d-9603-4c24-ae65-08dab780212e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6926

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

Also, we have removed spin_lock_irqsave()/spin_unlock_irqrestore() to protect
v->arch.vgic.rdist_pendbase. The reason being v->arch.vgic.rdist_pendbase is
now being read/written in an atomic manner (using read_atomic()/write_atomic()).

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
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

v3 - 1. Added read_atomic()/write_atomic() for access to v->arch.vgic.rdist_pendbase
in __vgic_v3_rdistr_rd_mmio_write().

 xen/arch/arm/vgic-v3.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 0c23f6df9d..1adbdc0e54 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -249,16 +249,15 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
 
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
+        val &= ~GICR_PENDBASER_PTZ;      /* WO, reads as 0 */
+        *r = vreg_reg64_extract(val, info);
         return 1;
     }
 
@@ -566,25 +565,19 @@ static int __vgic_v3_rdistr_rd_mmio_write(struct vcpu *v, mmio_info_t *info,
 
     case VREG64(GICR_PENDBASER):
     {
-        unsigned long flags;
-
         if ( !v->domain->arch.vgic.has_its )
             goto write_ignore_64;
         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
 
-        spin_lock_irqsave(&v->arch.vgic.lock, flags);
-
         /* Writing PENDBASER with LPIs enabled is UNPREDICTABLE. */
         if ( !(v->arch.vgic.flags & VGIC_V3_LPIS_ENABLED) )
         {
-            reg = v->arch.vgic.rdist_pendbase;
+            reg = read_atomic(&v->arch.vgic.rdist_pendbase);
             vreg_reg64_update(&reg, r, info);
             reg = sanitize_pendbaser(reg);
-            v->arch.vgic.rdist_pendbase = reg;
+            write_atomic(&v->arch.vgic.rdist_pendbase, reg);
         }
 
-        spin_unlock_irqrestore(&v->arch.vgic.lock, false);
-
         return 1;
     }
 
-- 
2.17.1


