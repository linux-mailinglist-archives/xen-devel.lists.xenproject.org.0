Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCCB477350
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 14:37:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247965.427643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxqwc-0004iz-93; Thu, 16 Dec 2021 13:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247965.427643; Thu, 16 Dec 2021 13:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxqwc-0004gX-5L; Thu, 16 Dec 2021 13:37:14 +0000
Received: by outflank-mailman (input) for mailman id 247965;
 Thu, 16 Dec 2021 13:37:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxqwZ-0004gR-Nu
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 13:37:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42b333f8-5e75-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 14:37:07 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-uIp0xxvcO_mK_aUYrGSewg-1; Thu, 16 Dec 2021 14:37:05 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 13:37:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 13:37:04 +0000
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
X-Inumbo-ID: 42b333f8-5e75-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639661826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+dG3AcOhEuEPZHSzaBzdnp78uBlkrDTLtnnmzTW6hM=;
	b=glmPhV7Ct3j0KkxWaAta60w0WbWZAjGxHFVieLANTHCVGJXr/0BX/bj1oVLKXTzgEWWQ2x
	APZaMSw+9kbbLwpixxr7h1I1Px5H9Nb5+UoX4rdQCtkuMl8th5d9o8TOB+4OYbYz5D4OAe
	baFkAFRdpzh2xjbbzsom+HRrE1O8T60=
X-MC-Unique: uIp0xxvcO_mK_aUYrGSewg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MACzCuYsFnXM6L7WpKa6uDN5Gw/Hy/F2d8V70QlFHWgytLFFJIRYpn9WioaLp1jy7oBA+fpbyDXaX/Gu4ary7OR6CghsnX4ECJavsoefimHy6h40Sqgv6TVazx8RcB3q70aJL2DiMMzXp8gnAylJR8X0mO3mzvK136TTgev5UB7MjClTkTiiWrDfTxcFzqWI5lXoDkLQo9qNkLiAB0yRdVO7jbNqIOwfBLmbP3yMo7TjBkMPJHbjd+jbSE7NW+Qftj+uFGyLGeGOeJ9lOvlDEX7sn5DqXoXs7S8NqylnnZZA9dT3+aprj2jT2EHJfjtj0wRDKsj9I/YZP9r0j1VPHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qT7xr7hdGE4XxBPRqmeo2STYje58FlwKMlEugnsgRpE=;
 b=nvrhnWjO9/7a3y+2BHHhLQs9yDa3drsvjInY49gEE/AHRlmGTc3TwwmS+IWSJyvhSBOI6OAxkOP/TYz26mYkM1fzop+UyxTq3f5jtA4xJil6XxBB6MR6Kye7LSahmRa0U7e14V7FIyaCxSD7FWdl0kNIZyeifwztAxZ34VrMyng3tO384oMXaV/NvgnrFLVlp2GUFzkCI+uVckQHKsTe6YL0cZDbiAJ5kJKQX03IUApkUjc2Ju0DIEU9xBJccSknA8yR8uI24GqMSjUDrD9NdG6zl1eYFk84p0ucW1C1U1Zjv3PSCR/o8WElXN27qa91trTl99GVwRsH7z9H2vi6gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b3488523-489e-abb7-59f1-74c86e842060@suse.com>
Date: Thu, 16 Dec 2021 14:37:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] xen/vpci: msix: move x86 specific code to x86 file
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Rahul Singh <Rahul.Singh@arm.com>
CC: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <b8c0e550dde0fd80b2f72e9136a94caab2c3d52c.1639478534.git.rahul.singh@arm.com>
 <bfb2b7f282249cee8b6ff15d424a2b7d823ac743.1639478564.git.rahul.singh@arm.com>
 <YbiP7YlpY22llB5Y@Air-de-Roger>
 <621259B5-E5EB-4ED9-A836-B6E17C0D6E36@arm.com>
 <YbscoZG/NRP6lMof@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YbscoZG/NRP6lMof@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0259.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 529c1df1-e74f-4b66-723d-08d9c0992575
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB484867AC775E03C51B0BFE32B3779@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pMKi5AhiX+2/O1/5wsUV10e5VFvXifF2wXAzPvNm3Px153FgsT5KS+SRHw0YlRNje7Y5qGFVROZqQWijwpW2ZKqoOw1JeHx5YUN2A+ZyEGFYVk6NL1IFt5+25B8DtguSJ7PZFTJuOkTvrjSzVHjWnTDSRJ3kqbHz6H4YL6MAcraG3OfzWFDTsNZ6Yt6qiqeoAEKr5W66ppHDLsSG8HK7isYsSJMur6OQAeE5Hyslj9BvIsp+zRGnTXFis/GGZHGpJAADC5msNkD++wLroT6Okz5Fg1COtMxmSogK2dQPfaDM3H/A0cZlOh4OWlnrihJOXqge9nnNvPmJxY9VNZ1Cwj7wndXhTVixdzuWgs/pNqOLDbjN6IT4dV+D/T0xNk42V9BzInlKq0NXkBdIfZt0T9xywb7itGAujqCVQXwuAPRQgg2iGBrxlskIFzX57LsadehbBIzlZocyxV6xvTQ7HDKWgvVm5Qlz0Ay/m63nWzvRZRinhNejFnADw7D7Akz2tFFkQAgGha1+4iETFCjXACKREqT1mUevdbOuxiMHEMJ8KxW66/WpNX9S7McBdjAd2vk2XXKr8LvP7C8Ec+/8Gke238HVZoRbPSw2K/LtpLWRj05CIugoIcvFAKG84+DrAliD6S0ESbgOc4auY+G6DiqRy468MzEMV30gchfVUg+C8ZT86vSovZVcwRwbgS2kMF5xoE/nSBLpGzWunVG5wm+7Pn1qOE8skmJV8WBCfjR2dZzLeVsWwzX8jPBpz70a
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(8936002)(4326008)(36756003)(31696002)(508600001)(2906002)(38100700002)(6486002)(26005)(2616005)(31686004)(66476007)(66556008)(66946007)(110136005)(54906003)(83380400001)(6512007)(53546011)(316002)(86362001)(8676002)(5660300002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vqDt2v8wKFVOIUDH205pEFD/Welg3w9Yc3w7AxExLSt0gJoxjEqQ3+FPs01B?=
 =?us-ascii?Q?t5odD6Mr4E4vCZO3hFnjnpIiFUffpkdo17wUK+9eyAhQFdSN+IiYhUM5Ixv+?=
 =?us-ascii?Q?H/m8tCqSMwGqnyBgwZOICPPnbbN2GcHimJk4J3gg/WicueIY3k/S7zd3WI1y?=
 =?us-ascii?Q?a6vBFFpRzcOXCi74rWZzaw8sTuanfaYGdPahlD/o4zs0KqeJVKsf8i9pz6fM?=
 =?us-ascii?Q?kJXQY98/xpFPf4WfHaPwjhHuxxin4F9vPdb/hxCMqsTUfeDdfy7nkFlmWMYd?=
 =?us-ascii?Q?89qJpSucsQl9P73X8NhF7xKEghhXr/rA1p6lY3+7cqf64yQblcPgNQHS2evZ?=
 =?us-ascii?Q?J1mf764PLrzjAfj31oR9zgBCmlqrm0ZEWQ2Ns3IM7D85qfLJBxg/0/AXAfUm?=
 =?us-ascii?Q?+Ze4sr8feDlo556lGZQuc5fAQ+xPwAU/3fsra8n/o3QdvAhPSBNFJfkT4nn4?=
 =?us-ascii?Q?7uXHohOmM20C+bM9pcgvdclKFIXwvJOLLAbUKWRbxgyc0heYxx94d6dhHk0D?=
 =?us-ascii?Q?RhvtoscNfH/l0/4/2AAa7pesKr7LqNoFub8WgRiqKNZcQd427mdYwIpOxTZg?=
 =?us-ascii?Q?2rmV0Pv4pjQ/hkaX9CvaoCzJkoPtrb0She9yVQUAKhj/Sb1EHVTmcX52Lx2t?=
 =?us-ascii?Q?NvAFUzjp4SFEkH7MZm1vu9RIeZWr4t/Wlb6YxM8zDansQAvFNjt/lCTqqMa5?=
 =?us-ascii?Q?OP67K9BpCApYBxuph5LC3GOP1Ld3Rdt/x/fharr0rRVFlviCp/6deC+EVR54?=
 =?us-ascii?Q?E0q6pXi4IY3d3c6ss1zkirGjYU79pSliqRl5rLED73Vugkh6cs7Mj+9BjrGa?=
 =?us-ascii?Q?yu55NFrVXmnvjRfO9QMd9bXzUfzviPIYBDHVZcMPp2KlEJE6fHmQHWK9Fs9w?=
 =?us-ascii?Q?YNNH9MFdP0DKhEBAbbv0EW3G7w+RZHM8locp4GlVP1obbfjzc0ng0z2GPOpB?=
 =?us-ascii?Q?qHOfRmLAJfW5Y6lMnkXQMHZhniONL+XnnHtBS29JXQEGhfbw/oxRYq7U2UZI?=
 =?us-ascii?Q?oBP8/wjVaT4jpu+4YKwsZkCzyvyVGnYrb5xoxb0ChP4GO7JJK8IoRRjRdFQK?=
 =?us-ascii?Q?P4s5xTNM0aL3kROtgn2R8BQy+trJE66FSTIU4K1jphispbVs56dzUtYJjbif?=
 =?us-ascii?Q?akOZH+bxbGvxd8Z9FRlnBkJluqH2agDbRlUQj6Jq5RSv/3uZeZm0tNoVIYbh?=
 =?us-ascii?Q?MM5ZjXo0J++lno/pbdJehQ0ulOSAI5ff2/Q/K/yRZKtssWfRQNQL37wvqWt1?=
 =?us-ascii?Q?SjJJOlJLSp1i5nkErhnZ/ePmgeXHyaAkCHG0mX59k6xkDTTbPZkWDyX2ODYG?=
 =?us-ascii?Q?k5vy2D0a/s/DcuOblFdp35PYOTdXpdhPLpp0Ofr5HP+jBrbPgNdw19Kxcn89?=
 =?us-ascii?Q?SOCF6mI25KN0K0WX8BngNuWBBBUzFYjE9FYfJKTV86EjInKpDI0psx80jTuZ?=
 =?us-ascii?Q?U4IoOMWJbrlo6nnOAfw/ryfU5JEWMABoC6Ww4sZmTx4qFHxrzzzCWHjyPFuV?=
 =?us-ascii?Q?yC2+3XlnSL/RLMZI5B1Rtg8uwaXLdTFHpwCJnZQptn15tp3nnzS1kC67UqYF?=
 =?us-ascii?Q?rFJAgfcqNhAFcSd1YWxP1dHXE5zTimYOxX8rZl/sj06vYa21gefXvN5pllgm?=
 =?us-ascii?Q?SyQnUIzPflERqtQcB3Yu27Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 529c1df1-e74f-4b66-723d-08d9c0992575
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 13:37:04.2118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKRTy9dYd8uEpK+ZSEIQlEGs0wtGfodp5AkMCs3NOZuZ3CsNsV7w86lT1kn3U2jlx3SMWORUc4k5gVudhAy0cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

On 16.12.2021 12:01, Roger Pau Monn=C3=A9 wrote:
> On Thu, Dec 16, 2021 at 10:18:32AM +0000, Rahul Singh wrote:
>> Hi Roger,
>>
>> Thanks for reviewing the code.
>>
>>> On 14 Dec 2021, at 12:37 pm, Roger Pau Monn=C3=A9 <roger.pau@citrix.com=
> wrote:
>>>
>>> On Tue, Dec 14, 2021 at 10:45:17AM +0000, Rahul Singh wrote:
>>>> +              unsigned long *data)
>>>> {
>>>> -    const struct domain *d =3D v->domain;
>>>> -    struct vpci_msix *msix =3D msix_find(d, addr);
>>>>     const struct vpci_msix_entry *entry;
>>>>     unsigned int offset;
>>>>
>>>>     *data =3D ~0ul;
>>>>
>>>>     if ( !msix )
>>>> -        return X86EMUL_RETRY;
>>>> +        return VPCI_EMUL_RETRY;
>>>>
>>>>     if ( !access_allowed(msix->pdev, addr, len) )
>>>> -        return X86EMUL_OKAY;
>>>> +        return VPCI_EMUL_OKAY;
>>>>
>>>>     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
>>>>     {
>>>> @@ -210,11 +194,11 @@ static int msix_read(struct vcpu *v, unsigned lo=
ng addr, unsigned int len,
>>>>         switch ( len )
>>>>         {
>>>>         case 4:
>>>> -            *data =3D readl(addr);
>>>> +            *data =3D vpci_arch_readl(addr);
>>>
>>> Why do you need a vpci wrapper around the read/write handlers? AFAICT
>>> arm64 also has {read,write}{l,q}. And you likely want to protect the
>>> 64bit read with CONFIG_64BIT if this code is to be made available to
>>> arm32.
>>
>> I need the wrapper because {read,write}{l,q} function argument is differ=
ent for ARM and x86.
>> ARM {read,wrie}(l,q}  function argument is pointer to the address wherea=
s X86  {read,wrie}(l,q}=20
>> function argument is address itself.
>=20
> Oh, that's a shame. I don't think there's a need to tag those helpers
> with the vpci_ prefix though. Could we maybe introduce
> bus_{read,write}{b,w,l,q} helpers that take the same parameters on all
> arches?
>=20
> It would be even better to fix the current ones so they take the same
> parameters on x86 and Arm, but that would mean changing all the call
> places in one of the arches.

Yet still: +1 for removing the extra level of indirection. Imo these
trivial helpers should never have diverged between arches; I have
always been under the impression that on Linux they can be used by
arch-independent code (or else drivers would be quite hard to write).

Jan


