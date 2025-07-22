Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4D8B0D874
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 13:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052283.1420940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNX-0003eS-3R; Tue, 22 Jul 2025 11:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052283.1420940; Tue, 22 Jul 2025 11:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNW-0003bn-WE; Tue, 22 Jul 2025 11:41:51 +0000
Received: by outflank-mailman (input) for mailman id 1052283;
 Tue, 22 Jul 2025 11:41:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibko=2D=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ueBNV-0002RD-2k
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 11:41:49 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9642393-66f0-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 13:41:47 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS2PR03MB10194.eurprd03.prod.outlook.com (2603:10a6:20b:5fc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 11:41:43 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.8943.025; Tue, 22 Jul 2025
 11:41:43 +0000
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
X-Inumbo-ID: d9642393-66f0-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=srMseTY9wPYSN2xAPV3USh3y9aqIz4bS0fQnb9+H7U77043K/J0nN37HE7hfAy8sU+FNZXTZwS5xDEDKhCaee5KQblnqQtmQcpuWi0ixkPRv7F61MDeXCmd+KTNY24fYCZwhJLg0ETkROjTyMoOI1iCNaXgPGJl0ooKUjiLUC/T2EEgDjZuvC0ZTDmmbV3SjswSSqbdY+DU+rhVJTjBfCbUj9mO5Cf9a4UVXfdvhj69rLrCVMdCdkHjIPhCScznd8+Pt9pD7OhZ8U3oVEV0nfrVMgY2KTFXCz4Qb6sXQZNkRLIvrUniHy3mxOodIVixE3yG4ifBGZLvPOoVBoh3VDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s78A2BGWOWtn2IanctdhKkqcCNJK9PnZSUd/GG10AOg=;
 b=Y+UOGyrASIzHDqC8VzzZ4ZeQZ5Qcduil3bggP8YoEfvQePnJBFwH4s7fmpK5qdroF2YrY6OdEeIC3ixDH2WmpMy9Eih/HxyjGtnaSXOJ65F4vr596sZmbxEpduFNhKd05ZOOF+IrR81Le9wA6SusJzpqy+g67j15AJq2ziz81Lnftw7Xoav6E+VtqAaLVZMzMXGuefmK1nmuc80ezXnSVOSNDfzUpd/GnkHihwB4kgjg9JDgTqntw00dKWGagp75xMvu5X5YKvTX+AQKziaXhCfEMbFJXaVX0eW6qKlZWyVtFm0j4AuNGpccaCKB29zFDaYPUIU83HyxmwsPqO61ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s78A2BGWOWtn2IanctdhKkqcCNJK9PnZSUd/GG10AOg=;
 b=JpmFLpotfau0PXy6S5QTDMtGzgxBXpI6Vo61z9PunE63iHA9ipb2dbf9Njm7G6ic8/JfNwjYgatf35VFiCvVWe0Uo8PENgJ3j8BW1Mn/u+qfP+xd2m8kR2bvjjGpfm3YN4TdGFoE0JeCBGDogMs6hmb8gv+UMdQ0aFDE8uSWfENpRmkaoRyCsYVAlU2iXJmoi36BVv+plz4zuYu8VH6fuOWEWIev8bmV6NXGkTSJFhFy9rM1mTqSui8UNteFd3EBTJnv5V0N5uFGUg1tZBwIvjxG3zC+Vg9BHPz5RK6HNef6CN7F4hJJkksXby8lxuPFTExOu+S7yArgiAPqnoSVgA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [RFC PATCH v5 08/10] lib/arm: Add I/O memory copy helpers
Thread-Topic: [RFC PATCH v5 08/10] lib/arm: Add I/O memory copy helpers
Thread-Index: AQHb+v2X+ZrZt2L7gUmcdC6X7zP5Og==
Date: Tue, 22 Jul 2025 11:41:41 +0000
Message-ID:
 <6df9b5bbeae12a74397d72d53c530313f0778025.1753184487.git.oleksii_moisieiev@epam.com>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1753184487.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS2PR03MB10194:EE_
x-ms-office365-filtering-correlation-id: f4e89cc0-5d3e-4d53-6d06-08ddc914bb0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?zQvd3liY6+NN39LFEYgaUGjsou0ZYAd0Udz/C+ejfJdo8X/TPa1/vmcwHB?=
 =?iso-8859-1?Q?y6h+Lo7AAfi6s0oBM23ZQ4vpNqyIZuaWflUhLcO97t0vC8NEDwzXD/a2fc?=
 =?iso-8859-1?Q?+s6BtswSgUT18Co9Ldr4cuxVzfuuETW2VpUwPJC1J7+MG8NJHMBU3tgQqD?=
 =?iso-8859-1?Q?NHdd+IWGe/RWB4XEgNorJ0Jv9WPM7PiAC/ntXN3QIThCp7Mm7l6Kr6Tt96?=
 =?iso-8859-1?Q?Zp6B9mJaRFcjcvSBgnxFSsUmacakqrikKxMaCzpToxdwQsMZIseut7TJm7?=
 =?iso-8859-1?Q?TaW+lRNG1r0IknWDknp5JjIKsUgduQKLweFtkH2xtgyRVcj3KuMOhDi1Ej?=
 =?iso-8859-1?Q?39x+FncPKQ48yUTlzk6XU9Q9FtMwj47EVTr/7/5K2nV5NU6+nDokp5FB55?=
 =?iso-8859-1?Q?A38YqeRo+8w44EhLSrZa1q/dsfuwP/QUeVUapqu4E5YvZGzp4b3TCBuq5P?=
 =?iso-8859-1?Q?2bNkhvWn6XIIacCCPvdjZ8OrYDmCecZapS5eZyd0uByEMqwwHGh5rZjzq3?=
 =?iso-8859-1?Q?XaFAxLl0Aa/gKr80ADB9sO0Lqcs8U/Lspkgj6DV4x/4MLNe9jOUO8yrKyy?=
 =?iso-8859-1?Q?yw+RDOwPYyyCoQteIgbIpttGvSrpUAgFup+AYkkq1Ki/LxjRp0I1neRSNI?=
 =?iso-8859-1?Q?ViIcnnBu10pJAXTa2gupVVnQh3ksojMhbkpNzi3D7RNn/RsjEYSf5Eqxb7?=
 =?iso-8859-1?Q?zmPpj/zuksQD9LjviVMKjt3b5lzxY71K4SXjwN5I1iQXq6dNzs3VkShCXt?=
 =?iso-8859-1?Q?DsTJmlcRjeOGxgmGviT58q2let8MvtqGvFXgZMpBkdutwENyZ9A1LOIQaX?=
 =?iso-8859-1?Q?DrLqVMlbEHGTHWKV3EdlG1vUUuhbbEFRxByyRAKFzfxCBCZD1Abze78QU0?=
 =?iso-8859-1?Q?HKOvvb5QbZLZS6PjkeSMb9t0ao+lXn99Zlr2uFNRQphOmt1QUzcg/hJtyT?=
 =?iso-8859-1?Q?c31+4Vp7D3QCTYPhQ/ibdzuuWYx8lM8cfbDQONi6HoKbDFa5KZqAKO77VV?=
 =?iso-8859-1?Q?EDdN1eZkURxdU9cvw5izkod9AkjY2dozbTWsOkQwXv4eBxm4fRMGSA7Dgk?=
 =?iso-8859-1?Q?Gim8GTsnA6cHVLcNtVd/18zGy7SxzN8fNcDmde4XNk1srOLHBtJIjb9vKn?=
 =?iso-8859-1?Q?NpgCt3r5I5nlttm2t0W3xNHXrQDkOHt/yjXnxue17lZQVrzcmAddOY7mC/?=
 =?iso-8859-1?Q?AfudKCVhM2E+eED6QiZlXfBFE/5HkKQ0R07xtkcAT7gD0I8F/DLOSYQ3I9?=
 =?iso-8859-1?Q?clDLh5wniAND8J/lpgr5QboO4J4kDSevpSGfUn64R/enbyn3p7aQxXMyFO?=
 =?iso-8859-1?Q?MktcOFhN94r5IE1Wo81eqeXOlpHE0xjZkL5uTb+yyy8r9vjkMQunBEdxy8?=
 =?iso-8859-1?Q?WUTxxZ8H6FZat5vcF9hCERFaY2j5VcXyOzn4XsqykoNIgdnl9BmeNG0kGF?=
 =?iso-8859-1?Q?MIhFcpcXPCUygalyHH0CveOdQh0HH3HKqBJPitOoIRwwX3WsNJw6Cs/6MK?=
 =?iso-8859-1?Q?okFpETH8ujGUix7aHzT4kTR+njQSsznTizXoKE5qnY/A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?h+C4AxIzltK9Z1Jq9m4/wCCImRuUfFX75gqDw6lbw5m6u91Rrfw0bxdv0a?=
 =?iso-8859-1?Q?0X4l1us35/QHEArFHCO4KL5zJAJbnKbPApL0bghRWXTunvgrh1sH+b5fNt?=
 =?iso-8859-1?Q?bRhLVfHayakwWOC1eKp94j9IOUZlVBiabJphlrxpedHBr/NaJPLHzAP+Zn?=
 =?iso-8859-1?Q?bNHY3GAsD0MQnMFOfhlofbPExgvOdw0iscrqKvZTIRUS8FCsNrVvqdXVdK?=
 =?iso-8859-1?Q?Dkd80pd8/FjAYXIMVpK/tl/FrB3RccTeRjTExXZFYi9dDCB5bIfgvvrhDk?=
 =?iso-8859-1?Q?Hq8TTz2dO/iFA3MO8l2ZRUqcCqySgGQko6lNN3rDjnXA1tmMAxF3LObM74?=
 =?iso-8859-1?Q?76D7ql2pg9L3sY0cYcTeexm80n6m0gAKJAO32S1cRuDNmDZD4Gqm/LXb0A?=
 =?iso-8859-1?Q?kcZDPe9xnBqGAviefPZwF2yQuskClOEZLpKqsjqHpBT/7wm47Ski+pCtIt?=
 =?iso-8859-1?Q?Quib/GdQt60eVHmGYfneh8DnzNxRCzgNV+AVt+MovRPSmkgy+kexTnVkLu?=
 =?iso-8859-1?Q?Wh4Owf2VOf0Wlq3jhFd+2WD9cJTZDpSzGJPNfOD61DOCFfx7vSMR+QGODL?=
 =?iso-8859-1?Q?9CIbf81mYBK6ctENjDtCDCrKIjXSiCFD57r9/6jWXX8nesx/l9FF2kdJu3?=
 =?iso-8859-1?Q?P8/DNAgghGgFtBsaELt46/OfgwCEWsUDWqu1FSalvpElkwadEHAJunTnGJ?=
 =?iso-8859-1?Q?eFLP1U/j+eR6RQnZO0yNh0shU9+Dx6hvZHU45yS40LageZcsq95kScN+3x?=
 =?iso-8859-1?Q?sZt69FiT1jSnHGx1hhTZb7822fE1LNLqCLsaoRfeaXLhuuQ5ubn4Wx7+QU?=
 =?iso-8859-1?Q?Pp4UVoESU/1inXxom280w7/K9V83yDSCV6Dq+8lbWKcPJxqZ0RI36q4pFP?=
 =?iso-8859-1?Q?oxwNO6vu/5jYoETxPZGOe/Lw/pVwNj9taMXfJkzlzyoIS3+vXlMoOO75AL?=
 =?iso-8859-1?Q?aqbVnSa4s8hbhuDMpuHukw/FO8eIFFOTJo/4ohns6pKXUUtQMNIMaLn5XH?=
 =?iso-8859-1?Q?Mo1ilCpG9dlmNZb6N/QDyiAyYyCSPVPo7Y5CBKAwjJbFX3AyVZx9W10y5l?=
 =?iso-8859-1?Q?e8vIF6+IWDbsCTPPM95uGUqS7A83fcXn0Kye0c06GKDkodYo0hcMz+YBMw?=
 =?iso-8859-1?Q?H+CAaX5UuDji/4NdCEQVWePNACfrmU0NaVMHa8e/DjktZaI7rQgRzJEHB/?=
 =?iso-8859-1?Q?Q4sCmA4ksjg/RH6B/4fmCD4XXuZzFCRBwrLzO77JsZ1BjlyPfcrMxnEQQN?=
 =?iso-8859-1?Q?BT35/5PF3hBljn270tx0gZZELN/gZRj6mYwpMRqoZGeDRhcx9lZyeJXY3h?=
 =?iso-8859-1?Q?ZnWfJcvbx7IwYPwVDXFEF4hlxX4kB83NP5ZiUdZJv7xPhEDSBAdtNUMCsl?=
 =?iso-8859-1?Q?JDZ5IEuqpz3vW9QnCXCYYFjuQ/iwBtaTgDTuuHup7MQsB0zShYf+h56u7G?=
 =?iso-8859-1?Q?0faHGqhViX00Z73WTEZoqUlZ0b1lRbPWbfjd+pjprkreshRHPDZw9UXMH8?=
 =?iso-8859-1?Q?aWfDBp83KbB9CMyMfqsv3WQfZUMcfWlwuGBp1X0VcDpbYSokicB6+pd5Wa?=
 =?iso-8859-1?Q?OZpHUlc+ESuMP9MKRNVXPeklzjaDGO0Gj5tcHpz+lcrHKNzmTKsT7DK53X?=
 =?iso-8859-1?Q?CkikWp5JtPzhVq/SG14guTtvy0Kn0TwSm6LLE8D85Sgp7oHwkYL0zUfQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e89cc0-5d3e-4d53-6d06-08ddc914bb0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 11:41:41.1690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yWdqX6V4Wkd975yELDDFwOPSH4+uBJt68S0ZV969hl+zsvzJ6vopBLKrSM1Z0ucBjfUDn3bN9odCRLXjIrsqri7G70F2x8JlnMx8YiDQn7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10194

This commit introduces two helper functions, `__memcpy_fromio` and
`__memcpy_toio`, to provide a robust mechanism for copying data between
standard memory and memory-mapped I/O (MMIO) space for the ARM
architecture.

These functions are designed to handle memory transfers safely,
accounting for potential address alignment issues to ensure correctness
and improve performance where possible. The implementation is specific
to ARM and uses relaxed I/O accessors.

__memcpy_fromio:
Copies a block of data from an I/O memory source to a destination in
standard ("real") memory. The implementation first handles any unaligned
bytes at the beginning of the source buffer individually using byte-wise
reads. It then copies the bulk of the data using 32-bit reads for
efficiency, and finally processes any remaining bytes at the end of the
buffer.

__memcpy_toio:
Copies a block of data from standard memory to a destination in I/O
memory space. It follows a similar strategy, handling any initial
unaligned portion of the destination buffer byte-by-byte before using
more efficient 32-bit writes for the main, aligned part of the transfer.
Any trailing bytes are also handled individually.
xen/include/xen/lib/arm/io.h

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v5:
- move memcpy_toio/fromio to the generic place

 xen/include/xen/lib/arm/io.h | 15 +++++++
 xen/lib/Makefile             |  1 +
 xen/lib/arm/Makefile         |  1 +
 xen/lib/arm/io.c             | 80 ++++++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+)
 create mode 100644 xen/include/xen/lib/arm/io.h
 create mode 100644 xen/lib/arm/Makefile
 create mode 100644 xen/lib/arm/io.c

diff --git a/xen/include/xen/lib/arm/io.h b/xen/include/xen/lib/arm/io.h
new file mode 100644
index 0000000000..86973660ba
--- /dev/null
+++ b/xen/include/xen/lib/arm/io.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _XEN_LIB_ARM_IO_H
+#define _XEN_LIB_ARM_IO_H
+
+#include <xen/types.h>
+
+/*
+ * Prototypes for I/O memory access functions.
+ */
+extern void __memcpy_fromio(void *to, const volatile void __iomem *from,
+                     size_t count);
+extern void __memcpy_toio(volatile void __iomem *to, const void *from,
+                   size_t count);
+
+#endif /* _XEN_LIB_ARM_IO_H */
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 5ccb1e5241..efa8157a72 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_X86) +=3D x86/
+obj-$(CONFIG_ARM) +=3D arm/
=20
 lib-y +=3D bsearch.o
 lib-y +=3D ctors.o
diff --git a/xen/lib/arm/Makefile b/xen/lib/arm/Makefile
new file mode 100644
index 0000000000..87250b3822
--- /dev/null
+++ b/xen/lib/arm/Makefile
@@ -0,0 +1 @@
+obj-y +=3D io.o
\ No newline at end of file
diff --git a/xen/lib/arm/io.c b/xen/lib/arm/io.c
new file mode 100644
index 0000000000..d267bd28e4
--- /dev/null
+++ b/xen/lib/arm/io.c
@@ -0,0 +1,80 @@
+#include <asm/io.h>
+#include <xen/lib/arm/io.h>
+
+/*
+ * memcpy_fromio - Copy data from IO memory space to "real" memory space.
+ * @to: Where to copy to
+ * @from: Where to copy from
+ * @count: The size of the area.
+ */
+void __memcpy_fromio(void *to, const volatile void __iomem *from,
+                     size_t count)
+{
+    while ( count && !IS_ALIGNED((unsigned long)from, 4) )
+    {
+        *(u8 *)to =3D readb_relaxed(from);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        *(u32 *)to =3D readl_relaxed(from);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while ( count )
+    {
+        *(u8 *)to =3D readb_relaxed(from);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+/*
+ * memcpy_toio - Copy data from "real" memory space to IO memory space.
+ * @to: Where to copy to
+ * @from: Where to copy from
+ * @count: The size of the area.
+ */
+void __memcpy_toio(volatile void __iomem *to, const void *from,
+                   size_t count)
+{
+    while ( count && !IS_ALIGNED((unsigned long)to, 4) )
+    {
+        writeb_relaxed(*(u8 *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        writel_relaxed(*(u32 *)from, to);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while ( count )
+    {
+        writeb_relaxed(*(u8 *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 8
+ * tab-width: 8
+ * indent-tabs-mode: t
+ * End:
+ */
--=20
2.34.1

