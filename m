Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B33979CE73
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 12:36:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600371.936005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg0kf-0001jt-NS; Tue, 12 Sep 2023 10:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600371.936005; Tue, 12 Sep 2023 10:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg0kf-0001i3-Jp; Tue, 12 Sep 2023 10:36:13 +0000
Received: by outflank-mailman (input) for mailman id 600371;
 Tue, 12 Sep 2023 10:36:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t/Nr=E4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qg0ke-0001bX-Fq
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 10:36:12 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30b7d095-5158-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 12:36:11 +0200 (CEST)
Received: from MW4PR03CA0137.namprd03.prod.outlook.com (2603:10b6:303:8c::22)
 by IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Tue, 12 Sep
 2023 10:36:07 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:303:8c:cafe::13) by MW4PR03CA0137.outlook.office365.com
 (2603:10b6:303:8c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37 via Frontend
 Transport; Tue, 12 Sep 2023 10:36:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.1 via Frontend Transport; Tue, 12 Sep 2023 10:36:05 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Sep
 2023 05:36:04 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Sep
 2023 03:36:04 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 12 Sep 2023 05:36:03 -0500
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
X-Inumbo-ID: 30b7d095-5158-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fuVdkE1NFv7ocVhbiYlB/vY6sfI7S6UYGQyGHBPHV44zwzSwBFXxPMrleWiJ9qhDJjF6FRTmalb5erOMqiiPtnNe841Sy7/1o4VERDSq8hhGW65IjFBvaGW5MHAuGAkbANf4pa4te27eEKSLRYiBmTd9sg1aMK4pgPzi/k9S54FnHpUWjfE4OrskVsj8f0Wh/dNnMduxQh1yeFkLkLs7wGXpkQQXuUl2tNfOyeroMBMEZAO9dwLFF23wMTgMbHMTMeFXIkRvRCLekkEKrE1QM+8AL7qyf1BG9VFUUD4m43hRYhY689z+VbBNgsw1lGAzRiROIEKWr8vZE3uWku1Cpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uh+8UHCRZ6nA/zynXeMz8Bt5yAUbXoT8RgT9VPpQFFU=;
 b=GhyjEOd5I+rWFqIbhFyTPYLtBmqyZ0YPrQHJhsuwWSENH/4xRnQ2qgT37W13CsoJLdV6MVFtW9zbOgzkTbNWZDesAp3bRGry0Ezf3jBQ5YTz+O5clRZRUshImxy5AQXTfsZekkPdpS0QfmoB6nOR9qOUkOVvXavyZAlS9HsmQM7SqhVyezNUJmq6jmfQfRHSFZH+oaThUchNPHqxTFuuWjbnoShi2wSZlGSGTbL6VLSDHbOVK1VA4KPS6FLDyTI281c0Z34dijWOSipf5NLrBlA5fBi3HYKN8q2cOWqvz7u9V9LVNqHwMP0G/aKV8hYkPBmbiqcjf4/7PZ7E34np5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uh+8UHCRZ6nA/zynXeMz8Bt5yAUbXoT8RgT9VPpQFFU=;
 b=H/+cTHxuLG/uwwJ50I7SUZlQaqJdcpsVpzcy6pTSc5/sYws9Qb8K7Pykys5zZW6V3sgeIG8BczQqFiSz0aCCqKeOjIkqpVEt6HWzIzIzfoOJRb0Jd+fGDf4K0T0ZNc/kYNswTPjCSAowbdHAkVRiPsmMmspEi+WseUh8JWZKujw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e44841c9-29ab-5954-41f2-d4bd3439211f@amd.com>
Date: Tue, 12 Sep 2023 12:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] xen/arm: Skip Xen specific nodes/properties from hwdom
 /chosen node
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230911123401.27659-1-michal.orzel@amd.com>
 <366e89e3-bc3d-4c54-b1ad-8147abbabdc7@xen.org>
 <042fae56-e8e2-c079-2686-d27c5469b7fc@amd.com>
 <e24a7d3a-ca18-474b-bce2-84b97512c58e@xen.org>
 <faf253c3-2c99-9380-c120-a2dd3110b796@amd.com>
 <6ca62546-8626-46ab-85bb-8e96e466251d@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <6ca62546-8626-46ab-85bb-8e96e466251d@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|IA1PR12MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac535c5-bfe8-4d93-e0a0-08dbb37c11f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RfCSm79nYuQd0CDbLzGbLBuHb+qyBuBFUfISTwSCImfToKIXWY5uJPF+tT67OxN5BJHpRywpcl863ON7NjOU/xG2yper2MqTvCQtrH5PJgRXWoQwrhaMdyz0QwYiTAcjUrncTFmEhpn83gzFa4eUQMq0Wg9larHKUOeYErKxodt3RiJCIGRkznHIRxxXmllsShck+XBCc+FMx7FxLhC6bfSPjLPZ/VOrqrnN4l2YIwpQufzR2YFzvrI00TqcmFHvrb81vgPhyB6LkpXQR4EtIfUy2Fd8PMt8fk3tDLzZUHhzq8bNZ5O9e1k9JQRepcKmLDc5WCZG3SdpqZZDyfkt0fV7JunYUai0/TcB7tWrsdl2G7c91lcwkUnDdmBF/3utAiub8NUuqf3cawK2BVo75Po2RbinXD74uA0L/oZ6qY14+Ul5+PhdMLSofrJhlnVk/EHHb9+/YsBhu4uhrNl7+55Piq42WIV6alt/gXymKt5MR294KOAAmbm3vzufdS3xLWN03qoA0D7MrJxIz4ZFcPwyM6vDmapdiNPa8ax9VGXn41+3f5/HM0o3rgtaThWhNhktRkK1rueeik/clhY7RkFNbK1SFPo/31ct9+3SmHf2MesRg3lPcT70+yyOGCV4Rj1w68c3qogauhpGg/lW4rNM6vOUA3a3NSPuggCfqg8OKenWF1wCYAMg2btVvLA/dYOsbl7loHvBiK8pFLNgCIDYQGU6iFL63FTtBd2mLXfOGU25GD8TQa4hBIKOInDIcqt+3UXU/pzuD4uZt8gRW7zjHiI4CqVAQJQ2/TBaNEaiFacLJSE/jWc3HfjtNogjnCqN6f+sD2D6vfrUvN0Idw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(82310400011)(451199024)(186009)(1800799009)(40470700004)(46966006)(36840700001)(8676002)(8936002)(31696002)(86362001)(4326008)(40480700001)(44832011)(5660300002)(2906002)(40460700003)(36756003)(83380400001)(966005)(82740400003)(2616005)(356005)(53546011)(336012)(478600001)(426003)(26005)(81166007)(16576012)(316002)(47076005)(54906003)(110136005)(70586007)(70206006)(41300700001)(36860700001)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 10:36:05.9316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac535c5-bfe8-4d93-e0a0-08dbb37c11f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6435

Hi Julien,

On 12/09/2023 12:03, Julien Grall wrote:
> 
> 
> On 11/09/2023 16:09, Michal Orzel wrote:
>>
>>
>> On 11/09/2023 16:48, Julien Grall wrote:
>>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>>
>>>
>>> On 11/09/2023 15:01, Michal Orzel wrote:
>>>> Hi Julien,
>>>>
>>>> On 11/09/2023 15:14, Julien Grall wrote:
>>>>>
>>>>>
>>>>> Hi,
>>>>>
>>>>> On 11/09/2023 13:34, Michal Orzel wrote:
>>>>>> Host device tree nodes under /chosen with compatible string
>>>>>> "xen,evtchn-v1", "xen,domain-shared-memory-v1" are Xen specific and not
>>>>>> meant to be exposed to hardware domain.
>>>>>
>>>>> So, how dom0 is meant to discover the static event channel, shared
>>>>> memory it can use?
>>>>
>>>> For static shared memory:
>>>> A node with this compatible is only meant for Xen since it contains information like host-guest mapping.
>>>> Xen creates a different node for guests under /reserved-memory.
>>>> Linux binding:
>>>> https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt
>>>> Xen node generation:
>>>> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/domain_build.c;hb=HEAD#l1407
>>>
>>> Ah good point. I agree with this one.
>>>
>>>>
>>>> For static event channels:
>>>> This is a bit weird so let me put it in a different way.
>>>> 1) Xen does not create any node for static evtchn for domU.
>>>> 2) The booting.txt states:
>>>> There is no need to describe the static event channel info in the domU device
>>>> tree. Static event channels are only useful in fully static configurations,
>>>> and in those configurations, the domU device tree dynamically generated by Xen
>>>> is not needed.
>>>> 3) The "xen,evtchn" property specifies the local port as well as phandle of domU node.
>>>> dom0 does not have access to domU nodes, therefore exposing a property with not existing phandle
>>>> makes me think that:
>>>
>>> You have a point for the phandle. Yet, this is the only way dom0 can
>>> find the event channel today. As we exposed it, I don't think we can
>>> remove it until we have a proper replacement.
>>>
>>> We might get away if the feature is not supported it at all. But there
>>> is no statement, so it is a little unclear whether the feature is meant
>>> to be in technical preview.
>>>
>>> In any case, I think the commit message deserve a bit more explanation
>>> as hiding "xen,evtchn-v1"/"xen,domain-shared-memory-v1" is not
>>> uncontroversial.
>>>
>>>> a) point 2) applies to dom0 as well and we should hide this node or > b) there is a missing property for both dom0 and domUs to tell them
>>> about static local port in a proper way
>>>>
>>>> Exposing Xen specific evtchn node only to dom0 and not to domU with required information happen to be found as first value
>>>> in xen,evtchn is definitely not a proper solution.
>>>
>>> My concern here is we exposed such information to dom0. So as I said
>>> above, I don't think we can simply remove it as there is no other way to
>>> find such information today.
>>>
>>> It doesn't matter that it wasn't exposed to domU.
>>>
>>>> Also, there is no Linux binding for it.
>>>
>>> AFAIK the static event channel support was not added in Linux until very
>>> recently. Also, I think the kernel doesn't directly use the static event
>>> channel. So it is possible, this is just an overlook.
>>
>> I've found this thread in which Stefano, Rahul and Bertrand agrees on not exposing
>> any dt property and the rationale behind:
>> https://patchwork.kernel.org/project/xen-devel/patch/4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com/
> 
> Ok. So the expectation is that each end will have hardcoded event
> channel number. I feel this is going to lead to issue when someone will
> try to re-number event channel but forgot to update one of the
> component. Anyway...
> 
>>
>> I would not call exposing node to dom0 as something done deliberately given that it happens automatically by copying.
>> So my understanding is
>> that we did not want to expose any node and dom0 case was overlooked (since done automatically).
>>
>> Exposing half the interface (from system POV) in a way it should not be done (phandle) is not great IMO.
>> In any case, if you insist on keeping xen,evtchn, I can leave with it.
>>
>> This feature is marked as tech preview with no Linux binding in place so I would not be worried.
> 
> ... I overlooked it was a tech preview. So I am having less concern
> about remove the property. But I still think we need to find a way to
> describe it in the device-tree for future usage (see why above).

I fully agree that we shall have a property for both dom0 and domUs to make OS life easier
instead of hardcoding the values. This is something we need to keep in mind to do after the release.
That said, I hope you agree on removing this node right now from being exposed to dom0 which is what this patch aims for.
Please see Stefano reply and my proposal for a better commit msg.

~Michal

