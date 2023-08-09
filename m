Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA301775321
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 08:49:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580704.909090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTd0A-0007iC-Ln; Wed, 09 Aug 2023 06:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580704.909090; Wed, 09 Aug 2023 06:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTd0A-0007gW-Iz; Wed, 09 Aug 2023 06:49:02 +0000
Received: by outflank-mailman (input) for mailman id 580704;
 Wed, 09 Aug 2023 06:49:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTd08-0007gQ-VR
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 06:49:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1c75afd-3680-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 08:49:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8890.eurprd04.prod.outlook.com (2603:10a6:20b:409::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 06:48:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 06:48:58 +0000
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
X-Inumbo-ID: d1c75afd-3680-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5f47C9Khtn+y3rDsY4uaiA9W6bnqaM67FLsLYuvTb4L24xYjWJiOYNiMSvDbHps9uCdEsJskUZnhuVa2O/vu2gvVFhPZ2CKEfX+5gWEDNiCkRMGEckOz/wW+ikqR0AiCkvSQawaV/bALmpRS2hE4r6NwWbPOkttsX+wlGfaKhF7qE/Bw3hQ3jQmn4YgsEhIuQW3o+1bjjPiMoETL75OXaenIwD/o+W+VGxWHefwwKwnUa6qIqH/bIMZ+5makNrmbxfgK9O5n/V2lpfZpB01Trv9aN8XwD8wMAxwel4dLLZSGMrxwn+g/rqzXRa1pvEzyRkxGCPcOJPPNDuEHX9itA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bf48YHefA6bFkSCH3odqD4dx8zvG/JfvGMJBg1ei1Bc=;
 b=NFnh4pIWoWBm7r/tvtDoxTs7oacird47wQh0HvY2+s5+00T/EjGjnxFGFlfnXShXkXNObkDYej4oBaJakK4zSrpAAbv6tldJvqpaKkrV1jtjmd+uQnEfabwpXVO9IHO1lg+Zr6GlhDwxhw7+BAZq/eS6SflCFSCdAhvOViu8kIxpJjbh1KOkU/fGyhhCMxT0T54A7yolWkiS7FgpiVwTkn7iRb1gLJv/V8/210dLgrkt3J0FIZmGSd0zG4ALvmbQ53fo8dkyIP3j/z9m/l8U7W9TkEcZXvyTzK/d8cEMTKR6eDHYV92Xr7pl97vj3ZUY93AvSGDEieK2xS+ybGw0jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bf48YHefA6bFkSCH3odqD4dx8zvG/JfvGMJBg1ei1Bc=;
 b=azEOsYDY/u01QBRO2WiTP0abtk4Bg/dEoBJ9EuLx9bDCVpVzeKc28MU4wfu622zJdlCeEfRGz2GNcBobU9e47NU/x4/03x7qfZGfUyH36V8ryzHO2u81127bwUZlnMKFKX+pI0XMhGDIDGqFiAw4OllX2jZ49ED6cGEiAv5qHjkKLuW7VLHd4Ike24DXWzTy9/njEDV2E8kYSCWnP7JJJh7zeZJBwlw4W/umc1II5ToZZpfByOB5rrT9qAkM8vnm0AzXuRnwlgTPaQmL3uGuEdxONRZmgLN7xJVS4fJEmxGLNcp+18gbZc6UCu0PTDYMW1br08jyqO9VC8yZP4f3sQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2307c6c6-1794-30e2-a6ba-f40fda313738@suse.com>
Date: Wed, 9 Aug 2023 08:48:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/9] xen/ppc: Implement atomic.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <8035b9659a5930c00802dd36ab52574695d6b419.1691016993.git.sanastasio@raptorengineering.com>
 <5e9380a5-7e33-ea70-6aa5-3ce1906a159c@suse.com>
 <080f37f4-2b2a-c057-568d-6e4974eb2f8c@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <080f37f4-2b2a-c057-568d-6e4974eb2f8c@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: b4ccacc9-29d3-4345-b030-08db98a4b4f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lAhH19H7EqUYynIpuc7KPTqQTk5j+4x1hYqqOh+Kj4SO0as2avbDM4YhJr6jFdD+GBCpF4TYM8EIzrDd/G2Uy/9DEqzsbFLTxPKwSjTRH0yIveS6EhpmzkSX3gvATJomO+ivUv9g1JS2Dnd607LAet4/ddAgMzrezash/qvPAI21t5a2IE3zXHDQRTcrIPXBt+dlcETY9TH7tBuZXQBlVzsYu1LCYsu7Pmm5N0Qp4Gz/tJ20Z80cukPyXlGgNhvmwRM9Ws/81e4A8ltBHoa8OkKAO8dhKdFB4Vbemrc9D8OBLOmbQI8PSxd20NA0dhZSslJme0MInN6Hif0HPLBqpHDVoa5pJJsZBU5gcsJKYsl3GMH7OvQFmLSoG7XPdhNAkUtY1FCPCejvxUKIY2MUXNtHSTpVAS+1QWNfVAFL2m9nFL0ys3lnl9VxMs9DuDQz9pSTYL69XiK89DXDL05M12Cyvrkj9XNeZJWZGoozkvuaNq3vw9XV14/ytI3sfrhIW+Rts3Ke/AcF1teyLiuCHbSJDstW2MeEa8cmJL/YhH0tFkBMtvvxAmRHUeTzPpldW3Mdmkdty9Vp76ak5hIDInZlmgxwdmYHXc1CmuiPGlCArrJARkdCx9UuezGNOfzFdKAWzyDC5FGgVMSiDhgWJMUBDruPxbYD3Wqx6AL1spo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(39860400002)(376002)(136003)(1800799006)(186006)(451199021)(2616005)(6486002)(478600001)(31686004)(83380400001)(66556008)(966005)(6512007)(53546011)(26005)(6506007)(8676002)(316002)(66946007)(8936002)(4326008)(31696002)(2906002)(6916009)(54906003)(66476007)(38100700002)(86362001)(41300700001)(5660300002)(36756003)(57644004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2JUZU1naldxZFZ0QktQcmhGUm9nWDVwS1JBa002Wjd2RlR2TmRwMmVIMkdG?=
 =?utf-8?B?ekNSdWtSck54aXZWYUYzc2hhdktJMXhrcTRROEZ2cHdjTFZmcGI1Q2w5UllZ?=
 =?utf-8?B?d0NSV1JlbzVROXlQVU9OcUowMittZU1xNjRFVWRUUGx2dGdlWmxuNEpyamxw?=
 =?utf-8?B?SDdacmphbTg1UlVPM056dk4vcEpkWXdrZUt3RjNqb2VxOVBKNVFsZU05cHo4?=
 =?utf-8?B?UFhIVjBSTlcyNVRPNk9BNDlGRlgxQUEvZjFYKzBhVEpmOEVsQ1c1US9YbXRR?=
 =?utf-8?B?bHc2RmdYRFlxeEdzZ3M0RVh4M2RwQnU0QUFkaHF1S0ptZGE4TjdlTEpiKzJs?=
 =?utf-8?B?UFBQajFtUGlTaVRORHZCT1NkUE9yVXhlRzJ4eVVxOTZVQm1PZFRLNWdBUlpV?=
 =?utf-8?B?MFBpWjc4TDRIbmQ5bHUrenFNVnozc1Y0ZVphT1c2dC8ycG9tZVZrR2xLL2ZN?=
 =?utf-8?B?Z1BLQXQwaHZ1Z0hqNHQwNjdHWDlxR0d4cjFXQjhoZGxoMWkyNVBwa0o0Y0NG?=
 =?utf-8?B?dVU5TzhRNDBEMmRhSFZydWZNQmZlV2hzUUZ0aGpUTFpjMUJvS2E2OG1vVklU?=
 =?utf-8?B?THBpQjdycDZKMHI0NlhpbkY2U1hxek5vdzZYVy9hT0xtUWFpNzEvVTVMSGow?=
 =?utf-8?B?RmlQL2pxT3pHcVZiYW5GWStXL3R0a3Z6bFI4M3VOQ1h0blNxWVlxYlV3SWgx?=
 =?utf-8?B?WExTZVpSMnZVenJTS3BiT0tQcGxQRUp0SnpTOWEzWkEraDNvQUNlaTZCY21o?=
 =?utf-8?B?RFBvc25FbjVoNURDNTV2blB0MWlMaysvRjFyR2MvZ3Jnd1hGdllKcFdpajFD?=
 =?utf-8?B?ZXpveUpKUXFrRHZrTVJydUpyU3RLL2hGTk1OcGFzMDgveldLbEQxSllYZ0k1?=
 =?utf-8?B?NXF6azZlbmgvcGw1WjBGRHBVc1JjMk5TcHZudEgreVc2QkJOWlViS3E0RjVV?=
 =?utf-8?B?ME1KdUJkWWRUNzYxdkgyRlJ2MFMzRms4M09SUWo1ajB3UU5oSTNqSTNSVUUx?=
 =?utf-8?B?VHZvZFVGc0lFamZrZEgwMCsxQzJsdzg1QmFHV09yNXNlbFJFd0xFU29PajZI?=
 =?utf-8?B?ZnlnM2FKbndhaXZQbjRjYlpEemhhZ3owd21NV0xTWG9UNW5FWmtGbkJOUmRF?=
 =?utf-8?B?ZUpzWnZlTHhnejBJOGIvdXJpOUMwWGpEN3hpbEVQblZmN21tbThhaWtRMGZW?=
 =?utf-8?B?RzRzTkRkR01KOWRGaGxwWXNFWEVsTEFsQlhFWTRZdTNmdkI0QnJ1R3d1bjNz?=
 =?utf-8?B?Vmo4OStUaUJBYTdvYTY3U00xT0F5bjNZaWJ2R1QwbTBxZm02azlUdDVZR0JN?=
 =?utf-8?B?MTExR3J3NmNBMjBuZ00vOC96bjRrQTdBTEFBbmY0emdXTVRVOEsreitpbUU1?=
 =?utf-8?B?UXQwL1FHa0lqZWRCMnJUUHI5YkFlekpnbUdPcXBlalgxZkpFV1ovNm5YczRQ?=
 =?utf-8?B?blB5d2xsUGRyc2RDckNNOWg4VjNlWE5temdCVkhwSjRsbnp1cXBDdlBUYTls?=
 =?utf-8?B?NEQ5ZWliL0JTVTl2aWs2dWkxeCtDbStqd0Y3M2hML0trZFU2djBrb0tsL1ZD?=
 =?utf-8?B?RmxjVFcyMHMweWJaNjVJODlYNnB5N2ZKMWdsdHFjQ0F1bDlyL0JubmtkWXpi?=
 =?utf-8?B?MzRZcTcrcHZ2K3ltdFoybHBta3liMkRmSTdDK2FMcEpYMnRrdmorbU96QnVt?=
 =?utf-8?B?TkUxK0ZwRW1TREdBMGJwN0d4YWNSc0tUS1FZM1JuUWpJT2JSYUw5V1BIcVVU?=
 =?utf-8?B?U1F2SHRHQ3VWMlFDT2tRQjc2YTVjZzVWcXpEMlhqU1FEQWp1aHB0R3BucWtN?=
 =?utf-8?B?QnJhem9ra25kVFBHV0VMMSs0TmY3ZUYxY1RXbXlvUzdpRzMzTVJtVDZSczZl?=
 =?utf-8?B?R2N2b3V0eW1xWmhRZ1gySDUwU3M2eDJCSGMvWlM2T2l1Tkd1b1NXRmtuVTVl?=
 =?utf-8?B?U09hWEZvdCtaMWZJK21pZ2hRTTVpeWV1dUJQYjFQazQ3M0dBcE51MENMRERj?=
 =?utf-8?B?Q3Z4U1JMU2E1NVBXWnVjWnhKR2wrK21yMjg1MEVIbFJzNVlMSHo3aHZHZjVF?=
 =?utf-8?B?VHRPSkV6Tm9RSkMrKzVQVStXWmdQL2x4RG9iYkVVSUZuZTNyR0lNNGFodGpp?=
 =?utf-8?Q?QOqL3L3jP/Psycy1Xfxu0dtp3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ccacc9-29d3-4345-b030-08db98a4b4f8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 06:48:58.2666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQSztZbnx7O9ANibI07uPdhxUzzHc4l2fPuFkKqWvaEOHRs0PFGDq2AW6FleQLpmcj+2iw+RVw/KF6QaVjredA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8890

On 08.08.2023 21:19, Shawn Anastasio wrote:
> On 8/7/23 11:13 AM, Jan Beulich wrote:
>> On 03.08.2023 01:02, Shawn Anastasio wrote:
>>> Implement atomic.h for PPC, based off of the original Xen 3.2
>>> implementation.
>>
>> Since likely that originally came from Linux, did you cross check that
>> Linux hasn't gained any bug fixes in the meantime?
> 
> I did -- the atomic barrier instructions used by linux have changed
> since this code was originally written, so I've updated them to be
> inline with modern linux.

Please mention this in the description then.

>>> +#include <xen/atomic.h>
>>> +
>>> +#include <asm/memory.h>
>>> +#include <asm/system.h>
>>> +
>>> +static inline int atomic_read(const atomic_t *v)
>>> +{
>>> +    return *(volatile int *)&v->counter;
>>> +}
>>> +
>>> +static inline int _atomic_read(atomic_t v)
>>> +{
>>> +    return v.counter;
>>> +}
>>> +
>>> +static inline void atomic_set(atomic_t *v, int i)
>>> +{
>>> +    v->counter = i;
>>> +}
>>> +
>>> +static inline void _atomic_set(atomic_t *v, int i)
>>> +{
>>> +    v->counter = i;
>>> +}
>>> +
>>> +void __bad_atomic_read(const volatile void *p, void *res);
>>> +void __bad_atomic_size(void);
>>> +
>>> +#define build_atomic_read(name, insn, type)                                    \
>>> +    static inline type name(const volatile type *addr)                         \
>>> +    {                                                                          \
>>> +        type ret;                                                              \
>>> +        asm volatile ( insn "%U1%X1 %0,%1" : "=r"(ret) : "m<>"(*addr) );       \
>>
>> As I think I had mentioned before, asm() contraints want a blank between
>> closing quote and opend paren. I.e. like this
>>
>>         asm volatile ( insn "%U1%X1 %0,%1" : "=r" (ret) : "m<>" (*addr) );
>>
> 
> My mistake, I went through and hand-formatted all of this code to try to
> be inline with Xen's style but forgot about the constraints.
> 
> As an aside, I don't suppose there is an automatic formatter somewhere
> that I've missed? I found an old clang-format fork that claims to add
> support for Xen's formatting[1] but it seems to only handle a subset of
> Xen's rules so I haven't found it very useful.
> 
> [1] https://github.com/NastyaVicodin/llvm-project/commits/main

Work there was recently revived, but we're not quite there yet, sorry.

>>> +#define read_atomic(p)                                                         \
>>> +    ({                                                                         \
>>> +        union {                                                                \
>>> +            typeof(*(p)) val;                                                  \
>>> +            char c[0];                                                         \
>>> +        } x_;                                                                  \
>>> +        read_atomic_size(p, x_.c, sizeof(*(p)));                               \
>>> +        x_.val;                                                                \
>>> +    })
>>> +
>>> +#define write_atomic(p, x)                                                     \
>>> +    do                                                                         \
>>> +    {                                                                          \
>>> +        typeof(*(p)) x_ = (x);                                                 \
>>> +        write_atomic_size(p, &x_, sizeof(*(p)));                               \
>>> +    } while ( 0 )
>>
>> Up to here you use underscore-suffixed locals, but then ...
>>
>>> +#define add_sized(p, x)                                                        \
>>> +    ({                                                                         \
>>> +        typeof(*(p)) __x = (x);                                                \
>>
>> ... you have even two prefixing underscores here.
>>
> 
> The definitions of these macros were directly copied from elsewhere in
> Xen (x86 and arm). I can change them all to use underscore-suffixed
> local naming here, though.

We're still far away from eliminating all pre-existing issues. So copying
existing code is always at risk of then getting such comments. Again -
sorry for that, but otherwise we'll grow the number of issues.

>>> +        switch ( sizeof(*(p)) )                                                \
>>> +        {                                                                      \
>>> +        case 1:                                                                \
>>> +            add_u8_sized((uint8_t *) (p), __x);                                \
>>> +            break;                                                             \
>>> +        case 2:                                                                \
>>> +            add_u16_sized((uint16_t *) (p), __x);                              \
>>> +            break;                                                             \
>>> +        case 4:                                                                \
>>> +            add_u32_sized((uint32_t *) (p), __x);                              \
>>> +            break;                                                             \
>>> +        default:                                                               \
>>> +            __bad_atomic_size();                                               \
>>> +            break;                                                             \
>>> +        }                                                                      \
>>> +    })
>>> +
>>> +static inline void atomic_add(int a, atomic_t *v)
>>> +{
>>> +    int t;
>>> +
>>> +    asm volatile ( "1: lwarx %0,0,%3\n"
>>> +                   "add %0,%2,%0\n"
>>> +                   "stwcx. %0,0,%3\n"
>>> +                   "bne- 1b"
>>> +                   : "=&r"(t), "=m"(v->counter)
>>> +                   : "r"(a), "r"(&v->counter), "m"(v->counter) : "cc" );
>>
>> "+m" and then drop the last input?
>>
> 
> Yes, that makes sense. Not sure why it was originally written that way
> but I'll change it.

I think this was attributed to not sufficiently well written documentation
for older gcc.

>>> +static inline int __atomic_add_unless(atomic_t *v, int a, int u)
>>> +{
>>> +	int c, old;
>>> +
>>> +	c = atomic_read(v);
>>> +	while (c != u && (old = atomic_cmpxchg((v), c, c + a)) != c)
>>
>> Btw, no real need to parenthesize v in cases like this one. Otoh a needs
>> parenthesizing.
> 
> FWIW this was copied directly from arm64/atomic.h, but seeing as its a
> normal function and not a macro I'm not sure I see why `a` would need
> parenthesis.

Oh, right you are. The parenthesized v misled me.

Jan

