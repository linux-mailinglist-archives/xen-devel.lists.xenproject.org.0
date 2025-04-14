Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D29EAA87C59
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 11:51:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949485.1346010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4GTK-0006LZ-Hr; Mon, 14 Apr 2025 09:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949485.1346010; Mon, 14 Apr 2025 09:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4GTK-0006F9-E4; Mon, 14 Apr 2025 09:51:22 +0000
Received: by outflank-mailman (input) for mailman id 949485;
 Mon, 14 Apr 2025 09:51:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qHXw=XA=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u4GTI-0006C8-Kb
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 09:51:20 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061a.outbound.protection.outlook.com
 [2a01:111:f403:260e::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03f79f7f-1916-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 11:51:19 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB6872.eurprd03.prod.outlook.com
 (2603:10a6:20b:294::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 09:51:15 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 09:51:15 +0000
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
X-Inumbo-ID: 03f79f7f-1916-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezpq3xkgoIJ3LcQ5OcA2VWMP8axnTD2P0e7WQRt7iSRfHubGFByGaQ6TWCqxlGffFkgu8KSm4z97wiQ380eZ6v+ti1CeZtqYd2b9R6qS7M1BDvpBu+zXyn71cbL6o94bjXZRoxvIoGZ0HUZuBq7CA0bwTb3tWqchGcGIwmaZLiYiJRjkhfEWr8rgwGdQ3uuIh+o59Ikw2ATKyR5z6fPuI2xcuZ9yHmwIKsZxzre6uGzcIOqH3xpT9Y7aNipU6Lt6vnc7NkBYUGqhDH229NlRigI7ZWRvqtEHT+IjqOowTEFmEntcXztsVp/71foU01EK8MQvzj4PUNPAU7gTkZcKfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+vR8dRTwJ+Uk8oCJ0o0/7hbQ9YNMpt9YztKzxqFNpE=;
 b=AJ1pSWiP8qcehQ6Zg+sU257L3gKnCqwyKg2IXI445CI7ZMsjjn7vZCM4yHkKuy8QQPOqusUZHmeZHh8hgDlYOFS7Su67j8l3xxNuXm8xAA31HPasUwuv/0LWVJaeuQcWDevxln5HgIhbEmwpFIfDPScWmoyuMXg7nPZpmB8dSidX4DUVXUWd8VZGrcNidWhZkR0PjRP38OID7hm/yxFIk5j2VkZnADYnQBKoxfIpzABbYBZJdB2MGvVhDPyaxG1nkYb94dp221EMOXhsxtStlyfSsCHSOaYG37cpVzPC9hJnKPpjtVwaZskV8nHMI92GH8pB09iiVDdp4zborcqo2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+vR8dRTwJ+Uk8oCJ0o0/7hbQ9YNMpt9YztKzxqFNpE=;
 b=cYdUNIOkXt3B6NhLw2tQMhA+FKkZbcjjBC9qsDuL/qP58J4NTubVVHDd81Y/C+k1pAzBs4od5B7Xli12fxodPETO/D/7j75j3s9w5Ro1r555ZEJvq2vJPlU0mIgc1qU0fembM/XpdAt08L/X1VwsIxOEXf6sfPS/JE9z1gnr0a29IJutCJn4ieT8vD59rucSA+3H4R30JW3E6XPvzhCEJSNn+41EnG0NtDfa0ueq/m4lqVNFcCVZWCR/rzvbKjREPNlVIkcBKaM4lNfFBG15JQJ3A6HHSPUI80I3TwGfzBJuHLiGtyRvixcISbgh1e96UtkByqS55oPNjhZMiCB1xw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v2 1/2] arm: vgic: Add the ability to trigger MSIs from the
 Hypervisor
Thread-Topic: [PATCH v2 1/2] arm: vgic: Add the ability to trigger MSIs from
 the Hypervisor
Thread-Index: AQHbrSLDj8+kM3eLrkyegn+x6Pj4JA==
Date: Mon, 14 Apr 2025 09:51:15 +0000
Message-ID:
 <3dba1b51984f24e36d5fbd81396ab7dd53d8ac95.1744621166.git.mykyta_poturai@epam.com>
References: <cover.1744621166.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1744621166.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB6872:EE_
x-ms-office365-filtering-correlation-id: ed3fa4f8-0175-4168-4c3a-08dd7b39e5fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?350i9P1tHmLqHNSITUqD6QajRUgIrX+mfuEiivy3heQqEYHpujU3TXu7S3?=
 =?iso-8859-1?Q?guZpeKRhJweZgxXLBNJDACtLggujJVQz1OY4qfc3m92lW3ysJxSm0QnMas?=
 =?iso-8859-1?Q?IODF64ybQI7BjdiqaEi2R9nhT8pnBeJQSmfDb23FcinXZrUMXth7dE7cpK?=
 =?iso-8859-1?Q?O7bBcgerd7i5+rLw3XLIurJAgALUrgjGbI5B33yYN0Llc//woOGxkdqUXx?=
 =?iso-8859-1?Q?kZwWNS0PVgIBiLZVxxRPn8eVesmm7+FAz61nK0xVAH4wxEu/hYfhaTVBEy?=
 =?iso-8859-1?Q?g9/+EcvKHfuHhE9a0acEHQFJHWtRrsNVdtLHjSxosVUEzcPzc3Ja8wuggs?=
 =?iso-8859-1?Q?OzJp89p117i1PPoqeJdwlTfFcL8yuoYUq5Q/TvBH5M8dVHhueTtUWIwyhi?=
 =?iso-8859-1?Q?LxvR2SImWzsH+z2EHH7eClOHOrbyJ+Qv9AuARPVNU+s4Yfs+hT1Hr4mP3V?=
 =?iso-8859-1?Q?EnzCA6M3EBn+6BM0i+4M9r+BOLNo09qt/DbYdo82xYk2vyappDuQNn5s1G?=
 =?iso-8859-1?Q?MfRquipDTg/M282W4dvJuTeNKfd8u+hkT1SyFb2X9Wc9TCfsrHa62WUf8p?=
 =?iso-8859-1?Q?5j9WS6EP2fXpaVsruPHwqPUnCk2yetWFYfV/qGbxoWYa5s/NN6RznyBzfr?=
 =?iso-8859-1?Q?ZrCjGUwIyl2rkF5vpt5ldEWMD55O4J45BzWkEeghFs4nXjn0rCb/qijcBR?=
 =?iso-8859-1?Q?pCFbt+RgXjrNWxYRuo6o6M95N9bkdzOOHMG0fsP0Hkufo86bnCxoDZAusB?=
 =?iso-8859-1?Q?l+osGJgAtw2WzWlU3Hg+hFZXfE/xMv5TqNW87Q3L1z+O+mkcUvbOkFdIlp?=
 =?iso-8859-1?Q?wYIOZCHcKng2sUJVzQc3rLiuCkJW7W2ErK9ju+rZEQgp2VQBlGz3aee0VP?=
 =?iso-8859-1?Q?MxGTI+E/8v/0HHJJ3+G+jMk6ecF9V0l4PhjpiGF4MuE0XbejooTkXSpfSq?=
 =?iso-8859-1?Q?KGmdAvzy267cFX0SxklxRrZamrV3XQGOldXpK+ngZqmYm3CJtDH7jNlyW6?=
 =?iso-8859-1?Q?qtTIC5fDr9B8Olt5obaD962SRM2WipZHVvTFlf473gzTsRG9w76yuB9lre?=
 =?iso-8859-1?Q?yMsekiGtqaIViKgSkge9q5ph6lMoXpBvWSJ1Vi0GFz+g5kmZmHjmI0cmJb?=
 =?iso-8859-1?Q?veEbTFAyta2A52QJ5Vq6VYe6o0YwInDXAaJq6T9ogCv23o4iKPdD0nzOa+?=
 =?iso-8859-1?Q?fZP4aWQIAMgdQ48mjgxbQSVgFbMTsUDEuqYtq+ODlNdCQLYm7sbiv20JlU?=
 =?iso-8859-1?Q?oVOkn15TClRkwXCv3BFWu8yJFupQv5NNcPOuog6AkhqbQ6fh6nZnL1euDB?=
 =?iso-8859-1?Q?bOsdbmu6eUeeagDwEhEltHzq1ItKTOJ1jr8CtvP8EeDW8sBU4hf96j80jo?=
 =?iso-8859-1?Q?jEJtoIZaSIGAJ+kQMqFcBg64t+AvJMlZ9EnES/k5wjK1ua+EfHSnznxc7a?=
 =?iso-8859-1?Q?fP1oLSnAd9sAu5EEL2t17nJWB6UB5wmIDJ8ADLpXwp2WHOB7ZoOxothQTw?=
 =?iso-8859-1?Q?+rwiWABQ5IwRkEPiF2ExBiA5e7uwenXRsUEgp7sxtG7g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TYi35JLBSO1NTgJilvIwsxjevbQZZnt1EFeet7whPPNhsbP+3HuaWP2fG+?=
 =?iso-8859-1?Q?cuDoU4ofAFUf1VVyjKXpqppeQRrRkbVrU7nCep66rV4lGvEc8RixknDdfU?=
 =?iso-8859-1?Q?pJFso4C3MLOt/Y2rQdXlN2OdjqG45pkHJGhb946HSgcixTo6Tttn/Knc9T?=
 =?iso-8859-1?Q?EYWuhsBo1ZqobvqrCsg8LfNknP2BjYh7aYUUtrpkoJyj/DbW6GG8XrdOYK?=
 =?iso-8859-1?Q?6NRUJwsETGRCz6w8mBydlFyseeY9ZIxN2blp73i6OiBuhv0HXSv2q/CV7S?=
 =?iso-8859-1?Q?zcVjjc3cri1MO7CX0YB9jagYTpsM0jFw1TQPWZUp/yovIJsuIwS+uDbbqk?=
 =?iso-8859-1?Q?rc24gNuSZwkjxTztRIgrWttB/ZlzvRJU4WTrsXHJOfenBJtU8wHiGhVC14?=
 =?iso-8859-1?Q?MDXLxQEX/eD57aHPV5bNvWht6aU0ASPNjIblZJsRdJ8pj7EXBsvl6/VTzr?=
 =?iso-8859-1?Q?R0ai5GIr3SMIxguSO6vJzC9ZyNn2vNXVTImjdYTLwrKaikeNHZw8+72fuQ?=
 =?iso-8859-1?Q?pUIwi2fQNYBu/H8x7lro+qb/SsmbUjryuxjL4omYnQ4158vb11Zw/WsY5x?=
 =?iso-8859-1?Q?UKMp8msHspycZt7/rhlOpkUP67CG+8dCW2AyW8njcC9e1+PHxG8dUumqrc?=
 =?iso-8859-1?Q?LBjCe0URMhti66iEauahIxIlutW2Fcs7h/jWEc7t9vBukiK0FCuEpQshMD?=
 =?iso-8859-1?Q?DvuIBHi9zR0SBd/2KIwFZd6X4H2IwxzzYHLN+i7pqCQHK2Lica/8IN6YVI?=
 =?iso-8859-1?Q?F4pjE7B10UWF9vuDte5myDjuGS+AhXa8r16f2EnnfY0yhZfqgYLeQBQ4sQ?=
 =?iso-8859-1?Q?J4YstOWEDSq9JdnJEdjKFiVYmDq8SBgZGaPMPDMKBVDZl8rO3/anmMCprf?=
 =?iso-8859-1?Q?ec44B8v5PqUtp5XnIxSgOIzTuj1BjUTtX1lo9Ga1Stp3xNXfs032krQg9P?=
 =?iso-8859-1?Q?IWYafE3xEJzxhU8XEJAHmt7EzJ6LItWxrXI+bdD2rx+vkaVBhqnQLn/Fde?=
 =?iso-8859-1?Q?/eKRayRfgXh9R+L+YaV1gvKU0VX7BWH132C19XV2Kr0Vkpmfx8oPc4EUgg?=
 =?iso-8859-1?Q?2oxrNV76DokowdX1k6zped+8zbRNi/ToBbStRjm2nxzLkKXnI5dK+7zDtb?=
 =?iso-8859-1?Q?EcEdWvkIKPxtjIETau1N37Rw3+TpAyoUHNUEjYIVz2AKrdweWiB81vfDNk?=
 =?iso-8859-1?Q?SPysN+vo885OWzeL3e0kB+NA+2tghNUiCtT35moCjT41BOpp9WUwFVGvwn?=
 =?iso-8859-1?Q?suHMgLep4CswwnViZqgMUdCWcghUfiBLjrDbleFAd+xlKhh3MSFTH21RnG?=
 =?iso-8859-1?Q?tFVxgpPvPf9t+ASqgPnRjhByGi0Swh+oRlys09Biy9EJqSjSUgyeoUBiPf?=
 =?iso-8859-1?Q?XkfoeBkQ2RA1BHXEFGkQxuluHSeqYIrum8QtoOO5zuwm2iNaCoOzBEsrKQ?=
 =?iso-8859-1?Q?yxsLlM8T/DB5Kp1NZMg0CvODNxlMzp0BFrUx/IaCOMCqkqVP/mPexsZ980?=
 =?iso-8859-1?Q?tGHO0uoERsdIQMRmX00Xv4b7U481ZHJWb1w6e6guF8sQDZJ2V3DK/AAO2u?=
 =?iso-8859-1?Q?x8714GRo1xVGahhwPj0daC1pRPO0tjXNHdv6o+wfwm4unVf9tTn3+vbehe?=
 =?iso-8859-1?Q?WtnGV+woxDtdMofLGZW8bwJi2B+4H6mjE/ZN+rkY1bNr22ukzyBcdzZw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3fa4f8-0175-4168-4c3a-08dd7b39e5fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 09:51:15.7913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ez8qfmnrv1AQV4QRm+FRt4LeTPzMJJEROla4dUrZeUtBc80w/ApJugkVKA1hKg0af92x46I0jie+LGf0jLKx8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6872

From: Mykyta Poturai <Mykyta_Poturai@epam.com>

Add the vgic_its_trigger_msi() function to the vgic interface. This
function allows to inject MSIs from the Hypervisor to the guest.
Which is useful for userspace PCI backend drivers.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* replace -1 with -ENOENT
* reduce guest memory access in vgic_its_trigger_msi
---
 xen/arch/arm/include/asm/vgic.h | 11 +++++++++++
 xen/arch/arm/vgic-v3-its.c      | 19 +++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index e309dca1ad..3d8e3a8343 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -318,6 +318,17 @@ extern bool vgic_migrate_irq(struct vcpu *old, struct =
vcpu *new, unsigned int ir
 extern void vgic_check_inflight_irqs_pending(struct vcpu *v,
                                              unsigned int rank, uint32_t r=
);
=20
+#ifdef CONFIG_HAS_ITS
+int vgic_its_trigger_msi(struct domain *d, paddr_t doorbell_address,
+                                u32 devid, u32 eventid);
+#else
+static inline int vgic_its_trigger_msi(struct domain *d, paddr_t doorbell_=
address,
+                                u32 devid, u32 eventid)
+{
+    return -EOPNOTSUPP;
+}
+#endif /* CONFIG_HAS_ITS */
+
 #endif /* !CONFIG_NEW_VGIC */
=20
 /*** Common VGIC functions used by Xen arch code ****/
diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index c65c1dbf52..be5bfe0d21 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -1484,6 +1484,25 @@ static int vgic_v3_its_init_virtual(struct domain *d=
, paddr_t guest_addr,
     return 0;
 }
=20
+int vgic_its_trigger_msi(struct domain *d, paddr_t doorbell_address,
+                                u32 devid, u32 eventid)
+{
+    struct pending_irq *pend;
+    unsigned int vcpu_id;
+
+    pend =3D gicv3_its_get_event_pending_irq(d,doorbell_address, devid, ev=
entid);
+    if ( !pend )
+        return -ENOENT;
+   =20
+    vcpu_id =3D ACCESS_ONCE(pend->lpi_vcpu_id);
+    if ( vcpu_id >=3D d->max_vcpus )
+          return -ENOENT;
+
+    vgic_inject_irq(d, d->vcpu[vcpu_id], pend->irq, true);
+
+    return 0;
+}
+
 unsigned int vgic_v3_its_count(const struct domain *d)
 {
     struct host_its *hw_its;
--=20
2.34.1

