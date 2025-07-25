Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B69C7B12010
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 16:24:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057930.1425628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJLk-0007F1-RS; Fri, 25 Jul 2025 14:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057930.1425628; Fri, 25 Jul 2025 14:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJLk-0007CF-OG; Fri, 25 Jul 2025 14:24:40 +0000
Received: by outflank-mailman (input) for mailman id 1057930;
 Fri, 25 Jul 2025 14:24:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGu/=2G=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1ufJLi-0006kC-VQ
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 14:24:38 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1808de64-6963-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 16:24:37 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB7421.eurprd03.prod.outlook.com
 (2603:10a6:102:103::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 14:24:33 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 14:24:33 +0000
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
X-Inumbo-ID: 1808de64-6963-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=orE5g9S52749otnOE2DroWTTUBj4DRqAvmCtORyxIUoxMJLaAM2mqa0HGk8BWpwMezfys+LpGjT1SRTJRqG60WpPoKY1T/hDQU5H4fj31SzuUHtolXSOKrx8eWXBosRaLoktFB9ON7ueV1WmYEAMWmwBXJUcwVYnJ8nmV9nqo6lzV1Dv+e/msnS2A32RzBuHOGxsZS8ia2Y2h9CMwhurrMlF9BrgimWd4Gc85M3W3K8Lv/A+DD4ekK9Vk0WzEwx+2/BRq4XAvxo6clsorM9cFORKjcXRwUOSQrLaj+JO0TfgYzt0mfJmtnVmovfihsEAqFu9Z5gFAMh6/tgM01Rfwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5V223bID9Bp43TRdSpuWHujmQUuuVVN/RoLUT7njmk=;
 b=Y6ieo3Jrg1+Ke6CW26sjXDYCpa6J+iZOnwgGW48I8Ki6peDRqT4EJTV3ezydIGG5VcwphAJg4iwmqFPrCGi5KgytTBUgKmqEmNNF9sEiUgla77A9xJkl+4bfIX4x6JF2JkJ/K9zzvYO6ziMehdNcRzA3jYZ0B2GTKMcv69bBYBtKHD50p198FM0DHU7TieasOsuCdQPZSb087sghXItRaQJtJv8aY4FlbZfvsV5QsBii031yg8Jg0NgyjJ/bMFVcZPXleGy8LI9hMC0JPk4GkmMEoOVVqAUoB9symMnab6IuZWxer1fRRy/jx+txSARQ+U6XEjAMeQiX7rlL72xWSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5V223bID9Bp43TRdSpuWHujmQUuuVVN/RoLUT7njmk=;
 b=sXmiw5FWeVeyij1dTMTALEZ8RYwHj+j/bbte9Qyz9baRR4nmtuYsOwsfPmRtsdBHt77gpZmLe3jm90WiTQcdhCGWhSwKOckDDgl3Y5zF7EmBG6ONTwZRbqhe2hBb0RUhTvbpltwJv3GyaoJHOkIgQRyOxG5YsEEbLz9jBEWKSPUJUgBzTlIPDjuRyZVsQtBP/1SA0ZbHvP1mo6Pzt8UQ4rA6i/mA69JdmUDqxyVCz39C9aSx2ruvyA1DnhoDYd3cIUSjxDrfRF6tbPYrblei11RCxeNQqW3e7hjOrcGfymjJhNFnZVVy3vTh0WpIrPNW+EYtwhKSrDjl7+3/XKu1fw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v1 2/6] vpci: rename and export
 vpci_guest_mem_bar_{read,write}
Thread-Topic: [PATCH v1 2/6] vpci: rename and export
 vpci_guest_mem_bar_{read,write}
Thread-Index: AQHb/W/W40tal2peUECMHrYixL4j0A==
Date: Fri, 25 Jul 2025 14:24:32 +0000
Message-ID:
 <94524317cf2a8719053fe1038bf39c30c99c280e.1753450965.git.mykyta_poturai@epam.com>
References: <cover.1753450965.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1753450965.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB7421:EE_
x-ms-office365-filtering-correlation-id: c54fe4f0-4254-4a6e-8f5a-08ddcb86f9a7
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?E0p3l32k5dsbilGWjw6Ym/DmYA1YUSP0lA3XJBFdjK2kvTxPVsxISiz6di?=
 =?iso-8859-1?Q?NbT4XWWU875jEA0WtHqEAhPhmiqHgTUFdv54zHAfHbvwRmsHoaiFOuKIxl?=
 =?iso-8859-1?Q?YffFRg0LtdlzX8kc1emUOv7Pc3mjPZ7EpRZ3EhRIE4UR1bPdQgFM+DQw7E?=
 =?iso-8859-1?Q?JJMi6wzSPdROX3ebQsaj3gOHhHPS+mRxD+Xct3OTGp3xKdwd65XI+InfOQ?=
 =?iso-8859-1?Q?4gfFzzMDG+0wZKmjhilIs3AaiivYtHt6OY1w1xFybcYRT82SY0341FmXwU?=
 =?iso-8859-1?Q?y3QDNXqsu6c+61QR2rlXHOyHCG5dUXBFxHfv4lZEO8qrA2ckoGnzUPL8Vt?=
 =?iso-8859-1?Q?2ul5kkXef4+elXrFhLpE7XEov5ZsDZhbU08cjnFfx9J+/0UFjhBEGs29Sj?=
 =?iso-8859-1?Q?cNWsXlIuKDjlaNHeF3DEQ29VVekQu47cSkrw1LwhbHtfkwiCS0XltgyVoQ?=
 =?iso-8859-1?Q?iztovYCck29DhCtfEl9ERUKkPD0u2TLH/x0DmlfMboYsdKQeYyA0ogcivu?=
 =?iso-8859-1?Q?bMDP0yhcwcvHpJ8oWqFc0clfvxC8S4bP2oLUKRn7nWi21BBytakt98LrGd?=
 =?iso-8859-1?Q?Mv/A1CRv76WWjJMCYwzPJtJo5UEiGBm5X5vN7pKraFgJ3abb1yFWiLFK2D?=
 =?iso-8859-1?Q?attIOkMnJCgGwuExu/3D7HdynFleHxUZu5alL544jrXYGgm+nvSmjYn7D7?=
 =?iso-8859-1?Q?r45K5Ussnvbanwsf3g0ky/YFQd0H4Fv9MhTYZ3Tq6yo0EH2K7I9g52Nx7L?=
 =?iso-8859-1?Q?7avA5tV/SmRg4OZRlSAEaFhCbp9e6ALt5H/fUOZUZfK0KpX/sRr4Oy9r8y?=
 =?iso-8859-1?Q?U/YJDY64IvwtEB63+IcD6yxIpP9TXbC9SRel4gFHYfNKHI7ZBLV2ak1pyS?=
 =?iso-8859-1?Q?fTO7XwHiRp9lK3EmfKN1exP0EujNB126SmeB2fmbUY1PA3L/+XppXa/Qrx?=
 =?iso-8859-1?Q?G3OTts49UviWMTIkDQd8n163Um8NmNXHg/zXi1OfFkbpAAj4YhXF2p1mP3?=
 =?iso-8859-1?Q?9p41QERk6Heah0/5uPTeX563Erx3QXwcMIbCC+icZn2r3CvOMcxceb8RIX?=
 =?iso-8859-1?Q?isyDFRmqRKwafQQPUnCPGYnFvMlYSUOgz3ENqFYDUR+LV5/1HgYYMh4zv/?=
 =?iso-8859-1?Q?1ecvPKeh12i48KkatQqnua/BJ9yc643hggwjgMWBVNo5sT2EgXJNmBI03V?=
 =?iso-8859-1?Q?RPFV1qdHMK2Qz6yI7uphzMcG5ZQE9dTD+cqnS/jV96AK2m/qSpPl/hGG/w?=
 =?iso-8859-1?Q?7pokKPYzwSqTnuuQvrekQwTzl9PREbn4EahKzJ83pWYlEoqGBkhpf8TvCk?=
 =?iso-8859-1?Q?6tkz3c8k1opD3U/wmVlbrQv45OBOMbGuwVVD3R4Dv2Nw8UXxi1bp88zs6z?=
 =?iso-8859-1?Q?sA6LHF8IhxROznphCgz/uZaRQRQk6pXJs4UoXyFfCqmZTDf/B5Npoje62s?=
 =?iso-8859-1?Q?79yr6gRUpszUyvjZEhuWnj6LbB8KMD6objsSYrPuz5sD2fb7kTLH6KjfdQ?=
 =?iso-8859-1?Q?LslyIJy2kAJ+BL3blSRq+xqWZudk6ONIYIWTKM51ALeQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Fr0jMZt6bCh8AE8hE+wI4H0iaMkPWP/HQOnWOwHru42j6yUzMI+QL+50Ss?=
 =?iso-8859-1?Q?7zNXUqPutufKiz7fFIZMoQKC82+ZboRsD5+KN20rZfJzYJGcTNawEVjKYc?=
 =?iso-8859-1?Q?1dFhiMIl68h8bYCa1H2VwZPQ0t3BNBRQ3lxAEYbJrc1EGcrBUBr8/ClO43?=
 =?iso-8859-1?Q?m9BG2Sv6VPBJh4j7sBn48xCUYTMQ9GopG2JlMpEDDv59iAM32hRkjItcbh?=
 =?iso-8859-1?Q?G5m4Wf3d9LeY6xVaD/EUidl6XycbgyBIROpEYzv6y/sj5go/WsYKfi5ZjL?=
 =?iso-8859-1?Q?v8pdPWLBEAgoQ/oa//LARRrqEzqxPS2TtYe18wX8DZFmXS/VGvJtTEGvWY?=
 =?iso-8859-1?Q?SuVTNZE6PPSnN+uWL6gNYvVUSxT/Wwy4mNkgZ3AJu/IRPFwgmMDVkjmqc/?=
 =?iso-8859-1?Q?zKcpMILS/TrzPyXMagxs+VepjWcpCSatYWQuqtRgjMFwGf3GFB66EnOeki?=
 =?iso-8859-1?Q?TQTbrRhDOmYTFvWXIcOF6qjcwGspmALAQWCboAx5hU82/qZ+nqJ6NCiwYD?=
 =?iso-8859-1?Q?Dim1jYomambgzLm/SHZ1ICDrLqtu+ZoG7hCE+kDNouMFYkbgm2FfTIWjuo?=
 =?iso-8859-1?Q?5Rf0hDohFJqsanGbyJozsYrbto1uEQV8O19hOP4jBgqxC4aLKn4YQWwLSl?=
 =?iso-8859-1?Q?VxkYkoNEuW5WGju7OcUSZNbGtB0L6M9EHq4AH4pwk/1BTOVnTQM+cDNXOM?=
 =?iso-8859-1?Q?K8ezJwDfKgjEJA8z8nqnVJFHVkndtV+aNSLra7ZrKyiLkW59xbO2CrtQ0u?=
 =?iso-8859-1?Q?johbWfriPUdURpaPMTyMZa/ZU/Nkek68sP2Bu/sX8f+LD5ndwFFPHfVIkB?=
 =?iso-8859-1?Q?w5Yv7LJ/zlZW7HRfQPz/aKruXv5qzIqjujZCNcvB643sWyCVS/O4175rgn?=
 =?iso-8859-1?Q?qYTZMg83v91xVd5Fxf4VWrAz0qHjHEalM5g3xBjmDjJXgqpzCX0K1ZBGzk?=
 =?iso-8859-1?Q?NxkwhMjZulzB2MfRPAXp6ojCGxERKhVazw2RLE8yf/pa4PDZIxaHXxnSNP?=
 =?iso-8859-1?Q?NmMTuyrYUaKMrxa7gn1/1OtKMu3J43NG3JuPqqlCJgW8PGygWcIxU5pLLR?=
 =?iso-8859-1?Q?3uXQAk4oPMnha8aCUYfsge7qWKi5Poy4pTDu20XKUwAe3fER8JKA8TxHR8?=
 =?iso-8859-1?Q?Vg5dSLfXenOzQU40CRlh9USxYgwEYGjbWi+YrhgfzN+CWCrfK8loTUyUp9?=
 =?iso-8859-1?Q?TOBcX3351srkGYxWXapsMeyoAlfb944I/uLXqcoWvrQo07wn+7T0vcXFpg?=
 =?iso-8859-1?Q?y3wxf6GvaS3hKeyGbY+qSHJvuBJX6cStzUI75pKlVVLgimUqGwRB9JjThP?=
 =?iso-8859-1?Q?muuXwF2j3RMtGDpRjXX+X2LUAzvtmmQcIp6vlgvEPsGU14TuL5ycDwMzZj?=
 =?iso-8859-1?Q?yHDegT5cOxrqNDLud3WL9dVRFZkdrDTTDfsfy6+mroSAkK66cgfMlesTAg?=
 =?iso-8859-1?Q?oq+LERcbGENYe1jhp8dBMIN4fgwv/Bzz9azJc7Fifve5tSUqtsPic9Bemo?=
 =?iso-8859-1?Q?zUbild9Bxxq5za8GGUawt7+VtqOzIw+A4a58AT1dUKavZRXAy12shzolzk?=
 =?iso-8859-1?Q?tZg+enQcGn3cz4MSnIZp+Zn9sZ8KWJ3rq6jMOCmVI2adc0DhUSTTAD48s+?=
 =?iso-8859-1?Q?Zax/OYkkwSw0sMcGzFWFBuk3knBsGcBdSVLtNGs/XFZQ5ac7lTuTKAZg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c54fe4f0-4254-4a6e-8f5a-08ddcb86f9a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 14:24:32.5331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RcnfzaLZyreuan3fAM0esrb03NHMGQ5g/y5rSgmVkBuQwz02o0HagJucoPZyqjNaPBPDgiWg1Y6bfyp0O6OoWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7421

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Export functions required for SR-IOV support.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/drivers/vpci/header.c | 20 +++++++++++---------
 xen/include/xen/vpci.h    |  6 ++++++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index c4d8c45640..f33fb27bde 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -610,9 +610,9 @@ static void cf_check bar_write(
     pci_conf_write32(pdev->sbdf, reg, val);
 }
=20
-static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
-                                         unsigned int reg, uint32_t val,
-                                         void *data)
+void cf_check vpci_guest_mem_bar_write(const struct pci_dev *pdev,
+                                       unsigned int reg, uint32_t val,
+                                       void *data)
 {
     struct vpci_bar *bar =3D data;
     bool hi =3D false;
@@ -652,8 +652,8 @@ static void cf_check guest_mem_bar_write(const struct p=
ci_dev *pdev,
     bar->guest_addr =3D guest_addr;
 }
=20
-static uint32_t cf_check guest_mem_bar_read(const struct pci_dev *pdev,
-                                            unsigned int reg, void *data)
+uint32_t cf_check vpci_guest_mem_bar_read(const struct pci_dev *pdev,
+                                          unsigned int reg, void *data)
 {
     const struct vpci_bar *bar =3D data;
     uint32_t reg_val;
@@ -920,8 +920,9 @@ static int cf_check init_header(struct pci_dev *pdev)
             bars[i].type =3D VPCI_BAR_MEM64_HI;
             rc =3D vpci_add_register(pdev->vpci,
                                    is_hwdom ? vpci_hw_read32
-                                            : guest_mem_bar_read,
-                                   is_hwdom ? bar_write : guest_mem_bar_wr=
ite,
+                                            : vpci_guest_mem_bar_read,
+                                   is_hwdom ? bar_write
+                                            : vpci_guest_mem_bar_write,
                                    reg, 4, &bars[i]);
             if ( rc )
                 goto fail;
@@ -979,8 +980,9 @@ static int cf_check init_header(struct pci_dev *pdev)
         bars[i].prefetchable =3D val & PCI_BASE_ADDRESS_MEM_PREFETCH;
=20
         rc =3D vpci_add_register(pdev->vpci,
-                               is_hwdom ? vpci_hw_read32 : guest_mem_bar_r=
ead,
-                               is_hwdom ? bar_write : guest_mem_bar_write,
+                               is_hwdom ? vpci_hw_read32
+                                        : vpci_guest_mem_bar_read,
+                               is_hwdom ? bar_write : vpci_guest_mem_bar_w=
rite,
                                reg, 4, &bars[i]);
         if ( rc )
             goto fail;
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 5ef35b23c7..0f0f321023 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -69,6 +69,12 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsig=
ned int size,
 uint32_t cf_check vpci_read_val(
     const struct pci_dev *pdev, unsigned int reg, void *data);
=20
+void cf_check vpci_guest_mem_bar_write(const struct pci_dev *pdev,
+                                       unsigned int reg, uint32_t val,
+                                       void *data);
+uint32_t cf_check vpci_guest_mem_bar_read(const struct pci_dev *pdev,
+                                          unsigned int reg, void *data);
+
 /* Passthrough handlers. */
 uint32_t cf_check vpci_hw_read8(
     const struct pci_dev *pdev, unsigned int reg, void *data);
--=20
2.34.1

