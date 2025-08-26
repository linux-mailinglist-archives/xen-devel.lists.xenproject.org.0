Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C987BB36763
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 16:06:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094538.1449888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ5-0000GA-Kg; Tue, 26 Aug 2025 14:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094538.1449888; Tue, 26 Aug 2025 14:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ5-0008UE-DD; Tue, 26 Aug 2025 14:05:51 +0000
Received: by outflank-mailman (input) for mailman id 1094538;
 Tue, 26 Aug 2025 14:05:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqrf=3G=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uquJ2-00072q-AH
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 14:05:48 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c340497f-8285-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 16:05:46 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PAXPR03MB7887.eurprd03.prod.outlook.com (2603:10a6:102:216::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 14:05:39 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Tue, 26 Aug 2025
 14:05:39 +0000
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
X-Inumbo-ID: c340497f-8285-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnNucBZkRbqebhbudRCglLr3rj7uNBLaNBN7yEV1SVaJs1KUTOKiN3dbkouurTN5j4JxI7uB94wVm1tANOX7jiwGDY2kQDjj1c+FtcUSMUaFQ4Pgy223fmOSJYynzyAwNTM9R4HxZt3uWrCJk/pXe2o1gaa/dRNEKPXO9fZZVGchbcEo6zsVQ0ACD8tb0CMz+1tYLrWKN0IKRpJ7g6FnY+dLsNjyT9CA5MLzT8FbU5V2abCt7YhQdkQUYGNSK23AXroct71HDiVs3AFjJ5GRPm+V/X7ALEFw/1s/0vwcL8/TsP922HSAiuTkUJmY6YQr/EUndJRVW9gIOTG3Fm+Wcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7Uni7hYOu4slSyrdi2cdXi+bFki+LJszX2aXGdgxtU=;
 b=My9AQMsKFOPyEzUahR/SYbRr2EgUjWGZ09v8jkw14slT39etshss6U2XywDsd3EOqYcvuraE3hDIRoJfJcP/1LNunqNlxcXCKDah9/KTttiefsUtU2/0M+r2mTH8Ixy1pk/VKLztoSP3ncMdJVzbl0XHSi/G8KLxAHmHSyTLtUOfusiP5vg3qNyw4qgvxZlWLyUeW2WArrVollTlcDgtUP0X68wj2J37XOKIgKlRZafSfXgQ6Bwg3xgY9pUpd4MlYbtjBEfh+MDqA0+4RKGKl/Qi+BPdKZnnWGzE7nzUVyRShXBmYEto36JkKAZQMPV1itlXw7zhT0TqshMcaKFxHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7Uni7hYOu4slSyrdi2cdXi+bFki+LJszX2aXGdgxtU=;
 b=WcGqr3naz/RA8j3xKGWYREv9SJBL8utCn276OefORWEnR9UNth9to329PAbutCy7iKBwTwUOoGNiVe12DQsmLdfNtO0iUsYjFZzQbV95jP1OFZaaHx+Iin4HSzyWWbWi0eGUd05wYGVh7jkljAiaWKesH/eLWeF+dXwMOkzKBoil/8dK7HOTN/+yp/DC/Hn2gjoVgvk6tbVoRXic1ruzbV6TnC6/IpMNccVyXFCbYJLDG4hRrfVMXWKnULIG+1xxRJdYivp26s+qB/SyvFd3wya+lrI9Q9INqyMebBSKv0YzfRKEkWk6MbXzT2oLgqrYfHtovv9fzVP8ZZQTGMRjQA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 09/11] xen/arm: domain_build/dom0less-build: adjust domains
 config to support eSPIs
Thread-Topic: [PATCH v3 09/11] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Thread-Index: AQHcFpKAZWUsU5Sz9EWrJGvlceTbIw==
Date: Tue, 26 Aug 2025 14:05:38 +0000
Message-ID:
 <bff3d1c4302e8780771abed42f624cafe76776cd.1756216943.git.leonid_komarianskyi@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756216942.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PAXPR03MB7887:EE_
x-ms-office365-filtering-correlation-id: 1607e281-be77-47fa-a8ab-08dde4a9a358
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?F68Ljtg1zcKzEeiA0UpJMEK9ZjgeOO90wz1EKBLKSpAaOjzMByEM2o8MfM?=
 =?iso-8859-1?Q?KClg5DvyQ7hUWJMYQFFBJEVzIYGJCeaMofVAxPoFXY1mINaIFib6iPx/kS?=
 =?iso-8859-1?Q?5K9P7ktDpwo14EInX0wk9CirjAEqBOfXs/hd0G70vcWeGp6ID0br6deQ+B?=
 =?iso-8859-1?Q?hKRFbIR2P0EJ7Z7Ay9VfLr4mwcJe2kWqg9AkSxsk/biDI4J2JcE/EBRXX9?=
 =?iso-8859-1?Q?kHb/HkFxNqxUtnR/9TZp5aBe2knQRPv9lCwbmlt8md89IpbXXIwUuqXLo7?=
 =?iso-8859-1?Q?C04BOTVpdLb1haoZI7aBUP00xV7besD9F6edfdX7OpEviqQowwDdW6r95l?=
 =?iso-8859-1?Q?CucuBrqZH/EE8xMfuJXtU/gBZv0gf/xI0vtYq/UdIAHc1TatwUnckaSrdc?=
 =?iso-8859-1?Q?1gjyQ9RgP7dIBaKxczKUmxHiQT7D6VuHU0ewitry+DDCpX+QAc05444dr4?=
 =?iso-8859-1?Q?pXO0TQM6DYWqIeEnsnGBCankgp2QlW/mJYH7JlIvMYZ3+3OLlKfxYeZppV?=
 =?iso-8859-1?Q?aOS1dsKa7LRUiz0QmeuFm8aYmufmuyeUcnNYC+I2ZXtoepZLDE4JkOEemi?=
 =?iso-8859-1?Q?Xs59gYNjSzXAeD06QzGF3YHeMDEVIaDWINlJRFeUmWPUOzA9fqXguwPtx6?=
 =?iso-8859-1?Q?y6HvPfbheJ+PqZsKVnLQfc7EJFNNH0va7nxWupdWn/zBwtO4qdS5KqztnE?=
 =?iso-8859-1?Q?3NZLIok1zDU7w34Er4cawCuFR1ceSs7b4EGE+kv6tfgMLG5CMysUuiZvAk?=
 =?iso-8859-1?Q?BzQ4MCmJn3tBJF/SVsHYqcXbl00bkwcbOpANus3jpLZmAukkQf9udoZGRR?=
 =?iso-8859-1?Q?sx3bY+P5yeUt/q0CAUXbQllirOYgncYVV6E7DvuSVwlJL4Ehf/0/Jqk0yk?=
 =?iso-8859-1?Q?4kbYQLy+pMuKz2Bv16JMQgwodJ1OWeZQlfjpM7YenOjGCXX8wU1IFQuRgV?=
 =?iso-8859-1?Q?X5WqYb929wWZZ7agkO7kKVtjS8krUUwBkzkmk/TNTHHMyrWTBCfQwcNRdU?=
 =?iso-8859-1?Q?+s8Pja0EsAQ1t5YGW+puBnMZQ3BuST5kQ6/g/k53BD1qsnwz3O3UJFc+4X?=
 =?iso-8859-1?Q?t+LoBDR1lj/HtxXsoJulBLGaz8QBOmf2QxIbnrkfb8hJ+ftpZhFoFl7bdr?=
 =?iso-8859-1?Q?rJM+Le7vY0RksulfPbYVyMvpQK18MHUKn6/eXrmT1UqF/dX7uo1O9nTm8z?=
 =?iso-8859-1?Q?hPAsQJkKkDjAMfd+Iym4AifvtlI4l1xp2QKgGn0fwLAlnF+IUNme+J1xgr?=
 =?iso-8859-1?Q?ulIgmfklWq2SMhaXZ107FJm7Jh5TZ+W4hgGILx/IaemcRCMSUcAYQhuJOR?=
 =?iso-8859-1?Q?2MUaf/wQ87rNrVIovnFU1X0AfNujvRT62lbCF7MkoiZ+GKTsxTyvzUTq5B?=
 =?iso-8859-1?Q?bSRTMSM9QNPUsUJSA9h8F1NXQ1xhcpSZBRM6gjzfUnB5LvMvTn+TvQqPq+?=
 =?iso-8859-1?Q?pwVsdKYxrDp0aayiWPh9lmpdNJXEqAENniovks+d4Un0or7tWjXumFSAL1?=
 =?iso-8859-1?Q?z9g7ZPxj8q4INcT9p/N1pBAv/YjTcCPidoOTo8fW3FVg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Amag11ukxIkSI9EUfLV20sExn4lzXAMGCi0PpFH5ToZ6KWV9HUlCZZsDKR?=
 =?iso-8859-1?Q?pNsMLJGc8nA9fU1wQIZR85UwcL2hfSkdPycOLekEucgvsG+9116zEjZNsq?=
 =?iso-8859-1?Q?3LpCG7LJX7WzJQ5MmX8SFifj7WF5KXs9Ta/GlcoO73trJO7+mCMXZy1m10?=
 =?iso-8859-1?Q?uxSvJpLKi4PbUI8xwaQgoBulBzV6nivCxJY0D7PAZQR44igfSSpHlmzt9a?=
 =?iso-8859-1?Q?iErdc6FIsPCPzkUF6ONTSeoRvyv1YoOj+9seZLQIE41FKjgwfypoO5FmR2?=
 =?iso-8859-1?Q?e+0fOTj1PKLv8VvGqawpIo/mUAzrpeBDkhGpG0+QveRkXuXiSubAuTSMg9?=
 =?iso-8859-1?Q?GYErTBjELby3dn3w7Ro3SHCHRxWDTeU5bxgUFlklvHZcgqSYz6tn1uHX6U?=
 =?iso-8859-1?Q?7OL2BcrrY+xssdzLkHBjmHPkiAI0sMEFOCwEsVDmVsSd4cpA5q8navnabF?=
 =?iso-8859-1?Q?FPuykwmBqbYP3PrGhnTk+FhcWjoggof+N8lV9kjwgWA++DCLwh/O3FxhFr?=
 =?iso-8859-1?Q?vgjtxZkOuiRo6MsajrVxQ5xgyJGdRlcwdMS4cAqBpXN0aFmcLMjiJOVUgd?=
 =?iso-8859-1?Q?XUBQ5QlYLX5m1wS+ZFCTb/5FLPsefSoN05wchbYoTgGkJTwimHCpzOEFbb?=
 =?iso-8859-1?Q?YDTVikEuduYGBeSTDJRh4jBHtMFyGAS8SnJ1zM5v7I7l9+axqisllkmBT+?=
 =?iso-8859-1?Q?81Kr7ctg7Fg2/mNMjuZdl1lbgFoAQZ9tn+JvhEdc0IcNYenkbchNPM7tPD?=
 =?iso-8859-1?Q?em0Zielk9tHALYTJLb7IWu5JAswFyRZo0rfMbS7IQQn84hbeTzpgnomeVP?=
 =?iso-8859-1?Q?24XOcItbvCU6QZ0xHDabdGyHz6OUshR18Jm0rMtUqM9eb5qFBtq24MIjPQ?=
 =?iso-8859-1?Q?hWXS6MGSk3jPXCKW+eBgsk7jMXD5w3BZ5Lf4dXCKt5Gf8RsTbomIfYDM8V?=
 =?iso-8859-1?Q?8eWuSaO7OgTjmiDDAHfZxeW4SrUwKNpxkyhR/0Zb4OzjE8ITfUbLZijW9M?=
 =?iso-8859-1?Q?ZsU80yvWrr4fH2cuCbcWHVASvEQUGoGxdnk+DVKiY9aqOCbpsrDrKHEhxb?=
 =?iso-8859-1?Q?3PZC28IicnEMkRugz1Zjqd9IXB9qsRIjf77zQdnFwIMN5FCcjXSK4b0dq5?=
 =?iso-8859-1?Q?ktXUA7YrLXnQiTG0FChVAns9gEI3EqjhF9VE+y9pS4vAPBxGiSwXD7Aieu?=
 =?iso-8859-1?Q?9kdjeUP8H0jv/l5k9Qx/7hGqtfH8pZR+vRPx6L7Ln3P7oSqMrrnh/2Rtz2?=
 =?iso-8859-1?Q?+QL857tajNTXhxCy7++RISa4vOhQ/Iuncq3lK3iZZxqUPeWoH6hctfCYk4?=
 =?iso-8859-1?Q?f4zWOCnM8lFtBqVQFYthPs+iQ7vOhEdVmeZrEBsA/jtIyAo2DWZPDtbYtg?=
 =?iso-8859-1?Q?UjQmp7jV+jZMwqpV+skQZvAg3nBHDl0Q9f6zZ7ehyhCO9a2c/R0eXLl3Na?=
 =?iso-8859-1?Q?sU5IBXD04eYZCgoFBPaAbtzAVb38i+2P5sFf3QrK82RX5YnSu3BM/Dg1g6?=
 =?iso-8859-1?Q?F7iA4+lep0/vFmqZ5+iwbVUIrG4v47DTKR8ox60+inhhwZxgvKr5PnvVJf?=
 =?iso-8859-1?Q?XTEhmONZhVxc/zDFUoWrJ+hqddCwsULpEN8Hg0DnPt/n1y/67aOmTF4xRc?=
 =?iso-8859-1?Q?6iARMiZwOgbpKNl59mblLBzyiTanZXToNLSh/dJaBxyQwVEFmaHAI1nmDk?=
 =?iso-8859-1?Q?ZDUj4GLwodKSweaDPcc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1607e281-be77-47fa-a8ab-08dde4a9a358
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 14:05:39.0068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fP+VTFy2VB5YJG5UQzGIc44sR+D8bFQLm/02bfqSfeCwC1i/2GRGR37r501NdLIipSekN6LibxFUEXwMb2boSz2T7MMnzLuxrXuzZWzNXwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7887

The Dom0 and DomUs logic for the dom0less configuration in create_dom0()
and arch_create_domUs() has been updated to account for extended SPIs
when supported by the hardware and enabled with CONFIG_GICV3_ESPI. These
changes ensure the proper calculation of the maximum number of SPIs and
eSPIs available to Dom0 and DomUs in dom0less setups.

When eSPIs are supported by the hardware and CONFIG_GICV3_ESPI is
enabled, the maximum number of eSPI interrupts is calculated using the
ESPI_BASE_INTID offset (4096) and is limited to 1024, with 32 IRQs
subtracted. To ensure compatibility with DomUs (Dom0 setups) domains,
where this adjustment is applied by the toolstack during domain
creation, while for Dom0 or DomUs in Dom0, it is handled directly during
VGIC initialization. If eSPIs are not supported, the calculation
defaults to using the standard SPI range, with a maximum value of
960 interrupt lines, as it works currently.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V2:
- no changes

Changes in V3:
- renamed macro VGIC_DEF_NR_ESPIS to more appropriate VGIC_DEF_MAX_SPI
- added eSPI initialization for dom0less setups
- fixed comment with mentions about dom0less builds
- fixed formatting for lines with more than 80 symbols
- updated commit message
---
 xen/arch/arm/dom0less-build.c   | 12 ++++++++++++
 xen/arch/arm/domain_build.c     | 11 +++++++++++
 xen/arch/arm/include/asm/vgic.h | 14 ++++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 69b9ea22ce..f4f9077db5 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -286,6 +286,18 @@ void __init arch_create_domUs(struct dt_device_node *n=
ode,
         int vpl011_virq =3D GUEST_VPL011_SPI;
=20
         d_cfg->arch.nr_spis =3D VGIC_DEF_NR_SPIS;
+#ifdef CONFIG_GICV3_ESPI
+        /*
+         * Check if the hardware supports extended SPIs (even if the
+         * appropriate config is set). If not, the common SPI range
+         * will be used. Otherwise overwrite the nr_spis with the maximum
+         * available INTID from eSPI range. In that case, the number of
+         * regular SPIs will be adjusted to the maximum value during vGIC
+         * initialization.
+         */
+        if ( gic_number_espis() > 0 )
+            d_cfg->arch.nr_spis =3D VGIC_DEF_MAX_SPI;
+#endif
=20
         /*
          * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d91a71acfd..148a8bdb60 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2055,6 +2055,17 @@ void __init create_dom0(void)
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
     dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
     dom0_cfg.arch.nr_spis =3D VGIC_DEF_NR_SPIS;
+#ifdef CONFIG_GICV3_ESPI
+    /*
+     * Check if the hardware supports extended SPIs (even if the appropria=
te
+     * config is set). If not, the common SPI range will be used. Otherwis=
e
+     * overwrite the nr_spis with the maximum available INTID from eSPI ra=
nge.
+     * In that case, the number of regular SPIs will be adjusted to the ma=
ximum
+     * value during vGIC initialization.
+     */
+    if ( gic_number_espis() > 0 )
+        dom0_cfg.arch.nr_spis =3D VGIC_DEF_MAX_SPI;
+#endif
     dom0_cfg.arch.tee_type =3D tee_get_type();
     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
=20
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 248b5869e1..0bb025f5d5 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -353,6 +353,20 @@ extern void vgic_check_inflight_irqs_pending(struct vc=
pu *v,
 /* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. */
 #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
=20
+#ifdef CONFIG_GICV3_ESPI
+/*
+ * Returns the maximum eSPI INTID, supported by HW GIC, subtracted by 32. =
For
+ * non-Dom0 domains, the toolstack or arch_create_domUs function applies t=
he
+ * same adjustment to cover local IRQs (please, see comment for macro that=
 is
+ * used for regular SPIs - VGIC_DEF_NR_SPIS). We will add back this value
+ * during VGIC initialization. This ensures consistent handling for Dom0 a=
nd
+ * other domains. For the regular SPI range interrupts in this case, the
+ * maximum value of VGIC_DEF_NR_SPIS will be used.
+ */
+#define VGIC_DEF_MAX_SPI (ESPI_BASE_INTID + \
+                          min(gic_number_espis(), 1024U) - 32)
+#endif
+
 extern bool vgic_is_valid_line(struct domain *d, unsigned int virq);
=20
 static inline bool vgic_is_spi(struct domain *d, unsigned int virq)
--=20
2.34.1

