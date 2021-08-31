Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9113FC85C
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 15:37:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175754.320068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3wh-0005Qn-7M; Tue, 31 Aug 2021 13:36:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175754.320068; Tue, 31 Aug 2021 13:36:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3wh-0005O2-3O; Tue, 31 Aug 2021 13:36:59 +0000
Received: by outflank-mailman (input) for mailman id 175754;
 Tue, 31 Aug 2021 13:36:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mL3wf-0005Nw-72
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 13:36:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81ea1a6c-0a60-11ec-ad3f-12813bfff9fa;
 Tue, 31 Aug 2021 13:36:56 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-wXKInLVbMgWC8ERZkVSN1A-1; Tue, 31 Aug 2021 15:36:54 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB7441.eurprd04.prod.outlook.com (2603:10a6:20b:1c4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Tue, 31 Aug
 2021 13:36:53 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 13:36:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P192CA0029.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Tue, 31 Aug 2021 13:36:53 +0000
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
X-Inumbo-ID: 81ea1a6c-0a60-11ec-ad3f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630417015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aO4UVlAR/M4YcZaeu8MNVB0ARjt/arruUKju+BatGoo=;
	b=CXkM9DUEyXxmx3ZG4SEMjZataUqcxjKOidA2mOyHvZ4/ZZqpdGDC/f6qlta501X4zm5zd9
	BcUQOpcvvS4sxWY8XGAFVNWzq8e3JlnRn8f8D1flfzBNldx7u806SJ/48gZ4+RsozQH5Mo
	noZonprxEZWHkc/e31LKmDBoUTgBOho=
X-MC-Unique: wXKInLVbMgWC8ERZkVSN1A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SA8opWEaqHuJhjhbQrOWqnOnC5PZxpS4D4xaWPSDoCnzzK9TbtlYs37UA51kU5ucWYdAUW8itjO9vX/bwi4cAG88ptvo8pdzWpn/IHyLe1ORrTukVDXdAJSf5gD2U07KFKZ7cMB/SXA0PVcJpSo6W/XD9A6S3j5QSQhGpspoLonj6cbOqPk7L95hnNhy8wZqLyOZEQoRrUGpE6w+9ujk8yq/68hA4dtIKtyuqkvFf13o1kImrDt+me1l81xJwKfBqbFFMzUJFHTRLHPWujjMQX9otKUB6UB/iPmaQbnU/wws4nijQe5dXGzmhESl2tWN1n5qM7vU1uIuM5HNWPOQYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=aO4UVlAR/M4YcZaeu8MNVB0ARjt/arruUKju+BatGoo=;
 b=GItI8JdXjoG0HQdybaJ5kIc17geEQPEnEHyKZ0QKLsV6RIjE8OJCQ8REhIOmGn1yRZD9fGUaFmHzwaxHuQRR37x0MbAfJLL+ySB5l1xRvrsYN/3XzxjCNvccU9DhQ0DH432LGlFBBFCYFYmAKybTGDcUIlWwWkmiown3FHnPWOfYJFeJmZ1PWbhivvfecw/GLwXXRQIqJNTGiK1TQ/X5a7kPeu5tIHPzB1khVenxSt4AlwYBYm9a5FUnaLYqbNvTvtboxnpIEbXp9Ck1hazRJhxcIlb9rcPUkp/IGEOdX0k6WBpAQgx2LUVCovFMBK4NZkrpsfHoGLUxs6Kp2mR1aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/4] x86/PVH: de-duplicate mappings for first Mb of Dom0
 memory
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <013c49f5-7a14-9d9e-4d25-75934bf6349f@suse.com>
 <9cfc122f-dc4e-9dc0-0b57-48abf941025a@citrix.com>
 <866a3677-1f1a-e0e5-7ab0-10c210e25610@suse.com>
 <2265ca67-2a30-a858-38ba-a6343782929e@suse.com>
 <2ef761cf-e609-e0df-e360-9e904f5ad9a2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a64e4a10-6792-2900-128c-ece7ba6d6919@suse.com>
Date: Tue, 31 Aug 2021 15:36:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <2ef761cf-e609-e0df-e360-9e904f5ad9a2@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P192CA0029.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::34) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9473b6e-d751-4c77-8da5-08d96c8464d4
X-MS-TrafficTypeDiagnostic: AM8PR04MB7441:
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB74414365532B2A695996C3D9B3CC9@AM8PR04MB7441.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HASMptVe2aFvl3jD2d6VRkjmtkle/LiBbvAKENNb1AjfwBiFJFDLWI9qLdQTUFme+8FW2yRia19au/QPVxVKFa9OEuCtInHO7oFKBJQtpYH/zclkZ6XeC3GrY1ITSNArrs2FnqPxvUBaJLu5Pr3HEbqCQbbIzr5CPm99aTiESIaXD3+JOgYVE3257+hIXQ0AxeXynyyKFuNNte5W9O7AFS6YBwg9Ei+eJtrVROabgAsf7T2kwBFMwq8CXpF2b50DzPLf+p9uZuk7zCfWeJXVdK/Trt343zI9MbqbkHK85uYLLmP3rmrbxd3Bj7xVEKMMUa5I9ru0Vxim94mi1djt7ahfYUwKbNNZhDZstakXf2VD/4672F6uAviMSvwM+TE1nIh2DkxYDJa3xJZK0ZMgOeimCusqTtpUvj69AWalBm/VEeopnlIveB0ZBJep380I2c9yPAXANl4MuUBkrmYIHnMpRkG6k4unQucUfzuKsDlVKidv4VbApcn8qyG9aN7ipFzMriHORQlk/gLqtDhUGIgG4e9U80TbcIXD5Q/clZ/ueND7ua1onM/7Lsi+CqGEF1neLcPUQWJjgOaVbkwvI2zBJVXAFIdQWeV2MaKc5o0h3mLFt2SJ5yjyVAEOlw8i6dcPASI2BPOO6WlNL3gjfUJaTJxepW6C9D1c2+pDEjmIGhPDB9CJk6vaJ/4lre1TO5Z5JXKzYSC1/m8K/8Aa+lcEDn+/wHVRL2xzUYhAxNM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(31696002)(8936002)(86362001)(8676002)(53546011)(38100700002)(6916009)(2616005)(956004)(508600001)(2906002)(316002)(16576012)(186003)(31686004)(26005)(66946007)(5660300002)(4326008)(66556008)(6486002)(66476007)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHpoTlFuM0IvUnRiMFRTQktMMWJuSGVHcHBIRjB5TUpjUGZOakI4b2RyOHpS?=
 =?utf-8?B?ZVY1VEtuak83R2w2N0JsV3gxdk5GdjJSTjEzYzYreEdnM1A1bnpNL1ozeFhU?=
 =?utf-8?B?T0RDUTVjZ0tmMkNJdEZya2VTTHlUUmZGYk0vYVhHT21sRVFZQk9Hak5oRDRU?=
 =?utf-8?B?L2I2a3BqMTdidjlIZ3N5VmRqOExlVlcyWkJxemxQUi9zQVQwY1FMbXQ5K01x?=
 =?utf-8?B?dFhOemtZK1JwV3lpN0doTGlmRjEvclZCWHF5d0p4Y2txaVk4azF3T29DRy90?=
 =?utf-8?B?V0NLR2x3SVVlUVB1cGM2Qjh0a1B2QS9hd29xc1VYT080TGxpT1lWN2RHU0VU?=
 =?utf-8?B?WlIxZVA5Y2VlejZnM1hYQW9kRVN0VW5sb2pqeXkwbGY3WnNoSUQrWmZ1UnpJ?=
 =?utf-8?B?RFZZalFTbFhpWEJFaDFlOTFqTFFlenVFQmRMcGdGVGhyUWlyODVOVGVhdXRH?=
 =?utf-8?B?T21VSDlnc01uYkZac2tBWEhraEw4WnhINCtibmpjOXNMRG9jQTJpS04xUGxB?=
 =?utf-8?B?VEhSMUlYNGZ2bGpFa1U0M2VNR0hzdWU2LytacjlxK1FYdzZSSnVnOVRzYkpW?=
 =?utf-8?B?M0hIWjNNbmNhRUgrcHA1S2JyeFZmZEMvOXJMRjNKbTNmeDAzVFRKcmR6SjEy?=
 =?utf-8?B?TlJLY3FCSVlhb25hM1A0RTU2Znc1aU16WDQrcGVSQVg2SjZJekE5M2JUWVJJ?=
 =?utf-8?B?K3A2YUFDemdrT3Q5Lys0bWVUcHJmWU53SW5QUEdPSjUzcDUxRkJTbzEwNjQr?=
 =?utf-8?B?UkFvZEp2ZWJWQmZ6cHlZaE9BMkdFd3lERzR6aWtJRlYvU3NnQ2puRHdPaWVj?=
 =?utf-8?B?bFkzWWM2ZHVJWVRFM09Sak1Ec1BqUzB0Qms0WGJmWXczYXA2aWRSRnNEcVlI?=
 =?utf-8?B?NU8xemZKampJRTFWak83a0hhNGNDVDF6bkxSKytEVk93SCtVQ25DTk1CWEVZ?=
 =?utf-8?B?QlpBTTBRVHZKWXdxNkxpeXA4WFdtS0tjVkdCWDAvUThoWWZ4VFJubFh2ZUV5?=
 =?utf-8?B?MmhaMTNjNGoxV1RiU09YSmVkd3JFSkJESEhRSGcvOFp5MjNaeTRzeWsvT29V?=
 =?utf-8?B?U3kvSENWK2UxVndsNlM2SVJGay9qaG03TkhLUmUvaGFZVkNNaCtwMmxpVVZH?=
 =?utf-8?B?ck1XRU5tV1poRkJ5bnQyeUFsN2cwa3N1bTYwRFBaei95czBEb1BxZysxUFBY?=
 =?utf-8?B?MU1rMFA0Tkd5UUhDNEt2TVB1TmJ3N3QxNlZucGpaQ0hudk5COVdOQTZuNVh2?=
 =?utf-8?B?SjVFdzhJaFgxY1ZEOUxxSzhMeVF0R0VqWS8wSHpKTm00aldPS3lPN0hqVVlE?=
 =?utf-8?B?RjE4QkYvME1LWDVydU5CMmIzTTYxaFp5SHhsTG9QcHc4RkUwcmZpWUEwQUkx?=
 =?utf-8?B?M2tqQU53SXVBUXRNT2FBUisxTjdsU2ttdEk2V0FzbXVscTlBZlRQV3NVRzh5?=
 =?utf-8?B?TTcvOFEwa2laUm9JQWdRTGkvZlVnNWh5eVJ6eFU4dmVHdmh0VDdaWVByUFdl?=
 =?utf-8?B?ZEZFZ2toUzVrWHkxeno1VWFwNWJtRUNwQVFFV1Via3BHM3pKSStMSEptWmtq?=
 =?utf-8?B?L2FkV2VUNFZKRGRnejBuWUp3b2daNWk3aW9pL24zVmlkNVNyZGNQOXFrc1Zj?=
 =?utf-8?B?VFBVZ0d6UHNhWDgraXQzOEx6aUtydlpXbkN5Wi8wSzR6c293TjFjTTZJaHIr?=
 =?utf-8?B?em5RWWZyRXhyL3NtUGZPMlBYUTVIZWhhTzU0V2RBTnV3eG1sYXJLbHdiREtO?=
 =?utf-8?Q?4JOVo3StYSKILcOPawYbNQIlooY5vRjKd9uWZ3d?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9473b6e-d751-4c77-8da5-08d96c8464d4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 13:36:53.3999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ab8aVX/M3cpx9xWfp3DE/dXqSpGE/uivQkL8G80QqxX9RhTHvYE+BF0jX6SyEWow/8swCdrhZh8iZrcs0ETDfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7441

On 31.08.2021 15:27, Andrew Cooper wrote:
> On 31/08/2021 14:19, Jan Beulich wrote:
>>>>> @@ -1095,6 +1101,17 @@ static int __init pvh_setup_acpi(struct
>>>>>          nr_pages = PFN_UP((d->arch.e820[i].addr & ~PAGE_MASK) +
>>>>>                            d->arch.e820[i].size);
>>>>>  
>>>>> +        /* Memory below 1MB has been dealt with by pvh_populate_p2m(). */
>>>>> +        if ( pfn < PFN_DOWN(MB(1)) )
>>>>> +        {
>>>>> +            if ( pfn + nr_pages <= PFN_DOWN(MB(1)) )
>>>>> +                continue;
>>>>> +
>>>>> +            /* This shouldn't happen, but is easy to deal with. */
>>>> I'm not sure this comment is helpful.
>>>>
>>>> Under PVH, there is nothing special about the 1M boundary, and we can
>>>> reasonably have something else here or crossing the boundary.
>>> As long as we have this special treatment of the low Mb, the boundary
>>> is meaningful imo. I'd see the comment go away when the handling in
>>> general gets streamlined.
>> I should have added: And as long as Dom0's E820 map gets cloned from
>> the host's, which will necessarily consider the 1Mb boundary special.
> 
> Not when you're booting virtualised in the first place.

You mean when Xen itself runs in PVH (not HVM) mode, and then in turn
has a PVH Dom0? And if the underlying Xen has not in turn cloned
the E820 from the host's? That's surely too exotic a case to warrant
removing this comment. If you insist, I can mention that case as a
possible exception.

Jan


