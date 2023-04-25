Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 845DB6EDE4D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 10:40:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525894.817411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prEDo-0007oO-8E; Tue, 25 Apr 2023 08:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525894.817411; Tue, 25 Apr 2023 08:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prEDo-0007lE-4m; Tue, 25 Apr 2023 08:40:24 +0000
Received: by outflank-mailman (input) for mailman id 525894;
 Tue, 25 Apr 2023 08:40:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dmH=AQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1prEDl-0007l4-Tj
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 08:40:22 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce4e0d77-e344-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 10:40:18 +0200 (CEST)
Received: from BN9P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::23)
 by CY8PR12MB7244.namprd12.prod.outlook.com (2603:10b6:930:57::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Tue, 25 Apr
 2023 08:40:16 +0000
Received: from BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::39) by BN9P222CA0018.outlook.office365.com
 (2603:10b6:408:10c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34 via Frontend
 Transport; Tue, 25 Apr 2023 08:40:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT057.mail.protection.outlook.com (10.13.177.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.20 via Frontend Transport; Tue, 25 Apr 2023 08:40:15 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 25 Apr
 2023 03:40:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 25 Apr
 2023 01:40:03 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 25 Apr 2023 03:40:02 -0500
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
X-Inumbo-ID: ce4e0d77-e344-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyA1jSptl/o30kx708Cv58lW6lwkGqBu0d8+AEaG+/5hmxbdEdc+QtUGz9Ge53gqrv6W+Q51xkn03EvUEjlPB3fWEimsFGaaNtmwQJzV5MyGAlbLqC3eETCa9zInoq2B30Ujgv/9IMd+tLqqYXnx/0QHL54VCO+yeRqllTCNOWlpWBKm1cwgvnUxDqyXQ0COrr4arRz4lNMRNpQlv3Ce+NYqKELtu7Tyh/D/xuznYmWdjRROIeD+/e/X433xOX8vZ6UoblDnl9b6hU7W7PfSF7P3VVnlmGZleatWi9gnwRCkTUFGhfUaGX7HvMngQx/zKESoI0TKFRXFHGK7jWxGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5paBJTUOvhG4VMZZAzjbXUjIwXGSXCGhIfccklRUmHw=;
 b=N+pEnd4+FdQGqwk3+WHeLQ+eU9YOb5uG5QzteSYqkzZhaTqiP6TbWacp8VJIouTmm6m9kJpJGD3xZ34lReHx7y+hzxRAQk7eiUK1jmC19fcitXuUtHZlnZt+T/9YVyoU2pETo4pF94nwm+iWV/l3W0IIzOaOxnK/HxUxpnlvKu7BbUSmJs9zvUDJc7ipGebS4c23+dSvPAiD255kdfGPRPPObjIi64jUVXXSsiMpomJRjOuqus8Ju2HtLvws/I453vtW9WaV40H3hok+80sbuIqu1/QSL3+RBVD5vrT9rD+xM2iKn55JH/BMrYy1Vt5b6vQcZ81Hzv/J6aJFAjDYug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5paBJTUOvhG4VMZZAzjbXUjIwXGSXCGhIfccklRUmHw=;
 b=Su7ZAbRcJIHz9Y48ngPIunFsekdkhUE+3iOFNjjX5aBqeTmBURUFPuaQ+SzpJVE0VoJR7brVSsbGE1uaqIpbASeg4qVKbPXL2oOK0Jz/U2PoqBunfFiFCbVq4/zuLona9oiJJQh8wjFWaggevAkqwbAMLUhRGqIPgZgZHmWb4RI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <36e27df0-7fdc-5f1d-ebb7-0b021bdae2bf@amd.com>
Date: Tue, 25 Apr 2023 10:39:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 07/17] xen/arm: introduce a helper to parse device tree
 processor node
To: Jan Beulich <jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>
CC: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-8-Henry.Wang@arm.com>
 <8ce925a1-dadd-79c3-3b0f-c3ab45b1a669@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <8ce925a1-dadd-79c3-3b0f-c3ab45b1a669@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT057:EE_|CY8PR12MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 59a2529c-925a-494c-117f-08db4568b13c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5uReVzpBoL4qoljIGOr0Ni8rypggTGJASfJ19BE0cWd5FsB5w6F2hiuT7/epkfd6KptMjEGRpJ4N9JpGfQCsDFz49NZd83BcSdo0N6gSaLwA9NYutwH6LvN4df/UUpgOd+NCd+9BpVBpTbG+wiFUkrAyk43d3vgcgHFbmAkPQu2k8Cb2Z8DbSN1sDUDii1eW7mYZKYiMhpUl+rT++XrBqRdzazJ9CyQduMia0mv3wK3Hjuf/zJAAcP1jl4tyPzV0Gm8GRt8kL4puFydC3jMYNrYXXUPQvIMPiMVNk0KTVhCHh8sUCR/B/asNVssnK6o4l0th+gOD46fDyxBbm1tJjq2URMj6v5uA3CL+5IWc7mG5TYHQS62WEjz6iRWAzjAOOdwl4XVDy0Zoze0YHg524kUvWjPskpUcMaCKoBXiiYeDVElc3hQnatPddHVaW/PCL4vAefXvbu8tJkdClAndfRSQNrzUr/KF1FxjkcQgQYQqLcQcZJzyKeUE3e108PWc8fK4fwW9FoCFgCqf8ovlSFY0mq0JzKSD1H2w0Kx8FQ2TuN0rIRAOx0hLIVdkPeIlt+qsP0qlrMLFi/UQMV6xiaIJlAZ38PvNHVIzBFzJmsUQxp2NOWTryQ5Q+0sLQ66afxMAw5MBMh2Ny91q6/jECPBzc45R3H1o3N+sO5MhM0uM815CwaJTdocCGXJzV9pqXY9915v3tl5ZcLJNaovJL4ie7czXa0TtQqGRWgLVyqJTZ7gYZP5OalMttPQt/pu2D4/0NW/Ri60+yTRJlCjzJA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199021)(46966006)(40470700004)(36840700001)(186003)(4326008)(70586007)(70206006)(82740400003)(2906002)(81166007)(356005)(316002)(41300700001)(5660300002)(40460700003)(44832011)(8676002)(8936002)(36756003)(6666004)(82310400005)(16576012)(110136005)(54906003)(31696002)(40480700001)(86362001)(478600001)(53546011)(26005)(2616005)(36860700001)(336012)(426003)(47076005)(31686004)(83380400001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 08:40:15.5007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a2529c-925a-494c-117f-08db4568b13c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7244

Hi Jan,

On 25/04/2023 10:20, Jan Beulich wrote:
> 
> 
> On 25.04.2023 09:56, Henry Wang wrote:
>> From: Wei Chen <wei.chen@arm.com>
>>
>> Processor NUMA ID information is stored in device tree's processor
>> node as "numa-node-id". We need a new helper to parse this ID from
>> processor node. If we get this ID from processor node, this ID's
>> validity still need to be checked. Once we got a invalid NUMA ID
>> from any processor node, the device tree will be marked as NUMA
>> information invalid.
>>
>> Since new helpers need to know the NUMA status, move the
>> enum dt_numa_status to the Arm NUMA header.
>>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>> ---
>> v3 -> v4:
>> 1. No change.
>> v2 -> v3:
>> 1. Move the enum dt_numa_status to the Arm NUMA header.
>> 2. Update the year in copyright to 2023.
>> v1 -> v2:
>> 1. Move numa_disabled from fdt_numa_processor_affinity_init
>>    to fdt_parse_numa_cpu_node.
>> 2. Move invalid NUMA id check to fdt_parse_numa_cpu_node.
>> 3. Return ENODATA for normal dtb without NUMA info.
>> 4. Use NUMA status helpers instead of SRAT functions.
>> ---
>>  xen/arch/arm/Makefile           |  1 +
>>  xen/arch/arm/include/asm/numa.h |  8 +++++
>>  xen/arch/arm/numa.c             |  8 +----
>>  xen/arch/arm/numa_device_tree.c | 64 +++++++++++++++++++++++++++++++++
>>  4 files changed, 74 insertions(+), 7 deletions(-)
>>  create mode 100644 xen/arch/arm/numa_device_tree.c
> 
> As asked for in various other contexts, may I please ask that new files
> prefer dashes over underscores in their names? Additionally short but
> still descriptive names are imo to be generally preferred; in the case
> here how about numa-dt.c?

Seeing that you made this request multiple times within the last months, maybe it would
be better to write it down in CODING_STYLE or CONTRIBUTING? Otherwise, you will keep making
these requests indefinitely without people being able to know things like that before pushing
new files (+ this always requires respin).

~Michal

