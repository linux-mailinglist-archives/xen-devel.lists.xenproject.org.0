Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD4D41C5DB
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 15:40:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199149.353029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZog-0002H5-3E; Wed, 29 Sep 2021 13:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199149.353029; Wed, 29 Sep 2021 13:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZof-0002EF-WC; Wed, 29 Sep 2021 13:40:10 +0000
Received: by outflank-mailman (input) for mailman id 199149;
 Wed, 29 Sep 2021 13:40:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0G+=OT=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mVZof-0002E7-Du
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 13:40:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::601])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e5c9c11-9585-4e9d-913d-0be6e05781ae;
 Wed, 29 Sep 2021 13:40:07 +0000 (UTC)
Received: from DB3PR08CA0028.eurprd08.prod.outlook.com (2603:10a6:8::41) by
 HE1PR0802MB2540.eurprd08.prod.outlook.com (2603:10a6:3:d4::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.20; Wed, 29 Sep 2021 13:39:59 +0000
Received: from DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::91) by DB3PR08CA0028.outlook.office365.com
 (2603:10a6:8::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Wed, 29 Sep 2021 13:39:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT058.mail.protection.outlook.com (10.152.20.255) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 13:39:59 +0000
Received: ("Tessian outbound 71ebfb754289:v103");
 Wed, 29 Sep 2021 13:39:58 +0000
Received: from c1d74d1e4404.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4FE5ABBB-8FE2-46B0-9E33-68F2E351CDD9.1; 
 Wed, 29 Sep 2021 13:39:45 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c1d74d1e4404.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 13:39:45 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB6175.eurprd08.prod.outlook.com (2603:10a6:102:eb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Wed, 29 Sep
 2021 13:39:44 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Wed, 29 Sep 2021
 13:39:44 +0000
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
X-Inumbo-ID: 0e5c9c11-9585-4e9d-913d-0be6e05781ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4jf3x5fJ5th9pQGNKA3lrxyQ8fD6O68usEJPC0wdXM=;
 b=GDg2c9zgT0v8LoycjdVrv2c3dy2dBXB5p2IJ8ODuImZaU5LPUgNar0shR5pjO1adgpuHxyg5Gm4NSysmHi/lKv8Su0qaYCjT252KvmVT22jN5/wSIxQvd7ZbEpR777WMio2DIxcWkDJvQjxwwNzNVBfijRR4GW/8a+Gs6tIWax8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 35bcfc5f9b5600a6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFRiBg1MlsMkcGi+1kET5EvXoRmuYdwL+wUIRfWdt9+umzHS6n9P+PWuiPs2qoaILvXw3wdZXpfYE9UBJFBb63h1JNbW+ZS8UiqfgeTo/h/1/cGTE4Anae+XFrjPy2sBcCaGpu1tIb9bYL36Ku12CGbp9uIJorEMwMcFeh/ir8YzhISWU9XfPBvzvCEJqg3B1dD3mrm8VfynDpWTxtdfNJUdAudEizLwItV0uqOk0kd36A2HdfZEY3mTAtrIBW+0iO1SXFAFO0XA2x9zX9EG/QjUGyJtwtJTEUIJphz8j35D9ZWkpsYi/ke/81EoqRuCm6WifclziGmC3uT1c1tQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=v4jf3x5fJ5th9pQGNKA3lrxyQ8fD6O68usEJPC0wdXM=;
 b=nL4joMVbZgW6MhHvq5BNHUnMdendvqWY/UX/tgrMqp4VyGZIVdYFTNWzcqkxfHpHNr/6iMTCm3tSFs8WHE4jLAANkZB5DBIE4Ju6wMenHpW4TUnCZxZrX3uqiv1dZ9WXavoXWge+DG8Qr03WPJ/q/vhBjhUlmNqWV7UDUQsnGWW+sqYRwqiWjA7Na7aK4XXepxBBwq0WtcXIDz1fXmbB340PYxsmO2WsGQ/bzixwy+Cc+C4/uctqcxUe8iXB8To3cr/XrpwtzJvWXQ4gevDshpqY2SqEZgNR2Ts/avp1HLwnCC5L0VOh+zMRN8vYFxU6eVIufjG3SjgErW1pIagZPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4jf3x5fJ5th9pQGNKA3lrxyQ8fD6O68usEJPC0wdXM=;
 b=GDg2c9zgT0v8LoycjdVrv2c3dy2dBXB5p2IJ8ODuImZaU5LPUgNar0shR5pjO1adgpuHxyg5Gm4NSysmHi/lKv8Su0qaYCjT252KvmVT22jN5/wSIxQvd7ZbEpR777WMio2DIxcWkDJvQjxwwNzNVBfijRR4GW/8a+Gs6tIWax8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andre Przywara
	<Andre.Przywara@arm.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 15/17] xen/arm: Transitional change to build HAS_VPCI
 on ARM.
Thread-Topic: [PATCH v3 15/17] xen/arm: Transitional change to build HAS_VPCI
 on ARM.
Thread-Index: AQHXtJYGCkZuB1/ry0i7sxShepvGpqu7BcAA
Date: Wed, 29 Sep 2021 13:39:44 +0000
Message-ID: <153BBA12-C98D-4A02-A8C6-E6AA5D117C9E@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <adabef3cd1774ca51f1b409bd97a2ae353eaac2b.1632847120.git.rahul.singh@arm.com>
In-Reply-To:
 <adabef3cd1774ca51f1b409bd97a2ae353eaac2b.1632847120.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 83d23661-6369-4173-8be3-08d9834ea1c6
x-ms-traffictypediagnostic: PA4PR08MB6175:|HE1PR0802MB2540:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2540F0ADFF84F92FE99F20499DA99@HE1PR0802MB2540.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BpZ1CC9MgAKMzU/awWR6vgM2+n0qmMgWjPRXOp2fx10Erm5bQiK+47Vp/ut3WvoaNzaRJR8eOqaqIrB0JUt6Wz/0Pd1Mfkh8uHWciqde/E2+o/Bi8Ek1OjtGvJbMholXfgAaNSZ5RapZHJx8HIUfiBvVb+GuIulOzY7J5qggNcFGkN37bUBv0Oe2LaldBQ37UWTlxVJLhAH/cPPyumjJACLcZAi3r7j6SNCo965WqtDTwYJetlWL6D/VvDDz/yMXHz82oF3UE0jw5QQKThlIp+DYEr/TGGDOFwqw7j4K7aug3J/gWBTfrqucqxH3tKEjg6wRULmkAjuvO8UuTxhqqy8kei4bLbrhIgyInR6X00Mowpyx0ILND8XPKjKXCZfJCs/vcjkuRd7fjORxgRh2rPEC3czYfcueUD0zaT8F/ny6q/3JyH20t396xQEBOO63dTXs9lE/UcjJJRqZndFczsH9ma+m/D7CWinbkTYEOLe/d/EE89e3Q/SRiDU8uI3NFqYspwfTzXd5D7XTddkJSwMAxzF4Xco1J0L+psvoLO597z4cqP7RC0rdmGdYnw3Ukf3gAFwq+xqpg93DkSJsTOiURbHXmZROuPwrrXbpP1VSFAkGfRtOgBlGaGqYFic/27mwLc72Uslo6NebzwA989nIlA2OWnNhIpFx8TlE4zT/J34j83x5fHiwNhmgMcq7D/io+dx4hC3zjqhAiWwTY9TVOgSnr6BPe/bIdgNYOQyiFSrzmFpT3czI+YXmeXrI
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(76116006)(5660300002)(66476007)(54906003)(6506007)(6862004)(91956017)(2906002)(2616005)(6486002)(122000001)(66446008)(38100700002)(66556008)(64756008)(316002)(71200400001)(6636002)(37006003)(26005)(508600001)(53546011)(186003)(8676002)(33656002)(83380400001)(8936002)(36756003)(66946007)(38070700005)(6512007)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <618757FC021F7D42B7C70811DA1CFAC2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6175
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	76d14686-2469-4571-541f-08d9834e98ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Df0OCZqThHoGbKaOCBZeSvgPnS7rY3Jv1pSrAEYlYQ8mB4ka4hxQiZw4cVIjUtHHSBxZo8yI7I2z4fqr0gFpSTjb5Ljd9U0P6S2w9VNlhlsOKoEoe4tQNAXQrWLREKdiqYeMweCCum10z8anYFvRExeIeMp6TV+VZb4cbKlRYNQwkQ/KcB6vIcqSDSdBWB2CwlqnKH+vn1aqb0R3lkrc9IJAEcNhLyBXQz4AZ8r4/MqMSbiLGsfYwdRxSVfEzymBjdjSsOVhM720nYA1BGl5I3j4GD1xydni7Bn5q5VRIEhqYtEL0hNfdeG1RDq3ghdw8EMV60X9anQkO4cMEcWIKnI115y47cg9yKtYVnx3/cFefH1zcEU6+J4M3SqPKVpN9XpeuZr6uPQ4CSF65vI0ZZZCCPLtoi8dWjKtB6NklhVk8BJyiMkf10Y3zhJYzfzcY1LW6C84t4Y8pgyliIFA6RKqYAVKXd5v6ZidUxMrtgtVD6R9nW3d2Utckh4vhBle/ejdFjZG7k27iAwNT7bokbW5EsbMxtd4c71/yF3Y7jLn2akQuy/SdZ1E5JcpKvXPUqWOenmccG+ZV92I8ERQg5to+qh7YBLCwdhaHRAdfdu+EuuT/gxOrqglcEBw/yrqQHW4N5OJsSo3yZg3zI65uXBfYkCCXzlAdxTi84hIhOYDmPGuGaeklRTCfQSZnTpPnBQgA1Q11H1hclxWHJsI4A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2906002)(316002)(6862004)(336012)(83380400001)(186003)(6636002)(33656002)(107886003)(36756003)(26005)(8936002)(70206006)(6486002)(70586007)(356005)(47076005)(5660300002)(6512007)(81166007)(82310400003)(86362001)(53546011)(54906003)(8676002)(37006003)(508600001)(36860700001)(4326008)(6506007)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:39:59.4387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d23661-6369-4173-8be3-08d9834ea1c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2540

Hi Rahul,

> On 28 Sep 2021, at 19:18, Rahul Singh <rahul.singh@arm.com> wrote:
>=20
> This patch will be reverted once we add support for VPCI MSI/MSIX
> support on ARM.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Change in v3: none
> Change in v2: Patch introduced in v2
> ---
> xen/drivers/vpci/Makefile | 3 ++-
> xen/drivers/vpci/header.c | 2 ++
> xen/include/asm-arm/pci.h | 8 ++++++++
> 3 files changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
> index 55d1bdfda0..1a1413b93e 100644
> --- a/xen/drivers/vpci/Makefile
> +++ b/xen/drivers/vpci/Makefile
> @@ -1 +1,2 @@
> -obj-y +=3D vpci.o header.o msi.o msix.o
> +obj-y +=3D vpci.o header.o
> +obj-$(CONFIG_HAS_PCI_MSI) +=3D msi.o msix.o
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ba9a036202..f8cd55e7c0 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -96,8 +96,10 @@ static void modify_decoding(const struct pci_dev *pdev=
, uint16_t cmd,
>      * FIXME: punching holes after the p2m has been set up might be racy =
for
>      * DomU usage, needs to be revisited.
>      */
> +#ifdef CONFIG_HAS_PCI_MSI
>     if ( map && !rom_only && vpci_make_msix_hole(pdev) )
>         return;
> +#endif
>=20
>     for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
>     {
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 49c9622902..5532ce3977 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -26,6 +26,14 @@ struct arch_pci_dev {
>     struct device dev;
> };
>=20
> +/* Arch-specific MSI data for vPCI. */
> +struct vpci_arch_msi {
> +};
> +
> +/* Arch-specific MSI-X entry data for vPCI. */
> +struct vpci_arch_msix_entry {
> +};
> +
> /*
>  * struct to hold the mappings of a config space window. This
>  * is expected to be used as sysdata for PCI controllers that
> --=20
> 2.17.1
>=20


