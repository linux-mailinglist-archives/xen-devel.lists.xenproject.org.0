Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CBD79E978
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 15:36:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601322.937336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgQ2s-000055-8w; Wed, 13 Sep 2023 13:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601322.937336; Wed, 13 Sep 2023 13:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgQ2s-0008Up-6D; Wed, 13 Sep 2023 13:36:42 +0000
Received: by outflank-mailman (input) for mailman id 601322;
 Wed, 13 Sep 2023 13:36:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PyFF=E5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qgQ2q-00080R-NU
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 13:36:40 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 908fb9a0-523a-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 15:36:39 +0200 (CEST)
Received: from SJ0P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::24)
 by LV2PR12MB5728.namprd12.prod.outlook.com (2603:10b6:408:17c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Wed, 13 Sep
 2023 13:36:34 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::2a) by SJ0P220CA0012.outlook.office365.com
 (2603:10b6:a03:41b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19 via Frontend
 Transport; Wed, 13 Sep 2023 13:36:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Wed, 13 Sep 2023 13:36:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 13 Sep
 2023 08:36:31 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 13 Sep
 2023 08:36:27 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 13 Sep 2023 08:36:26 -0500
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
X-Inumbo-ID: 908fb9a0-523a-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFK+qv8ZtoyLiWmVwRdYGaEJgM17z5dqB+oDHkGq9K8UK9n2Ed/AiYd8c6/tAgxQcKDwwZIb5NtofwGVr7KtYO57+Q0BxUafyfNVulCwDU+5LnxtLN5s0AfHfF2IncBjcpep3xdzAQxDzkKSuYODoMl/+lce5i2Ax//Atu9kaePNxKFJkyut5KguLldi5v4misY2bpnEu93F+J82+DOkkQN9lLtht4cvu9ICj/B5LmNXkbJQYNS98EsmvXb/BqevofyrKu0E2OTzzvGlDKNVjNxKKX9Z1taB4MsB3vrpRMdiSFnr0puO9aEg5DvhsUd8QJazUvxKr6z1OcBPaq+mMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5dYe2H+xWSbIMkmTT7oWuL4uPScGFRTG23ethSVjfs=;
 b=jTvrtR2+LQ+pw1V0GDJTdaboeIewmT+Z4ucubLZCIOr09YYRE+MIHe6PTdDmIv/sPcAlIUvsWrzh20PVQl6myghHVDPpr6OwGt9jGQYFLcpdqqOdJrSLqFPKcrdtW6nu9DRCze20c7mfWR5bvg6JEj2j6ujYaeccOB124rzuPrUancR0+WZHOe3q1+Dqmey5UJERJlJAplIMaDDbiPXUYbRNuxomVoOu0EwskxzWSotFw0t20Wsn9+8OVGxsCLck6ts8GamtdbwKkUkSD/AYAbBQGsGT0YrOrfUm+4zofjDd1l+wGYedzmM4swZ9tYO3f2q/a9fsgIvviHSVohjg2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5dYe2H+xWSbIMkmTT7oWuL4uPScGFRTG23ethSVjfs=;
 b=EtOB3RlDjINdgPq7qMfhdAtpHOoaJt+j4m8MoKOAtBHUpgNOxtwpeGX1osAGJTiIKvy4WYFfKb2/B9iRcuaKqIba2a9vAltUq2ook5oDnndGuKJJLV+zCkE265U/zKwnucxLwJ/YZFY0ujvEZtS9x4I1SSKBHAr/rcSflEjJiFo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <5c8e2dcb-a341-4d9b-c23a-0c4f659ee3d2@amd.com>
Date: Wed, 13 Sep 2023 15:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [ImageBuilder PATCH v2] uboot-script-gen: use size from arm64
 Image header
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
References: <20230912204345.7271-1-stewart.hildebrand@amd.com>
 <98187155-3263-6197-ddb3-07cf9b883264@amd.com>
 <2d0f5df6-d5bb-a31d-94d3-33bb1fe8665d@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <2d0f5df6-d5bb-a31d-94d3-33bb1fe8665d@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|LV2PR12MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d6864f-c032-46f8-8aa1-08dbb45e7171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mbdNCGAut+Oh8hZ5zauBT1YyFczjwnG5iYA6iMoYQT8/UXPybk9vRtwPokQk/W037c1PJphQ4ItdqCTxFGQkASTftk1mQoze/PBmSdXNRAplOj1gqUXWiKyovOYCa17V2L/NEfV6yYlm8azZd2NCygbScOdD+MA/YlH3lN/ct3JZnqGjC7CEIZ/hD2Vv0VU0lwMwGn9PB6Iy4KCAVA11OdCjqg6MatFsDwjVOPvmW4z1BxbVhPDh5LpxRZCjQZYlRSXkiWCa1kn5worXWXIaAsuJuFu8hTfQLKBm/tVaFwnkBgZ0lpvqxH23nWd3dVP0AAW3W+i+wR+SBg1KKoEqmTkHaPp8o6DjwjHnDIdBG9lplWbiNcDRg/FGWibJyJ+9gJ36chfWJRnudvjgLG04uE+MI40r4vPH0H1RAdK0KyzpXCqL5UYz7XVXUfaYjX7zMYt3JaB8l1YO6aG12VL26jqpXv41W1aXap+1//gkB7Dkb4UarFVndEa493iHBSFg33JWTt8Xqe7tr7Z5IwkwLPbsspnF2qsIVT5R3ywSf1zTe63Z4iWEjIZ/cn20KDFcTKaP6IR8Znsyp8kGJCrJyP0Y7B5sMyHeWebHrL88cJz1oJcDjwXU8eUFm+aYn49Iknn2Ugj17gVpEIgH4hRyWV8Q1KC6vxGK/gQpf/b1h2VGhoxkX7TFdhdtD/QBezCqlyXHzgf2kMqpZ5eOTuDf2ny1HGF8Jws9YGrtSRlP2PoUjYdbo/VHcBtaztNXQSWLmggSJ6DhEbn9mmiSJ9GZc0de4m2hXjgEnjNEqJN8M98=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(82310400011)(186009)(451199024)(1800799009)(36840700001)(40470700004)(46966006)(40460700003)(53546011)(83380400001)(86362001)(82740400003)(356005)(81166007)(31696002)(47076005)(36756003)(2616005)(36860700001)(336012)(426003)(40480700001)(26005)(31686004)(70586007)(16576012)(41300700001)(316002)(4326008)(8676002)(70206006)(110136005)(44832011)(478600001)(5660300002)(2906002)(8936002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:36:32.5624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d6864f-c032-46f8-8aa1-08dbb45e7171
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5728

Hi Stewart,

On 13/09/2023 15:31, Stewart Hildebrand wrote:
> On 9/13/23 03:27, Michal Orzel wrote:
>> Hi Stewart,
>>
>> On 12/09/2023 22:43, Stewart Hildebrand wrote:
>>> There is a corner case where the filesizes of the xen and Linux kernel images
>>> are not sufficient. These binaries likely contain NOLOAD sections (e.g. bss),
>>> which are not accounted in the filesize.
>>>
>>> Check for the presence of an arm64 kernel image header, and get the effective
>>> image size from the header. Use the effective image size for calculating the
>>> next load address and for populating the size in the /chosen/dom*/reg property.
>>>
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> The patch works, thanks!
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> with one little suggestion...
>>
>>> ---
>>> v1->v2:
>>> * add in-code comments
>>> * use variables more
>>> ---
>>>  scripts/uboot-script-gen | 17 ++++++++++++++++-
>>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>>> index 9656a458ac00..f0972d983017 100755
>>> --- a/scripts/uboot-script-gen
>>> +++ b/scripts/uboot-script-gen
>>> @@ -2,7 +2,7 @@
>>>  
>>>  offset=$((2*1024*1024))
>>>  filesize=0
>>> -prog_req=(mkimage file fdtput mktemp awk)
>>> +prog_req=(mkimage file fdtput mktemp awk od)
>>>  
>>>  function cleanup_and_return_err()
>>>  {
>>> @@ -435,6 +435,21 @@ function add_size()
>>>  {
>>>      local filename=$1
>>>      local size=`stat -L --printf="%s" $filename`
>>> +    # Read arm64 header magic (https://www.kernel.org/doc/Documentation/arm64/booting.txt)
>>> +    local arm64_header_magic=$(od -j 56 -N 4 -t x4 ${filename} | head -n 1 | awk -F' ' '{ print $2 }')
>> can we simplify:
>> head -n 1 | awk -F' ' '{ print $2 }'
>> by just doing:
>> awk 'NR==1 {print $2}'
> 
> Yes. I'll send v3.
I think it can be done on commit, so please check with Stefano.

~Michal

