Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B3EB1DD16
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073357.1436432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P9-0003n4-D8; Thu, 07 Aug 2025 18:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073357.1436432; Thu, 07 Aug 2025 18:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P8-0003QR-9e; Thu, 07 Aug 2025 18:31:54 +0000
Received: by outflank-mailman (input) for mailman id 1073357;
 Thu, 07 Aug 2025 16:59:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3xq-00076W-3y
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:59:38 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e55ca74e-73af-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 18:59:35 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by VI0PR03MB10757.eurprd03.prod.outlook.com (2603:10a6:800:267::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Thu, 7 Aug
 2025 16:59:33 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:59:33 +0000
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
X-Inumbo-ID: e55ca74e-73af-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFpuBRn7HLjnX5gNJT2PBswLUn0uuw7Qph+u/FMkZJMti14v9V+HovCntAw4rtgawedSxbRWvPGLkIYxGi/cOH098vThCdzA88j+ygOn+OfSw1Xmwl0BNRdFh2yTKfxgNyxWKG/pa8KtVPUbkVyJB7V+TUh7Vs+wbXlVl5tpqtw6YDIxE9jsiA87l3J0NDc2qgPkthVgWdxf2xCn5GLn9Ydk5F+4jMPuP3BIIboY+Mh9opcEyj8VB7wKRI4KZBJSrUxAADS/YleIpyMClnYVPJFqptTDKpXQjPy1ExxjNlPWhUZ4E4S7HNxHIbdxqo2wuuQyYIbCRVnYmPHDRqSbBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRKz4SORhM6Udu82OMwS2LwE/KWoTxc6MuWquW1TEVY=;
 b=x+Ow/p2AmEa+cP+GEbILxHSTJCGsrnaPuXgtn7ipyXVAMgFfvSdT5XSBQcuKyYZybfmfAgApebkYCgrPl1qhtp2Aeve/VUCeu5qOhFW1YMII4sg3bx3k973wop3tVi8PVDPDfLanBe5vY+iiQOMsC59wG6QjAX+j6HNhbaxuozBgNdVYt4wV0TiTOWYw4vTs7hi6nlXQ6Q2+Ao3EHWAdrjgrcP4bi6La33eBBDvbM+EiS0WDkTpTkFU5iTQGEykUItoGpOtcfRUialKT9D1HoZUkViWntf86aoEWme5ZZMDVwQqdDSrZXabXG5bTw+fyQDbjlsZiWVeEbwTvApa1Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRKz4SORhM6Udu82OMwS2LwE/KWoTxc6MuWquW1TEVY=;
 b=LGsOaPVhOhCZC8YEP3kljAZKFyAC09y7eq2359+MWDnXKU7x8CD9auq//yvUosMytBAoGmqf3TUEpSuCyUxDAnGTs+YiPA+86KAmTlZ1GE9LIZhBFxxEZUcVUZ2nmAB4hYPchY9jDBkCnUjCLRbh2PKeDDia6hnxeIYnz07b7Uj8OizEYaeebkeHNt4YHWYf3N8ylLA7D7rcxzs5YPe1xx4CA0w618L3KnWfbegNUhR4GId0ywZ9FQuJ7u4AMla5PcZ1drNTklpUysBl5FPkW8ME7WSAEEedSe3Ow0ES5+/HjOzEURHDpPAXITjesEQFy7T/Kqgfgx6CtiEC/fa2cA==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH 18/20] xen/arm: vsmmuv3: Add support to send stage-1 event to
 guest
Thread-Topic: [PATCH 18/20] xen/arm: vsmmuv3: Add support to send stage-1
 event to guest
Thread-Index: AQHcB7ylYt7xb8ek2UKgm42MUihrsg==
Date: Thu, 7 Aug 2025 16:59:33 +0000
Message-ID:
 <0ca83cfb5d360d80813fc4ebbd3b038a3195cdd1.1754580688.git.milan_djokic@epam.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
In-Reply-To: <cover.1754580687.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|VI0PR03MB10757:EE_
x-ms-office365-filtering-correlation-id: abb1c569-035c-40fc-a5fd-08ddd5d3c863
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?xjCu5XOMhJFyizGpQNV5v4FQbKclPggDRA3zWqR1A8kw/Wg1huIw1SO1LU?=
 =?iso-8859-1?Q?bZ2k3wqM20hwS8yL5YO527XaqawcdQtkmvDJWu7aqpFQKbvzGBujgrjkwv?=
 =?iso-8859-1?Q?uo728EELxF+kxfBLt3PpuzbTWA2MK/CvOMlMozMOmBCKJ5UJBrQK2xyE9U?=
 =?iso-8859-1?Q?YdwvSu/6Ug9Mw+VqXZ8pZv0lMUxwTm+Le3cJdOrBh9fPzmhPmW2PAz51F8?=
 =?iso-8859-1?Q?yzZZPieqGfVKdnL8hFxx1x6iaRDWX9/tmFb9625FMKvMGn1Zc6/DagnBNR?=
 =?iso-8859-1?Q?LYNLX+CAyf7e6XaqJ0Y0Wr3jhA5eYjD2kE4F5hPhArShy1KOd+sze2lEY7?=
 =?iso-8859-1?Q?nzF1z5SuRLmMHFd1uWufmOLCbrNK4/jEI4JiRBOQWC/lGcoDVVNaHKXxTj?=
 =?iso-8859-1?Q?kMOEQQeGWXwbQKtBoiVYC7tCIbNRblrb43qoaysthdY8zn8OXc53GafqoO?=
 =?iso-8859-1?Q?f7aInloj1pVHffFDNNfX8XVVYQQ4Pw36RKfBE7Lv44197P+wQTAkhQu+F6?=
 =?iso-8859-1?Q?JVS3tp/E0ywasNdtbqktJpRv0T5xWMqHPFQuy+phMFjZzdQ4WaPhVLAyTr?=
 =?iso-8859-1?Q?1DzwSv7e200tlNglvVLee9kRvE1/Z7M/NV5K9dA+xUQ08lsTi3ShVNtxY3?=
 =?iso-8859-1?Q?/snalATBXoIHmM8YxyfseNk3q/pGAGM3F9cludzT+mro4b0ZfCrAFEzHqr?=
 =?iso-8859-1?Q?3piC4F+uWa4XtZgKBx0Jep4X/KR+8BIX11IDrbM85eJE5bzUfhbNXEaVsM?=
 =?iso-8859-1?Q?dPQC+PqXuN8wn0sV64Zjpt4n/WmNLgUcHYjk/SJIS4GOS54hHXGJ1hZafc?=
 =?iso-8859-1?Q?UdCVsV9GSctYTyegKGIbFuE2jFgaCNWpJhfYWrTXuLkvpZEKiNlzHe9EUH?=
 =?iso-8859-1?Q?fGZldpnjNti1FOHbxGhZYXB+xNGIGEfS+hWtDDPio/Ml9h3/OaeHTDfP1A?=
 =?iso-8859-1?Q?a8ouzsdC6HVJLZMgA31QHrO/sarfo/KUCeO2qhsX7/0kIIu3kaO4qjIzbi?=
 =?iso-8859-1?Q?5L2TynbPqqC/81sYEMG+l5L0IkKlLvL1ZmprVsPja/wB4guZJu81b/Pttf?=
 =?iso-8859-1?Q?hx+DIuvCfdizJ3770kq/pNqyFqWqlF936C/mg+9oIb1BqyK9MFGy7WE1E8?=
 =?iso-8859-1?Q?EAX3WQ2zPS0KWZP3+CT5FDfutHJkmRf/dXIxcMaW88sh5CR0zqy/BtNAeP?=
 =?iso-8859-1?Q?RPe0t1ELWgMXPcuUTpJJH6hDNr16p5xNHXrY5lTQw0wV+FloPC0cBF/D4W?=
 =?iso-8859-1?Q?cNIsAr7wWgiSwkTtXDzfRiyEWROOyEp7gPUvFZz1M7NlXweDYITUWDkd3a?=
 =?iso-8859-1?Q?9EA2eDVtxFIkQYCPenCRvRrCWxe7Y0RReeLUdejyb2OkRnCEVO8+/ybhKA?=
 =?iso-8859-1?Q?er3Z25FOFhS/EV2+kgZYYwVwQMvHpxuXkx9NGJ0IrNE5LgnZZC5fZ41jDy?=
 =?iso-8859-1?Q?MqjvgdfK0gLoqzC6YdhZz6C7KpLUETWjpD6tyVu2cE8o5z8C9LXtsp+gSJ?=
 =?iso-8859-1?Q?6E24QKEK4iW3X5QWsMWFhwFeyHF7li9eMQ3YTxO3OnRw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?c+VQZ7GYqMN7NcWxL6gGgcUiOdX0igjKbD6ErubDr8epbuuq4zcVbGbqL+?=
 =?iso-8859-1?Q?ZTh2DWFjz+nLyNjJZYapG8N6y+DPd1QZrzflGnxXyIA0wzWbud6UngYxTh?=
 =?iso-8859-1?Q?obNSVXfhoKhUyRU5iSZRJOf3sF7MMsoFJO51DNdYLnSNjxqkMwg0zZQT82?=
 =?iso-8859-1?Q?hrV1N4MC4om4g0rg/xGC0Ljwhd9Wpors+5EcMvVw6/b7luroJRwx7rj9H4?=
 =?iso-8859-1?Q?6aEbyH4yi4uanK/SSDFM4EpzvgXey5OP0ir5ubIIsN8dllf2QoFxvil/go?=
 =?iso-8859-1?Q?NB6omKoQKpf56WsT0QWC/UTcw81tyP21jXLSyB7EqNxtL4gWcBMO7HLZd/?=
 =?iso-8859-1?Q?SBAij6+Vfx45szWiVCkn68WZxRORaBAZK4oV9uTBCLKfAXiXFxBAbiFi2E?=
 =?iso-8859-1?Q?kyJIAIFHybftur8Gs/JLhoKZTDdvGR6MUnVTZ0bA3I+WZJKhR8ajbX0Lnc?=
 =?iso-8859-1?Q?zggizehem33dSltbf+xTAdK4/+KIQ4SPtJPR6dLrk8hDI1Ocb5RixihhVK?=
 =?iso-8859-1?Q?R/2gP8Woo+4VFThsrGKfOsfvW6P04wBHecByQg1ayU3QZEQQf6ApIyd706?=
 =?iso-8859-1?Q?ely3uMN0dkeN3qeUs6v3IJoFWwJcQyFySbTr5Cdlxldzh8/Uy4yqrpWoEF?=
 =?iso-8859-1?Q?hrxquA6E8MQ9/q8u/3IrBeAgaBmIb2dz+HchzdfDExYmT1kPKkJkyhh70O?=
 =?iso-8859-1?Q?9Mo0IO/0vBbKZYD4Puk3idnA36Bd2YwK/TNSJK845WiES/OzocwoUqFK6m?=
 =?iso-8859-1?Q?gwOzOOPapRQOlmQrLWfL0AmXDXo4VS4HBWsJsMAbGGn5MVKEg1HFs1Jc9/?=
 =?iso-8859-1?Q?u1Z0He4gV8SwxnjDZsrMxGIcoszl3pVzScbrsckyVB2ySgHPKe7MAgxXnq?=
 =?iso-8859-1?Q?Xl5JPq3I5iVebFYPhUYztP8LzNV/PpH2wiBIyY3q+ED7nTvWClaAQBqoYV?=
 =?iso-8859-1?Q?UeP6jA+ZqWBv4vSiqaCwRRNVxjGHy/uSkqlSYuIQ3VcsnIKJzd3nuIn7++?=
 =?iso-8859-1?Q?Q3jkyoB0wJIhXeazrGeF8G9RAgHzijooZqvKlRavDesjkOqjBsYw8YyjyV?=
 =?iso-8859-1?Q?XFqTrAQ4bVmU6IadPVxSEKPAHGxb0EHZSYln3Kyyq/zH0fXjf6k4Z6gL07?=
 =?iso-8859-1?Q?RutzwYhPgKisnQ2yFAMi9MzRhpnc4j9akKLYCPPxS5WSOxj0g+ZZl1r1+f?=
 =?iso-8859-1?Q?EsDp8Urq2rGXNBj7BaH0hhcJh8yfHUH06LEl4qHnKpt9VFEDyOFNmgTHXk?=
 =?iso-8859-1?Q?SPsv7twecbeKbf0wqnf0erqFNZg08F7U9uFMiguyOPT+yvUR+6QV4dpro/?=
 =?iso-8859-1?Q?tuDZ8L8yQ+HUAMGil7DodsCDtq1t1FRZrma7U5gxfVtIpxL3UkW8lvnEDF?=
 =?iso-8859-1?Q?6sxiSQ3WkShGyL21Ssz6iyUYIfZ8pqvmC8MNEO2LdiBjOGJmMJcsHFwsXT?=
 =?iso-8859-1?Q?B+YRaC1kYRgYnITfCKcACfHMmhVyOHxFHWGkZxStmxLXLpdas0D/b1CNxn?=
 =?iso-8859-1?Q?zSNaxXYtkamhSPHeixov83TmdLpHgNBAsL8fd2t9vdvZZVClMDPN34My/D?=
 =?iso-8859-1?Q?zOoU7Sn6c89yoDlHV1hECYD9GNbvw3CJU34VZ8LebBTUOMqdy87qs9DoJz?=
 =?iso-8859-1?Q?zeZC5C7WLjmOcNEiIKeJ0YKDskzPpkKk+7+9nzuRTRUBR6cVtcwRQyZA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abb1c569-035c-40fc-a5fd-08ddd5d3c863
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:59:33.3082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gvB9AJQd4j1OvI08YFcqKucu2zRzbdw16/VC/CPnjQas9jNUSgJB1Q0Vc9VXITbSWjvgkmMyVPvbphxF/ktB2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10757

From: Rahul Singh <rahul.singh@arm.com>

Stage-1 translation is handled by guest, therefore stage-1 fault has to
be forwarded to guest.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c  | 48 ++++++++++++++++++++++++--
 xen/drivers/passthrough/arm/vsmmu-v3.c | 45 ++++++++++++++++++++++++
 xen/drivers/passthrough/arm/vsmmu-v3.h | 12 +++++++
 3 files changed, 103 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index 91bf72d420..4ea3e90c11 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -853,7 +853,6 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_devi=
ce *smmu, u32 sid)
 	return 0;
 }
=20
-__maybe_unused
 static struct arm_smmu_master *
 arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid)
 {
@@ -874,10 +873,51 @@ arm_smmu_find_master(struct arm_smmu_device *smmu, u3=
2 sid)
 	return NULL;
 }
=20
+static int arm_smmu_handle_evt(struct arm_smmu_device *smmu, u64 *evt)
+{
+	int ret;
+	struct arm_smmu_master *master;
+	u32 sid =3D FIELD_GET(EVTQ_0_SID, evt[0]);
+
+	switch (FIELD_GET(EVTQ_0_ID, evt[0])) {
+	case EVT_ID_TRANSLATION_FAULT:
+		break;
+	case EVT_ID_ADDR_SIZE_FAULT:
+		break;
+	case EVT_ID_ACCESS_FAULT:
+		break;
+	case EVT_ID_PERMISSION_FAULT:
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	/* Stage-2 event */
+	if (evt[1] & EVTQ_1_S2)
+		return -EFAULT;
+
+	mutex_lock(&smmu->streams_mutex);
+	master =3D arm_smmu_find_master(smmu, sid);
+	if (!master) {
+		ret =3D -EINVAL;
+		goto out_unlock;
+	}
+
+	ret =3D arm_vsmmu_handle_evt(master->domain->d, smmu->dev, evt);
+	if (ret) {
+		ret =3D -EINVAL;
+		goto out_unlock;
+	}
+
+out_unlock:
+	mutex_unlock(&smmu->streams_mutex);
+	return ret;
+}
+
 /* IRQ and event handlers */
 static void arm_smmu_evtq_tasklet(void *dev)
 {
-	int i;
+	int i, ret;
 	struct arm_smmu_device *smmu =3D dev;
 	struct arm_smmu_queue *q =3D &smmu->evtq.q;
 	struct arm_smmu_ll_queue *llq =3D &q->llq;
@@ -887,6 +927,10 @@ static void arm_smmu_evtq_tasklet(void *dev)
 		while (!queue_remove_raw(q, evt)) {
 			u8 id =3D FIELD_GET(EVTQ_0_ID, evt[0]);
=20
+			ret =3D arm_smmu_handle_evt(smmu, evt);
+			if (!ret)
+				continue;
+
 			dev_info(smmu->dev, "event 0x%02x received:\n", id);
 			for (i =3D 0; i < ARRAY_SIZE(evt); ++i)
 				dev_info(smmu->dev, "\t0x%016llx\n",
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index a5b9700369..5d0dabd2b2 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -103,6 +103,7 @@ struct arm_vsmmu_queue {
 struct virt_smmu {
     struct      domain *d;
     struct      list_head viommu_list;
+    paddr_t     addr;
     uint8_t     sid_split;
     uint32_t    features;
     uint32_t    cr[3];
@@ -237,6 +238,49 @@ void arm_vsmmu_send_event(struct virt_smmu *smmu,
     return;
 }
=20
+static struct virt_smmu *vsmmuv3_find_by_addr(struct domain *d, paddr_t pa=
ddr)
+{
+    struct virt_smmu *smmu;
+
+    list_for_each_entry( smmu, &d->arch.viommu_list, viommu_list )
+    {
+        if ( smmu->addr =3D=3D paddr )
+            return smmu;
+    }
+
+    return NULL;
+}
+
+int arm_vsmmu_handle_evt(struct domain *d, struct device *dev, uint64_t *e=
vt)
+{
+    int ret;
+    struct virt_smmu *smmu;
+
+    if ( is_hardware_domain(d) )
+    {
+        paddr_t paddr;
+        /* Base address */
+        ret =3D dt_device_get_address(dev_to_dt(dev), 0, &paddr, NULL);
+        if ( ret )
+            return -EINVAL;
+
+        smmu =3D vsmmuv3_find_by_addr(d, paddr);
+        if ( !smmu )
+            return -ENODEV;
+    }
+    else
+    {
+        smmu =3D list_entry(d->arch.viommu_list.next,
+                          struct virt_smmu, viommu_list);
+    }
+
+    ret =3D arm_vsmmu_write_evtq(smmu, evt);
+    if ( ret )
+        arm_vsmmu_inject_irq(smmu, true, GERROR_EVTQ_ABT_ERR);
+
+    return 0;
+}
+
 static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
                               uint64_t *ste)
 {
@@ -742,6 +786,7 @@ static int vsmmuv3_init_single(struct domain *d, paddr_=
t addr,
=20
     smmu->d =3D d;
     smmu->virq =3D virq;
+    smmu->addr =3D addr;
     smmu->cmdq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_CMDQS);
     smmu->cmdq.ent_size =3D CMDQ_ENT_DWORDS * DWORDS_BYTES;
     smmu->evtq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_EVTQS);
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.h b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.h
index e11f85b431..c7bfd3fb59 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.h
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.h
@@ -8,6 +8,12 @@
=20
 void vsmmuv3_set_type(void);
=20
+static inline int arm_vsmmu_handle_evt(struct domain *d,
+                                       struct device *dev, uint64_t *evt)
+{
+    return -EINVAL;
+}
+
 #else
=20
 static inline void vsmmuv3_set_type(void)
@@ -15,6 +21,12 @@ static inline void vsmmuv3_set_type(void)
     return;
 }
=20
+static inline int arm_vsmmu_handle_evt(struct domain *d,
+                                       struct device *dev, uint64_t *evt)
+{
+    return -EINVAL;
+}
+
 #endif /* CONFIG_VIRTUAL_ARM_SMMU_V3 */
=20
 #endif /* __ARCH_ARM_VSMMU_V3_H__ */
--=20
2.43.0

