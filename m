Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C555A2942
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 16:21:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393910.633120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRaCh-0005c5-I2; Fri, 26 Aug 2022 14:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393910.633120; Fri, 26 Aug 2022 14:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRaCh-0005a0-EX; Fri, 26 Aug 2022 14:20:59 +0000
Received: by outflank-mailman (input) for mailman id 393910;
 Fri, 26 Aug 2022 14:20:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cVPj=Y6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oRaCf-0005Zu-JI
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 14:20:57 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00067.outbound.protection.outlook.com [40.107.0.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c8da630-254a-11ed-bd2e-47488cf2e6aa;
 Fri, 26 Aug 2022 16:20:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7247.eurprd04.prod.outlook.com (2603:10a6:800:1a2::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Fri, 26 Aug
 2022 14:20:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 14:20:54 +0000
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
X-Inumbo-ID: 4c8da630-254a-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnRp3NtBRD4wn1+sYDeTsqYws/LH8HwdwER27yTJqVmoj5mmg6dV/4k5qkp3gE/pMeqrdsHV6QJBinx2940BYq+yhsnrDeeXrq8st4M/F4dh4WPCXpuOK3cmYCKiTWjwgBp3m1x5IEgloUkw6ot7xBhcZ4tEm61eclN/hbXlEU6/hUPXQmjLZmu0W08UfXcTg8HOn+8QXVRaq2ekjUxA6Rl1lOtravYqG7b3IncH+uMCSBKSsQLfNftXWOM8vxZ9XgTQXldb2YYMOdQsoTzbLw91r36ZRCwgOIVU/KD5RRtfidzvkYvZKcIH8vSLw1T/YK6hgzbZV7L72wqVYKB06A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ih1Hv3IMS6Rbb5dYKNA+5UooZq3X83Pxpj6Zg7tMwaI=;
 b=MVDGOvYRhlY2vx8My1ZFoicTIJblbY6ey8jnEbWvjTPx+dwqa7sx8pxRezFVQsJ12Qd1zDYsjMTMOgVzPeD+kWdJUJqGJxxeG78ToIPrRzkW8b3mCvWPpURSPZK6NHrELao50fDdEMXAtJ6NuP0jLMub7aAuDhKKaTOgbRa+xnhncMuTURLA5l2docyfSnpjARBdJPhYqmLtJzkLDX0XG7YBgrXjGBQjaHsgRQ/LSpGf+wc93BjtMAjZZ0FbW7LHgYsFeoyYOyyNW6ooTsvuXZ6dADr0DzBITC2c+iN+QG2ClC6d2UBf+7JhPV1/LUlZW+RpiBdNw/TdlFEoRTTjRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ih1Hv3IMS6Rbb5dYKNA+5UooZq3X83Pxpj6Zg7tMwaI=;
 b=i2ZFXSe5mutilUH07RAs20zsmu9JxJmH3X2ZS4k8teearDD0RytOCqgAWlIMoT2XB3UvnUeDdt5LyFOMhEvP8ghgx1ylVQV4Dunt6MX03GMimASlULiF6TwlSQsxN5A/zGLmBY/y07Em0j4E58RzxppZnbpBArv+I27K7qPyfX3QD0hsVsCSYPzltK907eT+PwM/WWaK1/k2KSxymCGK8wV++2pP3/9ycycZTXtp7QZn/M5Iog0sAdryPepJuRBVXyFCAnoJHId8uSwm+dQ1gpF/o4XiLVrFOEuprvI7lVnk23OLNnrTl0O0R5IAGm7jmrFQGHMv0ib7RTdZ0H3wTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2fc50656-24bb-414f-4f39-3b23c4c3aa0f@suse.com>
Date: Fri, 26 Aug 2022 16:20:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YwiygukKUUqiAke9@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4f1e1ef-a0b2-4793-2bef-08da876e2fe6
X-MS-TrafficTypeDiagnostic: VE1PR04MB7247:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GeXRBZ86L21xnVW5SY8X5fUoyVNQB5tYpORhPqtFnAJuiwsdll0dhmGfBpAFlTnlllkRZ7pzUqM3drls7oNMcYh2KKMUAU16cp9++jV4vYZD2KYIKTSdVmpG5075Q3IADapVMHzjD5mQ5nVKnYtISAy1PTICZ4uAfuLZ8gHw9ua4/nbrEnUOySz5f7V8P9pQSWOnA3fYgZ9+9g4QmVePjmWHZcDvwvfxN/+fLfTAoITUER0XyWfawWOq6mMx4mgQeYf/XP8CZ6VRyE4M4HCD1MHjI60JM5poK7uO0RhC8sN15gEW4zH4zCqvTjbvNBCbj22e7Gt0qneG8tEfRh0e6rE9yczxkAnIdJkXW4y6Y89I4vh2VXFszfnT6VhIWLp6tW8/zCSOSdXKltrtFwEp7HqZVsZu/JBUGDKgW7jVC6Cx2XWcnAimKiymmDbmu6JFk89M8mPwETglaAh9q+XO1pEr53Euz/g1q4fO8h2Z/x2cydC6clgWOZQLWRd1FWsWpOzMgp4ePFa15K83pn44QBJzXLgY7WlLrqywqiShYHbwzx5lEicM4E0Zd1fYFaVmcUFMAyWz9BsHG3+LkUqsblIM4EGT7XYOJ1yp/OKZCJv5Xc4Hy2dP5z0hExFli8A1BNu8d0mLndLV4ldHO7aeDxsbWq4ppVM63IU96lGlAE0eDynCoiuXurYlAvgguW/W495bS25N5+LobcN9tRJKoCigZzmrHKR+6cF/Zv6ysqqNJCefbxEpNVcpdGQ5Rxy62ccS36/v/XGwmTQ6D3iEfhyu0PzqN3monjPyUsdzXfA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(136003)(346002)(366004)(396003)(2906002)(53546011)(6506007)(316002)(6512007)(26005)(54906003)(6916009)(86362001)(31696002)(4326008)(8676002)(6486002)(66946007)(66556008)(478600001)(41300700001)(66476007)(8936002)(5660300002)(31686004)(2616005)(186003)(38100700002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1RpenVBK1FpTktEZ1pxb2cxUHNuWUZGT1dsQlorVXZmZ1JuSWNDSCt4TWlu?=
 =?utf-8?B?cm8raXRmUHAvRmpDQk9ocTY0clhMcnZjenFjbkZLMm1kV0lEcUFJeEJWcmVw?=
 =?utf-8?B?MGhPZFR6OGI2NDNPai9JeXI0K3Z4akxlRjlTaE1LeXVNUDBxTkJQNmpsd1Fl?=
 =?utf-8?B?L0RDSFp1aHpncXIrR3QvdzdXZEEzYm9USUhIYld4THpQZDZUMkNkUDhzTk1Q?=
 =?utf-8?B?UlpuV2JnUmZPZGx3VXYrZU5BOTNCREFkbVVGc3BWSGJrQmNvMnNRbWU2MGF3?=
 =?utf-8?B?QkdOdW9GekdiSDY3OGZoMEo5SlBvVk4zTzRYNGpKcG9DSDMrYVZIVlNMVHc1?=
 =?utf-8?B?YWJoMjJRZWhxa210OVBpaVMrWnRLaFZDdWQ5YmVtc1dkcXppc2F3S0lVQmYy?=
 =?utf-8?B?TmdIVmd4Rnp6RDZKdm1yWWROVWs2bmxjTnJTR2dvemcxcE9TY3BpSlV0RnV3?=
 =?utf-8?B?bzRhVzdjLyszTmNlWDdISS92eHAvd2xTUVQrbW14a0grd3Y2N0VLc2U5VmJs?=
 =?utf-8?B?bGVnZVUwQnhEQTkwOVBMN1Y2ZGhrZ0RBWk5WNnFEMGF4SHFpNHNvVHBMR2JS?=
 =?utf-8?B?bzVxNFRFM01xYWZsTGRVTUNZd2wvdWJBaVYvZHY4RTU3aG8vU3lQVXEyc1BR?=
 =?utf-8?B?elhBekk2Wlc5VlgyOW5CY3AycVA5dDZpdUppTXBrNktJYTIyRTVOeExlMm1I?=
 =?utf-8?B?SnlVWFQwZ1FFNFJDNkluTVFoTHRzZUcybnZQYkFwNkdDQzIxczhRR0pHOWE1?=
 =?utf-8?B?QXFUUkxkZk9UMnhCbmI4c29peTkyVnJBTm5XbDVibkdPU2tvSnNZZWpiOEI0?=
 =?utf-8?B?aU9iaTVpTkh3NGUvZHVFbUhxMWI0bXZMcWJiYzVuMWNURUcxVzN6a1BvcTRX?=
 =?utf-8?B?d2pOTGF6Y1d4cUhMNWMrYjdBQ084UXl3NU1rd05pYzdkNnR2Ny9uSXhOMVAv?=
 =?utf-8?B?QjRpMm0vZTRNcUtkRi9jcmFmZlhFalZnMEhmVHl3TW5zYW1zelBHT3JxUjcr?=
 =?utf-8?B?aUJiNDA4RDhrRVlHQUxCbWtsaGwzRk1IVGw5OFJEMnFyc09ORU9xYjJiclVu?=
 =?utf-8?B?cHRsZGpiZ3g3dGVWTlp6aWsxVWV5VUQwRytGZ2hMZ3VGNWZ3Y2psU2JPdWlZ?=
 =?utf-8?B?Z3RJQ0dFdlN5aUlzWWpxZVVPU2xjL21XNlRPWHg4TU5ZSHgzU205eFc2Sndv?=
 =?utf-8?B?Tm1vZGhoaTU3M1hLVFMrNjJjbFB2TTRCblREMXdzVHBJTDFjUlVxTlpJNEpa?=
 =?utf-8?B?dGhiT3ZlY3BPQ1RrS0VvdW9rSmFkUkdOL2RXM1c0S3RLN1pBcXNQWnhmL09N?=
 =?utf-8?B?NEFrR3NzajlaL0UxZlBQdUV1UXUrY2xFeGl6RGs2YXlrTzRNU1dMRXV1MTgw?=
 =?utf-8?B?MExoNWZZV0hpSjJvcU82K1U4YU9tRXZNaldYa1k3eG8ydVViT21jQjB6OWVF?=
 =?utf-8?B?QWRTQzJ6VyszMGFwTjFzQ3BZT2NNMmVwemxndWU0d2pFakJOOERnQmtMNUp2?=
 =?utf-8?B?bjJqV2pmanBxM05sam5jKzdVb2pmWWNQR3JNWWRWcGVmcXNqdno5MWpxcDRp?=
 =?utf-8?B?ME5uODYrdFJvQ1h6YkJuYXYrbS94aFdmK3phNStmeTdCMTdyY2ZMSG5mV3Z1?=
 =?utf-8?B?cEZCRERIMXNwb3I4b0tMajdVZWVSNGp1a1VPVWhQZnlTcHdnUy9XNHdyWEJw?=
 =?utf-8?B?Rlkra1hKblJqYWtBVkVkbWdxWW5lR0xPWnErQk1QWmJEellJQTY3QldlK1k5?=
 =?utf-8?B?UkI1TktNVS9wRlZmbTVjL3NvMGlpV3hmLzFBNk0zWjRVWFJzbXVkY0EwSm85?=
 =?utf-8?B?WVFEWWtqekRaQklWdTlvYllIdC9lb0dtbUdkWU5Xbi93YldVRzVMOFdVdGJD?=
 =?utf-8?B?TDFJRHU3c0pNTWtUMDN6RmlXSFhPNGViM0Q3R2czcnF5eG9RR2IzMSs0UjFv?=
 =?utf-8?B?UVY5d2lVdkJzeHFac0JjcEYwb3pSTVNxbVhGVkI5Q20wazc1S0ZBZ2g2Rk1p?=
 =?utf-8?B?cWd2YVh4SUNyWi9WNFYvazIzemJCNWQ4akRDSVd6ZHRLUFRqQUlZTUkwQnNL?=
 =?utf-8?B?UERycnFvelRZcE42WGZoVG9JNkZpS2hmM3lmeHVJRXV2UXdzelZhWE9vNXYz?=
 =?utf-8?Q?Uwxh+69mLSCPtQJTRSJlMeCjA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f1e1ef-a0b2-4793-2bef-08da876e2fe6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 14:20:54.7518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuju1GZ8u5lrNe6nEjXNXO2xgIG8jY2G0jNOiNhz7uUv8BBsT1JCj/SMVnS1MdewQVbf67BszzvrOrSM0nbF2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7247

On 26.08.2022 13:46, Marek Marczykowski-Górecki wrote:
> On Thu, Aug 25, 2022 at 05:44:54PM +0200, Jan Beulich wrote:
>> On 22.08.2022 17:27, Marek Marczykowski-Górecki wrote:
>>> This allows configuring EHCI and XHCI consoles separately,
>>> simultaneously.
>>>
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>
>> But was I maybe confused, and much less of a change would suffice? After
>> all ...
>>
>>> --- a/xen/drivers/char/xhci-dbc.c
>>> +++ b/xen/drivers/char/xhci-dbc.c
>>> @@ -1058,9 +1058,9 @@ static struct xhci_dbc_ctx ctx __aligned(16);
>>>  static uint8_t out_wrk_buf[DBC_WORK_RING_CAP];
>>>  static struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
>>>  
>>> -static char __initdata opt_dbgp[30];
>>> +static char __initdata opt_dbc[30];
>>>  
>>> -string_param("dbgp", opt_dbgp);
>>> +string_param("dbc", opt_dbc);
>>>  
>>>  void __init xhci_dbc_uart_init(void)
>>>  {
>>> @@ -1068,25 +1068,25 @@ void __init xhci_dbc_uart_init(void)
>>>      struct dbc *dbc = &uart->dbc;
>>>      const char *e;
>>>  
>>> -    if ( strncmp(opt_dbgp, "xhci", 4) )
>>> +    if ( strncmp(opt_dbc, "xhci", 4) )
>>>          return;
>>
>> ... this already avoids mixing up who's going to parse what. So right
>> now I think that ...
>>
>>> @@ -1102,7 +1102,7 @@ void __init xhci_dbc_uart_init(void)
>>>      dbc->dbc_str = str_buf;
>>>  
>>>      if ( dbc_open(dbc) )
>>> -        serial_register_uart(SERHND_DBGP, &dbc_uart_driver, &dbc_uart);
>>> +        serial_register_uart(SERHND_DBC, &dbc_uart_driver, &dbc_uart);
>>>  }
>>
>> ... this and other SERHND_* related changes are enough, and there's no
>> need for a separate "dbc=" option.
> 
> But then you wouldn't be able to configure "dbgp=ehci dbgp=xhci" as
> one would override the other, no?

Not as long as both use string_param(), true. They'd need to both become
custom_param(), doing at least some basic parsing right away.

But using two such options at the same time isn't of interest anyway
without your multiple-serial-consoles change, so possibly not of
immediate need (unless someone comes forward expressing interest and
actually approving that change of yours).

Jan

