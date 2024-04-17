Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30D98A82F2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 14:15:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707445.1105377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx4Bi-00035E-DD; Wed, 17 Apr 2024 12:14:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707445.1105377; Wed, 17 Apr 2024 12:14:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx4Bi-00033V-AN; Wed, 17 Apr 2024 12:14:54 +0000
Received: by outflank-mailman (input) for mailman id 707445;
 Wed, 17 Apr 2024 12:14:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R6tE=LW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rx4Bg-000329-Us
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 12:14:53 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1719083d-fcb4-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 14:14:51 +0200 (CEST)
Received: from PH8PR20CA0006.namprd20.prod.outlook.com (2603:10b6:510:23c::11)
 by IA1PR12MB7493.namprd12.prod.outlook.com (2603:10b6:208:41b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 12:14:48 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::da) by PH8PR20CA0006.outlook.office365.com
 (2603:10b6:510:23c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.24 via Frontend
 Transport; Wed, 17 Apr 2024 12:14:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.207) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 17 Apr 2024 12:14:46 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Apr
 2024 07:14:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Apr
 2024 07:14:46 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Wed, 17 Apr 2024 07:14:44 -0500
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
X-Inumbo-ID: 1719083d-fcb4-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHYwIlxrc2XzNNv2z1yfQMxSDRNoilAUyMlT4Xl+iXUbCOdgrV+pCdKb6lrx2XNKAT9TIPD1CFCCKWEucT6MjOsWa3b23LKSuxv+ev2k6IgnkmVL8HAy49r8BfuL1pVwZwFtVgpHOwcQDiB92E2NfizwE1mmp2CbpwECte7JUN313lwWy15tU29TNhoGJvnG074nwI0NkizzmXMnWsPUJi0IpoZAtQIofuqo59Yky1v6etlq+sKm3FeYtG/XkZ0IXcZm+xbPIaxB+HPp3pA7ujTHCu41qZI12RkB868cpxqmjKBB9v2o3gvwK0100p8F2mNNzCno7rhlnYzC8UnVBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87AOnwj0YmJESyxXcN9JBbPhqtf3pO0sLJy1fuUzuxk=;
 b=M2AVjA7JXXbinoIa99XVnmXMr92iz1OMguDKyPKVT1ZFj5oAvQUyQxatOJ3oOu+hfyf+ZqBfsXLtHMSJ4cIm6qN2G5R6prUoK7BdJlzpywq/iOm28CLysXc5iih1d6Lt3uAjxhlMhCTqJrZV+v7MCVwNxJZ0nNw4Cm4GI4YV1w4TJCFyIu1iRzjQoyj24Z6x3Sr8BL+9Fl2toiSxdRZy8rTD1cNKeWcmK+XA/nKqmSvWRK4o8/GzLGxuUbiUFOZuWS2dkgV/KhhvsGd+PE3g6cC6lGyOvUPMcpEAlTpHWTopBdsKyRrkhErjXfkr4vaZCGKYf5DbefW8suXRdInCuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87AOnwj0YmJESyxXcN9JBbPhqtf3pO0sLJy1fuUzuxk=;
 b=mlX3jPtvvflo9jsHb005EDfURLCIUWK0gQdRkrA9GrXpuVLZ0WzqATXhhysLjE5O9wpmIUQEgqwdVfsBTuwSFn7xXsv4YrTcjORLd8Ye2CFAT5UdN2ll6zL89fW2/t/lHMxZAqL/CKeUk3JYk1vOlueLRkkF8en2ctdhUpdxDA4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH] public: xen: Define missing guest handle for int32_t
Date: Wed, 17 Apr 2024 14:14:42 +0200
Message-ID: <20240417121442.56178-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|IA1PR12MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b3d7f73-4c86-4b2a-f3f3-08dc5ed7f922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sSPR9C9m8LrysR2oIzZxUVHV+iG1b94Du34m9wUvn1gEEbHNyR8L8xE7LEDIbvwj/2k0Nvo/jcq+wJiw/UKmxDulfxF+1/oevBE2lL/nKAQBzr0eZ72u2zEkp6Nri+u/4Y2QOIu3E3JwXA8zvsEWZKnV8Ga0GI9EnfchuLwqQEYiwWdIFx/eYq116KCOojKRBDw5JWArdpfQbg/xKN42dqIq8gvZWpNhEdBHwMFDioThjwfKTn9UVgREPLrZAuFfj/rEMZjism7UvmlZRdYSIhttcrkKHYDgqg1vHm7/XrtUa6JZDOcK2GEZs8IwOn1MIp7HQOzIgsaMDYMdeEw/vOOnnv9o2sgbs7j1gDfj6surKCm1b3ee8ck8c2MSCIusMBXgEVMQfi2dKsIh29RfC+RqI32/j+862rFDzgeSNuLuxG9TStP8+6LrN62fvqIZ7mJoEjaZYhgulYtjwkB9eCWWQnzePuqPcmCubd/MZ3g7L7l6Lm7Y0QHKkBHhiGmtw3AuzQgxg91jHuFYyl5+lPRrRRS0Ywxp8f5PTbUTy0aLSEpWqCdVXwALsrmQ/AqdmGQ0TJIzoowuLcuU2feXT+/mMiFQP92BBY+H7QJ42KEgWAGuVOfZM9eO9j3C9wk6Bcd9roh4r3md1uf/lOtFukE+4lZcwLlb1c5epqf5DsO7idvzNSjTJmRs5CMb7m+7+egFQb8JHcbzzsEd0W2v/SLdBpMqegM5WNfWyv9+s9fxSBlTb3baEAzN7BcNLtp1
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 12:14:46.9471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3d7f73-4c86-4b2a-f3f3-08dc5ed7f922
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7493

Commit afab29d0882f ("public: s/int/int32_t") replaced int with int32_t
in XEN_GUEST_HANDLE() in memory.h but there is no guest handle defined
for it. This results in a build failure. Example on Arm:

./include/public/arch-arm.h:205:41: error: unknown type name ‘__guest_handle_64_int32_t’
  205 | #define __XEN_GUEST_HANDLE(name)        __guest_handle_64_ ## name
      |                                         ^~~~~~~~~~~~~~~~~~
./include/public/arch-arm.h:206:41: note: in expansion of macro ‘__XEN_GUEST_HANDLE’
  206 | #define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
      |                                         ^~~~~~~~~~~~~~~~~~
./include/public/memory.h:277:5: note: in expansion of macro ‘XEN_GUEST_HANDLE’
  277 |     XEN_GUEST_HANDLE(int32_t) errs;

Fix it. Also, drop guest handle definition for int given no further use.

Fixes: afab29d0882f ("public: s/int/int32_t")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/include/public/xen.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index b47d48d0e2d6..8fd0cec880d5 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -28,7 +28,6 @@
 /* Guest handles for primitive C types. */
 DEFINE_XEN_GUEST_HANDLE(char);
 __DEFINE_XEN_GUEST_HANDLE(uchar, unsigned char);
-DEFINE_XEN_GUEST_HANDLE(int);
 __DEFINE_XEN_GUEST_HANDLE(uint,  unsigned int);
 #if __XEN_INTERFACE_VERSION__ < 0x00040300
 DEFINE_XEN_GUEST_HANDLE(long);
@@ -36,6 +35,7 @@ __DEFINE_XEN_GUEST_HANDLE(ulong, unsigned long);
 #endif
 DEFINE_XEN_GUEST_HANDLE(void);
 
+DEFINE_XEN_GUEST_HANDLE(int32_t);
 DEFINE_XEN_GUEST_HANDLE(uint64_t);
 DEFINE_XEN_GUEST_HANDLE(xen_pfn_t);
 DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
-- 
2.25.1


