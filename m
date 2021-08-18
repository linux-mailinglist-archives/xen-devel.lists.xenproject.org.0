Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 146063F01D5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 12:36:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168172.307034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGIv6-0005Lu-HZ; Wed, 18 Aug 2021 10:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168172.307034; Wed, 18 Aug 2021 10:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGIv6-0005JC-EM; Wed, 18 Aug 2021 10:35:40 +0000
Received: by outflank-mailman (input) for mailman id 168172;
 Wed, 18 Aug 2021 10:35:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5uW=NJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGIv4-0005J6-RT
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 10:35:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c088cd3f-ce96-4270-8112-cd724bd542ec;
 Wed, 18 Aug 2021 10:35:37 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-UNp6uTCoNbmVjmkZ2aAcSQ-1; Wed, 18 Aug 2021 12:35:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2959.eurprd04.prod.outlook.com (2603:10a6:802:8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.21; Wed, 18 Aug
 2021 10:35:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 10:35:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0077.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.18 via Frontend Transport; Wed, 18 Aug 2021 10:35:33 +0000
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
X-Inumbo-ID: c088cd3f-ce96-4270-8112-cd724bd542ec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629282936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yf/vm/tb6CBMdWKfNwejwowgCNPuJTX/q/6yXLCsoGM=;
	b=f++nALNCStznkXPYLJJl4CltK2rpvBJT/K/cHxiDadXNvpq971iT0JjxFPhS4iJTUvkTdA
	y9gMuWqwyzeZ16JzK2ZYySX15QZs0TPEYpeKYFlXo/90831T0DKM69aHOzWpi+aRMO97/9
	GIGW//+Z52E6//iybQu7t31fusz0FuI=
X-MC-Unique: UNp6uTCoNbmVjmkZ2aAcSQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsJ+/hBZoyJ01V8+ux2Zh30uSuNo5/pdMdfjOJ/EKyriDCCdRwYl8VH1LlOYX2qy+95swFT0hmxwVSNMSeMCRwGILDQKVcHB4YwVZcxwnNoxrrNCEpm/Vn1Pgxi1bzXkp5F5lyKiYfCd49CN3RO8qZepz+v3v2svwEKP7tmWDjnaOJgDVJp5Z8qXlvGOMPHBoVRdnh7P5L5x5FvKevM5Dt6HN6/ji9B2Pb+liaW7RF10RQ3urSFpv11mEscbxRRxnqAQgh7RpNz8gfHyVENWZrnXSIMjP2fQA+e2sY/4R5YOcWtvBy/sU3wBOIziCYqvE1H93Afn/61340lZu1nu6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVWzZxAB7LAzqC0qgn38zHai6yuvntAGHwddmsGZdjY=;
 b=dBEqviUqIE2WAOO1iYxpyQEnennJz+V8Rvqyjxg/Xh3fqBKU+wceV39itq0SoGNiRdTn2d2XNbc4gD2jWtPUwFzPBfSFl8ERim/jv4KTTz+gdSvNO4unh9U9MvuXm5FcKuMf7OtvDVkX0rtRrcx7x06X0ZE/w0zOkyXB/jY2F0ffxHfwqpewfr3tK7Ux6pBffHvlYgphFLwmonbmFP91ZYDQ5RTe01MHFStaCttZOzinaZp2cZ/nxCKZZn63HD/9iYlYJQ9Ol1SIci09WvS7p8sn4ZIpuC68Iew9I7nPI4qEu+IzZ8IiDFtd9N18R/yq9fiCfv+LkqTzTim2kb4p+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] xen/sched: fix get_cpu_idle_time() for smt=0
 suspend/resume
To: Juergen Gross <jgross@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20210818102136.23797-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b7cffe58-3ef7-9fc8-a9dc-1c8898104418@suse.com>
Date: Wed, 18 Aug 2021 12:35:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210818102136.23797-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0077.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79356061-363f-4a95-e949-08d96233e8a4
X-MS-TrafficTypeDiagnostic: VI1PR04MB2959:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB295983EE19756E3B69428758B3FF9@VI1PR04MB2959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OXbrn+0ueDoYOsDslATJJHtUKzvsT9e2ukNn2H7jHAvUqj4a8lyvATbDTDoYmS6yWxlaLGvMr9dt5XYR5lMH82cStkl6RUZ1DNkVN6AWnjZBSkdUiM6PLzesezxSai1VW6qqZ7YESWXuiNE0YuXRC8EnDNsbPAW8otOzW4KvlJdj82cvb3VbW9QmexmgxEO/TUT1DFnkPMY1dDDdEiv516TgkqZ+AzlbDApqWoOFGusR6539446wwQUsGdj0n0FyCEgn81O5QMyvn652XT3ZpEsfaZhlgp2DW1QnkCJWNP6LXNlBosMB1jWVgnHU9prGxjqDd6Jyg7eq3Uxe1Px1eioyFCtyUScmvRuJamn2VojStwzuGeUMAGVdqt4LmCpSaM/qb6L8nsz1fYpofIOG4L5S1O6GGsaD9NZJZNx3l8H/nTB88tdz66sY9ZWD4PGuIoz1p6RruXNXLK0L4/ZKe8aWRAAjAHQHuAc+mf0r6HvEv42hT12G98nz061yck/VRhcMRQissEQAebCjTA+PCiNasCqHIa9BxV7ZDXvoA0lEx0BL2TdSNexI57YM/mksuhRY2BafGoYbRR/jOZ3+sxulsWfZOFvUBkkGo/BxVsUusa8Q+WNYORHvmILXHvBwaapTjg+NopvRqC4DkcXKLIfOx2zjSLnRQGMJsVHIZniCI7KPIYE06nCH+0SDQ/2cyK6blRTdiH8FzIb93V7Snz/az3kRViiFSjScczJLaXw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6862004)(5660300002)(508600001)(66556008)(36756003)(26005)(66946007)(66476007)(37006003)(83380400001)(186003)(54906003)(4326008)(316002)(16576012)(8676002)(15650500001)(2906002)(31696002)(86362001)(2616005)(956004)(6486002)(38100700002)(31686004)(53546011)(66574015)(6636002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C80MOCRGlJ4lwaJ6hee+7nzs7oh+JP8SSyopOelaR/8ZxMvrD4L+RqYlYL7F?=
 =?us-ascii?Q?davWMCgTavkv0u26mEVdzKbXIWrad0lvekfE3tPkI3e9QYNEhStdOPlba5Kx?=
 =?us-ascii?Q?zqulpb2Cjlc4BmhWHMWi75cM35GTLgtLXskzYDBn2nPK8ikrrn2FIdPue6im?=
 =?us-ascii?Q?czJ5zyiTTlRJi7aXh8N+Gx032nsBhrlReD4WZ6ugUrhdRwxD1OIFkUD3M+vz?=
 =?us-ascii?Q?TdbEOqz36g5O/XKy6AQdeZqVQC5NZ19U0ZgQM0qzcAnskIBptpsdbBTK2x5B?=
 =?us-ascii?Q?b1fwthkEq4vG5kwwWB+yCRI8n/Go0hBR08voFAWwO3EGpAhzSVqOYJwj9DP9?=
 =?us-ascii?Q?nP7UqpzNg6Y5Ibnj5/CYUZvYvYBWmvHPeLGgfK1e3U87cTVdkVHGyXhILVA7?=
 =?us-ascii?Q?OXgo5wN+5C78QhgXVectYU2UGiOfY57VV7IKxJa62pK+IxCZYIv5nTEnPHJI?=
 =?us-ascii?Q?nIPadWQGvBys8rhN+o9luRCr6HiEQUH/WABG6XXba7NrNWFmIdRWdDs8kY2e?=
 =?us-ascii?Q?UV70wsW1vj7gxeLHUITtYFZDPOefld/U8ZFe5f5C7Zo9tloga4uQAWpbIHRt?=
 =?us-ascii?Q?O+/EEMZbxnRvxViYw+GYsstkgoTTIKlYKw5zZ5gJku4y9CM9UuQbZmV/xFzA?=
 =?us-ascii?Q?vVaXzy1ewlUdmSsrsL03tZStTr2JeUuAD6/G+0URK3flLl0IaJfKxxWYMzNn?=
 =?us-ascii?Q?9hHRivlqwQcv2M/uYpXkzuMTLsKj3qu0Hyh7crJJ+NHw7etOn4WM22ORcfuo?=
 =?us-ascii?Q?U5GpkJRHBxypagOZqCIBv7X+BLP9MAFQg96veKcC8dPz9onzXRdXLcFFDAew?=
 =?us-ascii?Q?CORj3Xv9zQUjjQvjSItD/w46aSmt1pyWw6xM++ZIemrcav+vx815OQuDV5Iy?=
 =?us-ascii?Q?Hn9eiH9ry3OfpZMeHNMyGb5ec5Qo3VQ+2EKyT8fe0isvEyF401pzhBVSXi83?=
 =?us-ascii?Q?k9PlchN5mhz3/Dn4V92LtHXaJEYg+n/HO3kq7GqGDPoguxBjKVjh4WlhgF+z?=
 =?us-ascii?Q?nM6fZuICGoMPSUtlhJCw/AivGCFmbe2QIjla/3ORnXgZMHySzYqPRB1pAtuj?=
 =?us-ascii?Q?cJLQU4u4s+yuIh+Ir0U0/RFRuNiwEbEAoJUPheoZRTW5sdkVE+h6Cq3vr8vQ?=
 =?us-ascii?Q?IPt5U9ia8LM5Uw8QmXVO5HVAIpvzowVedO7fmCL02fHyyNui+KaU4wyJGtD0?=
 =?us-ascii?Q?5gbnfWx3UfuN1YTHCPdaMeSi2oO+3L0sED+MLCC5dIHAVsyFycLBrfB8csNK?=
 =?us-ascii?Q?xo/j5+dXaaFIZNYwY4Jbvb6oZpGLBqgI6qBtAC4rqu8TD0FJDKUpxoEvyXMF?=
 =?us-ascii?Q?w/q+HcAxQS6MslpbNvh31fMe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79356061-363f-4a95-e949-08d96233e8a4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 10:35:33.7500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BN3+2fc5P1GJexQCqPZmWPK3Dtf4e+odqQFXfj7LCGMipTieTFJubggzOZ3ppjf7+TrAK5vdF8TQiL2EDrLVkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2959

On 18.08.2021 12:21, Juergen Gross wrote:
> With smt=3D0 during a suspend/resume cycle of the machine the threads
> which have been parked before will briefly come up again. This can
> result in problems e.g. with cpufreq driver being active as this will
> call into get_cpu_idle_time() for a cpu without initialized scheduler
> data.
>=20
> Fix that by letting get_cpu_idle_time() deal with this case.
>=20
> Fixes: 132cbe8f35632fb2 ("sched: fix get_cpu_idle_time() with core schedu=
ling")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -337,7 +337,7 @@ uint64_t get_cpu_idle_time(unsigned int cpu)
>      struct vcpu_runstate_info state =3D { 0 };
>      const struct vcpu *v =3D idle_vcpu[cpu];
> =20
> -    if ( cpu_online(cpu) && v )
> +    if ( cpu_online(cpu) && v && get_sched_res(cpu) )
>          vcpu_runstate_get(v, &state);

My earlier question was aiming at getting rid of the (now) middle part
of the condition; I thought this may be okay to do as a secondary change
here. But perhaps you intentionally left it there, so I'm unsure whether
to suggest to make the adjustment while committing (awaiting a
maintainer ack first anyway).

Jan


