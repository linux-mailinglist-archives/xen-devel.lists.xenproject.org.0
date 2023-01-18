Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D6E671D3A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 14:15:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480586.745071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI8HC-00012e-DL; Wed, 18 Jan 2023 13:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480586.745071; Wed, 18 Jan 2023 13:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI8HC-00010J-Ad; Wed, 18 Jan 2023 13:14:50 +0000
Received: by outflank-mailman (input) for mailman id 480586;
 Wed, 18 Jan 2023 13:14:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pI8HB-00010A-0W
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 13:14:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14fd77be-9732-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 14:14:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7636.eurprd04.prod.outlook.com (2603:10a6:20b:281::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 13:14:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 13:14:46 +0000
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
X-Inumbo-ID: 14fd77be-9732-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9e00bRb88tkBqgLb4acyZ5tJaDU4jcflFNgjlBLrgvHObsdwW7Emnyj1T7qIsU46OHVgKpIyHy3M5LWKSXKouhfTL3lt83drYMo93ouO59ss0wPvIawXMaD2FTzWoHPA/XvmrIjuUoZEB7lGqoedvV21Z/7pUk6arR0cBIhvhd523eK+8evuIOgjQvdBLE1l4Kh69nGhIPraLqR1FA7FRv6KeWZ0G2N7vvqg2LdF3/o7pRX4ZpRlmR8BK527d8tWK7pFarLgGNkMJ3+H7bO0mmEYk16cCwjcm2whNDRy8N4BYtZ5EeszFG3pZ2Dh1UCgEu9MVSDH+4t3nUz4JhlJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLMuFkohfoCPA1PVGHdQfGTUydHqr8+a0AwiOObn1xU=;
 b=n3r14XZ6l97fmaZKn1fUJrfWkfRxJgZ6vOav4jevSUHbGVT9NDN5B6MlSye3AU32LL1oowMT9rqGT22jBSMQ5LgOR3AY+ANUMWoYIhiwc0g6r4//4gb+732I9TggTu3GGm31cmCxk676qm0/NaxJBV17el4WtyyQ58lURIViDSdubkqHryGGQnzfG6XhFkW1JBvpCBGnM+78/Ffw7OXxqv2VMfG/GnlBCzgDTzQIGah/NOqDzRtDUfufFlSTb6PDULQXEC6QPdEbsRKSWKUO+9DxvPTU/TuqLn8oqX+ZFVoXfM3DJeGFSaLx+be0kLB8x8lng4USzHlQJSaUQD4PJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLMuFkohfoCPA1PVGHdQfGTUydHqr8+a0AwiOObn1xU=;
 b=ypn1+JcTRSZv4iXJLQZwaHdEsB5MFT1FZAlLDMIdA/G6owJUD04D/ltMcmABbWN0U/cDV/umYYoVeGzA55W+MlRnoxJb4gL//BKyrh7V5OX9Q6cSvMhQswzsmuqMJMrJYSBeop8PUIqVHVKoPFMI6M8OdItcOFDI+h/ieOB1fFOS6Xs16583ukP+nie4Z/mnKlk2Ij7oI+qQzHr1VAfUXuOcmu+mjYcxrVqCMswP6YUWHTJgalFvnMLbFU4KEm77+EW3otfj2Qx+Q6+5Z3gsAVdN+JCtqHtEosstWRscAFTBF9omBvW/sMsZBduEOXciewnk0wx5VV29UYeE6YaK+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e9db781-47a8-719a-d9b1-88de9c503732@suse.com>
Date: Wed, 18 Jan 2023 14:14:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for
 address/size
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, julien@xen.org,
 Wei Xu <xuwei5@hisilicon.com>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-6-ayan.kumar.halder@amd.com>
 <926307d3-a354-be87-3885-90681dc5ae24@suse.com>
 <37719b71-8405-eefd-3bf5-95c7c8639e82@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <37719b71-8405-eefd-3bf5-95c7c8639e82@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: a479e99b-1ebb-44da-b51e-08daf955f825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qsAf6WUAJ1+BvVpk3n38JG3zoMq2w7EfQ138LFp3POl8lB4t5AnfFlc553JbzN8ZM8TT6flyasnlYBWdkuyqsfsnk4u9bBebPVM7Aq7wDvbFYHd+/G9TZiDHZVxOpXl88yMWxCMOp91iV+d3+KlhEk4CWwgn+ULElm0Phyyuc4Krh5sYy4DzYq7x3ZIC851E1IoXptwTzqT/UJyNmw3Zg7OMUYw+2v67rQUWcjxjsOVNFyRA3dPtbw9IzQgnOLRscBpY0WzJySNQWF0fqZlkc7A5oOFpQuH5U/eI+2GULW6J+9QXVGBZEP37XtOy7XtqY8RY+nP2YYHZoNr4t0x7LbDafPnHhhqtGaoX54yfHfYMOwfERjI9afLSM6KTDOZ2ytc5HZJHKg2Aum0iTYQd6YIZS0MONApFy2ed/iNBUUwtit0s0NWryHhofnsw2ZC82Ruo1Rg7ue46q7Mtmkkyu/I0C9MbsotSl2LBLCjAqJQrtjOvDeDhlXN6gXk05OU28O8FIalJwPqFMlFVjomQIyafzUxkKyyk+yUbmHOK5DbGvZvGpddwjMakkmbwQgf2NdX9zJj6O60uOudh0b3Y/5fldW+5VHqOo8FGauranTLqjhJwnVBTxwaz3gU9HIfgY6OSK7P38oXywzEWjRXANbV9CqvwRpl9sRtNxnoL/gDfMo160DCITWN8YMoLzlvJ0X+fgaWkz4/iFN60QiA0MIBN/1W6CM56Lwzgk2CnjJA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39860400002)(396003)(366004)(346002)(451199015)(83380400001)(8936002)(5660300002)(41300700001)(7416002)(6916009)(4326008)(8676002)(66476007)(66946007)(31696002)(86362001)(2906002)(66556008)(36756003)(38100700002)(6486002)(2616005)(6506007)(478600001)(53546011)(186003)(6512007)(26005)(31686004)(316002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SytaVXFsQmZRdlVDWE5IRjR4d09tWEkxQWkwV1AyWnorRTZ4UFZGMTFNNWVx?=
 =?utf-8?B?OEJ4dnd4TzVRRlVsOXhUYTk4SWFEUjZ4bitLcysxZHJEUFdTVEl2VWN0Mlpi?=
 =?utf-8?B?T25LNmxQU2FZdEkxMStwMVZPVHlqazBpRzZlRFVjTXlIMTZwNnVweW5YNis1?=
 =?utf-8?B?VGZsUEtXcEJMOU1IdDE0KzR2WDFLcERXWkNsYXJNME4yRnJIYjRTcnMybFlx?=
 =?utf-8?B?cFpNRWlhUEd5bHFndDlFYzhwdUdDRGFNdFpKdnVvZDJFaGtvRG8xb1RIc3Zu?=
 =?utf-8?B?RU1xam9vLzJFeVRoQ2dGbWNrY1FVcWh3cGoxNjJWUTFtak9EZmp4RURkcFND?=
 =?utf-8?B?RXFOS0QyMXBoamttN3kwbGNUVmQwYmJBMkxUNFBKaytjTzVyNFp4T1ZKelVV?=
 =?utf-8?B?ZVU5YUxsclUrdy9uUk5zVUJ4RlV3Wm4yc3RkRzg4L01Ob3MxeGxPTVFGLzlz?=
 =?utf-8?B?V29rV2hYaFRVRW1HaU96YzFxMHFOY1I2OTJNSHVLTTF5NXhTeTBOREFPOXpk?=
 =?utf-8?B?Qm4rREd2eCtKN3EyWUkvVWZqUUVCMkFXVWdZSkpBTVhaVXhwS3FJNnZXek1P?=
 =?utf-8?B?VFhpWThYRHlBTm03ekgxRzlKbEdIZStXcVN5MnFYaDc5NlNoRmNuRWpmcnZR?=
 =?utf-8?B?bEpVNEY2KzlobERjcUQyNG5MOUNtWjdEeVpub0lUNEZQbFYxbGdSdlRDUWFj?=
 =?utf-8?B?MC9QMkhQaGduZWk5dzVDdWpITnVJendtWnplQzJvR0Z0MTBWekVoT1NKWGxO?=
 =?utf-8?B?SG9FbFFTSGxHM25pVFhoTktpSGE3U0lVY250RkNvU3JVUkoyYUtrK1JEOWFJ?=
 =?utf-8?B?VUxiWEVTcGQvdXF5UFJ3N3R0aFlCNjN0UE1MZkdDeTRnWGEvNGk4OS9zeTIy?=
 =?utf-8?B?QnJ6K3ZpWmhZR0JYZkdMYXo4eHNaYTVwN0tlT0dWY1FMTzNEVUw3K2VMWUhK?=
 =?utf-8?B?OWhGK3FkYVlIVjE3bWpGWTN6S1hraFRaS05hZlo2Ky9WZ2x4UEFTQm1NWU8r?=
 =?utf-8?B?Y3Z5YTFZQ1Y1MkFyckViSXVucGxweEhHS0tWeU1zNnZSN3hwN3FrK0lsRmh3?=
 =?utf-8?B?K2g0bVVTZW0rUFVNMldJbS93NWp0dGFaNGVjZzdkQTdEWGRjVEp4LzZaZWt3?=
 =?utf-8?B?dlR0ZVdtQVJqWkZmRTdwVjIvR3c3c1lncDNGS1lLb1ZXOHpPTkk2Ry9MYjlF?=
 =?utf-8?B?ekgvYkNCNGJCcnZEdEYxUXdraGdnMVczQkxNMEF5bkkvMi9WUGtrbkxyMWJq?=
 =?utf-8?B?dUJWWVJ5VklnckxIZTJFSTYyc2pKSGRJeEd4VklZMVA2VVBieHVCMkpyeHFH?=
 =?utf-8?B?Z1UzNTBObjYxaXJreWg5Slg1d1VKT2wxNm1keis3RGp4NjZScEVBbHpHK3Uy?=
 =?utf-8?B?OXUwTWFDallYUzRnWlNwM1NZMTlHcUhyTVZrcWxWS3IyTEM2T3lLbXdUZGl6?=
 =?utf-8?B?cGRZSklPS2dqWXR0bUVLbU1mUFZqU09ycG5KaG5ZVVpJQSs2RlRUNjhud1Rx?=
 =?utf-8?B?ZmpidDFlbHl4dkx0Q0pUbmVxZVE0U2swU2xUUjRnZk5uT3VqQjJpWnAxaUoz?=
 =?utf-8?B?Tm0zbXFEcU5LdTNmcFkxVnRoNmtNei9OTTdCZWlJQjlpZHpncGppUlZkM292?=
 =?utf-8?B?QkIyVnBFUXQzdXZOTEYvL3RZWjU1RC9RUVlSMnNvYktIRWt1WHNPbXo3cTY1?=
 =?utf-8?B?d2pSbUlFYUwyeG9oclhDdkhiRDJ3ZXV6WHArYUVMME0wUVZRRzdvUkoxRGxS?=
 =?utf-8?B?VEgvcHVnYTc1Q04vTkRkVFB1akxRd2FYRmJWN0FqaHdudDJ2SFl3alhIN0tX?=
 =?utf-8?B?WGVjZ2FJOXdJUDQybkZFWEcyUWRxZWwxdnZyRUNGYjNJdEhrUlh6UjhQa0hX?=
 =?utf-8?B?eENpNEVxcWFtcC9aTkl5SUJzZGdqblZVM3FzVEtweUl2ajQ1OWRvVk55SUxl?=
 =?utf-8?B?em5pQWVMc2U1NkF0dU1ZOEV2azBjWHl2QTV1Ym5YVzVwSm55bjlEZHo4Z2Nv?=
 =?utf-8?B?SGxSbmpuMVpMdmViM05WekVwL1dYc2NLTHd6UW10N01TYllsTTlwanpFOXc2?=
 =?utf-8?B?U2xDcldRSlNLKzRwUVkyL0t5eDN4TU5YOEdWY2IwMTl2THpjU2J5bEpweFl0?=
 =?utf-8?Q?bYyotmVi5xOs2oCqvEfFfziAs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a479e99b-1ebb-44da-b51e-08daf955f825
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 13:14:45.9447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FonUejWi2Ew1TzR9UhbLHbj0SSWaWhy+Aa5s3dLGqIfuwQexApERye7+jo2niuWdwscmW6j4W5sNghx5nkghig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7636

On 18.01.2023 12:15, Ayan Kumar Halder wrote:
> On 18/01/2023 08:40, Jan Beulich wrote:
>> On 17.01.2023 18:43, Ayan Kumar Halder wrote:
>>> @@ -1166,7 +1166,7 @@ static const struct ns16550_config __initconst uart_config[] =
>>>   static int __init
>>>   pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>>>   {
>>> -    u64 orig_base = uart->io_base;
>>> +    paddr_t orig_base = uart->io_base;
>>>       unsigned int b, d, f, nextf, i;
>>>   
>>>       /* NB. Start at bus 1 to avoid AMT: a plug-in card cannot be on bus 0. */
>>> @@ -1259,7 +1259,7 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>>>                       else
>>>                           size = len & PCI_BASE_ADDRESS_MEM_MASK;
>>>   
>>> -                    uart->io_base = ((u64)bar_64 << 32) |
>>> +                    uart->io_base = (paddr_t) ((u64)bar_64 << 32) |
>>>                                       (bar & PCI_BASE_ADDRESS_MEM_MASK);
>>>                   }
>> This looks wrong to me: You shouldn't blindly truncate to 32 bits. You need
>> to refuse acting on 64-bit BARs with the upper address bits non-zero.
> 
> Yes, I was treating this like others (where Xen does not detect for 
> truncation while getting the address/size from device-tree and 
> typecasting it to paddr_t).
> 
> However in this case, as Xen is reading from PCI registers, so it needs 
> to check for truncation.
> 
> I think the following change should do good.
> 
> @@ -1180,6 +1180,7 @@ pci_uart_config(struct ns16550 *uart, bool_t 
> skip_amt, unsigned int idx)
>                   unsigned int bar_idx = 0, port_idx = idx;
>                   uint32_t bar, bar_64 = 0, len, len_64;
>                   u64 size = 0;
> +                uint64_t io_base = 0;
>                   const struct ns16550_config_param *param = uart_param;
> 
>                   nextf = (f || (pci_conf_read16(PCI_SBDF(0, b, d, f),
> @@ -1260,8 +1261,11 @@ pci_uart_config(struct ns16550 *uart, bool_t 
> skip_amt, unsigned int idx)
>                       else
>                           size = len & PCI_BASE_ADDRESS_MEM_MASK;
> 
> -                    uart->io_base = (paddr_t) ((u64)bar_64 << 32) |
> +                    io_base = ((u64)bar_64 << 32) |
>                                       (bar & PCI_BASE_ADDRESS_MEM_MASK);
> +
> +                    uart->io_base = (paddr_t) io_base;
> +                    ASSERT(uart->io_base == io_base); /* Detect 
> truncation */
>                   }
>                   /* IO based */
>                   else if ( !param->mmio && (bar & 
> PCI_BASE_ADDRESS_SPACE_IO) )

An assertion can only ever check assumption on behavior elsewhere in Xen.
Anything external needs handling properly, including in non-debug builds.

Jan

