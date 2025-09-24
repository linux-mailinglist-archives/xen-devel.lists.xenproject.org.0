Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B71B98B73
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 09:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129030.1469156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1KPQ-0007pv-7Q; Wed, 24 Sep 2025 07:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129030.1469156; Wed, 24 Sep 2025 07:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1KPQ-0007o4-3e; Wed, 24 Sep 2025 07:59:28 +0000
Received: by outflank-mailman (input) for mailman id 1129030;
 Wed, 24 Sep 2025 07:59:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4Db=4D=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v1KPP-0007no-37
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 07:59:27 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63adaf53-991c-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 09:59:26 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU5PR03MB10523.eurprd03.prod.outlook.com
 (2603:10a6:10:525::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 07:59:23 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 07:59:22 +0000
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
X-Inumbo-ID: 63adaf53-991c-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyJeX7+teZ7HFarLCW6oH2S6uMpNjW7A+mYVnCUd9f6Ngz4yOGuA2k6YTBmTG7X83dfahf5z2a9V+Qj+wsMhXLLB0wNAJKQQqeNVmTAqOJCDlA/8GT3glvrNgrCYJw31SlEAg54oq3/38rOZUgOx26EsiWmGJ+QlcpP5DiKSmf4/YAsDjzVpOH2AXK8csvbn4x8HVb2QPoWKz1qaLtY13JBwotmBMHPeHwKCWTUK5F4rI50jr3p/cXM0RR1pFI571QFPo6Y/D2CD5h7WfOrk5h6BHWJNw0HgzYcGM9yqG44IEVp/UxsMI6xIqnt6251FILjUVhJl2SFmhhlBWWtw5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWE34pPSdrkRg9iSVEGUFEHrO/WwevjtA4xzWvp4GgM=;
 b=cYStA/AqAVSlUO9mmPrtjaak2jx/LvYA6pPHb229Nhzkcp1dvzQX46e71oaWFUnoWCm/0nKHybW5lOHVVgESLfadvnvY+toVgqLuyfXxnwAavWAe+5ScGVxQUpSOqlRO6wy2ke1l3gYTjwx8rVcif9c28ZTSXWg2M1FmqoOzYhbc3+l2UyOw6Czz0JScsOlFHwVopQLLe5hkh+JsyBUoxdEQQFz2oclIhIYiVmeWckVXksfMVxJkoJwcu6F4tbYQmGHc8lt0dVDb4mMJ16XPZvOlhhfCzSG7yfK5b3XV+5OXhoPNI3ZC13XaeAEG1X25TGQDjcTPbxIFuJ2tcwZO/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWE34pPSdrkRg9iSVEGUFEHrO/WwevjtA4xzWvp4GgM=;
 b=ty/JYW5JsduU6Me+5dDlSC735olXR+WJEDoBj4YYHOtxljW0Q7nu/J7tgcAcya2mHOQ+Xa1HOiwecUTVY1LRFHOYCLC0X4hSoYHjUsXV93rKR7iyC2DKinoar6sSJQ0BYpY2FXSNmd7xI9bfbuXu9V1wImzp0ukEFHpvCdaVnoBMY/zvPEpx0P9HzmcWBKUPgdBtBy+F+55IDqNlCU0O8FtTtMfUseH4CQGI/oByQh5E8J6LlssDOdr7QJrS7VHub5Ajofu1/zoizL08pkztGfpWgDA/VqTkBAHMPr8IYNRhsgjJVsxUd5oxMEzQvF/cCXgpbCKXcGWXRmRwmdt94A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v1 5/8] xen/pci: introduce has_vpci_bridge
Thread-Topic: [PATCH v1 5/8] xen/pci: introduce has_vpci_bridge
Thread-Index: AQHcLSkjUCcQVsMHP0qfA2BNpZwKyQ==
Date: Wed, 24 Sep 2025 07:59:22 +0000
Message-ID:
 <acb8da959fac97fbec7bc086b921e31dd52d44f6.1758618839.git.mykyta_poturai@epam.com>
References: <cover.1758618839.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1758618839.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU5PR03MB10523:EE_
x-ms-office365-filtering-correlation-id: fc83916b-2a3a-4316-5baa-08ddfb404607
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4ptxk+qtGLyV3JFrCFgetBZKaWyN8ZG2oNfAqM3rM0oOO4ew7sk2BDMBnz?=
 =?iso-8859-1?Q?eYjC/iuD2h9QXLFt73RSNc6f8PfQ2aJHrMpmiVVk+/4p+jI1DzLXGltIbC?=
 =?iso-8859-1?Q?mkiDEdh+GzrU72Vs/hVzXRrNylXIhr5BXLqJLQJU5rxcYjAhkOKRayczmM?=
 =?iso-8859-1?Q?uOnzMyWWqpkGOD+81Z99/2KN2ioZ/RDKdHcs7n6RuXAYjr+bQnPLI6M1jE?=
 =?iso-8859-1?Q?Jw3mA8X2L7+fOM2A8HCRHAqQo2UJNlF3Ps1pcYxurRZQlrEHg7oae6zvr9?=
 =?iso-8859-1?Q?wsSREsJqpItMv43NDh7Bd8P6eGlW+dcf/Tb1QLN7hRn9t2DWoiyQuGydj2?=
 =?iso-8859-1?Q?pUISjgQcKekFxm2F1XxE8td86oeddNNfDKpBdmuuCWRg7uu/ofqKvm6OFj?=
 =?iso-8859-1?Q?GDPFTav9TrGZ5MefYkoZRm9WSlTfGRp+cBJhUzmv9f5NpNQpuelpcfHJr7?=
 =?iso-8859-1?Q?2dRhdm67b0qpn6yUV+qv3BJFvek8k5bgmdv2X4GwQtDgvmN7f4bQZhMh5h?=
 =?iso-8859-1?Q?A4olCAN0iZJfT661D4CeyTMX+5qNDk5m2speJ9dF1dWIW3vDwr+XJcAdpX?=
 =?iso-8859-1?Q?H3Kju6Dm9AP+ZKOBcyvzszFuNSaiR6qz25oJEiv04mnD3o3FY9GgImcl9L?=
 =?iso-8859-1?Q?R15ts08wYHZYZ33+tqohlVNyXcfTl7C6YtQLKAiFEW6Mr9T+RrzSI14IBl?=
 =?iso-8859-1?Q?cVNgw+BBhqygo5XcyW6jalCZXrhYsee0mnPcc5Bi+1L/13Q8kKzQCuvhal?=
 =?iso-8859-1?Q?tn5PAor2Z/w4OySAjb+CL41m1oK7JkcFl7+5RyKwi8/yD/xc2eDkWi34j7?=
 =?iso-8859-1?Q?c3Khkwj9u388on06T0fnIpKpEl4m3rxCEaEth9LUmyct2u3Q4h5wk1Ksd4?=
 =?iso-8859-1?Q?a9cG3AfreA6m69T79DMz8o5FVZ3T4Ne3XEKkFG0/PRyUU8nuqdXtgy3H4B?=
 =?iso-8859-1?Q?5NydmpkJK5jv2OLfMWbyiHRgTscFYCinSU4e6GlEmBuDYSWEiTapn3hrB0?=
 =?iso-8859-1?Q?rdJqAzAMCoE+XEWxT1bKn0uCAfuIdWdnC7+pJpOTLgddnTk0ccYzr6QJb9?=
 =?iso-8859-1?Q?jXOyDVaYCPd+d9CYBVS90z7dJCOk0uJNblQQR/QCe4bXW4ivFLX2m3zyTu?=
 =?iso-8859-1?Q?7e5ntGMRPX/V9uxg8Y2KP6BOwjlecPRQVz4Ieh8kd4+ULzP+ZaJrtTxhFM?=
 =?iso-8859-1?Q?0Ww33nkMRWCpZuxkWza107eCpnWFhvAnV0puOLRyB4pRcxZRQqegAk+mQC?=
 =?iso-8859-1?Q?8rkn3DRzKGGru0Rfr5FFlG/vkaMHRGwsPuKlSMHEtTM4gyM9NGzlc6j8Sr?=
 =?iso-8859-1?Q?m54rmqIKoZeFIXWBwqq4stN4xZr+YHiAUf2+ficUNygZ1CAneN+ofzfoq3?=
 =?iso-8859-1?Q?BGlGwzDgFDfYCxzGjbCtIHKPUrv5KL8H9TcuOLFhiwjEPTZMeIOClaBuCk?=
 =?iso-8859-1?Q?DzG+wFrJNWmzRnaDhhy1kxcxy3+7VFJgFoD+I9zt9rpYEWFw/7KdGAWekc?=
 =?iso-8859-1?Q?yaBEb9Z5N/Trr8XylSsAzLRyrTviPmKizU30/jr/ys9K6zY2W9JXiOFNTx?=
 =?iso-8859-1?Q?uMGLowY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?C9C/A/yHwVYlaliFW7o4TkJETi4RRoAUYpfnpLvpvvjCY6US/ce249H/XI?=
 =?iso-8859-1?Q?Up3SDbcWI2H4FA4z7dcH764TBFnTcLReq16sIPABiPA4V1IIEu1YnhfMsm?=
 =?iso-8859-1?Q?ftDeQDXzW5y6WdIlw7Wutth8OQjHVspMmV6eNfSABMdIFrVgehJFqVjEyL?=
 =?iso-8859-1?Q?lxVcKVQOR/GVM3OE5BVGyAOlCEcGO0BdF21WWDJ7Ge+7/QVXUxM9d0PEB7?=
 =?iso-8859-1?Q?s7Xtj+zG6A+mCnTu5FkpyfBnUvAkzXn1ebst3bESent3jmA2Fp9rMcIwNw?=
 =?iso-8859-1?Q?MANdLAwU7YAHA+3TY4uybBEusr90EsCsSb3sWQugslZaQ6vb0Hd4/kfUPc?=
 =?iso-8859-1?Q?xK/7RpiTeYqP1qV7OOzmTSttcKt9F0IAybqdIWPP1uT9+M2r//YhnKHj4x?=
 =?iso-8859-1?Q?WoABjpgpq9lIj5NyUvJvDV3hB6L/veM9w7m5VzW7hrbDQ1FBBxnMWw5Zr7?=
 =?iso-8859-1?Q?DlatwkpRbQKqxGdXTMmGPn3oSyrhlPgmh673jzoQoZLASB0Ge4OW0v/2R7?=
 =?iso-8859-1?Q?uD5MaAdQkchP76rv8IVrBrHMGNTvt3Csxg2WKLBdQ9/U6pSikI8poQ/BNF?=
 =?iso-8859-1?Q?QmZ9XRFSu30sRpH13SlKq/J4LYcm5Jwb7RpGejtvJuhWBOyxQX8x77Ymkq?=
 =?iso-8859-1?Q?YRiqM4P2P9Gf07SxkAM/xBViUOL26rB5MpDLUPZP57RWbdMa+EF81Z1sDi?=
 =?iso-8859-1?Q?y1TPP34E5EDz2b5kvHpS10jMn4XxJHOu/xgUbt6jsSn0INtQyiExsAVvKn?=
 =?iso-8859-1?Q?k4Y3aGI2AerlmJCFgQ0FLvHgOfHkOANezrtE1d6YGOYw53fhtvrWKwpKkK?=
 =?iso-8859-1?Q?ro4vPKqbkgLf0x75qTcg7nJP6+6EBglFr3/HrSjpdKH2kkJJy2j2RrWJ59?=
 =?iso-8859-1?Q?Rdf8l5a8oI26fl0pKN6ISqMHm+VZuGZzbOLm2GoaO5FTUjuzbpkFrqECBi?=
 =?iso-8859-1?Q?o9LohJ8K5VWCun7a2QVVDEFlGhaZOY2aqPurDNv3gDMH6wNAwHltpgFA/1?=
 =?iso-8859-1?Q?UxPGF55hYHC/yvMIjhxYI1EAoND/WnsYm1HWhw7MmOGoEolwSXqF/KzEiP?=
 =?iso-8859-1?Q?SL9a5n378tjgx4yM54s/ZRghDaKLgX1k5IanUc0YGbp6iramhyKOsnk2w1?=
 =?iso-8859-1?Q?ciS2WBEtUtdTpnxCjdKvGqTzR8X7aWIOhT3AqbsJifHetVSxR8XjPl9Hqj?=
 =?iso-8859-1?Q?8u/ESn9XRkiyE3TYZ73sIXhfnQHzXmcJOJAQODlJqDFyZFyxVZe0Axoma4?=
 =?iso-8859-1?Q?krh8Q4eoNE15vhQI0O1oJ0YUOxDFMXk4v8AA0Q1PcxwhdJ/B2m+or0XUir?=
 =?iso-8859-1?Q?2OmkUq9sPO4i0p+s7ZUQfwOctaDESeppKWPIonJMAmiz1hlYmQb1YWFMz4?=
 =?iso-8859-1?Q?BULBy0wH8ZsE5zkFd1ylsBH4BzGC/Esu4xiyP9QbcARgnvcOWL7ljlPEw9?=
 =?iso-8859-1?Q?yDLvHoL2W/aMC2h0/qDuwJ3ePZ3j0U7u+yHKutNWKDVJQEW9r8DnIex8X8?=
 =?iso-8859-1?Q?EuqL3aYpETFn7XQ7DZ1OnbNGo6VflrMOTUeBhwolXEI+hEmKSnzXAf7gPi?=
 =?iso-8859-1?Q?j1UiMaslWyXM6DxiTHTJsNIBIa27NS5jLZv1/kDcVSdcxedBRtZtQxlrcz?=
 =?iso-8859-1?Q?jn4yw+orvK8VMU6rTbfASEStfFcBQrky/2T7ZUTQU4EOo1T9w7NPmYJA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc83916b-2a3a-4316-5baa-08ddfb404607
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 07:59:22.7380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AU20rAM3gDiGsnL/z74o7dr7IYOm3J5/7ioOiXa2ZEzJEm/20OQ7kDSliE+DEMr9VJUnVQr5lW4MPJObQAqjsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10523

From: Stefano Stabellini <stefano.stabellini@amd.com>

has_vpci_bridge is a macro to check if the domain is a domU or is dom0
with vPCI (pci-scan=3Dyes) enabled.

Use the macro in drivers/vpci.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/drivers/vpci/header.c | 14 +++++++-------
 xen/drivers/vpci/vpci.c   |  4 ++--
 xen/include/xen/vpci.h    |  9 +++++++++
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 469f497744..903168ff96 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -230,7 +230,7 @@ bool vpci_process_pending(struct vcpu *v)
=20
             read_unlock(&v->domain->pci_lock);
=20
-            if ( !is_hardware_domain(v->domain) )
+            if ( has_vpci_bridge(v->domain) )
                 domain_crash(v->domain);
=20
             return false;
@@ -492,7 +492,7 @@ static int modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
             }
         }
=20
-        if ( !is_hardware_domain(d) )
+        if ( has_vpci_bridge(d) )
             break;
=20
         d =3D dom_xen;
@@ -522,7 +522,7 @@ static void cf_check cmd_write(
 {
     struct vpci_header *header =3D data;
=20
-    if ( !is_hardware_domain(pdev->domain) )
+    if ( has_vpci_bridge(pdev->domain) )
     {
         const struct vpci *vpci =3D pdev->vpci;
=20
@@ -564,7 +564,7 @@ static void cf_check bar_write(
     struct vpci_bar *bar =3D data;
     bool hi =3D false;
=20
-    ASSERT(is_hardware_domain(pdev->domain));
+    ASSERT(!has_vpci_bridge(pdev->domain));
=20
     if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
     {
@@ -747,7 +747,7 @@ static int vpci_init_capability_list(struct pci_dev *pd=
ev)
 {
     int rc;
     bool mask_cap_list =3D false;
-    bool is_hwdom =3D is_hardware_domain(pdev->domain);
+    bool is_hwdom =3D !has_vpci_bridge(pdev->domain);
=20
     if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
     {
@@ -829,7 +829,7 @@ static int vpci_init_ext_capability_list(const struct p=
ci_dev *pdev)
 {
     unsigned int pos =3D PCI_CFG_SPACE_SIZE;
=20
-    if ( !is_hardware_domain(pdev->domain) )
+    if ( has_vpci_bridge(pdev->domain) )
         /* Extended capabilities read as zero, write ignore for DomU */
         return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
                                  pos, 4, (void *)0);
@@ -866,7 +866,7 @@ int vpci_init_header(struct pci_dev *pdev)
     struct vpci_header *header =3D &pdev->vpci->header;
     struct vpci_bar *bars =3D header->bars;
     int rc;
-    bool is_hwdom =3D is_hardware_domain(pdev->domain);
+    bool is_hwdom =3D !has_vpci_bridge(pdev->domain);
=20
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
=20
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 07c7071d0a..8ea89b9805 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -48,7 +48,7 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
=20
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
=20
-    if ( is_hardware_domain(d) )
+    if ( !has_vpci_bridge(d) )
         return 0;
=20
     /*
@@ -429,7 +429,7 @@ static const struct pci_dev *translate_virtual_device(c=
onst struct domain *d,
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
     const struct pci_dev *pdev;
=20
-    ASSERT(!is_hardware_domain(d));
+    ASSERT(has_vpci_bridge(d));
     ASSERT(rw_is_locked(&d->pci_lock));
=20
     for_each_pdev ( d, pdev )
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 9ae75d946a..e0aecfac72 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -339,6 +339,15 @@ static inline int __must_check vpci_reset_device(struc=
t pci_dev *pdev)
     return vpci_assign_device(pdev);
 }
=20
+#ifdef CONFIG_ARM
+#include <asm/pci.h>
+
+#define has_vpci_bridge(d) (!is_hardware_domain(d) || \
+                           (is_hardware_domain(d) && pci_scan_enabled))
+#else
+#define has_vpci_bridge(d) (!is_hardware_domain(d))
+#endif
+
 #endif
=20
 /*
--=20
2.34.1

