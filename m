Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DDFB10E33
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 17:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056239.1424475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRg-0005VS-RD; Thu, 24 Jul 2025 15:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056239.1424475; Thu, 24 Jul 2025 15:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRg-0005Ny-Fd; Thu, 24 Jul 2025 15:01:20 +0000
Received: by outflank-mailman (input) for mailman id 1056239;
 Thu, 24 Jul 2025 14:57:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMfj=2F=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uexO2-0003AJ-52
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:57:34 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86c4a5e2-689e-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 16:57:32 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB8370.eurprd03.prod.outlook.com (2603:10a6:20b:50a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 24 Jul
 2025 14:57:28 +0000
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
X-Inumbo-ID: 86c4a5e2-689e-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMjwf8iR1yzjXzCrjiGdMUDni5WLc83Dr/9R8Qlw08RfCsa1PyWQjuAUsv3oz8s7buMZKNTgM2D2oQx3+IuIXKgi8lcY8lFO0VDcfCX+Dv6uJMwa6zRmvEoKGZZLDcL+IgvhdbRSr4CA9v7Lv5REQGiWbbisz0Qd7ORdWC0WrfCqEjSRKncycpyfEbrJNOsRlrv0U4GD2nyBTW1ogFerl2YaYW3Xtw1wGUp1rR63JX+SBVVddL3p/WKzNd0OXhY3RYF8cncoYL2POQl+Fp4/MOEVglH3xkCsDPzQLDt1nNeRGbjCN8Nv5oHCeZYB52z0EsomTrpHceucgPfJySWNXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoVvj6g0/U9ctQwv10zNbcAhZndaB/2qfxiQUFwLrVQ=;
 b=yV/rLH/3qIkUhq8knsksPn/bpZNfTLFSUZnhwglovwSxd32P86PzvpiC4ONeCtylJtJZX4J3/v1jynrLK+LhiNioxEo6U36RS/OY6Xvo3gjk6331mc+sDIWpjJcW+8wr8NxrJWxNSji3W84MXBw2/BV5sEMLE6hHQppeZdBkZEFSfHgw9ToR5im2/bpxxe9ugcrOtB+VBoQzxXsLwdCM3D/yR6HvokDXb1O3zr5msRdj+EXfZZw9/dVwh3wyZ8efjC3HHXjqsSoY0hdl0+48DI7vjgHGHT2+Gv3fSjomhN4ifwGPz8HH2B+GFlzxXOh3cz2nZGN4N3q9tvHc7wpOcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoVvj6g0/U9ctQwv10zNbcAhZndaB/2qfxiQUFwLrVQ=;
 b=obbJTsX90bIeOtj3UeJMKCmsHXXdSX2QjMP/92QEdwVusMLb/nkk6biBt8mJDzXCjLM7gmMJUIzpuodQ77A/FwNEvq+0MkCSOOk/esl3vvZnBWQZEAP4a2H4pwaMVa4HrevE7m8+5JyDRuTN9eGGjdp1e0rtXaMoa+gISwgwqafOBSxY2hifzAXhdSAMCuQ7TSBmWwZnWFe4m5/Z4lWRQttV6Fazg7ehIyLUVNNs1WOA1JrMf581pRcZ0yX5seour9JMZ4kfWodkdWUdfmKvXCYwbWYbRtYk4N8BOP0ZEWLnTtiT9zOhL2hpJ9USZF5Gb1+XgKP74uT27vVx1Ni3+w==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 08/10] xen/arm: vgic: add resource management for extended
 SPIs
Thread-Topic: [PATCH 08/10] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Index: AQHb/KtFsD9ZhajTqUi7jlQ5kP6yIQ==
Date: Thu, 24 Jul 2025 14:57:27 +0000
Message-ID:
 <5eef22b5c95851568b2c42f025568431be9a108d.1753367178.git.leonid_komarianskyi@epam.com>
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
x-ms-office365-filtering-correlation-id: 9a9a5b3e-ead0-4c8c-a5a9-08ddcac2687a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?fhhiKyBz8dOdgBY2uG87NjutmqNBrjQuDPsVvy+/royVbuyj+SNHp9ZKyb?=
 =?iso-8859-1?Q?UNqLSBwWEVAc7I0Cs7H52XKitV+vMA8hu13XwNE+B+KhS2qm9TTk4Aqi9A?=
 =?iso-8859-1?Q?suC4pbay5BzpCdqWIxMacLjgyLf4aBM64+jvjWYDqGEUV53BQS4Z7FIHPg?=
 =?iso-8859-1?Q?m3jzTARk2L/j3i2VAOj6ebVmfX8U7KzJcwAEaG1oLODrqyvuYN+NAD3LPS?=
 =?iso-8859-1?Q?ZJnssxWAuOQV6bSDDotgh5XmKyfqq33cCKr9TtWVCOx5uOEh1raz84qKCV?=
 =?iso-8859-1?Q?D6bGV0ur3VcrhrdJOh5eWcc9YwTpQJfEIPOJ5cU5UCUl3ZOWn96WtA5kPJ?=
 =?iso-8859-1?Q?L1fNJeGjtescJRirG/z5lVuiOgKTmAB2YE1gzSsuEexqbePG70X+69tN7c?=
 =?iso-8859-1?Q?nJH/6WSX1WX1sg+U1myX7x5iz8R0JGl0Ntjq6qDQz9PsqOkS4N81zk41do?=
 =?iso-8859-1?Q?QvtCAtguCyvU/0Kv494EYlp/btE5FDcvBNImfs30zFN9TpeSeVRWnfDO83?=
 =?iso-8859-1?Q?XZ5I0TIsrv5bscpUbr0B6jZy2bXRdXjID6i9u20Mb0ZOGuUg0RPSufbeBs?=
 =?iso-8859-1?Q?g7sV2yldkMhKg466JfoAZAPeiRPIooF28Mcdj5a2KruDdKVNxEJtmcU4/S?=
 =?iso-8859-1?Q?KyRO+3VP/nWaZ0NswNkwC2A4CoX85i+FuoFu/HPdoyxdfrwNwnjynF6AVN?=
 =?iso-8859-1?Q?z21gfmo98ItbjdvzDlMwXQvtyHrxGffvBHgS6vQerg773b5j7G8e2fyQAo?=
 =?iso-8859-1?Q?Nc+Bsg9r23rriyEd0FpAdwliW/td+sDjG+PJPEAACDvKPynNY0RiqACawl?=
 =?iso-8859-1?Q?FAtvsfCGZmI6LqdHWXZGFAYbjejsKAyxExk10lVi3xiCkxrHYJbhlZAE8g?=
 =?iso-8859-1?Q?OAEWNsu+kLEcWfmthxgI8dWUmX21xTXjyGpavLN1W1JsQ6EfdiQGkunEYF?=
 =?iso-8859-1?Q?rh0YZYePBM9W9FZXdYCprFzO4vn3tsOoDU5E02oRbPgRRtHoyB8+aJiCh3?=
 =?iso-8859-1?Q?xVuXhVgmlgac7zRPiqgIt0jJWEBOEVBn3KajbhFyAr9qPJfXwVbw2cHRU8?=
 =?iso-8859-1?Q?VZeiccohUSinxhLDfkSjcePB68uAFd6g63t3we9SpLUOxFffaa3cIO0fEc?=
 =?iso-8859-1?Q?mYmCWPxeswF6jtChog/5jWhTtFnImNK31mavd1kVlK2RKAUAW4T3324M7l?=
 =?iso-8859-1?Q?qi47E/H/TE1/KWfgbKwrYogxbTacZ/Mb4f2iVI0/I6t0hMBVsv81W/0vI/?=
 =?iso-8859-1?Q?HwQwjq+w9S51ylq0WUwiCFgs62FurJ4DuXk5u5cSiqXhBv4/rVsNxajamq?=
 =?iso-8859-1?Q?V3YOsFz4lp0oWXPVdodqZ2x8r1HDFPULRxmyeWrIVKlk3b/NDbWW35m6uS?=
 =?iso-8859-1?Q?prHITVaZMl1RsEX/zmbnaw2n1L9GVjy//9U/a7xc4aOdXBuhV9U0IQjvQz?=
 =?iso-8859-1?Q?73QNimepxT1S8YPGR9KqQB8UfxbRCcWtXoovNbZD7/VzQCDqOXJ+ZBhBaM?=
 =?iso-8859-1?Q?VCPDNMpPs6CpQ6bwbzwoiPv+2P/IlcVQNNYUYepocHjQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2ZRsASYZJpS8uJG7Trle0DKPioIQIgL4B1jbBwlvWWhrlOouGPhPhVNgSR?=
 =?iso-8859-1?Q?6qaF64OdE2FZaEHEIvyGy2ibCENdA1pZDhXAVCRJS9X3cBkeqMqsyO9Nro?=
 =?iso-8859-1?Q?GmeS7mApExAi4w2pShD171OE3ItA65YfoehHgwZECK8mqu5pFhkE+/g20t?=
 =?iso-8859-1?Q?vOXjwEfomuhUW46vy4IbEak5+2AETdqyI8EvqTCfoMMHmqgoHBnxUqSp2v?=
 =?iso-8859-1?Q?1lhRHyv4Ver+Tdeu+iQw0rZaoAnjw3qt8gCF5VXbKIDjKZxYqn5cpVkp8F?=
 =?iso-8859-1?Q?bbbIH1jy6mMzb6gGWsNBW1UpktHlmltFAyUO0+4HSul7ohCpMgwspFsMRO?=
 =?iso-8859-1?Q?4/ON2avFCGnom4csriFB37255CEr8l8Wo/qIzGoVWdKly36kGlectLFQxU?=
 =?iso-8859-1?Q?xYEAhrIGrstaBfRfzKlobuPl4FXEXlA7NFFoADegZNRvxZ0X4v2gPhGYQk?=
 =?iso-8859-1?Q?0395KTpB3LJDMuqq71UkqJ9FxtYfGexuIxuutdD8q+sy2e3RIc7vv4xGaj?=
 =?iso-8859-1?Q?0JE0A4Xw37SH16Am27ET4bSa2HZGmZDOXAVBS+f8NqOgahgeKx+xtcf8Or?=
 =?iso-8859-1?Q?gaKsftz+jwrGbGH6tOg/19dOBaoSnaxwGLA8K7vW7t3ktdmeWigphfz1na?=
 =?iso-8859-1?Q?klVH8R4loEwO2ZFYNPCqusTjmsLwrGfA18vDXhKmhXk8qOzZGcmlnyFwSh?=
 =?iso-8859-1?Q?mrb+6XNszhgM3JHWJaSj3/AO2DURRfD2Mp6XrF9mGqiAI12wj5NrEUW0yD?=
 =?iso-8859-1?Q?jmcNzHAdDa4bZ7pHkkUqOKvR06ja+fXpdkMMCNJLvNPd6XBmD6npmkcCeU?=
 =?iso-8859-1?Q?EzZ4/SfB+5MRFxCT6Hct+j2JTuEIi7uuJU0ulc034Z9cIuJbAd7IxEIvWl?=
 =?iso-8859-1?Q?EcB0HWEbb3H3K5w6GyZQFgkytzz3T1GGAASb5KsulayUeYsFc0p5R4ydRf?=
 =?iso-8859-1?Q?bZ8+EL60+wfa8JfFAB0/M8AOAqUvcohtpPJFyEOsDis6IzhLPgMKzXlAeP?=
 =?iso-8859-1?Q?wusc3ixIZ/sU+O1Hf/3y5FwHYNKfPiGgPAUuzqjFL3do5GHny2jO/MRrhL?=
 =?iso-8859-1?Q?y6D7zzSwEae9mSlNJwKuGhVidq0U0U8zaBF5j2nzPAotYbNAVWQjTH57tJ?=
 =?iso-8859-1?Q?1umkWyvY5ywEX9JaCMzeIG5GoR7PIpzPKoupclj1I4rT47KtiwV6yccovo?=
 =?iso-8859-1?Q?BK8A5ewRVJUc6MaMM1PwLKt/INqc4rRyTpE61sBX+isT/koCXz5qwk3U8p?=
 =?iso-8859-1?Q?DwMmC8vMM6fpYZmM//D0eHAZd43U/tdc160O+wWJ2WuPX8zE28skEUhNOL?=
 =?iso-8859-1?Q?THXd4OiUaQ634ulaT1ocakAt63j2yA6hO7p+4hlPhWyB28ytFfyKt+TXK6?=
 =?iso-8859-1?Q?bDBLxXpWwI8GhgZBrcdFaX/IzDWRREf9V6QqwUA5OsnkhtTYxwzJhAIyt3?=
 =?iso-8859-1?Q?uIC7KDrrQrVmxiK3zDwvpPuosKA2MZlQKo9IUXNNnmhHxCUxU2TsmBYUg6?=
 =?iso-8859-1?Q?o4Yw+ELH2iQSYaWJbIbD1eUegvoJ9nTphRxoD2pLlamhD1jNz0dRdGjFu0?=
 =?iso-8859-1?Q?d3xwikjdY2oGVgxJH6t7gv/AvSVJTJftdvprh3wOF2yGGSNm/5AebSTdOy?=
 =?iso-8859-1?Q?tH2llPLDGY0nrw7irhJ8924OBbpJOwp+1sge6x+KFb7dXTO2LHeYzWQk66?=
 =?iso-8859-1?Q?zQEh4xvbe7jVFx3D7Sg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9a5b3e-ead0-4c8c-a5a9-08ddcac2687a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 14:57:27.4259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kc3jgjLMV0fWe1+Mr0ziIyXfn2fJG07HT7txUXolCLyyYwBh4hcKFrkH0/EZ4QiPVo3k7mOAETpswVBY06QP4sp4vlK0NofKs2asF2lvnJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8370

This change introduces resource management in the VGIC to handle
extended SPIs introduced in GICv3.1. The pending_irqs and
allocated_irqs arrays are resized to support the required
number of eSPIs, based on what is supported by the hardware and
requested by the guest. A new field, ext_shared_irqs, is added
to the VGIC structure to store information about eSPIs, similar
to how shared_irqs is used for regular SPIs.

Since the eSPI range starts at INTID 4096 and INTIDs between 1025
and 4095 are reserved, helper macros are introduced to simplify the
transformation of indices and to enable easier access to eSPI-specific
resources. These changes prepare the VGIC for processing eSPIs as
required by future functionality.

The initialization and deinitialization paths for vgic have been updated
to allocate and free these resources appropriately. Additionally,
updated handling of INTIDs greater than 1024, passed from the toolstack
during domain creation, and verification logic ensures only valid SPI or
eSPI INTIDs are used.

The existing SPI behavior remains unaffected when guests do not request
eSPIs, GIC hardware does not support them, or the CONFIG_GICV3_ESPI
option is disabled.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
---
 xen/arch/arm/gic-v3.c           |   5 ++
 xen/arch/arm/include/asm/gic.h  |   3 +
 xen/arch/arm/include/asm/vgic.h |  28 +++++++
 xen/arch/arm/vgic.c             | 133 +++++++++++++++++++++++++++++++-
 4 files changed, 167 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 476524225d..a0e8ee1a1e 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -676,6 +676,11 @@ static void gicv3_set_irq_priority(struct irq_desc *de=
sc,
 }
=20
 #ifdef CONFIG_GICV3_ESPI
+unsigned int gic_number_espis(void)
+{
+    return gic_hw_ops->info->nr_espi;
+}
+
 static void gicv3_dist_espi_common_init(uint32_t type)
 {
     unsigned int espi_nr;
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.=
h
index 1c4e3cf31e..64baafb902 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -306,6 +306,9 @@ extern void gic_dump_vgic_info(struct vcpu *v);
=20
 /* Number of interrupt lines */
 extern unsigned int gic_number_lines(void);
+#ifdef CONFIG_GICV3_ESPI
+extern unsigned int gic_number_espis(void);
+#endif
=20
 /* IRQ translation function for the device tree */
 int gic_irq_xlate(const u32 *intspec, unsigned int intsize,
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 35c0c6a8b0..3731750046 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -146,6 +146,10 @@ struct vgic_dist {
     int nr_spis; /* Number of SPIs */
     unsigned long *allocated_irqs; /* bitmap of IRQs allocated */
     struct vgic_irq_rank *shared_irqs;
+#ifdef CONFIG_GICV3_ESPI
+    struct vgic_irq_rank *ext_shared_irqs;
+    int nr_espis; /* Number of extended SPIs */
+#endif
     /*
      * SPIs are domain global, SGIs and PPIs are per-VCPU and stored in
      * struct arch_vcpu.
@@ -243,6 +247,24 @@ struct vgic_ops {
 /* Number of ranks of interrupt registers for a domain */
 #define DOMAIN_NR_RANKS(d) (((d)->arch.vgic.nr_spis+31)/32)
=20
+#ifdef CONFIG_GICV3_ESPI
+#define DOMAIN_NR_EXT_RANKS(d) (((d)->arch.vgic.nr_espis+31)/32)
+#define EXT_RANK_MIN (ESPI_BASE_INTID/32)
+#define EXT_RANK_MAX ((ESPI_MAX_INTID+31)/32)
+#define EXT_RANK_NUM2IDX(num) ((num)-EXT_RANK_MIN)
+#define EXT_RANK_IDX2NUM(idx) ((idx)+EXT_RANK_MIN)
+
+/*
+ * Since eSPI indexes start from 4096 and numbers from 1024 to
+ * 4095 are forbidden, we need to check both lower and upper
+ * limits for ranks.
+ */
+static inline bool is_espi_rank(unsigned int rank)
+{
+    return ( rank >=3D EXT_RANK_MIN && rank < EXT_RANK_MAX );
+}
+#endif
+
 #define vgic_lock(v)   spin_lock_irq(&(v)->domain->arch.vgic.lock)
 #define vgic_unlock(v) spin_unlock_irq(&(v)->domain->arch.vgic.lock)
=20
@@ -302,6 +324,12 @@ extern struct vgic_irq_rank *vgic_rank_offset(struct v=
cpu *v,
                                               unsigned int b,
                                               unsigned int n,
                                               unsigned int s);
+#ifdef CONFIG_GICV3_ESPI
+extern struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v,
+                                                  unsigned int b,
+                                                  unsigned int n,
+                                                  unsigned int s);
+#endif
 extern struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int ir=
q);
 extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
 extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index c563ba93af..8b3bbdf918 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -31,6 +31,10 @@ static inline struct vgic_irq_rank *vgic_get_rank(struct=
 vcpu *v,
         return v->arch.vgic.private_irqs;
     else if ( rank <=3D DOMAIN_NR_RANKS(v->domain) )
         return &v->domain->arch.vgic.shared_irqs[rank - 1];
+#ifdef CONFIG_GICV3_ESPI
+    else if ( is_espi_rank(rank) )
+        return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank=
)];
+#endif
     else
         return NULL;
 }
@@ -47,6 +51,16 @@ struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v, u=
nsigned int b,
     return vgic_get_rank(v, rank);
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v, unsigned int b,
+                                           unsigned int n, unsigned int s)
+{
+    unsigned int rank =3D REG_RANK_NR(b, (n >> s));
+
+    return vgic_get_rank(v, rank + EXT_RANK_MIN);
+}
+#endif
+
 struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int irq)
 {
     unsigned int rank =3D irq / 32;
@@ -111,6 +125,29 @@ int domain_vgic_register(struct domain *d, unsigned in=
t *mmio_count)
     return 0;
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+static int init_vgic_espi(struct domain *d)
+{
+    int i;
+
+    if ( d->arch.vgic.nr_espis =3D=3D 0 )
+        return 0;
+
+    d->arch.vgic.ext_shared_irqs =3D
+        xzalloc_array(struct vgic_irq_rank, DOMAIN_NR_EXT_RANKS(d));
+    if ( d->arch.vgic.ext_shared_irqs =3D=3D NULL )
+        return -ENOMEM;
+
+    for ( i =3D 0; i < d->arch.vgic.nr_espis; i++ )
+        vgic_init_pending_irq(&d->arch.vgic.pending_irqs[i + d->arch.vgic.=
nr_spis], ESPI_IDX2INTID(i));
+
+    for ( i =3D 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
+        vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i], i, 0);
+
+    return 0;
+}
+#endif
+
 int domain_vgic_init(struct domain *d, unsigned int nr_spis)
 {
     int i;
@@ -125,6 +162,30 @@ int domain_vgic_init(struct domain *d, unsigned int nr=
_spis)
      */
     nr_spis =3D ROUNDUP(nr_spis, 32);
=20
+#ifdef CONFIG_GICV3_ESPI
+    if ( nr_spis > ESPI_MAX_INTID )
+        return -EINVAL;
+
+    if ( is_espi(nr_spis) )
+    {
+        /*
+         * During domain creation, the toolstack specifies the maximum INT=
ID,
+         * which is defined in the domain config subtracted by 32. To comp=
ute the
+         * actual number of eSPI that will be usable for, add back 32.
+         */
+        d->arch.vgic.nr_espis =3D min(nr_spis - ESPI_BASE_INTID + 32, 1024=
U);
+        /* Verify if GIC HW can handle provided INTID */
+        if ( d->arch.vgic.nr_espis > gic_number_espis() )
+            return -EINVAL;
+        /* Set the maximum available number for defult SPI to pass the nex=
t check */
+        nr_spis =3D VGIC_DEF_NR_SPIS;
+    } else
+    {
+        /* Domain will use the regular SPI range */
+        d->arch.vgic.nr_espis =3D 0;
+    }
+#endif
+
     /* Limit the number of virtual SPIs supported to (1020 - 32) =3D 988  =
*/
     if ( nr_spis > (1020 - NR_LOCAL_IRQS) )
         return -EINVAL;
@@ -139,7 +200,12 @@ int domain_vgic_init(struct domain *d, unsigned int nr=
_spis)
         return -ENOMEM;
=20
     d->arch.vgic.pending_irqs =3D
+#ifdef CONFIG_GICV3_ESPI
+        xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis +
+                      d->arch.vgic.nr_espis);
+#else
         xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis);
+#endif
     if ( d->arch.vgic.pending_irqs =3D=3D NULL )
         return -ENOMEM;
=20
@@ -150,12 +216,23 @@ int domain_vgic_init(struct domain *d, unsigned int n=
r_spis)
     for ( i =3D 0; i < DOMAIN_NR_RANKS(d); i++ )
         vgic_rank_init(&d->arch.vgic.shared_irqs[i], i + 1, 0);
=20
+#ifdef CONFIG_GICV3_ESPI
+    ret =3D init_vgic_espi(d);
+    if ( ret )
+        return ret;
+#endif
+
     ret =3D d->arch.vgic.handler->domain_init(d);
     if ( ret )
         return ret;
=20
     d->arch.vgic.allocated_irqs =3D
+#ifdef CONFIG_GICV3_ESPI
+        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_irqs(d) +
+                      d->arch.vgic.nr_espis));
+#else
         xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_irqs(d)));
+#endif
     if ( !d->arch.vgic.allocated_irqs )
         return -ENOMEM;
=20
@@ -189,9 +266,27 @@ void domain_vgic_free(struct domain *d)
         }
     }
=20
+#ifdef CONFIG_GICV3_ESPI
+    for ( i =3D 0; i < (d->arch.vgic.nr_espis); i++ )
+    {
+        struct pending_irq *p =3D spi_to_pending(d, ESPI_IDX2INTID(i));
+
+        if ( p->desc )
+        {
+            ret =3D release_guest_irq(d, p->irq);
+            if ( ret )
+                dprintk(XENLOG_G_WARNING, "d%u: Failed to release virq %u =
ret =3D %d\n",
+                        d->domain_id, p->irq, ret);
+        }
+    }
+#endif
+
     if ( d->arch.vgic.handler )
         d->arch.vgic.handler->domain_free(d);
     xfree(d->arch.vgic.shared_irqs);
+#ifdef CONFIG_GICV3_ESPI
+    xfree(d->arch.vgic.ext_shared_irqs);
+#endif
     xfree(d->arch.vgic.pending_irqs);
     xfree(d->arch.vgic.allocated_irqs);
 }
@@ -325,6 +420,17 @@ void arch_move_irqs(struct vcpu *v)
         if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->s=
tatus) )
             irq_set_affinity(p->desc, cpu_mask);
     }
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i =3D ESPI_BASE_INTID; i < (d)->arch.vgic.nr_espis; i++ )
+    {
+        v_target =3D vgic_get_target_vcpu(v, i);
+        p =3D irq_to_pending(v_target, i);
+
+        if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->s=
tatus) )
+            irq_set_affinity(p->desc, cpu_mask);
+    }
+#endif
 }
=20
 void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n)
@@ -532,6 +638,10 @@ struct pending_irq *irq_to_pending(struct vcpu *v, uns=
igned int irq)
         n =3D &v->arch.vgic.pending_irqs[irq];
     else if ( is_lpi(irq) )
         n =3D v->domain->arch.vgic.handler->lpi_to_pending(v->domain, irq)=
;
+#ifdef CONFIG_GICV3_ESPI
+    else if ( is_espi(irq) )
+        n =3D &v->domain->arch.vgic.pending_irqs[ESPI_INTID2IDX(irq) + v->=
domain->arch.vgic.nr_spis];
+#endif
     else
         n =3D &v->domain->arch.vgic.pending_irqs[irq - 32];
     return n;
@@ -541,6 +651,14 @@ struct pending_irq *spi_to_pending(struct domain *d, u=
nsigned int irq)
 {
     ASSERT(irq >=3D NR_LOCAL_IRQS);
=20
+#ifdef CONFIG_GICV3_ESPI
+    if ( is_espi(irq) )
+    {
+        irq =3D ESPI_INTID2IDX(irq) + d->arch.vgic.nr_spis;
+        return &d->arch.vgic.pending_irqs[irq];
+    }
+#endif
+
     return &d->arch.vgic.pending_irqs[irq - 32];
 }
=20
@@ -582,7 +700,7 @@ void vgic_inject_irq(struct domain *d, struct vcpu *v, =
unsigned int virq,
     if ( !v )
     {
         /* The IRQ needs to be an SPI if no vCPU is specified. */
-        ASSERT(virq >=3D 32 && virq <=3D vgic_num_irqs(d));
+        ASSERT((virq >=3D 32 && virq <=3D vgic_num_irqs(d)) || is_espi(vir=
q));
=20
         v =3D vgic_get_target_vcpu(d->vcpu[0], virq);
     };
@@ -659,9 +777,14 @@ bool vgic_emulate(struct cpu_user_regs *regs, union hs=
r hsr)
=20
 bool vgic_reserve_virq(struct domain *d, unsigned int virq)
 {
-    if ( virq >=3D vgic_num_irqs(d) )
+    if ( virq >=3D vgic_num_irqs(d) && !is_espi(virq) )
         return false;
=20
+#ifdef CONFIG_GICV3_ESPI
+    if ( is_espi(virq) )
+        return !test_and_set_bit(ESPI_INTID2IDX(virq) + vgic_num_irqs(d), =
d->arch.vgic.allocated_irqs);
+#endif
+
     return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
 }
=20
@@ -679,7 +802,13 @@ int vgic_allocate_virq(struct domain *d, bool spi)
     else
     {
         first =3D 32;
+
         end =3D vgic_num_irqs(d);
+#ifdef CONFIG_GICV3_ESPI
+        /* Take into account extended SPI range */
+        end +=3D d->arch.vgic.nr_espis;
+#endif
+
     }
=20
     /*
--=20
2.34.1

