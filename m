Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EEC3FE99B
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 09:00:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177039.322232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgi3-00065N-EZ; Thu, 02 Sep 2021 07:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177039.322232; Thu, 02 Sep 2021 07:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgi3-00063A-AL; Thu, 02 Sep 2021 07:00:27 +0000
Received: by outflank-mailman (input) for mailman id 177039;
 Thu, 02 Sep 2021 07:00:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8X1=NY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLgi2-000634-GK
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 07:00:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72228770-0bbb-11ec-ae41-12813bfff9fa;
 Thu, 02 Sep 2021 07:00:25 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2050.outbound.protection.outlook.com [104.47.5.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-VH_ELK56Nlm_85o7wd7EDw-1; Thu, 02 Sep 2021 09:00:23 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2959.eurprd04.prod.outlook.com (2603:10a6:802:8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Thu, 2 Sep
 2021 07:00:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 07:00:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P192CA0008.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.20 via Frontend Transport; Thu, 2 Sep 2021 07:00:19 +0000
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
X-Inumbo-ID: 72228770-0bbb-11ec-ae41-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630566024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kHyfyd4gEvYSCBmF+GcFJVNB691mgc2xHZaGZWzVAvU=;
	b=PJ7bBsaAUQth3+ZaFzcZIhmrlbbUE++4/LBKOWk/usOuvxuXYUZo7hj8WuJPzlChX1TpU2
	XkhCV/SS70kYdPZ8opvLmmNZoyDFe9mA44Q5P64NyQ4D/p8hfPEG0F0u3h6LBICmrHYgtX
	rawW/sEd//clM5C2H9K88p5efGsbV9E=
X-MC-Unique: VH_ELK56Nlm_85o7wd7EDw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlP1RISFv3UfrAUtTSxlXQ4IYloSQULwD6SZE/1E+Im4fflCi6MjkjLMXY10ia1jUxi1+q0k3265Cl4LxNpCXbwI+C+HDRUjMnGjFoKRjEsvMq+30IK1myP7c1LOdwmVpkSGmb4jDwu9pDKboyo4gwqH66Y2qSwJ2p+4ijDF6kbJaOkpI/WjZb6mAcK42xugWllIg5sTYXATQLrQtxo9ffWr7EBMOi4ve9X6Pn8UIPRqR6GwIjVwSmK3UkShYFUlwuZ8TQL89y3czIrpHLDKI0avaS2CB7DgZ+aEdYcZhS/oQ8uksyiPkc0rNy0JQKd/CV09KlHpmugdigTOB6kP5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Du1n8tHvw2rKWfhNlde3mS2ais71qjhr//pscVaPcMY=;
 b=C/fWVH+ZsZzQaLVwa1JdOvT5CmkAbiYGUGbt9f8V1qlKSyNGCGrvlOnYznquIj8+Vg2CLTxPNpotNjS8cL62EXWsEkRrN+qiZ7JsleI9Y5V4ydv9CkO+XNm++lMtOvr8nBiJObIbEbytueZ1eDce8gpucl8FJ+pXdDAGra+XwEs0xBdkoFk4u/wOJ0J9yXTZrMPt7OQbt7pbyxZ+oduyzilKUjUeGmvkZeFSMLu/gDp1zF4JJnmcD144hBLzEtpGiYvpQEKhQwE3x3gk9t29+B29rPlwjOYfGHJza+4kU//0mn/SWCMuMOGz/mYeuDDd+uCQ2nrReMk+6Sf2bsxVyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] common: guest_physmap_add_page()'s return value needs
 checking
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ea5d1c22-967c-b11c-bc6f-9a8cac9a9823@suse.com>
 <601d46e2-5c08-3948-85bc-1e027358700b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f5c0f417-c271-011d-4c7a-fb210b5efde0@suse.com>
Date: Thu, 2 Sep 2021 09:00:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <601d46e2-5c08-3948-85bc-1e027358700b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P192CA0008.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50850b0e-bddc-4423-4431-08d96ddf5400
X-MS-TrafficTypeDiagnostic: VI1PR04MB2959:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB29590EEA0CA77D07860B9707B3CE9@VI1PR04MB2959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ajOC5YbxyrAjr3artB7TyVqDX0NBsY04+jrVNIyT8YSPyd4j8gbNE9znkT/+gSweUNMfg4fagRkwJgV9DJlOHhC8BXfqUANMf1Mj6arnPHEbZW68quhBMSg/WPNl0TP3DDc6QLGJWyENbyRfJcI/CnPDGFiLfPRKrCIEwoxJObPFKknQflyuRmu4tT25LV1u4jWc0GrULi3E58ZAYYuutQZnMPi7mm8WGp9/jl/N+DC4OaqiJCayNpZyAhNwnkSwsV3Ag8JINMnQizcxry/bI0Te+09ZnNtAXEsN/zWskTdIGXK6fVNyrZ/IfYLFgb8rRbN3FMxaoDk+gfycID60MuB4b6o82Flh+Pe3jtSBw4tkJd/365EY38j8HU9Q8U7Px0TrK2TU0zQ2uJL37QRr0RqBQecswvgdQmChTjTfYt2Pop5o0G6mb7OI6ppfEsFVzIj1ZUAupqKK4UrXI6I3UNjXUIKJk0iA5tr7t90wOm+YctpwPuAmEl/WvhYesvzaidn2tnMo2j1rt26QzPkiWU3zAJaF1WIxQr1pZyLqGEI8wBpE+ohklzghJgTP6Q/yuh/XYW+APpr1ZM/nnBclqP8KUTxCwYpvEDLXpm7BLMKMjV7yHkcgsadu9qE0ZYCRijE40If3X35DJgf1qt7N6rhK77lTOROVCSXMG/42SzRhVUB3Fi6r2emfciqG4XpWsD7DdHuFKci+ZokCjgfdX5fFhwhb8AbtgZgm1Ymj46Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(956004)(2616005)(86362001)(83380400001)(66556008)(66476007)(66946007)(6916009)(6486002)(38100700002)(54906003)(4326008)(26005)(53546011)(16576012)(186003)(31696002)(8936002)(2906002)(5660300002)(508600001)(36756003)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VcQFa+Smcz0/DkvbGOXNA2y96oLOBmYt8eyDjdxHNDnKOd4NTu8OuvHkwdMc?=
 =?us-ascii?Q?dKlIGSvjqxgtAj0Nwk/H/NKztLs1tRokpw1aiHvKtA+OC6swi/T/P6+qHbfb?=
 =?us-ascii?Q?gPqW8P2GC3D9JElgTPIi45OI24t6PeWPLNSek93k5LXrW5iBhI1uMyDDskKW?=
 =?us-ascii?Q?W6+cy+k9LQwR5VCL9J+q3bL+98X4inzR5A79vw+NrZfOyEWUoeuUQsrQuZOD?=
 =?us-ascii?Q?4Mgu5pjiTVkh1uMxq1ceiQu3LgSVFumdvpVZO+Mm3WCdyEfGW+XbV1IozK3K?=
 =?us-ascii?Q?KPyVcRd/KbcxFfghlvAZCKRAO7ILS3W15xGZn11UDHIghF9LqMBPquq8Wc/J?=
 =?us-ascii?Q?JmYSd75Fz4T6S1FXOoV8K0WHdDwyV+/KrXcCPqOpJDWNzMPg2I3JQfzhWMsT?=
 =?us-ascii?Q?OORgGACJybHZ7YYPtSrIRW6aE45TXDp0TUZEPr46iInT3ujBcGbeg2fU41Sv?=
 =?us-ascii?Q?Y1etoQvahtrtOKZo90GnXHBjaWoItH+1se9VOm5gjm45FCximU6mii5b/A+M?=
 =?us-ascii?Q?2TxpZkWfTsZdXId9kDRnCCC5ymBvcSHPwEtXcmyxm2VFVxBRfMLSo2ZCAbFf?=
 =?us-ascii?Q?8zZkPaHFCjlosIgPDvMpN3z1pYf919vE/nv4Y/kDx8NTDQ/IzLKC3AHIaQCw?=
 =?us-ascii?Q?KL8LrKmNhmmL2Qamef4MnJ6jWcj6WuCX2KZmwfi7Z46qzPFDTD44aoJ4kJiS?=
 =?us-ascii?Q?HBJPzSwXjMglKsfAK/rt2g3WffYDuHAFIFTouLXRU9D+6QF3H0ZtkW4L1Vcx?=
 =?us-ascii?Q?aDeMEoK3/Q32mU/TRlATdwZoYGKtoDRgBJ7VP1tNM4Q5Pyd5V5F7S4cPxIb3?=
 =?us-ascii?Q?6bLcJ6iDcmwXgI3hLzxtGxCqV3aRiK7Ie5ezoi/MFQXHV8dQSioRmknjZZNa?=
 =?us-ascii?Q?QkQnCds/kXogIZ4TZaLYXf5P9t9QlNs6wmFv68Y1tqRpLNoqK967ww2O+apP?=
 =?us-ascii?Q?aaLV/teVrhxAlxsBeC4vOZ/a3JfP7UGY5DF3dECuewAMEeMeUohTPc7YXXC1?=
 =?us-ascii?Q?eU3Gsfs/7H+tpdlo3IRh9SHMw4Kbc7an2n8MTHlcoH3MNaDer7pSUuM6MvM6?=
 =?us-ascii?Q?8tUJHhGf/DwCYiHdnIymTjoXT7FKJOCroJlHx/hlaXWMeau5lE6E+FtqDgqP?=
 =?us-ascii?Q?pWJndGv/tG7yt4nPiDuHms6VuWIs2raty50do2QCQupBwwx9xKxzr1aE205t?=
 =?us-ascii?Q?4i/NTxo3c9fSJPwnGjSZeCK6o1b6PBqjOv4GwV2TnT5qsO8BE9rRLQkTCSU7?=
 =?us-ascii?Q?LyEh08nM6U444bQx/7WY82euh3pDG5cmePFzzSRSECw1j89PoVQOjkK2YgYx?=
 =?us-ascii?Q?viNgC0Q7REVrg16NV4s3a9Qu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50850b0e-bddc-4423-4431-08d96ddf5400
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 07:00:20.5313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxvZLK+3wbulOW9nm26/HNyejGgufW5bh0DK93kwApz798waMVFtvqQdftR3VES4GtnTZrbpXL5v/Bi55rNdFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2959

On 01.09.2021 22:02, Andrew Cooper wrote:
> On 01/09/2021 17:06, Jan Beulich wrote:
>> The function may fail; it is not correct to indicate "success" in this
>> case up the call stack. Mark the function must-check to prove all
>> cases have been caught (and no new ones will get introduced).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> In the grant-transfer case it is not really clear to me whether we can
>> stick to setting GTF_transfer_completed in the error case. Since a guest
>> may spin-wait for the flag to become set, simply not setting the flag is
>> not an option either. I was wondering whether we may want to slightly
>> alter (extend) the ABI and allow for a GTF_transfer_committed ->
>> GTF_transfer_completed transition (i.e. clearing GTF_transfer_committed
>> at the same time as setting GTF_transfer_completed).
>=20
> Considering there are no production users of gnttab_transfer(), we can
> do what we want.=C2=A0 It was introduced for (IIRC) netlink2 and never go=
t
> into production, and then we clobbered it almost entirely in an XSA
> several years ago by restricting steal_page() to PV guests only.
>=20
> As a consequence, we can do anything which seems sensible, and does not
> necessarily need to be bound by a guest spinning on the bit.

Is this a "yes, let's go that route" then? Or rather leaving it to me,
i.e. translating "we can do anything which seems sensible" to "feel free
to do anything which seems sensible"? Which might as well be what is
there right now, and hence there could be the implied question of
whether your reply could be translated to an ack.

> The concept of gnttab_transfer() alone is crazy from an in-guest memory
> management point of view.=C2=A0 We could alternatively save our future se=
lves
> more trouble by just Kconfig'ing it out now, deleting it in several
> releases time, and fogetting about the problem as nothing will break in
> practice.

I might ack such an initial patch. I might even consider making one
myself as long as it's agreed that the option will need to default to
y. I might also ack such a subsequent patch. But I would not want to
be the one to propose a patch removing functionality. I think I did say
more than once in the past that I don't think we can validly remove
anything from the public interface, as we will never be able to _prove_
there's no user anywhere. An exception might only be in cases where we
can prove certain functionality could never have been used successfully
for its intended or any other purpose. (For example, recently I've
[again] been considering to fully disable XENMEM_increase_reservation
for translated guests, rather than just leaving it useless by not
reporting back the allocated MFNs.)

Jan


