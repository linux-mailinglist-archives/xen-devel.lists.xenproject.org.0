Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CF85ACE9E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 11:17:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398641.639534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV8Dj-0003T5-6x; Mon, 05 Sep 2022 09:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398641.639534; Mon, 05 Sep 2022 09:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV8Dj-0003PZ-3a; Mon, 05 Sep 2022 09:16:43 +0000
Received: by outflank-mailman (input) for mailman id 398641;
 Mon, 05 Sep 2022 09:16:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxbR=ZI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oV8Dh-0003PQ-8Y
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 09:16:41 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7242b572-2cfb-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 11:16:39 +0200 (CEST)
Received: from MN2PR15CA0022.namprd15.prod.outlook.com (2603:10b6:208:1b4::35)
 by IA1PR12MB6042.namprd12.prod.outlook.com (2603:10b6:208:3d6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Mon, 5 Sep
 2022 09:16:36 +0000
Received: from BL02EPF0000C405.namprd05.prod.outlook.com
 (2603:10b6:208:1b4:cafe::a2) by MN2PR15CA0022.outlook.office365.com
 (2603:10b6:208:1b4::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Mon, 5 Sep 2022 09:16:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C405.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.10 via Frontend Transport; Mon, 5 Sep 2022 09:16:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 5 Sep
 2022 04:16:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 5 Sep
 2022 04:16:34 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Mon, 5 Sep 2022 04:16:33 -0500
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
X-Inumbo-ID: 7242b572-2cfb-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLgeAxttNn54vlxZWAB5m37D8eq/zgvWYN6WKgxC8aPxQlGoIgCd5LMs/dWKJBlv20939reHy0Ot6pihvgFnLTvLtWtkv94frQ6JVVIiPmfB5zHMvM/+8SPo5BGBPWTvL6gaqBj0DOIUHWDolXNvC+MmB6LvByu7nePLbaGUbfp2+vYMGV0fCoQvHqbWiHISIAOLO42SeB1YUfe/OzrtD1zVWd6bpxLjERzZlF8Ip0lG1oHBhuVYTDeVzm2MMR9wM+/Rz51QFl0+qqePN3ZUyoqvamSnYHgmqb7O+5lGPZW56VONJOAI2T7Tz3aGOo1v2WErYfkWiCO1fj9dGOmv9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtmLFL+3KZ8xG33Tl3+dVb7YfA4SCCuaU6TuGlBgmlw=;
 b=SiIXkCVxq8yq4rVXoH+ZTqzBGC2stwpbMdbPjtMzuYCbDAw8pj0tJ14MBDfup5jg8unxjrEZQ1r8Y1SjyYMuAmuiGR7mzezguqn17fLdJYCUud7qp98hsV5BixX4bIZHb2/uRSCCamUKkKTIFkNfHpMiemfSBzW1egxN/VYmwjpz3o/IvkF/cdKKkHnIPL5uojdXEI296euBX5EvnkpGNDcxee9oosaHqjH6f2IHEFkdhhKQtSKPlXWWFW/UE2cMG8GidPP3J9T+CZQ0h3OWrjNkO3Zr2UNq47pUrKuFxyV0aO6shU3xkzD5EFPrZU/Hmjikgw9JytpNUCuDPF15wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtmLFL+3KZ8xG33Tl3+dVb7YfA4SCCuaU6TuGlBgmlw=;
 b=balsLUaFUrL7fCXZar+iysLoozPMbSDiUzyh+o0GV/+JstxmmJegzjCM3zIGL6SwP5GFkzaHI3hv8/qW38yHTYXOrCoI3qwjIJvqLMXU2JtyzCcVPQs3UAle0n7d2qqL8Mt0XQ5EL3mNoIJKTH+50zcT11xBDF3iXlKQNeNpb1Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <865125f7-9a15-6495-051a-64b08d6555d6@amd.com>
Date: Mon, 5 Sep 2022 11:16:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 2/4] xen/arm: bootfdt: Make process_chosen_node()
 return int
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen
	<wei.chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220905072635.16294-1-Henry.Wang@arm.com>
 <20220905072635.16294-3-Henry.Wang@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20220905072635.16294-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C405:EE_|IA1PR12MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c59d6d-8a8b-4e81-218e-08da8f1f54e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aeQCWT5AWUqlTskiAbNafSh9eDiMMZEtegJWzecGKElTkz9odmP4m0RYG2nitcH+/4TTTFdeNOGH2UPQpG3wkAWxpIsdtpmlpWVT9s/jiGd0s7PNNToZpg9yFGfCH4RmuLnUIq0gK+LHbvFgh7qEBSp/5sgPKI+HSRmxMru3qiBe8OdJi4Nh+a89kUUhI/KTuXW9t2q/g2xWP+bW1bJSkgBr+pz/v1CcWGZWE0GHIbZ8pCkAQ82rUw2cvOy46rfuU/EFTzrPPoa3fjb6ri+cL5fuyebLwDV8l8DivHmll4J5cXAB7xW4+0kkmIYu3lxcUOTK5ldjM+6o0Gg5BsXggPaAFSEsOmzAUQ6Gkk9AoHb3aeiuYUjbvPbxBNBVJgytnUtfwe2iDxjqJK+RImM6LDz/gXl2jqkQ23xW3y6b/NvoV+z6Us9BfqnRGWD4tMZB2FbKD5wmEGzut3PoTrkm8OJmKX/k5Q/xrl0NJMVSUVuoR/hn455Vx1XrSkIA+sX0+MpAkIPvVkCSFzeBb0v50M2zdVblA7uyjNPc+rm4uVrKR1OZspH5bUZQI+M70YTSRsck2Fsb/T95cROkqcCFKRVhXH/K+M8J0zBI3TnkhlbxczayWdm/Vp1kj9LnyD4dWKil4r839vr5mpheWsMPVc496jPSKQ91uU3vE8jJGw5nVfR7vsa9YFXcIP+rvssdQzV+zC6UKjNhllK8yASmicaRqKK6iaPXkAsARpilS4jTUg05lhBm7/p0cwWo/bKxxLkzAmCv+d4mZZnF696PSJpAVPePfCQAMxamtz/tivwAupsPOFTETUycklDBWgcismAf+50XH/rkjjYAP85cBQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966006)(40470700004)(36840700001)(47076005)(26005)(53546011)(426003)(2616005)(336012)(186003)(36860700001)(356005)(82740400003)(81166007)(8936002)(5660300002)(8676002)(82310400005)(40480700001)(70206006)(36756003)(4326008)(2906002)(44832011)(4744005)(70586007)(54906003)(40460700003)(31686004)(478600001)(31696002)(41300700001)(86362001)(110136005)(16576012)(316002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 09:16:35.6297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c59d6d-8a8b-4e81-218e-08da8f1f54e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000C405.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6042

Hi Henry,

On 05/09/2022 09:26, Henry Wang wrote:
> 
> At the boot time, it is saner to stop booting early if an error occurs
> when parsing the device tree chosen node, rather than seeing random
> behavior afterwards. Therefore, this commit changes the return type of
> the process_chosen_node() from void to int, and return correct errno
> based on the error type.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> Changes from v1 to v2:
> - New commit.
> ---

The patch looks good but I think it should be put as the first one in the series
as this is a natural prerequisite for the introduction of the reserved heap. This
will also help not to modify the same reserved heap code you introduced in the first patch.

~Michal

