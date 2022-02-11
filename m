Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BE74B249B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 12:42:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270424.464711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIUJf-0007Az-Ap; Fri, 11 Feb 2022 11:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270424.464711; Fri, 11 Feb 2022 11:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIUJf-000790-6K; Fri, 11 Feb 2022 11:42:19 +0000
Received: by outflank-mailman (input) for mailman id 270424;
 Fri, 11 Feb 2022 11:42:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jrYj=S2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nIUJd-00078m-H0
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 11:42:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a916e49b-8b2f-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 12:42:16 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-4lzJdvFgOVWA-mavSlZ5Fg-1; Fri, 11 Feb 2022 12:42:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3423.eurprd04.prod.outlook.com (2603:10a6:803:9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Fri, 11 Feb
 2022 11:42:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Fri, 11 Feb 2022
 11:42:13 +0000
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
X-Inumbo-ID: a916e49b-8b2f-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644579735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gpfKJJQbNe70w2WbElGbeCD7X2NChvh9GVV9Gf9C2tU=;
	b=MdgBDiqFSPXWeX7UM9ZWOpNSpz+LMzZbAxnj1+6yK8c9htsQTpkk0S/kBEHoNRUcsJNJSH
	T2/OCjpUZ+SKu1wKGqLNr6St6Wgr6XHmu05rvB5eeyEWlKLrOCN71LKTxEuA8TWVMmSrtw
	4Wlfr+ZI5tCU0MitaIe87nI2uCpAhtQ=
X-MC-Unique: 4lzJdvFgOVWA-mavSlZ5Fg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaAxfNVPyTEgBMUvyhsSmJfVqo1O/oQyvnDwkxhG8NDzSH/ZdVaEvhr98Bp8UWX/tl9Pz5WLffhZemgXKrQ7cc/Y2afjuOcvzwTLWA707OwDoKMEGEIEfzgqprQD51SVYr50ES759MmEZgmSCmzSQVF+k3m6cn6izIOvhlg8twuriR+FPF3wBl0mXTXfB8TdhQvInYaXMM6sQ3b75QK1BOnvAynJz05RppdzQv/Iw1TWvFm4Nza5tWPVvKsiw3DJFglxnUDD+Zru5S1GWlBDjC6PJzZ+jDAO0N+KQceS/xI0CQbot5GuHh0eM48V00za36/ZDMiHYiiP1jAI9NxtKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9w2MAgE6l5LXbxEH9ygOTMgVw6V1z6gRpRmbzHqpZ8k=;
 b=TvCtbikce56vxi3wgnL71ov3flrHVmdM+cdbzx6Z7b38o6JHZ+f6TBoneVeC2dUQzokqHBHf3m9B+6kPMAaRv1uZp7OvfDxVw3qLiMvpsUR8QsyDlrq1mO61rkRKJQ9QA1r1sK8N6l9uNHWwKC9p1km/7ZYUD4k0/T40gwjvNheD699NVf0n29akxUVayxLOIog8FjwMMv18ufQvMStZSJxjMzowlrSivgU2D1lYTH/DCMfyzi4vxrG+Xf2bCVB731rcvOO290/usQqxTJsENc+JNX8Mm6Ccui3oRjj4aieBPMV5FUCE3khFqR9u3ZxmgtnhJEbZYD1jewlnd1fwHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa312e0c-571c-b200-7d34-9f2d14c2b67a@suse.com>
Date: Fri, 11 Feb 2022 12:42:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH CPU v1] cpuid: initialize cpuinfo with boot_cpu_data
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Norbert Manthey <nmanthey@amazon.de>
References: <20220211072327.1213-1-nmanthey@amazon.de>
 <YgYmKiZaX2vZYgKP@Air-de-Roger>
 <85182aaf-1d3b-981a-1108-8eed79516893@suse.com>
 <YgY+sUOIaW7c3Mq2@Air-de-Roger>
 <717694b1-bcb9-b2cd-3740-71d8431a3058@suse.com>
 <YgZGPZUyW0mzGz+Q@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YgZGPZUyW0mzGz+Q@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0701CA0017.eurprd07.prod.outlook.com
 (2603:10a6:203:51::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ce022a7-4ce3-4081-35d4-08d9ed538bbc
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3423:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB34234D8E641A97F175B2360FB3309@VI1PR0402MB3423.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V5wvdmpxOaFA8zQR0HRUMXjssn430120n4V248kLqgCd+vr1Q3/Bz3UUFfRgHP4SC/AXIoVRWVdkQ8XiG0ynRvJPBs2x5Mq5wJr7hHR2N1uPUlSR9h/JKW2ruxkreg5094Bgs0OFOUj0JIpVvSNA0w42YYMzZts7Tse8hHIq2ApQ3C+SbMB/lKDwU6RCexPuL1lmR2bZjfvDP9kJ8EY/+GtIAMKUDWVCfMtf8CMrjs+oU1lPxJwFKmSj8eLoQk/xgJ2zWtbo8I3cbLGMKgg4W1ve3hT4IMROP4KYJWQ3tQ+mpgjVqhW1tlqMDYfwLcYepC1eM6sjt6tWMVwu8BSz737XKyoY7x08jT9jl1CUzH1QmgqsGZBF9DAhnIoMec7yo6Ka58yra9v2Iapk9lBhYpXgB7hyhXfrX4wpub4vfNp1O9XfjhyoaL08hdrPNUsheZysS/zfTRYMEldUnTyjoUrpqEUUgjHIcAD5rGun3pT2djIMfpweAkbGT6jYV4oVcx2zgrSVkTPM1ta9zbz/b6pQSyZaWhF4YWEeSeHvEKV+3ddiEaU95NIrhBAX8A4wBrcR23pFqGtDvbXmAQXLm0e1xrB9GX19omux4o8XbvmZoiL/rvKarXUN8DTvj3j7WGNPsF5imPpMBxcu47QFYBj/63oDhMnflVGk7iSBXo08w5uZ/oIyug/6RLh4lvyNdlNIfT1WkBuAgm6d7FqovE8TZx0gHZek8wBO1OjeKEmvLN8Jm2KLY+sio036BnZZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(66556008)(6916009)(54906003)(31686004)(508600001)(53546011)(2616005)(66476007)(2906002)(6506007)(5660300002)(26005)(186003)(66946007)(4326008)(8936002)(38100700002)(6512007)(31696002)(316002)(86362001)(8676002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aenYhepjGiMUEVzX/m9i0p9ecFIReA4GGUnplgAuQu5hCGdCL997HAv86Wck?=
 =?us-ascii?Q?xw9HLD444C5EvKga/J62IhYQoOxFMLnE2QTSPUq/cM/AzlLnciSFjy8UWulE?=
 =?us-ascii?Q?ouD2KpzsKKZRwXtwAD8v06C2/3WdVSq7n6wjvdsrOTOX//LJk3kjMqCCbWHY?=
 =?us-ascii?Q?a6h9+SdDbhM/+jv6I3uY1TvpSXTbpkU7qXjnfVj1/tjjMR7ze2kE94yj8Bui?=
 =?us-ascii?Q?UocoPvUarHL3MYH3M5/JhlRrchCD3PmMgv8YGTN1u/tZu1F8PFcAz2NInP91?=
 =?us-ascii?Q?cApnqDWyLWAD1PGGxQ9j2IiJFogVLDhv2OUA2t0xotUSUr68aZxWYICkthoS?=
 =?us-ascii?Q?K6W4/sA7T/QZ3z7w0mFjjjfdYZyIlyCgi86Kj4jOvRkCVNTCR480BrCPfpCR?=
 =?us-ascii?Q?3J9NtTpjqQEVZWnI/+260Vqm/mxodzOsSa4i6rhIt2w0+ZfTcaC78JJZkw5g?=
 =?us-ascii?Q?lYtWFMLiDB+TKuTVKpW6yQkPaVdTFZqITd9GLLtaDmZwGEkTsgMn/Atb6ANS?=
 =?us-ascii?Q?kc9ht2mZiBGntWlEsoBCtfcfqJmYMDaGhm5jBpFCQ4xfA0fb/IIdNj+OD93/?=
 =?us-ascii?Q?2AUK0ZsT7KeRPgH3qurQncs9YVlhOF8bVqMAf/0k4pBDqGfNpZNGrVL71vk9?=
 =?us-ascii?Q?4zg9ANhnurBXtrCNQESsONAxSFZcsacnmC1q3VW9MPGhvZTXhm/KkF700yjp?=
 =?us-ascii?Q?gls6Wo6tnP9O5+8J2Ttl0veO26OU/yrjeDdTLIsmrzEEJg/ZwG699iKLwmvQ?=
 =?us-ascii?Q?iGnOIk5KHJHv+8vYWwhqBV6XWZ1boeLFQCQ+qzdGYq4ChMBlpyYrWMDbglD6?=
 =?us-ascii?Q?lcqBGNG/mKn4CObawb+c9Wdl3rXpDLns0MtWMAhQ2YzFT0YpnxTU9s3ZPxV8?=
 =?us-ascii?Q?y0ss8SLzC/Zo9/pVJq4I1jRz1ynfK+QdDnX3ETpYwIU6By67sE2uwICS5sje?=
 =?us-ascii?Q?sXQiV2k+0fsw4xpQlT7zkUE56CPR4vmE6x+mNdTogIaOng9RsiDD44u+AFR2?=
 =?us-ascii?Q?IOsmBYazQaAvl/vMNDFaRugugzHonm5e9mBK5/Av3ODowbtloubPreOcgFFK?=
 =?us-ascii?Q?ykDXqsQRq5OSMbODJipZ8TFrC+LANuzHC7y2KCPLPlYwkqrqmAF+oTD560mS?=
 =?us-ascii?Q?SSrEl4RcblCxxQ2bq9SIfpFfWm/2l0hbqYDwm6boK6ZUicqwQvnmcEvfgVtu?=
 =?us-ascii?Q?Vpa/W9UuQLBy7aoIXI++7adcCBOoWN4CSSL/IwYs5pmSBEhaly2NgMOKAJjR?=
 =?us-ascii?Q?IDq9W+JnJ2KxlsQjKzgK5viMiGSckyABPXQXpVgQBpMjNXT+LOgFQKhwWw7o?=
 =?us-ascii?Q?DR96TQH+O0Fx+tUk1Ym0cy0w+TzOp0zHRPrJACd0UqblbdTc5fDjavYiE2cB?=
 =?us-ascii?Q?XsZkDLJ/9WdxljhZ9IfLmKo3NePmR4Mnv4k/DCW/1gHINSn/N2Mn8ffzQFnK?=
 =?us-ascii?Q?C8f/Rr8k8DzPsYWx5+EFGVRDpL0a40VO6c5+i7YnQKWb5xV7kMfhy4ito0Up?=
 =?us-ascii?Q?klQq5EhoeKXx+ZkZaPYy5JyJ+iKQ9eaYRuFCQNc7QRABNd+anuoWV94wXuRP?=
 =?us-ascii?Q?upLSVxefJqT0zyFBnv+evhkBG+UDoVCGFazfgQue0uM5ywsGQHLn1Y7sEV9p?=
 =?us-ascii?Q?lQNGXOdE8gigni6BQ4D6vNE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce022a7-4ce3-4081-35d4-08d9ed538bbc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 11:42:13.3165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vkwlqLX/7ZjuVoNM+xBe1+6axgJR6X0FKI6jTzg5VR4hDSlIOUy7oek/u8o+gCqMR2NFs37SOIGnypzwHJyCLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3423

On 11.02.2022 12:19, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 11, 2022 at 11:50:46AM +0100, Jan Beulich wrote:
>> On 11.02.2022 11:47, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Feb 11, 2022 at 11:32:45AM +0100, Jan Beulich wrote:
>>>> On 11.02.2022 10:02, Roger Pau Monn=C3=A9 wrote:
>>>>> On Fri, Feb 11, 2022 at 08:23:27AM +0100, Norbert Manthey wrote:
>>>>>> When re-identifying CPU data, we might use uninitialized data when
>>>>>> checking for the cache line property to adapt the cache
>>>>>> alignment. The data that depends on this uninitialized read is
>>>>>> currently not forwarded.
>>>>>>
>>>>>> To avoid problems in the future, initialize the data cpuinfo
>>>>>> structure before re-identifying the CPU again.
>>>>>>
>>>>>> The trace to hit the uninitialized read reported by Coverity is:
>>>>>>
>>>>>> bool recheck_cpu_features(unsigned int cpu)
>>>>>> ...
>>>>>>     struct cpuinfo_x86 c;
>>>>>>     ...
>>>>>>     identify_cpu(&c);
>>>>>>
>>>>>> void identify_cpu(struct cpuinfo_x86 *c)
>>>>>> ...
>>>>>>     generic_identify(c)
>>>>>>
>>>>>> static void generic_identify(struct cpuinfo_x86 *c)
>>>>>> ...
>>>>>
>>>>> Would it be more appropriate for generic_identify to also set
>>>>> x86_cache_alignment like it's done in early_cpu_init?
>>>>>
>>>>> generic_identify already re-fetches a bunch of stuff that's also
>>>>> set by early_cpu_init for the BSP.
>>>>
>>>> This would be an option, but how sure are you that there isn't
>>>> (going to be) another field with similar properties? We better
>>>> wouldn't require _everything_ to be re-filled in generic_identify().
>>>
>>> So you think generic_identify should call into early_cpu_init, or even
>>> split the cpuinfo_x86 filling done in early_cpu_init into a non-init
>>> function that could be called by both generic_identify and
>>> early_cpu_init?
>>
>> No, I think it is quite fine for this to be a two-step process.
>=20
> But it's not a two step process for all CPUs. It's a two step process
> for the BSP, that will get it's cpuinfo filled by early_cpu_init
> first, and then by identify_cpu. OTHO APs will only get the
> information filled by identify_cpu.
>=20
> Maybe APs don't care about having x86_cache_alignment correctly set?

They do care, and the field also isn't left uninitialized. See
initialize_cpu_data(). Like in many other places we assume full
symmetry among processors here.

Jan


