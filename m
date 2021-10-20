Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 103354345D2
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 09:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213604.371883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md5to-0007vl-FU; Wed, 20 Oct 2021 07:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213604.371883; Wed, 20 Oct 2021 07:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md5to-0007to-Bs; Wed, 20 Oct 2021 07:20:32 +0000
Received: by outflank-mailman (input) for mailman id 213604;
 Wed, 20 Oct 2021 07:20:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=faDG=PI=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1md5tn-0007tg-7n
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 07:20:31 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0a::616])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc51d7f0-8b85-492f-b806-c0a0734cce56;
 Wed, 20 Oct 2021 07:20:29 +0000 (UTC)
Received: from AM6P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::34)
 by PAXPR08MB7017.eurprd08.prod.outlook.com (2603:10a6:102:1df::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Wed, 20 Oct
 2021 07:20:13 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::d1) by AM6P191CA0021.outlook.office365.com
 (2603:10a6:209:8b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Wed, 20 Oct 2021 07:20:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Wed, 20 Oct 2021 07:20:12 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Wed, 20 Oct 2021 07:20:12 +0000
Received: from b8c3f0b3de5c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 257286E2-135B-43D7-89E6-6A77AB12B1C1.1; 
 Wed, 20 Oct 2021 07:20:06 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b8c3f0b3de5c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Oct 2021 07:20:06 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DBAPR08MB5669.eurprd08.prod.outlook.com (2603:10a6:10:1ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Wed, 20 Oct
 2021 07:20:05 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 07:20:05 +0000
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
X-Inumbo-ID: bc51d7f0-8b85-492f-b806-c0a0734cce56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgLoShxjE0tsm+9XqRmsUpQMj7E0iZFFD1gvy2/y5Ko=;
 b=IiRuH26BPCJJQ+ugtjdB/G/8TkgAuOTOn6GXNbdhjkdF1XUNJeqoeYhjQVqaS1NfdNOuGbAtuaAIdIYqI9+BVNeMIcL+hhqIcx0UeVVYuTh2QJ8tRGkndB4P8VhvFItWw/mV4e0EQueQFWRrtvbfd+ubtsqVbRqEhHa6/zMKrfc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a4eeb3e3e973e77d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZX1BEcWDHmgE5jtJWj4/g7zT2ok2YB0w+sxuWMdRjd1shnuqg7DIN0eCEj/pkd5mrCuCxX4Dd6VzajAhT5OHEHA/O+3Sxlp3q7knsaloAd9rBWByGyJTeHhPJzSlJxoJQY1ryKGht9m7CWexTxrCeavBTVpJkxegbtP9sP7k9vicmlvm9/HoHVr2VfTkrJjo1Z4b8YaszpFcof9UlOGVScs4rzTfhaHLno79xAF0iIfF18PYpa6wbfbR7f5Ww7C6tIKGT6U3Y8x5LDDXGm2dJ4YesMWkHm9KV6/YMyGBv4XpSv9RXNKA+2LlR+WwH1+yjaZqPl4k7kK2mdriSO/mHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgLoShxjE0tsm+9XqRmsUpQMj7E0iZFFD1gvy2/y5Ko=;
 b=gi1Uh/v9sYxLDfu6PtOMgJj7JIDevp5QLdbu1CNF2KV9DLIH7qxG4pwLAtFnsV6QTZgV7DJADCqaVog2QmdXttT+jMFAvcguPAe4pQ3kVG1dytGwZd2maog19PabAf2B/8iQCKXL2+CCTBHm1+XX95+b4re/3HiXetqeFlhXu2SS2D+7ACW4o7J64UVCgYYG/yg5WYWd3KTnhvQYkxbbh49IJT8vFGv84silVIuPmcUQOUpLqxecPPexgh5KBld/1RALo6Ed35dX/dfOkQicg8QCG4d1umigF9K//pKhSWUhZzZpUumCjZKHsx8HuWFXwhPzSGgkhvJjOqcvrwK1Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgLoShxjE0tsm+9XqRmsUpQMj7E0iZFFD1gvy2/y5Ko=;
 b=IiRuH26BPCJJQ+ugtjdB/G/8TkgAuOTOn6GXNbdhjkdF1XUNJeqoeYhjQVqaS1NfdNOuGbAtuaAIdIYqI9+BVNeMIcL+hhqIcx0UeVVYuTh2QJ8tRGkndB4P8VhvFItWw/mV4e0EQueQFWRrtvbfd+ubtsqVbRqEhHa6/zMKrfc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, "Oleksandr_Andrushchenko@epam.com"
	<Oleksandr_Andrushchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix exit
 path
Thread-Topic: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix
 exit path
Thread-Index: AQHXxQOsddT9Ttg6SUi4XsLpyj6SjavbeuKAgAAA5YA=
Date: Wed, 20 Oct 2021 07:20:05 +0000
Message-ID: <0FC6BD8A-1805-4C10-A95C-EA199D870F06@arm.com>
References: <cover.1634659471.git.bertrand.marquis@arm.com>
 <d788dcce9e344a39f6761633f0e96774ab42c2aa.1634659471.git.bertrand.marquis@arm.com>
 <9f77b70f-93b8-2b54-3aa1-5de677d858cc@suse.com>
In-Reply-To: <9f77b70f-93b8-2b54-3aa1-5de677d858cc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2f4c90bf-ad7c-4d32-1e5b-08d9939a0ea0
x-ms-traffictypediagnostic: DBAPR08MB5669:|PAXPR08MB7017:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB701719C2E10C0D4CE90F1BA19DBE9@PAXPR08MB7017.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Uuo3buEUWYCxv05yXtaE/WpOPT9b2jzgN7zu1O6GBaGzEf6/FVLxHqmKDKzrkgh34yQkiGS7UGXwUypX7bYvNY2JOjlSkbklYzNiQpc52OhgrWIm/JO5FDOus+4iPVDNyuRQFvqnR6QBogD2GlcINHjMXkWiHBWHzRMcD4CEWFqjcwo6hY53SG4z1mu+lUm2HQ6WwvOZV5r2Ok/1Sm0pgJFutx+TgUOJ77A52yw/NsYPB9qZC918WdbtXd58IJRj2AYTuIns21KB/G3ixVkgJR1DR+2/Z12/wO3HBiXS3xZ+OXoZaoJt+6F3xXUnokT3/xbr4VqlcV4lTDlKiOYaXb36kzvansXxqE32ceHRig80N1l31RkMZpu7yjag1FaO8u/Ft0Tn9ofchW6mZEiwxQq2beKhTJAXRqPQeAoAx58Jp5y6IH9hfU0C2sy2XAbOE7xejfShW7yP78DLpBkUvPPIlLccV6SpvDQqRlx2/UmnX50Fz2aRWH9eRNjkQJBQoDe+QR4nmrwKwZ9T1PIO7gq74nxHxct6mZggQrEzw2k7dTnszJ/bPZcsEtXy2CAtcfyY00uJfCOLu2kuI5ZDC7VlfgrJX9dWgL/Y1kgi9l5zstZr+TlKtUaXBno4fxz/Bp4R7JhZUe7uNmhCnRabi0/KqPovW0M0MD40x2GlowqdpTTGZufCdgK7pNryA52J3aVwfCcM+gqTtqmHVVtCbykncNNxUXQ6SrqRd26iu3BLkax4MPME0m43nZ+w09eg
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(66476007)(53546011)(5660300002)(316002)(26005)(6506007)(91956017)(66556008)(64756008)(83380400001)(33656002)(66446008)(6486002)(122000001)(38100700002)(54906003)(86362001)(6512007)(76116006)(66946007)(71200400001)(36756003)(8676002)(4326008)(7416002)(8936002)(2616005)(38070700005)(6916009)(2906002)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <ADF13321F35B8747A13164C6B3438EAB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5669
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5138217e-a413-4fe7-37c1-08d9939a0a4d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N/qgmvGphTQY8lQctAI56hbhNcW2BhvKSHQvnU5tZ9c5Mg10RW/MMV69A1/7g0AD2/RyaaFDwjLayPlZ4TOAvyUNyGeN2oH/VrAmL0IRSI/gi9UgegNaS0kYBbBw9rmGU/HyOP9vNX+dc0oEtU2/uMo3A/J53pp47LTEZ9wmsAbeem/JEPVRBkw7A0W/aH68aogH5rNOKuN9Yi2KEIwbEoTPlfa0NMPuoEZ8lY90lP+3jFwrkCgyRB02dupJth1ZOpBiPtvmWRJSKp1H6znRQFguD3yK6YNsElwP0uMwmuUItQQVIv34rFRIMWIDNaFxhM4jDV8iaoXzpAxRGjIhUZMl2tKJK5LydpDwkKQa5y6cMx/VP0StGoe1vOaZDOhUSEefliq4uJM6peoElM8JVGt3JHx+nyuqvhzYKnKW3ta8OVkJOgy5LMtcBJXdarLvIY8T916TxHVzHTmSRqC1PwjFYWzCm5mtzAtqFi2tdG5YT8E/nahGKGFMMuhbfZ+0FHPtOZGbHuE4tZTqPeaKuFevDBWVjOlDYKWAySeXZMJ+BTQt2qh7l6FnLKr9DxyPSGiohMH/bVib1zsCxZgtRtIONf5ycLZt/n2mtc6/SkGblau8cgAGJAkm4w7reQDaXYUCbpo+WFC8MOrBjR3gxwqiRhfBA17Ak8vqHVsIVwRHwKTQh8U0OOA5pQpz+VSqi+iNkGj3Ze43itwV79IRUw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(86362001)(6512007)(5660300002)(36860700001)(6486002)(54906003)(8936002)(83380400001)(8676002)(47076005)(2616005)(70586007)(356005)(316002)(186003)(82310400003)(26005)(4326008)(508600001)(6862004)(70206006)(81166007)(53546011)(2906002)(336012)(6506007)(33656002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 07:20:12.8727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4c90bf-ad7c-4d32-1e5b-08d9939a0ea0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7017

Hi,

> On 20 Oct 2021, at 08:16, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 19.10.2021 18:08, Bertrand Marquis wrote:
>> Xen might not be able to discover at boot time all devices or some devic=
es
>> might appear after specific actions from dom0.
>> In this case dom0 can use the PHYSDEVOP_pci_device_add to signal some
>> PCI devices to Xen.
>> As those devices where not known from Xen before, the vpci handlers must
>> be properly installed during pci_device_add for x86 PVH Dom0, in the
>> same way as what is done currently on arm (where Xen does not detect PCI
>> devices but relies on Dom0 to declare them all the time).
>>=20
>> So this patch is removing the ifdef protecting the call to
>> vpci_add_handlers and the comment which was arm specific.
>>=20
>> vpci_add_handlers is called on during pci_device_add which can be called
>> at runtime through hypercall physdev_op.
>> Remove __hwdom_init as the call is not limited anymore to hardware
>> domain init and fix linker script to only keep vpci_array in rodata
>> section.
>>=20
>> Add missing vpci handlers cleanup during pci_device_remove and in case
>> of error with iommu during pci_device_add.
>>=20
>> Add empty static inline for vpci_remove_device when CONFIG_VPCI is not
>> defined.
>>=20
>> Fixes: d59168dc05 ("xen/arm: Enable the existing x86 virtual PCI support
>> for ARM")
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thank.

>=20
> I'm inclined to suggest s/exit/error/ in the title though (and maybe
> also s/path/paths/), which would be easy enough to do while committing.

@Ian: Please tell me if this is ok to be fixed during commit.

> But first we need Roger's ack here anyway ...

Yes.

Cheers
Bertrand

>=20
> Jan


