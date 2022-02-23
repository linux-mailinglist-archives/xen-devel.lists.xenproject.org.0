Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AE74C1111
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 12:12:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277327.473786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMpYc-0007Mr-E2; Wed, 23 Feb 2022 11:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277327.473786; Wed, 23 Feb 2022 11:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMpYc-0007Kg-Ap; Wed, 23 Feb 2022 11:11:42 +0000
Received: by outflank-mailman (input) for mailman id 277327;
 Wed, 23 Feb 2022 11:11:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMpYb-0007Ka-7p
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 11:11:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f639e4a-9499-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 12:11:40 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-dyN-6EgYOLWGu8w2NrJ4xw-1; Wed, 23 Feb 2022 12:11:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PA4PR04MB9247.eurprd04.prod.outlook.com (2603:10a6:102:2a2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 23 Feb
 2022 11:11:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 11:11:36 +0000
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
X-Inumbo-ID: 5f639e4a-9499-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645614699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f2LW45OR9QyB/xv/GQypej6z4yNDHqrFv6fZ+6Ynb5g=;
	b=BTZg7Gd1c8YxQVdElOr0rA+5AYWcBbSv5rY5yIAUUWt0SaztpOQ6z1yEheOBVlvwSWK1ji
	lnLnp1NgknFXM8j9tbtdgTiiUVRZ7EdjDHq4NVGPXTtHsZ5fmpyAugY1DFYUW2tM6LIpB1
	7NKAqSKagV3wGU/VwUtvFYSz+AA17+k=
X-MC-Unique: dyN-6EgYOLWGu8w2NrJ4xw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpdoFjZy3b8/LHegeRiLsJrLDgrpJL90wcbACqrmTaf0rhATQnbhHSOJtp3kMg0q/NEgT2JyeUs0tPI5OyCVbFEe04mfseBRPm4kymeGrS31p/VKcggudz+N7ZTuwiItpTvxo3Vf0D7ywiOdu/8vXQOuF0tMEBqp6mCsaknhEp8usQ+Pk1AuDPhyK79qU8Crl1eysuK7l1ErxVAnsbC6iyDduUBX49FttUCGCLWW5mmonF4Y0Xls4JFijczZ4CxVwNqK28Vat5jhsHsOqR19THvDOmdOVDYY19H7GEvRvBNbK1ooG1MRGelSXh/OvSgXNawTBRrMuEylovN32lR7uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5rtqIYRQyrk6uH1BJMVlZRSirGX8jY1S+9ht0rwAa4=;
 b=F+tVVK2TLL0LArofk0X/mLnk5sC/nvKzaeQsYHcgLl8HCcJHFl60vXnqedqaWepDlY1F4YLumHEm3FZtWG2oJAw4IkyP6hhW8Inx3v9Z9OTnSn06BvJ05WBCyZh/vlbqOPUtXHxFMe+IBN7Jq/LmcP80nlNYr/Ulq5Ntd8FjoBCd7hKoF1+J0F9D5x7GfmJarVa3eoy9ZpxXJdip++AiwjVIc2pGBbeqzKDdUVMQ1fH6Hqrw6OlQET+bh4rqQ2MFhbFRjugNuLAeMBWshVu6lqgIdNGLHzFcRP+j8uhLsh4ebkg+iyJFSzdhBvAqsuL3f5/Tl7lYZMCS0qmmBIsa8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4b90f99b-08db-8f1d-bede-d541df05799c@suse.com>
Date: Wed, 23 Feb 2022 12:11:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/3] x86: drop NOP_DS_PREFIX
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <91935ffd-a270-f1a1-28f1-645fa4167fcd@suse.com>
 <96f493ee-a360-ce46-7a61-5f55ca436295@suse.com>
 <f0214b33-09c0-f15b-e2ca-51cba5fd9ac5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f0214b33-09c0-f15b-e2ca-51cba5fd9ac5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0065.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::42) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9729f07c-32a5-46b0-525b-08d9f6bd41ad
X-MS-TrafficTypeDiagnostic: PA4PR04MB9247:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB92472FE9093423F9B265550FB33C9@PA4PR04MB9247.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	79gYuePeT8mwnt1fSeHJZ80I4EvMwgVkYkBG1JiGYJC2o9biiIiQVoRVMILKaBoySSlzC1MY/v+Rz+mR82JJRLY7wC64nb07VgMivU8Z96r63A8WcxU8NHsi89fpRuJmRvkv6yA4GCSXj9b3WjefRuOvaz5LYpyGktFRWbTEpxTL48gtYlUyF+t4XL1s/M+HYTTyK69AqnatawgzlmnXEdTp6pxRN8J/MLvkXHp8TFCvfpx1UjeAkePwqbxYBuPuXsGBIEFzu/NlIo2yhe/PvvL9M91aKKbHRxMD3CRzTo/OQkOxta1GO6hVYiIvJv9XxzTwqruvSIboRsPsAGlhotNcxM01TdtF+zcK8tNTlKD3Q1zM0hKReOMNdCH4DkXgYofWaGXl5E6W+sIFC4L/G0wMeC/Eh3Jf7mu3q4aeyf4Z36TG4cE07XSOaHujsL9+zAbWqBTdIZPHJpBcvYW488L3uESYcCNS0rRLopB+NHopr7NyFOLT0hlfYbCuI0Swh4hqWo+OP+klBTVakuuRPQRzOFZf7Wy2kNh0BsjVlo3TPvoz3upS2EclIQ4w5zjKqABZ6s3wRhzzYAWjUZ0sFQOQF19UMkr3O2zwxk7I0Wd6DIPJyXd8AzndUvR9n0dKHX2xR52egGJqqFqtMdWAEUJMsN+AQbYrF5qWaUcY5JBBMwRfga8qzgxaSBo32422xYvL+Pk1ImolRL2+VGaC8unXiIeEGcgR0iJPvEMPodRK5hqPFxBqlaI903sWEG1V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(508600001)(6916009)(316002)(186003)(8936002)(2616005)(6506007)(4326008)(66476007)(54906003)(66556008)(8676002)(6486002)(66946007)(6512007)(31696002)(86362001)(53546011)(38100700002)(26005)(5660300002)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MyWUTw6v0PDMPQwR7AzzqO7eeN3gYxWYO/lCYhqumccaXetubi3tVRiMlgMB?=
 =?us-ascii?Q?AX6QIsygxyuAWeZf71pqgP0SBIVVWWIpAc61vKl6Y6nB/gGM1vDd+8X67ljA?=
 =?us-ascii?Q?/gZIB35LexYmTZ0afBcYPN0q85cwHLws5ADiqKqWXShD+CzMv/PF1/sODd3E?=
 =?us-ascii?Q?nfnq6Ypp9fM+1D+NO1Gj6uAoBXI3J1LhPwGsGkXLSgdgkFEnfpAtYDU9B59P?=
 =?us-ascii?Q?OZpOb9imrc3ONR+Nn/DAaigubRjKAQLXhuTo7mH2tDBHpqdHyBIldoD++JJK?=
 =?us-ascii?Q?z8956fhykpZVs+PoY8SSXuYCH46GuZb0dWddAqvHHtV0UpyYQsCnmdzdvWoT?=
 =?us-ascii?Q?KhFBG2QXtAHMbaOMMFPk36W3hBEBbSN3zuiZwtvVS7/KLI729KktIdBa2+BU?=
 =?us-ascii?Q?eLupo6VwtuSgSBuUClRh+lGBX2ULLm/qXbp2i8cGW/sLIjNyhVOkLbsjzkO1?=
 =?us-ascii?Q?0EvOP6Jh7fSnVBDk9vlgC2SktT6oreB4k8E2LHWZFRUVUp3RKkhsh4C/jkRx?=
 =?us-ascii?Q?SpbF6t7gd+WCvXfOpSGKnhLd/4AOHQC5rTf0h0chqv/Te/qQ0LaMZdanYMPT?=
 =?us-ascii?Q?LTrAhincibvZt2GWTFpO15Oz3NHrfluUv99mtnX1kePuvXw2xZtLeagX2TUP?=
 =?us-ascii?Q?D06Jv8IVqWeftRuoFMqqkSjt3nXYyGZTX8hd30EjNltupWXL7SD/Wa+F8Y42?=
 =?us-ascii?Q?1WRJ1OhVRc4WWlRucbqUDlfF56Oy/d0f74t1PF5E/JXOrd/O0V9EC2UpXyUF?=
 =?us-ascii?Q?HLN/nA7RZ+Nai6Z/OqddkP0tlowdZnXs4re4djG5QwPF22yRWwhK8oGf2H9e?=
 =?us-ascii?Q?JJYzbwMdaSshFveT/PJQ4KzwFw+kyLytRJenLKWrHvDpMePIvWJc1QlYYJdP?=
 =?us-ascii?Q?Cq6yXRgITfUWQuUgIymM1WYzQp/QMSsCzbE25KVtxCsbI6MUIkl899k06AcD?=
 =?us-ascii?Q?3i3rA1snd87FmsZL7Ttu3tD5YnohMxBfoNGApFhyYPbr1NjIQvztEt2rnGDh?=
 =?us-ascii?Q?Uvt68OqlEufpSIUn3Bd5ED4TzAMA/qbsYb6Zxkgbc49O0H6q9TtKq+sa0ZSZ?=
 =?us-ascii?Q?DJ4+dBLJmWjfRtsJg8CYBJx2J5qlmgNGAJlxX1Vny2hR5a9aMw76eGR7ww1Y?=
 =?us-ascii?Q?4Glc8RctrCWPIhnmLydO/nJdpwUOzu6nAyhwGv0/jinOJd6Woa4Ddw/beqKI?=
 =?us-ascii?Q?bGD8MOsmlnCfMgwrOdeUqYRavdBXzUjA+AzUcNmZCHku/6RNx4+Dfw+qO1zL?=
 =?us-ascii?Q?AcoaDcweR99bxp2hEY719TIVWACiplfjUQGV8ghHstWEaLdp4wznjHji6b7n?=
 =?us-ascii?Q?vAG3OhHEXr67gDQMK78FpV13IV8bbmfuWpb6N0tkVLh/PGyGsNtwXEih7kCR?=
 =?us-ascii?Q?ro2Dl36eHtISO+Y7AaA+jKU3khPdO2QL7DMzm6QbGkgt/WmLFaRkc8+PJ5m7?=
 =?us-ascii?Q?fwDO1VJx0Fi4W8qenb/6x2Qdg31OmaQCTJJGySbb4/Ca9vgCS5j+zUfZymoa?=
 =?us-ascii?Q?9Oz+sVQbsVAULTXc6lcOxllJsDoV+EeYkMY77vu68Aq1QS5q6NJ6OPeCNVj6?=
 =?us-ascii?Q?8j9qzM5hdfEegBvcyl1z5tPdsm/lGuHUEAEn+VjPDStjAhnmIer5bL+0rRg/?=
 =?us-ascii?Q?Dd//5AKAC+SpwKkVh9qgg0c=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9729f07c-32a5-46b0-525b-08d9f6bd41ad
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 11:11:36.2640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTwoY5pbwLFM1q9eGidl+BcN43FUCupiSQsVXrqP5uvr3mfUSj4oBmMlr6sWH/VR32iO0AUjGYRndwqgdRxOYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9247

On 23.02.2022 11:54, Andrew Cooper wrote:
> On 23/02/2022 10:12, Jan Beulich wrote:
>> This wasn't really necessary to introduce: The binutils change
>> permitting use of standalone "ds" (and "cs") in 64-bit code predates
>> the minimum binutils version we support.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> I was never a fan of NOP_DS_PREFIX.=C2=A0 Far too verbose for what it's d=
oing.
>=20
>> ---
>> In fact we could patch _just_ the opcode prefix in flush_area_local().
>>
>> --- a/xen/arch/x86/flushtlb.c
>> +++ b/xen/arch/x86/flushtlb.c
>> @@ -247,8 +247,7 @@ unsigned int flush_area_local(const void
>>          {
>>              alternative("", "sfence", X86_FEATURE_CLFLUSHOPT);
>>              for ( i =3D 0; i < sz; i +=3D c->x86_clflush_size )
>> -                alternative_input(".byte " __stringify(NOP_DS_PREFIX) "=
;"
>> -                                  " clflush %0",
>> +                alternative_input("ds; clflush %0",
>=20
> Binutils appears to be happy with "ds clflush", i.e. treating it like a
> proper prefix on the instruction.=C2=A0 Drop the semicolon at the same ti=
me?

I'd rather not. A clever assembler may eliminate the prefix as redundant
when the base register isn't stack or frame pointer. In 64-bit mode an
assembler might even decide to eliminate all non-standalone segment
overrides using the pre-386 segment registers.

Jan


