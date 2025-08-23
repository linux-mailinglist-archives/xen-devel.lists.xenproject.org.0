Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5DDB32617
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 03:00:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090851.1447939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upccE-0003xM-0g; Sat, 23 Aug 2025 01:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090851.1447939; Sat, 23 Aug 2025 01:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upccD-0003tB-Tj; Sat, 23 Aug 2025 01:00:17 +0000
Received: by outflank-mailman (input) for mailman id 1090851;
 Sat, 23 Aug 2025 01:00:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yyzx=3D=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1upccC-0003G2-8e
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 01:00:16 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8716e7e5-7fbc-11f0-a32b-13f23c93f187;
 Sat, 23 Aug 2025 03:00:14 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DU0PR03MB8957.eurprd03.prod.outlook.com
 (2603:10a6:10:475::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Sat, 23 Aug
 2025 01:00:11 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.014; Sat, 23 Aug 2025
 01:00:11 +0000
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
X-Inumbo-ID: 8716e7e5-7fbc-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mn7LFo3at0OFVLimTKq6naFziCiNUX4AMdSZpk9/GsHqAwMWLZjTDlCHH2/QOaZZsOr/s/akr2XHm1sF4qGbktW5S/4lyRY0DtHuBN44Z8jfNZmO87Uod16ccZZ6kPrmw3gkhTJezFYabyXgqDADwIB7seJXXPOsyqvF77aAA+eHukMs6HoHMxfF1eSSz7odDc4Oyp2hpF6RpW9pcZFrL4Gr1l9djiUvV5kgdpNi2q8uPepH1ALfMFjc1PVUa832ElqLogDv4YyDgj+K2pr7QkF0z8Al7CBx4cGfpWRWMRSYq9nK721JEEolkdc2LyAegTv4Hunefv9sPYkCYAdCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FP2iG+XGnhGxacDewf6AQm7kuoYd8AZ/cXhmz0W95h4=;
 b=MKKIuR2e2ePDB9tfdgspoqaL0sAuKqv5xvP8sTJPCB5b5RKvAUIAr9JL69z35xgbs4HiYwLxig3GTm6cE7FbgwFdAO7Prc+XvvBLVEsWm0Oh7VqYw0hca2v6TuZhak3jW1qmc4pAKAmqbCHk1eavwoqBcJhJnLmZkC2Qs1zPMPDpJ31795ypNQ2yJXh5kJbjPUcUtLjFXW2btPSWxDMzSKTd4mthh1J49Y9gqX7FwRB0lXSmaU83K2M29jD4Qei+EUFIfLrvcCkpcbczklr1nyI24oz1Jap+yRJap5/AZ7fenFT4h8F4ZWB3x9+utvJiMkUMRls2EJJ0vQbcqwSeNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FP2iG+XGnhGxacDewf6AQm7kuoYd8AZ/cXhmz0W95h4=;
 b=FJn3OWJf5xBv6ZZ5fFS3K4Qi5V19eTy0zb7ZEmjOW7pmarRC5oXwsVFPYqeVyA0H0sjVOk11PYHOjfNsGek/88E6iNWMZ54PnMtelxWNvdbiB2D1C5WwhuXUovuDaYeAJfTsmN2GBNQZ9GCTlxBiVq8Mfyi862H6JZ7O3deZQsJKlNrjH0W0FD4xxDl3x3W2Ps+6efYlZCHkz3ULvQGzsTWkMtzFZjW73VdA7d35niExZuQDdOszOXYxrhK/84SVuRDDeQpeSGexSFoXoP3FAVSa+74OotPXlpkQZhKIZmMAmQgG3+irMx/+xpMqcN2HhgiiOE5AAAgRi2paSIO50w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mirela
 Simonovic <mirela.simonovic@aggios.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Saeed Nowshadi
	<saeed.nowshadi@xilinx.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>, Mykola
 Kvach <Mykola_Kvach@epam.com>
Subject: Re: [PATCH v5 07/12] xen/arm: Add support for system suspend
 triggered by hardware domain
Thread-Topic: [PATCH v5 07/12] xen/arm: Add support for system suspend
 triggered by hardware domain
Thread-Index: AQHcCwFfU+9GQNRu4k2nrD5uWqCz7A==
Date: Sat, 23 Aug 2025 01:00:11 +0000
Message-ID: <87ms7q97j9.fsf@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
	<c995126a9a61aecff7cb9a7c6fd28f091a332443.1754943875.git.mykola_kvach@epam.com>
In-Reply-To:
 <c995126a9a61aecff7cb9a7c6fd28f091a332443.1754943875.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Mon, 11 Aug 2025 23:48:03 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DU0PR03MB8957:EE_
x-ms-office365-filtering-correlation-id: 4c781c50-62da-440e-32cd-08dde1e069a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/6BL1+xZ2s3JwWO3mJZzePVW8a3Ek6i6h8FrtOcbj/dPMJXWI145M/JLKy?=
 =?iso-8859-1?Q?R16mB3GvV3NqMGh7l6HHbgEdJ8gcosFFHJ9ogHebrxmf85op2Qaxsddbzi?=
 =?iso-8859-1?Q?2FrhbaHG+hVZirYYt+N6JBKJI35ZuMrhu/48JtuZ055RBPqidzPWx3pRih?=
 =?iso-8859-1?Q?UC5eW8xzKxdDH1GyGVQvsT1dKI0giwRd0DqRKKkRKom667O7qv7I/6Y/Ng?=
 =?iso-8859-1?Q?5JktwaKzopVo4D7txXs6sGsVW2zQ/kryMBmywDTqNeNcxlkZGUOzi3Em2o?=
 =?iso-8859-1?Q?yLtMo0mhNwKHvV4foKYMx7/SOnxl4LwjiCwaUpIUl+LnpLaZdcXeAsdP1t?=
 =?iso-8859-1?Q?j/bT3apcWqKj1VvFdtIbE8AthTudTzwOEtZzo6Q1SqdgUhqRYbaahct0xa?=
 =?iso-8859-1?Q?rV3fhayrAzrfuP0S7I6S/VegVMMNhnm0D+BMMow0PFGn14k6nMX7VxH5sh?=
 =?iso-8859-1?Q?sLLpb3QGDZTQNox5KHjfq5bpm08a2DFE0kFnNbjS/A5sixFPdkhnTMVRpz?=
 =?iso-8859-1?Q?DjtyHPrRO5xWHt7opwWVwz3tTQS+Tj4E0yKD9cIWpZVjgvr5mlazpuPrFH?=
 =?iso-8859-1?Q?R8RLGuGiHE2VY17483sBKPBZCQReZg2iYlzcvEhJeci/pVbpDWtqTPJVoa?=
 =?iso-8859-1?Q?/JJ8K05pnoj02i6BIflVi5duvDXp9j+coNcGYqBC24bkutKsU6ZrXXaErp?=
 =?iso-8859-1?Q?PI85pTxDcIse+p/AwZJxYd29URcz4K6CX7dgRQHQHeH+w6nNn1Qk8cl9Gd?=
 =?iso-8859-1?Q?g10EiTVvB8yEepSg4gsQqskmtLnUdusrq5I8ZPmJiNUW7fpCbIzv8ir+kf?=
 =?iso-8859-1?Q?6nzx/kB/teUrM52pfzJbGWaQ0ml3+IaQQ36wUhUN9y6iA4VWH75sPthlYM?=
 =?iso-8859-1?Q?pLaCLkdwOwE+c1MiBQ7iNcABLFwuCY2/mcHuhtdsRq4RfczXX3neLQ3bPb?=
 =?iso-8859-1?Q?eQnqYuuNf5rxTXkDaAiLz0HM0XRjugYiQHWqj/2HLd2OC6cwu236u0zlan?=
 =?iso-8859-1?Q?YLvr0LOVrHIFxbpv1HmWGWLS1l4Iu+0SLgIY6NTAtvTAzmYwXTdC4kyzMQ?=
 =?iso-8859-1?Q?EOPoYoJvV0MM4HgualWlK6vWKhsKICOkTfOfQLJ1VvgYFtJeV0CrVq2YfW?=
 =?iso-8859-1?Q?TtgXhfh6XfcnJ9bCsRi2AEtJQxRJpzlr7zD9u2CeWF5T1aQCh7/tt35AjQ?=
 =?iso-8859-1?Q?kT5ma53zmR2eyfeqKeJ8vMa7FGVOxP51JzFVdbUHJ6y5qnsNt8Fn3da7+z?=
 =?iso-8859-1?Q?o8N5uCYbQOnf78YQcgbsosiOOAwl+OmdNHZsjGPdqkxpD17dyzqI254jgM?=
 =?iso-8859-1?Q?SpQoKH8KzLtm5QzKENa74w5QUabWo1BF7QnPrMNZejThdoCv3z4y7uNeuW?=
 =?iso-8859-1?Q?yrlYe0AOJTPVCeiJiQoMyCac/KSIv1sdn1T/DS8bolJm2+56crA1BhK4Kr?=
 =?iso-8859-1?Q?9XIGCwSKpTXNMfp0gFsHn5pPTd6eRn86q6qSuaJN0uJUAZr2zkoPzsMjJZ?=
 =?iso-8859-1?Q?ygFdVpiCraLY1xgvOuOwhZQTVJryY711JrOLYY9Q8hbg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?BQnJOv0m9f3v0Z5T1E8WF8n5eLyMLAoHF0pKo13ba5icCo+YFU0Wsri6u8?=
 =?iso-8859-1?Q?3Greg7RiMcQhXWhAeqNQYazV89o91qZH3/gJh5PzQMblXOjsy/af4HZOU1?=
 =?iso-8859-1?Q?k7idxk7vbu9ylifPqQrQiOSaFyu+5DunZK4KmY58FEfklLjugNpeFIeSIv?=
 =?iso-8859-1?Q?PVwWC4xj1hMa37/5Iv7bbasFDU3jPrnCTbZKUoGS8D4fE2z4hyqRzv4Z7f?=
 =?iso-8859-1?Q?yW3YiUg6Q47qwynyoQJkHxA6kg3eTZFPvGC24Nc/+gpktZ97yunLNgjMsv?=
 =?iso-8859-1?Q?pGV23AbhiHu9u0HQ+b6aANi40Eccw6J/FvgnAtMUt7Ac3LVBL+yEZGiW+w?=
 =?iso-8859-1?Q?ynGQE65phsmBiAyzheZ8KWx1OCM9grwBXF+MrUH+iGuuhzAZhV2acZtbkc?=
 =?iso-8859-1?Q?GUukjVe492c7vDlYXthzVxpdezRfbg/hJvXemsZg4VlfYeL/8Je/zKBhqS?=
 =?iso-8859-1?Q?xbYYtgV54p3WvsN0MaOEzcH7C4BnDByHEZtb4YhN8E7fLd3RplBBZcpcoO?=
 =?iso-8859-1?Q?NAwZZteT5szFtFu+PkW2gG+SJf63dZ4npFDRCR3+rCEyOmTaUiQdvLGW94?=
 =?iso-8859-1?Q?pbaVnkZXQ9D5UkW8088mNJsgdoKOYCBQWmOYkMSm2ThM7sr35CbmX68ZlI?=
 =?iso-8859-1?Q?ppxySYrwZDYugrLw+DCfPA0eqTKwABxF4pWpincKKEi9pWiH1jCqkyEo6a?=
 =?iso-8859-1?Q?lh8vK6rsAfIr/6iTw3/SSqVmnnS7NaMtZV8Oh3xmV5rOstzGgG0riZl91M?=
 =?iso-8859-1?Q?OjDThHhJEmufp+ed1AS04JKAUdiBiBtQEj1GdQQf8nTjgnhf7K16jrknSJ?=
 =?iso-8859-1?Q?6ko4632VAobruxfOd6La9S1CgD+r8BorgJfV1P6/zBce8P5k2DKrzxNP8b?=
 =?iso-8859-1?Q?oWodI2zwDMeZQedGwJDstoT2JLQ7lgPy9UO/C/xRvKl4QsAn4EUIok80af?=
 =?iso-8859-1?Q?u7yQnlODPhh+Alre0zuWKo1mFmyciHGxDE/a3dVUoGTBgTsB3fDAFPJSBu?=
 =?iso-8859-1?Q?gq8jrliDH8KWNGNmDZZlXdUG5wLGavAtzCco3uSbIyrUxhpIcuKDvwfB7r?=
 =?iso-8859-1?Q?zCS0tL6efIeTWKmAhLrb228bys5lsX+x9ZBDR7DXs8902Pc0ZWJCp77RZa?=
 =?iso-8859-1?Q?9B+SwfrFjlVbXIVViRXT5IJjDgKaASoLw3df0sr62EIvHb+pgmcartDyj6?=
 =?iso-8859-1?Q?FkMva9Esv+injSk7oHBsyM3zyJDeeeckRiRDHi9fNdpR5ZKflYjHc3GKLQ?=
 =?iso-8859-1?Q?rt+E1g9gao8Iru+n6I0FMiOsTHTWmS2zh8enJd/P21/yK1y26OLyE8i4s4?=
 =?iso-8859-1?Q?x4igWHf6FA1WBX8rWXo9JfN5zVKE2PXEig4n522t4geFCnN9BIzmHfKEQO?=
 =?iso-8859-1?Q?ZvXdjayR0GPYkCv2Zsb3dYLmA85OIygf6oMBSgzBwssItxPa1SU5u8RoDZ?=
 =?iso-8859-1?Q?6LQrBXyTQjh3Em4S0AO8l3fy5nx/X/hLz/a7t6RUSOEOt5J9ZB/GdqrU4j?=
 =?iso-8859-1?Q?Y7y6K1W974AZfg69kW07OD0XBfBMNlBoIvxRqJDmzBI64xHc56VnrH1r6H?=
 =?iso-8859-1?Q?qlDxyhqFXhWDDREYypGqE/nj+RlU5BitPSUYdzRL8bOVeuI4Kg14Gm7+tm?=
 =?iso-8859-1?Q?AqhC6tMXtCg+sINjd/58/F+JQLxmKrtVPXYDfjUHv3kANlbkbDZlAc3Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c781c50-62da-440e-32cd-08dde1e069a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2025 01:00:11.7482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mJy9d4YentVwA/Jp3e81HTiE1HWT528V77R1/es+D8CmvYD6MVu9i/fOgwVhUeS2R0/plHeot3FlrlqYMnnQIlw0sdpNaX3h6dvL/608C7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8957

Hi Mykola,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>
> Trigger Xen suspend when the hardware domain initiates suspend via
> SHUTDOWN_suspend. Redirect system suspend to CPU#0 to ensure the
> suspend logic runs on the boot CPU, as required.
>
> Introduce full suspend/resume infrastructure gated by CONFIG_SYSTEM_SUSPE=
ND,
> including logic to:
>  - disable and enable non-boot physical CPUs
>  - freeze and thaw domains
>  - suspend and resume the GIC, timer and console
>  - maintain system state before and after suspend
>
> Remove the restriction in the PSCI interface preventing suspend from the
> hardware domain.
>
> Select HAS_SYSTEM_SUSPEND for ARM_64.
>
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v5:
> - select HAS_SYSTEM_SUSPEND in ARM_64 instead of ARM
> - check llc_coloring_enabled instead of LLC_COLORING during the selection
>   of HAS_SYSTEM_SUSPEND config
> - call host_system_suspend from guest PSCI system suspend instead of
>   arch_domain_shutdown, reducing the complexity of the new code
> - update some comments
>
> Changes introduced in V4:
>   - drop code for saving and restoring VCPU context (for more information
>     refer part 1 of patch series)
>   - remove IOMMU suspend and resume calls until they will be implemented
>   - move system suspend logic to arch_domain_shutdown, invoked from
>     domain_shutdown
>   - apply minor fixes such as renaming functions, updating comments, and
>     modifying the commit message to reflect these changes
>   - add console_end_sync to resume path after system suspend
>
> Changes introduced in V3:
>   - merge changes from other commits into this patch (previously stashed)=
:
>     1) disable/enable non-boot physical CPUs and freeze/thaw domains duri=
ng
>        suspend/resume
>     2) suspend/resume the timer, GIC, console, IOMMU, and hardware domain
> ---
>  xen/arch/arm/Kconfig               |   1 +
>  xen/arch/arm/Makefile              |   1 +
>  xen/arch/arm/include/asm/suspend.h |  22 +++++
>  xen/arch/arm/suspend.c             | 151 +++++++++++++++++++++++++++++
>  xen/arch/arm/vpsci.c               |  12 ++-
>  xen/common/domain.c                |   4 +
>  6 files changed, 190 insertions(+), 1 deletion(-)
>  create mode 100644 xen/arch/arm/include/asm/suspend.h
>  create mode 100644 xen/arch/arm/suspend.c
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index a0c8160474..ccdbaa5bc3 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -8,6 +8,7 @@ config ARM_64
>  	depends on !ARM_32
>  	select 64BIT
>  	select HAS_FAST_MULTIPLY
> +	select HAS_SYSTEM_SUSPEND if UNSUPPORTED
>  	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
> =20
>  config ARM
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index f833cdf207..3f6247adee 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -51,6 +51,7 @@ obj-y +=3D setup.o
>  obj-y +=3D shutdown.o
>  obj-y +=3D smp.o
>  obj-y +=3D smpboot.o
> +obj-$(CONFIG_SYSTEM_SUSPEND) +=3D suspend.o
>  obj-$(CONFIG_SYSCTL) +=3D sysctl.o
>  obj-y +=3D time.o
>  obj-y +=3D traps.o
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/as=
m/suspend.h
> new file mode 100644
> index 0000000000..78d0e2383b
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_ARM_SUSPEND_H__
> +#define __ASM_ARM_SUSPEND_H__
> +
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +int host_system_suspend(void);
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
> +#endif /* __ASM_ARM_SUSPEND_H__ */
> +
> + /*
> +  * Local variables:
> +  * mode: C
> +  * c-file-style: "BSD"
> +  * c-basic-offset: 4
> +  * tab-width: 4
> +  * indent-tabs-mode: nil
> +  * End:
> +  */
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> new file mode 100644
> index 0000000000..abf4b928ce
> --- /dev/null
> +++ b/xen/arch/arm/suspend.c
> @@ -0,0 +1,151 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/console.h>
> +#include <xen/cpu.h>
> +#include <xen/llc-coloring.h>
> +#include <xen/sched.h>
> +
> +/*
> + * TODO list:
> + *  - Test system suspend with LLC_COLORING enabled and verify functiona=
lity
> + *  - Implement IOMMU suspend/resume handlers and integrate them
> + *    into the suspend/resume path (IPMMU and SMMU)
> + *  - Enable "xl suspend" support on ARM architecture
> + *  - Properly disable Xen timer watchdog from relevant services
> + *  - Add suspend/resume CI test for ARM (QEMU if feasible)
> + *  - Investigate feasibility and need for implementing system suspend o=
n ARM32
> + */
> +
> +/* Xen suspend. Note: data is not used (suspend is the suspend to RAM) *=
/
> +static long system_suspend(void *data)
> +{
> +    int status;
> +    unsigned long flags;
> +
> +    BUG_ON(system_state !=3D SYS_STATE_active);
> +
> +    system_state =3D SYS_STATE_suspend;
> +    freeze_domains();
> +    scheduler_disable();
> +
> +    /*
> +     * Non-boot CPUs have to be disabled on suspend and enabled on resum=
e
> +     * (hotplug-based mechanism). Disabling non-boot CPUs will lead to P=
SCI
> +     * CPU_OFF to be called by each non-boot CPU. Depending on the under=
lying
> +     * platform capabilities, this may lead to the physical powering dow=
n of
> +     * CPUs. Tested on Xilinx Zynq Ultrascale+ MPSoC (including power do=
wn of
> +     * each non-boot CPU).

I don't think that the last part of the comment is relevant in upstream.

> +     */
> +    status =3D disable_nonboot_cpus();
> +    if ( status )
> +    {
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_nonboot_cpus;
> +    }
> +
> +    time_suspend();
> +
> +    local_irq_save(flags);
> +    status =3D gic_suspend();
> +    if ( status )
> +    {
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_irqs;
> +    }
> +
> +    printk("Xen suspending...\n");
> +
> +    console_start_sync();
> +    status =3D console_suspend();
> +    if ( status )
> +    {
> +        dprintk(XENLOG_ERR, "Failed to suspend the console, err=3D%d\n",=
 status);
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_console;
> +    }
> +
> +    /*
> +     * Enable identity mapping before entering suspend to simplify
> +     * the resume path
> +     */
> +    update_boot_mapping(true);
> +

This puzzles me. I expected actually PSCI suspend call here.

> +    system_state =3D SYS_STATE_resume;
> +    update_boot_mapping(false);
> +
> + resume_console:
> +    console_resume();
> +    console_end_sync();
> +
> +    gic_resume();
> +
> + resume_irqs:
> +    local_irq_restore(flags);
> +    time_resume();
> +
> + resume_nonboot_cpus:
> +    /*
> +     * The rcu_barrier() has to be added to ensure that the per cpu area=
 is
> +     * freed before a non-boot CPU tries to initialize it (_free_percpu_=
area()
> +     * has to be called before the init_percpu_area()). This scenario oc=
curs
> +     * when non-boot CPUs are hot-unplugged on suspend and hotplugged on=
 resume.
> +     */
> +    rcu_barrier();
> +    enable_nonboot_cpus();
> +    scheduler_enable();
> +    thaw_domains();
> +
> +    system_state =3D SYS_STATE_active;
> +
> +    /* The resume of hardware domain should always follow Xen's resume. =
*/
> +    domain_resume(hardware_domain);
> +
> +    printk("Resume (status %d)\n", status);
> +    return status;
> +}
> +
> +int host_system_suspend(void)
> +{
> +    int status;
> +
> +    /* TODO: drop check after verification that features can work togeth=
er */
> +    if ( llc_coloring_enabled )
> +    {
> +        dprintk(XENLOG_ERR,
> +                "System suspend is not supported with LLC_COLORING enabl=
ed\n");
> +        return -ENOSYS;
> +    }
> +
> +    /*
> +     * system_suspend should be called when Dom0 finalizes the suspend
> +     * procedure from its boot core (VCPU#0). However, Dom0's VCPU#0 cou=
ld
> +     * be mapped to any PCPU (this function could be executed by any PCP=
U).
> +     * The suspend procedure has to be finalized by the PCPU#0 (non-boot
> +     * PCPUs will be disabled during the suspend).
> +     */
> +    status =3D continue_hypercall_on_cpu(0, system_suspend, NULL);
> +
> +    /*
> +     * If an error happened, there is nothing that needs to be done here
> +     * because the system_suspend always returns in fully functional sta=
te
> +     * no matter what the outcome of suspend procedure is. If the system
> +     * suspended successfully the function will return 0 after the resum=
e.
> +     * Otherwise, if an error is returned it means Xen did not suspended=
,
> +     * but it is still in the same state as if the system_suspend was ne=
ver
> +     * called. We dump a debug message in case of an error for debugging=
/
> +     * logging purpose.
> +     */
> +    if ( status )
> +        dprintk(XENLOG_ERR, "Failed to suspend, errno=3D%d\n", status);
> +
> +    return status;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index 67d369a8a2..757e719ea7 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -4,6 +4,7 @@
>  #include <xen/types.h>
> =20
>  #include <asm/current.h>
> +#include <asm/suspend.h>
>  #include <asm/vgic.h>
>  #include <asm/vpsci.h>
>  #include <asm/event.h>
> @@ -214,9 +215,10 @@ static int32_t do_psci_1_0_system_suspend(register_t=
 epoint, register_t cid)
>      struct vcpu *v;
>      struct domain *d =3D current->domain;
> =20
> -    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> +#ifndef CONFIG_SYSTEM_SUSPEND
>      if ( is_hardware_domain(d) )
>          return PSCI_NOT_SUPPORTED;
> +#endif
> =20
>      /* Ensure that all CPUs other than the calling one are offline */
>      domain_lock(d);
> @@ -234,6 +236,14 @@ static int32_t do_psci_1_0_system_suspend(register_t=
 epoint, register_t cid)
>      if ( rc )
>          return PSCI_DENIED;
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    if ( is_hardware_domain(d) && host_system_suspend() )
> +    {
> +        domain_resume_nopause(d);
> +        return PSCI_DENIED;
> +    }
> +#endif
> +
>      rc =3D do_setup_vcpu_ctx(current, epoint, cid);
>      if ( rc !=3D PSCI_SUCCESS )
>      {
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index c3609b0cb0..414a691242 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1311,7 +1311,11 @@ int domain_shutdown(struct domain *d, u8 reason)
>          d->shutdown_code =3D reason;
>      reason =3D d->shutdown_code;
> =20
> +#if defined(CONFIG_SYSTEM_SUSPEND) && defined(CONFIG_ARM)
> +    if ( reason !=3D SHUTDOWN_suspend && is_hardware_domain(d) )
> +#else
>      if ( is_hardware_domain(d) )
> +#endif
>          hwdom_shutdown(reason);
> =20
>      if ( d->is_shutting_down )

--=20
WBR, Volodymyr=

