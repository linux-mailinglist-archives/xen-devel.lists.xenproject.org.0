Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6160A5AA889
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 09:09:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397374.637939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU0o1-0000Zb-Gp; Fri, 02 Sep 2022 07:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397374.637939; Fri, 02 Sep 2022 07:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU0o1-0000Wo-C1; Fri, 02 Sep 2022 07:09:33 +0000
Received: by outflank-mailman (input) for mailman id 397374;
 Fri, 02 Sep 2022 07:09:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zTqM=ZF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oU0nz-0000VG-Ns
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 07:09:31 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2081.outbound.protection.outlook.com [40.107.212.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f1b57d4-2a8e-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 09:09:29 +0200 (CEST)
Received: from BN9PR03CA0506.namprd03.prod.outlook.com (2603:10b6:408:130::31)
 by LV2PR12MB5895.namprd12.prod.outlook.com (2603:10b6:408:173::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Fri, 2 Sep
 2022 07:09:26 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:130:cafe::24) by BN9PR03CA0506.outlook.office365.com
 (2603:10b6:408:130::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12 via Frontend
 Transport; Fri, 2 Sep 2022 07:09:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 07:09:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 2 Sep
 2022 02:09:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 2 Sep
 2022 02:09:25 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Fri, 2 Sep 2022 02:09:24 -0500
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
X-Inumbo-ID: 2f1b57d4-2a8e-11ed-934f-f50d60e1c1bd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4NoOaLZdOzsjNzoOqWcANPuqoo9zoXqv0ElXRgZR2dnvLMTdJk5nzJT25ETpkPPyC3v8LDrF+AlM4iPPKuutSZdmTYCbuqQ64a4Jsg+QKwopDv3D47cVl2b66MLX2mMiIKlDCAA+bvx4V5mQzDyzW8rIfJg/2DkcLXeofxJvqSodU2lZsl9crpMiSouo/WcPxczi/A7BJzS/q3ZNcn2FBjrIIyxRtJc1gWEXOzfgS05OucvwgRF6WLkeMaEdvUTw61mOZ1c/B+mx1NPkFNCErF9qr4GyfL7fDWhYP7KDdYdfRianiSTc48epSJMQRC9UO0XSynmXd7gZQVMB8ayDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fxl2Y+brzqdoCYlG8sYLKyyIqMeJuYiU3UbH1MYdaBk=;
 b=a8yCLZR3W0ETY20cIh20NeFxzBW12WfHiVIuz670FpWptgCu5RnZoBGKcPspZ3iovMChDKZ1C85j1fLXh7FD+C5IqMWd84v7MkizYsypKKMKravzAz86Gpk2zhrjn0amO2jketjz/XjJ2JFQI0UMXlEtYeEURG2SOoQuXD/qB7m9c6SGcEBh6rNCTwdzTaOKVGZwg7aVHF/Jx3tMYmmwCe6y5hAAeItBNPMPn1qLyNC5/aWl7rP2/3P4y3bQm2qLR+0NfGYkMmJEcOiQ2R+tHhLXLvYx2Cr1RXIn+b159cgLNKcrbcJhyihKxOZXc2n8VMQfXG+DAn4YtenDJsYl/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fxl2Y+brzqdoCYlG8sYLKyyIqMeJuYiU3UbH1MYdaBk=;
 b=2/5pESK2VED6EXuMEUwK52Iz+b5APlbzcJfSnHFB/u041vuGv1lMHzXTmPbqxtNjhsoccRMo0eubQRvp2G4ZJGpY9/Fas8fqqHR3sAvqMzaSeH/dmUVzdCexOds3zRFs2M5wUtSXYfi59D5+Kxw/i9SRo5sbyZtshgq+V8vvRv0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [for-4.17 2/3] automation: qemu-smoke-arm64: Silence ifconfig error messages
Date: Fri, 2 Sep 2022 09:09:04 +0200
Message-ID: <20220902070905.1262-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902070905.1262-1-michal.orzel@amd.com>
References: <20220902070905.1262-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bf2b262-63b8-4f49-b6b5-08da8cb21258
X-MS-TrafficTypeDiagnostic: LV2PR12MB5895:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	12dTPMtE5a7+vzqnd5fPR/zsHHakEAZRG9+Wk/kPgnKU556XFSvY7m+6P27dE1AnyAwZNYNYaAAB8KwReP6cTrOeiwEFO9+ne/cPyoP06ppCsX7Jy2THPVQvHEdCOfuKztUEyLVgxe4jwebeEfVZIgXWK17ZtHsRMfP69hOrot7fR6C55TnUHagtxLRqLP9Uwd8JPniTBpQIrQZioUAGz8wnNhzjyRxktXnvZG0zPuoFPd1rKuMKa8MHQpD6niBI72sUyG//pdoHJ6PZNY4++a4YuGQ4uJAS7treu7uaONctdFxm7ezDeiByOIQ1tCg/GIstv77+653EG5fgf6p9koYIxp7wCs/EPMt9ICZ/7fi+/uSYb1XhRNnBwjW77OHXFbCCyYmF+tcDm2hzjp2yQEIeaYm7+iwvbw3+kcVQmjToiGs5BHSrTgNfjdgW00okJ0bhjhh9KagmnYVGnHJFdUzYzi6c5PoXp+q1NuwxXalY283LHMiokTqX8LqpotoXK2yluGyHEIC1r8/jFIrFZSiMfaGczwunSiWrR9VqL6dAo3zce7NLxepjzIn/Ujr9p6woPpnTmbonuuakBVv4Sz07GzvZT8i2BwmGatMg8HwUKYKN9sbpWdt9VKMtvYn2p5TYjkZ6MOXHW8iEXoZpHcitzlroj4jn4P/e9dJLfM9One3akARg8zKwsnj7GkbcRy2+bcGsBDg7CKwa2wixPdlqnhnuZr1/NGQrOWG9Q3qTBrb29EMceRlaILfuO5w0noR5nv4XWYFMGXcq8lyBnCZXg+opfu17ajzP1/ThWm8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966006)(36840700001)(40470700004)(86362001)(2616005)(5660300002)(81166007)(40460700003)(4744005)(426003)(47076005)(44832011)(186003)(6666004)(8936002)(1076003)(336012)(15650500001)(41300700001)(356005)(2906002)(26005)(36860700001)(40480700001)(82740400003)(82310400005)(83380400001)(70206006)(478600001)(36756003)(54906003)(6916009)(70586007)(8676002)(4326008)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 07:09:26.5436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf2b262-63b8-4f49-b6b5-08da8cb21258
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5895

During the ping test, dom1 tries to assign an ip to eth0 in a loop.
Before setting up the network interface by dom0, this results in
printing the following error message several times:
(XEN) DOM1: ifconfig: SIOCSIFADDR: No such device

Silence this by redirecting stderr/stdout to /dev/null as we do not
care about the output and we should not pollute the log file.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/scripts/qemu-smoke-arm64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index c80d9b2aee00..7ac96027760d 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -6,7 +6,7 @@ test_variant=$1
 
 passed="passed"
 check="
-until ifconfig eth0 192.168.0.2 && ping -c 10 192.168.0.1; do
+until ifconfig eth0 192.168.0.2 &> /dev/null && ping -c 10 192.168.0.1; do
     sleep 30
 done
 echo \"${passed}\"
-- 
2.25.1


