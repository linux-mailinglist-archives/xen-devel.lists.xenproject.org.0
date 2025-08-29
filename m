Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7058DB3C3E3
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 22:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102186.1454915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us5y8-00013H-34; Fri, 29 Aug 2025 20:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102186.1454915; Fri, 29 Aug 2025 20:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us5y8-000112-08; Fri, 29 Aug 2025 20:45:08 +0000
Received: by outflank-mailman (input) for mailman id 1102186;
 Fri, 29 Aug 2025 20:45:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sr3h=3J=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1us5y6-00010w-JO
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 20:45:06 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0aa3ee0d-8519-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 22:45:05 +0200 (CEST)
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com (2603:10a6:10:516::14)
 by VI0PR03MB10540.eurprd03.prod.outlook.com (2603:10a6:800:212::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.26; Fri, 29 Aug
 2025 20:45:02 +0000
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4]) by DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4%7]) with mapi id 15.20.9073.021; Fri, 29 Aug 2025
 20:45:01 +0000
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
X-Inumbo-ID: 0aa3ee0d-8519-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3dnQ7XKFEycfhjfOuksmiAdchOSYu3l/R4QVrY9vx41DxPgSa3dp92tIknkQfYSWVqpNI8DUTg2IbCEdLqeURFFWdsDOd3XfZKqLDiD3QrsfvS1luJdZXa2xGf/4Pjh2Ixde9FAL/8or3gCZddPEEDbyk+3zUygpsshWeY1E03WuHRlHa64RaBPxjpQBQwBfwT4TXJq8ymXqDxWNGsjCYIRzexbsVOuSszdgn4LEhkTtEsr2HdY+L2tewSRo8JU20hdwSkm5vSlDH0+mobMuMCkiSABbaqWQrmPjQ4OvOwT78P/GHnBKWAOf5nrWkOaKtzzNqHkyXdABNdSV9n7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJ00unInKAKUQE1j1/2pFYJp5OD68EtZvvY0U34wpXA=;
 b=IfvAdhIDqRFchxVEYWbBz22Cj/FeLKsOkg06ju2aQNiQit7fZgNhktzUL8ZkDKHT6Q5GSo3h1KdfSpr+AxQQXIH4Udh1I1VUXU9ChxkMTninwjwOsrjC6QgVnuxCjiVqXBnP8zAw1w79Lti32dIeA4/PlE3gqosE9WkK1N14l1C66bIaZAbHjoYHclPq0+ciHBbqHIduuzjRYkLR9bpKoU3OHD0bIzbHDJbo74/sFOpOoU2vsgkNARmv5O8XYcVDRm8MbZ3mX37xThhHgXGbMAcBbu1cl+2l8L+GJ/sZnR1X3JTqQsb1e/ipscCsmvYG++859mv+JV1jTj4MLi4nUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJ00unInKAKUQE1j1/2pFYJp5OD68EtZvvY0U34wpXA=;
 b=uqkzbU5ZnKQNsGv+9U8lzGmCp5bhYySJJTpDkE7cHht0o8aSlodEerCg3r54Z+6VVtaxuxYrY1PY1JzEGhTO3babFxoXW47gzexaAsZxb/sRcnFVLL4/zfqysYHY4dnO6r8h2Ui9kPvd8k33xwqAWrq+S2+bZAavEg0MUV9X8+Hu7flt7q9kaspiL99cdHsYEL1bwOo2Hf7jMPRFk7JWjG+Bh+6W6jdLTTwYh6Vt5Igv2N0Ku3FLPaKI2KAN+Mq6eOuFxM+cfnpjP5PnWL2C2kjF5Ky70gLnXCrW4WaHSmTKo+ItF1zxT2Xan4dwS8hcWD5bNpxFhX+gRqWxdFlN4g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v5 08/12] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Topic: [PATCH v5 08/12] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Index: AQHcGP7hrcU5X1RXvUyGwHbXwaiTdQ==
Date: Fri, 29 Aug 2025 20:45:01 +0000
Message-ID: <87y0r1x3g2.fsf@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
	<4b13dea924eabf1370d3f31030f3eef48371de06.1756481577.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <4b13dea924eabf1370d3f31030f3eef48371de06.1756481577.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Fri, 29 Aug 2025 16:06:28 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10441:EE_|VI0PR03MB10540:EE_
x-ms-office365-filtering-correlation-id: 3f8b12ca-7994-4e10-8bf1-08dde73ced22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7wQBP1RuQiF0/6thjEYRVQg+Z/g8tWbkHFt0layn7El7K0wVjcDsNL+3ds?=
 =?iso-8859-1?Q?/FzlOLAa/YZqnZnbtUvGF492gsrh0u8L+/v/XiXBNUm10HFLeYEwoXSnt7?=
 =?iso-8859-1?Q?rvJEr3biYly2UaEdgujjDMDhPbbEUZGVilX8nqEW3aJKJwbhG50nGBFnBP?=
 =?iso-8859-1?Q?KCK11U1022T2TH/f1P18oxPa+UiCZdJGiwLid+sUtcza4p0xjDklDWYJDq?=
 =?iso-8859-1?Q?tVzeTnqghQeiSnAq09IZgrk/K+VBXJnIW4t1ZnzVwkmuJ/4yJ4WeAo1Aen?=
 =?iso-8859-1?Q?ShpqR174/Bh0bBGmwoSS/EbL0L40sv4EBkVBby5NX/gJIU+4Qe7C2f59A3?=
 =?iso-8859-1?Q?OE1+dipIe+bSEx/lLOuNuirrfPF4zA8o4OAbdEkWZcJa9YmF/8OJXymPbF?=
 =?iso-8859-1?Q?MVSmpv+CXkthN7s9Ph32pkWKxa5MgEdYeH48g9a3Upe8iGszk3k60/Ljjm?=
 =?iso-8859-1?Q?OrbCoVIOvJMf3sv+n+IJcJC9QrbEj8r0O9PV3MzBMfpl8md/7qgHJ172fM?=
 =?iso-8859-1?Q?OQiRjYyGg9Ac41EO/AFgNA70MKCiO0guBRXeAoomT/dZWZe08BwZ269vwL?=
 =?iso-8859-1?Q?XG6AhjvqZOKbmXCFPHiHYK+EZ4BIajcCTOuU9t35i6OMx4EpbaHA6ctIeu?=
 =?iso-8859-1?Q?vH3BfzaYwcCI3X7GIrGdeJJWov3MJ8Wb6fkV+0ujYkERQms2HlL/EKDk0e?=
 =?iso-8859-1?Q?Yry+dfjlqKIHLKIaU3JQxouzShH1kMI+heOFNVhoF5K5qRt1WH8gzS7Kbn?=
 =?iso-8859-1?Q?z8DFAKUEbBbJDCv1BI+GQs9kA9s9Z8cv4yoH22m3yAWHrKZe92GfoG1TDm?=
 =?iso-8859-1?Q?yqv9lxFMkVsK+eYtoT8Xh6bsdc9f49WLjnGeKM6Qx4fryv0Ei4gUclr6Ux?=
 =?iso-8859-1?Q?hfmaLuy4jX8d+TjIB3yAQhOuFBhVpXsnOeUqqMMAP1+/W8VL20japH8KT9?=
 =?iso-8859-1?Q?HGWmFUb66QpU98+SWK6HxdTyLvEHAx9F+lJQ+IC0R9jIFFrnKXJnan/Rg8?=
 =?iso-8859-1?Q?XqZbjhPz1LkAm4Jy6IhQbL+9nXMotlWEet3tZAafPnVXmi8HI1r/XTBJ2T?=
 =?iso-8859-1?Q?LIuU6Z2xrID8eUBLOk378dk1Cd8SIxsgxio5sgcHq7K8l+Hrl1fpa+CwXH?=
 =?iso-8859-1?Q?k58wtGCx4KHI+CW/TaTvkU+d4sw8hrfEDezn8202QM+fDhaUAOoIlT1KZL?=
 =?iso-8859-1?Q?wUFXx1JXnbQp5TT3CjpAouKgptPCqZeQoxKkrInb+fG4CogpdrzkTmMOaN?=
 =?iso-8859-1?Q?Z+lOnKawPIIhoc34tSlt+cK9LtHgqjZ33WswqLvXZa5FivWSSamKXZ/Owh?=
 =?iso-8859-1?Q?VXqmoKPvmjUNU8bUj5Bp/2tu2cJEsNwffEp7siRTX9YIQnhqZTqGzOjNLa?=
 =?iso-8859-1?Q?3ewyZhpf3Uptppb0Wa8gwwtjturWHWzh0bDkhTBggMH1CYb0S8je1M9DmP?=
 =?iso-8859-1?Q?r4LyTZR/cYKxX3LWIiHrk4GLtjVYOj7eywd+B16ADvwOzDBSM45Lc7WuND?=
 =?iso-8859-1?Q?mNIhZOhuzZwKkt6zdmU0Nf6A9s+0m9y4UkANgEadUHJA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10441.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Xi61OHPiDx3MZYyzQkHAOR/lxTF4nluK+NDn4YnkTE54iq/67qhSB+UKFX?=
 =?iso-8859-1?Q?NZuGD2gWNTVrzvzggQb6CYR3ohmW7qzQBG6MQj/F4oC8/yXkum/M/QIhJ6?=
 =?iso-8859-1?Q?t/HYXjgQaIYUAveW9hw7D+II9PayAl5knmKIJnVtkTskXTy+6y038pPiQn?=
 =?iso-8859-1?Q?nKqhJ7g0xlRumu5GhNy+HY6KmmVQ6jusqVIURhLbTCjYKaao/mCOgp/Bjc?=
 =?iso-8859-1?Q?n0H7aIoVTs9HzYhZrc74qYCgfFbBGMb/DTLXMnktKDnMuoijw1gBnPrCSr?=
 =?iso-8859-1?Q?wzeUzBhn1eK4Gjo+c3ZNR1mkQn7GvvJCVMwssqqaHH6VUmC380pUfcMeAa?=
 =?iso-8859-1?Q?mX+KdU6AjfqU2p5G/22UeUjj4QGeqHOaDHon1y5/w7QlbqpzPMcXpSYHd4?=
 =?iso-8859-1?Q?gnp+9LYjsVzkcF9veULxWxW0LForG4Iv2wIFt2M6qNmsxWveHORWzHxhse?=
 =?iso-8859-1?Q?If0gndONwQvdu5mUBu3CXcEXM5gT6+4NBUgLWVmxhW9fqypw7roPU+r5FC?=
 =?iso-8859-1?Q?ClJ1+x2GtNwQLFYm90UfT3oWHKIXg/0a8q0gASXZhOAZOVoi5kqaGep0IP?=
 =?iso-8859-1?Q?Gx7nWkjREGJCWT3UQSqGl2otBqeN+0nZWa4fbgBSoMYIc7pViL27EBFDgc?=
 =?iso-8859-1?Q?fYTjziDfftEQ0wSh2oqKNGfKb/klCQyS2y4mKAxxBnpyCRsfmVx3BNYJOC?=
 =?iso-8859-1?Q?EdLRFkHCsnAbc26nz8aiEwcQV3VhoENih1yC7NHkht26YVX8jWCpB/oVCr?=
 =?iso-8859-1?Q?/jpXC0lVtYeBiMxro/v0czXrghUBiOcvTaMIvbLnGVOdDKHTkCU/eUSz+k?=
 =?iso-8859-1?Q?WTw24GxUyWddFhEE/b5XTpybfSnn2KheI8pqkEwYwC/De4gMMpG0TbOWcB?=
 =?iso-8859-1?Q?/DjSmmtMLkzrA8x0VOJ4sjNxF7xYF5qXWS2dnVuxiy6MOrdHl1xf9CHdSB?=
 =?iso-8859-1?Q?XBwauyIJj5PPFSP3+02wfGHylJMDYU9DTSwoDPADrGqtbOdWwJA08TEEXY?=
 =?iso-8859-1?Q?H85A4U72PnU5X2GlRUooca979OSgPKmBLHIPREkZn47f+Myc32AzgEebsj?=
 =?iso-8859-1?Q?TifwKFJbVlRlbdCxfiR+TJ3oP+Xn790aZ7s+MnZZOWVIlElquGbYstA2QY?=
 =?iso-8859-1?Q?Bew5U38BycJFO7E7WFwKKKOgB/bod0xWxELKUUuglqW59sEuVVCgk7k+VK?=
 =?iso-8859-1?Q?cfIsS7qUEFm3WEkUjSTKxW13HN6lB2LXk4YVMg1P1d9TmYKbgYVCUSCVsZ?=
 =?iso-8859-1?Q?Ed8B+t0KVa26bOykvA0BTODt8Wr3nY3R6wwCCrTis4Nf0bnsci/Txw6NpG?=
 =?iso-8859-1?Q?84QjzEgYgVZkXas19B0poUssheZw+u6LCQ14eoRL7pITAX0iwaEh4IhzHe?=
 =?iso-8859-1?Q?bJV0/xMDK7uBhIdZlT1Px67hoctk0hmNK+SouWdmzN0TmD+DCtk4aw1ZGZ?=
 =?iso-8859-1?Q?Jg9Bq294gvvuhPnE6Q7U4v2N+Zvig9jKnXe3adhK5QpLTmA4y5U6NMaZZr?=
 =?iso-8859-1?Q?C4w2xt8rhA6UqvLUOP/uJuotP3/OcOA4yw5Z+dcYc/oA52iiWKPwqlfTwR?=
 =?iso-8859-1?Q?15FYvVF7WyKYp8EcguVTgT7Ys6GJmKBNnXu1j+o111hDM5G5aVkehEO4vr?=
 =?iso-8859-1?Q?7K9RSKNQ7mgqDqsssHddPqiYUheeR7acX5icR0zTUvlP/LXigCwOWQ2A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10441.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f8b12ca-7994-4e10-8bf1-08dde73ced22
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 20:45:01.8435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aO8Vq9W2FW6vmAi0CIHHTak+czAjz1rFfN7eeaHEif5tU0jXfQxj2rpiwCIQx4fMLIahletGRTDOFGrMeyziEInmC6JRZrKh3w7Iy2swtZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10540


Hi Leonid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> This change introduces resource management in the VGIC to handle
> extended SPIs introduced in GICv3.1. The pending_irqs and
> allocated_irqs arrays are resized to support the required
> number of eSPIs, based on what is supported by the hardware and
> requested by the guest. A new field, ext_shared_irqs, is added
> to the VGIC structure to store information about eSPIs, similar
> to how shared_irqs is used for regular SPIs.
>
> Since the eSPI range starts at INTID 4096 and INTIDs between 1025
> and 4095 are reserved, helper macros are introduced to simplify the
> transformation of indices and to enable easier access to eSPI-specific
> resources. These changes prepare the VGIC for processing eSPIs as
> required by future functionality.
>
> The initialization and deinitialization paths for vgic have been updated
> to allocate and free these resources appropriately. Additionally,
> updated handling of INTIDs greater than 1024, passed from the toolstack
> during domain creation, and verification logic ensures only valid SPI or
> eSPI INTIDs are used.
>
> The existing SPI behavior remains unaffected when guests do not request
> eSPIs, GIC hardware does not support them, or the CONFIG_GICV3_ESPI
> option is disabled.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>
> ---
> Changes in V5:
> - removed the has_espi field because it can be determined by checking
>   whether domain->arch.vgic.nr_espis is zero or not
> - since vgic_ext_rank_offset is not used in this patch, it has been
>   moved to the appropriate patch in the patch series, which implements
>   vgic eSPI registers emulation and requires this function
> - removed ifdefs for eSPI-specific macros to reduce the number of ifdefs
>   and code duplication in further changes
> - fixed minor nit: used %pd for printing domain with its ID
>
> Changes in V4:
> - added has_espi field to simplify determining whether a domain is able
>   to operate with eSPI
> - fixed formatting issues and misspellings
>
> Changes in V3:
> - fixed formatting for lines with more than 80 symbols
> - introduced helper functions to be able to use stubs in case of
>   CONFIG_GICV3_ESPI disabled, and as a result, reduce the number of
>   #ifdefs
> - fixed checks for nr_spis in domain_vgic_init
> - updated comment about nr_spis adjustments with dom0less mention
> - moved comment with additional explanations before checks
> - used unsigned int for indexes since they cannot be negative
> - removed unnecessary parentheses
> - move vgic_ext_rank_offset to the below ifdef guard, to reduce the
>   number of ifdefs
>
> Changes in V2:
> - change is_espi_rank to is_valid_espi_rank to verify whether the array
>   element ext_shared_irqs exists. The previous version, is_espi_rank,
>   only checked if the rank index was less than the maximum possible eSPI
>   rank index, but this could potentially result in accessing a
>   non-existing array element. To address this, is_valid_espi_rank was
>   introduced, which ensures that the required eSPI rank exists
> - move gic_number_espis to
>   xen/arm: gicv3: implement handling of GICv3.1 eSPI
> - update vgic_is_valid_irq checks to allow operating with eSPIs
> - remove redundant newline in vgic_allocate_virq
> ---
>  xen/arch/arm/include/asm/vgic.h |  12 ++
>  xen/arch/arm/vgic.c             | 199 +++++++++++++++++++++++++++++++-
>  2 files changed, 208 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index 3e7cbbb196..912d5b7694 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -146,6 +146,10 @@ struct vgic_dist {
>      int nr_spis; /* Number of SPIs */
>      unsigned long *allocated_irqs; /* bitmap of IRQs allocated */
>      struct vgic_irq_rank *shared_irqs;
> +#ifdef CONFIG_GICV3_ESPI
> +    struct vgic_irq_rank *ext_shared_irqs;
> +    int nr_espis; /* Number of extended SPIs */
> +#endif
>      /*
>       * SPIs are domain global, SGIs and PPIs are per-VCPU and stored in
>       * struct arch_vcpu.
> @@ -243,6 +247,14 @@ struct vgic_ops {
>  /* Number of ranks of interrupt registers for a domain */
>  #define DOMAIN_NR_RANKS(d) (((d)->arch.vgic.nr_spis+31)/32)
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +#define DOMAIN_NR_EXT_RANKS(d) (((d)->arch.vgic.nr_espis+31)/32)
> +#endif
> +#define EXT_RANK_MIN (ESPI_BASE_INTID/32)
> +#define EXT_RANK_MAX ((ESPI_MAX_INTID+31)/32)
> +#define EXT_RANK_NUM2IDX(num) ((num)-EXT_RANK_MIN)
> +#define EXT_RANK_IDX2NUM(idx) ((idx)+EXT_RANK_MIN)
> +
>  #define vgic_lock(v)   spin_lock_irq(&(v)->domain->arch.vgic.lock)
>  #define vgic_unlock(v) spin_unlock_irq(&(v)->domain->arch.vgic.lock)
> =20
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 2bbf4d99aa..c9b9528c66 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -27,9 +27,82 @@
> =20
>  bool vgic_is_valid_line(struct domain *d, unsigned int virq)
>  {
> +#ifdef CONFIG_GICV3_ESPI
> +    if ( virq >=3D ESPI_BASE_INTID &&
> +         virq < ESPI_IDX2INTID(d->arch.vgic.nr_espis) )
> +        return true;
> +#endif
> +
>      return virq < vgic_num_irqs(d);
>  }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +/*
> + * Since eSPI indexes start from 4096 and numbers from 1024 to
> + * 4095 are forbidden, we need to check both lower and upper
> + * limits for ranks.
> + */
> +static inline bool is_valid_espi_rank(struct domain *d, unsigned int ran=
k)
> +{
> +    return rank >=3D EXT_RANK_MIN &&
> +           EXT_RANK_NUM2IDX(rank) < DOMAIN_NR_EXT_RANKS(d);
> +}
> +
> +static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
> +                                                       unsigned int rank=
)
> +{
> +    return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank)]=
;
> +}
> +
> +static inline bool vgic_reserve_espi_virq(struct domain *d, unsigned int=
 virq)
> +{
> +    return !test_and_set_bit(ESPI_INTID2IDX(virq) + vgic_num_irqs(d),
> +                             d->arch.vgic.allocated_irqs);
> +}
> +
> +static void arch_move_espis(struct vcpu *v)

I don't need you need a copy of arch_move_irqs(). Se below for more info.

> +{
> +    const cpumask_t *cpu_mask =3D cpumask_of(v->processor);
> +    struct domain *d =3D v->domain;
> +    struct pending_irq *p;
> +    struct vcpu *v_target;
> +    unsigned int i;
> +
> +    for ( i =3D ESPI_BASE_INTID;
> +          i < EXT_RANK_IDX2NUM(d->arch.vgic.nr_espis); i++ )
> +    {
> +        v_target =3D vgic_get_target_vcpu(v, i);
> +        p =3D irq_to_pending(v_target, i);
> +
> +        if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p-=
>status) )
> +            irq_set_affinity(p->desc, cpu_mask);
> +    }
> +}
> +#else
> +static inline bool is_valid_espi_rank(struct domain *d, unsigned int ran=
k)
> +{
> +    return false;
> +}
> +
> +/*
> + * This function is stub and will not be called if CONFIG_GICV3_ESPI=3Dn=
,
> + * because in this case, is_valid_espi_rank will always return false.
> + */
> +static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
> +                                                       unsigned int rank=
)
> +{
> +    ASSERT_UNREACHABLE();
> +    return NULL;
> +}
> +
> +static inline bool vgic_reserve_espi_virq(struct domain *d, unsigned int=
 virq)
> +{
> +    return false;
> +}
> +
> +static void arch_move_espis(struct vcpu *v) { }
> +#endif
> +
>  static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
>                                                    unsigned int rank)
>  {
> @@ -37,6 +110,8 @@ static inline struct vgic_irq_rank *vgic_get_rank(stru=
ct vcpu *v,
>          return v->arch.vgic.private_irqs;
>      else if ( rank <=3D DOMAIN_NR_RANKS(v->domain) )
>          return &v->domain->arch.vgic.shared_irqs[rank - 1];
> +    else if ( is_valid_espi_rank(v->domain, rank) )
> +        return vgic_get_espi_rank(v, rank);
>      else
>          return NULL;
>  }
> @@ -117,6 +192,62 @@ int domain_vgic_register(struct domain *d, unsigned =
int *mmio_count)
>      return 0;
>  }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +static unsigned int vgic_num_spi_lines(struct domain *d)
> +{
> +    return d->arch.vgic.nr_spis + d->arch.vgic.nr_espis;
> +}
> +
> +static int init_vgic_espi(struct domain *d)
> +{
> +    unsigned int i, idx;
> +
> +    if ( d->arch.vgic.nr_espis =3D=3D 0 )
> +        return 0;
> +
> +    d->arch.vgic.ext_shared_irqs =3D
> +        xzalloc_array(struct vgic_irq_rank, DOMAIN_NR_EXT_RANKS(d));
> +    if ( d->arch.vgic.ext_shared_irqs =3D=3D NULL )
> +        return -ENOMEM;
> +
> +    for ( i =3D d->arch.vgic.nr_spis, idx =3D 0;
> +          i < vgic_num_spi_lines(d); i++, idx++ )
> +        vgic_init_pending_irq(&d->arch.vgic.pending_irqs[i],
> +                              ESPI_IDX2INTID(idx));
> +
> +    for ( i =3D 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
> +        vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i], i, 0);
> +
> +    return 0;
> +}
> +
> +struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)

I know that I should made this observation in previous version, but I
didn't, sorry for that. Anyways, I don't think that this is a good idea
to introduce this function and vgic_reserve_espi_virq(), as well as
arch_move_espis(), actually, because in each case this is a code
duplication, which is not good.

I think that instead you need to introduce a pair of helpers that will
map any (e)SPI number to pending_irq[]/allocate_irqs index and back.

somethink like

static inline unsigned virq_to_index(int virq)
{
   if (is_espi(virq))
       return ESPI_INTID2IDX(irq) + d->arch.vgic.nr_spis;
   return virq;
}

See below for examples.

> +{
> +    irq =3D ESPI_INTID2IDX(irq) + d->arch.vgic.nr_spis;
> +    return &d->arch.vgic.pending_irqs[irq];
> +}
> +#else
> +static unsigned int init_vgic_espi(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +static unsigned int vgic_num_spi_lines(struct domain *d)
> +{
> +    return d->arch.vgic.nr_spis;
> +}
> +
> +struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
> +{
> +    return NULL;
> +}
> +#endif
> +
> +static unsigned int vgic_num_alloc_irqs(struct domain *d)
> +{
> +    return vgic_num_spi_lines(d) + NR_LOCAL_IRQS;
> +}
> +
>  int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>  {
>      int i;
> @@ -131,6 +262,36 @@ int domain_vgic_init(struct domain *d, unsigned int =
nr_spis)
>       */
>      nr_spis =3D ROUNDUP(nr_spis, 32);
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +    /*
> +     * During domain creation, the dom0less DomUs code or toolstack spec=
ifies
> +     * the maximum INTID, which is defined in the domain config subtract=
ed by
> +     * 32 to cover the local IRQs (please see the comment to VGIC_DEF_NR=
_SPIS).
> +     * To compute the actual number of eSPI that will be usable for,
> +     * add back 32.
> +     */
> +    if ( nr_spis + 32 > ESPI_IDX2INTID(NR_ESPI_IRQS) )
> +        return -EINVAL;
> +
> +    if ( nr_spis + 32 >=3D ESPI_BASE_INTID )
> +    {
> +        d->arch.vgic.nr_espis =3D min(nr_spis - ESPI_BASE_INTID + 32, 10=
24U);
> +        /* Verify if GIC HW can handle provided INTID */
> +        if ( d->arch.vgic.nr_espis > gic_number_espis() )
> +            return -EINVAL;
> +        /*
> +         * Set the maximum available number for regular
> +         * SPI to pass the next check
> +         */
> +        nr_spis =3D VGIC_DEF_NR_SPIS;
> +    }
> +    else
> +    {
> +        /* Domain will use the regular SPI range */
> +        d->arch.vgic.nr_espis =3D 0;
> +    }
> +#endif
> +
>      /* Limit the number of virtual SPIs supported to (1020 - 32) =3D 988=
  */
>      if ( nr_spis > (1020 - NR_LOCAL_IRQS) )
>          return -EINVAL;
> @@ -145,7 +306,7 @@ int domain_vgic_init(struct domain *d, unsigned int n=
r_spis)
>          return -ENOMEM;
> =20
>      d->arch.vgic.pending_irqs =3D
> -        xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis);
> +        xzalloc_array(struct pending_irq, vgic_num_spi_lines(d));
>      if ( d->arch.vgic.pending_irqs =3D=3D NULL )
>          return -ENOMEM;
> =20
> @@ -156,12 +317,16 @@ int domain_vgic_init(struct domain *d, unsigned int=
 nr_spis)
>      for ( i =3D 0; i < DOMAIN_NR_RANKS(d); i++ )
>          vgic_rank_init(&d->arch.vgic.shared_irqs[i], i + 1, 0);
> =20
> +    ret =3D init_vgic_espi(d);
> +    if ( ret )
> +        return ret;
> +
>      ret =3D d->arch.vgic.handler->domain_init(d);
>      if ( ret )
>          return ret;
> =20
>      d->arch.vgic.allocated_irqs =3D
> -        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_irqs(d)));
> +        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_alloc_irqs(d=
)));
>      if ( !d->arch.vgic.allocated_irqs )
>          return -ENOMEM;
> =20
> @@ -195,9 +360,27 @@ void domain_vgic_free(struct domain *d)
>          }
>      }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( i =3D 0; i < d->arch.vgic.nr_espis; i++ )
> +    {
> +        struct pending_irq *p =3D spi_to_pending(d, ESPI_IDX2INTID(i));
> +
> +        if ( p->desc )
> +        {
> +            ret =3D release_guest_irq(d, p->irq);
> +            if ( ret )
> +                dprintk(XENLOG_G_WARNING, "%pd: Failed to release virq %=
u ret =3D %d\n",
> +                        d, p->irq, ret);
> +        }
> +    }
> +#endif
> +
>      if ( d->arch.vgic.handler )
>          d->arch.vgic.handler->domain_free(d);
>      xfree(d->arch.vgic.shared_irqs);
> +#ifdef CONFIG_GICV3_ESPI
> +    xfree(d->arch.vgic.ext_shared_irqs);
> +#endif
>      xfree(d->arch.vgic.pending_irqs);
>      xfree(d->arch.vgic.allocated_irqs);
>  }
> @@ -331,6 +514,8 @@ void arch_move_irqs(struct vcpu *v)
>          if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p-=
>status) )
>              irq_set_affinity(p->desc, cpu_mask);
>      }
> +
> +    arch_move_espis(v);
>  }
> =20
>  void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n)
> @@ -538,6 +723,8 @@ struct pending_irq *irq_to_pending(struct vcpu *v, un=
signed int irq)
>          n =3D &v->arch.vgic.pending_irqs[irq];
>      else if ( is_lpi(irq) )
>          n =3D v->domain->arch.vgic.handler->lpi_to_pending(v->domain, ir=
q);
> +    else if ( is_espi(irq) )
> +        n =3D espi_to_pending(v->domain, irq);
>      else
>          n =3D &v->domain->arch.vgic.pending_irqs[irq - 32];
>      return n;
> @@ -547,6 +734,9 @@ struct pending_irq *spi_to_pending(struct domain *d, =
unsigned int irq)
>  {
>      ASSERT(irq >=3D NR_LOCAL_IRQS);
> =20
> +    if ( is_espi(irq) )
> +        return espi_to_pending(d, irq);
> +

here you can just do

idx =3D virq_to_idx(virq);

>      return &d->arch.vgic.pending_irqs[irq - 32];

and

return &d->arch.vgic.pending_irqs[idx];

instead

>  }
> =20
> @@ -668,6 +858,9 @@ bool vgic_reserve_virq(struct domain *d, unsigned int=
 virq)
>      if ( !vgic_is_valid_line(d, virq) )
>          return false;
> =20
> +    if ( is_espi(virq) )
> +        return vgic_reserve_espi_virq(d, virq);
> +

here you can just do

idx =3D virq_to_idx(virq)

>      return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);

and then just

return !test_and_set_bit(idx, d->arch.vgic.allocated_irqs);


>  }
> =20
> @@ -685,7 +878,7 @@ int vgic_allocate_virq(struct domain *d, bool spi)
>      else
>      {
>          first =3D 32;
> -        end =3D vgic_num_irqs(d);
> +        end =3D vgic_num_alloc_irqs(d);
>      }

I thinj you need to recalculate "virq" value at the end of this
function. You'll return index in bitfield, but this is not the same is
IRQ number in case of eSPIs. The helpers I mentioned before can help here.

> =20
>      /*

Lastly, I think that it is very wasteful to allocate pending_irqs as
continuous array, because it will consist mostly of unused entries,
especially with eSPIs enable. Probably, better approach will be to use radi=
x
tree. As a bonus, you can use IRQ line number as a key, and get rid of
all these is_espi() checks and mappings between IRQ number and index in
the array.  But this is a much more drastic change, and I don't think that =
it
should be done in this patch series...

--=20
WBR, Volodymyr=

