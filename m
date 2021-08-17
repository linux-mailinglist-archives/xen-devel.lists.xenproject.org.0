Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C01F63EE8EE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 10:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167668.306074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFurp-0000tF-RF; Tue, 17 Aug 2021 08:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167668.306074; Tue, 17 Aug 2021 08:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFurp-0000rD-Ny; Tue, 17 Aug 2021 08:54:41 +0000
Received: by outflank-mailman (input) for mailman id 167668;
 Tue, 17 Aug 2021 08:54:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFuro-0000r5-DR
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 08:54:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93ce1501-f7d4-4ec2-a9f4-643d33fc9735;
 Tue, 17 Aug 2021 08:54:39 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-a10DEB4YPly2ueTc8qBdpw-1; Tue, 17 Aug 2021 10:54:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Tue, 17 Aug
 2021 08:54:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 08:54:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0008.eurprd09.prod.outlook.com (2603:10a6:102:b7::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.18 via Frontend Transport; Tue, 17 Aug 2021 08:54:34 +0000
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
X-Inumbo-ID: 93ce1501-f7d4-4ec2-a9f4-643d33fc9735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629190478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JP8bd26S0voPoW4SfQeJgQl+p+o6UAAu7PEdwhTSrRY=;
	b=jbguUUJSlM5kWC4z4pkUSMLhfMGKU4n9I/t8fh+APuJJ2fSesdSENGdNDbbkdnVUoeiln0
	zMM6A7y7B5oNB6gNgAFGs0Ibci9NGoqnyw7amffXbUI/mMvLHpb9NjpXvHsKKEe+/mmlP/
	0RoT1FjumpPjzCLkg+Pcl90Z6jkI98s=
X-MC-Unique: a10DEB4YPly2ueTc8qBdpw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HF78aJywQync96xqZfNNR3pCDm1tnOg1wNcCIIZkAx6AxY3gMGVaWHf0zwofx5fsRapeXjUfAvo1EmwTG8A55i+xHP1yGtMYVxrEu54ay08nauyOu8SL5vClw42uhszygmIS66DbE/H7G/4smE3LBF7F3mDjzM9xRv6H4tpBflyYdaIRGOcPSk2tOPKWhoOmPkt3PvP/VQQNKdxrH1oN8O+UT3a/h+PJMQwfyT7wO33Kj02IDSXcSh5xO4FAwS8EE5b+7K/4KkdTpWflq4N+00FK9eP55ps6OBKWZnec41gYfVm7m4nxVVhXeB3xTWjUAh9EPIyspEWL10IBrFMxVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LfvdRzTfmYiHVI6p1QEQSUPiPwNPLwto82B1ifRIjk=;
 b=T9efgc7pIKujChK/mV/t/XPBHMJRK3iRVN/TIvKV8mSp+g6FzBVSfhy91GLm2crNqM37fFDFAIl9Wn/2owEu6SbtMdjxCJC4UvmAqNmIdbN6jYuU+UsC8c529oHLEKk9jCMaTtiTXUWMxZMP+T8aDRmnbAFpEQlkHiNGY+OLWVtrRKe5d0zVj5aQ9PrZpWmDou8G59d4NMJ2CxsU7vkgQLxCdC0C4CcK1TSxB/30RJQKhBee8JJ3/gWkgtsZ8kvT0MBxzXM9z01/DXWdpvaudO8Ll+UyoUs9Sh4YRZvaGf/abzBo+3Bmc7y64dqaMjqwJsusFgBKelrBcd5S+eAFaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/PV: assert page state in mark_pv_pt_pages_rdonly()
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cbe46564-74ab-af38-7e31-2f0a3f46ab41@suse.com>
 <d72d072f-d785-f90b-4e91-5ef7e8f17862@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <14de6486-a1be-156e-f2e8-e82dd35d231c@suse.com>
Date: Tue, 17 Aug 2021 10:54:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d72d072f-d785-f90b-4e91-5ef7e8f17862@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3PR09CA0008.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebfa4ead-5ddd-4b39-8f2f-08d9615ca2cd
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4608BBF4BAC26A23D7AEA175B3FE9@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BO26+k5FYU/JOX9qg0hzf9WjWFmxMRocy7is4k31E1YrM2i1IkYMjlwNho6gp7pXyeYVznGCxPyIa8X1tmEmdjDtaEHpda+RTULnubvHDhdNEbO+Mv+eTIZCYecCvvJlRiE+Jf+t7DBfC1MEIz8R4TjphE9xc9OQ6ow2i7uv7fEIfrN9ImBDYKxrO0/9GrqNp9xBHA4EH7+L5+CL3b7r9TVjU0ylGQJ//lO8v8AAEueTLAADq+dXpyZIUp3OBq3L29iIOhD9g8oUl3t2bZay6+XqgGGUCMHxQs28KP8ed5fzwVC4uEEVkkBktaanz+yq1qh8lhyHMxyBphEt+gsk8ltkRXlKLoDHeIzqyGm8Qa5Hns3/sX9SrhZ0BceO/tGGOIztJqHTNHAVuASkQW/OayNEflmjPnnUyExSPY5GHKc+pjZarVoVxP3RHBFT1xMIXztIoWGw1DRZsPnms3vFPrKyGw1W7ArjaPFa71x7PcagwK/bTziiUCHGyP6PNi9oJ01LRwy1fdftI4YJsd57ph+kvbWucXXolQ+n48q3HE5LsJN9HMVKgkPoMwHB1jp0P1zqpn1+i1YxW4bCep3aY8ejmnnl8engXhf/zEm2sv/8oN0FxG1nHMaW/uc2j8kwHSl6atYGzEzzZ0BlvCuQSnZM67maqbCygndvYpxXmJhyPOf0PW6idzdQeYxwPWubIB5KhIXZRA5ot/VXLCxPTw0AYbHPTmvE/nFcI6EXCW95USC2h9Jozxbn3dV3yIz+0Fl7iprWsRNUASlBlRUHnA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(39850400004)(396003)(366004)(376002)(66946007)(8936002)(66476007)(66556008)(86362001)(6916009)(6486002)(8676002)(2906002)(31696002)(2616005)(956004)(5660300002)(316002)(36756003)(4326008)(478600001)(16576012)(53546011)(38100700002)(26005)(83380400001)(54906003)(186003)(31686004)(45980500001)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PWE97eZBYzNaLluMA0z2+n8dS8IXp3Se0vOeQi/h4o+JaPSHqz+cDgWiyNsL?=
 =?us-ascii?Q?1WW6k94TwpZrOwouq+zD09drthkcO/xwWogHCbJtT+aK5CXvfARbsd7MiTsz?=
 =?us-ascii?Q?31SxNQa3Hx3eG+xlZxHpMhz0AsB17+/sA61mOaIyK5raMY5uZo5+SqJKqBRg?=
 =?us-ascii?Q?QwN1aXv7gXk/6x4mqsvu0U1xIrrgXybRfn05kTJd0H7Lu5rbxVFwFFipmJob?=
 =?us-ascii?Q?8Ex54Zz1XPjkQRdxNIBpjbCFboitSI0wPudOUBrceIOSDU0elzDtl5OP+xCT?=
 =?us-ascii?Q?uaxH+pRbPTz1Xd1l47SGVY6lR2cNULiz1WeFhjNQGETD56fkf1x4akzTPYSO?=
 =?us-ascii?Q?CcXHiISykdQsWcNfyxVF14N6hB+8SSXQxSMfS/9BMszASnBAb0zWCqzzr6y5?=
 =?us-ascii?Q?nrG8EWZoNKcssIA5TcOdjuLFPZhTDVqlR6BxAL4IBwXTqudymMAnxKB1Vz0T?=
 =?us-ascii?Q?0lpPCD5MoitKqV7UZNC3xHmgrMLnfwT2qhZ9X69BwFdsVkNvdNv6TsBa8B0G?=
 =?us-ascii?Q?IW37jTlNrsZhLkU7dAqnTb6eGLTZu1nP5WnwfpBrlx1y33nsIs7ktXH/Lc6Y?=
 =?us-ascii?Q?ZgdSNbupbP0kq57tZ7Yb+4ZpLZnaV0hOMXb7hRWDzaZ+r5Xw1d6DQ53NmXMg?=
 =?us-ascii?Q?XuOC6JQcqhkWQi653hi+ksIqkz5DwjLY509+FHoP8ufykprX8jVcnNkgACEM?=
 =?us-ascii?Q?oz6RAZB4xBVIoah4dRTAmOYjmZSESkGcTAAoGGvULJh0et34cRPxdNPwaL//?=
 =?us-ascii?Q?bm3kee/8jYMODFHp4CF+iIEjLjnxabt6FzHwKIHiQZlFGSzyQIiRZ7SxHBPC?=
 =?us-ascii?Q?Dhj1tLgq9MYsg2wGQQr5yuBcqwnwZyjdn40R3FcTGNqLRBDTgB3hnB/t0+rC?=
 =?us-ascii?Q?EvO57k7oYo8DnOdoUAiVVsGSUywJs+vkBaYW7I2TF/kyIQ3OM+tinmWroVbM?=
 =?us-ascii?Q?TH5BJKvyr80DhUlHgng2u1xZ6KiVeAE36VKRP93tzWZcM3klPujw1eLENh15?=
 =?us-ascii?Q?2I0hTZLKHwxRiaAsx7zhSvmc9W+nTgKjIs7qUYEHEj6PRBzuBbHBDN+TS5bT?=
 =?us-ascii?Q?Wl9owpAjCFB/RxSKyQiJnujlGcg3OWI1OSAuTFKl8jumq7kVQSUexvlWqNxR?=
 =?us-ascii?Q?hD1PVYkbXXh71H43DX8R6u9oy7m6gqPRfIUBlNM8wM2diBTxe+oVejr3zW2f?=
 =?us-ascii?Q?h/IbBaGSD6YAg8YMWwzGcrlxEJSW6lafqzaDO0WDfhzq3h5AB7ysS81PqsnQ?=
 =?us-ascii?Q?dtnCCYP4K03VKmWD9MVh2exNtehm1ge/3/GnP8xNCf81Tt9FQcaRcZY8gFKm?=
 =?us-ascii?Q?fSjTcsF0To8Ely9uTpE7s8ZS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebfa4ead-5ddd-4b39-8f2f-08d9615ca2cd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 08:54:34.7031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3m4AnzlEn5otulLVtUzSrwjwPW2FK1mjqOoXZcebH31cOv6RTkuJd6nBtP0D74gWQR46jzp46D8oU8lRziMr6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

On 16.08.2021 21:25, Andrew Cooper wrote:
> On 16/08/2021 16:29, Jan Beulich wrote:
>> About every time I look at dom0_construct_pv()'s "calculation" of
>> nr_pt_pages I question (myself) whether the result is precise or merely
>> an upper bound. I think it is meant to be precise, but I think we would
>> be better off having some checking in place. Hence add ASSERT()s to
>> verify that
>> - all pages have a valid L1...Ln (currently L4) page table type and
>> - no other bits are set, in particular the type refcount is still zero.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> There are (at least) two factors supporting my uncertainty about the
>> "calculation" being precise: The loop starting from 2 (which clearly is
>> too small for a possible result)
>=20
> 2 was the correct absolute minimum for 2-level guests.

Which has been history for how many years? The minimum for the
current implementation is 4 afaict, and ...

> XTF kernels don't exceed the 2M boundary (at least, not currently), so
> they can be mapped with only 3 or 4 pagetables, except:
>=20
> * 3-level guests are created with 4 L2's for no obvious reason.=C2=A0 Thi=
s is
> nothing to do with legacy PAE paging, nor with how a typical Linux/BSD
> kernel works.=C2=A0 The requirement to make 3-level guests work (and even
> then, only under 32bit Xen) is to create a PGT_pae_xen_l2 if not already
> covered by the other mappings.=C2=A0 Any non-toy kernel discards these
> pagetables in favour of its own idea of pagetables.

... could be 3 for 32-bit Dom0.

> * v_end is rounded up to 4MB.
>=20
> Most XTF guests will operate entirely happily in a few hundred kb of
> space, and the same will be true of other microservices.=C2=A0 The roundi=
ng
> up of memory might be helpful for the traditional big VMs case, but it
> isn't correct or useful for other usecases.
>=20
>> and an apparently wrong comment stating
>> that not only v_end but also v_start would be superpage aligned
>=20
> Which comment?=C2=A0 The only one I see about 4M has nothing to do with
> superpages.

The one immediately ahead of the related variable declarations:

    /*
     * This fully describes the memory layout of the initial domain. All
     * *_start address are page-aligned, except v_start (and v_end) which a=
re
     * superpage-aligned.
     */

I see nothing forcing v_start to be superpage-aligned, while I
do suspect that the "calculation" of the number of page tables
will be wrong when it isn't.

>>  (in fact
>> v_end is 4MiB aligned, which is the superpage size only on long
>> abandoned [by us] non-PAE x86-32).
>=20
> Tangentially, that code needs some serious work to use ROUNDUP/DOWN
> macros for clarity.

Agreed.

>> --- a/xen/arch/x86/pv/dom0_build.c
>> +++ b/xen/arch/x86/pv/dom0_build.c
>> @@ -59,6 +59,10 @@ static __init void mark_pv_pt_pages_rdon
>>          l1e_remove_flags(*pl1e, _PAGE_RW);
>>          page =3D mfn_to_page(l1e_get_mfn(*pl1e));
>> =20
>> +        ASSERT(page->u.inuse.type_info & PGT_type_mask);
>> +        ASSERT((page->u.inuse.type_info & PGT_type_mask) <=3D PGT_root_=
page_table);
>=20
> This is an obfuscated
>=20
> ASSERT((page->u.inuse.type_info & PGT_type_mask) >=3D PGT_l1_page_table &=
&
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (page->u.inuse.type_info & PGT_type_=
mask) <=3D PGT_root_page_table);

I can certainly switch to this yet longer piece of code, and ...

> and
>=20
>> +        ASSERT(!(page->u.inuse.type_info & ~PGT_type_mask));
>=20
> this has no context.
>=20
> At a bare minimum, you need a comment stating what properties we're
> looking for, so anyone suffering an assertion failure has some clue as
> to what may have gone wrong.

... I can certainly transform the respective parts of the
description into a code comment.

Jan


