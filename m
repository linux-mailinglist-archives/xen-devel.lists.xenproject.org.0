Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 352744B9F62
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 12:49:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274710.470282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKfI0-000609-RC; Thu, 17 Feb 2022 11:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274710.470282; Thu, 17 Feb 2022 11:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKfI0-0005wo-Me; Thu, 17 Feb 2022 11:49:36 +0000
Received: by outflank-mailman (input) for mailman id 274710;
 Thu, 17 Feb 2022 11:49:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKfHz-0005wi-Bo
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 11:49:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acc3d86f-8fe7-11ec-b215-9bbe72dcb22c;
 Thu, 17 Feb 2022 12:49:34 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-b-bfFyeQM4yNxpoCp1saoA-1; Thu, 17 Feb 2022 12:49:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS1PR04MB9383.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Thu, 17 Feb
 2022 11:49:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 11:49:31 +0000
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
X-Inumbo-ID: acc3d86f-8fe7-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645098573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RVjVVw/rYnFIm8d+oOZzUaWhthjUh/GTcopoalAfGZo=;
	b=S5lHTgzkq12iBRFDx2ubXBjxg69zMNMqLUGYboiirap5o2K7M9dKe/Y4gnfHFWrsjeAuDs
	THANc7DiHCrxnNJmVedRadK7nCz/mL6oMUj8XSzM2mKD2hEIROuqLvjWBxPttadBOvggAF
	oF3QNsxUFPX0t8TqvaxmYS6kXSZ5COE=
X-MC-Unique: b-bfFyeQM4yNxpoCp1saoA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TA9NXyEdXsW1VwYW54WfGrmPBOVI4uZx3AVlEwEHu7SrODQ4MI1QGCcgAebF6uqpRjyr36Bw25tg9HTCmFOTXoc0bZ+9lVlW+9Kppoox5igv0W8Cu3y1/X5KPjUGQXsFYX8khcXBKGdKyMz5Ce8Zn7s0LGk3VCjMDTZmBZUPbogR/riz7rhArO0ZHXSdx9mXMY8+m1WgrhKl7rPUGyTqGAO4UbsgdmWtrALwCKW864ZXfUCbunO5CGlQVN4R3pn32wD39deaUrP5CDkMhqTG9f9sArNGaMIBhng6GK38/dZ3WifxXwfmMSyfDmp50hA3PW0WaH/uBrKdP3jN+li5AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4slbJJaJD/qbmq3zdUhk6YCDPhBioSYx1cDovdkhHc=;
 b=Jnr1ybWjD4CSsgisMorG5w2LRh88WP9D3xIwr0aluJ4XyqFBy7JeY+Trf+aRLjP0NBFYmksebOPOCt+yAcaH4TEC4IAXb9eFT1St9Iejaep1mDPJhotnKDTuQP0QgjPrhvATAHcTcWgidVjljMoOxp173mBAw5AEDXrt5z3owtpqowULZ2R5yhmtLf50XulB/xrO9kRF58Y1Mu6C4tvaX/BnNIU4+pxTjbH07fqJMygsUDozHvYFFMM/VRxCn8oJOO9w86S42XaqASaRwNXW0t1i+4yO25mcV6wxns/eEv/AQPDD4faWjWCJkCKjvPCS5lF400x9oGpWswBIzBjvtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0696ce53-b126-edcd-7022-83d1d0688be7@suse.com>
Date: Thu, 17 Feb 2022 12:49:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 34/70] x86/emul: CFI hardening
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-35-andrew.cooper3@citrix.com>
 <2a5e1893-506e-e4fc-dbff-6001feec1e99@suse.com>
 <d62fddef-5cae-7334-ed0b-cc2c9313f040@srcf.net>
 <21e40ac1-277a-8675-1299-54561ab3d2d6@suse.com>
 <18ddd7f8-98fd-a1b4-e694-32bc338a33ea@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <18ddd7f8-98fd-a1b4-e694-32bc338a33ea@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0376.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0910c98a-4377-4e62-447f-08d9f20b8f48
X-MS-TrafficTypeDiagnostic: AS1PR04MB9383:EE_
X-Microsoft-Antispam-PRVS:
	<AS1PR04MB9383073E8E2F7F083B5EC795B3369@AS1PR04MB9383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0YgcCYr3g8qbaG6YWQAMR69MtkcHX4/GtpeLkbIwOhwopKG560J4p/T6ahQP7/fe+yBKoeGD8McyY48DlnuDt/SLZOUSYHhXI5ffYerF3rRkCg1a+jfDriP8i9hsVXv0/elgOxg44ezcTtS002Phe3SZvrM4iIkYLV3En6mjusw1XBDUanWxjSqU05qyUgIZ5bZHl3XzHd5jjkttGg+Y0jgprl7f8YpSE84CKtLNQSBTfqQXW8HPa7CjpLTX3mpaDuyqutqw3Q8i4y9+UxwmXzEpcbRixJfYF34Wk+Wc+I9e5k5inNwCyL58wZua5J8yKJLOt2b2IYseK3j0pfY5/iKQyolGB5vhtLjltV4JLHD6AyuiCaMGaGyUESWtOtIUIKjEIrAIFo8cpmhuYWOhi5MaGv3li63y0GbW4pe/CVcwr24HcB41r6Gd/jQfbWZuGQHX5C5PNjlFq8xHqOCtXqIbhZbS4C6WQDr6QNGrsZbeW2lDtdvBw4kz2T7WFQDFLZQqMpdBRjxfkILKULn61WgBwfU9CLkjmerg9jYU3/X/6slpN5bmVc1uCcgWXLDr681JJltItKDwZZRPPnqA/0iHwHlIwPm86ar404OJm/3G+bl6nrmVTGoHDzDf5wOYfgAkk7pZ7CkRk7rxWg0KwvlYl7TWYIBFC0CJQBtq9wA9Hh/RELiLSHKoDn3nAyoFTeWhWNWxV5Ogt0lZSIXNNlmf+As1CuyPyATh7cZ3V2wkepfDMpZsitf6QgdJkJvW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(6506007)(6916009)(5660300002)(8936002)(6512007)(26005)(66946007)(53546011)(83380400001)(86362001)(6486002)(38100700002)(31696002)(36756003)(66556008)(8676002)(316002)(2906002)(66476007)(4326008)(2616005)(508600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LWtJjkEr3Xo/rpNlkfML/V4b1kncr3E7LSfDrlSIv8heAaTRAdqJaWsejKeQ?=
 =?us-ascii?Q?FVlnMY9mmRcntf5NKhqUwN1aJlzEUXT5hb0o/YNTBd34lfYpp48IcIPO3Vti?=
 =?us-ascii?Q?PN8AUAM9n7mugsILuDerouqYZnSPnZkOiQGQ4VrYGQAxog+SPSAo4oX1aIp/?=
 =?us-ascii?Q?iGEjRIbk44373ZWqqRu4EmHCNnd97cesph13mXwfM7KUFXsI37YibvVLjTYu?=
 =?us-ascii?Q?ppikl4d0SleQ9yZK+m7ZpJzDtTuHv/mURIMmfOmJuQNPDMSBQrdXqbMyoAYl?=
 =?us-ascii?Q?hb9Iec5blWJSAVPqPvYPJzPyY5pgN4fl9vBbIqX6gCXOYmbZjQmND5z/QT69?=
 =?us-ascii?Q?rspLS+tp07axeBjRJsbpgYvAjPSLKTqmHAvutLG8RM6SxqRtTLmjqyXYuBfo?=
 =?us-ascii?Q?bASk8U3pgyuzuJpea0/VMINF65UGlH/RwuIlPzq6hhwarqm6bANx8EJpH/Ib?=
 =?us-ascii?Q?sFG6nDEsLIKe+h2M37FY427lyx5pWTr8CPUKP1ZdgCP7ZIssE4lfpeHTkCFj?=
 =?us-ascii?Q?mC104vmiHeJOrk9R4zQmGWZ+9ODdObqxCAnKF0eTIP6gOUX63STc+kSDcyqy?=
 =?us-ascii?Q?FFcUEzyiSAA0aUkT6DrixEo9152OYhFzEQ22WuVqISChBWYS26N1A+g0xDeE?=
 =?us-ascii?Q?045+vkEUwkGJH8EkfQkEP1YGCqqP7iT6rbX149QC+4/njNJriJnRYcQG9tkS?=
 =?us-ascii?Q?cBqek+6PmrG7Ju7nju5utMt18pTGCDlBMtudkJk+VZwb22LMAzaCIREZj7Co?=
 =?us-ascii?Q?U+I+gvArauoaH7hvjsdeBfqIe+zT22YNRJS/4Pu1FqJAiJs0KQjT0/Kf1SIs?=
 =?us-ascii?Q?InqulXjSyVhzKM00UAOUQMj0+vs2ddGuMBLmZEYTZc+jRCGsajF2Mz0AFv+x?=
 =?us-ascii?Q?cyPRzkEYapeCuH3siBQJM/F4EaRfXZy6cnrCPtic2oB5SgR+XozlqLO+XNLG?=
 =?us-ascii?Q?mcUzlguGm2rgVo5fZbUdfTtLUnzceCTDNfh8ttUrSwnIOScF+a651Ikzs0TM?=
 =?us-ascii?Q?uyB6Iq7yZUTE3nfktVEe1OCdqw1nkXhIVdKPFG09TULD8F7gyjcBBCtfJt6Y?=
 =?us-ascii?Q?uODukYrvyhTCYcsMP6Z1pesDpZYIlR7bLQv+x4emAstugb/mIsX70F1jF5bd?=
 =?us-ascii?Q?UYb6lr0Gv8Wm96VBhehKYdLgxIw/XSbjdYnoB41ukJQzH5NRVYGBCLAi7bjU?=
 =?us-ascii?Q?mo9xoNiklysqNuNrcVck8wnx8sf+XfColb8t0PJpd1ak96VtnJZ5ngKM7O2u?=
 =?us-ascii?Q?h+dHJckE9v2ZmoRQkTyj+2YJIlZihHTnnbxE703qik6njZ6VGiIx7Pxdi66h?=
 =?us-ascii?Q?SFgx89VTn4bbbYLuXu/LKJC449X/VLEX9RYOOIEWw0qoi5wlk5MeuBZ3jVo/?=
 =?us-ascii?Q?zpIwvypy24rEBGEpVjvQOvfDXeDKyz25rxncR7xZDM0MobMupkszUGaHU+ql?=
 =?us-ascii?Q?DNveEN1If907GDI2VYTutQ12hALJHGNJZISUns618sQGNuV5lVyg2G1wt31p?=
 =?us-ascii?Q?22pFWZVyUKzcI55SppzSX2RBVEfhF2HMBiK77OUIxCIzoDSlus7COFeXSFGI?=
 =?us-ascii?Q?dnbWjgYEabetSdxWsC5o4/w18flxwI5Jf1iW5rii87byLFVJtSsk4sG24k+g?=
 =?us-ascii?Q?x9Dg4gORe6AngwM/fGCGYlA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0910c98a-4377-4e62-447f-08d9f20b8f48
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 11:49:31.3950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRD8nqsSaQoWjic5o6SrGTmQmdUBFKnIsjDskHCrZYal31744m4avIHuHbBrLjn+PJPnJZ11SKxr/PhhLJwORQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9383

On 16.02.2022 22:34, Andrew Cooper wrote:
> On 15/02/2022 14:13, Jan Beulich wrote:
>> On 15.02.2022 14:43, Andrew Cooper wrote:
>>> On 14/02/2022 13:38, Jan Beulich wrote:
>>>> On 14.02.2022 13:50, Andrew Cooper wrote:
>>>>> Control Flow Integrity schemes use toolchain and optionally hardware =
support
>>>>> to help protect against call/jump/return oriented programming attacks=
.
>>>>>
>>>>> Use cf_check to annotate function pointer targets for the toolchain.
>>>>>
>>>>> pv_emul_is_mem_write() is only used in a single file.  Having it as a=
 static
>>>>> inline is pointless because it can't be inlined to begin with.
>>>> I'd like you to consider to re-word this:
>>> This is the reworded version.
>>>
>>>> It being static inline was for
>>>> the case of there appearing a 2nd user. I don't view such as pointless=
.
>>> I find that impossible to reconcile with your normal review feedback.
>> Interesting. I don't think I would have objected to something like
>> this, if it was conceivable that a 2nd user may appear. I don't
>> think this is the only inline function we've got with just a single
>> user. I also don't think this is the only inline function we've got
>> with its address taken, and hence having an out-of-line instantiation.
>>
>>> It is unconditionally forced out of line because of how it's used,
>>> meaning that if it ever got used in a second translation unit we'd end
>>> up with a duplicate function, at which point it would need to be
>>> non-static and exported to pass review.=C2=A0 (And sanity.)
>> I'm afraid you've lost me here. What duplicate function? Before and
>> after the patch the function is static; what changes is merely the
>> "inline". Two CUs can have identically named static functions, can't
>> they? Or if that's not the point you try to make, then I have no idea
>> what it is that you're trying to tell me.
>=20
> Yes, the same static inline can be out-of-lined in multiple translation
> units.=C2=A0 This creates two identical copies of the logic, and then fal=
ls
> foul of our unique symbols constraint.

How / where / when? If you care about unique symbol names, you've got
a Kconfig setting to enable.

> The absence of complaints in the general case shows that we don't
> currently any cases where a static inline is out-of-lined in multiple
> translation units.

Nope. I see reports of duplicate symbols (in their warning incarnation)
quite frequently. hvm.c#cpu_callback and hvm.c#cpu_nfb, to just name
two. Those aren't inline functions, but the naming constraints apply
equally.

> Under IBT, it means more tagged functions, which I suppose doesn't make
> a useful difference from the attackers point of view, but it's still
> logic duplication in the final build that we'd prefer to avoid.

Right, which is why I didn't object in any way (and you did have my ack
for the patch already anyway), but merely asked that you soften
"pointless" in the description. I really don't like it if, for reasons
I cannot follow, things are criticized more severely than (imo)
warranted. I'd like to point out that effectively you're reverting
08143c5b6c1f ("x86: move pv_emul_is_mem_write to pv/emulate.h") then
(just that the function moves to a different file now, following the
movement of its users), which you did give your R-b. (And yes, I know
views can change over time.)

Jan


