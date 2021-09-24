Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8FA4170E2
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 13:32:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195319.347970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTjQo-00063N-Co; Fri, 24 Sep 2021 11:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195319.347970; Fri, 24 Sep 2021 11:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTjQo-00060b-9Q; Fri, 24 Sep 2021 11:31:54 +0000
Received: by outflank-mailman (input) for mailman id 195319;
 Fri, 24 Sep 2021 11:31:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTjQm-00060C-Di
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 11:31:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d47ac62-699f-47d6-aa13-97e98398c8bd;
 Fri, 24 Sep 2021 11:31:51 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-BEwFl4_4OHaRNGT3NKMDDA-1; Fri, 24 Sep 2021 13:31:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 24 Sep
 2021 11:31:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 11:31:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0198.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 11:31:46 +0000
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
X-Inumbo-ID: 0d47ac62-699f-47d6-aa13-97e98398c8bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632483110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IirCkd4B5oXhSrzUbNH52RfizmlgngvG0g3h4esKx6E=;
	b=n8mxWnHH7BpaAejfg5kQJRzGu0gBcwV+3RhZy2CneOV3oOz8gB0OUvLKmM++JF/NBI11vD
	SrbtV1e1nwiCnDD1ISngfwRxk8JafyulmAnhd9yOeMHmyHCUd4UUFk8Na4qdhxWXT89Z1v
	0DZuK3HiVmV0v8ifMbHwvaSmMkJSaoo=
X-MC-Unique: BEwFl4_4OHaRNGT3NKMDDA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iobeUcx6eC3oayB70qhdNpEo3HJZ991VhZVmatqSbSSRURPSN2srMR87a7DTvzIkIpCvVOjPKc/dcdk9rS1enq8JrlXKtjfRt1XQ4lIxKf9Rk0dWMSpS+2QISt7NAPgeQ1VtERl+0iegpTLuUBwAKQCf4bbeIbocmexietvMai/r7JDrkBNMdqRqT+0aZTs/WTIfJ5S4pC/WfnMnEf4JeUlhNqZZ2rzCpTe6JXcZdVVrxA4EGPDCBh1fZ7qZuoR3598Mq6diREqE1CYLJJgH+jqodeP0VpUgvwa5A5b5s/lwAz6B8oLtnDNckCl+q/a2OyrkcHQ/w7BjBa7zqpwwiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=IirCkd4B5oXhSrzUbNH52RfizmlgngvG0g3h4esKx6E=;
 b=c4A1nnU7FxoBcdY8lb8HZrmLdONKglRmcSna9wALqOXAqW5AN2iwM2GOVnrMqUae6DgreBcUZkPcmVc9HZOoiI1WkLneSwcRBgtHqlYfPSjZY6inFIMzRavWjhws/G5iZ+QzVY4JsrufMQRmWSv6AuJRep1gBYh/gAi+b8JnGpQ6DfoW7aZ+0L+FSjVXT50nfzYDdjeDtlgRxPwocMR/ZKlWMTEn8qTZwHiWPmJQktbzd0iCXZ9RmZ0u2FXofvwGK9f3Bq7FddZoEqlUNsIh3NOOlltPDNrV7H2ePJ2D0u2IwPyljdsMMLP8lMUnb3dphHfXu/Vyovf0YMRoSEDKvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
To: Tim Deegan <tim@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: sh_unshadow_for_p2m_change() vs p2m_set_entry()
Message-ID: <ae8b6cf1-d1ae-8a55-7b88-7ef24db0c554@suse.com>
Date: Fri, 24 Sep 2021 13:31:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0198.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb1083d1-907a-43d1-fa95-08d97f4ee468
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2606F90EB00CCA81602A241BB3A49@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8CY7/98DhsJMx49nB3ZJNhKlZNTQ+N1Mi9oTQ4gb7eWxoP1klbAqS2pqQUw+6FWdZOru1kBU4WgCbQPwl/t4wloOFCUZCALfBGBcwd16DarTyC9lT0N8mtRqP7oCSoYfnNa6+7CbKWCd/X6Z+MWbKAmv/mBB+PYIOubyHfkr5CrqcnAkXjZzWm6g7AnSJ4BUsKxUZ0GVoasWS1AHzO3x4D5ZI2B10FOnp/W4zzur2z5TjT451xCseQwbvl9Ni7LfrRTediGpZD/pCK8T/crizr10iNFwIvStbiSBhXvao5aITcBi2CG8iP/iQ1NaqBReT36zo+IzkKBqSX4bEhotMmm8RiuHOWu6bQCWVSCdnGX0DmMZCxTQRU371Ba/V7whHZYlqljmDvz0fvKX7gLKvnonJK4ylAZRwcccrJD58qFcRluIf1hJDWzDgGaoCGUPCYQDdpl2rtcacJ9SQHsdaSkB1gtCHEJorT+HLGdQwpwo9N9zQIam+iR5lnwQsuzehl6sTHfJpjM5SxjPPhW+Cw5ffjcoozt2tGmmjtpfsv2EJjTaUqjWZhQs/Ite5Eay0dIsXx5eK+pps2LATN99/k8Gz5UiSZoQeATFa/E9MkseTVhyq79AjYg7oGVo7P4VPvyybMvGk7RK8zWAe0xHOJGGBrgAg4SXtv1OiT9jEUtYsUdAABYVh+o2oY3RZGCVke3AzRtwg193RpQo2iCXd8w3MkGB2UBKgIe4BgMRb3xV+OB5tZGYbzUL88V1EJiA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(86362001)(31696002)(6486002)(2616005)(508600001)(6916009)(956004)(38100700002)(8936002)(2906002)(5660300002)(83380400001)(4326008)(26005)(66946007)(36756003)(66556008)(66476007)(186003)(316002)(31686004)(16576012)(70780200001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L09vZTV5QTd3ZHRnU0VYR0w0eHVUWkRld3YrQUNsazJXeVZJUzlNU0dOc0VX?=
 =?utf-8?B?Nm1NenB4V01nZ3JWMi8rREszaXNWY3B0QzhvSVJHWHBkUGFrSFBET3YvaUdl?=
 =?utf-8?B?LzBHZi9XNkI3TEl3YWZYaXVmY3VmYzBIU0JHWnIyV3FmaWNNTFZKdCtiSkE5?=
 =?utf-8?B?c0ZwU1ZNT2VGeHNPQUpMZzM3V2Zwc0NFUDU3MTlIRE44aVM4Y29tRzhJZjVs?=
 =?utf-8?B?R0RuQUVvME1tWjFrUk1OTDZQd1RMbUJJUWFaODk2OHg0YUtxdnZ4M1dzZzY2?=
 =?utf-8?B?aFk0bGJuMzZMZkVhK2xmdVRHQ0lYNlNrQjRqSXJHaDAyMzYvQnR3ZGhuZ1RR?=
 =?utf-8?B?a0FWRVVTZG5lN05TVDlPamQzUUt5WmFqV2k4Y2pyQWF5eDRQQlN3UDdjYUVL?=
 =?utf-8?B?SExrSTIxcGxiODhmMVE3dDNDb0g1OFhObm42NWdwelk4Y2NQcUxoOEdhcXV1?=
 =?utf-8?B?TVV6TkJETjlQdU1wM3VneDQ1d2VxRTNsVDNNT3hOVEFiYURyUTRLK1IzYWNL?=
 =?utf-8?B?RkRIY1ZrM1hISDh0bTBSRGRmeTRWeDV2VGpXY01XOEV4VGhBVkhjYTJoVjc0?=
 =?utf-8?B?VHl2YWlFRG1MQmpSaXRNQW1xbjVzTEtRckFwU2RIQlRlMTJONlV4OFBLVjVI?=
 =?utf-8?B?U1hhcXBBbFpTWXVEeWIyZGFrTSsvY3BRVkhJK0pkWGUzcEQvZHFZaEkyTXFQ?=
 =?utf-8?B?dTZrWGxicFBNbndqRzRmdkZqbks2YXM1M05GSWdjdTBabXp5U29sUXFQYk9E?=
 =?utf-8?B?S1cxOFYyelkrVXlaWDdoNDdVc1FaTHQzOXc1d2xRSmwza0tDVFZpckpUSzlL?=
 =?utf-8?B?UnVhcy9xQnFjRTAybWZ3NXpQYXV4ejFCQVNtdjU2Z1RiOS9MU1A1RWZXYnV1?=
 =?utf-8?B?REgxSnJCVnFoNE1sd0g5cW5hUnFtN0RvQ1o0YVBTTFFia1hmaHBmaFMxTjYv?=
 =?utf-8?B?R29UeGN0Um9PbFgwTGtnWGZWdE1HazRqSUZvNUp5K20wUjNtakFENzVUN1FV?=
 =?utf-8?B?QzFWUGVYQkRpVnVKdzV1MjRncVkrcGVqOTdqOTZFVWJQeFZmSzZ6Sm4rWGRo?=
 =?utf-8?B?UjZwNTFSWHBFRkVOaFFjSUpjWGNRTGZ5ZWwyY25sQ0liUEtaaXBia0xxZFZt?=
 =?utf-8?B?dllIajd2a1YzRjZ4VFd3dklaUElPQWNWdDhJZXR0MXE5clNhcnJEYlkyekFw?=
 =?utf-8?B?SUl4Z3czV0w1bnZ5MXBCRzhobGF3Zmc3bHNqZW5RZlRSU3h4WlZaMVR2MU1i?=
 =?utf-8?B?SkpualFoNklJRTlNNWhJNk1oUW1NR2xlaldjWnJQNlREUlRLTVJhQ2RscmZv?=
 =?utf-8?B?UTBzSVNFQTBQem9qNTE2UGYyM2taVWNOODNaejVEV2pFYzBJczJhYm1JdUE2?=
 =?utf-8?B?YmRBbkNRU0pOTWdhd0lOdmYwbGttTEI0ZTVWU00vZHJFUmpFM09WaHRvODhU?=
 =?utf-8?B?LzNybjg0ZXZhdHkvaVliaFcvM3lMcWtaSmdvRkRlamc0anoxamlmTGhCZW02?=
 =?utf-8?B?N1JXU1BoNzdEY3FGZGJKRkdyeFRlb2NNK29tMGphTHc1NUV1YTRCQk10MjZw?=
 =?utf-8?B?NHpZQWUvSUFZU0hPUVhwcEs2ZmNESE5GTGs3b01YcHN3eVpQZU5WZUVUQXp6?=
 =?utf-8?B?TFdmSUxHWFFhT0Z6YkFWSDRyWWxUSkZleEQzOGliV2FsZ1BQMDlueThxajlC?=
 =?utf-8?B?NVJkeFBZT0FDWTlzZmdpMTFJTzZjN2VZRDRveDN5TkdPQlFDS1gxV0I5aDJE?=
 =?utf-8?Q?QpbQ0AeGzMAPmjK33xq/9r4fsdsdNJSDlzf0Gpo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1083d1-907a-43d1-fa95-08d97f4ee468
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 11:31:46.7166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKWlEoX2KczHtEz7tu0X7iFHPbhTv1JCG98p+DUTfva/1o9ES579FGtKHGUFJNBODCryW9dHjimNFIkTySzCOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

Tim,

I'm afraid you're still my best guess to hopefully get an insight
on issues like this one.

While doing IOMMU superpage work I was, just in the background,
considering in how far the superpage re-coalescing to be used there
couldn't be re-used for P2M / EPT / NPT. Which got me to think about
shadow mode's using of p2m-pt.c: That's purely software use of the
tables in that case, isn't it? In which case hardware support for
superpages shouldn't matter at all.

The only place where I could spot that P2M superpages would actually
make a difference to shadow code was sh_unshadow_for_p2m_change().
That one appears to have been dealing with 2M pages (more below)
already at the time of 0ca1669871f8a ("P2M: check whether hap mode
is enabled before using 2mb pages"), so I wonder what "potential
errors when hap is disabled" this commit's description might be
talking about. (Really, if it's software use of the tables only, in
principle even 512Gb superpages could be made use of there. But of
course sh_unshadow_for_p2m_change() wouldn't really like this, just
like it doesn't like 1Gb pages. So that's purely a theoretical
consideration.)

As to sh_unshadow_for_p2m_change()'s readiness for at least 2Mb
pages: The 4k page handling there differs from the 2M one primarily
in the p2m type checks: "p2m_is_valid(...) || p2m_is_grant(...)"
vs "p2m_is_valid(...)" plus later "!p2m_is_ram(...)", the first
three acting on the type taken from the old PTE, while the latter
acts on the type in the new (split) PTEs. Shouldn't the exact same
checks be used in both cases (less the p2m_is_grant() check which
can't be true for superpages)? IOW isn't !p2m_is_ram() at least
superfluous (and perhaps further redundant with the subsequent
!mfn_eq(l1e_get_mfn(npte[i]), omfn))? Instead I'm missing an
entry-is-present check, without which l1e_get_mfn(npte[i]) looks
risky at best. Or is p2m_is_ram() considered a sufficient
replacement, making assumptions on the behavior of a lot of other
code?

The 2M logic also first checks _PAGE_PRESENT (and _PAGE_PSE), while
the 4k logic appears to infer that the old page was present from
p2m_is_{valid,grant}().

And isn't this 2M page handling code (because of the commit pointed
at above) dead right now anyway? If not, where would P2M superpages
come from?

Thanks much,
Jan


