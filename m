Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A686668EE76
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 13:06:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491719.760986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjDB-00060D-1C; Wed, 08 Feb 2023 12:06:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491719.760986; Wed, 08 Feb 2023 12:06:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjDA-0005xT-TX; Wed, 08 Feb 2023 12:06:04 +0000
Received: by outflank-mailman (input) for mailman id 491719;
 Wed, 08 Feb 2023 12:06:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3BG=6E=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pPjD9-0005Yt-84
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 12:06:03 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2f901e2-a7a8-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 13:06:00 +0100 (CET)
Received: from MW4PR03CA0238.namprd03.prod.outlook.com (2603:10b6:303:b9::33)
 by DM8PR12MB5448.namprd12.prod.outlook.com (2603:10b6:8:27::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 12:05:57 +0000
Received: from CO1NAM11FT084.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::ad) by MW4PR03CA0238.outlook.office365.com
 (2603:10b6:303:b9::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36 via Frontend
 Transport; Wed, 8 Feb 2023 12:05:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT084.mail.protection.outlook.com (10.13.174.194) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 12:05:56 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 06:05:56 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 04:05:55 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 8 Feb 2023 06:05:53 -0600
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
X-Inumbo-ID: f2f901e2-a7a8-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCw7PNGMOtLaHOGhrmqRQSUbkbiK94N1v0suR229ELqslmbPWlM2bwAA0+8MBDrwhitD93gZWgrFGkBOdZdHCkpfEujy0CmGgoJTsrehGIRUCrPuAUtXLXRD1Lp1Xhf+8i5djgC5U3gxRnObjaeR4Z9DrwtoMmzeYypChL6GXGJaUnUBhUsOBoT0JAiQMYIeODd3JPvO63ked2rDYrPTrtNGpJeodNyUJgwXNe5cIKp61urd445Ly/jMlJJXIkNrKHbl9tIaCDLzO5v6j86xBS5OCWDsnhvZSPNOjgL3Gy+N+i9oMfcC9iiZC80liVqIhvShoI9uV5HHIv/ZCkhmoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAZmFKeEHcYbCwG62zO7gEcvYWFvdpCtigxTazP649I=;
 b=eOiZdUFJWpwGcTGYAmRKnO3lqQKxVfJ02n4e+Byl6iYzvyVLf/JedY3HA1e0WFfQHicmS4O/z6sLT29UBi+kcHKNmRoiGhs7xc44umxbM78+lqfjSXaLXolRasNE6okadiC9wYbnEt8/b+06dOjVHitZs4d0yRFBlh39VJRkaa14THrC228T4IkiJGVEs42zztjwwHt1/ya3t1jk2bVvfDoStd37EvOhEhpoJ+JdpnGNQTfdHxssID0kSvNxfn/W8bRlwMi75nsv8NTjVN5pRQ8WkP/v1p1SNTy5sYeUS00kn/ljO6g9ol9IXTsKUDtzTVNc7QCcoiq3oRGjyIi9Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAZmFKeEHcYbCwG62zO7gEcvYWFvdpCtigxTazP649I=;
 b=QJFZDCfbYXDytDsTMeOWeoD+4YMy7hH2A18T/65uiKR/jG8w1oQgK2ERGPOxwcN/eePsd7SGJb7nS1y7g7hpQMO62+1wUnrjBmHbcRmrDWw8k4BckFsEO85oWU+xOHFUeKU3Kb3lmK27RZOsYpfvdwdgJuykZg6WfEoss3+ZYZ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v3 1/9] xen/ns16550: Remove unneeded truncation check in the DT init code
Date: Wed, 8 Feb 2023 12:05:21 +0000
Message-ID: <20230208120529.22313-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT084:EE_|DM8PR12MB5448:EE_
X-MS-Office365-Filtering-Correlation-Id: bae3aa70-476c-4ad6-afde-08db09ccd5e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eI9tbLPm9f+EnhW+YS1sZ+F/5hto17sTKLboransAphD69Kc6hjvwhzhoJKWseDrZgJ5bTTn/G0ubLLbWnfc/Q6C4TTTOOkTTeaejcFmgW6k4hQoVpLmwZeUiTDqLVzuImIIV1L6FI7zHyW2uLxlGCl5PamcVSXt1gE/8RrZHq0+/y7A4Mj/g9cfZaboPSCjqy6JlE420mdGfTQBjsYtUqqPDc/olTb3dGBIKyXjFmfGT27hTV8Dl4pVnK8ZHItfA6YjmD6VUiFo6ffGIiJzYlRVZK7pXeaqakxDq43x3YteZNe8Cf5eGn/Q5Qlvayk5bxIVau5oc27CwOfhYjG9bGwVU0mZpKi6uhIfaQXgO2Glqhg1RiHUblY3zN20EGN5GTW0CmYi60qj9As4XcRnKlOTpMsbzH/UZIdWzgZZQmTQVxZadK2TDjDcUMW9u5b+t+gUwq1KWbgIJmM3FCVnFeNYQBYWpaABAf4kEDH3m8mU7BJvYX03UtTPxH0yLnL1adiQJWWyxw37wnmk2sFR/uuenzQcQjtKm7MuWMEyMfQrdLHWN+QTzR2bgqjognFEd5KUrBjcAOCHhUf6xxmw+bNj/I1kgsigqosKJDxPCi3yUvPIsRlRylbzc/CK4aRln3BA9PW/8Mi4sSUPQqlugI1PxaHn3IT88WpoutSGRf4SMdkGWmU6GTKq9+2oquLqknbgFrAP13Q4JWalOuBoP5HhUB6GlnN+5+4sj4A6heY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(356005)(81166007)(40480700001)(1076003)(36756003)(86362001)(6666004)(478600001)(40460700003)(82310400005)(47076005)(36860700001)(26005)(186003)(2616005)(82740400003)(426003)(83380400001)(336012)(8936002)(41300700001)(8676002)(316002)(5660300002)(54906003)(7416002)(70206006)(70586007)(2906002)(103116003)(4326008)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 12:05:56.7876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bae3aa70-476c-4ad6-afde-08db09ccd5e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT084.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5448

In an earlier commit (7c1de0038895), "ns16550.io_size" was u32 and
"io_size" was u64. Thus, the ASSERT() was needed to check if the values
are the same.
However, in a later commit (c9f8e0aee507), "ns16550.io_size" was changed
to u64. Thus, the ASSERT() became redundant.

So, now as "io_size" and "uart->io_size" are both u64, there will be no
truncation. Thus, one can remove the ASSERT() and extra assignment.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes from :

v1 - 1. Updated commit message/title.
2. Added Rb. 

v2 - No change.

 xen/drivers/char/ns16550.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 4ce74b3cd3..092f6b9c4b 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1747,7 +1747,6 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
     struct ns16550 *uart;
     int res;
     u32 reg_shift, reg_width;
-    u64 io_size;
 
     uart = &ns16550_com[0];
 
@@ -1758,14 +1757,10 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
     uart->parity    = UART_PARITY_NONE;
     uart->stop_bits = 1;
 
-    res = dt_device_get_address(dev, 0, &uart->io_base, &io_size);
+    res = dt_device_get_address(dev, 0, &uart->io_base, &uart->io_size);
     if ( res )
         return res;
 
-    uart->io_size = io_size;
-
-    ASSERT(uart->io_size == io_size); /* Detect truncation */
-
     res = dt_property_read_u32(dev, "reg-shift", &reg_shift);
     if ( !res )
         uart->reg_shift = 0;
-- 
2.17.1


