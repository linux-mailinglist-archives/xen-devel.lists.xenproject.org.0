Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE2E4690CE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 08:27:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238674.413743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu8PG-0006md-Rq; Mon, 06 Dec 2021 07:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238674.413743; Mon, 06 Dec 2021 07:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu8PG-0006kD-Or; Mon, 06 Dec 2021 07:27:26 +0000
Received: by outflank-mailman (input) for mailman id 238674;
 Mon, 06 Dec 2021 07:27:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mu8PF-0006k7-GK
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 07:27:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f50ec011-5665-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 08:27:24 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-rJ-yQyYxMP2cVt18pJXM-w-1; Mon, 06 Dec 2021 08:27:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5903.eurprd04.prod.outlook.com (2603:10a6:803:e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 6 Dec
 2021 07:27:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 07:27:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P251CA0028.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Mon, 6 Dec 2021 07:27:19 +0000
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
X-Inumbo-ID: f50ec011-5665-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638775644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+IeeCAORjmg3WSBQ6ouUuwSR7asRfORXe50C0iGd6TQ=;
	b=Y5ZqRk8N1dpR7xkSyT0Nqc23q1M08d7kbffGReacqcjhsbYueqJBDNs5sBlA5hVC3oX3Wl
	YmXYKwZZbJW7DzFxgbbh3MMlgX6Ar+8+fEu96QtRFfOf/ZxaZeHu29GugfHv2BFn4/5J46
	rzbtfLk2tGIhaTpI5YQqcNWmK3r/HTU=
X-MC-Unique: rJ-yQyYxMP2cVt18pJXM-w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmNVKz5jFrTP+lcGqaTIqkxdSbx+nbF8aDh0nOQgJN5N/cObVdLHEasEd2L9inpmyVoV83sHMOmvHFWeGMk6vLWngHOA2lPsZtlSljs0kqQChgs+E402PL7H3pw42QDeU9y+1rqp+PMEevBpCeTc19rCtfJGgyeOCNZ/93JXIyvg9z93l4wbT9o0Ofa2fz5O4dfnyK9bXzTbI/cowL+TH38Vx7YPCOHlnqKrRz6VxC6vzvprJI/6LAKGSM28Fo+r/0lWrHio3WzfQ1d2uWEj/XTOSey1y05iblI7WLzBcLCOTVaWWNMJ5EvH2lxbx7G+QkUZ3O2tMxxp0mV8tY1COg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+9MgHcc47O3DL0m+Q3Hvp3+k3MJhtMIN8Toor36pMA=;
 b=cR3H2y++6Odz0lqYnaAMfyaxPZ5ARgJtCoAKeUzT8Msm0JIfbHpXe9BOEDXhHS/IvpzuK84Rs1d8Wt1uYd66Dpi2RQvxATf80RN/9HC4nglCUcYsG8SWjzxhyVOab5sxmuRvQyGI7EFAazZhw6tj2yeQsXeaCgykyOpHzQfBbJJwCDwg2O2JuL3sza6qfwCE2ltsjOzpa8Qfn7FlRuEHQBsZC/CtxBPmh0gW4ZeF9Ox46HT/YK5mKKJc74TzTceXK0EQgheYlohH5lADcPqDdeAaXzTenw0znk+K0AYgk0Z+Bhk1MQ2DkuLnjyin/z5gi8VYaLBEpIUOhLvSQQbPGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1a6dd0a2-5a09-d39f-b0b9-c7c33f313403@suse.com>
Date: Mon, 6 Dec 2021 08:27:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/3] EFI: move efi-boot.h inclusion point
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <46de3a57-76d0-1538-ec3b-79290d1bfb70@suse.com>
 <8b369fc8-8f9e-c350-95de-790d47fd9aae@suse.com>
 <F1FE39BE-191B-4245-84EE-1109B9762B54@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <F1FE39BE-191B-4245-84EE-1109B9762B54@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P251CA0028.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83acd905-460f-4768-5993-08d9b889d6c6
X-MS-TrafficTypeDiagnostic: VI1PR04MB5903:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5903822FD8DC599F6FA65ED7B36D9@VI1PR04MB5903.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	peuW028Q0V3MOVSrTqaotHXtfpika2pauoONqaKVivK2BWEI/Ab26Zss/1lInT3k/m1j3nRz1slkG6tAIdXSZTcEAsrdoIiOLHk6YEJnShs6E0UKAgN5rqCCQHI93SQB0zt93cjSh2L998AJo/K+rebQo1iKOAD/N7kxazyCAM7yHYYfmC4rPOgFKdU//K1ZC4nugmE4EZxz3jqAcszYbJaxnfskk8dlQ/vU1FDntoWd7cx6VeF9T83uZKRWWlDkDYJuc3uBKO9GLKQC7S1ldf9+J0KA6+DR2Rzvr/vLcOVjY2zmoODRAw35HL7OaA8fPcj7cJ4Vpluj+xEk1ne49CMOeKOlhcmNcv5RUiaLHJlfNV/VxQ/bjWd5pwH0qdqK2x3peWhGNTnQUKQxIa8qdXY/oc0iX3hf/t+GyzA1s0cFVnourJTaQAPt0J1xtIfnNgFiTZiy90tx2us+qjK0tbWpnCyoH4FN/v2vwE/S9+OdzBSHM9HrxII4sqXFVk9U/kdIep9Li+mwO+c3bvUYevyCNCIUA9QvBq4FMeTiXwUG0SLwFG+u2MoIRu5fJ/0XTljsriNRHWNUP44/6ofta6l3U38aYlc2haQEZNp1aGqm+o9OFgXjI6lUtyMqTYcBDYRMEhd/3Vxg8RVN4pdLoJWJBSeVRB8WkRL5tjQKa3DTr/whbCJCy+r0CIg7kZTFY2NFhEA/uTHWeZ7AXMCuIXINAkhtQCRaOnmxh22EB7c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(6916009)(4326008)(2616005)(66556008)(31686004)(508600001)(2906002)(6486002)(31696002)(956004)(16576012)(66946007)(66476007)(8676002)(26005)(316002)(8936002)(5660300002)(186003)(54906003)(53546011)(86362001)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e0O9FMreRAmEBbEq61YtGXmrHmBY1curgsQVhA2NEhotoql0mCk/T3137MZ6?=
 =?us-ascii?Q?3wXshfgNZp7CKbdJStVc0GqikHs8aNaf/gSE32TnLgoavjT1eVUk9W577Up8?=
 =?us-ascii?Q?DjKR7cjEMszqLVBJon4WbJnDohRfh11y5DYNph3GYm6uaW6OnnBweibT+o4y?=
 =?us-ascii?Q?Go9gaSSzaUD9t1tvS9VhgD0ViQUbCL24Br0AEvRVcCvn0QPFvbCVeHr2c2qE?=
 =?us-ascii?Q?wwJ0EEpNIgo213Tvz6zS0MZbvB+pBt0BjFzHLWUnr588aTYM74X1v/2RdXn7?=
 =?us-ascii?Q?eqoyp2h0BpgDISdRUj6Yx7Ti21b/zXe54+dlnT55PJYiDZIYyTPkbbsJH4KN?=
 =?us-ascii?Q?EouBIMY1+51iq/PdcFrncDRcjfK/+qgDel1ofbU2fcq0gLZ1OMwjldnLd5cf?=
 =?us-ascii?Q?6iCadxPp7EP9zOEj5/YiDhG7dyOl2tbzQ1eaCxgXas4q7IY1FFwbeCzPTskN?=
 =?us-ascii?Q?56sBybFTcjgUY+SUEzdt38iwuHhL0um//mIIYjjbq5m7QxbXFGH0kV2gaX29?=
 =?us-ascii?Q?yitRkbJEVGvOyNnSPbBebXLYhXFgEFEa0XS1FesX1Ru90DSsfGTPUcxaVTL1?=
 =?us-ascii?Q?ws18i8DRzHugHNR+A8pXpSKHSVflZ20EmurWsZFrU+Awnu4HW7cv/WU7Sm1v?=
 =?us-ascii?Q?fIHdfT19BH0EYMRK24//LADkqcKFvl6LBbv4OGJ/XszNt538kFGNMIn2iuYh?=
 =?us-ascii?Q?YHB2XeAu8zVt1zR7VsXcDdnNj1h7lDb8PWPvEYix2I8C3S+jZ54gWGN5Gpsj?=
 =?us-ascii?Q?F5dH6ww6QAnc7s7xdDveqZu48bBhEqyOn24sTGEoQ5unbloUxc3Q/e7eaWNW?=
 =?us-ascii?Q?0RR9mCT9kF5/71SGqkZcPeXkc+SynNP4SFiFGloDBljTKMcMisIwo311WtcX?=
 =?us-ascii?Q?gT+5ZZIBI+rNAUPwKtyRyIBkoavJsB1NF3M1WAMoBPXiiuHCVvUniZIo6nRm?=
 =?us-ascii?Q?MILTGVSlzhU45r9LKKXuf94Vgkhj8GfJcwt1kIpCmNdCZmlWfduViJgEwAw7?=
 =?us-ascii?Q?D5bOieg8Ioh0ZIwMb369yq6TTNw51YfzlRihu2AWwjpLxkjkIPdKnQs/1/wu?=
 =?us-ascii?Q?IMA/XIWx4eVsZGVNgCnrrgU05dSRhNO1YSrxr/yYYOs3OJkEf8Rjxj8eFnRm?=
 =?us-ascii?Q?JLaHZj4HH7gn4tNarU2FbsdSUhAAatPMwuA8dDNnuB3W7LtxUyp9hUjUHi8d?=
 =?us-ascii?Q?wmWA3TAivqi7nBmxvZzrgaxRwlnO0hQH8KuwzMtfEuhF6Kw0PfnWPhH1I6sg?=
 =?us-ascii?Q?+mPKmmSdMotMaCcycm+OyyiEB8oTf75x244uTJvxAvsEp1XTXgXqxh5bSF9a?=
 =?us-ascii?Q?sIUEYIdbE7l6YdxhTHKu+JtJ1r7vNUeZ0jx2PrMfOTQz/VnVpGplCpRgl3V1?=
 =?us-ascii?Q?x8G9EZ/4p0YALEnLDSabzV+o1RmZBP0/tm81R6CwAuZgNMCZMvrRBcFuKCa4?=
 =?us-ascii?Q?xr0Ivm4K5TnJ2+IAiGINShak6TVH2mMY0FsOIowTEXKT6hlZPDRt02rEQ8zD?=
 =?us-ascii?Q?2ltkUlw1GpRF3CuRvOGPbFtiybh5aKNwao6m1aI+pottgYIlvcMKuvWBMgH2?=
 =?us-ascii?Q?27W13RdWVhZ7oJ1xi/r1A/q5uR7nRreU2YzskYV1QOHa0uEeIvCQNgTQZ4y7?=
 =?us-ascii?Q?b9BFXAFmUM7S/WP73Uxbp/0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83acd905-460f-4768-5993-08d9b889d6c6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 07:27:20.5468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEJGIIzL4bEW3CG+FEhisYz6L5SLXi/WDPkRQ9jnIM63+QGtH09WT5Tc1K2R1YKOmMyegu4DgIr37o04HL5jAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5903

On 03.12.2021 17:10, Luca Fancellu wrote:
>> On 3 Dec 2021, at 10:56, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> When it was introduced, it was imo placed way too high up, making it
>> necessary to forward-declare way too many static functions. Move it down
>> together with
>> - the efi_check_dt_boot() stub, which afaict was deliberately placed
>>  immediately ahead of the #include,
>> - blexit(), because of its use of the efi_arch_blexit() hook.
>> Move up get_value() and set_color() to before the inclusion so their
>> forward declarations can also be zapped.
>>
>=20
> With the =E2=80=9Cconst=E2=80=9D attribute now some function in this seri=
e are above the char line
> limit, however everything looks fine.

I wonder which part of this patch you're referring to. I don't recall any
addition of const here - I think I'm strictly only moving code around some
code and delete some declarations. I've further checked the code being
moved, and I couldn't spot any line going beyond 80 chars.

> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Thanks.

Jan


