Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA61CC5726
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 00:14:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188431.1509611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVeF0-00010i-T0; Tue, 16 Dec 2025 23:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188431.1509611; Tue, 16 Dec 2025 23:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVeF0-0000yO-Pm; Tue, 16 Dec 2025 23:14:02 +0000
Received: by outflank-mailman (input) for mailman id 1188431;
 Tue, 16 Dec 2025 23:14:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8rmh=6W=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vVeEz-0000XY-Nx
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 23:14:01 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e784aa7f-dad4-11f0-9cce-f158ae23cfc8;
 Wed, 17 Dec 2025 00:14:00 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by GVXPR03MB8331.eurprd03.prod.outlook.com (2603:10a6:150:6e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 23:13:51 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9412.005; Tue, 16 Dec 2025
 23:13:50 +0000
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
X-Inumbo-ID: e784aa7f-dad4-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtbWPuTDAmBz1T9ch2qOkgUitAdIYtaNmC4kEq0J+zleBRkq83QpGnQR2+Ffz6PTWtaXJQJnGdBur2ShE0SPbyn7qlL2S5OsBPBOpE5fGHkMOetWQuN8K4NNVrtIQB7YKH4CG/5egZRbTyJf7/A+oYoq6LKh98mnYajZJ54XCtHqebI9+IMpJldQSrF5OfdtaZ+kIMaIYqpgcHeromP4CaSf1ffG8V9TRpM2vhHaRDFVbuGZXF2SisNSBOwbE6c98CFGDYcoULE0NLK++iS2r4QBkaMd8r6VDDpwgGqeQ5FDWhWLSAnsDClRN87f9BJA+uMpUrhnw8KndRIFpsbdyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VYrSxKmZQjc47TeHgh0dNanZq+DSjKn34XnKpmx6jY=;
 b=zEl0XINHm5GtPY4CUj0RuGiM8HKSsK2bQ+nyDOLgNncCUHIr8T4D1ySwldm+sipJJkSwALKNZ5lgShJK3vrNFVx0pVI9AHInNWu7DYkczEZTNIF01CihQdeP0cs0JfPcPFsQ3VrbVctXu/hVxotXXTwz+4ZqOsTIPGnJlYGXDXjfUo6vZ8dKcNRpICTbPfxcoMMiWQ1OHVKI1LX0nB3piNv2g44ihf/6GjpU3msRkYCwFi+aMwR9vGhRtUD3ljrouH4gN07UZdFUQa7sf8D+zgBopm3CQwDylPQrWdIhCxIPmtDy0yEmfJzNvW84Tq+aOlz5y/rQF6u3RPHxILyqLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VYrSxKmZQjc47TeHgh0dNanZq+DSjKn34XnKpmx6jY=;
 b=gMaocfO/QvcaWSmgS1Q6gL207NyRZITOBcgWv3BvPkpRpoBeHN+OyKFa6dU3rLCLEMOpYzCRkd1G6QgixrtS9gRuGG/yzRPvp7Uz+38G5vAEXXM3v8L48/Np2W2Gb5NsY7XtVecxcJ7yQoysdvQIdMd7XERegopDJh2QDBLUuga5U7M2+LOk6DppFVfB9YnRDsImBek+bSSXuAwJzxMlyHUwX1ICzFu7+WaaQ8T6ecPIMMQmuvzdCrFbj8NO8i+7W+xu2O0FEj0+t1WCKt3l+6d3I0o0oTWIIeaTVnavYo2ssl6gwv1DfkotulkIPu+tkChK9wIpECMOq6ZRmNoFlQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v4 2/2] xen/x86: move d->arch.physaddr_bitsize field handling
 into pv32
Thread-Topic: [PATCH v4 2/2] xen/x86: move d->arch.physaddr_bitsize field
 handling into pv32
Thread-Index: AQHcbuGj/uvg7Q87N0ehJJPY1cH2ew==
Date: Tue, 16 Dec 2025 23:13:50 +0000
Message-ID: <20251216231348.3897820-3-grygorii_strashko@epam.com>
References: <20251216231348.3897820-1-grygorii_strashko@epam.com>
In-Reply-To: <20251216231348.3897820-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4594:EE_|GVXPR03MB8331:EE_
x-ms-office365-filtering-correlation-id: 13a90a98-6b50-4eb2-5da7-08de3cf8c64c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?g6Y/4XsQgDaFeH9iMA1GThZWlmPXV9b0skImXrjMSK3Nz3NMPJ9LARz2QY?=
 =?iso-8859-1?Q?WfNEP8Xvft+p90Un7cYvlaH0AYqpYGGimYVVe7GbZo4vZ/GtcLCsFHwYu8?=
 =?iso-8859-1?Q?51Xf0PQ2z8kGwidewNY2LzvkIJ/rkjlzIciLVHaTm/MqfUCxpswKcDLYPo?=
 =?iso-8859-1?Q?RmegxRVNxb2YZaxOxKDnSdG9kxWKfS56NBYWK6I2b3fvpgqPMVazMcA1e6?=
 =?iso-8859-1?Q?QbcMpspClq5EL9b4NEaRoCZxLV7fHVxkFKvS988Zwi7OLAUsgCpt6rpi/X?=
 =?iso-8859-1?Q?c0SKOqJLkiLCEyOVc0mfxHPLiiV3kQ2OwicbJ1/jnxmurN1cnej9bxT3uO?=
 =?iso-8859-1?Q?skmiKSLKjHr1i5Shrtc3CJhiyvsH9OJnM2bbifVd/EtUGwvTSBUl8ili/y?=
 =?iso-8859-1?Q?IgSkIv7N1uRNQBNkNVAZGGkoF6snyDOgc1/obAux2d7Ed7CkDdtPQtur4I?=
 =?iso-8859-1?Q?zYsYopwik0Hevf3Eh6Rvxgl8C+5phMx+V7e1P5Qku5sIr6vW3dXZSQVxBt?=
 =?iso-8859-1?Q?w3flW3MexxQM3wBjmzlLnqev3MLgpMdAZgYQl7zhYl08WokckVz4fHJPeP?=
 =?iso-8859-1?Q?Vzi7Xm+JAbTlnTRnz0wN1npRLsIFyrTGLO07N8+1w0qrxu8w4RM3wiop2Z?=
 =?iso-8859-1?Q?JZXWq5+KxufktUxfu6+iQP+UEAbESkGZK2KZABrvZUsmbqTUbPd6nBSuFi?=
 =?iso-8859-1?Q?TcKrFRU1QmpSmznPR8Pj7KkNc8l6MfY6uB0veZHhvYlVHkr7DhVYch3zvc?=
 =?iso-8859-1?Q?J8GiZdtKRKjjdWby1OF3rxa/YCLESWxuUvWGcIR9ESVZVBKeCGHikR38D4?=
 =?iso-8859-1?Q?wpfZALawkRIxyAWqp4HO3BwyVIIDO3n4gdXrXGrmMdSmxesF7Zm+TqmDH7?=
 =?iso-8859-1?Q?XxMuILdEhX6t3rg18yOw9MerG+c86BfLn0lnAf85t4g+ZQh0k5kyF2FwF8?=
 =?iso-8859-1?Q?Hl45sjd+MOLlDYWFq4Kms1bnefhtAfGD4AN+4AVVTpkExzjX4UT7Bncn6X?=
 =?iso-8859-1?Q?JTr+IECjglpkTDLS5ctTPvnZgsvuBvhk8cZBQSPWb7ho8GC4rSOVf8aNfF?=
 =?iso-8859-1?Q?Vbbb+00MO5HfOuwYOBqdZbyMHa4ur1/EDu4+gyZGZOp7Rvi3aBrJNjBNGj?=
 =?iso-8859-1?Q?Q4M4fqEuG15kvn8fZOhDZSOTvMDI9G7A4JGkokC3VSmQvMbpZ1ZESS+ZDp?=
 =?iso-8859-1?Q?x7yEsOBaIDfgoA1q7lmP0vrkzUl0F4npx1sLSxcTXPkNqwnaUugKu8NVn7?=
 =?iso-8859-1?Q?4z3MSj/kBKFiS7kj+dG2TNI5GFyw3paSe6H5JVwiIelBegpvDB6aHTZQNb?=
 =?iso-8859-1?Q?5WgIL7WteCbx3ziT6m1oRa74Cs/KWngYzyeZkN9tHrmNxpo7q6540mL8Z2?=
 =?iso-8859-1?Q?9sZV3CuwosyhqpU7aHnDX8D8gzYRsomJ0gVX6PsdalZHSf5WlFVHV/Rfhi?=
 =?iso-8859-1?Q?ZS1vFBKRASjo3drtB5JwqCMnMbMtqeTyON5Bqw1NhL1eu1MTCXAKLws3yv?=
 =?iso-8859-1?Q?J5NyMLKmgsahjM/HuUjCigpW0tXZfLDSnPJEg93gNsaC9um/hrYHjonN7S?=
 =?iso-8859-1?Q?5e4BQmE4OFlwAN2RmUECMpkfXhg7?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Zq3LnVkXwY3ePnqP84B/L18YVnsDJLEvQNh7EsgLEorTihyscOSX7JAKkP?=
 =?iso-8859-1?Q?wA5prPXzcJYBzNhCtG3oZxSayD53hRj1kmz0nKMjirZ93l/VY5aP2wdnn4?=
 =?iso-8859-1?Q?Dgxebo9LyxQ4aBfld5IMIc4OCfX/Vfz8TTfQ+OzciJLGUZwRk67DVsms3U?=
 =?iso-8859-1?Q?YK+tSn3rSsaz+U5ZM0A/n/Wlclzx7k3rG0dWvZzBXCWM+ckRM4a5nvTzJh?=
 =?iso-8859-1?Q?Y1aebHdR5DSYwSM4Fj0KO+7dJfncjWBtwQeb5UA9m4q70sAKZH7fHFGpZ1?=
 =?iso-8859-1?Q?Fx63dR4E5eR40gLp4RIL12cncs15pvPKtCQrdLknaCwkI1VzeFRiIC52c5?=
 =?iso-8859-1?Q?PftqJPjetG9ydp7XWpb4Fy04cdCRmQqKaDP1f4vr4K1fbknfmSJMNUTP0y?=
 =?iso-8859-1?Q?XUyLlSV2/9WExhhhOQfGBcpiMw75UPXR4V5Or3pauoy7agURiuCTL2h4OP?=
 =?iso-8859-1?Q?buz5d8TMyouc881GFb01HNdBp+HLl8Ztopk1o4/vg1h/KOF5Vr6LSRMGU5?=
 =?iso-8859-1?Q?XKnDqaGxgsPQ6X8mUqyKjyaTpwsYdlkCfTFJoiVBkYlyUshYH7TF4OyLyc?=
 =?iso-8859-1?Q?2blco16sfvPe1jxlOrattXc9qerFMzWe2AHBCD3Z16bWxRA+Fj9rO8e6qD?=
 =?iso-8859-1?Q?SXwuuvLfKaFclKEXuJrfJ8+pVETASbrbjwK6VCV4uYzHu2ePgt2HeEWb0q?=
 =?iso-8859-1?Q?zvlbijqyEl9sYT5H+uaE5+PuFXqHjgPApIX7H6dv6rjxzEUN/WNBiXsuXI?=
 =?iso-8859-1?Q?8nTf6yMiKh6tJCXyLl0I7VHcqvJSG94H2gdXRl0BlWTGkzj7eJkIWOvtr7?=
 =?iso-8859-1?Q?0WXg7Te14zEpMXbddE2A/hth6Mwz6sKPJcKsXCAITAeTL5mZDWDmfeDiFa?=
 =?iso-8859-1?Q?OqTKoi3tbBJRqeAo31EVYmZuvQNB34GhvG6mTlzjjtTiWuEDDJZbe6VeHA?=
 =?iso-8859-1?Q?46QHr9n2waFJfj5lI3CDvSxKJ05EDJ99zr3OSeUTlWMzhiQzFr6Z9Tvy3j?=
 =?iso-8859-1?Q?99kF6zgXpIUsWKuPBM2QyT1zEVJNLxaFB19i2Ki3x7LVizBleOU7QI+Uwx?=
 =?iso-8859-1?Q?w3uPLX4mWTipH/+9ENwcR+Io477ZWjnzuAUMIH1YBTmVRS8kzkqLQfoGvE?=
 =?iso-8859-1?Q?t09Q9IiR5fKJQgCdSPs3Xqhgqfyk3iO6+vyEN9EPQj8MzlM3cXVcE+U5bR?=
 =?iso-8859-1?Q?vYA1yPYlmEFDgF5rIAIFQvTJdB8gtNTE5MhTlJjFe4Bz8gE79J9KhWLhFS?=
 =?iso-8859-1?Q?RX0Z4bspxlrB0s0rGqThnE+mrIS/FBpnyJPRSJ9yne2DTnNoG1D8YWnvWw?=
 =?iso-8859-1?Q?epUNdLFRMvhoRydK2Rq8gEVrTzvwy26R0UL7pwYTesH2EeJg/XrW5YwOd0?=
 =?iso-8859-1?Q?Vl10Okia0ZsVmzP+vMcfwkRK6HtGJakhRJfKQVXzJRUHAhGY38MNy1gk/4?=
 =?iso-8859-1?Q?BOAIEQjZKwPl6lZ3lPO5Lh/kCPVF3UkHqgZ9/kqAd0WNS0+ZmSkFHJ+bu+?=
 =?iso-8859-1?Q?/rEdA6k8UNwpNSkx/+EmAPUQOg8SquGiWtVNiQCnszCYqb0ER73mQ4SERv?=
 =?iso-8859-1?Q?iiqrPwK/e6N3XX612RimPHFXE/JMMIyLePvxcEmoY/gfVNrfcS74IiaYKw?=
 =?iso-8859-1?Q?oVaFxjIWIDhAc4qfoG+v4c9NzlQG/7fBVdmkz40HYF5xAG2AMLYAXacw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a90a98-6b50-4eb2-5da7-08de3cf8c64c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 23:13:50.3040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xJ6pUx3yJ7ZoC/6Je2N1gTVoT6O4ug8t5L+oW9Au6iPo8U1ePgEclNwuYv2YcW5qWGHLwk7K8ZchqsU3afhdfdk5yXrcpTXTm8UW4wEhnKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8331

From: Grygorii Strashko <grygorii_strashko@epam.com>

The d->arch.physaddr_bitsize field is used only by PV32 code, so move
d->arch.physaddr_bitsize field under PV32 ifdef into struct pv_domain.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v4:
 - rebase
 - new patch

 xen/arch/x86/include/asm/domain.h | 6 +++---
 xen/arch/x86/include/asm/mm.h     | 4 ++--
 xen/arch/x86/pv/dom0_build.c      | 7 +++++--
 xen/arch/x86/pv/domain.c          | 2 +-
 4 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/d=
omain.h
index 7e5cbd11a464..16cd45cc32c0 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -290,6 +290,9 @@ struct pv_domain
=20
 #ifdef CONFIG_PV32
     unsigned int hv_compat_vstart;
+
+    /* Maximum physical-address bitwidth supported by this guest. */
+    unsigned int physaddr_bitsize;
 #endif
=20
     /* map_domain_page() mapping cache. */
@@ -319,9 +322,6 @@ struct arch_domain
 {
     struct page_info *perdomain_l3_pg;
=20
-    /* Maximum physical-address bitwidth supported by this guest. */
-    unsigned int physaddr_bitsize;
-
     /* I/O-port admin-specified access capabilities. */
     struct rangeset *ioport_caps;
     uint32_t pci_cf8;
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 89e8940c3316..734e6b3af1d6 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -624,8 +624,8 @@ extern int memory_add(unsigned long spfn, unsigned long=
 epfn, unsigned int pxm);
     struct domain *_d =3D (d);                                            =
       \
                                                                           =
     \
     ((_d &&                                                               =
     \
-      _d->arch.physaddr_bitsize)                                          =
     \
-         ? min_t(unsigned int, _d->arch.physaddr_bitsize, bits)           =
     \
+      _d->arch.pv.physaddr_bitsize)                                       =
     \
+         ? min_t(unsigned int, _d->arch.pv.physaddr_bitsize, bits)        =
     \
          : bits);                                                         =
     \
 })
 #endif
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 418b453ba8bf..9a11a0a16b4e 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -626,8 +626,10 @@ static int __init dom0_construct(const struct boot_dom=
ain *bd)
         initrd_mfn =3D paddr_to_pfn(initrd->start);
         mfn =3D initrd_mfn;
         count =3D PFN_UP(initrd_len);
-        if ( d->arch.physaddr_bitsize &&
-             ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)=
) )
+
+#ifdef CONFIG_PV32
+        if ( d->arch.pv.physaddr_bitsize &&
+             ((mfn + count - 1) >> (d->arch.pv.physaddr_bitsize - PAGE_SHI=
FT)) )
         {
             order =3D get_order_from_pages(count);
             page =3D alloc_domheap_pages(d, order, MEMF_no_scrub);
@@ -650,6 +652,7 @@ static int __init dom0_construct(const struct boot_doma=
in *bd)
             initrd->start =3D pfn_to_paddr(initrd_mfn);
         }
         else
+#endif
         {
             while ( count-- )
                 if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index ca5f6920516e..01499582d2d6 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -257,7 +257,7 @@ int switch_compat(struct domain *d)
     d->arch.pv.hv_compat_vstart =3D __HYPERVISOR_COMPAT_VIRT_START;
=20
     if ( MACH2PHYS_COMPAT_NR_ENTRIES(d) < max_page )
-        d->arch.physaddr_bitsize =3D
+        d->arch.pv.physaddr_bitsize =3D
             /* 2^n entries can be contained in guest's p2m mapping space *=
/
             fls(MACH2PHYS_COMPAT_NR_ENTRIES(d)) - 1 + PAGE_SHIFT;
=20
--=20
2.34.1

