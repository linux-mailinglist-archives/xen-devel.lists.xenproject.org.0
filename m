Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F6B62D8B2
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 12:01:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444937.700125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovcdC-0003KH-Rg; Thu, 17 Nov 2022 11:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444937.700125; Thu, 17 Nov 2022 11:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovcdC-0003HJ-Ny; Thu, 17 Nov 2022 11:00:30 +0000
Received: by outflank-mailman (input) for mailman id 444937;
 Thu, 17 Nov 2022 11:00:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iQoc=3R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovcdB-0003HC-0Z
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 11:00:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0af55324-6667-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 12:00:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7169.eurprd04.prod.outlook.com (2603:10a6:208:19a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 17 Nov
 2022 11:00:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 11:00:25 +0000
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
X-Inumbo-ID: 0af55324-6667-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9yhTOWOm0bVfgWe5GH3eyM4Zj7xnTvROdy2+FNMdeVwdt3gRgZzm7CWu3KCceHvx1lMDr5+aXW/zFKxXK1vHMrReuvjzMKX5GSZYl+NZ50CZ1RxMgSih4IgynhHGCzDyN2mnjG95/fjq9G2/8m1D6DTgqJ1MXw2bO/oTWdllDb3X6ROTHDYWsPKZ9oqiLDEtLJ9mTjrbohj/vtgS7r6L5iIxK55XVsEflEQSzFzEXXgBYkBMu3btRv9mc6YB9Lym3kKUuFS3Idl9ox8NodHBZ2lYS3x+xwJrGtXsb2m0Xh7Y8kf0dXvKywx8hyShLj3rs9e69aZ9pgCf72J3E49wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jasQHcIxN6EHMhwqWyfdrKJiQeUrsfV8YGhcHfUEZzc=;
 b=jQPkXT/9l7uAkrDi/g7+D5HWchXSF9k55UgAk9T/BJ1y0mDo/KDijvi/BsgrG5HmOh1wYxjH8ZJ1I0SR6MJxYkulVCdK6gE9yH74Z8eupFjal7cnWuKymrhB7tVxuuYSZjSxfPbCc8TOgcbCEWDs/qxNSzwoE3Zug+/9YMasdu/HLXVC8XZ6V4VRyVVqJC5HhSZ6tlX7XNXjNwY7WhQjgbFDyQbgXSP/2awdF0wwADUSVuX4fndU3H7CQZezEA6QtxsIsw21CGKpIGe36j+bMQmaNQqQ2MivHsVihD0rfAW9qov6hlKZNtC7K3hkEf3rseIBZ6pNCqDHNIFBLVnYbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jasQHcIxN6EHMhwqWyfdrKJiQeUrsfV8YGhcHfUEZzc=;
 b=Wq/DTmWU3tEGIFni7ZLgqdELAhrTReT1GD2Y5sw4T0RSvjGfHOdD2tiAWUzR/ExaA9JNUFkGOsKFNAIEjGOWHujpxKyPyNLrmy5ojA7sfQIGcsArpsRFDMHAqHC1pXVWFRrjBNEVwqiEsifvcEqaLN2bx7eqIbGzs3UFj7dYk+Qe80MYotV2qap7qydQ3JrzGMlhVREzua6mZZEov4NrD1slqueD0bNHX9ak1rLMiaiV0uiiZh4XZqpG3jBZczfld4H9DOcspvCPnwib04MfIUD4SOhEX7sPCY2wmrfTpXVckC8zndwUG7pvBwWmmdfNmi7lD7avB/vDXSq40QXhUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dfa1eb96-5538-e3f2-250b-3cf17a6e50fd@suse.com>
Date: Thu, 17 Nov 2022 12:00:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC] docs/misra: List files in Xen originated from external
 sources
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221116092032.4423-1-michal.orzel@amd.com>
 <93736488-8e0c-282a-2e5f-db0cf9419183@suse.com>
 <88a04b63-04ba-ef03-771d-1f2d11ea8549@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <88a04b63-04ba-ef03-771d-1f2d11ea8549@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: de9bac01-a9a6-4ec1-94df-08dac88aedec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vh+whbaI/j0SZkeruhHiaYCO7yZcSJ558+tv/TkDEwHOYjCM7QXFEc9C5wfwukVR4/GkESvqcSiYdNMValoobh2atnomNQjPX7Q/6qDX9DhDnTCpxx5+eTQPFwK5rUdHp7lbWIOlxY/aaLKiBzWzeZQXu6iOwR3knd5OXnp+CT73tnQiTw6hdKJNlNJGdL7M1Q3wDi6AwLLba+8JyPr3BH4k3Xjyj7mz1T/8rkEpW0E+URNweKlfyzRIuUKZBciB32P/bH+CAXokVVcLtDMhl1kD90AeuM3pRQ2GTlPp7Xr25I5AbKHBc5axtnOTq34sc7xte/uIT8Lo9cwBGvoOiAO6BxmXqydgGP81A6nhTHgSX31qww9RoBpldl6JjUQtZKP+Bu8LYtmvtIReyfyqIr612Q/XWpcZHGckr/abeb21ruZdJ4kJLIfKr6QXVi+kXCLnva/dp3w5kMz7euQtYZmlEtF767Wg10ZEyHc4xQhaymrHnFTD5MDN5qf8zQNkZrGz4c89aOXjo3EPHPYQ7dwITB10dBABvquGohRKhfo596jhwOBozRLCYOvNnlMqn5ohraqYNkhaxdYpav7IuNJjRmd3ZdoOGMtIwA5JXl+wr1ukBSxeiebMrhhZlxrY27Zw41cv6dNZw//FlZbtIGTtTkBBwfmui2vvhbsly2gsE/FoHQdXTFhr3ntXRg4XG8QgPuBN2r2b9VrbbYWRlNfkWq452JZFVMcSX4DsV24=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199015)(31686004)(2906002)(66556008)(5660300002)(66476007)(41300700001)(8936002)(83380400001)(31696002)(4326008)(8676002)(86362001)(66946007)(316002)(2616005)(6916009)(54906003)(36756003)(186003)(26005)(6512007)(38100700002)(6486002)(6506007)(478600001)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MndIaE5pSlU1bXBoSFhFdlhzd3c2cC9Ic1UrVXA2OFE2ODVaUGZrNnpKeGVk?=
 =?utf-8?B?THBiRjRKR0hIQlJkenhzbWZyclo3Z1g5ODJLRHVpSGZqeHBGNEhleFZSaHVa?=
 =?utf-8?B?RTlQYUZWTFdRaVRyWmxWMDl2NDNDSTlBeEF6a2MxZXBTZVlVeUdYZlR3L1ht?=
 =?utf-8?B?bnh4K1VYSjR6NXFmT3I3WHVkWHAxTzA3K29neWlYZElwSnhsZ0Y5ODJJL2JP?=
 =?utf-8?B?OWovNEpwZWc2am5MUHZ3NGVaVHFoczU1ZmNndHk5UkdmRnpWd3hJRHlsUG1H?=
 =?utf-8?B?dFJaa1dESnE3U1ZpeGZEbHhlZlJPY284aTJueDdhQldVc1hVYy9ZdjgrZktk?=
 =?utf-8?B?UHphS1QzblJKVjg4Z1FNamZUS2xWTGIyeDNqYytna05Rand1c2dmUmN2SEV1?=
 =?utf-8?B?aDNlcENGL3hUT05Xd3VReVc5OXdIYXUyUldtdHR0L3YxaGo3UG9icFFqQmVJ?=
 =?utf-8?B?ZjhuZFowUlNpazZGaE02cnpicGtsc0c4WVQ1YWdnRnRkN1dGQmZzSHYwUUxM?=
 =?utf-8?B?bzdEMEl1RnN0Z2o2akZua3RkdXZhRm5aajlaS004bi9ISWtUeTdaZnZZT0Vo?=
 =?utf-8?B?Y3JiUHkySldsWGNZZkFkcnRqK2RhTytVTENoaEkrVWNXTzRLRXB4Qi83R3cx?=
 =?utf-8?B?NHFQMm9tMTRqalQ5TEZTdlhPOHZGeHY3QTdOdm5VNUc4ZFFLNW4yUk81a2ow?=
 =?utf-8?B?T1dsVWVDd0dIQU9DeDRkaXNFZjkwSUZzS2paK2lrcmovU251ekNwQmVWRGdV?=
 =?utf-8?B?Qyt6YTdJekR0T0xsdmdRTmF6d2RQbm4vTGg2a0szYWZ3SWRyY2pLRFdDYyts?=
 =?utf-8?B?MWc2c0J6RzJtd044QWJjQWNtTC9iOFdETW5ZQjVYbFBUN3hSZHIzb0lSajZI?=
 =?utf-8?B?bWFneml6ZEp2bk9TQ1oxZ3crZUJSM2ZuNEwrL0F1RUl3RUdmbmUzT0pQWUpK?=
 =?utf-8?B?WlV2N00rN1FQQjJoZ0U2eXgyYlp4Y0dUNUkrV1pQZmhBeTlIdUVab0ExQjVB?=
 =?utf-8?B?WUhwVmZjMWJlWFZMdERIOU5oZmg0VUdxeVZHVXF2Z1lTbitHUGRnblZ0ZExO?=
 =?utf-8?B?dlV0TnJmNHJjTC9IZmVBTDBvMGVqTnpYa2g5OHkzc0NaTk1VWWc4MXNNRG9I?=
 =?utf-8?B?WTd0bW9tSXFHTmtHQTNLU0IzTmp2WFZuNS9RaVRtV01xR080WVFwUmJCU0I5?=
 =?utf-8?B?c09uRW5SVjNNMGUreHl4MzF0WWU5dFFZanNKNEZEaXJxNVhnQllSSE5OZ0NL?=
 =?utf-8?B?TTg4aUdpNERxMm1lZHhCWmxBV2NOTUdvWXJsRzY5MW84Z0ZDalZOaGZaMWRl?=
 =?utf-8?B?Z2xEdFNteTAwS0dTclI3MXVUL1E5bWtnYmhpUmJ5TmRncmV4QS9yOVlxRkpG?=
 =?utf-8?B?UXVWOHdmR292bHhUUjZwZ2RpdFZhWGVzc2hNVWU2R05zd2RQNHRaa3oyZTBu?=
 =?utf-8?B?Rk15NnNGb3ZwTGI0b2RJK3lTYXhXMHhyTm5TWGthSEYvajEyaWVYVkpLbC9R?=
 =?utf-8?B?eFJGRGlHNnhDaEJpWkhsOENQQUtZMUs2M3F5M0RjYlcxTDd2a1VwQ21IVlky?=
 =?utf-8?B?U3F0TWdheGhFdDlMWG5aekxFNlA4WHJSYXloeUtBS1ozb2sza3A2L2h0dVFL?=
 =?utf-8?B?ZVd5MGZjTVMwaXJUeUJEL28yMnVOTkpFc2lvQUNUWGFOSUV5Sk16allFdFFI?=
 =?utf-8?B?ckFLV05xTmM5WUpOM0dDSVlzUWlHUzFQeHY2Y2lVYjdPRWd2RUkxZWpKNVNo?=
 =?utf-8?B?bkNKMjA5ZDI4ZmZ0emFIVzdWcVJtZE54K09Rc0JrVEd0VitscXFqenlaMmIz?=
 =?utf-8?B?S3dhbUd3c2JldW1JMU1INjYyS1NjZlNWVXNwbzM4bm11d2Q3R1JYQ0JUTEp6?=
 =?utf-8?B?UzVJYll4VjRGNjNCU0c2dFhoY0t2Q0hscU84Y3BPVWU3SFl3UHNONjdncFVF?=
 =?utf-8?B?QXVSS09WOVBES0N3aklFZDZmMGZpY3hHOUt6bm5uK25GY3I0Sm1WM1RKTDJK?=
 =?utf-8?B?OHdLYnpWVkxjRGhqUmprZFpzeHFYR0pqNEE3TWpuTE1PRTZNalVwUmVaUytj?=
 =?utf-8?B?UTYwcFpUUStaZ1F0OUFNbzAyTzZoTXpBalZxaWhYN1I4SFdzTU1WNFVGK1d4?=
 =?utf-8?Q?EL78gx5XLFYmm87ZFUVUW2G3g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de9bac01-a9a6-4ec1-94df-08dac88aedec
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 11:00:25.0187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: miG5L13WuX1SLQiZG4eUryW3tlnxVUeiYPDnSUHELwAWsafOvrE8IpmARJjDzk4eSBGJ9x0SVKyLKU8ubW+bxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7169

On 17.11.2022 11:39, Michal Orzel wrote:
> On 17/11/2022 11:03, Jan Beulich wrote:
>> On 16.11.2022 10:20, Michal Orzel wrote:
>>> --- /dev/null
>>> +++ b/docs/misra/external-files.txt
>>> @@ -0,0 +1,70 @@
>>> +External files in Xen
>>> +=====================
>>> +
>>> +The following table lists files present in the Xen codebase that originated
>>> +from external sources e.g. Linux kernel. The purpose of this table is to:
>>> + - keep track of the external files in the Xen codebase,
>>> + - help with the review process (e.g. changes done to the files that did not
>>> +   diverge, shall be first submitted to the external projects and then
>>> +   backported to Xen),
>>> + - act as a base for listing files to exclude from MISRA checkers.
>>> +
>>> +NOTES:
>>> +1) The files shall be listed in alphabetical order.
>>
>> But then you don't?
> True, it is alphabetical order with directories having a precedence.

Which is kind of surprising and, at least for me, confusing.

>>> +2) The origin of the files derived from the projects other than Linux, shall
>>> +   be specified within the () placed next to the path.
>>
>> Might it be more generally useful to have another column, then not only
>> stating the project but also the path it lives at there (or lived at the
>> time of cloning)?
> We though about it. Would be a good idea but can be quite challenging for files
> that appeared in Xen before switching to git (difficult to establish the time of cloning in such cases).
> 
>>
>>> +3) The table shall be updated when importing new files from external projects.
>>> +4) At the moment, only the source files are listed in the table.
>>> +
>>> +| Relative path to xen/                     | Diverged from | Subject to       |
>>> +|                                           | origin? [Y/N] | backports? [Y/N] |
>>> ++-------------------------------------------+---------------+------------------+
>>> +| arch/arm/arm64/cpufeature.c               | N             | Y                |
>>> +| arch/arm/arm64/insn.c                     | N             | Y                |
>>> +| arch/arm/arm64/lib/find_next_bit.c        | N             | Y                |
>>> +| arch/x86/acpi/boot.c                      | Y             | ?                |
>>> +| arch/x86/acpi/lib.c                       | ?             | ?                |
>>
>> This was simply split off from boot.c, which I'd be inclined to take to
>> mean Y in the "diverged" column. In the backports column I'd prefer to
>> keep ? for both, or any other indicator taken to mean "maybe / uncertain".
>>
>> What about arch/x86/acpi/cpufreq/* and other stuff in arch/x86/acpi/?
>>
>>> +| arch/x86/cpu/mcheck/mce-apei.c            | N             | Y                |
>>> +| arch/x86/cpu/mcheck/non-fatal.c           | ?             | Y                |
>>
>> Even before disappearing in 2.6.32 the file was different from Linux'es,
>> simply because we don't have anything like schedule_delayed_work(). So
>> it's pretty clearly Y for "diverged".
>>
>>> +| arch/x86/cpu/mtrr/*                       | Y             | N                |
>>> +| arch/x86/cpu/amd.c                        | Y             | N                |
>>> +| arch/x86/cpu/centaur.c                    | Y             | N                |
>>> +| arch/x86/cpu/common.c                     | Y             | N                |
>>> +| arch/x86/cpu/hygon.c                      | Y             | N                |
>>> +| arch/x86/cpu/intel_cacheinfo.c            | Y             | Y                |
>>> +| arch/x86/cpu/intel.c                      | Y             | N                |
>>> +| arch/x86/cpu/mwait-idle.c                 | Y             | Y                |
>>> +| arch/x86/genapic/*                        | Y             | N                |
>>> +| arch/x86/x86_64/mmconf-fam10h.c           | N             | Y                |
>>> +| arch/x86/dmi_scan.c                       | Y             | ?                |
>>> +| arch/x86/mpparse.c                        | Y             | ?                |
>>
>> Like above I'd like to keep ? (or alike) here, as neither Y nor N are
>> fully accurate.
>>
>>> +| arch/x86/srat.c                           | Y             | N                |
>>
>> What about common/cpu.c?
>>
>>> +| common/libfdt/* (libfdt)                  | N             | Y                |
>>> +| common/lz4/decompress.c                   | N             | Y                |
>>> +| common/ubsan/ubsan.c                      | Y             | Y                |
>>> +| common/xz/*                               | N             | Y                |
>>> +| common/zstd/*                             | N             | Y                |
>>> +| common/bitmap.c                           | N             | Y                |
>>> +| common/bunzip2.c                          | N             | Y                |
>>> +| common/earlycpio.c                        | N             | Y                |
>>> +| common/inflate.c                          | N             | Y                |
>>
>> What about common/notifier.c?
>>
>>> +| common/radix-tree.c                       | N             | Y                |
>>
>> What about common/rcupdate.c? (Stopping at this in this regard:
>> It's unclear by what criteria you have gone. Even as simple an
>> indicator as "Copyright (C) ... Linus Torvalds" was apparently not
> Please see [1]
> 
>> used. Similarly mentioning criteria for considering a file
>> "diverged" would be very helpful to spell out, even if there's
>> likely some fuzziness involved there.)
> 
> We would need to pre-define some criteria to avoid having a long justifications.
> Any ideas?

Well, changing just #include-s to fit Xen's model shouldn't count as
divergence. But coding style conversion already may. I'm afraid
criteria here depend very much on the purpose, and hence I don't
feel qualified to suggest any.

>>> +| common/un*.c                              | N             | Y                |
>>> +| crypto/rijndael.c (OpenBSD)               | N             | Y                |
>>> +| crypto/vmac.c (public domain)             | N             | Y                |
>>> +| drivers/acpi/apei/*                       | N             | Y                |
>>
>> I'm not sure of the N here.
>>
>>> +| drivers/acpi/tables/*                     | N             | Y                |
>>> +| drivers/acpi/utilities/*                  | N             | Y                |
>>> +| drivers/acpi/hwregs.c                     | N             | Y                |
>>> +| drivers/acpi/numa.c                       | ?             | Y                |
>>
>> Y
>>
>>> +| drivers/acpi/osl.c                        | Y             | Y                |
>>> +| drivers/acpi/reboot.c                     | N             | Y                |
>>> +| drivers/acpi/tables.c                     | ?             | Y                |
>>
>> Y
>>
>> What about drivers/cpufreq/*, drivers/char/ehci-dbgp.c,
>> drivers/char/xhci-dbc.c, and drivers/video/font*? What about some of
>> the stuff under tools/, especially tools/kconfig/?
> 
> [1]
> For the first shot, the criteria was to list files using different coding style than Xen,
> especially the ones using tabs instead of spaces. As I indicated before, the list may not be
> completed, hence a gentle ask to list the missing ones. Some of the files you mentioned
> use Xen coding style + there is no information in the git history that they originated from
> external sources. This is why, the maintainers who are the addressee of this RFC should have
> a better knowledge of the origin of such files.

Hmm. Please forgive me being blunt, but to me this then looks like
offloading work to people who shouldn't be required to invest
meaningful amounts of time. But maybe that's just me viewing it this
way ... Yet this is particularly relevant if ...

> As for the files under tools/, FWICS they are being filtered-out from MISRA checks, hence I
> did not list them.

... the goal here then indeed is use for MISRA alone. I did e.g. ask
whether it wouldn't be worthwhile to more precisely describe the
origin of files because at some point in the past it was also
proposed to arrange for some more automatic monitoring of changes
being applied at their origins for files we have cloned. Which
obviously first of all requires establishing an association between
our files and their origins.

Jan

