Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 923BAB1D7FB
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 14:33:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072926.1435861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzoQ-0001p1-2J; Thu, 07 Aug 2025 12:33:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072926.1435861; Thu, 07 Aug 2025 12:33:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzoP-0001mE-V6; Thu, 07 Aug 2025 12:33:37 +0000
Received: by outflank-mailman (input) for mailman id 1072926;
 Thu, 07 Aug 2025 12:33:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGIa=2T=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1ujzoO-0001m4-Ht
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 12:33:36 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb856fc9-738a-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 14:33:34 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PR3PR03MB6425.eurprd03.prod.outlook.com (2603:10a6:102:75::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Thu, 7 Aug
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
X-Inumbo-ID: bb856fc9-738a-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzUQoUeU2Kk9plECSpCwWXGZNGGwoLgc8C4PcEuLQdvnYEnxsf2qYS1SZcuiHGgIc9JhETF6K7IJBXPuyLj+Cf31XH6HIDYSyxOxIKrh7tQYRJrz3UwyRJus+LJL+jmHo8uTCS0I4md9vNl31b+/8vgJDtAXmSRpzGr2uZ9Rv9q39NoRIVJHB2nprdN5IDO0V10zNtkP9yQz4hlgp/GuS0iF11CmnCI3SpuQjcwJTNKhdPCSc4guLKUcvJ03OERjKE3neRIY1ApQdn8+xIU/596n48aIKw9/8QSwbZuIaZZoSHshXEi8D7UKEoEPihbvU3LCXdwkstZ5CEr/ceX/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ofZi4GBOyNGOLa7M8Aip0JgkXWXFJ034ktJf5UCl8E=;
 b=UWcT4xHrodsjY0cU60Xvns0uMCP/iT01J3nSFYeNDlwgS/pKlVyMAGmo9aru7AZOHlCB0h++JWkOdN1lgtcw/JhEbKEfvyDZ4cpO7PrpYAUA1bXrgwvI+0n7VbqmHEj0YKQQ3RLzBPEd0om2FqlLgaP6jeTolBMtyyIJ1jkGdFG40tQsSJlHH50S0jztXfn3O9SL8yE/NkpOd7UV6HC79IVSLKFkR5NgF7Mf4V0IxdYkYslAG532p/uQxACxS5ylz7cbm3WSnOnbVMfWys8K3k7OUAByQNnBWB70F5+jRB9YZhVUy0jmrcKwORgGiKueWlm7GB+qLspQOAuHG8r64A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ofZi4GBOyNGOLa7M8Aip0JgkXWXFJ034ktJf5UCl8E=;
 b=DVx79HTrLlC1egfXhq2dXrwcRhzDZiPbFtcxBtKszfPJwCJo9t91Fj0HXde7eUm67lhxX82p6hbzR/r7ETNQwY8eL9Yt05SWm9bgQPz99kZtZSlTCZ3h/QxHK4QF4SMcGQO6C20hZOSLrWYG4dnrWvkVMszdsqK8i6IzAmd8irCIC+4f9V4G0sqOmaXGW0Nc6FLGmd/LJxr5oFL9dsZhKvilCIIt3aknN+rT24ZxIN8dCQoCjZ8IwevvhtGqqXux9HiNpdNlF9EParAK+fES+bQjO5Ln7ifN8b8HSDbilkro9rFiMU2TSEErZleMk+DI9yh0HGIvA/R2+5+L9N6CdA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 02/10] xen/arm: gic: implement helper functions for INTID
 checks
Thread-Topic: [PATCH v2 02/10] xen/arm: gic: implement helper functions for
 INTID checks
Thread-Index: AQHcB5d7oc7jtkgiGki3l7l8xwTnbg==
Date: Thu, 7 Aug 2025 12:33:30 +0000
Message-ID:
 <51a017aeab39af14ba40ab76b56f317270c7afaa.1754568795.git.leonid_komarianskyi@epam.com>
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
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PR3PR03MB6425:EE_
x-ms-office365-filtering-correlation-id: 32f5f94c-7850-43dc-ea5f-08ddd5ae9e62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?q3sLBLsHFYE2HbEasMPQK7hqrlAmNeHpJCa6wb67Hdq71p6YNUcHPTnv73?=
 =?iso-8859-1?Q?Lx3AQn6V7JcKbCS0fFeHMkceCZ3vh3HoGcox/flhi4pz71HojdqaSU6hrS?=
 =?iso-8859-1?Q?jF4jm2GA7tvGK9XvX1slwptuD1PMHsCpxyco8bvzo6/vuuLTcCG1VJWZQQ?=
 =?iso-8859-1?Q?Vk1XMBHjMRf/jf+pPczJxD89Ky7AiyZ0cCv718K62kiEojlzKMHXSXrboK?=
 =?iso-8859-1?Q?ZzKYtFcvVqAXjiHUfGHczs86jN1/kIinJrwHvxJc33GG7KQiElrfyciWmP?=
 =?iso-8859-1?Q?7uHMrhXQrLAdw0VhmtiizCs14QWSGejZR35OaQgd9GhkwtaPIc9Ftmvw1a?=
 =?iso-8859-1?Q?oTyQROytBzHZ9+WtPBk0OTfXsq7/scYM9+tYykJ8u7YNV51/5itS9NXBBR?=
 =?iso-8859-1?Q?zYBIr2MDRvNrNBMuqW92dnN1DcW4mdtFd5E9/KpGEzj6B3/Wq28ciiTUks?=
 =?iso-8859-1?Q?sf2f7bHP+/MABe+A1f3hZ+fsdz/r2lL6xlZOpKZuubFOIyEUb7zrFGP8eW?=
 =?iso-8859-1?Q?i15qg8iWmvtD6nuJa65PkCdtbkVNkWFwYITTcBMW2H4FTkXkiVycMFeh7H?=
 =?iso-8859-1?Q?P5/vecgUoVRZWJtTErKY384w00TRjgP3C4X+j+7A/rawqWukU/fCDPuStP?=
 =?iso-8859-1?Q?Xxvy1dAzZNtR6uE0GYBCGjdlSfxP8DwJ7Xlf9dHDyolxh5EfyoFjCieBTG?=
 =?iso-8859-1?Q?icNaA2DBeeYvrLC+tkrPFWlPMDBbUsEiM7jWC4Dhzm1wSzANQKH/i9KiPQ?=
 =?iso-8859-1?Q?hTGfYIqGKfgwpjQrXOvGipSmwnC/ZdAJCimjFnIRrdsNovnzyXJHcwpWcE?=
 =?iso-8859-1?Q?YKCvx/RMyyQXBarXrUcEmaP09QjGFX3GvB8e+YpS3lSuMbYsPhXFXHfNB1?=
 =?iso-8859-1?Q?3O/2uUv5120LJyiR61H5HbZyUt1T41D7H0eVVvvsBjNHmSQbfc1ev47QXk?=
 =?iso-8859-1?Q?Iis9zkXR95kKgtpWWeUGsko6aBdJZcpNZkxI0b1ML0CMul/EJOitfbwYNr?=
 =?iso-8859-1?Q?OGpAdlrV3B0NfowCvXf8jLM5/lSO7mt9LaaZkf4fnBsmZVYCBGAcKDD2a7?=
 =?iso-8859-1?Q?2yHtMV8I9eqrvMRUT8NcL+piLSveC0UdbsbwN2FFaldEdjXet4OYYRfMhT?=
 =?iso-8859-1?Q?sfktOrYDdhHqmY1dZM5CvgL/wc3OuN8KE9wijyIsSVHBdK6EfpJ1nk3Khc?=
 =?iso-8859-1?Q?EFWcfgO1YV73wvbKp5gvA4XA2SBb/oz1YkPnhkc90LE/RFCF6vC5SxNTD/?=
 =?iso-8859-1?Q?QoEJHgvU7i3NvoIMYHttBwFG2b//DzFw4+MSxBAdXZx/OG+AjJTsOcJUwP?=
 =?iso-8859-1?Q?89dH9NEUcK9gy0Wk/vWZTFIQnxWznU+MtjYk2yXBWBN35zLaVcWTCopI6+?=
 =?iso-8859-1?Q?TiFgMKezmXxPQiH2QcPmFsJCSDzaGpLLbIjyOU6rPoPPmz2sfEPTdPsFD1?=
 =?iso-8859-1?Q?tsmULAaH2aKgiog0iDfJZFo24118j9Q8Rl9NSoXfQZrPP+c/PYDPnx6B62?=
 =?iso-8859-1?Q?hcxFNiJQcYkxUR47umAFp38WNAlUn+FZfyBBdbI8Miwg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?sQ5uYdJILjiRFgeQr2tuVavpcWymIOcmloCCp05nNR28UuMZgw1IaHhsna?=
 =?iso-8859-1?Q?fq6P/2/lDclBM1THx7KX2OpXn5rdI5+c06xlsssCKrQenVk9MHe/KtEa8x?=
 =?iso-8859-1?Q?FrMuso1xpeBm+Uk3d9UamluxRXHPnwkj/wwpBmZyZeZqt0YLSCTfvnkyUv?=
 =?iso-8859-1?Q?9KSz3+0kykwJr4JFXUiwREwTOrR3nvrgX0aYFMRnKCUA19gqOJPr/7Rko4?=
 =?iso-8859-1?Q?FhVPW0ZpYWSN1DDR6qccpWrMuYlHfkp8LB2njxIV2fXVeHOijxl/Y1q2wZ?=
 =?iso-8859-1?Q?XXPikV3CNLWVhSjryWhuwFtyyK6zMNYjN9n2adcl/Ue7NycgmyWWU8DFEg?=
 =?iso-8859-1?Q?ikBYy/cV11aan4R5Kid8Jglt3fltHnVOWv1LmDKOWcN3KQIZwDDHUwto5/?=
 =?iso-8859-1?Q?/91mEJc93N6xL/3Yf46ShILiw7E5q/G1fUoa4eQng9O1kpxTE7W2/5igiX?=
 =?iso-8859-1?Q?WRVJ/sgGvHFEdJdD//p6BdKrWdjOLY+oaSXC3hHmSA+lazEuiXmZxfzxYw?=
 =?iso-8859-1?Q?gUquuHCxVQ9et4d+D7OD5lRZRnvtosuRk/oNMMgQyGcY7smJDIuOeWeER8?=
 =?iso-8859-1?Q?nXdPNMZSFNubw8h7ddq50NBhnBzeHRHe1KQ1ctv9Xu/pi7Aojr4Zt3h7Ko?=
 =?iso-8859-1?Q?4XkwiCeXsMCb4uTJ7LENJPD7mI/EZL1bwLeXPhPt9sh5tIRygjjsyJfvHj?=
 =?iso-8859-1?Q?GApj4FNM91XgDbKzXqCInIAm7Ato74TL7+CAu/MSMUb3AD30wL4L8hB3sv?=
 =?iso-8859-1?Q?1VSrN71umd3ZEOB4lRuNw6Xcev9vk2qNhGrN43Xa19OlwRDV47xoYsbqxV?=
 =?iso-8859-1?Q?t25NJGQBQbMldh6i56F607JYGWv03jyUTIn5zgXIzhl+m1dVNoSNvbvPQs?=
 =?iso-8859-1?Q?asl3upy85CFKLoaVrIH7EfFrX8YbpU3wFJBW7kWGRI8XUtgRJRLVB+HYif?=
 =?iso-8859-1?Q?LULxEQLuVvaIxqLLKlV5R3g0bz00q/IsINRR9VQQnnEEgntHRIQFZNRTQE?=
 =?iso-8859-1?Q?S0YQmEK1UnuJM6JwPLioGuHbLjMpSELAKVzwGco5p4qsCFjD8FYP/gibVl?=
 =?iso-8859-1?Q?h908pVeQ+YKj1rcFz6n3epwHZe2krXdE1NMXIV7pp3Zs/sFBUjxvVtkyPA?=
 =?iso-8859-1?Q?XuTvg1Wpw8yE2CxoyHh1KOaco/qcBFiITkfelek2alpMCIz5vEy+ciTz1/?=
 =?iso-8859-1?Q?1eaBN93XVci8N6d0oTjFPJ1f1BRtSJuq+LZI5Mo+wMaeTkuxdbjjCEUWcK?=
 =?iso-8859-1?Q?+ZOuENFLvNvmvBiYOVddi9KYmMKLj0EGfVWtdkmiLHcMHJBse/Tm17wZbd?=
 =?iso-8859-1?Q?R6tI2rTQFYGouPaehcT9dSMoYJffm5MII7cJkR/bFvZH7NNOGb5uYMZX8K?=
 =?iso-8859-1?Q?XWYsZbTyjWHFaJbNerDTXSrYGQlga195PQlXE1igiNN6Pc5/pMbDbIIvQW?=
 =?iso-8859-1?Q?L40ddPvhgDZPHXJ1wi7NKCPQOOnOAPN2dALI1djsB20FPimliEkXr3VMgt?=
 =?iso-8859-1?Q?W+YnrJE3IIDsp+LB6ptKZVWpmuk7XvELz4VIl3porJA5NvMdD8pJCJ3mAO?=
 =?iso-8859-1?Q?tsyAhh/m415UqVjqxs0/+0ZcbGdlfFXzlaA6U+UzlvZKJ5zOnMdgns9ET9?=
 =?iso-8859-1?Q?d5xq/rGMPzQtNeAf8rUsMD6uJDEAfZF9ohvs5IjJPRmDDZtMSdHRRe4AyN?=
 =?iso-8859-1?Q?qkxyhtNN02osYYhHE6I=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f5f94c-7850-43dc-ea5f-08ddd5ae9e62
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 12:33:30.3900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wyh7+FPpt3br2bKn7aXmUxZsFJe7FS95a0HN4CuuDQkH0c/OTlR0v+BiFKrkVnrpk/vWOjCRq07CqAgkSllgF2nXHNh2BWejS7rZgEFQbTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6425

Introduced two new helper functions: gic_is_valid_irq and
gic_is_shared_irq. The first function helps determine whether an IRQ
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
---
 xen/arch/arm/gic.c             | 2 +-
 xen/arch/arm/include/asm/gic.h | 9 +++++++++
 xen/arch/arm/irq.c             | 2 +-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index e80fe0ca24..eb0346a898 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -111,7 +111,7 @@ static void gic_set_irq_priority(struct irq_desc *desc,=
 unsigned int priority)
 void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
 {
     ASSERT(priority <=3D 0xff);     /* Only 8 bits of priority */
-    ASSERT(desc->irq < gic_number_lines());/* Can't route interrupts that =
don't exist */
+    ASSERT(gic_is_valid_irq(desc->irq));/* Can't route interrupts that don=
't exist */
     ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
     ASSERT(spin_is_locked(&desc->lock));
=20
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.=
h
index 541f0eeb80..ac0b7b783e 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -306,6 +306,15 @@ extern void gic_dump_vgic_info(struct vcpu *v);
=20
 /* Number of interrupt lines */
 extern unsigned int gic_number_lines(void);
+static inline bool gic_is_valid_irq(unsigned int irq)
+{
+    return irq < gic_number_lines();
+}
+
+static inline bool gic_is_shared_irq(unsigned int irq)
+{
+    return (irq >=3D NR_LOCAL_IRQS && gic_is_valid_irq(irq));
+}
=20
 /* IRQ translation function for the device tree */
 int gic_irq_xlate(const u32 *intspec, unsigned int intsize,
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 03fbb90c6c..12c70d02cc 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -415,7 +415,7 @@ err:
 bool is_assignable_irq(unsigned int irq)
 {
     /* For now, we can only route SPIs to the guest */
-    return (irq >=3D NR_LOCAL_IRQS) && (irq < gic_number_lines());
+    return gic_is_shared_irq(irq);
 }
=20
 /*
--=20
2.34.1

