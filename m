Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4812413219
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 13:01:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191687.341774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSdVs-0004DL-Lj; Tue, 21 Sep 2021 11:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191687.341774; Tue, 21 Sep 2021 11:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSdVs-0004Ag-Ig; Tue, 21 Sep 2021 11:00:36 +0000
Received: by outflank-mailman (input) for mailman id 191687;
 Tue, 21 Sep 2021 11:00:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSdVr-0004Aa-7i
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 11:00:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1c060f0-2c04-4a12-9543-429642db4231;
 Tue, 21 Sep 2021 11:00:34 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-Kp8Pgw24OsWtIg6pJp0BAA-1; Tue, 21 Sep 2021 13:00:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 11:00:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 11:00:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Tue, 21 Sep 2021 11:00:30 +0000
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
X-Inumbo-ID: f1c060f0-2c04-4a12-9543-429642db4231
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632222033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/gCvTzZkj/z1tXgg7O3hcPgmWbwdjjoZyAReUsMu0cA=;
	b=TB0Wwa0vnSYUzLe9I+rsBB/DZtYXNYKoiGdE1lWTA950xwdmZ6KnQm9oTy6IK1PEKm34+4
	OUhPEDIRAndbdJbZ6xXo5yYHbQXOqTY/XHe9Hov79/g3HkSx+xXBeyQwVRoZvuMeoSznXk
	lAqvd3iguMYAMuICzLTIA2Yc5e/Pabw=
X-MC-Unique: Kp8Pgw24OsWtIg6pJp0BAA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlyLMYuGgeJ2/eqIVv8g2NrtW4gxHlGCbSpR0TC245BT2z04hMh4gie6rzf7fiyuhQ3pgrvkj7sVWcAX3ign7qZxJMDlf4mh4yoC5v367MOBoLdtEvm1XRUPMtCY8va2MFus6CLWRlWC2JBYlt0YacSzLe74PW7S1WHa2Il6WEnt4m3o6ncmAb31rEjKw3R079OC2Lgegd2SZ1TAVpDJOhu839ytWu592j8g2yyJdMYP8LbujRGzmC9gUNm2V1McJnhZl6covxGHEpjVIq2DWZThcfKu6ghO4a7YVYo3nSgSlas8tLko7DiEvkIBCTZ7uAfE+37PL0wzHI58qtiYhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/gCvTzZkj/z1tXgg7O3hcPgmWbwdjjoZyAReUsMu0cA=;
 b=jaZPwz5B/j7SlxEatMOjDkLX6jFv1/GGa4eukjjf2NAUnQuttQbtrgTjFp6rGZ9t6O9v73+RLXS0IfZWc+Q22i2OiDwHAKvbDAXwQE8aWcp9BglphM6odLMfttbFkESGzy1yAiqPTO8m1JCqo36xznIUSs53FWVxdB+/o4C9AS34QkCCD/Fe+dB1v2+o2eY6oQIXKrCgKALegb/RsdTkEigSeM+5wWZlU23c1hN8iQrc+oVEC6QEcHbo1aItrbRpJr77qaawWXcw5FRMNBSxJo7HN/x2wQJpkxUlSZZmNDTBVMiqohvd6oMfSrPXnCJ6o16rVFKnUfRbuiKPb8Gb1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 04/12] x86/hvm: Reduce stack usage from HVMTRACE_ND()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920172529.24932-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1ec8d289-5c34-412c-c683-189cd5506600@suse.com>
Date: Tue, 21 Sep 2021 13:00:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210920172529.24932-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5b9e368-2db5-4288-2b73-08d97cef06cf
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7150A90F296B434AD3680418B3A19@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kgXImTHDr0DXHCV8CCKOjclExEC5pu84jyhGmAimq7MdWkgS8mjKOkGLPIAlCAOgpP7PMFv7vsTIjZkjDmpkjHUNZOF+UPs/uUZ7qpRQABW8kySYhiADNLDZCorJjKardykD0vdZ2HUR8TeBkmb7jfdzML4szAflLkm01DzAwWUAck04qNwcXCwLTHLWWVI5+jf5UUQs7nAveZflEZif8e1mv12Xadqik4w9ooKati3q4Y49vzUqBSdLsfjgXRg8Hi+UhDaBjc1Ow/oB9g5ibUcjTy8PGzww922MvEDKaikecW8pZyhN8beG0y5zX2rgYTzxfqkTujc1t78w+67YQq+4KekxmwIR5E29FUnBxwNDjhhcEZgQsIPefCC4Qh0lL0cboybFwSMfADIX2pwwSbPT9ZnHO2FiI0ptnJAdthyMr1zjPL+xETYBmvkeVwf3PPgVx3ssc/VxwmFYHUp1v+K4Xhvc5vIg0vKFi/wV2iun3O8DICCu8UssvyshdZ/66it0XuEzeXRN7FfZfwjHZLvW3uvWPdGuJ1Dvxl/C9nCpONGyGmcoyHpfxKLY0Ce4k5GYiguZkGOO9IaVEOvv+Xul++FW2spT7I43IasKOwt0UnQTgILJan2yfNU/KDD7OUeWATbA5U4dxUjRJ1GW8GHI/Mou1gtkcMfTqbKx4sgm5I/E0vwGECGaqWT/NnMGCHIjJFdBWSPSRa52s4qE7Glw0zBOE+8aJoI5DtDCaU4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(5660300002)(8936002)(31686004)(2616005)(2906002)(36756003)(316002)(16576012)(54906003)(508600001)(66476007)(8676002)(86362001)(66946007)(66556008)(26005)(38100700002)(31696002)(186003)(53546011)(6486002)(4326008)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEJQVHBQc1dwZnBMTHpFMWRmZCtuZG94MTcwQUJBYTNoczZuWHorNjFJUUcw?=
 =?utf-8?B?SzBqNzl2TXU4YUNTOE9MNEg3aXpGSXdCcTZwMUpuaEk4WEZWMk4xMHp1YUxQ?=
 =?utf-8?B?bjdSODVCa2dSQStLd2Y3QjF2L1d4ajk0cnVHaFU5T0hoaE9Td0RHUlIrdWF2?=
 =?utf-8?B?Tm5yNnFiUUFOVzZudW1oYkdwcEZrT0llWm9GdGZUbElTWTR4Z0dGUkJIMjdv?=
 =?utf-8?B?cDlUSkJsSmRjd2NGbDBwaWZVWWhnS3RiT0lVQzdrU1V0NDJuMmpmMFJxSUJ3?=
 =?utf-8?B?MEk5YlM4cU5FM3NhWEVyQW5TNHIyV0tGU0phSnJwenpZU2RyYjdiVFNUV054?=
 =?utf-8?B?OTQyVkhubjdQSDYwQ3g1T1BxdHhWMEs3UFVwUHlGL3l2WnVNN2poZWpST0JQ?=
 =?utf-8?B?eFFTOU1wSDB4M3B0dFR4NkR4cjYrMHlOa1I4aWhFLzZIZmp5MGl5OExTTE5T?=
 =?utf-8?B?dFJpOEFUcWV3WlZOZ01UUWNGVkRWT2RUSHFiZG9OaVlaYmJLS3hHeHpWdEVq?=
 =?utf-8?B?dDVmd2YxR0htajIrb2NuOXZGWlM4TE1WRS96MXFXSHpCMy9oM29nTnFyMDF0?=
 =?utf-8?B?aFpET01FbTlVZHNpUXN3MnA5am9wY09ZWEFiUDdHUFVHdXFFMXA2VUJpUkNL?=
 =?utf-8?B?S3JrYk9KbzZFbFhsekFKbWhaOTFXTGNVd0lpLzk2bDlBeUcrdTRhbWh5ZC8w?=
 =?utf-8?B?cWZtVlZFUURTQThFYTJMbThtNTNlbnlMVUd5WDlsZ2c4c3F6cnNQVE05c0ww?=
 =?utf-8?B?SFJiR21mUkRrWEE4RnhaMzVXWEdSL05wckVNMVNNZEtFQmNVSHFHdWh5QlBz?=
 =?utf-8?B?bHV4aFM0WVpMYnUyMTNKcHdpa0FVYlR1aG5GR2t5c21vR2JGK1ZiME1WVVZJ?=
 =?utf-8?B?bW9YZDJNRVBJZnRtK3NGaTVYLzhtNXNNSFlLRzVvT0MveENYdVowcDU1bjF2?=
 =?utf-8?B?L3AwV1l1eXFXYVVOVGVYTnpxNUc1UVpxTllWNStMU3JOTVppenRRU05qMzFM?=
 =?utf-8?B?TjNmdXdMOElmVVZvaDYzeGdqWVdqWmZKaGJwRjNCTFFpZS9VU3hkRXoxVHlW?=
 =?utf-8?B?RVdPMkxCalhXbE53eW12RDNuL044eGdsYWhVS3NqWTlMQm96eXNzRzB0Qm9P?=
 =?utf-8?B?U2pUVGZjaDV2YU40KzEwNjRwOTVlTUNicVYwMFJyVXVhOFl1MmhOMjgrb0Zk?=
 =?utf-8?B?RjdwRzVvdjVNMmd2RUpvYWJadk1PUE13WWRMc2JiaXAxMERJQmlCZFhKZFEv?=
 =?utf-8?B?UTJQVWx3dFhNTDZ3RnFQM1FnZnRSTkFHTmZURlRxVEgxckxacHYrRndoVE1P?=
 =?utf-8?B?ZHBkRk9KQTlzWUh4bnRmWmQ5eC94WTlYdlNCSndkU01iR2xhbzdCMHRLd3NC?=
 =?utf-8?B?LzBNc0RGaVdna3pZbExJZTRPUDByWVZhVEJRZjl5Wnc5OEpoVktyWjVhZFpH?=
 =?utf-8?B?aFJLYVV6ek1lTnNpcTB0VWM0c0hxYmFPUlFlNVdNWDFCRGtZYVJuUkduOXRy?=
 =?utf-8?B?bTd0Y3lnWnN1QlR0ay8wNFBSQ2dOZHlNZGZtaml5T3JvNk1xY1M5dTMxVmI5?=
 =?utf-8?B?QlFlVXgzMGIzNlh2cFFmRmtuNlo2aUs1RTJsZ2NSdmg0dkpmREpFUC9UTk10?=
 =?utf-8?B?bmpkSjhQT1p6QW5NcFZLR2RUQlNRaXI5WUZFSDN1Q3l3THp1N2YzS1R4LzRn?=
 =?utf-8?B?VDVrQWU1N3Joc2Y2ejdzZURYS2tHWnBGaHh3Z2V2VUhMNmlyaWwyMWh0M090?=
 =?utf-8?Q?70Z2emFzBAzS7rlaAyGWeD1zGd5nGnmEweN8ByF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b9e368-2db5-4288-2b73-08d97cef06cf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 11:00:30.3893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfvxtIkPSSspag7WeUaPsq7H9ln/ESNOsP1lXIw0DSG4ObwL+1TgH2RGWxfinQ0+WBMgHOXI0viKi0h7XN7rgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 20.09.2021 19:25, Andrew Cooper wrote:
> v2:
>  * Adjust callers of HVMTRACE_ND() too

What does this refer to? The sole difference to v1 that I can spot
is ...

>  * Drop _d[] for the 0 case.

... the one corresponding to this line, i.e. ...

> --- a/xen/include/asm-x86/hvm/trace.h
> +++ b/xen/include/asm-x86/hvm/trace.h
> @@ -67,38 +67,30 @@
>  #define TRACE_2_LONG_4D(_e, d1, d2, d3, d4, ...) \
>      TRACE_6D(_e, d1, d2, d3, d4)
>  
> -#define HVMTRACE_ND(evt, modifier, cycles, count, d1, d2, d3, d4, d5, d6) \
> +#define HVMTRACE_ND(evt, modifier, cycles, ...)                           \
>      do {                                                                  \
>          if ( unlikely(tb_init_done) && DO_TRC_HVM_ ## evt )               \
>          {                                                                 \
> -            struct {                                                      \
> -                u32 d[6];                                                 \
> -            } _d;                                                         \
> -            _d.d[0]=(d1);                                                 \
> -            _d.d[1]=(d2);                                                 \
> -            _d.d[2]=(d3);                                                 \
> -            _d.d[3]=(d4);                                                 \
> -            _d.d[4]=(d5);                                                 \
> -            _d.d[5]=(d6);                                                 \
> +            uint32_t _d[] = { __VA_ARGS__ };                              \
>              __trace_var(TRC_HVM_ ## evt | (modifier), cycles,             \
> -                        sizeof(*_d.d) * count, &_d);                      \
> +                        sizeof(_d), sizeof(_d) ? _d : NULL);              \

... the addition of a conditional operator here (which I assume was
something a particular compiler didn't like in v1). FAOD - I'm fine
with the change, but I fear I'm overlooking something (again).

Jan


