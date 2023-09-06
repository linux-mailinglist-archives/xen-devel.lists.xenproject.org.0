Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2144793340
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:17:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596000.929806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhA6-0001M2-IP; Wed, 06 Sep 2023 01:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596000.929806; Wed, 06 Sep 2023 01:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhA6-0001Hk-91; Wed, 06 Sep 2023 01:16:54 +0000
Received: by outflank-mailman (input) for mailman id 596000;
 Wed, 06 Sep 2023 01:16:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdhA3-0006tr-Cz
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:16:51 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dce3f77-4c53-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 03:16:50 +0200 (CEST)
Received: from MN2PR19CA0018.namprd19.prod.outlook.com (2603:10b6:208:178::31)
 by SA3PR12MB8801.namprd12.prod.outlook.com (2603:10b6:806:312::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 01:16:47 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:178:cafe::c1) by MN2PR19CA0018.outlook.office365.com
 (2603:10b6:208:178::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Wed, 6 Sep 2023 01:16:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 01:16:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:44 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 20:16:44 -0500
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
X-Inumbo-ID: 0dce3f77-4c53-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSHKIwGspQXOTfuBnwXgt81U/y1Xkxln/KC8SFmYaH4dCLeiFYCcFdeCnf1BmTJojs35qQVbhNQKCbNHauV6d53JOU21H1pYzWZBTUMritldT8tm3ttvCnlHLw3DkGIs4+khj5u8LckugZ1W4wN1pIiMtuyem/ziVUMKQ2yCwB6hnLHmO2/cEwhaO4GxuKb4JJSsMQpjBCCotYjxxzJnqBcOmcMWFsCeFAcF+/e02XdDh+de2/bYvCzO+p71uwF7F7vJe9Rv5HCBv68GMGZQ/qg5MmiHIjIYKfgSytl/T2AUf8EQydkJITAr+G3A9qI78FaKqpBQda2JByO1GWRB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDhW7f5w3p+/XHERjQf4wWurMSkKNLV2sxdzRwRCMQk=;
 b=AlkowZMcvEXae2WRO3RPyZ4+byRyjMFoBsVfrwBwyLW2l2qG8ORKOfc6vhXagnIwG9K8cZgGl9UNdHtoQGLeOqP3rW0dAygvianAFFEft7CHlCHFq8Jpz3XxOGtTuEtHhRHsAXLQ9ErVFpS1iKHcZK0Ojh/fHS5fH7RTbJSAcqCQMmqbhZpz9PO2d33FSLFA1GY1XwNOjF0Gw7fpilqk8l1B8ltXnGeOqkb4ZM/EPoBzZNzuqSfVtq0SOPOXnyYg/nbNGFDDGp21JHkz2pdBkQt6+NGABsmjHDGbFA7plBal1ggUBviONbsQfX/oQS42hScX02FrWRRm6o1GEOGEkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDhW7f5w3p+/XHERjQf4wWurMSkKNLV2sxdzRwRCMQk=;
 b=FHJIDGMQivtrOJNQf3EoTY2yIBr3+/TuJaEoTMdXC7kbjX/HVXxt89iTWs5k6Xn7m3iiOrqEtBcLCptmIiJKINpjysQOi4pRWmxYYPVhwveJZWFIQSkHkMh7AsLRzyWbTw2niAlJ2NXN0J6khnOLVNwCVS9+04hfn3zR6SIG/Dc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v12 13/20] asm/smp.h: Fix circular dependency for device_tree.h and rwlock.h
Date: Tue, 5 Sep 2023 18:16:23 -0700
Message-ID: <20230906011631.30310-14-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230906011631.30310-1-vikram.garhwal@amd.com>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|SA3PR12MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a7f2e9-d0b7-43ad-575a-08dbae76f06d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eAw1lGrWNbpFKg2anXnZHunWRlUJNLm3O9vtyZNJaSZT6kXSasoYY12uh9IC9wNQ7xg9giNCc5OzHBaP6pz6ZyX81B9Mxqb1dd4ZUSjKB+bVj+/Kg33Awoi5yhVNWWvamhrOM3pJS34LSYHGCCN0cwR0Xl5GVlJQOuCsS9FdfGIJmKeGfnXk8mxEKTCFAf7nLcXwKmf56ppLUqjVtnip1M83m37OWM4M2ePe0SDgqLPq7WjqPmUOyQUMKwUnbGieOaRA0nf/BImSPLPa8tD/3oNaB69Cl7+5h0BdrggY3FHw+W0BhzIXnqawBe2ODk2M8PrywqddPE/l6WTkmKGDYAc0/LZLDwZeoNnF5yaIxUglLIzRk+7Ouda9RKjnbIZpgj+fP7PGrzXnk4a3GR1k7Rb1/1Y/1d00lPkbckdZWqUdKvJXefW01h1S+AOxsU0oD7NRE3xyNDP7i9Hv4EJUbuWsaoGOGtdl4x3GttAl4HbE+YC8oQw38XxOFoJFftwPdy0ebd64ItemPm3i5lN51xQZmcry9i3puibLTgT+jz98MY1nYDkSbyoD+thuNCPhkiiL3m5HVhImHkXeh7jS0I5wTSht3ZN0sKV813qvGrCNSLzdAgTjEHAVtu3H4LvsIZ3WrOHMi5OphpnTO7qVuQDxrWnMLBIpm74u8vTIuQ1pKAKr7n+35pHYLV4imbQRQW5smD7E9AOSzYEX2sHt6soEloESAofutylDMCG9QOv9uXksIUVUb4+CeO4azihiRYVpqJsjgOnFzdlszVVd2Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199024)(1800799009)(82310400011)(186009)(46966006)(36840700001)(40470700004)(8676002)(4326008)(426003)(26005)(44832011)(336012)(40480700001)(6666004)(8936002)(36860700001)(47076005)(83380400001)(2616005)(5660300002)(1076003)(40460700003)(41300700001)(54906003)(70586007)(70206006)(6916009)(316002)(86362001)(478600001)(356005)(82740400003)(36756003)(2906002)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:16:46.5660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a7f2e9-d0b7-43ad-575a-08dbae76f06d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8801

Dynamic programming ops will modify the dt_host and there might be other
function which are browsing the dt_host at the same time. To avoid the race
conditions, we will need to add a rwlock to protect access to the dt_host.
However, adding rwlock in device_tree.h causes following circular dependency:
    device_tree.h->rwlock.h->smp.h->asm/smp.h->device_tree.h

To fix this, removed the "#include <xen/device_tree.h> and forward declared
"struct dt_device_node".

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
    Changes from v7:
        Move struct dt_device_node declaration just above arch_cpu_init().
---
---
 xen/arch/arm/include/asm/smp.h | 4 +++-
 xen/arch/arm/smpboot.c         | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
index a37ca55bff..4fabdf5310 100644
--- a/xen/arch/arm/include/asm/smp.h
+++ b/xen/arch/arm/include/asm/smp.h
@@ -3,7 +3,6 @@
 
 #ifndef __ASSEMBLY__
 #include <xen/cpumask.h>
-#include <xen/device_tree.h>
 #include <asm/current.h>
 #endif
 
@@ -23,6 +22,9 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
 extern void noreturn stop_cpu(void);
 
 extern int arch_smp_init(void);
+
+struct dt_device_node;
+
 extern int arch_cpu_init(int cpu, struct dt_device_node *dn);
 extern int arch_cpu_up(int cpu);
 extern void arch_cpu_up_finish(void);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index e107b86b7b..eeb76cd551 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -10,6 +10,7 @@
 #include <xen/cpu.h>
 #include <xen/cpumask.h>
 #include <xen/delay.h>
+#include <xen/device_tree.h>
 #include <xen/domain_page.h>
 #include <xen/errno.h>
 #include <xen/init.h>
-- 
2.17.1


