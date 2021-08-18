Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCF63F033A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 14:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168220.307124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGKJm-0001Ws-Ag; Wed, 18 Aug 2021 12:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168220.307124; Wed, 18 Aug 2021 12:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGKJm-0001UF-7X; Wed, 18 Aug 2021 12:05:14 +0000
Received: by outflank-mailman (input) for mailman id 168220;
 Wed, 18 Aug 2021 12:05:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5uW=NJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGKJk-0001U7-Oo
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 12:05:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d58a75d2-1077-4180-84b4-e8b44b776f22;
 Wed, 18 Aug 2021 12:05:11 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-MBNeGJvgO1iD-V6mTKP17w-1; Wed, 18 Aug 2021 14:05:09 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5741.eurprd04.prod.outlook.com (2603:10a6:803:df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 18 Aug
 2021 12:05:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 12:05:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0051.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.9 via Frontend Transport; Wed, 18 Aug 2021 12:05:07 +0000
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
X-Inumbo-ID: d58a75d2-1077-4180-84b4-e8b44b776f22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629288310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=degTlchOVEFdHBQxSSmb725O+cMRIGpybMzkTtb55g8=;
	b=GreIidDa5UatT7gzSze81SvQczsQTjhOnDA7qU/4KCT3jsz+JkkUOsj3sLcfJ/H/9L+juP
	ezut03JP54A2xS5BA/1/jCjMn3sh0kPO7mP0UBJfQec6o/XZHMc1r5vodGlbB0RqdvljGb
	FYp43eXTdEVnEwlVffSKlTSvmmDj4g0=
X-MC-Unique: MBNeGJvgO1iD-V6mTKP17w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/XMvCt+00qFiKG6+K+YkuiN6EdipRYLGJSxsRf48jDBTBdx14wsSJFLxn9SlHnavZQN6GQ9Dtnp30O9Uy4skslq1hgfUFk+7sq5KNxnuBBk9+NCJoIoYkLkovUwVP/JVijJeC+kHsnPBQ5KactMKrgTZKZs3vkuePcznTR9iIMhNW5iruNaHsFaTXpHEN6xFX2zXmUKpg7uDR6gaae1aej708RIzIjBuCKjvrtjQWTmswE3tT1D2LSU29E+4NC/zyQtHtzC2AS0RyW4KIit9L5ax0n2hQ1W3iL22plAmU36vwSDkC8/4pWYDj+MZ6el70IVA33MZLNKcrBnFzZwaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUy51wxRUL5/HbiqqtwHK7WCzXUv5fi32Kx+BsuxSHk=;
 b=WVFSsASJ+a+X4PZjV3ZXooJ+R1Da1ZHxxZxphzA0ekQevou8qwPviwbc8WfVExLxhyHQj5pFv3iQ6bCEa3f9h6dwLhd3rEcLt3mSuOyXJMjNQO6M4ZA1X+HlxjdGoqe/Lko+cRFscKgAGV5wOMDlND+TM12P7uKgLt8X18dFm8qvh6/NyUW4VlzRS/kxoHV9ciwhJganGtdlt7M016kZr0EnHbtv7q76WtYq71ISjWCSfMGraFcqNfaLO1iwE6U/8VVvprKOwbLY8UHZheWIAJMFk4nBwdtoHl+tZYCl8Owrinhk22q43L7B7CBr7UBazNpI8ytedFBvLdgh+DH8nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] x86/xstate: reset cached register values on resume
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20210818113017.454251-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ed21b560-a52f-829b-e494-6d48438b6c3a@suse.com>
Date: Wed, 18 Aug 2021 14:05:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210818113017.454251-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82b99845-7c4d-4315-b938-08d962406b9e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5741:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5741DC3A2195413771367F04B3FF9@VI1PR04MB5741.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ABAN5wpMgDbnSjKF6f3obwwuAUaGBjpRiwOS5YgHBy8LMhsJ37HmwUrmGLKMwkrmBKBekqBIjy7+adKIPxTHsM3AhtdWnMFLeifaLiILPPyhNISrqTwWek4fNEVKjwT9MO6LyEh6Je/PQ78ErNY/I3D7apsttgL8s6cRTa9XWkJUjEwYU6pg2OJ7O1FA/Itg28mkyyfSIS89GQtMX+U04E7NIcfe1LK/7Ygz9ReMNafrFkWXCTmhuia3dhgT3oFKBa2JWd01I2Tv1e2TidOL+J6+5AFrux1pJ0rOlnWrqUUgCmiMaHN1w6+yt9C/u6K+YQ1ottxZu0/c3pQ7Yp9ZObW6Wvv2Q86ASqKeSjHkBmd39YRCWKyLGo2hFhPCCDxd8qYEroS0emwJCizLXmHFfigwTRtHGt2iolSWW/rq8rpy3ljpPaSqGuBdlVzoB9tePZUbljLxRa8ASCYe7u4XK4THjSdV0ftzh5SXV6r0U079U5bzX4OGbrhMFMT3Y01cVEmquJKqlTaZ7H1YEHhnO7bHSvnmIlnNzq7Gqu1c/Ox4sUn42TEB/pelRAFyCByfXOJM//KXhWce8dlCIsEp/GZuqR/MfVxTFrNnkT8KWOkHv+AyRLG1Zdg2jE0pbP+vxA25PDY1pN7LQ2XHAwrdAbP+Rm4yTMHzyqkEaYNslDCQRnbPOtH3I0QAyaDQr9/6Jr7y0A899KyD0w8vXtibw7K0/J8X92V58pAiexV521g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(4326008)(4744005)(5660300002)(54906003)(53546011)(186003)(36756003)(66556008)(66476007)(16576012)(316002)(26005)(66946007)(6486002)(508600001)(6916009)(8676002)(8936002)(86362001)(31696002)(2616005)(956004)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cj6vHP4WHBX9v6RLzMPWcltk8OzRPcYxdBd/8H+o+MVfSlNYL4azHlWqFiYp?=
 =?us-ascii?Q?BLA/SrEEz/ElAm1i3bf5aaPRn7vOvmTdrXGpt7emSC5vGd+yKtUnZ7dwntmW?=
 =?us-ascii?Q?y/smuMU1zM1XXbBJ/0stpHbyV5kuMGaC3GoRnwzlDN/bOlLvHa5wsDjUZ8Zz?=
 =?us-ascii?Q?lJSpvVXBI/V/9LRjE9e9lHeuuC//N1LA9WdFCSm0hI0Su/B6r6uBkOCqu+i7?=
 =?us-ascii?Q?esBrAdaUMV0XBcaygmDzdomDykQI8PiZsRM0WW7MIpGqN7Ole3rBpuLc6SP8?=
 =?us-ascii?Q?hFl8CC/SwVuJ59PqymfHlpcoB3JpFW9XZXojoEoln7Yj092RrpRuuRmjVMMt?=
 =?us-ascii?Q?kZxZHpEJqH16ds/A6OLB+s1JghxiRqXcCFTL17BZXKXv0ybFgLzUWMg4y/Zj?=
 =?us-ascii?Q?88qLimcqyWwe+dI1Gx3ZQx62dl/5kRAoAwKeCEFFl4x9HFgM+z32KrFmRpum?=
 =?us-ascii?Q?WF5ouRnwJ8qoBqcjuYFN16c4jTavXREuD2uYEu6BbBMqZPq3yEUAJX06kB3+?=
 =?us-ascii?Q?y/uf/KKyoksOox8JbOPgj5KMyerlhu2k3ItzlksEJl52wxotg2+KytWSfRNd?=
 =?us-ascii?Q?TJwr0S/Gy9v7RW0/CaJfvqvxdjZEJJsL6oQd49JiFvMx115W4WlRrPCQYzkA?=
 =?us-ascii?Q?10CfO2WtsPP1p2+eMiSPqgAkZGUT3j65oNtfSCzIURbEkg7kc1MWreoMTTr/?=
 =?us-ascii?Q?/2/AnWq0yXVEiEJuxaGJlLP3lSfwpuMdz2yNbrMCqPHEytBbRkho7mJBBG2M?=
 =?us-ascii?Q?3/TdvwJXz84zV024r2xJSwBiZc8qbHp57ndwV2r99zJHIrglqnekvo8Ui3bD?=
 =?us-ascii?Q?UBQmxl8ddTWAXfRpE+prTxToLQZDD7cyUOQceMj1KqSHSJkKy3mKDVuzttqq?=
 =?us-ascii?Q?F56IaeINnBrwykIDt7sz2SjnDikR5Oy/oUh0XcGvP/5n2rE2NcifpSiYQa//?=
 =?us-ascii?Q?c0Gt75uwHq8m1sSae14UX3XpQat3wayp65ej6mFMGrWegIijJ+Cs40hwuaQ2?=
 =?us-ascii?Q?IBhVUBGppQjqLsyiJ+wIkr0zNROkzVJVzzC3Djett69rIjie8tPRq1h2Wf9v?=
 =?us-ascii?Q?GG9xxJ5kUIQ7mxDaTHfyFm+b3hhRDrLtCzVba0IyyreWGzdbLStZdcgOB8Jx?=
 =?us-ascii?Q?cG0bQS0g/B9XXvj4nYTegC1sAKxxHoYWVa7Nra/Q5b25xZ6XE0VIYkgq9zY3?=
 =?us-ascii?Q?DC7NyWvVtiQfZM9ZgQh0p7nlreHRbWXQ87uVsJx5PUzmV4wBT3FA9vSRxrkB?=
 =?us-ascii?Q?CuEHIdGNFbgGA856Jc6Fmsl3WLQwUVZPIh+K5tVN5VaXZbWkB1GsU9ZXhk8E?=
 =?us-ascii?Q?2PQ8IHtVsHPvag521Pr4C79X?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b99845-7c4d-4315-b938-08d962406b9e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 12:05:07.3608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8Egs2Gx+W6qv1golLq4xaMySGp3wLs/Ccaz1UHDj7vECgHdhIbM+BvtuuwEYVjX36nkWKMIFowU/mUklVtkxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5741

On 18.08.2021 13:30, Marek Marczykowski-G=C3=B3recki wrote:
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -642,6 +642,13 @@ void xstate_init(struct cpuinfo_x86 *c)
>          return;
>      }
> =20
> +    /*
> +     * Clear the cached value to make set_xcr0() and set_msr_xss() reall=
y
> +     * write it.
> +     */
> +    this_cpu(xcr0) =3D 0;

While XCR0 cannot be successfully written with 0, ...

> +    this_cpu(xss) =3D 0;

... XSS can. XSS can't be written with various other values; I'd
suggest using ~0 here. Then

Reviewed-by: Jan Beulich <jbeulich@suse.com>

and I'd be happy to make the adjustment while committing, so long
as you agree.

Jan


