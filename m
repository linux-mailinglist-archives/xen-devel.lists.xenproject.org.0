Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 787825B041F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:42:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401586.643447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuNa-0003G6-HS; Wed, 07 Sep 2022 12:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401586.643447; Wed, 07 Sep 2022 12:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuNa-0003Cl-EJ; Wed, 07 Sep 2022 12:42:06 +0000
Received: by outflank-mailman (input) for mailman id 401586;
 Wed, 07 Sep 2022 12:42:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiom=ZK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oVuNY-0003Cf-Hi
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 12:42:04 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2052.outbound.protection.outlook.com [40.107.102.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 788fd422-2eaa-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 14:42:03 +0200 (CEST)
Received: from DM5PR08CA0057.namprd08.prod.outlook.com (2603:10b6:4:60::46) by
 LV2PR12MB5752.namprd12.prod.outlook.com (2603:10b6:408:14d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 7 Sep
 2022 12:41:57 +0000
Received: from DM6NAM11FT074.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::8d) by DM5PR08CA0057.outlook.office365.com
 (2603:10b6:4:60::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Wed, 7 Sep 2022 12:41:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT074.mail.protection.outlook.com (10.13.173.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 12:41:56 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 07:41:56 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 05:41:56 -0700
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 7 Sep 2022 07:41:54 -0500
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
X-Inumbo-ID: 788fd422-2eaa-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GthO+fsbVKS51MGxY6j/Llv4yTTdXOa0P36N2JXs3uPHKDg2DJr0p9x9kzdPZQr+ZTD6hFW/gvqvw4TDx9a2Fvnt+Or9Ld21uNO1E9o+Q54V2xLSiV3qnljng99rflGf1nEgD1Mu3xFUmMiJeTnBpB1l2Q2p2OY9E466AM53LgjO3iPlBH6FHugHqLre/lwtRCMLl20Nc33kMJ8+JXVfwJ/8UYG0tFZrK987DimlTD9cAGQILez4/IBlWqq93GRcJEhPIxWwOmXWBbKsv9/J4gGvpSuxD7a+VWBnMRMJzeK2ANlAqYBH9cUAYL4p1gg6zKxxkcDKANqUZSh6Cqa21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woKPLq+RkGsItn6F4ZxvyD92K+4Tuo/7tb3rJtxA62k=;
 b=UkXy847eX+bpVOSLFJATu1iwH9AjXtGNiHPrgAHX2Qw43vGAinjg7ZqmGyQV+uBBTBkPFXPADcwcfXwciNBKpFcKt93T8C5PC73aCSDy2uJMnwORGA5mq9chqMj94XzmuuzvBDp3DLvznUgv4uBmF3TXLdqvnXmbrSaquwAcCZdcBOOjoSiPVgSr1FMuVRKW8Gu+3Q8zE0yQD/yGVKp6kzc5m+S3zKGb6ZO+5bAfpL4oWHOhEL+Vli4W5MLMHBvNb6EoYawbqsV/vlrgf4g5N6Dvj7wb9su/TjmyC2GGEUgV6/qe2f4X5oy+HLvRXoZ8A/f/hgqJ2dCL5zsVttdOlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woKPLq+RkGsItn6F4ZxvyD92K+4Tuo/7tb3rJtxA62k=;
 b=rqEV4tSIQtOucUZLwLD9o8+Hk7tTLXNe0CwTegja1xO6rVX8LAe1/3+L3O5wFLyhGeDfN4KctgaGk0enQj3Io6cktKMJvWPAMrLRoh2Gj3kBHGuOk/DnKhnB5JuqR40SjDnokE4RJWNps8uK+asr4KDV/om5Xf2b6Zi0PsJFfig=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a29a07fd-40ad-602f-9a79-a36783ada947@amd.com>
Date: Wed, 7 Sep 2022 14:41:54 +0200
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
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <e5e9a62d-6072-463e-6c4c-8d94aa29589b@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT074:EE_|LV2PR12MB5752:EE_
X-MS-Office365-Filtering-Correlation-Id: 816d7a6f-172c-45ad-ebb4-08da90ce59d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+E5gzsONyDCZ0XqLk0B/+ZMNfaYV/i5iB2ha+AnyB2ANQ9gZCFrIjZ3JdzRy6O2QbCg/LXOLkyItu+RI5tgqEsmbLvdsmeV2ZeF3boYgk58uBSUXlaR9b4oVN8NaTgt+PfrM6FKclVDvLI+vkgavBhZGdPU2kcNcbB4JJWEi33be5zhJ/zGbqiK8KHNAX8rODs63caKgdMkT+kFtZdVhuek/xrF8ygeZGgIHvGL0NVBfckS7sapd6BgK0RHc+gGEJzFbAe5imTe0UTkqcBlUma1FWrs+c/x4aqdvi1I58WzwnX1sBrZq7tHFl5N13cxwEjuFzAhiRXnbzDIy3mf83O8gffdUIOkbBtjPbOQfecKI1i3aSpy19dQlrecVVHKK/oFCyZZjx2Pva8lksi4e6VL4e9f13/KApmRTqasvMjUhWGzmAiSHNGxVJok7RqAhJEXYbPDrGKhSrL4HFQLAtrekoU4oKocTrZRXQBYqhCETbKtOuN32sg98UzeaB+q3eegJ6bhu9OkIfYLQgS540OayOtF7i+DYOg1StKV9nLfVnEaDVJAG2/E3SDtqkXYzplf+mVLY8n3F1eMmPmBIrTl4XSI3dNNNprQjabxrn4xXkg/OR4Y0i4a19PEoKxdMwUjHbePp0jA2va4RWILc+QxsfM8Qid3bLNMVKkUCm4lQDVxD5J5J24thClDMvRNtUaCl3blUPU9+vpvetkg5HVAfVqaSvedZrxvUVRJUnyeJnvCugEi+sRUwvJGcZC7eVRrta1MEOKffwJDhvmtOn64t8sJTiFzFiWcYh7fFT8+Xw87k4RoM/W/gREl6Nuqu1T/tqql4dcUDCm4OznJVpvgJGZ+9pKm347kTWCDvgvI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(39860400002)(136003)(40470700004)(46966006)(36840700001)(36860700001)(426003)(82740400003)(53546011)(47076005)(83380400001)(26005)(81166007)(186003)(2616005)(40460700003)(356005)(336012)(86362001)(31696002)(31686004)(4326008)(70206006)(966005)(8936002)(110136005)(82310400005)(70586007)(16576012)(316002)(5660300002)(40480700001)(2906002)(54906003)(44832011)(36756003)(41300700001)(8676002)(478600001)(45080400002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 12:41:56.9951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 816d7a6f-172c-45ad-ebb4-08da90ce59d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT074.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5752



On 07/09/2022 14:32, Julien Grall wrote:
> [CAUTION: External Email]
> 
> On 07/09/2022 13:12, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>> On 07/09/2022 13:36, Julien Grall wrote:
>>>
>>> Hi Henry,
>>>
>>> While reviewing the binding sent by Penny I noticed some inconsistency
>>> with the one you introduced. See below.
>>>
>>> On 07/09/2022 09:36, Henry Wang wrote:
>>>> +- xen,static-heap
>>>> +
>>>> +    Property under the top-level "chosen" node. It specifies the address
>>>> +    and size of Xen static heap memory. Note that at least a 64KB
>>>> +    alignment is required.
>>>> +
>>>> +- #xen,static-heap-address-cells and #xen,static-heap-size-cells
>>>> +
>>>> +    Specify the number of cells used for the address and size of the
>>>> +    "xen,static-heap" property under "chosen".
>>>> +
>>>> +Below is an example on how to specify the static heap in device tree:
>>>> +
>>>> +    / {
>>>> +        chosen {
>>>> +            #xen,static-heap-address-cells = <0x2>;
>>>> +            #xen,static-heap-size-cells = <0x2>;
>>>
>>> Your binding, is introduce #xen,static-heap-{address, size}-cells
>>> whereas Penny's one is using #{address, size}-cells even if the property
>>> is not "reg".
>>>
>>> I would like some consistency in the way we define bindings. Looking at
>>> the tree, we already seem to have introduced
>>> #xen-static-mem-address-cells. So maybe we should follow your approach?
>>>
>>> That said, I am wondering whether we should just use one set of property
>>> name.
>>>
>>> I am open to suggestion here. My only request is we are consistent (i.e.
>>> this doesn't depend on who wrote the bindings).
>>>
>> In my opinion we should follow the device tree specification which states
>> that the #address-cells and #size-cells correspond to the reg property.
> 
> Hmmm.... Looking at [1], the two properties are not exclusive to 'reg'
> Furthermore, I am not aware of any restriction for us to re-use them. Do
> you have a pointer?

As we are discussing re-usage of #address-cells and #size-cells for custom properties that are not "reg",
I took this info from the latest device tree specs found under https://www.devicetree.org/specifications/:
"The #address-cells property defines the number of <u32> cells used to encode the address field in a child node's reg property"
and
"The #size-cells property defines the number of <u32> cells used to encode the size field in a child node’s reg property"

> 
> Cheers,
> 
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felinux.org%2FDevice_Tree_Mysteries%23.23xxx-cells_property_name&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C40290431f16748808b6308da90ccfc53%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637981507324472512%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=okN60ULg2Dx3cnlA5vPLMR%2F8QAKnbGmBpz7goXb5usw%3D&amp;reserved=0
> 
>>
>> ~Michal
> 
> --
> Julien Grall
> 

~Michal

