Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8677A7AD824
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 14:36:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607866.946180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkko9-0002Jt-7q; Mon, 25 Sep 2023 12:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607866.946180; Mon, 25 Sep 2023 12:35:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkko9-0002HO-51; Mon, 25 Sep 2023 12:35:25 +0000
Received: by outflank-mailman (input) for mailman id 607866;
 Mon, 25 Sep 2023 12:35:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3u+g=FJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qkko6-0002HI-LX
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 12:35:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbf9b1cf-5b9f-11ee-9b0d-b553b5be7939;
 Mon, 25 Sep 2023 14:35:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9594.eurprd04.prod.outlook.com (2603:10a6:102:23c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 12:35:15 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303%3]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 12:35:14 +0000
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
X-Inumbo-ID: fbf9b1cf-5b9f-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7x9FeiJcjr4Icbc8dBWFYTMIIN26huVatudmMAxybIbPt7c/algBgLukX6bx9r7mHuGuyyxSM2HR/oZ2Jw9032xfc14GSnIWaeBXBJffot4EbZ2EAcceYOZLcSUo/WzEk6SsLZTu0T7aSC8dus6f4qEQ6FYhZUG2x6Hu5QK1aIfuKGfY7xGHgnKYys/D2X9N45W6zOYc9ZGDsuUml6ErRk9dhbsDiZfYnLn+lUNAtuEPgEOoYlsGJNdMCixjUkgSpY5Lsml+p1BCXiU/mJbp419Tm2sDkabiO7Iyy2aSaqv7pG1qCRwMAQVq1jmV3S8GLlLZ4p/+iEY0ZhMw7u5ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZKQnX9Vzts7Fq+oYW0edX3C5L04RZzGfYCFovxlY+I=;
 b=LmKwB8PRm90kfSxP+5K2gkp58gWT/XZy5KWcf0w3W1Wk8/T+QLPMAhnyg003jIqP5KhMiqbWKj4ViiC8Da+kykkJcdncmZRie8jxWz+fbPzZlHxsWZwIkj+QlhlYNtj4SGqAkuS/xWHDx4kpgR7K25X24xefVJ7J9wKVkYjHq6zlJphJSFeKuzTBNH38R/fcxMRfmjhU95fg6wnfhtgL1AX+xlgniJVWi3qwaWAfvRyCRH+h8ZrM8jMO7hFc5hEdExtU9TaqZCDi8W37M+ouqrZ2DimcQUtiDe2UkmpliFqDSpx5rD3bZSFVQnb4XfsESt3mfsuAcyRVNTtc9aX9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZKQnX9Vzts7Fq+oYW0edX3C5L04RZzGfYCFovxlY+I=;
 b=Q3jiI6j9v8PJU1XynKTsMw0ODbaNewgzStx2ClmShfjKKTZPvItB5lRSqghMCVrfq/LFQlf+cfSSK99IqRr/mFEJM0CvU/FFwVOUii0eNMqvZVuI4WyMa/s7kyloju4iFd/PbGzDN50eKv+2BSJzFVjcI0WZoLp6bacgJtVwX2OYBOwvMlVEP06xn+n4F4VAm8PiH67YV1NVcgrXFN6+qsswxjgIeMv0aroWJjENcunQj+qs7JJY8uPqYpskLwLBKXOO3mW9fqJfMk4tklyuypPZBTWcc4DS8CCM2mZqfvsKi+UyXS0Z+uFFivjrreRcUHXBYhTe/hXyeRUSo/lJdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd9b9687-f8e5-cd25-b6e9-1028078ed7e3@suse.com>
Date: Mon, 25 Sep 2023 14:35:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/i8259: do not assume interrupts always target CPU0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230919110637.12078-1-roger.pau@citrix.com>
 <2b600963-6196-d6c4-8ab3-ab142c323f7b@suse.com>
 <ZRFkMsUcaLuNJwHR@MacBookPdeRoger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZRFkMsUcaLuNJwHR@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9594:EE_
X-MS-Office365-Filtering-Correlation-Id: dd7ed1cf-986c-408a-60ab-08dbbdc3de31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kmcb4f2XQ6XsYQm4+JG7F9Ra3YJPgRjijc7CzY+JelLSyCaN+cptu1V99Z0UbcHnMi90f1F39zHp0doWswaevvpVzqQWBqgLXFhJk/4At/RqNR8YnmWZ4kxlZtHYnK0SpBz3o3nl2I3ZtOVLrFmP8wfWWsGlGvwKDd1j96MofEW/aph+ykV7bzcebCn/uyU/1YLqNtxv4lnSLDmHyRQRpdWgqzT5nkMk4fjQELncALcy5lRxEle7Q3slIodjomKhoT1eh91qqw8gWWyPbMo0p0hmS+G+bzc7x+BvLs3mMKZ9Y+cWwPosZ9bvvOzWqnksN+mOSmheA624THVjjPQrPofVZ2VKUjcYQS1agqzECi9z7udYudxvNPFAaNSOlKDcwuOMP5p/inH+AjwZn4JaoOo/K0uwACNH4craHiD83xopzqj/URA3araLaw7eZigIz/f7vTFhdYhChynfS7WxcQ3EXZN1kiul+nHYFS7RJstTI9kAOhfIMYKXnDBvJPVU2X6D7KIUH4kQ1Bjcopkp4mGuhJk6jeCiLiOIlBvE1yIQH3hDQRlLIhePnnFtQ03VPOU2jXHjsVi/6lUb+B/zU2BIsTeTN81l4MrCneW6yEID661p1XZnI8SKCvmf9qZ8e760N1MgPUsiCdPlcHZNuQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(136003)(366004)(376002)(230922051799003)(186009)(1800799009)(451199024)(2906002)(86362001)(31696002)(53546011)(2616005)(26005)(6506007)(6512007)(36756003)(6486002)(83380400001)(38100700002)(966005)(478600001)(5660300002)(54906003)(66476007)(66556008)(66946007)(6916009)(8936002)(316002)(8676002)(4326008)(31686004)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZitaVmpNYmhIVzZ5dk1RY25RZjVtLzJhQnRCaEdUc21JRmtvbm8vUzJyZmMx?=
 =?utf-8?B?Wmx1dkdKaVp3OUZoV1ZNVjg0emw4YTRPdEQ5YTVQdWdhR25pa2g2dHNOVzdx?=
 =?utf-8?B?NmlPZ2RrbEtTS1NIR2I2OVBZQjJrWmtDaU5CcVl4YVFmN1FNY2xUcHRVci8v?=
 =?utf-8?B?b2xNemZZZWFjN29vOFJQQUMzN3BkWW11Rnk1Vk95aXd2TVh5aGdoTEVJL1FT?=
 =?utf-8?B?c3RRdkhFODdzd1ZNNEc2ZDg0a2RpWUg1MUxmNUJORVFSVkpIRlVkdVIxT05h?=
 =?utf-8?B?dGRzQ1Z4TCtjbDBQeXNlVnU0OGRIa29waVJUSWFXaGJndEZsUWJkbnJtM2FM?=
 =?utf-8?B?YXYwVjMyUVlWa0kwRm1LdkhYVXh5K0tTK29PNitXYUlBSUFSRHBtV3JVejYx?=
 =?utf-8?B?TFZvQlBoY1lRRTNDMTlIQ0lKY3JZRXRRZzE4WE5ma3FSSW1vRUJOVDNvbjY0?=
 =?utf-8?B?VlNrZ216VTlIRzlVYjZxRlRCWVA5UTlFQ2I3WVcwYzArU1BzNDQxWjA3SmdY?=
 =?utf-8?B?UUNEb1Q0Nm16OHpsbllvdTRiTVoyNTVNS1VlOXUrdjdHUlB4UWVyQzRZeHhp?=
 =?utf-8?B?bk9sTDFITWZXM0E1LzVxQjhSTm52WkVKdXA4M0ZFR3N0aUdHRGN0eGZOZTJj?=
 =?utf-8?B?NHo4dU5NMDgzYjZuVnp6QjRucW5tdWZzS1NnUzdiZHBxUnZrQzJ3bmpoMy9R?=
 =?utf-8?B?WDJ2L2ZNWVhsWHRxREdENndIMWtiOU9ZN0tERkFXRDdwejdwQ1g5SDBSbXFk?=
 =?utf-8?B?S0lqcUtKbHhMdmltckNjbWhKYndYNVRtOEhYQlZ1Zy9NanN5dURBenl4RDdw?=
 =?utf-8?B?eVVJdlRaeEIzdkxKTXJKbXNxK0tXNnhWM090T0srQmFmMmVhdTR5NDBRWWox?=
 =?utf-8?B?WUdKL3NoalkyZmgyMEN1WGtNbmlzT0h6eCtTRGYzWk82N0paKzVsZVZ6TDR4?=
 =?utf-8?B?ZUVtcEY3TUpVSS9VdjZsQlJPSXZXT3RpajlxbHpNTnU1b3Z4V21ZOFMycUxo?=
 =?utf-8?B?K3kwQWhuLzFvUFZXMGpURVhPOVI3R2V0Uy8rQzlqZWRYYytkcXJqdEhEQkwv?=
 =?utf-8?B?cTgzL1ZnS0p1VFpYMWRKYkpMbXlVY1RRS0J0VnlZQzQ2T1QzOENQWUlRYUVq?=
 =?utf-8?B?bXhOVXdTdjBwUzVIT0FNZndMNFk3NWI5OEJNcUQ1Q2h1VHJ6czdVMVJOVjBV?=
 =?utf-8?B?cVlqdGhHNndLeDd0ZmVZUWQyemJkcldvNWMrUGFqRlByWkhmQ1ZvNUtWaUxC?=
 =?utf-8?B?dUJIbWFvdFk1eGY2aU9GMEVZRTZLbTFuelVzVktneFJYdnJ2d1ZCenBHT01n?=
 =?utf-8?B?TlZGUXZjU3puRno1VUo5dnhZNUJpME5rdXE3dDdFRFB0cGlodGFScnU4NEVB?=
 =?utf-8?B?aUhvZUVkQjQyaWFlOWVjZGdYTGlNK21UYVZNWUg4cGtpa05MS2JIcW9waElz?=
 =?utf-8?B?MlFBMDRRT0FzVS91WGJEOG5od3haVXk4K01DelhrSzRzdWMwbnNXYWVZcUk1?=
 =?utf-8?B?cTNvSU03L0lMeHUyeDZRYUhQNWo5bGFwRlBOUXRwV0RjSFpIM083REJxQzRs?=
 =?utf-8?B?SWRVMzBBYTJsYW4zWjhiZGFSeE5ZTEZxREdhODJOdTJSejV6N3hpREtjMHlJ?=
 =?utf-8?B?cDI3OWpMd3RZY3ZoMWQyZEE4aHRVOWZVeUcvNURFTEhoeDVHMDNwQmFZclFY?=
 =?utf-8?B?Rng5U1JjaGRVakdCMUl5TDg0SmwxRUU2OTNLTEt6cm1LWTdralRqUi9QaWJX?=
 =?utf-8?B?WnpqVTNRWENCN05POGxlU1JFaHlPVVFVOG9abURUMTFYWjhFSlhaS2ZHRFZW?=
 =?utf-8?B?bWw5WFg5bUtuZVFlUktWamI3SHBheGExQUdjWTRLYXVzYWNVK1pIYXZmeE9z?=
 =?utf-8?B?ZXRtU1BlMTZJbVFKTnVjVnpBQXlWQ21oME83NUVMQ2Z1NEdwVkhrTlJjMHpX?=
 =?utf-8?B?TTMwS21zNXl2UFN0SHl4a2ljNjI0aG5sWERWRDU2Ulk4dmhZaFJpQlRJUEZQ?=
 =?utf-8?B?V09hWWZneWNPNWlOL2xhb2V6U1pZNVFudG9qOGk5TDZkUUcxNXVqM2RTVW9E?=
 =?utf-8?B?UmNjQVVtWE9KTkRSc3RmU05SQTdRRzFJdmEvbTBRK294VW1LU0d6WlNiWXlh?=
 =?utf-8?Q?nW+d/sDHVGzugI/JYI+fNnNJX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7ed1cf-986c-408a-60ab-08dbbdc3de31
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 12:35:14.8498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Sd06peSGf2/05DRavBdas9KpXf9sLbPrODyK3vkBleXG7dMeeUw6Mgej4EuDgYjRfTgMK2HoQFCXcC/8B+Z+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9594

On 25.09.2023 12:42, Roger Pau Monné wrote:
> On Mon, Sep 25, 2023 at 11:55:25AM +0200, Jan Beulich wrote:
>> On 19.09.2023 13:06, Roger Pau Monne wrote:
>>> Sporadically we have seen the following during AP bringup on AMD platforms
>>> only:
>>>
>>> microcode: CPU59 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
>>> microcode: CPU60 updated from revision 0x830104d to 0x830107a, date = 2023-05-17
>>> CPU60: No irq handler for vector 27 (IRQ -2147483648)
>>> microcode: CPU61 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
>>>
>>> This is similar to the issue raised on Linux commit 36e9e1eab777e, where they
>>> also observed i8259 (active) vectors getting delivered to CPUs different than
>>> 0.
>>>
>>> Adjust the target CPU mask of i8259 interrupt descriptors to contain all
>>> possible CPUs, so that APs will reserve the vector at startup if any legacy IRQ
>>> is still delivered through the i8259.  Note that if the IO-APIC takes over
>>> those interrupt descriptors the CPU mask will be reset.
>>>
>>> Spurious i8259 interrupt vectors however (IRQ7 and IRQ15) can be injected even
>>> when all i8259 pins are masked, and hence need to be handled on all CPUs.
>>> Reserve such vectors in order to prevent dynamic interrupt sources from using
>>> them.
>>>
>>> Finally, handle spurious i8259 interrupts on all CPUs and adjust the printed
>>> message to display the CPU where the spurious interrupt has been received, so
>>> it looks like:
>>>
>>> microcode: CPU1 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
>>> cpu1: spurious 8259A interrupt: IRQ7
>>> microcode: CPU2 updated from revision 0x830104d to 0x830107a, date = 2023-05-17
>>>
>>> Fixes: 3fba06ba9f8b ('x86/IRQ: re-use legacy vector ranges on APs')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> One theory I have is that the APs at some point (before jumping into Xen code)
>>> have the local APIC hardware-disabled, and hence are considered valid targets
>>> by the i8259, but by the time the vector is fetched from the i8259 the
>>> interrupt has either been masked, or already consumed by a different CPU.
>>
>> Aiui with LAPIC disabled, IRQs should only be possible to go to CPU0,
>> for there simply not being any SMP without LAPICs.
>>
>> Did you check that there are unmasked ExtINT LVT0 on APs?
> 
> Yes, I did.  None of the APs LVT0 have ExtINT set, I was really hoping
> they would have ExtINT set, as this would then make sense.
> 
> Maybe there's a point before handling control to Xen (in firmware)
> where APs have ExtINT LVT0 set, I certainly have no idea about that.
> 
> Seeing Linux commit 36e9e1eab777e I get the impression that on AMD
> systems PIC interrupts are delivered to any CPU that either has LVT0
> ExtINT or the lapic hardware-disabled.  I have however found no
> information about this at all in the PM or PPRs.

Just to mention it: While that commit make some relevant remarks, its
purpose was to work with "noapic", and one of its chunks is even
wrapped in "#ifndef CONFIG_X86_IO_APIC".

>> And unmasked
>> PIC IRQs? (Although, for the latter, it could of course be that by the
>> time we gain control, they're all masked again, but an IRQ was in the
>> meantime classified as spurious.)
> 
> Even if there are unmasked PIC IRQs (which is not the case AFAICT), I
> would expect them to be delivered to CPU#0 because that's the only one
> that has ExtINT set in LVT0.
> 
>>> @@ -349,7 +350,20 @@ void __init init_IRQ(void)
>>>              continue;
>>>          desc->handler = &i8259A_irq_type;
>>>          per_cpu(vector_irq, cpu)[LEGACY_VECTOR(irq)] = irq;
>>> -        cpumask_copy(desc->arch.cpu_mask, cpumask_of(cpu));
>>> +
>>> +        /*
>>> +         * The interrupt affinity logic never targets interrupts to offline
>>> +         * CPUs, hence it's safe to use cpumask_all here.
>>> +         *
>>> +         * Legacy PIC interrupts are only targeted to CPU0, but depending on
>>> +         * the platform they can be distributed to any online CPU in hardware.
>>
>> I'm unaware of such a distribution mechanism. Do you have a reference? (If
>> I recall correctly, there needs to be a unique entity in the system that
>> runs the INTA protocol with the [master] PIC.)
> 
> This comment is mostly picked from Linux.  See:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/kernel/apic/vector.c#n842
> 
> As said, I haven't been able to find any reference to this in manuals,
> but given commit 36e9e1eab777e it does seem Linux has also experienced
> PIC interrupts being delivered to CPUs different than the BSP at least
> on AMD.
> 
>>> +         * The kernel has no influence on that. So all active legacy vectors
>>> +         * must be installed on all CPUs.
>>> +         *
>>> +         * IO-APIC will change the destination mask if/when taking ownership of
>>> +         * the interrupt.
>>> +         */
>>> +        cpumask_copy(desc->arch.cpu_mask, &cpumask_all);
>>>          desc->arch.vector = LEGACY_VECTOR(irq);
>>>      }
>>>      
>>> --- a/xen/arch/x86/irq.c
>>> +++ b/xen/arch/x86/irq.c
>>> @@ -466,6 +466,14 @@ int __init init_irq_data(void)
>>>            vector++ )
>>>          __set_bit(vector, used_vectors);
>>>  
>>> +    /*
>>> +     * Mark i8259 spurious vectors as used to avoid (re)using them.  Otherwise
>>> +     * it won't be possible to distinguish between device triggered interrupts
>>> +     * or spurious i8259 ones.
>>> +     */
>>
>> You certainly mean {L,IO}APIC device triggered interrupts here? If so, why
>> would they not be distinguishable? ExtINT IRQs don't set ISR bits, iirc.
> 
> Right, but we don't really check any of this when servicing the
> interrupt in do_IRQ if the vector has a valid irq associated.
> 
> So if we assign the vector used by PIC pin 7 (IRQ7) to an {L,IO}-APIC
> triggered interrupt, how would Xen distinguish a spurious PIC
> interrupt from a L,IO}-APIC originated one?
> 
> Check the LAPIC ISR for each vector in do_IRQ() seems like an
> unnecessary burden, and that would be a non-trivial overhead when
> running virtualized.
> 
> So yes, it's possible to distinguish them, but I'm not sure we want to
> engage in that logic in do_IRQ().

Right, and here my comment was merely to ask that the code comment please
make correct statements. Saying "we don't want to go as far" is quite
okay, as long as we're (kind of) happy with the undesirable effects of
the actual code change.

>>> +    __set_bit(LEGACY_VECTOR(7), used_vectors);
>>> +    __set_bit(LEGACY_VECTOR(15), used_vectors);
>>> +
>>>      return 0;
>>>  }
>>
>> Assuming no IRQs are handled through the PIC (which ought to be the case on
>> virtually all systems), we'd have masked all of them before any APs are
>> brought up. With them masked, aiui even spurious interrupts cannot occur.
> 
> It can occur if there was a pending interrupt in the PIC before
> the masking happens, however such spurious interrupt would be handled
> by the BSP then, as that's the only online CPU at that point (at least
> from Xen PoV).
> 
>> Still you're permanently removing close to 1% of an already known scarce
>> resource.
> 
> I don't have more arguments that what I've already exposed here.
> I could try to bring this up with AMD, but I'm unsure this will shed
> any light on the issue.
> 
> Another option is to not reserve the vectors, and assume that if the
> vectors are used for {IO,L]-APIC interrupts some spurious PIC
> interrupts might be incorrectly handled as device triggered
> interrupts.
> 
>> Can we, if at all, do this just temporarily, such that later on
>> the vectors can become usable again? (See also setup_local_APIC() for
>> ExtINT setup - only the BSP would ever have LVT0 unmasked once we've
>> finished with our setup.)
> 
> Yeah, I know, believe me I've spent a non-trivial amount of time trying
> to figure out what's going on.
> 
> I even modified iommu_dte_add_device_entry() to block ExtINT on all
> IOMMU devices (on the platform I was testing only the FCH had
> ACPI_IVHD_EINT_PASS set in IVRS device flags), and I would still get
> those spurious interrupts at AP bring up.

Which means there's pretty clearly something they're not telling us.

So if this affects AMD (and by implication Hygon) only, can we make
reserving those vectors at least AMD-only? That said, to be honest
from your reply it didn't really become clear what you think of trying
to not permanently remove those vectors. Of course I understand that
with the behavior unexplained and undocumented, there's some guesswork
involved in trying such a less aggressive approach.

Jan

