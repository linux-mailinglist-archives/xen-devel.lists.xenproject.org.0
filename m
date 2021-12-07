Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 771D346BD44
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 15:08:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241179.418054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mub89-00020d-Hw; Tue, 07 Dec 2021 14:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241179.418054; Tue, 07 Dec 2021 14:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mub89-0001ys-E0; Tue, 07 Dec 2021 14:07:41 +0000
Received: by outflank-mailman (input) for mailman id 241179;
 Tue, 07 Dec 2021 14:07:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mub87-0001yW-Ok
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 14:07:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07ec4cc2-5767-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 15:07:37 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-F7jnwBk8OFi--E56T14ycg-1; Tue, 07 Dec 2021 15:07:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5904.eurprd04.prod.outlook.com (2603:10a6:803:e6::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.19; Tue, 7 Dec
 2021 14:07:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.023; Tue, 7 Dec 2021
 14:07:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0307.eurprd06.prod.outlook.com (2603:10a6:20b:45b::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Tue, 7 Dec 2021 14:07:32 +0000
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
X-Inumbo-ID: 07ec4cc2-5767-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638886056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1TkZZTyddgKp3F0rKfwrnyaI0bxs60mKMKcbUUuIyW8=;
	b=kSewM6Emeg+qYDjhc1EyQS0N6zGGriDNBlZaMAyYDWACQsCaQ7BMDtj/aiWoEMwZanaAqV
	PBFGkBeqHQOjYWssxgEs5+MQC3SoJTBG+mSdWBct/mcPMx+eH5N45ZKX2eqG5i7EOnHvFt
	1fcvMJsLO1sk0V5O/ljccgQLgcqKjY4=
X-MC-Unique: F7jnwBk8OFi--E56T14ycg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRt6cLxjDNNZsz5lOtRyI/iktbZa6r9WIzrIH35R2+qvYu50/Prmqq5zVhqL8H4O9NSoPoZVFlMqQ5ytjZqxyn7KmByH3kUaYlwGVhaWLm3hLmwU0scgEcM0k+mPTqPBSORZ9BZ6ES9ETjOT3+MOQC3+nbbbUTL3wjaaes7L54H4E+SRk2X4s7LY9xAOiBXtfxe4MGsEiNYiP9er9rFPAqvjSJspIS7FH7COlNBf8SkhLGEdHvcEok3I+euenpG5UVgDTxYzQLp1vid5IvpOA6STbRM5Sup+jV+j/HWvzD8ChDTbwfjBhlvLPiu4uQ8gUDvkAOlSIns5BGWhXUscNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TkZZTyddgKp3F0rKfwrnyaI0bxs60mKMKcbUUuIyW8=;
 b=YSuhzGsOvVGPXjRCosF2ZH/7WyoP2u7RtLwMpiUtxl70dYZG3IhXX70V39ohLd0guNFZVpxXq3NgCbA08cXBYpQvwR6Q1lv1Ew8Yk95of8UJcKYtLHU6jx2FYFAwR3YH1uH2OyCT6q1E99Dgm6MA1u7081MX4f0NzU11Li9sXT1meTLoUEXFOXP63umkUASW8GICtMZMqb3N9A9/4/ozdspw7BnPlVrB5mzysABnkcHNCw9XalooGE2Nfkx7Hz1ruzjUEHRbBDA0Pyto5jOIJjP4jMzeZVkrPI6+ssuBbR268bmdQTWR/MjVKi9opC5giBNG+24WVBZc6DmjszRYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4d89cd09-bcf9-84b2-4635-41d95852ce38@suse.com>
Date: Tue, 7 Dec 2021 15:07:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 3/3] x86/boot: Don't double-copy the stack during physical
 relocation
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211207105339.28440-1-andrew.cooper3@citrix.com>
 <20211207105339.28440-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211207105339.28440-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0307.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a02d2ab0-00ad-499e-f2db-08d9b98ae9fb
X-MS-TrafficTypeDiagnostic: VI1PR04MB5904:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5904A3A0F439A898C1D3DC0EB36E9@VI1PR04MB5904.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CeSZei1hnvqmF0MDK+6F3kzBBhV0Tnqy2SslJoY68DIWPWedSK0XXAZpMOZaSAsyj6F1IHYVs/S9VRvIHiHP1MfTdIIA3fmMAe7nXGMdhwTYyC1WihymV2Z9ju9Pvas7LONIU61SNc9w24e1M82NkIDfGhT8itVJoURiyNFTa8QWfFsQ59ncC10kcZB6/aQ3kumfXLW38oW+b+TvrSfPEgJDu7/yFNDDNulfY0PZ+zgrK9l7AvtVnzc0g9FdDx1DOnM4y6CqcLwguIKB3ooMOi3SIlc3UsF3E7Rrn71nyGYuQV49ZNRqO7Mj8DMNzU6537NJij3JXCwNONKCPTmncaGoZ5sSEHpf+PzU5zcWagjWpVWdbzFPM/suaJRT4HFCkkdEp3LfkdlqHDca5qGS727IQj0X7UlIRKDnHIb9HRRQV1JO0/IAEEezYk4ffC7o3ikjItqKnPBXCtNrH4BdJmrJFqlHCP6NxKEcbXal8Smj1RX3gToujikThr8bRM33bOq3m7owuUvxAuR9ODm+F0kCCCCyWzYiKvAicOUlBOqOvRQAOLwvDKomey7Jxm0O51rIJ07RVcfvEjyLD37tXSwF1k7lwkxU7kTDf1wwWtfJD6riSUCZV6i0C3QCmt8I8Obf/Ordht/BqtG9wnAK+2810L+rGbuV6JyFOc90xVsCEIqQs5SYkgGMLcENYyEINW3hWn/1SXVwNf0EsNfB+/ipeX53kGG5iP2EdX22fkM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(316002)(6486002)(66556008)(66476007)(86362001)(6916009)(16576012)(54906003)(956004)(8936002)(31686004)(8676002)(66946007)(2906002)(4326008)(186003)(26005)(508600001)(36756003)(53546011)(5660300002)(38100700002)(31696002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVBncmdNL0dGWG00clpaRUNJUXVsSmFMUTZBc0pEVExEMm5QOFE1T0gzcVh4?=
 =?utf-8?B?U0ZlRUZrN1gyL2pKQmJwTkNLdm01Q3pmRmlReDJTbDR3UGViaktPRlJmdlJp?=
 =?utf-8?B?eXc1VHNNcXlJd1VtOVErYmNpTWw1TGx4RnpBWmNJalRCT3ArRVMyWmNFQnFM?=
 =?utf-8?B?RDA1OHQ2V1VySGhYcEVld3ZMazd3Q2czcU9wejFsTWI3cGp1bGFpeEhPZ29p?=
 =?utf-8?B?NTRyVWVXN3dWYzBmRjBFVUh3TC95QnBiZHhaMUJLN054Y01HV2pVYmFRZVBr?=
 =?utf-8?B?MmtaNnYrRzZrdjgrSHJhSUJ1ZUg2QUVpTTR0a291VkJqb0kyQmRJVXRVaUha?=
 =?utf-8?B?RmFsWDNVSmpGaStzYXRGNVAraGNmb2ZCZHNKcEU4YUk5Y09iUjBrYXErK1Q4?=
 =?utf-8?B?U0lwY25OczVWQUtvb28zaWxEVEFYZWFlS3lIOHpFQzJZWm9SeXh0TUtleC9J?=
 =?utf-8?B?QlhIQnFQNCs5TXR6UDd1MkdwTUhCTGpjUmZhUXp4eEJzM1pXWVZUaGxkb2p1?=
 =?utf-8?B?dEl5Y3cxRE9TdU5IYVZlbk9BeHZ4TWZkQkJyTkRxVnhOVVBlK2s5OXJKays4?=
 =?utf-8?B?bkpXSXplcHRIbTMvcWM4OG0yZEN4eThFeG5WREl0UGlQL2s3N1pwcGJmejJj?=
 =?utf-8?B?SnV4bm9CZ3RyOWhFdHBrdUltNjk2Qy9rUmdyR3Y1UEhRMHVISHBjbHAxOUNn?=
 =?utf-8?B?VE8wTFFMNDhjQ0ZKS3ZxVGhHVFE2N2tCSGNhejM5RjVxdGVEZ0ErZDl3enJZ?=
 =?utf-8?B?N1ppUktrbytNRVhjM1JrRkZ5WksxTWRYZHZoQ3QvWUtGeTdEdXp1YkhyUVFj?=
 =?utf-8?B?eWpxVXRBVGRITWhyalpGRHlPL244M3daQ3QxdVkzTysvUU03VUhMd1F2OWNM?=
 =?utf-8?B?NDBvSFlFaDVYTVFrcUNSVnBzWXo1b3p6YnBISkMvUkJRRERieFVWUDAwYUlW?=
 =?utf-8?B?eFQrN1k0U3hROFczYU11YTlSWllubldCY2VKN0VETlZteTVpZjY4SjlLZ29s?=
 =?utf-8?B?M1AxemdueWJ5MlV2TEtwVWg2TTd5akcraGh2c1VoRURCL093RUNGOGtsSEpP?=
 =?utf-8?B?Mm9LS3RGTEhkQWtjdDRTNDIrbEdtTTRuVUg3ak5LRjdjN2Q1RDIzcUFERCtq?=
 =?utf-8?B?QllFU2g3UFAycXVwdnlOVkJoRTJRN2dmc3pDKzlZRXM1V2VOT1FyMmY2V0k2?=
 =?utf-8?B?TG52MXUra1JLOUx4ZEVzemlvMmVhTUJudzZnSFV3d3VXZTNjNzdNNHdJSTZu?=
 =?utf-8?B?WkpwUUJpejQ3c3FFY0dBdlp5QWJab2E2QWxnN0RJbzBaNzF5aHZYOHRTUS9W?=
 =?utf-8?B?bDM1clVTMUhRcERsV2JVZ1hEYjJjclBOTnMwUHBsRDVQSldLejhJeDJEc1FN?=
 =?utf-8?B?TFo0RmZXUThucHZ2cDRvYWhhWTFiSkRiZmoyTmhIcWQ0MXBKeE9CeGl3clJO?=
 =?utf-8?B?b0tMQ1ZMZnZyS1RIOVJkYVpEa2lwTVF0QjdUQ1FFa2ZPOXFWYml3b2x0anRV?=
 =?utf-8?B?N3doa09FakRyTVlEbkd2b1hkOUJDLzNQRHdhUTlmNy9NcWFJSEY0d0o1bmw2?=
 =?utf-8?B?MCtnVlkzQlVSNE9KUzhFcEFadVV1SHpVRU9LWmUrRm1lVG0wSmU3UUxkNTFK?=
 =?utf-8?B?U1R6ZEdsTzYrK0VobE1xck1FWHFQSy9nVThtZFVHbGJ5RWNYYlBhbWpwRGxC?=
 =?utf-8?B?MWJRZ3pRSlJaaThsRlNQZU54RVRKTGhsdW02Qm9qZTdoem5UOC9zU3VKY0hE?=
 =?utf-8?B?L2FaRlM1a3dSRjRIT2NTY3hlek4zeDY4R2dGM2RNWHBjaTlLVHMyOTQwSDFp?=
 =?utf-8?B?QWdlMXo2Y0J2MlJaYnc0VFZyVjBZaUkvRCsyUkdRK3Q2YlRYOCtuUWhOdHNh?=
 =?utf-8?B?MzlZWGlpOGExajQvQmFwdGVKaCtaNXFNc2NTdUEyaFcyeHBHVmxybU81TTJx?=
 =?utf-8?B?dDRCQUZ3aTYyaDI0Mnp5c0NhVU5md1dFNkZsY0dzbEJxR1Jyb0ZKMVBmVm5q?=
 =?utf-8?B?ZWszVnlWSTdsck5hb2duako0NHl5cWw3V2tiTkZGcHRnMGtlYjJmYUNrRWp4?=
 =?utf-8?B?VEJXVHZQUm40dG5MYm02OW5NV2RuVkdzY2FtdTBlaGlLQXJRQlY1R3hlMnFy?=
 =?utf-8?B?cXR1dFNuRmliWmJMcG9BbTVTblltdWtMT25Uc0RzMnhqVnVabVRVL1NNZjM2?=
 =?utf-8?Q?mAG5lQDYIK7sjwFmnO59MsE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a02d2ab0-00ad-499e-f2db-08d9b98ae9fb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 14:07:33.2923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NnlW+FqlcXzxNrCJlC/b1vb2SrtH8NpWg2bhVkMyrn9j7SZ3kjt5WCBhBtQbVSxIJi2KmnrHZEYkXgFUmumL3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5904

On 07.12.2021 11:53, Andrew Cooper wrote:
> cpu0_stack is contained within .data, which means the memcpy() already takes a
> snapshot at the start of the critical region.
> 
> Later, when we switch to the relocated Xen, we do end up losing updates to the
> local variables,

You word this as if that was the case already before your change, ...

> but that's fine because the only variables we've modified go
> out of scope after the printk().  Use this properly to avoid copying the whole
> stack (32k) a second time.

... not the least because of "Use this properly ...". But aiui this
is only a result of your change, in that you no longer "re-sync the
stack" (as the comment says that you remove).

I can appreciate that copying 32k is too much. Yet I do think that
we're putting ourselves at risk if we rely on local variables going
out of scope which have been updated. Even more so with no comment
next to their declarations making clear that it is imperative for
them to not move to outer scopes. (Seeing e.g. another "i" and "j"
in the outer scope, one might actually be inclined to do so. For
"j" this would, afaict, even work, while "i" collides with the outer
one no matter what.)

You mentioning the printk() - did you consider someone, perhaps just
for debugging purposes, adding uses there of some of these local
variables?

We could limit the copying to just the primary stack(s), for
example. Otoh I'm not convinced trying to save 20k or even 32k of
copied memory is worth it in this boot-time code. There are larger
gains to be had elsewhere - see e.g. my "x86: memcpy() / memset()
(non-)ERMS flavors plus fallout" and "IOMMU: superpage support when
not sharing pagetables" which continue to be pending.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1183,6 +1183,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>              l3_pgentry_t *pl3e;
>              l2_pgentry_t *pl2e;
>              int i, j, k;
> +            unsigned long tmp;
>  
>              /* Select relocation address. */
>              xen_phys_start = end - reloc_size;
> @@ -1193,7 +1194,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>               * Perform relocation to new physical address.
>               * Before doing so we must sync static/global data with main memory
>               * with a barrier(). After this we must *not* modify static/global
> -             * data until after we have switched to the relocated pagetables!
> +             * data, or locals that need to survive, until after we have
> +             * switched to the relocated pagetables!
>               */
>              barrier();
>              memcpy(__va(__pa(_start)), _start, _end - _start);
> @@ -1239,18 +1241,21 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>                  *pl2e = l2e_from_intpte(l2e_get_intpte(*pl2e) + xen_phys_start);
>              }
>  
> -            /* Re-sync the stack and then switch to relocated pagetables. */
> +            /*
> +             * Switch to relocated pagetables.  This also discards updates to
> +             * any local variables since the memmove() call above, but that's
> +             * fine because we don't use any of them again.
> +             */
>              asm volatile (
> -                "rep movsq        ; " /* re-sync the stack */
> -                "movq %%cr4,%%rsi ; "
> -                "andb $0x7f,%%sil ; "
> -                "movq %%rsi,%%cr4 ; " /* CR4.PGE == 0 */
> -                "movq %[pg],%%cr3 ; " /* CR3 == new pagetables */
> -                "orb $0x80,%%sil  ; "
> -                "movq %%rsi,%%cr4   " /* CR4.PGE == 1 */
> -                : "=&S" (i), "=&D" (i), "=&c" (i) /* All outputs discarded. */
> -                :  [pg] "r" (__pa(idle_pg_table)), "0" (cpu0_stack),
> -                   "1" (__va(__pa(cpu0_stack))), "2" (STACK_SIZE / 8)
> +                "mov    %%cr4, %[cr4]\n\t"
> +                "andb   $~%c[pge], %b[cr4]\n\t"

Why not simply %[pge] (name subject to improvement) with the value
below becoming ~X86_CR4_PGE (and the constraint becoming "K")?

> +                "mov    %[cr4], %%cr4\n\t"     /* CR4.PGE = 0 */
> +                "mov    %[cr3], %%cr3\n\t"     /* CR3 = new pagetables */
> +                "orb    $%c[pge], %b[cr4]\n\t"

Oh, I see - the constant gets reused here.

Jan

> +                "mov    %[cr4], %%cr4\n\t"     /* CR4.PGE = 1 */
> +                : [cr4] "=&a" (tmp) /* Could be "r", but "a" makes better asm */
> +                : [cr3] "r" (__pa(idle_pg_table)),
> +                  [pge] "i" (X86_CR4_PGE)
>                  : "memory" );
>  
>              printk("New Xen image base address: %#lx\n", xen_phys_start);
> 


