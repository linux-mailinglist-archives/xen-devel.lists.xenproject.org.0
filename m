Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D5B9EB412
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 15:56:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852653.1266392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1eq-0002wY-Pk; Tue, 10 Dec 2024 14:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852653.1266392; Tue, 10 Dec 2024 14:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1eq-0002tP-M7; Tue, 10 Dec 2024 14:56:16 +0000
Received: by outflank-mailman (input) for mailman id 852653;
 Tue, 10 Dec 2024 14:56:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/ZW=TD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tL1ep-0002tJ-EO
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 14:56:15 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2414::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e40b8f43-b706-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 15:56:13 +0100 (CET)
Received: from BN9PR03CA0865.namprd03.prod.outlook.com (2603:10b6:408:13d::30)
 by DS0PR12MB6390.namprd12.prod.outlook.com (2603:10b6:8:ce::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.28; Tue, 10 Dec 2024 14:56:05 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:408:13d:cafe::a7) by BN9PR03CA0865.outlook.office365.com
 (2603:10b6:408:13d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.15 via Frontend Transport; Tue,
 10 Dec 2024 14:56:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 10 Dec 2024 14:56:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 08:56:04 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 08:56:04 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Dec 2024 08:56:04 -0600
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
X-Inumbo-ID: e40b8f43-b706-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3ugzgyr7CB6VNkr5y7KZUGG0vpXvruxmR3lo6Pt1bu/AfSsBgJ4I2xCmoz8x2MuBkZOPegrIm53c5jqbwDhFBRBnprMJ4G73/0k434qxDRt1QFlkABN/eZTo8OY02rfUxYbYTQ8x3KBL9U8qPbkq1JYGhBTJFudtMoLZvvmXub9hFYUEQSnXV+Ty+nyjovG85McBDFiHbFW6n7ZPZkCp/vqL1eL+DbHzbTJ78A97c6HR5Yvne3+3eV9k5mU9SVrDMs8pYvULBEJPVhZZpph9cUPv3J67rkr5ipptcMxIEzhQazCwXFzgaDKkWUflajQQjtpDi8tyoRk9fUvI7TeiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGbJ9fV7XYUtJgil4OU1lzyHGewiTFFjCBZYOQYbn9Q=;
 b=inJDXc9WvzM8OvuD2eJaIQN8xnWqGD/m2CewpQKvT9y9n0dN7HYal7cNLLrVE+rdu3EhynSpXfHckS5XDH/j0ntVdlnxtRFAAkpq0K7Tuv6RsTgVbbkVL6wgxvz8vyrJb9+7SDmzNxIOiB7fG64ouTmkmkDAC+d/Mym2s2NzpCqf+iX6SDG3V+durKM2rM7quLUECrZYrXoZkY/D+LPVNI5H0lmcUIIPucenVWSHgYqbDIsUThfvP7VZkS94JROsAWBfqw4sjpH8wbTM+N5dBOEe7Ht8mFHIRWEqhJ5a10RAjErnM13GyqVEX6hpfTJjDKkViSGRn9t5nbZ8Xj8hAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGbJ9fV7XYUtJgil4OU1lzyHGewiTFFjCBZYOQYbn9Q=;
 b=vkLhhdWEtRlEtItKh3q2X/tGuQWaPPC9jfEDqxNIGuNjXD7n8lie35pGNdE3fwGr3QbnJYMYOED8T2xKaEGCbP0SQRPJRa++YjLwzGCOfttVXBaPZ9pkDK6nn2hn7lkkWzjy0cWf/0SosaAaIwANUP2csxi7sD2zPup2xUBThOs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v2] CHANGELOG: Mention xl suspend/resume
Date: Tue, 10 Dec 2024 09:56:02 -0500
Message-ID: <20241210145602.5039-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|DS0PR12MB6390:EE_
X-MS-Office365-Filtering-Correlation-Id: 3284a644-cd31-4438-9eba-08dd192ac5d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jrQ5TZEfo9mph3oN1fO2vEtFKXPje2xe1oFLQ6RqerUM1j3rMXVieHoPisgk?=
 =?us-ascii?Q?PAXU+6CuN2BZtBq8XsFOm5J2D4U64dpjUg1TuP0PZvE/KfQQbuYYwwv+GroO?=
 =?us-ascii?Q?Wpzl9VePdM+j7jh8aeJ41sdF6yV21ONABsAcaw+paftZd919eTfe8TysE+JB?=
 =?us-ascii?Q?118H9reEVv3GF4Av5XtgnV9AlG7Mo00Dd5YA0fxIJhWx18tzS4xQaVBYKAhy?=
 =?us-ascii?Q?Z4DiU6x7hlSNnm2g9CGpLfUvwlFqNRJSyA1GcQXT8Z+aAZXuny3/WLHd9pKV?=
 =?us-ascii?Q?yQK84hEHnJpqrO3/sYqbq6BQDM3ZHkAg5laAh+K8sCjJN2K4rzswNAfXkTGa?=
 =?us-ascii?Q?MlXlmJqCwLCllU/Ta9DffcKO4k7LYgUubpLywYbVhBwlyhLd32fHfp/iHWpy?=
 =?us-ascii?Q?zBQ31aSk7CV8FSWHsKHsgLBkZIRDOe23tdcxuD5vT5bHYW4coSNlNDo50FMr?=
 =?us-ascii?Q?i9OurpCDyuycI8JJy9MiRsEskN0NoosxUB1kw4/M1iaOxScEm4peEITQIcvH?=
 =?us-ascii?Q?afGnj7BW3D3dDZgcHfFtGuEjoheNjmldwdGLe0nbbI8zknumtPW4nrxIEbGJ?=
 =?us-ascii?Q?tc1Ou98BaviE9qZP+iFbmeYV+88iv/2AIlAxK2JXRMAwGoc2cbOU1ISs8bGn?=
 =?us-ascii?Q?NCpxeORonOQrBzWkbptmOXcn8khAFys39M3STgUANYpnfliPtyzn5nDZ8Aag?=
 =?us-ascii?Q?YIJ71ckiLj1n1YWJpD0blxgPlvAe0AgtdMGBX4ywfgbE5xKdhUK6Vf5J/LyC?=
 =?us-ascii?Q?k2JA8u0T5iKMC74G6VhhdfLaj3N2gHBc+vIjKtRjzMSUI8gna9AfTsFhg6Rt?=
 =?us-ascii?Q?kjAySkjpD+3mMBLfAZp67XErxE/f30rJKCUKAP1YCZiFZkemJL9mRyTq+kjM?=
 =?us-ascii?Q?47PPPgOeE1bf/HRbDFcodZWnBQwdZrOThOaobCo68tYAuh5IPsVAjcddpr4Q?=
 =?us-ascii?Q?8MR+qUElw1kQAZ/M3TdS32FGbImGsDq/af9g55sLOjZ0s7kNb98O0/05da0J?=
 =?us-ascii?Q?Rul01A78ig08VacVRi2vPYXzBnfj6ZrCWfeMn9OFv5pHGVvPIFW1Eot8vLnf?=
 =?us-ascii?Q?HmCu/vMJsuBth81wK4pIkFhosyl/4brbRPPZn5XTqp7Qs7gn7gVtPYk34RSq?=
 =?us-ascii?Q?yfYTWucjkjKhLyA/0oRhidq6UZz9fYbWVR39YAP55vk8pMTqy9FYIjZAkr6E?=
 =?us-ascii?Q?IjSFzXx39SzwGzhfoF1QICjSvrrmiSL7OUJDO+Em7XqYkq9WFc9n0vuXJ16X?=
 =?us-ascii?Q?kw4ipu1VYGO7dBN9h48cJTLFYgtIMRntJbK6Se+148NZBaolCzkdEIA54fp8?=
 =?us-ascii?Q?/gWpnBrQbGT+3MdYG23hJxHGaSJGt3im7CoE/r3sjG2QDlDCvmvHDxckwHd3?=
 =?us-ascii?Q?cPPV+bgX0lN/ryVLTtI7bt6iKWIG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 14:56:05.3801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3284a644-cd31-4438-9eba-08dd192ac5d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6390

The xl subcommands are generic, but only built when
LIBXL_HAVE_NO_SUSPEND_RESUME is false.  Currently that is only x86, so
list them there.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Nest under "On X86"
Expand commit message
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8553b2e451..15f681459f 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -16,6 +16,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Added
  - On Arm:
    - Experimental support for Armv8-R.
+ - On x86:
+   - xl suspend/resume subcommands.
 
 ### Removed
  - On x86:
-- 
2.47.1


