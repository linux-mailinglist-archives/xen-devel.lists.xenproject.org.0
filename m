Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEB34D19C6
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 14:57:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286929.486645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaLC-0002Ks-Kz; Tue, 08 Mar 2022 13:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286929.486645; Tue, 08 Mar 2022 13:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaLC-0002J0-H3; Tue, 08 Mar 2022 13:57:30 +0000
Received: by outflank-mailman (input) for mailman id 286929;
 Tue, 08 Mar 2022 13:57:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRaLB-0002Io-AW
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 13:57:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0b87e26-9ee7-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 14:57:28 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-2icVSMssM52tsq2JsCrA7w-1; Tue, 08 Mar 2022 14:57:26 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 13:57:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 13:57:26 +0000
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
X-Inumbo-ID: b0b87e26-9ee7-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646747848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gsj0GdTmg6sgFVjdAQFdXEsNNGMhgFiJ0ezI5CqkqKs=;
	b=gLwmegwGg7+OkIZIGoKa2smBny58KrII0y7dChNZFC2GKxcIImiXzKpyhpabP20ZGRYiOj
	ccvU2SIUQ932Xugifal8MPASIKhTNB5Fvbb3tg5zB+2ygZ9emwEHYXNdumjZp8Bp8C33Vh
	zl7yJpjr/tzfEiHOm0vaUIybudG3Ek8=
X-MC-Unique: 2icVSMssM52tsq2JsCrA7w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVGNlfoyYNfqpTH6oZ59sTbEEWueZBVTBcMqoRfKsrA29MH/WlYU+f3pkyotg23R5j+4Sb8zJuroubKpAx4j/mk/doexfTeZwF4Lf+Letl8+020TFB+jUiDMTsILEgeSP1+LboyJVospJejSa1mEsV4mCUGJZur96nc8cqgRIJFX6jMXNvl9psDmvTeWzawk7gxjLDIp7tg/mfgKaLoLTYJ0ay0ng08WSrXSJ0TOcW3gKIB5lkMsK+mcj9qZqHR4JxRhBihVx07Aoh7Hl0rSnT4c0SkiwP0955bbFdbXigQmI5th45U83N2JFvHigevXbtlTNaaXTu1PSAnZRugZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSI9UrZBmBOAA6xi6wEm0NjZrePa1wMp1SWayJ++2zM=;
 b=k+gzUDLRLvnf0gPiVF8O31wGWu/C5oNDn/56U111CiexZzp/UbLypZoB+Y2cDZpVblO/lkpX2SdsvcROgdFpzmr8IToLY+144l/UgJ39p6XYMycwcnnfD9PUb6acdhtMn3QIOZjyT5mQK5ILDVkjnyDOPuh4kSEA7d4WOzkpll86EUg4zXJAYNpQDvS/kNLmRSNSpDi3SfT/jlX8lLXfKjZuIGmfP68lAXUAtwWJv6M94wkMZGlwsGlv3OaRqAfjxV3l+Q0xV1i/X2YuNdaMVMKw7d3bOlrjISvZ8yolSSXq7dDuDAVWoSpPzsCO5f77pfspiUQOpDliCsp/qRo/WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c2e15d35-91b3-ba29-eed0-92fa19a692e8@suse.com>
Date: Tue, 8 Mar 2022 14:57:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 1/2] xen/build: put image header into a separate
 section
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220308134924.83616-1-roger.pau@citrix.com>
 <20220308134924.83616-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220308134924.83616-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P189CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ce93bf5-d54c-498a-ae3a-08da010b939b
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7280B79D2F0E445D14A006B4B3099@VE1PR04MB7280.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xa7Yfc1VLXB4n+2H04rY40aLal4oKA6+tywtgGnWGqH8J0OMQ5s0Wt2AAzu9rDH6mQR4BHE2rObmaLyzzh3r5bUnRI14pgpIs74NHTFdwncZqHzjVw7YSNcfUORboNSSWnAQ+R/qt3m535zMdWvc8X82wTl/DzJ1R3bTjO1gNtMovfhnwz2hWgfB4UntRKZ/g1G3htU8co1aF95i8E8nx47w6wodOg80NgMlQF+T08h4CvFgbJbL5e8VIfaYHfibQfJdraMqIxWpYOP+Ho40BIIDsR3SmFJ51ozP0o2XSKfsv64Q1UJcw+cuWfCsJ9sJOS08AiTcZeoM2uHsberhP/df0oQbDT8eLcoDX3HGp9266wcxI7imPjiBTAJRbaA8z94Does57DXhXNkAfkEKvh7CdjE26UEtykQ4CNOq8gykgleJ5SaaOFux6/IB3enRI9vy3Qv4VcBaf3boFk0W9OTcE4t+nOUvaIzAAdgNxG6KwK7z566Trh8tYmlPBVh9v2jjXu9muj6L4LyiIFSUXUivIJ8ruMealc+GmnPMoC7Y1cJlosX60EMnx0A5bA6H1VeTxewWrUmLKU+5ngCrfF5qO65ebPcziaFxFQcCNLEoxHmjmjDfExdXwGXbmgkgbL5s/l4aEuJtz+KtE/w/9UYxXEmLlcClGKT2j3hFOFDi70peZGQRPlOYLKdI7Wm0PW7CInsxkGcYUHMCBQqxmnVoKgzzlApUHyzHv7YJo98GWWZLJb6oH3i6+SjNK40Y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(6666004)(53546011)(38100700002)(36756003)(83380400001)(2906002)(2616005)(186003)(26005)(66946007)(66556008)(6512007)(6506007)(508600001)(86362001)(4326008)(316002)(8676002)(54906003)(31686004)(6916009)(8936002)(6486002)(31696002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uaVugTNCve3J2hZeDLkGS7V4b1csz2HYEJ9WOuBGlgvlpwPQpmIQUvByXcM8?=
 =?us-ascii?Q?4doedyCasclioAWWBw+CqkqYhsW6LoGmyuK7G+YFwRD1Yfut68srrGBtTN2L?=
 =?us-ascii?Q?PHmQMqNuV955BNNA+heocoS/dwaQ/siNTl7qfmFjjmuTdCzeeRZrond50zGO?=
 =?us-ascii?Q?gaSGZmKnuc/mTba21zA0BoIXwJnHAPcfwOsbsf/JM0dLD/4uzeLx2HDKK1hw?=
 =?us-ascii?Q?Iln0zaSUB9QsyH+CVzz3JMR63KSjzfl+msVBvtFfjKd0PfaW3p04dYr3xlBF?=
 =?us-ascii?Q?uNbXqts3L0XFSelRaUZ5jCBb91j5IEgdFb+9mT1LoaAGyIJ4k/cMOdeRXHxF?=
 =?us-ascii?Q?1Y1ARalL93IoWpPUiRDKTFLg4iF3zRvPI+KnqKYJEIQbCDGtGio/+61qrN7i?=
 =?us-ascii?Q?Tx8/bTRPtC9BhcHTEhyz+dy8CY9HHC7EFMaHgHVoy6fdtyB4K5chpsH79Own?=
 =?us-ascii?Q?0ViiLvonfln0g4dbgby+eUYQysUecMnv7pynGUh57213CRMyRhUw+oB9c3ST?=
 =?us-ascii?Q?oZ6jTMubUXyAvpgljHjgEOn67UZ2DAc9vAxa5PnhgSAeGReLyZfYgCsqZJVK?=
 =?us-ascii?Q?egxje4ns9hRwersyZwklvfELr6XyIcRqwc7wXuF9slu5cGUpnUGPXo887DSo?=
 =?us-ascii?Q?TNb3Em5PmhkBk37nyl+lQT77+LkBahp2q1+FPAt9TTGKeQKfohtNqhJWf2wm?=
 =?us-ascii?Q?rWZY4gaO9l+j3nnU9XXOLdqqmkW8e7Jgu4TZJOMHYx7fR/YknZNV4wmsCE9W?=
 =?us-ascii?Q?hEF8Uc982ZM3k+9vkPptIXuvFLwLKOVZs2PrAFErw7t034ZZzosDXpxtdWJ8?=
 =?us-ascii?Q?diSlXOPMHXP/p9KmIUISrHKFbGQBSCs7j0FES948o5sEzHjNn7ex3y1g+qDf?=
 =?us-ascii?Q?U6rbl3qnBo3TOeObIyPjQ0qTiBl6DP//KlkH8ebILftMBzCItXyC24zcEQlp?=
 =?us-ascii?Q?gInK2JhXUv3RMMVlkCOdQq1gVgWL2fiwWrFjIiB8Bb7dGD6pWk4OaV74ST+g?=
 =?us-ascii?Q?aMIy1aZFnfDEiVUX/iidFxZNzVXt+pLV0AcdlktJjV02HYZZ9R8bXqX8Uzk4?=
 =?us-ascii?Q?0WEbG+GKJCPm+M1HtqMuM0OrM/7sw5kj3LyXYF9K5E8BDdgUeb7ua2R1Wx2M?=
 =?us-ascii?Q?Ds2s31cQLr63gcv1zNNmsuZtr6+6cP4vHKzLOZeLsM/P8KtnlIyzJEEmpqd1?=
 =?us-ascii?Q?QLwyv8E11AWq2LEKwVSSlJ/gepaVtKTZC2STQ/Kcs42nQsD0XZus/PD8+N8d?=
 =?us-ascii?Q?Q8psO4qUv2Vene6Ve4IXkC0dE+R9xcxGjv6oaadzl97KRxETEXUuTn7UJJRg?=
 =?us-ascii?Q?/qBDxlEwy8KL7qwExGlSgJmjVj7plePv3CFZ4ScOjfRMh/zsOWdnES/y6Umo?=
 =?us-ascii?Q?Zz/NqliZKva7V2oMvf3Pvfru/8XDLID0XqHD/Bf3d86kv/miuZrojLPwJQwc?=
 =?us-ascii?Q?o/1w6rJjUDtd/K2HRfYNfpx9K6jsL+RY/07ul6IH8ib0gL0CLKcQFXsbzpQ0?=
 =?us-ascii?Q?rD43mod1fMqQwdpK2VB4vG5X5Eo5ZTv0zEGEdNigUyU3pP1DkpNwOt3cSo9w?=
 =?us-ascii?Q?sviveKxJw8Ibjm84LxRfM/hZVfrgIXOjrJVYOHjM63CQ9T116+dpPWdS34CS?=
 =?us-ascii?Q?xDsAUOA5tgYgk5iJgVCrO80=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce93bf5-d54c-498a-ae3a-08da010b939b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 13:57:26.0005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajUWq2rGDGZZ2sqdWAcNxt30m1D2tr5MiR7q/+m4W0W47jGFZ4ak/UxUx3ew84cWITRlWq79urbUmuLeb36xeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7280

On 08.03.2022 14:49, Roger Pau Monne wrote:
> So it can be explicitly placed ahead of the rest of the .text content
> in the linker script (and thus the resulting image). This is a
> prerequisite for further work that will add a catch-all to the text
> section (.text.*).
>=20
> Note that placement of the sections inside of .text is also slightly
> adjusted to be more similar to the position found in the default GNU
> ld linker script.
>=20
> The special handling of the object file containing the header data as
> the first object file passed to the linker command line can also be
> removed.
>=20
> While there also remove the special handling of efi/ on x86. There's
> no need for the resulting object file to be passed in any special
> order to the linker.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Looks good to me, but I have one question before feeling ready to
offer R-b:

> @@ -86,8 +84,13 @@ SECTIONS
>         *(.text.kexec)          /* Page aligned in the object file. */
>         kexec_reloc_end =3D .;
> =20
> -       *(.text.cold)
> -       *(.text.unlikely)
> +       *(.text.cold .text.cold.*)
> +       *(.text.unlikely .text.*_unlikely .text.unlikely.*)

What generates .text.*_unlikely? And if anything really does, why
would .text.cold not have a similar equivalent?

Jan


