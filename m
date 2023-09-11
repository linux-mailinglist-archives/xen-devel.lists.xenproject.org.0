Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E081379A975
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 17:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599556.935028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfiXg-0004kK-A2; Mon, 11 Sep 2023 15:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599556.935028; Mon, 11 Sep 2023 15:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfiXg-0004hf-6a; Mon, 11 Sep 2023 15:09:36 +0000
Received: by outflank-mailman (input) for mailman id 599556;
 Mon, 11 Sep 2023 15:09:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yA6l=E3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qfiXe-0004hZ-H5
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 15:09:34 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 353ed6fc-50b5-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 17:09:31 +0200 (CEST)
Received: from DM6PR04CA0002.namprd04.prod.outlook.com (2603:10b6:5:334::7) by
 SN7PR12MB7836.namprd12.prod.outlook.com (2603:10b6:806:34e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.31; Mon, 11 Sep 2023 15:09:24 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:5:334:cafe::e5) by DM6PR04CA0002.outlook.office365.com
 (2603:10b6:5:334::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Mon, 11 Sep 2023 15:09:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.17 via Frontend Transport; Mon, 11 Sep 2023 15:09:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 10:09:23 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 11 Sep 2023 10:09:22 -0500
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
X-Inumbo-ID: 353ed6fc-50b5-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hW0dgST4+6w02ZPzogDzvpQBy+B+T3ya4e/PawkIQfHuxJqjK4HrCnxabuXMjgePigVX4VYBtoqMTlM3pBPIC7jW8IJcdpAWyPxe3yFc2ma93rqyzHSF9NPHxdsYkayqW0Z4NwCQt7FuhE6fhZOGct061i46I4sL3B3IVHNnAJl+jgTWyp0FNT1vcd3s5P9GFtgLavwkjqIqmPV2ZvU4CrTGLrfMA/hG4CMtAlYVUu4MzQAFCWQgYWvfUJJV5FuD7cQCkRk8eR/xsZqN4xV0AZosBV+gwyOZRfckveH5rptNBbrlkv6qtYFZgrSW0T8zeEU3QztCfp9X2FHLUDhI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oob/dHXeE0V4XLQTxks9Be2TyQEvor5CFlGj2/oHXuA=;
 b=eW6WxlwZT2LRSVQt0mrOS3hKvJbhHM3RwnZIZcDPRftILPBdvZqDJ3P0OP5GOG3Bo499Rn8s7T/qjr3nKKgwjn03Yl9AJHc56LbGJ52tp1R4oum3HZS2UvoDP7F2/lK13bSEEEDeQ62wENbyL3KVt24TuVAjwds/lVJdpsJ2oQPIq9qXkgtt3E6cv7uo+Uc+vIHPcJ6sofNJZAuUpqlgttZ5AccdUHECpx/23igibfOb7XW0CS0lWL3Y5go/r9vmSPpCZCj9dVYAlhkNA6ezaMj5s9CYX0wgE1ttsRPIKWeXuTuYyzdsRLbuDjWv5A+CnFdSGh2PjqbrdtKZFF0OKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oob/dHXeE0V4XLQTxks9Be2TyQEvor5CFlGj2/oHXuA=;
 b=bz+oQ5iLNMnBV38IdVucdc5KsWXmwIjQYi3CLSRc//yTm7p4msWr0GyOEM+ANP0JeJI1/E/wY2Pm4yzJGnCMeIsDiU15ALMI+qs7J3ZSR8RQovl7L7wr1abp8vGh28Tqv3hmOjMGMpUZiXRXUJm9t5gIffAEIRYN/y7V5hDdroE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <faf253c3-2c99-9380-c120-a2dd3110b796@amd.com>
Date: Mon, 11 Sep 2023 17:09:22 +0200
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
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <e24a7d3a-ca18-474b-bce2-84b97512c58e@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|SN7PR12MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: e7e430a1-4f46-4192-f238-08dbb2d915c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LxTzfKCM6N7jxEh2pFwjZ9OZLbxMOVrtiYjLLg1nkCwIGeVfjmdnVHX2G/8L1E2W+jJr7cqLSnrJH92KBKde3PQkZImMONxdyJByB6lLaPb/THEM+7U3nUV/u8BShk6WIpU2b/IoMMxeABSYp+lKFAW9+5eylr0XuT0LYTIZg3jAm+QBA+YMZeOh6iyyy0j1aABpWBtxKjwxbF6e10xopu9dbHxDMKJb0YHqXU13B5Bb5gcnfavwqRNfEfWTirYFQOuLZ6ddyglm/MGqexE6bk3bEAqLfEkSy53uDGIwovYbhg+AWI+K33tFD14NiDHMSIGKfaJDjJnkzVuoajTN9zYSsPq4LgHFkk/r7kpR0zcnsbI08SoS01NO4wZDeJ6i3mD+RJl8zJ0wIVP5xBkTte1gWhkF/ZsT5D2Xw3FUfcR8zc6iK5D+TCbZ7UH9DUgQv5kqDBOHa8HDIfhtO9HfRtv5/V7M7lA+5oAZ2TdDAYHGh6nC6z3Oyv0v/vvzyOi+mb3wDreXhvNZvZ4lDwiqlOCWiHLJSQ9JnzXRfESNftsLc67GLLi9N4FwvL8I6jio+d5KihOPQFyDg1v10HklVTRCUrZfK2maoXBGKeZnteFkbdlyEIjNGLbMES/DDhWrqH2CUOakebg9aGD52V+aBIsxy2dgv1k6aJZtsnNfKbU4SiDVaGalHOpSWDDFeOHuVVMw5bVIGZNrDALYWO2Zo2WOZMTIMsOOkIzzQVl3z7PwFqSFbkK0hROqD9+XBVosRlTRZcfvtfOS2cWz9GX5lTMMVsqOjx8Bw7zM0oeyppHA60G25NqDxek+m9xpi7IYW+TH5rmeLt7ReZPVZ5+pDw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(82310400011)(186009)(1800799009)(451199024)(36840700001)(46966006)(40470700004)(40460700003)(53546011)(83380400001)(82740400003)(356005)(81166007)(31696002)(86362001)(36860700001)(47076005)(36756003)(2616005)(336012)(426003)(26005)(40480700001)(31686004)(316002)(16576012)(41300700001)(4326008)(70206006)(8676002)(54906003)(966005)(70586007)(110136005)(44832011)(2906002)(5660300002)(478600001)(8936002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 15:09:24.4889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e430a1-4f46-4192-f238-08dbb2d915c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7836



On 11/09/2023 16:48, Julien Grall wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On 11/09/2023 15:01, Michal Orzel wrote:
>> Hi Julien,
>>
>> On 11/09/2023 15:14, Julien Grall wrote:
>>>
>>>
>>> Hi,
>>>
>>> On 11/09/2023 13:34, Michal Orzel wrote:
>>>> Host device tree nodes under /chosen with compatible string
>>>> "xen,evtchn-v1", "xen,domain-shared-memory-v1" are Xen specific and not
>>>> meant to be exposed to hardware domain.
>>>
>>> So, how dom0 is meant to discover the static event channel, shared
>>> memory it can use?
>>
>> For static shared memory:
>> A node with this compatible is only meant for Xen since it contains information like host-guest mapping.
>> Xen creates a different node for guests under /reserved-memory.
>> Linux binding:
>> https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt
>> Xen node generation:
>> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/domain_build.c;hb=HEAD#l1407
> 
> Ah good point. I agree with this one.
> 
>>
>> For static event channels:
>> This is a bit weird so let me put it in a different way.
>> 1) Xen does not create any node for static evtchn for domU.
>> 2) The booting.txt states:
>> There is no need to describe the static event channel info in the domU device
>> tree. Static event channels are only useful in fully static configurations,
>> and in those configurations, the domU device tree dynamically generated by Xen
>> is not needed.
>> 3) The "xen,evtchn" property specifies the local port as well as phandle of domU node.
>> dom0 does not have access to domU nodes, therefore exposing a property with not existing phandle
>> makes me think that:
> 
> You have a point for the phandle. Yet, this is the only way dom0 can
> find the event channel today. As we exposed it, I don't think we can
> remove it until we have a proper replacement.
> 
> We might get away if the feature is not supported it at all. But there
> is no statement, so it is a little unclear whether the feature is meant
> to be in technical preview.
> 
> In any case, I think the commit message deserve a bit more explanation
> as hiding "xen,evtchn-v1"/"xen,domain-shared-memory-v1" is not
> uncontroversial.
> 
>> a) point 2) applies to dom0 as well and we should hide this node or > b) there is a missing property for both dom0 and domUs to tell them
> about static local port in a proper way
>>
>> Exposing Xen specific evtchn node only to dom0 and not to domU with required information happen to be found as first value
>> in xen,evtchn is definitely not a proper solution.
> 
> My concern here is we exposed such information to dom0. So as I said
> above, I don't think we can simply remove it as there is no other way to
> find such information today.
> 
> It doesn't matter that it wasn't exposed to domU.
> 
>> Also, there is no Linux binding for it.
> 
> AFAIK the static event channel support was not added in Linux until very
> recently. Also, I think the kernel doesn't directly use the static event
> channel. So it is possible, this is just an overlook.

I've found this thread in which Stefano, Rahul and Bertrand agrees on not exposing
any dt property and the rationale behind:
https://patchwork.kernel.org/project/xen-devel/patch/4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com/

I would not call exposing node to dom0 as something done deliberately given that it happens automatically by copying. So my understanding is
that we did not want to expose any node and dom0 case was overlooked (since done automatically).

Exposing half the interface (from system POV) in a way it should not be done (phandle) is not great IMO.
In any case, if you insist on keeping xen,evtchn, I can leave with it.

This feature is marked as tech preview with no Linux binding in place so I would not be worried.

~Michal

