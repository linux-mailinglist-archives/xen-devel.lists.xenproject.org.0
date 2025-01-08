Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B3CA05C56
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 14:09:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867267.1278736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVVoO-0000FP-Gn; Wed, 08 Jan 2025 13:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867267.1278736; Wed, 08 Jan 2025 13:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVVoO-0000BY-DA; Wed, 08 Jan 2025 13:09:28 +0000
Received: by outflank-mailman (input) for mailman id 867267;
 Wed, 08 Jan 2025 13:09:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbNq=UA=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tVVoN-0008Lh-94
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 13:09:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2612::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9b0dffe-cdc1-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 14:09:26 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB6895.eurprd03.prod.outlook.com
 (2603:10a6:102:e7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 13:09:25 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%5]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 13:09:25 +0000
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
X-Inumbo-ID: c9b0dffe-cdc1-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDa8fpuF750d+R2PqjCk+SPcZEZ6GaIsClzcOgI8Wx3CRQFReClUxwbliKSPxwVBduc3OCqSssVTz6sdwWmTBrrMuuSf5NSuioWZWzgxDh9AzuSjwNuJBIgoopZ7BTVwZiaLm7cYGBBbgmBV9z7VLyEj5LIyGe8xb4MjyNr5j9Mgqefy5CMc2mMs5zrUvmzcAxElIBY7t0ueyiB8OjRKziZl5vXac+EMfNg4KZ+MI+d+Pr3LxxTQOJDapHVO5UNy09DAgJt8pWYFpTRgHedmos3UVPOTTaVMzpkZ+G+8Ur95ZJttvOg6JGgesTJMLvADYvsbM3BRhtbd92nK8JsvGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFrATFgoRJ6d7ziVWdmSYdnPpEDIZasMI6cQcXBIx4o=;
 b=IlhVs1NF0I6Bj9+UBSA0DV2/UW2SnwvnYInwmVzOuKQX3G5Uh2fTxmsbvdTZZ9fOVFM3CMtrg8Il988X3NouY9rr9qNVGO0EjMmwC5+1XPU01RKDi0NeqDYwLTmJRTp7v2CWrQplipd1T7WswS0A5Tl3hd6Ue2q05HBYq9IND69NYslIW7qSYWb3vyL5C8oYS52+SOAY/wWC1/OVV1KaP0G2g9oaJyI5679QFAyrstizo1v4barypI5lYWa2/r13rbCOmJWGJJ6CoL7IqGVTPO3AWKPuFpm41bHHhuCVUFDuPySSjPN8muoJeRwE/ncZ+Pn2CWIooS1h10Szsxyzsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFrATFgoRJ6d7ziVWdmSYdnPpEDIZasMI6cQcXBIx4o=;
 b=p1tsTNoTm/pUZ7KTRGgfzfnEoaOYG/4EcSUpyQ+lj8TqOkOLHDndX/iUkQ96WE1Ed1LN0RbWuud7scCbGYYjPrTyv+qUBWegQXIR2ojf4cuk3jKxx/hC5MpN/hU3Y98XrjL7JtdePz910sSq1rAJdKfeH9ozEi4b7UCMeL5rcNzNLZfPhjPStxJcBY5JPc3fyFR+d2R3h5ASZGXO3ymbSVg9G7ceKRMMjyLVHsfVih9WnW0TLwq32qqa2t/25xw8NW8KsaIpW26nl28N7eeM9X9wBEqhGmbwv2V/WxZX38IKUsvl5XUKIUFoHy6xhwmPh2DQy/eO9P3+3PZQ585v1A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v2 2/2] xen/arm: platform: Add support for R-Car Gen4
Thread-Topic: [PATCH v2 2/2] xen/arm: platform: Add support for R-Car Gen4
Thread-Index: AQHbYc6Keb5mCkHZQkahUE8AT5r5CQ==
Date: Wed, 8 Jan 2025 13:09:25 +0000
Message-ID:
 <e4ead3d638c1ddf2539a2f0824284bd039892bff.1736331828.git.mykyta_poturai@epam.com>
References: <cover.1736331828.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1736331828.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB6895:EE_
x-ms-office365-filtering-correlation-id: 73188ba9-c1c9-4c35-2bd6-08dd2fe5ad3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?OoTds1l33loJRaNcCcz739klB93hkHl8+4TAAiDvi5hQ0Xwsnb4b8518Gq?=
 =?iso-8859-1?Q?HKoSB2mP/R3ZO0el557G1pTSFrc0mnd6KVLQfvlsYyLzt5VTUPTsIT5S0j?=
 =?iso-8859-1?Q?SqIeaMIY60DQRiWaqfijyyjFAi+/ofonX+Xd8Hp2X/2QtgQttSsTiGJ9Co?=
 =?iso-8859-1?Q?Dve9x4V38DghguL5e3aupJPUablow8dnrXdBubCm1YVhICr4NaBLTy9fCa?=
 =?iso-8859-1?Q?SDPB6wT9xs1/Byymr9zHajfrw/Rmxi7x2J4YfZPI0EdZZuoOiJiBGSTuvC?=
 =?iso-8859-1?Q?hhhVnlM+pA6X/8dASvj0o4g/0No/Def7eV65y66Z1k+R2EyFjv/EAqh9m6?=
 =?iso-8859-1?Q?8TMdh5xppTOz4te47QUhsy1WidY4A8PY4r6M2PPnGpPWXGeWqkdDWLphOq?=
 =?iso-8859-1?Q?k3sBZfffbiONTIErRz6JPpXlxvVyOp4aZDUKKPMyrDRE93g/Vioy5LLmEw?=
 =?iso-8859-1?Q?4gL80L+xFf8otT8GWZOAlF2Hl3tA01Pyxy8zxayAtJbrwdy+/rdobQir1J?=
 =?iso-8859-1?Q?I6fqnKH0EhTXZV4Dlp1eJBimv68+Ur1FohFLOzT+RYZ0bNacY84U/c6FYB?=
 =?iso-8859-1?Q?Rg1K0OK4C9bBX4ZiVzwEe2UlTkDN8DGID+eBBy0oasoHfqhPdylhx9MkJO?=
 =?iso-8859-1?Q?ITZlUAZxKwc9Zg0iodnuLfldwYokH4bVo8Tufezn+PMFVPDXO2e7puSwJP?=
 =?iso-8859-1?Q?2iST1sr+t0GRnlbBtJAneyexIGOg6aN2P0jMmHPPGzr0R6SXu8aRH9azRX?=
 =?iso-8859-1?Q?N4yDK9Uk1Bq460l7XA0ISpBm8s3sUzp/7Ssi3h1nQcAfKKOvPSXD4xz3xD?=
 =?iso-8859-1?Q?aNlMNNomjKhbNtRZ4MI6K0OuAKFBhFGDD+16cg4R5e2UF3GujeAAnyHrGe?=
 =?iso-8859-1?Q?KT16/73CbTMvHCq4B4aGyXBSdy148/UICCULz8FMBeXdM8vCpEYODEGAhQ?=
 =?iso-8859-1?Q?DhQFSEtGKGoDQ8Xp+kgGJ+L+REOBXrSRj428Dw0XCGV/LtVh/qaEX52AoP?=
 =?iso-8859-1?Q?iuh7nC37sjajb8emGPUjoUuQA+11Je2+hEP8JMdVd5hJ1RBSb0YAte7xfi?=
 =?iso-8859-1?Q?Glk+Uuuqrds3pUt62/vv3OIB/jXKm+ohaxQQxiz3YdTbNT4RpU4jlGwhwb?=
 =?iso-8859-1?Q?EOTUBQMD2Vqv+nZvTxYAwqVYXEKJvIDe23WI2WV/a9SJdG/vkD9MCa5OoN?=
 =?iso-8859-1?Q?W95HcBra5Rvzj/dgVeWaJ4lciNxeZW4jCc8N0dICXdEiOy/WbXdt5/2jIV?=
 =?iso-8859-1?Q?RvUNPllasaFgPVDaFH9Wc21c5yoGo1kHDkw3gT3NbNyUKkYEYLJAAJVFwJ?=
 =?iso-8859-1?Q?rHvQNt11qXl/5FY8pvsW7HkNbNlyvbY4bCQB4r0Pvho/zNiSbuFcVCks4i?=
 =?iso-8859-1?Q?v4w6lL1gaTE1wBGsHThPElhwcPOqn+Nl38379eIwXJFE3KsPln+vv1aBUL?=
 =?iso-8859-1?Q?EIAsPlS2Q9NAEg6/IEXwXsNDmxsVRIbAvU8trHYOY5H2sF7NkhXcMhZmiK?=
 =?iso-8859-1?Q?lyOli5mpB54LnUwdPbRMjX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?I1OaPJLBRT17+gf6lrss7wqB1sdy3/MwN/oTa2hlSLTvo5vtVfPqCZmceA?=
 =?iso-8859-1?Q?JIZu4mlRKVQS/QtSYdseM7u6Zrsfs9mFH63reTaGMKzC3QPSPU+g/xtyvD?=
 =?iso-8859-1?Q?B2+FDxgPuTG8Qy3ZDR4jWa2nQUZpmZ411J9K9fwaXFRuG0nqzwHCTTJVzZ?=
 =?iso-8859-1?Q?ZyPFX5vZG7dhKZqrQYMbzwJR2o2JnIjNrYe39A+kLiXwzevl53M2mwvAk8?=
 =?iso-8859-1?Q?CJU9e2VMk8Ql8GjIdeIcuEfRye0akIzlMPOeXg0jqD6XnicdgZJ/WrYxla?=
 =?iso-8859-1?Q?Uv9cJmMLVqe3mwhjGbQEiZ1mX9ZBb2gtlik7iS0aKgB5Xgxmc4Njh7ivIP?=
 =?iso-8859-1?Q?Xz3oEieF13vS4u+8bPpeIWWZVM7PGXhbdQz4SWMf1yJw6me10Orq06/EUG?=
 =?iso-8859-1?Q?T1pS/hFp6y5Kacxf+9J47qoxS8jZZWoL67UgEZDQnPAr01ZjukFBWHoLln?=
 =?iso-8859-1?Q?vvZ+gnSpkIZP0efn1NVYzE5Vfm6Miw9Bu8zaj0/lMdqv6ACeduEu/hg8AR?=
 =?iso-8859-1?Q?HMVMd2r5HTcYL4t6F0UJvpx+6+Nb7FgW+EEqTmOwjBESgkIG9YAENEiL6J?=
 =?iso-8859-1?Q?Ys0ts0uXcpQbOkKEikdhob8w+qJcdadqclrqO70DGUfDWDhhADnfUcyiec?=
 =?iso-8859-1?Q?vuzS2uwpFvUwJbNdC2zaDphnYCnfVhP1Jt/6zvxO+43oC7RisHwYq2qst4?=
 =?iso-8859-1?Q?LQR1pzrDfZUFCapOx/H4fywTSpRIq3NzA5ebwJn1S5qhzWiJkiXwh1ni8e?=
 =?iso-8859-1?Q?W9BJ2u5dZs7hBuvrvWcd8ZRJrJHV8wLTu5ltK8JM1tHdWSOEHoDyXC8JdR?=
 =?iso-8859-1?Q?OsYteWOTvGF08u7ooZ5Aan0yUKTDtUg6guAB4lJL4aV7NqVlHMGhPA1BvT?=
 =?iso-8859-1?Q?4BPnf2daAya6AEd8nAEcLo3fLSnWwahX751uMrNnx9PJ9vmCom3RqnNnPS?=
 =?iso-8859-1?Q?egw+qNbKtvSEXZ9H9aWeAykrdzpTSK/yxNkcod5yxJvcZ10drv1VVcNKr0?=
 =?iso-8859-1?Q?BQwGSQOR0OLtPCiQkvTMS4TwoBxTxqu1W3icdhv5gwdWszrGNSV975FRMJ?=
 =?iso-8859-1?Q?n8vkMdgIPc+8beZh1Y7ZmLFMY3z3ffTbOxpS8I3wwehmvbzs3FJvLjkykI?=
 =?iso-8859-1?Q?8aPYChscHHjRvV5U9SdbxEUSVbPHybAAgpmiicYAs+C6MlIl1IM2e0uU2t?=
 =?iso-8859-1?Q?hCdM7y2HsZduTxegpVJlQrO1Itq6VAU/yIVcBJwRtM1kAM30VVk8p8s1k0?=
 =?iso-8859-1?Q?9IpL9xuUdJfLE8tXJpkkTIvRVDMhPU2cIBEIJgrA7Z7fqHQCJi7puZeTAp?=
 =?iso-8859-1?Q?93sQe5lZtm5glxr0s2zJWcHPE7B3YJXDZWB3/4ef5ba/LQ/kxWNlT1NH/V?=
 =?iso-8859-1?Q?YyWBbhR2CZW/zZX9gb7FKzwN+3Cdvqc3TDM/TkJlaM9fX6Mpw4vkLC9edh?=
 =?iso-8859-1?Q?XpksmhnP5BLVjs5sZg6VmUYpI3WSw3R+6MAEBjoud5iAmZVxFz9glrjD1E?=
 =?iso-8859-1?Q?ZzFKpTVbg3lJE+duuh0P1HxnWYGvDX2bZxCbVSejgLSC/bh40e3MKWcPdp?=
 =?iso-8859-1?Q?/yO9ZX01h6aBRTXUn8jsen070/S0rsJlDQJbec39N+FL7GCQnizXcohVVV?=
 =?iso-8859-1?Q?4QICDxRNtGdDy8kdKF7QgrvQ+hOTHVtCOSKxZ9O5uY9zYFzClxeP6Juw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73188ba9-c1c9-4c35-2bd6-08dd2fe5ad3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 13:09:25.6471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xm6cvzJuICWEUqhm3SNXiVnAt3c4q3Rs24IazJdjXtmcMvMWWzKfAUjJxklZEybIwL3jgOLzT9erVU4CRtTjhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6895

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add Rcar Gen4 platform choice to Kconfig to select all required
drivers automatically.

Changelog:
v1 -> v2:
- Added RB from Stefano Stabellini

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/arm/platforms/Kconfig | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfi=
g
index 02322c259c..8785c168bd 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -29,6 +29,15 @@ config RCAR3
 	help
 	Enable all the required drivers for Renesas RCar3
=20
+config RCAR4
+	bool "Renesas RCar4 support"
+	depends on ARM_64
+	select HAS_SCIF
+	select HAS_ITS
+	select IPMMU_VMSA
+	help
+	Enable all the required drivers for Renesas RCar4
+
 config MPSOC
 	bool "Xilinx Ultrascale+ MPSoC support"
 	depends on ARM_64
@@ -55,4 +64,3 @@ config ALL32_PLAT
 config MPSOC_PLATFORM
 	bool
 	default (ALL64_PLAT || MPSOC)
-
--=20
2.34.1

