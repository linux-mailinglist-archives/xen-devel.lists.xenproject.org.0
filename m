Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 800843BD428
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 14:04:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151171.279407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0jnp-000549-QR; Tue, 06 Jul 2021 12:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151171.279407; Tue, 06 Jul 2021 12:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0jnp-000512-N8; Tue, 06 Jul 2021 12:03:49 +0000
Received: by outflank-mailman (input) for mailman id 151171;
 Tue, 06 Jul 2021 12:03:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0jno-00050w-LC
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 12:03:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 379fbf78-de52-11eb-8490-12813bfff9fa;
 Tue, 06 Jul 2021 12:03:47 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-ZjyWLU8LN_izTj3XeA9KVQ-2; Tue, 06 Jul 2021 14:03:45 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Tue, 6 Jul
 2021 12:03:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 12:03:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0116.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Tue, 6 Jul 2021 12:03:40 +0000
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
X-Inumbo-ID: 379fbf78-de52-11eb-8490-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625573026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErCUMiYkR610eB/k1dZYvQnlEViIfNkWDjKB0iL0r74=;
	b=I1jrPi949Dy8vXN69Aq4uq9nghquaEIjNSPWu0z9Z7bb/FLXD0U3EFrr7F+rsnSiwuNN+3
	0AtsSiZDTCZqdeHqRBxcjs92xHOlFWo8N6p39OkE30uUR33GSah6HnWJs77WA7Bslll4sn
	LVtMqq0WsRTlcyD3v7rZjD0rK6q4pC0=
X-MC-Unique: ZjyWLU8LN_izTj3XeA9KVQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVslLwld4osopHA2VA86Tt407dsabmBHxrpIl1VHNp95O7iohWhw3vAJ0NBTGmLj0lGszad0z0tVhiGBylWykl09jDBtzQs5lFTf0BQOqzLb9XVQOu2554wiRlkwjdmG8Blfa9H/Q185E5tqaYuQgGfrxnwOz7IBbkZ58Wt2yZTg5hXAQkcE1G7eezH6kZmi0bT62JiGrKJpemBWYHuBXLc/ZPvco0nSnL/POoxg0Q93FvjGhmbZAJzsoot+TlsbZcsB85jO0itTNZikSlNViX5IHtxIdNh+8woxyBFMPX9NxNkJTtfqNtvSwTb0kVCS48BExN/DoXc7ZkK6KfDB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErCUMiYkR610eB/k1dZYvQnlEViIfNkWDjKB0iL0r74=;
 b=HTvD6rO3LxwToThQKUdki5IIcTQTx+o/OeNd9e30pms8/iW5mpc2em3mcIQd6J7r/t1LV/vM4/Ka8KCB0qhKjpm4iJ20GfRDf19CrZYr1dcGOgeGTbdVsPrYk/6P4aXVxEKq0NfxVKWIfyWpmB1wNahIXzOK9Jr6nqzwSRKdc0p+vTMR77FcHS6+kBeKiHMY8JRAbNqiTYZXsP3ivsDUbZfRPQRlBYPFQfUZweJbTsQW0ca+qh+9LduECDYvjUXpcgh3XoB+U6Q+gePecGLZtX49QyLhvczDvK1mrQARoRt26NTQSIqS2orOZk8KZn/lz+H+JQ3oezpzNbLOJTalUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/2] tools/migration: Fix potential overflow in
 send_checkpoint_dirty_pfn_list()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Olaf Hering <olaf@aepfle.de>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210706112332.31753-1-andrew.cooper3@citrix.com>
 <20210706112332.31753-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d5bb77be-b557-3587-6cbc-3e427104c55b@suse.com>
Date: Tue, 6 Jul 2021 14:03:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210706112332.31753-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0116.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fae53bc-4f9b-4970-7050-08d94076185a
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31184A21D3F85FA544964503B31B9@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kXc1SU/l2q3cR/Ux1AwXn5XIk8Y0iq9lLtuT/MFa5uUqGyADFZGMarKdqP4mJnOclRqkKeigpAAVLse2SVWQj7AVOad+r+QgQTBttY8sGxqwrYUiOwO7SXLqX8uktjXPAE7LAHrf2LRJrlVBLhUXTdD7uavA92+AY29TzSr4/13QCsjGjBtb70IoMTbQk7NN1xxIX+W8M0PDIAPOoyKWu+lTaCpLVkqO/z9I4wQkESayuya6wfCQq5ouP1npV6pVm9WQyBm4DjCdfsv6chl84i/oEAr99GbZGWZRzY+7pEQIHEYVqd4RluqReqGyh0NYgTUDVXAiQJKtgRhZJPt2U+0QNdH+7/+F1nZ3cF9PoylYge7AcqRl8Wayirez0Jg/w7V8dlVEqFpxBbVBU4P3NTnDiRCHFxkUPLU3nMs871NnZABtO1BFSnalcav7hCuKZEObk41XpWNlBvtieBrR/IUVJO+4g+nCVUvV2Vvhuzgau8fZVCNZwafGE4Av5KN03TK13SuLQiV17r6aTEdTLcK1ZUojDsXIW6m73bJW+RVfLD9s3c9Ln3u05DQBx4gdKi8hSs1/vfo1M8eul13q8Qkhm3CS6iVdV++F1kPZhZeic8q3Qqjqjjo1uwrtp2gNAWUfRn0W+FcDPk7a5E29V3K5Kf9adxX6BtCQxlKO+FxvIF2gqdWaI2Qi8z7siTCa1XmATiCvadhIWs+tTyT4uq8CdPxz0WKcb5pYdfk9QBw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(39860400002)(346002)(136003)(376002)(16576012)(8676002)(5660300002)(53546011)(66946007)(26005)(66476007)(956004)(316002)(54906003)(66556008)(186003)(2616005)(31686004)(86362001)(31696002)(8936002)(4326008)(2906002)(6916009)(6486002)(478600001)(38100700002)(83380400001)(36756003)(14143004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDlYVmNtbDdhUHVPVi9xQ1NuQmJacmpPeXh6aGJiUi9uVUlrZFZDT1FVaFpa?=
 =?utf-8?B?aHVVMmJ5MTNJQVEzdUFVU0Q3V2VNSnIyYzFKVW1GK3pSTDNYbTBwMDFKSnlo?=
 =?utf-8?B?c2tPY0ZKWTBTSFpLQlBGSWlPcnlibjB5UmQralBTNTBxcUwza3ZNcXZ1OGJD?=
 =?utf-8?B?M0tQVW5QcjU5TkF5ZjhaUGZuK1l1a1ZrTURzYkJsc3VhVVBGSVRUcHBSSmJy?=
 =?utf-8?B?WEFoN0RaQ1RqeDNhcWpUL0tKSWlHTUhQd0RQY05RU09XWlZwU0NoQ2g5NlVV?=
 =?utf-8?B?VkpHUmFJblBDRXVhbXd1bzBTRTgvY1ZaMmoxZWxFUUM4cVd1bk0reWJJaS9N?=
 =?utf-8?B?MlNIUGRadWdDc0lrblhpY1pPVFZiaHZUVFl2Y2Q4Z1daQ21mNTlpRjcvL0Ri?=
 =?utf-8?B?bE83ZGJ5K3BuTWlPRE00dEgrTWE4aVJEZ2JuMWdMTkorNnZINUxhV1YySW5P?=
 =?utf-8?B?N2RmenpidTJScFQrcnJSZlBJZjRqZDc1NVJISmdkQ3JFSWpUS280bnBrbTlK?=
 =?utf-8?B?SzV6UFdhSi9xUUxmbEpIMWJ0QkppdDk2L1RwMEVOa2hiYTh4L0s5TEpscERJ?=
 =?utf-8?B?bmVMVGpXUjJYRndsa1A0aHU5QWkyOHEwRzc2UkJ5b29YRis2MXNrQ0JUcGxF?=
 =?utf-8?B?dmljK0diSEhBSmFmTE5mRHdVY0h0SHB6R2I1V3d4bjBSaitVVGw2bGltSVo1?=
 =?utf-8?B?UTZWVUhtRGpJMnZ3aXh2Ujl5d0JyRnJrZFlSL2hTNXdsVlRZT2dmRnBocmdt?=
 =?utf-8?B?QjZaYURUZS9PYlRPd05kRkdwQVUwV3ZoWnlWYmIvaFN1Q3VYWXVKNHJBa25G?=
 =?utf-8?B?WUxaU2FGK0Z2OVhmQ2R3UEdhdDRyN3dxRFVSMEh6MkNjakxJdml4bGNsbUw5?=
 =?utf-8?B?Z1k0d0hMZGtLYUVzU09lK05oYzlhVDhTL3Fxc2s4WTNKOGJuVWlUdzVYM1Vy?=
 =?utf-8?B?R2liRFNrUVNURjY2elRzZFRVOU11bi91MW8rNU45Uzl6UFIyaGZGOVpsWVFB?=
 =?utf-8?B?Ymk0eUJxbEFxaXo2NzVvcndRb3h0WmFQL24zeDVLTlVjdTVTUXN3VDZIREZs?=
 =?utf-8?B?NGZ0cDAzcXpOYTlTditwTVQrMC9lTzVpU1NGUWJlQ1Q1L0duZklPL0lKbzJs?=
 =?utf-8?B?S2xEdm0wUkpzNEdaVkE2TGx2SEJsK2NOOS9kclBvRVpWYWZaS29qZGhrV1Y1?=
 =?utf-8?B?Nlh4ekpOUnkxdHBlbitPOVVYZEppTUNZeVdNaHRITUxPZVQ1M3JYaElVbWtN?=
 =?utf-8?B?ekF0bHNRdC9zYW51dWx5ZXp5eGxJdTZhYVhxdW1BajYvN0lvaWwrRHo2Zzkx?=
 =?utf-8?B?KzNOM0IzamY5UkF5Q2owcUltM1FXVHF4NTY3a0Mvbk5Qc2dudmhGSDJYMmhQ?=
 =?utf-8?B?ZlRBTjR5YWttcVJvdkVoeW1WME5lMExITktwalY1Yy9kTjkydncyS0IwLzZa?=
 =?utf-8?B?RFQ4UjdESVNna1JyaFpwa3BoWGw2VU4rUnhrTEZ6Rng0Mm9qVWdZYktoQjZ3?=
 =?utf-8?B?YWMxeTVNamY5SWdhUjE1K0hxZld1TDBLdzljLzNjZHBhN1grWnIzK09HY2ht?=
 =?utf-8?B?cS9rMGJRVFdwckJBbmE2d1dQb1R4Zm00a2pUbGU3aWZTcm1DRjF1MXcram1z?=
 =?utf-8?B?a0MzMlEwWVN4ZVNybU9EQVpUdjFBWStCQldkM01qbUFPOWN6Q2s1cnduRnhw?=
 =?utf-8?B?VnQ5S2NyeFYxb1pZQWFHUjMyVkJkQnllT1VSTzJUR25GQU5YdHpDcXZGNTQv?=
 =?utf-8?Q?BXd680Kzld51dYt6p09Y0Rq8+Hrhf/UbpDnR4iD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fae53bc-4f9b-4970-7050-08d94076185a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 12:03:40.9623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: px4J39Dg+fD8oEagKl/hER6HsMF/Ac1GhGidFyutA80ZXIyKNF5VsZ2fKGzfb23L1Z1MTslBsvmT2zTlOg1k+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

On 06.07.2021 13:23, Andrew Cooper wrote:
> 'count * sizeof(*pfns)' can in principle overflow, but is implausible in
> practice as the time between checkpoints is typically sub-second.
> Nevertheless, simplify the code and remove the risk.
> 
> There is no need to loop over the bitmap to calculate count.  The number of
> set bits is returned in xc_shadow_op_stats_t which is already collected (and
> ignored).
> 
> Bounds check the count against what will fit in REC_LENGTH_MAX.  At the time
> of writing, this allows up to 0xffffff pfns.

Well, okay, this then means that an overflow in the reporting of
dirty_count doesn't matter for now, because the limit is lower
anyway.

>  Rearrange the pfns loop to check
> for errors both ways, not simply that there were more pfns than expected.

Hmm, "both ways" to me would mean ...

> @@ -459,24 +462,20 @@ static int send_checkpoint_dirty_pfn_list(struct xc_sr_context *ctx)
>          goto err;
>      }
>  
> -    for ( i = 0, written = 0; i < ctx->restore.p2m_size; ++i )
> +    for ( i = 0, written = 0; count && i < ctx->restore.p2m_size; ++i, --count )
>      {
>          if ( !test_bit(i, dirty_bitmap) )
>              continue;
>  
> -        if ( written > count )
> -        {
> -            ERROR("Dirty pfn list exceed");
> -            goto err;
> -        }
> -
>          pfns[written++] = i;
>      }
>  
> -    rec.length = count * sizeof(*pfns);
> -
> -    iov[1].iov_base = pfns;
> -    iov[1].iov_len = rec.length;
> +    if ( written != stats.dirty_count )
> +    {
> +        ERROR("Mismatch between dirty bitmap bits (%u), and dirty_count (%u)",
> +              written, stats.dirty_count);
> +        goto err;
> +    }

... you then also check that there are no further bit set in the
bitmap. As said elsewhere, I'm not convinced using statistics as
a basis for actual operation (rather than just reporting) is
appropriate. I'm unaware of there being any spelled out guarantee
that the numbers reported back from the hypercall are accurate.

Jan


