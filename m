Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E57B0A06F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 12:15:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048361.1418585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uci7y-0003ka-Lp; Fri, 18 Jul 2025 10:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048361.1418585; Fri, 18 Jul 2025 10:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uci7y-0003ig-JC; Fri, 18 Jul 2025 10:15:42 +0000
Received: by outflank-mailman (input) for mailman id 1048361;
 Fri, 18 Jul 2025 10:15:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=34x3=Z7=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uci7x-0003iZ-6L
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 10:15:41 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2711e47d-63c0-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 12:15:39 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM9PR03MB6721.eurprd03.prod.outlook.com (2603:10a6:20b:287::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 10:15:36 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 10:15:36 +0000
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
X-Inumbo-ID: 2711e47d-63c0-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZQc/EbaSnzmv7zMCDjB5R9mLC+uTr9YroWTU/ueExHm1cCju2u6LG/j33V7CXucIecyq/bBxYB6hti3TmSfcZBWzdDDHgtXUXGmRMTFQdpIak0M1u92qBzkViKcRE7ZeeAI+Ok3AYLNE8A1f3kFoVnJyUrHItp0/PSY1PWWA9BxvEb5o4XTe3Upds2Z8NwtTyLJiOdJOuZMA8tgH16LjUfSTt+IFWOx+uKEwlHaCg5KRAFKHJWgQeEMAUvImfU+BCJwLZFgY9SGalI6jQfGtFm4XZVQtrpO76E19s+xH4K52KEuT3MB+ITlQ9wRqjhmeqB7ucN4GPzIJZ2IjAHhtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCKOXFIDsuUpV4nhbHrXFM3AsODwkRTING3/OP9yERs=;
 b=y3l8XocASUZ1qde495PLjK59a7ro9FQ3/TFzN1FV15bkb3ZAPMZi6PK/40vvyB019cXL2cPB1m+AMlS4kPTVJ/OZ+AplYWU+oVIAqJ+doPEC8hwYC9MYkWRBlcZfGtwDzrwQboVN4yr92TbovA27r057b2+vXJGW2vP7it2Kn5645Fi8jL5tScNOy0+vccCQYRXK57htN7dYTeK9f81Sqb/0yZX7EQytcrSv7ygEI6IKhNGMApuXRV/qu+bCezF/zesgHIitFidwdEKlPMuzCd0zbAGNsDz7FZG2qR5HFQlZa385oHo5uBvEI5Sk0qQVdBOtg1aQHaMh/NzXEgOP3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCKOXFIDsuUpV4nhbHrXFM3AsODwkRTING3/OP9yERs=;
 b=ZHp7zHel7W0kXpRjorILiIT1DVDpLcUo11yu5QzWlQmcgiTSjnElbM0gLi036kFaoM3HObd0fE20f6cIL1lKcdTMNethm9KBXjcPNqBLr3Y0PxHql7Urv/wY9QCSZXVFUP7BTBqMKwZXUJnfwH6CLMuMtIn5+t/2mXQwF6dyZHchHu/fZN+HvU8kUXH9lVZosFzTPd8S3GAqhkgfj8syCy1wvGOOrZZf726SQg6CgXLYcD7fY1mJu5Re2XBdlx+LRuqA2Uc2MgDveqkfnWfyj73CG1Eya3MU4KOkXpaBjQCXB9CRVdtzL1bGb5v174V21AbAKPkXB2N7xaj+zOdp9Q==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [XEN][PATCH] xen/arm: remove unused dump_p2m_lookup()
Thread-Topic: [XEN][PATCH] xen/arm: remove unused dump_p2m_lookup()
Thread-Index: AQHb98znbJZb//500E222cKr1/fJag==
Date: Fri, 18 Jul 2025 10:15:36 +0000
Message-ID: <20250718101535.3109001-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AM9PR03MB6721:EE_
x-ms-office365-filtering-correlation-id: 0bebd6b8-a62c-47ac-9a58-08ddc5e409e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?jj/gAIcWQ6RoSaPQ4xRSxNlCT1HqWOOUDxdMyZI8ijGmksWDd4zBePeT2J?=
 =?iso-8859-1?Q?sJQ8O0S+mjFtond3m2I0AVsI18piUPoU8vj4xjAPVPd6A90g1UV/ff81jg?=
 =?iso-8859-1?Q?Ndzs9AHf6wnuDG2jeuq5DG0TSuJKTTh7NVf1EIOV/ilt5rgFeaccB44eNP?=
 =?iso-8859-1?Q?8rmamHWCWvC2yACLOEDZfakVQ+JdU5vLAFmnIMp/bsPRdr7hnXRj9zXN/s?=
 =?iso-8859-1?Q?BvU+Uywch9PL8o9hJ7f4sptCKdK9v8KBmoX0YETzKwWZ4Z3UQ3JV6I1oe1?=
 =?iso-8859-1?Q?Eo9hndP8JRonyaJHBMfC0tUnf4alCA0R2MHK451sjeN2oR/Ll/QVz92qZJ?=
 =?iso-8859-1?Q?17FIHn5RFAgfT5zpfPnU2bQaITaDr+XtXLcJ6dhRmW8/eo/5ceDJvaYvmO?=
 =?iso-8859-1?Q?RERE6k3Niuvs8hJE0dJkDB+bjeQb9gcaZuJFLICzOGo7GxQf5Y+4Z1pjS9?=
 =?iso-8859-1?Q?7/Vk6KvyiQknGwAzh65iISbu2bfwtnmMGW8IeiZnP9304qcEHzpdm5d+cT?=
 =?iso-8859-1?Q?JjUOQN+iq5sMuoBvcAqe4nWALLsHaFeuHoADSTaxTs0+0uHUpNNRQnuC9H?=
 =?iso-8859-1?Q?CIao0eQBtdndcS+YsNXtLucNKILMXcOC0GRvS0diDPsBQTlWWFl3Ms6znu?=
 =?iso-8859-1?Q?iQFnAZYOXCRrduJLHFFSuIOwtqcPm9eigIWB0/KswlYpTqlaIykHrzBHLy?=
 =?iso-8859-1?Q?pck3brg245KSE6Tel9pDBXC2ZK29miC3zdKEFkNPa5hTlZJt/ZyGQqxLjN?=
 =?iso-8859-1?Q?7251Zvy2zL1CL4nIdzNEhk3o8Vn26rFg8xUoucZGi32oFHStPKRruB6Yju?=
 =?iso-8859-1?Q?FeF0n9LRSeOnMqrBHaKyNRX53BB4miqqDAAzqZ8lX6mqpfCFSfygqGh/32?=
 =?iso-8859-1?Q?XYVJ1D+W/mNKNAk7f/uPOCmsVFlD7Pf4TYEStlB7mdFjZK+e2dyhVWbCZj?=
 =?iso-8859-1?Q?19ykrTdYCVxdSttKPXj4soeZPTRm68//Jx6e4mx3+Q5dqb+3gzJbws/WK1?=
 =?iso-8859-1?Q?HSTykCX2ogDhvl7RgKxq1mJDIAKUickzgmkalt7SWWdPgg/u2D0kS1GRYA?=
 =?iso-8859-1?Q?mRfZn1lsUJp+evyKCsOjNZ/qS39ecY1x6EEe15zXmHnPE47JM/ofxyUQQz?=
 =?iso-8859-1?Q?LFCOe+mikOwF1z7Nsa0hyKiGVmf+fQP1oOuSSXRa3aP7/yJ0mgZQAUzOQr?=
 =?iso-8859-1?Q?N2ss2SgQ9OEMTelNm0WTwSdd53fjDQTcZ6v2hddt75JzNWGeQaiTznN/BY?=
 =?iso-8859-1?Q?usBZhuxP14vgs6gjZShYIOJqysFpkUBTsUPcO3nFstZLLV8bTkXFmmyCWo?=
 =?iso-8859-1?Q?cLC1RnlYmFtHWmFcaLlTv2WeTQAgLPKhMEtHTxyrGQ3Q+vsvyR30OkTFDA?=
 =?iso-8859-1?Q?e5ooqckKvXQ6CYXpcRlQdCnU7ZibjwFUB/n097zGPY35AjcrJf7qgsQka9?=
 =?iso-8859-1?Q?4hA0NWSaEyC1Qd6NAlSGOQLRpMWg/zspAYibHX34c0CqFEHSdFHWooyz4O?=
 =?iso-8859-1?Q?FokOhza5WK9LPoYFY2ZIaFWCtVpRUYrTYY0yXHvoAy0A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?iMtBsc4KNoAsdAmX1WbDDUj9q/uE92GfkNAsvIfMIdk7Aq1fbiEz8dLccY?=
 =?iso-8859-1?Q?CRqmzFL285S4vbXW/t0h/TB0z4xaQGH7jRZ9Rtm7OFp8ijwIMe3OHXns4Z?=
 =?iso-8859-1?Q?qTLu464/6Kfzo0pabwH2Wv1ZMyxPxiEQSI/bS3wvSAny+tOWieH4BrdCvu?=
 =?iso-8859-1?Q?QF2zSiCsId7JFq1BNJzO7RoazrTfO7pcxtBcUfDs0unVhiFnEaXD7gPOEu?=
 =?iso-8859-1?Q?GCqhgJHCkkEMOzMJ5kpAV1Wab/5jYB8xJkq4vHS+alUm+61EwHISKkxYVn?=
 =?iso-8859-1?Q?tWz8WDdYnxvNe8QsBMV7YWiokG0Pk5jd6+XDqcmyDSoHyNxh/BW2TlTeqj?=
 =?iso-8859-1?Q?w7ApkJ6uywTQwtBqfFdCTFJaSAfFR9aNctNfil2RPxJbG3tHDKtLxq0Nnp?=
 =?iso-8859-1?Q?pY2981d1LaFafITXfx+Z0gvlui4rcUKboa8P6Ccx5qM0dspQxxKM8yxn2m?=
 =?iso-8859-1?Q?D4pzC0smhVoxLUC7t7VtaHXJHvPc/IJt3W7lbSPxD0O2C5WWj3ZS4GVLfZ?=
 =?iso-8859-1?Q?/aO7MEu+E6gg4lMjLag10ZHhVE4b1cyu0W6nm2euMIiubKjK1q+9I7C/VD?=
 =?iso-8859-1?Q?h9g8K4QdlHhhmmNi9EoWk70Ou8fqvuN+R4XtkmTli9sOFc3lMP/IdjcyqG?=
 =?iso-8859-1?Q?gMczSGT5ZNkq0JyyYJC6S04EsevSzq2IMOR/OtyqCW6MgvXivBFIqC/0X4?=
 =?iso-8859-1?Q?H9pVBQQm1KPXkRSORBwJsPFgJelDX8Jlgsq2Xw9yMO5kucFj1UtvUYAteu?=
 =?iso-8859-1?Q?H9jJ7xZdmkIeQHu99FsUK9rSIlpQ7eeTFBOoYHscQhFxtfRkfWhMbG/mqk?=
 =?iso-8859-1?Q?1FHqo+5evlk6rsn1eO3rDyakIk1HdmbGuOEzagv2GEuHeRuCtnTDTbLCwF?=
 =?iso-8859-1?Q?jwBaAtf4I/VsObQgQx1RnkznvCmW3zruRibC7iOnn+MyEQQ0+jDl7pw1CF?=
 =?iso-8859-1?Q?gXgE1ZACd7H7XmWpKJvTcycUF5CK6Kl1dK+W8Z9mMWqzraDh2df7mBkNgL?=
 =?iso-8859-1?Q?XqJfdmsMW1gBP5WKcL1B7VeUUBqCYboCPIcVs1T4aA+BdYtPaVqCPyHkr1?=
 =?iso-8859-1?Q?hsTgBBEj1lwFVF5PPoLmHmfgjWenBZmsIfNGDYL5OY9m0AEuE0EJUSUOEr?=
 =?iso-8859-1?Q?MheCGvCyP5RpBuCA0ZdQXtRLLPC/0823x0mBQQLqpKR0tItBHs7mkJsNK2?=
 =?iso-8859-1?Q?T45U/ahbxbbBIsix+gpZMMz5TpDihUB4Zg919dgnn047o42nDFEcLZgMOG?=
 =?iso-8859-1?Q?wWWgc8YBIcZ4kk5jBKsc1Ra7wQZFWCH6keEEdpcgDZGiLXZiL3P0V/P6pS?=
 =?iso-8859-1?Q?d/a9uz/gbdECiiQSRu6f6JCjds0tBI6c8KiCkRPT0UO8VLFSMhBinI+PPE?=
 =?iso-8859-1?Q?rxo55SPTOOzx7ISDhYnqDkVmJPCEjLTbF0c1RRjXj/H8WNVQzIRb2le8Br?=
 =?iso-8859-1?Q?L1pG9mk1RuuyvQG6Ab43v06D2tbySa3q/1GopURtyF9raY6hikE901LsZu?=
 =?iso-8859-1?Q?79K/0AiA1KWM2rPrIqb1C7fhBFU0/QXYMW3STQtDKTV1Q5ddHIKhx+5bvY?=
 =?iso-8859-1?Q?ZhaNsiUznbeNV42edF7Rp8PU00MXENomWTTrzkELwflPVmg1Y1GF+SoEY2?=
 =?iso-8859-1?Q?cdHXFDUEdtGpOzIupkKX63F7vTMdJIHW3npPJogtv5FvuzGr8NIJS2Dg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bebd6b8-a62c-47ac-9a58-08ddc5e409e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 10:15:36.5280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0rj5ZqoEmP1DMDEJJhF/Dg7C2yRtW1OXst+ZoxjZb1dG2q9Q8TP15PplYLrSmU3+pGoXLA4ETOuV3fabm0l0GOCqQ2NB9OKNBmGial053xY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6721

From: Grygorii Strashko <grygorii_strashko@epam.com>

The dump_p2m_lookup() is not used, so remove it.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/include/asm/page.h |  2 --
 xen/arch/arm/mmu/p2m.c          | 13 -------------
 2 files changed, 15 deletions(-)

diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/pag=
e.h
index 27bc96b9f401..623fa09e1932 100644
--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -289,8 +289,6 @@ void flush_page_to_ram(unsigned long mfn, bool sync_ica=
che);
=20
 /* Print a walk of the hypervisor's page tables for a virtual addr. */
 extern void dump_hyp_walk(vaddr_t addr);
-/* Print a walk of the p2m for a domain for a physical address. */
-extern void dump_p2m_lookup(struct domain *d, paddr_t addr);
=20
 static inline uint64_t va_to_par(vaddr_t va)
 {
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 67296dabb587..51abf3504fcf 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -178,19 +178,6 @@ void p2m_dump_info(struct domain *d)
     p2m_read_unlock(p2m);
 }
=20
-void dump_p2m_lookup(struct domain *d, paddr_t addr)
-{
-    struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
-
-    printk("dom%d IPA 0x%"PRIpaddr"\n", d->domain_id, addr);
-
-    printk("P2M @ %p mfn:%#"PRI_mfn"\n",
-           p2m->root, mfn_x(page_to_mfn(p2m->root)));
-
-    dump_pt_walk(page_to_maddr(p2m->root), addr,
-                 P2M_ROOT_LEVEL, P2M_ROOT_PAGES);
-}
-
 /*
  * p2m_save_state and p2m_restore_state work in pair to workaround
  * ARM64_WORKAROUND_AT_SPECULATE. p2m_save_state will set-up VTTBR to
--=20
2.34.1

