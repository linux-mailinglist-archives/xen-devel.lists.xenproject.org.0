Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D55F75B052B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 15:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401728.643645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvA1-00024h-Ew; Wed, 07 Sep 2022 13:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401728.643645; Wed, 07 Sep 2022 13:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvA1-000222-C2; Wed, 07 Sep 2022 13:32:09 +0000
Received: by outflank-mailman (input) for mailman id 401728;
 Wed, 07 Sep 2022 13:32:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiom=ZK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oVv9z-0001Ww-A9
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 13:32:07 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 761fb0f1-2eb1-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 15:32:05 +0200 (CEST)
Received: from BN9PR03CA0932.namprd03.prod.outlook.com (2603:10b6:408:108::7)
 by PH7PR12MB5759.namprd12.prod.outlook.com (2603:10b6:510:1d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Wed, 7 Sep
 2022 13:32:01 +0000
Received: from BN8NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::fa) by BN9PR03CA0932.outlook.office365.com
 (2603:10b6:408:108::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12 via Frontend
 Transport; Wed, 7 Sep 2022 13:32:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT102.mail.protection.outlook.com (10.13.177.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 13:32:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 08:32:01 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 7 Sep 2022 08:31:59 -0500
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
X-Inumbo-ID: 761fb0f1-2eb1-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjRaPRWunX7OAQ322uTrcVj0SZFPqk7+eCTxQZHz3wil2zJF2tqc9fdChcjtzMwWHo3wn/rmcWOomGutpUdC+hcPFjiXeY9Wiw7xvUu610a1HQYrWbelAk3uOlF57d/F9+VfnbwL4rO0LZAOHX/GLcJfzgLtz0hw00grN68UpfHwuL7sMiN1DtLb/eIlpWPUFyBY9jIipZ7lS+Z3vHRUogmy8GlKG0yuMjtoVQlMUbX6FHBB/xkehfgOJXnYRKTURdhQwF+4hdtCLy7lsIvDKtwp/suL5ePNj7QkS2d9KXBsG9j4c8PHupEqb8ExcwaXEAGVZvq/tBu8IA8kr2wLPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saWxUsOCnIN1GHIPpT2/IpKXb61jM2DLyBuEiVwJIl0=;
 b=Cz1Y3mjWQOSdErmR3AViUPD0dfznP0okrAQTj3WDeLelYAeBHNDSVmZGsa34FjvRUZwC9y2UyhRqcOWB9WF+AnWW8aJ/xPq36++44zVc/I3yNpqOKOi1gY8IWr3JbVT8l76oCfgPqkd7+LjOCHvUMxf2HMAKw3XaPVR6wHL475MxMQXa2bHGEgTMQtBAOwOnjF+Jui0Ld1+eKUJWAnlQ5ZGCo5tLCdak9Fzyy+nzh8jObLtoW0ihTEqW9/7lr2zibez6GgIMza7wu0VZiwSSwYGgj6l7T6HM5jy5TB8FULh/acl9eaqzFwLQQCVjPpRsUCYS1mpM3Ebueh0Jitlwow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=saWxUsOCnIN1GHIPpT2/IpKXb61jM2DLyBuEiVwJIl0=;
 b=omkcmt3Iz2HCkvbaTiCPQK60f+p7Do1/XKqT3XMrobta1uyfrJy4yZy40fbueZ4lIZtXBOTsR5ZZx1mq8PWdUDJMoeX6z5fMsGA6+wdPEl2YOf7kCCAxcsy87rVj62mrsUxga9bcRbYRge4aJgfZtUqk+16oQtK0Ek1eTWswBHw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7997786c-78ff-47df-12de-d1fe38e5624d@amd.com>
Date: Wed, 7 Sep 2022 15:31:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
 <9a66b6df-bc37-d836-8175-3b98be07c696@amd.com>
 <e5e9a62d-6072-463e-6c4c-8d94aa29589b@xen.org>
 <a29a07fd-40ad-602f-9a79-a36783ada947@amd.com>
 <e8bf68b1-0217-c8cd-4864-ea7fe415fb0a@xen.org>
 <b0b85a1c-ff00-ea06-a960-e49799d507eb@amd.com>
 <ED046919-0B75-48C6-900F-44F3295553B7@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <ED046919-0B75-48C6-900F-44F3295553B7@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT102:EE_|PH7PR12MB5759:EE_
X-MS-Office365-Filtering-Correlation-Id: adf7c9b3-f1e8-4bab-7ac9-08da90d558a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	81o7BCGwHtiJlAf5KF3AHv2MHEqe3npePCDSz50Za16stgRebGVKunZPGGJXUSYWZnHKxoOHd8fWzL7qpioHI/emnydqx0ZUSOPEUfG527RQ1QXREs5yuuKXCrOEtQaZc0aUQehEEYhU3se5imFID4qNl5kW+vOoZ3A7O2as/RRmLJYcgYu5X5LxGhO3lfAgEbdQuQeqK06x9bWj6ylqCcMgOP9RaVVmA+Db08bFwYiJho/kuuDNijt1J+50iH2DCC02kEeIyHfPR9mINpD4yVrow5n6XPLrlhuDhz/6rEi+0/qvXaxgetutt4be+gw7AT2iS1M80k2tp8BJsogOX7ZSO+D1b0swfz4rXGwZdD5Dqln0dvUsmAs77flrHSJY+Oy7ZhnNwwGeDwGtJk9OHGADcX9+yUI7D+PUjcl27HXYmg0M6CBhBXK0tNamy82dERDRncN8BCytMZ2FOQOj6h24YPklr+4uVF7VJNjbAlcHmfkLE0jlvBitpZQGUJ9cOmpsLWa1O//tzcB+Cq24N7uUwZi7myVEDkVDCXOyMoW1c+GHb43a/1i6itFF0394zJK2IsQQ0coJJ8yf/3Il+d/htuZamrxg72xSFvqHMKFKJv+HBU7bChcOvVq7urrVEMYknCndLUqdmK7WOZFfJOH1mNI6idUcpHmkmtALt+ZYREvkplCO4eri9SIS9eEnqh3niEi84djFqYg0jni+tIsli7D4EnnzkYiZHdymAazqvunq0TAH71V2AjBaM0ZrLR/ol/R7zEqXeHtFZHsgmfNcgLmrcvFdwHeQ1YF9Ky7mb8rSMyHRyWI/u4NJQok/uKBfoDPJqVBcN8fp1ZuzVp2Qc8SCydR/e1il5YjqSx8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(396003)(40470700004)(36840700001)(46966006)(36756003)(26005)(8936002)(40480700001)(186003)(426003)(2616005)(336012)(47076005)(5660300002)(31696002)(31686004)(44832011)(86362001)(41300700001)(2906002)(478600001)(966005)(53546011)(81166007)(356005)(70586007)(6916009)(316002)(45080400002)(70206006)(82310400005)(82740400003)(54906003)(40460700003)(4326008)(36860700001)(83380400001)(8676002)(16576012)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 13:32:01.5657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adf7c9b3-f1e8-4bab-7ac9-08da90d558a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5759



On 07/09/2022 15:28, Bertrand Marquis wrote:
> 
> Hi Michal,
> 
>> On 7 Sep 2022, at 14:09, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>>
>> On 07/09/2022 14:45, Julien Grall wrote:
>>>
>>> On 07/09/2022 13:41, Michal Orzel wrote:
>>>>
>>>>
>>>> On 07/09/2022 14:32, Julien Grall wrote:
>>>>> [CAUTION: External Email]
>>>>>
>>>>> On 07/09/2022 13:12, Michal Orzel wrote:
>>>>>> Hi Julien,
>>>>>
>>>>> Hi Michal,
>>>>>
>>>>>> On 07/09/2022 13:36, Julien Grall wrote:
>>>>>>>
>>>>>>> Hi Henry,
>>>>>>>
>>>>>>> While reviewing the binding sent by Penny I noticed some inconsistency
>>>>>>> with the one you introduced. See below.
>>>>>>>
>>>>>>> On 07/09/2022 09:36, Henry Wang wrote:
>>>>>>>> +- xen,static-heap
>>>>>>>> +
>>>>>>>> +    Property under the top-level "chosen" node. It specifies the address
>>>>>>>> +    and size of Xen static heap memory. Note that at least a 64KB
>>>>>>>> +    alignment is required.
>>>>>>>> +
>>>>>>>> +- #xen,static-heap-address-cells and #xen,static-heap-size-cells
>>>>>>>> +
>>>>>>>> +    Specify the number of cells used for the address and size of the
>>>>>>>> +    "xen,static-heap" property under "chosen".
>>>>>>>> +
>>>>>>>> +Below is an example on how to specify the static heap in device tree:
>>>>>>>> +
>>>>>>>> +    / {
>>>>>>>> +        chosen {
>>>>>>>> +            #xen,static-heap-address-cells = <0x2>;
>>>>>>>> +            #xen,static-heap-size-cells = <0x2>;
>>>>>>>
>>>>>>> Your binding, is introduce #xen,static-heap-{address, size}-cells
>>>>>>> whereas Penny's one is using #{address, size}-cells even if the property
>>>>>>> is not "reg".
>>>>>>>
>>>>>>> I would like some consistency in the way we define bindings. Looking at
>>>>>>> the tree, we already seem to have introduced
>>>>>>> #xen-static-mem-address-cells. So maybe we should follow your approach?
>>>>>>>
>>>>>>> That said, I am wondering whether we should just use one set of property
>>>>>>> name.
>>>>>>>
>>>>>>> I am open to suggestion here. My only request is we are consistent (i.e.
>>>>>>> this doesn't depend on who wrote the bindings).
>>>>>>>
>>>>>> In my opinion we should follow the device tree specification which states
>>>>>> that the #address-cells and #size-cells correspond to the reg property.
>>>>>
>>>>> Hmmm.... Looking at [1], the two properties are not exclusive to 'reg'
>>>>> Furthermore, I am not aware of any restriction for us to re-use them. Do
>>>>> you have a pointer?
>>>>
>>>> As we are discussing re-usage of #address-cells and #size-cells for custom properties that are not "reg",
>>>> I took this info from the latest device tree specs found under https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.devicetree.org%2Fspecifications%2F&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C83da1eb9d32441cb9e8108da90d4f2d6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637981541539851438%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3M9aT3LjCEOhZUHWSbgSSmKppY1Wion4TT3BeKLnWSo%3D&amp;reserved=0:
>>>> "The #address-cells property defines the number of <u32> cells used to encode the address field in a child node's reg property"
>>>> and
>>>> "The #size-cells property defines the number of <u32> cells used to encode the size field in a child node’s reg property"
>>>
>>> Right. But there is nothing in the wording suggesting that
>>> #address-cells and #size-cells can't be re-used. From [1], it is clear
>>> that the meaning has changed.
>>>
>>> So why can't we do the same?
>> I think this is a matter of how someone reads these sentences.
>> I do not think that such documents need to state:
>> "This property is for the reg. Do not use it for other purposes."
>> The first part of the sentence is enough to inform what is supported.
>>
>> On the other hand, looking at [1] these properties got new purposes
>> so I think we could do the same. Now the question is whether we want that.
>> I think it is doable to just have a single pair of #address/#size properties.
>> For instance xen,shared-mem requiring just 0x1 for address/size
>> and reg requiring 0x2. This would just imply putting additional 0x00.
> 
> I think we want in general to reduce complexity when possible.
> Here we are adding a lot of entries in the device tree where we know that
> in all cases having only 2 will work all the time.
> 
> I am not convinced by the arguments on not using #address-cells and will
> leave that one to Stefano
> 
> But in any case we should only add one pair here for sure, as you say the
> only implication is to add a couple of 0 in the worst case.
I agree. The only drawback is the need to modify the already introduced properties
to be coherent.

> 
> Cheers
> Bertrand
> 
>>
>>>
>>> Cheers,
>>>
>>> --
>>> Julien Grall
> 

