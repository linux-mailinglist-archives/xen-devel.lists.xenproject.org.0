Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A674D1A0A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 15:09:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286958.486688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaWi-00061T-Nj; Tue, 08 Mar 2022 14:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286958.486688; Tue, 08 Mar 2022 14:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaWi-0005z4-Kc; Tue, 08 Mar 2022 14:09:24 +0000
Received: by outflank-mailman (input) for mailman id 286958;
 Tue, 08 Mar 2022 14:09:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRaWh-0005yw-Ky
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 14:09:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a7826f2-9ee9-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 15:09:22 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-TBtekXNhMkKR5xkGE_ocWA-1; Tue, 08 Mar 2022 15:09:21 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB7587.eurprd04.prod.outlook.com (2603:10a6:20b:2d4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 14:09:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 14:09:19 +0000
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
X-Inumbo-ID: 5a7826f2-9ee9-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646748562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqFpwMVaaHtBwxpxlT9zCnEHC4fQwNDo09WF5geo22A=;
	b=ZM+WIbaMvUZEC3UJvifcgpOp5UoLumial1H+rftz1nK+bDeuRkDxLH3bY/2YvRAb3W4TSB
	fZBWXSBBH7P1PBYEB73/XvXxgoC0quRaKgjl1uC0w2lX8WJU3NlLqzvIbFbxJh3it5ZA/l
	/qiT0ewvwnQty5RQXoBDFtcptJAxf64=
X-MC-Unique: TBtekXNhMkKR5xkGE_ocWA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RH5VwSsqtXpEGZSHRhaE0zxf07333Ue6SPgpmyuWT/PwxhgCX3LJUSSE84Drhc5VIUPO3+NL5ySWJmt6REjE7AHrKzfF4eV9E6XnDeTtzF6kzn6MW+ckjdO1EwC5vBUqY20uiejxFVkcCmPg/DzFtQDySn5RaIs8fwvzX2DdEdPHRXB546iqoV3DUwEgDEIxO2SpnvG9Ebx2xczrBbKKEjEZxQHJ5nQE4qFvsMx7iMf6tPnPzCtlvQ4XRv+jPQGH4cl45vP1ZFGtaxOZKNoXu4l6M2VVD5YnbNe+Nz8WyfrNa8GI8luLjoVxfA6y+sX2eZXnSGIcZ6Mkl+Ysl/qEkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JK7dYbPoaOvY2W2fPUp4TZDuAmm380qLNAj/t/k07nE=;
 b=JA8PgQ7LuyRnpf3ctu2Xb/8FaIdAKAufJ8fUGc9anLMIixmMxfgpZTYwNEx/lPVYwbiGjaJcRx2t1TDC5AGP97brhE+hrXUHe2qd8oGYt+Ltgth/Z8Qx6tNUNhI2k2JvauMR4Cs11qOyMos40+M6+LwfzNIcBDpM9sRRBR8CveOoudbC8aBvsUbKobo8Cuto88FXFjop7RWzuDLH79UXyy9moXMOYZ4Z2+WnGzPuKoMQb1mjQ+RfQNzP5UsUVFvkFCucWFHXrZV9KoyNYFuYLwVBKDExfk2gLHyljkUpg5YZEw3CoxsGZYvc+xoLGHuIcO1ZwWXRoceGZVFSMyBZGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c35415ef-b3c1-cc1c-2fb2-aa2de2602cd5@suse.com>
Date: Tue, 8 Mar 2022 15:09:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 2/2] livepatch: set -f{function,data}-sections compiler
 option
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220308134924.83616-1-roger.pau@citrix.com>
 <20220308134924.83616-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220308134924.83616-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0502CA0004.eurprd05.prod.outlook.com
 (2603:10a6:203:91::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2253cdf9-e251-4ec9-bf2b-08da010d3d1c
X-MS-TrafficTypeDiagnostic: AM9PR04MB7587:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB758752693A3ED0A07B93EF79B3099@AM9PR04MB7587.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z6+NAP3Yux9YGLE+7vHfPXgwi3FPpjmSIj2hzGiwhiYHnuM0J04BXlrhxsdOU2IXx/qBOph54krsK1lXAhumSJGwQ9tLoxBXySHs1cki0YVAwrQGYzzPbqwpd7vOWjVUer2w9Rcaajt1QibWqRaBx+SERECZ/m0cOBaBLkQi2InxWXzlZxRi/eTwlK/tl3JzXuv3FoB0bBekT628kZge3T0Eb8JVD1QQmshurJrlcW5ORXIR6qN67Lti71vyUx4Sn2SCy95C1/K4z59zZoHeEXmGlXJqqvVLTwONG4lLb0vIBx25wTve8W1NeaCK9yPBBf0kQp6l6wB7uTAO4MneA7Q9JR7ovlIly+JzNTmteZKc6czhjTmrE+lrew40ARorjCrcgDzBLshZSuOjNISFsIKkrNo0kdf1owrtA6m/cub+JPak0jycpwCZedFNvKAUD9hH3SzSj80Ldr9GhBpSRG/CNmL7S0++ilNsrVQsLe8+rcg4zPAEdkalmjnl7Ep2BrFOgBAcM24TykpVDeN0FQSGejAotGdB4NZpfrPyM7QdtcM9U70TNrBqQjuN6KxXwsQeGmVIfEl/GGz5FZOfGgJJ4oI8444QdOfVgykemvLWT+CLfH2SF3J435PoUcf7McxO10SH1sZx0AaJ4EOYl5utad21PGsCWpSqEaqcrHADp24Qclk48RBkNp4PiWFUSIUe13eSJYFVlxQ1Jyxav20OacBDRasALcQXqygid48=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(5660300002)(31686004)(2616005)(508600001)(8936002)(53546011)(38100700002)(83380400001)(6506007)(54906003)(6916009)(8676002)(26005)(86362001)(31696002)(4326008)(6486002)(186003)(2906002)(66476007)(66946007)(6512007)(66556008)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jYbH0P59h8uumF7QgLTttIpkwwE/I/VAfJf3JNRgwYZEO9hqtfDGli857etV?=
 =?us-ascii?Q?yv6pPk4bKRYjX/QmjDRJ5+1K+BZe/TwF+BQyg7J13mO95d3xRZxCZSsf0pc7?=
 =?us-ascii?Q?Hme0jXVrpFKL6Tv8IiFyQpSnNGhkcn1hf7uHnM+OtNJuJySd0fDUUMaMzezJ?=
 =?us-ascii?Q?H8GjrtWAXQbc3SnRblDaIo4xVyTxoAWV9UKm3StJMxvScn7DjF7YMPPjmw/S?=
 =?us-ascii?Q?SXsmwRo1iLTFiFKRg/FYjJQXYj/9++b4tUka1ST0yiA0RNGMVr4+TRcOTZog?=
 =?us-ascii?Q?guJUCGQ4D1HfQZAFRFesGK8mLri63mDdxKgwOnzN7HOlFNSALd1htHAxd6ii?=
 =?us-ascii?Q?Gs4VvgzEIFupbIABbw/fPmJUGkYFXgdBjDzKL3C3RD6I42hZaUmvaE3ThqNq?=
 =?us-ascii?Q?aurPHQKtm5KHLs+35NA1WOxBO/M77wAAZVb38428K9DHOAsk5eG+G1AXYrg+?=
 =?us-ascii?Q?w8dqWMSWcGaTawWgpP7M0hIORYZBKWHsFtKHP0POPhXcy24lB+S+VSUGnhT6?=
 =?us-ascii?Q?Hb0xr/x0utr4ovYakVUbVeO1FM3e+vfyyIXDdAVKjvXl80SrNH9VH5U92D0o?=
 =?us-ascii?Q?AL6pU63rJ0aPpN5yWASBd0TT82CrQS+pJF/UehY7NhLEwEMTJMrFr7h2uneh?=
 =?us-ascii?Q?/8HEE/a7qyed91g7hkXOy7sk05Bp9UeZcZYe5SSlLA29l83ruz3oY+DJ7PvJ?=
 =?us-ascii?Q?UczvoS0KtoJMxtIKFNjkWEOZh3WIkemReWmoDJyA4DJA3+/dix7XTeWLjdiR?=
 =?us-ascii?Q?5lq60gp0qLDnjqLBSHxBaHoUS927p6aHJ8DWRRv8eYynC0xFrY4ooVPX7R9Q?=
 =?us-ascii?Q?8hBxjDWsV9fDp2hH2bMMiIWBRy8psx7hSEkNgsPxZ+3lLu8Ia8tGxLnY4PBe?=
 =?us-ascii?Q?IXwqU1wqyNFfMvy1JMxW1EofSet76eXfrdCBP3imRaKunhPObjdFB0xoCpDw?=
 =?us-ascii?Q?JDEpuVlF/hpR2qyQHfRn81IchM+IY+5ddG8YemTbGwF/N20gCeREBcE8cBPn?=
 =?us-ascii?Q?SRZIMlTD56UYyvUisLn8TeYd/lQ0Ta9QX7eTa0CklftvP51HZhhOYX99Jm7j?=
 =?us-ascii?Q?vr7/G6MyaiQPfYXndKyytSjIyVe1wr4cJvAE3eXCqZya1l3tb1bn5mP1hHJI?=
 =?us-ascii?Q?Z1sNQx8pfrUUY18gwa5zp3m4Gg3dfNCmGccWXsZr0cq04QoEd7e6n3v4TovJ?=
 =?us-ascii?Q?JbjC5qATOZfLJPTmMztIoT50gnAX4qbl6aRBfrDLruZE7Djsro9naIW0RRYT?=
 =?us-ascii?Q?AylQnAPcjNO04HDNR0vswK9InWPylEoqo3uFSFwEvnRfmnY1aArym45+asTV?=
 =?us-ascii?Q?9KnIqe2rpXd8Eajgst28/SE6kreM/cHX0VttcvdSvxK/FQamxF4k0Uw5JLtv?=
 =?us-ascii?Q?fY7GJySNWTpnP2HqTXv0WY2+nJvQ7/mogvLxtGrdJ16LYHZzTNMzVhAP4mZs?=
 =?us-ascii?Q?WFOLu0dfRAnA/Lze89QvKrs0YPZcVU8te3tDsuMYO4gcSkqiT+2x9KbOFnK4?=
 =?us-ascii?Q?8/G5u/FWkESyB06HdwmeUVdVbWWdt6l8Jy/uhupDjfpD5iNINTULWT4Pk1YC?=
 =?us-ascii?Q?KeUP/w+LqMVoo5EJM45iFXbXnr1MUf6ayexM3+JTj7K0rtzGRBReM4iu93AM?=
 =?us-ascii?Q?gFL3odG+IRemW2Wk9thniFc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2253cdf9-e251-4ec9-bf2b-08da010d3d1c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 14:09:19.8780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPgY6UiUbCzjTbZuBPSexHQUAiwJTHGTHO2rhIxPxi08sl2tE0ypVQ9CLQg6eT3fR4hkAD7a3f9u/rwFW4mtoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7587

On 08.03.2022 14:49, Roger Pau Monne wrote:
> If livepatching support is enabled build the hypervisor with
> -f{function,data}-sections compiler options, which is required by the
> livepatching tools to detect changes and create livepatches.
>=20
> This shouldn't result in any functional change on the hypervisor
> binary image, but does however require some changes in the linker
> script in order to handle that each function and data item will now be
> placed into its own section in object files. As a result add catch-all
> for .text, .data and .bss in order to merge each individual item
> section into the final image.
>=20
> The main difference will be that .text.startup will end up being part
> of .text rather than .init, and thus won't be freed. .text.exit will
> also be part of .text rather than dropped. Overall this could make the
> image bigger, and package some .text code in a sub-optimal way.
>=20
> On Arm the .data.read_mostly needs to be moved ahead of the .data
> section like it's already done on x86, so the .data.* catch-all
> doesn't also include .data.read_mostly. The alignment of
> .data.read_mostly also needs to be set to PAGE_SIZE so it doesn't end
> up being placed at the tail of a read-only page from the previous
> section. While there move the alignment of the .data section ahead of
> the section declaration, like it's done for other sections.
>=20
> The benefit of having CONFIG_LIVEPATCH enable those compiler option
> is that the livepatch build tools no longer need to fiddle with the
> build system in order to enable them. Note the current livepatch tools
> are broken after the recent build changes due to the way they
> attempt to set  -f{function,data}-sections.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -88,6 +88,9 @@ SECTIONS
>         *(.text.unlikely .text.*_unlikely .text.unlikely.*)
> =20
>         *(.text)
> +#ifdef CONFIG_CC_SPLIT_SECTIONS
> +       *(.text.*)
> +#endif
>         *(.text.__x86_indirect_thunk_*)
>         *(.text.page_aligned)

These last two now will not have any effect anymore when
CC_SPLIT_SECTIONS=3Dy. This may have undesirable effects on the
overall size when there is more than one object with a
.text.page_aligned contribution. In .data ...

> @@ -292,9 +295,7 @@ SECTIONS
> =20
>    DECL_SECTION(.data) {
>         *(.data.page_aligned)
> -       *(.data)
> -       *(.data.rel)
> -       *(.data.rel.*)
> +       *(.data .data.*)
>    } PHDR(text)

... this continues to be named first. I wonder whether we wouldn't
want to use SORT_BY_ALIGNMENT (if available) instead in both places.

Jan


