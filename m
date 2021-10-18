Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C1B431A7D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 15:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212233.370028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSTc-0000cv-Db; Mon, 18 Oct 2021 13:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212233.370028; Mon, 18 Oct 2021 13:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSTc-0000Zi-AX; Mon, 18 Oct 2021 13:14:52 +0000
Received: by outflank-mailman (input) for mailman id 212233;
 Mon, 18 Oct 2021 13:14:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcSTb-0000Zb-1I
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 13:14:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c139944f-a9e5-43f9-a7a8-0c661e61cab1;
 Mon, 18 Oct 2021 13:14:50 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-_l_s7UZ_M12xcHrwUikPYg-1;
 Mon, 18 Oct 2021 15:14:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5327.eurprd04.prod.outlook.com (2603:10a6:803:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 13:14:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 13:14:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR0301CA0020.eurprd03.prod.outlook.com (2603:10a6:20b:468::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Mon, 18 Oct 2021 13:14:45 +0000
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
X-Inumbo-ID: c139944f-a9e5-43f9-a7a8-0c661e61cab1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634562889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+HctXF8F9LSVTjNxju0dMvlO/JQrLWy6cwYDRPi9u7E=;
	b=Q7kq9bgAirutfUvJ5tVeF34RAnCf7907Ry+OhYfga4yBsvPyWnD5GGXDZwuWaS5A9gq5z0
	EuAC84VN5qlHlWaVl5dboTz2nk/ESjxWKbOGIwp9iwnxUv3v0ow5rM5HEfXDI+w9n3YEV6
	K/gTjLrh+rnLqZO+ri6Kwf737ObL0+Q=
X-MC-Unique: _l_s7UZ_M12xcHrwUikPYg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJ5wqfB9lhIgyaeHKmtHp1m+HMHWWpnWx3qi396XeoQIW/fc0+q2YVy0Vbwliz3MxL0bOJsoe3UA8+5PwzQaEpiUaRY86wC4M8LxAX3tdwrKoFGspeXJZPsCkzSZuqo8w9Oa+9azdwlVRjbXfoMq/GiBIE8/NaX5OC2CBrKUO+v7M3W+QlJaOJ2D4WiJTDAmZwz7bdsNEav1ouKTMAzOonDsnjLAG2Pif6IhxQ03BIkhnkTAWTada6GiWTx1N4JzO9scd6/ijfGnnTzTjSVMkaysJY9zmwZsZr7thRvH+FJVUO7zlkLGvbm2oI6zL1k7NAy/5CYEjmMJxlrRRJPfZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nir/CDbgke2ctiiAkaR7d30Y01lJbfttAFYzVvKImo=;
 b=F3xeVj2mDD3Dmw/4EL4ROb3juoCxpB+4HrtxSGeXsBfb3pZz+pQnzd220x0BOnAwmdhRfaiN6Ffjep/VgqURr88cn99efYY34GDe5nfKtOhXwxI9CcOUl/HbQQ79dApcsrwQvMbEVxFLWdZLYwOD5cHbZNIx+qiuqS5aEdz3lZF+7rciwS3lZ8JTQalQJeeBxSJnSLlysFHoqJMDV4M+sg6cvHVsRV5Ok1vBj17vGFZ4Mv/6n6Oas+q3fR/GtRtr8nm51q0MZFF8rs1UaEV9fXp+ogE5rg1XLOdQvFht9RfFmIQ5zWPZfyueoHwyqyAveVdxPL0JO5aQsWyjZ/zYOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2] x86/AMD: make HT range dynamic for Fam17 and up
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <36df1141-5c3b-6f8a-3a83-1f954b1e27a6@suse.com>
 <YW1BPPVNAVm6EPQp@MacBook-Air-de-Roger.local>
 <3f08e2bb-d80a-3336-d379-a9d76a689586@suse.com>
 <YW1yU/gogTvvRMMF@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5f10c25d-6fe4-178e-35d5-6a5e8f445323@suse.com>
Date: Mon, 18 Oct 2021 15:14:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YW1yU/gogTvvRMMF@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR0301CA0020.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1251f0ed-4005-4877-82c8-08d992394153
X-MS-TrafficTypeDiagnostic: VI1PR04MB5327:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5327396D9C0E11A1A13BBB74B3BC9@VI1PR04MB5327.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	juE4TYyJoxtjMf1uPE2Pbn6r4vCTGVEfVKjrN4f6+OY1+mbRAb0MXTCys4e47LN18zwh4wIIhdXlHcePN275CLX34jz/XSErcYpNccNoN8VBQdsSQK+gTiixbGvUnikaKIERK0s7qcG9tlW3vDlmmfSELyPIlMj35so19a5f/enVUkEAfEF6KcQ+9is829MuudvCQN0hOfY5FLYad/WNA60DyHW5bU1gi8kaNjRgT93qM02PDqymIR9wApEd1188GSIta03QQpWQisL+Sv2i3OuspHsUUVjBMB1g8ZHUYKGgz/vyLfXW3ilghqchLMZEFwratkhfoU9GIIBBXh145hidzCrGydqUliLJeEgMN0blEHCdAM8tJ1LvTuc3uEbkVTYG9B3tgk9WvG8XerNynwW4qWFGcm6CRscT8rTSac3kprMO7JZAwT/V5Nh2b6++adJw6vIIVAHuiD87do212g0pi4+1PInvw6dwQtDzrG6xUy7g5jF0GnWptymiuyGPv056Npv/FIovydizwI/FGeibHEZcRLzx1oWWWQaf2kYAbnz8XrD/VNZEftaamCbCGFQiWafSkbT3Ep3eo63Fv6rlyDXh/iY85DfemS3ArXo1AScSldTu4W+WhRjtLAUfGs9G0JtniyO+nLAtrW1DQVfuasC1pmmKyF+kE5Zyy8sBOWgL9phvUHm1cpzGHyi3XrPEzuqeSx9h9jk5LHOoytKPml3Gscl94OgzWO/P5EtvYw7VVpjVwCAOw19jyps7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(2616005)(53546011)(8936002)(5660300002)(956004)(6486002)(4326008)(66476007)(31686004)(66556008)(2906002)(66946007)(316002)(31696002)(8676002)(36756003)(16576012)(508600001)(6916009)(54906003)(186003)(38100700002)(83380400001)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nuu8JAlaPhHY5ndCNdcU0p7SWIyN2ok6/TpSTNF/GV7vUHsFtl9NjYcnhiAV?=
 =?us-ascii?Q?gYT4G5tDBTh3GgQY2aVz2J+BD4xodae5wct6WElZ/+57dsqcGQHHPu0teXbM?=
 =?us-ascii?Q?1lmlLCBYZ5JDIXE9g8YnzkjQ2Lob5YMz+fP513kKMB52OlbsAEvD1DNXbayF?=
 =?us-ascii?Q?igNsbLFw3+mnSIj6Rx47fCIuHK0GLQAytQiIkogYXKBBrYFp8gDNHADRnPsP?=
 =?us-ascii?Q?YpMMBazglmbkDvwRqbbXvjLx4lQwyMMyCDo3mAMB5M2qitgFHLs/ZOrLOA4w?=
 =?us-ascii?Q?zBecHISIvbGP4PNC60OhWX2rTNPru4zisMCejkf9xgZj/FTVEq6yAx+DQqke?=
 =?us-ascii?Q?LPorPFsgNEaBbmPmOzxosAT4iltmif/Gi3qB2VHfe/gqyfHmNwfpduivlAe/?=
 =?us-ascii?Q?1yVpXAnmNZgrIf3usQoqGALpoUdNGo8ZR0XhGCEXsHb166UutBdvkgUSROgp?=
 =?us-ascii?Q?EJrkM3BzuFSf8aDDoSlPhMKOE3XWkZaA/7a1hCm9asUactyCtb/SacaxKEOe?=
 =?us-ascii?Q?n7MgXaFOhhj7IZMZpeEHTT0QK2bnJ5lu8VSOY8dp/pLShlqW/kzmK+o9rwfw?=
 =?us-ascii?Q?JRqKZTISmb67YsolvzRZSALvC3uwSfxixxFcDqkA5lmywfBoRc2Wjp1OiHsM?=
 =?us-ascii?Q?/buMwhTxi6tG/W8OANSZKhsVXA1ieQzrWzvjk/ngna+pFOg8mOHfTWDl2ctd?=
 =?us-ascii?Q?2WRsYYxfUGVuJ9t1EZMU9ZXPg63TTs4m6kFuUejNol2NT4ORqcj3PAmQn6fI?=
 =?us-ascii?Q?CjGNlZ8VhwawFJBvEnRsVVWGqtb0zvVheJ0vcQE7AJ1fh+7CP9aYu+gWpTK2?=
 =?us-ascii?Q?LmZqGLu/hQ+izEFK//8KVYl4Kjf2AbtFRkHRZh2AcTMDpQoFA7CgGg2hu71r?=
 =?us-ascii?Q?rsXZS8UshXz7cJMAy8/Ud75WV+VTertEdrLpDZmg1FUGn/RNdD4ZNESxHmCZ?=
 =?us-ascii?Q?WJ0cKkyeTqxJV4wF5fKEyBukI37gPMZn95hbXCqneN9OFlazcgWe7atbfm0c?=
 =?us-ascii?Q?tEEs/rDX3wViysX4GU6Lm38nPcMB/IhGdY27hTyV+5/6UMB7lVRiWSVBEA6L?=
 =?us-ascii?Q?cAKwNrJv4YKfLxszbNVdsKFkQ4MBv9GIzAQl9H//CPMZT1DVL3JwyowyC3Wv?=
 =?us-ascii?Q?ChtuputpnnPo4cys3rpcJUpZVfOILrnKmXtHWM/XY45E+RnKU6H58hK8AWbR?=
 =?us-ascii?Q?0t4lNQX3UWkyHkeXWWj1kXNDUBd8YcoxUZQK/bd33PncST92dq1pzeVVQVLe?=
 =?us-ascii?Q?QRZx3HvkNE6m5ez+RdM9+RfbtLHkEtrjYBAjeZOtFKm+N7zD397s6ALgxO5I?=
 =?us-ascii?Q?kOIQcPqSD2iJ8cO0ojqg9p8J?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1251f0ed-4005-4877-82c8-08d992394153
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 13:14:45.7668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNOltvR5Uw1mI8AqtxAvqvWIA3tG216LWgCi3c6W7ep4WbWVt/G+Fd9EtJ5074UN7REqlarVPdd+jKgiazsSww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5327

On 18.10.2021 15:10, Roger Pau Monn=C3=A9 wrote:
> On Mon, Oct 18, 2021 at 12:18:16PM +0200, Jan Beulich wrote:
>> On 18.10.2021 11:41, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Jun 28, 2021 at 01:48:53PM +0200, Jan Beulich wrote:
>>>> At the time of d838ac2539cf ("x86: don't allow Dom0 access to the HT
>>>> address range") documentation correctly stated that the range was
>>>> completely fixed. For Fam17 and newer, it lives at the top of physical
>>>> address space, though.
>>>>
>>>> To correctly determine the top of physical address space, we need to
>>>> account for their physical address reduction, hence the calculation of
>>>> paddr_bits also gets adjusted.
>>>>
>>>> While for paddr_bits < 40 the HT range is completely hidden, there's n=
o
>>>> need to suppress the range insertion in that case: It'll just have no
>>>> real meaning.
>>>>
>>>> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>
>> Thanks, but before applying this I'd prefer to resolve your concern
>> voiced below.
>>
>>>> --- a/xen/arch/x86/cpu/common.c
>>>> +++ b/xen/arch/x86/cpu/common.c
>>>> @@ -349,16 +349,23 @@ void __init early_cpu_init(void)
>>>> =20
>>>>  	eax =3D cpuid_eax(0x80000000);
>>>>  	if ((eax >> 16) =3D=3D 0x8000 && eax >=3D 0x80000008) {
>>>> +		ebx =3D eax >=3D 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
>>>>  		eax =3D cpuid_eax(0x80000008);
>>>> +
>>>>  		paddr_bits =3D eax & 0xff;
>>>>  		if (paddr_bits > PADDR_BITS)
>>>>  			paddr_bits =3D PADDR_BITS;
>>>> +
>>>>  		vaddr_bits =3D (eax >> 8) & 0xff;
>>>>  		if (vaddr_bits > VADDR_BITS)
>>>>  			vaddr_bits =3D VADDR_BITS;
>>>> +
>>>>  		hap_paddr_bits =3D ((eax >> 16) & 0xff) ?: paddr_bits;
>>>>  		if (hap_paddr_bits > PADDR_BITS)
>>>>  			hap_paddr_bits =3D PADDR_BITS;
>>>> +
>>>> +		/* Account for SME's physical address space reduction. */
>>>> +		paddr_bits -=3D (ebx >> 6) & 0x3f;
>>>
>>> Does it make sense to check for 0x8000001f[eax] bit 0 in order to
>>> assert that there's support for SME, or assuming that the reduction is
>>> !=3D 0 in the other cpuid leaf is enough.
>>
>> Documentation doesn't really tie them together afaics, so I thought
>> I wouldn't either. I was reading into this lack of an explicit
>> connection the possibility of address space reduction to also,
>> hypothetically at this point, apply to other features.
>>
>>> It's possible for firmware vendors to disable advertising the SME
>>> support bit and leave the physical address space reduction one in
>>> place?
>>
>> I don't know if it's possible (I'm unaware of e.g. MSR-level control
>> allowing to modify these independently), but if it is I'd consider
>> it inconsistent if one but not the other was zapped. I'm unconvinced
>> that we really would need to deal with such inconsistencies, the
>> more that it's not really clear what the inconsistent setting would
>> really mean for the placement of the HT range.
>=20
> Thanks, I think your proposed solution is fine.
>=20
>> While writing this, there was one more thing I came to think of:
>> Should we perhaps suppress the iomem_deny_access() altogether when
>> running virtualized ourselves?
>=20
> Hm, hard to tell TBH. HT being part of the platform specification
> for AMD it would feel wrong for hypervisors to attempt to populate
> this range.

Okay, I'll leave it as is then. If we decide otherwise, we always
can make an incremental change. Thanks for the feedback!

Jan


