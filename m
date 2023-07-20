Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9E775A685
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 08:32:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566338.885050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMND2-0007T4-Fb; Thu, 20 Jul 2023 06:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566338.885050; Thu, 20 Jul 2023 06:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMND2-0007R1-Ch; Thu, 20 Jul 2023 06:32:20 +0000
Received: by outflank-mailman (input) for mailman id 566338;
 Thu, 20 Jul 2023 06:32:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMND1-0007Qv-0A
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 06:32:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bd6a6c3-26c7-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 08:32:17 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8392.eurprd04.prod.outlook.com (2603:10a6:102:1c5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 06:32:15 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 06:32:14 +0000
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
X-Inumbo-ID: 2bd6a6c3-26c7-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e93HzS+mEEZj0k7tFoD+ijA6gv5hqIvEkd6sJlW04lf546/pMvOtKmcA83JkuG/klvJB18glQkk+aI4Vu3T5F1AxFeuwYjRj900J/L3aHqu/NarfNArMBhpbdJkzpAt75lIXtJlom25byUf/eaMHxb0rl8+g9uZkxKknVpgryzqZ2W6no7DHjo3WPRvj+NudRMRgg1U9SGrmtEYqkgavEIsnpaJb01uCJTYSoKUXw7RBgIwUfQvmDLMzx92AzljDUWvVtQf3ChHrMifEEnQxZLg+mt2shV37a9h2sBrV4f0De0IrkcDWGNfLGwkBKaHo+MoeV8b38a8NyLxeofY19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QrQlmWNReCfKkSixbiF3LTUVtYE7p21S9RunLoKOpE=;
 b=a3UzlQrKoWF2mwPJYpSNuuVIx0ZXgVOanUuPuGzrmTsA4gkzQ1Ya7zWNXduHAQd/Cq4RG/pvSIm+g9Vh3DVX4xz6A0SJfx9XF9Rg2W3SPBJC/2HuODut1VmxKQ5d1yLeb9j+DA7szLfGKQYs5KGRkTpckm/VU6efM0ocpBgzgD0oVlRX8WVg2W11Y8zZNeX1lRuYNraNLR6var/+2fNvwjRiTLOMCa8rCVGT9HDeij6yeWJNOGkKf7CJl93zQcUAv7Ck/KPcX86e6GD5Kq70sSNf0fZROpnGMOG82VvNFZCFOIBmsxUCNbBK4bquToVdkb2qxFeM4v00zS3GbKaiJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QrQlmWNReCfKkSixbiF3LTUVtYE7p21S9RunLoKOpE=;
 b=a5blqF8hLMZmwNgawn9DOCvLdI+e1wf3ztCqKtjAEuHByX8ONXN5NuP4oUPk2nMcDqCLY4YCVfZD4nl9Pj9WWWqzyZxkhNGnERnVYyzHqZ8nnT8mDyg1fomDzYw3xfVPKdovqENx0voroNE2F0IOlkzK40ZsNCrhLLakMgOBNC5s9WNA+mdzj1nEjjHmzjObGKHohi6KwOT+HNueui22V25BbXsfNuOYTIXNlBT2P+zpFPqtFBRIiiR3CpxiYM0FYmO3YNvwExFKHAU3g8Mk3HOS7ppd/ejDl9u+b+8OnC+xbHQt5b2K8/Gyx7+45BN/e13rUI35jBfLoD2njjYujg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <898997ee-3a43-da37-9eb4-f78b34d9fb5b@suse.com>
Date: Thu, 20 Jul 2023 08:32:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/5] x86/ioapic: RTE modifications must use
 ioapic_write_entry
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230718124334.36548-1-roger.pau@citrix.com>
 <20230718124334.36548-3-roger.pau@citrix.com>
 <1bc67bb2-9b01-eb18-eb6a-741067a9b35c@suse.com>
 <ZLf_OJnYjyirT7Ee@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZLf_OJnYjyirT7Ee@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: 009bbd39-f91e-4550-0f66-08db88eb0eab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pva/wVMwz2XLkS7tqP70IrN2h8mya2F+XINcKfZW3uKY+II6/Kbt0GBEeWWLruEovTfuiT2nKAHcNhOQxnkYbVi14wG0KOYeIFIUZv8QxtYzD3MnbzpY3GTWODjcsT69nHfTzMSvZlyKE3zEMGtBwYVGef762PurDHpHFcLCGd/Lpdl3COkmI/kFpwcpj9TOv2Z3EolUPBiZdOOSuTiHxa/bjBi3kIGq4bZJvJ9BgIOl4oLm9lSSvKG1ypCEvP0AxXX7AQozMU515tCqoRv/HnX5BrwDui5UeetqCeObyC1x4XKBXrn17v6+mc60X61TA951DThCif3qg9kfNh7X9SZfkGzTmzW1kYydD3oPPARdky523rIlLL6S19c9pnIqXZfrDhgJF3fC6dMsfcQ9mJQ2j1OHVUuQVuH6Sw/t/YthigRsDwcrtfl75PpIx3orqxv2PB4JwNkGVvSIsi6tKTWKweWLJipwnaGbYfbnF4sFTtsFT/tre0QyzXg7l4OeYISW+jMaSWA1GF8p7nWJ18GF1bOQ/9WZ0/8k5zPPf3jyAPTKyLkeKZmKjWQ/M7ZWzxzSKBq3FF/77AzzRksfe9RFJB4LN5idPLtFkDe4DHNGfr+nh4iIHALWNlLhTKI7c/y7J8Hg+FRL1CeWcrb/Qg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199021)(6486002)(478600001)(54906003)(26005)(53546011)(186003)(6506007)(6512007)(2906002)(66946007)(66476007)(4326008)(5660300002)(8676002)(316002)(6916009)(8936002)(66556008)(38100700002)(41300700001)(86362001)(36756003)(83380400001)(2616005)(31696002)(31686004)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2dCdnovWTB2T3RtOFpPMVM5eVQwVTRGUEJSc2s1OEhXRVpiaXBRcTkrQ0hS?=
 =?utf-8?B?aGxiSUpNTzdTUGFpUUl1M2FCNjlRNXM3T1ZzY3JlNjBnV3cwSHo0NEw2WUhK?=
 =?utf-8?B?OElCYWtidEtIUERRN1FoTkpsbE5rZ1NtekU1OXR3MTYxTDA3UVU0TmVCVER1?=
 =?utf-8?B?R0VONWZkMkRWcUVDa1k3Tmp0blRrYkhPL2JMR0RLQUFjRnhmR0ZnZkgwNWVG?=
 =?utf-8?B?NzBiam5Fbk1XMks0MUtITWdxaTdxeENnVWwrMVd4UnNYMkUwZVpTRGhxSTh0?=
 =?utf-8?B?UzkyS1o3MTQxRFRRVVJEVjNzTTBXeVF3bHQ0MTBQS2ZJTUJMZHd4eDVWMG40?=
 =?utf-8?B?L1lybXU0TVh5TEdQNkZhMTRySWlybHRVc2krSWs0TEhnazNjYXZ3WDBOTWN0?=
 =?utf-8?B?MDZtYWRsOE5VNWJUYmQyNWlSUVhrQ05oRzRSK3A3NDZncnlSSGZKaWRFWTBa?=
 =?utf-8?B?MkxwWWcvZEF6SlpmazN0VjdyM25wOTdsTy80YlZZOGRCaXNRNkZpbVAzWjdS?=
 =?utf-8?B?Sk0rU2RNNXBoKzVjOS9QVWFIVSthR2UzTnlNU0lWVE1mT0NVVTRvTHZ3TWww?=
 =?utf-8?B?aE93c0tjaXFybFBOek1vV0g5VCtwelFJNVhVb2NCVk02UWZyeXBxdWxPMkQz?=
 =?utf-8?B?ZDVib0VBdk1zVyt2Q1lTVDNROFZQVWdLQlIzbVhjaW5sQk1JQzFiUGJKeE9Z?=
 =?utf-8?B?Z3dQUnY4Q0pEVDdpWXNUekpvNG9tMmNCZVRvNk1iTTYwK0RUdlV4SDl3Y29z?=
 =?utf-8?B?TWVheGlYT2NGUmVwVEFyeExnb1FnSXJKT1lhejFrWHpsaFNTaVEzU2VDQ2Vr?=
 =?utf-8?B?UFozVTZSQUVsOW5oUTRoS1pnTTlIM3Nlclc4cTJsUHFrZjg2ZnRjNE9oVTk0?=
 =?utf-8?B?Y09vZmdUZWFBSEYrSmFNU1RjNDkrYjdSTFp3bjhEbkVFSU9RMVlzaXNWTEE0?=
 =?utf-8?B?TXZ5eEZMUWdTTVN5VHF4dmFCVjYybEZ3cHd4d2lGbkFNTVBOY0JFM2hzMkNB?=
 =?utf-8?B?U0dBYldVUytmcHFzc3piRTM2OHpDR09UVHRYMXNGS2hnOVZvMFpIdzFvM3Z6?=
 =?utf-8?B?bjYxa2E5UzBqS3VxNktjbHFXU3drUmxyMFUwdkNhNUFPUFVEbzZaUndYWjAw?=
 =?utf-8?B?c2xBNng1VFg4MW80RWlwcFdBRlBSS29UaGFPMWVscGQrTU9rT2FMaHEvYUE3?=
 =?utf-8?B?ZEc3a3d0NTRYOEh1ZitxNmtMdmttUUhUZXhPZW1yK0hRZUlUTmZYRDQyNEFG?=
 =?utf-8?B?QXNOUXYrVFdnRnhET3ZOQzNTK1JjNlpCYVFPRzlJT3YxOG45UUhjWUd3VUZh?=
 =?utf-8?B?MXVXQVdBb1IzR0tsUjVHNkVKWEVJV2lZNU5wbjhPdE1WaGpDUXdVSXh3LytD?=
 =?utf-8?B?SnF5TFNpS3MrUmdCY0hKV2JEN3R1YzRneU9oZWRPSGFJdmVsNHVzUFJITjZs?=
 =?utf-8?B?Y0NBclRqcVlzSlA5ZU9ERDdHTkplcWVZTWtzQkhQNy93cEJtNEl2Mk5ZUm44?=
 =?utf-8?B?MUw2R1J0ekE3eUIyYmZzekprTkpIZHdLTFdtRWZSSDUyUnI3eXJlRTRiS2hX?=
 =?utf-8?B?MXlXMHVDNEZIQVVOM0VZL2E4aXl1eUpnV0ZoN1EwYnkzWHMyWDgzc0F0R0NZ?=
 =?utf-8?B?MkdFZkxPSzFqY2wxdGNieVF4VWs1QWprcjhNenE3YWJOazVEQVUvSTFRUGF5?=
 =?utf-8?B?WG9Hb3cvdTFzWTZxMlRxQklSMXBmMHA4TGp1ZWlJUmtiSlUzTnVQMCtTZW8w?=
 =?utf-8?B?bUtRZXVWUWJheC9XTThpNkNjdDVmU2QybE1CZU1HOEZwYVRYamtiRUV0cDVD?=
 =?utf-8?B?Qm1YOVRqV1NrbFJzem9HMXZMbDhqeENoZWdYcmphTXFkWkxkRWZIQmlTVUFV?=
 =?utf-8?B?eEpaa0RnYnhZVWhEdGZEd3dmMkVCMFlnR1EwZTZJRXVOU2s2NTJkUzhvbk8r?=
 =?utf-8?B?TXRRdUo1TUkrUDFqSFFCN293bmFLQ1paUWJNNE5rd3lpTUdJZklOUEdDUEdv?=
 =?utf-8?B?bHdBdzROclBPeVhhQzh0WHlHcElkUHVEUUVvbHk2cUY3dzFVVjg2WVRremNO?=
 =?utf-8?B?Z3BJNVlhNFdmYmp0by9UK0dobTZJZ1VocnBza2lMQmpiRE9FazgwUEJ3SEJM?=
 =?utf-8?Q?qwo5Wjxvmqc6jHdS7FDrVZVmT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 009bbd39-f91e-4550-0f66-08db88eb0eab
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 06:32:14.9089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTV6h0eGLfhEr3cYN/HyBgO/6FFkOgPG8qoX28W/BObeISrjSrKiNwL90MAgjavyf8Cq4K+cLvskYmQrRgLa8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8392

On 19.07.2023 17:20, Roger Pau Monné wrote:
> On Tue, Jul 18, 2023 at 05:40:18PM +0200, Jan Beulich wrote:
>> On 18.07.2023 14:43, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/io_apic.c
>>> +++ b/xen/arch/x86/io_apic.c
>>> @@ -269,15 +269,15 @@ void __ioapic_write_entry(
>>>  {
>>>      union entry_union eu = { .entry = e };
>>>  
>>> -    if ( raw )
>>> +    if ( raw || !iommu_intremap )
>>>      {
>>>          __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
>>>          __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
>>>      }
>>>      else
>>>      {
>>> -        io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
>>> -        io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
>>> +        iommu_update_ire_from_apic(apic, 0x11 + 2 * pin, eu.w2);
>>> +        iommu_update_ire_from_apic(apic, 0x10 + 2 * pin, eu.w1);
>>>      }
>>>  }
>>
>> I think __ioapic_read_entry() wants updating similarly, so that both
>> remain consistent.
> 
> My plan was to deal with __ioapic_read_entry() separately, as I would
> also like to convert iommu_read_apic_from_ire() to get passed a pin
> instead of a register, but I could make your requested adjustment here
> for consistency with __ioapic_write_entry().

I would indeed prefer if you did, to avoid the functions going out of
sync.

>>> @@ -433,16 +433,17 @@ static void modify_IO_APIC_irq(unsigned int irq, unsigned int enable,
>>>                                 unsigned int disable)
>>>  {
>>>      struct irq_pin_list *entry = irq_2_pin + irq;
>>> -    unsigned int pin, reg;
>>>  
>>>      for (;;) {
>>> -        pin = entry->pin;
>>> +        unsigned int pin = entry->pin;
>>> +        struct IO_APIC_route_entry rte;
>>> +
>>>          if (pin == -1)
>>>              break;
>>> -        reg = io_apic_read(entry->apic, 0x10 + pin*2);
>>> -        reg &= ~disable;
>>> -        reg |= enable;
>>> -        io_apic_modify(entry->apic, 0x10 + pin*2, reg);
>>> +        rte = __ioapic_read_entry(entry->apic, pin, false);
>>> +        rte.raw &= ~(uint64_t)disable;
>>> +        rte.raw |= enable;
>>> +        __ioapic_write_entry(entry->apic, pin, false, rte);
>>
>> While this isn't going to happen overly often, ...
>>
>>> @@ -584,16 +585,16 @@ set_ioapic_affinity_irq(struct irq_desc *desc, const cpumask_t *mask)
>>>              dest = SET_APIC_LOGICAL_ID(dest);
>>>          entry = irq_2_pin + irq;
>>>          for (;;) {
>>> -            unsigned int data;
>>> +            struct IO_APIC_route_entry rte;
>>> +
>>>              pin = entry->pin;
>>>              if (pin == -1)
>>>                  break;
>>>  
>>> -            io_apic_write(entry->apic, 0x10 + 1 + pin*2, dest);
>>> -            data = io_apic_read(entry->apic, 0x10 + pin*2);
>>> -            data &= ~IO_APIC_REDIR_VECTOR_MASK;
>>> -            data |= MASK_INSR(desc->arch.vector, IO_APIC_REDIR_VECTOR_MASK);
>>> -            io_apic_modify(entry->apic, 0x10 + pin*2, data);
>>> +            rte = __ioapic_read_entry(entry->apic, pin, false);
>>> +            rte.dest.dest32 = dest;
>>> +            rte.vector = desc->arch.vector;
>>> +            __ioapic_write_entry(entry->apic, pin, false, rte);
>>
>> ... this makes me wonder whether there shouldn't be an
>> __ioapic_modify_entry() capable of suppressing one of the two
>> writes (but still being handed the full RTE).
> 
> We would then need the original RTE to be passed to
> __ioapic_modify_entry() in order for it to decide whether one of the
> accesses can be eliminated (as I don't think we want to read the RTE
> to check for differences, as we would then perform even more
> accesses).

I was actually thinking of a 2-bit hint that the caller would pass:
Low half unmodified and high half unmodified.

> This would only be relevant for systems without IOMMU IRTEs, as
> otherwise the IO-APIC RTE gets modified by the IOMMU handlers.

Initially yes. I think there's room there to avoid one half of the
write as well.

Jan

