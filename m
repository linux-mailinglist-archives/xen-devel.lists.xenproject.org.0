Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B53C6BFC522
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 15:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148085.1480289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZKK-0007Zf-7s; Wed, 22 Oct 2025 13:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148085.1480289; Wed, 22 Oct 2025 13:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZKK-0007XE-3T; Wed, 22 Oct 2025 13:56:32 +0000
Received: by outflank-mailman (input) for mailman id 1148085;
 Wed, 22 Oct 2025 13:56:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0J7Y=47=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vBZKI-0006dh-6v
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 13:56:30 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e794f6af-af4e-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 15:56:27 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by DB9PR03MB7644.eurprd03.prod.outlook.com
 (2603:10a6:10:2c0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 13:56:20 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%3]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 13:56:20 +0000
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
X-Inumbo-ID: e794f6af-af4e-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHT1vCv5OJ6Kw6yx2ndd7nfU8JjOfmIhqYuUxtaYTWJLOIHt1gtKZmy14izDShf/oW0UE0gJUYmM2/RxbdLpdLAi/GibId2ry+S4OZCPExyiKBQVtCPnqSet7W8FpM/3fwREwO5zhtRQshq4kvlcuja3PPUEGhj6MlBz3aUhXWqcc5jfrzupqZNsdqy4AfFadWQhACFcAaDEizNWFlbAIeprLUjUdJkJbFui6B9Cx68b4OlhiNJ7tLANNR5ASWjjsHMTLZhdSkYszhYK0a8aeWkMyH0qgvgBHI4HDgTaKC6VsnP8wfjNl7ib1/gi/c3jV94Hzz3EnW2KU+m+G+1WYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4q2ERY8z1YkOJ/qzXcGeazI8Hc1TmtMX+FXKwqq1es=;
 b=U38DDnL8KUX0DelJK+QtKJ5WiLf0hLfygzkdNE/yq85za+dMJqONecGvQH9Az3h7XW4rupZpTBZakVoIq3D75OOZhX7EAQy2p2fwBgPJ+QlJIuYThlDpYXfmckJP4m3zhGZM4v24FiB4stGDgeDradlCSoZqFDvZ3TbTz7EllBQl+FYTC4CrtDZgnqbA2fjY9JvKsfCXK51Bko9hxy952+a3kz3O/rXqI5V97HtMKl9CTi1rUoTnoix01+Dlmj+URXBB8zWmuzsRVLyIkH1pETfAaZKYrIt2vrvZIM1pUmGkCbt/wxoSMNZW5WTTJ+icmjM+t9JVWOjCNDrtGCruUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4q2ERY8z1YkOJ/qzXcGeazI8Hc1TmtMX+FXKwqq1es=;
 b=am5yJowA1oSfWPdPu+Odw4uvMWyGUb3gBZYpdCoQLO43TsdqzBfnyTGivrB9eEcwx4U4+iOSpRcFvKtPhYFyI18SGxLo2tdLm7F0vei23/CJNc/SbpCciif4K5pjW4xTtFLXluC/G551HIiS+xbjfiXjE42zKP/yvm5Ep6QWabDh9GnWreKKe9ChmN9LYcq1GQJhUxUblhkfd+blsUrE7jDorF8fgZPi6AoEeL2MshJo65FdBEJIisBbzuKA3zBUEDC2VcnnfrkYgIJMuEqyEPJPNMQWNAFoFfEAlII8R4cUcAIc4waqwzwyPVx0YZS8TXZlPqwD785u5wkjBFtx4Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v2 4/7] xen/pci: introduce has_vpci_bridge
Thread-Topic: [PATCH v2 4/7] xen/pci: introduce has_vpci_bridge
Thread-Index: AQHcQ1ukNEKjg16rGk+lyJ9FIGFVYg==
Date: Wed, 22 Oct 2025 13:56:19 +0000
Message-ID:
 <1695581f037a8361ef284a5e51bcbce9891b8110.1761134829.git.mykyta_poturai@epam.com>
References: <cover.1761134829.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1761134829.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|DB9PR03MB7644:EE_
x-ms-office365-filtering-correlation-id: f266c880-ec5f-4ebd-beb6-08de1172c77e
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Z/c33tg0RKynQG99V+veQyq9zl+uz0zpyl9OTI1OjFWa4zBIJZIqYL9/99?=
 =?iso-8859-1?Q?2exZgW+4skRLQCz+RzWqnN9WUqX+aBDUQcekzAeMqkZzuQdbVXrx1jNLgG?=
 =?iso-8859-1?Q?QYRu7hsNzcB9y4ExQPqt1EvRgY2fvfTZeLl9Q44Lb0kRFNPgoHHSJsdTUl?=
 =?iso-8859-1?Q?ECGaTF5XqYAIUNDA/jI7ZZciV4wVNWNd3yMrJYtzx4pTbZ01ZPkHfiOzYH?=
 =?iso-8859-1?Q?/1XSktyrr235NA4yMGLD05UEz2hNV0UgkrPyE0XogLWy5uBmW+kqv6++kQ?=
 =?iso-8859-1?Q?4XfLXyLLA6XItCXZZHP7GY8TAo9mPoOns5rcnraDvW0CStYbVfwDtrOQNt?=
 =?iso-8859-1?Q?yda1WvGpAIqJj6OVHCeGP9EaFo3f+Tbgbinmc+Xvma0cpqEO2qNYuGp25f?=
 =?iso-8859-1?Q?hAz3P06INiO5vAsx0B1QjBW2Y4HBrIz50Xlj4Wrbx61AL/OJnatZOh11Gl?=
 =?iso-8859-1?Q?HvPqpvjceXux6WrzSBu3h12k2qz/GuChpj3HZ+tEK8CQvzgfcXtZPu60t9?=
 =?iso-8859-1?Q?6hyNelrdzpkGMqmxXrDh03wUw8GqBTE5S9wya7zNCV6fYs7LDP2YKdTehZ?=
 =?iso-8859-1?Q?uEFxrQCuy3v6dhT8Xq0vHcKcHX/DJ4c6y7X/nmdFZRgv5fcjEkNN6ymDFa?=
 =?iso-8859-1?Q?nZDRNiiArNG4wR0vK8tLnZoqfEG7S+JZcpqoBQP+hLmRpNH6cMzbl+0dbk?=
 =?iso-8859-1?Q?q59QglLr9rUqD0ETQiXyfcusy9xDo5APWvFmq15XCbMFjRyvT6tKvMgd5R?=
 =?iso-8859-1?Q?0fakfUrKEHupH4B4m1KfjI1pCPdim67UDcRZaLr1vhTZr9Dvj5ZAbVCqPN?=
 =?iso-8859-1?Q?nao5CgaLWnEAeHVIEp+zf75766XZR1VwTeyG51Zc4CVt3p8PYI3CBCiRqi?=
 =?iso-8859-1?Q?TwqIG9jey9i1nqBM4beflbZpXPtwZ+LsLrtrYXnAlQid7a9b9lYJLkWNrF?=
 =?iso-8859-1?Q?4dJ8bE3rvx3yvMg01KPQDhptO1Lg74kWhUgQexNoIah25fSJr/NOY8cupe?=
 =?iso-8859-1?Q?3qO+qhWc5F4I9qA4c7bHja2YzRYCaCezYPAqzcMcnjGg5WJJTuaP8x6xOA?=
 =?iso-8859-1?Q?5RBVsg0oJPtsmtsCDu4mIGhvgnwfyC2cplN5XPL24Ltk6YXqWxDlN+dvkq?=
 =?iso-8859-1?Q?dgqXvfAaawPg3r5YfX4I4luTqjaVp4gJYmL8IZLRWWn+lrsbA4UECIAt2E?=
 =?iso-8859-1?Q?01MhBCHbHgaQikP5z97i4TsSbGLkigBRaldptl0YlbqzVKmunqkDUO6Us/?=
 =?iso-8859-1?Q?gc+PgZNL0ENQH71qCxkRM1ILTsOTLJlZXOJnR2feiMT8A6dEb76W4Eq2JR?=
 =?iso-8859-1?Q?S70nJQJbZL22b/38I8GmKHxTVcgK7LgcRjxxMMTspxqB/2jwTURdR83Zd2?=
 =?iso-8859-1?Q?8s9sV6ncxewe5XDHmo22WTst11jkiM0IzOMf/hJ/e2sq3aHxauKdv6ZLiq?=
 =?iso-8859-1?Q?TlLFDPmUABo8zzyAfMtEoOWJpIrLFTydngss1CiVO7x2Yj4Te+6s8342gv?=
 =?iso-8859-1?Q?5RuYAguZ8SlN71AqsA1Kku2XVUB98mrSMd0+E1EUDXEaLJ5AXpwsdaj6Fd?=
 =?iso-8859-1?Q?Uf9SwzlcZuvIG9C6SOXkBO/7WLue?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?O5a4+rbrt2a/nV3BcUWlA6AQ/nhWXw8FCPl2B3BdIFy7ZswGLCrxC3aAnb?=
 =?iso-8859-1?Q?yT/FBJwYYdznOSSYrcEZKbd/jhqv1dUuIaQ18l4LB6ruM8/4vWfjltsqwT?=
 =?iso-8859-1?Q?pbKWtTa2XE3lW10MiPO0mTdrXCG5VW+VoddoYocvPxZ0nQFaDfdlOyhidj?=
 =?iso-8859-1?Q?zTZ8KoICgzDQtyQaG2s6N5m6IfzwhEZhGR5DNlggBWUcqERw1u2wJ2NMnY?=
 =?iso-8859-1?Q?cRbM27wYKAWeC6ygK0saaRzYURIzgr6/ahyRLhik4TbbJCbgvUt1In1P62?=
 =?iso-8859-1?Q?hSFQyuDVPMMbuAfzq9+3g/rJRYbF3F+cZETGwYbr9AaP0YINy8ZxKk7PE4?=
 =?iso-8859-1?Q?PZTPSHqVHvt3kvJRw7lIBqnzmRhuzqWTgvzxs3Tk0iirZEi2JLHwh4xeWR?=
 =?iso-8859-1?Q?stMQCY6w5AEx4qrPK09/8mmqC9bV7I431r24P0icAlvZygn3GJi+plIGRm?=
 =?iso-8859-1?Q?Q1yVPGZiooJLlsbuaxQz9n65w3Wv0wqSSVwFxFVi1hlSwmHQYT8Kzzs+/7?=
 =?iso-8859-1?Q?6Y8+OJFB0m9oskGjCuiP0vpOOhH1AaPxsSGRvIH5OGt/YnBMyvw8x/gQU/?=
 =?iso-8859-1?Q?AmUkTdEqLTRP4VD5ZL6pvtEZVwuyTaOJg37HMAmeKm3HbQETyvr9u57772?=
 =?iso-8859-1?Q?Y3uQFYRVJVP8zioWF6dOqYMymiEUMZgtekFq6KepaTZoQJB8EO9gDaHto/?=
 =?iso-8859-1?Q?djmALMRilN/dqVL3Ei3EmkspSusPshosOaUeNgbCaNBTdUGoW83OuFXA2B?=
 =?iso-8859-1?Q?hayKNkqhLC74KRc4+nO8FC7xZjNVsV21fX2QqeHVGFN3PtHDkER+Tq9QhR?=
 =?iso-8859-1?Q?OoowgIXkEfRF0ksKHOs2ELzc8ti/lMVxc6Nf5lA9lDe98QHM/fg5RlzdKb?=
 =?iso-8859-1?Q?2tkxV12GEVtvdt3KdKZpnfQZIVHLpgPPeNuR+0f6Xw368e8YY9U6PPLUHt?=
 =?iso-8859-1?Q?093dlxnen4TCdPTxSr4CKGJgYEja/5LLRFAw5rA/l/gV50ATbhWSqdUn4u?=
 =?iso-8859-1?Q?RqmSi8WRjGMdrBWuJSa5heC8JdlJ+tCzztFm8iZRUMI05aAPuTCKrqO/A+?=
 =?iso-8859-1?Q?t6iJ+exlvNuOUm9Kw58Zk558UBYZnQA4kjUU7lI2bxffajNM5cju4pNXKU?=
 =?iso-8859-1?Q?oVTQtnfqGTRowosWW5rk552cB3/wPSC17psmplRldFo094nBLOQVyoyzaL?=
 =?iso-8859-1?Q?B4Ek68v0pFKLf/iKqeocGV5fu1tDX6FqSm278A5ZUXET1izru3AdFnjr9i?=
 =?iso-8859-1?Q?gq3K2g+ElLKZtsVIdm9+pB04Rwiyg9w449v6aSs2vYtG330QaPKMD0Ewue?=
 =?iso-8859-1?Q?848mOQ6S+wzp9Ze50qlNO8/noqWXFQi3cICPVcN1v05p+7JuJX1rHWCXGg?=
 =?iso-8859-1?Q?mp445dvCOMFAJIBytOvxWTdFlZtMcEjU5+/kpryfFDhbYTRXKCkXCJOF1+?=
 =?iso-8859-1?Q?OV1/tw9fgJYzaY0IAO5vt7qBSi20rGY0Ogv2XV1eFIc5H94yrCQsUaNlME?=
 =?iso-8859-1?Q?uSdWPcMRaVCRI4M543lUokXvUs4BpY9GZawproUVP4H3/ZlA7HxCcmWxQE?=
 =?iso-8859-1?Q?K/fCleb59HIjl7xBZZkPUZSiTlF6wkF1Yo4vm1H4RHJDCZHCIAdjhwtOtd?=
 =?iso-8859-1?Q?WaXg9DFDUEzE+pMsbt+YvTKAMAFMZXFHaX/PDOnRlY9CvZ4+G5jLwe+Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f266c880-ec5f-4ebd-beb6-08de1172c77e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 13:56:19.7991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AiM98QfBJbhpYEzW/YRDBjshwF62asKvT4lHlidRbBHuJDi6XSh0FGUR1wAuty1ZD6Z2tkQpAiMYBTUrCO+dQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7644

From: Stefano Stabellini <stefano.stabellini@amd.com>

has_vpci_bridge is a macro to check if the domain is a domU or is dom0
with vPCI (pci-scan=3Dyes) enabled.

Use the macro in drivers/vpci.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* simplify definition
---
 xen/drivers/vpci/header.c | 14 +++++++-------
 xen/drivers/vpci/vpci.c   |  4 ++--
 xen/include/xen/vpci.h    |  8 ++++++++
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 469f497744..903168ff96 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -230,7 +230,7 @@ bool vpci_process_pending(struct vcpu *v)
=20
             read_unlock(&v->domain->pci_lock);
=20
-            if ( !is_hardware_domain(v->domain) )
+            if ( has_vpci_bridge(v->domain) )
                 domain_crash(v->domain);
=20
             return false;
@@ -492,7 +492,7 @@ static int modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
             }
         }
=20
-        if ( !is_hardware_domain(d) )
+        if ( has_vpci_bridge(d) )
             break;
=20
         d =3D dom_xen;
@@ -522,7 +522,7 @@ static void cf_check cmd_write(
 {
     struct vpci_header *header =3D data;
=20
-    if ( !is_hardware_domain(pdev->domain) )
+    if ( has_vpci_bridge(pdev->domain) )
     {
         const struct vpci *vpci =3D pdev->vpci;
=20
@@ -564,7 +564,7 @@ static void cf_check bar_write(
     struct vpci_bar *bar =3D data;
     bool hi =3D false;
=20
-    ASSERT(is_hardware_domain(pdev->domain));
+    ASSERT(!has_vpci_bridge(pdev->domain));
=20
     if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
     {
@@ -747,7 +747,7 @@ static int vpci_init_capability_list(struct pci_dev *pd=
ev)
 {
     int rc;
     bool mask_cap_list =3D false;
-    bool is_hwdom =3D is_hardware_domain(pdev->domain);
+    bool is_hwdom =3D !has_vpci_bridge(pdev->domain);
=20
     if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
     {
@@ -829,7 +829,7 @@ static int vpci_init_ext_capability_list(const struct p=
ci_dev *pdev)
 {
     unsigned int pos =3D PCI_CFG_SPACE_SIZE;
=20
-    if ( !is_hardware_domain(pdev->domain) )
+    if ( has_vpci_bridge(pdev->domain) )
         /* Extended capabilities read as zero, write ignore for DomU */
         return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
                                  pos, 4, (void *)0);
@@ -866,7 +866,7 @@ int vpci_init_header(struct pci_dev *pdev)
     struct vpci_header *header =3D &pdev->vpci->header;
     struct vpci_bar *bars =3D header->bars;
     int rc;
-    bool is_hwdom =3D is_hardware_domain(pdev->domain);
+    bool is_hwdom =3D !has_vpci_bridge(pdev->domain);
=20
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
=20
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 07c7071d0a..8ea89b9805 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -48,7 +48,7 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
=20
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
=20
-    if ( is_hardware_domain(d) )
+    if ( !has_vpci_bridge(d) )
         return 0;
=20
     /*
@@ -429,7 +429,7 @@ static const struct pci_dev *translate_virtual_device(c=
onst struct domain *d,
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
     const struct pci_dev *pdev;
=20
-    ASSERT(!is_hardware_domain(d));
+    ASSERT(has_vpci_bridge(d));
     ASSERT(rw_is_locked(&d->pci_lock));
=20
     for_each_pdev ( d, pdev )
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 9ae75d946a..d4695cb353 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -339,6 +339,14 @@ static inline int __must_check vpci_reset_device(struc=
t pci_dev *pdev)
     return vpci_assign_device(pdev);
 }
=20
+#ifdef CONFIG_ARM
+#include <asm/pci.h>
+
+#define has_vpci_bridge(d) (!is_hardware_domain(d) || pci_scan_enabled)
+#else
+#define has_vpci_bridge(d) (!is_hardware_domain(d))
+#endif
+
 #endif
=20
 /*
--=20
2.34.1

