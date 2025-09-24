Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3F4B98B8B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 10:00:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129037.1469220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1KPV-0000nK-1r; Wed, 24 Sep 2025 07:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129037.1469220; Wed, 24 Sep 2025 07:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1KPU-0000gd-PU; Wed, 24 Sep 2025 07:59:32 +0000
Received: by outflank-mailman (input) for mailman id 1129037;
 Wed, 24 Sep 2025 07:59:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4Db=4D=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v1KPT-0007np-E1
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 07:59:31 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65ea5722-991c-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 09:59:29 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB8118.eurprd03.prod.outlook.com
 (2603:10a6:20b:445::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 07:59:22 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 07:59:21 +0000
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
X-Inumbo-ID: 65ea5722-991c-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fE/Y5HaNfdLRN3m42138AiaC5jBKVwBxgjcrxIxLonSGvCn9/ujonyhy9gurupGuFwD/gUcNaBBZ45y8sJzwceyFAyEcfffafVlpK2ak6ef/w+byLmhnR4KGS04FsOOVPOt4HnKbvk06U878FMn9ZTNdhCY4rHSN/lt32jn4VUgUq9v8Z4djCM9GgR9yZxmqQopbGC2wB2tkLDmW5rdPHzROXo25bLdfiNCosO1kF9Cux68ppQTXIwN3Q4ywjLLWw0SDAyeAdpYk2jRwxaRp8nylbj4sfLbC7Uk6xD485ScBvGPtSnx58QTfPQ9uCaAfkO7KIzcOaxorPAxgpgl6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXNUfWRmkjORiC7yyrgzg//uXWPFCbV0Om1VThH2SYk=;
 b=ItX+9E4+w+7t0pHFqrQ4FYGoBSkgGj/wA4WFRKDolTylceDjiZTLX6Y1Xtj1sqV4wRdYsueHGQNKohihBju69uYXbcJ/QJg8OXuyys+vqnF4uONljx7LaxAq8tjQS/1JP5io0r4IbI1bMQO6arhdn6RMG81bWAh6oZn67sHH+L7GTy2T85JrfPsylk1ThvkRL6h9h3CX2iYOSVL2kFGcF9NotIn/P0uylBOdneFkga/o3aaHObbjzfHDfDC0YaTOx19qgNsEkabjZodmUVbwiIdvl8jhzSFZmyvIEwVpBnzNzKv1vqDCZVhw+5L47sPdXi2hR/5VYxkaFf/3ObmECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXNUfWRmkjORiC7yyrgzg//uXWPFCbV0Om1VThH2SYk=;
 b=N5RaAnOuss5j/0K09zkWs+LTL0Gk1sF1+OoRxtLq16NazsDl8b9eq+Fcs339TMyJYaYKfycyiIcL5yQ6gUGP03QOj+HhxuaAwXcnV1NMLo6XKyRyjA+uadO1+NCnvjIrL+K+8WJ8+9HmfnFAXtb9rZMGwaxnb20CLOpzEtHyZIda15dGc4tROijpSmvtqHJ9Nr+7Q6QlCiekXv2Jy8CZDxIOYNpbL+JuA9wJ8vxa8pTJKVtZKpOHavRuqQDqmCICCUF/D5iJT1AkcUMYuUBe/OrxFIIbp7TIODbjZo7eJBPnYqERHzuVEczMMI92CjWmOYUUldpk43HPlhfT9tMYcA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Luca Fancellu <luca.fancellu@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v1 3/8] xen/pci: update DT for hwdom when it uses vpci
Thread-Topic: [PATCH v1 3/8] xen/pci: update DT for hwdom when it uses vpci
Thread-Index: AQHcLSki3XdXcYrDmUyuu7Fte47UGQ==
Date: Wed, 24 Sep 2025 07:59:21 +0000
Message-ID:
 <f3efda4a607fe430f6620311ced6878e7c9b4c9b.1758618839.git.mykyta_poturai@epam.com>
References: <cover.1758618839.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1758618839.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB8118:EE_
x-ms-office365-filtering-correlation-id: 3f5f2b92-c18f-4538-e5f4-08ddfb40457b
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?qjHsEZSfTN/Yue0EZAHmJjDJpuDD2dvx3uYSCPc9L8lFK1VlEGkDotlSVV?=
 =?iso-8859-1?Q?nON1xaJlFVdzT8wmwR/ts+XYQgTYRruErVBY2wQIH/TAtBiPYTz1xSPU1N?=
 =?iso-8859-1?Q?+ywlpFB903tdNa4KuRwBubIh2aWWUsBvQMCRK1pyCTyBgfoPhtmhvte8YZ?=
 =?iso-8859-1?Q?UA5k6JvO/eGNU+N0gOAjM8Kpp9xnWoKBNXfTaBqEIE8zL12v1FTIyeDLaD?=
 =?iso-8859-1?Q?A3I0DZtFB3hpPMRLRwLP3y6qoNzYL6/24q0SLV57eZtw+nevJZIWNT0m+4?=
 =?iso-8859-1?Q?1ezeJ7+czIdmtcpavUQgLjAN7lKP/1vmhoZF8lz0IgOHaoj1IiDOL6KLKV?=
 =?iso-8859-1?Q?C0VG2hJj5wSsWPgEyX0whrIESrqvDAsDqbZPLCRkqKbLGSGzimeKzIM+rR?=
 =?iso-8859-1?Q?NQ5tJ9nk/urf3IR0VuGYf3KYcB3xtrwpZdytahwduMApKDl72oNwfnWQ6e?=
 =?iso-8859-1?Q?cLikheraQBxrpR1HQOfM1TaENolKXW9t4yh3yGd1A+dOS4O0fRE9caCK3Q?=
 =?iso-8859-1?Q?duXd1ZXT6g0qihri/z/YX3wqv0aTBbEY7oy4vVLwgHqt4QZvJ0jxNIyIba?=
 =?iso-8859-1?Q?gigicZcB0V4qVvXK7hUwT9uwaywPYeBuHmsUUsNl07/ItvvW86E82Lnxjw?=
 =?iso-8859-1?Q?phNbOeMD5fVev6XcxoCAQpTyDloKa6jKfPFnRHB0R7zqpZY9fZ6CfJsCz8?=
 =?iso-8859-1?Q?egZm8qc/3+dYnu3joQzPs/PT0OwITlWIiQtegxrX1UV1ZS+5ZM/B6N4tAK?=
 =?iso-8859-1?Q?h4LJIfrduLnluyX4C0N2O0ez2eGsxf2fI0cU8ju2jpTtk5ZmtPZ5927PWk?=
 =?iso-8859-1?Q?2UE/qwR7Zp1imyrQ0KkIRoqQfyfqnhI9rXvaDpeB46MWWGtk+r3tSWhD8Q?=
 =?iso-8859-1?Q?W5Cy5Zf1EHhNkPSNHrxL6O6TemCoBr4VEZPWfOtjNljDH5V3zNlwn9ZEzz?=
 =?iso-8859-1?Q?DnauFwrSd5Tip+UHnYfbvjlQm1pZbsDkIEVbfK+AF2Y6WFAdWJKIMSUz94?=
 =?iso-8859-1?Q?FJoLV1PKV4XlcU5PmYxf9v9et7D+f+5n630N84GaHBUcFaSEUWVCae0Hq3?=
 =?iso-8859-1?Q?kMtPibXe4TERWZ3DgewiP8+PIBILeua4LLNuMKvkUvruuZ21i0jKWjPfMV?=
 =?iso-8859-1?Q?YepKSB1VjEiS84VD8pNHUG5afWTRhwzk0SXNxzZ9/U0ik/ssAKLhzwP22Z?=
 =?iso-8859-1?Q?O2C+Q2SHr0ZnSCgC/tiG9svTDFG1O/++XHlq3cZ6gUNsyADUfWQfbRdaNP?=
 =?iso-8859-1?Q?Z09zh4jYb/WvpwrTh2ayi6mTU8Sa9WwR/CBZHCkhHDSl7CuC7pIZkoouwd?=
 =?iso-8859-1?Q?mCdfnbTlAWvlAUBMcwT4jA2exXMJw8b7qx6gK57308BiPs+4cfZdQfgknR?=
 =?iso-8859-1?Q?himGKu4W7UlJs4h2U6hwBuPSrSPGv3CSF2E6z4rj/5lg3R2paaGUNnjyWe?=
 =?iso-8859-1?Q?jYm8HBmAhcuZIoPNpsEBMC+axmDrch8GCOErjuKVWGq1SbaRUp9lgqehJL?=
 =?iso-8859-1?Q?bbQ7csud+7PStL//gpN9hjWezRlxEh2IrHAlV1vMLMnAbz2v9KexXrG0KS?=
 =?iso-8859-1?Q?ChAEU7k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3ND8saamag5hUylyhfZ2GcxCaHC0Ni86l/VWm+s+8JOpxWHV+/3IrIcxsg?=
 =?iso-8859-1?Q?zldrhjb/XhnmPTL1ILwdlYPVgdaofIP1nfc1I6Qzc6N8k/7lno/8cwSNpc?=
 =?iso-8859-1?Q?AezxBFWbx9mgLBil8yDCeblhRfJ92Vi10IxSQucR/8tLku/etBldp8UTrN?=
 =?iso-8859-1?Q?v8evmQOEGGRbVxl7Yiu02T1NLAx5hXzrjopaDLhYsIF+mqQb9p8k30uB2H?=
 =?iso-8859-1?Q?ladPiRCGDVhEKUXLNyzkeVADKiizynJblJBUDZmK8Ri91ySdr0hoVI7UeF?=
 =?iso-8859-1?Q?OZ1LfLS3nmA2lDg8hEdfbiKMsHiCqAXYilxmGLmKS00FoSUpS9dCbdNmEi?=
 =?iso-8859-1?Q?Nn/pVjeq+PJXhJDePTuIyxNHUBDzfPpbOvjYjTmhkzFY+6J1Wyh11w3s3I?=
 =?iso-8859-1?Q?suyXGf4/36I/zQ1+m7Dd2He7aF7vLOf4/MHYJLo501SqIJRrGAeo5PbhFG?=
 =?iso-8859-1?Q?T6oVL5xBZwRil6Rm2CCTQPitRw+QZYck7OgCG9hChTBVh6l8rREuoCfhn1?=
 =?iso-8859-1?Q?0SH4ZPNZ/jxI4+r67Nwe/zGe9cR/bI6MvFS+G8Lu6UBxJtn71b3wPcT9b8?=
 =?iso-8859-1?Q?LMegUPwhBLVHiypOH8Zdf/BOnGwtD7wBqjFtC60Y8oLjqrM/RlIvwhpd0M?=
 =?iso-8859-1?Q?hP167Yz28yOLLuJ25uBGshVwkuAkFdH49lk9sr2zEaICeS6cJro9X3b//x?=
 =?iso-8859-1?Q?z+k7ZNJDAzFqlvkWloV/oSj09lpRP064WZD4J1RUrVMtF9I0eKld+OUe4H?=
 =?iso-8859-1?Q?126BaNkG+HfIYTXlvbnZuLrKuLDYRT3AnLoM/GssscQffKUkEONM5hE9xX?=
 =?iso-8859-1?Q?huX7TWGPk3qhelH6GVaS8bhPSfgGymG6vq2OraKmYPn6kUXjStqPpIkNOq?=
 =?iso-8859-1?Q?cglhblt3vTHcW3VPikybfzVjifBmGgDen3o5ovxZRB0jbgptHrPMgllBRy?=
 =?iso-8859-1?Q?Sj6DT9WdGizlt4X/dpLtWVTyWc3bZG4oA7UJmFf+nlpoQElzRMFyKT2lbP?=
 =?iso-8859-1?Q?QQUH2FyE1/YWbsKDmDUgA/QSO04r5dPPNtrg4N2zD0XSf1sYm9ABkbAESQ?=
 =?iso-8859-1?Q?k5SdWefsMX8Pnv8uv7kv8JJGuHZw6qC2VCncqgxDc7rKKE+qfhkvaL9K4O?=
 =?iso-8859-1?Q?jGZPxGoWWcUXiD4D/BXZTLY6qQn0P80x/V4mJRXMxxWbV1l/Rb9t8hp1sX?=
 =?iso-8859-1?Q?uuSjdqzuGEGf6iyyR/aXdZP0PAPYCtKn7SzvSv8WwZPoLZLGlgy1d9D91O?=
 =?iso-8859-1?Q?WiuI60TLV6IadRMCP2cqjCpDpxwqwsaS6AxXcVBF/8MaI3IvEHCBKV9LTC?=
 =?iso-8859-1?Q?ka1+XZTyR8uUV1maDldbC0HRDCfRHEHjdbZv1ka3wvPmFtA5jIitUUfXmz?=
 =?iso-8859-1?Q?e2V8i1QV9X+opAQjbPZCmAjz0aE3RwL8vgtiYxEomi2LAbz1/BdfgeMR/I?=
 =?iso-8859-1?Q?a8RwNsZWbUnpYOnJ7l9Y2c+OQNCgS23Yp2ThFy1XbKcV0DQw9rR/DULMeW?=
 =?iso-8859-1?Q?wmux9EigXwMmrk1l149c0SMRJzuTrUD93LY9yFiz4lGKmc52e1p++TyUnl?=
 =?iso-8859-1?Q?ewogeoYKQqMQvWZ+OPtF1GjXYN8DPaW+ktHoJQ4wo7kA5uKaTCrFpQLdtI?=
 =?iso-8859-1?Q?p4x8D9uX0oeYdkUCCm96wiGIuo+OIPnfExHC7nvB4+G6PiQjBRLHsKhw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5f2b92-c18f-4538-e5f4-08ddfb40457b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 07:59:21.8547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y9JKalcRrg83AiMNX7Asej4LWvN+lDj14qUhBUCcMfB9NwQ7Lzs0CRodAnMzjzJOD8WIBm3NdKgDi0cfIrlRfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8118

From: Luca Fancellu <luca.fancellu@arm.com>

When pci-scan is enabled and Xen supports vpci for guests, Xen will
scan the pci bus to find devices and emulate the pci bus, so the hw
domain must see the emulated bus instead of the real one.

A new helper function, hwdom_uses_vpci, is implemented and returns true
when pci-scan is enabled and Xen is built with
CONFIG_HAS_VPCI_GUEST_SUPPORT=3Dy. When hwdom_uses_vpci() is true, a vpci
node is created for the hwdom device tree.

Depending on whether the guest is using vPCI or not, and whether the
domain is using host layout or not, generate the appropriate device tree
nodes for the guest and handle the right MMIO regions traps.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 docs/misc/xen-command-line.pandoc       |   4 +-
 xen/arch/arm/domain_build.c             | 151 +++++++++++++++++++++++-
 xen/arch/arm/include/asm/domain_build.h |   1 +
 xen/arch/arm/include/asm/pci.h          |  15 +++
 xen/arch/x86/include/asm/pci.h          |   6 +
 5 files changed, 175 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index 4a66c5a8f9..ac8e7bfb7a 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2077,7 +2077,9 @@ Flag to enable or disable support for PCI passthrough
=20
 > Default: `false`
=20
-Flag to enable or disable Xen PCI scan at boot.
+Flag to enable or disable Xen PCI scan at boot. When the flag is enabled, =
the
+hardware domain cannot have access to the real PCI bus, it will see the bu=
s
+emulated by Xen.
=20
 ### pcid (x86)
 > `=3D <boolean> | xpti=3D<bool>`
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 4bbffdf535..f49e0e6486 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -41,6 +41,7 @@
 #include <xen/grant_table.h>
 #include <asm/grant_table.h>
 #include <xen/serial.h>
+#include <xen/resource.h>
=20
 static unsigned int __initdata opt_dom0_max_vcpus;
 integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
@@ -1557,6 +1558,142 @@ int __init make_chosen_node(const struct kernel_inf=
o *kinfo)
     return res;
 }
=20
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+struct vpci_param {
+   uint64_t vpci_ecam_base;
+   uint64_t vpci_ecam_size;
+   uint64_t vpci_mem_base;
+   uint64_t vpci_mem_size;
+   uint64_t vpci_mem_prefetch_base;
+   uint64_t vpci_mem_prefetch_size;
+};
+
+static int __init handle_vpci_range(const struct dt_device_node *dev,
+                                    uint32_t flags, uint64_t addr, uint64_=
t len,
+                                    void *data)
+{
+    struct vpci_param *vpci =3D (struct vpci_param *)data;
+
+    if ( !(flags & IORESOURCE_MEM) )
+        return 0;
+
+    if ( !(flags & IORESOURCE_PREFETCH) && addr < GB(4) )
+    {
+        vpci->vpci_mem_base =3D addr;
+        vpci->vpci_mem_size =3D len;
+    }
+    else if ( flags & IORESOURCE_PREFETCH )
+    {
+        vpci->vpci_mem_prefetch_base =3D addr;
+        vpci->vpci_mem_prefetch_size =3D len;
+    }
+    return 0;
+}
+
+int __init make_vpci_node(struct domain *d, void *fdt)
+{
+    /* reg is sized to be used for all the needed properties below */
+    __be32 reg[((GUEST_ROOT_ADDRESS_CELLS * 2) + GUEST_ROOT_SIZE_CELLS + 1=
)
+               * 2];
+    __be32 *cells;
+    char buf[22]; /* pcie@ + max 16 char address + '\0' */
+    int res;
+    struct vpci_param vpci =3D {
+        .vpci_ecam_base =3D GUEST_VPCI_ECAM_BASE,
+        .vpci_ecam_size =3D GUEST_VPCI_ECAM_SIZE,
+        .vpci_mem_base =3D GUEST_VPCI_MEM_ADDR,
+        .vpci_mem_size =3D GUEST_VPCI_MEM_SIZE,
+        .vpci_mem_prefetch_base =3D GUEST_VPCI_PREFETCH_MEM_ADDR,
+        .vpci_mem_prefetch_size =3D GUEST_VPCI_PREFETCH_MEM_SIZE
+    };
+
+    if ( domain_use_host_layout(d) )
+    {
+        struct pci_host_bridge *bridge;
+
+        bridge =3D pci_find_host_bridge(0, 0);
+
+        vpci.vpci_ecam_base =3D bridge->cfg->phys_addr;
+        vpci.vpci_ecam_size =3D bridge->cfg->size;
+
+        res =3D dt_for_each_range(bridge->dt_node, handle_vpci_range, &vpc=
i);
+        if ( res < 0 )
+            return -EINVAL;
+    }
+
+    snprintf(buf, sizeof(buf), "pcie@%"PRIx64, vpci.vpci_ecam_base);
+    dt_dprintk("Create vpci node\n");
+    res =3D fdt_begin_node(fdt, buf);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_string(fdt, "compatible", "pci-host-ecam-generic"=
);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_string(fdt, "device_type", "pci");
+    if ( res )
+        return res;
+
+    /* Create reg property */
+    cells =3D &reg[0];
+    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_C=
ELLS,
+                       vpci.vpci_ecam_base, vpci.vpci_ecam_size);
+
+    res =3D fdt_property(fdt, "reg", reg,
+                       (GUEST_ROOT_ADDRESS_CELLS +
+                       GUEST_ROOT_SIZE_CELLS) * sizeof(*reg));
+    if ( res )
+        return res;
+
+    /* Create bus-range property */
+    cells =3D &reg[0];
+    dt_set_cell(&cells, 1, 0);
+    dt_set_cell(&cells, 1, 255);
+    res =3D fdt_property(fdt, "bus-range", reg, 2 * sizeof(*reg));
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(fdt, "#address-cells", 3);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(fdt, "#size-cells", 2);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_string(fdt, "status", "okay");
+    if ( res )
+        return res;
+
+    /*
+     * Create ranges property as:
+     * <(PCI bitfield) (PCI address) (CPU address) (Size)>
+     */
+    cells =3D &reg[0];
+    dt_set_cell(&cells, 1, GUEST_VPCI_ADDR_TYPE_MEM);
+    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, vpci.vpci_mem_base);
+    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, vpci.vpci_mem_base);
+    dt_set_cell(&cells, GUEST_ROOT_SIZE_CELLS, vpci.vpci_mem_size);
+    dt_set_cell(&cells, 1, GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM);
+    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, vpci.vpci_mem_prefetch_b=
ase);
+    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, vpci.vpci_mem_prefetch_b=
ase);
+    dt_set_cell(&cells, GUEST_ROOT_SIZE_CELLS, vpci.vpci_mem_prefetch_size=
);
+    res =3D fdt_property(fdt, "ranges", reg, sizeof(reg));
+    if ( res )
+        return res;
+
+    res =3D fdt_end_node(fdt);
+
+    return res;
+}
+#else
+static inline int __init make_vpci_node(struct domain *d, void *fdt)
+{
+    return 0;
+}
+#endif
+
 static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                               struct dt_device_node *node,
                               p2m_type_t p2mt)
@@ -1615,7 +1752,12 @@ static int __init handle_node(struct domain *d, stru=
ct kernel_info *kinfo,
         dt_dprintk("  Skip it (blacklisted)\n");
         return 0;
     }
-
+    /* If Xen is scanning the PCI devices, don't expose real bus to hwdom =
*/
+    if ( hwdom_uses_vpci() && dt_device_type_is_equal(node, "pci") )
+    {
+        dt_dprintk("  Skip it (pci-scan is enabled)\n");
+        return 0;
+    }
     /*
      * Replace these nodes with our own. Note that the original may be
      * used_by DOMID_XEN so this check comes first.
@@ -1766,6 +1908,13 @@ static int __init handle_node(struct domain *d, stru=
ct kernel_info *kinfo,
             if ( res )
                 return res;
         }
+
+        if ( hwdom_uses_vpci() )
+        {
+            res =3D make_vpci_node(d, kinfo->fdt);
+            if ( res )
+                return res;
+        }
     }
=20
     res =3D fdt_end_node(kinfo->fdt);
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include=
/asm/domain_build.h
index c6fec3168c..bb36e0150b 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -6,6 +6,7 @@
=20
 typedef __be32 gic_interrupt_t[3];
 int make_psci_node(void *fdt);
+int make_vpci_node(struct domain *d, void *fdt);
 void evtchn_allocate(struct domain *d);
=20
 /*
diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 7289f7688b..4fc46da315 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -176,4 +176,19 @@ static inline int pci_get_new_domain_nr(void)
 }
=20
 #endif  /*!CONFIG_HAS_PCI*/
+
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+static inline bool hwdom_uses_vpci(void)
+{
+    return pci_scan_enabled;
+}
+
+#else  /*!CONFIG_HAS_VPCI_GUEST_SUPPORT*/
+
+static inline bool hwdom_uses_vpci(void)
+{
+    return false;
+}
+#endif  /*!CONFIG_HAS_VPCI_GUEST_SUPPORT*/
+
 #endif /* __ARM_PCI_H__ */
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.=
h
index 0b98081aea..08e8959d0d 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -76,4 +76,10 @@ int pci_sanitize_bar_memory(struct rangeset *r);
=20
 void pci_setup(void);
=20
+/* Unlike ARM, HW domain does not ever use vpci for x86 */
+static inline bool hwdom_uses_vpci(void)
+{
+    return false;
+}
+
 #endif /* __X86_PCI_H__ */
--=20
2.34.1

