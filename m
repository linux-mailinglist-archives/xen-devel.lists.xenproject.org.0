Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D566B36758
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 16:05:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094530.1449817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquIy-000768-Ax; Tue, 26 Aug 2025 14:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094530.1449817; Tue, 26 Aug 2025 14:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquIy-000731-7R; Tue, 26 Aug 2025 14:05:44 +0000
Received: by outflank-mailman (input) for mailman id 1094530;
 Tue, 26 Aug 2025 14:05:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqrf=3G=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uquIw-00072q-Fi
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 14:05:42 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf95f925-8285-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 16:05:40 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PAWPR03MB8962.eurprd03.prod.outlook.com (2603:10a6:102:333::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Tue, 26 Aug
 2025 14:05:36 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Tue, 26 Aug 2025
 14:05:36 +0000
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
X-Inumbo-ID: bf95f925-8285-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFay775g8UONTsrX3BcBKrmwOINv3ibDoC0MaqZcYldKhkNadVhffVs7uST9vkc/8h7CyMimhtmJgRZpM0FcuH3GFl7RC33VcriSE7s4lAeL2DEzqyK+t5ylGqI1lOVY7qgq0fsHbf6IURar42tMN4CLysTf5c168BAg1PQ9p8xyuKxTPS1smLjYZjGyoNsp5TOSnI9VtOP+vBkqaqGqOv58SVfs15HUFa1RLoEM12jzcu3WPfXTE2EjdaGeAVFrem5Q1OCF/NVGvUyhv6vGQrVw45940oDQ/aPfKt7vuBDbpX9Bk9btzv3TntR+LTmmO8Nqn/WoLCgsbQe9M5MvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54XHblnnUfWfZuXJ6i9VxNDEfX41aUbnPQ7WRY2YP5o=;
 b=MjvCWQvuace5uzR6dOLkOftb+pDdd3Z6TEJM8GxBVFnp5GqPUYKIo8ZfjNsF3jZlzoeRcn5fSROqYXoeaUO3wjGSgOIimGDuOxVoaEJ0pidcMigqHDOcuJemVDKN44WMsOFj1ZoO8qDUKcOWIZUFOpdHcSJByRqy1U618NSOpVjkjnjSC9KNku0+FG6loCqxAxKngLiqEVDqKnlDSbyh6UgrLIKuGnjmQpA5fhXon/lxoKLEbuut7Ev1YDTyv8eB7L5oJeuw8rspvZP0aIU56mw9sJZx78XC8Dzu7Z3LKTXI45mNSeNZmzihHHaR4dAowkcnBgKRwYNHNnBO/35MdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54XHblnnUfWfZuXJ6i9VxNDEfX41aUbnPQ7WRY2YP5o=;
 b=ioVwIXMVQuVSEgucjM9+nAcIcxKputmgUK51f3y1l0TNnZqp2bMGtfsGBxQXEr/LcQyx/zCiUqSczyqoncR9IHZbwtin4nAHUlOYJ1DKkslVZrKPnBav5u7P/dSffoidnT6h0jyaBjgFB9UGjMsVfXzxdZztQjn2aY0nRASFB2juLS+inLijpCJeZheGVbCYyixhXhWFtrtiILmqdSOJ1GijIdKRst/sfQxHMTS/lc1EjSeIWW6FYmudGdHq24BgbClHhJyE+VGLhkZXxyAOCbUYat4pIQ2yUnwC6CwAWT8u4Uy5Sfs4yjfc5SMmluutpZ+LR3NUx6vz71WxB6RtiA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 01/11] xen/arm: gicv3: refactor obtaining GIC addresses for
 common operations
Thread-Topic: [PATCH v3 01/11] xen/arm: gicv3: refactor obtaining GIC
 addresses for common operations
Thread-Index: AQHcFpJ+etlgg3EWd0CB0IzwgFrWeQ==
Date: Tue, 26 Aug 2025 14:05:36 +0000
Message-ID:
 <6ba26f0db6575795f8dfcb80862f5537c3dc7a8c.1756216942.git.leonid_komarianskyi@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756216942.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PAWPR03MB8962:EE_
x-ms-office365-filtering-correlation-id: e8feefe8-74c9-4b3f-8211-08dde4a9a192
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?kBWR8W+tMEbapIVgn5N0b2OIBhrngeb9Z1Ku0ZWAfJXa0AU235XfM+uFqj?=
 =?iso-8859-1?Q?8SzUVYAb5Vs7C6ui71nqcRnC1W7dxCuuXrPIescVxHjnX315WhOqZGdqYS?=
 =?iso-8859-1?Q?noX4DNFyfGcCfHUwVBJWY0VyH1dYVPee0sERRGjrwTMQAM7dVkht+v9A+7?=
 =?iso-8859-1?Q?xrncTKhEHYDmnkJdW+Dyo5Q5qnryONml++jOA0NGCqQh9OtJdP55oXMHFI?=
 =?iso-8859-1?Q?zCchgN2XE+ne3ln/e5pNiy237ib7izN0p4rOogjMUGC7Xn8tJUio7GUY8O?=
 =?iso-8859-1?Q?FTaIZr49jgWe6OcpvDiV0RbfbYVAM9xxUZnsbC0GFGUOqkl3DkuGEoPP7M?=
 =?iso-8859-1?Q?w7RMRyC/4zpyECddipw6gxp5cJXLz64DzDi2RZvCQw40LOXZiVl0Jk68if?=
 =?iso-8859-1?Q?qSR0gETcWREMv+8EwOSiKihRZCvPz67anEJPNfpYORVbHi59bfhwojepX/?=
 =?iso-8859-1?Q?A6taC4Ni+Ryfam0oY8yudjwN8sHcpxx5mjJpD+ojBIpevCInBC4juRM4Da?=
 =?iso-8859-1?Q?asG2dFLsjik8lo/EGfs92t8EsB8SUq/dvtZ/8Oy+waHaM7Ad3rWZoEaR2M?=
 =?iso-8859-1?Q?7CqdH/SBTIdgUmFYbX4F9Df5ywd7PZ2rTTE74ZYKlwMyEGf7yIkbpRvOne?=
 =?iso-8859-1?Q?jtV3+NrlvF8NWFSs+DRnDNWIt6qNsWfrpihhxIdJj0Rmw83uXlveauJigt?=
 =?iso-8859-1?Q?fP9lzvp9cEqqwG6ceRi9mvfGiv0Tr/hz+GYzlwxg649nWtlh337qgJVXNP?=
 =?iso-8859-1?Q?peg6wokNlwqHomQi/mZhfuyIHVRGwHJuY/w5hoR5dxvKiPki2aqCfiB/M5?=
 =?iso-8859-1?Q?jHhCFzk6yKW7oSxC4YEEMUIi89spsVz1lG10y7oHDuQA3xPKB+5P6WH2tV?=
 =?iso-8859-1?Q?AlM+FOMLBopaAhMyh08u+/eAZl4+rupRGgI0j/j9piLo1H6PrN41UH7Ojr?=
 =?iso-8859-1?Q?Gv9FziX+ZUOlBC76mjaBVoL+xZ5L+oDLBhJ7G9k5oc9gYuhroquWYmB8oI?=
 =?iso-8859-1?Q?4XcCNqgKY2JfZpnNDu/H8CJs7A3ki1a4SPeU/wYL133MM1gTnsvRBPIqPh?=
 =?iso-8859-1?Q?/cWeDkTceKbHuyZ7X3v2Zy1AVfCdNB9z8tveLDxVOMmin0Q/LVBEq4F7oB?=
 =?iso-8859-1?Q?se1rXI4NJv+y4gGUMbYL7YjUpB//s3Fkp2COH9PVOkmADw4o2QI8njaqKg?=
 =?iso-8859-1?Q?86O+9ne96Y01nvWm27xx9aKq4GrqoO0b10ZHPE80OKAhNq1cbdvqvagJxm?=
 =?iso-8859-1?Q?T91Uj3ttESkow2R9dkCQFaVbRXC6zBoqB5IPhSvcVTPYxsD9fqmMjBmgJz?=
 =?iso-8859-1?Q?zQoG4Lo6fHGfBRvKXWzKehq5/unJ/eh/qH6DRRJ6E+CJr61uRsGrQmaaTe?=
 =?iso-8859-1?Q?2/OTRff0rbk3LU81TqgE8Y4g3K1VZ3asdmW+J/y9SV3OAeLcyi0OhpA/CR?=
 =?iso-8859-1?Q?TnQ0jpPbMQbhqxLTAVzuFEmzwXSajwMwB4rzjW9/RBD+2ejVYKJOHnTooS?=
 =?iso-8859-1?Q?ieUF6gH9ytq09SusRt1VbVDVXLx2LDU7QjFjYFw07JmA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ynS1CRKZYbxf/kRMQRfguMrD8PhtUY7tW3W5yj5mlRm5Hx1zQpqYpR78CZ?=
 =?iso-8859-1?Q?01QaDnC+O4jSVdk4YpRkfUBhBxLfuM3ZtgwMRJN+hhHt8nrH8XgLJoOX0+?=
 =?iso-8859-1?Q?Yxuqv9mu+vW9rkDhS6z0zF4bgQiPJLycOy3xLAyF+XjIXE4ORUEPa+IORx?=
 =?iso-8859-1?Q?NQVGMib6JdosckqapXlmHhnHxT2Jy7tJSC67InKzOz/xBD2rHJ5f8fvyfs?=
 =?iso-8859-1?Q?+Io8ro1h9CMePXMgzbkBZLPLhULtEBJM1KYGnS363DcmcasLFPdaw0kWZs?=
 =?iso-8859-1?Q?O7wCf9VixuvdijLo/IThy5qOLda+VsuU0j8XWHU0WKMA47eZ0PhvBMPSM5?=
 =?iso-8859-1?Q?VpyuFsR57dIPX6zgk/Y74X38lfTIGcPxIa31RY0C0toeWLKnnDOnxchDLC?=
 =?iso-8859-1?Q?gXrubcc3wbs93WmInhiJnslZJK4c4EdCk+8uzydKiWonC54aGAcX34lRIf?=
 =?iso-8859-1?Q?zvUO3K/RS5s3Xbb4Erg+0pM0bOqArdZc+ZrurICdZSnX2kAwo0d5pKmldr?=
 =?iso-8859-1?Q?3T27EdnqD17RJBT/54ACmLPvoY9hj0b6VxROg0ceOUNyB8RSFyUXjZsQdI?=
 =?iso-8859-1?Q?hFlnkO8NGc1eeagI5Yi0sMfji6E3y9ZzJGcSUSQjoQCjlHld2huRPsf/iS?=
 =?iso-8859-1?Q?QMspGQ55BAy7dlMZuPdeSKOFC28pedOdIGmJKeBWo+kEUiSEXoK8miTvac?=
 =?iso-8859-1?Q?kkBLPwo/iXpo6dKpnJ2TigwCushgNzRR0+JMmREkvOkLEuzmu3OhzbBK93?=
 =?iso-8859-1?Q?lJdf+QKZyjnEmYbyFznn07JhGsLRx/20UzoX2Oq8oG+YJ5BjaSC9VhjyP1?=
 =?iso-8859-1?Q?HjuEFFzPLpXyH/xNjcSrNT9WuWAZmelCDxm7AUNCaUvSUNx+1s0eCK96YS?=
 =?iso-8859-1?Q?HPTQLidMqRurWtgtfqRI2QY/xLat+qaoOP2k6MvUib8qISAVpp4ahwvVyo?=
 =?iso-8859-1?Q?6zPW0JyIeWL34KaNqjdjTT4jJp013R/KUEMAjrlAn9zncgm/TulWUVUAZu?=
 =?iso-8859-1?Q?h12Lpt8IvmKPBNl3MH+nsSVfLwlo3x7uwPLswdbs5XAz5yXIJsywI6s0tT?=
 =?iso-8859-1?Q?D1osqYeM/wueKqLPX4Vlcx6aw43BOa72nCxf/tqGWI8JmZY94KaK68+rjD?=
 =?iso-8859-1?Q?pGUSECfayIghwygLY8cqhJGWitkrNyyA/zZg9VCzsKE1rNhoQP0njXyLgJ?=
 =?iso-8859-1?Q?wAB4MOOgbyK1KcexBqc1xnsTx+Poj2TxsH+rSuaGJ7rnJPKQ8GuRzexYrz?=
 =?iso-8859-1?Q?qoeX7Oy1bwQwmTMPs+2SDl93jD6KBAWukajWIW0k5QMFt3UNSao5WvOwju?=
 =?iso-8859-1?Q?PhMDjPx/Cvz8rPkAO4t9sA7srFpcOvCr6/29ZoUHJU9Pbg5gAO1SayBa6D?=
 =?iso-8859-1?Q?c0ma7V9RcUN7LieVoy9tHarY3hZpvmKUGTXWxUvVfvusHyEHLxH3BQOZxf?=
 =?iso-8859-1?Q?7Hw9samnb2Zhe71Jq9iViBcIKNV2GBoDAgl7Rq6xDJhHNQIWfyZB4Dv2XZ?=
 =?iso-8859-1?Q?WHOX8d5Z0Rxe+Nk7cF+b6ymZzpakyxuO1ghDYHgHsfNSZ1fT8vF5/lKNP5?=
 =?iso-8859-1?Q?6rooQcShYdWb4BUnfVUKSMb/s2h+PcP6iFLvWOdoTT1iq40lvUAUoQOJTt?=
 =?iso-8859-1?Q?RjxbiuQcMjFIVSeKxyEBy4uZUg1uCeiVYlSgfixbWxKB7h0bfd4mIVWMLN?=
 =?iso-8859-1?Q?/8KC8nZGFhOZ4WXcPBY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8feefe8-74c9-4b3f-8211-08dde4a9a192
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 14:05:36.4318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HEfjJuZLvHaDAqBLuXhRhHX3M2F3p5kNez/R0gBKkftIDfbaeDAM4QBZmmIHXvsLVeQe75tb+sfmEcsYqKfj2Z+Fa0R+RoMsOgbewLoKVIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB8962

Currently, many common functions perform the same operations to calculate
GIC register addresses. This patch consolidates the similar code into
a separate helper function to improve maintainability and reduce duplicatio=
n.
This refactoring also simplifies the implementation of eSPI support in futu=
re
changes.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---
Changes in V2:
- no changes

Changes in V3:
- changed panic() in get_addr_by_offset() to printing warning and
  ASSERT_UNREACHABLE()
- added verification of return pointer from get_addr_by_offset() in the
  callers
- moved invocation of get_addr_by_offset() from spinlock guards, since
  it is not necessarry
- added RB from Volodymyr Babchuk
---
 xen/arch/arm/gic-v3.c          | 114 +++++++++++++++++++++++----------
 xen/arch/arm/include/asm/irq.h |   1 +
 2 files changed, 81 insertions(+), 34 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index cd3e1acf79..a959fefebe 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -445,17 +445,67 @@ static void gicv3_dump_state(const struct vcpu *v)
     }
 }
=20
+static void __iomem *get_addr_by_offset(struct irq_desc *irqd, u32 offset)
+{
+    switch ( irqd->irq )
+    {
+    case 0 ... (NR_GIC_LOCAL_IRQS - 1):
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+        case GICD_ICENABLER:
+        case GICD_ISPENDR:
+        case GICD_ICPENDR:
+        case GICD_ISACTIVER:
+        case GICD_ICACTIVER:
+            return (GICD_RDIST_SGI_BASE + offset);
+        case GICD_ICFGR:
+            return (GICD_RDIST_SGI_BASE + GICR_ICFGR1);
+        case GICD_IPRIORITYR:
+            return (GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + irqd->irq);
+        default:
+            break;
+        }
+    case NR_GIC_LOCAL_IRQS ... SPI_MAX_INTID:
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+        case GICD_ICENABLER:
+        case GICD_ISPENDR:
+        case GICD_ICPENDR:
+        case GICD_ISACTIVER:
+        case GICD_ICACTIVER:
+            return (GICD + offset + (irqd->irq / 32) * 4);
+        case GICD_ICFGR:
+            return (GICD + GICD_ICFGR + (irqd->irq / 16) * 4);
+        case GICD_IROUTER:
+            return (GICD + GICD_IROUTER + irqd->irq * 8);
+        case GICD_IPRIORITYR:
+            return (GICD + GICD_IPRIORITYR + irqd->irq);
+        default:
+            break;
+        }
+    default:
+        break;
+    }
+
+    /* Something went wrong, we shouldn't be able to reach here */
+    printk(XENLOG_WARNING "GICv3: WARNING: Invalid offset 0x%x for IRQ#%d"=
,
+           offset, irqd->irq);
+    ASSERT_UNREACHABLE();
+
+    return NULL;
+}
+
 static void gicv3_poke_irq(struct irq_desc *irqd, u32 offset, bool wait_fo=
r_rwp)
 {
     u32 mask =3D 1U << (irqd->irq % 32);
-    void __iomem *base;
+    void __iomem *addr =3D get_addr_by_offset(irqd, offset);
=20
-    if ( irqd->irq < NR_GIC_LOCAL_IRQS )
-        base =3D GICD_RDIST_SGI_BASE;
-    else
-        base =3D GICD;
+    if ( addr =3D=3D NULL )
+        return;
=20
-    writel_relaxed(mask, base + offset + (irqd->irq / 32) * 4);
+    writel_relaxed(mask, addr);
=20
     if ( wait_for_rwp )
         gicv3_wait_for_rwp(irqd->irq);
@@ -463,15 +513,12 @@ static void gicv3_poke_irq(struct irq_desc *irqd, u32=
 offset, bool wait_for_rwp)
=20
 static bool gicv3_peek_irq(struct irq_desc *irqd, u32 offset)
 {
-    void __iomem *base;
-    unsigned int irq =3D irqd->irq;
+    void __iomem *addr =3D get_addr_by_offset(irqd, offset);
=20
-    if ( irq >=3D NR_GIC_LOCAL_IRQS)
-        base =3D GICD + (irq / 32) * 4;
-    else
-        base =3D GICD_RDIST_SGI_BASE;
+    if ( addr =3D=3D NULL )
+        return false;
=20
-    return !!(readl(base + offset) & (1U << (irq % 32)));
+    return !!(readl(addr) & (1U << (irqd->irq % 32)));
 }
=20
 static void gicv3_unmask_irq(struct irq_desc *irqd)
@@ -558,30 +605,28 @@ static inline uint64_t gicv3_mpidr_to_affinity(int cp=
u)
 static void gicv3_set_irq_type(struct irq_desc *desc, unsigned int type)
 {
     uint32_t cfg, actual, edgebit;
-    void __iomem *base;
-    unsigned int irq =3D desc->irq;
+    void __iomem *addr;
=20
     /* SGI's are always edge-triggered not need to call GICD_ICFGR0 */
-    ASSERT(irq >=3D NR_GIC_SGI);
+    ASSERT(desc->irq >=3D NR_GIC_SGI);
=20
-    spin_lock(&gicv3.lock);
+    addr =3D get_addr_by_offset(desc, GICD_ICFGR);
+    if ( addr =3D=3D NULL )
+        return;
=20
-    if ( irq >=3D NR_GIC_LOCAL_IRQS)
-        base =3D GICD + GICD_ICFGR + (irq / 16) * 4;
-    else
-        base =3D GICD_RDIST_SGI_BASE + GICR_ICFGR1;
+    spin_lock(&gicv3.lock);
=20
-    cfg =3D readl_relaxed(base);
+    cfg =3D readl_relaxed(addr);
=20
-    edgebit =3D 2u << (2 * (irq % 16));
+    edgebit =3D 2u << (2 * (desc->irq % 16));
     if ( type & IRQ_TYPE_LEVEL_MASK )
         cfg &=3D ~edgebit;
     else if ( type & IRQ_TYPE_EDGE_BOTH )
         cfg |=3D edgebit;
=20
-    writel_relaxed(cfg, base);
+    writel_relaxed(cfg, addr);
=20
-    actual =3D readl_relaxed(base);
+    actual =3D readl_relaxed(addr);
     if ( ( cfg & edgebit ) ^ ( actual & edgebit ) )
     {
         printk(XENLOG_WARNING "GICv3: WARNING: "
@@ -600,16 +645,13 @@ static void gicv3_set_irq_type(struct irq_desc *desc,=
 unsigned int type)
 static void gicv3_set_irq_priority(struct irq_desc *desc,
                                    unsigned int priority)
 {
-    unsigned int irq =3D desc->irq;
+    void __iomem *addr =3D get_addr_by_offset(desc, GICD_IPRIORITYR);
=20
-    spin_lock(&gicv3.lock);
-
-    /* Set priority */
-    if ( irq < NR_GIC_LOCAL_IRQS )
-        writeb_relaxed(priority, GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + =
irq);
-    else
-        writeb_relaxed(priority, GICD + GICD_IPRIORITYR + irq);
+    if ( addr =3D=3D NULL )
+        return;
=20
+    spin_lock(&gicv3.lock);
+    writeb_relaxed(priority, addr);
     spin_unlock(&gicv3.lock);
 }
=20
@@ -1273,6 +1315,10 @@ static void gicv3_irq_set_affinity(struct irq_desc *=
desc, const cpumask_t *mask)
 {
     unsigned int cpu;
     uint64_t affinity;
+    void __iomem *addr =3D get_addr_by_offset(desc, GICD_IROUTER);
+
+    if ( addr =3D=3D NULL )
+        return;
=20
     ASSERT(!cpumask_empty(mask));
=20
@@ -1284,7 +1330,7 @@ static void gicv3_irq_set_affinity(struct irq_desc *d=
esc, const cpumask_t *mask)
     affinity &=3D ~GICD_IROUTER_SPI_MODE_ANY;
=20
     if ( desc->irq >=3D NR_GIC_LOCAL_IRQS )
-        writeq_relaxed_non_atomic(affinity, (GICD + GICD_IROUTER + desc->i=
rq * 8));
+        writeq_relaxed_non_atomic(affinity, addr);
=20
     spin_unlock(&gicv3.lock);
 }
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index fce7e42a33..5bc6475eb4 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -29,6 +29,7 @@ struct arch_irq_desc {
  */
 #define NR_IRQS		1024
=20
+#define SPI_MAX_INTID   1019
 #define LPI_OFFSET      8192
=20
 /* LPIs are always numbered starting at 8192, so 0 is a good invalid case.=
 */
--=20
2.34.1

