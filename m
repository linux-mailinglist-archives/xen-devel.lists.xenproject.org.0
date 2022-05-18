Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9311E52B594
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 11:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331768.555340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrFeY-00073D-Nm; Wed, 18 May 2022 09:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331768.555340; Wed, 18 May 2022 09:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrFeY-00071Q-JA; Wed, 18 May 2022 09:07:34 +0000
Received: by outflank-mailman (input) for mailman id 331768;
 Wed, 18 May 2022 09:07:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrFeW-00071K-9r
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 09:07:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f26891a5-d689-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 11:07:31 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-HKP8ZZlFPRaZPO0ZXBZXLQ-1; Wed, 18 May 2022 11:07:29 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6068.eurprd04.prod.outlook.com (2603:10a6:208:140::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 09:07:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 09:07:27 +0000
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
X-Inumbo-ID: f26891a5-d689-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652864850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6V79cr+/wNigRiUFictH26zhYiRXPF0TuxzZLJBHB6k=;
	b=bH7LstWjcLmU83p9Qo1wV9YVTVGE6Y7KA52qbLKtFNv1lNBWGEbWMZHN4BvBVBNWud9nNM
	UspEn12Srd+5gS2U1QtkQZiy0cW1D0GE8qhb+e/Vi9GGsyJPBkG18a1IOsq0CED5cFwyu1
	hIzlVV/HpfHhOFomDWuywnt1vMKZgxM=
X-MC-Unique: HKP8ZZlFPRaZPO0ZXBZXLQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeCCOgvqIU+o+TDhWbxuaphM1XDHG/TLestUivApHsBCLXWIFUfgjlhns9GGZhgQAESyscpQpQgY1NHsNIFaL18OjePONVGP6/UtX8YWFyUwl2XCLqM+nf5OQ4nFga5Hyzj3ns/t5w4vIeLkLubqPWIOunG5BEf9GgIp5WAPDipQpF53BvqaWPeGtd8w2RlO2r+bSL6GOSdNDiVX23nNsxRgUrenws/dfGUf5ILONCBB1865UM4YCwN4TLBI/FMf2ibhFgykbuvrrX9oLP8A+Z8apKddVIrgpnOMP5+pYnNWtt2Q8/0UpPMq0evxo5oip0sZlXF48nVxp7LaEud6dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6V79cr+/wNigRiUFictH26zhYiRXPF0TuxzZLJBHB6k=;
 b=H8oAnl9mQMgmL5+C6aOZKWTdGJ3vTDgSlsUcZ1tZLj7Bhp/NOzjNFGXc/rXGNImbGq78HY9OjBW0M2k92pmE0XRxXGP01o+NM4ALJhgKwwY61HBRtctk8ZJSO00acGgRoDQIOrPHagy9/G2YCE/zpmPNJmD/1H8AeuY9NaABldLj6fS1t2xkDA5h62mcdKi1PDnXjci4KczyiNn1DTBXipu+KeFLRUyKDzr495nvueTpcEIZFokXMWnHdJoqVwbwF2CCs5A4jwutXxErNazz2/p5/OyNlqdjNqqgBemJfg4p2S33r1dzz1mSp/D3JBJjDl7ftR3udbHl9ATt1hApEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <241a38af-65cb-a44b-4910-c1c310b7bfb0@suse.com>
Date: Wed, 18 May 2022 11:07:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] x86/hvm: Widen condition for is_hvm_pv_evtchn_vcpu()
Content-Language: en-US
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220511151423.20241-1-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220511151423.20241-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0101.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4025cf40-9384-48f0-5e5d-08da38add4a9
X-MS-TrafficTypeDiagnostic: AM0PR04MB6068:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB60687E884D168841874C14AEB3D19@AM0PR04MB6068.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ebbJOxuhIiabGBKt8vc/yxxRNIWSdNWENnLDLwYxr8JhFEC+L2L89JYf5QthGCoFuUt6MCl2U1I2qvpFxURZ5mi30il/hlgCBoIuDjT/7zohhf5khnWaGx7lsuw6yu1a7U6jucTm33uEaUgTPo/OwVmJksPtqqQRmBg6ojV+hQo0VCfKTn1Q7oyDHh+wKVm0SCSEbgVzPHgvGdNmo/1yxvt0yy4VvBzbfxnthvYP1NhZi8+0GGOVX96i5DfavxUyG0eaHFkbY53p6lXpqfYPhyun7fErlECguU2dVfUx10JtsuVbLfhj5r6a6kepAEbgC/ekQ796luBoDshuHX6TQEOII1KHIGO5zrdr3z9L+5lMuAOISuDB71kiRqYyiI00qYjBAf8/aWTQO3CHIsIRB23WX/87Wk7MovmPpJ8lFEmZk0W2Bfqz07D+4/y/SYN4yZozANBhFvfWdkpQplIK0DzLRYc7n0CWMlh7jyYxNoHcPHyTVdcOmP7lsFANOcFRerhHYUVumEU+jbVLP0slkGqp+0nUzaqQ0nnFjgoP9e3hmy1rs8fBZxrSHtmAVGFKkyWsddM89XJ71HoqC2ggyIdRZ6Sc5/nK3iqalAWcef1Yj9oxBCoqk8P8nYIL8RYQufYzikZrTTGWEPCIbQc3+OgVhbA28VbbM1jucPxnqztV/a34SnHusIejw5cmpJo9TQK4IK4Qlrakkwlfyhsdv5YAYADxa6hjIRKz6PIZIZvDPqfgP4oG319DOVS0NZL9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(4326008)(83380400001)(66556008)(66476007)(186003)(5660300002)(31686004)(6506007)(66946007)(36756003)(2906002)(53546011)(8936002)(6486002)(26005)(508600001)(2616005)(38100700002)(31696002)(86362001)(54906003)(6916009)(6512007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW4yeENyQzBsSCt5QlF4Zzc0WHhXd2tnVWpNTHkwWEFGSG1RNnRYVUpQb2JH?=
 =?utf-8?B?eGR0WFlhQUFtdGRPNXZMYkFWVDhDZkVoditQQlQ0UEoyZm5obTRSUGcyWTUx?=
 =?utf-8?B?S0FXSis4blZEeUo0OVBDN0EvNlUwKzBQaUpCNmlmczRXbXYwc0tuRzFLOFFv?=
 =?utf-8?B?R3JCUXh0UnYyclRXVnIrQldGWk82WE9HNjljTk9EN1Qzb0NSMGZUN2FFalhO?=
 =?utf-8?B?V0g3QmxWV0NxRnF5SjlrdisrblBHTEkxUWNnRllGSVVRWDhXWFZxellodmMw?=
 =?utf-8?B?R1Iyb3R3SUZlbDUzb3Y4UWV0MTJmWVFDYSt5MG8rNTRUaStXeDRHck1xKzZW?=
 =?utf-8?B?OVd1dXoraVlKcVFZdmF2dW9jVW1tN3JPNTllY3hRWUh1TDBjcXZHL2VWOUk3?=
 =?utf-8?B?MCtvOHFrZmFmWUdIcC9ac290b253TnRjWDY0LzA3VEpza2htL2dhMmVaMmpm?=
 =?utf-8?B?ekpVK3Ztd21GUU1yQXl1dU9tUHF3SkpBbXhVb1Bzbi83dzJuanVPM3I3cGZ3?=
 =?utf-8?B?Q0ZxamN2c2ZMVFJTQXF0dEczWlFGeG4wMjdRU1k3d3ZlbHJpNU10NXhzTXFm?=
 =?utf-8?B?QjhtSmlNTmZPOXROdGZoZWl1b04zajBlRmlMWm1RaWwyNDhOcXdCVDJDWThN?=
 =?utf-8?B?SDdUZ2d2OHFSZVNHZ2JaUU1pNmVYeHBnYnMvTUZxMWVmZStTQjVNZlVWNC9y?=
 =?utf-8?B?a3NHQUpWR2tsOFRZU3lUNnFFN2tvVW5TSDhGcXFZVEFMTUp0TDcyRHp3U0Zy?=
 =?utf-8?B?cDlCMzRjekpwS2FzU0tNWkV0NFcyOFBvTGtSM3AzNmVjQVdxQkNMc3pGMFlF?=
 =?utf-8?B?cnZ5dlRmdE1JNTMwTnZwTDVaNngvYnQrc3JTQnZIem12aCtjQ1l0STFNU2x4?=
 =?utf-8?B?eVEvcUFPZVV0V2dkZ2NNZ2V2SmR3bWdoRFhSdndNU2FwNjBvSEJTMUQzY1RZ?=
 =?utf-8?B?NGR2SWo1UWRTQkxtbERDcmVuUEs0N3Z0Vk1OMEZYYTA2S2N3anNiUTVrdTFn?=
 =?utf-8?B?M282WHRZWFp6aTBQQVlLOFg4S3hwZjN3MjJ5TEJqSldnR3REeWE1OWRqRVVk?=
 =?utf-8?B?bkVyZ1o0T1g5dUpYcHhKSnpubTdCb1RMUDcwM3VWenFDM2NRNy8xY0VNaXVo?=
 =?utf-8?B?ZnlzWU1vMFRRZ01DUStFdklxeHpqUzB3d2NUanlXa2ZZUGtXY2RoK3dNSmtR?=
 =?utf-8?B?WTZMdlNMU1lwQk9ETE9UbXRRNUxXbjlJMXltVGN0MkRyM1kyY0hSaWs1VDRj?=
 =?utf-8?B?VXlTd3NxaHVBTFl2TzF6OGV6ZWN2MmEveHh1Y1YrUTA5RFo5dzFaVnhqbGJU?=
 =?utf-8?B?SERrTHV5cElQWlpmald2aEdSZmdtTmV3MGI3RlFuejBPT2loV0FZMW83cGNQ?=
 =?utf-8?B?OURtcUs3d1RFVXZ6Q0JoTGd4dVhiYlVzYzd5UVo3Q1hES0ZQTkdkc3VRa0JV?=
 =?utf-8?B?ZDZnSWxGS3RiWVV2QTNtMWE1dk5CTmtscENCVlhwUzZ5ZmFFVFRTRHZmL2Zw?=
 =?utf-8?B?bEV1dnMyZ1VzTmhGSjhqYzduZzVtemQ5ekMwNS9hS2t2QW9ScWgzaFRXL2JR?=
 =?utf-8?B?YzUvZFF3WkxpWWlGRlRIZHhTYnRpR3FpS1pSK3BhekFKM0ZLMnFJeHNVMjhG?=
 =?utf-8?B?Q1BIYlhOcnZZMDZERmxjVWZiOFdMeXVVdmIzVExrZkNLVXlLMktEYnNpQTd1?=
 =?utf-8?B?RXJEYis3YlZFQ3YyZ0p3NEMrT1ArWlNwYkc4Q0ZEMnJmYlRaOVB6N3VQTjJB?=
 =?utf-8?B?dnAvUXl1RERjQjUzNFAwOHppdURuL1l6STdmTXBoM1pZcU1hcUk0TWxBT2V3?=
 =?utf-8?B?YmlneVZNYmZkRWlUdmRkS20rL25ING1BUHJzVGZQSC8rRkhmemZLNXFGbVdJ?=
 =?utf-8?B?UHFLK1h1c0xmcW5HZTlPWWJBVmprK1ZoSTk4OU5RSzdzNk94NkRQSCtyVHpk?=
 =?utf-8?B?WSt5cTJBRmNxNEpodVUzYmJRWE9pbkdPaVJ6U0tHVGNoQnp5Mm1wK09TUFph?=
 =?utf-8?B?ekx5cWN4cVhzOTFac2NybkM5MWFTTEpWSS9CdFNRdkpEMWgvL1hpRnZLMk0v?=
 =?utf-8?B?RnlsRGFWY2ExSTVCL1lWb0JlT1pSZ3E0Y0RmK0dsYnNwd2NzTXc5S1FQZ1hQ?=
 =?utf-8?B?OE40RVJrbWJYWm9EMG5oa0dKdE54MjFJclhHM1lwYmNLMDJnOTh6U2Z5YURa?=
 =?utf-8?B?by9ZNjUyejhiZEVjSUw2RkhnSWZHNWkvdzJxV20wamRjR3VEcEJGREgxcThM?=
 =?utf-8?B?MlRYQ25qS0loQ09LSS9VTVpINERsWkYxTzVGdnBHM3pmbW4zTmpKNndiRk16?=
 =?utf-8?B?endhOFpJQ09wQzJodnBXVGpndWhZZDkzZlV4OTZCZjNBVCtkY3orUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4025cf40-9384-48f0-5e5d-08da38add4a9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 09:07:27.6119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFRc8PMCpf4DcdnZ/wdt3f4Y5CLMvDOyo6DE2tCY4CHp/Jv4Po0Jt6i2OOraIk4OHeOzCWVSjdL/Lo2vVAsHUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6068

On 11.05.2022 17:14, Jane Malalane wrote:
> Have is_hvm_pv_evtchn_vcpu() return true for vector callbacks for
> evtchn delivery set up on a per-vCPU basis via
> HVMOP_set_evtchn_upcall_vector.

I'm confused: You say "per-vCPU" here, but ...

> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -14,8 +14,14 @@
>  
>  #define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
>  
> +/*
> + * Set to true if either the global vector-type callback or per-vCPU
> + * LAPIC vectors are used. Assume all vCPUs will use
> + * HVMOP_set_evtchn_upcall_vector as long as the initial vCPU does.
> + */
>  #define is_hvm_pv_evtchn_domain(d) (is_hvm_domain(d) && \
> -        (d)->arch.hvm.irq->callback_via_type == HVMIRQ_callback_vector)
> +        ((d)->arch.hvm.irq->callback_via_type == HVMIRQ_callback_vector || \
> +         (d)->vcpu[0]->arch.hvm.evtchn_upcall_vector))

... you use (d)->vcpu[0] here (and, yes, you say so in the comment)
and ...

>  #define is_hvm_pv_evtchn_vcpu(v) (is_hvm_pv_evtchn_domain(v->domain))

... you don't alter this at all.

Also (re-ordering context) this ...

> is_hvm_pv_evtchn_vcpu() returning true is a condition for setting up
> physical IRQ to event channel mappings.

... isn't really true - it's is_hvm_pv_evtchn_domain() which controls
this (which in turn is why above you need to make the assumption I've
put under question). With that assumption I think is_hvm_pv_evtchn_vcpu()
would better go away.

Jan


