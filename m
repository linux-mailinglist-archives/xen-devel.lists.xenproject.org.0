Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 272A6B154A2
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 23:24:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063070.1428846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugro1-0004P4-7S; Tue, 29 Jul 2025 21:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063070.1428846; Tue, 29 Jul 2025 21:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugro1-0004Nd-4L; Tue, 29 Jul 2025 21:24:17 +0000
Received: by outflank-mailman (input) for mailman id 1063070;
 Tue, 29 Jul 2025 21:24:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NAX=2K=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ugro0-0004NS-3x
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 21:24:16 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f5b7fef-6cc2-11f0-a320-13f23c93f187;
 Tue, 29 Jul 2025 23:24:13 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GVXPR03MB8452.eurprd03.prod.outlook.com (2603:10a6:150:2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 21:24:08 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 21:24:08 +0000
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
X-Inumbo-ID: 5f5b7fef-6cc2-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNVUxPZE+hsycCifovB3AGLx7tLx7BRKWk+JvFP3hkK0A0XgxN00nm7Emezxewiq/M6eO6TLhGn4zu6tnDJIXQ4YfrIKVn4meEeERYyKlRP8RZOdX9ozDUZNNj4Ee6i3IK7W75yOuu7T8Bdot3JcFSS7mKbhFBfu3CwalRUID4rMQLbLOrfldpDbbnZn32Zn9ff8jwlJ2cGWtRC/0rF9JaPevNWBiKcxfzCO8nSzrkHzSUH3AalCi6leQy6KLnBy9xqzYRObYu5s+w8hdykHIStyZvrjyks06yaSb8eLFGJrzJbhXDzb2wRGFBSYGcjs+0eV+k87E5MJthANcGtU1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGnpQ1SFCgCQagydir3OL24HwVRHEwJEmVmD51myEK8=;
 b=ePV67Fan7TCcRsVJcbEehmrL7MS4Bom0dR801RwN82shwdYTXe6r/NeiSLZJ0u7zwZF3MnH7uTZUGrd4uDjhBRpHoWVNfmnkNsXZ6kIKb4GmgAj5mrecCQK6UlK0AyGnE01NrS9/IOFgPWs2brbQ2vjlyieBPXQUTXUUYdM9AC7ZQMTuxt2k3BsOnElWbMwGX5odc//ogefyMiiRCrCkDLQmgOefv4xF87yT0uT8hlTWGRKCHm4z5A1VmkanjMvmGuUHZVHYsPR8FyD6s7RlPXBLnQlSbRtBHrEjMqC7VZVQcZuDL9RMVbrTodc0EznlY25R2dKo0cBACxX1LonJvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGnpQ1SFCgCQagydir3OL24HwVRHEwJEmVmD51myEK8=;
 b=ltjU/BVyyt5KSOjKKQxV+iPeNVKls2a9woDNJOn9lIf5cStlVRZdM714Yju3yC9TC8oDQlUjGU+htsAICyCA6z6X/EJ85ucYjX4BaopSAqIs/Dlf9G+fcOTk4Y1VosBLih1oAIRU3Hl0bU3U8H7by1cB1/0H77ch189UTXrC9jwgd5I2ZeTTJWHlVqj3FOTyKMhZ73KM9gSv2nfnmLq8Wh3ESR4ePtzEAMKQmLd5IJYNhz9CXyuejXyMbqK3v7jLdS82yOnDUjogutSHbjnws0v9PkwtlLHyF0UT6vg3NB1RRUip5NECc5ommyUuQ9Ul7JGpGIOV30u8RZT2C9QGGA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH 1/3] misra: address 5.5 pirq_cleanup_check
Thread-Topic: [RFC PATCH 1/3] misra: address 5.5 pirq_cleanup_check
Thread-Index: AQHcAM8eW3ACub7JgECG7GeYv6Kijg==
Date: Tue, 29 Jul 2025 21:24:08 +0000
Message-ID:
 <94a49589ab85c8988979f8cfd29c9124d1dedf42.1753822074.git.dmytro_prokopchuk1@epam.com>
References: <cover.1753822074.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1753822074.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GVXPR03MB8452:EE_
x-ms-office365-filtering-correlation-id: eaf971ea-a188-4424-6323-08ddcee640be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?c7ZUd7k1roDi6uafXqmo+2QpPqQSSWtWIGDon8yI+BXMzV9p1mBgOCrp5S?=
 =?iso-8859-1?Q?3O12LHXktiP/FQmnCvzvcXC7LOOkWlK8kDCDJjkmHqj7477KodYJD1rxup?=
 =?iso-8859-1?Q?Q2QC0NQfJA5Llz0KKFTYdYWUNSZ47ztIHj7ZSKrlXSDRK+yRXIRCZFSCeO?=
 =?iso-8859-1?Q?5oGQX9kmlMA69jJFBajiB2ta9oT9HM35h/oFBYAQsnESJ6Mx8ktnwU4E4Y?=
 =?iso-8859-1?Q?0Tp1h8griODHvkwl2gTAs+i+QKuZb1Ea0UgVq/TSop0zgmxhX1cHfvTlKu?=
 =?iso-8859-1?Q?PXjf+Z4F4RfktLSpgBYRArSioEU/yEcTw+2jkaD/416WOsLxXgok0edJDl?=
 =?iso-8859-1?Q?8Lp+RNSMRIeGROVwvXqCCARk0G2gM6EqkyAUVuC48Xx3jhYt7EQ2iN5uWI?=
 =?iso-8859-1?Q?H1KPb9mr8nRKMh+e7ZZF9rpmx2Z9gFMI6BSqHtGMuUJyfJyF5zJuXPlyOi?=
 =?iso-8859-1?Q?ju0RZlzaDhnPNg5jJ4QjJmoinvfmoE2BO1U2VDrkzJPhEICKUEtuPrZA+j?=
 =?iso-8859-1?Q?DyMzn4VMyiVKexINpHsUB5MmEYoNb2HLetnzrQ7z14wfjGiRAXJKMXYYhH?=
 =?iso-8859-1?Q?KHtT0Kxr6jY2zPooiFGVFhRUPQsjmH2yOqJjpUq0JP2HDbKYAoionjoOfe?=
 =?iso-8859-1?Q?kjgIrEOrDJjqwSG1Yx3DXLvmae0SlWKzbGks7vYJ3rAKsoBeqWX83F6yRQ?=
 =?iso-8859-1?Q?wCLMb3KbjIpxFgEL4rH/MJw7a0RcG0+dP7dJ2eM7qdiuNeNZu/yXfsqvlv?=
 =?iso-8859-1?Q?wSZvWlWpB8RZWsUXC+NIVbhElxsVGdw34LXQ0IvQSZvZcOZ+Vcx3zuztN+?=
 =?iso-8859-1?Q?Hcq4FMLTvWg80pgV/YRZTrYfbt8+DCFqO72sFBjfvUtLWDRd1pU6fVoMR/?=
 =?iso-8859-1?Q?o7y9ruAq8XGn9DS+VgvQwTFHIGkjjMMA9N9seWLlGpaT42vuBzMv+VNbUG?=
 =?iso-8859-1?Q?LpvBst3zlJU8IcHE334rMPVz1o6LMU4tG07a6OH5T9j8JqpG2lMsI2JMgX?=
 =?iso-8859-1?Q?i+ra5D0z1YEgpzXlU5aTEer4Flu7J6odGbnZLkE0y+d3W7s1Wj6kNDEhRF?=
 =?iso-8859-1?Q?gCPSK/wyD/Dmh2cHB26ABpygFrMyXndYUrEJcaq3o9KyNj8U5uuVzeXNLf?=
 =?iso-8859-1?Q?orcdLbRC82IYteJP7zoep4V3o9h1hrqpnhNjM2fwsyUhBdtmImJyxG9E9o?=
 =?iso-8859-1?Q?hFgJebHV8X/EUzpx7yQPs3tDuwaZWysGkWlg4AJrJXKQoo16DFML/ELGYf?=
 =?iso-8859-1?Q?3aQhl35QRb4Q7ItRplDOslXERW26bShFRnxk7gGX3OBbiWOAsuajNU5Lip?=
 =?iso-8859-1?Q?/PaIWbnBPYe4TUp43f6Lo99k5PlOinEpjEMrCk8SfUWdfYQyWRPpgwKLru?=
 =?iso-8859-1?Q?8Wk/5jjNUWSaZilaH0lTQ8psPLErm6JddWPKkLJUblla1hfbpf5sLOF/Fj?=
 =?iso-8859-1?Q?p4e5pcJAuQ1nTndUPems+lLgK/eAHhMI9C4UpzQv5GvNaXk41ek9G3auMO?=
 =?iso-8859-1?Q?SeTRfLRfU3raKYhpt12HENxhcIOvGhF3Uf6U2C4oXF4A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pMEiq91zc0u8f0kRiziEoFhzOy7PQ5A/LyzWAPbifI6vapd4LO4fjGtzb/?=
 =?iso-8859-1?Q?ivdAqaxFjaWCzlDaOnJnvitO+JkoHX6P9asaN9phsOBhgqz0pNHu0sP+U6?=
 =?iso-8859-1?Q?c2PPx4yVG/wSpTFrvGherX6NEWrmO0lDl874jPWshGXLwZ6HHhnINW48hT?=
 =?iso-8859-1?Q?aiI0ec02gsOcY7Fknm/jG45F3KF6WTwiWL6ovCQp3wTr4d9JfbweKpC9kL?=
 =?iso-8859-1?Q?Ae7QB2bpsriN8pPGVjru9BlFGJ87P46jlI3Mr2pEWWIsw+9UGlDqtyQpQh?=
 =?iso-8859-1?Q?RFj+lBv9oz9DIS/4uUNRGAgSkdjz3vmu7e/tlu6+xOaxtwyjLQoKj+80ET?=
 =?iso-8859-1?Q?uUenerJn2EKdJYgRUY/qDVJVpRfd+p7WzX5XCiA76R0uA68/M0x/mEhqLq?=
 =?iso-8859-1?Q?uao4PqEBAA5zwW9R8eguPt9NFSaBQK1bS6HC1dEdvGrjhhCmla17gwhT6N?=
 =?iso-8859-1?Q?uFwgUkqsdsXzzEsVGcKgjKBKo2I18JRppCNnr4koRmB2t8KnTkagrRZqtu?=
 =?iso-8859-1?Q?ApcAYiudvFZ9xwvUuygHaJz7F2KQ00dyXiYkmlfn1c6JhY16vW30NQ2S6l?=
 =?iso-8859-1?Q?qdttUScGnpeuvjzkRnvYPInPS5OBfYAoaeOUm8qe/zbf+XgYjQiRkLWo0H?=
 =?iso-8859-1?Q?fWPoaHdK3b1GPP87GZ7KglusJURZUH/3ayVIGyTNgO/djnMAJmeN21a7mo?=
 =?iso-8859-1?Q?ak1ZWyDyClW8pRWMQgtAj6vGD/enWtIuFEkp8uf9o9WTlzwyEH6vKvohAG?=
 =?iso-8859-1?Q?AuwxmI7xG0RIDR7rXibtznBOrwml8wax5D4ulEqfbpCbhK4qIJwFmjLYv/?=
 =?iso-8859-1?Q?d45Qzx7NBF3WkvRUrV2tWWY3FkrpUMo0nWYqzNVljg45oYeV9QZJey7kSF?=
 =?iso-8859-1?Q?QnRZSqRtYj3z4LfTDvrkP/wxXRP7D8w9w/+DDk4q9trJr+zYqfjdwCOc/J?=
 =?iso-8859-1?Q?+EQPn9pGLBjdDK0NJZlDPDkuJfYkyzJD6MaGWX16s5AIl5xgN5mwHn8zS7?=
 =?iso-8859-1?Q?n58EuCPkXhfkLU81BHKIzxtqCUWWxj+WP8qr1qbwhlSXZ48wk9iP7c7io9?=
 =?iso-8859-1?Q?RC1LwHvhPF6OHuyj6og47TbASfSmQ/yjwoA9XcfuK7IRCNrJjECm2MikgN?=
 =?iso-8859-1?Q?VijiigaChYnwfvj1P5TvfLuuXnUVcOLrGFaMk2gW+E5MCd6jxUWbSjYOAI?=
 =?iso-8859-1?Q?cF/2LTmfxUECLKyZpLhIa+2zrYEKDITFdLN+NtXTyJB4gzQa97ZJtVnM9g?=
 =?iso-8859-1?Q?KH7d4t5EhiImUpR9N+fueuRCzuRgnnXAZ3s6SIyXseKj81gA1PHYD2z5JY?=
 =?iso-8859-1?Q?XuYnTEbquDTTlRt9+3lV5lQ3Z/A7oW6RUuMFpZrPNOCH9ScAKkm9xUj6mZ?=
 =?iso-8859-1?Q?lZZtpnu7jlT8+FmEnAdLGGmLID/C2O6Z9ESjk6Ps3IhQJBZmldSVDolZY0?=
 =?iso-8859-1?Q?EWQbw09ax2kpRhj1fsdhYKpOvyUQVFdcDOZbEsDGHxDxLRpQI7TeG8xQST?=
 =?iso-8859-1?Q?CSyJ4+wqh8h5qzlzIcIrzlioElqOPb1BYm+xU9vxsmAe+WCyYfdgfP2jvp?=
 =?iso-8859-1?Q?fOG+U5bFvJhmLnGfKRFLceBXq5apxsaHSbXmGQWLpgTtsVsRL+DFx2SK27?=
 =?iso-8859-1?Q?ndlsK++jGYniDgg82GTUF1PycK0yNbZODjN+3OVoFo7tS1ZLeQsWda5w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf971ea-a188-4424-6323-08ddcee640be
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2025 21:24:08.0416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rDgCNnUsmV6DcG5CByTsTMvjVhMNmT6h0WC4gJeypSg7uj9cTgFdkEzeO7vMnyfQDPUdMPODngBrzftDXPy2/CAm4kHBIBYHlSRBa9NsZ9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8452

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/arch/x86/irq.c                | 8 ++++----
 xen/common/event_channel.c        | 6 +++---
 xen/drivers/passthrough/x86/hvm.c | 8 ++++----
 xen/include/xen/irq.h             | 2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 556134f85a..e70c7829b4 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1325,7 +1325,7 @@ static void clear_domain_irq_pirq(struct domain *d, i=
nt irq, struct pirq *pirq)
 static void cleanup_domain_irq_pirq(struct domain *d, int irq,
                                     struct pirq *pirq)
 {
-    pirq_cleanup_check(pirq, d);
+    PIRQ_CLEANUP_CHECK(pirq, d);
     radix_tree_delete(&d->arch.irq_pirq, irq);
 }
=20
@@ -1383,7 +1383,7 @@ struct pirq *alloc_pirq_struct(struct domain *d)
     return pirq;
 }
=20
-void (pirq_cleanup_check)(struct pirq *pirq, struct domain *d)
+void pirq_cleanup_check(struct pirq *pirq, struct domain *d)
 {
     /*
      * Check whether all fields have their default values, and delete
@@ -2823,7 +2823,7 @@ int map_domain_emuirq_pirq(struct domain *d, int pirq=
, int emuirq)
                 radix_tree_int_to_ptr(pirq));
             break;
         default:
-            pirq_cleanup_check(info, d);
+            PIRQ_CLEANUP_CHECK(info, d);
             return err;
         }
     }
@@ -2858,7 +2858,7 @@ int unmap_domain_pirq_emuirq(struct domain *d, int pi=
rq)
     if ( info )
     {
         info->arch.hvm.emuirq =3D IRQ_UNBOUND;
-        pirq_cleanup_check(info, d);
+        PIRQ_CLEANUP_CHECK(info, d);
     }
     if ( emuirq !=3D IRQ_PT )
         radix_tree_delete(&d->arch.hvm.emuirq_pirq, emuirq);
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index c8c1bfa615..2efb5f5c78 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -672,7 +672,7 @@ static int evtchn_bind_pirq(evtchn_bind_pirq_t *bind)
     if ( rc !=3D 0 )
     {
         info->evtchn =3D 0;
-        pirq_cleanup_check(info, d);
+        PIRQ_CLEANUP_CHECK(info, d);
         goto out;
     }
=20
@@ -743,9 +743,9 @@ int evtchn_close(struct domain *d1, int port1, bool gue=
st)
                  unmap_domain_pirq_emuirq(d1, pirq->pirq) < 0 )
                 /*
                  * The successful path of unmap_domain_pirq_emuirq() will =
have
-                 * called pirq_cleanup_check() already.
+                 * called PIRQ_CLEANUP_CHECK() already.
                  */
-                pirq_cleanup_check(pirq, d1);
+                PIRQ_CLEANUP_CHECK(pirq, d1);
         }
         unlink_pirq_port(chn1, d1->vcpu[chn1->notify_vcpu_id]);
         break;
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x8=
6/hvm.c
index a2ca7e0e57..1c545ed89d 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -296,7 +296,7 @@ int pt_irq_create_bind(
             pirq_dpci->gmsi.gflags =3D gflags;
             /*
              * 'pt_irq_create_bind' can be called after 'pt_irq_destroy_bi=
nd'.
-             * The 'pirq_cleanup_check' which would free the structure is =
only
+             * The 'PIRQ_CLEANUP_CHECK' which would free the structure is =
only
              * called if the event channel for the PIRQ is active. However
              * OS-es that use event channels usually bind PIRQs to eventds
              * and unbind them before calling 'pt_irq_destroy_bind' - with=
 the
@@ -329,7 +329,7 @@ int pt_irq_create_bind(
                 pirq_dpci->gmsi.gvec =3D 0;
                 pirq_dpci->dom =3D NULL;
                 pirq_dpci->flags =3D 0;
-                pirq_cleanup_check(info, d);
+                PIRQ_CLEANUP_CHECK(info, d);
                 write_unlock(&d->event_lock);
                 return rc;
             }
@@ -536,7 +536,7 @@ int pt_irq_create_bind(
                     hvm_irq_dpci->link_cnt[link]--;
                 }
                 pirq_dpci->flags =3D 0;
-                pirq_cleanup_check(info, d);
+                PIRQ_CLEANUP_CHECK(info, d);
                 write_unlock(&d->event_lock);
                 xfree(girq);
                 xfree(digl);
@@ -693,7 +693,7 @@ int pt_irq_destroy_bind(
          */
         pt_pirq_softirq_reset(pirq_dpci);
=20
-        pirq_cleanup_check(pirq, d);
+        PIRQ_CLEANUP_CHECK(pirq, d);
     }
=20
     write_unlock(&d->event_lock);
diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index 95034c0d6b..958d0b1aca 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -185,7 +185,7 @@ extern struct pirq *pirq_get_info(struct domain *d, int=
 pirq);
=20
 void pirq_cleanup_check(struct pirq *pirq, struct domain *d);
=20
-#define pirq_cleanup_check(pirq, d) \
+#define PIRQ_CLEANUP_CHECK(pirq, d) \
     (!(pirq)->evtchn ? pirq_cleanup_check(pirq, d) : (void)0)
=20
 extern void pirq_guest_eoi(struct pirq *pirq);
--=20
2.43.0

