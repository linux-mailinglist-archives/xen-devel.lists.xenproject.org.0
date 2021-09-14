Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B10A240AC4E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 13:22:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186473.335202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ6Vj-0004fM-Vy; Tue, 14 Sep 2021 11:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186473.335202; Tue, 14 Sep 2021 11:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ6Vj-0004cv-Q4; Tue, 14 Sep 2021 11:21:59 +0000
Received: by outflank-mailman (input) for mailman id 186473;
 Tue, 14 Sep 2021 11:21:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K1wc=OE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mQ6Vi-0004cp-5C
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 11:21:58 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f83264de-154d-11ec-b41a-12813bfff9fa;
 Tue, 14 Sep 2021 11:21:56 +0000 (UTC)
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
X-Inumbo-ID: f83264de-154d-11ec-b41a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631618516;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yFDuDpGX3FxW0U8Y86hsKjigs5Vsu3utb0sb2h8ni4g=;
  b=B66f5eJIy4GFBfXHjqoYpvawx9jKulxJi4cuXqhLNRJJrGiPOs+gcEsp
   4gFyAN8Fr5YFp5TEHLuPouMMlIBDUPLP0eXsHBKyAWd4uwDKCTAvl5npJ
   gqUpiwWcjneZ/f6dAXT6Ll/bklPotXgma8xHOWAXfm5+qIyATUWWBV/BR
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4Xf0DRu0XSE7ntekASjZ6FQ/RmMFPTkSU7fYY5lEQagZ62xt37j89x84oyUDPD7MEvXjTM22H6
 nOEMLD1U8KRWJqbGaDt4Z02WCj6zAtaUga9WLGFBvqTGqdJ6iDv2q1PR2Sz51xUyeQY/TAoaig
 Ip/oul5GbZLEGs5wPYvE6xgFfeSaZlQJo6tPb4tAkdJf01Zh/WNQJfKgCk/dRtw9MHu3XbxwFi
 r9d2ObIp7JGPQc8kQZbUi8p2Y5cYyR4dO57kmCt2dGfzhN1TPQ7obu3I5UbCtSnXk08uMxmN0w
 Lk8/qFXT07NPoay2I2IF2stw
X-SBRS: 5.1
X-MesageID: 53073777
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lQKRoq0yFoziIfHJiPbD5dl2kn2cJEfYwER7XKvMYLTBsI5bpzwEz
 2ceD2iGM//fYjGneIsjO9+/9E1SuJeHmoRmQQI9pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970EoywrJh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhjohP8
 MxyvqKLZgYFN6Tgl94FWhMbKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIQAg2xv2Z8m8fD2Z
 MEpdBpFUT36MhRRYnAKS7Q7p/mTryyqG9FfgA3M/vdmi4TJ9yRh3b6oPNfLd9iiQcROgl3et
 m/A537+ABwRKJqY0zXt2nCmi/LLnCj7cJkPD7D+/flv6GB/3URKVkdQDwHi56Dk1AjuALqzN
 nD45AI/9ZYK7XOgcOLSXjGxqVKLhAYVUZlpRrhSBB629kbE3+qILjFaFWcbM4F36JBeqS8Cj
 QDSzoiwbdB7mPjMEyvMqO3Mxd+nEXVNdQc/iTk4oRzpCjUJiLo6iA7GBv1nGbS85jEeMWCtm
 23WxMTSarN6sCLq60lZ1Quc695PjsKQJuLQ2ukwdjj5hj6VnKb/O+SVBaHztJ6s1rp1q2W8U
 IUswZDCvIji8q1hZATSGb5QTdlFFt6uMSHGgE4HIqTNAw+Foib5FagJuWkWDB4wbq4sJG+4C
 GeO6Fg5zMICYxOXgVpfPtvZ5zIClvO7S7wIl5n8M7JzX3SGXFTbpXo/ORHJhDmFfYpFufhXB
 Kp3uP2EVB4yIa9m0CC3V6Ea17oqzTo53mTdWdbwyBHP7FZUTCf9pW4tPATcY+YnwrmDpQmJo
 d9TO9HTk0dUUfHkYzmR+okWdAhYIX8+DJHwispWau/cfVY2RDB/U6fckeE7Zohov6VJjeOUr
 HuzbVBVlQjkjnrdJATUNn06MOHzXYxypG4QNDA3OQr6wGAqZIuitf9Nd5Y+cbQ92vZkyPp4E
 6sMd8maW6wdQTXb4TUNK5L6qdU6JhisgAuPOQujYSQ+IME8F1CYpIe8c1K2picUDyexuc8vm
 JGa11vWEcgZWgBvLMfKc/bznVm/imcQxbBpVEzSL9gNJEi1qNp2Kzb8h+McKt0XLUmR3SOT0
 gubDEtKpeTJpINpotDFibrd8tWsGup6WEFbA3Pa/fC9MiyDpjivxopJUeCpezHBVTyrpPX+N
 LsNl/ysYucamFtqspZnF+c5xK0z0NLjurtGw1k2B37MdVmqVuttL3TuMROjbUGRKmu1YTeLZ
 38=
IronPort-HdrOrdr: A9a23:uY7mVKOVwU5y0MBcTsWjsMiBIKoaSvp037BN7TEXdfU1SL39qy
 nKpp8mPHDP5Ar5NEtOpTniAsm9qBHnm6KdiLN5Vd3OYOCMggqVBbAnwYz+wyDxXw3Sn9QtsJ
 uIqpIOa+EY22IK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.85,292,1624334400"; 
   d="scan'208";a="53073777"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ip+BZh5OMZw91euM1yQ1cig2b0/Wt1EBiS4FfPte/kMvRyrPnGqLU37wTsufvodK3Y1Ub9Ohe0FNPgEqMA2mxRPkq48u0SJ5FPdyxhNh7ZdWlFhVLY7RInvC5F7GWuNrZVpowoUW1zzFiyFJ4F7/fpdW5jp2jUskyaeQbmb2P9phdfRRZ95HMPES21pf2mjwEmd7GrP+Y3quMuA71Qos7MlYbcqFpgEFrTbS+eUo9s9ybqomDz2bf3JyMBc/1Asms2UI00xMdqAohPiblMYlgyu0/6ixV+ZuMKm7kNdE7mqGTfQzKst1LOpis4Rm28RNZwk2/ZFeCKXeHcKMCukjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=v8d851AzpOadqYBOj3pG+NduZOrVaMGqY78DgbM8UTk=;
 b=G53/UXDDGUOuniks7JNHsi4+Y7lacsYwqmgmqNg9eyaupmbw54BhLhIczya8vfCxZQppH1UvEHmYV+dF09UeT7XNtSy1+2b+I3htcFz3F1vuCskP4XuRavAR/+XKAOFch0Z4GLe2/UOL8jL1gT0V2hdyHSPRWUEcRm19zkZqLRIQW1mTosZOZn0rf7mRkZrtDkkeJ8ZlAIPef2jPn5522Mk5Mrid3aYEjtyxedigSSbxZthzDp+siS7ouZB6rlwt7fXlvn+GAICAwTBMs/BoZ9TdbvCby00tZjc2MRCeHjtgHuZiEUKvT4mAXkzjqaJZ6DMnrlqPQukBHi8poottOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8d851AzpOadqYBOj3pG+NduZOrVaMGqY78DgbM8UTk=;
 b=dWlYANq/LjpvIdDmj+0sHl5AVzwDawJG3ThhLoa10n5rXeNrio58ngftwO2Hb4mYO9EVQ2wzcRojl4tgqaLGsemVaPHWARw37PHbWxFXG/eJiC5XaCKepjud9krUxhPwME2CyL8BXceVKPkAZl+QHUBwFSR9uHoS8YsdMI+W1K4=
Date: Tue, 14 Sep 2021 13:21:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC] vPCI: account for hidden devices in modify_bars()
Message-ID: <YUCFxJnDoaVNgHiu@MacBook-Air-de-Roger.local>
References: <6285981f-683f-a043-7025-993613eaea7c@suse.com>
 <YUByvkKO+NlIjB2m@MacBook-Air-de-Roger.local>
 <45e8ef36-3f7a-5cd7-e640-61e1c6d63903@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45e8ef36-3f7a-5cd7-e640-61e1c6d63903@suse.com>
X-ClientProxiedBy: LO4P123CA0307.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 039438ee-abc4-48e1-a8b4-08d97771d5ad
X-MS-TrafficTypeDiagnostic: DM4PR03MB6064:
X-Microsoft-Antispam-PRVS: <DM4PR03MB6064AB6BCC6715D19C9105E98FDA9@DM4PR03MB6064.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 84eR1qz8T78xv6Q8ra0uDUbkiGsLK2m0aYJwBlQnqiF/ywkenMMtYRJEdvBcHeC+3zK1D81sDHisBog076MLEluTWkJmzZMyKoC5n2+49XXMIZMETI3wq8QaETAMDdMf6lJbnbv9IWPafOZ0QazPOwAG3NKGbddM5N1ii2q1dsQgeMxAMAlB1Aho2muq2y8czXkiCd3JezU49dpQ4KH/4qPle9LTURPYxkHa9ti/7mjKBNz7rRKwNkD3oD6Jhq5GQiWIiDXL7mSwznBtsfh6jOKB9KBONpGQA9dBZywsMHlUTAciTNiHi03b1c8JyCjdddEbwOdQiLJEWc4Vr/wRGtmowuqebA6nSetxJ6j/XDjFGsUGM1TjcKCKTXDWGoAC4+BPm7NoBcOFC+a7vyHeblH9W/ieWB1hP6+7I73SrBMTlkjGKC2FiCWKHHL+5TmT+vrXTxasFSP0mKBTtkkHsJBYOyoyVWYAndnkz8kqOAwZ7ll/w4pXM01uYTQgu7FFx/w6u8CXu27FrQEJyJir83ryCo7roEppxQQGTdEV+E/vrvyKtueR4oBoYYD0GAUIOPVyh4/UdK69McZEnc4Qm0ifDTf2uOTR+6bOrfqTTjodw2LemS9UKt+wKB0xs4TrJF+pBqRK0rUL6LyXjYiK3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(83380400001)(6486002)(53546011)(316002)(86362001)(26005)(6916009)(6496006)(8936002)(66476007)(6666004)(186003)(66946007)(478600001)(66556008)(5660300002)(8676002)(4326008)(2906002)(9686003)(85182001)(38100700002)(956004)(15650500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzcyZ3BmTXdKdmdNbTRrWUlXdS9wSnNPWkNTMktWd0tTMGdLcWlsS0l4Z2xH?=
 =?utf-8?B?cDh4QVZma1hYUXFBR0crNWpHbC9aK2lYSFNNRUdCanErZzVwd1R6ZERYd015?=
 =?utf-8?B?Zmk2ZlZnMXg2SUs3U0lRVXBlUFFQSytJNHdMOWlOamlJbTU1cCtZU2tMcm1o?=
 =?utf-8?B?b3l6cHlVcGJYZStGYS83UXdERGgxVEFrcE9oV3FrVnJaSnk0bUdUK0FuOWEv?=
 =?utf-8?B?cVRqZ0RZZkFBOWF2dUNVbGdBWnB0SXYxaUMreTQwSGhGRVhsZGV6MlZVN1ps?=
 =?utf-8?B?emdhYWNRU2lIbi8wZWVpZjNDK045aXpEVTU1UHZXMUFoa2Y4eW5qQnZJVmwv?=
 =?utf-8?B?UHJUOTByMHB2aTRWdWg5MGVuTU5IWFlJWFMwUFVFeTRmd2U0dXV4NHdWTGJH?=
 =?utf-8?B?bWpFVlNwNzNudEN5aWlPZUErcHFjNC9Wd3l0VWd1VWJ6NG9sSWg5NzNua0JM?=
 =?utf-8?B?c3hveDRZdmxURzBacWdvbm05VXpSdEVseTZMSDg5SHBsNktSWU9nN1NJYzFZ?=
 =?utf-8?B?S0RaUVE2eEo5ZENFejhWcjVZNXFEZnlaK3UrdWg2OTUvMnUzRmtTTmFCb0F0?=
 =?utf-8?B?ZTdreGR0MktZRFBLMUZyTGpKMUZKTENtbUxPcWhVWGNCSU43d3UvZzB3dUcx?=
 =?utf-8?B?RGV3NnE0TW4xOVRzajdwM3NzcW05bkJEVC9hdUh0aW83VWpSSWZrUnYzTGZz?=
 =?utf-8?B?a2U3ZzhKNlhEbFJqS1VzdnJpNFFUY0kyRlhRME5NTWhTQlRVRTV1ZlVYc0VL?=
 =?utf-8?B?SXFzWWk4T2F1bUNKa1NhQmN4dkVteGQwN0VZSHBmalZSN0M4aCtZSFdVcFhN?=
 =?utf-8?B?OVVsM25qK1BUZlg0UnE1OFBLZUhDQUppelprbWpVUE92cmo4V3cwZEdzdElX?=
 =?utf-8?B?cEQ3L0xEV0d6QTlpVVRiY2I1Ym1oWGZQdS9keEhGTFVTK0llaFg0ZG9CWDly?=
 =?utf-8?B?eVZrYkkwTldFa213NmIzeGErcnh4TElxcFg4RG4zSXNITlpqN2hJVHluUlA1?=
 =?utf-8?B?NEc4TC8xaWhPU2xWTFJZemtlRi93UFFJSkYwZmphdGhTRHUwNTQ1U0ZTRGRr?=
 =?utf-8?B?TllweWRvYk1KSE13cG12MCt2YlFkOFVjY01RMmF4RGdKUDFtVWJqcGQ0TC9I?=
 =?utf-8?B?RkNmdGtld2JGaVhSZCt5ZTRFamUxWUlBVUt6ZFlqdTVZWGZtYWZ3N3BZdkJM?=
 =?utf-8?B?ZTEwK1FaUExqNjNQQmpISVVTdnMvaTRyQmpIMVYwbDBVc2VLczh3UVdsR1BC?=
 =?utf-8?B?ellZbnRFNkYxdStuSUxnRU4xWk5SdHFkbkdxV0R2eTIzV2FXQi9nVWRXbytS?=
 =?utf-8?B?aS9DZDNDb0ExejdJYTBWYlN3c0tIb0JwdjJ1Z3dTVFptcGFwRjI3MDFjNEg0?=
 =?utf-8?B?M2k4Q2l2ZzNaaUFoWEJxZml0dS8xTElmS2J4Rlg3Q0dGVjJQV0R5SXNpcWZJ?=
 =?utf-8?B?SVc3QXJ1RDlZV2h0ZGtQUnZWeGJKcWdRcElUYmk4MERidEFIZm04c3RJaTZB?=
 =?utf-8?B?SWRMREFZVUdGbWVraXpWT2EwT1dpTlJYVlNlS0w0QVkrb09LWngzV1pyZHpN?=
 =?utf-8?B?bi9mSmFrMGx4dkt1U3B4MDhzSjI0OGY5cEtOVW9vOVBadWQwQnRuUHFMVFVN?=
 =?utf-8?B?YUVCVzcrek9ENUJLbnRCdWJ4NjhQVTZTcktJS2Radnh6YUJyeHZTZGxIVlJk?=
 =?utf-8?B?Sis5N3VLUmpUT2hqZmtmZmFIVGVSREpWekx5VlhIb1NaV2NnSU42cjR1aE5q?=
 =?utf-8?Q?Ou4hRHMv0sb7Z0hHxeRJwG8gwWIEGHrIgwj/suc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 039438ee-abc4-48e1-a8b4-08d97771d5ad
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 11:21:45.1515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbbBfuqJAOoyOfF7UnrWd8d3ihSuCxFkEWUp3C48XSqPzAqYh+pdvQY9EOJxShR1ic1iR78f6qnpZfdQA6VnYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6064
X-OriginatorOrg: citrix.com

On Tue, Sep 14, 2021 at 12:12:12PM +0200, Jan Beulich wrote:
> On 14.09.2021 12:00, Roger Pau Monné wrote:
> > On Mon, Aug 30, 2021 at 03:04:55PM +0200, Jan Beulich wrote:
> >> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
> >> console) are associated with DomXEN, not Dom0. This means that while
> >> looking for overlapping BARs such devices cannot be found on Dom0's
> >> list of devices; DomXEN's list also needs to be scanned.
> > 
> > Thanks for looking into this, I certainly didn't take hidden devices
> > into account for vPCI dom0.
> > 
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> RFC: Patch intentionally mis-formatted, as the necessary re-indentation
> >>      would make the diff difficult to read. At this point I'd merely
> >>      like to gather input towards possible better approaches to solve
> >>      the issue (not the least because quite possibly there are further
> >>      places needing changing).
> > 
> > I have a couple of questions, AFAICT we currently hide the serial
> > console and/or the VGA adapter if it's in use by Xen.
> > 
> > I wonder whether we need to add vPCI handlers for those:
> > setup_one_hwdom_device will attempt to add vPCI handlers to the hidden
> > device because of the temporary override of pdev->domain done in
> > _setup_hwdom_pci_devices, but I think that for hidden devices we
> > shouldn't add vPCI handlers. We should instead block PCI config space
> > access from dom0 to the device so that it doesn't mess with Xen usage.
> 
> The answer to this follows (I think) from the one below.
> 
> > It's also not clear why does Xen want to have those hidden devices
> > partly controlled by dom0, as it would seem to me that dom0 interfering
> > with hidden devices in use by Xen can only lead to trouble.
> 
> Dom0 can't interfere as long as it can only read from the device.
> Restricting accesses to reads is one of the purposes of "hiding"
> (the other is to make it impossible to assign these to a DomU). Not
> allowing Dom0 to read from such devices would lead to wrong PCI
> device discovery - some devices would be missing (which may or may
> not be merely a cosmetic issue). If the missing device is a multi-
> function one at function 0, other devices in the same slot may also
> not be found by Dom0 (depending on whether it looks at non-zero
> function numbers in this case).

Hm, indeed seems possible that missing function 0 the whole device is
skipped.

Maybe we need a special vPCI handling for those devices that just
allows reads but not writes, and that doesn't maps the BARs into dom0
p2m? Or could the BARs potentially be shared between multiple
functions on the same device?

This also makes me wonder why they have to be added to the IOMMU, is
that related to device groups and the fact that Xen is not clever
enough to figure whether devices belong to the same IOMMU group and
thus must be assigned together?

Thanks Roger.

