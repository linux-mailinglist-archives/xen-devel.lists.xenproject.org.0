Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B5763AD18
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 16:57:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449014.705644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgVi-0005GZ-4T; Mon, 28 Nov 2022 15:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449014.705644; Mon, 28 Nov 2022 15:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgVi-0005Cj-0Y; Mon, 28 Nov 2022 15:57:34 +0000
Received: by outflank-mailman (input) for mailman id 449014;
 Mon, 28 Nov 2022 15:57:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xF6c=34=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ozgVf-0004G7-MB
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 15:57:31 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20615.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c940f87-6f35-11ed-8fd2-01056ac49cbb;
 Mon, 28 Nov 2022 16:57:30 +0100 (CET)
Received: from DM6PR06CA0008.namprd06.prod.outlook.com (2603:10b6:5:120::21)
 by IA1PR12MB6433.namprd12.prod.outlook.com (2603:10b6:208:3af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 15:57:27 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::8) by DM6PR06CA0008.outlook.office365.com
 (2603:10b6:5:120::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22 via Frontend
 Transport; Mon, 28 Nov 2022 15:57:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Mon, 28 Nov 2022 15:57:26 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 09:57:26 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 07:57:25 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 28 Nov 2022 09:57:22 -0600
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
X-Inumbo-ID: 5c940f87-6f35-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DISS9lSqQRUuF8OQlqH8/YFth4wCdGDvrf0wJgupzeLY523c6FcfVPqkVxfpD8+x2CrAFdAeWo6hK6CLV7KXwMDwhF1RoMjY9SPIP8YLUP+DHq63MInUJg3xv454Eqznrv0TgOcYjDRNJzlovBtgFMO7UHA2RlTseFzNrBtZYQ1PIxQ0GSDob4OKB80QUrdKgjIcosI3kEqlbJ2ey/5Pw33/DKCR9Q36RY3IwIBJ+H00cJCkMB5Cfj+MtyedAws+0ztZYc5k3/K8tZbtHqlqcDTI12dEY5Vtul8/GroR5G/8KbrdnbwlFZA8rqWl8PQJ47UyAve3a8kVEH08uIElNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHPxMWUa29+xaFmCOEcfUOn2GgVi3+FD6m5d0NUuByk=;
 b=FbSniy5sECww9lVrWa1HDkws+N7nSxB17s934eKGmyBZz/r0WHl0UeZ0B0r4AUTK8qDDlyOmBFMWkYVsKCMzJ48dsclrBKGxhv0TTIswKWEDHpkwM8dnQS+pVxBiB7bjIhGxWuWWm2Xe1aNBM/aJyudQqRKDLLhG/lC43CZzxC1LVFcPYi1sZtUvOaOxGSMlin6oPIF4wltdrQpjhoZqbl8LqA8VhZK+qvNc0LSmzKOly7TOyO+qAfDQSLtNmHfRuYvEOHwLdPZLscwTsBerEruqPP85C2ihxP72yTOo7SQLJQqJjx1cWmAoxnpI2vuxO6iWY93njtaFboQZEua35A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHPxMWUa29+xaFmCOEcfUOn2GgVi3+FD6m5d0NUuByk=;
 b=k124bvA3bLWuudYRHaHKJbGflJKtoabAjcaRM2C0kWSTID52yyTG7cSZRqgebruE26T+/aPn+5fmskrqWVmbP7tuL5XKlqufy+r1N8ILeM41Tms2pOF/0JT/V7YGzpe/EYxm+voiukn5gF4mOJ/w8jWgemun/bSvWTjjuCraxZI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v4 04/11] xen/Arm: vGICv3: Adapt emulation of GICR_TYPER for AArch32
Date: Mon, 28 Nov 2022 15:56:42 +0000
Message-ID: <20221128155649.31386-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT056:EE_|IA1PR12MB6433:EE_
X-MS-Office365-Filtering-Correlation-Id: e894425c-f259-405c-2cbc-08dad1593f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PZbPl/MHJEHRog2yXZ/vi/TtA2GO2rX9NfslY4NxZEHXJvASCAYna/25hWV4dqPk2CiKmRb5mQ9/+6GWdGo23xTwpXwjh1lgyVFs8gketfuXM+BE0e0QwEMUdxtCIH5scqBY5qHj2XhQhG8nNZws1rZZcDL40srhlQhXGNn8/XtKOLCaF0vgUG0sjWCdrFvxDFpe0s8GwouZDQZGT5EIN45sCZxbU8NduhaCZzS6wpHjHzFgyqbmo+T2n6dJVgiFSDwFfF6ntfqKlcwVGYC46uhC4gWhO2O/P6GwXHuGurBcGtgJ5mIfcJi7tVE2Hu4WIIUtpU9rjmCm66Q0zSB1fAsNILHMfTsxhY7VO/VaXEtGJU53z6lS+yyL82puFhnjB53JLAc+L19LqZzlQoCMtcCXlzcVUEzjBMiE9ghvcH81b7p5xkfTyas0UUnNAitblEnxaECv5v0225lNskq4Ul/BDA0JP/GM+hDbKurw9LMcoDFCBCbez0Xp4IzYBhWBzLa5uKxqqEI5Z8UjgfA1A3VF3SbDbCbJNZIB8YBKyPrwKXUnt2bT10Y/51zTGFfkuJLKcercIiGcsE55UVfUh868V0059VgrTVWkVp+n9JFrggmCjQCMp4Xp9nByLQ5r3gM4s46r2xJJv4Fl04plYovIsRchLOrzmBDIYoVLSZGunsQemz0TO1WLN7JwPfWCCd3/xTRedmYON7v6b7UhExqtRYjv7uRrPtAfJ+4CGgY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(47076005)(426003)(5660300002)(40480700001)(103116003)(6916009)(54906003)(8936002)(2616005)(316002)(26005)(40460700003)(41300700001)(336012)(1076003)(186003)(70586007)(36756003)(8676002)(4326008)(82310400005)(70206006)(81166007)(356005)(82740400003)(2906002)(83380400001)(36860700001)(86362001)(478600001)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 15:57:26.7225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e894425c-f259-405c-2cbc-08dad1593f2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6433

Refer ARM DDI 0487I.a ID081822, G8-9650, G8.2.113
Aff3 does not exist on AArch32.
Also, refer ARM DDI 0406C.d ID040418, B4-1644, B4.1.106
Aff3 does not exist on Armv7 (ie arm32).

Thus, access to aff3 has been protected with "#ifdef CONFIG_ARM_64".
Also, v->arch.vmpidr is a 32 bit register on AArch32. So, we have assigned it to
'uint64_t vmpidr' to perform the shifts.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---

Changes from :-
v1 - Assigned v->arch.vmpidr to "uint64_t vmpdir". Then, we can use 
MPIDR_AFFINITY_LEVEL macros to extract the affinity value.

v2 - 1. "MPIDR_AFFINITY_LEVEL(vmpidr, 3)" is contained within
"#ifdef CONFIG_ARM_64".
2. Updated commit message.

v3 - 1. Added an inline comment to explain type widening for v->arch.vmpidr.
2. Updated the commit message. Added Rb.

 xen/arch/arm/vgic-v3.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 3f4509dcd3..e0b636b95f 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -191,12 +191,20 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
     case VREG64(GICR_TYPER):
     {
         uint64_t typer, aff;
+        /*
+         * This is to enable shifts greater than 32 bits which would have
+         * otherwise caused overflow (as v->arch.vmpidr is 32 bit on AArch32).
+         */
+        uint64_t vmpidr = v->arch.vmpidr;
 
         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
-        aff = (MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 3) << 56 |
-               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 2) << 48 |
-               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 1) << 40 |
-               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 0) << 32);
+        aff = (
+#ifdef CONFIG_ARM_64
+               MPIDR_AFFINITY_LEVEL(vmpidr, 3) << 56 |
+#endif
+               MPIDR_AFFINITY_LEVEL(vmpidr, 2) << 48 |
+               MPIDR_AFFINITY_LEVEL(vmpidr, 1) << 40 |
+               MPIDR_AFFINITY_LEVEL(vmpidr, 0) << 32);
         typer = aff;
         /* We use the VCPU ID as the redistributor ID in bits[23:8] */
         typer |= v->vcpu_id << GICR_TYPER_PROC_NUM_SHIFT;
-- 
2.17.1


