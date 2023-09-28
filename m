Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E31BE7B1C91
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 14:35:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609655.948756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlqET-000434-BP; Thu, 28 Sep 2023 12:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609655.948756; Thu, 28 Sep 2023 12:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlqET-00040l-8S; Thu, 28 Sep 2023 12:35:05 +0000
Received: by outflank-mailman (input) for mailman id 609655;
 Thu, 28 Sep 2023 12:35:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TwOV=FM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qlqES-00040f-Lh
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 12:35:04 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 704bc10c-5dfb-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 14:35:00 +0200 (CEST)
Received: from BYAPR05CA0078.namprd05.prod.outlook.com (2603:10b6:a03:e0::19)
 by SN7PR12MB6789.namprd12.prod.outlook.com (2603:10b6:806:26b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 12:34:57 +0000
Received: from CO1PEPF000044F0.namprd05.prod.outlook.com
 (2603:10b6:a03:e0:cafe::d8) by BYAPR05CA0078.outlook.office365.com
 (2603:10b6:a03:e0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22 via Frontend
 Transport; Thu, 28 Sep 2023 12:34:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F0.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Thu, 28 Sep 2023 12:34:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 07:34:54 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Thu, 28 Sep 2023 07:34:53 -0500
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
X-Inumbo-ID: 704bc10c-5dfb-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQsfDjB7xowwh9BjxxJdbRVMGp+Kna5Y3TE29PfxPAjRdoEQtVk57+SzzSG6UJksiR8CUsPKu/d3FWOqSgPVMCikPQWCvvoJ33sS8erb4BFuM1sGeEMNAAsiEC4yaeRm3Lx8qkyhruYlMXugR00jZ5SOpEJ6CapoLqTAGxbtwKq78wFVjGFXPjcVNuPuPe8rXNWZL1PvyPdNpIFmvdWYS9MjJN05Ocaf7bCW81Q8gSrhBcgs0xSCPrdjXN66cFUV5JrK0zWHNj7RVuBDIjZx+HjCWH+4O65bWLD6Ojrp75UJjNGbWN/uXSJYhoLH000j2YiKrTZiMJVlSPFXFQcnjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7Ju6bu8OgEJVGjFjrrzrrtbaw0w5O1j5OSxaTy1o/A=;
 b=JwCWU/xV/jVD3bRJ9LXMivQu49WtNl85tQCoodbAmqaNCmCRWk/eSIQUXHht8VVvWyyEjOXgRUXBBnN+F+68Phqpa01/xxIUJ8Gz2gQjZTJDgNd56FAoc0fBSo9q0x4TYRx8Lip0xbJP1/ST0pVPKocNteJ6vZ5DpfN8dSiz84p23pOeOZP6pu8B+ItzyM/53XW1ESas/OjxgpsmzJf28IgJjls0UUKIw5oOH7IGq7cyzJe8iLHmJuaFl8QqZpTy8HWWjb019Bxh94JbaB17Gmmadsc1TRZNbijEV9hb+gW63WkEscgZkI546ea29TYYWDRO/s3R/Uln131wayz49w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7Ju6bu8OgEJVGjFjrrzrrtbaw0w5O1j5OSxaTy1o/A=;
 b=J6OpmDOwmmbEr5KczlugJpbmt703Rhao0GyuWOmbv826fzC2AOwASSsdg1+dq9UwOHEUXgsbGZZJcWse9r9ssBjJWHoTmOEtkEhtVlA692AiTxhoHohxn/vmJrP13TmZMsN1/ZIlJJTJx5Dfm/lF6tJgLjA0Nwde29tfK9WquNY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Validate generic timer frequency
Date: Thu, 28 Sep 2023 14:34:35 +0200
Message-ID: <20230928123435.2802-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F0:EE_|SN7PR12MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d1a1e34-30fa-469f-61d4-08dbc01f5228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OGezZu6TwigfmAu/OGBj/6S/TYh0kazivo+uzd+bRWnoiHafuQhfbiEg4h32vYY9BHoT5jmkF+1OSnY7gbiwHjr0o8V2VZiswA8MTHOro9kBViWbi12CmU76UjUquCVzX83x7yJtW3RSjypdXGGrOYzleToTnaf4AZa3oOqpa2O+f3APidmfAY+/bPLDq/6+KOesfziKf+HSXXRr7SPC4HoAI1PIHhNda+G2Q75UGzpjzFbPgU/rhZU146J1YAQPGrgVrWAZDzfoG2Ra2b4JuaeLiFi1CIEVCAMgkZfZ/32vFjyRE4UjclXAn+h35KPo0osdCJPO6GNrXyOjsGitOKZ3uKpbrOFZX+9QkriM3d+NDU5C1BOx1MQTKwntjZRMF2p0gVH2ZXyF8eqD1fnZku6vBNiQIkzmELJ3g/gYxE6hh9Yng/HVCY1TSkdVZ/tIuSelVWg7O1X3cGxETS4RtJ1gGzISjKiqfbfEWhnRQCLFeeUgO9GQnYYxbBSWSRTG07zGVQ3U9R2dd21xRTx+TuCfJy4E0P7iCbatJO/F4vMIoQ7VDqccXSamw/d1LdyWJvcDqda5v/qfqkmKZZmAgYWTM+9xu3uedQ9j9T2/Stq/6eRmFj9sceonCVfrSbsT8QRPhM+5BNLIljYhgUVYStVUG9fCDVxMiDqfu7FIATZ06bZhu/UwXgbxwJA4cXLlKl17JT9+X7+K3Sfnv/mx0KX4I8GPAREPIyggSaL50KAZU6UHWQQGilMEKUqBL/ArFm92XZjA10uFux0hb+f9U2YWPd7s206pbjNVQpDoP+Y=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(64100799003)(82310400011)(186009)(451199024)(1800799009)(46966006)(36840700001)(40470700004)(316002)(54906003)(41300700001)(8936002)(6916009)(70206006)(70586007)(40480700001)(4326008)(2906002)(8676002)(44832011)(15650500001)(478600001)(40460700003)(6666004)(26005)(5660300002)(47076005)(83380400001)(81166007)(1076003)(336012)(2616005)(426003)(86362001)(36860700001)(356005)(82740400003)(36756003)(41533002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 12:34:55.6235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1a1e34-30fa-469f-61d4-08dbc01f5228
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6789

Generic timer dt node property "clock-frequency" (refer Linux dt binding
Documentation/devicetree/bindings/timer/arm,arch_timer.yaml) is used to
override the incorrect value set by firmware in CNTFRQ_EL0. If the value
of this property is 0 (i.e. by mistake), Xen would continue to work and
use the value from the sysreg instead. The logic is thus incorrect and
results in inconsistency when creating timer node for domUs:
 - libxl domUs: clock_frequency member of struct xen_arch_domainconfig
   is set to 0 and libxl ignores setting the "clock-frequency" property,
 - dom0less domUs: "clock-frequency" property is taken from dt_host and
   thus set to 0.

Property "clock-frequency" is used to override the value from sysreg,
so if it is also invalid, there is nothing we can do and we shall panic
to let user know about incorrect setting. Going even further, we operate
under assumption that the frequency must be at least 1KHz (i.e. cpu_khz
not 0) in order for Xen to boot. Therefore, introduce a new helper
validate_timer_frequency() to verify this assumption and use it to check
the frequency obtained either from dt property or from sysreg.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/time.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index 3535bd8ac7c7..04b07096b165 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -101,6 +101,17 @@ static void __init preinit_acpi_xen_time(void)
 static void __init preinit_acpi_xen_time(void) { }
 #endif
 
+static void __init validate_timer_frequency(void)
+{
+    /*
+     * ARM ARM does not impose any strict limit on the range of allowable
+     * system counter frequencies. However, we operate under the assumption
+     * that cpu_khz must not be 0.
+     */
+    if ( !cpu_khz )
+        panic("Timer frequency is less than 1 KHz\n");
+}
+
 /* Set up the timer on the boot CPU (early init function) */
 static void __init preinit_dt_xen_time(void)
 {
@@ -122,6 +133,7 @@ static void __init preinit_dt_xen_time(void)
     if ( res )
     {
         cpu_khz = rate / 1000;
+        validate_timer_frequency();
         timer_dt_clock_frequency = rate;
     }
 }
@@ -137,7 +149,10 @@ void __init preinit_xen_time(void)
         preinit_acpi_xen_time();
 
     if ( !cpu_khz )
+    {
         cpu_khz = (READ_SYSREG(CNTFRQ_EL0) & CNTFRQ_MASK) / 1000;
+        validate_timer_frequency();
+    }
 
     res = platform_init_time();
     if ( res )
-- 
2.25.1


