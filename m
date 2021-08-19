Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECF43F1D60
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 17:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168914.308478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGkQ6-0007ee-M3; Thu, 19 Aug 2021 15:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168914.308478; Thu, 19 Aug 2021 15:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGkQ6-0007c9-J4; Thu, 19 Aug 2021 15:57:30 +0000
Received: by outflank-mailman (input) for mailman id 168914;
 Thu, 19 Aug 2021 15:57:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGkQ5-0007c3-IF
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 15:57:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26a7b6fe-0106-11ec-a63b-12813bfff9fa;
 Thu, 19 Aug 2021 15:57:27 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-jkn2hmCzMuiXaa23wUbbkw-1; Thu, 19 Aug 2021 17:57:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4944.eurprd04.prod.outlook.com (2603:10a6:803:60::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 15:57:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 15:57:24 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P250CA0001.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:57::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 15:57:24 +0000
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
X-Inumbo-ID: 26a7b6fe-0106-11ec-a63b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629388647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NFscWUsBcb2T4rNOAWJPbuu0mT45K4rC30KGc03OTWQ=;
	b=NNOfRdAx7QXBkMA/1vgjWQLSNhJRZT1w33eAIyQlV5t/WOHBV6tCXOeOXweKKtlgF+wcqf
	ptQJ6hi+yEUF3ZQB41lLgk1AVS5yNeej/fftzzOTtEiMGqyOhw64b01nr2YBrboYrz0g5a
	SEq6CUQoe6OJDRkuYMZmrlnBscVqNsY=
X-MC-Unique: jkn2hmCzMuiXaa23wUbbkw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElyBCnoMiwp6Rl6xp7sm9Y5110KHaWh5C7UguoJBe7ET0H5KrXSdfcRJ2kmGR9bNyq/35N6fldIf9wxUPM6wrZPVrfaIHo8cdmLQBydqbkAV9Uos7f/Ti04kc5ie/LrhwMApNljdubySZj0BergrRhy6lPV79xG79y6qV6IneZIxRNg7RoBHNu+eXA6vrDiR5QERM9keiF1hSqty0yMOjoQgMzZQjZ5v799ks9FFs28jvWXUGPQ1FMcbsx9Z3zsEGvt7CyxfPabqqQ/gFcA0nCINdt60fDIuPbfQ0UVnUnt+tb1GReE4K+obAPs1/OhLaBx50T+nzaNOHWjqVLQgyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OudPeNClVLWA6zpCts9qVt5MgxZnutp1aJsxK/p6jg=;
 b=A94G/OztqHOf3zr+cG+YdPXY9Z1/i0rfj/tdsvXuYO8k2BZQb3W4YuFquxxv5iNKm7nGVXSNqPpTCSYpuq4kTQWqGs5TEeqa57XCGV1/SIX+rBp3i22GBo9C+4ZjL5l3Nd0c+lTj3BMXO00Yg1+H+3GUYT+qwtjEB4CfOQwPfjDglN3aZ2A9gDEmV0kUPAClGGiTbGp7R4fc0tA6NsU2gytHDBO4UIH2Zxanla5WCX9SksjPA+UHeW/s7x5S8a4AsXHdtRuOMQwRNpOTvsmHQ3UCdIbZ0Q19Vd+kOl1SsIoWUdnVDCjf7MyaqQhFvYWXJhAK1x6vozG9lUTsrOZmPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 2/2] ns16550: add Exar PCIe UART cards support
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210818121649.462413-1-marmarek@invisiblethingslab.com>
 <20210818121649.462413-2-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1be5e798-c3ee-afb0-3da1-7bf16d9f8c41@suse.com>
Date: Thu, 19 Aug 2021 17:57:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210818121649.462413-2-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P250CA0001.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7341e176-f79a-410a-ecca-08d9632a095e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4944:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB494498EF963C973DE82D6C6AB3C09@VI1PR04MB4944.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BWYWjAyXbimcUe4M4EoTtGQRECjRpPIYJDE2bAUpkT+LUEg2Z54egVavlnX3R8OCFqfOyK6tQ9+uVwV8qYv5Qsgk4w5nGZSPC/+i6MAwYvJf0vdIO5foYEm7I81Hv9G+RMC+3tuw5m8tw3SPo4VPjS/1xp1OiPKYsZm/0KGvoqXX0i8AQ2K/6CqrrBXycwepnqXlYlCOjIy0sgVmB1A+sD08QWOKxf0JtCaDnN2dUErnthybQqmIBJmrkVENCFHblsivd5Pbks/RUwebjLp/iIgK73DPw5UsJjMVMUXGWDFaFQ4GPifRnJcJkhDR9YrjaoX0mD+h1JRG2Nzf+VBAs4W8xOJAkzFX9C2DnjatWncAevD6LyKfIOnMo4jQSrxpQXO3qplPfO/imld+ZFHy90XAnZgoQr5D2sAMWOOo4HC/Rs/JrTWknbwuYUUpq5RzoO5rgQ9ogH7oQJNt3BKjqe2pHeMaGU8hxXkqb9+Zd4P6sSc4IW4LjPQHmBSqoxMw1vS2p1UsguyG2cBT5pzxa+g3h4Dr+hDIVQpGPMykrSvSw9Ztm7GfKhdJOXwS2VAx9SY9xolWqHnaY60RV1IqK96GTfrIjkqpaF1ZgcEcb7jHcgdlBAm+nW//mDYEHUreqNtBKQtAjRtFPjrX7yHgdbJVxThs/9IrWss/lfZxEZhwRy0cI6TRbyY4H45aza8ZlEBWwgfLfC0boi2uJvycFndb75Ll9OcEiXy9S2wyGP4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39840400004)(396003)(346002)(136003)(376002)(366004)(26005)(53546011)(6486002)(316002)(8936002)(6916009)(5660300002)(6666004)(186003)(86362001)(36756003)(66476007)(66556008)(956004)(8676002)(54906003)(38100700002)(2616005)(478600001)(66946007)(31696002)(16576012)(83380400001)(31686004)(2906002)(66574015)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s0fuKBHizC12beHyZW1lsIczPHhhntPOCJdgf4riWD9/lUlR+YUiskd/JRwH?=
 =?us-ascii?Q?4j8S0hcCHwvddsQnHbytuer1fw8l6q4ekFLIdhbmLdzTnUCEVKkPI1FxjALM?=
 =?us-ascii?Q?1O4LjwYZjLvBXgqWa0o4qI6I4bT0t9wVoXPyu51KQfdig2yN+RBFsU/4T4KO?=
 =?us-ascii?Q?qMghU5Lph3YmZ6I+t1uGQSeZXFdBDItzgGXLS9vxE05dMWlKUHHM62R1h0mH?=
 =?us-ascii?Q?VbWAn9J9U99AhYEYU2/4i49sCEMOk/I848ZOiRevA8HS6+VWnSwu6pzULoT3?=
 =?us-ascii?Q?9j1G2eF38HpvlyBL1I0RHg22CvwubKMNBOXbfWJsXzIWdilMQ1KqRFzilDaz?=
 =?us-ascii?Q?t630hYAg5pqyiGF6WQYVi3EYzpsAMH71vyGhpabbRWW1BXBXPDw7SJHpLT+E?=
 =?us-ascii?Q?0RIpsOoD9Q9KkwoKJr90cjxgERsdnI6FmNeSLVkN3ypLUkcoMO0bMd8jJI2f?=
 =?us-ascii?Q?AHhS50N3dsq97QVDj3ibomT4R4PzDTpFPQR33GSWJW5XxQGjRzeOcmYJ2EcF?=
 =?us-ascii?Q?cmsRIA0GTbomlA4QY4SETYsfmYg/qy0J4vSwqMRD6lCDf8QfMuxKimyqlMlz?=
 =?us-ascii?Q?sFOa9PD5C6X9rtkoWroeji1TdLauViyxsFQrcYy/PSlhf5jLIkCSJ1p0pNB8?=
 =?us-ascii?Q?fnb3pTvpGoRDeeArHSqH/QBduHi9YxgDa190pBOVR9lgJYF1UzfktLi7kluW?=
 =?us-ascii?Q?roeABo4yF1zsINMARSw0pg0oHAkbpm+FhMCcIrGJap1l879oddzAT/NZGkSg?=
 =?us-ascii?Q?hsirW4NsMOQQdMwQTttHUFULyjIhu5s0HR9RzB19CO2bDCvNX9wYzQ4J2Pky?=
 =?us-ascii?Q?3taB8U8QyNMWCFjoRPYovjBI8027GL6yhJOoFdN207UshjMPyC3ih9vNuG8U?=
 =?us-ascii?Q?abwSiJk9ldTTYX7SXFulBzhQh4gM2AcOUnc5No5Lqn71Q/urla6rGOqn9/H3?=
 =?us-ascii?Q?Yl2+x+NJdHrapECd16D+C9gjUcdvhmjKNtQPN+0mruR8YDdvz9KlPbHq5qc7?=
 =?us-ascii?Q?1iLDCi1Mwr5JdTB7o/6MeuY++w28dm5FuBrgNulJVj0KG6GLFDCXXmRmpwry?=
 =?us-ascii?Q?TwBjPOcXSWOWbqJEEvEPUHqx2BxPru0BjhJFjNOlKJArbS3JI5qNhtIlvVQ5?=
 =?us-ascii?Q?vQ73mMu+dThO6AQQkfunLvjpRp2vC7avUso+QIrtoy91ScWz3VorNu+CW5e3?=
 =?us-ascii?Q?VqISGwiUIWIJmpPLrPaZ1MB7xwSaxBvqzVtAyk2PrC1BUyH5RSGf1SpwuI+0?=
 =?us-ascii?Q?DqYcR8xttmMqgFxnoQNj/sI/5jwJq43B/WpdWdYyGE8G1uGz5UNkyVmbmOfk?=
 =?us-ascii?Q?9r+vJnk7JjtEGUB3iKbSRrVe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7341e176-f79a-410a-ecca-08d9632a095e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 15:57:24.7767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8E2sJjRYHmhPqv7ZGvU3amGVSnfVuG/OySgVFkMp9v3hhaxpBP9s5Wr90c4KZ5VGICqGEJIXH0qenBjXUwrog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4944

On 18.08.2021 14:16, Marek Marczykowski-G=C3=B3recki wrote:
> @@ -169,6 +172,29 @@ static void handle_dw_usr_busy_quirk(struct ns16550 =
*uart)
>      }
>  }
> =20
> +static void enable_exar_enhanced_bits(struct ns16550 *uart)

Afaics the parameter can be pointer-to-const.

> +{
> +#ifdef NS16550_PCI
> +    if ( uart->bar &&
> +         pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[2],
> +                         uart->ps_bdf[2]), PCI_VENDOR_ID) =3D=3D PCI_VEN=
DOR_ID_EXAR )
> +    {
> +        u8 devid =3D ns_read_reg(uart, UART_XR_DVID);
> +        u8 efr;
> +        /*
> +         * Exar XR17V35x cards ignore setting MCR[2] (hardware flow cont=
rol)
> +         * unless "Enhanced control bits" is enabled.
> +         * The below checks for a 2, 4 or 8 port UART, following Linux d=
river.
> +         */
> +        if ( devid =3D=3D 0x82 || devid =3D=3D 0x84 || devid =3D=3D 0x88=
 ) {

Hmm, now I'm in trouble as to a question you did ask earlier (once
on irc and I think also once in email): You asked whether to use
the PCI device ID _or_ the DVID register. Now you're using both,
albeit in a way not really making the access here safe: You assume
that you can access the byte at offset 0x8d on all Exar devices. I
don't know whether there is anything written anywhere telling you
this is safe. With the earlier vendor/device ID match, it would feel
safer to me if you replaced vendor ID and DVID checks here by a
check of uart->param: While you must not deref that pointer, you can
still check that it points at one of the three new entries you add
to uart_param[]. Perhaps via "switch ( uart->param - uart_param )".

Also there are a number of style nits:
- opening braces go on their own lines (except after "do"),
- blank lines are wanted between declarations and statements,
- we try to move away from u<N> and want new code to use uint<N>_t,
- with "devid" declared in the narrowest possible scope, please do
  so also for "efr" (albeit this logic may get rearranged enough to
  make this point moot).

Jan


