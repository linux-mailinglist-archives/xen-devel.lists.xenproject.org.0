Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D273671EAF
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 14:58:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480669.745178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI8xg-0002Ak-8s; Wed, 18 Jan 2023 13:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480669.745178; Wed, 18 Jan 2023 13:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI8xg-00027K-4g; Wed, 18 Jan 2023 13:58:44 +0000
Received: by outflank-mailman (input) for mailman id 480669;
 Wed, 18 Jan 2023 13:58:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pI8xe-00027D-In
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 13:58:42 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2057.outbound.protection.outlook.com [40.107.249.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 361eecdd-9738-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 14:58:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7705.eurprd04.prod.outlook.com (2603:10a6:10:209::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 13:58:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 13:58:37 +0000
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
X-Inumbo-ID: 361eecdd-9738-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aS0M4zuE0IXIMUe7TcJ92ZaHjft3Cdr8xGw1SAY03kxtSahQB7HaTLXpG2fjcdHsP/DsaaAS9f6WhxPnrD4xQgiIkW+v2coQjGPpQmu3E5cm1yrYNHVpxZ+LFiJUXXYK2qI2xfwvKwbdiUH4ABhQUpCO5t5TOWO0ZCD9HXszl9bwATBxuYhq/w9vKWb5wJzoTftezHd3rYoW7T6ezweNwwVzaOIobZtM2DfA/lHBDUPG0jtaVcG5pNt6hvn2FA2tTcFJrs60u2qE5XZjwGu5Y5TcoFqhanoFmfafZ5Du1Oi0rGZGT3gVXquo9T+QJZDlTd3azvnjBlWnIgvap4K1yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mr6UfkVN3I1idI4ytBUlhTafyZNbimWDvWu0RmX+Ix8=;
 b=DK/J6XU4PGvvSY1rXachhXw3a9oOkSKNNqvNI1D/6OR8wwJHrfy5OncPmGTNel+BIC3a9bHbY3LAFTbmKkQ3T4kVjMFP3kIGkp4dN8uFtUzuloZLEdjdKbmCrZFRN7eOwONoycl96zeOchINq6ehcWOJ80+zVBfPxafSQRSZX4oertCHBWVeKUSsUa9hhEpfci5GCFPj15JccW95CiDtN9/vdRv/E/PzP5I91l5XxDSbtmwtd1s38TX/nUjVcIzj1xPQVEubNsUhYLA8nBINSsKuUwgg5/s+WSzP7MqSEK8N+4ehqrkFXPuDtRUieagy/8EVrDFKYA+eAqxoW+uH7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mr6UfkVN3I1idI4ytBUlhTafyZNbimWDvWu0RmX+Ix8=;
 b=P60yBlFyoDCFdiIYkCvrFW4AvljWuOEvFz6b98js0uj1I5DiCDocDezrFzzm+sOgWL+9w7LGn3GkNgu8UfVaN+iAKUdAQyRwCYkkquUOBtHjxCuGbUXsgwemYWIQ90fSgIDf1VnLY3UR3JvIzoxW9yTEV36aZGzOioM3g3+sMj5vJ7QmXauvmqYj+Fp05jTN2IUCYpgYDpd7hoJKTH8BKRivF8i3Phm+iwthdlCqVPruJnEfRkmM48nQZXmiwUU8PB3MpDj2BOEuxpf4c2oB8egaG9ykf1336dlnrnqPbpPvZmPth8MUdfV5abfOLtX9/tJyfmCxuFUtcs6f4iKYJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <60628f62-c9fd-c29b-5c08-f3f746201f01@suse.com>
Date: Wed, 18 Jan 2023 14:58:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for
 address/size
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Ayan Kumar Halder <ayankuma@amd.com>, sstabellini@kernel.org,
 stefano.stabellini@amd.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, julien@xen.org,
 Wei Xu <xuwei5@hisilicon.com>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-6-ayan.kumar.halder@amd.com>
 <926307d3-a354-be87-3885-90681dc5ae24@suse.com>
 <37719b71-8405-eefd-3bf5-95c7c8639e82@amd.com>
 <7e9db781-47a8-719a-d9b1-88de9c503732@suse.com>
 <CA+zSX=a4hfFKGJfTM5BDenRo=T3kvEbkGhRs=7oh4GgOxDk0+Q@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CA+zSX=a4hfFKGJfTM5BDenRo=T3kvEbkGhRs=7oh4GgOxDk0+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c83d02a-4cdf-4fae-1624-08daf95c18c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dt2HhvFMhMDBDQeBd9/JIZ6Fbhd3npCk73JxNWKPqlYTrsvipzXTSFzGuW6+sPrC6XC5+5rC1GHbB8qiJKGiS9gIDNbiEVFg4T2rz+see37O/P4uFmfJVaHvIQFo6CCG6HX2PTR0WhBCepZcv1TGokxwhXmgKue+TBVFyw1Dk5uzE/Nfhi7epW3t4iJsXYhdUwK7eV6b8LxjIkcvlI4SwXO8nyoxV4rvx3kE2jd7IRhYMekZF4GD9D9F9s610prPlYDOojZuJCNmsniv7KjlrN/W6g13MWcERb+wT7aYXsOSmsFTKKVPEo6mITF1DpEKRiqKAQTYAwqMpDXMtjPj3onf3Dxryv6RZieQWfHOIDbv7cCbJjdSY8bGNHc4txoV+RErm2OR86NQqfdz3prsZ4za+gRStkuaVACsU48NKolurZK9F3kE0jTPHKCRa4HRm/fTANwbid+odS/yKamkPxBv0ur4mO4bEqtkeUAAYsKMFrMnAGhqj5iAGZpZ62LulnA9809jDYf9dT0CPgRYW+FDvwE+jDmXdhN83tFpmTdkXyvS1tfWZD0LOYZ3ZMoPnN6OoABUWk+1wXPo+fYfJcj8OQoKdoLgysBa+ClteGXdTsO71aw+jCoLZsC3ymFzAa9qijXLsy/9dn6fP32e1OUgEHOfyCtFebzBqvVGJnJl++iMO3OrElQ5+de8vBHYWIBDCVQCwGDe8Ahh6O/bzv4JnMJ2uivSi+byLO9gWA0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(39860400002)(366004)(136003)(376002)(451199015)(38100700002)(31696002)(66476007)(86362001)(5660300002)(8936002)(7416002)(2906002)(66946007)(66556008)(4326008)(8676002)(6916009)(41300700001)(2616005)(26005)(186003)(6512007)(83380400001)(53546011)(316002)(54906003)(6666004)(6506007)(6486002)(478600001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0ZKM2NTaXc3YldVRS9Ka0F3T0tJMXJBQ3RUSDVqYi8wQ0hjZ2tpdzlNWFRp?=
 =?utf-8?B?Z0JWZkNuVndTZHVsNmJsZXVoTzNueEZaWmNWYXVNNkNvVU9CRG16N1dRV1Nm?=
 =?utf-8?B?SXpDaHZ1aktvSGM0Q21ESzB2WWRFbUZidFN4YW85K2tuYXRPeExNbGorcnpD?=
 =?utf-8?B?bklrei9IRldXdFRFa2RzK0dmWDJTUllmMlZTYzZrWVJqY0pHSzlaU3dXbWNG?=
 =?utf-8?B?V2l2aDF3M050RkFiYis0RGNtUHduVFVhWWFmNi84NHp6KzFYRlRMNExJWWQ2?=
 =?utf-8?B?WkxkaE5mY01CL25pNzZyZEhGTFdHQ2VvMW9DTjVWWjh5VVhsQ3kxZTBFdzlS?=
 =?utf-8?B?NHFoWEJmRHV5cmVmcVd1cWJHZzNJdjdiMW5wd1dPT29ENHR6c1hma3cwVGlq?=
 =?utf-8?B?ZFBiaDFaQUttQnhhSERqeUdqWFFBL1o1a0l1S2UwbDBmSEp5NXlaUXVQbVpU?=
 =?utf-8?B?akEvdUdsL2N5SVFqaStaQ1U3THlUMzU3bGFzNmYxUUNzbGV2TnQva3FSaURF?=
 =?utf-8?B?eE14N3FveDc1Q2cvZXZtWTU1WTU5MDlpS2RGMERSZktmSEdoQ1d6Vmo5Tnc2?=
 =?utf-8?B?bDgwaUdwcVRqN3hZTjd1QURQZUdzWXlpRUs3YlN0ZWJJNG9xRU1EVmN4STVu?=
 =?utf-8?B?WXBiUlVFOVVOV3pmY2VzOUhJU29yNHMzSEI5eEJBTXZZdVBvN3FJa0w1dG81?=
 =?utf-8?B?Y0lTcTBUZGdFWlltYldBZ3lTR3V6NGMrYktvQTFPVUJRVUE4UjRTRFJtd3dC?=
 =?utf-8?B?QjFpWlhnc2JJT1ZPczZ1dCtleHV2SlRvM1NQeE1WejdVNHhCc24xUksybTdr?=
 =?utf-8?B?bVlxODYyYkVGYU9IRDdaUWtwMERNV0xLRjU2VndLM0RPdjdWSHFGOTNMT3Ra?=
 =?utf-8?B?L2xXdTRJcWY4NEhCK0cwV08xNlFhYmVyVjlZV05uc29LcGVHczJNUVhEYS9u?=
 =?utf-8?B?T1hyMmtaQzNHbGdGZ09UYkRyMUpoR3dOQUxEdFRFdFBmUmYvNVNwbVljM21i?=
 =?utf-8?B?Y1RxZ0t1ZlRVMHkvVXFiK1BPQ01yR1RpK1pnQzhyK2laMTVJUmFNQ2Zza3JZ?=
 =?utf-8?B?OEI2L1pVSFpoN2VQcGRHbkU1RmZZb1dvQlAyd3JQbHFNZDB6RnBFV29EcDd2?=
 =?utf-8?B?djRYT2dCZmgrdHJGMllaYUxlazhjT1BJTzh3MVFHRXp3U2R5S1N3bVRVdTJu?=
 =?utf-8?B?clNGM0daOCt2dm52aVlJVWh3blFRenRoN3p0UkNRMEpiczZkRU5wVUE0aWlv?=
 =?utf-8?B?bGJoTWFUU28yVWZKY1g0R25BMzZvNW1VUUlKeUJuRFNVVk9CSERlQyt5aTR5?=
 =?utf-8?B?VmV3SzdiNHAwemJJTWQwYUVXTGZXYUpiUi9ZRXVVS1h1SkdKWGdZUUhZTTJ4?=
 =?utf-8?B?TlorL1lQeDNOMy9HUDZ6Z2c4ZEUwbjkzVXlPc2hQNTF2OHVzMUYxYjBwY2J6?=
 =?utf-8?B?Wmx3WmU0aEtsekJyb1RnVTdtSVdNZXNTcXhHMzZxYmF1WDMrUTZURm5uOUly?=
 =?utf-8?B?TkpQSm8wNm9WdXUzUGNDNHRYcE10LzdVb29ZWjVuUFBSaWM2cWQ4K3NmVDh5?=
 =?utf-8?B?S1ZxT2ZJZ3Z0ZmdieDBOMkNKSEZvS0N0SWY3Sm9Tb3FQL2Z6OFNQVUVTYnlq?=
 =?utf-8?B?c2FGeWJBdWQxdkhiSG1WcHppL21SYS9ZZjF5VzByVVFRNkc0Ui91YUFQV3pT?=
 =?utf-8?B?cUkzK0ZIUDNDOHJRTEVaelMwRmJoa0YvMWR0S3pCKzMwRTFNeXYwTVE0d1VP?=
 =?utf-8?B?UVZBNkxLc3BIeUhYbmxXaWpmckRjQkoxUmxTSEdhWXBodUZJQU9GRlppSlVh?=
 =?utf-8?B?VkU1VG9HdWRUT2JyWFJncWkxUlpPa3lNWFY3K3d6Ky8zenFFVHN6dURLL1dz?=
 =?utf-8?B?a0xiZlROOHVhQisybUF1cVBnOTNKYlJRUjhwREl2V21iaVBFNnZDancwQ3Qx?=
 =?utf-8?B?TVZscXRFWmRWVFRSNmtRejNpcnVyRVBSRWVNaUhrM25rNkNmNmMyZnJFMUdk?=
 =?utf-8?B?RCtFU0l1ZFN6QklwTktUdjliY1JDWFlKVFl6TFRVbG16WHFmMnpWNlltMStB?=
 =?utf-8?B?THR6YVo4WUlXN0N0TU5vb2VpaFJWQ2hBRSs4d0RZeXVzcXNncUM2RnZ6eUVq?=
 =?utf-8?Q?8RMDAul2XFZjBQLRYHFHPKp4R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c83d02a-4cdf-4fae-1624-08daf95c18c9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 13:58:37.6047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEkCbZDP+tPpwWPkHWbU3HhdSrCzJWRvIWXH1k1SJZkFTAENftFfOyn5EJMo0oTjrn3issPnAOApCBrmKdBoRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7705

On 18.01.2023 14:34, George Dunlap wrote:
> On Wed, Jan 18, 2023 at 1:15 PM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 18.01.2023 12:15, Ayan Kumar Halder wrote:
>>> On 18/01/2023 08:40, Jan Beulich wrote:
>>>> On 17.01.2023 18:43, Ayan Kumar Halder wrote:
>>>>> @@ -1166,7 +1166,7 @@ static const struct ns16550_config __initconst
>> uart_config[] =
>>>>>   static int __init
>>>>>   pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int
>> idx)
>>>>>   {
>>>>> -    u64 orig_base = uart->io_base;
>>>>> +    paddr_t orig_base = uart->io_base;
>>>>>       unsigned int b, d, f, nextf, i;
>>>>>
>>>>>       /* NB. Start at bus 1 to avoid AMT: a plug-in card cannot be on
>> bus 0. */
>>>>> @@ -1259,7 +1259,7 @@ pci_uart_config(struct ns16550 *uart, bool_t
>> skip_amt, unsigned int idx)
>>>>>                       else
>>>>>                           size = len & PCI_BASE_ADDRESS_MEM_MASK;
>>>>>
>>>>> -                    uart->io_base = ((u64)bar_64 << 32) |
>>>>> +                    uart->io_base = (paddr_t) ((u64)bar_64 << 32) |
>>>>>                                       (bar &
>> PCI_BASE_ADDRESS_MEM_MASK);
>>>>>                   }
>>>> This looks wrong to me: You shouldn't blindly truncate to 32 bits. You
>> need
>>>> to refuse acting on 64-bit BARs with the upper address bits non-zero.
>>>
>>> Yes, I was treating this like others (where Xen does not detect for
>>> truncation while getting the address/size from device-tree and
>>> typecasting it to paddr_t).
>>>
>>> However in this case, as Xen is reading from PCI registers, so it needs
>>> to check for truncation.
>>>
>>> I think the following change should do good.
>>>
>>> @@ -1180,6 +1180,7 @@ pci_uart_config(struct ns16550 *uart, bool_t
>>> skip_amt, unsigned int idx)
>>>                   unsigned int bar_idx = 0, port_idx = idx;
>>>                   uint32_t bar, bar_64 = 0, len, len_64;
>>>                   u64 size = 0;
>>> +                uint64_t io_base = 0;
>>>                   const struct ns16550_config_param *param = uart_param;
>>>
>>>                   nextf = (f || (pci_conf_read16(PCI_SBDF(0, b, d, f),
>>> @@ -1260,8 +1261,11 @@ pci_uart_config(struct ns16550 *uart, bool_t
>>> skip_amt, unsigned int idx)
>>>                       else
>>>                           size = len & PCI_BASE_ADDRESS_MEM_MASK;
>>>
>>> -                    uart->io_base = (paddr_t) ((u64)bar_64 << 32) |
>>> +                    io_base = ((u64)bar_64 << 32) |
>>>                                       (bar & PCI_BASE_ADDRESS_MEM_MASK);
>>> +
>>> +                    uart->io_base = (paddr_t) io_base;
>>> +                    ASSERT(uart->io_base == io_base); /* Detect
>>> truncation */
>>>                   }
>>>                   /* IO based */
>>>                   else if ( !param->mmio && (bar &
>>> PCI_BASE_ADDRESS_SPACE_IO) )
>>
>> An assertion can only ever check assumption on behavior elsewhere in Xen.
>> Anything external needs handling properly, including in non-debug builds.
>>
> 
> Except in this case, it's detecting the result of the compiler cast just
> above it, isn't it?

Not really, no - it checks whether there was truncation, but the
absence (or presence) thereof is still a property of the underlying
system, not one in Xen.

>  In which case it seems like it should be a BUILD_BUG_ON() of some sort.

Such a check would then be to make sure paddr_t == uint64_t, which is
precisely an equivalence Ayan wants to do away with.

Jan

