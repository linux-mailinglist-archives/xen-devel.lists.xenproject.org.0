Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D858CDF6A
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 04:17:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728979.1134068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKUJ-0003Oa-13; Fri, 24 May 2024 02:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728979.1134068; Fri, 24 May 2024 02:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKUI-0003Mg-UP; Fri, 24 May 2024 02:16:54 +0000
Received: by outflank-mailman (input) for mailman id 728979;
 Fri, 24 May 2024 02:16:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAKUH-0003Ma-Ru
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 02:16:53 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac31f690-1973-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 04:16:48 +0200 (CEST)
Received: from BY3PR05CA0052.namprd05.prod.outlook.com (2603:10b6:a03:39b::27)
 by LV3PR12MB9095.namprd12.prod.outlook.com (2603:10b6:408:1a6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Fri, 24 May
 2024 02:16:41 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::e4) by BY3PR05CA0052.outlook.office365.com
 (2603:10b6:a03:39b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.9 via Frontend
 Transport; Fri, 24 May 2024 02:16:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 02:16:39 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 21:16:38 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 21:16:38 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 23 May 2024 21:16:37 -0500
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
X-Inumbo-ID: ac31f690-1973-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGMT2Yk7yr05+5JxfPAA31OIMzY4dLl1ebSMMVQTjjNzkO2mb5CCWaPCLnPBgFnuPCZ9hI/Mz49t7mSnhx7yAX7d8KS92GRIyZf3KQxiL2bxJUCCuaYsDwlcGYNAIM8K8HjJoONfe5E9VOk9El1DA3cgrSNTmVGM3kgw/96sF7Z1OCnv5t6ntAaFSdabfaVhOj0ymkQHMn8NaEddy5smYX80a9+HbF/PU6Lfwyfbr3Xq+nrQcp6vK6u3nc92xm01/AoawPnuOUASY/tPpqlszFOZDB0SbW3PXFDVoGZC/WxZV1FRuAUrc6A3zqTBbMI/5iBsu5/mBQXHU5pfd19hFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppfuxHZIBQNKASSxfSPTIvxjawH5qY0rEI4KTAaepq4=;
 b=UdmTR9dQxz1JHsL8/Hk/IDRzfQtOFf9GaCLPIDBtt6VVL4r5FGTRfN9QTYGXuORYYEmt1ZNDUOwt8yTQxz/GelmDn4wXbump6X4siQIKOH9ou9gNCw36SVqMmqDviXrPtwICg8fAURkKzLaifJyOt/BliT9XHDEmFSV6PqZniI1/UvGZSx1ezdQme31Jbi3+KHjBQUYKb8fyJD3/npk0Yegv1w/qzj0MouBeI3xC0gRJAyo95ia3+R1QzIt8BhT1jAFaUB+D/J6KfuNLUJ+aVa9My2vFJhEChcs8q5qwOMljOxnI4c9ZoYl8Bl1nWC2LOgaqKHbzV9QZThKtJ+6acw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppfuxHZIBQNKASSxfSPTIvxjawH5qY0rEI4KTAaepq4=;
 b=qPaPuXFJyikb5iff+kfTpvJHy02QEMG3vgUNjP1SnRHj/QbW5pC6xYqbvFdcLZQQz67j/RoICznQbNSAp339yhYuIT8ml3KnYHX6T7PDdouHlTeT30PurQZK8YYlqYEEJ/i8AlM+eGbO8UbLlKWrxeNqEfADVX2ZnRq8+UfMDeQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Thu, 23 May 2024 19:16:37 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>
Subject: [PATCH v5 0/7] Remaining patches for dynamic node programming using
 overlay dtbo
Message-ID: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|LV3PR12MB9095:EE_
X-MS-Office365-Filtering-Correlation-Id: a74b48ed-88f9-48f2-e73f-08dc7b978c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|7416005|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MKO0EjWV6yNc48/xgPNK/fKyOXBuE5iukPttnxCyZGbaMDrT5EFBtl/Qa3DG?=
 =?us-ascii?Q?IrbvpVCY8DvT54g+ZU+9QQtVbYDnPfjNg0I+pd32H0AjTYgCM+OCBtCTuwcJ?=
 =?us-ascii?Q?3Ys20U64Plc+o43DVKWquuoeKNgSDO0OFL/7bjoHdti3cjUM6PvqXQdufnUP?=
 =?us-ascii?Q?9zKK+tlWe2JmYsygqcRwuodZvEu7OMQ/Bote/x0qwLjAxY4fbTfBSI4fdG95?=
 =?us-ascii?Q?XgfObadcMlASw0LeXrR8Afm92gWUkdoLTacSfRIYYRwAqD+6bANC5hSdhmuQ?=
 =?us-ascii?Q?X4cVdc7iqcNBOZMPGsThNCLbYccX8QihXbeqzvzr6IvCjeozAQ1ssgqaZBjg?=
 =?us-ascii?Q?Qi2oBAFHHljAQ6L6NF685HgQX7VuBSTCXV2T2Vq4eLrFgNIn7mwPXB9FZ08z?=
 =?us-ascii?Q?K5gR4CTJKyxH/7vFmZNDmJ1tq6EcablFSrgxOu7s3VSv3TtKx/4vbiL9m3jI?=
 =?us-ascii?Q?LC3dymy3/VXqJCHO3yU+UaI2v4pW7zGy7p3+3C+DNY9TSSyBUtdPvAskeuLa?=
 =?us-ascii?Q?wJYGRRZhffXy+qUw4gu59D+ytlqhIyqbLRIpcw0Rng6FasiDy4/G1vQ59R+g?=
 =?us-ascii?Q?6W4c1iL12Xwo13ABmYWlvHiJ1cF8ExJTk9KewJimmaqpWNRMGWicOhLXlmkQ?=
 =?us-ascii?Q?qGwXJS3tIigxVCSU/N+gcGsE705ITF4X8IyGteXOn8vcqZyY1jok8vmUDot/?=
 =?us-ascii?Q?43wtLT8dREqwQxeNRl7I+F/8tbrCk+mXIPOAWC8QZRSNo76wId5run/ESYyQ?=
 =?us-ascii?Q?fP/0NEb02dftblAthchaas/b+9OkhEgg2JIV5N5dlzLxzIbSuDjez/sdWd0W?=
 =?us-ascii?Q?V61EmEhZg8+QrUWFJtOmZQ5cGA+Cztq72Ieb38sIFhnWOg/+MVgC2c30LMft?=
 =?us-ascii?Q?m94eYWSmFPQ8F8PDXURIXV70BmmF2pr+xTdMPs3xjTP13rGYSV5rev0cxI3M?=
 =?us-ascii?Q?u0m5Ls9F9U2I7yjrvenCXlYILL+jOB0XVXSgjNuQctous+p3BmfvMwUZzXsw?=
 =?us-ascii?Q?qjN+QOlLZDk2cK/g+bCrAdpISEL4Z2YUGLpP/l7dHb8XbLYN3OvdowEARDcl?=
 =?us-ascii?Q?pAXZiwsgRXCPgGKChBzipjyds11SKicJzcrPpOzIZ2lWwWySx0lGXYNb8W8l?=
 =?us-ascii?Q?0OQUEM95/2Gmj72uBE99/vDtVQMfSfySATVijTkoRt4k7LlJ7QeAMJlhiA8U?=
 =?us-ascii?Q?rORCNestOkjuC02T8Mg8tP+MhYeD2oq8HhBmOII2o8XK/K1fJi10QXb5YpUa?=
 =?us-ascii?Q?ERwSPo2osgy/8qsT+WplzEXqladmp+n2AjzDYlXVndfg+sMxDj6QrJ4AFhv1?=
 =?us-ascii?Q?ii8IGZdM6Ll4St8kTC0jUl16?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(82310400017)(376005)(7416005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 02:16:39.9268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a74b48ed-88f9-48f2-e73f-08dc7b978c22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9095

Hi all,

This is the remaining series for the full functional "dynamic node
programming using overlay dtbo" feature. The first part [1] has
already been merged.

Quoting from the original series, the first part has already made
Xen aware of new device tree node which means updating the dt_host
with overlay node information, and in this series, the goal is to
map IRQ and IOMMU during runtime, where we will do the actual IOMMU
and IRQ mapping and unmapping to a running domain. Also, documentation
of the "dynamic node programming using overlay dtbo" feature is added.

During the discussion in v3, I was recommended to split the overlay
devices attach/detach to/from running domains to separated patches [3].
But I decided to only expose the xl user interfaces together to the
users after device attach/detach is fully functional, so I didn't
split the toolstack patch (#8).

Patch 1 is a fix of the existing code which is noticed during my local
tests, details please see the commit message.

Gitlab CI for this series can be found in [2].

[1] https://lore.kernel.org/xen-devel/20230906011631.30310-1-vikram.garhwal@amd.com/
[2] https://gitlab.com/xen-project/people/henryw/xen/-/pipelines/1301720278
[3] https://lore.kernel.org/xen-devel/e743d3d2-5884-4e55-8627-85985ba339f9@amd.com/


Changes in v5:
- address Julien's comments
- remove patches and mentions of the "detach" operation
- add a check for xen,reg and return error if present

- Stefano


