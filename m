Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DD26100DD
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 20:56:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431175.683847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo832-0001rL-PW; Thu, 27 Oct 2022 18:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431175.683847; Thu, 27 Oct 2022 18:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo832-0001oD-Lo; Thu, 27 Oct 2022 18:56:12 +0000
Received: by outflank-mailman (input) for mailman id 431175;
 Thu, 27 Oct 2022 18:56:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cef=24=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oo831-0001o7-Hn
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 18:56:11 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02efae9a-5629-11ed-91b5-6bf2151ebd3b;
 Thu, 27 Oct 2022 20:56:07 +0200 (CEST)
Received: from BN9P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::27)
 by DM8PR12MB5414.namprd12.prod.outlook.com (2603:10b6:8:3e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Thu, 27 Oct
 2022 18:56:04 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13e:cafe::46) by BN9P220CA0022.outlook.office365.com
 (2603:10b6:408:13e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.29 via Frontend
 Transport; Thu, 27 Oct 2022 18:56:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Thu, 27 Oct 2022 18:56:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 27 Oct
 2022 13:56:03 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Thu, 27 Oct 2022 13:56:02 -0500
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
X-Inumbo-ID: 02efae9a-5629-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKF/z7UXvywn+k8JWALLnz8+i02WsEzZptiQdXu+JXrUpmIJzDaUUEoDG5qn0FDCADbCrYvOAWrUyItxNrGVFlUhicQuuaUOdYrXpE3mIejxZrxYxoj1H+72ybb2EEEIAlz5jL08gevBpOzPFp9C7ZjHlRfRIrWhvAXQ0s7flE/LCWL9aUfi/3au8S+3nelVJa3n4je3NGNkdiXcWgQ6zz0wD05W3ZNz8xziLioO1nDnlF7miJ8WxBHBrpaIbTL4E2g+Izopr4tCc9+2TFW/+vAW1bsvGb8exq4/On6pjJKFCEQGth90u6zMOo2vNZz3bYuHhmGbUek0O7Tt/7hKOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpk5LJ+b5vdvJSP5Ee92XUw++nWgxcwlfOU25UtZHvU=;
 b=Zq6hwKZBvZbe6Qu4HeJOsJHfQ4kE5IQK2cACp+9frOgPedw7s2mBYr4yBUbAr1+72HYnZ+UMq5+6xy+4/8BL6GfeKOK/I0hlBKhnWuuZdxxV1uqJZZm6WUrbJf1nE3HE7is3mP94c+ytvscba41wf5YYnrvi1PjbzPfRtnWPYidOTnyfmoTeFoltHlsMs42rD6NImUIRa+OwFs3ofWZVq2QdBJTUEtdGKjfty3YeHCUpS72H0R+9uokSCYjjjkoDr2E45/L6w7sr3MdwcMWvqj6FT/Yw/fxHqHOcZQ4eb8JoRZA6iDl23KC+5IxSDCFNZvN1CJKB5rknk+rICKaIkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpk5LJ+b5vdvJSP5Ee92XUw++nWgxcwlfOU25UtZHvU=;
 b=41LlDooqmcd+ozMofD9K1XTI4MT10QOwTcg4nH+5NtnwKKb6Zq22fsItAVa00JKVxY0P673X4bH6j6cAP0UmiB3CJPJUKjKIHpQiKmpICpjMlMfyRy3BtWS3KPPJ8Z6evR7ZUC+b4tcqU06dkprQ9S9KkhmRGcx52cUJILZ+zhA=
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
Subject: [XEN v5] xen/arm: vGICv3: Emulate properly 32-bit access on GICR_PENDBASER
Date: Thu, 27 Oct 2022 19:55:55 +0100
Message-ID: <20221027185555.46125-1-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT023:EE_|DM8PR12MB5414:EE_
X-MS-Office365-Filtering-Correlation-Id: caa1efe6-fd12-40d7-aa3d-08dab84ce5db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BIJ+cGnKrkEfj1yfIPNCuwBY4xjcbZNk2TL/qO7mtjkXPDT0n/NhJXNk3vWUP+1cPDiiT+HnzBOBesPmYfeV88nqzPjYl62FU837GAJQq4g6oClOXC/nSgNIPcWqtqXZmy5Tf0p1TX4dOY3OfIWWp6tEHm8C6ReZL4x+GW0OpPYj7VzqxsH877XLP5aVwDnb/ICUXMuT29MSVnHOHAlNERfIKmPgn29pqwYCYIVdgZROX9wK3JOWqphPffANaPGYO+/4W1+kPwQ2GsSbG944zu2vtQN4qqSJIRvUXOf5ydF8bi43qkSfZt+QxcdBV4RrRNoBrz85wPt0U9U1skAXO//SwFsj4RKnjSsu5ewahT9xmM5dQtF3OmJl/2fuaEq/mqlxMwKG9BcBFnvL88auA5UbKgYzQKqSFbDc1FIWkmPcUGzIzix+f4hRcQ16LiK8kM8d/RmsFjDzyr1d7doTlZTsI5IAGFx2IWEwgE/8Fd38pcr6BWo/SnRTJDyTc5ieD+E4LH9Ydi8mMAqC7bL6k1P5120mlx6U0FfuA6V8q8+iU0/SuR6tAmcrcG4qmZANmEzrQ1MK2Fp6U39Qgkh18xHGG8l68paqFuFP+OXZF0e3It+xpAkbzL42jZEGydXDctsU/idaAQJlFy5Q1laWlUkt+7wz22gw/qroC1EP9i9vkT8JbPEgk8J6jJExLiZsgOiuUsaCNxPciFwgGUeFlGdAQ3LkQUlzBw17J+MgOqP9oluJRoxqHLNwcaTg/5LyrYzvJGRdnKFIWztuQ1iwlr/7UaFioYVO1OtVxhQ96EmIDyOoqu7Zjl3MyOJHH6Cy
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(46966006)(36840700001)(40470700004)(336012)(5660300002)(8936002)(1076003)(47076005)(426003)(356005)(41300700001)(36756003)(4326008)(186003)(40480700001)(81166007)(6916009)(54906003)(36860700001)(316002)(82740400003)(6666004)(40460700003)(26005)(8676002)(82310400005)(478600001)(2906002)(70586007)(2616005)(70206006)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 18:56:03.9281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caa1efe6-fd12-40d7-aa3d-08dab84ce5db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5414

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
v->arch.vgic.rdist_pendbase in __vgic_v3_rdistr_rd_mmio_read(). The reason
being v->arch.vgic.rdist_pendbase is now being read in an atomic manner.

Similarly in __vgic_v3_rdistr_rd_mmio_write(), we have used read_atomic(),
write_atomic() to read/write v->arch.vgic.rdist_pendbase.

Fixes: fe7fa1332dabd9ce4 ("ARM: vGICv3: handle virtual LPI pending and property tables")
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
2. Removed spin_lock_irqsave()/spin_unlock_irqrestore() for access to
v->arch.vgic.rdist_pendbase in __vgic_v3_rdistr_rd_mmio_write().

v4 - 1. Retained the spin_lock_irqsave()/spin_unlock_irqrestore() for access to
v->arch.vgic.rdist_pendbase in __vgic_v3_rdistr_rd_mmio_write(). This is because
there could be a potential race while read-modify-write is performed on
v->arch.vgic.rdist_pendbase, with another caller performing the same operation.

 xen/arch/arm/vgic-v3.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 0c23f6df9d..d0e265634e 100644
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
 
@@ -577,10 +576,10 @@ static int __vgic_v3_rdistr_rd_mmio_write(struct vcpu *v, mmio_info_t *info,
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
 
         spin_unlock_irqrestore(&v->arch.vgic.lock, false);
-- 
2.17.1


