Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA7E3A96B9
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 11:57:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142816.263412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltSI9-0008IA-TF; Wed, 16 Jun 2021 09:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142816.263412; Wed, 16 Jun 2021 09:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltSI9-0008GC-Px; Wed, 16 Jun 2021 09:57:01 +0000
Received: by outflank-mailman (input) for mailman id 142816;
 Wed, 16 Jun 2021 09:57:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ltSI7-0008G6-Up
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 09:56:59 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ea8c99e-6b36-4182-ade0-930f563b2f14;
 Wed, 16 Jun 2021 09:56:59 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-R86nVK6COOeW0KLlx9Wj7g-2; Wed, 16 Jun 2021 11:56:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Wed, 16 Jun
 2021 09:56:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Wed, 16 Jun 2021
 09:56:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR07CA0034.eurprd07.prod.outlook.com (2603:10a6:205:1::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Wed, 16 Jun 2021 09:56:53 +0000
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
X-Inumbo-ID: 4ea8c99e-6b36-4182-ade0-930f563b2f14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623837418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLoIRvGF7swCo/JQNs7ZP8KKxmb6K6petkrTD2/9pNg=;
	b=nuvcbil+cxmOd/QWv3pt9RtLzm9eroU/4We4Lzdal6dwOAJTPYwafHeWixBQMguaZ+3bNt
	mCD2bVmCbUSnZq+hao2vdrLkuG0mgu9FTCe+d1UdiU6IIdIpFjavXDgXjLplmQtfFnX3+3
	z+Va9LPzWI5pAY4SYPjeF3R09f+F1Os=
X-MC-Unique: R86nVK6COOeW0KLlx9Wj7g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtODOFJ+M3pQoZc04NKQBlU06FyPkQC/Pn/iPqpdUniLmooJp0r9NHrTOoqUA/hyJ713309Mmb4P4+qkI2Yi/8r5G0SKmd2DBgux4DjbUazMKdLDic+P89LkXva6ZY8lqQylq6BQ+9CoeMwurL342xEcbkx5wc/58d6FREPCeeQWkOxs6g/Ueb6tTovWyC30Fwv9uOh13uGvsduUG8gn26JehgxYkRO5f7pCMa+RUMM8sMR4+ieYaseygWt4yQAG0Z2dDhFF0+T5Csa5MoioVOG/bwXPaReWkq6OuXMg38TyS4LrtjugCwZcr9G9Sv9VmTUFS6JnFphdwluHOXKgfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLoIRvGF7swCo/JQNs7ZP8KKxmb6K6petkrTD2/9pNg=;
 b=OsDrRZNdd5qdfssP5HFO2eY6Dkf8drzI7did/WZIyBoYzusU6AVTH/ufaapp0+T2SLSd8YjKIRP9EEFBhF1aVYcZQ69n57Hr9FhhaqJMmEAFyRr7xb5xb665JGNI5g2DbvFr9atwkQEuRi1z6fM8Bqd/niSN4wE8+6VHJ23twwmk4CLd69x4O97SU+p96K2GnNCGgK71ND5PfR2wYSIPKJ+viM6fdALu1XHOgDzGqfmE27bR6EpulJJ0i8Jo3oK4WremmuENOFgnEALBZIgj8uVfK78lj7apOEIgqcii7ugksr82CHgkiLRkT9ypF3akBGFlEJeeQFK3e/TjaP/Zlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 2/2] xen: rename wrong named pfn related variables
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, x86@kernel.org
References: <20210616073007.5215-1-jgross@suse.com>
 <20210616073007.5215-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8dbeb9ea-56c9-de30-4d5f-fc9c0ced6ac4@suse.com>
Date: Wed, 16 Jun 2021 11:56:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210616073007.5215-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM4PR07CA0034.eurprd07.prod.outlook.com
 (2603:10a6:205:1::47) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60d543f9-2f39-4987-5098-08d930ad122c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3389EEA2D55BDBFEF9BA2156B30F9@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SIcZkIaKn70yEbJaswttJ6Dr+2BiUjVpZGztvA2mkPGIyo/x72TbrBmOtOygZvA1dPKijOadCgalui5Mcy1JugrtqGG3RdkKT7wYVq41n0EUqtV8bUzRTE34PbH0ilxCsn/7wUW7Uw69JMfNRGFH7eKeZPTrW/0H3LCQFBfWk0d0dm2XpcBylEcNbvKEy4peqZ7BAwH3ewkWpg9K5sTI7+5GxcmqgTXLVgIrQQBYQDzfzgc5rAN2TVwbrUp8BvoOuXYnzE3CmgWzkyJ9BHMznVe0q7SzV1c8xnw8prltZ0UcqAEt2J6eNLujJ3Orhs+bTBIm92vscAjfcEWnJyWeOMrRbHSeMca7Bdbu22HQC6XBB3Y5lgrGRhV0mmeS2HHP1X0+Toh7YNvL5JhKXXmwEfa/33LgVBmFj63u4ka++OoaCSPymogvkr7OPKg25jdJDB2iAFGWhQCEP29l5kzxBMEXkmMH6Ga0FmHktE5DRvHBCQCccHR48E6kB67gfvRRwJoWlhGkytJ0mconsRkqwKEoSc7PJxzDR9j+lyZcwnrKUKbWK/753E+FMmQ8kMMsTBfqA2b9OLJU+dIc4mCuwQySe4e/4AVwPfDVJtAY/gH9VegvRamwTtmtUrQxXzL/KOGyllsePH/L+Bz1fM4v5LA6OVvZvoMEzYEwE/Dq1icxENQuzmczwlGA9Gjv1Oob
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(346002)(366004)(396003)(136003)(38100700002)(31686004)(83380400001)(8936002)(6636002)(31696002)(36756003)(2906002)(2616005)(37006003)(26005)(66556008)(5660300002)(16526019)(53546011)(478600001)(186003)(66476007)(956004)(54906003)(16576012)(316002)(4326008)(66946007)(6862004)(8676002)(6486002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXdOc3JHcnA0S2JJNTNieHQ2WjBkZXJIbHo0RytZYkp5TEJNYXlrVGQzNWpX?=
 =?utf-8?B?bXNIdEU3ZVdBNjJSZVhHcTZsR245YnBRV2J0MDNBaDZsRnZzK1hiTzFIVXp3?=
 =?utf-8?B?OXBkaU9rUDkwMWRCd3BKK1N4OUlzU1V0eG0yMVJkNmZPa2hQVFg3OXB1Sm9k?=
 =?utf-8?B?YTJBU0hhM0tGYXNlYm1hbnJRQ3Y0QWNuNEl5R3hOVTlvNlNNQ1RseGNpUHZC?=
 =?utf-8?B?VVZnamtYQm9LSk1qNUxFeXRqQTlXN01URDhwRGlMRGhHMU1nNXpSUm9iOE1K?=
 =?utf-8?B?OTU1R3pnY2ROQWM2b2h0YTZjVWVicjZMaGZQTnJmNW1NOUlGTlNJNzdKZGNG?=
 =?utf-8?B?aWlHL0NNdFQ4WTB3dHV5aDJaTXVqRHkzZ1BlVUlFR0xRQ0ZTZUpuK05ISHdJ?=
 =?utf-8?B?N05hQUR6NlBLbk9SbmFqSkNLdTd1bzZZcVdXVisremVuWExIYXhyOUpTbHpR?=
 =?utf-8?B?WE13bGIzVktYbGhuQ3R4ekUwcEFJUTU3aU03amN0djBFa3Znb0hnVmdZUisy?=
 =?utf-8?B?c3J6Q2NMeVdWQTY1WnY4MGtPMTBpTi9MQTExbzVLeXE2S2Ywb0YycGJJb3NO?=
 =?utf-8?B?MEZKQ2F5bW91TDFZMmQ3Q2VVamwzRkR3QlpadXc0eTVkdFkyTkY1UXQ0V2Yx?=
 =?utf-8?B?cjJEeFVRREY1RURnSldMUFA2UGF3MWlxaisrcEY1Vmt2b1cxQ2FyOFV0a0Yr?=
 =?utf-8?B?UTRJZDNGMjlNOWRGMWJUZHdkZHJEMTVOUlF0L0N1R1ZPenhIbXludnFTLzFJ?=
 =?utf-8?B?TkNLeVlCcEhaVEVhOExYTm11cFBHZ0p5V3VmNkFpM2ZJYTlCaXBRWTFFTkJL?=
 =?utf-8?B?eFVqaVJBcUhGSXlJL3ZERno5VkpLU1R6NXhISlhTQkxDd2gwLzVYek5KaC9R?=
 =?utf-8?B?ZzZaWVp6WmJsRmRHV3BDNXFoRkhhenBlbTgybWVPY05nTGI3WlFjNjl6ODk1?=
 =?utf-8?B?LzNYS0ltc0FoZGxFOW40TjR6UlM2dWpJVjV4c09WVGhzSlRhanBuWldmSkla?=
 =?utf-8?B?L2E5NkxVcmpmalJnVDdoaUVDTmNJWnJGWEpLUFZnMzdrVmZMeEhBZllOcnR5?=
 =?utf-8?B?NlJrZlRZR2QyQkZmRXJPVzV4MUZmc2FJdTZvT01OVjZhbFF3K1ZWek1WZzhH?=
 =?utf-8?B?c3hJU1A2am1wSWhVK1VBRkVUbHFkY245aWU2T3JWVG1Lb2xVb0ppZS9rSTJM?=
 =?utf-8?B?Rk4rcUVBZ2lPQjlKVVN4bkQ1aXVWRCsra1ZEOUc5Nk1aR0hxZlR6UllQS0xr?=
 =?utf-8?B?STZSUVF1THMwbVhxSVI5ZEUvb2hldTlrS2NoTjNwSWlydFZVNERodlFUYzRq?=
 =?utf-8?B?U3hrRFY5S1pNM2s4RUJrNzM1ZmxnQ2F3RTllbHYxc1puWGJxYU1adTF5SXd1?=
 =?utf-8?B?VUdtUlk5eG8ra0ZoZzZJN1VkVkxlbnFXbVdNTGo5NnVPTVF2Ujh2M0VibUFr?=
 =?utf-8?B?em9JNlV4ZFRKMGIvbDlZUDFrR05CMy9qcUd4VzQxR1l4WGJ5VzEzOFJBTXZL?=
 =?utf-8?B?VnlvR3I0Zm8xOXFwaXZWWjRFK2tQWFUzdUVnWWdZME9PQWdUZXMyOFV5VzdS?=
 =?utf-8?B?aWJ6WHNiUk01TVdFbGdWam1VV0J3UE5zdjlWSGZXcUEzbW1sN29wdk80MjJk?=
 =?utf-8?B?U00yRlVsSzdWWmtOencxWnR0UGpOa05qVGFveE9CYytHL3JKdnkySUg5YWtt?=
 =?utf-8?B?UURqNlpXdjJ6OHpGZFljdm8rQlE1TUd6dkdzZFlFaWdad3VwU1VYcTYycTFK?=
 =?utf-8?Q?Vv8rcUuxCnA96VqwdXNs34InqnxAWo1+TcYQ1e8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d543f9-2f39-4987-5098-08d930ad122c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 09:56:54.4224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yuY6J3B6QZ0xYZoj/Ax6pRBer1tejsL/Gat4gZbJbqj9Kp36GkBsLhvcM5rOtKuoYwamaItGCF8OmsOxJn1IZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

On 16.06.2021 09:30, Juergen Gross wrote:
> --- a/arch/x86/xen/p2m.c
> +++ b/arch/x86/xen/p2m.c
> @@ -95,8 +95,8 @@ unsigned long *xen_p2m_addr __read_mostly;
>  EXPORT_SYMBOL_GPL(xen_p2m_addr);
>  unsigned long xen_p2m_size __read_mostly;
>  EXPORT_SYMBOL_GPL(xen_p2m_size);
> -unsigned long xen_max_p2m_pfn __read_mostly;
> -EXPORT_SYMBOL_GPL(xen_max_p2m_pfn);
> +unsigned long xen_p2m_max_size __read_mostly;
> +EXPORT_SYMBOL_GPL(xen_p2m_max_size);

Instead of renaming the exported variable (which will break consumers
anyway), how about dropping the apparently unneeded export at this
occasion? Further it looks to me as if xen_p2m_size and this variable
were actually always kept in sync, so I'd like to put up the question
of dropping one of the two.

> @@ -121,7 +121,7 @@ static pte_t *p2m_identity_pte;
>   * can avoid scanning the whole P2M (which may be sized to account for
>   * hotplugged memory).
>   */
> -static unsigned long xen_p2m_last_pfn;
> +static unsigned long xen_p2m_pfn_limit;

As to the comment remark in patch 1: You don't alter the comment
here either, and "limit" still doesn't make clear whether that's an
inclusive or exclusive limit.

Jan


