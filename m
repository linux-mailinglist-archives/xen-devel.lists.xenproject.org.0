Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDAEAD4722
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 02:00:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011224.1389585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP8tB-0005JC-32; Wed, 11 Jun 2025 00:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011224.1389585; Wed, 11 Jun 2025 00:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP8tA-0005GG-WE; Wed, 11 Jun 2025 00:00:21 +0000
Received: by outflank-mailman (input) for mailman id 1011224;
 Wed, 11 Jun 2025 00:00:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTmX=Y2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uP8t8-0005GA-S4
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 00:00:18 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:200a::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05d0cf2b-4657-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 02:00:02 +0200 (CEST)
Received: from MW4PR03CA0182.namprd03.prod.outlook.com (2603:10b6:303:b8::7)
 by SA1PR12MB9247.namprd12.prod.outlook.com (2603:10b6:806:3af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Tue, 10 Jun
 2025 23:59:56 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:303:b8:cafe::f6) by MW4PR03CA0182.outlook.office365.com
 (2603:10b6:303:b8::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 10 Jun 2025 23:59:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 23:59:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 18:59:54 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Jun 2025 18:59:53 -0500
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
X-Inumbo-ID: 05d0cf2b-4657-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svPHFzqk/EIaCkn+0Vbp9RE4aEVkiAtvAdgkJ0RVAri3ApF/ZSi7LEYqt6OLwzvksrvzpM5LooGSC/ofxoGMaeFAdjAi1wkcXfxABGJDkqiGNXQpoGAaMa5oDcIBguKEOEiBsx65NaXW1mIeh/yT39K6JuN63BvAqp+FPWEZ7XR8LAqxzcrV7tssFQj/t1G54+vYsAO+2qh05I3MsOUGu0JBEuItmuiiiQ56Y/NRVb8B3iWC5Tb6sw7qZ1vAkD3Y7ayvpK/HDQoVh8R5jPtPQlfmmueLHL2OM1nfDHsdrsZAIxhKc25dLrryzE88Gik43Z/g+cAcYo6pjyOt0uBufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiRXWsYs9NKbPz74XEwoJp5krkiymSCqlV5vnZ6/m7o=;
 b=uIK/+iv/ZtxRLYSTnMZ2arKZPRTIA8fkw8n82zmfgSTdTbSWGyHfwRo+EeiJrTkR7uCupx9C8Gxi6RThsh5pNSjIhlznF/uT5NjETiC4UyWBdx4tU+itSKM9axvEjvkhYjxgw6+oNLLiod4stbf8+t+Qo9yBopmMb3JuxioJeQkcpUKgN3FLosXRoKvMUQInLG1NgxE8Doe/vjSBtI76vvIbCd2ne52rieLwhCqMN3+VkIkg61v6MnVNsaGBfN0t8bQxz9UEujdqac7I+H7ps54Alpya6uNMNCAlfXuls6ie3nMuBKZ4O9bBUMvBG8AMOpCvwRhz0xMvUIccvdXcHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiRXWsYs9NKbPz74XEwoJp5krkiymSCqlV5vnZ6/m7o=;
 b=WsbBfIhLuvz58K4S9fobXKuqZSJr05XBeWQhYKZ0iFf8SPxvs7nDOmPWYZRsxjbxaXOIMeakE4/mMlpTHuh4HxQib7ybe/xG3oes3JdusPU21a9/enzdNZFBGNOILQk1yqfDAi5927bGrO0RVUEulRkcD/OPKHcoZnlJFEnST/4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Subject: [PATCH 0/4] XSM changes for split hardware / control domain
Date: Tue, 10 Jun 2025 18:57:33 -0400
Message-ID: <20250610225737.469690-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|SA1PR12MB9247:EE_
X-MS-Office365-Filtering-Correlation-Id: 98ccdd92-7c49-4751-6ac2-08dda87ae622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UIlqfeVp9thvH/sr+QBmoO+3TSz8SpJ1URwjt4ct9SQMRG1Z1RYD6K9FVVxD?=
 =?us-ascii?Q?qtzsxNmVdlAUBI85QBpK8q5amU+O6mn3q73WJIfW9idQ5vG1RfljY3eb0H2+?=
 =?us-ascii?Q?rXhxhYLoPdWrSFxFdzrhWKEo9uo32BR3DGRQVmQxbV1fa57Pb3Mo9/r8TA1S?=
 =?us-ascii?Q?bv4T86cg6GoWdXgZgauFj52vz/sKCwZPzkBF4EZIihIR8g1o33LUJfvs0mS7?=
 =?us-ascii?Q?4HkDPOhxzeDWp09ZD1+nylxduHP/TZN8srzbBE+x/YSONhhgT0EBo/AGNZjX?=
 =?us-ascii?Q?Elh0m58grOblp5NRrJfS5mq0MlSvnVFX7qwAH+8ltcyPBijkKCpq8ak9Nem0?=
 =?us-ascii?Q?HHdfXBNmmTR9Hjhg5NAiiA/n37tZKus+RInVLh4bR9gSVjgfA4xb7JMKHKSS?=
 =?us-ascii?Q?FnMTIdcrLmVk0Os9aP+pTebJuoGDtdtqFGXva+xlaHhdiCfWsC5Mr417Bsp1?=
 =?us-ascii?Q?EY0Iml5XIF5bzRolU6gq5NdmpLtP36RKFM4xGih38jmgzYB6dgROfDBaGODe?=
 =?us-ascii?Q?p7ORXXnfLOPtlNVT7CZQtWtIyMw3OjPlyNdv3TGQDUESOJ97xncu+4BceOqG?=
 =?us-ascii?Q?OQh2M1yufbLDIKyF4OADfBMJIFrejnWXIqQNCBhOU1LFdB0gocGIeMQo7ZQg?=
 =?us-ascii?Q?yDOrRetNdQX1kIMtmgwB9gfwdnW5Fb21zMy1K15opdeDiVfyg8NB5nAUgMko?=
 =?us-ascii?Q?cgRZAmmiOwuPvgw/wdSDLwchfzJ9ykvKN4EHhToQ0LJrZXnNl22KVAxd9BP5?=
 =?us-ascii?Q?QJ0Zsb0CX+O4a+w7ZlnrAffJTP+FoP/izDKh1v390x8OU8duWIoQtoWcmhlz?=
 =?us-ascii?Q?ZLSB5FKPP0JfipXUVuzxxHMC5YL4tKCZ0jMcowXpzOmzfoJom/n//SVqjAl+?=
 =?us-ascii?Q?69KAiDOBKSkqeksPOUiltSZEESwcGf+8SBQoPOXnimYbJhcwsE2UT7B5mPm0?=
 =?us-ascii?Q?QCvtRyB8xUgRpE2OvuGDrZrBxNIZYibxgQ8sjixHTzc2axxJZxV6DJLXbd99?=
 =?us-ascii?Q?qzPKRnDTbBPKFihFDZVBjJcWEzRYgsfoR36A5CmfgXiM7uYqsbrZ0reR5QKB?=
 =?us-ascii?Q?Vwi6dRa+EDnFFTaqPFoGn2ae0zYbInXc2wPitxuxaDx/godDqq5klDjjF8F0?=
 =?us-ascii?Q?ON6bgVY1Y/l17APONXaJIrbAXIjp6/ffMrAK0vjLB9ZuEVKY7XqprhaJvGAa?=
 =?us-ascii?Q?1t33h8F3XuU4/whHhtAZXz5k90hkPE/mlQ38P2dwb+P9KCNH8RbxR+bKuR5C?=
 =?us-ascii?Q?hcXKEjJLHFGGruUL6B1hpafVNDO9ZhV2yTB/Jj1NOtSul2Y5ImRLQ5Pp5hVd?=
 =?us-ascii?Q?PX2X/Y65KX3uAG5Gj36p08/hgv/Z7vcCBmaUcysBFIqMOzcHfZgpufris5AA?=
 =?us-ascii?Q?trz6TnLhbgwPyRs3HN8Xa9XuozAGZZU5uyUcRraU2FJYqejRUAk1tuutCUlj?=
 =?us-ascii?Q?TM8WtiQsFoLj5N8jqbnTm/X0ih80lVV0NztAydLU83ex6Xy0n9Tl8SJPzNCV?=
 =?us-ascii?Q?INwH+diupkkDkyfxhFtpMQgWBm/yg9MrtPFe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 23:59:55.5709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ccdd92-7c49-4751-6ac2-08dda87ae622
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9247

Theses are the broad changes needed for a split hardware / control
domain.

An earlier posting gave device_model privileges to hardware domain.  For
this posting, it was split out into a new capability.  This way the
operator can choose where to run the device models without making the
hardware domain have the permissions.

The first patch add XSM_HW_PRIV for the hardware hypercalls.  Unlike the
first posting, the control domain can call these hypercalls even though
it doesn't really make sense.  The idea was to keep the control domain
all powerful from an XSM perspective.

SILO is changed to allow control, hardwware or xenstore to service
domUs.  Xenstore and hardware will use grants for PV interfaces.
Control wouldn't typically provide PV interfaces to domUs, but it is
given the permision to do so.  Again, to keep control all powerful.

xsm/dummy: Allow hwdom SYSCTL_readconsole/physinfo this is not strictly
needed.  xenconsoled could read Xen's dmesg.  If it's in hwdom, then
that permission would be required.  SYSCTL_physinfo is mainly to silence
xl messages, which are mostly cosmetic.

Jason Andryuk (4):
  xen/xsm: Add XSM_HW_PRIV
  xsm/silo: Support hwdom/control domains
  xen: Add DOMAIN_CAPS_DEVICE_MODEL & XEN_DOMCTL_CDF_device_model
  xsm/dummy: Allow hwdom SYSCTL_readconsole/physinfo

 tools/ocaml/libs/xc/xenctrl.ml          |  1 +
 tools/ocaml/libs/xc/xenctrl.mli         |  1 +
 xen/arch/arm/domain.c                   |  3 ++-
 xen/arch/arm/platform_hypercall.c       |  2 +-
 xen/arch/x86/msi.c                      |  2 +-
 xen/arch/x86/physdev.c                  | 12 ++++-----
 xen/arch/x86/platform_hypercall.c       |  2 +-
 xen/common/device-tree/dom0less-build.c |  3 +++
 xen/common/domain.c                     |  3 ++-
 xen/common/sysctl.c                     |  2 +-
 xen/drivers/passthrough/pci.c           |  5 ++--
 xen/drivers/pci/physdev.c               |  2 +-
 xen/include/public/bootfdt.h            | 12 +++++++--
 xen/include/public/domctl.h             |  4 ++-
 xen/include/xen/sched.h                 |  9 +++++++
 xen/include/xsm/dummy.h                 | 36 ++++++++++++++++++-------
 xen/include/xsm/xsm.h                   |  1 +
 xen/xsm/silo.c                          | 10 +++++--
 18 files changed, 80 insertions(+), 30 deletions(-)

-- 
2.49.0


