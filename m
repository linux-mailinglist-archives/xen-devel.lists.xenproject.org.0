Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F594B1D7F4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 14:33:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072928.1435882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzoS-0002GF-Mn; Thu, 07 Aug 2025 12:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072928.1435882; Thu, 07 Aug 2025 12:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzoS-0002E5-H4; Thu, 07 Aug 2025 12:33:40 +0000
Received: by outflank-mailman (input) for mailman id 1072928;
 Thu, 07 Aug 2025 12:33:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGIa=2T=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1ujzoQ-0001m4-Ro
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 12:33:38 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bba6b00d-738a-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 14:33:34 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU5PR03MB10563.eurprd03.prod.outlook.com (2603:10a6:10:51b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 12:33:31 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 12:33:31 +0000
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
X-Inumbo-ID: bba6b00d-738a-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iv2pCC4B/TYwyBGiYpyuhexWxM2w6BchvkZ0LH0Hmgc+jUEQHTA9ifAi64xeJLv7cdX7IcpnPJwwAOYO1Eci6Y2CD/47K2dhdmu9jH5hCOeU7+q2OIJqTm8++AvRwk1rpKIV4kfA5bPLSJ0cDBX5jrg/TiZGHlp9TL+uB2XRMuZm70xxzisZdTUsHwHKwmOsN/mL1HvS/HoJjJWbJmVcSSx2eDCFPj7lwsbwynjhFBF1fQR8LVzrUch1bkffYktd1Cr2oIk+YbTwni+Tlj/S86WHS3DdSk7VVSq9yzj6V3gx4EIY8B7v8arz9DCbD7bMz8zaHbnoiXq58/z7oK9Lpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jseDZopep9xOUIh71ALDsTyOZSrJZhgLmbqz0ph0+Y8=;
 b=ESEgHvNKIPzw/4Fr+G+DHVt5OLvG5eoVTD7686wWOPixLHdZG2oK5fz52N0DAWKTJQcLrGbfLInu6mxAsAZe2lcbWg4SCEc3JlVCXTx7h/UsCDrtJhWh/wWxYY99vxWev54LGS8USB6+8Jj/kS3TcAY9Vfytalua+0i6rgN6wCVccahUrSNMKreWx245KZlC50QoE5E8KCqXwCXjW38mVjm0T5UoaP8r2xUKneiFjIzpL1BwN2RqQSKLYmN0xKvHZYxjhGW2sJxUOyitA9OAcmNNqZ4UFoN+CV7Cq/+SLPmBEIlKOHLAB0ebaFQmtCgBkZFwcqLvHlFQEyKgZK/SnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jseDZopep9xOUIh71ALDsTyOZSrJZhgLmbqz0ph0+Y8=;
 b=MJw8n8EGJgzf475ygeSkykbnux71T9bevsdvYULVfxXWLq3y11WEWfg64uUZxisOq0q90LKMhdm/s47UM0LBU5z/UbYDNjS8C7nNb+WKGxm2jRZoPQ0LBaZT5hB81UU6f2NugSTyk4oVvdBwBRe0w2XgwNoI+y/Tpdbu4jWvFMMd/ujlHTUcNwLmRX3P9H4KtbEUSNtDANj4XI4olrkRRMfAHS4u7VK1x7gfAnIYTJJQNdxBKBDY3h8CpbCBAoUffB+wCiv3nk2j0eQOrnMHJXMXkAp1AhWTu6NqfppTDmcnPlileOUocdRBsmTxvMAMdVqEeie+hAdDoOaahzoTOA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 03/10] xen/arm: vgic: implement helper functions for virq
 checks
Thread-Topic: [PATCH v2 03/10] xen/arm: vgic: implement helper functions for
 virq checks
Thread-Index: AQHcB5d76MRh/Swq2EGu624C+G/Fbw==
Date: Thu, 7 Aug 2025 12:33:30 +0000
Message-ID:
 <f029f88411e816846d13aaf33d4ef703f95d1bb8.1754568795.git.leonid_komarianskyi@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU5PR03MB10563:EE_
x-ms-office365-filtering-correlation-id: 654bfcf4-b87e-4337-1ba1-08ddd5ae9e98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?lLPif/Dna/ZJI11gvFyEHCmzFPiofoLrISG5xE/MelyLE6KNiMbN1aSgf9?=
 =?iso-8859-1?Q?CiidAQnAu9T+iTPO24Q1qE6x8B0M8movlEHqJEO0zYO3RxsTPd+0+KQIjD?=
 =?iso-8859-1?Q?nXTrRPl98S69fEebsuUKQt1jhYrkLxobhtxfGSGcb5fJ2l2ykXwcWoLfWN?=
 =?iso-8859-1?Q?22TMDNazEt3Q9lE+ri1FzgS+RJz3GuJzhBhlUtaAb4vTVuOMPm8iu6povH?=
 =?iso-8859-1?Q?aWkbVjTYLJAAo+q9pnH3MN2tr0FLnWO2O6wf/7Ry5Fn/FK5nqdoWLxac2B?=
 =?iso-8859-1?Q?bUFc2FEA64HAEIqJRInCCSbw8rijGj5N0CXueyBP8AR0mjrlSG/MMg19Wu?=
 =?iso-8859-1?Q?QfKDKzkxsc2bQZQNJyZgLXY0S8avFngSmiTOQ76I9DsLRApwzTiXmDrvvV?=
 =?iso-8859-1?Q?YI2M25TXzpYlj6TaJlmPcqKRgYCAchLit/H5C4vC1VtZG2x3ypPBvMjOhP?=
 =?iso-8859-1?Q?awqJ9cXP1Tc0NE0J7SSEmy2nVrZO3XSXYjaJte3E5CAKmC3BzxHSDfjLHS?=
 =?iso-8859-1?Q?v1ci7kMecj6CwMOhS98aOA2tCmlf40Fx0M3gluQQ3bCNwyUggaHFHNviWy?=
 =?iso-8859-1?Q?ngRBQgGVwYYLRqqs9uwZVWCc9oHch7D2zoCaf1mLv4HAqqcsKj99qzVWAE?=
 =?iso-8859-1?Q?vjZEw2T/RwItbXZiAB867PhQNpsr+1FafOVCgfAWUfsXrO54HU6cx9kSAY?=
 =?iso-8859-1?Q?HhPFeDp4eNDiQ3Tnv8aFpgLnNuudXU5jaYrsY8c0dMrKRJhTw0vAQOztd8?=
 =?iso-8859-1?Q?FhqQj14j/Aa5wMXSdGhGD1/T2RPot2HDprd5l+ZRexgeZue3SgEwoEj+XQ?=
 =?iso-8859-1?Q?pIpg21f0KR9GYLcYiPeO7VXymYoUrOF/xE4L3k0VZcFWQydjgMIc6tl3RT?=
 =?iso-8859-1?Q?alZuHsDojUSswQoSmuNIUS0RBB17VnzXfle+PfP+QlyU1JwGCmd4DUBQv5?=
 =?iso-8859-1?Q?K24yFtALIwbpn9BqlgtmVwbNYziAscdeHTmVjevdN6yJlGHRHYBSrY7IT2?=
 =?iso-8859-1?Q?7orAlihZRWMobDYdxv5QlUx3wogMrgkfeEWVMnlUmmu9CIQgMOt+hCFl4l?=
 =?iso-8859-1?Q?NW7d2+XP3Jtj+axiyUhxRbK8oOJmT6gfZS0lLn2nTPtikWrYNmqKuLtwya?=
 =?iso-8859-1?Q?GWghVzqdx2YWc2+076cd+TOjGHpyfWEz5xJvcgswPn6K9fAjnGX0VVLekS?=
 =?iso-8859-1?Q?U4j+IPyGXuaNRZ1NP/hwWG1YMahwc7qqdyW30te5CuBqacr0AYFvSo9Ev/?=
 =?iso-8859-1?Q?MnVJLULCq7l3Aqy9Dq71aUq98VXMnl6/mT0/o+M10YzcfeXZQxibW7Du0p?=
 =?iso-8859-1?Q?GeCmh0qMztyOPD9ZmWv1y75uI59w8+n8QC3/SsKRhU/oQNDmWhOsAcP39G?=
 =?iso-8859-1?Q?ATZLWuOGi1gwSmb4LHXKk7Yiwzapc8QaYgmysXpg93dYD4SzsLJTAT9fP3?=
 =?iso-8859-1?Q?GB+RM4nBbca+BB/0++vlRZx7UDuJZ+kyXeM89vnMjF3vw4CN9iegKNfwyS?=
 =?iso-8859-1?Q?FYiYXF6xjufIFu+UB0gpD9gWaMJh8A5MhmoSec1xEe+w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3osLU9ahRrbtl/x1f2m3ZgMcdjr/eXd8GadswouzSnuBUpS0bsL6RDhMEq?=
 =?iso-8859-1?Q?YPDeDPRsXW6LKChpGT+V6mcTzkR9uMuv67YA58BW39kPShH2PlL+JbAetL?=
 =?iso-8859-1?Q?ylua7vSNfM8aERffuQ8FI7xpHe5OIxqt2IKFbrLcAiJkDjjlnjSvrqAgAH?=
 =?iso-8859-1?Q?xnD4VZmMrwjWgQpcNsckWyFimU4SgCIGFjMAGHekPsuPm1REfYI7QQwQcG?=
 =?iso-8859-1?Q?Yi7G1kkMMzzq8KqRzo39jzKwya3jJnTChTK8i9LeGZ0xgCLdQP0Cn6TeF6?=
 =?iso-8859-1?Q?DjXkcmfBVnpWcjA9RA9trovD0SWEMrBVB3ujguhFEXmG9yqvCGjO3K5pNG?=
 =?iso-8859-1?Q?oXp9GrdKZsXwMGYcoawoxEvB43Q1/5MAyB3NEQwRPDAAWSENeIlCQi/fyh?=
 =?iso-8859-1?Q?/Q9J9jI3J6ZgGFocCbwlqe7ZomElFQ/+nSweqlLMqNgWjY7pERJ894zuK3?=
 =?iso-8859-1?Q?iJmF6zNFzWpLBktq1Tu/tAmTM3xqPA2QsAsUjWlCIaBkxxRoUdp7V3tl4H?=
 =?iso-8859-1?Q?2e1X9+IVxgdzwO+e59NIQ3fQBkFZqdSU6mCw3l5mxtBAn6FuES3tpUujtZ?=
 =?iso-8859-1?Q?wG0VIyY7aJ4S67II1NWJVrDkMrXWmPOscYlqT6dP1leJ5eGJflCG//m0mU?=
 =?iso-8859-1?Q?qknE8T0Kj6wZVd0zK2nMCqOG3uUCGT0iLsCTMBT4qyNjUzDxEUErQI2H6q?=
 =?iso-8859-1?Q?J0TdcGR1tp4SdkxQyTWAkECvYT6k7weJH+pYY/y4EOcv+PhUA7kYE/lwGU?=
 =?iso-8859-1?Q?seH1MV7KPqCg4HonDGG8fN62KRMF4NfdBOVksqwL955nfUWyTtM/jYctHd?=
 =?iso-8859-1?Q?dUwgDvfRrup+P9Smnw6AoDIgfoWWPBCNQ5Qh/iMOwM3UOnKXJl/qaLabCV?=
 =?iso-8859-1?Q?hIc79yazzNdqB9q2yO/lSqImIFgg9UkOFb69KFQxAfqbXKuvNJGBMQZOv3?=
 =?iso-8859-1?Q?cRfUpm/og/4OYr+6T68QBzvGml3kBMgXhSUYZ9kcpoODhXkJ9T3jn+SGSR?=
 =?iso-8859-1?Q?u8FYZsMvnIOvH/28cxEPcqRC0ezT1JeOvVG7ha+3gjnNVqt9OJeiDj46M0?=
 =?iso-8859-1?Q?Gejt2wzYuSwB/cSX4tHM+ct2hRgp78/Z3JXHZadRhyXaPOOz2NyjZZAMXy?=
 =?iso-8859-1?Q?Oe7En1YicSeYCGkAIHZL83qYhn9OLM/H0kpLGm9CWHtZSn1WtY3Uczh6Tn?=
 =?iso-8859-1?Q?kbz+2SJ+h2RGfLeDbAKPVfF0ffcc7TXkE8xoqGoCiJVNuL/ub5uiiaDL4L?=
 =?iso-8859-1?Q?zAkkwQjBPsU8u2EywI7aT7o4aaE3trDR/45pF5II9tujB4noKiNLIz9BpP?=
 =?iso-8859-1?Q?WtjCSSSonwN/F2Px5GupkZAMcDefKjBB/wmDAN2SHWcGlO7hGx1IhGUmf9?=
 =?iso-8859-1?Q?8CU8BptfVci00ZIx/gwg+lPTx1oT7PuJUyYRPYw/bkwUVKr1vs+c0bho2Q?=
 =?iso-8859-1?Q?NGf136jEJc3jzjVBJ4S9COJ12+j0OS7Ec27/kPZrACV270Xdm8H0ks+zB6?=
 =?iso-8859-1?Q?RyZKGp09aoNQa58/ZhLGGRd8kU5rA5T0CVMw7YJisCXWzo3f41K5/v4EA+?=
 =?iso-8859-1?Q?3BX0oKShksZ5eHxUwQifcrQnHGUvmGW6UFSKk1gZ00bI4WLTg/zb4FNd+w?=
 =?iso-8859-1?Q?wF7kAqiTSG8ei4XSxD3k4LNRpz1WxBZXnEcHeXGDKi91bMO/J4HR80Z8Zo?=
 =?iso-8859-1?Q?L1r4pNHTkHJCUhwDB60=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 654bfcf4-b87e-4337-1ba1-08ddd5ae9e98
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 12:33:30.8555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ko3B8+8bZZbwymMMYEImqw22qscRC8Wxkc1v46/pfxv6emsgxs1E5Xjfk+yduDgVXFKFSO+b37UlIFxlPA1wZXyBwFbMCm3lqJubSclk7bU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10563

Introduced two new helper functions for vGIC: vgic_is_valid_irq and
vgic_is_shared_irq. The functions are similar to the newly introduced
gic_is_valid_irq and gic_is_shared_irq, but they verify whether a vIRQ
is available for a specific domain, while GIC-specific functions
validate INTIDs for the real GIC hardware. For example, the GIC may
support all 992 SPI lines, but the domain may use only some part of them
(e.g., 640), depending on the highest IRQ number defined in the domain
configuration. Therefore, for vGIC-related code and checks, the
appropriate functions should be used. Also, updated the appropriate
checks to use these new helper functions.

The purpose of introducing new helper functions for vGIC is essentially
the same as for GIC: to avoid potential confusion with GIC-related
checks and to consolidate similar code into separate functions, which
can be more easily extended by additional conditions, e.g., when
implementing extended SPI interrupts.

Only the validation change in vgic_inject_irq may affect existing
functionality, as it currently checks whether the vIRQ is less than or
equal to vgic_num_irqs. Since IRQ indexes start from 0 (where 32 is the
first SPI), the check should behave consistently with similar logic in
other places and should check if the vIRQ number is less than
vgic_num_irqs. The remaining changes, which replace open-coded checks
with the use of these new helper functions, do not introduce any
functional changes, as the helper functions follow the current vIRQ
index verification logic.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V2:
- introduced this patch
---
 xen/arch/arm/gic.c              |  3 +--
 xen/arch/arm/include/asm/vgic.h |  7 +++++++
 xen/arch/arm/irq.c              |  4 ++--
 xen/arch/arm/vgic.c             | 10 ++++++++--
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index eb0346a898..47fccf21d8 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -133,8 +133,7 @@ int gic_route_irq_to_guest(struct domain *d, unsigned i=
nt virq,
=20
     ASSERT(spin_is_locked(&desc->lock));
     /* Caller has already checked that the IRQ is an SPI */
-    ASSERT(virq >=3D 32);
-    ASSERT(virq < vgic_num_irqs(d));
+    ASSERT(vgic_is_shared_irq(d, virq));
     ASSERT(!is_lpi(virq));
=20
     ret =3D vgic_connect_hw_irq(d, NULL, virq, desc, true);
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 35c0c6a8b0..45201f4ca5 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -335,6 +335,13 @@ extern void vgic_check_inflight_irqs_pending(struct vc=
pu *v,
 /* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. */
 #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
=20
+extern bool vgic_is_valid_irq(struct domain *d, unsigned int virq);
+
+static inline bool vgic_is_shared_irq(struct domain *d, unsigned int virq)
+{
+    return (virq >=3D NR_LOCAL_IRQS && vgic_is_valid_irq(d, virq));
+}
+
 /*
  * Allocate a guest VIRQ
  *  - spi =3D=3D 0 =3D> allocate a PPI. It will be the same on every vCPU
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 12c70d02cc..50e57aaea7 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -442,7 +442,7 @@ int route_irq_to_guest(struct domain *d, unsigned int v=
irq,
     unsigned long flags;
     int retval =3D 0;
=20
-    if ( virq >=3D vgic_num_irqs(d) )
+    if ( !vgic_is_valid_irq(d, virq) )
     {
         printk(XENLOG_G_ERR
                "the vIRQ number %u is too high for domain %u (max =3D %u)\=
n",
@@ -560,7 +560,7 @@ int release_guest_irq(struct domain *d, unsigned int vi=
rq)
     int ret;
=20
     /* Only SPIs are supported */
-    if ( virq < NR_LOCAL_IRQS || virq >=3D vgic_num_irqs(d) )
+    if ( !vgic_is_shared_irq(d, virq) )
         return -EINVAL;
=20
     desc =3D vgic_get_hw_irq_desc(d, NULL, virq);
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index c563ba93af..48fbaf56fb 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -24,6 +24,12 @@
 #include <asm/gic.h>
 #include <asm/vgic.h>
=20
+
+bool vgic_is_valid_irq(struct domain *d, unsigned int virq)
+{
+    return virq < vgic_num_irqs(d);
+}
+
 static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
                                                   unsigned int rank)
 {
@@ -582,7 +588,7 @@ void vgic_inject_irq(struct domain *d, struct vcpu *v, =
unsigned int virq,
     if ( !v )
     {
         /* The IRQ needs to be an SPI if no vCPU is specified. */
-        ASSERT(virq >=3D 32 && virq <=3D vgic_num_irqs(d));
+        ASSERT(vgic_is_shared_irq(d, virq));
=20
         v =3D vgic_get_target_vcpu(d->vcpu[0], virq);
     };
@@ -659,7 +665,7 @@ bool vgic_emulate(struct cpu_user_regs *regs, union hsr=
 hsr)
=20
 bool vgic_reserve_virq(struct domain *d, unsigned int virq)
 {
-    if ( virq >=3D vgic_num_irqs(d) )
+    if ( !vgic_is_valid_irq(d, virq) )
         return false;
=20
     return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
--=20
2.34.1

