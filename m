Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE027ACD87A
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 09:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005148.1384662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMiRV-00089n-P4; Wed, 04 Jun 2025 07:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005148.1384662; Wed, 04 Jun 2025 07:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMiRV-00087H-MJ; Wed, 04 Jun 2025 07:21:45 +0000
Received: by outflank-mailman (input) for mailman id 1005148;
 Wed, 04 Jun 2025 07:21:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUNH=YT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uMiRU-00087B-KE
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 07:21:44 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20611.outbound.protection.outlook.com
 [2a01:111:f403:2417::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e891875-4114-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 09:21:40 +0200 (CEST)
Received: from DS7PR05CA0052.namprd05.prod.outlook.com (2603:10b6:8:2f::30) by
 CH3PR12MB9028.namprd12.prod.outlook.com (2603:10b6:610:123::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 07:21:36 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:8:2f:cafe::57) by DS7PR05CA0052.outlook.office365.com
 (2603:10b6:8:2f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 4 Jun 2025 07:21:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Wed, 4 Jun 2025 07:21:35 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 02:21:35 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 4 Jun 2025 02:21:34 -0500
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
X-Inumbo-ID: 8e891875-4114-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lc0xrM6hvltbN3g003K9d5BD0/dr1w2+JzmkWwfo+Y1bexmespxz3Mvt5vIFIyYseXxWRcgf3kmWDyb/V9FXCfU1RohgxxGsWQ89DeoCKrg+uA7Oi30oPPNA3mE3JkNFkM8aTBvKisO0yOdD4dbBuki2fEbRl3znRazxBegtTkbMYYvc3cO8mFRyOb4cIKDNIUp7EGcR7aRmpo3GsDDPhmwHaIE5jv+nHVtMYK2e8bgkMKpYqTTGBrsGJt9amw+EmZsOJ89rEoV1PfTnm+rQ94riA0RlZ03z4SQsPVG7F0l7Nnn/nY0nNLmzTffRmMnGgMrnEKGE2J79ngb5HjJ3yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxaFUMpZS8ns2MzsrcIMUMcaQb3KLMXDA3h61XvrduM=;
 b=RN2hjhJwNIHeGsbqbzAj03dUlB/5EnqsL7P8Vaqm8XA9Aln5DfRMM3ccJ/D9leAC+7xCZ3bSFaLNGdtM66jJ1/wnTGSc8eNzhs1YJsb3wcm5FbA5YGDISX9Trqu3F0VKLYjEwIuoDl9jW5tzdkVP/ubEKz3BhsI80042apfTUectEpxyb6sGSztHVMqvoqBpf7pp6XFxBEzJB0Y3gwpzczJE2SaQyt9Bpzk6ZUbiSXHMnFHYAGfY8YRaAubWwEwQEHnimebrACAcQWtuemPKHK26nDdtDYWGuhN3zB6QsitYGD3WBU0j9gOaVfa4QR/j8uyY6SmybY9d1b3rE/8GSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxaFUMpZS8ns2MzsrcIMUMcaQb3KLMXDA3h61XvrduM=;
 b=4mYxNGiEz2lshKMMKs3Ow08ZaCQM80bDGJBi6UkVbtf2TnJQ/VIHJBXNUKKz0OL38SaxIHbI07ZkQuxrR6rpQ6z854phXDGPThTsGJFQxvLGrIrTR3e+9TojgRVhY+glfvlBYBqHtM09+phEfigWtd0nGz8V9rVilG6wgxmquwI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2] tests/vpci: Use $(CC) instead of $(HOSTCC)
Date: Wed, 4 Jun 2025 09:21:28 +0200
Message-ID: <20250604072128.16628-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|CH3PR12MB9028:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e83053-09eb-47b9-e33b-08dda338707f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uOj6CTvmG6tS0koW3fv9dD2/M2Ui23lA83m1R3fE9D2wXgRyUq5ghZsUhgp5?=
 =?us-ascii?Q?bh6rfLTQecIx1Kt1eYhLEmw3dnrN4eF2/rMBQNRi8gQ93qifrWHUyq8ISt57?=
 =?us-ascii?Q?//GOsQOmMKf6fMWbFTHN52JIzWnB6fq4ywBA9cgncvtvDyvp7OwI2BPLjlmp?=
 =?us-ascii?Q?Qr3eMK781J2h6i7rtePNsobpvKOiaxHZNWuK5DXoYHm1eJ0wY2YMu4Pbykwm?=
 =?us-ascii?Q?FB2fyzNrSXbdN6tkJfbhU3fxXQ09/RhChsB8I0eKJK4QQkZT4NqF8K8WG4N4?=
 =?us-ascii?Q?v7KBvWpt8KWeWcKz5CSjT3TjRCTf9BMYoWZSiozzB68ja3GxlJDK93ekZXes?=
 =?us-ascii?Q?G/4jjm5Uylbstr3P73VgaReNm1FEe1brN2u55HPlun5NUG6bJnmT111q4Fgo?=
 =?us-ascii?Q?ySM8vVPIde+ICzyzCsc/Mm+9a25N7Fm9XrN5wOJp4GRV5YpWKaq7ULqehq9c?=
 =?us-ascii?Q?KUMjF3QPtxPs4jQNcWfPdyGeYs6Q277BJ7tWIRXtmfWeMriqRk1oAsp+TKym?=
 =?us-ascii?Q?UumffLRdvlIjt9FaQg8oclDtMxMNplkj7QGWhaIUINi0xakopfb8NYemA8jE?=
 =?us-ascii?Q?Ib1tRSGuVk6ZydY4e3jPRM6FGUsDXM1oc2i0UBqnaaIW0eIElLan+4UB7ii3?=
 =?us-ascii?Q?OhRdEbT29uNjI0eHznlAIk+CucKhBc2mkPvRKpYifpj1VLYi2dnca2aCVIr3?=
 =?us-ascii?Q?nxGCu3zPPyiu+ZyFCcRi6RoDeH5+7zElIpKXOSuzqvtRBal7wdmQj9+6oyuc?=
 =?us-ascii?Q?j6cLQ5Rqz09sMUdRuVDhE/3mSJXuRMVoIk89N71uc/23XH9mJ67sIr4aN7y4?=
 =?us-ascii?Q?zLeOxQg6HL0FzPEYy/nvS379NGNDaYJ9PBxxBfyaBjkhO6jOA/lgrqyQjUJk?=
 =?us-ascii?Q?5KJSJjt9SMFLYJme6KXOagU/2j7TL5z9KQzKR3Fyf5IjraZ+PcsQmutYoy+t?=
 =?us-ascii?Q?nT5Mtui8ezDIln9MBtqL9aiCD39jqWk+VKkfzdUVn+k/mZ71oyf1lSt/YZkQ?=
 =?us-ascii?Q?S2+LwsKgK3eINHzNfhRHzeVnQ4mf8+sVbpwj0HL6av0JzRl+owfGIMkb9ZdM?=
 =?us-ascii?Q?LoPnziEXdSLcB+4lDCuJK+narApvKMq7TeeDVhRS1a3cTArk6v7FcFQkJNwW?=
 =?us-ascii?Q?cTTDzHLfvEl7S0pe53sqXX5WJCyZcPggYl6Bar6zJxEl2/1NcpG/e9c6p7OW?=
 =?us-ascii?Q?Cz2Ict3uweBdyVDmiGYFJgMXETWl88c9QtrJiYSITdjvkK9Y2YMSsuL3xX38?=
 =?us-ascii?Q?EHtAWWo3P63IZxc5t2yD6TTRR7ZqwdECvo7ga7oCCPm8bq8/8C+D4oLOE3Bk?=
 =?us-ascii?Q?1TK6Kt0tW3T5d75DtwuLmIsxexVCHiZ0rium+t48zObIe8OvRAGmdcheaTHS?=
 =?us-ascii?Q?btNtKunEnYquWBOBumDm7sONEKscwfQKu3fo/RAFcXl5hn4Lsu2a0hnMEAc3?=
 =?us-ascii?Q?rXrgMmAFJULeuqP6OjB9UPXX3OwKxU9Ow/xTbOGG63Fpp9jYnpHJCzRM9Dra?=
 =?us-ascii?Q?MGGQyR8m3xFhUcPcbkvAE3us30qU5F5JswnR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 07:21:35.6559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e83053-09eb-47b9-e33b-08dda338707f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9028

When cross-compiling, HOSTCC can be different than CC. With the recent
`install` rule addition, this would put a binary of a wrong format in
the destdir (e.g. building tests on x86 host for Arm target).

Take the opportunity to adjust the `run` rule to only run the test if
HOSTCC is CC, else print a warning message.

Fixes: 96a587a05736 ("tools/tests: Add install target for vPCI")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - change Fixes tag
 - add `run` rule adjustment from Roger
---
 tools/tests/vpci/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
index 9450f7593a41..f2226a5543bc 100644
--- a/tools/tests/vpci/Makefile
+++ b/tools/tests/vpci/Makefile
@@ -8,10 +8,14 @@ all: $(TARGET)
 
 .PHONY: run
 run: $(TARGET)
+ifeq ($(CC),$(HOSTCC))
 	./$(TARGET)
+else
+	$(warning HOSTCC != CC, cannot run test)
+endif
 
 $(TARGET): vpci.c vpci.h list.h main.c emul.h
-	$(HOSTCC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
+	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
 
 .PHONY: clean
 clean:
-- 
2.25.1


