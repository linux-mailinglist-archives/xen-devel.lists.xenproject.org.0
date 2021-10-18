Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2159431F21
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 16:14:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212338.370187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTOo-0005Vd-CI; Mon, 18 Oct 2021 14:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212338.370187; Mon, 18 Oct 2021 14:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTOo-0005Tb-8c; Mon, 18 Oct 2021 14:13:58 +0000
Received: by outflank-mailman (input) for mailman id 212338;
 Mon, 18 Oct 2021 14:13:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcTOm-0005Bc-Fq
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 14:13:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a00f52b8-301d-11ec-82d8-12813bfff9fa;
 Mon, 18 Oct 2021 14:13:54 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-Cka9Klx-NceJk3UukOrYXw-1; Mon, 18 Oct 2021 16:13:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5599.eurprd04.prod.outlook.com (2603:10a6:803:de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 14:13:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 14:13:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5P194CA0009.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Mon, 18 Oct 2021 14:13:50 +0000
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
X-Inumbo-ID: a00f52b8-301d-11ec-82d8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634566433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v4UBt0tHYIUOZn7Phc8rFXSXuyoOkRsORQ2YoIW36KA=;
	b=PF/AQER/YHmBtVJyRNLpJtjMFu1m6nGdsULX4u5IfzD9u23Hf1iOwLBp9xC6ex6KsHGXxE
	q93OHm0Jr1Lvc6MpGcuYMVbnYtWo5fm63fOIiKbs/M/a2e0SMowMFQKsougW52eq5O1ss2
	3iGPixISBxcFGowf7PAy7vt2O1BVbcM=
X-MC-Unique: Cka9Klx-NceJk3UukOrYXw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSV10rQIS44so6poFafC3eu1kgOaqgZ7nLOwl9FeiNRRaNyRkqS0p2sIW98jrL2ffOZ5Gs0lcIP3iXSAR6lQUv5AdKZaZACSZDwpp96TrSONhz6qJz1bHi4G9yvUMbOCUmnDyP1g+qMR4R3tvHqKnwu66hhxGF/2RUxUM3jArszXTUbvEtvIotKTx6g0TAMoKPkqbc4p2v3a1oZUSfL9v7UuOPdRv+4DOYKKQ60pCH4N13QyHJa3bckg3vEKYt3nfXzO84tTJJp1mdsDU0seg0IyOOY1etPBnxaEUPpbzFPum7B/oPCsMEO1WfedqRVqzZQGSutfIi13KzBWFBEbpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OrEeaixkF0Y9PlxWXxua5NQ52g/p32JvW5cL3gsTB0=;
 b=LEClWOSlZ3Y9km81RjiesPeaKQSNW7GA3P4lEV4I11FgCgA14UBKbg5NkpEVGsW7O1O6qTvZz9lJaBqRO3QO7r5rypr+tsXUdlJLK8Z4bwL2+EB5Apucp9N2xoBnIaNj8v0ztplJrZxG3/geCxfa3+xJyvA2gUWlzQLuTvABTIx0bZd8imzO54oAeqCGy7AR3+e6I3mHa9sEEj2yZlSUPyhv7uxh9JjAQnlMyVieNQRMfbgueJdWLGf0ERrQuNIKVij4X7knt+WZJY5W9H4bMV+C2pgeQNSIg7YGYubi1q4lghiI7lW2PmBKvY4V+4DcgzCnJEmAFU7lLxyCqHa1Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] x86/paging: restrict physical address width reported to
 guests
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <e0acfa40-0901-2fc9-31b6-c2609625de22@suse.com>
 <YW16sQI1WmegDkwN@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <62aa184b-d712-76f3-b6fe-fdda164c3442@suse.com>
Date: Mon, 18 Oct 2021 16:13:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YW16sQI1WmegDkwN@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5P194CA0009.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 981d1206-51ef-4dcc-7db3-08d99241823d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5599:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB55991B127D2DEFAB2DBB556FB3BC9@VI1PR04MB5599.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PHhTugAfG1Szy4Q44nLnw9GnrTSDHjh0NFYLYm/Yd6hKcYAHhEPc0wL+8f7w1CjTkpFrVHbUwqneR70lssIWcKkb2Lk0tsJzHXw6FOKgwK36Ed6IWWf/yblwhqJDAz966A7LVqCcnDYgUjlt0COBeC6G+uqq1Vkbuu6qsyLraFno4L49yxE9V+gdBtBfQI2Moxoa7WN2Flyp3gMqp/AbHml/rMo6fYlG0gaaC3ydXpXBnbs1y4ujXtYPhSvQZo2RGWwo0pOcrna5kbWIpucJ92HsYb26IsOhRyD6bZX4R7vHj3/MvsAM078oAVPO/qc1dpJFH7+skd708pvDZhR4SNs5ECHWfnASFwUXmcp4smX3kisxCJDTIGXqqz/2Ks1lztLUBjdnybmCX2ZvOoJLdEpGCC53PT3I3+R+pT5erFAlf9TETgd+hffrW+MUw/I9uvrA7qJyxfop8BXa5NuI9oqcGW9c71EzvcaOAjGT92nJwRnmXbSTOHgXUbLZ/ZzMZ/tCsu7DGh1WvBi1pzD/gRspXrT1Os3XKuJRCvj55ErI+3dSRzC1w7sNP5WtOU2U+Fi0sGJR+bSqcIPrHuIZ0PgNK0zY/PeMl9DtXelNcT91oWTjz1QDt6ddYl/rPk26X0U/aXjAhwR14YWaFS2z5A9neAojbA3DiZC+e09pT9Re4CDhL7+/7a7OLaeYqbDGyddRu7NR9xOvJYdjYLWjRWibVTKFR9zNaO79Vd2sFZrRGJY7zjWXB9Sfc4ulRpto
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(38100700002)(6486002)(8936002)(31696002)(5660300002)(86362001)(16576012)(26005)(186003)(66476007)(66946007)(66556008)(54906003)(31686004)(2906002)(316002)(36756003)(2616005)(956004)(8676002)(4326008)(6916009)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tMFLUaDPh8MgnNZpbJa0HKKng19KK2QAoN0dyxjsDH4ElmNRWoZQqZX9QObY?=
 =?us-ascii?Q?ivzMj44JY2NNR/57VeYarqmLUkx7N5y9oixsvtF8X+s7fTHz/x9hDGf3zu47?=
 =?us-ascii?Q?gZy1xE4Ls9jVuNhRka/RjkY/MPK8u57Wbg9Jgrhc3NmCsMgF3pS89u0uo+2m?=
 =?us-ascii?Q?HwsY6GCu5mKwWmRwOSNzjtjLONZRTeD1qCG+8g3Tm4BxsWDIR/aogZBDODhc?=
 =?us-ascii?Q?KoZjfSvjXRb+O7D3i3w9gq5zTI2uXkv0sz1mcwX5HnTiT93PCgSOUhZY0iaR?=
 =?us-ascii?Q?j2cqGAuSQABwEmTPzrlsGhVGJSk9tsTQD2ktR827narEhKvv8b9+bzgwDNFH?=
 =?us-ascii?Q?4E3c5f0CMw0+3o7FYtgTnGqbd4nPyUa/pznrN2mYNzKEtU95yfNEbWV21K76?=
 =?us-ascii?Q?YElOLWLGZ6pmFBnt8GvLvck9sHmXpKH3Zv9ScJ7hUYTGyS+UWfUVgwM1tF9p?=
 =?us-ascii?Q?UXVO74WmmrOXKMPUtBe8Bp8mn5RfrKFugegVUJJPPrrBwVIIPjr7/kh4DFo2?=
 =?us-ascii?Q?V6gS67ARcntqUlnCOTxhHpS5iM0wgBQr0L9MTkqwQLyOx4K6t/n46zhez5bB?=
 =?us-ascii?Q?o7zSVSiyvO+9OvFivaNY4tNiHfDwjZJZb5QrBiQjRiKY7iqJ1eypfVM5gK3o?=
 =?us-ascii?Q?Gsx+KxQ032xVmWZKaHZLKCR6Ht+z899mZ4/R1ZotCVHPMEaSdh0jSm4AUHi1?=
 =?us-ascii?Q?qRjcSgtjLhIaitoxEygm7SLQ6URJB04s5ZItVRXjBGIP48rypfnFFgdlXKuq?=
 =?us-ascii?Q?z0hv17xoyn2MTJYJWdyPtVfjkS0TrAkAmC2Agv+1HZjqPAf8FGRhNxqvQXJg?=
 =?us-ascii?Q?s8xT6t8X7RkY0bbjb3coxF5/sc3CIReyuqJ6ID+JU1x4J2xZg4rkED1necff?=
 =?us-ascii?Q?gX+ZZGrL2853axhCxMfOBZlFKTJ3sWmpeyH5ALbdp/2oMPmWmlZTxfnV2QgA?=
 =?us-ascii?Q?/AufxGFVbgxeCb7BEL9Nutwwn1ldtaeSyz6hEniqNjU3xCKvspB3gaQ8VXlu?=
 =?us-ascii?Q?+kRZht1uuNXSLNRVKx4BFNFhGMyoMr7okAypxoeegDj61qgVVvQlpSrf5B5d?=
 =?us-ascii?Q?4VrelN/U89bthGF8SLWbHLhtnoyN8B6DZmlFKerJeoK4zSlgTcxV6KCggcYB?=
 =?us-ascii?Q?2zUstmTi6aEa8YdiJjkEo7xX6Df3UDSMG7TYWBCX/ypdVQpNbL+ytGeI1avq?=
 =?us-ascii?Q?QwZhcZvVvLgLeR0KbY3C/hxXGRuy148ZvjLshdx7sYu9YVIwa5H6iN+5rgqE?=
 =?us-ascii?Q?tucAYNKK4Hq1so9wMIIDzax5gIUpElOtbZymnx4SGKtARQTif09kTy6m3arK?=
 =?us-ascii?Q?FnW/KgHdxeEV2Pemz950JEk3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981d1206-51ef-4dcc-7db3-08d99241823d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 14:13:50.6352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBJLRtAYbIUUIK/FAf8DwrWSVfXqHl0nBO5P2QlarulE662EdFYbKc4fmR9cPa6Nk89FIlPPzTyVEaIc7RbpMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5599

On 18.10.2021 15:46, Roger Pau Monn=C3=A9 wrote:
> On Wed, Sep 29, 2021 at 02:47:49PM +0200, Jan Beulich wrote:
>> Modern hardware may report more than 48 bits of physical address width.
>> For paging-external guests our P2M implementation does not cope with
>> larger values. Telling the guest of more available bits means misleading
>> it into perhaps trying to actually put some page there (like was e.g.
>> intermediately done in OVMF for the shared info page).
>>
>> While there also convert the PV check to a paging-external one (which in
>> our current code base are synonyms of one another anyway).
>>
>> Fixes: 5dbd60e16a1f ("x86/shadow: Correct guest behaviour when creating =
PTEs above maxphysaddr")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> --- a/xen/include/asm-x86/paging.h
>> +++ b/xen/include/asm-x86/paging.h
>> @@ -401,11 +401,18 @@ static always_inline unsigned int paging
>>  {
>>      unsigned int bits =3D paging_mode_hap(d) ? hap_paddr_bits : paddr_b=
its;
>> =20
>> -    if ( !IS_ENABLED(CONFIG_BIGMEM) && paging_mode_shadow(d) &&
>> -         !is_pv_domain(d) )
>> +    if ( paging_mode_external(d) )
>>      {
>> -        /* Shadowed superpages store GFNs in 32-bit page_info fields. *=
/
>> -        bits =3D min(bits, 32U + PAGE_SHIFT);
>> +        if ( !IS_ENABLED(CONFIG_BIGMEM) && paging_mode_shadow(d) )
>> +        {
>> +            /* Shadowed superpages store GFNs in 32-bit page_info field=
s. */
>> +            bits =3D min(bits, 32U + PAGE_SHIFT);
>> +        }
>> +        else
>> +        {
>> +            /* Both p2m-ept and p2m-pt only support 4-level page tables=
. */
>> +            bits =3D min(bits, 48U);
>=20
> It would be nice if there was a way to not have to manually change the
> values here if we ever support 5-level page tables for example, but I
> don't know of any way.

Well, I have a vague plan, along the lines of "IOMMU: have vendor
code announce supported page sizes": Once the value isn't constant
anymore, vendor code needs to supply it.

Jan


