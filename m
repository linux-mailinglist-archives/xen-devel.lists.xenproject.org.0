Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 676B952B524
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 10:50:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331759.555329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrFN7-0004TO-1J; Wed, 18 May 2022 08:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331759.555329; Wed, 18 May 2022 08:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrFN6-0004QG-Tq; Wed, 18 May 2022 08:49:32 +0000
Received: by outflank-mailman (input) for mailman id 331759;
 Wed, 18 May 2022 08:49:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrFN5-0004QA-5k
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 08:49:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dc4ac87-d687-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 10:49:29 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-pL_iVOqPNTuFGjDRDw9GvQ-1; Wed, 18 May 2022 10:49:25 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR04MB3144.eurprd04.prod.outlook.com (2603:10a6:6:f::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.18; Wed, 18 May 2022 08:49:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 08:49:24 +0000
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
X-Inumbo-ID: 6dc4ac87-d687-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652863769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZuqxjQFW6dzwz5YDCHXMLasPk9MsOfkJ0ZHTIOeRjk=;
	b=E0zuryUlyryRGG5IlEl/+8gEnbV9mMe3cZoHDwkpUw/iJjtnWlS0L09hTb1wZQNfDVsklh
	Jq5FoPwMd9u76Y0GhJGSEEUzenmR337XZK1YrMUCvjSImcOgl/5wSNUvdL1cRHB5x1QLCn
	cjVWqRY+9kK2gEkfT8Y6VfJRRTxRI9o=
X-MC-Unique: pL_iVOqPNTuFGjDRDw9GvQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTDZARfsCtNf/ZiuTNkw0I83VIFC8hi00Hx7t2qSURSYe/lJPykRIwKg5gqb7qdUCdLaHxo2rewLvYl4vuZX+RISPiGJhU7BS2NQ+trrw0bgAOIUq3wyK229M/GOZ/Mc//Rc1oZxBdVzJwSD9RpDB0yJdBl2KGj/KkdnJYivlK4W4CcZcRuhUVnTII+n+3fjjTkUPD6TKn/oYQzri5Pv9NFb8a5TSYoYMiDdDV0cgqXiKW8rxcRDPKIRpwOpEauORCnSmpcSFkcogiu8mEId69fWJ1VBLNOrzBad1r73uXxflg0Xl2Wj7S9M3TLnBN2W06Vv5xAnJJPBqMGXTclUXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZuqxjQFW6dzwz5YDCHXMLasPk9MsOfkJ0ZHTIOeRjk=;
 b=Eqxta5624khUXXv+6Dass3sxlktLQAN7HSOlwhDNnWX8CP0BE+DrZgfsfxdZVOKXQf5bntUuCZsw9en9SDd10V1ubMo/LQMVmWntSif7mBfKB8ZZEOYYEbUjIEKb7N/CPrjpJqYDJ3VfhJ5p+AYdkzt4BFA2B0hzYmh1fwUmCb7JiUY9qrhLP0x9UaShoeZ0E35v+ZFBonqKTKmqTMGNPhG4TVatkiF2/MJCBlXORcRlWD3wRGEFYCrAgwYylNkRK1oWMiAXa31u8VH0YD2Tf/Oa807BUiuocz6ZCe49XZkkmsozf0le20D75IBIPYaNv8f9IoQ9noieFY0JFc9kAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c7878c92-41e7-4628-34b1-1cb409335bf1@suse.com>
Date: Wed, 18 May 2022 10:49:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] x86/flushtlb: remove flush_area check on system state
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220516143116.28602-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220516143116.28602-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0019.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::32) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f469ccc5-cd3e-4601-6b9f-08da38ab4ed9
X-MS-TrafficTypeDiagnostic: DB6PR04MB3144:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR04MB3144D6D44D9FC5DE35BD0718B3D19@DB6PR04MB3144.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GUxoI5Xn0ut1wsDpCpkT0eY5xz1iZ3XGtePqd/iNQD9WZZA6OyHDnOFGUWMuNpMIITiqmgfh1zfjdPA+ZD8Ix6pKdkPSdAXMjDMeU0eBYTMlQ8D4Mmz7Lv7NJtjNWozq0UYy+pjVlFQrHSUtU3V4ersuYPQv3qINSa6flg1uxlyfRXaVnqA4H4tA+sxlK9Y5g51vCVFvMR8wGMR16DIPNwA+JgSA19wyRpY7/4W+huJxkj1MfMeJgqYScB1Uk3pjkGTJZXQtu/xOBtRp5kmXZ0juqA/Pcsud9QShgbOnlu5uNWChKjNfMrbd24wFwHIZ4qQqtoY4zxD3+A9VVkiUWsQ24ahYhVGX7rJ21tHeHp8ALDfxO8DMPUz3r4xJRCUw8HqVoU8Rdy2DKJJxYraIIYisBq0jpMc2pEsYzLVMoNrGXrOYWjJHpRvVLpDJje3nycHUaOi2OOuNDq9pBG7YXRWVu3YfqHW7G9OzvreeLXZyjqIDrakhYL+8m6NiHGSqOXoN6RTPq1Qi8tr7/eGo1yhNqdvb7TCzlqGlLhl0V0lWalkSqNZVt3ghwWJvKcYTkO+SbbDCbEswujy/0dUjWlMcYcPuGmfcTUpOG5Ocg8PcWAlAxF+NRSuhNRCk42lJuBLQURMiLL7nr/Vjf6VlgjeY6Ml/qrE2skw4oq7EPw6WyNOo6AgwPn3djRdn7yM7klT7qeuZZnyjR6fKV+KNBOgASRsX+OLAlxV5RTGFDNw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(186003)(2616005)(5660300002)(26005)(6512007)(86362001)(66476007)(66556008)(66946007)(83380400001)(6486002)(54906003)(6916009)(4326008)(508600001)(6506007)(53546011)(8676002)(316002)(38100700002)(36756003)(31686004)(2906002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlZoRU1DWmd1WnZ0aXpydTJlV0pLcU55ZEdmRmFvVjFIbTBDcUppTlJ3NjRo?=
 =?utf-8?B?Vm9Zei9Mc1JkdG9sTWJZY3AxaDFMU2VIZHloNHkvNkM1bUp0UXNsa2hNclhI?=
 =?utf-8?B?cjZDbWM4VUhsdVdoazJJUDZQa085TE1XMnBaYm9IaFRVeXJMQlpMSms5aUVY?=
 =?utf-8?B?VTUveElpQTBrN2NucTdzVHdxU3dGdTdaZC84MHdRZjd3REMydGt4emQvMGs2?=
 =?utf-8?B?TnZFd0UrNWU4akVwbW1jUS9oRGhVcDRxNEI3cEQ2WVZ4VHl2Z3BkNmRiUHNW?=
 =?utf-8?B?bkdjRHB4VzN1RzgzL1JTQ1RUM05pQVh0b1o1NEhVUzhKczBIbkUwZFBtNzRV?=
 =?utf-8?B?Z3B5ZW00TEJuVXVXYnpxODJCS2pyVXVUK3U3N21NUUFUbWZmTVg3aGMwNnNn?=
 =?utf-8?B?N3BtTmVaNlpYM2xnckc2S0VDa0tqY0o5SGhXd3NMS2VmMmZEeU9ucXBaUExs?=
 =?utf-8?B?cGFzaU14cldKR0xFQm40b2hoZ1Y1Y3FML29Mc0U1WW1hdGZJdFNKV0Z2eVRR?=
 =?utf-8?B?U1N2a1hDWG5xTHIrRVJsbDg0cmo5TGxvcldTQTBHTXJEQVZQbHJHZW1tR3hM?=
 =?utf-8?B?Mks3ZTlzUXNEQWlBRmE5VEJTWStOWEkwSEROUWYyTklvVzVWZTdPb2ZMdStQ?=
 =?utf-8?B?eEJ5WGtDOHhqbWRqR3RYUVpmOGg3VEEwcCtGTnBQLzB4SWlRTFhhM2VCbllB?=
 =?utf-8?B?N1p5UE1LMVFYbzNZT2VEQ3I1cWt1TzRDUHlzK3RYS3U4RTI1Skx2NnRxejlF?=
 =?utf-8?B?Y1pLa0tjUExPbE54OU5KUXFZMHNpL2xyb2pXMEVWZkIrQUwvVDVqeDJZZHRo?=
 =?utf-8?B?RzdWb09nY21jK2FCQ1MrWUY4aVNERGhPcFp1L3grRFJqY0luWVU0b3I1NThn?=
 =?utf-8?B?aFBEaGVZaWVFWGxLN2pYUVRtM3hXblRkWEYvUUNHOTVBRERELzhobFVCK1hX?=
 =?utf-8?B?QVdMYjhFelB3VzVyZExKVUFoaHpaR05vODl5c1Bsajdod25HOUNHRXFyNGJL?=
 =?utf-8?B?SkJ1RGRZRi9RZmUxMVdHZ2hLUDhpQ0w5UUhEeCtkL2FqTTYxUzNWZU43dm9R?=
 =?utf-8?B?VSs4UkJnclphUjRQRjdKeFlQS0RQdXJSU2Y3V21aTytUQkNEUFFCYmk0T3FD?=
 =?utf-8?B?VjNnZGdQbHpPTXVaNWRmd05lQmdhZGdEenNUOGFNcVBpTmFPOHFUTTJvdVNQ?=
 =?utf-8?B?aFBpMmM0azV1NzF4U1pPcklMY3ZPTU9venhiaEs2aVdpcFVkRjNPUXpGVnpy?=
 =?utf-8?B?UDNHcVN3T0JOWjBIMWFaTk90b094dnRrODYrZlNRTllrKzVaVlZiSnhqbmk1?=
 =?utf-8?B?QTAzL2txUDh2NVE2YzhWVk1STWtDVmtqUGV5TWFFV2tlOEJPTUlXRml4ZHdn?=
 =?utf-8?B?RitYbzk0d0VoTEE3SloxRFRxRW42a3RORUVUZHk2NnhGQm1zNlJvbUY1K2ov?=
 =?utf-8?B?cXpKUytPWElkV1I1YzZQWlo3b2FncUVzdksvM0xIbUsxRFB1Z0lQRzh1cGFn?=
 =?utf-8?B?NFhaMi84Y1BpZjBHZHpoZjFnalErZkFRUlVsRmZ5QkNIdUk2ZkZhSmNRRk5k?=
 =?utf-8?B?dVdCTW9mL0RTYldDL1Q0djZyQW5QZUhYMk1YVHFPWmJWK0loNHVzaVdJRm5o?=
 =?utf-8?B?SGkxbTNveWZ3TXpPMUJ5RDRYRTNlU0oydDV4bDhWek5DdkVFczEvNi9SMGRY?=
 =?utf-8?B?cDhnUVdkUTNCRytIcFFDZ0RPa2Nma1NxSWNTZjNBU3dCVkxGQ2dMTG82cWVF?=
 =?utf-8?B?aWQ4aHFtUThMSldvRjhTU0p4Sy8vaTFvMFlwMGRFdml2TC9reE5PeU8ycGR4?=
 =?utf-8?B?OWN6aHZqTTdoS0UvMWJodjJLdU9hSnBnNzlNdlRvOGNXZmNLQnFiVlBtVFNi?=
 =?utf-8?B?dTc1cW5wTzdwbHpBVWVTOVlaUWU4QlVMUWdaYTVpVG9ESHRyalJ2T21ZOXdi?=
 =?utf-8?B?VkEycy9FS1Z5SDNNMFdCOXJrdk9WU1UrQ21MZmZJUEVScnhmRWZBdzE5L0Rk?=
 =?utf-8?B?aGdIUUZ0c0NNTVdZdlJzYTV0dTNaWTZQTzVGeStobmxNRXpjblE3T3hzR1Bx?=
 =?utf-8?B?MGJDbFQvOFMrV1FVMXlXdFdrMVhRYnRnQnliTnJxekxyNjBVNFFtRGQwR2xh?=
 =?utf-8?B?Qnk5Q3JvRDBTVVRYU1dtOE91aVVhU1NXMVBpRzQvU3pGQkRPL3JvdWkxQWhz?=
 =?utf-8?B?RE45RFphU213ajJ5bWJWRHhSbnpRVlJqdUZHbGtDZHpPWk92OUNVcUo0TXJv?=
 =?utf-8?B?blRKKy8weDBjOGNqL0oyNjZBcGE2ZVdzSUNxdUZ0TGYxSE9pc2gySGg0ajRk?=
 =?utf-8?B?RFlSUm1Ia2tKVUdnVnViZUpzUlJhRTQ0NmFaV1lqUUpQd2N4NG00dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f469ccc5-cd3e-4601-6b9f-08da38ab4ed9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 08:49:24.0874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQ9rctCllJIOVj5yeZotREOWB8c96N8wz1R7ElKvQiVt7RX7M1uZzR319+30Z/14JYtxzZN9vF1y8AtW2rsDhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3144

On 16.05.2022 16:31, Roger Pau Monne wrote:
> --- a/xen/arch/x86/include/asm/flushtlb.h
> +++ b/xen/arch/x86/include/asm/flushtlb.h
> @@ -146,7 +146,8 @@ void flush_area_mask(const cpumask_t *, const void *va, unsigned int flags);
>  #define flush_mask(mask, flags) flush_area_mask(mask, NULL, flags)
>  
>  /* Flush all CPUs' TLBs/caches */
> -#define flush_area_all(va, flags) flush_area_mask(&cpu_online_map, va, flags)
> +#define flush_area(va, flags) \
> +    flush_area_mask(&cpu_online_map, (const void *)(va), flags)

I have to admit that I would prefer if we kept the "_all" name suffix,
to continue to clearly express the scope of the flush. I'm also not
really happy to see the cast being added globally now.

> --- a/xen/arch/x86/smp.c
> +++ b/xen/arch/x86/smp.c
> @@ -262,7 +262,8 @@ void flush_area_mask(const cpumask_t *mask, const void *va, unsigned int flags)
>  {
>      unsigned int cpu = smp_processor_id();
>  
> -    ASSERT(local_irq_is_enabled());
> +    /* Local flushes can be performed with interrupts disabled. */
> +    ASSERT(local_irq_is_enabled() || cpumask_equal(mask, cpumask_of(cpu)));

Further down we use cpumask_subset(mask, cpumask_of(cpu)),
apparently to also cover the case where mask is empty. I think
you want to do so here as well.

>      if ( (flags & ~(FLUSH_VCPU_STATE | FLUSH_ORDER_MASK)) &&
>           cpumask_test_cpu(cpu, mask) )

I suppose we want a further precaution here: Despite the
!cpumask_subset(mask, cpumask_of(cpu)) below I think we want to
extend what c64bf2d2a625 ("x86: make CPU state flush requests
explicit") and later changes (isolating uses of FLUSH_VCPU_STATE
from other FLUSH_*) did and exclude the use of FLUSH_VCPU_STATE
for the local CPU altogether. That's because if such somehow made
it into the conditional below here, it would still involve an IPI.
E.g.

    ASSERT(local_irq_is_enabled() ||
           (cpumask_subset(mask, cpumask_of(cpu)) &&
            !(flags & FLUSH_VCPU_STATE)));

Jan


