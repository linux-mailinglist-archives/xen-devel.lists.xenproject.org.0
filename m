Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5889575324C
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 08:52:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563504.880708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKCev-0007xt-9Q; Fri, 14 Jul 2023 06:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563504.880708; Fri, 14 Jul 2023 06:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKCev-0007vW-5O; Fri, 14 Jul 2023 06:52:09 +0000
Received: by outflank-mailman (input) for mailman id 563504;
 Fri, 14 Jul 2023 06:52:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dZ6j=DA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qKCeu-0007vB-Fr
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 06:52:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f212ef9e-2212-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 08:52:06 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM8PR04MB7956.eurprd04.prod.outlook.com (2603:10a6:20b:241::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 06:51:50 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Fri, 14 Jul 2023
 06:51:49 +0000
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
X-Inumbo-ID: f212ef9e-2212-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVDP3nPy7dRKsYRhVdkNoeLRh8AHGCxGavHbBBgH1BpbLvZRkwBsLRypDTc4LM5tOIXkJKgRAeFT5mkvCvnf3gY9w+VPbyKM2u9jPkbYXSeGKqFNm1AlDHR2LvHNHMEkdJjGf7fO/PB6fIVIB7M2YNnEt1nj1XN1lV/ymO+ghvCAexHN0nUxE9iadsC/9ordYIcuh1SpNO7LtLqzOFIVBzoh73DICa5o4u9+KSEWAa3d2NqhcxQnCChFwLR9x1U0tV+0BaMFl3/I9ij1FEL02iYZVRDUDCveZG2EqLbKxfxkuuPsdMvLi9fK33Jz7MFf2jkIX/eZBhpMvTZBwWnjyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtMzgE20PQLWoqCkkdtvNnvCCaNzYzyeTwbepSPpx3k=;
 b=b+E35pF8AxDw2+/OOZ4Iy2W6V7WR5Cy/cMSQwDhnfMzOuoYvQQgVKyHPl4EtZK2eDb2ykdMKRGEMEMUzmlkw9boN44TnMjjkiRXcjN6MalOx/oEgls1OvnJzdOhIGCBJucDi8zCfuY/NBV4iCBPSlKc2yN72KSfjcSD+a3TI91vW3FGRfg94AA2GK+cTX6eyq/Kwz3tBA9WFgqHZRdlVm2iIBQpQH2UGSTOHdjAo453/qfMcHDPBtFZaDiTaAaDOWlubl7dkMyc4MCBgEB7fw+pWJUzFm64PLd/5YDkyr8q5DbQHsIkLu6dutbzGgOfDUAk38lP3HoEd7iXhXSXH4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtMzgE20PQLWoqCkkdtvNnvCCaNzYzyeTwbepSPpx3k=;
 b=hYYjQ0NalIlO92gRufnKuDQ9/F/2Cm3aikQO5GnKtEc1vmEeUhCt/c4hIhq/M8vkeE/VdBqWkXlAWWXUQRYGOWWGA7htRHVXKBAVIBOgNYHtCCT3MIjQurvyzM3r9D4vDkahM1s979dtagD5OHNtvbprdja4/EyGMppNeiR+8vi1A6v8f5LWKhDwDWrw3iz7tnJPaCfwLcPnEo4AwzM9zl8Z7PjQ0wQMEh4fWspxvMVdffpdsm25SUX1fuWTgA218Ulp7jYqYUij7VwYmvY/Likrz/GZ/BjdL+T0fmVysK4lEa1J3UeXpc1USu6wQcVsv8UPpu46oW8pqd2tk5qaGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <564c0a96-a0ff-72fe-1148-882ef9beb6a5@suse.com>
Date: Fri, 14 Jul 2023 08:51:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/3] x86/APIC: modify error_interrupt() to output using
 single printk()
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1689191941.git.ehem+xen@m5p.com>
 <7771343b52e6769d7670ad73094f5276025a10fe.1689191941.git.ehem+xen@m5p.com>
 <3b16e1d8-acfb-8dd4-763b-57908ea6a2a1@suse.com>
 <ZLAqlsvIvzOPMdOV@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZLAqlsvIvzOPMdOV@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM8PR04MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: b5396271-3bc9-4c3c-f92f-08db8436cc88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M2/eaYJcZyzbdA4FbgA6FX3+OtihpVb7c0GG0p93k0VElJhZDeuTS4KWD8G4mzPHVFC0SV9qUmB6P8b4gBYPAKL63v4yl2pkk2nMb7peURCCy3mj2Zo0M4S/xmTOFk1AjNQTOygUnrlgOzb2p2sSDBmH3SXlPDQ6WeQ3UaRifPAT3e9eUFY61Zdk234Eelbw288V32MgiV9fyofVrYXNAOd2WocONf46RdK3x7fjYtbI/kcQUhC/GSVV11dvDrFCJIWmo87Nb/J9mj+ZrrjXoy7YL30TystztUhfXcuar1y8UWgwhAuUBaBffJ9uuXLUInK0YKg1oArjfTdSqCqErS3NiMty6/q8+shUl2Bca4KRulhgIoAYT16dJR+uxPE9kuTw0o0NWLVpROHzRwyMYSEaqYIluVHa2PoRxWaWFzyDLZuZsrJx62Md6Q4Qk452QU8bdpboDhWJJBEPdZucc/GV7oCiBMT3bY/qvG5nfRvUyhtMmeUpHY3+AMmWRRBrSrivB2CK0EABObKw3aDrJxVrryCVs63ioba44RfZUg2SUkKeqfJTHzaFE4UnECa0vvor5peb21YdS9gwtz3gDQFg4toEpwZ/aB9SKjVxmvVRUE22WANXb1DiBE4DumGsBvlm+/O5jyta2gkFP4tA4Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199021)(6512007)(6486002)(186003)(2616005)(38100700002)(36756003)(86362001)(31696002)(26005)(6506007)(53546011)(4326008)(66476007)(66946007)(66556008)(54906003)(41300700001)(5660300002)(31686004)(316002)(8936002)(8676002)(2906002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmRuVFlDUkM1RXEvTkkzK0JsQVBzQ2luSzVVU0VrOFBaajB5eHRXL2w2blBV?=
 =?utf-8?B?MVhLeCtjMGtvK21TYmt2VVR6N1FyVi9FQVBBV2tqUG8rbHZPdzdVVTA5WlRS?=
 =?utf-8?B?MjJpNnJqUlYxV0E4dzVjVHQzVHozOWppQXdlNUN3d3JoOEFXMWZERkxOTmNi?=
 =?utf-8?B?VnphRll1cFg3OWRVaFpVZXNSQUpnWUNqTlRDalVBSVJQZTBPTHJ4WGtUMHRZ?=
 =?utf-8?B?WTBGa1gwb25lRXdvM3ZxRnNuMG9LWDN4aGJSZW5jSzd2Z1o1UzdTMTFrS3lh?=
 =?utf-8?B?TnpUS29vbzBEOTlKY0VYZFhrNlY5dnZnUmk0REhwNndTcmNNUmx4VGFZdFlv?=
 =?utf-8?B?TnJ2bmZVejhSZzF5UjVxVzEwbDBEOWVOQUFJODRtcHZ0TWR0VFo3aldQeDZC?=
 =?utf-8?B?RHNKb0p4RVJzQnc1dkZuT0tuZUt5M0IzcFJmZksyK2lwNEd4eWtUdDFJNmpC?=
 =?utf-8?B?eTh5WXJiWTdaVHpxT21tMmlwemJmUjVYM1JZOXJjb0ZJTm9YMlF0YU9KanQx?=
 =?utf-8?B?ZnErbmRYaDZsdGpVTVdTTS84OTJJclpBUW5ucGY4a1pWTmFXWkx1ZWErWkFx?=
 =?utf-8?B?ekExeG1UeUZ4NTR0cEp0M0ZDMU83RjVZSVU0L21ZbVdVL21jbGFhQXB2aXlN?=
 =?utf-8?B?Y0FlQnFBWnV4aGFLcXNGWHF5Rzh2eDJhRnRYTnplQk5CdWRGdmlJVDJBQzho?=
 =?utf-8?B?MmVQMC9NaVU5NmJaWklFZ0IvbGh2S1hDNnd0ckV4TTZ3K05VMkVTc0Q1UkxS?=
 =?utf-8?B?MGNCYkRkQWdUOGpEalk5cGo5QTFvSzhxY2FrUkUyYk9WWVJ6bElxSHUxZVhG?=
 =?utf-8?B?QlBGWWdQZS9DLzVyN2YxOTZYWVRwcXdVTGFzK05aWU8xbk5jcFc5SFc4Mmx3?=
 =?utf-8?B?OGVsRDM2QXNLK08xMTNMYW1PRHRnNXhpdk5NbEVPK3NWa0d2TTc4VGd5QkxB?=
 =?utf-8?B?ZnFWaFBwM2NVcjBNOHJqZzdxaXhpMFhYTE5nNjVDSWllZDk5d293a2toL3B6?=
 =?utf-8?B?SUxxaVVHdG16NDNqemdHbUNzMCtielN3L2dOdU1PRVFaVkFISFdOb0R0Ymp3?=
 =?utf-8?B?UFpUQjMyd282YVBHUlo2b1hreFoxTUllOGhMUkpEQTRMM3IydGRrYjZoYTl0?=
 =?utf-8?B?YWJpVUxhbGpOaHJCS3NGSnJYek5QQ0JscmVEd1c4cTRGMk1ieEt4VEpZNEdL?=
 =?utf-8?B?bkdMK29ldmdySTRUSFFUQnJvNmErTXJyUUV1bDJXa05MUUU5dU5Qelg4VVBS?=
 =?utf-8?B?SitqQnJnTmtTY1liSmRiVXlOK0hOM0dSdXhhOTM2YVprQ1NpaXBEdzhpbEVU?=
 =?utf-8?B?OTE1NzJxRlQydFJPSXRjTEN6UloxNXNIR05tVWFta3FJOWR3dnVTNVRUamYx?=
 =?utf-8?B?d0IyRUhqV0hPZjcveGtnWVErRlgweFJueTR3VUl5TVRrVXZOdm9hRnhvTlZD?=
 =?utf-8?B?M1FZdVY5Zm56K216M3ljQTlLc2ZBU1MzcGlyMWZUam1zdmgvL3h3eUFLdHlO?=
 =?utf-8?B?bHBKM0gyQy9RVDc1ZWhkVlUzeUg5UWdiSFFEY08rUkx6UGY3T3A4MURQVzNx?=
 =?utf-8?B?R0FUSkJZY0grb3hkcmpaK3FIMGE3OGREVSsyY24xc0FEcG43dFM0WWp1WVVh?=
 =?utf-8?B?bDROakxKQ1g0NFhvemg5c2o2TUVqWFdlU05jWlZWdjJNWU1ibzNReEFpTGVl?=
 =?utf-8?B?ZEVSU1FGWTJPM0JHeVhuWnFHQ2FUYzQvem0vZm1iWGcxb0xoWllMUzQ1b0hD?=
 =?utf-8?B?SGRTWGVIekllWmQ5aWFTN0xPdElTdGo0bUtPK21IdCtlUnd3d0NmY1NTYUVz?=
 =?utf-8?B?M25VUnBaYUQxSDdMMjljQllEcVpMdHVxWWNHdExQcGk4aU9aUmJYOEJVckpM?=
 =?utf-8?B?WlY2cUV4K0VEUTZac2lHVWlubXU4UzJoZDdmZ2VHOWI0VmZXS25URmp6c1Ez?=
 =?utf-8?B?SGl5MW9od2lGODFiU2tWalFCSlhaN283bnRrcEoxNkNxeFM4SHN6Ym1XVm5v?=
 =?utf-8?B?VEpDcUo4Q2VCT2Y5WnFFQURIczlTTVZlcStMakZTWU5uWHFEZDFqL1d0Q3A2?=
 =?utf-8?B?TmZXV2RpSVoxeFBPaUs2aS94S1RGVitSK3d2Q0FSQnBvbkR5d05rUVByRUFL?=
 =?utf-8?Q?bHVVEQYQ67kfit7tvIgbFibw7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5396271-3bc9-4c3c-f92f-08db8436cc88
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 06:51:49.8670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UH6Igm8/COngR/wxxcl8MTUF6080Z8jFds9gKTPL+sL91+8tBkFzRSQiNrOMNdYxJq8MG3Dr6tdPRnklGx+lWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7956

On 13.07.2023 18:47, Elliott Mitchell wrote:
> On Thu, Jul 13, 2023 at 03:12:55PM +0200, Jan Beulich wrote:
>> On 17.03.2023 20:53, Elliott Mitchell wrote:
>>> --- a/xen/arch/x86/apic.c
>>> +++ b/xen/arch/x86/apic.c
>>> @@ -1419,12 +1420,13 @@ static void cf_check error_interrupt(struct cpu_user_regs *regs)
>>>      v1 = apic_read(APIC_ESR);
>>>      ack_APIC_irq();
>>>  
>>> -    printk(XENLOG_DEBUG "APIC error on CPU%u: %02x(%02x)",
>>> -            smp_processor_id(), v , v1);
>>>      for ( i = 7; i >= 0; --i )
>>> -        if ( v1 & (1 << i) )
>>> -            printk("%s", esr_fields[i]);
>>> -    printk("\n");
>>> +        entries[i] = v1 & (1 << i) ? esr_fields[i] : "";
>>> +    printk(XENLOG_DEBUG "APIC error on CPU%u: %02x(%02x)"
>>> +        "%s%s%s%s%s%s%s%s" "\n",
>>> +        smp_processor_id(), v , v1,
>>> +        entries[7], entries[6],
>>> +        entries[5], entries[4], entries[3], entries[2], entries[1], entries[0]);
>>
>> While pre-existing in both cases, two nits: There's a stray blank before one
>> of the commas, and indentation is wrong too.
> 
> I don't see anything which could be called an indentation error.  The
> very first added line is attached to the `for ()`, therefore it correctly
> has one more indent.

It's the printk() invocation, where all continued lines lacked another 3
blanks.

Jan

