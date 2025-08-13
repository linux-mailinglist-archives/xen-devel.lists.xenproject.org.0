Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56280B25307
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 20:28:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080174.1440739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umGCV-0001gr-2l; Wed, 13 Aug 2025 18:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080174.1440739; Wed, 13 Aug 2025 18:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umGCU-0001eM-VX; Wed, 13 Aug 2025 18:27:50 +0000
Received: by outflank-mailman (input) for mailman id 1080174;
 Wed, 13 Aug 2025 18:27:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gOuC=2Z=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1umGCT-0001dw-O3
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 18:27:49 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 366d90c8-7873-11f0-a328-13f23c93f187;
 Wed, 13 Aug 2025 20:27:48 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB7814.eurprd03.prod.outlook.com (2603:10a6:20b:34c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Wed, 13 Aug
 2025 18:27:46 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 18:27:45 +0000
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
X-Inumbo-ID: 366d90c8-7873-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbYWClpd5Cw+OhWEJE9NdUp248r14j2BeakKxgnbGmlFmfKfVcMxUoXmF+Ttf7HpbIcbSlTtYP3aTC+5AtDrSxYMhNFAn8GxqJ7Zz7pZuW7T4txr37C1cfRY/tpDwiGVD8mGXRutXQaiDeOHdwSnFOtgtLBeiQM6CmLOt3Hm8R1R+ZjI9Zjn4w/Y1vg+WN8hYclSBiWKublo9EPUm/yDq2sYsrzzs7+juhjccoUe8ySPbY1G+1SucPT0pv1CpCpFR+jxcHDmzsp67pYb3J0NF8jS/M6mwR3tAQO+Sx6OV5OxUYFppwTP0sPU+gQJLtmMc6EF11LEPAwUCA24X8WO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxwTPniR/EDd6mZM+Z8suKjuq6XIBjf3jY6EcSig0MI=;
 b=dh3dAMbCx+li4WMdKJVl2x6z7YDM8LGo1/NuaukUfsK6E4D63QM4lJ1pNh3MR5pI/HrX+cJIRPFPFbYzKJ0UlELN6QdzqnSI7h9EyxgLfWtwkdFqgStzfQc4qV6jk32lWC2jr9I/hnt7yw148jW87Q7eYxJ5WNy/Lk/lRaHR2pwZuh/iR5/OEv5PsPKboUMuGq4oO/msCGLz06eD+1QE3grN4baT2vVJ94vDiiYJC/+Da8F8IanJO2QHYsL9g/L7uHRfu+IJlW2mdTnojeSrECikQmc8/teeKqvH8zygG6JeoQjKF3DBumWtwAhxlK4vBidMcI2Ect6eKnAyh4pEvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxwTPniR/EDd6mZM+Z8suKjuq6XIBjf3jY6EcSig0MI=;
 b=NG0ska1rOZo576JFbCpVaZZVFADfvC7R3efaMWaUYTjUfy0e59l1CPE8q4M1YX7Cc4B0n+7Hj8dBlm/MCSf4rTSlllk++vW0Wukqq68kj97pgnKmpSqc3/lPEdgzrUxZoky+rMyPLQgZi9P5Nm5X4zLKfDVF4a1ZNmGpkWbKa59tu1BsgWLw2Hbse7mjEJfrXYrz8B3jpj86jSPcJD+UHd0HeZrffl9L6HUhpFdessZXsn2DvHgIGHOTmQrP6Kd5wO3z0Z4PEZD+kB08x+L14keB1/EdV44DCMPFTOqGPAtDmKCsX2YgsPAC8hUIjyDX61Zrxf7yAklTzna/jIEayw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH] misra: allow conversion from unsigned long to function
 pointer
Thread-Topic: [RFC PATCH] misra: allow conversion from unsigned long to
 function pointer
Thread-Index: AQHcDH/2fJv669AP80eUn9D9WGE5wg==
Date: Wed, 13 Aug 2025 18:27:45 +0000
Message-ID:
 <8cbc9e6d881661d0d7a1055cbcef5a65e20522be.1755109168.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB7814:EE_
x-ms-office365-filtering-correlation-id: b76e1645-37e3-47ed-5729-08ddda97196f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|42112799006|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?1nivx8WaPwDL0bKAXjfQbR2R5/DmmjyTgbloA6LxRYS4Jp+vhGBH0OyZ0Y?=
 =?iso-8859-1?Q?E1ViwzqvJspujSbd1NS5qKph1xXhIm3T6Ck/FuF1KINWw2TxCtXPxtjisy?=
 =?iso-8859-1?Q?XWAzIn5mg53AoId6hZd0XmbzntWx7W5NdNl2nwdd0h7jhlaA+UCuHJx7Kz?=
 =?iso-8859-1?Q?rndQ1hUjRJWxV7Oc2YGvik02DUSnJ8SNCr6kuk8TbkDAfCCC75JldP6L59?=
 =?iso-8859-1?Q?YHi32rTtCUaf+GBTheuxw/lL75uz/lTPpkw++1fquUCQ8OyuRp0KLlI/vb?=
 =?iso-8859-1?Q?ENiwg9enRCjJC3+bYfoSzMecNq7B64eyUZ9d91vquNYehO+3HOIn3LJklh?=
 =?iso-8859-1?Q?b4wOthRgJn27P9l4sM6afJXVgUgDhfiGLZhh22k5XKK7luHn1mrcil61rb?=
 =?iso-8859-1?Q?RrGLplObhyXsk6xdyCtD7jDYbpKz0pGaddccz3BE7TrPl3JtroBx5vkC+6?=
 =?iso-8859-1?Q?Xvdpvr6gbCiN8sSV7rD+kV7U2Z4wHkBRmi1CFjbMJWcaT3aoxeSZY09uSg?=
 =?iso-8859-1?Q?r8VSbrIPaVOpKVD8weQrWW1lQfslzv7m6je0E90EUuECaWs3+XUO3jfbR+?=
 =?iso-8859-1?Q?q8OU7tt7tDfwFniDMMQmBt2wF/JRdoJjivSyRAcr2XLvv2U0eHDlWocp97?=
 =?iso-8859-1?Q?TVR8ae9cuIlPEMPXdHawwJRT1xNPKefKoDJaYklUvi8pbTSmTZjua3p++0?=
 =?iso-8859-1?Q?DDQr9yFKdWKbnIaAP6+wBpUAYOrfV67Y/BBmq+kEqyD3leSbiVqJLMO6CJ?=
 =?iso-8859-1?Q?TCUtLmJ4Lrl8aGne0+beFA090BHX0WkzIZ3l2V8G3K4Lr5bMFmuhJ58xiZ?=
 =?iso-8859-1?Q?dzLSK2K7i8aLYv5klMKUOaIwUxJ5UUNWzyc9JyUiqw0DyAvx81xlHH1X8+?=
 =?iso-8859-1?Q?sB4JasaJ1ZWyytlmNLlSIwKTMQDLT3QymvIaL4V4h0VD8Gh6UMBNXawlgc?=
 =?iso-8859-1?Q?x3IkAjzBTtCR0BOD3C1kD6+h319aCX0CxLUR15ACiz1swHIKY7Mj53V72o?=
 =?iso-8859-1?Q?Mh6NWxkVaqxBUOtNq9fus+bpgCkWBIcCQoDQjlQtwplVQrdkiK4hDqCpIj?=
 =?iso-8859-1?Q?RXqtIoWi5ZGSBUrggLNWx/jcSkqse4MG+BlPJ7XpMJrjJxo62TyuRce15Y?=
 =?iso-8859-1?Q?GLwsxjTvb+k6R7LPSj79f1CaZ4TCCADmnQhRfDJumatX0+rDJrpqVDXYnw?=
 =?iso-8859-1?Q?sB9UyQZnOkr1ixq3UvET43ARilJk8ip7Plmk19ZuZjsNZbQPi3Kf1a/2dv?=
 =?iso-8859-1?Q?VPdn+PYiFVEoeGoaRU3DomRdpiJnt7b+GK6K6OUVigkwFmB8ZMN0Ij5g48?=
 =?iso-8859-1?Q?zot1zw1W3tdW/jB2h6p8xXVtXMq09ToLt6uMAvuqQiuszjQttiBOrzdfUk?=
 =?iso-8859-1?Q?PR5QzWsDD0trz7PaClABH7kSra9XSJ1YEkax43a2ofDptwkHjIAmGIv/TI?=
 =?iso-8859-1?Q?CGhiaMHaIGE7P2uvZh1vs0s8B90oyw7lZDH5Mdtd3NYjqXpyUU+uNlmXQx?=
 =?iso-8859-1?Q?dJIsL3YI4QAcBF/yJffLwRo6sJxyxOlv6gThvRQuJPMAkl9sEUeV0lG0Wm?=
 =?iso-8859-1?Q?XdX2dtI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/ryM71RXl1V0eYcWo3DmHoGu/259QsuSc6VnZS7fQ29HXkh0FfpufvG2bA?=
 =?iso-8859-1?Q?CP3ij3bz1XEpJbFWIvL5wBhFvJEAWuUFBwAT2XINpz05B8lKrvYnV38jeu?=
 =?iso-8859-1?Q?RbAqpKSmT4leEirOVRnnlVuGKw6qOOKSGQdQtPzPzlj/GWpj0SBTBenses?=
 =?iso-8859-1?Q?ry7QpaCW4j7DdXx4VPbm3Mbbv/Q/7ks6La1hJ0cEhZuQM5cBxJUEwWm479?=
 =?iso-8859-1?Q?lHuRYubhxZKY0jMdcblq9fZY6QEBp2kFftouB8SNNccsi0UFmAweXBb+8W?=
 =?iso-8859-1?Q?4MiLXSlLnQ1tEY1/aw/avrqbx7b8CxE3HuMFNk6zgA/Xj1hVqyQesGe8yk?=
 =?iso-8859-1?Q?OZWJHGusM3+89OkRSvKdUTHssDmrTkNEieVeTn90Y47A1k5dKxk+zQ8Elc?=
 =?iso-8859-1?Q?74Mb6d3GPhw5HgcK3QRzkxLaRcpA7knd2YOzBgLIXrZZaYMhByO2YHpfXm?=
 =?iso-8859-1?Q?H2JJ5ugChug9HzlTHSBYrElU7qcXB1seUptEikgS7+l88RU0YFxlsuDBIR?=
 =?iso-8859-1?Q?TF47JrI0AP2O+VN2vAHzMX5Vu/ykar+FXsClpqfe6zkfRxb3S3FhHk/skt?=
 =?iso-8859-1?Q?IVsxkkrm/DRCf0BQgezrAXoDKLa1REhSS0rYMOSeOEeqtxyiQgDJJurEbM?=
 =?iso-8859-1?Q?+/C+Zg0HxJaCWHxa12God3d2FGwBx+rFRBOUvAboGcIgv5IZOl+o05y+iX?=
 =?iso-8859-1?Q?5V0h7SBhcpx+6mvjiarY9GGo0Bq2yHAKrJCcnUpvXwKvrJwrqtRPdGFJWd?=
 =?iso-8859-1?Q?ScEIpVnXssX/6LV4nbBdfWaJ+dr5iG7/YTKSClIsbQMiWfNIFZ8JAAGq/2?=
 =?iso-8859-1?Q?fqI5XUa0KPSpoOMsgRydeV0yyC76+Bs+wabVjQ9f0jKbDVqGXfnL8ZqDMb?=
 =?iso-8859-1?Q?snTiGCSODPU9oq0P/1YxPOZYUpgfSXSnvn0NPgSaZlKWkswu/Vcy+dhANb?=
 =?iso-8859-1?Q?chg7mOXGDWh5a85kRMcyGDKrkrY8kYEz0rmzcG1NPcVep05kKaoEvbUqhx?=
 =?iso-8859-1?Q?WRlksaTMzRcAD/wY+mV6ZIe0EpHUym5HJUVnIGkVZPcwUMjpPEp9XM0jg/?=
 =?iso-8859-1?Q?UJJIZcbmC1snVr2jrOY6wdBNo0TpHY4WAWNdThmERtaQDG104CzQilmiWl?=
 =?iso-8859-1?Q?QtuCBia71h+KET0+BzeZSpFLUx5c8Ma4HgGTti+p3Oh9lDEJV01EuBctuj?=
 =?iso-8859-1?Q?904vnfjXnBFR/zVwtjbT/QobVhtl7Fg3edNvwIn+n5Odwu1OlS3V2PqjDe?=
 =?iso-8859-1?Q?0l7Qg6o9F1vCxbvWtPmBUmWu3rm43Hqp/nEFBkyrEJ/RpKgzVLnugwwmFx?=
 =?iso-8859-1?Q?KlMjhEgnQCpi2zE1AnPQhoj5rGq65sX05GZYufWgZjj0i47CZDjkPwakiV?=
 =?iso-8859-1?Q?u2+WA3iDKsYRYEgCxdI5iZzUTwX/jJDhawwfjioMUaf3gsLzrI7bPvO5Nb?=
 =?iso-8859-1?Q?l08oLUySYwi5I2wc+mVwv7cqUIxdpvzciCKxgfM2aLQic+z12MalIbkqJm?=
 =?iso-8859-1?Q?INkIXcTFKI82Ea6bs6mDleVrLKvheOAK1wOiNsYb3R6O8vPAa40slYXDYL?=
 =?iso-8859-1?Q?OA2PFfX0SH5tWl7M6eXJI16qGtH5SVunUbZ6k1o0YMFQS7FEKespHjzh8h?=
 =?iso-8859-1?Q?8GOytgUG+AqUHOeRvNyMH7yNhHpKKmqD++DPWBWYPMr3JQNszGen+GnQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b76e1645-37e3-47ed-5729-08ddda97196f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 18:27:45.7829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9SEzzdznHJ7dUPXPEVpTdmTEos2lUlrhj1zERh9f6YTi5fqHpnOIxaUkQI4kFpY1aCzQDQxv2z+Vr4jLNMkdLZ/rNlQRYz/Pqh0ZZHpHSkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7814

...

from `vaddr_t' (that is `unsigned long') to `switch_ttbr_fn*' (that is `voi=
d(*)(unsigned long)')

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
This is just a RFC patch.
The commit message is not important at this stage.

I am seeking comments regarding this case.

Thanks.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl |  8 ++++++++
 docs/misra/deviations.rst                        | 10 ++++++++++
 docs/misra/rules.rst                             |  8 +++++++-
 xen/arch/arm/arm64/mmu/mm.c                      |  2 ++
 4 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index ebce1ceab9..f9fd6076b7 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -365,6 +365,14 @@ constant expressions are required.\""
 }
 -doc_end
=20
+-doc_begin=3D"The conversion from unsigned long to a function pointer does=
 not lose any information, provided that the source type has enough bits to=
 restore it."
+-config=3DMC3A2.R11.1,casts+=3D{safe,
+  "from(type(canonical(builtin(unsigned long))))
+   &&to(type(canonical(__function_pointer_types)))
+   &&relation(definitely_preserves_value)"
+}
+-doc_end
+
 -doc_begin=3D"The conversion from a function pointer to a boolean has a we=
ll-known semantics that do not lead to unexpected behaviour."
 -config=3DMC3A2.R11.1,casts+=3D{safe,
   "from(type(canonical(__function_pointer_types)))
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 3c46a1e47a..27848602f6 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -348,6 +348,16 @@ Deviations related to MISRA C:2012 Rules:
        to store it.
      - Tagged as `safe` for ECLAIR.
=20
+   * - R11.1
+     - The conversion from unsigned long to a function pointer does not lo=
se any
+       information or violate type safety assumptions if the unsigned long=
 type
+       is guaranteed to be at least as large as a function pointer. This e=
nsures
+       that the function pointer address can be fully represented without
+       truncation or corruption. Macro BUILD_BUG_ON can be integrated into=
 the
+       build system to confirm that 'sizeof(unsigned long) >=3D sizeof(voi=
d (*)())'
+       on all target platforms.
+     - Tagged as `safe` for ECLAIR.
+
    * - R11.1
      - The conversion from a function pointer to a boolean has a well-know=
n
        semantics that do not lead to unexpected behaviour.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 6812eb7e8a..8b97ecf3f4 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -414,7 +414,13 @@ maintainers if you want to suggest a change.
      - All conversions to integer types are permitted if the destination
        type has enough bits to hold the entire value. Conversions to bool
        and void* are permitted. Conversions from 'void noreturn (*)(...)'
-       to 'void (*)(...)' are permitted.
+       to 'void (*)(...)' are permitted. Conversions from unsigned long to
+       function pointer are permitted if the unsigned long type has a size
+       and representation sufficient to store the entire function pointer
+       value without truncation or corruption. Example::
+
+           unsigned long func_addr =3D (unsigned long)&some_function;
+           void (*restored_func)(void) =3D (void (*)(void))func_addr;
=20
    * - `Rule 11.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_11_02.c>`_
      - Required
diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index 3e64be6ae6..998d52c162 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -150,6 +150,7 @@ void __init relocate_and_switch_ttbr(uint64_t ttbr)
     vaddr_t id_addr =3D virt_to_maddr(relocate_xen);
     relocate_xen_fn *fn =3D (relocate_xen_fn *)id_addr;
     lpae_t pte;
+    BUILD_BUG_ON(sizeof(unsigned long) < sizeof(fn));
=20
     /* Enable the identity mapping in the boot page tables */
     update_identity_mapping(true);
@@ -178,6 +179,7 @@ void __init switch_ttbr(uint64_t ttbr)
     vaddr_t id_addr =3D virt_to_maddr(switch_ttbr_id);
     switch_ttbr_fn *fn =3D (switch_ttbr_fn *)id_addr;
     lpae_t pte;
+    BUILD_BUG_ON(sizeof(unsigned long) < sizeof(fn));
=20
     /* Enable the identity mapping in the boot page tables */
     update_identity_mapping(true);
--=20
2.43.0

