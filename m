Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5477C3E8F1C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:55:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165927.303110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlsQ-0005US-F0; Wed, 11 Aug 2021 10:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165927.303110; Wed, 11 Aug 2021 10:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlsQ-0005R7-B9; Wed, 11 Aug 2021 10:54:26 +0000
Received: by outflank-mailman (input) for mailman id 165927;
 Wed, 11 Aug 2021 10:54:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDlsO-0005R1-CG
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:54:24 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2faf49e8-27e9-492a-84db-d9ac0cb429d6;
 Wed, 11 Aug 2021 10:54:23 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-no003Oc5OXWFqaPwtkp-kw-1; Wed, 11 Aug 2021 12:54:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Wed, 11 Aug
 2021 10:54:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.025; Wed, 11 Aug 2021
 10:54:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0091.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:54:20 +0000
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
X-Inumbo-ID: 2faf49e8-27e9-492a-84db-d9ac0cb429d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628679262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q4i9zPn7wkgsPPfDLAFLhpffoo6NQlQzjC//1V43Y5s=;
	b=Ir4ullbo7AdaALvL5p6eaR6OWHX0zPuZy9KekVHl0Iaw9jBqYCj7Co/D4WgBzdmAsvimD4
	/PbCwtDhLndBpJxO7pyHx74AQT/fBp5t1+lqkHOVBdl6Qx4AvVOwDR2OzklhssrQNnbVIy
	bLma8B9k9IEAaRhz5QzWEQ3A05oDeyM=
X-MC-Unique: no003Oc5OXWFqaPwtkp-kw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TeAcxOsjhxNrjHpsE5FX2A5XRA8oDabWpshzHkvx8XYxAUTmVZGPSQW4KMho5l8o1H9PmiYwj3ODuLlDykbvYhFGNel7sw2huYZC/0Qw0U/bV0z0u8dYuh2HgvxXUQYZ06ENSCcjydj+zSyh35T8RxoiUhWFHatSg0Hzv3+/IMxnb0af1Pl6I1OS6pVWGTdGLNqSBSEhHn78ajLNWsq3p/bwVEdyNrKrJG0iKnDB82JRowXTFjBrb1IdkgLxq5oHW511JM/EBeTyfXaMiR/Lc8dJ/VVsdd+mZ/VEha/s5f+1eJ3aGtlvF7rIVSmaOf3tqKhC0gdI1AFzhm3Di7vUuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4i9zPn7wkgsPPfDLAFLhpffoo6NQlQzjC//1V43Y5s=;
 b=Bj/H7HtJ6vMVk2aS90Ava4rs/RATpvza8mde7OxWIXv1el2bfVZsG2AnEr3q8VA4jI7Ico9uLeJfr9QeCkaHkjiW3HM9eAC9lpzP311IErI8IBlwnFWG4UhktahAubMzGTuGrj/nUL2n7WNAyawexMp04zg5U8CblZxp9CI3EOp5SjOF1keEevHKekRYG2/iUKjmQVVY9u3l6hrizP1AY3KSyqzXg4/GgIn4o9fJSu/mQUxHfjvQt72F/tEr1IF52CLwEk6DPELz1o5a7oeMZCG9tcz2xoIMLWNag7dsqPRucedVuyefJ063Xbm8mRII4RAX1BPea/LlNLY0BeEbyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [XEN RFC PATCH 04/40] xen/arm: return default DMA bit width when
 platform is not set
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-5-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f3f002d-6919-bcaf-1f00-aa13ec1a2ccb@suse.com>
Date: Wed, 11 Aug 2021 12:54:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210811102423.28908-5-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0091.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ac52144-3ac9-486f-6994-08d95cb65f89
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260787EB1E6086B255B95F11B3F89@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EpKTWLWqJ6bt0kufEkVBqr5x5u25jtpFmjKbFsWh6Wen9TmsV4+JCE6H5ROiZk7wBN6VTPclk+Grm32ojR7N8dYO7s1gWBxSIHRG5jg3rELED26i6puGQd/jD3I4dzySM3Xw+7H8O80bkJa32y7V01ilUuDbyo3p629EIZX9hz5rnoZEbo9ZaFj8zf69NWMGL6Y5JfAJT9gUxs6ejBeW9mmgJ+ijlxaGDnOwQqaXW+/+9KWKj1vCfRRd64lQia6NuvyS7mG/49LHKJFp4RQuwVwW2zfoMj/PDln5k7YAWofvVVtEkGIa+4UmtoKi8HGEdrShsaItY3U5Kic3R6XDwrr+CW/Y7NrehlzkgDE0qsEnK1lzzt6Utbi3h2d3jFjFDYgHhPmG7c2iZdg1pQbopbg+AR7JN8WXcyQbBYj1CB8eY+NGTvbLIwDQ86hTBa/ze649Q3jRGwTjmahfbWWY0xK7wjGOMiszxqYf0fwP26+DJupUCKXeKhRfNOl6K4EBMV5GQECpfnkLOrXNhdNnSW6RCh3ukO1HzkK2TdhBPgg7MgD1f7Dvprv0ruHkR6ayVE8dYkjoz+mLG9PvVA7hpTZgqy2mGFQ0pP8BpTwxQ1q5/5h4KZpOIgWlG4Ihhwa5M4fE0xwKGAJ+P2+ryI8chEtCae4cxPitZ7GUcW+xbwuDx5q98D/RYxB4pes8diumF2qUnCuAcRqnrkYt8MS30Fl/Jcnylw4CTfMwvqHVbLo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(346002)(366004)(376002)(39860400002)(36756003)(186003)(956004)(26005)(6916009)(2906002)(5660300002)(38100700002)(2616005)(53546011)(6486002)(478600001)(31696002)(16576012)(316002)(4326008)(83380400001)(8936002)(8676002)(31686004)(86362001)(66946007)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkZVNU54N2ZZNDEyYlFkeFMrUkVhR0JGWFQ3cFVTeTlNTXNGRXFKNHhPdlJ4?=
 =?utf-8?B?bHhNS2s1S1RzQjgycy93T0NWZUdaaXJFdzZhWDc5ektETEN6NEN1ZlIzVUFN?=
 =?utf-8?B?SWUvZExlbUZZdU5qTkNOSENlTjBDMDlkMmgzNFpldVo0WW4xd1JDYm5nMUlt?=
 =?utf-8?B?akdjVVF2Tlp1OHJnOVQzMWgwdnRDZTZEOWNvV3huS0psRWd2SUFPcGtiL0JI?=
 =?utf-8?B?NllDNGxuYURxdFlaUjVVTmVyakNQMU1mU1dPRVpMaG5OeXEyYzZlZ2FlK2Vm?=
 =?utf-8?B?RlAwaDFCbGdaZ1lOL0RtcWY1SVpjaktIOWlGdW9FcVFKRVlKV3M3Vmh6M296?=
 =?utf-8?B?czR6YkNSVi9JZHpyc0xhNnEyQUphNHRDMG5aSmtzUlRsc3VOWFgrOCtSRkNX?=
 =?utf-8?B?dDlZVzk5RFlZSlFyME83N0hJS0YyTTY2cnBTSlhoRHlCd1BCcUpKR1RhN2xB?=
 =?utf-8?B?Y1daaHVXNFhSemxLcXZZRnZCN0ZWUUZLL1BSdzJGaGtZRFEzL256dDRWTHZJ?=
 =?utf-8?B?SFhubTN3RldUczNzQ0wvYWloaDNqbjBKMndwb2xCVXFSV1FMdVRjY1J0RXl5?=
 =?utf-8?B?anl3WDJRMkN6MVhZZmQydGJTeWNTZnI0TVA0TEplQXArMmVyMko5bTN6bjhr?=
 =?utf-8?B?MEhBbURDSW8zU1JINUZwYzNNS1FPckdUS0I0R2Rya1N4NnFTRmRTLzYzdzVP?=
 =?utf-8?B?K3VwVHZCVk1HUGN4cmdDR1gwYTJVc3FYekdNWEJCRlpmcmIzT25mWFI5RkU3?=
 =?utf-8?B?L1JRL2lLdnI5NWtjaGRXM29NQmZoelNOdWtuWVlrM0NjWFUrNlZTUzF6bDJS?=
 =?utf-8?B?dXh6V2RQQ1RGcGI1ME9sU1oxTjJaNllHVVpLUXIzT3ZMTzJwVjk1SkhpYWsx?=
 =?utf-8?B?ZmszRmd1dlRrZEVHWGp3aENobXA1alV4RnExOXRnRnh2NURJb2gxV3FUNDd5?=
 =?utf-8?B?Y0JrUlFCMk1DRXBhL2x1Q2FmaFJINkN0UlhQSG1vQ01RRE1kQXFiWUJqNjRK?=
 =?utf-8?B?V1h1UmhaSjhkQmVxMWxDck55UmtqNHBXNlhIcHdtdWRSbkZqWnZSNjEyYWpZ?=
 =?utf-8?B?RnkrUngvL29MQlRxS1JmK1MvRUJJUFpveU8zNXhDRWRKd1p5UlVjVGhoN2NY?=
 =?utf-8?B?Z3JBeHZwUjk1SUR3ZjM1UXJJM2pXUE1iQ3dtZUlKWEtGNUpyZHNIWUZwM2lH?=
 =?utf-8?B?TVF3U3ZhMlFBR0FLdll3VmtiMmQxb2d1VXJWQnN0ckkyUjZRaklBYUhWN0pa?=
 =?utf-8?B?QStFcUcyTm1xVDRZV0VGdHJyZEtubDVsN1NXUEhPbENuQUhJV1Vva3ZmTnNv?=
 =?utf-8?B?OUh5VUZwT20vUGdWb25uODF3ZFFHVm9pS3JPVDV0bGk0SmdwNUpvM3FXN2dN?=
 =?utf-8?B?THRMMkJKcmNFQS9HQmVOZHYxVmczQ3U0VXdYZU1peW5qZVNTSWRxNWR5RjV6?=
 =?utf-8?B?eHhrVnZDdUNabjFtcURyL3FGNXgyYzd3QVdsUWxpNndMdzdvdGJzQWJhaENa?=
 =?utf-8?B?VllrTjhtL2hwenVjMElRRDdYR1hheERWNUdoZ2tzVWJmdDhvWTk3Rk5CeWgw?=
 =?utf-8?B?TVE4OVpyOE9iK0NyWnZPZHJnMnFqeFdxQmI4T0JBMkdHamxidXFraFg1MTl5?=
 =?utf-8?B?a3oxVDExTjlUaUplWnB6L2dwb0dTVE9uTmE4bUViMFlYSXROMDN5S0hkc3NP?=
 =?utf-8?B?MGZYYm5TTVBrYVladmM3VW9weHB3cEZtVG9HaXRYbzJNbFFoM1lqRkREVEhU?=
 =?utf-8?Q?mKyqeKLo2kJQZfie17TQXWBwMug3NK/S6tJY0Mr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac52144-3ac9-486f-6994-08d95cb65f89
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:54:20.7349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: foJjOrQH5IsYUPbYeDJ3ZtaYzTXd6oUbqdvGz8DvcnoYir/F8M37Z42EUb7/I8w64NVnWHrhNG64rkiyQscAOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

On 11.08.2021 12:23, Wei Chen wrote:
> --- a/xen/arch/arm/platform.c
> +++ b/xen/arch/arm/platform.c
> @@ -27,6 +27,7 @@ extern const struct platform_desc _splatform[], _eplatform[];
>  /* Pointer to the current platform description */
>  static const struct platform_desc *platform;
>  
> +extern unsigned int dma_bitsize;

This is a no-go: Declarations need to live in a header which the producer
and all consumers include. Else ...

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -227,7 +227,7 @@ static bool __read_mostly scrub_debug;
>   * Bit width of the DMA heap -- used to override NUMA-node-first.
>   * allocation strategy, which can otherwise exhaust low memory.
>   */
> -static unsigned int dma_bitsize;
> +unsigned int dma_bitsize;

... a change here (of e.g. the type) will go unnoticed by the compiler,
and the consumer of the variable may no longer work correctly.

Also I'm afraid the description does not make clear why this variable
is what you want to use. Connected to this is the question why you need
to consume it on Arm in the first place, when x86 never had the need.

Jan


