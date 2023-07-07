Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C9F74A89D
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 03:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560144.875810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHab0-0002ff-Up; Fri, 07 Jul 2023 01:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560144.875810; Fri, 07 Jul 2023 01:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHab0-0002dN-RI; Fri, 07 Jul 2023 01:49:18 +0000
Received: by outflank-mailman (input) for mailman id 560144;
 Fri, 07 Jul 2023 01:49:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=40UB=CZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qHaaz-0001vF-KV
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 01:49:17 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a515c76-1c68-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 03:49:15 +0200 (CEST)
Received: from DS7PR06CA0042.namprd06.prod.outlook.com (2603:10b6:8:54::23) by
 CH3PR12MB9455.namprd12.prod.outlook.com (2603:10b6:610:1c1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24; Fri, 7 Jul
 2023 01:49:11 +0000
Received: from DM6NAM11FT075.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::d0) by DS7PR06CA0042.outlook.office365.com
 (2603:10b6:8:54::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24 via Frontend
 Transport; Fri, 7 Jul 2023 01:49:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT075.mail.protection.outlook.com (10.13.173.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.45 via Frontend Transport; Fri, 7 Jul 2023 01:49:10 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 6 Jul
 2023 20:49:09 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 6 Jul
 2023 18:49:09 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 6 Jul 2023 20:49:07 -0500
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
X-Inumbo-ID: 7a515c76-1c68-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnOZJns/niXhn3xR2a5/TYZGKfGzSLLfXme5c222SnTBpNxXpq1m/0G6WmOHgoFFZUH/45SQf6s/TMflukRHLvfflhZhxvFvcWiLawzBO3tvSC8UL1yeItmuA1DaCXDZIOZmSOXztP02brvu2CED2Q18GnaYmMf23UXMV3XSoeQoO93Hi/7Jp9F14P8ip0ySWd0R/pGudTDkt7XOPjhFaRN1CZoYSXIADCSTicRzpYgwzGvW6JwhRRg3CiRM3BnwVvcMXZG4tu3XEi9FoOEoBes38u/GySl3vpNjvzlqFfF9nwhMRIKIuyroo7aJ8Um6XVBoD5HufdcRzVeQw+oDHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6Ah2WjT8kbxrdDWolhQZENd36EfFXTl5wpUnTMUypc=;
 b=QhXg62O01DFPZ6ae+JxAyo0+vGapmpDPeAeiPd3k/qU8XWqUocJd8ceNMgEbVFcLrwba7RVV7dNAzQ00nx4gC5eVyJNYRY71eUk9PjtRAJE1MJbywKLxuWVBFB9bkjycVI1utPQgUhTgxKFdY8CGpUsNU0jL7r7mj2NHn9n5er8VIbSP3HZ7HukgquaOJ7JIptCQLQdNSbnItz9HW5Y919vkv6UthnXRnUMwnEyLf+GxG/VYl9kweXWuxxpDIzJvxKhuv2oFn5N5ALN7pCnBXywuqcIBVZ4GXRy63Me3rgi3R68TGxxGZ0nh/J9PucOu98lEn477Q5GcpNeX4wxk2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6Ah2WjT8kbxrdDWolhQZENd36EfFXTl5wpUnTMUypc=;
 b=cAEb0gNgU+74FUZ8FKXrA9GOiOlyesRWj4L9ktZbwXI7PHE/oFUY7LUk7WyuD2Ia/BfcF4fJfcyE70CH3V55Ytebl6fNyY8/KaVaQ/0O1dAp2P9cgKOaDPC0zS6KfvUicgEFtSQKnhb4I6fFydog+lFYHhSmzg6G2/3UQ6zPM74=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>, Rahul Singh <rahul.singh@arm.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v2 2/3] xen/arm: make has_vpci depend on CONFIG_HAS_VPCI
Date: Thu, 6 Jul 2023 21:47:49 -0400
Message-ID: <20230707014754.51333-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707014754.51333-1-stewart.hildebrand@amd.com>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT075:EE_|CH3PR12MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: 934a342b-161a-41a8-5942-08db7e8c5bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rkNcz9P1w3SriLHGQuEYLTzPIDJle+OS9sVSTpzXjRvH+QdnUEjl/Iwf0n6TIZfU2s2qmdE12G8nORjAkfvxebvu2ZBwB7eI1JdsE99SaJMQu3DXjGS9imFk3GsERnIm06FYtGFO2nlHosAnp7IbPC+KaOSBw7tk4sGptmJyler/i5yi5JLVmf+CNnyMLIdREx2diQw7bJGrgH/rko49hQezqaBO/IXFbP2vni1cWjADGjXlNf5PqYud0mx50mOWPQZ2bw6XeC2hZi5Cjx1wne6Ts39WPS6tR1hMhWUfXmyfg1G5QczXFy8flGePfodCdY9f/sNPiCS6CgANsBglUhALyN0L9gecysbrCz9Ub9Q+mLaKrsfnFMxswsa/SPyoAHAa1b78fx6/uKvfj+FGD2iK9uDBU86Nre5VcNzIb6np5/Pi3oP7qyHeBkqCU0MD0RH1YOC/QXaiEkqSM9Az/k4BO9U5pjwttKNxzTgBikpJeMnYsPi4PR2iETlj+OAI/CJgK8/7ozFAmn2JXKb3VGlJLJB8V2AI4doCS+ca4/Tdq2ueninUSwqI6Vogc5HrBxWjBwI9F+htbGR8N6owDWldeFG3V+DMdEP2SB9MEYKyEUKv6ZR8kgmG9r3A1NarOM3L+1Fxcmwjib29sidR1CT0tOW6a0daRMZDu7aVoP6BUDlCBoJmifyBH9znVhQDNWr+fyLF3U8hlVgVicoDa8ct5/NhTeTDVXoISf6Ao8LO/4EZoDBQG/pumgJn5xfjSDX/bTKUwz2bKNLeiUfHRbL7iY3en0gyJuqEBv0r8nQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(46966006)(40470700004)(36840700001)(40480700001)(966005)(356005)(54906003)(70206006)(81166007)(6666004)(70586007)(36756003)(40460700003)(7416002)(44832011)(5660300002)(86362001)(8676002)(2906002)(82310400005)(316002)(8936002)(6916009)(4326008)(41300700001)(82740400003)(478600001)(36860700001)(83380400001)(426003)(47076005)(2616005)(336012)(186003)(26005)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 01:49:10.3374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 934a342b-161a-41a8-5942-08db7e8c5bd3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT075.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9455

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

VPCI is disabled on ARM. Make it depend on CONFIG_HAS_VPCI to test the PCI
passthrough support. Also make it depend on is_hardware_domain for now. The
is_hardware_domain check should be removed when vPCI is upstreamed.

While here, remove the comment on the preceding line.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
There are two downstreams [1] [2] that have independently made a version this
change, each with different Signed-off-by's. I simply picked one at random for
the Author: field, and added both Signed-off-by lines. Please let me know if
there are any objections.

v1->v2:
* add is_hardware_domain check. This will need to be removed after the vPCI
  series [3] is merged.

downstream->v1:
* change to IS_ENABLED(CONFIG_HAS_VPCI) instead of hardcoded to true
* remove the comment on the preceding line

[1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/27be1729ce8128dbe37275ce7946b2fbd2e5a382
[2] https://github.com/xen-troops/xen/commit/bf12185e6fb2e31db0d8e6ea9ccd8a02abadec17
[3] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg00863.html
---
 xen/arch/arm/include/asm/domain.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 99e798ffff68..1a13965a26b8 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -298,8 +298,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
 
 #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
 
-/* vPCI is not available on Arm */
-#define has_vpci(d)    ({ (void)(d); false; })
+#define has_vpci(d) ({ IS_ENABLED(CONFIG_HAS_VPCI) && is_hardware_domain(d); })
 
 struct arch_vcpu_io {
     struct instr_details dabt_instr; /* when the instruction is decoded */
-- 
2.41.0


