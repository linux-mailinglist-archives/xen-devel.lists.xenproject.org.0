Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4582B4C2ADE
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 12:25:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278181.475341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNCFf-0005ye-23; Thu, 24 Feb 2022 11:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278181.475341; Thu, 24 Feb 2022 11:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNCFe-0005wP-U8; Thu, 24 Feb 2022 11:25:38 +0000
Received: by outflank-mailman (input) for mailman id 278181;
 Thu, 24 Feb 2022 11:25:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNCFd-0005vy-9r
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 11:25:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c263a3f-9564-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 12:25:35 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-s1oWWFv0Od2u7TP4L29G0g-1; Thu, 24 Feb 2022 12:25:34 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7819.eurprd04.prod.outlook.com (2603:10a6:10:1e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 11:25:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 11:25:32 +0000
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
X-Inumbo-ID: 7c263a3f-9564-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645701935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xVhLCFxOs03sXQgHjR3yfZCmm0yisoVBHJMEff/v1K0=;
	b=hhrG0q6ez4NOuBIlY9Q4k86LJFx4I12rW9IjwBfDjtKnJnvFYEQCrKjAJrMXI4kla2nnTK
	oEzNfyFo3k45vQs1IZbzF1xxFP62oEpgGad8ARBjFvfXR+NVFCgx/8gocimWZ8543XBehb
	kF0IBLDFtCKJsuI2tlHLokRr8qNr8vs=
X-MC-Unique: s1oWWFv0Od2u7TP4L29G0g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9K0m1RrgPXZU/DKVYyukCLMx13iwkgG4wLDQZxv58uRhhTRobsul57XgiEjpUyPhjqdMv0NISW819a5j801YvZMM3NHJr27R4xg6CZJQYbqXJ7wu4OlGqEdHzhlUovBygajt/+y3kxjxwIQX9e9ujP1jf532/fZibWrWse1kEziCddcO7tPBOl9GjIunG1NmKGF0mm11WWh4DCi/Oio07giuZqgNoabcg/wHcZtmfWdqlVtBAyCC1O3TLbADB+Pmdn3lgaDVgs8q+eKhB+yCdgqBlTMcYzkoFMi5aW6ZzOGq2u7BKmRO6e/77yXUlXmeEGYIrg6byxRhDn4f5YxHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVhLCFxOs03sXQgHjR3yfZCmm0yisoVBHJMEff/v1K0=;
 b=gxYklretn385tupXiRBrSVW+ZoYDJ/cD1yizYH5+UMeeIOFUJGpYNysiXhR9NrLEcTU7EHH5QArTC2uShHisuTtzEswyxw9zCGUT53Gx/xo69nukTwB/6T+DPsSFtTS0aL35+MigCVkqN8uaP7Rbt2ym6SMHOsBP5seM1DA0o5u3bLy2p0woxeT0Vs300YtPxpbaE23n2HA9Nra3lZmKp7i3AvVDI9qqsS3FRYo1orW5pmIsPCGsUFwK6k/QH/Va1UlOeIwRvLC8O7A/tDCIkDFnis+G9D+ChVGTpKmLdd/+vWbzP4Wkl0Caj45byYYC1ahV8dtHczPYZP/pfVrd/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <68d40be4-9ced-01bf-8bc3-585f11827504@suse.com>
Date: Thu, 24 Feb 2022 12:25:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Ping: [PATCH v2] x86/time: switch platform timer hooks to altcall
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5f1f49e6-1380-73bf-d68f-6eb9dd05cad6@suse.com>
In-Reply-To: <5f1f49e6-1380-73bf-d68f-6eb9dd05cad6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c57a7236-55a4-45f0-e45e-08d9f7885e5f
X-MS-TrafficTypeDiagnostic: DBBPR04MB7819:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB7819636E42AD2C4255134332B33D9@DBBPR04MB7819.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4ch5IdvR69PT8OKUsB/u6Y9llsD+ztPLsMTplw0H///Eg7fou5su0BYZ2vFI3Hcwf8kcK8CCyI02A1TF+HNbIXWdRNxYHHPkh99XlkjLsw+o1Dj+uSKpChC/BEzSI681c9nWjmk/nzNQAXlK8jXxgvRXDoZwJXN8nD4/OLGzlx4WuIZQZeI6aHoUa8wRpdA2qoHNkoj5IPFktfjjOfO0Q6lzTq3xGIQndlmYTaayLrQmp9qezZ9cYtonQBZ9PbzIr6o09uFfOgwqtl8mCOe0r6p1RRKdrwLL6a/m/SU1K4PnVVncuClzWt5sOl89FsvXrPQXUX4+iyev23ib9etFyHTmtoALfvTlN0kj6jF/o84g0EKJjsaFyeBslwtCHZm08ttsoyNre5wFl2zgJnjTS2f0lLLItVhJBi7zd61sdhsnF6Ro5ZMvBQEb5YIPu2rhdO8O75ZuLbent9loOYGQuFi+t3N579sN11bKyfurJbTth2VjmpUIeSV7+ZHLJS3V79PH34UHhkPBJoWnlqOVLb3PPSo1X4gAWKZhxaP9NZypMxRY6fzp5op4qlzbjQRr15EH/8UW8sL9Uc8y4MLr6T5PUPofmcCenn5908gP1R9mbEKzORDCwr0tGiSTSZ2d+rAHk8ioOzX54D38SVEV3osNebD7av5t5bfBMZgH6AxxhayQ5Gvtm13QfRnMD+k7FrHORERKzVpachP+1dQpz7PhTGJSCAH+nr45jk/3+vs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(2616005)(83380400001)(26005)(36756003)(31696002)(31686004)(316002)(8936002)(86362001)(2906002)(6506007)(53546011)(508600001)(54906003)(66556008)(5660300002)(4326008)(66946007)(6512007)(66476007)(6916009)(8676002)(38100700002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFdRdlJpVGJjRzFHRGhKTkI1WFRQNFNxU3dqbFFIZUtHQ3QvV0toS3hkNUJS?=
 =?utf-8?B?eG5BRnprQXZnMnZ4VEUyODhrTi9ReHRucTRqZUJtemwzUE9RVzgybG8yQWFw?=
 =?utf-8?B?c0U5cURhbWN2dXZ1RVZDNTRZYm13ekxFOUY0czVIRTFzcjZWTHFGOVRSWnR1?=
 =?utf-8?B?NkZYakErMHFUK21CeXNiaFFhcnVrdE5WbzhRbHJqNktzUXQwODJBejcxNWVa?=
 =?utf-8?B?d3VLR2twcFhBY0R1S21XSlJleXgvZHI4UDRONnRQdTFPTUJHTVhTOU1lNGZB?=
 =?utf-8?B?emhudnErZXNrL3BDMmZSam96YjN4RldWdG8raXNGeWJaSUhGREhLdzRjd3NH?=
 =?utf-8?B?VGVtbHJDcllTODRRdDR0K1MwLzU2KzkwaVRmWERvNWlsUUZTNTcrbjZzWDBz?=
 =?utf-8?B?Yk1oUXJ3bTFVRlFlcW8vVEU4QURFM3pYR2s4TVREZjBZOU1DWEpJWEczNVRZ?=
 =?utf-8?B?QjdrRXN3bzFZcTlJVFJ3clJSM0drU2RCdXVndUJ1TFhHL3Ztb2xnSC9oeVRi?=
 =?utf-8?B?NUJRczlmTkF1TVMyRW1VZnYwTFJpQWw5U3hSSzRmQ0JEQVRHK3dYZjJENnRJ?=
 =?utf-8?B?eTJ4TmJZTDJsSVJ1M3F0S1JVM1FVb0V3S1Z4NFVLMXRYdGR1RUhGcHV6Z216?=
 =?utf-8?B?SXNiSHlUNXpBL2tRMTkxdE5qZ1QrcnkvcHBNTHZpWjJWc2xldi9VRzY0dWFa?=
 =?utf-8?B?cFJhbGRkaUdPZTZXKzFCVkNTUWRDeUhGR0hXVHRma2pVeFBLdTlUU08yUVgy?=
 =?utf-8?B?aEJISWk4NitFanI5eGpyejgwazBqeDk2Nm9PMExLbUV1WnlHWlNialU4bGtB?=
 =?utf-8?B?NWFIMDdIbHgrZVJnYzJtT2t0cTRvN2RjVTE4aWZRRmU2SFFnZ01mVEZHY1dx?=
 =?utf-8?B?OFdPVmtGVm9aYnlzb2x0SG13cEUrK2VGQko5V2Fvd3FYOE8wS1hLbmJGejRH?=
 =?utf-8?B?Y05SVkUwTm5nWUQyMVVGTTFXNjUzeWpBVUxWQ2s3V2k1RDNoWWJwVFZsOHFG?=
 =?utf-8?B?WTd3WlppejBLaUpwSTV0YWo2anVheGdyRHViNDFiWCtvRUJlY2VURjduejhm?=
 =?utf-8?B?bFdROC9iZTVXYW1kdndtL21sd3VzTmY0R0U0NDdiZU12UmEydjZXZTNsUkIx?=
 =?utf-8?B?VFVpZWI4Q0NYU0taQnJOOEx0cVJUcEVLSFRKUGJLZGljdnh5OHdBVUdjdDlB?=
 =?utf-8?B?MCsrYkdqWjBzSEtrQWV2WG5tR3Z5cUp6ZzhJS3hGT3NGRFpTYmQvazVWcVA2?=
 =?utf-8?B?RXl6emV5djRIemxlTUFvYXJHb25wVGdTVUs2aWRWQWM3dURXN29xang3YXdm?=
 =?utf-8?B?U0prNFI2K004bVZZOCtZNjBNb0JTQ0l3dkNyQnh1ZG5xeUNlOEFSb3g0dXhs?=
 =?utf-8?B?SXlyTzVlblRVcmYvb0pXd1JuT1ZQZForWU85dWpIeU9CU3lwRUt2dW5IVS9q?=
 =?utf-8?B?anVYNjZJNDg0dUljZ1l4SUJSTWFIWk94czZSOS8yK2hEdDhGVWQ0TklMQTZB?=
 =?utf-8?B?dVlaUCtRS0czc2E1bFBoM3RiYWtPTTlySmdQQ3ZFdStaUG41U0lkcVlTRFpx?=
 =?utf-8?B?Zm9WK2xNYVN3aTRkVVRmc00rQkp5NjJ5Z0FLYWRhTFhvOCtjMkhZaVllRE5W?=
 =?utf-8?B?YWV1ZnJFelQ1N2hTY0VCUms1OHVPTzRSRGhKZlU3ZjlZTDdWdTdRZFRHMk9i?=
 =?utf-8?B?Q2RQcERxa2xKODFlQWJDZFFlK2dORFdFZHBQdjBHeDVVZ3krMGozZUVSRDlH?=
 =?utf-8?B?SFNsTlgyYjBQbldKdFovc0VRTmJoMzdKRzRHS25pYmRVZ0NQREsyWlZROUFu?=
 =?utf-8?B?Zlc3Tm44d3hueTd0U0ZPS2R4UzFGYUVDMS9JY0lSRitrTjJmL2t1azJiTWRS?=
 =?utf-8?B?YXRLQjFOL2pab3VkRmhJZ0FOQ00xc0p2eldaV1JtRTdXdGJ5S0FaYzRqTzBv?=
 =?utf-8?B?c2JhZ3JMZDdLUys1REFZSFVOcmFBWnkxM010YUQyVUdJalJGWDRuL3FHeVc3?=
 =?utf-8?B?cmJybUVxRko5aC9Jd0ZxcWF3TmRQVG9RejJzOVczbUxHQnBkL2w3cFlQQ21I?=
 =?utf-8?B?MGp5UzZaVllIejIxTm53c1NGQ1lIRE53M3VWa2lkT0M4aWJIUyswRG5sTmhK?=
 =?utf-8?B?Sm5OL25pZG1oVFpmemNVbGwvQkR5SHdzbVBXMU5Qc29Ob1AzcStyV2NLMFh2?=
 =?utf-8?Q?lEg7BR7Ch5TByn/uhQxEdgw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c57a7236-55a4-45f0-e45e-08d9f7885e5f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 11:25:32.2935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /oUJljZznaujQMfvTmPCzHfSykPpbvTcqC1FufuP6KL3Ge9Ebvfs6e7SJ+dlYu/7FrHcEwtjcqAAqkVdShKaUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7819

On 13.01.2022 14:17, Jan Beulich wrote:
> Except in the "clocksource=tsc" case we can replace the indirect calls
> involved in accessing the platform timers by direct ones, as they get
> established once and never changed. To also cover the "tsc" case, invoke
> what read_tsc() resolves to directly. In turn read_tsc() then becomes
> unreachable and hence can move to .init.*.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

As this actually amends the IBT work, I would have hoped for it to be
viewed as useful. Of course if accepted in general, it would now want
to have __initconst_cf_clobber annotation addition included. Albeit
there's a slight complication: Some of the structures are written to,
so those couldn't really be "const".

Jan

> ---
> v2: Avoid altcall patching becoming conditional.
> 
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -66,6 +66,7 @@ struct platform_timesource {
>      char *id;
>      char *name;
>      u64 frequency;
> +    /* This hook may only be invoked via the read_counter() wrapper! */
>      u64 (*read_counter)(void);
>      s64 (*init)(struct platform_timesource *);
>      void (*resume)(struct platform_timesource *);
> @@ -578,7 +579,7 @@ static s64 __init init_tsc(struct platfo
>      return ret;
>  }
>  
> -static u64 read_tsc(void)
> +static uint64_t __init read_tsc(void)
>  {
>      return rdtsc_ordered();
>  }
> @@ -810,6 +811,18 @@ static s_time_t __read_platform_stime(u6
>      return (stime_platform_stamp + scale_delta(diff, &plt_scale));
>  }
>  
> +static uint64_t read_counter(void)
> +{
> +    /*
> +     * plt_tsc is put in use only after alternatives patching has occurred,
> +     * hence we can't invoke read_tsc() that way. Special case it here, open-
> +     * coding the function call at the same time.
> +     */
> +    return plt_src.read_counter != read_tsc
> +           ? alternative_call(plt_src.read_counter)
> +           : rdtsc_ordered();
> +}
> +
>  static void plt_overflow(void *unused)
>  {
>      int i;
> @@ -818,7 +831,7 @@ static void plt_overflow(void *unused)
>  
>      spin_lock_irq(&platform_timer_lock);
>  
> -    count = plt_src.read_counter();
> +    count = read_counter();
>      plt_stamp64 += (count - plt_stamp) & plt_mask;
>      plt_stamp = count;
>  
> @@ -854,7 +867,7 @@ static s_time_t read_platform_stime(u64
>      ASSERT(!local_irq_is_enabled());
>  
>      spin_lock(&platform_timer_lock);
> -    plt_counter = plt_src.read_counter();
> +    plt_counter = read_counter();
>      count = plt_stamp64 + ((plt_counter - plt_stamp) & plt_mask);
>      stime = __read_platform_stime(count);
>      spin_unlock(&platform_timer_lock);
> @@ -872,7 +885,7 @@ static void platform_time_calibration(vo
>      unsigned long flags;
>  
>      spin_lock_irqsave(&platform_timer_lock, flags);
> -    count = plt_stamp64 + ((plt_src.read_counter() - plt_stamp) & plt_mask);
> +    count = plt_stamp64 + ((read_counter() - plt_stamp) & plt_mask);
>      stamp = __read_platform_stime(count);
>      stime_platform_stamp = stamp;
>      platform_timer_stamp = count;
> @@ -883,10 +896,10 @@ static void resume_platform_timer(void)
>  {
>      /* Timer source can be reset when backing from S3 to S0 */
>      if ( plt_src.resume )
> -        plt_src.resume(&plt_src);
> +        alternative_vcall(plt_src.resume, &plt_src);
>  
>      plt_stamp64 = platform_timer_stamp;
> -    plt_stamp = plt_src.read_counter();
> +    plt_stamp = read_counter();
>  }
>  
>  static void __init reset_platform_timer(void)
> 
> 


