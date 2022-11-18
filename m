Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CCB62F56B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 13:54:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445724.701051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0tD-0001Wq-Ow; Fri, 18 Nov 2022 12:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445724.701051; Fri, 18 Nov 2022 12:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0tD-0001Ur-MC; Fri, 18 Nov 2022 12:54:39 +0000
Received: by outflank-mailman (input) for mailman id 445724;
 Fri, 18 Nov 2022 12:54:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LL5N=3S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ow0tB-0001Uk-E7
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 12:54:37 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27c26095-6740-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 13:54:36 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7414.eurprd04.prod.outlook.com (2603:10a6:10:1a0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 12:54:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Fri, 18 Nov 2022
 12:54:35 +0000
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
X-Inumbo-ID: 27c26095-6740-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqE8m1xTIuyiDV7kzXvO5NF8ijJ7bcEuK5JfhssCzelAAWjZGjEp4EBG5q9/R1Pwj19lRW+4UnjZUOo/kTjR/0/YtV871UZ66elkMOKVyLKx6ZPcIS3X0mwcHgJknvqgHq7GenbM+FGF7vSHUXsJjuNJ51c9QTodcVqxD8vbB2clpQXV/6oexn1qfKVBlSv91TZK14ZyKNIbjaTxoynsYwqqXhHRd/vgZ8ZKfM/AwQMCH1UEuwJWwq1LHzKoE9FFdfES5+FLSS5PLkIewOQpCMe1X111ISBccl3sEkA3bJtZviMNBzN+mh9fDquf8QuI352lszAI2oLHKT7UJVtlSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynITNQOy2MSdBMw6TKLXqzziVJ/84QzYmF6GpKMCjJs=;
 b=niJWk1Vjap6q2eF/8aeo5kZmTUBRzBLgOazG09cvhqNVq2F4/qrvonB/dXpqvu7gRQ8NFYbLkQDCyEz2lLKlkkfeF59kdgpnD+23Y7wfjjWphMja5GjeHYjZjbnL4sO0bDOMMaNMoSdqgVlHS9FIFbcpRM2HsMNrqE9LNZ4oLbDWPMBeWhEIuz+WwlO2GUvl1zXJZi7rJ1NepoKo/pnZdp8RxYL1ROLmqpz6R+4AgxUG2fTXX2lw0AVfH4+Xyj7fFvT68lHqbv0tBuRw2GU6vewWZaOagge2tfcdQK5H1V1kfmIYBMm4tDGjtV2wmQkz2VTzkr4HZ7eaNf8exOMbBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynITNQOy2MSdBMw6TKLXqzziVJ/84QzYmF6GpKMCjJs=;
 b=jWrIfYjVftkEoa2gDLxukSmUbs64ZeVyjdYLL0zn8s1EwOHYch01zI78xZl4kV9r9E6nnuowRNVKtco/eDOblsl1COjOPaUVxoB4e9v9Imt7s4xqVlq+bCKoRPa2lNJdyUhpcw7kIeRp41VMHumJEUSbW5rdGqmJKRPp4CVTqci84GXGOlm9hqZrR/VJyrwohhDgpU+EtLVw4B79Vz/XKCuZBucKPVvSqxthMQbAK2h/nq59oG3QByYdQ2AmfSKIOZI0+bV9TynksG0Hfv/5oz4wY5fpGZbhqG+Lw2LzK4I/WIW4ioOIzWH+17eEmd1BnqFjvE26gQY2e0Z/iMcMqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9a1e9336-a3b4-530e-5ef5-abf193492380@suse.com>
Date: Fri, 18 Nov 2022 13:54:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <eebc4393-c322-0a2e-f600-18d384fe2647@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <eebc4393-c322-0a2e-f600-18d384fe2647@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: e8bf0d77-174d-42a7-2ff1-08dac9640b35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wy8tn2FxNi3ZuQ87y9hF1+a1WpuPqqcLiUNzCJ3qG0xgTknu70rzETw35O1WSngwC+Oe8Vq/uVb7Qehs37wSc47M2bT4nXsDJgELz4ueEf3TG6WVQJeZ4icwyiToQ4Hj2xUJotRZaJ8QEVs92/P9VDTLY/N/WQgXqSveF8sPHnMAZ+qC/TP3eDkm8ipGrto3qfB1gzmvg0bF7zEefGhsFG1SCeOlG+QDSTksiC5N831ncIkIjpjlgJwxtD02xCuSe65D4UimIzX0vpFbRcBpUBYNForOLFCTzNkZTFxspbiloVLxdAn5Oye5ShVqX8+f83M5tm0YqIZRbzOYuO1Ybqud9TiUPWk1jIEuiliM1zRyE/iGVQro158W+ac4hTxf7HsIE0UkmvHqv4rqNkNlppOuSrqgFk9h9D4fAOcCMb6wAdiOVtBGFMf0r3EnF62Y53n0SazEIijVTMUWHHQiBFYSaZPrz6JRuHum4TSMiZqzR4fJ4u1hDkp7UxuXJedZmCkEALv50A/T8ihWctOrW1QJWERcr61qsMYjUbJ8M0cdu+klRxGckgaWmAt3Q5slZPjIn2AWprLjMIMJ/T+FSQfUEXLQ8TPcewvBxBRLobT69ShdLHa4Bc1i90/KJjba/eb2Z8Ptb8Enq8KZAvGFxZTLYv2vf1HVDvSojc/KKuWtQXXi5k+wnm14zAv9vyBxMj6RLiOUnx5huAjecHw5TGuFeZPYrUH2fcDFqYNMIPU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199015)(316002)(31686004)(6512007)(26005)(8676002)(4326008)(66556008)(66476007)(66946007)(478600001)(54906003)(6916009)(53546011)(6486002)(6506007)(5660300002)(8936002)(31696002)(83380400001)(186003)(41300700001)(36756003)(2616005)(2906002)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1d6UTBLZWROZW1NN0tCanlPRGltRmpmcjluTmJEOFFrb1lPaHcxM1dJWWNj?=
 =?utf-8?B?d2lSMDFLMUtkU2VHa2owcTlPRVBBQ1Ywa3lwSWd2aXhaYytaQmJFRlQ5MWRW?=
 =?utf-8?B?MkhmcnN3UmF0cjNVaWtTR2YrcUVSdVdwZ3dDU2thMlE3RERpdXV1ZlRsRUxG?=
 =?utf-8?B?cEk4Q1AyTmhlUWdZUlM1NVVnN25rRU03TG12akFkQnlRMnVtdmhlemgzU2tv?=
 =?utf-8?B?cTdqS09NK0x1dDQ4ZjhDOEpBOFhKMGc1ZFU2c3Rja011YVNRRmFhWDFEZE5I?=
 =?utf-8?B?VFpjZWVQS1A0K1B6cnA5VEI3YUZpN3dXRnl3WEZjYVBGNDVDS2xod0VPVURE?=
 =?utf-8?B?UmxWSWhuS0c2VWJUb1NIV01saWpLYkNvdnMzQlZMTHlMRmRKc3VuRDZPSXZl?=
 =?utf-8?B?dnNKclNWUjVQOUNMZmY1VDUzS2Q1ZHNaLzdaMDhhaDV3R1hrTzVXZ0h1Vmo1?=
 =?utf-8?B?M1BQdVlrbzc2aEZpbnpDMHBWRkdBVlh3TU1VTlk4UkF2Wis1S05BWGM1Yjg0?=
 =?utf-8?B?c0NRNW01U3ZYaGU1a2hEYTdVRWRIVHpxeUFhL1B1ZERMYkpyaVVMcGFjdGlZ?=
 =?utf-8?B?bFJLeENxL0pjTlVITWxxWVNFMFFlZGlPTFZGZTZkdXk2LzVRWC9QTG5SZFph?=
 =?utf-8?B?RUFtdG8weGhPSU9MdWcwMy9LdUpHSXpJQ3RZaFJwM1RYTy9jQWdHdURzVk1j?=
 =?utf-8?B?d055OWVueWN6S0RaTjh3SGdxM3BEcFAxalo2SGV5MlpkZ2hSQWhqZSsrTkRq?=
 =?utf-8?B?Rnp2WStDZWRrbVFGT0VsR2FqMjJCWDlLVjRLU2FFb2QzcEpvTXJSdnpod3k3?=
 =?utf-8?B?ZC9DcU41TjIvbEVRTXFsWmIxb3c1SEQyMStiWkxrTHZDMy8walU5TzdCQlJL?=
 =?utf-8?B?VTJvUDBXaHpRSTRnNHhZOCttYW1WMHlCY2JHaCthUWFyaTBIdHAydUhYUUg0?=
 =?utf-8?B?MUl4R3dkUDhXaHBEWWY4VEFLU2lJbWhZeXVDWWErSVI4S0ptdWdCUXY4N2Ix?=
 =?utf-8?B?elBIOXA5WjUxdGZpRXhnbkRhK3lTMW1kUlZoRnFGNXloSlVTdXA0TXJKNmFl?=
 =?utf-8?B?QW96d0lwQWhOeC94T054aGxnTE5SZWpITTJyd1FzUmVpR3BGUE1oT0hBcFM0?=
 =?utf-8?B?ZmxDaWhWZFNrNElQK0dTWEFWcmpRb0sySTF4Q0Z6UGx2ZmExck9TRGZhQU9T?=
 =?utf-8?B?N3lVU1dKQnJqTUxRdzVKL0F3WU11dmpSVE4wcm9zZmdGaXZyYjNwVnBjNXZa?=
 =?utf-8?B?bGlmUFU3LzJXZzJtZjB3WWdMMUR4aFBlUmhuM2lMTU1VR29YVjFzb1pNR0RQ?=
 =?utf-8?B?anhoSDhXVzJNOFU2dHlmb0lESld5cVNLR0hNNTIrUk54VkJwYTdvdGNjNCtk?=
 =?utf-8?B?My9udDBMZWlVWDkvMmxkMkY2ZzN1K2lEbmhjSDZhWi9zVGdCTlZvV3B3MitZ?=
 =?utf-8?B?cDExb1VBNElEN2JRRkVVTkdqT1AvUXBjaUQ4SDhrVGVhSVVDOWlJUXlseWor?=
 =?utf-8?B?ZGx6VnM4NFE4cnRxYzJRZUR1ZzRJa3BJU3ozb1dZWVB3dkJiRVRIUHFHYm0r?=
 =?utf-8?B?cG1XUjZlMEh6R1JpNS9HWVp5R29DMWZMTE8vWXNJV0J5OURKUlMraFlYQ2JP?=
 =?utf-8?B?bWZKb1ZFTElRTlBicEszOFpFSHFzc1NZcjQ3UFpGMkZpazNRcllPdTZkVVZq?=
 =?utf-8?B?ZTJZSHU5bVd3TERDbXpBeVFwbGZWNFVWUXNTS2tCSTdmZnVCWXhObElrMkYy?=
 =?utf-8?B?T1kxc3NYck5YelVuZlc1MWhlYnh4OWVFRFhQV3djWk9aVENQd1BBb1hrS1Ni?=
 =?utf-8?B?dTJBNTVodTJQVFArYm1TeGJxOG5RcjR5dER5NHo5ZkN3UTE2c1VydUovZmov?=
 =?utf-8?B?WHNodVRwRlU1NUJ2engvRTcxeFo4OTk2TXNvQ3dLZERqanQvbUQ4M1k5djBC?=
 =?utf-8?B?OUlhSTA2MDRnVmFLY1VlbHRhbjFPd3d6TlBCRmhPSzJubnEvQUo0SGRBd0x0?=
 =?utf-8?B?cTV6aHR2d0tEajZaK1pJN0FTaCs5c0pqZE1XYUJ3U2VrTVpqcUFuTmRvM3N3?=
 =?utf-8?B?WldLM0hPdTFZQkxNbDM3RXpZOW9CUVlseHVXTElWUGFqTHpURlpkWTRoWkkz?=
 =?utf-8?Q?yZq7GYN8LCAtmxB9W6cXHszs9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8bf0d77-174d-42a7-2ff1-08dac9640b35
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 12:54:34.9387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jw1wS2tcCmltqvPWNAG8NcGThquJHIsc8S2jNev2sidmFfr12wvl7nwaB9R33aIs42EhdQSdlyucoGLQ+mcHjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7414

On 18.11.2022 13:33, Andrew Cooper wrote:
> On 18/11/2022 10:31, Jan Beulich wrote:
>> Linux'es relatively new use of HVMOP_set_evtchn_upcall_vector has
>> exposed a problem with the marking of the respective vector as
>> pending: For quite some time Linux has been checking whether any stale
>> ISR or IRR bits would still be set while preparing the LAPIC for use.
>> This check is now triggering on the upcall vector, as the registration,
>> at least for APs, happens before the LAPIC is actually enabled.
>>
>> In software-disabled state an LAPIC would not accept any interrupt
>> requests and hence no IRR bit would newly become set while in this
>> state. As a result it is also wrong for us to mark the upcall vector as
>> having a pending request when the vLAPIC is in this state.
> 
> I agree with this.
> 
>> To compensate for the "enabled" check added to the assertion logic, add
>> logic to (conditionally) mark the upcall vector as having a request
>> pending at the time the LAPIC is being software-enabled by the guest.
> 
> But this, I don't think is appropriate.
> 
> The point of raising on enable is allegedly to work around setup race
> conditions.  I'm unconvinced by this reasoning, but it is what it is,
> and the stated behaviour is to raise there and then.
> 
> If a guest enables evtchn while the LAPIC is disabled, then the
> interrupt is lost.  Like every other interrupt in an x86 system.

Edge triggered ones you mean, I suppose, but yes.

> I don't think there is any credible way a guest kernel author can expect
> the weird evtchn edgecase to wait for an arbitrary point in the future,
> and it's a corner case that I think is worth not keeping.

Well - did you look at 7b5b8ca7dffd ("x86/upcall: inject a spurious event
after setting upcall vector"), referenced by the Fixes: tag? The issue is
that with evtchn_upcall_pending once set, there would never again be a
notification. So if what you say is to be the model we follow, then that
earlier change was perhaps wrong as well. Instead it should then have
been a guest change (as also implicit from your reply) to clear
evtchn_upcall_pending after vCPU info registration (there) or LAPIC
enabling (here), perhaps by way of "manually" invoking the handling of
that pending event, or by issuing a self-IPI with that vector.
Especially the LAPIC enabling case would then be yet another Xen-specific
on a guest code path which better wouldn't have to be aware of Xen.

Jan

