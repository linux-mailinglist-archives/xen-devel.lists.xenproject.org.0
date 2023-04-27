Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3FD6F054C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 14:06:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526971.819065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps0Nw-0000Ym-2n; Thu, 27 Apr 2023 12:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526971.819065; Thu, 27 Apr 2023 12:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps0Nv-0000Vs-Vb; Thu, 27 Apr 2023 12:06:03 +0000
Received: by outflank-mailman (input) for mailman id 526971;
 Thu, 27 Apr 2023 12:06:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO3s=AS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ps0Nu-0000GO-Qc
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 12:06:02 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20610.outbound.protection.outlook.com
 [2a01:111:f400:7eab::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e02d4034-e4f3-11ed-b224-6b7b168915f2;
 Thu, 27 Apr 2023 14:06:02 +0200 (CEST)
Received: from BN9P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::17)
 by MW4PR12MB7143.namprd12.prod.outlook.com (2603:10b6:303:222::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Thu, 27 Apr
 2023 12:05:58 +0000
Received: from BN8NAM11FT115.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13e:cafe::61) by BN9P220CA0012.outlook.office365.com
 (2603:10b6:408:13e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22 via Frontend
 Transport; Thu, 27 Apr 2023 12:05:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT115.mail.protection.outlook.com (10.13.177.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.23 via Frontend Transport; Thu, 27 Apr 2023 12:05:57 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 27 Apr
 2023 07:05:56 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 27 Apr
 2023 07:05:56 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 27 Apr 2023 07:05:55 -0500
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
X-Inumbo-ID: e02d4034-e4f3-11ed-b224-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKYwXZB1Zmf5AQD3Ogl5wdp0UjYnG5obue5G/OY6ZNdRDWuKYIRO8CasvOO1qunIxOsgbAjMEwKwy8oPcBBGvnQw6COA4TI1qpAqJVb72NW14hWBYToWxe1T6VDLQT6WLq31PHUQBQcjb58CWfeOd4lxZxH3OeR/z5hQnUuCVO0qLQzSRYFiPHU5G624qixL0XvjjYAw4F9zbpQqotC+IdcWsXLdGjOlhobM9d2l6FAFi/f6lTNua15qbitMMpfLaU2V3JHIR16e+ztqHmJUxXk4ujpnTD9y5+7LRujj+rVtjMZDtTaHtuVyYO6xTiVJSJ7Naaq0iAfX1Bjfh0WedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Yco+D0ZQTHFIKK4jqyOrQ0GQY+dKN40P9v5wpwSnVw=;
 b=WI7Jq9waBXj1u3xx2MPWj3sIPMIpANwc4BoeSHfPuwyxtr/7+BhPUXJ9gqHc2ie1aqyrmhd8wAJVoSlNWTc+oXtP/ouaXZ/ZkthGc6/ujEx86iFyZYk5j2peKZaC/rXQnd0BuKnGdXVRtwShJzn2Z21czbPpbcUqXHHERGf/udmMdtuJBIPu8StJX8ZRinztCsfn8ElD7fAtG9jmSTKddn/LSaG4uPNKbT0jwhtevTONGO0/tGqhnVu2TugNEN111hGbYEavGea8PWfJxMWTDyBuFIGyZDI1S5uy8pztqEchgSbRd4qtI9FRWHcwcEPj8XjGM60qtO3MVObpWenzNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Yco+D0ZQTHFIKK4jqyOrQ0GQY+dKN40P9v5wpwSnVw=;
 b=yNBgphgmuCQ0zomRtQAZ9M+tHHp7V5LBJgBzmN31/Sq88qbbtqXq9T5Zo/PmaMtZJgNoog2nB4H9jxKYsAvNhmcYqhgoZsZX/wrws+d88BC3CU93BHFiv7hJnKP2d74EGbFUrdchhJHnndvOpMipkj4nGZPfL4IGVLp+e6e6pIA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] automation: xilinx: Set up bridging only for a default test case
Date: Thu, 27 Apr 2023 14:05:52 +0200
Message-ID: <20230427120553.18088-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427120553.18088-1-michal.orzel@amd.com>
References: <20230427120553.18088-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT115:EE_|MW4PR12MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c909b7-ae0d-4728-d379-08db4717c245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sQxVhiUaEZVAvtVrVyWFL+OzbnT7B4wpfYaFDKy1gflTopWpiosFJb+uvWy578Y8l9VpBBPz39wMSd9fHN/rcSLweH0KX9N4Y/8ZF43Zc/sxTm7a2JLW3jmeM6fvK/qI4CweEkB2FEBt2qWO70ixd2TPAILqFa4cW4CX3Ga9Z7uuRpkhXojEHuWNXWrCG4PI6VOu5nbXYvgJstAPtM+1JTafFXo25tx6RQuBD1RTyRHYLPaXDp9Z25TKGoDL9irYGmA3DhGzyp0vbo19PAUV2xBKdW+9/T6ZtFQC9xYh+KuDhAEbWLKmMKPrYjbRm+4jGR5JB87hwaIe2fqQ7aM5nS+Y6GeX2ApYaeeGtRlozSoPdLzkq8oaljZHwAswT2Ll2eUL9kVLyKBf58jqIln7UQvetCvWEZPF2L5r9JrU3GH+2sN2TIT8wrFMzFSsoqpLVxFv89FLTLdDmnMoYwjBnlbLj5GYnR6angjokWU6PvB6rppwg9hUKdo8d8thQZbBY7T7gG0eP/eRcOC4C9jiUleoFWCb1fbt3iaG+e9Iod/zl5eZ7kUmRi9RCeuP3eWj3z7+MpU9rp5h2zSCI+ryT7jzjQma7Pc6ghc8oOeA0fTTFiI9azJEucsIIxYTXKIGMXylQecBUhawvFWxwkP+lPJOsztRUik0wmNmhSRgbgh8YBHSwBUqoWEh60/iwhjj4cxmaYDw982miWAAeTYK9hGuG5Vyrjr6J0uOnxJhMkI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199021)(36840700001)(40470700004)(46966006)(2616005)(336012)(426003)(83380400001)(36860700001)(47076005)(40460700003)(186003)(40480700001)(70586007)(6916009)(4326008)(81166007)(8676002)(8936002)(2906002)(44832011)(70206006)(82740400003)(5660300002)(316002)(41300700001)(26005)(1076003)(356005)(86362001)(478600001)(82310400005)(6666004)(54906003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 12:05:57.1764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c909b7-ae0d-4728-d379-08db4717c245
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT115.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7143

At the moment, setting up a network bridge is unconditionally placed
in the dom0 xen.start script. Since we might want to use the network
interface (there is only one working GEM on the board) for other tests
(e.g. passthrough), move the bridge setup to a dom0_check variable being
part of a default ping test (i.e. if no test variant specified).

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/scripts/xilinx-smoke-dom0less-arm64.sh | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index 82158ab7ea1b..73ba251f4cc1 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -6,6 +6,14 @@ test_variant=$1
 
 if [ -z "${test_variant}" ]; then
     passed="ping test passed"
+    dom0_check="
+brctl addbr xenbr0
+brctl addif xenbr0 eth0
+ifconfig eth0 up
+ifconfig xenbr0 up
+ifconfig xenbr0 192.168.0.1
+xl network-attach 1 type=vif
+"
     domU_check="
 until ifconfig eth0 192.168.0.2 &> /dev/null && ping -c 10 192.168.0.1; do
     sleep 30
@@ -51,13 +59,6 @@ bash /etc/init.d/xencommons start
 
 /usr/local/lib/xen/bin/init-dom0less
 
-brctl addbr xenbr0
-brctl addif xenbr0 eth0
-ifconfig eth0 up
-ifconfig xenbr0 up
-ifconfig xenbr0 192.168.0.1
-
-xl network-attach 1 type=vif
 ${dom0_check}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-- 
2.25.1


