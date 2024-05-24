Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D4C8CEC56
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 00:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729882.1135183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdDD-0006zz-3M; Fri, 24 May 2024 22:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729882.1135183; Fri, 24 May 2024 22:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdDC-0006xk-W4; Fri, 24 May 2024 22:16:30 +0000
Received: by outflank-mailman (input) for mailman id 729882;
 Fri, 24 May 2024 22:16:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAdDB-0006xe-Gd
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 22:16:29 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42c2a4fe-1a1b-11ef-b4bb-af5377834399;
 Sat, 25 May 2024 00:16:27 +0200 (CEST)
Received: from PH0PR07CA0007.namprd07.prod.outlook.com (2603:10b6:510:5::12)
 by SJ1PR12MB6121.namprd12.prod.outlook.com (2603:10b6:a03:45c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 22:16:22 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::a4) by PH0PR07CA0007.outlook.office365.com
 (2603:10b6:510:5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Fri, 24 May 2024 22:16:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 22:16:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 17:16:20 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 24 May 2024 17:16:19 -0500
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
X-Inumbo-ID: 42c2a4fe-1a1b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GS0mQMh+LkWGDzPh4Va4ANT0ULRmwtgEZ1kD6CRGs87btuTwfeN4ZcI+6zAcn13plyPBhnG5r2kLRYBUe3TVZ2mwASV/sKxCqyps1MBmXe4lhHteE2h8tPXV2iPJJs9dlQz2HkA8NDbVjWH48fzL1VKR9yvVGnUJv+LtUw4RwZScs5136jifTLo05G3G2kanosiOdwL4yc1lUTDkO5SuVjkvQgf5mfQfFrAvC9fGrt8q7HgZPd1kVFHrIvt/RyqJd4gZiOnIQbXGe6mNqH3K/CTYawpyKKrnlsYELxSKCOsRxiyIJt99W5QDmuW0kSeEb8GKxTKSj0ODibxcq/Jxvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptcLF8WT724EvyJqTvtI6fTRdxA3T83ZeikxU5Q7GAs=;
 b=ZoNWWw0kMjC1AdwywpA9fX73CQHax4wSadNJZV4a0mU2/6Vd65fiUDO27tgt16CFWWHqKGlIFwKGB6pZNqz1fcfC5jDeLLvOi+SKiE/T1aTCchJTi5nZ0G7eXKErfFxfmfkAXbcyRQFk91hfAssdDJP8EaN3MyF9NgdJSx2tNGJGKQd6Ce1PBpD7MU9wQ+Z3DRfyuTGYRnhDSvGQf5tciSAh22g0IGKPlLh7q446X1sLStD1GM9yFVJVFNEeYjB+NFmXY3tiMima8pz5dlv1bAAI8B6DZHFq5LfiyTlZ6NIXuFdapmRH+fzYvJAZNm03G++Y0q29Mc61JwmMusdnUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptcLF8WT724EvyJqTvtI6fTRdxA3T83ZeikxU5Q7GAs=;
 b=zo5TY71//DFDd2mzo6g0oiBv+5L5tsz83GDrIV31e1XHLTmXwfuuP8MuQ9aQq7HcbWOdCU6zHmPAlsuyAFUewfLuNL/kV4PqOOQF+RbymMHsZfglUpLQK+68f3HfSO2UhNtOVbqgAtESctiGmvl3pqDcVd7tC2LB72qQEpiRswU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Fri, 24 May 2024 15:16:19 -0700
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
Subject: [PATCH v6 0/7] Remaining patches for dynamic node programming using
 overlay dtbo
Message-ID: <alpine.DEB.2.22.394.2405241515210.2557291@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|SJ1PR12MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: 5378656e-9bbc-45e9-7a55-08dc7c3f2429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017|7416005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NzzVz8xnSRgo//uVWWo5hLjhNenm1STuX/s2ZCQPDn2dIcS6o2zGDeMwaRpV?=
 =?us-ascii?Q?IFJHgKWnRSDsiCTggpn8p5oUGn5NojstsSrQfJIPKNMt1omxAG49O/hfHKsU?=
 =?us-ascii?Q?HmNo6NTsd3Y5BkOrRyUZz6GI8idYfSpDwbil4dI3e8lW8xvhzKwemQ8RzI4s?=
 =?us-ascii?Q?2x5OFPdpSriqNDvvCM/WhfL5p/i4Tt16cP8vrY7uRXHZWm+pEZoESFhdxx0H?=
 =?us-ascii?Q?H4hBop+qvAkkDrpxCetQ5Gk5N7bNstlqW/pCGTaKP991ipj0qN1cGbSHAfrL?=
 =?us-ascii?Q?kqQ72XN4+60U+zB5QdKEbB5+IdkEIyLsKG8FtMv5RwtxH3xQNPbqFUfFz9m+?=
 =?us-ascii?Q?HFn4W9yiEJYpFqqtoVenevtlrvRzvbGvJspmbaY4XBJ3J1rqDoMMQYalqeix?=
 =?us-ascii?Q?Nn36rBFokc7mWzES/Yki3oVfcJ5BNS4dmZAbzDAezdV5TWjZ/7z4jkxyfGy9?=
 =?us-ascii?Q?9SMc44l2k7yATrijaHuimJzNZh4Q9q+SorBpAmWklYf/rZ18zvR3G+GLqxaf?=
 =?us-ascii?Q?q1lED5MMIMHcRpgXmIGHios3YqMi1iZHAczHoAjjo7d4RTo95krSxHqdA/DK?=
 =?us-ascii?Q?wA4VAZwxrjfwTNMXMMRx143HTa/VtTmmx+M/Hmhlzgnc2q75Q+UCQ6QfcD5w?=
 =?us-ascii?Q?/jORAazbWxRyMj478ZhquM1PKbqzvpkgWWt+7JqhrhQmniiwTs6aNTruCdWI?=
 =?us-ascii?Q?+3FmxmMgFKUD0/DIpAGDEz2fl+JMM9JTRdBOVTdZATQHqQAwQE2g9LI/PU9I?=
 =?us-ascii?Q?ouGFxetbUr2o9PskNbqqfoLj5Y5wWWbVL9FYhWTNNpC4QlgRrea23LLOHKQ5?=
 =?us-ascii?Q?8arNFbzAKLGC08vGNqWQ/gvZA38bDO44Z7lau19OttUSZ+mK/mmkj6jyu624?=
 =?us-ascii?Q?KVGmDS/phdpp7MDgiFflhRddgoJiOGBYzGXtH57rwxaMxrfxm5xk2tqptN+n?=
 =?us-ascii?Q?peFaRKtlkrR5HpauQFSKrOMM17Tp6rahAn6qh2/QycknudVRJtJBvbcyK9rq?=
 =?us-ascii?Q?UvsRvP1YeJR0mbYHlzPhpPrA0Ar8J1sJ+Cqv26SxR/feudVXccJUin2wuivk?=
 =?us-ascii?Q?1XpGEgrKjdqopBQRat7tlMkXkAXXykNfxuqlGqYrdowy4v1dcp9B7OkydjQp?=
 =?us-ascii?Q?NARCaigC5Z/7oRJUS74+AHN9UAcJGd5HPefFIkTDTUXZBRMaUIfDzDVoL/q7?=
 =?us-ascii?Q?LhQl/btlR8VNgbjPb1o79fWzHR54bAZtgY9LA6NaVUhjQhxy/6fVnyhE8Nby?=
 =?us-ascii?Q?f7VhVzxtvAVgn/m3cNXVcWQ9pPId6k/Yd4Gj/vf/uupt+UoDBIKsm/BKGLF2?=
 =?us-ascii?Q?QXZaH7Cv/jp4L5wCbdUru1+v5qwPdDDk2Uu/uOe036VqQw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 22:16:21.0187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5378656e-9bbc-45e9-7a55-08dc7c3f2429
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6121

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


Changes in v6:
- address Julien's comments
- use a !is_domain_direct_mapped check

- Stefano

