Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB5FA559F5
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:41:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904181.1312147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJte-0005tR-BY; Thu, 06 Mar 2025 22:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904181.1312147; Thu, 06 Mar 2025 22:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJte-0005qD-7k; Thu, 06 Mar 2025 22:40:54 +0000
Received: by outflank-mailman (input) for mailman id 904181;
 Thu, 06 Mar 2025 22:40:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJKN-0000Ss-EF
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:04:27 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2413::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2c49f23-fad6-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 23:04:18 +0100 (CET)
Received: from BN9PR03CA0144.namprd03.prod.outlook.com (2603:10b6:408:fe::29)
 by CH3PR12MB8460.namprd12.prod.outlook.com (2603:10b6:610:156::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 22:04:13 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::63) by BN9PR03CA0144.outlook.office365.com
 (2603:10b6:408:fe::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Thu,
 6 Mar 2025 22:04:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8549.1 via Frontend Transport; Thu, 6 Mar 2025 22:04:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:13 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:12 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:04:12 -0600
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
X-Inumbo-ID: f2c49f23-fad6-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTiOTT6PtE62i9SehkDuO0BexDXnaJy1IM1A2PV6IapK7+eDFbtSMrC6veKheDY0eZ+Ak8vIWw8Sp+qZC+C5KO3ug2idypjhyrNCwqK2M0Mytmxd4OtH0d+gU0F18VJwQiWxnsIAG9vU7k/eIi/gItJ8iQeZy3hZmSTzUEraSxPqAHL4g+vH3yWc5AwxZ3EfOHGEuNX3oEb9ecWGDbPaaUbLs3Rp6v8EUmyFBFk1xZDXsJcVEyJuIO1HUZ6vJPuBzXjhfkF3z7YkFn8Tutt/VND+j8cQNq18Ujv9yifuTEbPWrOTkPiWKKNjiehGbjyNYKqkuN7U/k2b2EJweWvhrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCnSvUEbBl2NRwW+E2RfVK1yKiEOuzZqq9MfzzVMA+c=;
 b=EOPG8I5kR39/xfSgLN9cl1x/ks5T2pTyqAJf3fhFUReXBRboy39CD/ogu7kB+YdD4afR/3x0LH72hXQL+NTa4IA9CQG+Ru1/cohS8glCdhbwrXLtKxt4Yc+FrJcrYZ38T4MNSajJMqIgIddKMuvQRdAqhZVHvOpJ+7sNHn6zJErYBMaoIi0zolv7rADVOTGBksGjoWHJw6W75iSBj8NnFakEPBgSsYd4lHESLC1PmQJ8CD+iEamAFLK33yE6jSdCTGWRh5LwTZFMBFmE+d7WNImV1gmJuVSOdNjtJLgtDRjlcwH3b8A5Q1WqoGhcySOBlm8fH0QlRJhQeF6t00Y1Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCnSvUEbBl2NRwW+E2RfVK1yKiEOuzZqq9MfzzVMA+c=;
 b=OBHLwaMIelF+ktQM50iUT0WRF+p9eVUqOs1rJuwmUg4ALjw99VX/czOhZYHu9yUMq5lF6N+Cl0zU9z5v8D6++dUzx/BsUXjf7yRhjgUYiBYNTmIxn+kjVUazEDKGNbL+vr6g3AoBKUC8CiPQajP5edy4xVEWr5IoUL2j85+26jw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 21/23] automation/dom0less-arm64: Use double quotes
Date: Thu, 6 Mar 2025 17:03:41 -0500
Message-ID: <20250306220343.203047-22-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|CH3PR12MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: 578b3c3b-cc61-49c7-435a-08dd5cfad4b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YMhgqCOpBckchAaG3xcFDCxOWkQocoq2Gr8QS7SdMJfqo/hedIcEspjx9H0G?=
 =?us-ascii?Q?EXJi5HRD2xnenAH7mfYlGuhaeakrpknpspXN6Ho7OK211cFOMz6DdzhoDoTM?=
 =?us-ascii?Q?u595AW/25ws6ohPuKNF4U7brR3VWhIdF5MCwH+aLZbq1k3kdV3kpHTO2jWwW?=
 =?us-ascii?Q?ryMPGthG3jrWqieahLjIgJbiM9S7lGq22dQORr1CZXTVJAMsdb06NRsYEYpm?=
 =?us-ascii?Q?l89mpdhqQEzhNw82+FYxD/nhhT1MZIUi4JioNVV71FKKTWQFIKnmmU3/Qf0I?=
 =?us-ascii?Q?ibWfpAFxHuIdUoUP130Jot+uVV2qMX5hQ9rp+QVSLNGOIfSHIjsHGO1ek36p?=
 =?us-ascii?Q?vdayoJNx26+tR6FVu5ETjb1/DCLSzTvXso/CA2m4IX6p5xzmoNo2EJzhwi9w?=
 =?us-ascii?Q?6UriW4ArpdVjSKY++YFoXI0K28GGwtfu4UF2abV58at1uXxaFyeRZIyVpDJw?=
 =?us-ascii?Q?fqaBjLnNTaMbuZMhVrWjLqnAbgyhzndUM92GOllNS1Dxn3+UHCVzRUlnhnqR?=
 =?us-ascii?Q?OJt2g42+GZ4kbt3YXTqYGPR9gm46saP12ckDjaF5pUTlhMJvZdFT1/DOJx9C?=
 =?us-ascii?Q?ma0Sb/9HI9ZPutNYjjo2oigDz6M3vHP90ggBUrma379qJjIoNkxU6iDN8WU/?=
 =?us-ascii?Q?Qiph/3xAHnyZa+O5BxhEWjJhYnOczlB20Q3Z4x2+7SNpdZqZ+metVC6O4dvB?=
 =?us-ascii?Q?GKkTTtx4KOK69hUf2GOgvpiL9EBGtApzWy/n+jTIDg+xN0sDl8jvK3pM6KkD?=
 =?us-ascii?Q?Ra29fxcv40yg7DK1dOJTaLtCzgHsqNhHn2QyyDWN1hxwQaSCDCowktjlAMH6?=
 =?us-ascii?Q?CWGoq1BCheiFqdlkSAegERn2vG7grlTD1LfC7mXoDbSg4QHpvMLna9dRIgEr?=
 =?us-ascii?Q?+PJD4S8F8w/Qlrhm8jsLflkOwV3QrWLyCBuXOrvxq8wi5B8lpZw0AoymelmJ?=
 =?us-ascii?Q?CC0NCnfpp7N6sgI29GvRHs82PGv6Rv0bTBeZX27t7VoN92MtF4MqKvvcOSwG?=
 =?us-ascii?Q?GlKx3+XQcPQ9zag9kr6zFyV0z+aXBjnGz9JMBt6RvqI7yFxMCVMpFob4PDaI?=
 =?us-ascii?Q?Rr6x0P31Fh8j8yZBB1qr7fU7IAH0drzgD/x3BqvKqDfGor1jSrzrj3ARjiV9?=
 =?us-ascii?Q?EBQxZ5yZLEUg5hrsdIzAZqHULm5AY33ETHrCrk4o4+ZawMik1GpgKHGprpU+?=
 =?us-ascii?Q?7BpJWArp9uKKawFK3bomL1Ob5w/I9DR0E0G0igxHXpHry21bDAUu+LLwsoqf?=
 =?us-ascii?Q?Kb6VSfLGD5q2KrL/KVe34xIl6n+8v9kPK4LRqYG5rUSkYljuo6JiSJrG3ziT?=
 =?us-ascii?Q?V6qt1TBOtbhwZhcsfgQByE1PvxPFHlXy5mJ520x+eyIeqUZ0ycUuER6GkIlr?=
 =?us-ascii?Q?tFMLSXb5R1oYZMSy1YJVoAz25o7Wkx/JXIpEh02sPITQndv/ami3NHnLpyoj?=
 =?us-ascii?Q?YsYqwBIWmusZYr0AnodGFvC79iCMQo4/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:04:13.6501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 578b3c3b-cc61-49c7-435a-08dd5cfad4b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8460

Use double quotes so we can change the contents of the base imagebuilder
config.  Specifically, we'll want to remove the dom0 entries for a split
hardware/control domain test.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 .../scripts/qemu-smoke-dom0less-arm64.sh      | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index f72d209361..439e07c90f 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -147,26 +147,26 @@ find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
 # ImageBuilder
-echo 'MEMORY_START="0x40000000"
-MEMORY_END="0x50000000"
+echo "MEMORY_START='0x40000000'
+MEMORY_END='0x50000000'
 
-DEVICE_TREE="virt.dtb"
-XEN="xen"
-DOM0_KERNEL="Image"
-DOM0_RAMDISK="dom0-rootfs.cpio.gz"
-XEN_CMD="console=dtuart dom0_mem=512M console_timestamps=boot"
+DEVICE_TREE='virt.dtb'
+XEN='xen'
+DOM0_KERNEL='Image'
+DOM0_RAMDISK='dom0-rootfs.cpio.gz'
+XEN_CMD='console=dtuart dom0_mem=512M console_timestamps=boot'
 
 NUM_DOMUS=1
-DOMU_KERNEL[0]="Image"
-DOMU_RAMDISK[0]="initrd"
-DOMU_MEM[0]="256"
-DOMU_KERNEL[1]="Image"
-DOMU_RAMDISK[1]="initrd"
-DOMU_MEM[1]="256"
-
-LOAD_CMD="tftpb"
-UBOOT_SOURCE="boot.source"
-UBOOT_SCRIPT="boot.scr"' > binaries/config
+DOMU_KERNEL[0]='Image'
+DOMU_RAMDISK[0]='initrd'
+DOMU_MEM[0]='256'
+DOMU_KERNEL[1]='Image'
+DOMU_RAMDISK[1]='initrd'
+DOMU_MEM[1]='256'
+
+LOAD_CMD='tftpb'
+UBOOT_SOURCE='boot.source'
+UBOOT_SCRIPT='boot.scr'" > binaries/config
 
 if [[ "${test_variant}" == "static-mem" ]]; then
     echo -e "\nDOMU_STATIC_MEM[0]=\"${domu_base} ${domu_size}\"" >> binaries/config
-- 
2.48.1


