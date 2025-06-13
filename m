Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D16C2AD91D6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:49:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014626.1392734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eK-0006u3-DW; Fri, 13 Jun 2025 15:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014626.1392734; Fri, 13 Jun 2025 15:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eK-0006l7-6M; Fri, 13 Jun 2025 15:49:00 +0000
Received: by outflank-mailman (input) for mailman id 1014626;
 Fri, 13 Jun 2025 15:48:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=utXz=Y4=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uQ6eI-0006ch-O0
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:48:58 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20627.outbound.protection.outlook.com
 [2a01:111:f403:2413::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea1b56da-486d-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 17:48:57 +0200 (CEST)
Received: from SA0PR11CA0089.namprd11.prod.outlook.com (2603:10b6:806:d2::34)
 by DS7PR12MB6262.namprd12.prod.outlook.com (2603:10b6:8:96::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.22; Fri, 13 Jun 2025 15:48:52 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:d2:cafe::48) by SA0PR11CA0089.outlook.office365.com
 (2603:10b6:806:d2::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Fri,
 13 Jun 2025 15:48:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 15:48:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 10:48:51 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Jun 2025 10:48:49 -0500
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
X-Inumbo-ID: ea1b56da-486d-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHE8QqG37/utkIBi5h2dNmoVDQK1juf9b9itrRCB/dSG0CDEedyUycxq2Qc18sNLvYbfRk7pBPEWO0w1uiGrA+1/L44wRVNeNLMV+3P7nVwCWysV0nEf+W53/YpLQeo8hf2nqF9zV5qBGH/klN7Za25BJ0lqDypBKw3+m59TvpGoRWrM9TAdKJGqo0zT79DzQovcMJnfvZqmGkXiSAmbfQV4sjWzXk3antB8BDt9xp6kP+VrdEVyPE1cs/BTlCUjNAYXjdd+qfXQRtZD5yGlivB3I6eaNyREI3hNKAu7jSDnUBKnMxWPHDcqH455ifxtpH9XmywP12TH1t5A9T8qJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9v0C6+RsIX+l4808sG+MpH7zRloooqS5T1YfefHTJCo=;
 b=FPCSPt2OxXLDxBoJ18EbZZy2ZXOGzdFHy3jzhS09Z5kZqKb4L+1en236eaDgs3QryMj5d9WH9UE1W7Efr3ADDle+akE8LNDCyWtEdZq4GBVgaubsu3/3oYR7VXaAR0ZZ5rHfBJHdDeKhob2QSOh6BU20WHgMk8uhAjbKiIMT2s3wJo9Dgtm1dOvqGBa4rvZ+7+PkwwE/HUjgcRsaO0S6Mec089vmemVZcrEaC2ldQcuWaxCS4wcJ/4QKAgDMDcZV5D58z+cviQ7mC3mmwrOwjB2mM8UP1bzfzT41kXF9fB00r/SdOJP+PLEEKQHSfesrmAzc0JPcnWqjmHgKUaEp4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9v0C6+RsIX+l4808sG+MpH7zRloooqS5T1YfefHTJCo=;
 b=ykIq4FdbVZs8108NcomX91diY4D62WsMie+PmanXmz7EOqNmsyoR21O0Xi2J+La2KPvt3wf/71M6iCxXNgCEFP/WUz/3nAy89egxigwMlHkvPA3zOeomCeuv1V9Zxvm8iafk34feAxioMjVdh7B+OZDyA4EGQPX+nNppQS68s+4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <stefano.stabellini@amd.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v8] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
Date: Fri, 13 Jun 2025 11:17:30 -0400
Message-ID: <20250613154847.317979-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|DS7PR12MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: ff5376b7-88b1-4d6b-ad15-08ddaa91cb7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uAC+BVTKk//tf3FWsnvCngdHobzTluGT/AivdNgPXMG0t69izv73n6cfMk10?=
 =?us-ascii?Q?lrmYN/0/8UfAI1cha8vdzwyaLDuUVlheWueeB88zEv7BPwGpOh13SvJ4Pwms?=
 =?us-ascii?Q?ih9Ah7sOCmlRIWMTYhtMZOvhaaE62MtA0u49FgTruR5lEkP3lKpNNhy9amKE?=
 =?us-ascii?Q?A56FcQk9L9ZwCiKoDDK9N+6daK4zjeVlGlY9K4y7AstJIDcvL70cziaG/GJW?=
 =?us-ascii?Q?7IU3pV5skxt1jMP+DG67hQIl3sSYP6rNI5yhXbcWjledOYVyGrcAG0cE4Tpe?=
 =?us-ascii?Q?8eY+t3O3UFJQobwPWUV/v/0Vw/3A6dTuvMVAfE7uDWVEIKpyjJNIa/IgquxZ?=
 =?us-ascii?Q?JUWvmLOKrNU60qYx+fc452q4LCSSHRFJl7OB/+O0Fp40TDFSw3ah2xsTvy/h?=
 =?us-ascii?Q?D8Rkik08REY0WFLD8rroj70FrgfKN3dbV2uBRhUua3vOxsNcVRUBcdw1gpbq?=
 =?us-ascii?Q?eF9/mh1u3HQXEFlTxzt0vZhXyR+NMaSu11EgAbgl3gU/HHBYg4eJdSgJEug0?=
 =?us-ascii?Q?XhElzZZOX9/kWWjVpTERwBl+R/uSLXikIKyC83gJvdKLt0jPd1pZbtiOLpc4?=
 =?us-ascii?Q?llkeiPlvPjTes0mbA+8/qELaYq8ApTX/ie/2mFDO0nwYIeMCGp7DrLxbxF7Z?=
 =?us-ascii?Q?cnx/6OrRuj8ml0DIJDVsLX1iHLAspgDKM2hUQQsx38Mswaj6aTAvLJvJFngV?=
 =?us-ascii?Q?RfuGX9SCMbg8xBZRtUobRZbn3dDBbOjUI+fFUH+xQcEnySPU+6eVv51xx7ws?=
 =?us-ascii?Q?+FJWX2ZgYeEF8YHFSqnppK7A5LxlRoLDVJSiIn0+O2mp/d2/qFmGOGli+UyB?=
 =?us-ascii?Q?x6I/KHeIlkcDme2AOMAW5NGQF0ifSSRHcO2kESO/YXUx5asE0f+0OOTD4+E9?=
 =?us-ascii?Q?VBftRJTkHVoAOT7DotROEzzR9BvdhUUEFhHeFjjEZQAfngMQFlGfxcoFmG30?=
 =?us-ascii?Q?iUiOnJ1J10NFQGQ2z93T7Pgtej+4GacexARrZp3Rq8p0GqM8pMIPM2W0yYq8?=
 =?us-ascii?Q?BAY197JyfcMFz/0yPAVU4rj62gigrY/dJ9kdHLzyK//hEsPiUlWGgIqbNdye?=
 =?us-ascii?Q?GsGt8LRQUIvHdkoXKEGzm8SXLrdhIasBPkO4Xf3KDg0GNv8GBDZiLEm7nmot?=
 =?us-ascii?Q?FKaK8yuVhl6eqoDBr7Z5XkfvAgzlRbiU6GU1BB+/zUGJMrYq0SCUE87lrnJS?=
 =?us-ascii?Q?0f5g+j2M+5GcLta8vljOVYRIaGP1XD2My4i1qSls3iQa2dmAGq92eIU10wWJ?=
 =?us-ascii?Q?eHMGxM+OZcDEQdY+bs2CK1i+eIV8zbxntnqJwT8u52oXIigFJhjBw9pthvE8?=
 =?us-ascii?Q?O99r1/BQzSIhRoFxlFlR6Y7blewLU129+GEBd+/JcveSyUIjMjEsEeVmJ6om?=
 =?us-ascii?Q?Zm05Eap9yVtCXi6qdSzyGeLme9w0wo9gONI24r3STEYRMHmb6CVsIDR/fe5g?=
 =?us-ascii?Q?eMUMmmZLyV/qJqPXdzMvxEZE3wEdSYODn4cgExJGxyY4wKTCyKkxvQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:48:51.6600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5376b7-88b1-4d6b-ad15-08ddaa91cb7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6262

From: Rahul Singh <rahul.singh@arm.com>

Setting CONFIG_PCI_PASSTHROUGH=y will enable PCI passthrough on ARM,
even though the feature is not yet complete in the current upstream
codebase. The purpose of this is to make it easier to enable the
necessary configs (HAS_PCI, HAS_VPCI) for testing and development of PCI
passthrough on ARM, and to build it in CI.

Since PCI passthrough on ARM is still work in progress at this time,
make it depend on EXPERT.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
The alpine-3.18-gcc-arm64-randconfig CI job should pick up the new
config option, but if we wanted it to be built more consistently in CI
we could add CONFIG_PCI_PASSTHROUGH=y to one of the arm jobs in
automation/gitlab-ci/build.yaml, e.g. alpine-3.18-gcc-debug-arm64.

v7->v8:
* remove select HAS_VPCI as HAS_VPCI_GUEST_SUPPORT already does so
* move select HAS_PCI to HAS_VPCI in common
* move remaining selects under config ARM_64
* add HAS_PASSTHROUGH
* remove "default n" since it is redundant

v6->v7:
* rebase
* send patch separately from series [3]
* add HAS_VPCI_GUEST_SUPPORT since it's upstream now
* drop Julien's A-b due to changes and was given several releases ago

v5->v6:
* no change

v4->v5:
* no change

v3->v4:
* no change

v2->v3:
* add Julien's A-b

v1->v2:
* drop "ARM" naming since it is already in an ARM category
* depend on EXPERT instead of UNSUPPORTED

Changes from downstream to v1:
* depends on ARM_64 (Stefano)
* Don't select HAS_VPCI_GUEST_SUPPORT since this config option is not currently
  used in the upstream codebase. This will want to be re-added here once the
  vpci series [2] is merged.
* Don't select ARM_SMMU_V3 since this option can already be selected
  independently. While PCI passthrough on ARM depends on an SMMU, it does not
  depend on a particular version or variant of an SMMU.
* Don't select HAS_ITS since this option can already be selected independently.
  HAS_ITS may want to be added here once the MSI series [1] is merged.
* Don't select LATE_HWDOM since this option is unrelated to PCI passthrough.

[1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commits/poc/pci-passthrough
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00660.html
[3] https://lore.kernel.org/xen-devel/20231113222118.825758-1-stewart.hildebrand@amd.com/T/#t

(cherry picked from commit 9a08f1f7ce28ec619640ba9ce11018bf443e9a0e from the
 downstream branch [1])
---
 xen/arch/arm/Kconfig | 8 ++++++++
 xen/drivers/Kconfig  | 1 +
 2 files changed, 9 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 3f25da3ca5fd..95a2cd3d006d 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -8,6 +8,8 @@ config ARM_64
 	depends on !ARM_32
 	select 64BIT
 	select HAS_FAST_MULTIPLY
+	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
+	select HAS_PASSTHROUGH if PCI_PASSTHROUGH
 
 config ARM
 	def_bool y
@@ -258,6 +260,12 @@ config PARTIAL_EMULATION
 
 source "arch/arm/firmware/Kconfig"
 
+config PCI_PASSTHROUGH
+	bool "PCI passthrough" if EXPERT
+	depends on ARM_64
+	help
+	  This option enables PCI device passthrough
+
 endmenu
 
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
index 20050e9bb8b3..d42314bb1904 100644
--- a/xen/drivers/Kconfig
+++ b/xen/drivers/Kconfig
@@ -14,6 +14,7 @@ source "drivers/video/Kconfig"
 
 config HAS_VPCI
 	bool
+	select HAS_PCI
 
 config HAS_VPCI_GUEST_SUPPORT
 	bool

base-commit: 229a11aac7bf52f4532ab732ed10f173bd332cd0
-- 
2.49.0


