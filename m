Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A73874C8B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 11:39:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689751.1075000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riB9W-0007A2-61; Thu, 07 Mar 2024 10:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689751.1075000; Thu, 07 Mar 2024 10:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riB9W-00078W-3D; Thu, 07 Mar 2024 10:39:06 +0000
Received: by outflank-mailman (input) for mailman id 689751;
 Thu, 07 Mar 2024 10:39:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xW6h=KN=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1riB9V-00078Q-08
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 10:39:05 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea7ea32a-dc6e-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 11:39:03 +0100 (CET)
Received: from PH7P221CA0019.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::15)
 by SN7PR12MB7131.namprd12.prod.outlook.com (2603:10b6:806:2a3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Thu, 7 Mar
 2024 10:39:00 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:510:32a:cafe::25) by PH7P221CA0019.outlook.office365.com
 (2603:10b6:510:32a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Thu, 7 Mar 2024 10:39:00 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 10:38:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 04:38:56 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 04:38:56 -0600
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 04:38:54 -0600
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
X-Inumbo-ID: ea7ea32a-dc6e-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBS64xvIJFiZ/RmlsJu2t/bhmHzhPYvs9uksPESOdxDIUe5SW8NgACsrscNkgezUqddbKfQKW0CRld3QQdQnm2k+HxTPRgcjZL3H3y7MzxgCPfB9A8XaCFwK/VapU62dVpLhH//uhDfzgfqOg0wzS/fKh4vyccun1IKLiPbC2K4CyrAcEoVv5KkRYO1aus3z/5IFMUkBhlRH4lqTpp/t/BfOjoEP24UzJ8SVsc5oo148mGSY7IkUefGSjQgLcZ4kxHeTT67NNnPBnVbDi0P9ayUB/JWMRGQGs0UeEJghlR7TegU4XRqvgxLK3Z+dzekQejkvqzSipH9sqErJD0y4Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lDKtyh31u8dwYxymmmUfs05dLNVR57uq36d4Emq/4c=;
 b=UKimA3iljT+dE17uTdFw0/IJglP1Q0h4nzcl03SoneClpp3zdgkznIJBj09ViCRVLwyOWJlyyy2Xj1Jal9NEAr+q5C36go5RNvnG3/0B1QWkH/64Qf3O3ZwzGWPxiz9IFg8wF5KfKizD8KYUDiV9QZUq7jNZJzTZizDtADJhXKS3ESqy3gxxilwpWU9y4cvsze8D8UdmT6QUf3uLEJaHtIHmr/dzZz8aP1LBxwW235BROMOKrVfQcLUdwBLzaahmGjSRxaJ7J32QEifDvApsRxkBHWDvrupfib5BbfV4LZghofIBqikhHCe4pBk1UX0HCCB6B4G8P5cCCNjrius0Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lDKtyh31u8dwYxymmmUfs05dLNVR57uq36d4Emq/4c=;
 b=jHgd62uIAb6PvBhefbYq83NVqVUGqWFlVuVgoZDDVXi0SCFGmS/cIDRzTm7DdJ9117FXbGEoT/4MPbIdFA0G6z3frMBosQ6/ImEQ/tIjMd5vQ01Kr5e1s+zsK5FDeVK9DRZpuoDJzF4/bDeH02IS83D5e1C01wg0OyIAt+Wu/ig=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v2] tools/9pfsd: Fix build error caused by strerror_r()
Date: Thu, 7 Mar 2024 18:38:47 +0800
Message-ID: <20240307103847.3710737-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|SN7PR12MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: cfe1a8ce-c3e9-4caa-3f49-08dc3e92cc82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EgnAYggpIssm+uWVc8jTBhI1aO8EcbCQmlMvpK+GCe0UpX5goxzIBXJ+aRfIbIKOC995cP0fh3D7i6YZX0JJ+WIOcMn27y4/RjutEgamSd+K7vum7kEj0kdkIMJYdtd7y5167phDga89mHHM0d2FmTNXNCQQZBKZyE59eLP2TtW2wwiZM41tl++cdF8R2eOh/JrwUfW/3sZdxvTTQn9B+nELPCqOSZQNvZPeke2DX4oUU89S6cvtoHCcLddZ/sj7JiRv4E0R6vRz04sMJcQ39pVJWwyWXR9ozfGVyobc3ucsf87GtOHI61LzK0Ad9kOjZ5Fb06DUuud08GRvphKPxyLpU2WCb/KpvJduB3Z6guMLst43fl/RVYjB0gQxY7Uzr9jYA5UOg316GGx97jeGNOK0BGQCYUZB1sMfiXaZOImDK5xieh7yY9/aN7iLPUP+vhnFzxHZ2jMhduIl4IjHZ7q6KiJZHiu1nEScq432svJP5hl2orv/mN6nywEVtxaxzqBJL7+bWomJ1nDCdE9fdKSgY8UEPbYidevtTKSSyCe1fYRvBsnzsqpZ4ywxbxvsSvpRnEBT7AA3nSDNOqUgzKnCmm8EthFqClSMboS7ZA8ZXWEa8GPPMDhx12Av9WBdkL363A4UzYO13Syy6il8tH2pGvIRbxkC4PnoHB0UxMNzJ8c95GpD25BeqyNKlJtozT5Usm1mZtoA1lqobOgzdtNxfmc7j3dM54UAZ1FvxeJzE1CAvXi2DoMf/EkEmkGQ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 10:38:59.6378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe1a8ce-c3e9-4caa-3f49-08dc3e92cc82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7131

Below error can be seen when doing Yocto build of the toolstack:

| io.c: In function 'p9_error':
| io.c:684:5: error: ignoring return value of 'strerror_r' declared
  with attribute 'warn_unused_result' [-Werror=unused-result]
|   684 |     strerror_r(err, ring->buffer, ring->ring_size);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| cc1: all warnings being treated as errors

Fix the build by using strerror() to replace strerror_r(). Since
strerror() is thread-unsafe, use a separate local mutex to protect
the action. The steps would then become: Acquire the mutex first,
invoke strerror(), copy the string from strerror() to the designated
buffer and then drop the mutex.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 tools/9pfsd/io.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/9pfsd/io.c b/tools/9pfsd/io.c
index adb887c7d9..2b80c9528d 100644
--- a/tools/9pfsd/io.c
+++ b/tools/9pfsd/io.c
@@ -680,8 +680,18 @@ static bool name_ok(const char *str)
 static void p9_error(struct ring *ring, uint16_t tag, uint32_t err)
 {
     unsigned int erroff;
+    static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
+    char *strerror_str;
+    RING_IDX strerror_len = 0, copy_len = 0;
+
+    pthread_mutex_lock(&mutex);
+    strerror_str = strerror(err);
+    strerror_len = strlen(strerror_str) + 1;
+    copy_len = min(strerror_len, ring->ring_size);
+    memcpy(ring->buffer, strerror_str, copy_len);
+    ((char *)(ring->buffer))[copy_len - 1] = '\0';
+    pthread_mutex_unlock(&mutex);
 
-    strerror_r(err, ring->buffer, ring->ring_size);
     erroff = add_string(ring, ring->buffer, strlen(ring->buffer));
     fill_buffer(ring, P9_CMD_ERROR, tag, "SU",
                 erroff != ~0 ? ring->str + erroff : "cannot allocate memory",
-- 
2.34.1


