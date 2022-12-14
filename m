Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A89964C7FD
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 12:30:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462124.720299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Pxc-0005GA-VC; Wed, 14 Dec 2022 11:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462124.720299; Wed, 14 Dec 2022 11:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Pxc-0005CQ-Rg; Wed, 14 Dec 2022 11:30:04 +0000
Received: by outflank-mailman (input) for mailman id 462124;
 Wed, 14 Dec 2022 11:30:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5Pxc-00051p-1N
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 11:30:04 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2040.outbound.protection.outlook.com [40.107.13.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a66ceb88-7ba2-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 12:30:02 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8314.eurprd04.prod.outlook.com (2603:10a6:10:249::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Wed, 14 Dec
 2022 11:30:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 11:30:01 +0000
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
X-Inumbo-ID: a66ceb88-7ba2-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVXWStHhhW+kL07F+fHInyjWhQ2yyRirtQwEoeeP1AOlUGKR/UJ55H1aLngs+JP8R1OoLHrIfDlIfcPCD6JNTC9+k9StbxqigYWYxH681OtvYA6QmZdbAtSdWWK2JPfiq9aVJwAqP5k9vNnBBrNwpEerqrri1s5hfBhGY/9vnQ8dqx5Up8g//+g2XJyyOJ15FvYHnz6OJQn1v08bvvGZME7sQyjJ0GGkYBGYrosohr3ovT2eg3bX+Ow71bvQduYv/Rwo7sTTlzEl90pPsFdOhKaH9e0xmb3Uo6pkfmzCnm9I3qzKM2/+o5iG1OlD4GxAFPM6uVb3ilDwR9ihuhRyAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIzrLopL3QSHlFN1s/F+V7MIbNyR4QYzULjovpeNT3w=;
 b=bgU6GNCWVeUU3SAUBVGiOkhNkZFfz6W4au3nEjHZakVlqCA/vrW4FYt0CVTwpH27aLKQcyNqOrllaxXKiqsKDDnSuSUztKaBetGvWZ72kLPA2iWVAv3mwDOpNTqInKFglbBVtl+Cy3qyyS8cF6O8gaBUXh3deAAlnGM0e3FIrkYcl/48fxLnIWpSJjvSaOJhs+BlLcibpZVeBnr/69chBKs0xgNfvxW3AktLyI90Ugm9iSMAU/LISjqYC/AQwSA0A2qwet92dLBtlUBTPCF3ygk1BUAdeD3HDrtJp6r6GJWNRBZc7tvJLd3Hauian3rIrFiWOEb7+OXiHRp3+a3cKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIzrLopL3QSHlFN1s/F+V7MIbNyR4QYzULjovpeNT3w=;
 b=E1RAvAh7LDBJ4RWD6n+tAQd6sLtlZTEHIKm/8pQF7THxfLMyc0XpOYgz4STl5VAS79ck6X2MbkjDgWvV8rjfrF8PTJgswXD0wjyAUkWE8AZuOyNTFAQR9RaZVJHzsr2PMZXpqyDEFRa6MnqC4624AyYGVKFOj4HSz1gRA+b9TiGIyTcTBHsCyYN7x4+yOmlHI/45mYP4z9fa719wZEc420CCO8Tf/LFJ5hRpaC1ZlgmzQKtAl10XzzPnGq2XfgqzcMVrFopgYcy9x2K9+wfEIGHwqTp6Fe8Rdi+c6R3ZFQ4odUJxMTgldOYqpoAp1MpiCv8Cs2ZqHGEXJca7RtI3iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca86527a-94f6-a42e-4dbc-ed9134cec31b@suse.com>
Date: Wed, 14 Dec 2022 12:29:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 2/3] xen/spinlock: split recursive spinlocks from
 normal ones
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220910154959.15971-1-jgross@suse.com>
 <20220910154959.15971-3-jgross@suse.com>
 <71281857-7387-afc1-f9b0-e076e4f076a8@suse.com>
 <a6aadbc6-e34e-43db-26e5-5379ce2d88d3@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a6aadbc6-e34e-43db-26e5-5379ce2d88d3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: c02a16b2-afcc-47fd-1d04-08daddc6898d
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k6Zz9R4V8WNbS95oZaLT1ABjfKO9z8H8g5/HJaknWuY581+iY/OmH9OBzFpER05xVCe9Ts6gfrThXSIouH0DBvoPu1BzDBS2HROszzOghOVb9jCLtHRInL6pyTCSXlx3/YSQVpv8lJl63zrHQZ5UXyfngobXEIUhR03HQVFUwmr469AewaPHP62KiDZx90YviRN6buHNlgodzOq8p8nmdMSIT2YBNkeZqK46Iu7gXUi/W6umshvYlA5cjRprmX0p9Ja7R11Q+Dn3iqLIi0O98RtLaBKJX7eSTYyh+W2aXp/taUemMy4G57ASlgZqjLwP84pgjPovMbOl4PKCR9xVlVAbXGlv5T7LD6gQ2/r1Rj77N+dwaragYyOHpMCrXO/SDR1BnEdvvDrFQC52JJb2QuK4X+Mr8MaQ8qGfiuvphjXzHLVEUWmK9lbuVlz/6gHYo/fyG6i5oAoRgQ6CDyt9Tnl8XvDLUuHYxckntjQmVfyLRQXMeJADrNwF7IYd3qmAdqUTISwAyjicU2MePocywRICKZKJdlLlsQnJZwJHCI+EM+pb8tTE6+Pn9DLc3rkaYQg41TImy54gEBQ9y2ucMDRwTDO7W3xGcv1e6MXgKFa8VKZL6wg9HBUkxJrUxEM9Mt68qzjcwlbHsVtWgxkc9yV0+brX5TlKASwAfyaryD0MrghRCMRqad8BBjp/HNxa3XP42ylX7nG5c69kf5Ms8FOy2iGv5RhCbZ3CWb3dSHw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199015)(31686004)(31696002)(36756003)(54906003)(86362001)(6486002)(478600001)(6636002)(37006003)(316002)(38100700002)(8936002)(2906002)(186003)(6506007)(26005)(53546011)(2616005)(8676002)(6512007)(5660300002)(6862004)(66476007)(66556008)(4326008)(66946007)(41300700001)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFdNdm1hM3dCcmV2ek1hU0F3OVlKSWs4ZzlMajlaRDkvcGlod3ZRMjRGazFx?=
 =?utf-8?B?bWt4bDNWdU9HRXQwMWd5R0tjUENKN0hUS0lHdDUrOXZWL3BxZTByY1M3aDAr?=
 =?utf-8?B?YmZjZG1DYWY0L05ueTF1RUl1L2NoMFAzOExkRUNXL2VlS21IVUVUQUZmUm55?=
 =?utf-8?B?cDBxWkdaR2xmMmxHQlJzMjJrU1RRaHVueDRJUkY0cXBZMTRNSXpSTklDT1J5?=
 =?utf-8?B?WVB5Tm1Vbk56SXRidFA4YkhQdEVFLzQ0UG1VNDFwODFGVGcyemQ5akw4L1hn?=
 =?utf-8?B?SkRtM0EzbjkwSjVJTFh3ditxdWZGZlc4VDJOTEdVc21aaXZhQWFXQTRRamRp?=
 =?utf-8?B?c3JkVXZPVVNzWTF2clY0QmtmSjlCZllxbTJtYlZKYkVTcFlBVGpLUEtKNllM?=
 =?utf-8?B?L1A1R0gyS2h5eVpoMDVLdDRmQXFGSUorNUF3V1o0b2ZYbXFsdkEzTGFWalRY?=
 =?utf-8?B?SEQ1RXdRbEVkNk5SM3V5N2t3VjhYUHU2dWQrS25JZVRVZ3dkV1BUSGtJYkw1?=
 =?utf-8?B?R0NFK1FzS2d2ZEZnMjVmQU9FVHRxc2d2aThFMzdORllQRzhMUzFITStSZDJI?=
 =?utf-8?B?SkVhQkl2cFBqTkhQNlgrN095SGNrNjh4UFJNNGtLV3JrWjZHc3JnVlNmaHJu?=
 =?utf-8?B?aXBnZHJuelBOSVNwSk85MTBzamt5MStHeTd1UFNvZHc4aEltRUE4elFNVXRh?=
 =?utf-8?B?dlhqaTdlS1A0U05LbjEyNkpMR3luM0ovSlc0YkVrakpUYmhKYVMySnlRUUFC?=
 =?utf-8?B?UlRvWEVtWDMwNy9mbkhEcHpTc0dXdVJQV2hmRXVXVXNmNU9ZVUd6VTcxaTM0?=
 =?utf-8?B?dE1XT25BYnhlWk1KMWo0cUFMTjFZeS9HMFBLT2UydEcvNVNmdzZHY2liMWlw?=
 =?utf-8?B?VGtiekpRTHJFVlc3QUR0bUZSOVFGaFBVOGJnU0RxYmpvNFZyZ3ozK2UwU3ZD?=
 =?utf-8?B?Mm5UUDhnVFpxVFc5N1VDTXBXZ1dKZFh5Q2V2RHd6akZMN002S0lRdEZ6WFBR?=
 =?utf-8?B?RWs4VENBQ1h4TFdxN1ZGUkplZ2JtUWxPaHhBbFJCTG9JMXVSeDJMZTAvSWpi?=
 =?utf-8?B?VCt4Mkc2emkxTkxTL0FPenpzb3FhcUhPV3lIUkxNcUo3Q3pna3ZuN2hZOHVQ?=
 =?utf-8?B?eWtiRVg4RmJ4WEJNd3BDMFM2UUhZK1NwbFRPcDl3cEZrTWdVbnpTT1piVGdr?=
 =?utf-8?B?ZWRVRmFURlA4RjZsenMrOCt5Z3JOSUNqaUJ4MGRhQjBuQklmVko4MTNGdUdJ?=
 =?utf-8?B?ZXpRcDlZOWpHMnZKU25VV0ZxV3RoalBRRWw4bWg0RXB2Uk9mZ0hYaHVGU3VF?=
 =?utf-8?B?YXE0N2dISzh3Ujhpc0VZOW9HeGtGdDhrazUvL1R5OXVmMEg2bks0S2hNS29s?=
 =?utf-8?B?U0hrWC9Sd0dacysvMEFyNEg1c2F6eW9FaEVjbmpGZUZudERKbHFtZHRhL3Jw?=
 =?utf-8?B?UlkweFFjdVdhUVRZVkhndFRqV0tRUnJqYzlQUG10KzlXUjhyanU3cXBqZWxY?=
 =?utf-8?B?dXVYTldCcE5wcHRqNDFCeS9YeGVLN2VWdnV3Sklrekk2R1dlaVBZVkpxZGdT?=
 =?utf-8?B?OXptdWw1VGVtM0ROVGc2VC9aZ0wrN1VCcVA0UUNVYm5DMUVCajlEV21LRUNW?=
 =?utf-8?B?VnU5UzJ0OVdmTnZiNzU0YldoSkdySHQ4MXhLU0ZYaU1GTjFaOG5BSFFQUmgw?=
 =?utf-8?B?NGFrTUNEcUdYRG82SHRCMW9pWVRzWERVQWhNOUVNUTRQL3NFRCtvWkdtS3h6?=
 =?utf-8?B?QUJvb0RBemppU1RQQk9EdGZkK0lJaTNaV01wY1JpMjloWkJyUytST0Vxb1dy?=
 =?utf-8?B?N0FGSmtPRUNnNXRTU0txNW1YNjZCTVpZRC8wYmdTSG1mNjdDUHZqeEJwTEpn?=
 =?utf-8?B?S1B5eDFtWVc0NEl1NlFqR2I3Y1NHR0N4UmtCOFBSTUZIbDZNNm14VWFOd3Fr?=
 =?utf-8?B?dVBSMlA2c05pUERNcEVqNVM2ZFR1QzQ5Slh1dnlXQ0NYRWZiL29pNDIwMTFS?=
 =?utf-8?B?MkF6YXV0MXdFMDhqQUhyOWkvS1hyandEMW95Z01SVGVmMkpDbW9ieDhoS2p5?=
 =?utf-8?B?SFpLcVBCNjNOQVBuQTBqSHErNmViR3l2bTAybGlMeXRRcWZob1N5ZSsxMERW?=
 =?utf-8?Q?ykOpov7scGt5OvwM7B/1QdAKr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c02a16b2-afcc-47fd-1d04-08daddc6898d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 11:30:00.9054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Alhk82SFs8glx3o1vNwmOp+TqvpBfFheelV+Pi8nCNZXgZlGG7elEcEU/ww+Xr5RuHkuiC+aiHmefGlzTSpbVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8314

On 14.12.2022 12:10, Juergen Gross wrote:
> On 14.12.22 11:39, Jan Beulich wrote:
>> On 10.09.2022 17:49, Juergen Gross wrote:
>>> --- a/xen/arch/x86/mm/p2m-pod.c
>>> +++ b/xen/arch/x86/mm/p2m-pod.c
>>> @@ -397,7 +397,7 @@ int p2m_pod_empty_cache(struct domain *d)
>>>   
>>>       /* After this barrier no new PoD activities can happen. */
>>>       BUG_ON(!d->is_dying);
>>> -    spin_barrier(&p2m->pod.lock.lock);
>>> +    spin_barrier(&p2m->pod.lock.lock.lock);
>>
>> This is getting unwieldy as well, and ...
>>
>>> @@ -160,21 +165,30 @@ typedef union {
>>>   
>>>   typedef struct spinlock {
>>>       spinlock_tickets_t tickets;
>>> -    u16 recurse_cpu:SPINLOCK_CPU_BITS;
>>> -#define SPINLOCK_NO_CPU        ((1u << SPINLOCK_CPU_BITS) - 1)
>>> -#define SPINLOCK_RECURSE_BITS  (16 - SPINLOCK_CPU_BITS)
>>> -    u16 recurse_cnt:SPINLOCK_RECURSE_BITS;
>>> -#define SPINLOCK_MAX_RECURSE   ((1u << SPINLOCK_RECURSE_BITS) - 1)
>>>       union lock_debug debug;
>>>   #ifdef CONFIG_DEBUG_LOCK_PROFILE
>>>       struct lock_profile *profile;
>>>   #endif
>>>   } spinlock_t;
>>>   
>>> +struct spinlock_recursive {
>>> +    struct spinlock lock;
>>> +    u16 recurse_cpu:SPINLOCK_CPU_BITS;
>>> +#define SPINLOCK_NO_CPU        ((1u << SPINLOCK_CPU_BITS) - 1)
>>> +#define SPINLOCK_RECURSE_BITS  (16 - SPINLOCK_CPU_BITS)
>>> +    u16 recurse_cnt:SPINLOCK_RECURSE_BITS;
>>> +#define SPINLOCK_MAX_RECURSE   ((1u << SPINLOCK_RECURSE_BITS) - 1)
>>> +};
>>
>> ... I'm not sure anyway it's a good idea to embed spinlock_t inside the
>> new struct. I'd prefer if non-optional fields were always at the same
>> position, and there's not going to be that much duplication if we went
>> with
>>
>> typedef struct spinlock {
>>      spinlock_tickets_t tickets;
>>      union lock_debug debug;
>> #ifdef CONFIG_DEBUG_LOCK_PROFILE
>>      struct lock_profile *profile;
>> #endif
>> } spinlock_t;
>>
>> typedef struct rspinlock {
>>      spinlock_tickets_t tickets;
>>      u16 recurse_cpu:SPINLOCK_CPU_BITS;
>> #define SPINLOCK_NO_CPU        ((1u << SPINLOCK_CPU_BITS) - 1)
>> #define SPINLOCK_RECURSE_BITS  (16 - SPINLOCK_CPU_BITS)
>>      u16 recurse_cnt:SPINLOCK_RECURSE_BITS;
>> #define SPINLOCK_MAX_RECURSE   ((1u << SPINLOCK_RECURSE_BITS) - 1)
>>      union lock_debug debug;
>> #ifdef CONFIG_DEBUG_LOCK_PROFILE
>>      struct lock_profile *profile;
>> #endif
>> } rspinlock_t;
>>
>> This would also eliminate the size increase of recursive locks in
>> debug builds. And functions like spin_barrier() then also would
>> (have to) properly indicate what kind of lock they act on.
> 
> You are aware that this would require to duplicate all the spinlock
> functions for the recursive spinlocks?

Well, to be honest I didn't really consider this aspect, but I think
that's a reasonable price to pay (with some de-duplication potential
if we wanted to), provided we want to go this route in the first place.
The latest with this aspect in mind I wonder whether we aren't better
off with the current state (the more that iirc Andrew thinks that we
should get rid of recursive locking altogether).

Jan

> I'm not strictly against this, but before going this route I think I
> should mention the implications.
> 
> 
> Juergen


