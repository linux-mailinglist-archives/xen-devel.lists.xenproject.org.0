Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAC0771B63
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 09:19:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577771.904795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSuW3-0005Gx-7C; Mon, 07 Aug 2023 07:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577771.904795; Mon, 07 Aug 2023 07:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSuW3-0005DW-40; Mon, 07 Aug 2023 07:18:59 +0000
Received: by outflank-mailman (input) for mailman id 577771;
 Mon, 07 Aug 2023 07:18:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSuW1-0004uz-8x
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 07:18:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab9c42da-34f2-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 09:18:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9667.eurprd04.prod.outlook.com (2603:10a6:102:242::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 07:18:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 07:18:53 +0000
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
X-Inumbo-ID: ab9c42da-34f2-11ee-b27d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlRUP86vlvHRs4mqMOmLzuRLCtQ4X+7xAWgYSIOA3uxPhNFD5GpE8FYg2ckSr+3m5Ji4SlZEMCP7iqE9FG0dw8ENtiISQelu7rFMPXimLfPXAaOXAaevH7RtvwZQgFrIORIqLPktzkf2jeJ/PoGemp9z7D0zl662uNKlrXRO6aNVpTU7KpArIsK3Gfys2BYIwWarRmm/oLjV9Iz+QuHfzQs383XGkBECXEMLorW6axC/9jgRo6ohc9/mJSrkPxcmbmw06PGER96EPhSYGOkoiCSAff6//OQnvV+m7u1Y0KDQiAc/wsQOPmCfCSv2qvrzXfjKqSeR5js4yH7NMjpaRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8KXkDDb9QotkUfJGJhCzIzECK3RfULau+L7tJYIzXk=;
 b=aXWqIlVLlszkn/3+4599+WvOByecjrE1TkWazhk7Yi1noumse/xDDX/lBBEbGHVDH75fVGMA8t3JeHMYwrE9QBOEghHIeHhtF8thQMn8kQYvwLVS55Ybf59RgDi4f9dfJfaMBvyR18pe+CkR6B5VJgQ5pMjtgmTizVbcU4j0uzC7TEcp6PEkgxYtd3gvSjuRDbOWYRTgG9GQBjEXjViWE1uLc4uWNLoCOBvFBb0OoNexxRwNhVP4maiqfaV6/d0LkjO2b0gFSFpA6dAHMxKFemvutGvaap/ZERyLw9wl8A/40mKdTGnB7zso+Dq2SpOapGDPIJyJR0gagf5YjdtS7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8KXkDDb9QotkUfJGJhCzIzECK3RfULau+L7tJYIzXk=;
 b=gosAww/DqkWnb1RLG63qUK0poRiGLUkqE17cp3B22Z2sEHffmpswylxfc7rsBtE0k0CJcjtl0qGUmop9niRWWhiZJvUe0Ul3EV+byJj23L6PRpbXrcodqXmrV+f/H9v5VdkQwnZhgEXUpA7Z+Vab2Vq7wmsLGwY0JYsK/jOcu8NSVAlYNfQ540Sm+j+GYa7hCAQ+x0GctO6SfQM3+NzMctFtDHE0mTwaWSdLEFp9uU9yvZDRF+4XhoJoKmlXqQTm8SvJOgZmdhkVUxsSO/l5SS0NXKqLIa55zScjnJvB0AYd48iZV6uZKIR2Jb0bIq1q++816Nk1Q8Hamw9+KZI+6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d54cb8b5-ff67-421f-b01f-4913e726b2fa@suse.com>
Date: Mon, 7 Aug 2023 09:18:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 02/11] x86: move declarations to address MISRA C:2012
 Rule 2.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <204bf3ffcdda04d6d6cf072c42b78720e1e85b4d.1690985045.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308021910030.2127516@ubuntu-linux-20-04-desktop>
 <ad838567-fde6-defa-77b6-b5887c8438b6@suse.com>
 <6a5260299c5822abfbd74749ebea8f8f@bugseng.com>
 <8672f79a-3e44-1cc3-b448-9ee4a4ed9090@suse.com>
 <alpine.DEB.2.22.394.2308041322100.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308041322100.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9667:EE_
X-MS-Office365-Filtering-Correlation-Id: a8bb50f3-77ad-4bde-c77f-08db97168e5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	drZaDt6VrnruMb2XZxYiAbbPPUD1to+556gaxB0DD2oAoEhQ6lPkYBTfH/4LwxBDsnXHH4YY6NdTquv85q55Ia4SJkDZrZlsJTbbRO16jPkElXiaCV152oPuz+31MnQyhgTYLIXENzo+Bu09tThZWJyx0ndHm5hYEmeSqQXqFcXlcpOqr4by+bi67S2/TmFa5R2VoHamahtFfTnWKes3nVb4xMgh5a/LO/OZky50JWzldylXKN9YELD0vGMJm9pdrUlLxOd1d/JlsDIx80AvjNqx0KhSxERGXg5wI6hSipQVa8tmtedm6z51PtP0fqqzKq5ULqpyHvcoddQTqFhxDFuonP65uOdTMn4err8PAWeae6pS0ZHTVMZVyjeuqBX5iG9IzgI32NwRbFik3Ufs9Kh6TEIBlBUtOLIoDQiDUP7/SZexDAFGTvxFNrXwiuS/E7lv6M1p6qcn8qaJk8T/bACvPf5Vr4vOJSyQN8uyYkChAhzNKh/htkIO1QAxqjNnDzO74l7G7VYqyAS25+SbZna+H1B+9AKC6zIE2XOFEQT3nZymZM5eUtnm/4PUPg7FieHHlvO10ML1ljn3/IGIjv95qAsju2Vp2zqKPiir7hK487fACupSYpFs5KTa6hTCOx2pZpl7YW12BmLpGbgokw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199021)(1800799003)(186006)(2616005)(6486002)(478600001)(31696002)(86362001)(6512007)(26005)(36756003)(6506007)(53546011)(41300700001)(8936002)(5660300002)(316002)(8676002)(7416002)(54906003)(2906002)(4326008)(6916009)(66946007)(66556008)(66476007)(38100700002)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGVTbWVDeFpmbVl5K2MyaE9PSG0vV25pUVhqZTJ0MmhOVFMrVkJMV0JRUjRM?=
 =?utf-8?B?WDVtNGhDanM5bXd4WjB0dFRhSEpKanM1dTAxRldERklJdm1DcHZXdGNKTnJk?=
 =?utf-8?B?NWhCY2pSZHpVbjhGQUgxOWNxYzk3cWhjbHM4bVNWQkFOcG1jdWdDblBoaXJQ?=
 =?utf-8?B?Yk5RdGxoZWdOWmdadnloOWdDc0FMWDIvYXNOSDZIVnd5UFBRRWpqNVFCRHlo?=
 =?utf-8?B?WG5mY0g1a2MrelgyNlcxaWNzYlhrSDgySFZOTGZaNnJZTms4dmFJdkl1cjdm?=
 =?utf-8?B?WXFSeG9sdVZQdHU2cGkyOEcySkl6QmszVC9JWFBxTEVUTlROallGNDZ0clR4?=
 =?utf-8?B?OHZMS0dNUmFZaDJGUWVCNmU0ZXkvSUNzZk80c0FEY1JvYlZmb0J6eGdVRFc5?=
 =?utf-8?B?UGNpVk9VM2lDcGw0Q1lwQkh6WHNVaVNCa1BESGR2QUJ1WHF2UHRzeGhpaUEw?=
 =?utf-8?B?blhZRlNCanhDNFFNZzJtcDRvNEQzR0NrZDZ0NWREOG51TjZDdmhlWXV6bDJQ?=
 =?utf-8?B?TS9lMzd6WEx4VG9JZmR5VzBzU2pZZWVyNFdLb1lEb3J0S01DbUYweEtuYTJW?=
 =?utf-8?B?NlR3dy82U0lsaXliNzBMaXJVK2pKWGx0dEVuai85N1VEODdlR0ZHRU1tc0wz?=
 =?utf-8?B?cHBsME1kQjU5bjB3eGNGWVhnQnpmTXVlM3piRWlGZkFZNEVrRVYwUzBhWGJ0?=
 =?utf-8?B?WktVUngwZlRWdUhhcTJWb2FrZ1N4Z3B5ZzlTWGtYd21XM1pxeWs5MEE3SWVE?=
 =?utf-8?B?VWZrbS9jL3FvTkF6KzA4dGRISTBRaHlFek9TdEVEN0hkR2c4SFdRQk9KZnBK?=
 =?utf-8?B?SElhTnRidWdwd1JEY0xLeDBya0k5NkE4L1dOM1cvemZGRnEzQ21YT3ZETkJG?=
 =?utf-8?B?VDlMVXFuSGFDY0s1S2M3ZlJqYjZzbVVqcnhYZndWVDVJWEJoa05DL1BsSnBG?=
 =?utf-8?B?Q3JIbVgyb094c2x1OWVWVUpKc2dFN1NtTUx2QnMwT2lDbTNOUW5BcTkxNmxr?=
 =?utf-8?B?SWNxZks1TkFvVURXU3FYVVgxUkpCNkg5T0ZrcVh4OHZIdlNJZnpta29lSzg3?=
 =?utf-8?B?ODhZM0dFOHdyOFlMdlFjTVI1S3BHMkk2TzlGNUlPRTJ4ellZQlJJUGJSdGNG?=
 =?utf-8?B?Z2ZHOStWYTQ0a1pIdHZoQmRRSkdzUGppQ3BJSFI5S2FpbEgrNUxpajJ4T1pB?=
 =?utf-8?B?ci9rYUlMODRIRkhFS3ZkYWxLQ3pucHNpMk1UVkdnS20rYzc1cU9IMVpKMWI3?=
 =?utf-8?B?dFNMbTlXOHliT3R6aFJLOHRKT1ZOLzRlVlRvK1FtQnp1bHBjcHQwSlI3VnpP?=
 =?utf-8?B?eSswVnZFeUZRekZpT0xYV1ZNVEdDblR3TjN3d3dqM0JER1lDNDVRcUdWUjFu?=
 =?utf-8?B?aDdMc3QrblFES01BRVFXU0tveElpUWJSOUY2dlIvcDludzdYM29ObHlJRXk5?=
 =?utf-8?B?bEZhUGkxREtqYmswZEY0UUZhRUxyR2pWdDdMd29VZ3RraWtsMHZpQnRrSTV5?=
 =?utf-8?B?QXc0RTVUNHNGSDlYWmdTUE90eDA2TVFxZHNxa1ZYTGtSVFNlYW55cCtXeExQ?=
 =?utf-8?B?cnhvTytDcmNWbXZrWmRqaE1BbzN1a3dabm5hZFl2Y205NmZEcENoSnBlbXll?=
 =?utf-8?B?S2w1UnhUVU5GMGN2TDlkZytCU3BmTksxZ0UzeHdrV0xQbWF4SDdYaFltSkEv?=
 =?utf-8?B?cjlPWUVSSzUzSVhaUTk5Rmd6aWNOc085WmpQNWtnVlpFeHFrZmc3VHBSaWlJ?=
 =?utf-8?B?dkZWTXRGWG9UVXRxUTM2MFAvaVowd3BMUXRzNTVPUDZWN2NET0JtNTBGeUFp?=
 =?utf-8?B?cWgxdWRLa1JERHVqcGc4b3ZjS0ZKV1RzWE02aW8rd1E4R0Rnd3E0UzQ4bVQ1?=
 =?utf-8?B?UjVHUTdoblFhdldidHJ0YjhKSHhNcStQN1FFZVNZSVdYeE9LakF1T0ZvTWNn?=
 =?utf-8?B?T3JpSFA3Vm9HSHB4cXRlL2dDTzFFa245TVJneEVVbkgvdFFrRTl6WGcyNzRz?=
 =?utf-8?B?OVd3TjFIM3c4d1pjLzBkNW8yNEJaTitjMkl2U3diR2FJN1F0VEhvcG9oZmxO?=
 =?utf-8?B?Y2JqSTZ5Z0tzcGdNTWFwRjE5UGtKdHpnYWZhNGYwZGp5NndUd0Z6aGZwZElF?=
 =?utf-8?Q?Zyb6uAidJbsQqNb6Ub0ZxAFAE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8bb50f3-77ad-4bde-c77f-08db97168e5e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 07:18:53.7679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/2+w8ROR0tUAK0ccW2hEE8d66RPepe0/n8SeSF0ZTkYKRVKkGN1+mr0uJv1VJQEcLYBiEsnotLcSMS7j3BnoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9667

On 04.08.2023 22:26, Stefano Stabellini wrote:
> On Fri, 4 Aug 2023, Jan Beulich wrote:
>> On 03.08.2023 16:22, Nicola Vetrini wrote:
>>> On 03/08/2023 11:01, Jan Beulich wrote:
>>>> On 03.08.2023 04:13, Stefano Stabellini wrote:
>>>>> On Wed, 2 Aug 2023, Nicola Vetrini wrote:
>>>>>> @@ -1169,8 +1170,6 @@ static void cf_check 
>>>>>> irq_guest_eoi_timer_fn(void *data)
>>>>>>
>>>>>>      switch ( action->ack_type )
>>>>>>      {
>>>>>> -        cpumask_t *cpu_eoi_map;
>>>>>
>>>>> It is only used by case ACKTYPE_EOI so it can be moved there (with a 
>>>>> new
>>>>> block):
>>>>>
>>>>>
>>>>>     case ACKTYPE_EOI:
>>>>>     {
>>>>>         cpumask_t *cpu_eoi_map = this_cpu(scratch_cpumask);
>>>>>         cpumask_copy(cpu_eoi_map, action->cpu_eoi_map);
>>>>>         spin_unlock_irq(&desc->lock);
>>>>>         on_selected_cpus(cpu_eoi_map, set_eoi_ready, desc, 0);
>>>>>         return;
>>>>>     }
>>>>>     }
>>>>
>>>> This pattern (two closing braces at the same level) is why switch scope
>>>> variable declarations were introduced (at least as far as introductions
>>>> by me go). If switch scope variables aren't okay (which I continue to
>>>> consider questionable), then this stylistic aspect needs sorting first
>>>> (if everyone else thinks the above style is okay - with the missing
>>>> blank line inserted -, then so be it).
>>>
>>> Actually, they can be deviated because they don't result in wrong code 
>>> being generated.
>>
>> Only later I recalled Andrew's intention to possibly make use of
>> -ftrivial-auto-var-init. While, unlike I think he said, such declared
>> variables aren't getting in the way of this (neither gcc nor clang
>> warn about them), they also don't benefit from it (i.e. they'll be
>> left uninitialized despite the command line option saying otherwise).
>> IOW I think further consideration is going to be needed here.
> 
> Let me get this right. Are you saying that if we enable
> -ftrivial-auto-var-init, due to a compiler limitation, variables
> declared as follow:
> 
>   switch(var) {
>       int a;
>       char b;
>       
>       case ...
> 
> do not benefit from -ftrivial-auto-var-init ?

Yes, that's my observation with both compilers.

Jan

