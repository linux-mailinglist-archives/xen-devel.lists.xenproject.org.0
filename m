Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE87D5AE066
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 08:58:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399425.640593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSX3-0003lu-JM; Tue, 06 Sep 2022 06:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399425.640593; Tue, 06 Sep 2022 06:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSX3-0003jE-GS; Tue, 06 Sep 2022 06:58:01 +0000
Received: by outflank-mailman (input) for mailman id 399425;
 Tue, 06 Sep 2022 06:58:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVSX1-0003j8-WD
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 06:58:00 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2073.outbound.protection.outlook.com [40.107.104.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c410e49-2db1-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 08:57:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4312.eurprd04.prod.outlook.com (2603:10a6:209:49::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Tue, 6 Sep
 2022 06:57:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 06:57:56 +0000
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
X-Inumbo-ID: 3c410e49-2db1-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwnZB3AOwDTA6J5lXpyf7UN7ScSBAdoSZVCC9ajB9LQm30jHCPH5crkKBgGW4tUnHtq7AVAZqI8v6lzlJYaWfz6lgfuCwLF301xEAuwp/VzG+hL3VSX5U26Z2jrKBM9Hvsq5hp1FnOPEjCxb8xWQzq/BAc2dsf6GjpPYBY2JiLA0qg5jqDCl29meEMneG8EwMk6x09qwRz8AGo2/R/+peaAVSBjrvXxVXL1nSvCmMQHqaD0XcPhl8yIHyjiQaJTAqv8Tf9FLFQT5ue5YkaIYEdhnQgcWpbpYorM8yUI/9TkoxATjfL4THd+h6VcbvLFeu5w0k3+vKJQ9iagYQCP+QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jG0zk3SlbjRhX+881sK3vMg9u6tDIRC6tb39swUTrwk=;
 b=m6RJ7MLAskp+BK/lKwVewGOZysiuUI4mHNusmax7UYLu0ezsRssNOADdJc4/YSakDBgLv1HJL5cKEGVALBaRoD8SYWgextLf4+pWcCFdMtp3uQMdjE8jIqfx9mudVEi8MTIhEw+5DS1H+iLhC9f/OQsx3F0I87eb8wVRHExVwexk+8zFUEu5PY3aEu0GFeKvFwVYAjEjDyZQ7G/96FVpycYuiRA4Etytqj6u1EX8UiU74Ou0vRYcLSteLnQQxcfMJousJkJRh+Nh9CeHODvUP5cktGpV0x3mDnkoSqktoIAtvyl7aYyI/LRRWtSRii9nqTwLhEQuTUHdzo94yj+DsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jG0zk3SlbjRhX+881sK3vMg9u6tDIRC6tb39swUTrwk=;
 b=JTitQH6k/iHNI98cFboW3MOoiYtCtdWUEywaUE3e6oEelpFSGTD5vwfVLHzG3i9TblzZsJ3zjt6BR4c0NTMTjxO8Vlj4zJ5Q3hE2u/+ssuO5BOB0kuibx58Fu0jFbUSbHJknVBQB121xnbTfGiqo02qxJ3/26v+kT1FCXYNHTx/cwDaIIqGMMtgR0MiTnZ+oRbo0JT09NycU4hym6JZwSWuIMUBuuv/akNfuPm0afJUxXtS1jNR155CN2jY9ik+Fle08uv2vtGnlW7E6Gyl0KIFqTjRe/SN8pQORw6xbfaSlPiOJ8YeoylM7GUk6SPL5dk7Gyv4+de1Tjh1c5ItYzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <94930ab0-5507-b6cf-c2e4-dcb4e5bf276d@suse.com>
Date: Tue, 6 Sep 2022 08:58:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v5 1/9] drivers/char: separate dbgp=xhci to dbc=xhci
 option
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
 <edff5ba0d286a41b94a6b4bb332b63228f7faebe.1661181584.git-series.marmarek@invisiblethingslab.com>
 <b323ebc3-68fc-f6e1-b9ac-d508855a605b@suse.com> <YwiygukKUUqiAke9@mail-itl>
 <2fc50656-24bb-414f-4f39-3b23c4c3aa0f@suse.com> <Ywynyj1/cbL40sBv@mail-itl>
 <Ywypjx+2qATqMgnf@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ywypjx+2qATqMgnf@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0057.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdafc8c9-2098-4821-8c12-08da8fd52065
X-MS-TrafficTypeDiagnostic: AM6PR04MB4312:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SnWzT8pBx94p46crcYhh8Pgto/tkwS6gUWzA82h/U0KVzs1Bw21/7kM+UTVID5NYu/QcDy6rd9TB/noChfMHXyfRlJQ4c7hLMzkq+G2mhZlhbFskZS/i7Od9q3iNcVJ3a1vYwweaXEFw5LgIr0x4SngdhRfFMiRZ0XQafzyC7GR0TV6vR73szJH/469GY8Z5obvoaZ+1C25pqFNGRirTZWi4mS/qTVQACW4p2+2aK9geyaJFcio3AKe0LKq89uLMbcmrQbnmD4vmNN/k+sl0VxyNTTDC5SbTyuxjKbY9G5Nk1fWK1DyshHWGB/vICn5Qe0V88Rneg9FHLP6BcinIDv2ijHcztroUG/GF7SfYu+J9Wj9eLeQCFZ4jbLO4biytVXK4Ri5prQdAPxkH20E5VCZO20TbC+XS563TLpozMyX1kxM/C7ZUcRuPLfKuZfc+2fNqt/oI7qAetP837iVz1+EW/jXSGhrYa/8A8mI0LosDx86X2QsL7pu8j5hcDP+WwbSbVYEGNRD1gP/Wuf7E1tkuylG5ZiIMIsFsy9zNlQeVIKYkh1UhOF1olPUtZ3Nrq2t/FPcyY0UHrRwpo0Obp7ICir4a9lRYK1V5Igdhl6OFvwhpYYW5CqstyO5e62NOJv4BXZzlZU4A2SmuM0tPBxVb4xxd21Ar+i07yuG+dbUsU6dOpkhdCy5LjJQaKkc2fPrnKSWdnL+h/SFYuB2XqB4lGDXlyWz6WLqsRwJZGGDDRYIurie5BfEgX6PC6j7+s8g0nc9GX62xNycsHXG10YOlkROFQB+DVqu4DNHL5Rk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(366004)(346002)(396003)(376002)(6666004)(6506007)(5660300002)(36756003)(31686004)(6486002)(2906002)(8936002)(41300700001)(2616005)(186003)(6512007)(53546011)(26005)(31696002)(4326008)(86362001)(66476007)(66556008)(38100700002)(66946007)(478600001)(54906003)(8676002)(6916009)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXRjVVdGdy9OSU52OUNXY1NvdktFakFmQlFISEJhaENJUzc3QzdiNmI4T0xW?=
 =?utf-8?B?Umczd01VSStuNTY3dTlTWDJldlUwZGRiVGhtWTY4dnNTcXJzUElvaFh5OFRj?=
 =?utf-8?B?VDQyOUVLN2ptRVdOcFNaT1dKM3dhbjNiREE2VXdSK2ZyYlk4Mis3ZVFlcmJD?=
 =?utf-8?B?elpYUHlOaFZYd3lFdWpYQ3Z4eWEzYVFFN3JmdDdEVkNoV0dmcENNOEViRGln?=
 =?utf-8?B?Rkxwazc0cmN4M0FnUDJPendBMGdmSVJhMERsMmRLYzY5MGhRRC9UcUQrMHpF?=
 =?utf-8?B?ZkpabmM0dWc2VVQ5K1hjN2xHRUVLY3hRNTU0NmlMNUd4eE4yK3k5WlF3dXJv?=
 =?utf-8?B?dG14RHVIZHd4aTE2SExnN2N1c3NrTk15S1RlS2RmZmNLcFF0RWF1U3VNbHVJ?=
 =?utf-8?B?N3U4VEZGY0hJNTNTMnM1TGRqb2F6NWZlb2pjd05ISjdNWmw5Q2tESEcvbURz?=
 =?utf-8?B?Q3Evdk9oMGpocy9LWGZ5NFNDalA3anY1YkNOdWhxYVJpOXV1VHpseHBIR0Vv?=
 =?utf-8?B?T1o0Z3d4akdvVzVUZVBVRzRsWkMzYXpKMmJsVDl4L05JejQ5MW1vcml6cFE1?=
 =?utf-8?B?MERraStXM0xRejNoZmtxU2xqdlJJMkZadXFiMVpWSDlDaWt2aXBnUkREQzJ6?=
 =?utf-8?B?Q2piVVFhSHBJNytNYU5qTFBNWEFMd2NSdEpnaDJocHQxUURHSTNOQXpmeSt4?=
 =?utf-8?B?UFMrNzBLeFhCWE1jS1Y4alRGbTY4ZHE2WEZ2NDhka1c2ZnlCYStsMytQSEJF?=
 =?utf-8?B?MEl5ZUFXbTIwL21kbmIwYkJqa3I0YTQ3OUsvbWRiZVBZZjNCT29IM0xjQ2Yv?=
 =?utf-8?B?RTB0SUkxSUFraHFocm1taFRKdVNqbzB1QW5rL3QxYVg4cnc4QUhTcStNYnBX?=
 =?utf-8?B?bGZJNjBpdXF2bUNCNlkxR0tUNkh5cU9KVVI3bkhlV1pKdnRiRDl1MkdYd3I5?=
 =?utf-8?B?akQ3bkl5cUlmNVpIODZSZmZQZEF2eXFMUklUVWFvT2RieDN3Tm8ybEM5bTdv?=
 =?utf-8?B?ZEZlSHlsZ21hYXU2TzAybGFwQ3JaTStYK0tmblFqakFJdHlrRCtZNEgxNWxM?=
 =?utf-8?B?L0YzRVZXR3E2SDY3U3ByYWJJcjZVNWlyTGtEUlpOdm1uYVdtWS9rd3JqSFI3?=
 =?utf-8?B?VWFySVJlMC9pQzVOM2F4c1Y3ek1kbVBwWWhPVnI4bTFkOC84NUd0a2ZkR0Ey?=
 =?utf-8?B?MjREZ0xGNmYzcjhzL2pGMEducjlucGtnWG8wak92RTNmYVlQZy9IYVhlQXJ4?=
 =?utf-8?B?OThZWm8wZmI2d25rVGhjdVNvdFI4ZXVXUEQ5Vlpqdy9kN2RWMzVUckhSRFVJ?=
 =?utf-8?B?RXZ0K2xxS0VSVFBSTStTVHdRYzZ5eW5BRTZXRkRLZU9Rb3VFNzQxU095cFlq?=
 =?utf-8?B?Qm8zbVd5OG5rUlRVNVJCM0J4K0cyOHNiZVVxeGc3Z3MzZHdid1FiRWtDTEIy?=
 =?utf-8?B?bkZYdWJpcGdYTWxPakNYOUxEMVRTQTJHQnczT3hRM3czVVBvQ1MyRy90bTV0?=
 =?utf-8?B?V0hYWXJCRTdoRnlpUGhyNEZoUFBSNmdRcTZ0UGhZNit1NVR3aGdzTkJuTG11?=
 =?utf-8?B?UjI3WE9tVlJzQlB6ZVNpSXBvbkkvR3I0QTdZQnRoU2hqZWZnL0hJUkpzRzBN?=
 =?utf-8?B?ZHlqRThLN00rdEZtMDI2WDAycGN0anZRQktaMGZSZDNYWVkvbWdEVnBLc08r?=
 =?utf-8?B?b3N2YkJwVSt3eXhSTUN3UW9XSlBHT2ZGc1QzbmN3TWVOOVI2N2pySWhMMk9E?=
 =?utf-8?B?cWNOU1NWRWhseTdReWRpRmk3ODAyVlhBS3hlRndXbGdvZG04OUFGM0YxbUNa?=
 =?utf-8?B?Q3JNdE9Hd25rcFlRQXJGUk1TeHlqd1ZsZ1BtNUh6bFQvOXpEZ0lGbFRkMHRk?=
 =?utf-8?B?WUgxRkpDR2dHVENoYkJmSGtidkNPdUEwaEFBTXJCdHh4VTJBQkwwT3ZPQlhl?=
 =?utf-8?B?aGg0QlBla01KZUpqaDkva3Bha29XbjJ0UTVCcDE2cEQvVE95cExUU2FVbWgz?=
 =?utf-8?B?UnFMOUNkSGRweHVqeXJpVy84ellnMldybTB5OHk4TlZOSzY1YUk0NUpJeGVu?=
 =?utf-8?B?WUg1WEVERERUcXhLM1ZsRXFDd3cxWkFSckV6VGxVcFJkci9yNlFsaFJGRnZD?=
 =?utf-8?Q?qUG8YVVYC6gPP/ATBKgZhfctq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdafc8c9-2098-4821-8c12-08da8fd52065
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 06:57:56.1772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WeNcgvj58NauQhxyfvehaspnD7vrUN6ZIXxfnBdS3sQOEFHtVuIdgHbH8BFCTDFpUTg0reUFATtlLAXScbWqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4312

On 29.08.2022 13:57, Marek Marczykowski-Górecki wrote:
> On Mon, Aug 29, 2022 at 01:49:30PM +0200, Marek Marczykowski-Górecki wrote:
>> On Fri, Aug 26, 2022 at 04:20:52PM +0200, Jan Beulich wrote:
>>> On 26.08.2022 13:46, Marek Marczykowski-Górecki wrote:
>>>> On Thu, Aug 25, 2022 at 05:44:54PM +0200, Jan Beulich wrote:
>>>>> On 22.08.2022 17:27, Marek Marczykowski-Górecki wrote:
>>>>>> This allows configuring EHCI and XHCI consoles separately,
>>>>>> simultaneously.
>>>>>>
>>>>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> But was I maybe confused, and much less of a change would suffice? After
>>>>> all ...
>>>>>
>>>>>> --- a/xen/drivers/char/xhci-dbc.c
>>>>>> +++ b/xen/drivers/char/xhci-dbc.c
>>>>>> @@ -1058,9 +1058,9 @@ static struct xhci_dbc_ctx ctx __aligned(16);
>>>>>>  static uint8_t out_wrk_buf[DBC_WORK_RING_CAP];
>>>>>>  static struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
>>>>>>  
>>>>>> -static char __initdata opt_dbgp[30];
>>>>>> +static char __initdata opt_dbc[30];
>>>>>>  
>>>>>> -string_param("dbgp", opt_dbgp);
>>>>>> +string_param("dbc", opt_dbc);
>>>>>>  
>>>>>>  void __init xhci_dbc_uart_init(void)
>>>>>>  {
>>>>>> @@ -1068,25 +1068,25 @@ void __init xhci_dbc_uart_init(void)
>>>>>>      struct dbc *dbc = &uart->dbc;
>>>>>>      const char *e;
>>>>>>  
>>>>>> -    if ( strncmp(opt_dbgp, "xhci", 4) )
>>>>>> +    if ( strncmp(opt_dbc, "xhci", 4) )
>>>>>>          return;
>>>>>
>>>>> ... this already avoids mixing up who's going to parse what. So right
>>>>> now I think that ...
>>>>>
>>>>>> @@ -1102,7 +1102,7 @@ void __init xhci_dbc_uart_init(void)
>>>>>>      dbc->dbc_str = str_buf;
>>>>>>  
>>>>>>      if ( dbc_open(dbc) )
>>>>>> -        serial_register_uart(SERHND_DBGP, &dbc_uart_driver, &dbc_uart);
>>>>>> +        serial_register_uart(SERHND_DBC, &dbc_uart_driver, &dbc_uart);
>>>>>>  }
>>>>>
>>>>> ... this and other SERHND_* related changes are enough, and there's no
>>>>> need for a separate "dbc=" option.
>>>>
>>>> But then you wouldn't be able to configure "dbgp=ehci dbgp=xhci" as
>>>> one would override the other, no?
>>>
>>> Not as long as both use string_param(), true. They'd need to both become
>>> custom_param(), doing at least some basic parsing right away.
>>>
>>> But using two such options at the same time isn't of interest anyway
>>> without your multiple-serial-consoles change, so possibly not of
>>> immediate need (unless someone comes forward expressing interest and
>>> actually approving that change of yours).
>>
>> Then why change at all? Since you can configure only one (dbgp=ehci _or_
>> dbgp=xhci), then there is not ambiguity what "console=dbgp" means.
>> Separating SERHND_DBC from SERHND_DBGP would IMO make sense only if you
>> can actually use them both (even if not both for console, but for
>> example one for debugger).
> 
> Or do you mean to use custom_param() to actually make "dbgp=xhci
> dbgp=ehci" working?

Yes.

> But then IMO having "console=dbgp console=dbc" would
> be confusing, as "dbc" has no obvious relation to neither side of
> "dbgp=xhci".

Well, there was never any idea of using multiple serial consoles, so
the present "console=dbgp" doesn't provide room for telling apart the
two. Just like there's no way to tell apart two EHCI controllers'
debug ports both (intended to be) used at the same time.

JanMaybe use "console=xhci" then?
> 


