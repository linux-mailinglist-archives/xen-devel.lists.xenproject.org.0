Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17744F2938
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 10:50:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298612.508727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbesm-0003od-C4; Tue, 05 Apr 2022 08:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298612.508727; Tue, 05 Apr 2022 08:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbesm-0003m7-8s; Tue, 05 Apr 2022 08:49:48 +0000
Received: by outflank-mailman (input) for mailman id 298612;
 Tue, 05 Apr 2022 08:49:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbesl-0003m1-1f
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 08:49:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5785619b-b4bd-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 10:49:45 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-OJ4OIt1HNtmbC6my4g0QGA-1; Tue, 05 Apr 2022 10:49:42 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB6PR04MB3174.eurprd04.prod.outlook.com (2603:10a6:6:c::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.31; Tue, 5 Apr 2022 08:49:40 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 08:49:40 +0000
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
X-Inumbo-ID: 5785619b-b4bd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649148585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eSWdLqwj7MAzpmvgET2jb1II/XRMZrTXTBSSIZe1444=;
	b=D+GKNfoM8ay8upT0mOKY9nQKBflcQLuExUvCrX5xMB50BuFxoMnTFRsTdw1+5rPTDbrRWp
	aSozTmel9I4Ngrlyj+ziVjezvACSPPLsCWdq9qD9JFYQonFEgRs/yogZWTOLY+oy505Y6k
	L8sLPt4Et2MMcUynrcXh7qqZ0JQ83Os=
X-MC-Unique: OJ4OIt1HNtmbC6my4g0QGA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFOHSkf4IV8cqtb2ZLBFXCSRa0l3pmpTk7MPuNYce3UuXpKjZplNQGk/XM7ByrAPhSn11YbCTIcK2CqZIbaF5/+++dm6lJAhsjEifab79yGlLBRY21jH3Smy8JZ6rSFrBRf4TAMZrCsPcoffzem5kazpgX1McO3QxMFqkXZBPCWD4D5P2n/6lv3jEja36TvcNkMMuHZ3H4Qzg2TT/mkg3C/cY4x16d+dzDtAhkM2NrrQBEccJhH/tU7vhJnGWBWXVnkzVxLzriqDuHc1uNolI/y1rUoETizCkhwUAJHOrFSvxeYcMbeRrIIt6LOmF44TKrp+huu7R4JVeVGknfg5Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSWdLqwj7MAzpmvgET2jb1II/XRMZrTXTBSSIZe1444=;
 b=efFB6UCVrADYEMRedTaY2qop36jjKbGgU2MTr2bUCoXJGCXuwuzAlpNoldI5BCDuuOmf33sWWDLi6PHJntkvpmCp+2RYBGWVQNCwzpyik4Q6fwAXNtV930FtWUNbkdQDqhdFznvVsf9Dl88u2e5TpPNFfTQ0qHXtdRLJRcpHroSzEMDZX6ObqUKNtl/g/S4j69XV/9Ly75VAmdb2vhC6cMzDNk2tfADtOJQX8It7dCynb0RqIfjY0ndnHaO1wQv3eiO2KtsucV0mZXfQ92mpM3LGr5ctDAu7vrmBI637wcP6HGt7V1ssnnFvubNN7dSgbODw3fTuqFVnGXQK8sTzcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eaf82b61-de3b-b2c2-b6f5-2b43b3348a09@suse.com>
Date: Tue, 5 Apr 2022 10:49:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/2] xen: Populate xen.lds.h and make use of its macros
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220331071425.49141-1-michal.orzel@arm.com>
 <20220331071425.49141-3-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220331071425.49141-3-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0001.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::11) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edbcc742-b282-43d6-1661-08da16e13891
X-MS-TrafficTypeDiagnostic: DB6PR04MB3174:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR04MB3174C3E24082EA028C75E632B3E49@DB6PR04MB3174.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UNRmb89WNGGMI7wApb7IE2ean/1UR56nrJYTrWNZaTfDUC8AQdfoddwFqwT/FlmaE7a3Cb+ZznOQ34KELutgjDSSPE3IXuZTqy8y738GFbxaqA2durC7Fr9eg5pfYqbUVHuNeA3WVGUihvkbwSq0ewbsISvAL9EA6db6vVzEy6xnRHQAkALeYXXIzDCeSfGP74/7JUR73mRVLGSjZPZjskztC8O/vi6jXYOdCRtliHJ+1mYDly3z3qfSkgMSxGjlOeYILXbRsOOIV78Gd1gRPxGOMvJ6mXjFOiLljc0B+3UySXPi0YhUtDnuO2rwXRiRfuLYIFI/KTvt3djFSPIxMjPyd8Ee6auK6as+mKZ+SMYw+BfNJZt+FLs5rj7/MAzTC8WDzTN7wu0sfQagqkJ6waXbYB+stHKqtyvy6wXnuiiWYjuGYXzNsYrtaTCru8mVldFxqcpDSTgvmNYW/zIDqEXlaPdeXyq0i0LToHtJbHYvCXwy1DGRMybj+w+FtmyoMJ4872Rk5fd4cGSmxDY9kslo0rJl7F3/vXjY7HZMs5yYwan8ateyOsFXp47/gSNYHx5xqJsQ9bZzUS8jVrIb37M0FIRBQVQUDQ9mFwnD3BxOG+jcdcvnX2n9ZP06OFW87+IfS0wbzcutFZEfsW0WlvZqySGBHhnyz/JUtpVtHhv5DPlJYwxQND+8/Mupb6P/hFSO4GNnNKutFzggBQateuGM3L3+XeE3LN0gH35BFhNGJbqyPbtKUwuwdVkGl4+N
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(36756003)(316002)(6512007)(54906003)(31686004)(53546011)(2616005)(6916009)(2906002)(4326008)(6486002)(7416002)(8676002)(6506007)(26005)(86362001)(66946007)(66556008)(66476007)(31696002)(186003)(508600001)(5660300002)(38100700002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnJVZ0YrOHk1SXpHdkFrbmxTeUlDTzJKcmNvTVJIUm9kWTQ3QmJ6TXN0RE1y?=
 =?utf-8?B?eXNLd1hzRUdPaUVGQW9XMFlVcWI3TUxIVzZNUXQzUW1mYzdGVXRncnRrVkJR?=
 =?utf-8?B?Z3YzbkxVZi9pekJONGQyUVJHcVJwSWVMV0lNZ0c2akY1eHRNZXZPWjJTTXRY?=
 =?utf-8?B?MFh1RTZWSXF6VlRvUyttL3hjZ2hIZFNlb1NjK1FiRmlDRVJyL093Qk9peHY1?=
 =?utf-8?B?Skc5bXZjSUJOMFZkZXFneWxPWVdGbVd2ZS91ejUxNlhQOWgzZ3RrOUZ3T0ph?=
 =?utf-8?B?YmVWK20yak9xbTNmaFRqd2tpYTN1eWprY29DZEdqb2dxOUs3MXAyRWplS255?=
 =?utf-8?B?N0ZOU3oxQlVNeXg0MzhwV1FtejFnL25Xa1lyb24wUFk3V2ZLRkJZWXh3bEJ0?=
 =?utf-8?B?bFluTDJ3MFdNbmtJU0c2NzZzZnRCdGVXMkcweE9hNnhOQSs1dXNGN3lHdDAv?=
 =?utf-8?B?dVZGd1RQNXFvclRydlZsWFgzTWZ4aXlmTXk1cjR3M3Y3bEFIRVE0ZHE1eVlt?=
 =?utf-8?B?VlBoTC90SzVUQlA4dlI3clM4QWdORitadGtFTlpUT1VVOFBWWDYzenlPTkdS?=
 =?utf-8?B?QTdzaUl2SEMyOXRmemZZQ2JyYWV5WFQyT2JZeTBWaG1BM28vR3dxKy90TWNU?=
 =?utf-8?B?bUdtMFpKek0xdUJwN1FrMHBkemVSQ1hFTm5RNG1maUNZbDNJcENBREIrdUZ3?=
 =?utf-8?B?M0tGU0J0SDJNYm1DY3pFREZ2WGRmSGNDRjhwdjJNWmQzWGY1dEQ0VlhERWR5?=
 =?utf-8?B?N1pPRElTOGZYT2RPVjVoV3VZcGI1M2IybHVlYjFDclovTXdrbWllSFhDWmJF?=
 =?utf-8?B?b0VqRGE0SW9KS1U5YW5tOUppcy9Hc3ZYUC9GZC9QTEJJQWYyNS91SVM3dW0z?=
 =?utf-8?B?cHdlVnpVb3U0TFdCTnlZMy9jTlNKb1A3cERPOUxRVVFoMytQMFRjMldCaC94?=
 =?utf-8?B?b2RWVkczbERKVklxS2VuYStGYmpIa0NhNHVGdU5uaENocVdBeWpXdzFZR0lQ?=
 =?utf-8?B?dERxUnhZa1Bsbm1YYWFGOHlhZWxOTFYyWERQbE5UM2k0bmJraGRYNWtCQ0xw?=
 =?utf-8?B?eXl4QWhXcnhiaEcvRE9kQ0V4cXNCbG9KY0pEQzZmYzFQcDB0Q294enVZSGUz?=
 =?utf-8?B?MHA0QXpyN2RCYlh5T3lVdEM4dlpKVTdtNE5CdlJQNEJnK3hXQmdDY0VXMHYx?=
 =?utf-8?B?dFNheU5LYnoycFhiQ2t2emV3YjVnbDM2Z3psbFg3R0x6MjFuUy9yUzBCTnQ2?=
 =?utf-8?B?RnVoUXF0bWsxYnFHNHQ4NXpySmpnOGo4TGZ3dmU1ZE4xY0lkZDNocTgraFk4?=
 =?utf-8?B?eEZuRXh0bHcxK0NPUVQ3N01Xd0QzOUE0LzdtT0NhUEdpNHJIdi9LZ3ZqSTFM?=
 =?utf-8?B?RGRPZDhyZytZZm15eGNKcnpKRSt4aXBZNmk0KytiTW9WY3NQMkJLOU8zWlJG?=
 =?utf-8?B?Uko4RjcvWlBaUlRVa3FHTWNoNVQxbzAvTktvODNiUUNXQ1lDanlET2wwZXFv?=
 =?utf-8?B?WUc0OWlqb2lPRUV2ZXh3QU1Ldm9VSDdwNjRTc3Q5RVlMa2dMMng4WmlOWlRB?=
 =?utf-8?B?MlhzTlNFcHJQTEIyS0lCbzJmSWtISUtEY1RwZHRqRUlSd2YvR1NGSnJKSHVE?=
 =?utf-8?B?aWEzN2loZWlsSHNlbWJIOTJha1U1bi9vQnBvK3VoK053RkdYUWxadkNjaFlk?=
 =?utf-8?B?ZUQ3OGhOSW1uc2NFRWdicklDdHZldzlPa3hqQlcrdnFNSDlvbHV6elVFUXRN?=
 =?utf-8?B?RWxoUVpnUWlEdkVpenFDN010ekw0MTFEdk1KeXJyNk1DT1pMT0hKQjFFMFBt?=
 =?utf-8?B?bmJycFBpM2FNSW96NldBZURtWCtMand5MmlzOWdYQ09hc25HSEpxS3hiVVNL?=
 =?utf-8?B?NlhDQlM1V3BwOEQ0WFh5dWZsZ3h3WGlPWHlCUkczUFNNZjFqMmxORUx1cDhw?=
 =?utf-8?B?NEtZK1ZNczUwcnhrNTlObzJTWDBxaTdsNjB4SkFheTkzOHBjNllpQ1poeGJi?=
 =?utf-8?B?SVdFemJQMUJpN2ZiaGlhZDJLcnhiaFZKM0RvWHJBcnNDemNOUllzVFJreVJa?=
 =?utf-8?B?eFdYc3RXUU44STc3QnpyNDFVdzZMOHIzS2hJTHV2eGtXcHI2S3hJRWNtOFY4?=
 =?utf-8?B?OFp1OFdmMjZsVVh4U3ZHcDd4TE5QZ0pCZ201cHc0aHBaRlVVdEsybkRFS2Ev?=
 =?utf-8?B?OVM4SjVQTmZCbnNKeG9NeTNXOWZZRDNOdmlpcmpGY1E1ODVtZ0kyYmh4WUd0?=
 =?utf-8?B?ZldOTGtyWHRERWJ5ZVVFbkFmWHJJTzRHK05RamVkclRZR0NRWHhkQnNiVW8r?=
 =?utf-8?B?djhhVGJZYlpKVTFuMXNuaGhhVXNHME1ORmoybUJNYlh2bDY3UzdRdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edbcc742-b282-43d6-1661-08da16e13891
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 08:49:40.0080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HX62y6sxD9xqGyd5eDHQm5zJHvOFNHgRRk1qYjvUkqqdc6itcDiDkALx/qq+eQzZU51oXie1zbsGJWtP8CguEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3174

On 31.03.2022 09:14, Michal Orzel wrote:
> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -5,4 +5,133 @@
>   * Common macros to be used in architecture specific linker scripts.
>   */
>  
> +/*
> + * To avoid any confusion, please note that the EFI macro does not correspond
> + * to EFI support and is used when linking a native EFI (i.e. PE/COFF) binary,
> + * hence its usage in this header.
> + */
> +
> +/* Macros to declare debug sections. */
> +#ifdef EFI
> +/*
> + * Use the NOLOAD directive, despite currently ignored by (at least) GNU ld
> + * for PE output, in order to record that we'd prefer these sections to not
> + * be loaded into memory.
> + */
> +#define DECL_DEBUG(x, a) #x ALIGN(a) (NOLOAD) : { *(x) }
> +#define DECL_DEBUG2(x, y, a) #x ALIGN(a) (NOLOAD) : { *(x) *(y) }
> +#else
> +#define DECL_DEBUG(x, a) #x 0 : { *(x) }
> +#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }
> +#endif
> +
> +/*
> + * DWARF2+ debug sections.
> + * Explicitly list debug sections, first of all to avoid these sections being
> + * viewed as "orphan" by the linker.
> + *
> + * For the PE output this is further necessary so that they don't end up at
> + * VA 0, which is below image base and thus invalid. Note that this macro is
> + * to be used after _end, so if these sections get loaded they'll be discarded
> + * at runtime anyway.
> + */
> +#define DWARF2_DEBUG_SECTIONS                     \
> +  DECL_DEBUG(.debug_abbrev, 1)                    \
> +  DECL_DEBUG2(.debug_info, .gnu.linkonce.wi.*, 1) \
> +  DECL_DEBUG(.debug_types, 1)                     \
> +  DECL_DEBUG(.debug_str, 1)                       \
> +  DECL_DEBUG2(.debug_line, .debug_line.*, 1)      \
> +  DECL_DEBUG(.debug_line_str, 1)                  \
> +  DECL_DEBUG(.debug_names, 4)                     \
> +  DECL_DEBUG(.debug_frame, 4)                     \
> +  DECL_DEBUG(.debug_loc, 1)                       \
> +  DECL_DEBUG(.debug_loclists, 4)                  \
> +  DECL_DEBUG(.debug_macinfo, 1)                   \
> +  DECL_DEBUG(.debug_macro, 1)                     \
> +  DECL_DEBUG(.debug_ranges, 8)                    \

Here and ...

> +  DECL_DEBUG(.debug_rnglists, 4)                  \
> +  DECL_DEBUG(.debug_addr, 8)                      \

... here I think you also want to switch to POINTER_ALIGN.

> +  DECL_DEBUG(.debug_aranges, 1)                   \
> +  DECL_DEBUG(.debug_pubnames, 1)                  \
> +  DECL_DEBUG(.debug_pubtypes, 1)
> +
> +/* Stabs debug sections. */
> +#define STABS_DEBUG_SECTIONS                 \
> +  .stab 0 : { *(.stab) }                     \
> +  .stabstr 0 : { *(.stabstr) }               \
> +  .stab.excl 0 : { *(.stab.excl) }           \
> +  .stab.exclstr 0 : { *(.stab.exclstr) }     \
> +  .stab.index 0 : { *(.stab.index) }         \
> +  .stab.indexstr 0 : { *(.stab.indexstr) }
> +
> +/*
> + * Required sections not related to debugging.

Nit: Perhaps better "Required ELF sections ..."? Personally I'd also
drop the mentioning of debugging - that's not really relevant here.
I'm also unsure about "Required" - .comment isn't really required.
IOW ideally simply "ELF sections" or "Sections to be retained in ELF
binaries" or some such.

Jan


