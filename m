Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC3563ED3D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 11:08:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450437.707689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0gTF-0000GH-Px; Thu, 01 Dec 2022 10:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450437.707689; Thu, 01 Dec 2022 10:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0gTF-0000DR-Me; Thu, 01 Dec 2022 10:07:09 +0000
Received: by outflank-mailman (input) for mailman id 450437;
 Thu, 01 Dec 2022 10:07:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ywn3=37=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p0gTE-0000DL-FZ
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 10:07:08 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20611.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2a1836d-715e-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 11:02:23 +0100 (CET)
Received: from DS7PR05CA0018.namprd05.prod.outlook.com (2603:10b6:5:3b9::23)
 by SN7PR12MB8130.namprd12.prod.outlook.com (2603:10b6:806:32e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 10:03:23 +0000
Received: from DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::fb) by DS7PR05CA0018.outlook.office365.com
 (2603:10b6:5:3b9::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5901.8 via Frontend
 Transport; Thu, 1 Dec 2022 10:03:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT026.mail.protection.outlook.com (10.13.172.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.18 via Frontend Transport; Thu, 1 Dec 2022 10:03:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 04:03:19 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 1 Dec 2022 04:03:17 -0600
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
X-Inumbo-ID: e2a1836d-715e-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ghp8pRU3PRaaVw1ubs/nsj4Lm20s9+knq7CyQDVpvuG5lasAisyD5mg3kohjaB6Kd5B/042KTouhaTJR2W2K4avxXV6WmhrqdHTViqp8ymHgpCxiRcIvXP76kxUDSGnF7PW4ouToyf41EwFCBdTDVysxTDYGRehLwKFHjKjoP4VkryI3ulYfk3UzMja0zlIA1SsgsvMvfVOR4ZfRqyzEBpOVmRIid5p9K23DSZ5JD5NnaBPyS2HZp2Xg+x/5CH/C4Pj8hVfd0FCXH50eHdpmNP/1Hsqb0Z4rfIRjGOMbLs8GuF7owH3lAZCvMYzRLyYbL2YlGzFqiRFTY3KIfQPoPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LuPZLlNaOwbp7Ht+jXJOV/B2fhftFNV1Gl0W7OOUhc=;
 b=ZnxjucvLj6F1Jxrtm7vV3qfMqhzY9vUGSigv3eJpzLXjoppGp7ks9Wq12dqJ64TPzF3nn/+2asFx9Jp0Xmjguj7mQBiVI7xhwbwHqrVF6ug/1CsgDPZl2WVIw1fnnj8BpUfk5K1tVpGOjbMlmqIyzHAkJncF0H5kR747XagWUpYU7QeYGa7nYugJQfatTX5CMxsi6ylJHVgDc4rj6Rr/z/85cxyksjwhb6LHK0wGOiaETJo+44AfOGkOYwFHslORJF10sWBCmBLz3T9zGhIjvqbalq7tPQUTOFyPvDVSwjFWc63hiwQvrtdWVj0fpiuSFdpqgGpsBqBJ/ttio4gwfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LuPZLlNaOwbp7Ht+jXJOV/B2fhftFNV1Gl0W7OOUhc=;
 b=1a955W7ByT1H52htJsdR23ykM/1nXVYiVKD1EIm6a/MOxC/5oECx4SyMh7KwyxFnTKmo0XRR3Ju1bFVG/AYLz5a+qJMoUSCXcmomaNbNydMFFqOJbSp79tFal79DG1eqfVFOkJbTLU1l4h/LW1uM+v/ItSxxoF9DVO3NlmXB2pY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<bobbyeshleman@gmail.com>, <alistair.francis@wdc.com>,
	<connojdavis@gmail.com>, <wl@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v1] Xen: Enable compilation when PADDR_BITS == BITS_PER_LONG
Date: Thu, 1 Dec 2022 10:03:09 +0000
Message-ID: <20221201100309.2385-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT026:EE_|SN7PR12MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: b41815ac-4a69-4a2a-8b7d-08dad3834817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sLE0xPty9CyeII0Jb9InV+MwYhfvuuV0horP8Fm6eTumTfOFmdu79M4xaPsB4MyK8k1gYMoL4zoqEhcxI329ClpkHbHE3T3QSDYifvmVF6Q725VkITTZP3bwYCYnrwdWHkBJPuXy5H/QwLUzbzzU5i9jwM+Dn4KfSY+4jh8jxdhr6ylZZ8AQ2tDZKWNYSpSn9YtZGBdC+rIO7YPBHFz2qDacI96SCwQT5hYr2ocYwXhOIKVw4RGq+Arlhq58aQKakYBFd5/U2QpYQvRgZuAVlvf6Y2cFfGUvn6IZ99JCXdSIFitdoWsd+zVXJ5Pr19rEc5PB1QRz0dO+GelaHRfr32CK7sOMzFNni4VyXJWLxd6oJJwPhzzlgT2w+GFiyMicC0HbYz1oy0R4eQ8SdAuOwN9Cjie+SYrp9zZTjP3XKGsSrAB07AUUkAReIQw1qO6KSVbXCv3O/YcTK+UJ5rQhVGROPzXm3z8ZRBI44vc89eFB6DmpbEMXE7XWSpMPj1yH2l4zUsgdFgP5Yl6LrU1nJ9yFp6jsYAtcPbIqblpuXqVWqJMrR3ZPK05ctLWXZ1s5mIMwy/vT0mlDXY+FlSjBSCxnQdjmi/VG13EBVFLvNmr/5VDsl8KY+YdKFe/SmUBODaXUSMcJtS/feXTR3hfzoJicT8h9G6/kr6zxawEUoZ0EZBpAkjLgHE1ngmT7sZnxrBd36IPbk2VUt588HX0QklgB6OtHmBHnhvIf69KuJok=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199015)(46966006)(40470700004)(36840700001)(316002)(478600001)(26005)(103116003)(186003)(36756003)(1076003)(2616005)(54906003)(6916009)(356005)(81166007)(36860700001)(40480700001)(40460700003)(47076005)(86362001)(82740400003)(426003)(336012)(82310400005)(83380400001)(6666004)(4326008)(70586007)(8676002)(70206006)(8936002)(5660300002)(7416002)(41300700001)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 10:03:22.9244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b41815ac-4a69-4a2a-8b7d-08dad3834817
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8130

It is possible for a pointer to represent physical memory of the same size.
In other words, a 32 bit pointer can represent 32 bit addressable physical
memory.
Thus, issue a compilation failure only when the count of physical address bits
is greater than BITS_PER_LONG (ie count of bits in void*).

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Currently this change will not have any impact on the existing architectures.
The following table illustrates PADDR_BITS vs BITS_PER_LONG of different archs

------------------------------------------------
| Arch      |   PADDR_BITS    |   BITS_PER_LONG |
------------------------------------------------
| Arm_64    |   48            |   64            |
| Arm_32    |   40            |   32            |
| RISCV_64  |   Don't know    |   64            |
| x86       |   52            |   64            |
-------------------------------------------------

However, this will change when we introduce a platform (For eg Cortex-R52) which
supports 32 bit physical address and BITS_PER_LONG.
Thus, I have introduced this change as I don't see it causing a regression on
any of the supported platforms.

 xen/common/page_alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 62afb07bc6..cd390a0956 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2245,7 +2245,7 @@ void __init xenheap_max_mfn(unsigned long mfn)
 {
     ASSERT(!first_node_initialised);
     ASSERT(!xenheap_bits);
-    BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG);
+    BUILD_BUG_ON(PADDR_BITS > BITS_PER_LONG);
     xenheap_bits = min(flsl(mfn + 1) - 1 + PAGE_SHIFT, PADDR_BITS);
     printk(XENLOG_INFO "Xen heap: %u bits\n", xenheap_bits);
 }
-- 
2.17.1


