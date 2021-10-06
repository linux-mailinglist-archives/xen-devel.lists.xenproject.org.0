Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7D1423B55
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 12:16:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202659.357645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY3xj-0001x6-SN; Wed, 06 Oct 2021 10:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202659.357645; Wed, 06 Oct 2021 10:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY3xj-0001u1-PE; Wed, 06 Oct 2021 10:15:47 +0000
Received: by outflank-mailman (input) for mailman id 202659;
 Wed, 06 Oct 2021 10:15:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=13oh=O2=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mY3xh-0001tv-Q5
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 10:15:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.70]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65684d62-70fe-49f2-9766-07634c6c7dbb;
 Wed, 06 Oct 2021 10:15:43 +0000 (UTC)
Received: from AM0PR03CA0009.eurprd03.prod.outlook.com (2603:10a6:208:14::22)
 by AM9PR08MB6660.eurprd08.prod.outlook.com (2603:10a6:20b:305::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 6 Oct
 2021 10:15:39 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:14:cafe::67) by AM0PR03CA0009.outlook.office365.com
 (2603:10a6:208:14::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend
 Transport; Wed, 6 Oct 2021 10:15:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 6 Oct 2021 10:15:38 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Wed, 06 Oct 2021 10:15:37 +0000
Received: from cb8a15151076.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FD52AE1D-9ADB-4F9D-A279-3C2124BAC534.1; 
 Wed, 06 Oct 2021 10:15:26 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb8a15151076.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Oct 2021 10:15:26 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB3560.eurprd08.prod.outlook.com (2603:10a6:20b:4c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 10:15:24 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%7]) with mapi id 15.20.4566.023; Wed, 6 Oct 2021
 10:15:24 +0000
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
X-Inumbo-ID: 65684d62-70fe-49f2-9766-07634c6c7dbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tj0NMbcGndmhhvAOxSOQixjWVF86tRL0WmY22Aij3fI=;
 b=XLyYBU0Xoc+iKrL4/SdfU5UZAmDjpJq3Fk4ao0nh6d1Ud1nsjl5+n9xqpvAQNQtnKQ6Vb/1T9SZItsyHVoN9rSRjRboB+0iN+gndjCDJVHipUSF1WYjmSEoPqZdS5k6EngtIbhzOqV26sL9/bSTjrTDXlnwC2lx4AWRZ6HgqHYQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c5893583fc5ff38b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvE6ajnvEcAUYc968s44jekB7OyQuaFXjaRte5KE4vXv+DpMXD4p7N9UoSw58/p1HaYif3fTd+VAAxYBcyACsTf7AVf7G82UWHtB4cl3sIFH/6nQyYcB7XJN8/5Xp9/U7wrljtJybHLsQq7dyOlsgIyzkRc0wTyAiGJ06diAvekpKlnTWbUHkBZGjkSXomVcD1RZDH12pLfkIqoHPWwh2SZ8xhb25MEonCgHyx95Z+gQqxXdGfCV+GOTgucm16R2YfRiFdpmbAF272cZzHWI1rSwwsHntCQQ8Y+pqoRaO4XJybRi2LpEqlWHkm61RseH9TuYj0IQGyUaPxDJsL5ZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tj0NMbcGndmhhvAOxSOQixjWVF86tRL0WmY22Aij3fI=;
 b=cQFyyYnFPwBdrXcftkhfZgxsTKTWCNcY/wQLkxwyz6XPlyuxGxUTtfMzHTL1f1zlcluTzXerxfLElyUVXJURMESIbTRI7vSeNXcDbyQ/zfIRNsyXHMYFjnfbhkRv/H5qIyxP2HmnUS4kIDpYpNcbFdV24ihWsSrQGzVfJgDEA9iqCKJ6iV+8iXyyJ4fVUcb5/qui40NCz9r1MLYqeOqvJkrSuv2gkOGPSSu1bt8mzKJ0mkJt7QAolBDgybSWGwGi00FX/loqPq+XHHXOmOC66IhZnJXMGKWXjE4SXUBCE3/Cyhyuee36ad9kSxHEWws+0wKW7720cUKk/sQiY4l3qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tj0NMbcGndmhhvAOxSOQixjWVF86tRL0WmY22Aij3fI=;
 b=XLyYBU0Xoc+iKrL4/SdfU5UZAmDjpJq3Fk4ao0nh6d1Ud1nsjl5+n9xqpvAQNQtnKQ6Vb/1T9SZItsyHVoN9rSRjRboB+0iN+gndjCDJVHipUSF1WYjmSEoPqZdS5k6EngtIbhzOqV26sL9/bSTjrTDXlnwC2lx4AWRZ6HgqHYQ=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "oleksandr_tyshchenko@epam.com"
	<oleksandr_tyshchenko@epam.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v4 02/11] xen/arm: Add new device type for PCI
Thread-Topic: [PATCH v4 02/11] xen/arm: Add new device type for PCI
Thread-Index: AQHXuSnbiZmskKn6EUq1TwpRsFvaGKvFw9KA
Date: Wed, 6 Oct 2021 10:15:24 +0000
Message-ID: <CD3A622A-9A97-447A-B918-805054F25FBF@arm.com>
References: <20211004141151.132231-1-andr2000@gmail.com>
 <20211004141151.132231-3-andr2000@gmail.com>
In-Reply-To: <20211004141151.132231-3-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a7c4e5bc-f4c1-4fa2-bff8-08d988b23e8f
x-ms-traffictypediagnostic: AM6PR08MB3560:|AM9PR08MB6660:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB66606132EFA552CD183EA686FCB09@AM9PR08MB6660.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jTGF2LcPGJ987mSNyc9aM0aEqA9Uq8HOHxWzSQQ1mqihnawLsCvoONMPndNWfeGID6xtY+1bT/YyM/8FY/SgJGRtRokaPB3QK1ChHxkHm8gRXPbuw/Uuf3aQGKLao8M3Q44POgY0GsaIMtErcdHP8BRncd91AYCrG2KLEAIE50/1DoFo27V9Ck8ImRNcA2ZfENhzG+sXwnPpLKL+P31l6VOj8RzPUIDry2OXANfU0Ky5EQfrHQtCIsyUJCTSg46C+Fu4xyLRlQ8fjQfHiWz9Mn7FBzUZqyax8pAaX/wyBAANgwjzGGd1luxQkYSnVLHnNrPEUWDtcAPbfMEVynsRVoaUZ+euEfq+aWCRw4zLXHnQcRCSXeG//Y3wuyP/WOFm34ZBC0LI/dPkVkLif+ytjiryxr08OOhqpstcVGYomJsGQq2t05J8zxbSc8w8nNDQCmpk0/cg1FheQqksb/OJ2ygWGtiDnZq3YFZ4nL1JGnaj/WmmOPXtt3rkcPWhl1IiNUwxIutA/1IJMHe/NwaoFhX8OEiXH4vbUnBTZ+vN6UkY2lBhJXC2WJxwhTMdMwjKuOAjC1Lt+mG5OZmwtJOhyu6dZ4CAkUiAqdWtI4W2D+SdiTLsWS5/kRP7YBHW+LkdHi31+8Bv75vc8LuqXmYc9bfG8QaH29cEJRj9TgCldbTA408aPxw2Kv3jCAD2ify81Egdkn+u+WdDHMGNUcJKZ9X3K/t+kqKcBvxiCVs1S9I=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(86362001)(26005)(6506007)(186003)(8936002)(8676002)(508600001)(33656002)(71200400001)(7416002)(38100700002)(36756003)(316002)(2616005)(53546011)(6916009)(6486002)(5660300002)(66446008)(64756008)(66556008)(38070700005)(6512007)(66476007)(2906002)(83380400001)(4326008)(54906003)(76116006)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <475234C783ACFD46A4B5037EBB884753@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3560
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c25fc6c2-0e2b-4632-e16a-08d988b2360f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VqziR6chZL1POjXOTmcSvFpYKK7qJpnipj84G8FH1y6xN+MQLCGvsvGcGPTnRmh+qE8lA9/OuL+O92I0DugbC+Oej09hfzwiOnG99qCGxH7KOixWircXHD3KlEOLEf4Sv4x7LW3bn4viHtK1HLpmfKbj7Xkzb8WSqPoijmYphjsHBAm41yc7Bp7DFPd96oD/gtZWtrHdwl2tilj12Teb7tWM7ofAFuK2zbOcSmkzdmxFGQOUNRd6/WqUw3mL0eISk10kITizS01h+eYaXRv3JgHWfxuSOhSZQtJn5mxpWUA2wfI9/UAPS0XKQnKo2Ui+J/pO36W+sLiqV6S/LCE3GVPUd6PMISTRx6iqfNGfkBpD1YFvSRtY+qGEAUN9mLdry2wzbFQeZMBTXjSTh3NzKzyEr2ClOtFkPifbo6JeVtrwwAKPhE1+EOMivpuzT6yiVn5uETh3OXz2U1gEoHkfv/z3WrchhRnTHmEb7j/N4TIpy/B3EbPCPjysifct1mrMT3EaG8H0F/W4oqVoHdvbvtzC1JYCBHhxaArv60AngadB5T49C7eM8AVN4XDB3SRWUOZrDZ8DowFbunBieJ3CSHvlMyuxGKzuzKhZq9BGcgKU+FtbcKTjCnqsakOyKPpQifLRYe5RSb9Z9G6jiR3ZFMe+naQCVOIl4va7UNdlb8ox8DXpYyhACqC6sv5op6Q3UA5E5Z48zPnjh7fbKCkdVw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6862004)(508600001)(2616005)(186003)(33656002)(54906003)(47076005)(6486002)(82310400003)(86362001)(316002)(70586007)(8676002)(36756003)(70206006)(53546011)(4326008)(2906002)(81166007)(8936002)(6506007)(5660300002)(83380400001)(107886003)(26005)(336012)(6512007)(356005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 10:15:38.4230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c4e5bc-f4c1-4fa2-bff8-08d988b23e8f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6660

Hi Oleksandr,

> On 4 Oct 2021, at 3:11 pm, Oleksandr Andrushchenko <andr2000@gmail.com> w=
rote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> Add new device type (DEV_PCI) to distinguish PCI devices from platform
> DT devices, so some drivers, like IOMMU, can handle PCI devices
> differently.
>=20
> Also add a helper which is when given a struct device returns the
> corresponding struct pci_dev which this device is a part of.
>=20
> Because of the header cross-dependencies, e.g. we need both
> struct pci_dev and struct arch_pci_dev at the same time, this cannot be
> done with an inline.
>=20
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
>=20
> Since v2:
> - !! dropped Stefano's r-b because of the changes
> - simplified dev_to_pci to use a single
>   container_of(dev, struct pci_dev, arch.dev) (Jan)
> Since v1:
> - Folded new device type (DEV_PCI) into this patch.
> ---
> xen/arch/arm/pci/pci.c       | 7 +++++++
> xen/include/asm-arm/device.h | 4 ++--
> xen/include/asm-arm/pci.h    | 7 +++++++
> 3 files changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> index 73540045d187..138da19284ab 100644
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -27,6 +27,13 @@ int arch_pci_clean_pirqs(struct domain *d)
>     return 0;
> }
>=20
> +struct pci_dev *dev_to_pci(struct device *dev)
> +{
> +    ASSERT(dev->type =3D=3D DEV_PCI);
> +
> +    return container_of(dev, struct pci_dev, arch.dev);
> +}
> +
> static int __init dt_pci_init(void)
> {
>     struct dt_device_node *np;
> diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
> index ebe84ea853cd..7bf040560363 100644
> --- a/xen/include/asm-arm/device.h
> +++ b/xen/include/asm-arm/device.h
> @@ -4,6 +4,7 @@
> enum device_type
> {
>     DEV_DT,
> +    DEV_PCI,
> };
>=20
> struct dev_archdata {
> @@ -25,8 +26,7 @@ typedef struct device device_t;
>=20
> #include <xen/device_tree.h>
>=20
> -/* TODO: Correctly implement dev_is_pci when PCI is supported on ARM */
> -#define dev_is_pci(dev) ((void)(dev), 0)
> +#define dev_is_pci(dev) ((dev)->type =3D=3D DEV_PCI)
> #define dev_is_dt(dev)  ((dev)->type =3D=3D DEV_DT)
>=20
> enum device_class
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 7cb2e2f1edaf..603a1fc072d1 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -26,6 +26,13 @@ struct arch_pci_dev {
>     struct device dev;
> };
>=20
> +/*
> + * Because of the header cross-dependencies, e.g. we need both
> + * struct pci_dev and struct arch_pci_dev at the same time, this cannot =
be
> + * done with an inline here. Macro can be implemented, but looks scary.
> + */
> +struct pci_dev *dev_to_pci(struct device *dev);
> +
> /* Arch-specific MSI data for vPCI. */
> struct vpci_arch_msi {
> };
> --=20
> 2.25.1
>=20


