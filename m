Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 960283BE8A5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 15:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152216.281230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17Np-0005f1-G3; Wed, 07 Jul 2021 13:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152216.281230; Wed, 07 Jul 2021 13:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17Np-0005bu-BN; Wed, 07 Jul 2021 13:14:33 +0000
Received: by outflank-mailman (input) for mailman id 152216;
 Wed, 07 Jul 2021 13:14:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m17No-0005bo-CC
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 13:14:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43a5e0ee-df25-11eb-84f3-12813bfff9fa;
 Wed, 07 Jul 2021 13:14:31 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-Dqg1EKf0OzWj9vBSIX4jpg-1;
 Wed, 07 Jul 2021 15:14:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 13:14:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 13:14:24 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0267.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 13:14:23 +0000
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
X-Inumbo-ID: 43a5e0ee-df25-11eb-84f3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625663670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=65JL41WTVgv4+rHK0UnlBXiPMK5sbKJAZAsMq5ZAbpA=;
	b=bUTNpU6CiODCOrPtSr63yBM9kpJ1a+BKBSyLoYjxJbDbLjtsFN2Whb80QhJBKboZ0WpV6Z
	aEKjmu92Xd8iSadKmmPzzHTnOlGo1yfQN65luPu/QYiK1Y5BxcwvXxmsbyIiMhhR7BNjGP
	0wfJ5sDfqx3f8j1Wf4JkIfNbmwq3Qvo=
X-MC-Unique: Dqg1EKf0OzWj9vBSIX4jpg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cc7DH7KPQXjd+56fbX+kPA2e6WtNWzDMbqXJ7iOF9d0aZ5rAGnCskpmkjXh3Sm7/rcqcrT37cyYfnA1x48yGpBqlcdwS2u2iAl1mVxTJf4BV0O6H2gpwQ1wJM5YbjIgjJzgW6iy7q28tdrzK9Rhcp+RRzR2sG3PEEmZjIyJraVOnhgZ0VAH76M+TNXoXDWuu29rpcX3elAin1NRhKhrJbZ+BRQY48NWnhU8riO/qOnQluVlcMWirJX3Z3SjirkpM1pUM57Mu2hW2MNHoVFrwggIyFzk9GvmGh0Gt1JMvIpHdR1NY4u+xPnGvm0L/MHX8JChgqOiJPG1pD4B1Aoo0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65JL41WTVgv4+rHK0UnlBXiPMK5sbKJAZAsMq5ZAbpA=;
 b=kip8yTxEafAaufvhECo9amLXjlr98ndVXu+Z3Xa0jmsl6PAuZHbiCeOJBVOZrcQG6MVJtA116HxEJ+gWwWDtg2bmT1MIZBLd+9qyf4M7/bttn/1r+MaR6QoC16DEuQ7B7aj6VZoMvM37p4qabF89y2kvyt3tLNyiEQHvvl4QxV0Ri2AnbyltHhJh7GPjSxoRtQXd1xJlIoYaB5Bp5KRwdIvYmfVhdyy5SbPfs3qOSGjWsv80M3/THntnS1cuVIYY2XZMWdrE40+GAzCgg9GMpCi2MTKnd0xwJAXpzQ1E3O6QMp6k6y96cGGBW0rXkS3Ovt574CK4OyPKItbFeiH97Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] tools/libxc: use uint32_t for pirq in
 xc_domain_irq_permission
To: Julien Grall <julien@xen.org>
Cc: iwj@xenproject.org, wl@xen.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, sstabellini@kernel.org, jgross@suse.com,
 christian.lindig@citrix.com, dave@recoil.org,
 xen-devel@lists.xenproject.org, Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1625619764-23537-1-git-send-email-igor.druzhinin@citrix.com>
 <b1720313-d636-9c8c-3109-748dbe311187@xen.org>
 <5e454ba6-3d3f-9402-140d-f576f9124402@suse.com>
 <927c1c59-734a-4013-9286-137fd7026c26@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e2def3e5-8e00-8b52-2d0f-5231963607ee@suse.com>
Date: Wed, 7 Jul 2021 15:14:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <927c1c59-734a-4013-9286-137fd7026c26@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0267.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e8973ad-e299-49ee-b240-08d94149243a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB516512C8B674C2CA1E825A83B31A9@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tAQkFyYLqfSqhvG0l+aNI5umxyditUg4eF5SuHUZU1p/QAAnKM4FxJiDKwAKb/zrO1IG91pKaIBAQGHRrMdpZzIejdF6E1QQbjd1ecIuY54Pit4pRXzMWimTlhTdfmsEu1x6EzOg8lArijAEOJ6I/gRFWn6kBxf6gpnqHCOYUEyMjMIKw9vnO6wgdZ3gu1MLhZboAoLq65E7P+LI/0EWsaRSssytQbjbNlxw68sQLvv03Sw8pvupXJEnTY7/V+UgnFzz1JETvCKmHW1sS14w4bb71xNuKuJx21cYL2hR9ChiMzFHuk3jRNWU26UsgxgHk9enQeFSHK3FIZGjYl3ONuH650QxOT1x/LmUPzCjJmQ4rt1MsUSggtCGwKx8DmWFUgckHyJyk48KQIn/9Xt5k3YuQnHTzNZe0R52tCLSdJ5rbmRtuDITUr7h4xFXlGpyUXaDaLRsK5k/SCBJ2b3gVPq4RH5zTC4QYnorCWoYEKOTRs/3d+WFnuCZQcmSC4I3qBfI4p1Kt4nTbIhs/n0al042C3y7+N62X43d0iF/CJngVwpSlKyq2qsHpvvepUp9Z7Fk1LfF5uvkHtrb6ZWLHL2xfavbrWY+vLynI3L5pCN4pBXeEhoWx2z1GT1JpDPN3USNxt2vsNALHlN75BIHod8R/W0+Xfv1/9TXcIWdRh796ZByO/fT4Gki8yk3bpQUod0SbeU98oCitruyzKGRUfQ13/C9A9j54d6vlXo6SIxWCiCJxbjtY8wKtVbJD/aA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(366004)(376002)(396003)(39860400002)(4326008)(31686004)(2906002)(38100700002)(83380400001)(31696002)(86362001)(5660300002)(53546011)(36756003)(66476007)(7416002)(6916009)(956004)(2616005)(16576012)(8936002)(186003)(26005)(478600001)(66556008)(66946007)(316002)(6486002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWRSb2Mrd2ZiNEdDK1FTVSsrOG5GUDVnQ3JmRUZOZ2VwZXgyMUZMRExla005?=
 =?utf-8?B?eEpCSGhkakxIVzJZWmFDUW9PUU9ZU0tvR1NKdDlkeUJaTGxGYVR2OHdxcVZJ?=
 =?utf-8?B?NUc0amtSRGJGamNJdC9jQ2hjeE1UTzl1Y241UDBNbUZweHlBblRRQk9TTnBR?=
 =?utf-8?B?ai9FTmVLTGcvZlg4V3JWayt2bGprY0xOY1lLcjg2RUdEK1VHLzkwVWIzZDhv?=
 =?utf-8?B?bUNjNzF1K1NFazFxMlliRU5BekJNelNGSDBwekt4b3JYSjB1U1ZkNVdIMldN?=
 =?utf-8?B?STJFeWJuNk15R0U0c2R1WXpzYWpFRGtiMWt4K3E5S0o4OE9mY211ZWhQMlBh?=
 =?utf-8?B?WXh6ZlJXL3lYZERyYXE0dSsvOGxqdDlYc3BiNlJTb1kwbWNDd1FhUkc1RjBW?=
 =?utf-8?B?N3RaNldTRC9vYzZUZ0cyNkk3RXpiWTN2RTJMaGhqZWltZTVRZGQyb1Y1MC9O?=
 =?utf-8?B?QURGZGhJVlRXUzlETk00V3h6YnFWc1UrZzJaNXdIbkFBYTRkbFo2NHFHaG5k?=
 =?utf-8?B?UlNFRXNWRnlqcWp1NGJiRTZ4T2hLQ1BEWHg1dzRDd0p6S2F2eUlHdFArUDZy?=
 =?utf-8?B?T2IwbWFNTk41bEJBOHJxQlRta3ZEd1czOVEwMTg5MnE3ZzJ2VXZkVi91bXNH?=
 =?utf-8?B?NWxpSEdySnFMaWlFUGJEN2JMc3R0N0N5azE5Wi9IWmpDUTJ3ZDNyZXA0QTlD?=
 =?utf-8?B?Rk1tbDlkSjJVUGYySG0yTzkyZTkvWHNDeDllOGs2MUZZdlQwMVVyQ2N4NlNq?=
 =?utf-8?B?M1F2UXVDMUdMRXJZMnd3aFlzeVQ1SEVYRC9VMFZKKzFucXIxaGZ3UGZPZTU0?=
 =?utf-8?B?eGhzdmNmZ2dwc2lwV3Fkd2JOdmNZMGMyNXdSZkNMWDViNEU2dHgwckFtYWlz?=
 =?utf-8?B?NVlPU2VRSlNoM04rR09VT3lyNE9pOTlqY2hwNDdxZitxUTBKM0E4WmZmcWNv?=
 =?utf-8?B?RHFOd3cvVk5GMEFnVDVDREtKUUtKUS9DUDhnU3lpUlA5M21FVkRTS2lDa1Zz?=
 =?utf-8?B?Zis2UGZyVDcranRrR0xCODk0UVpTV01Hd2tYNDZGckZDYkxEZCs1TlZMOXA5?=
 =?utf-8?B?NmlBdU81VzRNOW9PaEtvTTkxRmR6YmhxUEpGQ2MrL3RPRklLbjBwK0tiSDZT?=
 =?utf-8?B?OWM4VUxzamlvYnF3S3ZTb2V2RktLN2FFa08raWRCY2FSQ0Q0Tm9yVG44WWE4?=
 =?utf-8?B?VHlIaVdqYm1kVWtqYzVhc2R4VzNBOE9Sdk10QnplTkpaRFBvVjh4c3lVcm1Y?=
 =?utf-8?B?a0tzeHdpYXQ3ZkVYcis0R0VTYS9jQUUzWVB4anBPc3AyRmR4RXhnKy9zV0Fr?=
 =?utf-8?B?K2Y2NTlTZVpaOWQzSm1FaWVQVHRtOXkyK2lyQTZITGZ1Q01ndkZaKzhrRzhs?=
 =?utf-8?B?cUFyTDV2Nktub0lYSHBIVURQTHozRnoybmZkVUNyN0VvYXRDczBZZVVIWk40?=
 =?utf-8?B?bUxtVmhheFJoMHFOcUNwbEJiRTZvVnRyd1B1MWlXb3FUR0FFM1Jvb1RGaDhq?=
 =?utf-8?B?Qjd1V05ZNXd4M1MyeXZwQXdONWd4SFAvMDNWdjdBcGlMbi93TThkUnNPaVBL?=
 =?utf-8?B?MGNGb3BhMXcwQUVsUzlJbEl6azhaZkZsT1IzTWFiWkU1NHh5RWhsdFdVRGR5?=
 =?utf-8?B?dmoyZEN3UUxoSTUwZWtKYWl6Ym1yQ01rRExrMlVjUXVEVG5LSE14aGFEN1FM?=
 =?utf-8?B?ZHBvdHdQNXNKa2I2Q20vWGtkN2l5bkhHSHNDTldRRlM3dkNKcUtBNk5pbGZP?=
 =?utf-8?Q?2+Gu0yf2J/p+1oPP9F7Y1MyVBpzpkgdI+YaQwQ5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8973ad-e299-49ee-b240-08d94149243a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 13:14:24.7639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlUBhiEjHqnRjth5DOHJtGGxPgv7ItKSKu9wGrHUsCp0ji2lsjEfHJtxyeQjejDOcDc0OJcGC3jKje85j1BaYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

On 07.07.2021 14:59, Julien Grall wrote:
> On 07/07/2021 13:54, Jan Beulich wrote:
>> On 07.07.2021 14:51, Julien Grall wrote:
>>> On 07/07/2021 02:02, Igor Druzhinin wrote:
>>>> Current unit8_t for pirq argument in this interface is too restrictive
>>>> causing failures on modern hardware with lots of GSIs. That extends down to
>>>> XEN_DOMCTL_irq_permission ABI structure where it needs to be fixed up
>>>> as well. Internal Xen structures appear to be fine. Existing users of
>>>> the interface in tree (libxl, ocaml and python bindings) are already using
>>>> int for pirq representation that should be wide enough.
>>>
>>> By "int", I am assuming you imply "signed int", is that correct?
>>>
>>> If so, should the function xc_domain_irq_permission() interface take an
>>> int in parameter and check it is not negative?
>>
>> Please let's not make things worse than they are, the more that
> 
> Well, what I am trying to prevent is surprise where the caller 
> mistakenly pass a negative value that will be interpreted as a positive 
> value...

This happens all the time when converting from signed to unsigned
perhaps just internally.

> Such issues are beyong annoying to debug...

No worse than any other out-of-bounds value, I would say.

>  > ./CODING_STYLE is unambiguous in cases like this one.
> 
> Hmmm... The coding style mention the fixed size but nothing about the 
> signedness of the type...

Oh, sorry, yes. The adjustment for this even pre-dates the two
patches to ./CODING_STYLE that I've on record as pending for
nearly two years.

> The alternative suggestion is to keep a unsigned type but check the bit 
> 31 is not set.

Why? Why not bit 30 or bit 27? There's nothing special about
bit 31 in an unsigned number. You'll get an error from the
underlying hypercall for any out of bounds values, not just
ones with bit 31, 30, or 27 set.

Jan


