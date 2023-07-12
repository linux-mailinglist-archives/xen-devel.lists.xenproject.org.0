Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 366A8750421
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 12:08:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562148.878719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJWlC-0007el-7Q; Wed, 12 Jul 2023 10:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562148.878719; Wed, 12 Jul 2023 10:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJWlC-0007cO-3m; Wed, 12 Jul 2023 10:07:50 +0000
Received: by outflank-mailman (input) for mailman id 562148;
 Wed, 12 Jul 2023 10:07:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJWlB-0007cI-4g
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 10:07:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f32ba2aa-209b-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 12:07:47 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PA4PR04MB8000.eurprd04.prod.outlook.com (2603:10a6:102:c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 10:07:45 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 10:07:45 +0000
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
X-Inumbo-ID: f32ba2aa-209b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkPiKBlZN/fFJMKyrbeWSJ2DmNfJ5HaMuE2IdgupRv4xKDkPl3YKJX751AbeY+G88drI2HGbSQXN/eMpZcTdmS3wTg4hYpcXv7CwlEz5N4cMTUxJ4nkkq4bOCZe+ycuh23nSL3X3Vv3rTFUvoRILbx6+X4TAFXzUFqgGa5NCET2p0035cU6//eoA8PBPUKmnDtMi8HrgjDqPD0Oqz+s9fYNNACGuKnpqdBiCxs+3tcKLmpKy+Gxph0SRCTjNpBmWPc6WKLCW3V1L33/3scGIzovLdCMyiuT/NHAZuLC4OG4cYaoJ+EmO2qF7dTTQ8/Y2VhN3N1B2R4Jp28Xv8uR2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+iMhMfZqS4SfJnc88TfPDC2rHM5kkJJBDlvptMm4o8=;
 b=fycW0JCDQz8c3naQjusQeXJiBbFcxMVhWjyQd6LLO4YK5XLoeKR764M6VJvAec87Xau8kQeTNschpta7kDfPUgoXNoW0Jfe5DkrvaiHvbI4kncJp7Gr1+7A08ms2M41VovibrIuyb9chaQd6W2ia25/pnLDhXZIfRBd1+uSq6XBrTbpVkNgH4w0gWuRqn31krBej8EGrhRhLa3Tkx9LHkXJMCzXjmFUe/rx7Mk9AkapwkyPJoZW9AfK4peGFTluwEEcQYTxSAOeXs3XhnsTBe3MVrvdfQmQt6VJwhCQVnZXGVkwMm2MIlJfOXOHLLDAbLKrJLgcury4EMkO9+bOGcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+iMhMfZqS4SfJnc88TfPDC2rHM5kkJJBDlvptMm4o8=;
 b=cvyXZ2ilaTIHZM8gGmxvgsWAhOP1GNO+jXvICV9vnpHCL8ROX4aZMwSJxGUD4T4xfE1aqoG9GxX11GfQmwSznyeg1RN2UHijm6pdEHVJpnB874PN4VQ+tAkNBfEwY3X6HRfHZDO+LEwBeEsDUIoYullZ2rlIHSpptvpPgFxnJTTAucndRUkG20vk5YzqiRuuWHveGMKP0NZYBgF2O2w3QGsxKrrL8VrGuZ5T+8AcZI7WBQg5LeiOdVo5ffHL0jeH1T3qW9pagaqG8DVu11/QBlO+OrY8yny6B4y8IQ1a/zUrR9+24OnLmdw0yDqocz3ooeG60gRNVQVlchguVSFK9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eb2e3b57-a423-cf52-0192-a344db33a58f@suse.com>
Date: Wed, 12 Jul 2023 12:07:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] x86/ioapic: sanitize IO-APIC pins before enabling the
 local APIC
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230707095338.44244-1-roger.pau@citrix.com>
 <92d16012-ff9f-693b-07c6-d45fe07a00a0@suse.com>
 <ZKwZBQ_0Z2c7NJNL@MacBook-Air-de-Roger.local>
 <1f79491a-46f5-5293-e92f-0e2b0b3efb62@suse.com>
 <ZK1S1V71ZUIPjKqZ@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZK1S1V71ZUIPjKqZ@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::14) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PA4PR04MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: 5736aa16-5e62-4783-beec-08db82bfd65c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FNXWTa3O2SVLGUiOJLRbYmZAsfqZai2WRw2zCQsywzv3hSgTcn/BCQSjN/G7vlhDtfah/1musTbZ8YEROTRwSS/zwVKHV8Wh8Av/od6ezQI2dMiEAxvYgVSgdhYThRh8BEupR4G+J2OLrUqXW3VrTok9cWheqjHnKV8JMJn0xa9mvfbJZgYRnloAHELB1mtDpHKUwoeIvbSBbGCGleOEfPTH1AcHTfO5QWroOp5hfP/okbICHifN/nH2LRJeFit/cDxqTxSVvOUxDq243NM1S4klov5ecfyjSbKlyfhKRYQB/b82fQOFPrRd5lowkdmAr/04wZZQIYKDwLfSBT9sJdXwLfm9OdilMLxvgr7L7PgVgUoYqTcQeYAIfDkNtgW5vF/FICZlMmf6X8W/wjmIUDFyn6kixlaTiRzqFi16Ml1U9iMy3Lii781MUshML9MeaEjnMOmTTQCPcPLOlBnoCWWuXRzaeh/v9tDVjiRlGZk9LLpics0gRJeYZs0SihClsEIrdyKQ/AfGmw920iAK1SHaLhGeCd2i6zeR6tGF0ov1RVTflchVje9H5KvG1HTdX497KnVvMLW1KebAT6YIzD/kzSRpw/VGItW3CyjJ0PDSD9BjNjo9fFfu/55NaLBBs7lfAaMeQmr9hYcUHEvLKQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199021)(31686004)(66899021)(2906002)(54906003)(478600001)(6486002)(36756003)(8676002)(8936002)(66556008)(66476007)(66946007)(41300700001)(4326008)(6916009)(316002)(83380400001)(6512007)(38100700002)(5660300002)(86362001)(31696002)(6506007)(26005)(2616005)(186003)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWtZSnR5NlZRajdOcUMySlUwK1ZFL0x1RVVXR3h0cGVuZzdzRU1Ed1FwbytZ?=
 =?utf-8?B?WUJwemVmbnR1SS91QzU0ZEowbW45UmRCbGJWdXFxbG12VytKdDlpQ01nVEZu?=
 =?utf-8?B?Q2tkYmwzMWxSTUNMaEgzQWc5TTE2TTN3ZWg4Vk9LUXQzTGZBVEV4MEJVdVRU?=
 =?utf-8?B?Z296MXltVUNVSS9aazAvTTRja1J5dmdEeHY4UXBpVkpSNjh1YzJmT1NTMnZt?=
 =?utf-8?B?VzZzT1Q3bWtZTFk0czFXN3h5MHhGWUpjOHFTWG80RWVKTTlRRDdTZElqcEFj?=
 =?utf-8?B?UFhtNHRDV20rTWxEUTY5d2p4Ny9FM0tKWVVUUFNDd0NTdlFQYXBuNDJzcmtD?=
 =?utf-8?B?M1IwdUxyTEY0emlDZXg0QVpETHlSdVVLZXV6a1g3Q0RDakQ3eFRJdUg2K1g0?=
 =?utf-8?B?UVNZMzVUb284NjlFMHRnWXBEYUtmdkh5OEZqenduRW9SU1Z3RGRtMEt2Mkhl?=
 =?utf-8?B?VGF0TkxxUVVQa3N2ZThIdTVLTjBBWXJSKzc1VkRNU3lwTERKUkx6RWd4SXVr?=
 =?utf-8?B?RHNMcFkrbnV1YTlUNjhNdUdSWExQeGdzQXBZSWlZbWVOLzFFNmF4c2FUSDVS?=
 =?utf-8?B?VGRucXBNVk1SK1dCS0xWYXMzZDVoWGphbU45Nlh5bzdJK3VGL0plTmgzTFRN?=
 =?utf-8?B?YjA2bXBoaE5tSzhad29VdE1ZVXNqNWJHM2llZktSY015eVhpYWQrVlA0VUVJ?=
 =?utf-8?B?WFdtK3FOZlQzcEQwdmk3Um95bzVJZVc4TTdyRTZDWG4xV25iYlRUK21lTm1k?=
 =?utf-8?B?S2ZQUGZiVXB0V0tnbCtjWFRMM0VJbHl0a1B1OEcvanJ5S29CNWZUZ20reWR6?=
 =?utf-8?B?Z0VZYTI3Q1ZEdnRyNFMySFRUQ20zaElVMUZ2QmM1TXdjNkt6Z3FaaVN4dTlQ?=
 =?utf-8?B?QnBLdzZ3Q2puYkg4RnB5N3VFaUxoY29LUzN3cDdmNGZtc1gwM2JuU0lsTlZU?=
 =?utf-8?B?YWx1bzRsSXlhR3pKcllTRDhVdm9nVVQ5cjVHc2dwN05jT0trRlI5ZXRNRktt?=
 =?utf-8?B?Z0F1dEc0aG8za2Iwc1kyOUVPaE5qL0dYNldsMjJEQkJXMTZIN3F1ZURHT0dh?=
 =?utf-8?B?QysvRFdUeGhpbjJiSENLT0Uwb1hMa0x4SnlNTys2b0tkK09iTG5NdWlOaE4x?=
 =?utf-8?B?V0FSY3FEODdNMEIvTVVMSnFjN0lXU3U4bnpCeXVVbTUySGwyd0N0VlV5cVpo?=
 =?utf-8?B?Y1QzSWlSOXVyendmMEdodXhEOVpOVnFpUEg1Q1RFMDRRekNSRWEzSVNuWTNY?=
 =?utf-8?B?eHFxTXJTODErNzJidmZJN2xzUXdUSHRzaG5LQ0hrR3dUQWlXb1ZJNzUwWlQ4?=
 =?utf-8?B?S1R2N0F1SHViTVRtWkhxeGUzMFZMbHJYaVJpUlNwSk0rZGptME1CN0NMajIw?=
 =?utf-8?B?NEZ4S0plQ2JnVjg4VFZUWk1IV2tDbnNOeU93TkxZYTBoTC8rVXR1NFc3NmhR?=
 =?utf-8?B?OW5UZXUvTURjTSsrdkhSMTV2Y25Xa2R1MnlZcWJoVlczVHhLbjdZeGFRMzgz?=
 =?utf-8?B?UWdFdHA1RFBVY3NlWUdyQlhhbmhrYlJ3SjJjYTJxNGtyR1U2TzJvZ2RXcHRh?=
 =?utf-8?B?TjBSQ253SUJVSXRJWTE0bzY2VjdXaE1oZFRMQUZyd29tR3R0SWtpYms0dUxF?=
 =?utf-8?B?TDJoZkg3V1d2aHFRSXFhc1dNL3hOaHBjU0pnaENYcWJXSGhPK0R2N3VSR2la?=
 =?utf-8?B?dFdtMFB5UzhPd3VKT1krZG8wbGs2ZzI5OW9rTEcxUGx1M3JCSytVOGFWbkVS?=
 =?utf-8?B?eWZ5dVB1VCtIYWx0elpyaTZHS3o1YnNOVGhIa1M0STMzbmVJTGxtUnhaM3Zp?=
 =?utf-8?B?d0ROTVdONEhNcWVGZ2xMbVpTREtTZk1NQjY5Ull2bUhPSTZBS3laV1JBc1lG?=
 =?utf-8?B?NFk3OGl5d1FWZFRnQW40ZmtmdHJxZ3QwUWJvSkIzVWFQNTUxS256ZEl3Mmpa?=
 =?utf-8?B?TnY3Qk1HWUp4RmRaK3JIdXhUYVlabnpDenhaRDdmUVBwbjFqUjlaVUdMWEp6?=
 =?utf-8?B?TEFwZVdBVmFKaytyQjZRQzcrTVFIc3lubHJGR0pvSzlEcjN0N2JPN09oUjVu?=
 =?utf-8?B?aTB3RXpvRmRWTGxGTjRCTVlaZk1IQlIxa21ucjZLeGlFU29KN243Q0J4c1FQ?=
 =?utf-8?Q?XKflsU/T7/EkH3UgAbyn+uozg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5736aa16-5e62-4783-beec-08db82bfd65c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 10:07:45.0732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KesU5tkkpV3oDaQqGkMxIcIuXGWcNKDtslj+a6PBI1k0dP2FlMzCMtk+vs6SrJoiK76wsXkAf+ugjLXyY12WLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8000

On 11.07.2023 15:02, Roger Pau Monné wrote:
> On Tue, Jul 11, 2023 at 12:53:31PM +0200, Jan Beulich wrote:
>> On 10.07.2023 16:43, Roger Pau Monné wrote:
>>> On Mon, Jul 10, 2023 at 12:56:27PM +0200, Jan Beulich wrote:
>>>> On 07.07.2023 11:53, Roger Pau Monne wrote:
>>>>> The current logic to init the local APIC and the IO-APIC does init the
>>>>> former first before doing any kind of sanitation on the IO-APIC pin
>>>>> configuration.  It's already noted on enable_IO_APIC() that Xen
>>>>> shouldn't trust the IO-APIC being empty at bootup.
>>>>>
>>>>> At XenServer we have a system where the IO-APIC 0 is handed to Xen
>>>>> with pin 0 unmasked, set to Fixed delivery mode, edge triggered and
>>>>> with a vector of 0 (all fields of the RTE are zeroed).  Once the local
>>>>> APIC is enabled periodic injections from such pin cause a storm of
>>>>> errors:
>>>>>
>>>>> APIC error on CPU0: 00(40), Received illegal vector
>>>>> APIC error on CPU0: 40(40), Received illegal vector
>>>>> APIC error on CPU0: 40(40), Received illegal vector
>>>>> APIC error on CPU0: 40(40), Received illegal vector
>>>>> APIC error on CPU0: 40(40), Received illegal vector
>>>>> APIC error on CPU0: 40(40), Received illegal vector
>>>>>
>>>>> That prevents Xen from booting.
>>>>
>>>> And I expect no RTE is in ExtInt mode, so one might conclude that
>>>> firmware meant to set up RTE 0 that way. Mainly as a remark, albeit
>>>> of course there's then the question whether to change the RTE
>>>> rather than masking it. What do ACPI tables say?
>>>
>>> There's one relevant override:
>>>
>>> [668h 1640   1]                Subtable Type : 02 [Interrupt Source Override]
>>> [669h 1641   1]                       Length : 0A
>>> [66Ah 1642   1]                          Bus : 00
>>> [66Bh 1643   1]                       Source : 00
>>> [66Ch 1644   4]                    Interrupt : 00000002
>>> [670h 1648   2]        Flags (decoded below) : 0000
>>>                                     Polarity : 0
>>>                                 Trigger Mode : 0
>>>
>>> So IRQ 0 -> GSI 2, so it's likely pin 0 is the one the i8259 is
>>> connected to.
>>
>> Then wouldn't we be better off converting that RTE to ExtInt? That
>> would allow PIC IRQs (not likely to exist, but still) to work
>> (without undue other side effects afaics), whereas masking this RTE
>> would not.
> 
> I'm kind of worry of trying to automate this logic.  Should we always
> convert pin 0 to ExtInt if it's found unmasked, with and invalid
> vector and there's a source override entry for the IRQ?
> 
> It seems weird to infer this just from the fact that pin 0 is all
> zeroed out.

As you say in the earlier paragraph, it wouldn't be just that. It's
unmasked + bad vector + present source override (indicating that
nothing except perhaps a PIC is connected to the pin).

>>>>> --- a/xen/arch/x86/apic.c
>>>>> +++ b/xen/arch/x86/apic.c
>>>>> @@ -1476,6 +1476,10 @@ int __init APIC_init_uniprocessor (void)
>>>>>          return -1;
>>>>>      }
>>>>>  
>>>>> +    if ( smp_found_config && !skip_ioapic_setup && nr_ioapics )
>>>>> +        /* Sanitize the IO-APIC pins before enabling the local APIC. */
>>>>> +        sanitize_IO_APIC();
>>>>
>>>> I'm a little puzzled by the smp_found_config part of the check here,
>>>> but not in smp_prepare_cpus(). What's the reason for (a) the check
>>>> and (b) the difference?
>>>
>>> This just mimics what gates the call to setup_IO_APIC() in that same
>>> function.  It makes no sense to call sanitize_IO_APIC() if
>>> setup_IO_APIC() is not called, and I wasn't planning on changing the
>>> logic that gates the call setup_IO_APIC() in this patch.
>>>
>>> I did note the difference with smp_prepare_cpus(), and I think we
>>> should look at unifying those paths, but didn't want to do it as part
>>> of this fix.
>>
>> Well, consistency is one valid goal. But masking RTEs may need to be
>> done more aggressively than setting up the IO-APICs. In particular
>> if we're not to use them, we still want to mask all RTEs. Otherwise
>> we're likely to observe each IRQ to arrive via two separate routes
>> (once through the 8259 and once from an unmasked IO-APIC pin).
> 
> So avoid the smp_found_config check here and use the same condition as in
> smp_prepare_cpus(), I will adjust the patch to that effect.
> 
> I do wonder why we don't simply mandate IO-APIC usage and get rid of
> the code to handle the 8259.  Is it only to cope with systems that
> have a broken IO-APIC configuration?  Because I don't think there are
> x86 64bit systems without an IO-APIC?

There shouldn't be, yes. And Andrew has been suggesting the same on a
number of occasions, iirc. Yet trying to remove that code is perhaps
more risky than simply keeping it, which may be (besides time
constraints) why nobody has made an attempt so far.

>>>> Isn't checking nr_ioapics sufficient in this
>>>> regard? (b) probably could be addressed by moving the code to the
>>>> beginning of verify_local_APIC(), immediately ahead of which you
>>>> insert both call sites. (At which point the function may want naming
>>>> verify_IO_APIC() for consistency, but that's surely minor.)
>>>
>>> I wanted the call to sanitize_IO_APIC() to be done at the same level
>>> where the call to setup_IO_APIC() is done, because it makes the logic
>>> clearer.
>>
>> Hmm, I see.
>>
>>>> As to also checking skip_ioapic_setup - wouldn't the unmasked pin be
>>>> similarly troublesome in that case?
>>>
>>> skip_ioapic_setup is set when the IO-APIC address in the MADT is
>>> invalid, so in that case attempting to access IO-APIC registers in
>>> that case won't lead to anything good.
>>
>> Of course, as I did say as well. Still if for some IO-APICs we know
>> their addresses, we would still be able to deal with those (if we
>> were to stick to this mask-all-RTEs-early model).
> 
> The issue is that ioapic_init_mappings() will refuse to process
> further IO-APIC entries once an entry with address 0 is found.  We
> could change that, but I would likely do it as an improvement rather
> than tie it to this change.

Sure, I didn't mean to suggest that such needs to be done right here
(it could though, but chances are that this would quickly grow too
much). What we want to do right here is make the change maximally
useful without needing to tweak overly many other places in the code.

Jan

