Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C97A0BAA5FF
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133280.1471453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IqA-0002gz-K3; Mon, 29 Sep 2025 18:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133280.1471453; Mon, 29 Sep 2025 18:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IqA-0002fF-GI; Mon, 29 Sep 2025 18:43:14 +0000
Received: by outflank-mailman (input) for mailman id 1133280;
 Mon, 29 Sep 2025 18:43:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6YU8=4I=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1v3Iq9-0002RY-4v
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:43:13 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26bafb6b-9d64-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 20:43:12 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by VI1PR03MB6591.eurprd03.prod.outlook.com (2603:10a6:800:19f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 18:43:09 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 18:43:09 +0000
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
X-Inumbo-ID: 26bafb6b-9d64-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmbVklRYnxgqAnZywy8U6vHbD3jB8K0RHa6Bgpr12e/c5DrZy2nTrVkAk/v/Di8X9uha7dksWi0/ReOFRXsdz3BqcPYThWyu3qcKrnuTBm22hKtdo73lihwlYvMsc46WkBiXv+bvIEg+FJ5rDxLL8Kx+rFO4EU5+7Lr1bOIAdueogagPwW+6Q1at7e65XouVarhT+CerukxeQ3jHCEQzbdyfD1rnTbYllmxC9NBGm4ygm2Ay14ZjVqxN6E3W/PkRS4NeaQTJkuBNvA2du8cojDoD0pxlMQ27bEMjC+geyhrqMZruh2SJ9dMxukFYwVZVdiVzt5Rq4XAVsn3oNvAooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZWjebV7wz+BOSCoJoGNDtDTi2eO9j0uBNtCQOaT6JI=;
 b=aHDe35JPDw6G13SOA2TSmP2fqJmAevhHRmoqHidMTkNwzgX3iiOMroEKqOud5jz0A7XpoZOcTvy4E+bMY6AWIw8kyL4vBZglPAg5tsk/kj7RzgrrpDQIeMiR6EVAXa+4OQQ5Qsl4nqv8b71pqNZ7pCIdD4crnAhKgPyIg3G0QfalsFmzvRz1jiaNhgekFEMnMR/D4p1k3S5S4LKA8GMWZ6KX4gHboIsCm7oAr8Z2dNv6X5VhLTBesSKmpSnp46cpOCSJjhxw5ucra/NOMKwUjVpRi/i0DgsE3eIqRsJ5zzCOM/CyL02kZm9jqYXg05TlAOMcdaFunlueLctq2z1m8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZWjebV7wz+BOSCoJoGNDtDTi2eO9j0uBNtCQOaT6JI=;
 b=ZGEtlQmXsNmsz2ntR1HSO1ADlrddResFrKiR6Lcygh6ExQcL4wVy3sItG7opatJrc+msdjRjNZ1/d3njUlQ1prtJ4Tc+bGBFqasnG2TEaqb24IEqR/13ASTi/UV+ax4cmpG91yyiasJF39tOGMrVJzTT53aS26i8C2LCczg3dCrb7kZzPetAHjIyHmasqW1EWNBo57fd9G213Fm1uQI7JDLw1rGltc+ppFGQExfmk7cx8n5r3PXvomy5KVtkA2TeJuo19dq0QU0+dkabeuCAXkkvITtRiL9Y+TkZxEr/MF1mihWlWWZALxhadqGobrOJR7FShlOEkqivv0awwt1lXg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 1/2] arm/acpi: address violations of MISRA C Rule 2.1
Thread-Topic: [PATCH v4 1/2] arm/acpi: address violations of MISRA C Rule 2.1
Thread-Index: AQHcMXDmBSS0MiCg4katDMcviU0Eww==
Date: Mon, 29 Sep 2025 18:43:09 +0000
Message-ID:
 <53f0ef3aa8a3ac07bd5ac431ca940e1351e931b6.1759168391.git.dmytro_prokopchuk1@epam.com>
References: <cover.1759168391.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1759168391.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|VI1PR03MB6591:EE_
x-ms-office365-filtering-correlation-id: 3d4130e2-bb69-4819-e743-08ddff880931
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?8HUrCkuYqvq82BB9/IGKT4budJ2hw/z/W/vbF73oP+trjpOBzCLpXt05/R?=
 =?iso-8859-1?Q?7vdXCJh/vU5wjwYxzpccYEqd151iR0439l0Vug7NYxwZRlSJ/dmBcysa7Z?=
 =?iso-8859-1?Q?lPzQEjIZxSgqJOP4eWGmRMqLABKNY40aFc/NAf4mcULfJ7GCIZV1DKqpW2?=
 =?iso-8859-1?Q?SYN6ODTX1qun6ia8UdU0hsEADGfwmTjXkSE05bpLT1sh7Awa3xSl0Yyy+k?=
 =?iso-8859-1?Q?rZEkAWY/gfuUQpozPutySMAoVk8+DWbjl9knbQYBX/zOH1KkEB3GehOy4E?=
 =?iso-8859-1?Q?dZDT370gRSRegp9H7ErXm536sJ/5rOrQoS7Qp2UXC8gJ41aJXk0yX8PyLL?=
 =?iso-8859-1?Q?5oCsovBWvWUqGYECH/i8YGfNDE1xg4QF9yMDHHyRMqt6Tw4PoNd+2ehBBD?=
 =?iso-8859-1?Q?1aJrXk//mWu/IkQAfLLUHisocMFUTS62zt17r2iV8mtZe9+Q8srXxC0pw9?=
 =?iso-8859-1?Q?DufZW2bRDMgo2EkClSeSVAiREZuZK/pXGmZjQPxpWx+uDX+UiqaLQB0FBD?=
 =?iso-8859-1?Q?FB4hcG/MC/quCpQ7B4FoD6stdS5TvdpLekNnNc/2Iuq324FZeO+6SlFAu+?=
 =?iso-8859-1?Q?gcqhTaQe4JhhpGwyaH59eujJ1d0c8O7dQGsyVmsBoQ/JLDTFHg4nzFXbuH?=
 =?iso-8859-1?Q?fGBBKqQg0BuA/kOpAUnFTu05dH2PUGrZ5c7hhgOveVby5geig2PxpBYOWv?=
 =?iso-8859-1?Q?MQv1fanVTcJFbBlnVVB1Pw1ag9HtketcuRXkbSN3hUQLxbyGnr8iwbivEP?=
 =?iso-8859-1?Q?dcFObVZo4IAqyyDjbD6xQAZgSz9P6FDSuYvbRy6a6W18OkeN3PSyghebQ0?=
 =?iso-8859-1?Q?xCZB5p3Eaaal6ki/41N9XZ73zo9QXXp/nri8ei/Qe6d1gTlCpR6J2EpLX0?=
 =?iso-8859-1?Q?OLffFH3lvjKuZBvAmEa551jaCUaChd9GyD3SOQd90NCyFnaGdNz5CLwbVW?=
 =?iso-8859-1?Q?tgHUA3l3KuPkW1C8p0qXjMTEIujC4mCA+/slCcddWB43C5s3JBdocfT825?=
 =?iso-8859-1?Q?k2VUTYtM1R+l6M9keO4nPtV7VDT5cafamU81Nm/PwSODtFHacDOlj8oKlv?=
 =?iso-8859-1?Q?kWbPVIbrMf2tZiNwChlzYoW4Ufx+BGLhVoAPjWt1xrnTmUSu7s27rNIQe+?=
 =?iso-8859-1?Q?7FfO8MWO3uxWTns2Lksw81Rcxwn/XBBZJANilRVG4Ganxz5s6jOj9x81Er?=
 =?iso-8859-1?Q?kwZVBZfuGUD7j6ajDrJC0+VJ1QCf7gM4rS5axSTcSYqNlUpPRpL23NXFLJ?=
 =?iso-8859-1?Q?4IwQebWk/m1GIZSry5G/rTQKQuzaXYVA3DESGD2CaCx0dJcHSgaLrw1wCi?=
 =?iso-8859-1?Q?PT2oKVKq9yTV9rJnClKWOcz5wyQqCwmClFQlGWLpbIralIVdN+4S2yDixc?=
 =?iso-8859-1?Q?AxFbrowIRZJ6xs/Htl6FqsD9Bo8gEABmk8asnhja4ycX0vDp//uOgKKtG6?=
 =?iso-8859-1?Q?qZDZxK9KqW6AYB/HLoRiuWz5wAe8WcrYhwvaCFYeMfIFJCUhCuhS0K4vWv?=
 =?iso-8859-1?Q?AvEGKc9YRBQwRTzNzwyJ1P+x/p6yDplsjnkpw3M4NuV1h/msl4Jq7BPxVj?=
 =?iso-8859-1?Q?btNAj8AdHC9zyRqbQWSDQ4LzYjL4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?VfhNWAkqv/RmzIYSzuS5XZBExtmQ7RawC+voW331dOH8tHQ330q8q1zKHf?=
 =?iso-8859-1?Q?w+GErSET8xygUelaspWA8YrEB8ldJJXJ7GFg8eSV+aME+JZU8+QatJPnt/?=
 =?iso-8859-1?Q?o+iaVvdxUidCTNxBaRpQ4M25ibmVtuPOfCfeldQRGhdcHzKsKZ/QWelgKa?=
 =?iso-8859-1?Q?/s7Spgjjky0/jg8jkIeWyWfJvvfS5b7mgVEhKRLHek9V/4iKaBrp/kkZ+4?=
 =?iso-8859-1?Q?Y8QZbgou3zdjGNxrsGx+471OhK7y9BCl32ce80oCqO9y62bAn2vIUD3igH?=
 =?iso-8859-1?Q?7WMbvL6h4uur6HybU3SmwJHniln7nIMbLVg91SRV1kMOYuww3k2soLEntK?=
 =?iso-8859-1?Q?oRMLHSTb32GGb9NYt3+Y08slrSypC7JQEpXI4UYY4CvOe1bHpKTqmAwtOD?=
 =?iso-8859-1?Q?SSbdEVRCsKpYvpkX3sGN+M9o65hiQY8sxbk4JXEW2D3mH3xY7JWP2OEFzA?=
 =?iso-8859-1?Q?4JXrDhlLsWBPpieAttPP/5ogoJXh08Y9F9JVQkTALsia0iwYOncYgKpSFL?=
 =?iso-8859-1?Q?sGjuXlkHktVYj7OMQ86iP5KFe975wlYib7zxK7WouFqWNotQkTr6dtA2cb?=
 =?iso-8859-1?Q?iIrwPwY0TKYy126vUgUOeQCgaLjLaNgUJlCufT+NFrvPP/XG4VsKd8xrPL?=
 =?iso-8859-1?Q?nlJjmnM04SvDF8U3rb6/GnDpbLZXHlGzeaHXTzMG6+Dx342tgDGnjy9mLU?=
 =?iso-8859-1?Q?4MDRHtmrKGwLudh61PA9+MF35b5qywPbKI3xJI3fxDzoWGMiUM+sHWVBNy?=
 =?iso-8859-1?Q?Or8Gq84Qyir9ZHVMVbVJvU7S71IZQH764D7m5RpjOshPQqYqsik1TXye7R?=
 =?iso-8859-1?Q?Hexg+G2OjSY9QjvpkCRLee0C14lHQO8f8mWMCPVNNgwVJxPM3tEgliiSle?=
 =?iso-8859-1?Q?sIcCMqGxciGJEieHMTaVg8wokc9duZLUFy1z6fai+2cz8kEY+c3DHy6pUK?=
 =?iso-8859-1?Q?jVd/9bysODFlX7GIIn1UAUFioLdGpkXVWQ3JgtiTRpfbpPZGQ7xSqZdWNz?=
 =?iso-8859-1?Q?aGxCNSbZ5g/vIGR9seQXOBGk9DKJIntfBPoJATKjX85cFrq4qtOlz/5scq?=
 =?iso-8859-1?Q?NMNdDgWqdPxmBJBCmyfzuAqwODCl0vbcJLNAUFHCwn+61o17b9k2eU6yWk?=
 =?iso-8859-1?Q?Q+GhclotObhgKwqBL/xKenzH7iM1+2A6t3Vw6gJMKb2uwscNqY5Tyomb9b?=
 =?iso-8859-1?Q?hHNH7dOERR8IwKsw79IZpzn9M9OX1L0AuNkMeU/sjWnQNJSxgkM2KJD2zC?=
 =?iso-8859-1?Q?wbLskPlcX+a99csQ7sVUT1Pp+pOlaR10L8IpeKWzIDa8udEAUdBbxdfSC8?=
 =?iso-8859-1?Q?XCVvhUf4uHhhNmwdmLZI7MzL+kgNN0bVU5D3oyse/4OOTycEtMKEbusV2n?=
 =?iso-8859-1?Q?MRnrq3ZhuUlSQGQcxO9Vo6CLXDrcynP/V9PK+8VVN4VacwWmC0sIyE3ZcO?=
 =?iso-8859-1?Q?zl1hxdD+WHuiC3ankDeJOC/5sTy057peBYaaKuq4fN0CN8aouzQWzR+UDc?=
 =?iso-8859-1?Q?ktqkGfd9gtGtZVa+Z8dgkRTnou4AexG2jYcjA7XPc9J0ePNBRE3uslveQO?=
 =?iso-8859-1?Q?pzuLUeQVJc4Mb3SYmDVdPX1nGrLBkNd99nuJ8rDZ551xYvBxkHb9l3YOXv?=
 =?iso-8859-1?Q?L6QAK23PXTGYmp5nNzQoA2WSPlDTZM5yZR973/uMeFVnixYWpfaVln3w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4130e2-bb69-4819-e743-08ddff880931
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 18:43:09.1352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p4kiydLYRMqissRc8SYkvtqg2ZVtp6FR+kTqSdS/TYhXWZ6DTnZ0Fckpu92IoK8PueJHAF/5Pcm1B577aXHBLwbJKIGykwG43Q/kwbDs4Ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6591

MISRA C Rule 2.1 states: "A project shall not contain unreachable code".
In certain build configuration the following function 'prepare_acpi()' is
defined as inline function and contains the macro 'BUG()'. This resulted
in violation due to the function became non-returning.

To ensure compliance with MISRA C Rule 2.1 remove inline function and its
'BUG()'-based unreachable code. Provide unconditional function declaration
for 'prepare_acpi()'. Rely on the compiler's DCE to remove unused function
calls and use the compile-time constant predicate 'acpi_disabled', defined
as true when 'CONFIG_ACPI' is disabled, to statically resolve conditional
branches:
    if ( acpi_disabled )
    {
        ...
    }
    else
        rc =3D prepare_acpi(d, kinfo);

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/arch/arm/include/asm/domain_build.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include=
/asm/domain_build.h
index c6fec3168c..6674dac5e2 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -15,16 +15,7 @@ void evtchn_allocate(struct domain *d);
 void set_interrupt(gic_interrupt_t interrupt, unsigned int irq,
                    unsigned int cpumask, unsigned int level);
=20
-#ifndef CONFIG_ACPI
-static inline int prepare_acpi(struct domain *d, struct kernel_info *kinfo=
)
-{
-    /* Only booting with ACPI will hit here */
-    BUG();
-    return -EINVAL;
-}
-#else
 int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
-#endif
=20
 int add_ext_regions(unsigned long s_gfn, unsigned long e_gfn, void *data);
=20
--=20
2.43.0

