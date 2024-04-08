Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A92D89BA64
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 10:34:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701843.1096370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtkSM-00063Q-Vj; Mon, 08 Apr 2024 08:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701843.1096370; Mon, 08 Apr 2024 08:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtkSM-00060l-Si; Mon, 08 Apr 2024 08:34:22 +0000
Received: by outflank-mailman (input) for mailman id 701843;
 Mon, 08 Apr 2024 08:34:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pPud=LN=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rtkSL-00060f-QZ
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 08:34:21 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id caa696d7-f582-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 10:34:20 +0200 (CEST)
Received: from BL1PR13CA0277.namprd13.prod.outlook.com (2603:10b6:208:2bc::12)
 by PH0PR12MB7886.namprd12.prod.outlook.com (2603:10b6:510:26e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 8 Apr
 2024 08:34:16 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:2bc:cafe::84) by BL1PR13CA0277.outlook.office365.com
 (2603:10b6:208:2bc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.15 via Frontend
 Transport; Mon, 8 Apr 2024 08:34:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 8 Apr 2024 08:34:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 03:34:15 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 03:34:15 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 8 Apr 2024 03:34:13 -0500
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
X-Inumbo-ID: caa696d7-f582-11ee-afe6-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nf1n82ArfjcJ0gzLPHLOKvB268cnWbNWcAulzj1MzgWaenIqRDcVdRLGx6PAS0dSsHqYn7DpLT7jqHByyR7puAZ7wC398anqxEQNn3uGSChXT9fELuZG7N0R4rWBnHv57JNTktFLIwaKUDfUZUUnlhyKifrP71Azul+LNTdioPnqAXOvZ/I8lhqbEgHaZkeQcRkkE+IglZY86hAD9YNri913mxSphwIh3BN2x+ivRVK0X9pvOtzqQI8YhmgAadEmMNHd0arz5V2eHCW+gAEUyB2AiUfdCB/7jGORaS8GJ7/EYgp/5XReYY+X63x6rGYRQovgPJDB1Q93fIPWhmfYgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzCM4xhzFL0BtN8uxUraF6cJqP9Dzk7+G1GzxA8uujo=;
 b=V67UYrbyZzUhUA/wWdoEcBm86xt7/i1N6AnblF5XKKXVC9ImGiNCjhp9cojdvvYv96tTaAlvU5y5mJfhf7VhPuLsBsEi6OwiZXUoarWn2hQFA4kcG40VQIElS1NUfOV6OTqXQcWOWcGpTkrzw85+0cJ02Zi2rOjG2tMpSIHA0eG8YlzcRHtN7LUIx1qauk7N5YXiSXrxSPFDySbDndxnTWCCbOSgSd655Z/7x/1fryRo7Gu+2T7n0pO06MwVFuPbNPgpHcWiWzJMKrg11ivRgIj7etq8e/MUQUuE93QLiJPSM/wh2ugFT4WT/SEWoRxdRdNmwDieAEXawcSun09hyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzCM4xhzFL0BtN8uxUraF6cJqP9Dzk7+G1GzxA8uujo=;
 b=fAqgEEnPLPy684DBRkuJmsIGv6B55IAJA55vTO9eLfgU+b330cozbju65dNHn/W0Ow0CueBs5mqOyRRcbYNSwyLU5caETAfNmss6Gc7kQdT+0ywhQLxeJRpIV9IOrK/H87DPpVVszqoWka+RcfFJJOKZTPlkOh5r4qPNvZybEG0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0b96a279-4c5d-435f-afeb-c5b536dbed02@amd.com>
Date: Mon, 8 Apr 2024 16:34:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] xen/memory, tools: Avoid hardcoding
 GUEST_MAGIC_BASE in init-dom0less
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Alec Kwapis" <alec.kwapis@medtronic.com>, <xen-devel@lists.xenproject.org>
References: <20240403081626.375313-1-xin.wang2@amd.com>
 <20240403081626.375313-5-xin.wang2@amd.com>
 <e9167c39-187f-4a66-b9a4-8b3a6ae3000b@suse.com>
 <09cc419a-cdf6-4cda-90f1-c0e1ae83ad47@amd.com>
 <951cc6ba-c971-4b5b-9cfc-bc79245a9549@suse.com>
 <9518c19a-eb97-4d68-97bc-fcae56aa8093@amd.com>
 <0a28ce70-6c71-43da-8aa1-3b9909e2d152@suse.com>
 <e5b8e385-6d72-4102-bd0a-47f868535b90@amd.com>
 <2d73f0d0-abed-4fa8-ab26-e0e4c712a108@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <2d73f0d0-abed-4fa8-ab26-e0e4c712a108@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|PH0PR12MB7886:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d593c6-cd34-46c0-3fee-08dc57a6ad39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sazx7TCMU7DRJZpRVgTwVnGppBhuIcFJc4o21aNkxBn4/WWrJ7KGsih9yq0Z0PCnIcArbCQEz/znlztH+TIs5637nir3H3yGIx0cZ2s9dPyxs29OYpBgWyjRQY0AgUaF80u4OdhiceEGs0/Aq8qVWysaUV74BsC1Y9D2F/SK68E2O1f9AgVtftUkjLTAlIi865TdtDx40shBXGjQ0LkF2QBimqXJyklGwD1CwAb0nEyu2bsNcyqCnklIlnnuPY7y0/2eHFBr2VhwK9bcKtlcUWMd0LI9EeIKwMTh47d/czlzENZe8lydysF0c5GDzZyIeo8+uSUEzZswJXrvIdlTMcmNs3LBH1KXrDxawVz7FWqeuGlcBK8jsrZT6zbiWJOcp5e0B75li2Tbc9U4mBQEKZ2jHLpaAkMGvG34ffc5QnaA2/tjXYZijYro/TXnrv00YTB01/sKqydWHplYtBUt/kVnZgf0kys68axDQB5UgZFhF4SNLeiOSU0TuMhz4OIBqSPeYGcbHdfZGp1KEO3sf+dECmNW8goR05FHK3Bj6BG5cfmhPYNkjp2181YVyMdv3reN3P4UTuxdGl8qXAnYxmpJnpfdwRSygptnaeBcMUGIsQnfd4zWQPTdFjGWA6Ddlfgb2YMF3TpRND/t83fA3GLv2imYsOKCr1EtzpH5064rerXYQCChRXQnpGC3Y8lVkjMkTw8jXJcthnP2naU4apNvaCi99lA+xkiqlSRAqgrCXSc0sGa3CJZjvvrVucr3
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 08:34:16.1853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d593c6-cd34-46c0-3fee-08dc57a6ad39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7886

Hi Jan,

On 4/8/2024 4:26 PM, Jan Beulich wrote:
> On 08.04.2024 10:12, Henry Wang wrote:
>> Hi Jan,
>>
>> On 4/8/2024 3:03 PM, Jan Beulich wrote:
>>> On 08.04.2024 08:59, Henry Wang wrote:
>>>> Hi Jan,
>>>>
>>>> On 4/8/2024 2:22 PM, Jan Beulich wrote:
>>>>> On 08.04.2024 05:19, Henry Wang wrote:
>>>>>> On 4/4/2024 5:38 PM, Jan Beulich wrote:
>>>>>>> On 03.04.2024 10:16, Henry Wang wrote:
>>>>>>>> --- a/xen/include/public/memory.h
>>>>>>>> +++ b/xen/include/public/memory.h
>>>>>>>> @@ -41,6 +41,11 @@
>>>>>>>>      #define XENMEMF_exact_node(n) (XENMEMF_node(n) | XENMEMF_exact_node_request)
>>>>>>>>      /* Flag to indicate the node specified is virtual node */
>>>>>>>>      #define XENMEMF_vnode  (1<<18)
>>>>>>>> +/*
>>>>>>>> + * Flag to force populate physmap to use pages from domheap instead of 1:1
>>>>>>>> + * or static allocation.
>>>>>>>> + */
>>>>>>>> +#define XENMEMF_force_heap_alloc  (1<<19)
>>>>>>> As before, a separate new sub-op would look to me as being the cleaner
>>>>>>> approach, avoiding the need to consume a bit position for something not
>>>>>>> even going to be used on all architectures.
>>>>>> Like discussed in v2, I doubt that if introducing a new sub-op, the
>>>>>> helpers added to duplicate mainly populate_physmap() and the toolstack
>>>>>> helpers would be a good idea.
>>>>> I'm curious what amount of duplication you still see left. By suitably
>>>>> adding a new parameter, there should be very little left.
>>>> The duplication I see so far is basically the exact
>>>> xc_domain_populate_physmap(), say
>>>> xc_domain_populate_physmap_heap_alloc(). In init-dom0less.c, We can
>>>> replace the original call xc_domain_populate_physmap_exact() to call the
>>>> newly added xc_domain_populate_physmap_heap_alloc() which evokes the new
>>>> sub-op, then from the hypervisor side we set the alias MEMF flag and
>>>> share the populate_physmap().
>>>>
>>>> Adding a new parameter to xc_domain_populate_physmap() or maybe even
>>>> xc_domain_populate_physmap_exact() is also a good idea (thanks). I was
>>>> just worrying there are already too many use cases of these two
>>>> functions in the existing code: there are 14 for
>>>> xc_domain_populate_physmap_exact() and 8 for
>>>> xc_domain_populate_physmap(). Adding a new parameter needs the update of
>>>> all these and the function declaration. If you really insist this way, I
>>>> can do this, sure.
>>> You don't need to change all the callers. You can morph
>>> xc_domain_populate_physmap() into an internal helper, which a new trivial
>>> wrapper named xc_domain_populate_physmap() would then call, alongside with
>>> the new trivial wrapper you want to introduce.
>> Thanks for the good suggestion. Would below key diff make sense to you
> Yes.

Thanks for confirming!

>> (naming can be further discussed)?
> Personally I wouldn't use xc_ on internal helpers. But for guidance on
> naming in the libraries the maintainer(s) would need consulting.

Sure, thanks for sharing your idea. Well I added xc_ prefix because 
seeing static int xc_domain_pod_target() & int xc_domain_{set, 
get}_pod_target() etc. pairs in the existing code of the file. I agree 
that the opinion of libxc/toolstack maintainers matter too, and hence we 
can continue this discussion in the formal v4.

>> Also by checking the code, if we go
>> this way, maybe we can even simplify the
>> xc_domain_decrease_reservation() and xc_domain_increase_reservation()?
>> (Although there are some hardcoded hypercall name in the error message
>> and some small differences between the memflags)
> There may be room for improvement there, but as you say, some care would
> need applying.

Yeah...not really sure if it is ok (TBH I think not) to do it all 
together in this patch, I will probably add another patch to clean-up 
all these duplications when sending v4 (depending on how far I can go).

Kind regards,
Henry

> Jan


