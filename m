Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 506C4415B50
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 11:48:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193569.344786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTLJh-0005er-FD; Thu, 23 Sep 2021 09:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193569.344786; Thu, 23 Sep 2021 09:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTLJh-0005cg-Bg; Thu, 23 Sep 2021 09:46:57 +0000
Received: by outflank-mailman (input) for mailman id 193569;
 Thu, 23 Sep 2021 09:46:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTLJf-0005ca-FI
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 09:46:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e89faff-1c53-11ec-ba25-12813bfff9fa;
 Thu, 23 Sep 2021 09:46:54 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-2-XS5A3k-FPDOfb-LrZXSeMA-1; Thu, 23 Sep 2021 11:46:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6175.eurprd04.prod.outlook.com (2603:10a6:803:fb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 09:46:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Thu, 23 Sep 2021
 09:46:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0022.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 09:46:49 +0000
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
X-Inumbo-ID: 2e89faff-1c53-11ec-ba25-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632390413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sehrv+WIrqmEJeJg6YrVAHVxuo1aqIIyqYLvE9GL9fg=;
	b=dGy7BT7jmIh4WJmQecA2f533BcNYGVODu6bg4oepCmvG2fQYQs9GaQORxp2k8EQFB9uyer
	BFT7NM51Br8iyl2GXHJYtwlKdAUcx6IpnmKV1hAyJBM4dfS3e59yzVb5rgqHK/pN4d7uPa
	pU9RJPLilT5vEggYNkCbGkSzZdxy+4I=
X-MC-Unique: XS5A3k-FPDOfb-LrZXSeMA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAzO+oXXOQ9LXQoBGOk8swCCYH4E1FsnK/FNmiYlhtjcSfnMCiuZcUvnUkfNEewud1A1maqNKcmzsQG0Wa/83Gyutuk1rZ+6pKDFCti5CRU2b5eYWU+FH442SKVEfUnZjSY/W1cjrMBVa3l6+hZZ4pVGVeTkGOk3iit+21bWWfMeFtx8hLWFyrx9Fg5vYLJFkJ00uK47yk3JwB5P5CLb73rDLxHGMwijt9dC1PDM+CDTeKTBJe3/r6Gd8Rw07XDR0sluHiaDxm9oE4PYIfq2XD8u0GK/iWjKeFvhowqCgvQ2VDSL6sBgWAPRHVWood/uwHiM6y7ju3yl4yh9ciE6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=D8xb1ivZ1MN5iPoVGL2oFTZn7e65u64/qlhkhMvCkoQ=;
 b=LvjKarFPDh2Kz3atfL6dRBTfOANLWjmlHW2gluwpCt0waqcs8QFQ3FUT97JdWdH0AfLXnXd9RQCEquHZAUqDc9yZ93lvfzcMfLvUE1UGmpNo2ISB3l0EhpZjAMBONrE/c7BmDs5iuP5LOfEWnFcHnrJ+PxV0ekVC1EEyOZRZhogkb6WB9qDaJUWk64hn7x1y4wlcYbuTJWc1A3GWLLP/0BjeLfHoBrckK8DpAMQkWl010d3mEWjEqx86w5COlRWva4UrdZL+/o3JPjB+G1NBT5mJoFTBszUlSzzG97IsP2ZBXLkYUI3+TQNHXbXU/O+J0Ct0wtv5Rt713JU0S3KMNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 4/9] x86/PVH: provide VGA console info to Dom0
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <215e2ea4-cb49-7d94-7f97-c6b81e522a60@suse.com>
 <YUtFLB+n2piR+cHe@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <86c22215-923f-e8ce-e0a9-c76d90da4d77@suse.com>
Date: Thu, 23 Sep 2021 11:46:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUtFLB+n2piR+cHe@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P193CA0022.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84545998-79b7-4147-eb7a-08d97e771108
X-MS-TrafficTypeDiagnostic: VI1PR04MB6175:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6175982FF2F45C73F3B8E475B3A39@VI1PR04MB6175.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2n9agiQ+0RH3T77DFUl2tQJ6sY0n7p9OqwKjro/O2qa7ekKL5U5E8u5TDbIOMjvX4yOMjiza1jrOqZgmtkVAlUvB4+AmIpDe0pgqVJPIaat8ww4OyjMLfWWHlzZybRcvVfj2S0WFzIGtQH518871Rq3bXzjNuQwVhkFAlVApfq0/0/oodl3U/ajq1wNcjPHGrrWWaJyuo6L3C9nLNgCbSEDemx3YCoFv3u3+D02j6klcERvjNPthLbxuVm25jgyNJ0RbjOQGGhAY2pjey+XLo4NvCWKXKH3j8x2SHo0bpyEIWbo/SqPL2O1HHEpCRI5gDKwxn1uOfqLAOBq3wtcxpJ+aKtVcOKWFrohwtILplq0jgM8bk6tU0mdaBg5zGt9drq5ceqPiihIKo7BopKGkfXg3s1MtDjRQgVQoPxSTngndUOLN92ALcL87kinjaLYzvN6AxFbgLyJlR622esfFFbtP6Vh3LyEOtu/3w7PAs/3hg0PjqwzJTzVSWDWEVC2COGaiGX65Wcuun7NC4sD7R5fZmbILfr4BARACtcCqxEDqa0FLwGl6ygWGFlKItyj2mLPivvOtX46DSYmQ+c0OXyvqOntsHbyAcwcQdrdHZSMgsfTlC4TgBlt0owHq2IMxrujrG91VXSiAb5r0SdBA8ertGCkq3o3mevPUGFsy3VqJFuJGVeLQON7OhVuQqwu5yAggkmodr3NIa62cBWpo0iX/rU6lx8CRstJtwO4W6h9Q6r42Ge8eu0/+L35t2FqDP3Y94K5Qmea+QNWo2eeIyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(316002)(31696002)(16576012)(54906003)(66946007)(53546011)(5660300002)(8936002)(6486002)(66476007)(66556008)(2616005)(83380400001)(956004)(186003)(8676002)(26005)(4326008)(508600001)(38100700002)(31686004)(2906002)(36756003)(6916009)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rKzcgy4yHd5xugXB5Ers8uhnykkZ4de51ecziV6fs5SsjbDkdYrbPBVtC8fy?=
 =?us-ascii?Q?pU/zXgciRcDxIHqU3SWIjo4ykQDuzPYLT5IZiAgaIbJ2aT/fNiLH9Q0lscga?=
 =?us-ascii?Q?p0pGZIgIg/wMF72nphov+SomIVOzbYlZm/O8OioNhS/GjbYBBVgeePLRThfq?=
 =?us-ascii?Q?O4c837Zuxf5GzyLwHxdVr/ti9MIOKPTeV58Q/z7uSvZ0k9v3UlF3YDOTXwH6?=
 =?us-ascii?Q?NfY85vftD/xHl9tiGsuuEQpnPusz85lbKBJ8eSFzVCibPdXssXU1oO5oV3WS?=
 =?us-ascii?Q?8/pF06SiFSg58d8lPyhwuhhu8ZC667kuY1OgDyEVytWMYceOz+JDSfLvK12P?=
 =?us-ascii?Q?8tW+e/+XsF38LWt10ZpHBQpPWGsTHFhCCHYJFtLQj6nDHXTr8Klp/YcB9AoV?=
 =?us-ascii?Q?0Rl9xXvjdUwc51rf67rxvSI4FroGUtFdVvSijHrytJZThZAO37t91aIcTeJH?=
 =?us-ascii?Q?43sIDm/hRLttANpxYcIXBz8DWJeHTR1JmfAIF2OCk6mh76g77xRVTv1H9LrJ?=
 =?us-ascii?Q?6Cc0HyvR/RH5Q4SmiLsa5UNgUTOreRUA3zszTY1noZcbqZVqyENNYWRuohbH?=
 =?us-ascii?Q?tAlZazfGIJG7rObFplxrkyufzdXeDEyv2wKGRkqkVTVVcxSOXlxNMdSS34+B?=
 =?us-ascii?Q?31b61AST0n8YSjAukihsNE2dWbeQusC1P4fwHsE+nvpTkDAbuMogXEZk+ud3?=
 =?us-ascii?Q?RpOzKu9MUYtYp+QygKH9Xy4TKCRJBNwLX068qrngv5LkA6De5gJofh16N9MC?=
 =?us-ascii?Q?KjDahE1fYGZY6Az3MlY6TU0XYU4dTp6Yd70OKk4ST+Pnd2ie6oXOzFJt3cM7?=
 =?us-ascii?Q?rQxUHgHn4u7vwSldZ6TFXifkQnVxy8hsIgOajvv/OCgoTXrqatQ10QWTeWFD?=
 =?us-ascii?Q?+fUh7XxzGvJ98W4D7bePW0DV6SrFxuypWJjHHEjHE2LVl4yxesoUAvtG+aDv?=
 =?us-ascii?Q?HTlxMWQIvqa24f/SFRSv6rwjj3rW2RLssGgWY5QXaCxCsQ6vyI904qJkw1v7?=
 =?us-ascii?Q?AD+Vy7Jxaj4zXTQu6xzwzCZ0JoDvN2SffRaHj3wgSd72b1rNYrU7zwMVDeBA?=
 =?us-ascii?Q?6ual/yqMDWjK9DcfS45BsfK/OHnTl3++OTNgm947KPpUVCqbO1rcQggM0qbM?=
 =?us-ascii?Q?vyIQKgkrUW5tY/dfijmBD6D8ZMvNhd2ginR6kbh3QEDOs8IZV9Z4+im/bz8l?=
 =?us-ascii?Q?uQaEGWwK2DqMMNpVZCPZtX0Jpg+DSiGzBVPZzEEkipN5u/ZWA4CJao/x6slk?=
 =?us-ascii?Q?JcokVfmIid9l84uO7Zj/GSYPdnA2YQI+ZHB1qyH5JD3XKf+e/3cHj7J2PCss?=
 =?us-ascii?Q?Hm4D7eRkW7/KJXVPKkIQASmG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84545998-79b7-4147-eb7a-08d97e771108
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 09:46:50.2760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAsk70rnPA9f73GHBdEbeJRkamWmpZ5RqaT8Lh3aqIVNy7oWE/3FatCzRk1Q005NxYzjk0FiXI5peaLPJXyjFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6175

On 22.09.2021 17:01, Roger Pau Monn=C3=A9 wrote:
> On Tue, Sep 21, 2021 at 09:18:05AM +0200, Jan Beulich wrote:
>> --- a/xen/include/public/arch-x86/hvm/start_info.h
>> +++ b/xen/include/public/arch-x86/hvm/start_info.h
>> @@ -33,7 +33,7 @@
>>   *    | magic          | Contains the magic value XEN_HVM_START_MAGIC_V=
ALUE
>>   *    |                | ("xEn3" with the 0x80 bit of the "E" set).
>>   *  4 +----------------+
>> - *    | version        | Version of this structure. Current version is =
1. New
>> + *    | version        | Version of this structure. Current version is =
2. New
>>   *    |                | versions are guaranteed to be backwards-compat=
ible.
>>   *  8 +----------------+
>>   *    | flags          | SIF_xxx flags.
>> @@ -55,7 +55,15 @@
>>   *    |                | if there is no memory map being provided. Only
>>   *    |                | present in version 1 and newer of the structur=
e.
>>   * 52 +----------------+
>> - *    | reserved       | Version 1 and newer only.
>> + *    | vga_info.offset| Offset of struct dom0_vga_console_info from ba=
se of
>=20
> I'm not sure we are supposed to reference external structures like
> that. We took a lot of care to not depend on other headers, and to
> make this as agnostic as possible (IIRC KVM is also capable of using
> the PVH entry point natively, and hence depends on this header).

But KVM wouldn't be using a Dom0-only part of the interface, would
it? (I'm aware of the possible re-using of the entry point.)

> IF we want to add support for dom0_vga_console_info I think we need to
> at least provide a binary layout for it, like all the other pieces
> that are part of the HVM start info.

Which then means we can't sensibly re-use the existing structure,
as that doesn't have as strict rules as the hvm_start_info one.
Which in turn means Linux can't re-use the code converting
dom0_vga_console_info, resulting in two places needing updating
whenever information gets add to (then) both structures (what
information they carry will, after all, want to remain in sync).

>> + *    |                | struct hvm_start_info. Optional and only prese=
nt in
>> + *    |                | version 2 and newer of the structure when
>> + *    |                | SIF_INITDOMAIN is set; zero if absent.
>=20
> We have usually used an absolute physical address to reference other
> data, and I think we should likely keep in that way for coherency.

Hmm. (See below.)

>> + * 54 +----------------+
>> + *    | vga_info.size  | Size of present parts of struct dom0_vga_conso=
le_info.
>> + *    |                | Optional and only present in version 2 and new=
er of
>> + *    |                | the structure when SIF_INITDOMAIN is set; zero=
 if
>> + *    |                | absent.
>>   * 56 +----------------+
>>   *
>>   * The layout of each entry in the module structure is the following:
>> @@ -139,7 +147,15 @@ struct hvm_start_info {
>>      uint32_t memmap_entries;    /* Number of entries in the memmap tabl=
e.    */
>>                                  /* Value will be zero if there is no me=
mory  */
>>                                  /* map being provided.                 =
      */
>> -    uint32_t reserved;          /* Must be zero.                       =
      */
>=20
> This 'Must be zero' comment troubles me a bit, I'm not convinced we
> can just place data here (ie: it would no longer be 0). It's even
> worse because the must be zero comment is only present in the C
> representation of the struct, the layout above just denotes the field
> is reserved (which would imply it's fine to use for other means in
> v2).

I thought the textual description was meant to be the ABI spec. The C
comment should therefore be viewed as if missing "in version 1" or
"presently".

Taking into account also Andrew's reply, I have to admit that I'm
inclined to request that one of the two of you fix this obvious
shortcoming in both Xen and Linux. I'm not really willing to be the one
to introduce a 2nd layout for the same set of data just for the purpose
of "playing nice" in an area where that, affecting Dom0 only, doesn't
seem to matter all this much. My goal was rather to keep the impact on
hvm_start_info as low as possible (and in particular avoid changing its
size, as strictly speaking Linux'es consumer implementation is buggy:
It would always copy as much data as it knows _may_ be present, not as
little data as may have been _actually_ provided; whoever implemented
this did only consider one half of the compatibility requirements,
quite likely simply because in the design this aspect was also missed,
or else the structure would have had a length field right from its
introduction).

IOW I'm afraid I may not be seeing the "big picture" here ...

Jan


