Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99106B2DCE3
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 14:44:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087438.1445487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoiAy-0008TR-Vd; Wed, 20 Aug 2025 12:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087438.1445487; Wed, 20 Aug 2025 12:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoiAy-0008RH-Ss; Wed, 20 Aug 2025 12:44:24 +0000
Received: by outflank-mailman (input) for mailman id 1087438;
 Wed, 20 Aug 2025 12:44:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fiHc=3A=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uoiAx-0008RB-OE
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 12:44:23 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65bd4f30-7dc3-11f0-a32b-13f23c93f187;
 Wed, 20 Aug 2025 14:44:23 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS2PR03MB9194.eurprd03.prod.outlook.com (2603:10a6:20b:5fc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Wed, 20 Aug
 2025 12:44:20 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 12:44:19 +0000
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
X-Inumbo-ID: 65bd4f30-7dc3-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8B0zMFH7QfCTV4ubQbVJnKcPGPY+1Ehj1bd9fDEzP2Bd1neBkNIClXsVD07BzllvIRxnrB/OP+TDJadSQp5LK8peTgMupEp+dPL36uYpz16ZKlwhP02VtMMpqPjGk3gkvoJY9H+eHZShYI3E25P6IhI79hTI0RSeXd9j2hf8M37yE8rnRJe+ekVBFB9zws7esRHm+RlzciJmTYmD1neuV0jBVpVR++83PZ7H3eHpkcf/K7P16XY01XHFZKwPiQQfgbAN8xqzyQ7FuujaozAuDVvLHsccmsFna2UYsMvKIUh2akwXjce5DZagHP4uPgN4Zgc3sQriek3olN9SCN/6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iH5dFHiOKWzkPchOkXAXALka1CWtQksfFajkNb5o98=;
 b=H7Ujz1vOstDp/G3q9DZ3+/tGZPt8jfQwoPbLs2PuO/FON8rli2VZ30vT3xnKcH4kAnMnLO8nYQUhYxsF5wS59c1r5ve0DJARVgPV+LgvHR7YMabDl2Vk23XHp5SFe4XwAKorpaJ3m2NFXcnKUR2wnLvIDn0hQXkE9W22t4inNs8NHnhcRV/XBkvHHz+aujDIl67Yrj6yPu3JvgTDjJ4C2W/dIgKq+es3rJXDZXTRX2F0COdEQzjVZdewiM70Sf4MH7tsMwai5FsYSKw2F6Djg2lYGv+ty1yPzMgBUTIl3tZfgsHrAPoadxoT4HuQbfnZxffs4xWbwDRXO/8Jnu1zGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iH5dFHiOKWzkPchOkXAXALka1CWtQksfFajkNb5o98=;
 b=bn04wJfnvvBMsQAV0KfKGJZRuupcg/kM/6rj0Ts/Lvgc8F3JNZd72HetW9xYh196ZGzsyqpAYgLFNVlc4vvS5tYLDxXRjpuES70+iDbt8abc0xDWa7WFKwjq8OiM+edkYHy75EmrNTKI86FYjyo1Pnqbj4RjBadsgF1AeKEYds3JgQikeoEVkbcKKpCtNVU171ODR7BLJApDES1jAFMnDWPxnMmCdsCc+oH7LBEFuQJQZNjeLILr5HlGvzaMrgoIRr4k+cyXB3MH5bXcxcZiBfIezsXDifRBMhY2iEvSCBXf7vWmmaubWkgUqAjWz9sXxNLpCaUeV1OM1nzpOZSo6g==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH] misra: add deviation for MISRA C Rule 18.3
Thread-Topic: [PATCH] misra: add deviation for MISRA C Rule 18.3
Thread-Index: AQHcEdAlL6ZgiilPSEOu1KBVqkWanQ==
Date: Wed, 20 Aug 2025 12:44:19 +0000
Message-ID:
 <901917945f704643e95842a773be9e8676f76d10.1755690681.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS2PR03MB9194:EE_
x-ms-office365-filtering-correlation-id: 9cc36d22-59f1-4ebe-0248-08dddfe74834
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?d3DL/lU4pzWQOnhI5ZfGcVGTLGpLyODajTLVgU0JcwDErymmToouWhjQGB?=
 =?iso-8859-1?Q?yWdES9toJjpiz4AFu73+yRqZll6XyKLysDAglmxBq3Lko2Vdl/dzSinmFt?=
 =?iso-8859-1?Q?z2QGLoFimQEe/FIv+Tb+zYf0RHgqB9IyJT2/K3bSG7zULewMir7VWFhmJP?=
 =?iso-8859-1?Q?AA+c9xpZGjgiMg5XAPQGHDQfqffqwVbsFBoezEKtjAXevA/XDeCls+vgMj?=
 =?iso-8859-1?Q?7iU2Ji6JtS2dTAwjsfUWdPsGBEm9VqxrE0YDxx2FLnSuWux9HDFfK0+pV+?=
 =?iso-8859-1?Q?8Nd7kgFgEOemTcY8Ml2I+Olhz5ohop9brS4UIAsb7KvTWTM5Hd96DzdHrA?=
 =?iso-8859-1?Q?Tdh6S6dOFIN5i/6YrsaOb1+0n7uci+EF28dKurRkKR6xI3AW/0N4Tujxiy?=
 =?iso-8859-1?Q?Sj+Rnl2Mzs3098/BimbYJummv+dgIy9JBXFHabLMtX9v+F+o29yzgBjUPp?=
 =?iso-8859-1?Q?n/PV3OI2RjZU1WT7ubOP6ba7XeFvneuu7ulNwh1UppmkCVCwEDZzeu8fo+?=
 =?iso-8859-1?Q?tmKM27HhrqohHM0Rl8exsxvciY2V2//7zbF/qpWENfd7eZiXVi9BGO5bWF?=
 =?iso-8859-1?Q?47BPXqsjjWwygu4M8FiIaYk7sNyAPw8PZV1rv2Useie8ohzMPTFXftSQrZ?=
 =?iso-8859-1?Q?fSqJ6Mg74VN/pifdo5jdTepELkKtzSmZCPcd18gIJtzg9GsPns9gr8PsTp?=
 =?iso-8859-1?Q?WONGtjqkvxOXIqblOOEVuSuz9Q6lM85BU+fjQcCpyucCrFhYSQ/1RJUx/R?=
 =?iso-8859-1?Q?cU1TXOBHVgGk7211L9en7JEd0itf4OTvh8UsrnUSHTH1tQSw9Y71os10Hg?=
 =?iso-8859-1?Q?RatwpChZwFZuV/YiXcANxWREhMW4CMEIqAlSKhs4qgoaERLzam6kGSybed?=
 =?iso-8859-1?Q?qug7gID05/UHzv0hVV8g1QkfQBnQfCYsRezTSC1J7OwMU7HfYvTfWhqJDe?=
 =?iso-8859-1?Q?he28tUFSkhaO+UjfdWYymhociMYQQ7oBkj6IIB5oL4theKdbmPEsRpMmHG?=
 =?iso-8859-1?Q?1X7a4u77Mq2YlFhOrUyghLP/Qcqlyfo0K7jHBvN55YvpfHwkmYFuVSvfS/?=
 =?iso-8859-1?Q?apa8lphaigs8bx647qOvB7NOTbaL7z/2BTDibjpoEENE/jza7Tah5kZ5sB?=
 =?iso-8859-1?Q?3yxaaRgaYTcc1rhaP2vlbCnT3jFLkJKHUHVx5jR2GzhJn7fk2yGIy2kf/m?=
 =?iso-8859-1?Q?jQZ/jUbDaHKiufyw9zetRls10ljsa98P7Y6SY73BgnW0lMUKgS3N/UPymT?=
 =?iso-8859-1?Q?ohuM4TXcP5VlKootbwluU1SK4pkWMVb9GcJLtJwjuEQ32YdV4GCerrHc+F?=
 =?iso-8859-1?Q?v5UbH7SNXGHeyq8sM3RBG251oyzgopjdNrc8Qo/9EjNcpzqXpcX0vWSCPh?=
 =?iso-8859-1?Q?28pjYpjbRvq/xhNi9TKRYXW2LV6zNKKMHciNXB00bdflecZqLr2wklvlCR?=
 =?iso-8859-1?Q?Jic3yV2ZMTw9kJkSQHSKwkd3I9NlIYC/rXMr/v31/T1sGpHQg7DR1ltQVn?=
 =?iso-8859-1?Q?0DeNpUR17wvqpfRmPq0CvoYggIilBI/sRe/u+K5POHJ1tYGV9tngTGeuvk?=
 =?iso-8859-1?Q?0z3zk7g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1EEt7F09NECk705Ckmgg+27kA/W5nKS3vPmqOIE1iEp5Z+4TYFtHgoOLKP?=
 =?iso-8859-1?Q?Ql6d3gJpxfEobxUJ5DSlcfx3p1C04waekeORkaaf4R1bNCS+/7POkgl8Lv?=
 =?iso-8859-1?Q?yje1MBFPfyCQDDZgVjgrcXWMQSbK1D6LxtmGpePqmLYcSFWTroP/K6pkHe?=
 =?iso-8859-1?Q?0kLAmowcsoQxkzBrmeGFhnVHn2FyeHsEIYr24rZlrk+KH+wDdmXB5XUQHz?=
 =?iso-8859-1?Q?df52jbsZrsIipTL5A0muKv8p6b8jkGzUU4/fuDPwk3wm02B/HA4JYL02y2?=
 =?iso-8859-1?Q?1V8/6HXTlQHXFYmHMFk8TZzSoGOp0VOZiKbE4cr5BbphqhCdpPsdHuWncj?=
 =?iso-8859-1?Q?OKPyj5BwGpZFSWfW8WIhGn5gcKlQwjmN1UHBzkSQ3skuCVivSTHzkXwExZ?=
 =?iso-8859-1?Q?hb3K4E0Tlvpp8z+GxnT8RMwodH9CnmX7gXhRBKiYjyMj+YKiO3BtTipdAK?=
 =?iso-8859-1?Q?3IjMPrxrl87W3R/TOLue6MeowtjEs8fA0155FaHZudgS7/DF+eZHngnkfe?=
 =?iso-8859-1?Q?T+mpSIzsBbIE/A6quM3nhY0zkNshlQRPmCc1D3hhyJWbUzOD/tJ5gzK4R9?=
 =?iso-8859-1?Q?mUKcSLZUBQIjHGDjdzeppAGmUyaCoThgr9zdQscpOi8ORmD24TAtp1fj9/?=
 =?iso-8859-1?Q?eYJDNBg2RYed1GfzUBwXetlgr4zQk2VI+2X3+iatVEnuGtDRP0xSmxCJ0Q?=
 =?iso-8859-1?Q?Rhe8rofWoIziLWiVe4yYJ94kh1ofyD6JJIck8ntEn0O/hHwDDEuB2J4PYl?=
 =?iso-8859-1?Q?U/9biOC7Og/E+LpyWR886jFpgQwYB4RHV3A9qC7YvdNHUaPM5iTNeW4BAC?=
 =?iso-8859-1?Q?G0cCZen3jx1H0Fhb9ys4hhpijDzVanrLqey2bosNzguS1H1THjGkXwGR5G?=
 =?iso-8859-1?Q?OSi16Krph2Jf5nw7N3O//vBBYoX6nS/1G16KloOCVCN2k3kh+r7fROtBlQ?=
 =?iso-8859-1?Q?X3uXXtOMfu7dZEGulrW8CB2Evf9VNwQ5w0u2klgGmhYb1lasfqmyDDxOhV?=
 =?iso-8859-1?Q?yY1xImIKZfY5K+TXOx5c7+98ClnW87hVx0T8PE+Av3nofcmAoiii3/QZhp?=
 =?iso-8859-1?Q?TbmXaXS2rYdtjFhutVnEMV6ooaGDunVZiHg/nyr67dXGwxCBDW4Nc40ybl?=
 =?iso-8859-1?Q?d6jK+dwuy78nQbQfE2qBRBIMlrKRyV+XxRclcQvNFHj3CVcu8QSb7YU7+2?=
 =?iso-8859-1?Q?EHouYmPY8q/SjcqMcodLm6tgtlPGUmG7fcfu06zKce3oNTdwUNahMUudQV?=
 =?iso-8859-1?Q?o7qB8/l1PgidQ+OMK8znaPaFrW1GJilRmk9Zph1m5PwhpkjY0XBwkKDL+k?=
 =?iso-8859-1?Q?jtREe/hU4ZKtkreOelUdOP9Ef8WSlQoGXrUDCWogJ+/KeYR2oeE2ZFA0tX?=
 =?iso-8859-1?Q?/0oV/qq3m8OEhfXW0pQAHa+9fn+wLxymfUBteQV+zB/6Qz3i/y5QdRIPEY?=
 =?iso-8859-1?Q?5/VmDaNGO3X4XiLfNy5owdetxqoUZAFwzzGtgHa50W7BvLJZh1T7PnrioC?=
 =?iso-8859-1?Q?/v4JjuQ7noEB3NxfuvCv2JOwYupCqt1i4TpUko1lKz28evAkPB9SXbMcP6?=
 =?iso-8859-1?Q?6GijYrUi4pruWav6lxb771AaH5DflIidqtSxhVDW5oiaZfBYL6MDO0XplZ?=
 =?iso-8859-1?Q?kjEqG5KupQwbGIxGFmhfI4gtBHqb9a60/GJ4aYLnLuoKjRJz62iABN4w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc36d22-59f1-4ebe-0248-08dddfe74834
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 12:44:19.7930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nIoyBKhGMwlwho09asHizkNoR2VVBNb2QpzbK1TmnKXxTi6CdIfpgWMNZ3n05aXSX03kxHmztvkIpb3BeFH19J1vJyqCPIXzz8MyVUw4XuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9194

MISRA C Rule 18.3 states:"The relational operators >, >=3D, < and <=3D shal=
l
not be applied to objects of pointer type except where they point into
the same object."

Comparisons in the 'find_text_region()' function are safe because linker
symbols '_stext' and '_etext' represent fixed virtual addresses within
the same '.text' region, and the function 'addr' argument is explicitly
compared to known valid memory bounds ('text_start' and 'text_end')
derived from these linker symbols:
    if ( (void *)addr >=3D iter->text_start &&
         (void *)addr <  iter->text_end )

Configure Eclair to suppress violation reports occured in the function
'find_text_region()'. Update 'deviations.rst' file accordingly.
No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1993673043
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 docs/misra/deviations.rst                        | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 7f3fd35a33..32b596c9da 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -590,6 +590,12 @@ C99 Undefined Behaviour 45: Pointers that do not point=
 into, or just beyond, the
 -config=3DMC3A2.R18.2,reports+=3D{safe, "any_area(any_loc(any_exp(macro(^p=
age_to_mfn$))))"}
 -doc_end
=20
+-doc_begin=3D"Comparisons in the 'find_text_region()' function are safe be=
cause linker symbols '_stext' and '_etext' represent fixed
+virtual addresses within the same '.text' region, and the function 'addr' =
argument is explicitly compared to known valid memory
+bounds ('text_start' and 'text_end') derived from these linker symbols."
+-config=3DMC3A2.R18.3,reports+=3D{safe, "any_area(any_loc(file(^xen/common=
/virtual_region\\.c$))&&context(name(find_text_region)))"}
+-doc_end
+
 -doc_begin=3D"Flexible array members are deliberately used and XEN develop=
ers are aware of the dangers related to them:
 unexpected result when the structure is given as argument to a sizeof() op=
erator and the truncation in assignment between structures."
 -config=3DMC3A2.R18.7,reports+=3D{deliberate, "any()"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 2119066531..a726fb22a8 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -586,6 +586,14 @@ Deviations related to MISRA C:2012 Rules:
        are safe.
      - Tagged as `safe` for ECLAIR.
=20
+   * - R18.3
+     - Comparisons in the 'find_text_region()' function are safe because
+       linker symbols '_stext' and '_etext' represent fixed virtual
+       addresses within the same '.text' region, and the function 'addr'
+       argument is explicitly compared to known valid memory bounds
+       ('text_start' and 'text_end') derived from these linker symbols.
+     - Tagged as `safe` for ECLAIR.
+
    * - R20.4
      - The override of the keyword \"inline\" in xen/compiler.h is present=
 so
        that section contents checks pass when the compiler chooses not to
--=20
2.43.0

