Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614CBB36757
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 16:05:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094532.1449838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ0-0007Wr-W2; Tue, 26 Aug 2025 14:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094532.1449838; Tue, 26 Aug 2025 14:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ0-0007VP-RJ; Tue, 26 Aug 2025 14:05:46 +0000
Received: by outflank-mailman (input) for mailman id 1094532;
 Tue, 26 Aug 2025 14:05:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqrf=3G=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uquIz-0007NC-CP
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 14:05:45 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf3f614f-8285-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 16:05:40 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PAXPR03MB7887.eurprd03.prod.outlook.com (2603:10a6:102:216::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 14:05:37 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Tue, 26 Aug 2025
 14:05:37 +0000
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
X-Inumbo-ID: bf3f614f-8285-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atW9qu9G7x2q4/6ECCCfLi6LSzipvaf0TnxZHCtwK5R17KpMl2tQHCVfusHG14UBSwBqSnrCu5G1YkdwrV5Zr+XNDkI0YbyiXzhAU1hseoJoiorm+Hn6AwsxVdMz1rgS66/Yj41mZmU+Bq905bfEUKCW+FFt/v+X7BxTpipBCLmdJZbA3KA641dRmqGTwALpndup2rG7R/uSZV8P965QkH/O/y5k8bnljopT/Nxqq6TVlr1aEwsXrtI50vvjq5qJTbAg99MMEp63OayRGKENvzsUy/be+fp2xen7m4m9CaSueXwcieC8H6IsBrbt5AaZaX8Z4IWv4TQ8PAaRqvB6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTyOpackm+Xo8C8f+moclgHp+nc05HEzvChused5+4U=;
 b=q92yMq2uJOcuKgJSl47D0zqRRgfZNi7/Oy0duza8TWa13TmSccVbDjZHfIMdPLhF0vTWONIoVCoriBo6dwbJeux7vnSYr21m2WxtMV4G86zSnMK3sLuGF8NOtdXmEwSECkjNcfts+ssXqySUgX56cJZE8LatcCIjAlGH9+alO2P+zG7Vsse7oCL1CZym6PFDOMF2LUgZIaZjucgrcFV3FLvjEP9A75ZbPSJIzeDHb+kPWAwTVt7jzuRFEFdb4FliA5+R7q3A6YaOIBNWvgOVUdya8dc1Wz8roMbIZcUmUi0IPDNeiec+yhSjEETjLYGKlWHUtK3Xv9NeXsj4xBVatw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTyOpackm+Xo8C8f+moclgHp+nc05HEzvChused5+4U=;
 b=oOwJH2of5njzLd7RJc4f6imFA2JPWCpLeakLULPdueAX3B4rnhGFQZVA6W2UxINq/T4Ajq8od0CSsOq0OPWd/FfY95leyi4pMM3KRe4hkgzCWoyQARqnmdjMcX8EhQnsRwA5hP/CpQ7LOP+Lxx6Cq778V9eJSjG/t6aX/NAqg+JGDUWRRb8rEk+bgRBdEq7Xm33z2HB9av5UaZvweUXjOpQprt9liMqUqNTIj8SUofHpo4TBHpYE4wj2rUWRsM52fMTPKNebRbj+4iLPU5Hoii+0LEIhSjQuSWCy4jQoSUz0Dfi19l0ZaK5bkgiLKLSYkP/JInkwc2QVxwojgQ8qgw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 02/11] xen/arm: gic: implement helper functions for INTID
 checks
Thread-Topic: [PATCH v3 02/11] xen/arm: gic: implement helper functions for
 INTID checks
Thread-Index: AQHcFpJ/l4cyfmMsSUSuASmV+4e1mw==
Date: Tue, 26 Aug 2025 14:05:36 +0000
Message-ID:
 <4a865061abcfe626ffb8c134fe2353fb5675dc86.1756216943.git.leonid_komarianskyi@epam.com>
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
x-ms-office365-filtering-correlation-id: af334bac-87c9-4f52-5b90-08dde4a9a1d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?iaEsmZq44ux0QgbBcdnPYG++nEMomhO1WRzrmsna11ihWfiXZHmF5XyLkY?=
 =?iso-8859-1?Q?CwkdqoGgclhpTjjUXp63+FqmGfDNghmT1mVql7lAizbPwKRqXDPqT0qBex?=
 =?iso-8859-1?Q?FELx82KwAu7wIUsQENeIKTSr4s3oz8Ywo4tVex3gS5gIIk1k3ysoDF6tkG?=
 =?iso-8859-1?Q?2L3D9C4Hrf/F5q2UxNHTC04FsF5FO5YKUleN+qaqTs+ec65K86uS/u3cKX?=
 =?iso-8859-1?Q?NlhWuvyObdk5YK9nZEVvV0KH2x0hZthNj6zAEm7+WUGg4r9Bt4fLa0rHa0?=
 =?iso-8859-1?Q?Yebn1NK745DwNi2/cQuNvWQlcfflHu5Aj+ZZAIGdneJ1gRQct3gMpKyC+K?=
 =?iso-8859-1?Q?M5MIn+SGJam02dFbaDuehwRyW/qXf3/UTesZWdIf/meGHfQhK/mUn5WEI6?=
 =?iso-8859-1?Q?98o2Lg46xXmo2PzbMNnQo04O/5ZNeXIL9BueXkiAu0ks/87ClpkvNjdSlp?=
 =?iso-8859-1?Q?sBI/KWwV4TMfiawbDy4iWx1ra6W43IHsIvf2e5lBqfs11AofWwLW2YzqXA?=
 =?iso-8859-1?Q?UhriXmep+GtgbEU/wCtUVXMNdOlr507erYIqQE+x13ZBsIbKLCZLIWcG8X?=
 =?iso-8859-1?Q?/R/85kz22lvd6pAAbt/6qiuzVOxJecvnI7I14Rr5eliMVTrVk2IVJDc+1L?=
 =?iso-8859-1?Q?JpRYxUKjplN60Xwz3ljeT9AolQqrfqIFqAjwTo5BGS8aDSHfnh09ypB+GW?=
 =?iso-8859-1?Q?UA8gJMVBMGz7ITAmRc8MKTTvV4Ha8pB3BShnlxhG47WXIupfEfidOQ3tWj?=
 =?iso-8859-1?Q?jlTcNidYn3fRoR7RaiG8cDENB2GKD7TRY77GyT/zS6EmicvpMb3b4KaCrJ?=
 =?iso-8859-1?Q?/PjCrzy/8H81wq/qmUZqYe4TmUAvh3cPl8EIVcZVtrQbbwM8DmNYla6Vc/?=
 =?iso-8859-1?Q?kXvKfpf6V4tTVLpX0c+H3OyAc1BwJ/sOphN97ASQlVZFPnLLUi6ePwOjMs?=
 =?iso-8859-1?Q?ar+gc1yhq3U1rNJilREwJnqEubs6pdIgc3Np8jTw+rKRFVT/90BENEpYit?=
 =?iso-8859-1?Q?8IjeTtR1fmdNcKpM1OIRerjzgAK9GJ8Bt+0GCn/jnijbz5cEsCIc8gmJMi?=
 =?iso-8859-1?Q?dPOOiN9PglfSR8USQ2l3OgI6M6ImYnmJpIags5V2Et7ZCboZwgalKDhDz/?=
 =?iso-8859-1?Q?ZFBTfnsld6pB2cyDKg7oHqklBbgVhsH+ZfB8eLUQvQreMxJTfTnyI+t3px?=
 =?iso-8859-1?Q?G4OWyym3OyvU+lxvdacMPe+LZAMz2TzEIunsYVJOp3ct780n3bEix7AbJ0?=
 =?iso-8859-1?Q?+8lD59YWJD/Jwpd8i94MPJz40Kn/fRG3BsnbG+5MuD9ghwEu8lpB17J5l6?=
 =?iso-8859-1?Q?JNDjk8mzargssFxMBFsszBzlXp4hnUkvX32PgeF7vXJVkakI6eFUah/vhe?=
 =?iso-8859-1?Q?199GHLCqq695gXsqU+hLc4gM7FmCInyvxxDxYRkSDWsivHml/1Gdruhnpr?=
 =?iso-8859-1?Q?ibytUMrxbA5MaVHZQD8oyflqibdKlct6pk9BDjdD0k3xJfQfluKNdwcgw5?=
 =?iso-8859-1?Q?7IKkBvldlNkZ3NMVtR3LkBuEt/FvHF8cDP3ZNRkLZgjg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pnCXn4LAAdF6mGej7hwYeR+z1y4Zg0gZkYb3lP//ZQCndTstUIZOjXdKsz?=
 =?iso-8859-1?Q?K76IeRvDQ/faoXpxCUMt6G/0MuoFAtVbbU2bejYsSPNEylf5bD2MUV1xdL?=
 =?iso-8859-1?Q?FGZMeVnA+pAbbEpKBvXrjmx03tXYmumMMmdDu8pnKYQ7LBkWJUeDJCJVM8?=
 =?iso-8859-1?Q?VctQ5dHkn+tpLBDpvkU6giWmWAb5e+dTbsLV3qCn9lfR5Jiz+/R2QwYPhQ?=
 =?iso-8859-1?Q?bfgSV4h18hTeTI02FxGR2xd/AVdacFZWQfy8IVx8erJcnoSL6k+TWEu06O?=
 =?iso-8859-1?Q?oswSqSY9cpCu9nyT5SZ73Wm4kgJmoFYMWau+QPqwwuU6J07ZkWAb51sq2g?=
 =?iso-8859-1?Q?LABnZXZXWmClyLwQa8DxOUxTM7pNi5h8tytlkVnRPogYJjIpChLqTuJJJA?=
 =?iso-8859-1?Q?SVmQHutRWoazFf8RfIADHMpgl/mD0CBPnE5fAzM+sirKH2mtZWk2nwZziD?=
 =?iso-8859-1?Q?PVO/fWJJzNvfaCQwITFNoXMUAToVP+o2nTa3pxoOvnsUk4BGefsWap05HE?=
 =?iso-8859-1?Q?g/9RDitMehZNeHguk7HTLYq0CFHWc2KQbISPP2SOZwIng3DyJmkLLmnmSD?=
 =?iso-8859-1?Q?pSqPHfP762jObFmTXmM74ABYgiCeaBiqBiEprWhX1PhnQ7YWMb9tkAcNJw?=
 =?iso-8859-1?Q?A0WJ2VBZTnQtnhj97MmjN3YVxQR/E8I3giTnjakubFH6ssPJFYO+KJ3+7i?=
 =?iso-8859-1?Q?y53PFniOIjuos56GuDYJ99L93jiKrpHKz21Ei7+BOPp+HtoPzJLUFPJ9Ez?=
 =?iso-8859-1?Q?wbo97l1Gy+hnxbFcM6PkE4A7JlyyHsj+kk27YM2jr8jvaHUmawN+uYsKKz?=
 =?iso-8859-1?Q?I5J7dVyCSWSxI/HBfaJRx/Waus1yb0pICY2RMaj41NKHIkaqMxUDQqwaQq?=
 =?iso-8859-1?Q?TiifzBdqIknSiucGKOzBu/yGgbdGwSmLo06AmMjHoyQX4LHovAIFIGGuxn?=
 =?iso-8859-1?Q?Zj5uXxbD63vrD/YdTazsmQZQOmzaoOgDJxgoQDKWadkNwrACpLahWFRLTi?=
 =?iso-8859-1?Q?rs/ogjlqB8+3x1jA+n96PtaloEQGh4G5llaq0r7VZaU5MBLkPFxDjduo/V?=
 =?iso-8859-1?Q?qUrpS0z3F3vSolJazWoy2z0lAe561IUAiidDUPf088pdSF6HIuDxidyXka?=
 =?iso-8859-1?Q?l0y/0F8dVigZwJ49TPvxrTIP93Cxd36dV/7huTAm2laiWiD29BLn0/So4K?=
 =?iso-8859-1?Q?YrWDBHua4+4Yvra2oD2U1dtsMBVFyWnBoOaGLdul8Fv8AvhDa9zztZnvKa?=
 =?iso-8859-1?Q?3nnaOROo2dThIhmQ3Uv+9vRc0BgeZT1R6YYpYL0tCGpZFj6GEBFbsAmUVp?=
 =?iso-8859-1?Q?I9n8YnNkQlZMz3kup8N1MkSKU1SNwPByFN8wsCkS7q/sfnqKcRzmGaELzS?=
 =?iso-8859-1?Q?OgtcqWV06zdorHDtsomA7e/zBRIzDussnltoF58a3XssoVPYVHFj2nDLZL?=
 =?iso-8859-1?Q?kCw6bg4WnXhDXHep0KFxxFuDbWtpWDOHBrsisia4F19Knss0Mtxkm8+2Ry?=
 =?iso-8859-1?Q?434DMetvnGbQz6FhL5ZJnAXUEeejANqYjpjJE1c7K59WviUIZya7JQ3stW?=
 =?iso-8859-1?Q?RR9JmZcG4sS0dFco9NejBmCO7U2bN4qH1ZSM7QSi4zBieku75EqP3YttnA?=
 =?iso-8859-1?Q?LDmBScmdEhZV/ofoBGAqHXFCv4a6I68s3LMkODG7fYzXquHyoheQgnWfzB?=
 =?iso-8859-1?Q?h8bs0d6lvCg++VhnRX8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af334bac-87c9-4f52-5b90-08dde4a9a1d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 14:05:36.7399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bWx3GY/zqG8C+SiYWIMgK+z/hM598INaNeKO/02ewEkvZf+U8V4RAYFdQQXwN3nnsxO6XWwrjxqJT80fLmDkPdul60yoiVipZFicZvKkD9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7887

Introduced two new helper functions: gic_is_valid_line and
gic_is_spi. The first function helps determine whether an IRQ
number is less than the number of lines supported by hardware. The
second function additionally checks if the IRQ number falls within the
SPI range. Also, updated the appropriate checks to use these new helper
functions.

The current checks for the real GIC are very similar to those for the
vGIC but serve a different purpose. For GIC-related code, the interrupt
numbers should be validated based on whether the hardware can operate
with such interrupts. On the other hand, for the vGIC, the indexes must
also be verified to ensure they are available for a specific domain. The
first reason for introducing these helper functions is to avoid
potential confusion with vGIC-related checks. The second reason is to
consolidate similar code into separate functions, which can be more
easily extended by additional conditions, e.g., when implementing
extended SPI interrupts.

The changes, which replace open-coded checks with the use of the new
helper functions, do not introduce any functional changes, as the helper
functions follow the current IRQ index verification logic.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V2:
- introduced this patch

Changes in V3:
- renamed gic_is_valid_irq to gic_is_valid_line and gic_is_shared_irq to
  gic_is_spi
- updated commit message
---
 xen/arch/arm/gic.c             | 2 +-
 xen/arch/arm/include/asm/gic.h | 9 +++++++++
 xen/arch/arm/irq.c             | 2 +-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index e80fe0ca24..9220eef6ea 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -111,7 +111,7 @@ static void gic_set_irq_priority(struct irq_desc *desc,=
 unsigned int priority)
 void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
 {
     ASSERT(priority <=3D 0xff);     /* Only 8 bits of priority */
-    ASSERT(desc->irq < gic_number_lines());/* Can't route interrupts that =
don't exist */
+    ASSERT(gic_is_valid_line(desc->irq));/* Can't route interrupts that do=
n't exist */
     ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
     ASSERT(spin_is_locked(&desc->lock));
=20
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.=
h
index 541f0eeb80..c7e3b4ff0d 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -306,6 +306,15 @@ extern void gic_dump_vgic_info(struct vcpu *v);
=20
 /* Number of interrupt lines */
 extern unsigned int gic_number_lines(void);
+static inline bool gic_is_valid_line(unsigned int irq)
+{
+    return irq < gic_number_lines();
+}
+
+static inline bool gic_is_spi(unsigned int irq)
+{
+    return (irq >=3D NR_LOCAL_IRQS && gic_is_valid_line(irq));
+}
=20
 /* IRQ translation function for the device tree */
 int gic_irq_xlate(const u32 *intspec, unsigned int intsize,
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 03fbb90c6c..7dd5a2a453 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -415,7 +415,7 @@ err:
 bool is_assignable_irq(unsigned int irq)
 {
     /* For now, we can only route SPIs to the guest */
-    return (irq >=3D NR_LOCAL_IRQS) && (irq < gic_number_lines());
+    return gic_is_spi(irq);
 }
=20
 /*
--=20
2.34.1

