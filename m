Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0D963D95E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 16:24:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449952.707006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Ovk-0001d2-G0; Wed, 30 Nov 2022 15:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449952.707006; Wed, 30 Nov 2022 15:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Ovk-0001a4-DE; Wed, 30 Nov 2022 15:23:24 +0000
Received: by outflank-mailman (input) for mailman id 449952;
 Wed, 30 Nov 2022 15:23:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HXMn=36=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p0Ovi-0001Zy-4z
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 15:23:22 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb5e2f33-70c2-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 16:23:20 +0100 (CET)
Received: from MW4PR04CA0116.namprd04.prod.outlook.com (2603:10b6:303:83::31)
 by PH8PR12MB7159.namprd12.prod.outlook.com (2603:10b6:510:229::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 15:23:17 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::ac) by MW4PR04CA0116.outlook.office365.com
 (2603:10b6:303:83::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Wed, 30 Nov 2022 15:23:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.17 via Frontend Transport; Wed, 30 Nov 2022 15:23:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 30 Nov
 2022 09:23:16 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 30 Nov 2022 09:23:15 -0600
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
X-Inumbo-ID: eb5e2f33-70c2-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIzyGvJb79n6F90RHYpA8cDBTZtOY9MBtREw5AddjMk0qgNiHrAxKYXoroxIIJE1tqdkkWsv5g+fjDm0ng6M2fMsFRyeDzOMj0ERqBqoj5P2yyExUHC09jC7aTW3SnBAq1gmgpjC8Vsnqu3chBoYushoJkCFbJIvzBE+ke5Sxl5xvz5HASVk6/uuWJ25M/Gq0suKZF3JgflZQM+y6wqggZTrweK+IIe9hpwGgQm6Y76Bat2ZRpzQZqlhzrrVPuV990OG/hRm3Oqr5UC2Vh1uqp3rRBxL7lPQzyCCgym20J+LJ7kOx6x6bm0bOGv5rB2/Zeb6DmsFHnhCJwjgAiHXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LZiTT/etiwKJz8NHGkNsH5Q2Ru8GDkp4OT0oxH0eIw=;
 b=B6s9Nfgpw9g31pLt27ZAbMDAcvaPDdUUJmbwBo2njuO2u6yg9uUjWlNSOJmizjtKAa2gT29GFIhRw9yjF9iTaxuGek7xYbTwU6wpMxeUkvdRhF7TiW8BLk7P0z+p6hyZ4ookWd3esDATh6NPN96eUfS9y/T+m8L9G7jAjZt/cqaKjNWV5QSRpmaHfqS1cbjcW0w+1lSU237GCDoQjcHDncKlmI1zU0dYcH2pSIp9twmMZ2SiyeLlbxrsmB8rcLy0enM7Xtyrmr7O7jhER8K6OdKEfoyW2pQneZIjy1IhWYLKcCR0c34LPgdG4O31b3JVFWHMKhjdZqapYUmg0fVPsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LZiTT/etiwKJz8NHGkNsH5Q2Ru8GDkp4OT0oxH0eIw=;
 b=KT6ccQNrIgDHsGD+NvSD1S0t7c1w5Lh9GKF/0iGPaRx2V3YIbryEa3KGp2BT/YJPbVv6Eyg2Ja0t3cacvP/qjyZw7rGWKUnVh1gPLpWAIY5B8hND7Q5R3na/AKqviKJx7fm2giHKAgsvpSpf1ZKuQklpw7zftZZ9vXqBov5X8sw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <7310c943-4402-745e-c012-077f7c520c2a@amd.com>
Date: Wed, 30 Nov 2022 16:23:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 3/3] automation: Add CI test jobs for Yocto
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1669810269.git.bertrand.marquis@arm.com>
 <e64015d3e8682d068223e94f3bfc8ad823b27a65.1669810269.git.bertrand.marquis@arm.com>
 <e453dd21-5fbd-5edd-2269-29c72a70299f@amd.com>
 <C03FF185-AAC7-4E06-8505-876BC17F800B@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <C03FF185-AAC7-4E06-8505-876BC17F800B@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT038:EE_|PH8PR12MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: c142893c-6a2d-4780-4241-08dad2e6ce49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K31A6+JRacld3zvqlwCFnaoKDuLj9DosWVTG3UHfnHZyJaJqbMfkFU7Itu+Bzy0YUYQunJXVAsRV9x6O8TsO8T0NSlB6IfMMLUaFmn37xnLMf22s+ZkTq5QTOt1wyvg0dpJRP3tZvnlclPygXnr13H5UFMjCme402fIzwzdAJ41xlz608xk9TB05Vt3rydlZ6R9gQLJlVxK8t4R153PH1F4Dx0mU+Cxzk/8tJybsdRmWBEF3xVAg699IiGI1XMHUq9DgMmaQSuBvUA+kByM/5fvffEBAPUa1jkbtbrwqoFIQOMIZDMrT+2afEm8xn5a8DLAHtUB/DnfFn0icN310vJv+s9CWYcO/c8qYZ95HhtJoJJHslSUmXZ3HqgBhMR6VC0dHInsCEUh9VSuF8/WWGEfnt7kLDm++hwM8vBZH4hdsDYI3d7mjLwb3fogRnvHBURPt/3lLnihWGOyRj9wlIJBHgD/4MvZhYH0tQ6KSRiw2hXNkzam7ngjYI0SmHv77Q9p7NCw3HsSOHgyE0fSMvbPFbe+BnaFJueCDm0I9XPtWHm7WdykI0yZVsbj9EBgNcAUCUZRDhYfEOw7uy9UHdUbNBtBCfHOrEPaso0NuYRPnR1hfAvYHNZhHTmRaE65NUMKxeTJ13WE9OyZgoCEkSyLYS3yDpiQcAOQOp0UPxnPLM3EoLquQ4iQLYfCJqMF3oKDCJ6aNwXUqTGFgzoeXefnYyq1r/zNTqUUIsu7vp1i3gu21sp39E3HRmUJBfmjEVs1L/8GaF0KKdGS+6FcCDw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199015)(46966006)(36840700001)(40470700004)(316002)(70586007)(478600001)(70206006)(2906002)(16576012)(81166007)(356005)(40460700003)(6916009)(54906003)(36756003)(336012)(36860700001)(82740400003)(426003)(53546011)(47076005)(26005)(82310400005)(40480700001)(2616005)(86362001)(31696002)(186003)(44832011)(5660300002)(41300700001)(8936002)(4326008)(31686004)(8676002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 15:23:16.9846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c142893c-6a2d-4780-4241-08dad2e6ce49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7159

Hi Bertrand,

On 30/11/2022 16:07, Bertrand Marquis wrote:
> 
> 
> Hi Michal,
> 
>> On 30 Nov 2022, at 13:02, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Bertrand,
>>
>> On 30/11/2022 13:15, Bertrand Marquis wrote:
>>>
>>>
>>> From: Michal Orzel <michal.orzel@amd.com>
>>>
>>> Populate test jobs for Yocto based tests using the provided containers.
>>> Due to the size restrictions, it is currently not possible to split the
>>> build and run tasks, therefore everything is done in a single step.
>>>
>>> Test jobs for the supported Yocto targets are generic to avoid the
>>> necessity to add new ones after each Yocto release. The only thing
>>> required to be changed after updating the containers is the variable
>>> YOCTO_VERSION stored in a .yocto-test template.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>> Changes in v5:
>>> - none
>>> Changes in v4:
>>> - add .yocto-test for arm64 and x86
>>> - make yocto jobs use arm64 version
>>> Changes in v3:
>>> - patch added
>>> ---
>>> automation/gitlab-ci/test.yaml | 43 ++++++++++++++++++++++++++++++++++
>>> 1 file changed, 43 insertions(+)
>>>
>>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>>> index c7e0078e04f1..6ce2fd63eee6 100644
>>> --- a/automation/gitlab-ci/test.yaml
>>> +++ b/automation/gitlab-ci/test.yaml
>>> @@ -54,6 +54,33 @@
>>>   tags:
>>>     - x86_64
>>>
>>> +.yocto-test:
>>> +  extends: .test-jobs-common
>>> +  script:
>>> +    - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` ${YOCTO_BOARD}
>>> +  variables:
>>> +    YOCTO_VERSION: kirkstone
>>> +    CONTAINER: yocto:${YOCTO_VERSION}-${YOCTO_BOARD}-${YOCTO_HOST}
>>> +  artifacts:
>>> +    paths:
>>> +      - 'logs/*'
>>> +    when: always
>>> +  needs: []
>>> +
>>> +.yocto-test-arm64:
>>> +  extends: .yocto-test
>>> +  variables:
>>> +    YOCTO_HOST: arm64v8
>>> +  tags:
>>> +    - arm64
>>> +
>>> +.yocto-test-x86-64:
>>> +  extends: .yocto-test
>>> +  variables:
>>> +    YOCTO_HOST: amd64
>>> +  tags:
>>> +    - x86_64
>> This hidden job is not used by any yocto test job and as such can be misleading to others working on this file.
>> So we can either remove it (can be easily reintroduced once we will find more x86 resources) or add a comment explaining why is it here.
> 
> If I remove it then there is not reason to have something separated for arm64.
> I will keep and add the following comment on top:
> # This is not used by any test job as we only run Yocto on arm based machines
> # Keep it here so that someone having x86 hardware can easily add jobs
> 
> Would you be ok with that ?
Yes, sure (+ add comma after end of sentence in multi line comments)

> 
> Cheers
> Bertrand
> 
~Michal


