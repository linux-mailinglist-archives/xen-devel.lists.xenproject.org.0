Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43265ACC3E5
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 12:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004148.1383808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMOUl-0002fs-Kk; Tue, 03 Jun 2025 10:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004148.1383808; Tue, 03 Jun 2025 10:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMOUl-0002d2-Gn; Tue, 03 Jun 2025 10:03:47 +0000
Received: by outflank-mailman (input) for mailman id 1004148;
 Tue, 03 Jun 2025 10:03:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Vtc=YS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uMOUk-0002Ov-AP
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 10:03:46 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20617.outbound.protection.outlook.com
 [2a01:111:f403:2417::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09577e34-4062-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 12:03:45 +0200 (CEST)
Received: from MW4PR03CA0197.namprd03.prod.outlook.com (2603:10b6:303:b8::22)
 by MW6PR12MB8916.namprd12.prod.outlook.com (2603:10b6:303:24b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Tue, 3 Jun
 2025 10:03:41 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:303:b8:cafe::e7) by MW4PR03CA0197.outlook.office365.com
 (2603:10b6:303:b8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Tue,
 3 Jun 2025 10:03:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 10:03:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 05:03:39 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 3 Jun 2025 05:03:36 -0500
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
X-Inumbo-ID: 09577e34-4062-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lj7nH4ln/xnasCYmjPA/3/b+buD87kS1kHqC/UyMW887BjKuNA3xEuAHcL8757b0F/3+B0X4BKr+298loywzGDMJMzXChTls+OsUzCAahjiuI9MZSV3RSMOrgf2EePNZUB9qJYVaZSi5m1OwuJrZJxWr7NBknHElsTqhwFZQpij9L1cH1apXIVhMVKzkPDuDlqJWw8LFAWg4KTnvzspt5OJK4I7CdOD6XqTPNgJURzBQRuiRxsXPBksbFKcIJHtoJD5oUxAZ5H1vaL8id5KaJdIthkx65G4hv6nmCLBdkf3POYWXsfE9V/KuVf44Yn2ava8xoyIAugxJAjePBnDTUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iiTh8ZbLpUcLRcsbatZFM8R8LIAbDcOLOjknhBVFGw0=;
 b=W8a953zJNFMcwp4CgFIDNK0jUdRBRyTSgo7crIKnTA+4GkjxwU67n44sq/nyEYEExOO2EuDwG++sRG2etA6fYjFJZLg8r1lIcDrsyQixLw8aQJ+BZW5ZckFWgoa4BGxYILkgldBsO6HoqZmnckScCEkJI4bPw7hsLbVsnfH0gOYhdfKcZME0fRwJcgJsP6C86yd9YGtvb39OicVfmq4by+onLzfehJ8t1gtbAJa7FkPcwWCAHZ/wZpWzABkCLY49ZZEbekE70/WLoAsn3AD/GVAqa2E0DD4Fm7n3KxGLfsbl1YCQMTgQhHV802McSSPJtWRGo42XCh4v4MY2KZNkSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiTh8ZbLpUcLRcsbatZFM8R8LIAbDcOLOjknhBVFGw0=;
 b=KZc/Xbl+pEl3I9qZZlS/ijsUkfsZ10YAHbKz9lZw5rfM7KeUfyFIjlewCOdNq/WEyVryzPu9mgWize1HV697AU6PefwtaiYMNKtZ00y8bDnriRYVhm0n1PQRnfHKix2zS0oQHLUxzeRsY5/WD4RMUkV91Ow4Akfnm/7N4cRtIms=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH 1/4] common: Drop unneeded Arm dependency for static-evtchn
Date: Tue, 3 Jun 2025 12:03:26 +0200
Message-ID: <20250603100329.149851-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250603100329.149851-1-michal.orzel@amd.com>
References: <20250603100329.149851-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|MW6PR12MB8916:EE_
X-MS-Office365-Filtering-Correlation-Id: d99e236b-1e6b-4bd8-1022-08dda285ea5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?73xOxYN4dK76/9iTgvH4XrgzKSDVRBtDk4MLjQjXZdB/wyT928P6kB6JEWgD?=
 =?us-ascii?Q?T9tIkQWVWqegdZ80EthBmh7huKSBhb5EUQ2+aFuGmZUd4IzrOBqvdehtl+0V?=
 =?us-ascii?Q?BnKF7TnnSAAyi505ZbHH8MQqPzg0Ex7UZxSdisYDHmvmFCpL9oNG5QaCDR0L?=
 =?us-ascii?Q?tt1WTnfnZQsafaKhx0lejizFmCebKli1ibl4tNHdUeO+L0NqqW9wWQJyL+8z?=
 =?us-ascii?Q?sMkrp7WxLWjWemSFvaQAHkTRBhqXb4j+gs1GdugfxCvvAexGuwm/dxmeL4Ah?=
 =?us-ascii?Q?00ozQLqy6HsEO3YSAE6AgzJuHmiQSaljJ6P4BvPjzeQKrQ/jqzNvFDhbIf2w?=
 =?us-ascii?Q?mje+2vWB8uO61CWw6TnFKi9NUEafKHzr/utJUdV5DBYoPrMiSpMIHMgGp2LU?=
 =?us-ascii?Q?Q2P84zzkeDcJeezvj29E0tigl/E2PBV4W6HJHB3X9MQbt2IQ+QFbdqF4b3Xs?=
 =?us-ascii?Q?4AJljU39uaOxwMuwr2eZpG3wm7oLcJkVPfIzD53tc3AHK6gEesVcEt0bVv5W?=
 =?us-ascii?Q?6UHOnxnsYum2k0KTFE7HcS9yBjsVRvqYx8brznT0teptH/Q+6o0j2XH5WEsA?=
 =?us-ascii?Q?DdBTDlWnlNFWGwyB8mZVyQ7zk4h6zlQDx2YHp9E5galxu9s354pFZr0FPHtI?=
 =?us-ascii?Q?E8pbIft8pRyGcrq4ZYeyfpE3LJ8/EK3jUQFFgSo4+YoEnz45asCQt8wv+dn/?=
 =?us-ascii?Q?g91X/CusDXmJeYfUnywDqSySrSff728ndfdU22O8SlPB3cUDJADa1PqC9Vdh?=
 =?us-ascii?Q?A0dqkDdzyJ0Gj7iosJ+5x3rPUQzvmHCpZsz/KbFZTBrraDynYReBSrEZAHpy?=
 =?us-ascii?Q?ImsQUJa+rMj0umaR1SeJuuK7W8T4haRNG8p2qs9n3CCz0AjYO2R/PW7STBb9?=
 =?us-ascii?Q?YmiHeE2P58QCjeLUCNgcTxRKqmOAZ3snPRTQ+E/VdpaH10t8ujzBY2Zq6d58?=
 =?us-ascii?Q?iju76n68qdVpqdujafphFGepxFza4mET3VuQnr3KYZ+HajuJtQhTlr44yNAa?=
 =?us-ascii?Q?4b+q6fhfx3S61qv7wa0Vy4gmiBuqls0twIlKWS2NoR4O36q+6IGo7WDKau3r?=
 =?us-ascii?Q?kgvIoEZtdn4qGe3QpHbPnD/5SxRF+Xbnjb4OX2ZebU2rBQPgwFP6B5LmlX/b?=
 =?us-ascii?Q?v+5txITqVx4L2N5lHSDrz/VcpKn5Vhxjl1dz8Rq+T142Mtc9EkWoZ1OeBte6?=
 =?us-ascii?Q?XEXoABLyx7sC3sE9FiJlGn0/nOnVfDRHBRJDwaT3ckUzSi6Q5VK1FC8p8ZwX?=
 =?us-ascii?Q?P6x34hQqWP3idI3Mp6LyenFDcnjTgt1SSMRk4ODwpkFu82BdPu/hzqO3s36j?=
 =?us-ascii?Q?XMjDX6qoC1UtzjMt3Nsy/Ztv9cQ4VtlM+muVwXTF9K3cYbqD5mGkateCPbKG?=
 =?us-ascii?Q?GCnPvmzrRxqSz+vo6vKiY8BLIti7ycSNXneiifUvz7V4U2nwRKTUuqO+/LFu?=
 =?us-ascii?Q?un0MvO5WyOd45Rl1WMgfyAcbHtA0wN6g+Bvkv+s5CFnwvnM7yUL6ZTf6oM1d?=
 =?us-ascii?Q?NnnTty7AZ9M/SYPgc36t5pJIfESFEqSkawgm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 10:03:40.1663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d99e236b-1e6b-4bd8-1022-08dda285ea5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8916

DOM0LESS_BOOT is sufficient (only Arm selects it today). If needed,
proper arch dependency can be introduced while adding support for it for
another architecture.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0951d4c2f286..7ecf5a80315d 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -164,7 +164,7 @@ config STATIC_MEMORY
 
 config STATIC_EVTCHN
 	bool "Static event channel support on a dom0less system"
-	depends on DOM0LESS_BOOT && ARM
+	depends on DOM0LESS_BOOT
 	default y
 	help
 	  This option enables establishing static event channel communication
-- 
2.25.1


