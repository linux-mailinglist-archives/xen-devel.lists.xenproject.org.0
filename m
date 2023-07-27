Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CCB76542B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 14:39:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571087.894081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP0Gw-0000df-HF; Thu, 27 Jul 2023 12:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571087.894081; Thu, 27 Jul 2023 12:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP0Gw-0000ba-Dp; Thu, 27 Jul 2023 12:39:14 +0000
Received: by outflank-mailman (input) for mailman id 571087;
 Thu, 27 Jul 2023 12:39:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qP0Gv-0000bM-3p
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 12:39:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9539809a-2c7a-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 14:39:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8687.eurprd04.prod.outlook.com (2603:10a6:102:21e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Thu, 27 Jul
 2023 12:39:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 12:39:08 +0000
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
X-Inumbo-ID: 9539809a-2c7a-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bB7+SeppzjIyGokXlOA386uv8mrBWdRiNQoX00+VZJjMKDb3wi9VR1g/jHfIt7bb0AAA3jfcAiuzSa+2QA+YGoM/gtuEDBI9SF/y/2LAg5a8rq/e3Z6D0m7j8XjfKSF674vtRVZ4zMC74nYNQsH6/VNVFgiu7EXw42YO2jLExIeSzQk/pJmGrvQIkgT4h+RwN4Z+ncWtzuZCAOVsqGymShAVfAVb4iUE3VeBPIVtudpqZPSQm2xf0fT38UdtmBbdycCaMklvWpS0TiTBUNkyhMftoF3j6SGYU1ektjY3W3X57Dq23i8CZ6yLSBE2y+jlOd+EerLGtlMdoymf8AYYgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6mkdkdr4r5BVy0TMe2X1PQgvDzBaPJ1o0ejzkHUdZU=;
 b=n+a6cxz6er5XJsu2fJ28mSTwRktL+eQTkNERq9AKCn/7xLDPJuDrhi29QCqhoz0QMzzE7fbyoL8kqoz4B2wV5sIdY+jpa1YTTwFqxPCDcx0mt/yLJrdyUERyqsxXqxKFKFcM/5Qqw9PgYkapU/pH1Gq6JZ1gg0IenExDKKUqwV2j2PsdwavkGWOdr9mE1S3b0DHEQzxD8hd3bV2dV8xqKoL9NN0mWCVSfnsBBmp7kNFTzIckS5U9mSGM6Df9qXE5oWtvJFJZmMhxg3i7I/4Q8yP06WGbYD0rGqU2wFkWzYDZdVCzo97pF+yJrex5gIGTGCQcD+99ZbKEzQ/Q0prIrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6mkdkdr4r5BVy0TMe2X1PQgvDzBaPJ1o0ejzkHUdZU=;
 b=llegw4A8f9LmUoB04t5V4u5kmRsZ4Jl5gawSUR/oezEfTU3rzsr3GO/tihVGrtLgW28lB6kVZh0Ou1vjcF061paus/Xp7cAyykxUWrtoyKGODCt/h2j8v8y/UmfsCrnQj9SyGu4F1txVEl9Stmu4SvCGtFxUYgqS2kPQjOnlylCCTLFy3+ijy3S6+eMAKo1GkqEoQGFahAvCCiiLkRNA0E4dVlhFPcK8UcO9EXaYW0/3HDfhYrdKzu2v6fTyH7c4opAtYq/53tQ+OugncegxSTwUsIq9RLunwHd0DF4FcjZzUHvCYDq1+p5bLOXhEs5e2jQzdmNjBjGtxho4gTseVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4e9681c7-472e-ee6b-38e7-fc7fb28a2b07@suse.com>
Date: Thu, 27 Jul 2023 14:39:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/4] x86/iommu: pass full IO-APIC RTE for remapping
 table update
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230726125508.78704-1-roger.pau@citrix.com>
 <20230726125508.78704-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230726125508.78704-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: ff0a5b80-08ad-4987-92ee-08db8e9e7879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7H5KSAF4rLaCTl+ZmmRYvuAoPzKp2BiHhsAHoUsZEuw1Jf5F3tQxnFJXSa6D2SCP6NWcmop6B58jYaTf8Fv5k0714XvSKS0/nOt2MclFeD4+g9LPLCXMpQYiUF1txqZ+WcMZmyfatrgc5c+k0WBSAzpWgW6f3V+uSzMJeAeh5wHXG7BkcRWXbosI1jZaofzuQ4lQA156CQfn2XY9CwTdj9SPOvfTcmxFCgZnYl+kWM/6+Onk+v52BuCoLPF21yLrEPH31H7RYq9lwdy4lFoS5MIhngERMh1ycyI0yY1EXRVCceAMt2dBPDCfwkef0k86rBpY++SDri2D5H9l5fp76tA4YaSwphky5e4DEnUaT4rn47AYo0iN/crRfV29UiqGpKwtSvZ5uxTTL74tp0nGi1AqGwz2mjM7UqpklQdddHsj0S8tVvIc3Kxc+Jpuu8Q7NdvJ/RZ5SBOJuoeCr++sJyUfsoISi8bEa91Ns1mSkXxS0yixXO0LCct4kRcSeqesusgVhyb79Sms5l5YdixUpPI5vnqPmLNgtGA8bBR0H8CyiJMTV4XeFaP598u8A1JK2io2zb6K4gwUNHYKKOkkoEnIJVS1r8ZQNgIYDpkV6rBSyJy6366HcLjFMdc4xubzSp+K8zsKvFq1PF9ClfNPqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199021)(53546011)(6506007)(8676002)(31686004)(8936002)(5660300002)(41300700001)(316002)(54906003)(2906002)(478600001)(15650500001)(6486002)(6512007)(186003)(26005)(2616005)(66556008)(6916009)(4326008)(66476007)(66946007)(38100700002)(83380400001)(31696002)(36756003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEt4dHorajVKZjMxeWg3dkhGbTJUMG5BaFFlem5ENVJ4TUZsdWZ6OC92S21O?=
 =?utf-8?B?WVNYNThvZnFkamxFbVFIZGM0ckVjcThQb1RTcUg5VEEyRjU2bi9MK0RlM3dN?=
 =?utf-8?B?cHU0blAza3Zub0lka1hjQnZOQisrbmxEVFd4N2NTb2EwMmRIbjhFY0hCMkxr?=
 =?utf-8?B?WDkrWlhuT2pMZXZzVFFMREVzM3JiMk9xQ3I2a0xLR2kzMU9NaTJhYTdhbnlN?=
 =?utf-8?B?WVh5NWJvYnBCdm1sWEUrcE8xRk1iVEo3RDFOZWR4Y0FpbWY3R0xVV2NValNn?=
 =?utf-8?B?TmE1SjRQZDI3V3JzbHFkblNMVUpuT0Z3WkNzQ3d1dG1ObU4vNko1aktPSVlS?=
 =?utf-8?B?dXdWWmp5UUVBRE4zeUxEL1Fma09ocEpqK3BBZzVPVW51ZVNEM0RpWXAwTXBZ?=
 =?utf-8?B?WGc5T3hNSnlJZVVhcmJlS3JwSkVFaGNSbFIxV1JxVmxuSVhlM2UzODFtK1Vq?=
 =?utf-8?B?MXBkUWlFQjZYVWxpN3dGZVF2NlRUKzVBTTRJQnRQSnBTajNSWUo5RllKS3Nl?=
 =?utf-8?B?a3AwRk1hWFhKNnFUOHNGVkVxOW1id0FKeEtYMWdYc2EzM01Tbm9wMEJYVkwy?=
 =?utf-8?B?MGJFZWN3N2E2SU1XcVNKb1RaOStJUUI2WTF2YVVlNm03Z2dSanNPV0hUNWRw?=
 =?utf-8?B?NzhHYVpsdjhJQUUvQmxIeDlCNm03QlY4Mi96NnBCRVFTTmFxYUdYYW8zT0Rh?=
 =?utf-8?B?Z25TdjhKU0haRTBZMVpxOTM5UXBXM2pFMWJqYzJwZUNZVXFyWkZPblJhZTJz?=
 =?utf-8?B?cjlHREZkOVFqZ2I4M1A1VUkxMHVFZ0RwV00rc2RqVkRYYThTcm1ZRjdQQjBk?=
 =?utf-8?B?eTk5WThEa3Q0YzRLK1drM051UnZweGRQaEZ1a3lIOC9jc1VYSnQ2N0NsWkpZ?=
 =?utf-8?B?QkpYTEM4NUdLRzF3TlhUWTJOTmZyUXI3Tm1uazJHcDYxcHVWTW5FS2JmZVhl?=
 =?utf-8?B?Wm5IemlrcmEwTjJXaG9OY3Ixb2Jla3lIeU5lU0FUcWQ3cW1MNFA5Y3RGak8v?=
 =?utf-8?B?MFBYbFZrUUhsd3lMRWJsdG9LR1NnemczeUgvNzhsTlo2NjN3eE5FbWtKaEpB?=
 =?utf-8?B?MDRHc0t4SjdUVHh3U3J5WGE4S2IzOWpIZ3ZPT2RqOGU3bDFTQlljdTQ5bEts?=
 =?utf-8?B?S1lUNmR4N3J5Q2hiRDQ0ajMyZXFqLzY0UXczZXRDN3BHNGFMSUNhNXVIZTNl?=
 =?utf-8?B?OHdIK25sSFY0UTBUNjRoZTBWd3JOeWF1WjJWUytmYTlqWkNRZDFxNklOWSs5?=
 =?utf-8?B?NDVLbGNILzJ1QTh3MUQvM1lZbVlIcGx1dm5tQmp2ZjJzeE1jekVLUGpTRzVM?=
 =?utf-8?B?TjIwVHY5RCtIcm5uUy9rdGhjUXB6QnhFaXVocVRheDROSmpmazQvelorMnpk?=
 =?utf-8?B?S2lqWjNMSXAyMndNVEdOZGR3djFTTmx5VjhIeitra0kxbk4rWUU3VHNMR0ZG?=
 =?utf-8?B?V2tsTzZsYTU5MTNTd3FxeC9xeVQvN0NiK1Q3S3pWY0dGOWxBRjd0aWVGZ1lw?=
 =?utf-8?B?bHdZSHpmbFREbmZVc3NrSDdQdlBuZXZSbDNtbGhyMTByRUJWRFVIQTc0NUt6?=
 =?utf-8?B?VEdTWGp4TXRKSnBGTVJRZTBZQTBiTVVkZW90ZkpMMFdVeEMyS1BUV2dLYWFk?=
 =?utf-8?B?RExjajhwRWZGNDcwM0x5ZWppM2dXTzI2Y2NKcFF4c1BaeVhxekZJT1p1VlRy?=
 =?utf-8?B?K2JQcnpzVERhbFhpWWthSGxhZ2RJYnZlUU1YZnQrRnMybDZ1dW1qcDArY0hJ?=
 =?utf-8?B?bSs2MFNOOEF3TjlTL0RjcUZscmV3eGI2dGJGdVRsTHhnNm1DQTdkdWlZMDgy?=
 =?utf-8?B?cXg3akZKVy9vTDY4eFNXb0l5WWNvb1FFRGJEcTloaU9IN1pPcmk2SENOb2kv?=
 =?utf-8?B?emM1U0FNZ3NjUUpuR3V3SnpEaDZGRjVjbndFY3NNblpvYjUwNDBISy9aVHU3?=
 =?utf-8?B?VTJSYm11UlMwRWlxSGZqYUVMOXdieFZlT3g4cnBKNHZkcjFOQUlzVVBia0d4?=
 =?utf-8?B?NHRMME94bCtPL1JqSXNrejJnVVJKL3UwcTNQZ1F6aUYyZ3lUODJaS2pMa3dk?=
 =?utf-8?B?c3hxM2xiV0crSUFkTk5oSm9XVll0ZW1jb1NMLzhTL1d2bTh4UW9obTAxRnR3?=
 =?utf-8?Q?KCGIPog+e6lKW2trQowWqPj3/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0a5b80-08ad-4987-92ee-08db8e9e7879
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 12:39:08.1298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mI6KjuzJVb89sSty/7nTVcRjyjs7aTkflXlL2MFg/Kmna+Eh3Z8tk1ZSON4PGmpd30rWaliJ3PoOQG2Pe0gwLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8687

On 26.07.2023 14:55, Roger Pau Monne wrote:
> --- a/xen/drivers/passthrough/vtd/extern.h
> +++ b/xen/drivers/passthrough/vtd/extern.h
> @@ -92,7 +92,7 @@ int cf_check intel_iommu_get_reserved_device_memory(
>  unsigned int cf_check io_apic_read_remap_rte(
>      unsigned int apic, unsigned int reg);
>  void cf_check io_apic_write_remap_rte(
> -    unsigned int apic, unsigned int reg, unsigned int value);
> +    unsigned int apic, unsigned int ioapic_pin, uint64_t rte);

Forgot to rename the middle parameter to "pin"?

> @@ -364,48 +363,40 @@ static int ioapic_rte_to_remap_entry(struct vtd_iommu *iommu,
>  
>      new_ire = *iremap_entry;
>  
> -    if ( rte_upper )
> -    {
> -        if ( x2apic_enabled )
> -            new_ire.remap.dst = value;
> -        else
> -            new_ire.remap.dst = (value >> 24) << 8;
> -    }
> +    if ( x2apic_enabled )
> +        new_ire.remap.dst = new_rte.dest.dest32;
>      else
> -    {
> -        *(((u32 *)&new_rte) + 0) = value;
> -        new_ire.remap.fpd = 0;
> -        new_ire.remap.dm = new_rte.dest_mode;
> -        new_ire.remap.tm = new_rte.trigger;
> -        new_ire.remap.dlm = new_rte.delivery_mode;
> -        /* Hardware require RH = 1 for LPR delivery mode */
> -        new_ire.remap.rh = (new_ire.remap.dlm == dest_LowestPrio);
> -        new_ire.remap.avail = 0;
> -        new_ire.remap.res_1 = 0;
> -        new_ire.remap.vector = new_rte.vector;
> -        new_ire.remap.res_2 = 0;
> -
> -        set_ioapic_source_id(IO_APIC_ID(apic), &new_ire);
> -        new_ire.remap.res_3 = 0;
> -        new_ire.remap.res_4 = 0;
> -        new_ire.remap.p = 1;     /* finally, set present bit */
> -
> -        /* now construct new ioapic rte entry */
> -        remap_rte->vector = new_rte.vector;
> -        remap_rte->delivery_mode = 0;    /* has to be 0 for remap format */
> -        remap_rte->index_15 = (index >> 15) & 0x1;
> -        remap_rte->index_0_14 = index & 0x7fff;
> -
> -        remap_rte->delivery_status = new_rte.delivery_status;
> -        remap_rte->polarity = new_rte.polarity;
> -        remap_rte->irr = new_rte.irr;
> -        remap_rte->trigger = new_rte.trigger;
> -        remap_rte->mask = new_rte.mask;
> -        remap_rte->reserved = 0;
> -        remap_rte->format = 1;    /* indicate remap format */
> -    }
> -
> -    update_irte(iommu, iremap_entry, &new_ire, !init);
> +        new_ire.remap.dst = (new_rte.dest.dest32 >> 24) << 8;

I realize this was this way before, but I wonder if we couldn't use
GET_xAPIC_ID() here to reduce the open-coding at least a bit.

> @@ -439,36 +430,45 @@ unsigned int cf_check io_apic_read_remap_rte(
>  }
>  
>  void cf_check io_apic_write_remap_rte(
> -    unsigned int apic, unsigned int reg, unsigned int value)
> +    unsigned int apic, unsigned int pin, uint64_t rte)
>  {
> -    unsigned int pin = (reg - 0x10) / 2;
> +    struct IO_xAPIC_route_entry new_rte = { .raw = rte };
>      struct IO_xAPIC_route_entry old_rte = { };
> -    struct IO_APIC_route_remap_entry *remap_rte;
> -    unsigned int rte_upper = (reg & 1) ? 1 : 0;
>      struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
> -    int saved_mask;
> -
> -    old_rte = __ioapic_read_entry(apic, pin, true);
> +    bool masked = true;
> +    int rc;
>  
> -    remap_rte = (struct IO_APIC_route_remap_entry *) &old_rte;
> -
> -    /* mask the interrupt while we change the intremap table */
> -    saved_mask = remap_rte->mask;
> -    remap_rte->mask = 1;
> -    __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
> -    remap_rte->mask = saved_mask;
> -
> -    if ( ioapic_rte_to_remap_entry(iommu, apic, pin,
> -                                   &old_rte, rte_upper, value) )
> +    if ( !cpu_has_cx16 )
>      {
> -        __io_apic_write(apic, reg, value);
> +       /*
> +        * Cannot atomically update the IRTE entry: mask the IO-APIC pin to
> +        * avoid interrupts seeing an inconsistent IRTE entry.
> +        */
> +        old_rte = __ioapic_read_entry(apic, pin, true);
> +        if ( !old_rte.mask )
> +        {
> +            masked = false;
> +            old_rte.mask = 1;
> +            __ioapic_write_entry(apic, pin, true, old_rte);
> +        }
> +    }
>  
> -        /* Recover the original value of 'mask' bit */
> -        if ( rte_upper )
> -            __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
> +    rc = ioapic_rte_to_remap_entry(iommu, apic, pin, &old_rte, new_rte);
> +    if ( rc )
> +    {
> +        if ( !masked )
> +        {
> +            /* Recover the original value of 'mask' bit */
> +            old_rte.mask = 0;
> +            __ioapic_write_entry(apic, pin, true, old_rte);
> +        }
> +        dprintk(XENLOG_ERR VTDPREFIX,
> +                "failed to update IRTE for IO-APIC#%u pin %u: %d\n",
> +                apic, pin, rc);

Afaics you don't alter the error behavior of ioapic_rte_to_remap_entry(),
and in the sole (pre-existing) case of an error a debug log message is
already being issued. Why the addition?

Jan

