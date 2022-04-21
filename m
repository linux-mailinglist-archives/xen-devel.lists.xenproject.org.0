Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E0450A00B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 14:51:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310107.526746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWHk-0004wQ-8g; Thu, 21 Apr 2022 12:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310107.526746; Thu, 21 Apr 2022 12:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWHk-0004tw-5I; Thu, 21 Apr 2022 12:51:48 +0000
Received: by outflank-mailman (input) for mailman id 310107;
 Thu, 21 Apr 2022 12:51:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhWHi-0004tm-2q
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 12:51:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc4bb95d-c171-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 14:51:44 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-xAeJtrVBNUuV1hEsFJPtJw-1; Thu, 21 Apr 2022 14:51:43 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB8400.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 12:51:41 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 12:51:41 +0000
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
X-Inumbo-ID: cc4bb95d-c171-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650545504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rywNPPoj1p0qZQ6aCacAWvx2koG07iQjTQrkm0vQ37M=;
	b=g2fApB57DKwL/lfA9gYQZoXrmr9K188GqMeQnGmZNnp8C+0DRtOt5mPSkpiR7xwKgzLy3T
	ePVRq4cbGMotDYtV/YHZrHcCctGhtXSBt6J7lMCJosi6QcMid5rAr2j7QYta04WbXQRJuy
	xX5/8fV/LaJkD5a6qtT4K6M6Rfab4jM=
X-MC-Unique: xAeJtrVBNUuV1hEsFJPtJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mi+CfLeNWLt8xs9Asn7JLlTeBaXGrBfoVSZRSsmvF1vKrIyk7iU/PqWqpChlqQLh6E/djDAaJRe5GOmF1RosObtRaTBv0qoup3hbyKuyTJRRVTzXu8iC+jMCgL7ci1Pt5NItR68kHT6rrxz2bdRmq2Ins4Us91CVUKoj0b/dd5txQ/6X8xsrCJ4fbq8joxiRkLBtxbnF5kHmv1x6IGBopvgcX5jMIpdKT+75OLQbzOkPpccmvJHVJf0lC2+VDgKJkiRXDOuAbZL2B1PlImHjvZBtGIembFwKMQZ4tuOlixQ/hZbTlIpq59Z1wbAG9KSlbrwGMrWBVZZrppOTzvSFyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rywNPPoj1p0qZQ6aCacAWvx2koG07iQjTQrkm0vQ37M=;
 b=cb82b3lFLnHfQkOYFTU4B/Tqts7qrUsueaPWQCX2bj8H7Itd/St/kY33gP9SGch0S4OOV0wko3TeKDM1qAU9v9sepUhPZCUclz3HUbCCbvayrgqBdUbalmmsu5gwDIXngoo8+XdNrQyvne6b/CzubS0JNhiZnctmmrC8/4W6zBn+R3YSz3HORbWEtlDw7yie2VB1j89jArSHzTj9ml+qNAWa1NCWn+Jn5s5eXHgJizu03d99QfgaHc4Respmaf6MZuSf0vN3pLPtffcI5ucEXClAZT2xWpnNyNbDy4OoC7pFBerANTLmNLgiQ1mztuDaMt3bK1jWJ0SVAiVUYl6dag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c55ba379-0960-0be8-b0d8-53c974f1a404@suse.com>
Date: Thu, 21 Apr 2022 14:51:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] page_alloc: assert IRQs are enabled in heap alloc/free
Content-Language: en-US
To: David Vrabel <dvrabel@cantab.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220421104305.878204-1-dvrabel@cantab.net>
 <34c410b1-969d-8b18-6b46-fbec72effc95@suse.com>
 <0b982410-9efb-dece-3bcf-3c6f2e1dce2a@cantab.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0b982410-9efb-dece-3bcf-3c6f2e1dce2a@cantab.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0022.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::16) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00e866de-4992-4a61-acf4-08da2395ae89
X-MS-TrafficTypeDiagnostic: AM9PR04MB8400:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB84000A109637B3C2F81B50CFB3F49@AM9PR04MB8400.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i7OjV7cjeis2iGDhGf+Pz+E2LE3iM5uRaqNPDivX+D8lP0Cm4u/WEbxHX8cH8j24U5MkDPro8do+jhG/OqgZma0hqQHslMHWOO5h6IIPAIx5JDypxBGzoli+XBpM3ChjXtgRTz4vT2TRgnSiHOjmro+oHpxF3fEXRH0YzxL0pSMSsit36Kvds7F/pKLLfkpwwBBzzy8ee3FCTKdS9H5hDNSdItnpAD87XZMHitSrzyoZdVbeHoZ+u7osBROavnbzNydMucikMRFwk5AoCi0LGvrFkNodjmUjDPH9ub5SjFba2dnZOtdZZtv4RFwQpLPpNEAJFLBPoopoHaHBTcYY/xehfvxgbjhuuxcaQ9RKQ9uB27T2++FaPeLJOHqtFQLZ+5trLLO8qAZQ+1Lx+iuCaeed1DIEQaayPHWT/0YjqoaXkmtXGeryVvwy5dHk7mnkEeTzE92SflB1iYiB70LEve3AB0XGCqRScndx5rRSrj4avGv6le39sSPpRXZgOn4WmoZdLzyD1Mi4opd7YsnFECybTgrrM6mSlEECLI5J0iXO4fR4GRJmDnH38L7O+RQ1NTjMTAdH26mk0r6ivYsQ385hpjT8GkQY9yjkfPOCJQwiLVYVxVOsTr4u7SY+L+btOGgCPvPO7/52jk+Z4Pt8XazX52lYdFwSplUABD7fBWbAbA8+eQ6hqA3LNVkrruiDZd705ylIvrgiamVLijFT4/zAzQVAmebNA1LPf0scGmq6amJdJKAa7g88zkJ2NwaI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(66946007)(6916009)(54906003)(66556008)(36756003)(316002)(31686004)(8676002)(4326008)(66476007)(2906002)(8936002)(6512007)(508600001)(86362001)(26005)(6486002)(2616005)(53546011)(186003)(31696002)(6506007)(83380400001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkF6bmZZWGt3TjFZd3ExeThJamdRZjRoa1gvZXlEZEtmRTZKRm5QcDc3clg2?=
 =?utf-8?B?Sk9ORUtDbDlMWTZhNzkrb3ZBL0xBTVVUME04ZUo1NlRkdzQ2UXhsZVJvZWFn?=
 =?utf-8?B?bjhrUGtHRTRQZ09VSVEwanJyZHVGQlRBbHRESWlYUzVGTlFjNVJ4UEJ0cUV2?=
 =?utf-8?B?aVlHTExNTnZQNGtSVEViODlTR2svYnF1OUh2K2FCVE8vUWtud1M1a3hEc3BM?=
 =?utf-8?B?V0NnSUZEMUJJVVpRaU05ZmFXRFB1aVVIM1c4SkY1UWkrV0dDRFlVaDM4TXlH?=
 =?utf-8?B?UUVmUFlRbHcwKzVhcmhRT09lZ1VOSFZNR1lTZThqQlZqRjJhNHVpRi9hNksr?=
 =?utf-8?B?TnY4YVdOK1pwSlplWDIzVWI0YkRHc0lxYVN5RHBFRXNwUm8wbWRoY1BGTzcv?=
 =?utf-8?B?Y3JOKzZJbFV5aXBDZno5dlBTTkhRMStSVW5GUERveW1JUFUwYnlSL0dqUFI5?=
 =?utf-8?B?SU5JM3RxUzZmQnc2VHA2V21xR1ROVXRvTGgrZVFrUDFGcENrNkdUalkxeElI?=
 =?utf-8?B?WlpCNkJ3V291eXF4QWEzYjFOUzVvSThRQXJhTURsOC9NbUppRHVwRWtYZ0lk?=
 =?utf-8?B?WGNtTmZ4Z3VkWjVwL04wMzdPR08yMTBUNVNYSmE2dTRKRFlxbzYyUjF4NWty?=
 =?utf-8?B?WTdXVk0vTm4rdXZUVjlwNGMwdTU4UFdBVURmWEtnVzdGRGJ5QnJHZWg5bDRi?=
 =?utf-8?B?U3Q3T2lVQmNMa21kdm40R2kxMXJaQUgyODV0cStCbGFNK0pJY2t6UmJTS3h3?=
 =?utf-8?B?T0JGZHdqdlY1eXkxUk15MTBZRFB2cEZBUE5KZU1FTFFRSFEyL2duTWI4TUxJ?=
 =?utf-8?B?WGFiekY2S1lSRFBsL2I5TTYzdTZ1RlExM08yNlNZczJvREhSVUM3eTMyMDNq?=
 =?utf-8?B?YklYV3N6NDlhZlNZaTgrM3hTdlphSXBDdkkxY0Vob2VBeDdXZFA3NXJkUyts?=
 =?utf-8?B?QWl5cEFKcFlCZFROdmhDNTNlZ3dydmdKSnVVU29NMzJxS2FqRStVTEJvbVpR?=
 =?utf-8?B?dGhKSlVhRGs3a1NxRUZNNEdLSnZhRzVJUm9GZmJITTA2RlRNb3A5QXRRQzcw?=
 =?utf-8?B?ZmlvbGxxVGtqU1psbGM4YmhZRDlBM0dtMWVzaCt1QmtkMEdENUpnY2tmSG5a?=
 =?utf-8?B?STBHY0ZRUitadWdkdmVtVkMrSVFMcXp2MXdDTUdiUU1JTnQvcFVrNFNWS2ZF?=
 =?utf-8?B?eGdqQVdQVHBmUDZPOEczTDdQbm5WSU4xdnFoblZZQWEvR0VCU2U1SHVTM01X?=
 =?utf-8?B?dTVITnhlR2lYeUsxdnM4eVd4S2NYUGhNeno5cDlwNEUzenFLL1hocFRuYTlR?=
 =?utf-8?B?SUZKVDRBTUk0WVFjVlZPTFJkZXFLVzc3aGNCWFl5VzlvRjVSVjNSNHFieG9o?=
 =?utf-8?B?bkt6T0NTUGllTWFBS1BIc282SVZBcVBvTXNUVGZPQmluVitaUlgxYXVaSVly?=
 =?utf-8?B?MzR5VWFHVFIrMk1FdFR3TVNuaWhEaEhTdU9NQ1kzUXRXMGZrY1QxRnZqcHpx?=
 =?utf-8?B?YmNRcUIvUER0VWlRS01IU2QvWHlKTVl4RnZPMzB0LzdFMERnTGxrYTI5MDd2?=
 =?utf-8?B?M1pDU05iUmY1MmFZTURBcWtQd1BxTWRDRW5Nd0RxZnpyUytxWnJIZEExcGp1?=
 =?utf-8?B?RDdXUDZ2dWEwQ3ZTUDRNemhwdEdIVmlTeXlRRnJCeHFGbWVMaXh1QStUQTlm?=
 =?utf-8?B?a3ZxWHdMUEdyQ2ZWMk9UWTdZRkxPL3FTWWFHMTFxWTNNdFF6VWFGZ2M1U09P?=
 =?utf-8?B?Sm5ZVmp6NEM0eXlrVEhraC9HYVVsdFhLZ2Z4eHQ5Nk1uN0tuV1hRMTJxRDVT?=
 =?utf-8?B?NVVwUm1FdTVoYWpOaTJRREZFbEo3MXU5cURKU2loLzBkYXAwNlNYbSt5dUY3?=
 =?utf-8?B?YUdZdEhqQUpWR2wzdUt3YUxSNGJ3RVNxWUFHRjZTaWZQbXlZZCtxc3l6dzkv?=
 =?utf-8?B?NXVGNWtSZ0xJYmZYeU81Z0VPM1VkbFozZzRQQ0Z2SndDQktnRDZNN0JuYkJQ?=
 =?utf-8?B?TU1zc2dYcWo0Tm5YMU9mMHNTQ0tRam5LSzNlamsvNjJScUR0VWIzTExSR0Va?=
 =?utf-8?B?TDh0N1NYeWhsU0p3WUhLcGlpcUd0RWM0R0prYUkwNHpQbkNOaUNjMWV1d2U4?=
 =?utf-8?B?a21QeE5yaEw2RXEwa2hzSEUwclQxNUhWeGE1V09OSVc5bWpaUDRVTzNnRTdB?=
 =?utf-8?B?RURwODVPQ1EvR0RFZEwrL3FHeW9NQjVqUVhHQ2tRWS94Qm13aVFKd2I5VjJ0?=
 =?utf-8?B?K1FwWmp3UmJzdGtyUWJlVGFydStmM0lUMVhBNTRXNmp2WkR1SEZIZnU0U0M5?=
 =?utf-8?B?djlnSnlGeHpsZlpyOTFpS0JvQ1FGRnVTTHhCVjFuMkFZR3BUYlFpdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e866de-4992-4a61-acf4-08da2395ae89
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 12:51:41.3987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yosxLlb8Eu1wSPWk7Uwz19K4xe5Xe1Ox2dPmKXXi2J9b0PpRUS5IqyoRQs4VPzdQGRJWVEc+cSFA+K7/0PGvgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8400

On 21.04.2022 14:23, David Vrabel wrote:
> On 21/04/2022 12:38, Jan Beulich wrote:
>> On 21.04.2022 12:43, David Vrabel wrote:
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -984,6 +984,8 @@ void __init start_xen(unsigned long boot_phys_offset,
>>>   
>>>       console_init_postirq();
>>>   
>>> +    system_state = SYS_STATE_smp_boot
>>> +
>>>       do_presmp_initcalls();
>>>   
>>>       for_each_present_cpu ( i )
>>
>> I'm afraid it's not this simple: There are two
>> "ASSERT(system_state != SYS_STATE_boot)" in Arm-specific code. While
>> both could in principle be left as is, I think both want modifying to
>> ">= SYS_STATE_active", such that they would also trigger when in this
>> newly set state (in case registration of the notifiers was altered).
> 
> These asserts are already too-relaxed given that there's an early_boot 
> state.

Indeed they are. But that's not an excuse to make them ignore yet one
more state.

>> It also wants at least mentioning that setting this state is okay with
>> all uses of system_state in common code (where it's not impossible
>> that x86-isms still exist, having gone unnoticed so far), just to
>> indicate that all of these were actually inspected (there's just one
>> where it looks to be unobvious when simply looking at grep output, the
>> one in keyhandler.c). As a result this may want to be a separate,
>> prereq patch. At which point it will want considering whether to put
>> the setting of the state _in_ do_presmp_initcalls() instead of ahead
>> of its invocation.
> 
> Not sure I understand this comment. The transition to the smp_boot state 
> on arm makes the state machine on x86 and arm look _more_ alike, thus 
> common code should be happier.

I agree that it _should_, but experience tells me that such expectations
do not hold.

>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -162,6 +162,14 @@
>>>   static char __initdata opt_badpage[100] = "";
>>>   string_param("badpage", opt_badpage);
>>>   
>>> +/*
>>> + * Heap allocations may need TLB flushes which require IRQs to be
>>> + * enabled (except during early boot when only 1 PCPU is online).
>>> + */
>>> +#define ASSERT_ALLOC_CONTEXT()                                          \
>>> +    ASSERT(!in_irq() && (local_irq_is_enabled()                         \
>>> +                         || system_state < SYS_STATE_smp_boot))
>>
>> Upon further consideration: In principle IRQs would be okay to be off
>> whenever we're in UP mode (and hence flush IPIs don't need sending).
>> Provided of course spin debug is off as well and no other IRQs-on
>> checks get in the way (like that in flush_area_mask()). This might be
>> more robust overall than depending on system_state, but I'm not going
>> to exclude there may also be arguments against doing so.
> 
> Not sure I understand what you're suggesting here. Do you mean something 
> like this?
> 
> #define ASSERT_ALLOC_CONTEXT()                                         \
>      ASSERT(!in_irq() && (local_irq_is_enabled()                        \
>                           || nr_online_cpus == 1))

Yes, using num_online_cpus(). I'd like this to be at least considered.

>> In any event, looking back at my v1 comment, it would have been nice
>> if the spinlock related aspect was at least also mentioned here, even
>> if - as you did say in reply - the uses of the new macro aren't fully
>> redundant with check_lock().
>>
>> Also, nit: The || belongs on the earlier line as per our coding style.
> 
> CODING_STYLE says: "Long lines should be split at sensible places and 
> the trailing portions indented."
> 
> If you're going to have rules (that have, IMO[1], worse readability) 
> please document them.

Personally I, too, prefer operators at the start. But that's not how
Xen has been written, and this aspect didn't change in all the years,
no matter that ./CODING_STYLE doesn't explicitly say so (and it
doesn't state quite a few more rules that we try to abide to).

Jan

> [1] Compare
> 
> a = b
>      + dksaldksa_daskldsa_dsakdlsad
>      + hds
>      + dsadjka_jdaksjdk_daskajd;
> 
> and
> 
> a = b +
>      dksaldksa_daskldsa_dsakdlsad +
>      hds +
>      dsadjka_jdaksjdk_daskajd;
> 
> Which one is more clearly readable as a sum?
> 


