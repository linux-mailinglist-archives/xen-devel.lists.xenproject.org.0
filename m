Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E554A6EDEF7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 11:17:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525920.817443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prEnD-00043S-Jl; Tue, 25 Apr 2023 09:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525920.817443; Tue, 25 Apr 2023 09:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prEnD-00041R-Gf; Tue, 25 Apr 2023 09:16:59 +0000
Received: by outflank-mailman (input) for mailman id 525920;
 Tue, 25 Apr 2023 09:16:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dmH=AQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1prEnB-00041L-Vu
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 09:16:58 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebd96e39-e349-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 11:16:55 +0200 (CEST)
Received: from MW4PR04CA0254.namprd04.prod.outlook.com (2603:10b6:303:88::19)
 by SN7PR12MB7451.namprd12.prod.outlook.com (2603:10b6:806:29b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 09:16:51 +0000
Received: from CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::a3) by MW4PR04CA0254.outlook.office365.com
 (2603:10b6:303:88::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34 via Frontend
 Transport; Tue, 25 Apr 2023 09:16:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT013.mail.protection.outlook.com (10.13.174.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.20 via Frontend Transport; Tue, 25 Apr 2023 09:16:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 25 Apr
 2023 04:16:50 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 25 Apr 2023 04:16:48 -0500
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
X-Inumbo-ID: ebd96e39-e349-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5GdVPIo3ax4hXGsZQRsuER/4Br+JzxTKb+PlKVLKL9hT2dbSV3erDC1BjFk0um4OMlEJvoN5WijlmQvzS+1klmGfef3jGG7YRjUVjvWBOrH2tel2FwtQyWhEFcvmZN4SqahFjiCpuogxfTdbObR2Qkc2a3ssfBDxsgNnGAaBhsNx1fE7hjUp4y8Na0xc0mYMtcrOfgpZT6dMTmN2bAnBXvuUw1XBxT6BJFNjz4/+3S56wxt/HLl57icuQG1D27InRH3+28v5ClqwrXmX4KgLXsM7TuWOKTjTAY8EM5psKNLfY5KSfKfzcnRltP6rRZoSforMuikLp9rzyMHAL/CDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Am36Z/cVjOhEFeXClzPQpcORJB52iIGKESmRFUjF08g=;
 b=f1W02WmAr3pEE0ia0GlUugWduth2e+ObYIXxZFVL/AvTZ5DBgV2p9RsS21rrdnzAtg5tZ4RG9hmVfVfS358FyCagkKpB6zCg9BT9r3mqXk70bSZAO1agzJoINeusvJfHzGN0lBMuzuZ2RJb/a2eUMGoNxp2sBxMNi4niz+3BAcOlZ/Tes4QYCd8w+6HsYJue2s7Bl6l6YD8T7i7tMDps3JwVMFzEkE8KIPKj1RShL3GwdmsnwuRn9HHvVO0gLQ8Opbr8kQZUjxzPYMtuydCCZzls4gwqvRTmxJn+zn1socsPsI8pxeshaP0C2hDS1uG5AhDFwBc48W/HUaqe9cvJSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Am36Z/cVjOhEFeXClzPQpcORJB52iIGKESmRFUjF08g=;
 b=jZhn4cGae0sS7n07mCtZ2AMIeEmIqPOI4Duvke3O73CRu06if4rLD2WOrMq7pdZSIEz38T74GC9+OtmM1J4TKH8B+5qAUtgEE0SFQRtdLGtjl2MkaHOxxOU6xWFiLXTN6k18+erQ+PH2mZfNSmsq9OWG9ABnl1eaczn5sLSZpsQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a9b8b2ee-1b41-7fc4-2cda-3f490e70ada6@amd.com>
Date: Tue, 25 Apr 2023 11:16:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 07/17] xen/arm: introduce a helper to parse device tree
 processor node
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>, Henry Wang <Henry.Wang@arm.com>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-8-Henry.Wang@arm.com>
 <8ce925a1-dadd-79c3-3b0f-c3ab45b1a669@suse.com>
 <36e27df0-7fdc-5f1d-ebb7-0b021bdae2bf@amd.com>
 <d998b0cd-d8da-6022-3ec4-acfb798d5d3f@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <d998b0cd-d8da-6022-3ec4-acfb798d5d3f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT013:EE_|SN7PR12MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: d8dde6a4-42ca-4e3a-a122-08db456dcdce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ROpxwRGAOPtdFNdqeEAu2B5KW5/BYY6qn5fD2e/nRu/zPcNRozOC28t54QD3ZsB9Mk/vPIwnRvyhCVJcoZ4VuPquKe8Ahu+lllIEKnBOxIRrRtNT1Dck0lPfmKSCMQGrTv85Db9uah92GAd0uIp1N6Tj9yiySNa5WCfAUXSVmsDcxw2riNT5wMODRm5sPJihM3wLMABtISObILGDelaR0AK/w2Pr28N8mm/uyXrWWZ4Lq6s+pvY8U028XsfOJ0YKRBFj2WChI8UAdqYsDdXBqof4qdzKgkwyZq0wzNkyYqaTx3O6aOgoD83rUi/r3c0dO2Ch10CZ+4yTYLPYF0wyRK8J3OE+0egB7mOVMBGLTNmkRQ5j1MulPfwcwWdXyvirceh0yrFMxQ9fs6ot3+vBd+/YWd0SpOHNgypONxvwSIH8jIKjxYY7DrYKYusS9yzp6iuWj3p73PGQrX3P347qW+Iiw5h9z/XXNZtaZ2mEEx3o7OJXK6IZaJ3m585w/qBbSTIBUYnS34Izs9tsokgaeY6vnSVKijSsg1BQWVbTjmXHqtX5xf0WvUx4iSlqKfeK+Kx5wF50EqYvnEXxrbuTRHW8ZoJox2o5aVuNW+DPvQSnirLRt03ro/fAY1UgNfcNVV0aAHq1596FBpUaBxmCQ7u4aNnifWRE3CGc5DvfopIusjt0KisO5ueY04HxrrPXH7aO95ef16XNvNhlQbEn8/dTFt/Qg08YslE/fxBO75dRTSs42BUBHwDokPuYr6rRy0v4hVVRvyAC/wtp1ecDVg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199021)(40470700004)(46966006)(36840700001)(2616005)(44832011)(40460700003)(2906002)(36756003)(5660300002)(86362001)(8936002)(8676002)(40480700001)(47076005)(31696002)(82310400005)(16576012)(316002)(26005)(53546011)(54906003)(186003)(478600001)(6666004)(4326008)(6916009)(41300700001)(81166007)(83380400001)(336012)(426003)(82740400003)(356005)(31686004)(70586007)(70206006)(36860700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 09:16:50.8117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8dde6a4-42ca-4e3a-a122-08db456dcdce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7451



On 25/04/2023 10:47, Jan Beulich wrote:
> 
> 
> On 25.04.2023 10:39, Michal Orzel wrote:
>> Hi Jan,
>>
>> On 25/04/2023 10:20, Jan Beulich wrote:
>>>
>>>
>>> On 25.04.2023 09:56, Henry Wang wrote:
>>>> From: Wei Chen <wei.chen@arm.com>
>>>>
>>>> Processor NUMA ID information is stored in device tree's processor
>>>> node as "numa-node-id". We need a new helper to parse this ID from
>>>> processor node. If we get this ID from processor node, this ID's
>>>> validity still need to be checked. Once we got a invalid NUMA ID
>>>> from any processor node, the device tree will be marked as NUMA
>>>> information invalid.
>>>>
>>>> Since new helpers need to know the NUMA status, move the
>>>> enum dt_numa_status to the Arm NUMA header.
>>>>
>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>>> ---
>>>> v3 -> v4:
>>>> 1. No change.
>>>> v2 -> v3:
>>>> 1. Move the enum dt_numa_status to the Arm NUMA header.
>>>> 2. Update the year in copyright to 2023.
>>>> v1 -> v2:
>>>> 1. Move numa_disabled from fdt_numa_processor_affinity_init
>>>>    to fdt_parse_numa_cpu_node.
>>>> 2. Move invalid NUMA id check to fdt_parse_numa_cpu_node.
>>>> 3. Return ENODATA for normal dtb without NUMA info.
>>>> 4. Use NUMA status helpers instead of SRAT functions.
>>>> ---
>>>>  xen/arch/arm/Makefile           |  1 +
>>>>  xen/arch/arm/include/asm/numa.h |  8 +++++
>>>>  xen/arch/arm/numa.c             |  8 +----
>>>>  xen/arch/arm/numa_device_tree.c | 64 +++++++++++++++++++++++++++++++++
>>>>  4 files changed, 74 insertions(+), 7 deletions(-)
>>>>  create mode 100644 xen/arch/arm/numa_device_tree.c
>>>
>>> As asked for in various other contexts, may I please ask that new files
>>> prefer dashes over underscores in their names? Additionally short but
>>> still descriptive names are imo to be generally preferred; in the case
>>> here how about numa-dt.c?
>>
>> Seeing that you made this request multiple times within the last months, maybe it would
>> be better to write it down in CODING_STYLE or CONTRIBUTING? Otherwise, you will keep making
>> these requests indefinitely without people being able to know things like that before pushing
>> new files (+ this always requires respin).
> 
> Well. I could make a try, but getting ./CODING_STYLE changed has proven
> to be difficult in the past, and I would prefer to not again sit on such
> a patch for months or years. IOW I've become quite hesitant to submit
> such patches, even more so for things which - imo - should go without
> saying.

I understand your point. It might be worth asking e.g. on a community call
to see what others think (for now I did not see any objections). It might be
that everyone is ok with it under good justification.

~Michal

