Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F1744E475
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 11:16:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225091.388742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTbO-0003m9-Aj; Fri, 12 Nov 2021 10:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225091.388742; Fri, 12 Nov 2021 10:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTbO-0003je-6x; Fri, 12 Nov 2021 10:16:10 +0000
Received: by outflank-mailman (input) for mailman id 225091;
 Fri, 12 Nov 2021 10:16:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlTbM-0003jY-TO
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 10:16:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8baf59e8-43a1-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 11:16:05 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2050.outbound.protection.outlook.com [104.47.5.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-xx2hs-tSOp-mU88Udojgmw-1;
 Fri, 12 Nov 2021 11:16:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4189.eurprd04.prod.outlook.com (2603:10a6:803:3d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.18; Fri, 12 Nov
 2021 10:16:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 10:16:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR03CA0006.eurprd03.prod.outlook.com (2603:10a6:20b:130::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Fri, 12 Nov 2021 10:16:01 +0000
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
X-Inumbo-ID: 8baf59e8-43a1-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636712165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g/2sT517IDXOgkMxbG4lLCzdUFRUadWYmLFOEsp8ah4=;
	b=UdRJn1hmyuzniXmbqro8C4JWSrJzNoGyx6aPNi1wIf7YINY658NDR0aDNAVk8ZER/xfThH
	W+GISR/f7Qg25dZB0Dis8btymtYG9E18C+fSTxxLiC4jYBSDsrI+PWX9lUWAkgl7MM116X
	RxOGHvkxfYM7yLL8Xk0F9jA9U9xgD+c=
X-MC-Unique: xx2hs-tSOp-mU88Udojgmw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMCvD375kURgTqIbYbdLG+lQ9kXD7KvbP87x7s7IOV1mz7WnKm5MRvMl7Vy62gc+A6XQJoPZB9HW//P1bNXwSHAZh7awTuu5ltKoP7C0PQddtMf/VXIbDnxzwF1ocnMREjtNsjmuOrYcPqbUuWXcglaWGQ24tI+esfg3y46WL+69gQ1kTV6Nod4eLpxYnNjxY5F7k3UMeHq4FtJQC44YxZ48u1FE6jdQ8iif4dnJX1rPdL0duUVK2z87KBBh93/UEKQq2V8DtTP8HiT2I43p4fs5wXY7KGzEM0rRGMyWzlFqpLaNmr9uhqXNm6/tKpA7P8JBzmTASB/0rv1GXtDSyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/2sT517IDXOgkMxbG4lLCzdUFRUadWYmLFOEsp8ah4=;
 b=dVuTkNZcRFI3HfpbNQh5C291nApIVTutpemEBFngra/0IW3a5puZRkUWFJQmCeNQiCO5l4ZT1r+6j83GelXMldESi3CFIERmfi0daWeE6IfjlVGUPactHWK3cbo1YZ8zgHrVwdxba51/QhqODDk3BIMFABCSFqDz/1UXHjngqBZJSTsQ0U4vq22Xp/Xn8rXCKfXHCLJm3+9tRuAmgBXSVt5fC/Q2PS9R/XbHvyEtXXreGk2wwS2K96mWiopo0wRSTKTxmQulkVJyLwwUALmVoJEJbIMc6VVrnMS2AveQLu+G33Rl+ylHE1ULpfzJPYyUOvJOC6++X7QWOTI+HuDrYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8875622-399f-2db0-58c5-691f25e290b3@suse.com>
Date: Fri, 12 Nov 2021 11:16:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/5] xen/domain: Improve pirq handling
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211111175740.23480-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73bcdabe-bf43-4dde-b947-08d9a5c56e28
X-MS-TrafficTypeDiagnostic: VI1PR04MB4189:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB418968EAB40B8E6AAB859CADB3959@VI1PR04MB4189.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N1jd9HGTtTmNSpI221iJR+i77N8ERQh+w9tUgTm3xZoKXZVS77U7XnQTUnRYaM5KKsB/rSeo/GpKppRANalnWzXffFEo2uoouMH0ax0fttCXTkwrJoGEPLeBbfPZ6/fqHU6402Z1lPRRF2R1S97r+Zwp19VQG1NE6kOLW79rJxEStGg4h2n47AjUuQ+EkxuyBkFz+xt+PFgTkt83F+8/+RSYDNgvvzZKwxTL2rodtaD8KBWc/I8WDg02Ox4jPC35znSEwzn+u5VsyF034qv6U71D9wJ7W8dO/SjxtVkM37a9aCdfa2EJk7bjbZ4VYWSMN5fqkjHxl8Ft2IeFd2cXjOz7yHrx7GxQahZZUtfwMxynW5vV4V47uoEQ7JeMPDlRzQEVOWzL9jzVSUb8aq1GLBvEX931ypWxRwbN4JO+pLLS7zJn0ftPZ4rmgBlXQ0aVJ5jSAN8tsyJ0cOjoHkLp1jAYxYwsBsAY7H9Isbusu69uW/8ANc0wSogECh/xXNLjA+TtUJrZ5IZbiDrX/xn/ep5gjxNeKmZtkhrFBFciLuAJI8nl7PRUngy/okAW0HQ+pHUYbqWM+ByohH1K4JY7kq6nAheXQ3auczwdFfoUqnzwtfM2D1jDQldWNtvX3Q1eWLiZzCtvdLwthgedzczKELp6NOSK0Y1yKbgSibppgjfIHlCNpgt4MZuvUmu4Z1jXtke88+nywJMECIfxebtkUgh6Wa/JxUmrZQr9G67BNPQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(508600001)(86362001)(38100700002)(53546011)(6916009)(8676002)(4326008)(54906003)(316002)(31696002)(16576012)(83380400001)(36756003)(26005)(2906002)(5660300002)(66556008)(66946007)(186003)(2616005)(66476007)(31686004)(956004)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzdOYURUMElSbzFSeFV1Z2hqdVJBOXF1eXJUalMwVTRST0VISFhpMmxrYjgv?=
 =?utf-8?B?bDJYRGNCbExVOTlvbnNJUzhkVkVWUGFHbUk2amxJYmhEYkRkWmt4U1h6dFI0?=
 =?utf-8?B?SGh2V1l0d0RlNGhOcFhaRm56d2VkbWwrcGlKa05hRUg0LzNyMTJoWnYxanBw?=
 =?utf-8?B?S3Njb3hKS2dwT2ljMnFBQnZ2Qm1nTkpjcnZzdWZPN2tac3pvMmJnU3N6SmdG?=
 =?utf-8?B?d05tLzhkampHT1ZrUmJsOEJHcnNFUnlrZVJsOXFuMm9aRzFKd3hGbUUxMlFU?=
 =?utf-8?B?bXZaTlBzMlorTk81djZKanh4N3F5S0pSZzhNWnZpc3dJSVphOGJBMFU0STdn?=
 =?utf-8?B?c1RUZlBoTG9wOWZMQ3FjS2pUVGtlOHRTOFhOU0J3OE91WmFhTlhUWUpRNEVM?=
 =?utf-8?B?SysyN1k1WHZuVUkrSWZCRnZGTkRTUnpIekN2cmFzOGo3Wi8yUmppRGhGTEp2?=
 =?utf-8?B?V2ZldWlXUjlXMzlZbHZZUndpcTI5b0g0WnNibVVEK0s3dmNRNCs1bHcvSnh2?=
 =?utf-8?B?ZXVHM21CRWZlMlNTNFdJdEg2UmpCVVRWZWwvRW8yOExsYVVBb1BYMVZYWjZy?=
 =?utf-8?B?V2pWQnVHTXFHTmFqUWRDdkhNbGFKVEt6cHVxTGwwUENZTFhjdlJxc3V6WjRO?=
 =?utf-8?B?Wkwya0lxdUwva1JBSUFIQW1HL0grVEJRcjdRbkc1YlNOcmE3OEhHMExhMTNS?=
 =?utf-8?B?UVZLWHZCNmRudzhiTU1weS9WTGJKTytCL2JpZlM4QVk4MlpVbWFZWjNZNXBx?=
 =?utf-8?B?U3l1VmNEODdrQzBxTU5pZlpNREEydVRBOFdXMEdWY3dQUTZzMGJtZFBCQ1hC?=
 =?utf-8?B?TXlKNXZYUG1lUWw3OTBJSlcvaDRRR0lsa05lSU1PMTBCNmZ0bG5lVUkxYVhl?=
 =?utf-8?B?TDlqbFdqMnRybE9XM2ZOeGtrSTVYUlFqUmVnRDBHbTBkN0E0NWZSOC9rTVV6?=
 =?utf-8?B?YWo5QmRsaXp6V2FzVUhBTG5RYTNKcFJpUzJpYjNXZW1MQnUwNjBjZXpSeCtQ?=
 =?utf-8?B?Z3hPZThsclRwRkV5bnNEZVlrR2ZBUVpHL3BLQ2UzUUZHcUVXYzI0YkFPKzBC?=
 =?utf-8?B?VGx5ZjlQZ1JGekpYMkJlSUlnV3hhSHRrNm55eTl2Uy9jaG81MWdkTFBObkRq?=
 =?utf-8?B?cjBXemIwVm5pZ2F0QXNLWnBqTHhKSDlockxtYmttRGUvZEJ2djZyYWFhdkF3?=
 =?utf-8?B?enFxMlg2Qzl3OUllNXgweC81UEJ2cUhnTHpOTFpYKytJVEJOb0JvSWM2N3JY?=
 =?utf-8?B?UFVSRHlUSmIvN2JmT3hCV3I4cUZ5eXJTaWIvQmhYcGRETGZueTcvMmZIT0pT?=
 =?utf-8?B?eHphOXcxRmxlMUM1WktFZ0dsbWkvWHMwMjNzci9CcmFqVWFKU3pSMHB4OWw0?=
 =?utf-8?B?VUlvQnA0Y2w5aWtDbW9oK0hhYnNVeVdYZUpKR0VySU1KUTloOEhYblVLUzNV?=
 =?utf-8?B?RHpPbUJLeHVWU1lVWjBURWtZTnlhQ0E1bkpNbWpiTG15NnY5amR1OTlCWm9s?=
 =?utf-8?B?Y0txblQ2MzRlMWlKVDJRcUQ1c3FoSm5YOUJGRzRGek1PdjdKbFNzWWpnU1M2?=
 =?utf-8?B?UUJzWDk5TnE1a0pDSzNWb2Z1RVgwQjRiaUdNNXpYZlZ0SGRyT3FRQjkzcFBh?=
 =?utf-8?B?S0tBKzQ1aERxTisyWUp0c3d3aGE3MlZISmg2YStaTURhbCs3TU5qU2hpMUVV?=
 =?utf-8?B?SjUrd2dZOHFJd0VnRkhhWkd1TnFWRWZSU0ZtMTNpVjJEYUx2RlNSV3g4Sk5w?=
 =?utf-8?B?VWE4T0c4ek9Fbm5lZk1xQlBmd2kzcDB1clAvbGMvS0ZCd3liSkl4ZnBybUx0?=
 =?utf-8?B?OE5taUN4NVkvTG4yMml3VFlNbm9FV3BGSnd4OG9CSzJRaW51VG80T2Q5QWJU?=
 =?utf-8?B?c0M2UkdhY3hhVU9CYWpLdWNaR254Rm9KL3JLM0pqQndadXpRalBsVjFnTHcz?=
 =?utf-8?B?bHgyTUFuaTJOUXJHSHNXbHNQR1JyTElwOTZkaWdMMUxsYWpMWEhZZlM3Z3J3?=
 =?utf-8?B?SGpJU3FPMGxpMXI1TnJFK1lWYTJLWlROSUVYTVJlOVVXOTBlYlgvL0pnaUsw?=
 =?utf-8?B?OXF0YVVsM3JKYkVIL3ZuZ2lYcklqNHVOY3gzcnhVQXVDRVdQbUdhNFJjVGxz?=
 =?utf-8?B?cGlLS25RN0NrVGxOSG9YUTVtQituRjcvNnowVVV4VXNBV3NlbGpMVXNBY3Uy?=
 =?utf-8?Q?5H3tJPLKbAaOHX50d+Q9Isg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73bcdabe-bf43-4dde-b947-08d9a5c56e28
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 10:16:02.6118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sp4EBgg9ILmExYjBYLCYZ6DA3U+5T51+0dtEKZCW1gwmpWYi5ZtcdA1MkyOZnlF6KVgTjVYlXkFhFHIzXKihAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4189

On 11.11.2021 18:57, Andrew Cooper wrote:
> free_pirq_struct() has no external users, so shouldn't be exposed.

This has been the case from its very introduction. Which iirc was done
that way because its alloc counterpart is non-static. Not an objection,
just an observation.

>  Making it
> static necessitates moving the function as domain_destroy() uses it.
> 
> Rework pirq_get_info() to have easier-to-follow logic.

That's a matter of taste; I for one would prefer the original form with
just a single return statement. I'm (obviously) not going to nack this,
but I'm not sure yet whether I'm willing to (eventually) ack it.

>  The one functional
> change is to the insertion failure path; we should not be using a full
> call_rcu() chain to free an otherwise local structure we failed to insert into
> the radix tree to begin with.

This makes an assumption on the radix tree implementation, in that failure
there may not occur after publication of the pointer. This perhaps is not
a requirement that would easily get violated considering the present code
structure, but I'm still not sure we want to have such hidden dependencies.
At the very least I seem to vaguely recall that at the time of
introduction it wasn't just an oversight to use the RCU approach there as
well.

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -365,6 +365,39 @@ static int __init parse_extra_guest_irqs(const char *s)
>  }
>  custom_param("extra_guest_irqs", parse_extra_guest_irqs);
>  
> +static void _free_pirq_struct(struct rcu_head *head)
> +{
> +    xfree(container_of(head, struct pirq, rcu_head));
> +}
> +
> +static void free_pirq_struct(void *ptr)
> +{
> +    struct pirq *pirq = ptr;
> +
> +    call_rcu(&pirq->rcu_head, _free_pirq_struct);
> +}
> +
> +struct pirq *pirq_get_info(struct domain *d, int pirq)
> +{
> +    struct pirq *info = pirq_info(d, pirq);
> +
> +    if ( likely(info) )
> +        return info;
> +
> +    info = alloc_pirq_struct(d);
> +    if ( unlikely(!info) )
> +        return NULL;

Are the unlikely() here and ...

> +    info->pirq = pirq;
> +    if ( likely(radix_tree_insert(&d->pirq_tree, pirq, info) == 0) )
> +        return info; /* Success. */

... the likely() here really warranted? Iirc you're generally advocating
for avoiding their use unless strongly indicated, and if I'm not mistaken
the compiler's heuristics result in such NULL / 0 checks to get assumed
to be unlikely / likely anyway.

Jan


