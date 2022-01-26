Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FA449CC3F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 15:24:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260947.451284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCjDJ-000191-HB; Wed, 26 Jan 2022 14:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260947.451284; Wed, 26 Jan 2022 14:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCjDJ-00016Q-Dg; Wed, 26 Jan 2022 14:23:57 +0000
Received: by outflank-mailman (input) for mailman id 260947;
 Wed, 26 Jan 2022 14:23:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCjDH-0000Yt-RR
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 14:23:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 978e4185-7eb3-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 15:23:55 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-9KxIjXVWPqydTSs66X5KZg-1; Wed, 26 Jan 2022 15:23:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4768.eurprd04.prod.outlook.com (2603:10a6:803:53::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Wed, 26 Jan
 2022 14:23:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 14:23:44 +0000
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
X-Inumbo-ID: 978e4185-7eb3-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643207034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vdb1dxNEwQaFi2SDKw+kCJTaliH3z8aVddH2kwCDr/0=;
	b=ah/uE07shsgnFSbwcjjDoNQk6m7BrHqWY6FVHM9d83HuRJdjIEXXHwUPzLR2Iy22MniXFz
	5wqwdYjRDKA67KabpvHnYX2EyVR72T1sJ/duFRenDAUSRszc3fwaxGSyM3oJkdls0NG0d7
	yFISnfrmpwOtua2H0f3iK/YfxPAp3GM=
X-MC-Unique: 9KxIjXVWPqydTSs66X5KZg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCciht/pRBsKppdtHh9Zs3XlT/ND+80JsqOmZiEcaJHB4bXEnMKbthkmsu7PLrjdmXrwmxg7MKR3iNXhQ7eUh7LWnDPIAb+YJF+gBux1iI8tHoZolQ3ZQJTDFP8pZaxYbstVe+UeKPz0FUbLjZ90zQqJEU2Jl8Kk8z/YN8DtHGFyttcpYEfG6NNIbumteClMKLl5CXXqxV3o3iKMRc5JoavY7Ra6CcR/RQWvoJylSxt0AR9QMGpN3SUXvfeJQ2pdpEzh/VW6zbmfcwYZlaVtROeGoITDMcKAiyPHD+/1brrahul9TWqHIwX13wWhGLCOB7jSoTFcMUirv498k0bXRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EQUvQO52vUIc+P+KFB/8Q4U8OUxQ8stHr3t3oQUBB8=;
 b=ZIlRZDseG0OyzMd+NyaGt6WdnJ1Jsw51NfxsvNhFeW5W+S4SHuvsztf+G9TJXNCHgkSWZExofxgIBSo56k7tfZgqIvpbd3keIj7AKRxfzfWvLCNBZQk/PRaRQqrdrx1qu4T7atODz6uHFkNMEr/rogYdQOFYH+n5o2rJ83YuULleXKMtzl0HXGKgKQZ5nTf+yjuN0pjTSamlwk4a8xx68A/IYkl9HdnJ1mqaskDxhOTVswLAN2GIFwb5e6UFVLd06RkZeXqMQ1LhrmhbrkmdcvjCX+FgIx1diW+7tyr+MPI6B/EeEaRxrZPg4wDm3Dfd00Xn3m6fzZqOG0MLagPc1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <21e443f7-ce72-af39-587f-6e40e72625a9@suse.com>
Date: Wed, 26 Jan 2022 15:23:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] xen/vioapic: add support for the extended destination
 ID field
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20220120152319.7448-1-roger.pau@citrix.com>
 <20220120152319.7448-2-roger.pau@citrix.com>
 <5f8d332d-1bc3-af71-27ba-a4ff7b6e9514@suse.com>
 <YfATkz+nse45Vg3C@Air-de-Roger>
 <a984ffd4bbadb1cf550e7a980f81db250b3b69c1.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a984ffd4bbadb1cf550e7a980f81db250b3b69c1.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0200.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4915faec-b79b-48db-2fb8-08d9e0d77597
X-MS-TrafficTypeDiagnostic: VI1PR04MB4768:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB476868B5C6BDFA64299E8F74B3209@VI1PR04MB4768.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qvs83qtlvwUS6W1tm8RMy6Wq6h9KP2jtMLIIY2m5bBoHZOpfoS/p/03FM3z58sIxasKuolDxMBBcjN655dfB6jrmYjK6e6v0CXwdzi4pXPaotH63j3QN9s1iI0m0kj/mHqoQCZCKt5S3CkzzHafPlM+82u0r0n0OzcqwcgXOwJwD7GKslPAfKcAIhno60fpRQg04t2mGgK/c12CVm0nGTIdWf8Mmd8YC4PTBXmefRLdUXT45/HtfbEISBqc/S4lOBUuOoBKl1Tad8OqYUbOmj1jWJAVy84uFW+3sXBK29qqgVgihbmJbflBByCBeIVKGBLGyb4BIxAbooklnPeaZRAja4LSCUitRhA98e6tt7vQiRMzd7wkvazF0cbtBAdQTQ08yMSJ5yJGUqSfAjst99i1MAMHmN7v3ldEsIeRDQbAwrwjKDk3socyle5Xd0BV5TPfB73qYn/jixqUaTLgLYYkk0mD+vQfMr4WZRcPTTCzUg6/bom34P//Yl1wGU55M19AcpFc2vyRAC1vSjpyY+oJTXZ7PmujM8wYzCWwSabHRERTMGXl17GHf2acb6wowvqmg4pjGQPNlwC2/VRSJP0gR/1HdKWNMz3C1M8LCqo3PbSFLbTkOGXN8FLMcNFOuCBIMt86PxWcH0ITwF0lwAO8OVyHZv2p0vf8xk6VkPXFoDupMuOAHH4dRKmD6iOiIXSzyzHH3xN9MFAS4XIv/QHeV8x1GVe3yXTZiC4LK2Jv9TOqCH6CTl3hoHAjOuCFCkGQaGmt3B2mohTvkhEmoRHoYTMDzkS7HvR+BdZARwn7ZEeO0FDiCwimxkURyjOfu1ZupmSsnwmaMAR60whmrWazJVh7tGmA7/ycqVuRojfI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(45080400002)(36756003)(4326008)(508600001)(8936002)(66556008)(2616005)(86362001)(66476007)(31696002)(53546011)(6486002)(186003)(2906002)(54906003)(8676002)(38100700002)(6506007)(26005)(6916009)(966005)(6512007)(5660300002)(316002)(31686004)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ewvWpZCmPG+ltmSTWqVfmrFUOpJL6a5lvF2dprct19ohxl5xDhUXpJ8+saTl?=
 =?us-ascii?Q?IIczq9F08AMVB/jWHRaZlG7NcHVjH1yPsKrHgE60e/nqbt3kA+qNPpwO5bB6?=
 =?us-ascii?Q?7aLf53fFEU/sFYQ4qb4o8LJLiDVlbhElCpZ7aBHjjUOUyBk2a5J5LmA8RmB/?=
 =?us-ascii?Q?gzgbvB87mfJmXmsn3Xst/a0x/pEQRJvCEQl+cwHhfc7bu35y697Y5rxz8Fyp?=
 =?us-ascii?Q?2/VlVqB6+JFibWtcoAZgEkQbNiTIxod9xU7yREAfw/GH8bRrvQJh8VxA4UTL?=
 =?us-ascii?Q?70iSYUCnPbjOwyKSNK/S1hmRfnNvD2XnpwuhCn07hrQZ6mQETmlzAkX6YPM8?=
 =?us-ascii?Q?HV9khloJDd9iVc3WBIBFe/d31fe5MwVEv36/2/k0dFqA1/9mIuIL7jQTZ2Zi?=
 =?us-ascii?Q?7HILuHQGtnIL5ACk5xoHIod8+S1y4S9p82mIf/llWoHZJRFg+FOtf9fYI+Ob?=
 =?us-ascii?Q?LE89uNr/svc8Ops0TvDHwYbdRNTzZPX91R+haz9a8t9L7Aiwh7yryfw6yOzV?=
 =?us-ascii?Q?guFEHloazWc5F4ANoXMwTOfsBUB97pZrxuLq14kSCmwXTpmg8not/AWtyY1e?=
 =?us-ascii?Q?M++RCqDg4kIO5KY5AoDkIkhzHe3rxq3zxeMp5AEUphenWK/W5yH5X4D5sX2F?=
 =?us-ascii?Q?7fWfjT2NtMsOlM9396HBW8ni/V1j9xwqdJkxHzXGw81+xdy05RwjMxDZqgzX?=
 =?us-ascii?Q?WyZhAw3kIuFDKIJNcd27i+ouAwJC+ezHIEj8x7C6aUuCgIz1w9YpHOMzw4Fm?=
 =?us-ascii?Q?tyDhnhqOSlfZJz2OHEdU5urLAPjRrA7LLvG1T9Au+mej8iVXRsZz/qdFu2Hq?=
 =?us-ascii?Q?jR59/Xy9ONziEiTFdUxXxuLn6OE+r+dnKUUN++AIkfWRDgON9KW6w94wIVov?=
 =?us-ascii?Q?P0OeeQX992MEGsDUgHaVdXrpU22vVyxAyRHTzWblwGps2XnzD2ayL0fioi1B?=
 =?us-ascii?Q?5+XIHaOTXB4hKDifD4G3NsaL177vAtw2S3Pkbrh0ue7e5PZZ0sZ0X3GWDncM?=
 =?us-ascii?Q?WxVeEYyMraPe8kraXdXQWhRb9WFc6SkPuKDpgUUPnuNRWoVKZQhXsdBTnNvM?=
 =?us-ascii?Q?4gi3AeGS5TaSQTx4rO9WnsAfgvVxx7X4F3BN5bzjodkYQzfrVwhggt6G2GmU?=
 =?us-ascii?Q?Y+r1MxKB8+YBUrFBMZhdodV+pxxlIL4Cj/D6jlZ0zwTlE8aOK7g0+AlW7TDI?=
 =?us-ascii?Q?QC54wM97UhipbHuxWd1klTvikV7mPIeQ+AIE2XCTLU5nrJ6rkP4Wpf6dT+k7?=
 =?us-ascii?Q?nnt+AbODRjdaEbHV8BRc+l+lbxDPj5sP0qzvb2A6qRA5Zf2iY1vB042qxd9m?=
 =?us-ascii?Q?5bz8qkkipnddBcjcc5TjQ/jugGKTPXzNS8BMfkBLFkqir3c4x5byfdhX9Yf4?=
 =?us-ascii?Q?AGb+8C57jClJtaZssAARQv6jSE3Iqg2XwxK8uZGIk9mpqAcp7F3PGG9HVOcw?=
 =?us-ascii?Q?JMJ0qjl/zY+FMvSUJywh6Vvn0QT6jNpRPxWFAECaxs5zoJF1WDUu/azTkoge?=
 =?us-ascii?Q?r+bEl5NRm/RJ2ZoIzZhiR32j7tjUc27qwlSz6zaA6wJ2qjIPgdOFhoX0yEtL?=
 =?us-ascii?Q?aG5LFOVvNoqWLjF23bw8lME51sOAolw/MEARR2m49+MseNIpEDB7DWuVuyGF?=
 =?us-ascii?Q?CsTHtPMBuTBOD+Paea7hIv4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4915faec-b79b-48db-2fb8-08d9e0d77597
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 14:23:44.6318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCSSc3vYGkMnVIB9ECMv/nBEs1+RAJ+xTeZlUt325LmGEiPdL8LLj8TkGnwMbP6qRVs47fG1Fw9XHlWeJw3ynQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4768

On 26.01.2022 14:52, David Woodhouse wrote:
> On Tue, 2022-01-25 at 16:13 +0100, Roger Pau Monn=C3=A9 wrote:
>> On Mon, Jan 24, 2022 at 02:20:47PM +0100, Jan Beulich wrote:
>>> On 20.01.2022 16:23, Roger Pau Monne wrote:
>>>> Such field uses bits 55:48, but for the purposes the register will be
>>>> used use bits 55:49 instead. Bit 48 is used to signal an RTE entry is
>>>> in remappable format which is not supported by the vIO-APIC.
>>>
>>> Neither here nor in the cover letter you point at a formal specificatio=
n
>>> of this mode of operation.
>>
>> I'm not aware of any formal specification of this mode, apart from the
>> work done to introduce support in Linux and QEMU:
>>
>> https://lore.kernel.org/all/20201009104616.1314746-1-dwmw2@infradead.org=
/
>>
>> https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dc1bb5418e
>>
>>
>> Adding David in case there's some kind of specification somewhere I'm
>> not aware of.
>=20
> Indeed there is no formal specification that I am aware of, although
> it's vaguely possible that Microsoft wrote something up when they added
> it to Hyper-V.
>=20
> https://lore.kernel.org/all/20201103011136.59108-1-decui@microsoft.com/
>=20
> I had an internal doc which.... looks like I can clean it up a tiny bit
> and then share at http://david.woodhou.se/15-bit-msi.pdf if that helps?

Thanks, this at least puts us on common grounds.

>>> What I'm aware of are vague indications of
>>> this mode's existence in some of Intel's chipset data sheets. Yet that
>>> leaves open, for example, whether indeed bit 48 cannot be used here.
>>
>> Bit 48 cannot be used because it's already used to signal an RTE is in
>> remappable format. We still want to differentiate an RTE entry in
>> remappable format, as it should be possible to expose both the
>> extended ID support and an emulated IOMMU.
>=20
> Right. I chose not to use the low bit of the existing Extended
> Destination ID because that's the one Intel used to indicate Remappable
> Format. This means we can still expose an IOMMU to guests and easily
> distinguish between Compatibility Format and Remappable Format MSIs
> just as real hardware does.

Well, with the defacto standard of using only 7 of the bits we will
have to follow suit of course.

Jan


