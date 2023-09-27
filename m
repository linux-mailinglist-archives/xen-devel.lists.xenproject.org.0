Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DC27B0843
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 17:29:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609109.947980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlWTl-0007fB-G3; Wed, 27 Sep 2023 15:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609109.947980; Wed, 27 Sep 2023 15:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlWTl-0007cx-DS; Wed, 27 Sep 2023 15:29:33 +0000
Received: by outflank-mailman (input) for mailman id 609109;
 Wed, 27 Sep 2023 15:29:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlWTj-0007cr-O9
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 15:29:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6dbce9e-5d4a-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 17:29:30 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB9219.eurprd04.prod.outlook.com (2603:10a6:102:222::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 15:29:28 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 15:29:28 +0000
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
X-Inumbo-ID: a6dbce9e-5d4a-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EagsTpodPH0F3Mlk+HpSoKNd2KNHF7p8yk9EXXw+d6i0svvG8qsAE/gjFPV1p/nBNcs1qpcmn100cZcUGMF4mdEuVqc19TjBylhmNEQP2jcepY/C8aFVx45TlMPkOTTWA1MYApaWsqdGPooUjIPgde2aAR3MceV6F3vtUVTEL6zxAI9YHQ6VFQDGGbBarm3G3yKywwv+SNgpjLciZJRGOaJVvoLV2+L3HreWUtleLvVvNE3a44Tl6KhCeqeAZECh/7Enr0gAgx3svE6mZBGtkli7TQF3bAOCUx1i29esRF3YvrwaV8DbT2tUZMR/pNmsRsU2AI4CRd9YWVq1c7LaQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fE17IRb2bZSAHcW8CQfpBVm8HAfBvc4YS6fVJ++ivY=;
 b=K0Npc6LZZ6zdAYpHcT0DzR6J3EHFq5MXahVS72+ndM1slhrVcb4voteidTbQKXp47K+4hKEL/UYB9dNciQAe6A+B5hxyr4Ol3xQ3X7plaiBvdrtopolfEEyY7KBQIMSC5lCTRX1xQzTPiewY2Zvnu7+v0iJVQoULJthMakhOrrC4V1H9gYK10iaTVeb7lPHAJw98AhIKD00qwBMRV6jdKwSbULApKT5degCisZcT7po4HKhAHRyOZ2WU+YNn1hvUNkeHg/QSlE15P2wDg4gZIKffB4UGChdzr78j9vZG+3PslPNrd6x+sL9o35jhY6JXBqb5ExIO2VRXJc1SSWXhgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fE17IRb2bZSAHcW8CQfpBVm8HAfBvc4YS6fVJ++ivY=;
 b=tMlhW6oBPMOwEWe/EGkHMnJSSGI2pEbsULhAsvfHXXOE4843C/9lfbMFlSX+DX2m5aijCX/hQoQvjU8jLhi1quphASdLcnX5jNZWXD1aIXxBgang/ifrnMx2HgnLOU0/4aKvJPcX6ueO0vj4RXu/sUT3cu/ZVCrTmgauQUZwlD3ZEtodo6BBSvBe35dhEzWSUrw3xO7swQCMSAa1crj7Ll5yD/+GLp+jQa2ZtC+M8jRGWYSybpIvPf6sp1qVfCFt3hJ5/66mi0Sy+x1ehK9hIPVrxc/mQQUdwqnLZjbH7wjTwPnBTikbfei/XrN8fNEAB042do0ojyAjJyEXXCr1pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2b1703d3-9f22-b54f-5161-884c5931e692@suse.com>
Date: Wed, 27 Sep 2023 17:29:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 5/8] domain: map/unmap GADDR based shared guest areas
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <140e906f-07c4-ae40-1d37-ae9966709289@suse.com>
 <ZRRB8ug8mNyvVsnK@MacBookPdeRoger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZRRB8ug8mNyvVsnK@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB9219:EE_
X-MS-Office365-Filtering-Correlation-Id: b8082ada-fd3d-4040-40e1-08dbbf6e89cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+lpxn5QwPMCGINhilAh/siR6DfPNX59CI98ST0gcD15RMbNKtXSfG7KlLGjSoF30+ve7KTRSNHc+Rys2Sds+vmDgaz8jq4uiROnjTbXa6KIcGCyiBnznt/rG8mwZ5PyeIraF6K1+u/uxyaoEZcuWoxD8ZXmdbwkY+Tt91v6Yb0B8O3G8zCS9OP9Cx/vAjFiNmWzIgv3Js0WqsxYHTwbbBsHVF5HEiK8x5uE4qabhT6fLHCTRp13ZvqHqLuEuEm3AJPrSpFPswH6nWGcyqpxlHLgnKctfPm4z9fffKq9ChAckS/KpRH16ZIHXqP0u34SNrumlTzlYiytI5vNdhxOxuQZk38HdYubkOmWrnQ84ih2ZUNE+qH8j+grtIGElj5DhliqfnUvyaSv1JaJ73Lg6Jm+SN2TXEUPsBTorZrR4mvKnpSxm5eKpgj3chk/E5fxQHX2kSmgYjQTCBRgilMt0ALp7R+wARR174jnbeysVOGOZq0XCg0brMjx2Ll3oT1M818QyPQ/lrJwssh2x2DXFVc89EjcTA8uMsit6xTart+djcA2daEu0niJ0ydEFYen5vp86E10gCOttijpMqPVRLnLBlELTY3K7WPFE9lFmaqc/y1lGBGvaMsHYEQ+0d9evc4mh05MDzLe6hN/Cado1Jg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(186009)(1800799009)(451199024)(6512007)(53546011)(6506007)(31696002)(86362001)(38100700002)(36756003)(6486002)(83380400001)(2616005)(26005)(2906002)(316002)(41300700001)(66476007)(54906003)(66946007)(6916009)(31686004)(4326008)(8936002)(478600001)(8676002)(5660300002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkRCdU43Ung3aitwVmg4emJvZjUvVDM4ZVBqaWJiMXkweldRQTRmOUJhclpv?=
 =?utf-8?B?alo1c2U2Uk5NSnkyUURFeUtqMG1GQkFvVm5XellUa2RydjljNW1QemlsZ1Rz?=
 =?utf-8?B?ajN4V0RKRWp0NlloTEI5RFo4Sm5Id2hIRDJNbkRUY1pmbFlsZkFTS2svZ2hi?=
 =?utf-8?B?R1dVempYUGsyYkpZSUlxL0N4QnNlV3hhNE4vR2FocDMyKzRBUGFPVzhObCtt?=
 =?utf-8?B?SGxHQVlYTTF5cFBvbHdxVzdrQmdPVjRiSHgvOEE0VmtCcXExTGZlRGZmbGpP?=
 =?utf-8?B?UGZhUHRNTVRqeHRlMXFUN2pBcU5QbG9uV0lWTG1NWTdTOS9NSkdZVVorM0t5?=
 =?utf-8?B?UThaUENNNUp5Q1VkK3dzekprTWVYeGQ3dVcvVFdOYktYN0wzZEhJaGJFeWJ6?=
 =?utf-8?B?aGFKRWh4anVZWWZRU2txaENFWTBtYnpTQ2hBTGwxM0UwNDFxZjFtTjhzd3I2?=
 =?utf-8?B?K3hURzJES3RublMyOThRMklML3I3Wk84cGRJUWw4a2JmMWZrUTRRYVBuOTl1?=
 =?utf-8?B?TjZQcHQ1cEcvR3lpUnJuTHlGaW9CT1VDYldxZ1UwTUcwRGJTb2t1UUJkcExv?=
 =?utf-8?B?S29wNWltSUh1NFZpSkQxZmxQcEVFbUVsMzJCbU9LV2ppSmNTNVJNbER0dHRW?=
 =?utf-8?B?RTYrTmUvbW50MU82TG53M1JZS0ZtdHFwemdaZ2VTTTZIOHk2MFVlUHNjTlBR?=
 =?utf-8?B?YmpGQTMyditKNjhKbWo5YjI1S0F5ZTZuaG9JV29KeEhJODZPUGdONzQwTlp1?=
 =?utf-8?B?VHZMUXZTTWJWRFlOUk1iUGRVQzZQaWVFdFU4bk0ycGIvY0FMSGJDNDA5QlNY?=
 =?utf-8?B?d21ja2NCdUxQdDY5UnB2UUxSb0o5ZGM2eUFQR3BGeVFoVmcwbVlMVGRSWTh4?=
 =?utf-8?B?WHg2dDlmWEgxcWxWOGtMZ2FtdnlpMkFOV0NCRSthRVVrVXlwNE5ETkhVMXNL?=
 =?utf-8?B?RC9hT0FNbCt6U1FWY3VxUFR2azFsc1YxVk90U2h6aXQzWnppSXl2SXZDejV4?=
 =?utf-8?B?R01vZVFOcXVUYWY2T1BRS3ozRWpBS1liWlpSQVJFdk0xblEzRnYxRUQ1RnpL?=
 =?utf-8?B?QjZ0a3I2bjFRNzc3YllZU2NzZ28wVDhvQ3Q2ekRYM0pHa1dackNCUURqNWVk?=
 =?utf-8?B?Ky9uZllpa0pKMTRSUCtWdHg5bVozeWN0NEVmQkNSSVM1UEhZc2ZHR3duMmd5?=
 =?utf-8?B?UCtqczBkTWwwSTFydUtQY01nTVBHeDlYSjQvenNsR2NhVGNwWW9FU3d2aTBV?=
 =?utf-8?B?NHUwOEs5THdQSndLU2YxZjJOUDRyQlIxeTBNVjZrMGQ4djlNL2orUXBxV1dn?=
 =?utf-8?B?Q1ViZ25iaUlWUnZhUHB0SG4xWmdmMnJJc055eEN0M1Fsd040RjJtQW1RQnFr?=
 =?utf-8?B?YXJHU2EyK0VUNGVLdG5HNmxxd0pVR05CeTlyRFFad3ovcFJlY3IwVzIyaGJB?=
 =?utf-8?B?cmE2SmVkS2FzSTZvOE1vcEZHOW1jWmVKQzZLOVcwZ3VEWml1RGx4MnhZYXQ3?=
 =?utf-8?B?MC9XN0Irdit2K3hnUDZLQTJxNUdzcys2YWszQmZMMXRsTFhDTFU1Um9zRTdk?=
 =?utf-8?B?dUFsVE5jRlFaTC9NNXk0L1lMY1VWOGJOOEY0Ly93RTFlckFjWkwxN1FHNFdr?=
 =?utf-8?B?Ylh5NUdTOUpPQUlxME5SRUE3WkJ5L1RPNHB5VUw0NnY1RWdHZXBpSHFFcktq?=
 =?utf-8?B?dXpqRDJra2s4b2pKTWZFdlZZRmVlSHVHY1lmakZRdWp6ZjZQTzdvUC9ZcFhv?=
 =?utf-8?B?eTlYYlEvVFVLcXRYR0VYdjB3UzJ5ZnpURldzcVNEMUM2QWRJaGVpdUk1ZWZV?=
 =?utf-8?B?TWhBTzZ2Sm9Lc1RINnFZb3lZYko4WnN0bi9vMElmblJyckVSazFJZ0x2WlFl?=
 =?utf-8?B?K3o3alozTit1TG42OWlpdTNCc3BFdmRObTJKTTFDeGVPY09Td3Z6d0FDWE9j?=
 =?utf-8?B?eVBjK2pLS3V0S2l5aFc1MEFqcnhMSzIyNGVadU9CVEYwVEJ2cGY2dDdIZnk3?=
 =?utf-8?B?UGtZWHJyMklsYWhrZE8vald2aW5aMjBFNHQxeVZ4VnIzWHM4S3crT3FJdmZo?=
 =?utf-8?B?VCtzcFc1aENHN3k5ZzlWOVcwSnBPUmhjVXplUXZWRWVqVExYWFZWR09uWWRp?=
 =?utf-8?Q?rnxR7VWZoV6wI4FOKuOUegY9F?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8082ada-fd3d-4040-40e1-08dbbf6e89cb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 15:29:28.3201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdkMw5I7T7rhGk+SQtLidZGnIvDLnEyPh+vh8UQYVxNNfNkNrX2QsjikxEf/ZetQDBa3jnBHQ+Ko5WZbD1TLhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9219

On 27.09.2023 16:53, Roger Pau Monné wrote:
> On Wed, May 03, 2023 at 05:57:09PM +0200, Jan Beulich wrote:
>> RFC: In map_guest_area() I'm not checking the P2M type, instead - just
>>      like map_vcpu_info() - solely relying on the type ref acquisition.
>>      Checking for p2m_ram_rw alone would be wrong, as at least
>>      p2m_ram_logdirty ought to also be okay to use here (and in similar
>>      cases, e.g. in Argo's find_ring_mfn()). p2m_is_pageable() could be
>>      used here (like altp2m_vcpu_enable_ve() does) as well as in
>>      map_vcpu_info(), yet then again the P2M type is stale by the time
>>      it is being looked at anyway without the P2M lock held.
> 
> check_get_page_from_gfn() already does some type checks on the page.

But that's still of no help without holding the p2m lock for long enough.
Also the checks there all are to fail the call, whereas the remark above
talks about distinguishing when to permit and when to fail the request
here.

>> ---
>> v2: currd -> d, to cover mem-sharing's copy_guest_area(). Re-base over
>>     change(s) earlier in the series. Use ~0 as "unmap" request indicator.
>>
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -1576,7 +1576,82 @@ int map_guest_area(struct vcpu *v, paddr
>>                     struct guest_area *area,
>>                     void (*populate)(void *dst, struct vcpu *v))
>>  {
>> -    return -EOPNOTSUPP;
>> +    struct domain *d = v->domain;
>> +    void *map = NULL;
>> +    struct page_info *pg = NULL;
>> +    int rc = 0;
> 
> Should you check/assert that size != 0?

Not really, no, the more that this is an internal interface, and we
don't (and shouldn't) check similar aspects elsewhere. There's just
a single use of the value (see below).

>> +    if ( ~gaddr )
> 
> I guess I will find in future patches, but why this special handling
> for ~0 address?

Future patches aren't very likely to make this explicit. The most
explicit indicator for now was the revision log entry for v2.

> Might be worth to add a comment here, or in the patch description.
> Otherwise I would expect that when passed a ~0 address the first check
> for page boundary crossing to fail.

I've added "/* Map (i.e. not just unmap)? */" on the same line.

>> +    {
>> +        unsigned long gfn = PFN_DOWN(gaddr);
>> +        unsigned int align;
>> +        p2m_type_t p2mt;
>> +
>> +        if ( gfn != PFN_DOWN(gaddr + size - 1) )
>> +            return -ENXIO;

This is the only use of size. If size is 0 and gaddr is on a page boundary,
the call will fail. For any other gaddr nothing bad will happen (afaict).

>> +#ifdef CONFIG_COMPAT
>> +        if ( has_32bit_shinfo(d) )
>> +            align = alignof(compat_ulong_t);
>> +        else
>> +#endif
>> +            align = alignof(xen_ulong_t);
>> +        if ( gaddr & (align - 1) )
> 
> IS_ALIGNED() might be clearer.

Can switch, sure.

>> +            return -ENXIO;
>> +
>> +        rc = check_get_page_from_gfn(d, _gfn(gfn), false, &p2mt, &pg);
>> +        if ( rc )
>> +            return rc;
>> +
>> +        if ( !get_page_type(pg, PGT_writable_page) )
>> +        {
>> +            put_page(pg);
>> +            return -EACCES;
>> +        }
>> +
>> +        map = __map_domain_page_global(pg);
>> +        if ( !map )
>> +        {
>> +            put_page_and_type(pg);
>> +            return -ENOMEM;
>> +        }
>> +        map += PAGE_OFFSET(gaddr);
>> +    }
>> +
>> +    if ( v != current )
>> +    {
>> +        if ( !spin_trylock(&d->hypercall_deadlock_mutex) )
>> +        {
>> +            rc = -ERESTART;
>> +            goto unmap;
>> +        }
>> +
>> +        vcpu_pause(v);
>> +
>> +        spin_unlock(&d->hypercall_deadlock_mutex);
>> +    }
>> +
>> +    domain_lock(d);
>> +
>> +    if ( map )
>> +        populate(map, v);
> 
> The call to map_guest_area() in copy_guest_area() does pass NULL as
> the populate parameter, hence this will crash?
> 
> Should you either assert that populate != NULL or change the if
> condition to be map && populate?

Oh, yes - the latter.

>> @@ -1587,9 +1662,24 @@ int map_guest_area(struct vcpu *v, paddr
>>  void unmap_guest_area(struct vcpu *v, struct guest_area *area)
>>  {
>>      struct domain *d = v->domain;
>> +    void *map;
>> +    struct page_info *pg;
>>  
>>      if ( v != current )
>>          ASSERT(atomic_read(&v->pause_count) | atomic_read(&d->pause_count));
>> +
>> +    domain_lock(d);
>> +    map = area->map;
>> +    area->map = NULL;
>> +    pg = area->pg;
>> +    area->pg = NULL;
> 
> FWIW you could also use SWAP() here by initializing both map and pg to
> NULL (I know it uses one extra local variable).

When truly exchanging two values (like further up), I'm fine with using
SWAP() (and as you saw I do use it), but here I think it would be more
heavy than wanted/needed.

Jan

