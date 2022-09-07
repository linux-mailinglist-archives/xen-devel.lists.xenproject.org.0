Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0997F5B04C0
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 15:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401666.643568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuo7-0003Oy-IN; Wed, 07 Sep 2022 13:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401666.643568; Wed, 07 Sep 2022 13:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuo7-0003Ly-Dc; Wed, 07 Sep 2022 13:09:31 +0000
Received: by outflank-mailman (input) for mailman id 401666;
 Wed, 07 Sep 2022 13:09:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiom=ZK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oVuo5-0003Jk-SX
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 13:09:29 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ce2e576-2eae-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 15:09:28 +0200 (CEST)
Received: from MW4P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::31)
 by PH7PR12MB6857.namprd12.prod.outlook.com (2603:10b6:510:1af::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 7 Sep
 2022 13:09:24 +0000
Received: from CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::58) by MW4P222CA0026.outlook.office365.com
 (2603:10b6:303:114::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Wed, 7 Sep 2022 13:09:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT076.mail.protection.outlook.com (10.13.174.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 13:09:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 08:09:23 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 7 Sep 2022 08:09:22 -0500
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
X-Inumbo-ID: 4ce2e576-2eae-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PU0o/wLhsOIJj3f7+zwac+tMAkcOScvvKE8ohKCGtYSbZHOrTR7p6OBLqmQrSmexzPXB7TFfpxP/WZGKSW2pZlhUA1PvfdbTv89BOvmxwYSrQi4FBcHYqyPgvM0PnmHq7Ml6m8ve/WtomHyI5H/fjLTqX8UfgzJjTx4699uMG2iAifecpq2yXaCRlQwMON8LvXQFGZxuTqX/+DHkN1ipp6g66/O2Qh65RtoNVkEoXwN87EVAqAqtofAZ5PWH1XQqfXUiOWLO7xYTTZ+VuBL+2e0gz9VjohHDPBHOLJ0rVYfP3rhqiEYT1pKBhV44r1AKEN/gCZjNLH7Rh247mnezgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vzPyE8xor0r9dzeedEC92Swjehb9AImQgAdIXjz2/c=;
 b=d6xaCsHiCOxPXrcG226+qbjfTXl4OVkggr7g4lQShEAkCgULF0KEG2FYjYz4pVe2gtsNRgI9D8rHCDbE8DIGt8VQH8Wgn6Cb91sbtt7bPJKRuCcjwv2R1WrER6KjiMLAZvDv1sSB6REMr7xA900U2nQiCHII2wA7IwJ4lnFQZsHkz69IlzUUvQbvCPaRmZJjoKjOx9fG1LYOVOL8U1v0iHLlKGhxnMqz61dwaGh2HsTmk4GNFMRndOSxFqsIm0GUcfZ9zBsN7m9srcV+XhKtN343UTbQHFbCA/wdi8AI7mh2u7rs09MjYp6tNJ1WZNpILjZLdUL1q8PMi2K6uYt4bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vzPyE8xor0r9dzeedEC92Swjehb9AImQgAdIXjz2/c=;
 b=qxOhSyojmfJ1RD+G1Wmh19g9FxsH3GQyP3gT5ACXze/EpcNUhhv30fbQK7qYFMeXCbU8ttyxYhO3ddjP/4IZAxB8hdlEiIVfeZwTAcjwUeRpz5cVfM/GBFkpGTcHTR34ZddS17O5cJVs4MTAL4HqX3Nd7GXZLiwpgIXjsJ4ocMU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b0b85a1c-ff00-ea06-a960-e49799d507eb@amd.com>
Date: Wed, 7 Sep 2022 15:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Penny Zheng <penny.zheng@arm.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
 <9a66b6df-bc37-d836-8175-3b98be07c696@amd.com>
 <e5e9a62d-6072-463e-6c4c-8d94aa29589b@xen.org>
 <a29a07fd-40ad-602f-9a79-a36783ada947@amd.com>
 <e8bf68b1-0217-c8cd-4864-ea7fe415fb0a@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <e8bf68b1-0217-c8cd-4864-ea7fe415fb0a@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT076:EE_|PH7PR12MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d79cd8-3a66-4dd5-4f24-08da90d22f89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wCWJ4Kzxo7am9GkH3GE8miSInFSk3wd+HNkX6ChL0qQgjh8XpHYnAiYxdxFOPe5Qqvf9e5XCcrtpQ2fqD4qBIL/lTBbo9p5UeUT68sSV9NP5RRbOyNR5rzAwZ4di8duXyzJWvNLCB/+5bsmualdfwGqGZJkkYbw3xEHi0fDO1kfdmy/UzKYhBIwwMdn9sSn+sh6t5wi6TPGnwLy0EQZDXUQ2kcFEEXBiOe9xGls1uGFXNsyu8jc9gC5Rde6ozHXxDSf0aKNoEFSG2pjlKTQTkIBoec9awN3ugn1MS0ahWY0DiJd1MpvMtSgDVJ4y7MUZ62fJb0eaYAdO0L+nuxxP5KhRV2e77LqOeZ7+cKnhI/YGaUU5hgtidM9QOMxUsl6bAjxr1dmVtYQpp1EB3Y+PLptSMHZeC71Z1HEieN0fQcQvwJBQyX9vr5FrwBGnJhIzKglBKN1kja/zyxRJZ8Ddi91uw3yvdomZQRBJRaGVQjoetYuEEirhUOcRyzqJ3v92ceSZBDArdljTzZCi2jOLEJ0kGBxnvmNIACJJUS5fdxjOs60U1ci+zmTjqW8gsQP9NKzKclihYIf+/4C8dvegXQRrKHrJUy27UjSnqZP8IuHJNoqf91D9BN3y2NIU5RSJCtRV21VSNMk3XWNRJqM8kgpNLRcOXzVzsLUM09w/u3CfAAGliDUdsDLyK2vYxU9Krwk2k3gFPJW0HU7dxedIsNXb8SIAyXkL3/KYJc3eCtSthyV6kiJ4allSxFHngBJ/1X1zYep6fxdmgLaqRUQYgV5HV/qp1AP7CrefZZycqsQibES5UTTnVjBMzk7ER4najWlIKbHpG+6MFh7uXOiuTFvwmXu+KVBaBvkWWNxpMUs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(396003)(346002)(36840700001)(46966006)(40470700004)(2906002)(47076005)(2616005)(31696002)(40480700001)(26005)(966005)(336012)(41300700001)(82310400005)(186003)(86362001)(82740400003)(81166007)(478600001)(53546011)(426003)(356005)(40460700003)(36860700001)(70206006)(83380400001)(8676002)(70586007)(5660300002)(110136005)(4326008)(45080400002)(316002)(16576012)(44832011)(54906003)(36756003)(31686004)(8936002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 13:09:23.9531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d79cd8-3a66-4dd5-4f24-08da90d22f89
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6857


On 07/09/2022 14:45, Julien Grall wrote:
> 
> On 07/09/2022 13:41, Michal Orzel wrote:
>>
>>
>> On 07/09/2022 14:32, Julien Grall wrote:
>>> [CAUTION: External Email]
>>>
>>> On 07/09/2022 13:12, Michal Orzel wrote:
>>>> Hi Julien,
>>>
>>> Hi Michal,
>>>
>>>> On 07/09/2022 13:36, Julien Grall wrote:
>>>>>
>>>>> Hi Henry,
>>>>>
>>>>> While reviewing the binding sent by Penny I noticed some inconsistency
>>>>> with the one you introduced. See below.
>>>>>
>>>>> On 07/09/2022 09:36, Henry Wang wrote:
>>>>>> +- xen,static-heap
>>>>>> +
>>>>>> +    Property under the top-level "chosen" node. It specifies the address
>>>>>> +    and size of Xen static heap memory. Note that at least a 64KB
>>>>>> +    alignment is required.
>>>>>> +
>>>>>> +- #xen,static-heap-address-cells and #xen,static-heap-size-cells
>>>>>> +
>>>>>> +    Specify the number of cells used for the address and size of the
>>>>>> +    "xen,static-heap" property under "chosen".
>>>>>> +
>>>>>> +Below is an example on how to specify the static heap in device tree:
>>>>>> +
>>>>>> +    / {
>>>>>> +        chosen {
>>>>>> +            #xen,static-heap-address-cells = <0x2>;
>>>>>> +            #xen,static-heap-size-cells = <0x2>;
>>>>>
>>>>> Your binding, is introduce #xen,static-heap-{address, size}-cells
>>>>> whereas Penny's one is using #{address, size}-cells even if the property
>>>>> is not "reg".
>>>>>
>>>>> I would like some consistency in the way we define bindings. Looking at
>>>>> the tree, we already seem to have introduced
>>>>> #xen-static-mem-address-cells. So maybe we should follow your approach?
>>>>>
>>>>> That said, I am wondering whether we should just use one set of property
>>>>> name.
>>>>>
>>>>> I am open to suggestion here. My only request is we are consistent (i.e.
>>>>> this doesn't depend on who wrote the bindings).
>>>>>
>>>> In my opinion we should follow the device tree specification which states
>>>> that the #address-cells and #size-cells correspond to the reg property.
>>>
>>> Hmmm.... Looking at [1], the two properties are not exclusive to 'reg'
>>> Furthermore, I am not aware of any restriction for us to re-use them. Do
>>> you have a pointer?
>>
>> As we are discussing re-usage of #address-cells and #size-cells for custom properties that are not "reg",
>> I took this info from the latest device tree specs found under https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.devicetree.org%2Fspecifications%2F&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C4f35e9f93b7443ac73c808da90cecc22%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637981515122993111%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=TiESYS6RXdiPLX8WFUV0CsztAvK7mHSud%2B0xoJqwAw0%3D&amp;reserved=0:
>> "The #address-cells property defines the number of <u32> cells used to encode the address field in a child node's reg property"
>> and
>> "The #size-cells property defines the number of <u32> cells used to encode the size field in a child node’s reg property"
> 
> Right. But there is nothing in the wording suggesting that
> #address-cells and #size-cells can't be re-used. From [1], it is clear
> that the meaning has changed.
> 
> So why can't we do the same?
I think this is a matter of how someone reads these sentences.
I do not think that such documents need to state:
"This property is for the reg. Do not use it for other purposes."
The first part of the sentence is enough to inform what is supported.

On the other hand, looking at [1] these properties got new purposes
so I think we could do the same. Now the question is whether we want that.
I think it is doable to just have a single pair of #address/#size properties.
For instance xen,shared-mem requiring just 0x1 for address/size
and reg requiring 0x2. This would just imply putting additional 0x00.

> 
> Cheers,
> 
> --
> Julien Grall

