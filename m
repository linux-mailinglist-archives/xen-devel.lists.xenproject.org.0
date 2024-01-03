Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21553822E7B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jan 2024 14:36:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660953.1030642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rL1Od-0001bh-Ta; Wed, 03 Jan 2024 13:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660953.1030642; Wed, 03 Jan 2024 13:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rL1Od-0001a3-Pp; Wed, 03 Jan 2024 13:34:59 +0000
Received: by outflank-mailman (input) for mailman id 660953;
 Wed, 03 Jan 2024 13:34:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+sDa=IN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rL1Oc-0001Zx-3f
 for xen-devel@lists.xenproject.org; Wed, 03 Jan 2024 13:34:58 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1c01b49-aa3c-11ee-98ef-6d05b1d4d9a1;
 Wed, 03 Jan 2024 14:34:56 +0100 (CET)
Received: from CY5PR20CA0011.namprd20.prod.outlook.com (2603:10b6:930:3::6) by
 LV8PR12MB9358.namprd12.prod.outlook.com (2603:10b6:408:201::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 13:34:51 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:930:3:cafe::ce) by CY5PR20CA0011.outlook.office365.com
 (2603:10b6:930:3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13 via Frontend
 Transport; Wed, 3 Jan 2024 13:34:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.81) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Wed, 3 Jan 2024 13:34:50 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 3 Jan
 2024 07:34:49 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 3 Jan
 2024 07:34:49 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 3 Jan 2024 07:34:47 -0600
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
X-Inumbo-ID: e1c01b49-aa3c-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwwP/VxVW+8Yi6tynv5X8H6up19yyDnorOh20hxlmjKEsbyaFOnuDtjvtDy/dZffxdzF9+O2b8g1UfTDygJRQem0ZQPuJvt2+ymXZFZGeD82zUH6j/C9RrchMVZIA+Ay9vzM1W5PTYBlkvjCfxX7AkoHO35C35Z61/fjv6ai54Ce3iH6sSOHzHxt1oeBEZobvEXZXKGw8Z3woQBgGvScuGvcf2+iWm0plbBn9j5a3MV7LB7FMp07OTZ5lfO3PpIoFiettC/LSMyJOzvRkCjIuGk3qo3DfXpgIXRCnoVeWsW5TA5JCVyDHCthViwmCteTMZ00yA2AOkdya7anUVkvRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXIH0y8c2NXSOH6MYca59Y5ms4J4oWRk9WSB63zMS4w=;
 b=L1XQKmqrSvSxlqkc9OjXfFfiJ50wxQ12GuL58qcGIrJ+2WtYOifN0Ft0EuFpepRY4QPxDvTkTeB0ONMDF2SZKMX9qM9VsmgjeaJztiJxDYaeGbx7SzCegJbesPZFsBDXPZuD+pVw0v7XVxAP/59GioPfZx+ta4IWXh6SFhYH5f7P/deE+pUpYwhnj0EgV0OgPHgKtOsnIgC0ssAOFhAVJdQWSxheV0iOJyd3mcWn4ErK43YGbr+cqqq32yfCp/0r5qiiX1lm38/X6HP5jl7VfNJtFPn0PygQ6PIizbA34zR3sxc8HLZnEVxdZzTqgSz7cCLWJTOuLE+M1q6ZfWx+TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXIH0y8c2NXSOH6MYca59Y5ms4J4oWRk9WSB63zMS4w=;
 b=u+cRmB9Ku3X1VNE7whFbOuRjlWj6EzJSzff8mOttlnJcu2BI4hzQ3qWHN3RZafS7VeZ+KaRpduxRbGmwnkvqZlwBacidFxCxHmGBUIB17q09e2VRfWFEbuJRyNp46vmNJoO+DFbJMlur5kyojg7qd9MoGkI1SyzHlOO0Wq2TXIo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6d652309-50e1-4850-ac52-d086a3a32726@amd.com>
Date: Wed, 3 Jan 2024 14:34:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/13] Arm cache coloring
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|LV8PR12MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fef1119-f272-4006-2766-08dc0c60c2e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WWsLzV4mtwGdAGl2LZ89SMQhFZN6TZWH/7OvKl/4iZMZK8qJHCyk6YO7Y4dqK9BIEZGQB8MEbkNDR9RZ4mxIla7dAobNTnrthIFmrDt6mQEMw5BpoIVvg6eMfoN9wCG7cKEXaWzECCbZJzEiCHfsZvpaeoB4cFWkn1H6JTmjq+mzMqjRb9aJgu9si0VIF3EViNBtAXtUxz8dZG/93vDnq1/29O8Aslx29mDZZu2jE/QkKPGT55nxgkl6y3WRVzCobeluytptCgkGjP10OTGuZ+dpkuugOPtle3/k5ddJRDz6scUdRLhS9YmSKt+q7emGDz7Zyj1yAUikLsrQEECcYg6sRChKgmouL2JhiUBqOTBAHCbjQgVMcB6Txme5N0+pGJhQIdrSSa0VxEGD6GnWywCJgeAWj9+g4d1JqskdH8gdXDjAEkSAJm14yb2zi4b7WC55D4FtUeyHYd1pr19GhJJZryRNVJULPOUg1NBptSIzw1ArTM0vzVWL0sC4ni7rQGh2zqBiKp8XuzOC0RBmyIbEW9E6FDVWldpKVhFCqHHDCtmzkPSJzArPtqqmfcOhYVk4k7LctW5Va4UA5rMZbReBe+Ql+cZWW7Ya8/h20LoRGcDWfuMDeAKO3HwZIDvkBE6kFvxcRIIp1ABurANUGvPK6FtTCAwpganBj8W9JSYz+FYMNm3z7n72AYFWRf9ij4/XMCzFjd4iYYXqM2C2O3hVbM933i6/fWtO6R8HfTJPPq707R9BF0m7eZ/YH4Qe6tLlV9kpNZcG0TqTD8axLaNzu44dh1e2i2rsEYL7IfE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(1800799012)(64100799003)(82310400011)(186009)(451199024)(40470700004)(46966006)(36840700001)(31686004)(40460700003)(40480700001)(426003)(336012)(83380400001)(26005)(36756003)(86362001)(31696002)(6666004)(81166007)(82740400003)(356005)(8676002)(44832011)(47076005)(4326008)(41300700001)(7416002)(5660300002)(8936002)(2616005)(53546011)(36860700001)(70586007)(70206006)(54906003)(110136005)(16576012)(316002)(478600001)(966005)(2906002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 13:34:50.2521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fef1119-f272-4006-2766-08dc0c60c2e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9358

Hi,

On 02/01/2024 10:51, Carlo Nonato wrote:
> 
> 
> Shared caches in multi-core CPU architectures represent a problem for
> predictability of memory access latency. This jeopardizes applicability
> of many Arm platform in real-time critical and mixed-criticality
> scenarios. We introduce support for cache partitioning with page
> coloring, a transparent software technique that enables isolation
> between domains and Xen, and thus avoids cache interference.
> 
> When creating a domain, a simple syntax (e.g. `0-3` or `4-11`) allows
> the user to define assignments of cache partitions ids, called colors,
> where assigning different colors guarantees no mutual eviction on cache
> will ever happen. This instructs the Xen memory allocator to provide
> the i-th color assignee only with pages that maps to color i, i.e. that
> are indexed in the i-th cache partition.
> 
> The proposed implementation supports the dom0less feature.
> The proposed implementation doesn't support the static-mem feature.
> The solution has been tested in several scenarios, including Xilinx Zynq
> MPSoCs.
> 
> In this patch series there are two major unacceptable workarounds for which
> I want to ask you for comments:
>  - #3: allocate_memory() has been moved in dom0less_build.c, so I just copied
>  it back to make it compile.
I would move it to domain_build.c and add a prototype in domain_build.h.
You could guard it together with allocate_bank_memory() for DOM0LESS || LLC or just
remove the guards (in former case, you would need to protect your call with #ifdef in construct_dom0()).

>  - #13: consider_modules() has been moved to arm32 only. Again I just copied it.
I would move it to setup.c and add a prototype in setup.h.
As for the guards, if we want them (personally I don't see the need), you would need LLC || (ARM_32 && MMU).

BTW. Patchew reports some build issues in your series:
https://gitlab.com/xen-project/patchew/xen/-/pipelines/1124313980

Make sure to build test your series on different arches. You can ask on IRC to become a member
on gitlab so that you can trigger the pipeline by pushing the changes to your fork on people/<you>/xen.

~Michal

