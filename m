Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6252B38EE3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 01:02:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097099.1451560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urP9a-0003FR-Dc; Wed, 27 Aug 2025 23:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097099.1451560; Wed, 27 Aug 2025 23:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urP9a-0003Da-Ao; Wed, 27 Aug 2025 23:02:06 +0000
Received: by outflank-mailman (input) for mailman id 1097099;
 Wed, 27 Aug 2025 23:02:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSw+=3H=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1urP9Z-0003DT-Nj
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 23:02:05 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8c6f468-8399-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 01:02:04 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by VI1PR03MB9965.eurprd03.prod.outlook.com
 (2603:10a6:800:1cb::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Wed, 27 Aug
 2025 23:01:59 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9073.016; Wed, 27 Aug 2025
 23:01:59 +0000
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
X-Inumbo-ID: d8c6f468-8399-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ui0/caiXpUIuMCeH1P9Ie86ehaD/DCzwF1PlfWmhFM427CkvsrEvOGW6g0YBhxPvJaTgs4Q3Uh2MwZUbTwmFqQgCWVaCD7Fij6YWpcHxpo3ZP/2oyqzvj50Gg7XqxhRvYS3xrcb6fLrFQsrWnqfVgOSkYBjMRXcV/V2hK02ezYXCP9iMFtYR5xBneSc0emZBMgtYqUHdxH15XX6Ya+rGzr2KlHgq9WhhEhZx6FvVY0HimDO3sKwy5y8OLbx0pIgGHIVkbJqwkvLyJycWXZhAILPDqNBb8jV0f9KE0R0QZGB46DpxbowAN0nKDjHHwRmae13IgGXk6IUA9JZCg9cTbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuUwPgy+7Di8KAQZUAo/6G5YyVPcylfnwa49XnKam2o=;
 b=NZA9NLp3X+uywhytod1wGAEUTouZiO2vFYbpWMJq7E2nN6n17OfgQXo3NrDYXDazUi89TvesqlFyIFWDBYvyL7rCqzNE/Qgnscw6Po5c9hFJ82N6YORRcpSioPUEOSJIZAfZJghIlqnX1+Hk5JwzcFsEvATUTV4AJ12Ph61xcCnYoKveX+ZpzZs0f7QnB511+SwnQHnucCiEIA1PCT3jYrZuVz7qJiKOj68yGkDzA6IVg/IUuvdoscI8f1m1ec0fRPWziZhm+tp7Rmnz0Fzo+nG31EalFlrI2UHHGHs1PHkjq9uznsr0EdF5oxjzF8jmSgD3DJsfUe4cQF4lOZRTig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuUwPgy+7Di8KAQZUAo/6G5YyVPcylfnwa49XnKam2o=;
 b=sP2PZW5cD7T3K2Nrm4tP5e1O4ZYOaLr5P0sAIIDdrqXSDYCpGwR5HU0Vzglbp90qupEyCkwfSkyqlIWlNG4JwfqBNk5pbGZJn0yQM/le/a+ViH0VZwhG9RfaRCGax1GwgoS6HJRvzVlFjlDdehWUT6cQcaq0rvXG4GY8jzG+DyglCR9spBejhxE/NJlOCf8+h1N88DznfmqCV0ilzKxjXdOgWvoBLy+CvPSCmp0iwm2YQ7kJM5bIy9b3Gyw9mys/TP2q1qYCDMRTjjI2iIepsLn2eihBf7PZ+SqKc6eS5tP7dI6dCcyVXD+ig4QyFq7A17SHtoFCLYsZV1oq/gduMA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v4 08/12] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Topic: [PATCH v4 08/12] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Index: AQHcF3/OB02ss8SP00K1+48v78FFnQ==
Date: Wed, 27 Aug 2025 23:01:59 +0000
Message-ID: <87cy8g1i8p.fsf@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
	<9e8a11b024833c1b91b8806e7708bf35b04a8f6e.1756317702.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <9e8a11b024833c1b91b8806e7708bf35b04a8f6e.1756317702.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Wed, 27 Aug 2025 18:24:19 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|VI1PR03MB9965:EE_
x-ms-office365-filtering-correlation-id: 8122c3f1-1b5e-4af6-ecce-08dde5bdba59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?PW30vkocCdFIWEUbHDOrWRMF1/AcMyGkaBTUhNHrlHIOlgu+79wUhLESUN?=
 =?iso-8859-1?Q?xco5D9waH2UvFkxoRnsFa5PrwsmTEAQh2CyJ8AtG8x6ugPMCbF5NA7gt+X?=
 =?iso-8859-1?Q?7jqUrq2EnFiLwkeGQ0AvDCuYIimvza9cWDiQVqBBO1DveSwFpvlSh0FusN?=
 =?iso-8859-1?Q?G+zQco5uttGjtw+7gYr0/tgzfTGIold1b8TDujQVpAnKsZ16PmCPyeT3Cr?=
 =?iso-8859-1?Q?5y7qNtOs+WFhSBWab5VZ0t09JBdtJSHF9VlXC/qPVWv7+p4lsGp8MpJjSd?=
 =?iso-8859-1?Q?Xi0HViVYL+Pqekqf7uApAIq3TXj4fmVxwAnCaar08U3EQTaUmlzRsYw0I8?=
 =?iso-8859-1?Q?MrfaERdtLh49NvWUSvdyVN5FzMHmanh6Nt63GLaO1XpxeNNiIyrg9t1Avm?=
 =?iso-8859-1?Q?fYZzVY2o6x2CgsJhC5wuugrMJV+1WTyxWh/2F+fp8aOQAscYduFl+2EZS4?=
 =?iso-8859-1?Q?yaNpyxyCHY3ho7svUdLEnhZzX4zG8b2ij5JFoeEXyOP+lt/JMEWGpRPyRi?=
 =?iso-8859-1?Q?0V/MrgfHYEvqmfz32C0Ev6e2gt+SZ576AyHULYYoIn67i/G+lj351BrpD6?=
 =?iso-8859-1?Q?lTj+8Jrc9ZKX2PSg2UrH9MWhZvWLEFy5C+czdntW4P61fZ4qYW8VSNc48/?=
 =?iso-8859-1?Q?/KYwZG3MMwEgha6N7BnFDxvVnh6qTJKwrYyuQCKRDN+grQarG8KXOd23C6?=
 =?iso-8859-1?Q?wmdsn9sDLpyTcKOF6R8//B9y/dSHBgjl3Uu0t5bhBNC2Ym/vOJPbazbRvZ?=
 =?iso-8859-1?Q?uzfymRIy2IKAyGOHcYILmiUblNnG+o+hdLt1PcvOr7CaUcQqgQEKWYpT0d?=
 =?iso-8859-1?Q?60UVTT+kywtPyB0p484FximJO0EUQrT79h6UUYx2r9LhwCMjCiR1jJ15Ya?=
 =?iso-8859-1?Q?eCR7BknrNkesQCXYhtyaLFcN4W/W0sXl5IV1s9+kcqd9v/T4JqAkM4dF+U?=
 =?iso-8859-1?Q?7mPZVDHrN6bcdrevLoC90AKnx3drwRh9TTzpmlkwhe0NZ0Yrl9nMFIaU92?=
 =?iso-8859-1?Q?wjAvdOa4sVtpgvVUqOSigFtfUvYQydcPXx5PrQy/XCsvlYZMHMPq7XRy/B?=
 =?iso-8859-1?Q?3gHQDDDEjTH+Hvvoq1ESM5RnINERPkYAS7Qt/AvV2kV29+7f33v/EZu0mB?=
 =?iso-8859-1?Q?gcjJSIaeCJK/20xEMQAb/zFEiZUcPiPNSUhI2KMDnre1i/9Le8QoFrh9sU?=
 =?iso-8859-1?Q?bQBGkHU7XOe7dWGuJup7rKGNPtsr2K4P8x6XYxV+C69GcKdkI5+OlRY4qK?=
 =?iso-8859-1?Q?rG65jfIOguzZbBt/KXH0dQWH7yRABL2Uht6ZjTVUsBnkAYzxsaVqrT0MN0?=
 =?iso-8859-1?Q?yLgCbkyYBN6qpEqUBJkNLNbVs8n1fvZQKtu5nQvQAwIDklCtlz6ynFYVby?=
 =?iso-8859-1?Q?Bp9g8BEu/eD1cvYOO4sS8j19NUv5dt4IgbhfX07PSJ6tYxroeylV6njR4n?=
 =?iso-8859-1?Q?k044iaIJ5tm1BHMM/1yNtaJmqorvDkitjJLUdwb4F5boTC30HQUbJl3Q4U?=
 =?iso-8859-1?Q?vtt9Nwi3+CGSa2qwmzs9oZyDMhe1t4I+q6co2CczTbWg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?RQ1MUmRU+WPpbLUlWKZVaZGkIQpxp2Sz+p078QMk8H7xyYASYuri4qPeIi?=
 =?iso-8859-1?Q?GKnPA15G3xBKQwng7cJ67jjUrWygRiiLBb0ztGH9r4dJN3muOQ8fWbUidM?=
 =?iso-8859-1?Q?bJSiPcWf88/OVZ+r/vHbevTLNv3wogCCNvAEP6TMDPAeD2PX7aFGKhQB2d?=
 =?iso-8859-1?Q?as36nErXP0E23rM+KIHOpTKkWBAfHJoEjeQMzck2dd3o/hO0/FsJfD+P+W?=
 =?iso-8859-1?Q?MtU9F0lCp+D7+xXDkkT+vNkyY0kLieQA7l8bGhZ01S0QlGbmJwzaEt59dD?=
 =?iso-8859-1?Q?bGGCPfDZQvTmIViGbkGXZYT1cyzvzyj0UeD/exygoWf/5O+izPtIXRvAo6?=
 =?iso-8859-1?Q?tJgu3DafK7pYTaQ5cUYYj0YDsSRhmPooXxUUP6l1S4ktpoyrGkTBg5+jNp?=
 =?iso-8859-1?Q?g4aRjsp8IFaF30eq+scSXBZSUM2bauy4yR94S5DTIHBaUYfibMELInMbYA?=
 =?iso-8859-1?Q?6W6uiGZHVzg1R7XxQJmeOfCmvZUUOzSGoo/Knh1FDVCWt5VrVrNFMGDSj7?=
 =?iso-8859-1?Q?QQwVyC4u2zU/tmaD0UVuuaIXSLoIDKs1M32pqNMTDIjHQn8mCvnQ3P5yeN?=
 =?iso-8859-1?Q?dDZdpPBfRJ5xCseHm/rKGnulfhPMEPW1AsZL/wtKT0B7UzdxD0uZ8zUA/o?=
 =?iso-8859-1?Q?u6oRF/O41FvJlY3GYqjYLNQXT7e0fsL+EJ6Cg8q//4SHTA48xj7dF5ln2l?=
 =?iso-8859-1?Q?SMY6Q4uetlAmn0QJQ3oE95xUcRTt5Czmz5gF8Z5UDkKDYwAY2AL8hTFGru?=
 =?iso-8859-1?Q?CZ0+7afmvpMB1ji/amE04DdIDt8IaWODCWf/dwZrJ7MEukgPxKwIcImhXT?=
 =?iso-8859-1?Q?H+YgSY17vsJI8ArqUlv4Jn1z8OQHB/G/vPI7teomozIqzpYHdorSnLASJW?=
 =?iso-8859-1?Q?2u+IzaPwr158RrJLvZbIaB/grFA9JQPcuZsQTg1c3ryzAiAejqKwLm1+0X?=
 =?iso-8859-1?Q?EcXndD3wFd3QUYAHBDavnORQ1MGcsbxWJaZGdRi1n6umr0RWr2HznPw6fU?=
 =?iso-8859-1?Q?mcg+CVLpUWDvGyXT0mxMW4ATn2sK6zaROyp0ggn8c9cGQMxjiO5Yx1Ocm5?=
 =?iso-8859-1?Q?LJEkcCt11C49LwW1JEhYEvsxtl5N+liLR/qxUA0p45BdD8+QAzYA8g27bK?=
 =?iso-8859-1?Q?60yfZXheI9GX//GkD9JzZlDVfvDcNMgjWzj/6VpJBavh5MbNgbrg6kFF79?=
 =?iso-8859-1?Q?v2bLsyCXn9nsPZtkVKNFJbmE9CTWodxpKR2BQ5VNIp5JSscQlgG3AOmQjv?=
 =?iso-8859-1?Q?MVlk6MKPpX+5EcPX5arY6uz+M9EINconaFOId6yEkVWYXcP/s8AKItYHJ0?=
 =?iso-8859-1?Q?8C9RtcGOcC5PwG+cHGb1Qy7bUuU6lK9C6tIzyyi1sfckDoQuf52hcgXsNf?=
 =?iso-8859-1?Q?5gyzeQ1TexTMNTuQWaJWsNV+aQA2YnNOlZt4RuQDCevR4KTxUUXKvhz2jp?=
 =?iso-8859-1?Q?xaAgLyqWQIStyzVx2j4DGjVfH8rSJI7jHIHwQyuY/FBvPcNrKe+6Mtm8Jc?=
 =?iso-8859-1?Q?wKdkFiUnrGvcuifUOXvSVOx9GL9w+wuGgiyLvsbkp+gB4Vuh9MHlPR2VKo?=
 =?iso-8859-1?Q?XTjizY4yxuiIPSsygF8UHaEHi1SJbDXcgGV9iqQjnbegQS2DNdUSL73V8T?=
 =?iso-8859-1?Q?2W98i3F53GBcMmgCPyuIZRg43BCMStZ4NbDdZUSbsCbISs1so6SOFn4Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8122c3f1-1b5e-4af6-ecce-08dde5bdba59
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 23:01:59.4104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T03REIiA1upsxa6sY/V4CJRCmyNrkI1eTeyNCU4PNj3epRuzS1Hpoahgtd+BFFmC/N+FOWo3uxVv8/BAHHuB1HJAUxdYKs1XMsPTPDhWYt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB9965

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
> Changes in V4:
> - added has_espi field to simplify determining whether a domain is able
>   to operate with eSPI

I don't think that this is a good idea. You already have an invariant that
tells if domain has eSPIs: d->nr_espis !=3D 0. If you introduce a new
field, you now have to keep these two values coherent or deal with possible=
 cases
like d->nr_espis =3D=3D 0 && d->has_espi =3D=3D true

Also, this new field is not used anywhere, so why adding it in the first
place?

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
>  xen/arch/arm/include/asm/vgic.h |  20 +++
>  xen/arch/arm/vgic.c             | 213 +++++++++++++++++++++++++++++++-
>  2 files changed, 230 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index 3e7cbbb196..fb4cea73eb 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -146,6 +146,12 @@ struct vgic_dist {
>      int nr_spis; /* Number of SPIs */
>      unsigned long *allocated_irqs; /* bitmap of IRQs allocated */
>      struct vgic_irq_rank *shared_irqs;
> +#ifdef CONFIG_GICV3_ESPI
> +    struct vgic_irq_rank *ext_shared_irqs;
> +    int nr_espis; /* Number of extended SPIs */
> +    /* To simplify determining whether a domain is able to operate with =
eSPI */
> +    bool has_espi;
> +#endif
>      /*
>       * SPIs are domain global, SGIs and PPIs are per-VCPU and stored in
>       * struct arch_vcpu.
> @@ -243,6 +249,14 @@ struct vgic_ops {
>  /* Number of ranks of interrupt registers for a domain */
>  #define DOMAIN_NR_RANKS(d) (((d)->arch.vgic.nr_spis+31)/32)
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +#define DOMAIN_NR_EXT_RANKS(d) (((d)->arch.vgic.nr_espis+31)/32)
> +#define EXT_RANK_MIN (ESPI_BASE_INTID/32)
> +#define EXT_RANK_MAX ((ESPI_MAX_INTID+31)/32)
> +#define EXT_RANK_NUM2IDX(num) ((num)-EXT_RANK_MIN)
> +#define EXT_RANK_IDX2NUM(idx) ((idx)+EXT_RANK_MIN)
> +#endif
> +
>  #define vgic_lock(v)   spin_lock_irq(&(v)->domain->arch.vgic.lock)
>  #define vgic_unlock(v) spin_unlock_irq(&(v)->domain->arch.vgic.lock)
> =20
> @@ -302,6 +316,12 @@ extern struct vgic_irq_rank *vgic_rank_offset(struct=
 vcpu *v,
>                                                unsigned int b,
>                                                unsigned int n,
>                                                unsigned int s);
> +#ifdef CONFIG_GICV3_ESPI
> +extern struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v,
> +                                                  unsigned int b,
> +                                                  unsigned int n,
> +                                                  unsigned int s);
> +#endif
>  extern struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int =
irq);
>  extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n=
);
>  extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsigned int n)=
;
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 2bbf4d99aa..f4b80cb05f 100644
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
> @@ -117,6 +192,74 @@ int domain_vgic_register(struct domain *d, unsigned =
int *mmio_count)
>      return 0;
>  }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +/*
> + * The function behavior is the same as for regular SPIs (vgic_rank_offs=
et),
> + * but it operates with extended SPI ranks.
> + */
> +struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v, unsigned int =
b,
> +                                           unsigned int n, unsigned int =
s)
> +{
> +    unsigned int rank =3D REG_RANK_NR(b, (n >> s));
> +
> +    return vgic_get_rank(v, rank + EXT_RANK_MIN);
> +}
> +
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
> @@ -131,6 +274,38 @@ int domain_vgic_init(struct domain *d, unsigned int =
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
> +        d->arch.vgic.has_espi =3D true;
> +    }
> +    else
> +    {
> +        /* Domain will use the regular SPI range */
> +        d->arch.vgic.nr_espis =3D 0;
> +        d->arch.vgic.has_espi =3D false;
> +    }
> +#endif
> +
>      /* Limit the number of virtual SPIs supported to (1020 - 32) =3D 988=
  */
>      if ( nr_spis > (1020 - NR_LOCAL_IRQS) )
>          return -EINVAL;
> @@ -145,7 +320,7 @@ int domain_vgic_init(struct domain *d, unsigned int n=
r_spis)
>          return -ENOMEM;
> =20
>      d->arch.vgic.pending_irqs =3D
> -        xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis);
> +        xzalloc_array(struct pending_irq, vgic_num_spi_lines(d));
>      if ( d->arch.vgic.pending_irqs =3D=3D NULL )
>          return -ENOMEM;
> =20
> @@ -156,12 +331,16 @@ int domain_vgic_init(struct domain *d, unsigned int=
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
> @@ -195,9 +374,27 @@ void domain_vgic_free(struct domain *d)
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
> +                dprintk(XENLOG_G_WARNING, "d%u: Failed to release virq %=
u ret =3D %d\n",
> +                        d->domain_id, p->irq, ret);
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
> @@ -331,6 +528,8 @@ void arch_move_irqs(struct vcpu *v)
>          if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p-=
>status) )
>              irq_set_affinity(p->desc, cpu_mask);
>      }
> +
> +    arch_move_espis(v);
>  }
> =20
>  void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n)
> @@ -538,6 +737,8 @@ struct pending_irq *irq_to_pending(struct vcpu *v, un=
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
> @@ -547,6 +748,9 @@ struct pending_irq *spi_to_pending(struct domain *d, =
unsigned int irq)
>  {
>      ASSERT(irq >=3D NR_LOCAL_IRQS);
> =20
> +    if ( is_espi(irq) )
> +        return espi_to_pending(d, irq);
> +
>      return &d->arch.vgic.pending_irqs[irq - 32];
>  }
> =20
> @@ -668,6 +872,9 @@ bool vgic_reserve_virq(struct domain *d, unsigned int=
 virq)
>      if ( !vgic_is_valid_line(d, virq) )
>          return false;
> =20
> +    if ( is_espi(virq) )
> +        return vgic_reserve_espi_virq(d, virq);
> +
>      return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
>  }
> =20
> @@ -685,7 +892,7 @@ int vgic_allocate_virq(struct domain *d, bool spi)
>      else
>      {
>          first =3D 32;
> -        end =3D vgic_num_irqs(d);
> +        end =3D vgic_num_alloc_irqs(d);
>      }
> =20
>      /*

--=20
WBR, Volodymyr=

