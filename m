Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCFE484EB8
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 08:32:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253495.434645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n50lL-00036Z-L4; Wed, 05 Jan 2022 07:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253495.434645; Wed, 05 Jan 2022 07:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n50lL-00033X-Gw; Wed, 05 Jan 2022 07:31:11 +0000
Received: by outflank-mailman (input) for mailman id 253495;
 Wed, 05 Jan 2022 07:31:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VMO2=RV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n50lJ-00033R-Bk
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 07:31:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f21b76e-6df9-11ec-81c0-a30af7de8005;
 Wed, 05 Jan 2022 08:31:02 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-ufvvqxvHOwizCwFz2tLCuA-1; Wed, 05 Jan 2022 08:31:00 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 07:30:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 07:30:57 +0000
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
X-Inumbo-ID: 6f21b76e-6df9-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641367862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZeurADfT+LtboVSVm4zvleaXS5CI4koH4YhLOvYJjk=;
	b=iyVUrKdCmZbvW/s1QVCu/Uc5TPcew7GjV0WJa87rz8FTfzQle9gexL3zJqhU8zp1a3FErK
	hPkhBbrVzBAInp6Dx11g9W4YQvDOLov9sGTuqyMlTFPQkl9BlM3mCXCIQiCBIhzAgQ99Pp
	S+BgApKweiISx9Mqbktyqzb+oTuP8Ls=
X-MC-Unique: ufvvqxvHOwizCwFz2tLCuA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/D8sSHj6wYo+szT5BrEh0OcwYbqrWa5tFmDNTp9ijwzfj+eQi9AQ0sC7b79Z56DMCsQ30wrxZK/wecMPx3tMG2zPIA3mO2Tw45pwbnyMMx0L+/ll/ay9/gfbNCBZ1dUkX+taF9+FtoNU2gcKqeDkbiZwoE3rUQLInBVF0Etf70DFxM/llNKbbV+Yt/p7cg3r9Sr2PBAOeSCjp/+X8/JFnNgnmXKtBHJVkVHpRgy7JL83KyXZ15Ii2HI1U3YhwMBCLvctB5pegFYEvSsmbjiwKNH4+9RqQNj46G5mpOX6hP5Lnf2B90yenjglHIfL3iJK78QUCq5OTSCMNN+iwodwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OWzSbjz7WWvMI1pLQNRfR4ujfIx1CWbjr4ISltF/CA=;
 b=kK9NDD2AgGVqppBQUg/hSSgvApae7jz3VCp4gIeD8rfWEVgejXD4POyQtrLyhuti+VT1Ai6uardZpqPj38SBFOpjwgFI6Zv8Ydr1hZbAPvajKwEgmn1ryqU0ACXwxiGlMI6XvXDM+uTd8qQgGr6HGtSdk+jbV9ys8IJpQcJpeOgC0NBw3bxrOWoMGYBgkfn+HMi/6/XI7p47LB49W5NlTti/S8b/RPYUcwwdpQPGEgRlYvQsxZ9gl4So19RVUGeuxSiVFCt3fNdejbU2TIHvx86UQF5eULhqfC8gQ5AzLs4Cs9iP65Dzich5rq5p7ytRHGu57jftsfl0Iti9YI3npw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55f00c70-d1de-a523-a805-0b97b7f57b9a@suse.com>
Date: Wed, 5 Jan 2022 08:30:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V4] xen/gnttab: Store frame GFN in struct page_info on Arm
Content-Language: en-US
To: Oleksandr <olekstysh@gmail.com>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <1638563610-4419-1-git-send-email-olekstysh@gmail.com>
 <ebfaf88c-38a8-638c-298e-a92e5827baf1@suse.com>
 <6f4813ce-5d23-2192-fabc-e933241cf30e@gmail.com>
 <c1c043b1-bffd-f758-f7b0-fd08539550a5@suse.com>
 <f8ac8922-0695-7666-8585-92a089164e44@xen.org>
 <57616176-938b-2125-fe34-4fadf2b4f816@suse.com>
 <74a0ca4a-b091-77e6-ddb4-490d2a0a0f4b@xen.org>
 <6548d378-aaca-2efd-2194-7725aaf0548d@gmail.com>
 <4b4d9543-e7ba-5664-effd-03fc6336f898@suse.com>
 <b4832284-9bfc-d600-14b1-1784f53e5d9f@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b4832284-9bfc-d600-14b1-1784f53e5d9f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0061.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2450f7d2-c513-4037-20aa-08d9d01d5061
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5325AD23BA61565DDF1CED3AB34B9@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M5riwIMxOaf84wOy33Bf3jvY6fDEONG0yFFCbAqyw9wBLTbTM1bi67tenDMaNZNp+Tq9CGBMDb+4BxTjYfWxT3u4d4bl86KWUEq5FrHH77qWuyhFunDnSI7C80cTyrmgV6rbVVZLqR2X0224oMA+JC9L8kGR10WQT4DQzl4Mcg1o3IiNP2FRaEZ12XOZHS3xkPn2YHr7Sjob0QCclMTRnjWf8XwQjtj75ZTJXqdJizP7nPhd9EtKmnxYS9OCwEEf8+cLQwYq9JQ43ApeMzGZiBon0lYYDbPtKgs0Kfsq/kC4k6WOQ0+yc1ximhux6uut4X5Bj6A2gShhnWFs6Gz+uO2FGWGjNXBhxbkW/aa4NJ6Ru2B8me9NXJQNVUxI1O5xCXbwwM2k8XQtg0BlDtqsVYNjm8OnpvqGwqq5hlcCnbOVilzHQGy0Pitr5TSP0ejrQWaqRAO+Bpz+jb02ON9BIqkNQsOFdYxKo1unZ/OaGqsHC0kCJC15XUFr2+93IMXuHfFqPF7dl1ckjFp5EPVeBFqJBbvNqezB41MxWNSnIMHcntMqWSYRj6Jcielvft8UNvpEdxTSHainBq2D+qU+DsV3guZ4hhO3daj6JiNzhmwr9aSHcNHHNQ0NUqp1ID1sVKneeirronb5/iFWEUliZc99FvjVW9XzAbTyhRAvMjJsCiK7CzR6JQGVdY9ry/cllg3SinCc1UCIvNRCd9K1Zq5aNcgfCBSHOoZ78pmyciY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(8676002)(66946007)(6512007)(2616005)(5660300002)(6486002)(186003)(8936002)(38100700002)(316002)(4326008)(86362001)(36756003)(54906003)(26005)(66556008)(31686004)(508600001)(7416002)(2906002)(53546011)(6506007)(31696002)(6916009)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zgAzn4R3JwzyjrSSIn3ydgbEDMLdpF/udmjzEaeMmEQr736CBilbnidV94Ml?=
 =?us-ascii?Q?+XrI4HsNn3WMtUtFt8gTheph1cT+9IZmWt2jepFvpNFB4DkWeF9/ufBRZYxo?=
 =?us-ascii?Q?F+wgnkWTlzkPVtLDLNJB1XqWta95LpXETH12bl0YF+WeUfWCdCUCgXG0NpoK?=
 =?us-ascii?Q?pavIc/avnBPG5G8gAuS3RrgnoEjyF1YyOLbHkQceuQhRUKWx5n722D7+0iSc?=
 =?us-ascii?Q?sKdT0RxdQNcJQDPRYLIkrb6hAZeLSysYoNjWLGQ4KtL6jC87Y7yOkZ6BimR8?=
 =?us-ascii?Q?KdUCG3pbXjDuVloZWR6qqFZT5P9en0RxebQ8UWj0mCA7oVnYauHtFU4NdqIR?=
 =?us-ascii?Q?fQxI7VVceraKckLu703m9WUCyeQoiSXki7JOpfdDoW+YWM2i7B503ec/4xGU?=
 =?us-ascii?Q?E69U1xHnUmkSGfl/9VUCeELvJVNFNUQWY+8cD8cb3oXc6i65cHso+OYV+PtL?=
 =?us-ascii?Q?5N0uHurxkneZ8BfhJIGJOQzP3lch1sOY2UYDQH5+N5rlUYbBP1ABoMrUEn9j?=
 =?us-ascii?Q?dhp4rFJVQU42be8np6swYAoVVoi2yeN4NbgBBxwmnv8A9bWrLAFIllEnTk8M?=
 =?us-ascii?Q?5e2PKvlyYJeUMntyMo247KzuPKs8g6q6YU/jlyNVjU9jL5V4avm07JcA2zTE?=
 =?us-ascii?Q?bVfJ2KeCY+EGVQDTuNM3MtMrzyWTaR4MAP5qp/p30PaYoaBMcwy1P5ZMuSmn?=
 =?us-ascii?Q?8zBHk4VZpSXT/C3pti2JAWaY/wOvab1GqEe6Im693aXgsQzaEAgrXNpTGA6y?=
 =?us-ascii?Q?PZ/pZtsqy60G1qx5Yu22m6RGrsge93RC9lVvnQQ4w0wbW/NtNAsVzPKtsJnS?=
 =?us-ascii?Q?mTj3kpxnydkR92cTiHnf2jWW/bLmUpr59WRlOHdWJgVZGCSIzNIuuExwSIFZ?=
 =?us-ascii?Q?SRoUtEz6ibp3CX9IRXIWEVu8AFBlcyr3qejV0Kv6N1pEafS4OT5+EuXWjXhY?=
 =?us-ascii?Q?Mzckx62qNjdYfWelB/xnVGumr44G5h6Q4ucjePabuCSidzqJNCDuvDt8Fons?=
 =?us-ascii?Q?NRliEjkCYBe+zamLE6E5MJOf07oBulsjXjzKkK4tUlkYC8TjP0G+vYAat/jY?=
 =?us-ascii?Q?4m6Y6Qro+1aua2uBT/PqXgZ9MudMf2tU9sdQGtqLv8HqFPAMNYBBZHrG62qJ?=
 =?us-ascii?Q?66NRepZH17AI0xcHmIe7RZmqOINALyMNpzQjcsPDMpAhPVb5AoHKGENbd+QB?=
 =?us-ascii?Q?wr/iRZkkYUvvig6yl28oqDLSogPxoZNKqHzgF/qPCGTnr3HT8ItJ68o0VSIZ?=
 =?us-ascii?Q?g1Z5va5tvu8MjWjUHK1hnQvnNX2vw54ekqd6rPM5tdo4GEuFJQSc0+YYcsan?=
 =?us-ascii?Q?bP5SlspsY5pPVcsC1+9fPvYAEGdGhwlPpzGcZDyojX3MoptqClnZ6AkU9C0A?=
 =?us-ascii?Q?L3Lo96bm4PCINokzXygcC3vq76ovmGScOVhtunLp80rfnFYpQ1G8tYJuq3FF?=
 =?us-ascii?Q?AGoyvUCLXMDLCNFuZYVQkU++sjhbJTrzBi6Jpm6KDKJKFhaDqkQiWxCFq5ks?=
 =?us-ascii?Q?9yKpW7VOLi7iGmVY+YCTsiAGce9cORWOy6/OmgBKwsqv5f+2/wAu2m1lYBTb?=
 =?us-ascii?Q?A7NOf0xPSW9+eKVFSh0K3/XAxAxZCYuIfs9nAQWi3UtJC3lWUhIVmUB9NFiu?=
 =?us-ascii?Q?s3h5gfdjB4QFQbrvHv/X2JI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2450f7d2-c513-4037-20aa-08d9d01d5061
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 07:30:57.2346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3dqFGClUJo/udYS8tToeAbZ97Lu2d5T17I3ahP9Zy7TgEcyBvyMb7N3MuCsk2HmV0hCJuzuukDfjkEHrA3VXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

On 04.01.2022 22:41, Oleksandr wrote:
> On 04.01.22 10:36, Jan Beulich wrote:
>> On 22.12.2021 13:44, Oleksandr wrote:
>>> I also wonder, can we apply pattern for all type of pages here (without
>>> differentiating)?
>> I'm afraid I don't understand this part: How could we get along without
>> differentiating Xen heap and domain heap pages?
>=20
> I was thinking, what bad could happen if we would simply use the followin=
g:
>=20
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 50334a0..97cf0d8 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1024,7 +1024,7 @@ static struct page_info *alloc_heap_pages(
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &tlbflush_timestamp);
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Initialise fields wh=
ich have other uses for free pages. */
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pg[i].u.inuse.type_info =3D 0=
;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pg[i].u.inuse.type_info =3D P=
GT_TYPE_INFO_INIT_PATTERN;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page_set_owner(&pg[i], =
NULL);
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
>=20
> on Arm:
> #define PGT_TYPE_INFO_INIT_PATTERN=C2=A0=C2=A0 PGT_gfn_mask
> or
> #define PGT_TYPE_INFO_INIT_PATTERN=C2=A0=C2=A0 gfn_x(PGT_INVALID_XENHEAP_=
GFN)
>=20
> on x86:
> #define PGT_TYPE_INFO_INIT_PATTERN=C2=A0=C2=A0 0
>=20
>=20
> Yes, we apply this pattern to *all* pages, although the gfn portion is=20
> only used for xenheap pages.
> I might mistake but I think this pattern (which doesn't set any bits=20
> outside of the gfn portion) is harmless for non-xenheap pages, albeit an=
=20
> extra action.

I wouldn't mind this, but it's largely to the Arm maintainers to be
happy with it, i.e. not foreseeing present or latent issues.

Jan


