Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D74EAB10E3B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 17:01:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056244.1424490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRi-0005vq-46; Thu, 24 Jul 2025 15:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056244.1424490; Thu, 24 Jul 2025 15:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRh-0005iR-P4; Thu, 24 Jul 2025 15:01:21 +0000
Received: by outflank-mailman (input) for mailman id 1056244;
 Thu, 24 Jul 2025 14:57:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMfj=2F=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uexO4-0003AJ-5M
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:57:36 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 877a207b-689e-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 16:57:33 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB8370.eurprd03.prod.outlook.com (2603:10a6:20b:50a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 24 Jul
 2025 14:57:29 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 14:57:28 +0000
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
X-Inumbo-ID: 877a207b-689e-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YuSFIDjSQpzrjdvL021rxGdToEO6kR3Z9NozjsmFG6E9c534dQIRWN7pUhXUeWrkbd9BkkG4kDX5t03544dqeIvObKisIvLHFCSMcc53Wx2ZpuKTGpDnS1FJNnyYsm2BIzszEhbqUJeHazk36wCQe4bXD/0eMWbaHo21HwuHhF71itUr2/mndJSn0u+EiuVi8nJbbCrHyl8WC6+/rBtjrZIujAfaTCUxwLSo4K8OOCpzs7/SOxsERU2dlr8C/mEBmXtubWl9wnX3lGCyOEeyk7fUOUHNPPXc1QVFXJtoHFBr+ecAD0vD4pElqga8wZ8RLiyKbK0jENXfrYQIQVOK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngBQHhHzYDSXDxInPT/ZO6GwWaWtqacFhcURSIfyj0g=;
 b=jKMzDb48EHt3EMm0XyOZBtk28KOMOpxNpCf3kZKIk4foFHbj+Rmd7ubcLZivWEcpJ+yYk053UC8yvSYSk2GJRxnsGRDVkoda5yvp83+4f1DUBYk6Gc9TMWU5MS67jdubADkWS9uC2dDU6V3aSJujvCJBhpvL+OwvXm/j2Vqcez+/OB+gb9iY+dlQCoiJ9QOiaMG0yksQ+Cegv8VaE13IqbiIaEAG5O+0ERJIn0Wi9d+RPxmlS4NQ+h9xcAxD1OfY4oQgXPixAiFaZz2vcX8NA1YmRctSS9wdrssikApTlvcJAivhoOT1YcmQ+c35eRFyn4wa5fVCs7awPVzLWgJ/wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngBQHhHzYDSXDxInPT/ZO6GwWaWtqacFhcURSIfyj0g=;
 b=ARtv/kqz4IiXsKyO5MGpJlOszeZ21TeW4dw7DlGxiKOwgCoLH0mB9M0ucGhg4osr5dv2XHHw0g1Avz8ROJVkV7xeL+osFL8weAQZik5XV6CRHXYb6b9kDNCdDPJ7FQIpg5WBR7aXwmqOyTX1ah9z8zJ3VDkoM8R+Ysa/aaRbXk0MdVPWD5+3xP2cz8RWiT2h/We0A7hIV/5ZNh4xGjF4XC2lqeSlxd0oyh9q2XCeoOxGu9O5AsXF/Rsxg650nMwuV25pctNLVB3mDbKKCk3mDsWME+2MNc+aInMz9Funsku8Kb2m6WyI0TomhClyi6XHjM4E67wjcJHq9S7/iVH3BQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 10/10] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Topic: [PATCH 10/10] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Index: AQHb/KtGOottmVluGE2/cUXO3oie/A==
Date: Thu, 24 Jul 2025 14:57:28 +0000
Message-ID:
 <389568b30da6fdd254c84ab3e2744684998f8112.1753367178.git.leonid_komarianskyi@epam.com>
References: <cover.1753367178.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1753367178.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS8PR03MB8370:EE_
x-ms-office365-filtering-correlation-id: caae49b1-6c2f-4dc5-dc94-08ddcac268e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?qMU2XfvFbZ+rv0xjBZlhmGeGp4JiB79sodMhV7+tvtDcshiycMxr2fa3KU?=
 =?iso-8859-1?Q?UF8su8b2A896WbqneByhhnXzT+2YNMQD54lqQtrqdj9D4Cr3LIsOoZX3mw?=
 =?iso-8859-1?Q?bWop69Eg9Is1CQP4BU79ep9LWX0w5i9Sf8CkFPKUjy7usyXPmRcN6ojbA/?=
 =?iso-8859-1?Q?d+cxCcq6hUVWCp40avB840hRoqWa0BWsnkPyTdb4NpMBEugv39m1s/RHhu?=
 =?iso-8859-1?Q?thmnJ6LmurlMkXI1A7DnrSZEpx0iTnkkGzPw5ME9lCQYe5cWgoxLZP637P?=
 =?iso-8859-1?Q?6vBJBZ7ixBAQZWiBGgN9xkAYIJInXgD86buqNbQPWjW1jnY38WixjD7cLo?=
 =?iso-8859-1?Q?gJhE0Ba0MiL6KOmnVcno6lx/ZjpsEqnjYAU9GSgEcqdkUu1Hr58V7J4Ork?=
 =?iso-8859-1?Q?vHueVT91RlvI95jdIe7kL+x1X2pFee40itLGvjwbqFBPiTTkqweyWheM7Z?=
 =?iso-8859-1?Q?EZ6HWncHUuBlnrRuW1/Lq619P89IkQOuV2O1YAgLyO1Y1nUdUT6V/bQRCa?=
 =?iso-8859-1?Q?B08AuMZJuOoNXmvFRsjZS0ZtA7y5RRwJQZ084ZSzkE4bHc+S3imD5GbWLJ?=
 =?iso-8859-1?Q?Jmznzbr6CPEEpOErJ41D3Ytfb1j2Tr4SfG8s5bWwdOIL3g9qT+RdX79Hhz?=
 =?iso-8859-1?Q?2DulOe2u2+rYUvO+ETfcju8vX1R9uONkyyYioqOH4xYPOnAZ+52h+iqTLN?=
 =?iso-8859-1?Q?FlSr3uPNIW1rRvwQwBhgZDywucBKlehIrPVZ+E0nKDCz9RIHcqYLY1aRid?=
 =?iso-8859-1?Q?g3n78PQUI5DAUFEPNeBtcqUdl8iJr6Mx2nQRC3w805bpGktoQas5mwqzFG?=
 =?iso-8859-1?Q?KQ/O2y4YQPuBP1cxfod5GlWSTu2xupH3VBqqU9F5omHCIUgjeWWlAfRnXo?=
 =?iso-8859-1?Q?iJMoXsWPjuNNhHmhkr4YE+VkXckm5h1OL7KusIRcqJyz86YVAj3yxY1HCC?=
 =?iso-8859-1?Q?oFYxbwM+YQe8UGVMDuVsGdrz8FUvyk4vER8dlOlTiV9xoHxABA7jUfR0Jx?=
 =?iso-8859-1?Q?SPCsjxg9axEtZNMBrB/uinRpBAjlrhrfk+Pg0ItCu11VGuxtc4YXoSPfAb?=
 =?iso-8859-1?Q?xuqovvF8FDB/8qu2OFzlfJohuQFZTnKI7TTKaWqP7/fFSMvnGJ18+r5CEE?=
 =?iso-8859-1?Q?higXbeLZLi9mQNH+zQxrqdwTFB2OVZP0EEuoaJTFf9EJbC3RWg+mthtF2J?=
 =?iso-8859-1?Q?bcB32JSQMwOudZM7w11H2CZ18PpIS1y/o9gighEfhM8EK91i4kpXi92iAl?=
 =?iso-8859-1?Q?zZPivhbtrpwl1f7myIJRLp8ktN8Ss+Rig6oAML0JH8Iov9eM7fQGEu58ER?=
 =?iso-8859-1?Q?hUEBPXq0DyKaCunbkPHFQzAVnAbYtHxKSKSYOLRixUaBbTjadosxGaNodK?=
 =?iso-8859-1?Q?j7VhJaFsO3DvpXyKa8HbVeK3TKHf8sD+yUMANdgqSJ9vWfAAriwXmDZnAP?=
 =?iso-8859-1?Q?uq9L91C492wuK4fYgpyLkepPMOkEtmKmKRlJjQr/T73tmX0iJqOysXuM09?=
 =?iso-8859-1?Q?+XJRH4c4Ws72DYrYV1J2YrkSpLlxyFayBqikgxxag8QA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gi2JNlC55B4ihqOLbqRCHARIRSwGvXsTg0mdlRK/6Jc1sDN8P7DpN5jPsu?=
 =?iso-8859-1?Q?JU3VFiq5UiwAqf6O1+AhKp1t19p3Eef35SPHu3O95CnhnCtlHsZWing0Ij?=
 =?iso-8859-1?Q?/vs1Ze3KNI43LsCCTgV4IknPxE+n9Au8caV1i3JRidBb/yJ8pQiH4Yvsru?=
 =?iso-8859-1?Q?6IwXLj9ifgdBuxnuD+dBsb0xS4ih1hzlrQ5J6c8svdZuNx9taQN2col22p?=
 =?iso-8859-1?Q?jtnLbPwjVfIusN8cnJ4OyIXDi/+Nwc5kpxtqVhW6jIdOGp5tVwP4lYCBid?=
 =?iso-8859-1?Q?hkfR14aS5uN368Sy5yu1j8WkW3xCMyjLNoNAadFuh2zcNtUhRRMSqDmrJ+?=
 =?iso-8859-1?Q?ifpIOYKiYuyHaYzdN4M5mX+XWKYTIBt/crQAen6e30mvnpvBkTfwIoC9Hn?=
 =?iso-8859-1?Q?+wijZEX1oMK95QH5agCm9KD9D3rkwKXT86QGaOPWR8eQOhzX6LxZZd7u0M?=
 =?iso-8859-1?Q?OkdxtKH3tRU3Cx3x/ISG184qJZrX915juy/oGFRSYmVPPap8UnJJsp8uqw?=
 =?iso-8859-1?Q?auwQUMpYVmkDCFdORd48tL/cU4oactQOi8ASIFNAZ7iSr17ssbQjT/rQtH?=
 =?iso-8859-1?Q?koXVKOT/MnMxhNbCqdN11DD2uStpwvNHcKKtsCCgE9f1TFBtbm/5GHq2E8?=
 =?iso-8859-1?Q?t/eO66qbCxlQ+xG8rXVTQZg5me2dYGEmZt2YY2SIGWn8wqFptH2eNyMIT+?=
 =?iso-8859-1?Q?p87ygtnb2XIzONVpqhg2LzfN3zljn82BAUSH72xEet/lK4YUI3sKCFWwW2?=
 =?iso-8859-1?Q?EhnIsH9h4kk+JFnD/NF1nsDe4s4lKkSGCnJWQI1noTI9xU/yAd2DgWeNBB?=
 =?iso-8859-1?Q?v/Fe3W7/cxQ1B8iecqPRH4WCHYSy1bZkT06UtRSo+5qgYjiEx1wYkAkGVD?=
 =?iso-8859-1?Q?v9FvaM2ToUhUIpFmI6mgjT4dL1bz7JE6jeRqsUA4FILhQEsEG6waEuZRAq?=
 =?iso-8859-1?Q?S+2V7trgvjyVDJc6nEAgQNsJgbN/o+vfl9dxlvQj2sl7W+AhfCPr8W+Jlf?=
 =?iso-8859-1?Q?Hf8Bz6/NLBnegkXGJIQ18Q+x3+0hSYojziqG9XPTcIv3YbLOC7zFodCRYj?=
 =?iso-8859-1?Q?7siy8ucveE1Qr/u/Ni3HmfQLHryvkEuyvm1RAtLsWhWw6Y2n/eczaWtaW7?=
 =?iso-8859-1?Q?RERn4AZgq8/ZXY4s3v0N+nkZB1uC9bp4UjF++k4eeF0el1+X6e/G48oCfF?=
 =?iso-8859-1?Q?nmQDrmw3hRoLx8Rv5V1PeyqVzm6pXqIYaEV1KCB+AwNTf0GPPwDWasHJid?=
 =?iso-8859-1?Q?X06/+h4A/wqkkyAC48M4ta9A7JxeH2azmR0tuWpAsSWbbo0LJWLhLIeZ9w?=
 =?iso-8859-1?Q?K0lSFRzFje+NTRqLNL9WNgTOo655YOEffgYqgram5d6xcwtjsKUymM+yMM?=
 =?iso-8859-1?Q?uS84xtSDG/ih8yfUk15UAfShNgidI1vDFGM73+mNtJANTaoBDdsO4R0QQc?=
 =?iso-8859-1?Q?YHr5ZF2xm9K0Ddyld/i3u2fKuue0+6hUWuhHdn7uJ4jBg0Eg5TSeG5ivcH?=
 =?iso-8859-1?Q?Ud+obmMFBFVj6JYv7BvGpvt+54B+fRs3UhdjKOkDwRhbABjKZzBPjav5q0?=
 =?iso-8859-1?Q?ugB5cMMv4xI3RR5er6LlKfRdaHoTO3ujM99h56bL5M6FKeZFBQEHj99CfM?=
 =?iso-8859-1?Q?bTVE4GCRgKFKh0R03Mi8A2X22yphjnxyc4A5y9LG6+8L4v0T9mjRxbJjnl?=
 =?iso-8859-1?Q?LOTEE8za+tU6NwjCD2k=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caae49b1-6c2f-4dc5-dc94-08ddcac268e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 14:57:28.5068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cNra6cdCB+ryCK4g3vwYc5x8UOBhLLHZUkIhIuk+lkHTL4xd72xGch4lySFmXnZ+1Z8UFUpL/9MOTr7mS9bxmZHy+1YLtF2gSrv39GgLLxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8370

Implemented support for GICv3.1 extended SPI registers for vGICv3,
allowing the emulation of eSPI-specific behavior for guest domains.
The implementation includes read and write emulation for eSPI-related
registers (e.g., GICD_ISENABLERnE, GICD_IROUTERnE, and others),
following a similar approach to the handling of regular SPIs.

The eSPI registers, previously located in reserved address ranges,
are now adjusted to support MMIO read and write operations correctly
when CONFIG_GICV3_ESPI is enabled.

The availability of eSPIs and the number of emulated extended SPIs
for guest domains is reported by setting the appropriate bits in the
GICD_TYPER register, based on the number of eSPIs requested by the
domain and supported by the hardware. In cases where the configuration
option is disabled, the hardware does not support eSPIs, or the domain
does not request such interrupts, the functionality remains unchanged.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
---
 xen/arch/arm/vgic-v3.c | 248 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 245 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 4369c55177..26f11ec6ae 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -111,7 +111,7 @@ static uint64_t vgic_fetch_irouter(struct vgic_irq_rank=
 *rank,
  * Note the offset will be aligned to the appropriate boundary.
  */
 static void vgic_store_irouter(struct domain *d, struct vgic_irq_rank *ran=
k,
-                               unsigned int offset, uint64_t irouter)
+                               unsigned int offset, uint64_t irouter, bool=
 espi)
 {
     struct vcpu *new_vcpu, *old_vcpu;
     unsigned int virq;
@@ -123,7 +123,8 @@ static void vgic_store_irouter(struct domain *d, struct=
 vgic_irq_rank *rank,
      * The IROUTER0-31, used for SGIs/PPIs, are reserved and should
      * never call this function.
      */
-    ASSERT(virq >=3D 32);
+    if ( !espi )
+        ASSERT(virq >=3D 32);
=20
     /* Get the index in the rank */
     offset =3D virq & INTERRUPT_RANK_MASK;
@@ -146,6 +147,11 @@ static void vgic_store_irouter(struct domain *d, struc=
t vgic_irq_rank *rank,
     /* Only migrate the IRQ if the target vCPU has changed */
     if ( new_vcpu !=3D old_vcpu )
     {
+#ifdef CONFIG_GICV3_ESPI
+        /* Convert virq index to eSPI range */
+        if ( espi )
+            virq =3D ESPI_IDX2INTID(virq);
+#endif
         if ( vgic_migrate_irq(old_vcpu, new_vcpu, virq) )
             write_atomic(&rank->vcpu[offset], new_vcpu->vcpu_id);
     }
@@ -685,6 +691,9 @@ static int __vgic_v3_distr_common_mmio_read(const char =
*name, struct vcpu *v,
     {
     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+#endif
         /* We do not implement security extensions for guests, read zero *=
/
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
         goto read_as_zero;
@@ -710,11 +719,19 @@ static int __vgic_v3_distr_common_mmio_read(const cha=
r *name, struct vcpu *v,
     /* Read the pending status of an IRQ via GICD/GICR is not supported */
     case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+#endif
         goto read_as_zero;
=20
     /* Read the active status of an IRQ via GICD/GICR is not supported */
     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
     case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+#endif
         goto read_as_zero;
=20
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
@@ -752,6 +769,61 @@ static int __vgic_v3_distr_common_mmio_read(const char=
 *name, struct vcpu *v,
         return 1;
     }
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE, DABT_W=
ORD);
+        if ( rank =3D=3D NULL ) goto read_as_zero;
+        vgic_lock_rank(v, rank, flags);
+        *r =3D vreg_reg32_extract(rank->ienable, info);
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE, DABT_W=
ORD);
+        if ( rank =3D=3D NULL ) goto read_as_zero;
+        vgic_lock_rank(v, rank, flags);
+        *r =3D vreg_reg32_extract(rank->ienable, info);
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    {
+        uint32_t ipriorityr;
+        uint8_t rank_index;
+
+        if ( dabt.size !=3D DABT_BYTE && dabt.size !=3D DABT_WORD ) goto b=
ad_width;
+        rank =3D vgic_ext_rank_offset(v, 8, reg - GICD_IPRIORITYRnE, DABT_=
WORD);
+        if ( rank =3D=3D NULL ) goto read_as_zero;
+        rank_index =3D REG_RANK_INDEX(8, reg - GICD_IPRIORITYRnE, DABT_WOR=
D);
+
+        vgic_lock_rank(v, rank, flags);
+        ipriorityr =3D ACCESS_ONCE(rank->ipriorityr[rank_index]);
+        vgic_unlock_rank(v, rank, flags);
+
+        *r =3D vreg_reg32_extract(ipriorityr, info);
+
+        return 1;
+    }
+
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+    {
+        uint32_t icfgr;
+
+        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE, DABT_WORD)=
;
+        if ( rank =3D=3D NULL ) goto read_as_zero;
+        vgic_lock_rank(v, rank, flags);
+        icfgr =3D rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGRnE, DABT_WO=
RD)];
+        vgic_unlock_rank(v, rank, flags);
+
+        *r =3D vreg_reg32_extract(icfgr, info);
+
+        return 1;
+    }
+#endif
+
     default:
         printk(XENLOG_G_ERR
                "%pv: %s: unhandled read r%d offset %#08x\n",
@@ -782,6 +854,9 @@ static int __vgic_v3_distr_common_mmio_write(const char=
 *name, struct vcpu *v,
     {
     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+#endif
         /* We do not implement security extensions for guests, write ignor=
e */
         goto write_ignore_32;
=20
@@ -871,6 +946,87 @@ static int __vgic_v3_distr_common_mmio_write(const cha=
r *name, struct vcpu *v,
         vgic_unlock_rank(v, rank, flags);
         return 1;
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE, DABT_W=
ORD);
+        if ( rank =3D=3D NULL ) goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        tr =3D rank->ienable;
+        vreg_reg32_setbits(&rank->ienable, r, info);
+        vgic_enable_irqs(v, (rank->ienable) & (~tr), EXT_RANK_IDX2NUM(rank=
->index));
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE, DABT_W=
ORD);
+        if ( rank =3D=3D NULL ) goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        tr =3D rank->ienable;
+        vreg_reg32_clearbits(&rank->ienable, r, info);
+        vgic_disable_irqs(v, (~rank->ienable) & tr, EXT_RANK_IDX2NUM(rank-=
>index));
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISPENDRnE, DABT_WOR=
D);
+        if ( rank =3D=3D NULL ) goto write_ignore;
+
+        vgic_set_irqs_pending(v, r, rank->index);
+
+        return 1;
+
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICPENDRnE, DABT_WOR=
D);
+        if ( rank =3D=3D NULL ) goto write_ignore;
+
+        vgic_check_inflight_irqs_pending(v, rank->index, r);
+
+        goto write_ignore;
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+        printk(XENLOG_G_ERR
+               "%pv: %s: unhandled word write %#"PRIregister" to ISACTIVER=
%d\n",
+               v, name, r, reg - GICD_ISACTIVERnE);
+        return 0;
+
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+        printk(XENLOG_G_ERR
+               "%pv: %s: unhandled word write %#"PRIregister" to ICACTIVER=
%d\n",
+               v, name, r, reg - GICD_ICACTIVER);
+        goto write_ignore_32;
+
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    {
+        uint32_t *ipriorityr, priority;
+
+        if ( dabt.size !=3D DABT_BYTE && dabt.size !=3D DABT_WORD ) goto b=
ad_width;
+        rank =3D vgic_ext_rank_offset(v, 8, reg - GICD_IPRIORITYRnE, DABT_=
WORD);
+        if ( rank =3D=3D NULL ) goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        ipriorityr =3D &rank->ipriorityr[REG_RANK_INDEX(8, reg - GICD_IPRI=
ORITYRnE,
+                                                      DABT_WORD)];
+        priority =3D ACCESS_ONCE(*ipriorityr);
+        vreg_reg32_update(&priority, r, info);
+        ACCESS_ONCE(*ipriorityr) =3D priority;
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+    }
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE, DABT_WORD)=
;
+        if ( rank =3D=3D NULL ) goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        vreg_reg32_update(&rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGRnE=
,
+                                                     DABT_WORD)],
+                          r, info);
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+#endif
+
     default:
         printk(XENLOG_G_ERR
                "%pv: %s: unhandled write r%d=3D%"PRIregister" offset %#08x=
\n",
@@ -1129,6 +1285,16 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
             typer |=3D GICD_TYPE_LPIS;
=20
         typer |=3D (v->domain->arch.vgic.intid_bits - 1) << GICD_TYPE_ID_B=
ITS_SHIFT;
+#ifdef CONFIG_GICV3_ESPI
+        if ( v->domain->arch.vgic.nr_espis > 0 )
+        {
+            /* Set eSPI support bit for the domain */
+            typer |=3D GICD_TYPER_ESPI;
+            /* Set ESPI range bits */
+            typer |=3D (DIV_ROUND_UP(v->domain->arch.vgic.nr_espis, 32) - =
1)
+                       << GICD_TYPER_ESPI_RANGE_SHIFT;
+        }
+#endif
=20
         *r =3D vreg_reg32_extract(typer, info);
=20
@@ -1194,6 +1360,18 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
     case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+#endif
         /*
          * Above all register are common with GICR and GICD
          * Manage in common
@@ -1216,7 +1394,11 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
         /* Replaced with GICR_ISPENDR0. So ignore write */
         goto read_as_zero_32;
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(0x3100, 0x60FC):
+#else
     case VRANGE32(0x0F30, 0x60FC):
+#endif
         goto read_reserved;
=20
     case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
@@ -1235,8 +1417,30 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
=20
         return 1;
     }
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
+    {
+        uint64_t irouter;
+
+        if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 64, gicd_reg - GICD_IROUTERnE,
+                                DABT_DOUBLE_WORD);
+        if ( rank =3D=3D NULL ) goto read_as_zero;
+        vgic_lock_rank(v, rank, flags);
+        irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTERnE);
+        vgic_unlock_rank(v, rank, flags);
+
+        *r =3D vreg_reg64_extract(irouter, info);
+
+        return 1;
+    }
+#endif
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(0xA004, 0xBFFC):
+#else
     case VRANGE32(0x7FE0, 0xBFFC):
+#endif
         goto read_reserved;
=20
     case VRANGE32(0xC000, 0xFFCC):
@@ -1382,6 +1586,18 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v, =
mmio_info_t *info,
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
     case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+#endif
         /* Above registers are common with GICR and GICD
          * Manage in common */
         return __vgic_v3_distr_common_mmio_write("vGICD", v, info,
@@ -1405,7 +1621,11 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v, =
mmio_info_t *info,
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
         return 0;
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(0x3100, 0x60FC):
+#else
     case VRANGE32(0x0F30, 0x60FC):
+#endif
         goto write_reserved;
=20
     case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
@@ -1419,12 +1639,34 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v,=
 mmio_info_t *info,
         vgic_lock_rank(v, rank, flags);
         irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTER);
         vreg_reg64_update(&irouter, r, info);
-        vgic_store_irouter(v->domain, rank, gicd_reg - GICD_IROUTER, irout=
er);
+        vgic_store_irouter(v->domain, rank, gicd_reg - GICD_IROUTER, irout=
er, false);
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+    }
+
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
+    {
+        uint64_t irouter;
+
+        if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 64, gicd_reg - GICD_IROUTERnE,
+                                DABT_DOUBLE_WORD);
+        if ( rank =3D=3D NULL ) goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTERnE);
+        vreg_reg64_update(&irouter, r, info);
+        vgic_store_irouter(v->domain, rank, gicd_reg - GICD_IROUTERnE, iro=
uter, true);
         vgic_unlock_rank(v, rank, flags);
         return 1;
     }
+#endif
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(0xA004, 0xBFFC):
+#else
     case VRANGE32(0x7FE0, 0xBFFC):
+#endif
         goto write_reserved;
=20
     case VRANGE32(0xC000, 0xFFCC):
--=20
2.34.1

