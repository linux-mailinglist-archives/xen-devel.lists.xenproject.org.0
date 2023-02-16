Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDB26998BD
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 16:24:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496642.767499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSg7I-0008W3-RF; Thu, 16 Feb 2023 15:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496642.767499; Thu, 16 Feb 2023 15:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSg7I-0008TW-Nt; Thu, 16 Feb 2023 15:24:12 +0000
Received: by outflank-mailman (input) for mailman id 496642;
 Thu, 16 Feb 2023 15:24:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSg7H-0008TO-CA
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 15:24:11 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f53c3fc8-ae0d-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 16:24:09 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8039.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 15:24:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 15:24:08 +0000
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
X-Inumbo-ID: f53c3fc8-ae0d-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeOK4/idlVLvpzCrC14Br1PDH2741/UqtTci3n4Ko0bUTRh1r8OetRZ8FjHRB1lMsusRMtmfALworsdCb0PQl+gwh/SmOEW9OdPhf97O57uruXUtvuTBmJSCw9HIlKWPQIRA/DYbwGLAk/PzEQ9qzMQXS5IxRqgOZ0cLkX7ce6gix1nWmGUrju0XTxx1qVxbAaEXZgYHOQSwI2mZe5tg7Wqy8Dr8VfIi15UeDNjEu4ia8svN5VEASrJFH0Lh4G/snp1jXbnZH5AwmYrvcTmF4pqsXNj5herEqb/I5x+148Fu/E9YIIzFiGBUfq1RBDjX/ZoJHKQVzkFy2O0jp5OGHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0qGdofkEYviOrkdZJUD/InP9VYRxbIlSPYOpuigEHo=;
 b=ip9h0/DxuyGJES9uWtTzcrlYlr4m/pj9oFI7JAeGVO6pgiJSv2tc6nsKkBtq/Uii8uhmG58hHf76qbUMlw1AzVVM0zYkSIbhrJYwPpz0LwpC4s8ppFfHxZwwV7ee7GTXPZbLeysKldhpYzLQsuHfuwlD+SLz2HoFyFdsoa2mtwQUVpBQmNac4fSd0f4GOFdKyETJ9/H94muvbe4L11dbF3lO7u42wvyfdwYDIfqJkjk8bybgMe9BHO3nbgt6ugT1XSRfmgfeD8Gzu2wzfVNlxObhdYsoSEBpcM6DBAA9rhQk2RptuhcHPCFqc8X+9vsHIvmAeSETaaVu2uX7qg11EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0qGdofkEYviOrkdZJUD/InP9VYRxbIlSPYOpuigEHo=;
 b=Bb8DSXHVzAF+AawW+xGDEwpzQZyrshbT+fd1KYJUjmF6JWHLGM55m4kACPUz0763XNSNHISa82P6GZBHpBXBy0o4pgnGD/E0mh0MUUtW2FdU9O/PXhDz6qKDrNLR1g5xeOgP5IysDU3X1jW70aVwSPWtNeYDd+nMjF0P25E/YqdmBBlsS/oF4krlZKF2GLJrbRURrIb2MVmjLQ5vboKONNde2BnT7HYAJDg2oHiRQatlckZBVCGgWWKLFKAEsDAyfPD6d3DDTVHRnEh0FhLKhVImfcXDqWPK9GdlmzHq+WmwylNkoXwIUnossYuLg+E3M60NmjR4qHK2k+EqWpypUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7db3740b-c483-c400-2800-2af85e697de6@suse.com>
Date: Thu, 16 Feb 2023 16:24:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/2] x86: Perform mem_sharing teardown before paging
 teardown
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <3af8dbf3134b48f6bbc8f917e5fecaf8daee1c3d.1676351034.git.tamas@tklengyel.com>
 <e9e26bfe-3b17-bc35-9d93-ac291ab6b710@suse.com>
 <CABfawhmYjCmOjiLkvMB7DQz0eWVSm7vdy5HRCGxzNmg0nr13SQ@mail.gmail.com>
 <25bc4c74-f36e-2969-2b7c-c5acd115ebaf@suse.com>
 <CABfawh=y+K1GXOfKLJ6HbSxrVXPSd9GJWxpy4dusEWxh2PxeoQ@mail.gmail.com>
 <000badbf-cd94-76b6-1f60-faa720a5407f@suse.com>
 <CABfawhkyomrcKDgcMTvpfyTQVYX9zEo4SUBC4m99RXX=ZcBE5g@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhkyomrcKDgcMTvpfyTQVYX9zEo4SUBC4m99RXX=ZcBE5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c20e5ae-d444-41ce-fa5f-08db1031d8a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oHIQppzlPe0Y6zbLd0aMxUmF2CcYgWiLHad8fJxqZEIBmfr3JsbLF3givRiLh+rL37pqn0XfphEsF/IdM9waPODp8mWl9OQEv1pEEnEdWesvOlZ/ra9RgAmKbh9w21YLrKLD5xR4/SQkjdCzYM7b/5zXtEaD1s8unf4BOXgRQore9dOsq2uK6/vwN/Ibr1DtGLPobN4Ma4IzuoLGIi1j/DRcZie446WmS28aYwvhBtbjnagHM/hYKmU1khUWsrpQ/tToPtO2W4uN4+7UvclTe4SI2g4JylihQljCn6frn4Yfd2bdfteCUz5A5n78ZR7ptS6HBfUTxlpUXjX/tk0R3ZpmxfkLRijyY+mcsXMso74Tt5eX2JcNcWRBAS/85qxa1xJbNOGdE5KZwQycbRVPnFaxiyOoYeaVUQjDCJllRCekIqbJQIjOOzBl4hwWv0Wgw63xy/nrrE0W0yCZ82RPNFrNATxLSmMTFOtyPDF9e5rmYABVBTwrQ/C+I1lTT/MZ1T3akaNC1GPVmLaCrRX6E/XMuwNgEJDkmFojW6yVXs4b37+eNanj55QonNpLn5mXgCKKc5dB/SOHiJe+b1Lr0roZD4uFXcG4vkABVkbbDAE1DD1Hw3G70XcHBZauTmJTkpql3B4aOEEjYlXaUTVamEH+gRVtAdTIb7Mg0AUVP/Pcv3clTdIUDeOHYLbVRvRMDUJ74am+0mAZtPRwTT6P0CWrgJaoGFaqM2MdWkAyar4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(396003)(136003)(376002)(39860400002)(451199018)(5660300002)(86362001)(2616005)(6666004)(66476007)(36756003)(6916009)(66556008)(478600001)(54906003)(316002)(4326008)(6486002)(66946007)(8936002)(26005)(31696002)(6512007)(8676002)(41300700001)(53546011)(6506007)(186003)(38100700002)(2906002)(31686004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkQyQ3VHelJBWUtZRjZvZ2Q5UW5CZmVQOWFaN3dQK2FJSVpVUU5Tck1GcEc0?=
 =?utf-8?B?L1l1LzYraHpMN1VIckNlQnVxeWMyTkhmM0xOSlhmY0tYVW5tRzB0N1BHYSs3?=
 =?utf-8?B?Tld5V24xNXpDc0lqb0t0OFFMZVFSWWRTZ2R5dFRzM2t5ZEFZdmlqSloxTitM?=
 =?utf-8?B?MTdPQUZxVmlrMFdRQU16Zi9ZSGZZLzVEcy9Pc3J4OVprSW1FQ2t3UUl0WjVR?=
 =?utf-8?B?Vm0rbktVQmZUV1V0bFZtdG03ZEdTaEF2MzRna1FFak5nSjFJeHYzRGJySkgz?=
 =?utf-8?B?MTYvRkVZeDA1ckZNRnd1eDVQb2lVZzgvVXVQNFN2NGtOeis2UEQ3KzJNdWRW?=
 =?utf-8?B?STMvWXJPeTdTdkVwMWprUmF4dFpuaUtuL2JxSWY5b21TZHoyY0xHelExV1cy?=
 =?utf-8?B?SUVLRm15dTNwSG1scUlsQzMyMXY5anV3aTNRSkVwUVBsY1pXRDcycmJxWExC?=
 =?utf-8?B?aE1JTXk0SzVWN1owKzJqWUZydnpGZ0hZYzE5c0xLZE1KYWZndWdLR3FaZUVD?=
 =?utf-8?B?blZnQlRPRHBHYTZXT1hVK1Vxd21ZdXJPK0FkRXhxdmRmVnpiR2hPd0pzU2l5?=
 =?utf-8?B?ZngzOHdwaVpUZlBhNGhUWTVLcXY0d29qMHVwY3VuN0V6clV6S1VocjZrS0Z0?=
 =?utf-8?B?QmZLSk1wdUxnRnY0V0ZtbXYzUzNQMUtSSTJoZnBvb0F5RlRQZEhVdGpKVk1o?=
 =?utf-8?B?dzVLL3JpNW40d0VrTFY1SS9Ld2dEZTJ0Nnh2c0l2U2tzSDZ0cXZMZkk4SXZn?=
 =?utf-8?B?Ri9VUzV0TkZNNzM3OThsZjBSRjJNVGx1YkpIZmFRbmdDakt0K29RVlBpL05R?=
 =?utf-8?B?RkhERmRYSjZRMFh6N1ZEb0RRZVc2Vkhlbm5YQS9TazNsSU1WaUN0dTZURG5z?=
 =?utf-8?B?WjhGeWdzUEtzZVZoS21RWDVvZFhqN2Y2VXdFN3Vtelo0U2NvMkxsNDdDN282?=
 =?utf-8?B?SUtNMjloQVNHV1hGaFgwS0tTeTNrZkViOHllT1RjNUVlV0UvSzdTYkdxVExQ?=
 =?utf-8?B?VDI1TU42dXNCNUZIZ1JxbFI1S1dxYitwaUdXVy9laFlMUVF0S0I0RHdZRE54?=
 =?utf-8?B?U1JhN2NWenVEc1F0d0lGS0ZoL3lBYUVFdEpxY2JHQytZOEQvaVdCZzFYTFRp?=
 =?utf-8?B?Q0UvVE9DVW82ZGR2dXJIQmZzREt0YnFSaG5raWpwVGJVMTVhRlB3dXlaK2Nk?=
 =?utf-8?B?N2hrR0lQV1B2WS83dy90elJxT2F1VHE5d2RlRnF1M1dYRDBMZWdIdkZiQ3F4?=
 =?utf-8?B?d1M5SWRzdHoxSXg4bVMyMHZjaDBUaUFrbUs4Z29IeVU2SDMydWg3WDRXV1k3?=
 =?utf-8?B?SFUwdW9PQ1pybDBpaGlZOUsyMDRqUEFteUxoYkJqd1ZHbmdqWGpOcVh3clFy?=
 =?utf-8?B?S0ZBM1k0UzVzMjNjN2VVS1RrVm5rQUY1S3VyQzFYSytZRjFGd3drb1F3aFlo?=
 =?utf-8?B?ZDRSNHVhU2xiNTVJL3lGcC84ak9nKzA1amxwUVJMVVZJZUZxaVJSQjBsVWtj?=
 =?utf-8?B?cHNXaTlaYXFEczRKU29HbUNRK0d1MmtBTUNyR1ZVWmxaV0VEL0t2aTBETHhM?=
 =?utf-8?B?RE1DbHBOUUhhSnY2TkNpSnlOQ2E2aXhNRWNHTGs3ZDAwdXZRTDJFRS9QQlVt?=
 =?utf-8?B?RVgwNkNiQ1ZBS3hHVm1EUU45QWhLeGo3TWViUU5vd09RV081eWdZWSt1aGZr?=
 =?utf-8?B?N1o2T0ZvQWcvYmhQTjN1ZkU4empmd2xNT1Fic3NmSC9oeXNXeTZ6OWw3WFVu?=
 =?utf-8?B?T1J4ZysxUElENXg4MEJhWXI0bUtob1BUejJFV2R5WTQxUFVBaUx0bm5hOTZO?=
 =?utf-8?B?WkROSFluSkg0em0wWnAwbXhJMzZGY1IyTW9oRUJIRmVxVk8vRk1aNlJ1YnFm?=
 =?utf-8?B?dWFNOVk5c0JyTXdNWjhwZUF5cy94dlJCMkMxR000a2s2NVQwLzdQMVJoa3FV?=
 =?utf-8?B?NlFxd0hRQjZUbWw0K0FnUU9tZ0d4cm1jaUhpNUV2ZWdDdTVubGhnd25BY2xV?=
 =?utf-8?B?RytlbW1SVHpuQ3NRRXdXVDEyS3VtdXh0bkJSQUJlNEZaS0UxNlBLaGYxL2h2?=
 =?utf-8?B?SjUxcTlmOTF1Mk5WKzltdzZndy9oc29wU05mUWhBcFdJVjZrVk1jUXpUSE83?=
 =?utf-8?Q?A03+lSDhLzBAq7kr9b7x8XLa9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c20e5ae-d444-41ce-fa5f-08db1031d8a9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 15:24:07.8767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xz8Xc8cogkt3ajUKdkIm+hS/syvVQKOe2ssJvokPcHyl4OWRdvGws/EoBr5t8BNAhZutfDunLuo3dNInN1gISQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8039

On 16.02.2023 16:10, Tamas K Lengyel wrote:
> On Thu, Feb 16, 2023 at 9:27 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 16.02.2023 13:22, Tamas K Lengyel wrote:
>>> On Thu, Feb 16, 2023 at 3:31 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 15.02.2023 17:29, Tamas K Lengyel wrote:
>>>>> On Wed, Feb 15, 2023 at 5:27 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> Did you consider the alternative of adjusting the ASSERT() in
> question
>>>>>> instead? It could reasonably become
>>>>>>
>>>>>> #ifdef CONFIG_MEM_SHARING
>>>>>>     ASSERT(!p2m_is_hostp2m(p2m) || !remove_root ||
>>>>> !atomic_read(&d->shr_pages));
>>>>>> #endif
>>>>>>
>>>>>> now, I think. That would be less intrusive a change (helpful for
>>>>>> backporting), but there may be other (so far unnamed) benefits of
>>> pulling
>>>>>> ahead the shared memory teardown.
>>>>>
>>>>> I have a hard time understanding this proposed ASSERT.
>>>>
>>>> It accounts for the various ways p2m_teardown() can (now) be called,
>>>> limiting the actual check for no remaining shared pages to the last
>>>> of all these invocations (on the host p2m with remove_root=true).
>>>>
>>>> Maybe
>>>>
>>>>     /* Limit the check to the final invocation. */
>>>>     if ( p2m_is_hostp2m(p2m) && remove_root )
>>>>         ASSERT(!atomic_read(&d->shr_pages));
>>>>
>>>> would make this easier to follow? Another option might be to move
>>>> the assertion to paging_final_teardown(), ahead of that specific call
>>>> to p2m_teardown().
>>>
>>> AFAICT d->shr_pages would still be more then 0 when this is called
> before
>>> sharing is torn down so the rearrangement is necessary even if we do
> this
>>> assert only on the final invocation. I did a printk in place of this
> assert
>>> without the rearrangement and afaict it was always != 0.
>>
>> Was your printk() in an if() as above? paging_final_teardown() runs really
>> late during cleanup (when we're about to free struct domain), so I would
>> be somewhat concerned if by that time the count was still non-zero.
> 
> Just replaced the assert with a printk. Without calling relinquish shared
> pages I don't find it odd that the count is non-zero, it only gets
> decremented when you do call relinquish. Once the order is corrected it is
> zero.

I may be getting you wrong, but it feels like you're still talking about
early invocations of p2m_teardown() (from underneath domain_kill()) when
I'm talking about the final one. No matter what ordering inside
domain_relinquish_resources() (called from domain_kill()), the freeing
will have happened by the time that process completes. Which is before
the (typically last) last domain ref would be put (near the end of
domain_kill()), and hence before the domain freeing process might be
invoked (which is where paging_final_teardown() gets involved; see
{,arch_}domain_destroy()).

Jan

