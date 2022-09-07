Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 318385B0552
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 15:38:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401758.643682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvFW-00049q-R4; Wed, 07 Sep 2022 13:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401758.643682; Wed, 07 Sep 2022 13:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvFW-00046N-O5; Wed, 07 Sep 2022 13:37:50 +0000
Received: by outflank-mailman (input) for mailman id 401758;
 Wed, 07 Sep 2022 13:37:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiom=ZK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oVvFV-00046H-EO
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 13:37:49 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2064.outbound.protection.outlook.com [40.107.101.64])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42105a0a-2eb2-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 15:37:47 +0200 (CEST)
Received: from DS7PR05CA0059.namprd05.prod.outlook.com (2603:10b6:8:2f::32) by
 MW6PR12MB7069.namprd12.prod.outlook.com (2603:10b6:303:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Wed, 7 Sep
 2022 13:37:44 +0000
Received: from DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::cf) by DS7PR05CA0059.outlook.office365.com
 (2603:10b6:8:2f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.5 via Frontend
 Transport; Wed, 7 Sep 2022 13:37:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT109.mail.protection.outlook.com (10.13.173.178) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 13:37:43 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 08:37:42 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 08:37:42 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 7 Sep 2022 08:37:41 -0500
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
X-Inumbo-ID: 42105a0a-2eb2-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNjED6kMNdRzubJc9Nkh5+bGxkgyvMK+ITT2gbS0YoXdroYd46Tx++lrZscpG4c+6OrUHCwRAFmUFu9wPMch9IUs611sR0r4lpl3odZfi15px0TU+xqrN+iGKmyZsul67F6eCBGnmYhv9mDgumVReqeU4GQdgAFqIXJNpBLXvijvY29tgcNWbI/Q54jl6d5KnpXb0hMx1495quA/iBAPdSYpD+C1wcWFJ/znwnSM5IBAtSe7zyzhwSD5XxMEXsnlyQ1Th+JtAPNh8Yv84TjfwP+iY5//d2M+7xgKi8Mosxi4VKkt4aAkQ2q8Fj2Evj6sqeDI8mwzWljldPrwmj/BiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKt/ro4LQduWIlKU7u3xuKX22MO5PIyhIGQkhWOQHOc=;
 b=fcbk5+INVwSE8lLtsM3m0vCr2FTQflxONuHY335CLhnHH3BmmS6b5bNq8UuwZUEmz45vuv5BcdhMMCcIdoICsYQWouEGv95be0UEQ4QOTtaEkh9CMJyLOaiLola5CEZ18yjbEjo4/NmT67PrRhPnHmRCeXeSWCBQr0QMK4ooigha5bCmcyEFrSSCbBb2YABELw5Cap58osMadFYI/rQhIePPe+RkGXKqXUsa84WKxfdXunXPuq8usCOPCqbaoOPDX1dp78ZtLiEQPC/hMMBkEO5gxF+VBcTgN/fp8nxWlm9bKVsEQlgd6vwuoxTD+JQhqKSUqWyWhhIsquaooxOZNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKt/ro4LQduWIlKU7u3xuKX22MO5PIyhIGQkhWOQHOc=;
 b=cPlpHbb1IFGheZFva490L90g43MTTK5JAdzvbwjM07IDzlIsY+dEMdbk0IWQlUJ1m+0/fodvXmrsCK2ZpPRwFtIqSuVRjN5UH6xg4wFSHWWy2PBZMMEC1oDqJTPe3wUDeVs1hkXLbv/IpPcuZkqUZUux7AURNeFfjExmb2Pv4vc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <eed26206-9684-4010-278c-14ed3602582b@amd.com>
Date: Wed, 7 Sep 2022 15:37:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
 <9a66b6df-bc37-d836-8175-3b98be07c696@amd.com>
 <e5e9a62d-6072-463e-6c4c-8d94aa29589b@xen.org>
 <a29a07fd-40ad-602f-9a79-a36783ada947@amd.com>
 <e8bf68b1-0217-c8cd-4864-ea7fe415fb0a@xen.org>
 <b0b85a1c-ff00-ea06-a960-e49799d507eb@amd.com>
 <ED046919-0B75-48C6-900F-44F3295553B7@arm.com>
 <7997786c-78ff-47df-12de-d1fe38e5624d@amd.com>
 <4B69D9F9-04AC-4042-AF74-F51630816208@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <4B69D9F9-04AC-4042-AF74-F51630816208@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT109:EE_|MW6PR12MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: da3a4d8c-5a1d-481e-fdf7-08da90d624a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tTu4yXSy52cZ/N6BmbjayezJuEga9Iqm+EXTmIgm4YQbUHJBKLBr+tZyUYaRnKEABgd+6CbssSnzd+7EwJikrwXHNU5HEYTxsjr6oflvyoB7OPJPNkLVi80M7NdQTm/qBB57XZOdgS0Z3jU6ajD/XqRChA/hIYpM8pIcTEwHjgK5tTT3uh6nR3/VOHS7zKEnPvGyybSsNmbX4rvMHbTd3FeyGgjMhqEsCs94QaYI2CapX+QOrp6y8jrdG1n+XfSk/TBgdElGFnoRMc6tD2Gru+1p+kUPIr57eBMu8a8zsTPzPPRf0lOhkAZR4ztGG9+PgoZkx5kXb+U3wOPtmc6Dn3St9Hii85LH8rf7ko2sSHJkAdimGRqrL0EzPKp4iP1ZoNzfooFY9dh/jTNS8E09ilPTniQ0CXCqPHmH47MWf6uqVeSjS/OEOvOo/cAIkwYdgkayXrfHuhjq5ujRbDW3TJDpNG/vwLnVY/RvqeC89/e4LZ4LrT39ts+dD4FWqdEdtDttHFnitRQ/PbdsHUZtFHO+0QT4XC6e9iB7UkfG0x6XHydAxzm6OzPXhyhaAKo53jnVhMLh3zlmYBTirQga5kGIcwoM4ikmeL2OzWkmCRBc74GS4nhR1JWcyZOg+B6vvx70jTSots75v7UEDQvM7Zuw3nxAr+dkpTWfQNTx20mYYY7RN/mTN2rVwkCkqMhESnSL7Bmk4MMxzKYi0NQ61r1ucg0GqAn9HF9czLnpKaXPcFMZNt1Uc702umfQ3SsBDDmRGYYL/pCA5ggbHlYs1jXtaqgpARYIf13zYjQ1AOlgajBnjZaGXED6g0Ri00K7ky5VEUFph8aqtmTDvrddmBgafOUS0NHjxfQqXe0J92w=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(346002)(376002)(40470700004)(46966006)(36840700001)(41300700001)(5660300002)(53546011)(26005)(478600001)(31696002)(40460700003)(44832011)(2906002)(86362001)(8936002)(356005)(40480700001)(82740400003)(36860700001)(47076005)(186003)(2616005)(426003)(336012)(83380400001)(6916009)(81166007)(4326008)(8676002)(31686004)(45080400002)(54906003)(70206006)(82310400005)(16576012)(966005)(70586007)(36756003)(316002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 13:37:43.5349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da3a4d8c-5a1d-481e-fdf7-08da90d624a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7069



On 07/09/2022 15:33, Bertrand Marquis wrote:
> 
>> On 7 Sep 2022, at 14:31, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 07/09/2022 15:28, Bertrand Marquis wrote:
>>>
>>> Hi Michal,
>>>
>>>> On 7 Sep 2022, at 14:09, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>
>>>>
>>>> On 07/09/2022 14:45, Julien Grall wrote:
>>>>>
>>>>> On 07/09/2022 13:41, Michal Orzel wrote:
>>>>>>
>>>>>>
>>>>>> On 07/09/2022 14:32, Julien Grall wrote:
>>>>>>> [CAUTION: External Email]
>>>>>>>
>>>>>>> On 07/09/2022 13:12, Michal Orzel wrote:
>>>>>>>> Hi Julien,
>>>>>>>
>>>>>>> Hi Michal,
>>>>>>>
>>>>>>>> On 07/09/2022 13:36, Julien Grall wrote:
>>>>>>>>>
>>>>>>>>> Hi Henry,
>>>>>>>>>
>>>>>>>>> While reviewing the binding sent by Penny I noticed some inconsistency
>>>>>>>>> with the one you introduced. See below.
>>>>>>>>>
>>>>>>>>> On 07/09/2022 09:36, Henry Wang wrote:
>>>>>>>>>> +- xen,static-heap
>>>>>>>>>> +
>>>>>>>>>> +    Property under the top-level "chosen" node. It specifies the address
>>>>>>>>>> +    and size of Xen static heap memory. Note that at least a 64KB
>>>>>>>>>> +    alignment is required.
>>>>>>>>>> +
>>>>>>>>>> +- #xen,static-heap-address-cells and #xen,static-heap-size-cells
>>>>>>>>>> +
>>>>>>>>>> +    Specify the number of cells used for the address and size of the
>>>>>>>>>> +    "xen,static-heap" property under "chosen".
>>>>>>>>>> +
>>>>>>>>>> +Below is an example on how to specify the static heap in device tree:
>>>>>>>>>> +
>>>>>>>>>> +    / {
>>>>>>>>>> +        chosen {
>>>>>>>>>> +            #xen,static-heap-address-cells = <0x2>;
>>>>>>>>>> +            #xen,static-heap-size-cells = <0x2>;
>>>>>>>>>
>>>>>>>>> Your binding, is introduce #xen,static-heap-{address, size}-cells
>>>>>>>>> whereas Penny's one is using #{address, size}-cells even if the property
>>>>>>>>> is not "reg".
>>>>>>>>>
>>>>>>>>> I would like some consistency in the way we define bindings. Looking at
>>>>>>>>> the tree, we already seem to have introduced
>>>>>>>>> #xen-static-mem-address-cells. So maybe we should follow your approach?
>>>>>>>>>
>>>>>>>>> That said, I am wondering whether we should just use one set of property
>>>>>>>>> name.
>>>>>>>>>
>>>>>>>>> I am open to suggestion here. My only request is we are consistent (i.e.
>>>>>>>>> this doesn't depend on who wrote the bindings).
>>>>>>>>>
>>>>>>>> In my opinion we should follow the device tree specification which states
>>>>>>>> that the #address-cells and #size-cells correspond to the reg property.
>>>>>>>
>>>>>>> Hmmm.... Looking at [1], the two properties are not exclusive to 'reg'
>>>>>>> Furthermore, I am not aware of any restriction for us to re-use them. Do
>>>>>>> you have a pointer?
>>>>>>
>>>>>> As we are discussing re-usage of #address-cells and #size-cells for custom properties that are not "reg",
>>>>>> I took this info from the latest device tree specs found under https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.devicetree.org%2Fspecifications%2F&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Cc677a7983cd94e48620708da90d5a15f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637981544487489692%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=1uwtf%2F6shf2PiKu0XZPFNQ%2B6iyhLrMsYb1XEru3IGlg%3D&amp;reserved=0:
>>>>>> "The #address-cells property defines the number of <u32> cells used to encode the address field in a child node's reg property"
>>>>>> and
>>>>>> "The #size-cells property defines the number of <u32> cells used to encode the size field in a child node’s reg property"
>>>>>
>>>>> Right. But there is nothing in the wording suggesting that
>>>>> #address-cells and #size-cells can't be re-used. From [1], it is clear
>>>>> that the meaning has changed.
>>>>>
>>>>> So why can't we do the same?
>>>> I think this is a matter of how someone reads these sentences.
>>>> I do not think that such documents need to state:
>>>> "This property is for the reg. Do not use it for other purposes."
>>>> The first part of the sentence is enough to inform what is supported.
>>>>
>>>> On the other hand, looking at [1] these properties got new purposes
>>>> so I think we could do the same. Now the question is whether we want that.
>>>> I think it is doable to just have a single pair of #address/#size properties.
>>>> For instance xen,shared-mem requiring just 0x1 for address/size
>>>> and reg requiring 0x2. This would just imply putting additional 0x00.
>>>
>>> I think we want in general to reduce complexity when possible.
>>> Here we are adding a lot of entries in the device tree where we know that
>>> in all cases having only 2 will work all the time.
>>>
>>> I am not convinced by the arguments on not using #address-cells and will
>>> leave that one to Stefano
>>>
>>> But in any case we should only add one pair here for sure, as you say the
>>> only implication is to add a couple of 0 in the worst case.
>> I agree. The only drawback is the need to modify the already introduced properties
>> to be coherent.
> 
> Agree, someone will need to do a pass on the whole doc which might be easier with all things in.
> 
Well, not only docs. If we decide to use a single pair of #address-cells and #size-cells, then
we need to modify the code that expects different properties e.g. xen,static-mem-{address/size}-cells.

> Cheers
> Bertrand
> 
>>
>>>
>>> Cheers
>>> Bertrand
>>>
>>>>
>>>>>
>>>>> Cheers,
>>>>>
>>>>> --
>>>>> Julien Grall
> 

