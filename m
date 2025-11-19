Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AF4C70CF5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 20:30:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166356.1492928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnsg-00033Q-VH; Wed, 19 Nov 2025 19:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166356.1492928; Wed, 19 Nov 2025 19:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnsg-00031P-R4; Wed, 19 Nov 2025 19:30:18 +0000
Received: by outflank-mailman (input) for mailman id 1166356;
 Wed, 19 Nov 2025 19:30:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GacY=53=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vLnsf-0002Z9-Pj
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 19:30:17 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cd7d038-c57e-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 20:30:15 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DB9PR03MB7690.eurprd03.prod.outlook.com (2603:10a6:10:2c6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 19:30:10 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 19:30:10 +0000
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
X-Inumbo-ID: 2cd7d038-c57e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYUxg4MI9zZ52azaxNb13uB0AUT+WAkML/IpIYPmI+1Ujz8yiq+l1l/i4Ct1t/hLJ2w5RSgOYrx2QcjK6qa8CH+7wvcSYSe/6dnHHFtAuLIqgYdQQC/o5k0Ud07SpDu07cZQqMjLc9CZBnaj9SxlzBnBgVhE1UUMcOJRuPmGURhx6QzYFh+SVG26rpVai5QyFTIaA1zgmDj1+xbxTm0UXAN3K/sdOaEomGze9cswoSJdXstfsfZgOn+7mwqvMrSVP9PWCiufQAofZu9ru5hxglvN2sfbpujKlPmyOBR1BbC5Fn5cROC8uzAAXwSWg/XJnD03/bny1ELsgLhN5R57BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPglyECsOkN2++4mgHd44d2kLgu2wCiloD7HtlQYTtQ=;
 b=HPSdVrL9vEr/4yHQrHqU0uhvPjtrTb2lpuCDAWZbIN/jiUqJurH/PeNExY2Lrg5usyZobgptoQ+Bhnv4VJ+R3mbt3VOlFwT/Uq4vx7VlzxbmTTaCK/qyYTq9QNgeLQjVH5ZE+PFgQZ7f6WGL7vFqRN3Xzc/QBLMZ69OEaj3ZQlWqqakiSQNmTwGfp5oczpBkguyK0jg5yBj5Av9jjSTrMsL3fau2qZU5qY7H4aPr3UoLXMtyrOK4fkcIVENyCqZ7kDE38+ZZKzVap9wWN17ca9NmQhfJOUgMAssGxFtQQeaQu+VrvSkpDhlEBuT9L6Zk4m+2dfGaCCEBu7+ddVIEPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPglyECsOkN2++4mgHd44d2kLgu2wCiloD7HtlQYTtQ=;
 b=SuYR6DQEkeZ6lK1BciOBH6+zGNTHwqqan8XtQy9LZowgThCvzqsQHIzJ0YaTmizXv1ih2xHKb52cLAfVd0800knjSdymNaLl45QSJTxbcOU8+qvotfbZOu45HiiADYV3Yf1byHyLf2rJPDVwz6zzk1f54JEbmgHqwiGlF5CYUtMX7SKSV6jCf4u14e9EnXFQhplUohyEsY2pACE6GHaAUcnrEK2GkK6JCaSdBl0LshMNVMBMdeY7+u0qapcK7QrWew/am3eVgkHlTHPbUcJDgFat00zcxQ4dabJW+8eNWu+FisGK7liO+6QF5c64amjTlepPZVd3yp9tnfjWlBiurA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>, =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Subject: [XEN][PATCH v2 3/4] x86: hvm: factor out COMPAT code under ifdefs
Thread-Topic: [XEN][PATCH v2 3/4] x86: hvm: factor out COMPAT code under
 ifdefs
Thread-Index: AQHcWYrrmJaqhgTOc0CHcduP//mrNg==
Date: Wed, 19 Nov 2025 19:30:09 +0000
Message-ID: <20251119192916.1009549-4-grygorii_strashko@epam.com>
References: <20251119192916.1009549-1-grygorii_strashko@epam.com>
In-Reply-To: <20251119192916.1009549-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4594:EE_|DB9PR03MB7690:EE_
x-ms-office365-filtering-correlation-id: c2f3ae3b-da64-4d74-ca86-08de27a20e05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?uzmTjlOLXL+DZF0DYUbWBODLf+SPwI+8HbNyR361TXM/5o8zCGF7P1QoXn?=
 =?iso-8859-1?Q?sxeN+Mht8ryrGqQjueAzCQEZF2oqSU+FLUOra9EoXhYn2f+MZbMJbzGweL?=
 =?iso-8859-1?Q?BAgptAHlIVyFUxFcCVof3dmQKhuDUossilc+Iunp7dYN2MUDBswkFxTM1K?=
 =?iso-8859-1?Q?W01GquxvEWce++DwNOKP7ZMfMNSHt6z+1afMzxGiBJA6ZAAp20jJWn/fL0?=
 =?iso-8859-1?Q?7j6vZD9Me9Q5cDiEhmv9CHXaJcufFr/JIYm7djE3ldNsI6guZb5eh8lyXS?=
 =?iso-8859-1?Q?G1zhdcslN36GGyp+BaixNV/eNLVISeJ/bLH/ULMsl30P7HHbb0RxBZsT0T?=
 =?iso-8859-1?Q?C6ibtdlJ2If30CzoSWfDXfvLcQjGdlpfmdHqHU/THkxPhdH/Eq3FuBA0ig?=
 =?iso-8859-1?Q?9A4RGn7z8+cZVfBJ0LUKKhma+ulpAAqOKoiVu+B1N7MdJkIDF7iTjJ0cI4?=
 =?iso-8859-1?Q?FXcJ0th87VCfQxsXHgDPy4b1cUd1tmW/OV3jvp2l6bG9vRWP5wbDYHEteB?=
 =?iso-8859-1?Q?Mo9fWY/e5NtYMB57Zb2d2V7dly9iYYDDhb+MG0c7YCWkxTef9o246y3TM7?=
 =?iso-8859-1?Q?LvSVrjZvs2yBMl0tx7a2QJhHcgQUAs7uMuFvdVw4SzVcTTG8yPaE2W5LBr?=
 =?iso-8859-1?Q?MIDUJKD7N6sCTdm14ca5UN9rNuFovYeRieFsKN2VOjg7HjJMDAwL8urGEM?=
 =?iso-8859-1?Q?mFk9u6bZ5rs54i57/9yPq26Q8RfmgPZL8vBBCNAd5VMw0AxZhQhBmCHNe8?=
 =?iso-8859-1?Q?/rxW8knZLty8A+yL78dD5BzcY5KHwf4J/V6m/M2/GPxrx5ce7p8CqR2cCR?=
 =?iso-8859-1?Q?8eqCW2IskrV9YVjFW30J8RlZ57WxMpM2RLzs4tlP8JaLdlZH4QHFf6GSPx?=
 =?iso-8859-1?Q?uiq0yuo1Gw5XSZms/7+WQGwrWajr4lkAr29VwZytj7m5NAWJExI1ms09+l?=
 =?iso-8859-1?Q?tmIlohRg2jIvgALvso+j5n/BeZ40vUslOhmNZndKGMmGvCSjjOCZW+mmcT?=
 =?iso-8859-1?Q?Yn8KymAHgCuy4wzlRrAvhPa+4Kw6or/KSMCIIr3WNHq0a/C4DwwouTHgbP?=
 =?iso-8859-1?Q?x6uI5MyzmgTMtROD8c12MtbOo3ceeOTlQDAWsW+eWOr1IrK5yo18yHXhE4?=
 =?iso-8859-1?Q?z1GBWIIBbJdINBwTTSzXhR6ngm3fbk5yYXqLBVpVagGL9A7RaCsby1dja9?=
 =?iso-8859-1?Q?LQIKc3qr3zESzE3/k7ATiSjrPgOGxtUtfHeAXWZgh1LYH+jBshaf4YOv/H?=
 =?iso-8859-1?Q?ajDyFq2N9mSzG0wkPvJLV903DY3GGaGJJQhPnHt5NCinUv2DE4ZQIy+GPG?=
 =?iso-8859-1?Q?7ooMbD2WCYL1FE4VTo7UXheeITLFvmbinjF8MzOImSfnBELITHwZZO0gk3?=
 =?iso-8859-1?Q?bESx4bHX/pqe8gpLE2jik1MJTaTvJWXVcfeUZfNmD76PmKl27OAQy1WpYm?=
 =?iso-8859-1?Q?ShputM7cS5ErrPfVYDZNfTIBZrJvnqRDYNWvC/1Ppd2VyILlQYzm7Zxubc?=
 =?iso-8859-1?Q?ZHvpRG/YQMPhroGTEtCd04/AJy6S3QLgwMYy6w0u34TvZAdh5U+CREG1qv?=
 =?iso-8859-1?Q?tcZzDL53+VzsZBDSRltVQUHhXGRe?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?b48+mywrFru8xI9h4QXrDH//6VSOmVarISfUWDalU0rwUx+Z8k0J4rhqEB?=
 =?iso-8859-1?Q?oNmH+HZrNPwLCBdQKm6h4MKT0Stz23dul3PEyq+X4LZIrj5Mu16rBUtooq?=
 =?iso-8859-1?Q?UTuOoG2Vy4UnwJv3pfp5F91+KkW/KcpHpFF8bdCU5E77fRNtCDQjaA8Oa7?=
 =?iso-8859-1?Q?Kw1CJls0NZAj/utrFVKVQd8ZZ4mjdzySm6dv2ntD4pYiVmEczZKfjnsD7C?=
 =?iso-8859-1?Q?QSLTtf4WKfsDD22Ouxhs8SND1VA9SM53JrX+SIbtJzCgz95sZUZQDeEzWO?=
 =?iso-8859-1?Q?D3CGGQttRvQZyFtysqQT8LBQn9p7Na5ndeTCfsTeU9ehvFfJYIKQU1UA54?=
 =?iso-8859-1?Q?aXRA9eK9329YZ5+Bwi+SQOKUQvgbfj3tYXAIxCXrQUWjTCoFUbAqaLJTj0?=
 =?iso-8859-1?Q?0MKfWn09jqkFMH2cu2FAu7XlXBdI69BDIrGJn2ZRk4GeVA4D6xo+O4VsSr?=
 =?iso-8859-1?Q?GAMDDjHL3mBGl3guJFPWWJhkztwnjKjYvTXat1hilV7Ak6bFY61f3aNc2H?=
 =?iso-8859-1?Q?3dtpihy+InYjUADNZs9h4gBgy8Uroz0tX2xWaFPcUtW6wWp/jCPdSPx1Re?=
 =?iso-8859-1?Q?gW0w6gQ9df2d/y9WQcKjc3LSmhYo3OMLPLznBXARTO8bOubMJTH5LhfFm0?=
 =?iso-8859-1?Q?JkL53cBsPBuYyDsWy8wvU9E3cVb6ri6IwulYz6BkrIuj1iTFoQPkvfwwMy?=
 =?iso-8859-1?Q?7QqiIOUpz3ZY8Gdo4TjIB+Yf6hj47oUKBrx5V+EB+OAfiHWbz2h3jT9wXm?=
 =?iso-8859-1?Q?6pF1/Pov1lGdD1iQEKzOt47FZX3/Zy1eYrKJpT0aWEMkZN1c19r6ySvOHM?=
 =?iso-8859-1?Q?eXFhtzLXKN+F1LwC+oEJgzmxg/y8QyzkDNyBW0DjiHp6kglh1zjlQrbFR5?=
 =?iso-8859-1?Q?Nz9wTVUUr5O2X5zn5ItaETOo0oVDCynHzY1qYqzQKtIo7Cm4ASlVCYeIjH?=
 =?iso-8859-1?Q?GI0Frf0PsBUZFFYciIKhoT7p4ME/IrTkN7IwCOqX+BQ1T8CEve7eIE1mQF?=
 =?iso-8859-1?Q?76swx6k5PKk4VOnG+qu0clO7V64S3kbGmbns1kx5XTsZSAKsP20MYGxXgA?=
 =?iso-8859-1?Q?DKVQkXNArF45lO6uX/00vePtYp3lIJZOZE/iaMFTz7PCqcfspTd4PP2mIs?=
 =?iso-8859-1?Q?7kpR1n87RQyG9dWapspv0zv+etkr9tbXAIeHnSHBvFkESBNSD6u53KEDDB?=
 =?iso-8859-1?Q?OV/3GusOhRILAiSZoyE3xTTe7A4SLlX3Y8Q6KvjcRlrq4L1bvRsCUBYBgo?=
 =?iso-8859-1?Q?mvNk0AtEgghKkRH63dcPePOWKdY2CyOSxcfJ+2Bn0zCQqR4dBlUat/mpaF?=
 =?iso-8859-1?Q?ghtQUxNI5YWmsW6moVowd5mS5ADRpkljo2yabRA7vYq3Md8St9rfCr5L3f?=
 =?iso-8859-1?Q?lxLKki49Tzl4jUWIRcs1bBP0kBiq6Ydzp+H+BxVS/V6k5fCyOfpNyFwZus?=
 =?iso-8859-1?Q?OBXiJyzqKSEGpc5wElmgy+644geD3yIJSvQr5EnkUJHh9q6mWeZT0ulB/T?=
 =?iso-8859-1?Q?qzgH9AyG6PAWSC9Ut7KWoAUXUF0LA/qflFdXUzTwJaA8dt52GsBQ0/36yM?=
 =?iso-8859-1?Q?7URXrTNJb4jFgwGRQiaP/M3KMCFbYIaaw9KcvpAssfsJt0bxouFNZAclyB?=
 =?iso-8859-1?Q?/DWxI6RY1uJRRQyJ1Wg7Kd1LELcK65wC5CZGcsVD2rCYBEm09aqI+4Sg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f3ae3b-da64-4d74-ca86-08de27a20e05
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 19:30:09.8001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GUbr4VOgv9e0obk7xtRF+Q9J5w9rQBIaiu9EF8Utw4FtVOhXh9kUYZaFZyUKPhFP6vYUt0vaso823j0hlordu8ctd4rxgZknBXX0bYn1j4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7690

From: Grygorii Strashko <grygorii_strashko@epam.com>

Factor out COMPAT HVM code under ifdefs in preparation for making HVM
COMPAT code optional.

- hypercall-defs.c updated to always provide compat declaration for:
physdev_op, grant_table_op, grant_table_op. This reduces number of COMPAT
ifdefs in HVM code and lets compiler DCE do the job.

- Only 64-bit shinfo is supported with COMPAT=3Dn, so struct
arch_domain->has_32bit_shinfo field is moved under COMPAT ifdef and
has_32bit_shinfo() is updated to account for COMPAT=3Dn.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v2:
- update hypercall-defs.c to always provide compat declaration for:
  physdev_op, grant_table_op, grant_table_op
- move struct arch_domain->has_32bit_shinfo is moved under COMPAT ifdef
- return hvm_hypercall()
- use ASSERT_UNREACHABLE() in hvm_do_multicall_call()
- constify has_32bit_shinfo() for COMPAT=3Dn

 xen/arch/x86/hvm/hvm.c            | 16 ++++++++++++++++
 xen/arch/x86/hvm/hypercall.c      | 13 +++++++++++++
 xen/arch/x86/include/asm/domain.h |  9 +++++++--
 xen/include/hypercall-defs.c      |  9 +++++++--
 4 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 0fd3f95b6e0e..19524cb7a914 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -69,7 +69,9 @@
 #include <public/version.h>
 #include <public/vm_event.h>
=20
+#ifdef CONFIG_COMPAT
 #include <compat/hvm/hvm_op.h>
+#endif
=20
 bool __read_mostly hvm_enabled;
=20
@@ -1255,6 +1257,7 @@ static int cf_check hvm_save_cpu_xsave_states(
     return 0;
 }
=20
+#ifdef CONFIG_COMPAT
 /*
  * Structure layout conformity checks, documenting correctness of the cast=
 in
  * the invocation of validate_xstate() below.
@@ -1267,6 +1270,7 @@ CHECK_FIELD_(struct, xsave_hdr, xcomp_bv);
 CHECK_FIELD_(struct, xsave_hdr, reserved);
 #undef compat_xsave_hdr
 #undef xen_xsave_hdr
+#endif /* CONFIG_COMPAT */
=20
 static int cf_check hvm_load_cpu_xsave_states(
     struct domain *d, hvm_domain_context_t *h)
@@ -3991,8 +3995,14 @@ static void hvm_latch_shinfo_size(struct domain *d)
      */
     if ( current->domain =3D=3D d )
     {
+#ifdef CONFIG_COMPAT
+        /*
+         * Only 64-bit shinfo is supported when COMPAT 32-bit hypercalls
+         * interface is disabled
+         */
         d->arch.has_32bit_shinfo =3D
             hvm_guest_x86_mode(current) !=3D X86_MODE_64BIT;
+#endif
=20
         /*
          * Make sure that the timebase in the shared info structure is cor=
rect.
@@ -4965,6 +4975,7 @@ static int do_altp2m_op(
 #endif /* CONFIG_ALTP2M */
 }
=20
+#ifdef CONFIG_COMPAT
 DEFINE_XEN_GUEST_HANDLE(compat_hvm_altp2m_op_t);
=20
 /*
@@ -4992,10 +5003,12 @@ DEFINE_XEN_GUEST_HANDLE(compat_hvm_altp2m_op_t);
=20
 CHECK_hvm_altp2m_op;
 CHECK_hvm_altp2m_set_mem_access_multi;
+#endif /* CONFIG_COMPAT */
=20
 static int compat_altp2m_op(
     XEN_GUEST_HANDLE_PARAM(void) arg)
 {
+#ifdef CONFIG_COMPAT
     int rc =3D 0;
     struct compat_hvm_altp2m_op a;
     union
@@ -5063,6 +5076,9 @@ static int compat_altp2m_op(
     }
=20
     return rc;
+#else
+    return -EOPNOTSUPP;
+#endif /* CONFIG_COMPAT */
 }
=20
 static int hvmop_get_mem_type(
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 52cae1d15312..1ee0193b69af 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -170,6 +170,7 @@ int hvm_hypercall(struct cpu_user_regs *regs)
         HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu(%x, %x, %x, %x, %x)", eax,
                     regs->ebx, regs->ecx, regs->edx, regs->esi, regs->edi)=
;
=20
+#ifdef CONFIG_COMPAT
         curr->hcall_compat =3D true;
         call_handlers_hvm32(eax, regs->eax, regs->ebx, regs->ecx, regs->ed=
x,
                             regs->esi, regs->edi);
@@ -177,6 +178,9 @@ int hvm_hypercall(struct cpu_user_regs *regs)
=20
         if ( !curr->hcall_preempted && regs->eax !=3D -ENOSYS )
             clobber_regs(regs, eax, hvm, 32);
+#else
+        regs->eax =3D -ENOSYS;
+#endif
     }
=20
     hvmemul_cache_restore(curr, token);
@@ -207,10 +211,19 @@ enum mc_disposition hvm_do_multicall_call(struct mc_s=
tate *state)
     }
     else
     {
+#ifdef CONFIG_COMPAT
         struct compat_multicall_entry *call =3D &state->compat_call;
=20
         call_handlers_hvm32(call->op, call->result, call->args[0], call->a=
rgs[1],
                             call->args[2], call->args[3], call->args[4]);
+#else
+        /*
+         * code should never reach here in case !CONFIG_COMPAT as any
+         * 32-bit hypercall should bail out earlier from hvm_hypercall()
+         * with -EOPNOTSUPP
+         */
+        ASSERT_UNREACHABLE();
+#endif
     }
=20
     return !hvm_get_cpl(curr) ? mc_continue : mc_preempt;
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/d=
omain.h
index 5df8c7825333..0005f4450931 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -12,8 +12,11 @@
 #include <public/vcpu.h>
 #include <public/hvm/hvm_info_table.h>
=20
-#define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
-
+#ifdef CONFIG_COMPAT
+#define has_32bit_shinfo(d) ((d)->arch.has_32bit_shinfo)
+#else
+#define has_32bit_shinfo(d) ((void)(d), false)
+#endif
 /*
  * Set to true if either the global vector-type callback or per-vCPU
  * LAPIC vectors are used. Assume all vCPUs will use
@@ -365,8 +368,10 @@ struct arch_domain
     /* NB. protected by d->event_lock and by irq_desc[irq].lock */
     struct radix_tree_root irq_pirq;
=20
+#ifdef CONFIG_COMPAT
     /* Is shared-info page in 32-bit format? */
     bool has_32bit_shinfo;
+#endif
=20
     /* Is PHYSDEVOP_eoi to automatically unmask the event channel? */
     bool auto_unmask;
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index cef08eeec1b8..08c01153ac56 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -80,6 +80,8 @@ rettype: compat int
 #define PREFIX_compat
 #endif
=20
+#define PREFIX_compat_always compat
+
 #ifdef CONFIG_ARM
 #define PREFIX_dep dep
 #define PREFIX_do_arm do_arm
@@ -104,10 +106,10 @@ defhandle: trap_info_compat_t
 defhandle: physdev_op_compat_t
 #endif
=20
-prefix: do PREFIX_hvm PREFIX_compat PREFIX_do_arm
+prefix: do PREFIX_hvm PREFIX_compat_always PREFIX_do_arm
 physdev_op(int cmd, void *arg)
=20
-prefix: do PREFIX_hvm PREFIX_compat
+prefix: do PREFIX_hvm PREFIX_compat_always
 #if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
 grant_table_op(unsigned int cmd, void *uop, unsigned int count)
 #endif
@@ -156,6 +158,9 @@ platform_op(compat_platform_op_t *u_xenpf_op)
 #ifdef CONFIG_KEXEC
 kexec_op(unsigned int op, void *uarg)
 #endif
+#else /* CONFIG_COMPAT */
+prefix: PREFIX_compat_always
+memory_op(unsigned int cmd, void *arg)
 #endif /* CONFIG_COMPAT */
=20
 #if defined(CONFIG_PV) || defined(CONFIG_ARM)
--=20
2.34.1

