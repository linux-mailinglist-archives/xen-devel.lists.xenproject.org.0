Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E29FAA2E96D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:31:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884561.1294295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR3z-0004vp-Fk; Mon, 10 Feb 2025 10:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884561.1294295; Mon, 10 Feb 2025 10:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR3z-0004tu-CW; Mon, 10 Feb 2025 10:30:51 +0000
Received: by outflank-mailman (input) for mailman id 884561;
 Mon, 10 Feb 2025 10:30:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzWh=VB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1thR3x-0004Pl-3C
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:30:49 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17edddeb-e79a-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 11:30:48 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GVXPR03MB8404.eurprd03.prod.outlook.com
 (2603:10a6:150:6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 10:30:44 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 10:30:44 +0000
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
X-Inumbo-ID: 17edddeb-e79a-11ef-a075-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxMNDv95FbiEhQnwSWZyiXdw5um9rSIfnv4IMaR0/QbNXF7TmGQiP/ySNRYTL+t38WkLriH3y85R+PuaMqhgSUH3mp2LVUY0IzNI7SxaoszuaW2+Ee/KXLTpTe8rEcb1mrB6fpxOpN+Y6kHv/sgtnqLut79vN3tVOH5s5X7sPMyqUrgITNUJX4UI8rkZoh/XwBf6W/aYGIQDVbTNDCzOI9g8OHDMfLfe8VvUPMDrUgM3SapKibmC7B9gfQPKYGcyZR1vsfdvw1SfZCfaWytW9l6djI0S0K2l/iiC9FT9gMMYJL51rzkslOarVCd11/YQ9UNnGRNG60GiKlEFu8gxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8ogDqoe1xUm7OYt5C1WUyKhVK0zheAKGwiUfGKwWu0=;
 b=h66695cLCoeMYQxa9vqk3bLJs1aZ5E8KnOfjZthUqtrADkT1LZ8p95gR/bYTjlXm8FuX5Qs83U+p0ErGDcH4ZcVeHswoMckaBF3rJVIrGZXykApsGPzguVzV6gdVZdOOj+cdFV1vz4XNxR0yt3lxXKjDqzICbAUXnC6KNfXVMmId0dEn5AcH5l7+yY4WCq+v5CD+h3KTNy/3TXkRaN6ElQIuOSi1gwNWQP0eHohgj/jI+5rqSV7g/TlWmH14O3dNtFunWMfql6+a7TvYfn6eaWMV/KQruY9K2gLRjK4MmQ4HOe8R7CiFpg3lui0TcUlXNXfge40sDjUEmIt+XoZgQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8ogDqoe1xUm7OYt5C1WUyKhVK0zheAKGwiUfGKwWu0=;
 b=IY+vQ13/Krn4wdg3K+ihh+TSPulxuKo1mCZ4w9YW9G0D9D6X7CBssYgOF++J0MzgFoYPUFakkM2fMGZ+B7cFc7aFd/T0JJgUulmxrGVEVZCvfd7yI1t8BSB1F9ZKrsiRUb8BEggUaWQd0yiOgESbQI/nwxb0ZZx6HuBUREwu1FQvnNDVVs3Pp9xOXbhCH/O9dnE5ChKFuu0/gS3vPlCVDNBfyIinu3U/KrmBr5JD/Yb+0bOzDAmt28KR/g+6SuGauvcfyYyXFJAZHS1+e4X7tq++oZlnQfu9kpBknyTGSe6GponwlFzgFFXNsZnasrF6WoGLCIEanhlPhpje8bcTfg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v8 2/8] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids API
Thread-Topic: [PATCH v8 2/8] iommu/arm: Introduce
 iommu_add_dt_pci_sideband_ids API
Thread-Index: AQHbe6bXkeUuupR7FUWii7Y2X2QPjw==
Date: Mon, 10 Feb 2025 10:30:44 +0000
Message-ID:
 <67b9bd138c12c0df35e5c4b3137c30ad345097d5.1739182214.git.mykyta_poturai@epam.com>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1739182214.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GVXPR03MB8404:EE_
x-ms-office365-filtering-correlation-id: fd5751e9-05b1-4c33-f160-08dd49bdf99f
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ZMf/rT7q0qrPOin2aZeSnEzkx5uU1AxYuaSV3VcUxUjxX40emWfQSGkWlU?=
 =?iso-8859-1?Q?619lNJKk6ZrbmsubKFseC85ES2giVStoondvQ5mORkpHSnkTmh2imtLXxn?=
 =?iso-8859-1?Q?h43GFHistqaGumWRCLmPb4tU3xGS7vAUeHUO6TzpMOH65oFcUfcYTRf54n?=
 =?iso-8859-1?Q?0FKcBf1nPdNOKHuHzQGE+waK3pWXiCYzOezsPU1LUMIlcDnHk+qQ+mw8yy?=
 =?iso-8859-1?Q?wyhmU3QzN9AFM1FIabU/xbaZ9zVJppbcGgL9x4ISKOhYprExmlXgNRSyEW?=
 =?iso-8859-1?Q?B/WZ6M5VGDCpeq7N1sW+xWn4XKk+ZfnnFDS58WoZVIi8XuEuZxiEZ5ZPFp?=
 =?iso-8859-1?Q?4JeHJi2JK7sfnirBwH1vp9TfoS3yjZYttGr8K63JZrtl354fMVjHBTLMxU?=
 =?iso-8859-1?Q?gx53cByJLoBUmo/oiMpOH/uq5Ln+M+1IQp0uy+1+BM2oS0oSC7SSSznVX7?=
 =?iso-8859-1?Q?HgwinHcIg/xl+wI/4Xqen+WSYIAV1R9Anx+uJLvgwL3oWWg7e1rLgb1ue2?=
 =?iso-8859-1?Q?yOi/D4bEUHKW6RNfEDt784W0w38+5AeYoNhUwWcwQoP94lEpuprudcze28?=
 =?iso-8859-1?Q?uNUdqyOkX49ZbpNTu4SproG9gEfF3kv+AT0SPQqqk8CizLbSxRwG8BvMOq?=
 =?iso-8859-1?Q?qzCpb6Unn1tf/9VIrHCtve1D5cUzBbjgvFHh+oL29oDF2qWV9vg+UX71yZ?=
 =?iso-8859-1?Q?xApxnRehvktNQbdEXkk3UvE61HKulC/igtOobmwbzEiZQJ9xaNpZQCvF2B?=
 =?iso-8859-1?Q?kUQuhKOwror93j22koFVJcPYbKZGlMmUpQPuw1Br21ar3A/PDQqa0/n5/m?=
 =?iso-8859-1?Q?oLLzglBp5qJud8TbW3FS05/d6HpMxbZ+h7XCNifYID1rTyALUdXK3wdbGr?=
 =?iso-8859-1?Q?3N5ZXfr0OPlMAsDLMSmqk4O3EsmRs8fuFmIY05mruPmHyCl1wJK2tDqXqn?=
 =?iso-8859-1?Q?G89YCmwLmkv1hdCRKNNTau3NAXhQuKDgaDfuRaninHQ8l1xR83moo8uHcR?=
 =?iso-8859-1?Q?/Iiq2jqIs112LLQJQ5wICZv4jFzHTcA2UEIlKBvY8R0CpgBDE4djNe6hLt?=
 =?iso-8859-1?Q?h1eLeOTGiIZBIaOn4cTzwx7FnozpmwR1m9sL3aHnqWogARtmx4IhOVFRFX?=
 =?iso-8859-1?Q?HUEzRqvC1g8CyXq8AkZAMOPBxAeX/+fA0EyvBvufq2w/6x0lygDFpfKUHl?=
 =?iso-8859-1?Q?EP8xGCv+L2KsF0ZChIemuJBVC52OEPWigfFeH7EUx34Kxi2ziGdxzppCoI?=
 =?iso-8859-1?Q?/SlXcwrricdLgiiRoeZywVK3Uf5IHBDBIBPDJpCHQ0oz8TmSQ0+JK9UADe?=
 =?iso-8859-1?Q?txPIDpDgzC9SdzPxuc8EhneY11UcyVdjahAi9vLVf73s7tvHxUP61TqMEM?=
 =?iso-8859-1?Q?B3KWh5inaPKKG0wHGYUd5ErviOGOODYyXtkjeVTvpU/qBjb1GBc1LkH9jw?=
 =?iso-8859-1?Q?WnE5mcOT5tPo9CMWbxtCNRenMVCH+Pw6akf7HyGMpDq37YRW1qjzsghMj2?=
 =?iso-8859-1?Q?bwIOS5KdhfQ+ZrIg1cy7dM?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?sW+V88qhW5NuH4UZWiSaMc/knAtIc+FuSbcAfc17JVD0NvfrRt9NCeMo1U?=
 =?iso-8859-1?Q?eHcJPy43dHaxxqg8luL7TQRfQdP9Eq51HHgc/uT4nDajhOtsDpKbMctZ+R?=
 =?iso-8859-1?Q?8JF7GeYHEmB1VBfYwIf+Dxw6D1ds0JvWH1cQOPOwewYSFQn5y7o+TkYuvF?=
 =?iso-8859-1?Q?80QxPNOGqoRbPPqJuvWC2G1BLCqsq8mKocAheaPaA8Z1UJ0UM5S8sMOAS2?=
 =?iso-8859-1?Q?J45qwkmTQJGsOQfNsSX7fDgf+9mMjcMiUUB6fbgUjk5rojISOtwSZk41Me?=
 =?iso-8859-1?Q?KzKvH87Jxcwg39XPxPjKmjRYE3QZQxN2B0Wv+i8bXiX17Ok69bOdnhSkOh?=
 =?iso-8859-1?Q?iB6na9QAXqK9FqySuT0w3QiDfiQug/xhbJJSW3Dcxpgg4pe+vdJsPggpMu?=
 =?iso-8859-1?Q?Ib0i1tEHyBsErSxG4qM3c4FPs7fcFZZNhzzvRrDipXS+yD4P3XG7IHkD33?=
 =?iso-8859-1?Q?YM5WMfV21Lp5VyFFzJ37rjyQpKPX2OHwk3w0wGYGE7xTG3Ad6UNjzg+/iT?=
 =?iso-8859-1?Q?aWeD0JrJtjMyij/hknC0KDxIOgm2aIJBWmZgjHvFO+7ZHPe7+UTiHb7pky?=
 =?iso-8859-1?Q?GJlbNfEcmCZYv2lxt3ApEh+wb54GjaTtAzIzBr3VJzNh5bIlcAXWMVYUDX?=
 =?iso-8859-1?Q?DnW0++f3gQZauzLo0hLnOxSxtWBrzh8KVQFbiQZT/t5pIGobCTlJJZGmvH?=
 =?iso-8859-1?Q?h8O/KFrheOyCcG9ketpwjWJ/z5p/lcMLjrM71AK/yMiJ69Memr3kl202eF?=
 =?iso-8859-1?Q?zV7XonL0/1/0B3SU+DdvTpSYFCCg44GEmidh15JhQED0pcPy3512hMUwyI?=
 =?iso-8859-1?Q?33IbWA75iPIDWkh7x6h9ljKwKk4pmYi7i6v6ICCh38B2sdL96+CZXkIEK4?=
 =?iso-8859-1?Q?y1lvUQAvCAwWCQQPyhOniZpRV3bBX5jiyIeXbpTBTz4pg0CKyGZUsKXnpe?=
 =?iso-8859-1?Q?qyh4PgqTKNC0A1p4VLizwWdcONge+9kYrnrD6RxHpHyenTOQQwnjylhgoP?=
 =?iso-8859-1?Q?e2Tm3QWdliDIoIGppd6MnPeEEy3z+e6aNNProLP0d0mkx2ZacDQeK1nuiR?=
 =?iso-8859-1?Q?SLQ0c3RPyuTwkS+ofpS65RcQQFjHJaEa5EI5Ep9TJh7rP+xQJiCh1Rk5Tj?=
 =?iso-8859-1?Q?llyKZSo3ifobVB5t7O84KJGrT48L64PlhY1yY67DegSE31Ab167NiNOl54?=
 =?iso-8859-1?Q?51GwBcLSHvVfsKklx38HAli03Lw2F82977per40oNlkYOgnjIttoft9ikc?=
 =?iso-8859-1?Q?n03Oiqr+wepzPYU5iMiEUCgq3zv9V46EssK9/Vd88I7PTwkwWRdUQiZLXx?=
 =?iso-8859-1?Q?G3GRHEmSBLBfgfwrEhoS4782TFXhatYKXQKigYDDjXzxtr4idoPHxKw7Ek?=
 =?iso-8859-1?Q?CzyYlFowk0ewtdpxh28IeV1FfbXNjqUhf9a1GWfFhv40vdHqu+vKQKUGvR?=
 =?iso-8859-1?Q?vILRzUKYIS/jLIv0FbFpSgARJQRAdrrT2vkH1mioPuZMkuXS9ldgPxqMNh?=
 =?iso-8859-1?Q?C9ZO5jnC31MlMIFpYdU3ZSWMwYoqnIQgFIFvr0B9sfZE6YEyKqsoGWq/di?=
 =?iso-8859-1?Q?QOXE+jHVjJahQ+Ouxb78DMIeSj3R9JRa5uHK28t+uqLNvMli02LMN+xTmw?=
 =?iso-8859-1?Q?+iu/h6DD7x/BD6RLVS5NsYsGIkwoLeifeB5N2XSayBbC5dGDC1TRgreA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5751e9-05b1-4c33-f160-08dd49bdf99f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 10:30:44.1856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7a6hsZmyz6vMyjn+dI+REXAx+FLDoXkuDyIEqU3A8xM9Je3m+YprI3c5g2D7TipGwzkwuYi4HzziyO4CgUpKYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8404

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The main purpose of this patch is to add a way to register PCI device
(which is behind the IOMMU) using the generic PCI-IOMMU DT bindings [1]
before assigning that device to a domain.

This behaves similarly to the existing iommu_add_dt_device API, except it
handles PCI devices, and it is to be invoked from the add_device hook in th=
e
SMMU driver.

The function dt_map_id to translate an ID through a downstream mapping
(which is also suitable for mapping Requester ID) was borrowed from Linux
(v5.10-rc6) and updated according to the Xen code base.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-io=
mmu.txt

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
Regarding pci_for_each_dma_alias question: getting host bridge node
directly seems like a simpler solution with the same result. AFAIU
with pci_for_each_dma_alias in linux we would arrive to the host brige
node anyway, but also try to call dt_map_id for each device along the
way. I am not sure why exactly it is done this way in linux, as
according to the pci-iommu.txt, iommu-map node can only be present in
the PCI root.

v7->v8:
* ENOSYS->EOPNOTSUPP
* move iommu_add_pci_sideband_ids to iommu.c to fix x86 build
* simplify iommu_add_pci_sideband_ids
* add docstrings to iommu_add_{dt_}pci_sideband_ids

v6->v7:
* put iommu_add_pci_sideband_ids under ifdef
* remove ifdef CONFIG_APCI
* style: add newline for symmetry

v5->v6:
* pass ops to iommu_dt_xlate()

v4->v5:
* style: add newlines after variable declarations and before return in iomm=
u.h
* drop device_is_protected() check in iommu_add_dt_pci_sideband_ids()
* rebase on top of ("dynamic node programming using overlay dtbo") series
* fix typo in commit message
* remove #ifdef around dt_map_id() prototype
* move dt_map_id() to xen/common/device_tree.c
* add function name in error prints
* use dprintk for debug prints
* use GENMASK and #include <xen/bitops.h>
* fix typo in comment
* remove unnecessary (int) cast in loop condition
* assign *id_out and return success in case of no translation in dt_map_id(=
)
* don't initialize local variable unnecessarily
* return error in case of ACPI/no DT in iommu_add_{dt_}pci_sideband_ids()

v3->v4:
* wrap #include <asm/acpi.h> and if ( acpi_disabled ) in #ifdef CONFIG_ACPI
* fix Michal's remarks about style, parenthesis, and print formats
* remove !ops->dt_xlate check since it is already in iommu_dt_xlate helper
* rename s/iommu_dt_pci_map_id/dt_map_id/ because it is generic, not specif=
ic
  to iommu
* update commit description

v2->v3:
* new patch title (was: iommu/arm: Introduce iommu_add_dt_pci_device API)
* renamed function
  from: iommu_add_dt_pci_device
  to: iommu_add_dt_pci_sideband_ids
* removed stale ops->add_device check
* iommu.h: add empty stub iommu_add_dt_pci_sideband_ids for !HAS_DEVICE_TRE=
E
* iommu.h: add iommu_add_pci_sideband_ids helper
* iommu.h: don't wrap prototype in #ifdef CONFIG_HAS_PCI
* s/iommu_fwspec_free(pci_to_dev(pdev))/iommu_fwspec_free(dev)/

v1->v2:
* remove extra devfn parameter since pdev fully describes the device
* remove ops->add_device() call from iommu_add_dt_pci_device(). Instead, re=
ly on
  the existing iommu call in iommu_add_device().
* move the ops->add_device and ops->dt_xlate checks earlier

downstream->v1:
* rebase
* add const qualifier to struct dt_device_node *np arg in dt_map_id()
* add const qualifier to struct dt_device_node *np declaration in iommu_add=
_pci_device()
* use stdint.h types instead of u8/u32/etc...
* rename functions:
  s/dt_iommu_xlate/iommu_dt_xlate/
  s/dt_map_id/iommu_dt_pci_map_id/
  s/iommu_add_pci_device/iommu_add_dt_pci_device/
* add device_is_protected check in iommu_add_dt_pci_device
* wrap prototypes in CONFIG_HAS_PCI

(cherry picked from commit 734e3bf6ee77e7947667ab8fa96c25b349c2e1da from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
---
 xen/common/device-tree/device-tree.c  | 91 +++++++++++++++++++++++++++
 xen/drivers/passthrough/device_tree.c | 42 +++++++++++++
 xen/drivers/passthrough/iommu.c       | 13 ++++
 xen/include/xen/device_tree.h         | 23 +++++++
 xen/include/xen/iommu.h               | 32 +++++++++-
 5 files changed, 200 insertions(+), 1 deletion(-)

diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/=
device-tree.c
index d0528c5825..3de7858df6 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -10,6 +10,7 @@
  * published by the Free Software Foundation.
  */
=20
+#include <xen/bitops.h>
 #include <xen/types.h>
 #include <xen/init.h>
 #include <xen/guest_access.h>
@@ -2243,6 +2244,96 @@ int dt_get_pci_domain_nr(struct dt_device_node *node=
)
     return (u16)domain;
 }
=20
+int dt_map_id(const struct dt_device_node *np, uint32_t id,
+              const char *map_name, const char *map_mask_name,
+              struct dt_device_node **target, uint32_t *id_out)
+{
+    uint32_t map_mask, masked_id, map_len;
+    const __be32 *map =3D NULL;
+
+    if ( !np || !map_name || (!target && !id_out) )
+        return -EINVAL;
+
+    map =3D dt_get_property(np, map_name, &map_len);
+    if ( !map )
+    {
+        if ( target )
+            return -ENODEV;
+
+        /* Otherwise, no map implies no translation */
+        *id_out =3D id;
+        return 0;
+    }
+
+    if ( !map_len || (map_len % (4 * sizeof(*map))) )
+    {
+        printk(XENLOG_ERR "%s(): %s: Error: Bad %s length: %u\n", __func__=
,
+               np->full_name, map_name, map_len);
+        return -EINVAL;
+    }
+
+    /* The default is to select all bits. */
+    map_mask =3D GENMASK(31, 0);
+
+    /*
+     * Can be overridden by "{iommu,msi}-map-mask" property.
+     * If dt_property_read_u32() fails, the default is used.
+     */
+    if ( map_mask_name )
+        dt_property_read_u32(np, map_mask_name, &map_mask);
+
+    masked_id =3D map_mask & id;
+    for ( ; map_len > 0; map_len -=3D 4 * sizeof(*map), map +=3D 4 )
+    {
+        struct dt_device_node *phandle_node;
+        uint32_t id_base =3D be32_to_cpup(map + 0);
+        uint32_t phandle =3D be32_to_cpup(map + 1);
+        uint32_t out_base =3D be32_to_cpup(map + 2);
+        uint32_t id_len =3D be32_to_cpup(map + 3);
+
+        if ( id_base & ~map_mask )
+        {
+            printk(XENLOG_ERR "%s(): %s: Invalid %s translation - %s-mask =
(0x%"PRIx32") ignores id-base (0x%"PRIx32")\n",
+                   __func__, np->full_name, map_name, map_name, map_mask,
+                   id_base);
+            return -EFAULT;
+        }
+
+        if ( (masked_id < id_base) || (masked_id >=3D (id_base + id_len)) =
)
+            continue;
+
+        phandle_node =3D dt_find_node_by_phandle(phandle);
+        if ( !phandle_node )
+            return -ENODEV;
+
+        if ( target )
+        {
+            if ( !*target )
+                *target =3D phandle_node;
+
+            if ( *target !=3D phandle_node )
+                continue;
+        }
+
+        if ( id_out )
+            *id_out =3D masked_id - id_base + out_base;
+
+        dprintk(XENLOG_DEBUG, "%s: %s, using mask %08"PRIx32", id-base: %0=
8"PRIx32", out-base: %08"PRIx32", length: %08"PRIx32", id: %08"PRIx32" -> %=
08"PRIx32"\n",
+               np->full_name, map_name, map_mask, id_base, out_base, id_le=
n, id,
+               masked_id - id_base + out_base);
+        return 0;
+    }
+
+    dprintk(XENLOG_DEBUG, "%s: no %s translation for id 0x%"PRIx32" on %s\=
n",
+           np->full_name, map_name, id,
+           (target && *target) ? (*target)->full_name : NULL);
+
+    if ( id_out )
+        *id_out =3D id;
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthroug=
h/device_tree.c
index fe2aaef2df..065fbbc0fd 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -161,6 +161,48 @@ static int iommu_dt_xlate(struct device *dev,
     return ops->dt_xlate(dev, iommu_spec);
 }
=20
+#ifdef CONFIG_HAS_PCI
+int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
+{
+    const struct iommu_ops *ops =3D iommu_get_ops();
+    struct dt_phandle_args iommu_spec =3D { .args_count =3D 1 };
+    struct device *dev =3D pci_to_dev(pdev);
+    const struct dt_device_node *np;
+    int rc;
+
+    if ( !iommu_enabled )
+        return DT_NO_IOMMU;
+
+    if ( !ops )
+        return -EINVAL;
+
+    if ( dev_iommu_fwspec_get(dev) )
+        return -EEXIST;
+
+    np =3D pci_find_host_bridge_node(pdev);
+    if ( !np )
+        return -ENODEV;
+
+    /*
+     * According to the Documentation/devicetree/bindings/pci/pci-iommu.tx=
t
+     * from Linux.
+     */
+    rc =3D dt_map_id(np, PCI_BDF(pdev->bus, pdev->devfn), "iommu-map",
+                   "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
+    if ( rc )
+        return (rc =3D=3D -ENODEV) ? DT_NO_IOMMU : rc;
+
+    rc =3D iommu_dt_xlate(dev, &iommu_spec, ops);
+    if ( rc < 0 )
+    {
+        iommu_fwspec_free(dev);
+        return -EINVAL;
+    }
+
+    return rc;
+}
+#endif /* CONFIG_HAS_PCI */
+
 int iommu_remove_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops =3D iommu_get_ops();
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iomm=
u.c
index 9e74a1fc72..40c840a4b3 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -20,6 +20,7 @@
 #include <xen/param.h>
 #include <xen/softirq.h>
 #include <xen/keyhandler.h>
+#include <xen/acpi.h>
 #include <xsm/xsm.h>
=20
 #ifdef CONFIG_X86
@@ -744,6 +745,18 @@ int __init iommu_get_extra_reserved_device_memory(iomm=
u_grdm_t *func,
     return 0;
 }
=20
+int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
+{
+    int ret =3D -EOPNOTSUPP;
+
+#ifdef CONFIG_HAS_PCI
+    if ( acpi_disabled )
+        ret =3D iommu_add_dt_pci_sideband_ids(pdev);
+#endif
+
+    return ret;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 5ff763bb80..9254204af6 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -946,6 +946,29 @@ int dt_count_phandle_with_args(const struct dt_device_=
node *np,
  */
 int dt_get_pci_domain_nr(struct dt_device_node *node);
=20
+/**
+ * dt_map_id - Translate an ID through a downstream mapping.
+ * @np: root complex device node.
+ * @id: device ID to map.
+ * @map_name: property name of the map to use.
+ * @map_mask_name: optional property name of the mask to use.
+ * @target: optional pointer to a target device node.
+ * @id_out: optional pointer to receive the translated ID.
+ *
+ * Given a device ID, look up the appropriate implementation-defined
+ * platform ID and/or the target device which receives transactions on tha=
t
+ * ID, as per the "iommu-map" and "msi-map" bindings. Either of @target or
+ * @id_out may be NULL if only the other is required. If @target points to
+ * a non-NULL device node pointer, only entries targeting that node will b=
e
+ * matched; if it points to a NULL value, it will receive the device node =
of
+ * the first matching target phandle, with a reference held.
+ *
+ * Return: 0 on success or a standard error code on failure.
+ */
+int dt_map_id(const struct dt_device_node *np, uint32_t id,
+              const char *map_name, const char *map_mask_name,
+              struct dt_device_node **target, uint32_t *id_out);
+
 struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
=20
 #ifdef CONFIG_DEVICE_TREE_DEBUG
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 2b6e6e8a3f..15ec261238 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -215,7 +215,8 @@ int iommu_dt_domain_init(struct domain *d);
 int iommu_release_dt_devices(struct domain *d);
=20
 /*
- * Helper to add master device to the IOMMU using generic IOMMU DT binding=
s.
+ * Helpers to add master device to the IOMMU using generic (PCI-)IOMMU
+ * DT bindings.
  *
  * Return values:
  *  0 : device is protected by an IOMMU
@@ -225,6 +226,19 @@ int iommu_release_dt_devices(struct domain *d);
  */
 int iommu_add_dt_device(struct dt_device_node *np);
=20
+/*
+ * Fills out the device's IOMMU fwspec with IOMMU ids from the DT.
+ * Ids are specified in the iommu-map property in the host bridge node.
+ * More information on the iommu-map property format can be found in
+ * Documentation/devicetree/bindings/pci/pci-iommu.txt from Linux.
+ *
+ * Return values:
+ *  0 : iommu_fwspec is filled out successfully.
+ * <0 : error while filling out the iommu_fwspec.
+ * >0 : IOMMU is not enabled/present or device is not connected to it.
+ */
+int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev);
+
 int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
=20
@@ -246,8 +260,24 @@ int iommu_remove_dt_device(struct dt_device_node *np);
=20
 #define DT_NO_IOMMU    1
=20
+#else /* !HAS_DEVICE_TREE */
+static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
+{
+    return -EOPNOTSUPP;
+}
+
 #endif /* HAS_DEVICE_TREE */
=20
+/*
+ * Fills out the device's IOMMU fwspec with IOMMU ids.
+ *
+ * Return values:
+ *  0 : iommu_fwspec is filled out successfully.
+ * <0 : error while filling out the iommu_fwspec.
+ * >0 : IOMMU is not enabled/present or device is not connected to it.
+ */
+int iommu_add_pci_sideband_ids(struct pci_dev *pdev);
+
 struct page_info;
=20
 /*
--=20
2.34.1

