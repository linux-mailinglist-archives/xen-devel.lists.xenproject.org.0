Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A16C699E9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 14:37:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164707.1491678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLt3-0006PH-Aq; Tue, 18 Nov 2025 13:36:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164707.1491678; Tue, 18 Nov 2025 13:36:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLt3-0006Mp-5C; Tue, 18 Nov 2025 13:36:49 +0000
Received: by outflank-mailman (input) for mailman id 1164707;
 Tue, 18 Nov 2025 13:36:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ey2=52=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vLLt1-0004PV-Cc
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 13:36:47 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a05f0900-c483-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 14:36:45 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM9PR03MB7217.eurprd03.prod.outlook.com
 (2603:10a6:20b:26d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 13:36:36 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 13:36:36 +0000
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
X-Inumbo-ID: a05f0900-c483-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2bzKBtmeF64AUTos2yyfOpFsVYE7kE5n3/jf+ak0Di8PYvPF4Rwiloo+B0BQwaNuYDDnjhpvS0H0ZMXLeBJaD53J1fwP9OX4K72XxQ0cqquPijI0/sSTEf48JjwKzrRHAe/2a4j4io1lCTVd84ofyo9dRcS+xbemF+O4WUMPEwJ/CqI/0X/291zdVaNpHOVF07Mbmi8gcQhoRh+XBV0+hXtLkpW6xwaVzb+q8/XzWjjsaL/zQRG182xrwo0XzQEufZZB/0dx+qD02J6vTgmzFR+wn0QrEVjXMYl2kx5YkTKNSZW7vUXqO3QH6lW9SdweBacTq5ZNYu98OFVsFazfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71+mXVMCcGmDzHT41p1W9p55Yh86fh2s7rzxAEHrAJw=;
 b=N0ucQZzDJguJKalspgqma/G91se0Zdq3RC1H8AA2Ym741M4m+gHDuQ8LXEY0i/Cblre9jCgVSkNI/P8kUJW3zn6pQeYbmF/InWL06Gy61KYH2YS2eiE2tmzVqIBe3PsA6YY2nl8VqPk9YlxszGhTSbntcys1MY8P/0KJejMpPMRbVb7+Tn5Mpi9Yvzxd40IMLIX1hA4jMMu5xISNaGUGgi71vCEA/fGWSAYzCKT0N8gEsfEUwKlfbRDN3VB4wXox5saPZEA5OlqVGbR9AGKuRW+p3w1Vgq3R0IlJWLX9+gyWcnK0tv/gbBBE1D2B+K+SR2N8MlUpSpUxJCIg1Mslig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71+mXVMCcGmDzHT41p1W9p55Yh86fh2s7rzxAEHrAJw=;
 b=E/VeAtKOzg9M5cTIPzGtYx0mCfGfpAMywO78hUf6mHJbbNA/WBzrbtbvlqKzPQMlBFFyUzzdwKOjb+AavcaSePSxK2QHUgRXQQac+cJWGyUCQqvmUKXrRIvK5vlrmte5j8973gR7VUxBVIkHi8iREs7exB2ma2Z/D7iesEAIHhHf/M3FoDSqtZA5TEXQZ7ZK5T37J6wS9f49h/X3z+Bs+EXtr56fvuELfjgeS1yF+u0dLI6RcYzHsyAYQbJtHseGek+RgmeRcbRSLytQ8xLYNFzdTsgZSpDV/H03p3eIK9kRi3tMMdsrsBqUw3n++fodkR+ueIy25EaO9uHJH4h5rA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 8/8] arm/pci: enable vpci for hwdom when pci-scan is
 enabled
Thread-Topic: [PATCH v3 8/8] arm/pci: enable vpci for hwdom when pci-scan is
 enabled
Thread-Index: AQHcWJBceLVR272n0Uem7ppfvpbz3Q==
Date: Tue, 18 Nov 2025 13:36:36 +0000
Message-ID:
 <81b3d59050df8482652c081270350dfc965b5900.1763462211.git.mykyta_poturai@epam.com>
References: <cover.1763462211.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1763462211.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM9PR03MB7217:EE_
x-ms-office365-filtering-correlation-id: c30c8f24-07d7-4949-6112-08de26a77edc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?bkP9oyIRUL9S1YL9lIJlZkqOHNto/J1moVKhxN/Qlua/n6eTa/xWw4lI+L?=
 =?iso-8859-1?Q?Fpnse4S4Bhp/0vhtcE2Fhf5xymC7ntO4WvBc33kK3PSjii7FjayV8XqWyn?=
 =?iso-8859-1?Q?ldTgKMYHkB4fUSzQfiiho2G7h4oyCdN81tdWxhzJwm3RF6Zb5oxVjrrrwW?=
 =?iso-8859-1?Q?9iGziGjtIZgA9bG0l7HfeYD4ZtKDNgU1s1Ch+/6347SYPPSFY/RTC9AYao?=
 =?iso-8859-1?Q?tfveDDaXo3QpvtDFaaTMFC+RtrEm0U/b8hkmZ6aX3avw6+qU5Fa2TuDxBu?=
 =?iso-8859-1?Q?qpEI3XLNjL2aJxnC92Qq726+6oYESMsLgKmUOCKNwPaqXJggGh7HAVEiuF?=
 =?iso-8859-1?Q?TkrqdH3KkfrVP+odmJToWqg0ihpoqZtd09dsmakgalArdvi+n4msnC58d7?=
 =?iso-8859-1?Q?W7Eav8GvyvW+O95PgGi3N5WR60s30VF2ZroczQvkq3Fia0pAVHUKrpndu8?=
 =?iso-8859-1?Q?E4PAPGSU1nmHzwJM7peyAKUrmAnyxEdxUkYINMmPRhJEwr4mJJMQEwMEy6?=
 =?iso-8859-1?Q?hARjyxn/lbTkZUKc2XLJzGrbgB6DIYiMwig7L5rn8hu/jwPXcRyF9cHqD2?=
 =?iso-8859-1?Q?FsKCnQFvtCy8SQhWwecoQ/TOawp8+rjzNoRqZGcfgq94uqgVeQ1AtZyS8w?=
 =?iso-8859-1?Q?Low9Ps4EiFEYG3VxvaFd0p8G57Z+CYnK7BP3NC/qWwfrDDqJa6C+cwV/rK?=
 =?iso-8859-1?Q?SAhQFVV7FPG/v9wYCSDHs2JkwofIWZzX89eYvU7XvPpyrL71/DIsPJQrUQ?=
 =?iso-8859-1?Q?WcJ+0YwJCG9+CjxePc4uVOYP9Hm5ZLlSeDy4o1IIXZ7Z8lgyfC+P+G9bX+?=
 =?iso-8859-1?Q?inhDEnbUHwJ+ZXCcBONZI0IMyU76USJdB27NizLXlttwxCq+T87UAGeuqM?=
 =?iso-8859-1?Q?4KSXipuVRCO9XexOV0R/PDr2FD810AM36T1S8+ph8TlhD90GaR7mLfZRpx?=
 =?iso-8859-1?Q?LvhgR0doX3PiMcXTz9mG5xg7Gr0z4p33ybAJ3s1RBZnSQ1wdx8jEZDVdKu?=
 =?iso-8859-1?Q?GwpzAxvi4GONXEpvffuMvi+usPOD0Ha1iX4b3QOawQoR1/GfSMJVA3Jn15?=
 =?iso-8859-1?Q?CxYPHGJfRVHA2gtDKvgYY+6mS3YMIpEzvvsedSpD6C/vXGJLqnuIuAo2mE?=
 =?iso-8859-1?Q?ulbPs9hzScCvDA+E3IdVbaYbD9JZwoPx2/0rAmK8d2pmt868JCQLeRo9Zu?=
 =?iso-8859-1?Q?OnQYZji5Z5jpcXAxsh8elxb3DfAZo9WcKKjDmbS1fe833i7oRFxRykUVa1?=
 =?iso-8859-1?Q?h8naHTF3Kiq7mmdMDq+rLIbsypJiU9+0frSPLMlyMGXbtgsoZCVWPqXoWW?=
 =?iso-8859-1?Q?XlrCNCLQD7jolfIWmZMC2qI4MQyg6BGYYHvph75Ch+uGjxdVHA8ZK843l2?=
 =?iso-8859-1?Q?5dD0rmadt43B5tW80ba2RRp1Q+SdhtvAUYko6DGjQHSEPyyejaFXQHyDo6?=
 =?iso-8859-1?Q?3Auc/FZmboNB6oFI/L3+3kisTNwNf1Hll6ypVe5DPE9scnqLYcaXbghov8?=
 =?iso-8859-1?Q?lebMvO5DK1vzbzdRNN/R4dYsNzYEits+xiOqiYf3f7Eat19lz41/u8XIe3?=
 =?iso-8859-1?Q?3+oUXAHwisCo6Bglkd0oK3o06oLA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?shfWLQBmEWWUHPBF1SoVqjYzW/MiFI0P4zmlj9S1qmHr5aC2CXS7SoCP0o?=
 =?iso-8859-1?Q?mYKKk/8Y9Bzjn6S2bOz6kvvnCceIiD2RRBWKiUK5Q1gLDnybJRSu+M632u?=
 =?iso-8859-1?Q?LP7EfHycJgjp8Nop6e46u1F8W7j2NQKLVMB4vu5MBAC2UjHSapagxKrlNg?=
 =?iso-8859-1?Q?8SEudBqQk7BhsR1KjxifDJJ1edZufVw5J3Si+G86rG5dPxafDpbgdfp3uv?=
 =?iso-8859-1?Q?4B3M/byqHWsDz9/yTPUEGH885zBIXbZ8EMWMUYoYO71HD3bazFJXvcnBTa?=
 =?iso-8859-1?Q?pgnTCQNu4PN8Uv/8cxTLb9ByMF15eCtnaV78buTYq4yQwC9yiahvpAYw/X?=
 =?iso-8859-1?Q?XMqngumC5JRojhSRVV6b2M4dEzNE9AF9JV9b4x85vc7hSmyCARahI8IxJg?=
 =?iso-8859-1?Q?Sa9p3E6odRaCcGY6Y9+ORUj6dpCTK0/AuHPLqnpUxFMTlDTaptzyT1DiO1?=
 =?iso-8859-1?Q?b/EEDi9LJ1sdSojJkeBB18S3xCdgzvIQyUCBds155qpsUcy7yYHALCiXp5?=
 =?iso-8859-1?Q?MTtYoYRUFd2AML70u5mQ4hyj5TakkdqDqhnPEfcR1+GEVGqupnedTx747n?=
 =?iso-8859-1?Q?eFluyoQ+gIHhvxnEPGu+XeZcshNQjm1Agn2o0x0DJGne3wXV7s6qBPM9u0?=
 =?iso-8859-1?Q?UBQxfjqnSxt28AwNWUjzX/U3iTZRw2ymK9w3W6YNmBurYX407pr0bFhmmu?=
 =?iso-8859-1?Q?19ik5GoIwu3ym/raG02nCoaTjsqCUkTTW8HNF/mdkYX3/q0eUTj1OIkrTn?=
 =?iso-8859-1?Q?fn/c/y1OJIxNJyqx6u3o5q59XiHXOuYQnsVdGTUUOU/U9+965Q2ggXfP3C?=
 =?iso-8859-1?Q?9JZ86y9WYy6Fe3TN6yjoGaCc55opV2w1bWgrVC9lv6bInUK23tWiBTkTTF?=
 =?iso-8859-1?Q?YwuJ93QXTyjXEwQrajshATzckDMLmI0deLOOpTGn0cjnRF++VgLlUffagO?=
 =?iso-8859-1?Q?A0B1oSZB5QsZOM0o5pl39DseDtqCAhx2zV1CuofHvbWlBHC6NdL3X4k0Uu?=
 =?iso-8859-1?Q?6aUTZVQxEdQr5KySDuswFtzEymP2d+r9eY9SaLiznUrrpZreHT3Md6+sHx?=
 =?iso-8859-1?Q?O+CbdRYlC/3JaiaAT3n2NHPrsG8AiSr5s8AtTJTj+DYZryYzwJaWoMI3Vj?=
 =?iso-8859-1?Q?esigJwvBVzk69jyXBj2oQ4P5COvhw00K82giZNM/H58fA3gJSrIclW5/Si?=
 =?iso-8859-1?Q?JpDVlAOhsLTbKSqHmfCpgcpNFn1YYeqjuOLu/KeAHx2CnBV3HZjqHG8g0m?=
 =?iso-8859-1?Q?Kb1B5xhY0Rjemrepkxj0ycGZR3DiaaSzFkHprs2NEwdYutgYHqL/jBSXuO?=
 =?iso-8859-1?Q?iRA0fYgmmGbfTJwU92B+LTGEHAuoyw4/7ZOLRjUPlzkUgoqxAxy6jtaJot?=
 =?iso-8859-1?Q?CUz2TT8fzK5yypHT4pHM7E1S0XxYK1b4zy0F2S/64fOmNxy6wWMnEZtzRj?=
 =?iso-8859-1?Q?35SIl9rJJyhGkk0wIPURQ+GI3gQpoERxcsHgjfdUT5ET8MAbmKoiCSTpdE?=
 =?iso-8859-1?Q?Eky3yigt0SXHo8sxHdVXY+h9kB9zXsgCol74LWbnRlwZRqtMpfePF+r1ct?=
 =?iso-8859-1?Q?1ZEA2aIlAuoCnfFEPF7OduOHBHKbDnW7vAtc7q3KutpGDObX3SloxkPpv8?=
 =?iso-8859-1?Q?KdBmJkpfJ+tthxvrhgcdGaU+HYCumkpS3z79i1KWBhtPBMQ1ZyD279lw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c30c8f24-07d7-4949-6112-08de26a77edc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 13:36:36.2504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1sS5jYNExYjIaHBGIBMlUPwua7DcmKhJbCeEt783WAbgedmEpuMNDOp/yKwOVXJ4FI54z00xC+o31SRsNxxT2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7217

With pci-scan implemented it is now possible to use vpci for hardware
domains. Update has_vpci to reflect this change.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v2->v3:
* replace hwdom_uses_vpci with has_vpci_bridge

v1->v2:
* fix typo in commit message
---
 xen/arch/arm/include/asm/domain.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index af3e168374..3eac0aea64 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -305,8 +305,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
=20
 #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_f=
lag)
=20
-/* vPCI is not available on Arm */
-#define has_vpci(d)    ({ (void)(d); false; })
+#define has_vpci(d)    (is_hardware_domain(d) && has_vpci_bridge(d))
=20
 struct arch_vcpu_io {
     struct instr_details dabt_instr; /* when the instruction is decoded */
--=20
2.51.2

