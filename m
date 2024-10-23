Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 558B29ABBEA
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 04:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824394.1238533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3RWJ-0005CD-61; Wed, 23 Oct 2024 02:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824394.1238533; Wed, 23 Oct 2024 02:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3RWJ-00059q-2k; Wed, 23 Oct 2024 02:54:47 +0000
Received: by outflank-mailman (input) for mailman id 824394;
 Wed, 23 Oct 2024 02:54:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6MJf=RT=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1t3RWI-00051s-Dh
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 02:54:46 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20609.outbound.protection.outlook.com
 [2a01:111:f403:2406::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2821ed89-90ea-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 04:54:44 +0200 (CEST)
Received: from SJ0PR05CA0149.namprd05.prod.outlook.com (2603:10b6:a03:33d::34)
 by SJ1PR12MB6291.namprd12.prod.outlook.com (2603:10b6:a03:456::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 02:54:39 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:33d:cafe::a8) by SJ0PR05CA0149.outlook.office365.com
 (2603:10b6:a03:33d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.14 via Frontend
 Transport; Wed, 23 Oct 2024 02:54:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Wed, 23 Oct 2024 02:54:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Oct
 2024 21:54:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Oct
 2024 21:53:50 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 22 Oct 2024 21:53:49 -0500
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
X-Inumbo-ID: 2821ed89-90ea-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJ/NCCHXeKE2+3sCKgW7BMYHnug7X7zRUYJ28xCio7FU5VKr+kMFQD6GUZcrgXANjd/it/oA+FZy35B5AG2LIDKBN+7PbzCk9J6Oa3qQPzOfQ4ldJxM8Wr1eHi8dgYgGKK/aP7Guz8Eb13+3jTIEEr3KNg/8ma24MzskWx67OhI9TkhV6NNFOkSXu+WqdboYfM2vOxmPPHzYmeZ5LCKP5sJO03b7Hd7ADpMk6GnUc5v9EtxXSdaE3oYBOpaQH8q7BNAvaQDua6wxPe1qj0XUQfKzLNKSSnMT9BeCF0fm+eU5ypd/V/xeCssg4ZUfTvrB75gqnQe2XOlwjyUIGXq7Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XeVq+a/a2D6KtSOF8g9EkO6PZ2zI7kCe7cjqoeQZhAw=;
 b=uxdP3BIoXer4jd+B18n7BFcIvyFw9+0E8W+A/m0w1MZyh+m9qKDxfQDTFi0mtQqSs9nyJW8ct7NhKCWp38KoBQmn3T3ezpotjshyvWRw4lt2f/c4RlrFdqniFPLgIkIdmiWM4MUA0bhGq3mXZWpm8DiorsA6euj/OUkZ/s9ReYUhLOJHOjA/5uJhrMkxCAkqjs/pwMUt20RUIEcLrXy33mjQy1AK+vxDbGYT1UJZSovdKfXCvakKpzsjl4ramnLSJwsmuZ2KepGGn75m1UaX/bfW4Odu8w3v4aRWnkBj27hB10WnWqBgdEgfOirQGgIQYr42DnJtIOSloyySJHaCtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeVq+a/a2D6KtSOF8g9EkO6PZ2zI7kCe7cjqoeQZhAw=;
 b=PRjjlQqQFgkH98oVpiC2ta0yUxBpCB87b/6mwyu4Nyjdaxo5NCmt2sRASOHIwUFWdK8M5HOCEgc3XGT4nR+jC+Nf6HsSwocZUy+JUtbJ6jATWIGywO9SHNW9uqdPMsUkok8DcR/1CBrdYvQgAI0h6b4GSgarEjA5miWjs8ZjDHA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC TEST_ARTIFACTS PATCH 0/2] artifacts: Initial commit
Date: Tue, 22 Oct 2024 19:53:31 -0700
Message-ID: <cover.1729649255.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|SJ1PR12MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 07af8cec-8283-4fa9-a96b-08dcf30e0957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8nfgaR+j8ZXyieTjLaOi2jX9GnxetLJKydlhI/riOJwx5ah8PlZ369gqyFOL?=
 =?us-ascii?Q?zTscyemSgaRvlbUceowUzWVBnLo6zSTqH36eecYBjjASGY6iLQtO1vKlS3gQ?=
 =?us-ascii?Q?L1Y2qXFhIrQEjw3PY69z6cNmKj18NomM4AK8knBlfNrxQ45zLEhtNMjHRd9r?=
 =?us-ascii?Q?8AEgSLZsk3EviccEJVABTwo7YGxBdTGA7kl+/gE/DZlVvwEfacd+MF6An6VI?=
 =?us-ascii?Q?cUFNmqR5nAqTPzFRjEMBXVNfICVrFUG3mh48YGhzJ0Y8P5woszpr1vAJ7QuK?=
 =?us-ascii?Q?om1G/mAQD6SA8T21E0QOhrA8xMd0axuTofUu7Y6syFPH939JKLpNqPZ5jaak?=
 =?us-ascii?Q?L7ebtAqqjVst34zV0MTwtJANcjJEvJUCsTaLq2qG/BbJJeOInkV+M4UcZ1Aj?=
 =?us-ascii?Q?00OOoDC0YuENcQau1lzlwXZD/fVYr3JxMCTr6qetuxfkOBQ1SaYcHb5+3S4Z?=
 =?us-ascii?Q?JckYOlaRy6SMqu42+JWck8zuOSW/YUvI97+ERYwWP2DPlJHHmUeKrysa/yXB?=
 =?us-ascii?Q?hlLaBLvUmEQk5cp+gH1e4XokutgrFh+qxHidiQTShJrSmVDWvSeIqAq6Czhs?=
 =?us-ascii?Q?KG/cmOPCQT5ksxGrnsyrbt6NdnmerKqpq06tBUae2Sbtq5i6NAKkZ/YMIORn?=
 =?us-ascii?Q?BrXC47LeCNcGmdyO209Bk/PDdr7EFunxyIXGSGwc1yqEn7Ry/+IlI/UOVf8e?=
 =?us-ascii?Q?nDhYKuU4H0XAvqZKxwmhy+56li6zQnsE/wL0b9mD+IJ9VZWHd/t4nW9Eqwwv?=
 =?us-ascii?Q?3L7CtU7uJdX16UQnmh/h6PAWloav4uR+ouBeVX+juX9nBN/zvG3RY4fyNKMr?=
 =?us-ascii?Q?OzSzqrfAQN3oX6kXCBNbSlbRRXrykWFv6ziJMnaIJTlJ/4kimBs5yaxzHtTM?=
 =?us-ascii?Q?gqQFs5VvFpf5evhv+ThXotxnCLrXP3kLLU2D5h2NTxTn0mG+cV4Zujs2mLKh?=
 =?us-ascii?Q?u2s8ku6zhyVw2oqxvUW038UXSzdxgBvbRcsJcnW00QsBHDjHrtTADv0dXJRR?=
 =?us-ascii?Q?XLiJZYWUPWSM4nCZOXDpZZu12oKJ7baf+PHTUZ4Fje3oN4sEv9MWdnFq6vJ5?=
 =?us-ascii?Q?0cAJK2ydFNBvRGZZsVqPSl0Ct861MYNFR/MecaG7I2mYjzLkC5PY5xeuN+Sx?=
 =?us-ascii?Q?VFRtQhjo6Mj2pGcptaHw3G4FXIeUFzqsw8frmiu8DOYd8P09M1j/T2TpakeH?=
 =?us-ascii?Q?br+keY7LDzyi0IhB2/3XMOgsu1gW9xdT2Gg36KTbwlR0qxRgXxxsmcSe/na/?=
 =?us-ascii?Q?WToCXz7iHZeC2ZXurwIQibTcx/vTGstFbdQmaeexuJsehnjpnLaNCBUGlPy4?=
 =?us-ascii?Q?3JJn018PV8Vois4pQhl3DenahEL6TKUuH18rutIWM1YJ3aZvLqU2TgfmY4HZ?=
 =?us-ascii?Q?dahrLDvZYOcUIYVHv4Q5z6whguGCVjRe643Ag/3HqiVmuBv+hRKmWQt54sOV?=
 =?us-ascii?Q?b0CzwgOWZ64=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 02:54:38.9880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07af8cec-8283-4fa9-a96b-08dcf30e0957
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6291

From: Victor Lira <victorm.lira@amd.com>

This patch series is a proof of concept that a separate repository can be
used to generate kernel, rootfs, and other commonly used binary artifacts,
and have Xen test jobs load these instead of generating them every run.

The current configuration of Xen CI generates these using "dummy" jobs
in every pipeline. This unecessarily uses a large amount of storage and
network traffic because artifacts are duplicated overprojects/branches.

Instead, use GitLab CI built-in functionality to retrieve them from a
separate repository using the "needs" keyword. The "needs:project" feature
is currently limited to 5 artifacts archives from external pipelines per
job, but web requests can be used if more are needed. It's preferable to
use this as opposed to just web requests since this doesn't requre modying
the any test scripts as long as the archive has the same directory
structure.

The example of a test artifacts repository:
https://gitlab.com/xen-project/people/victormlira/test-artifacts/-/pipelines/1508031895

The example of the use:
https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1508069266

Stefano Stabellini (1):
  Initial commit

--
2.25.1


