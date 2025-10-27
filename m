Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5683C117D6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 22:13:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151778.1482313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDUVi-0008Gw-3G; Mon, 27 Oct 2025 21:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151778.1482313; Mon, 27 Oct 2025 21:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDUVi-0008Eq-0h; Mon, 27 Oct 2025 21:12:14 +0000
Received: by outflank-mailman (input) for mailman id 1151778;
 Mon, 27 Oct 2025 21:12:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=de0O=5E=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vDUVg-0008Ek-CE
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 21:12:13 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99aceb55-b379-11f0-9d16-b5c5bf9af7f9;
 Mon, 27 Oct 2025 22:12:10 +0100 (CET)
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com (2603:10a6:5:34::10) by
 GVXPR03MB10780.eurprd03.prod.outlook.com (2603:10a6:150:226::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Mon, 27 Oct
 2025 21:12:04 +0000
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3]) by DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 21:12:04 +0000
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
X-Inumbo-ID: 99aceb55-b379-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esZkCkkAy/oATP+k0TK8WXIxWiOCrpMQUnXwHiF5sxQZYEYhYxQtgDrM/1Cxf2pB2PCQHSTN15sQBYxUvIL2g4S8S1HaCDn9QClLUbqEIyQQ4wY7zGFIrVXAY0QTP0/GIT8oIEQNyZ82It9uEnu8vo9NWAIkIM9eoNLbX0eEX5B99cGP33zmG/UEIlFVZaM2ak8TH0vDzsbFr2+iaYVATfP/hiQgmtKh4c6Ot/oD2R8Po0G3Q5S82Pa4rvBa5CB3drGbB8PTMHq//UCVYBax44N3pWi07stM+O/ozRVnDLCD6SLhluzJDbq9FzvGStmpARw/rpDW0Y5HAqn2iuebwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvvOp07PXNtPjBcG5+cLIiERLORSGHQM5MLIj+T9iXY=;
 b=gSePKGnH1eLdH515XrrqhMUHfej+sgNclNNkWlYS36LnCmGvu8SnI31XmDEP7xaTC6HbrhW1/rFTE24bTg1koeKSoiscWuHOSk61rNg2cDZ9grAGcaEjoWvNGyFXZpCgb46+3SddWfqhD55CUGcL2jTk1rKgnitAgDwN4eEQiIJztwo8Fta4vdhTE2rfGL5sBNvrohtZ24ZM7FmePrWlMCwiOpgGXg5xBbii1cIsW3MkhR1HRNrggwHfI0xQmf0h4YC2AFbUPaublqOmSFEXSXMTTIf/Gpn+qID7sNXpMBaDaSAZhF+QBW+jBVRP4E1h2QQib/yNgRHDtPvREu7xmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvvOp07PXNtPjBcG5+cLIiERLORSGHQM5MLIj+T9iXY=;
 b=UEN+J3tLbY+1f4agrcj/nTDDB3nT0nYFNBXQG59TozQ9izXCzwU0UvT+NGrKzyUptkQiVNps4V2yY8wb64S5WTFQHnuHjKmigHmtIKQsikoiWCn+xb3ncNUdlHwxp3gRxwqYIDnYmrEOqbJ3cdkjtYVXmo7nZW/D6l/wBv9LoqOMLdrdmcOM9heJaYdmvj8vpFINfczcFsf41960L+CxY1PW7iQAAHbdpPq1ueiIhtHfKUjTMrntOV+F4wjzxtO+AkS1lBVY5kM63RbHFiMyC8eXwDnb7QzwoEq4kOiZpxWNQzj1nA1HxMckSRtJxkADS8Msq5UuMtHuVkVP7QTuZA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] arm/efi: address MISRA C Rule 11.3
Thread-Topic: [PATCH v2] arm/efi: address MISRA C Rule 11.3
Thread-Index: AQHcR4ZXAgFUzy6FXUuCamrBu5TzVA==
Date: Mon, 27 Oct 2025 21:12:03 +0000
Message-ID:
 <212a1ac4ee568f027f6cb7f9437aa42d2f0b6c41.1761599221.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR03MB4140:EE_|GVXPR03MB10780:EE_
x-ms-office365-filtering-correlation-id: 72e36a19-8d62-471f-b904-08de159d7a63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?D1bUMo7MUisAb7EJrc934qtBIDyvvSj/e0C9S+26ATXK7cptBZ20poXlAZ?=
 =?iso-8859-1?Q?Fhfpn/MFNRENWsC5PJFQxBykLOr4as2plH7jcMuA2RETJckGup4fTVuDhR?=
 =?iso-8859-1?Q?xWJidfpQmCLGp/f25YPqAO4W3J1hj0iQ2zCbgOkxp+4hRqdUlCSnu+eI+8?=
 =?iso-8859-1?Q?Vt4N9UdzqRh7n5T0uzSrmu2Mkip3SRgJzTakE/ebyVNGpbBRLnYuB+r7MF?=
 =?iso-8859-1?Q?9yY90lS2AJ+qtEOnFHdPbeDDJPbRZx4Bxvis/gcGO7nrvADBKiemd+hLpT?=
 =?iso-8859-1?Q?ccbY9SwpBJw2uHlvfgiHU5PiNi2J4K9i5HSkrGdk95L49CdyQsKkFeAlZ6?=
 =?iso-8859-1?Q?miDEwiri0ttjDjgBHWR5RpKhGUg/gdxdxoF4JDldDQL3FZg4PG1DOI0WG/?=
 =?iso-8859-1?Q?1+QJXdzEaR7yJ5dS0wAUWCG7yxqwuWgaI4QEr0yO5Z0OC+nFFALv/TGTzp?=
 =?iso-8859-1?Q?mNed77yguFd2gBOsdAsHy1ogJsWI4aB6o819Yw0194rq5BJSutdXsupqkt?=
 =?iso-8859-1?Q?bOFGFxUOTUos1aGzXReALdm38lceafMScYB/cwA08XsEJ99amoH8m5Z+zH?=
 =?iso-8859-1?Q?m+EHBzLUsx3pqDbyGHbwOxkJmdNVNrbCPbH1lVE1qxAkl18AtSTc1/g/la?=
 =?iso-8859-1?Q?MaMnCXi6pwgK/mqCxNgMQURFgMwfwRMHGYLSx5xOnfqzHzjjBYBv5laWvo?=
 =?iso-8859-1?Q?kgPb9fz9Zw+h6FCmNe+bCmls2ahvd7mHoh2fHCLu4XDqsR65Zx6r0K/ddh?=
 =?iso-8859-1?Q?TSoJYb8lvGoPxV7N/kiIyJypSI86hWf04gN3jvfsngwqh0IfgyBIkw5k9D?=
 =?iso-8859-1?Q?XZ4J/jFw46jta/Fp1hOyOjIIV+0fgL9sybHf7abr9NuWsO0Q9WIH+F6IcT?=
 =?iso-8859-1?Q?UiKPGjEUpcQn84HPI16FvarpI4hVimx6mgi/d+50QohrXjj1KWoYRqrYX2?=
 =?iso-8859-1?Q?naL6bA4mDxzKVzyiOn9s7+bb+iHfAhQtmrWydvsX2Ky3S4OTD0OgJL36Zj?=
 =?iso-8859-1?Q?jum3t1dhvKcvE39d2REcqx8LFNT3ObMrSBUu6kosMNBcx603xnZvuiQif0?=
 =?iso-8859-1?Q?oqW+/zC3kAUDPfBj+hpZlYECD5NldH3Ffwo4Pq3vS/yBYAf+2fw0/PzBhg?=
 =?iso-8859-1?Q?s9WKh5z5oPM+rCVIUyZJRI6Bo1s15rotYakMhN7Y7+IrEqitrcnKXaFCaW?=
 =?iso-8859-1?Q?TCczMCcVGEXZxJrf+AFUo+p7ZOmcyNQ6OY4YTbLmgtjKwXbAo1JvD8Tpyq?=
 =?iso-8859-1?Q?KMnC/+J84YOkiL5IcTH77ZMlSHer8aJeSI90uLxV2uuZo3Ot35o14QioIv?=
 =?iso-8859-1?Q?Y3m43uJdQ+OdjtqsJPaqrwBTqLC4VRPKj6D37JqbYKmEPtNoAqWq9i2h6L?=
 =?iso-8859-1?Q?ehZrMuYk4Pkowc6EOg4/T70ny+QTIIQrxFM0XixqikLAJkd8KQcai2913k?=
 =?iso-8859-1?Q?+jbNbhnQ7UXwROQlcGnfvsOPpFk81kRyOwhKbf/kfB7WRnkLp9lxeUdfQA?=
 =?iso-8859-1?Q?ESgx0YQVzR0qkvtbRDioVKJ6IyUcsCWPWnNb/KoLOg3A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4140.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?8xIaM9sYE2XgZ79v8+OjO+6nZrdmGcmUWNd57khedkelSaMdOhawa6+YYV?=
 =?iso-8859-1?Q?aZksuS7YSq3BBrI+GCcNd6C61ewAIwk1TNEY4K5O29Apn3RwpXQMVuzRdw?=
 =?iso-8859-1?Q?X4zMz/0rZSM/b8SN/2nJgDqG51d7tkmilsCoox6X9FNMgLJ2uM/xXAozsf?=
 =?iso-8859-1?Q?FalfViKC+DJSnWGkycTo4++WsStSf7cOSPBdjx0mnv5P+AWeyyQ77x5GOt?=
 =?iso-8859-1?Q?ErFZUx1VlBRexYAM/EPyR5vX1f70If3r7Oatfd17af35XRNJoOlK6mdvHK?=
 =?iso-8859-1?Q?CTdNM6tmQrbLKmRUo70NvjH1wtKWFF/JajsZyABDSxHxCXwcuwSxmag3lF?=
 =?iso-8859-1?Q?+OJkAxOY+IuttCytan7BMo0kkgypTUMKRGt3j/+DJxyuy+h7YxxSuRQ69S?=
 =?iso-8859-1?Q?KxqMl0Esi2tYvgvrbEiGxCn7qQbC8sbU3SOLDzOYAXuyYyd9U46Q9I/eRe?=
 =?iso-8859-1?Q?YEx93zN+Omj8mdKSqLoypJUnRL9NlzvamS5gn+TX0Aa8DdVT7dcRRZHNIS?=
 =?iso-8859-1?Q?gI/ExSp6NlJ/Us6Tx0dvxZK2Xr7TLUtDuXcdDZukkece59KHpnXnH7pFc3?=
 =?iso-8859-1?Q?xTClRsUYXqM6ZmQjpSKcTOO3bOSq0WgEhbfHyRmcfUCaLHnphZK/joBE2j?=
 =?iso-8859-1?Q?pfAlyWyfERfxzoLyab7fO02abJuJtt1PReSU1TRvHLA2Xp7kC2VZeyjX6s?=
 =?iso-8859-1?Q?DZWPzRm739dGHGEgxhg/NZQjH9MjKWITRYWCPCOW4L4dIsUsBN4dkf4vuy?=
 =?iso-8859-1?Q?abX/nGW/vP8XMfouFw54RIBEAF9M03Y4IWL8sMsy6p4frWLzoBmi+gjZnz?=
 =?iso-8859-1?Q?+l8EMdRJ1of+NQTNxql/yLfvtOPUumr1hzAEI3+VGwzG0Rj3ofPW9Nhwx0?=
 =?iso-8859-1?Q?Q4BzlzisL7TUEn1JpLJNDNt/IDk9mDnxhAeCsgqzK8u/oOtPvh/EggPnF2?=
 =?iso-8859-1?Q?c7EocEZZj43obV42z0al+8Jl2wbO6HIxlGvWqX6XkZ+gQqQfbtz3K2Nv0z?=
 =?iso-8859-1?Q?H7hv8ycUPs21COBUBZJeky6CGHmg3OAb8vrVArXAAMF0VT5O3aVzcaiyxC?=
 =?iso-8859-1?Q?+IR4W/arP3ThnU2oQQqoY5SIqhHgHHVq/xZ2mLz0CcF9IFY0loj8LBmk1T?=
 =?iso-8859-1?Q?ZBXXdo4Ea2rdRdfyjaG7j8g8fyoTNpafqJidSi9Nj0ZOp4HpW6fTyDYK6U?=
 =?iso-8859-1?Q?27qUfE9mJE+EJ01G7ICb8m9GzzC7EPRNFnOwO7LN/JoK4qtbXEg5HRUjK9?=
 =?iso-8859-1?Q?+YO1mReJxaPiDkpSt/lcYeupurrs5W1fAbdUU2+bkNguVE+PDYCKCJeUpO?=
 =?iso-8859-1?Q?RL2jDHQlhl9uFr8yIWKLq4KMHK/A6oDwtPUhMAkjdEh39VU7OhVZsq/TWE?=
 =?iso-8859-1?Q?b5iYpIbJfkdo/bkpksDkwy/+Hdg1TwBEnZkndRlVQF3pk+xsetSFgjkeCc?=
 =?iso-8859-1?Q?yoijzltGNA82o/7PCRA/jSWD6BjVrwU4TFgG6uyhwCbClil56bXIHKMLOG?=
 =?iso-8859-1?Q?hCqaXyw5NTSB/OphQ8dl94VX90PUq4Ws/q88tyAzWtZLWGe0C5qA0LUOGy?=
 =?iso-8859-1?Q?Vhf0CErGklRTDvJQfg3FGOPo9/J/IpYCvZUZIYw22GPVCM9WHSxzvHhb+i?=
 =?iso-8859-1?Q?E2/n19XVrcmYo8CZdM93h7bA5dViZT3dG3POKm32+6Hfl7s7/bdfdj6w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4140.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e36a19-8d62-471f-b904-08de159d7a63
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 21:12:04.0315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5TiCk7obRtmlwd+JIal8Jhy1mPTujF1psMDY9T5yNI9IU0aEJFpXkTltgfPRhOP/jzknDDGUW5dKDZYYbGvOhE9SwzzMoA67G2df7lqlr5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10780

MISRA C Rule 11.3 prohibits casting between pointer-to-object types that
are different types. The original code used a macro 'NextMemoryDescriptor()=
'
that performed a non-compliant cast from 'UINT8*' to 'EFI_MEMORY_DESCRIPTOR=
*'.

Change 'efi_process_memory_map_bootinfo()' function parameter from
'EFI_MEMORY_DESCRIPTOR *' to 'void *' for the memory map parameter. Replace
usage of 'NextMemoryDescriptor()' macro with compliant pointer arithmetic
on 'void *', followed by a single compliant cast to 'EFI_MEMORY_DESCRIPTOR =
*'.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v2:
- removed 'NextMemoryDescriptor()' macro and used pointer arithmetic like i=
n x86

Link to v1:
https://patchew.org/Xen/78112778d6fd5f720f7102db7125c844b747a962.1761242341=
.git.dmytro._5Fprokopchuk1@epam.com/

Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2123465709
---
 xen/arch/arm/efi/efi-boot.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 7844b9529e..ea59de47e7 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -191,15 +191,16 @@ static bool __init meminfo_add_bank(struct membanks *=
mem,
     return true;
 }
=20
-static EFI_STATUS __init efi_process_memory_map_bootinfo(EFI_MEMORY_DESCRI=
PTOR *map,
+static EFI_STATUS __init efi_process_memory_map_bootinfo(void *map,
                                                 UINTN mmap_size,
                                                 UINTN desc_size)
 {
     int Index;
-    EFI_MEMORY_DESCRIPTOR *desc_ptr =3D map;
=20
     for ( Index =3D 0; Index < (mmap_size / desc_size); Index++ )
     {
+        EFI_MEMORY_DESCRIPTOR *desc_ptr =3D map + desc_size * Index;
+
         if ( !(desc_ptr->Attribute & EFI_MEMORY_RUNTIME) &&
              (desc_ptr->Attribute & EFI_MEMORY_WB) &&
              (desc_ptr->Type =3D=3D EfiConventionalMemory ||
@@ -227,7 +228,6 @@ static EFI_STATUS __init efi_process_memory_map_bootinf=
o(EFI_MEMORY_DESCRIPTOR *
             }
         }
 #endif
-        desc_ptr =3D NextMemoryDescriptor(desc_ptr, desc_size);
     }
=20
     return EFI_SUCCESS;
--=20
2.43.0

