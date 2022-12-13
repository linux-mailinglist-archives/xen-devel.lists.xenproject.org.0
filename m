Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF3964BDAB
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 20:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461144.719191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5BNM-0004Gk-9W; Tue, 13 Dec 2022 19:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461144.719191; Tue, 13 Dec 2022 19:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5BNM-0004DJ-5v; Tue, 13 Dec 2022 19:55:40 +0000
Received: by outflank-mailman (input) for mailman id 461144;
 Tue, 13 Dec 2022 19:55:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsqc=4L=riversideresearch.org=rsmith@srs-se1.protection.inumbo.net>)
 id 1p5BNL-0004DD-81
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 19:55:39 +0000
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0102.outbound.protection.office365.us [23.103.208.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c7be157-7b20-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 20:55:37 +0100 (CET)
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:185::22)
 by BN0P110MB1723.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 19:55:34 +0000
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::81df:6431:7a2d:4610]) by BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::81df:6431:7a2d:4610%5]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 19:55:34 +0000
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
X-Inumbo-ID: 1c7be157-7b20-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=imL7yCjurKa27rC7dgfE9HCqhq2TiwWcoSEFvXDBAG5kMKLiPyAVNqOfs7lECKpHAkrzyNSBJsfXX/2PMt7m0tv2gQdZVwbYC3cMFzX9bJSj1XV5ChmXeqpLzrwQItDfyRAKFdQrfqvpipV74TwigptuzKK0Xn2huMKgbmXYA4egtvLudr2UTenrIq9ilQMqj90wjvnSZ4r1y4sgSGOi1lH9zd1x+P+E9VD9MpNr61EvkxFMwcTCGEo7TxMpnYxrloRwjs6ESpI8lMDUR8WEE1jBRmOr6aIug3eAcWzyPYlIBAxI5+HE+wIM8o9OVW9SeDuhnAKY48OSm7VvPhORzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IMI+mmkmPVmMi766DubIF+lD8dUSlj9ua78sytnAyM=;
 b=wC6IgpssASedNx2cvzJHW+WDfM/Tka3DNL46sE0PVLvl7FzPrtK78gMTQjd6CBz8pLueKdX3XoCaGKtWPx1Dm3j3Rc5RS4WSGrf5Jy0kCYCc/uHNl7VWvYcku+p6XuLqhq1x05ZOWXlDx0WTs2xZ6Bu8y5Fl5lCRO3Qa6v0s0UFxqqnyVBgwnOGBNgojcRslKIna7QZIxDqSPAHZrBeTOGYPvTf0xx43gJAGHGrmv7SMGz0WxuBENAVZQtX2wDshM7p76cWT19S+P5RqFxcg27qKNOqO60HfR3N0hpGbd81UzlJnkBBteBdbWsgCr+Hgv4BtLYuOEhxj4o8YbS567A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=riversideresearch.org; dmarc=pass action=none
 header.from=riversideresearch.org; dkim=pass header.d=riversideresearch.org;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riversideresearch.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IMI+mmkmPVmMi766DubIF+lD8dUSlj9ua78sytnAyM=;
 b=ZoCWXtXVTv1GMonMKnUjoZWIlVDNS3C/tcHIdJ8GMB+eChENikRlbn1cypGgT3dP6KWEb90yaOLN68qgtCpjt2t7jWzubcWgUAvF4epzuHcHOyfgI15QG+6re12NZDTdT+JiSTv1L8mQFl0me/vB6Z+2In+95+cmO+QchriWbptYrSi+XGxd+nC141IFQx1/fD+JLf06kE7lxd/3oncbnESZpZsg/cWYYK/n2jkw4NDZt8LiJJa5r5dAB7I+BrwVBaelwB45bOgS9rY1r/mmghqEOm3UmlDUgnMxyg/Phs0m2E0oQHrmdC1j4sp2g5Uc+PFO+18d8TqOg4QF3Ekfew==
From: "Smith, Jackson" <rsmith@RiversideResearch.org>
To: "Smith, Jackson" <rsmith@RiversideResearch.org>
CC: "Brookes, Scott" <sbrookes@RiversideResearch.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, "demi@invisiblethingslab.com"
	<demi@invisiblethingslab.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>
Subject: [RFC 4/4] Implement VMF for arm64
Thread-Topic: [RFC 4/4] Implement VMF for arm64
Thread-Index: AQHZDyzdNLqpW42xnEGVL+R/wWY6pg==
Date: Tue, 13 Dec 2022 19:55:34 +0000
Message-ID:
 <BN0P110MB16426A3F6761700C397AADD0CFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
References:
 <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To:
 <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: c8fc6a6e-64fc-8b95-9f14-261ab31ebef3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=RiversideResearch.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1642:EE_|BN0P110MB1723:EE_
x-ms-office365-filtering-correlation-id: d191301d-682b-4a07-86f5-08dadd43ffa8
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4CPAHUiMcyua0BIinpi+oOCBLmY/iVlBxOOEIKZrdIJscUMnXvhgzJXp75JK5prO3KqIHWJQhTGQ6obOaNBIFdLXPdS/YYUJX7tzophdFDkeRp+SIfMKd0QvpQfhOgcaKbA2mde3b7y8MkEMHBmRbzzUlO6HttTlOX9GRbDfHOjrc5FEkPKgwCr2k2yX/bzol4Q0WKwVvXCAEAh0HMHuZACn6AnSdQoCfq3C5i2U58TTQ/CkKhVkz3EGK3s7MW/NgBDDflztsVmS6FEaQvF3o8znCeBQM4haRQA/A6flceQXV/lDAj4ePerP+9qzsjy9uitH7n6535JdaX1IA+0aAyBdCI0VbmhdPsO+1xnjpa5hQBydUmp+UxKxoYNFbT6nRowUtRa7dt2dYw+S68yAn+4rwovl54DdIxLY3lTmS9XpxRo/9aMIHjjNj2vZ7Rz7G9L934BTxRg3Ejnmtvb1BEDdPPQ6oTsiitqi5sxNtSeQH826N/jMwSmjVzohWIX+3NXs7uC+PIhNOQQHB7daP7bNfONLU29Mbv/6BxP1rNvsulAW+X82udHvUffpG/4BozbyFvhNmJwKZjuNo2s3gj/smMS1fdKgMG1c/Md3wr1gEpFl4iQu7W3R0s3TQq8CdRmmiQyv31QBpTrDUadZT61SrJOtCVwrdwTV85a0IrCrXYbLFo6F4Jh5f98fW5eM
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(366004)(451199015)(7696005)(2906002)(33656002)(66946007)(86362001)(6506007)(186003)(508600001)(6200100001)(9686003)(2940100002)(83380400001)(4326008)(66556008)(64756008)(66476007)(76116006)(6862004)(26005)(52536014)(5660300002)(122000001)(7416002)(30864003)(82960400001)(8936002)(8676002)(54906003)(71200400001)(38070700005)(38100700002)(66446008)(55016003)(2004002)(21314003)(85282002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 9oz6PTr2lz0cxAWTwBFXqzjvmZj1AYqsuiYvpd7O2r3l8Mkg0wwu+CsT8lB0FSLxkLtuEeEizXSfvB+SXEyB7gOZEIOU/6Gw3v6hD+3RA5JOoPQaonVPPuqG+aurEbhyCvrZfuF6ij/Q1wQEQz9ATESYiT6QYLUZsD2gc2hq0DgUYhH/Tw0mhyIGPLMzqV0oKC0W+iSzD3Flevg/jk2QwQ57CCHeLZvFROBTM5Gzes19SP+6PvuErWTZsbqqVyGn9DAVgZ1Ga/lBjsPRo6IK2SVyLykYLkQE/7y5KudKfxQztxuOSYwdGhQOIzI20EGygGTMriwfGMbrhxRTziLESGhRjTBY2Q1uBNftvU1I14w/d6KUjX6bW3kiF2AvoNXl1+E4siv14xdZjhRU8GZBInWfmojDMJqgKHY45wpRFcw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: riversideresearch.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d191301d-682b-4a07-86f5-08dadd43ffa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 19:55:34.7816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bfc64a8d-9064-4c64-91c3-9d10b44c1cb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1723

Implements the functions from xen/vmf.h for arm64.=0A=
Introduces an xen/arch/arm/mm-walk.c helper file for=0A=
walking an entire page table structure.=0A=
---=0A=
 xen/arch/arm/Makefile              |   1 +=0A=
 xen/arch/arm/include/asm/mm-walk.h |  53 ++++++++++=0A=
 xen/arch/arm/include/asm/mm.h      |  11 +++=0A=
 xen/arch/arm/mm-walk.c             | 181 +++++++++++++++++++++++++++++++++=
=0A=
 xen/arch/arm/mm.c                  | 198 +++++++++++++++++++++++++++++++++=
+++-=0A=
 xen/common/Kconfig                 |   2 +=0A=
 6 files changed, 445 insertions(+), 1 deletion(-)=0A=
 create mode 100644 xen/arch/arm/include/asm/mm-walk.h=0A=
 create mode 100644 xen/arch/arm/mm-walk.c=0A=
=0A=
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile=0A=
index 4d076b2..e358452 100644=0A=
--- a/xen/arch/arm/Makefile=0A=
+++ b/xen/arch/arm/Makefile=0A=
@@ -37,6 +37,7 @@ obj-y +=3D kernel.init.o=0A=
 obj-$(CONFIG_LIVEPATCH) +=3D livepatch.o=0A=
 obj-y +=3D mem_access.o=0A=
 obj-y +=3D mm.o=0A=
+obj-y +=3D mm-walk.o=0A=
 obj-y +=3D monitor.o=0A=
 obj-y +=3D p2m.o=0A=
 obj-y +=3D percpu.o=0A=
diff --git a/xen/arch/arm/include/asm/mm-walk.h b/xen/arch/arm/include/asm/=
mm-walk.h=0A=
new file mode 100644=0A=
index 0000000..770cc89=0A=
--- /dev/null=0A=
+++ b/xen/arch/arm/include/asm/mm-walk.h=0A=
@@ -0,0 +1,53 @@=0A=
+#ifndef __ARM_MM_WALK_H__=0A=
+#define __ARM_MM_WALK_H__=0A=
+=0A=
+#include <asm/lpae.h>=0A=
+=0A=
+#define RECURSIVE_IDX ((unsigned long)(XEN_PT_LPAE_ENTRIES-1))=0A=
+#define RECURSIVE_VA (RECURSIVE_IDX << ZEROETH_SHIFT)=0A=
+=0A=
+/*=0A=
+ * Remove all mappings in these tables from Xen's address space=0A=
+ * Only makes sense if walking a guest's tables=0A=
+ */=0A=
+#define WALK_HIDE_GUEST_MAPPING (1U << 0)=0A=
+/*=0A=
+ * Remove all mappings to these tables from Xen's address space=0A=
+ * Makes sense if walking a guest's table (hide guest tables from Xen)=0A=
+ * Or if walking Xen's tables (lock Xen's virtual memory configuration)=0A=
+ */=0A=
+#define WALK_HIDE_GUEST_TABLE (1U << 1)=0A=
+=0A=
+/*=0A=
+ * Before we can hide individual table entires,=0A=
+ * we need to split the directmap superpages=0A=
+ */=0A=
+#define WALK_SPLIT_DIRECTMAP_TABLE (1U << 2)=0A=
+/*=0A=
+ * Like walk table hide, but using recursive mapping=0A=
+ * to bypass walking directmap when table is in the directmap=0A=
+ */=0A=
+#define WALK_HIDE_DIRECTMAP_TABLE (1U << 3)=0A=
+=0A=
+/* These are useful for development/debug */=0A=
+/* Show all pte's for a given address space */=0A=
+#define WALK_DUMP_ENTRIES (1U << 4)=0A=
+/* Show all mappings for a given address space */=0A=
+#define WALK_DUMP_MAPPINGS (1U << 5)=0A=
+=0A=
+/*=0A=
+ * Given the value of a ttbr register, this function walks every valid ent=
ry in the trie=0A=
+ * (As opposed to dump_pt_walk, which follows a single address from root t=
o leaf)=0A=
+ */=0A=
+void do_walk_tables(paddr_t ttbr, int root_level, int nr_root_tables, int =
flags);=0A=
+=0A=
+#endif /*  __ARM_MM_WALK_H__ */=0A=
+/*=0A=
+ * Local variables:=0A=
+ * mode: C=0A=
+ * c-file-style: "BSD"=0A=
+ * c-basic-offset: 4=0A=
+ * tab-width: 4=0A=
+ * indent-tabs-mode: nil=0A=
+ * End:=0A=
+ */=0A=
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h=
=0A=
index 68adcac..2e85885 100644=0A=
--- a/xen/arch/arm/include/asm/mm.h=0A=
+++ b/xen/arch/arm/include/asm/mm.h=0A=
@@ -209,6 +209,17 @@ extern void mmu_init_secondary_cpu(void);=0A=
  * For Arm64, map the region in the directmap area.=0A=
  */=0A=
 extern void setup_directmap_mappings(unsigned long base_mfn, unsigned long=
 nr_mfns);=0A=
+/* Shatter superpages for these mfns if needed */=0A=
+extern int split_directmap_mapping(unsigned long mfn, unsigned long nr_mfn=
s);=0A=
+/* Remove these mfns from the directmap */=0A=
+extern int destroy_directmap_mapping(unsigned long mfn, unsigned long nr_m=
fns);=0A=
+/*=0A=
+ * Remove this mfn from the directmap (bypassing normal update code)=0A=
+ * This is a workaround for current pgtable update code, which cannot be u=
sed=0A=
+ * to remove directmap table entries from the directmap (because they are=
=0A=
+ * needed to walk the directmap)=0A=
+ */=0A=
+extern void destroy_directmap_table(unsigned long mfn);=0A=
 /* Map a frame table to cover physical addresses ps through pe */=0A=
 extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);=0A=
 /* map a physical range in virtual memory */=0A=
diff --git a/xen/arch/arm/mm-walk.c b/xen/arch/arm/mm-walk.c=0A=
new file mode 100644=0A=
index 0000000..48f9b2d=0A=
--- /dev/null=0A=
+++ b/xen/arch/arm/mm-walk.c=0A=
@@ -0,0 +1,181 @@=0A=
+/*=0A=
+ * xen/arch/arm/mm-walk.c=0A=
+ *=0A=
+ * This program is free software; you can redistribute it and/or modify=0A=
+ * it under the terms of the GNU General Public License as published by=0A=
+ * the Free Software Foundation; either version 2 of the License, or=0A=
+ * (at your option) any later version.=0A=
+ *=0A=
+ * This program is distributed in the hope that it will be useful,=0A=
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of=0A=
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=0A=
+ * GNU General Public License for more details.=0A=
+ */=0A=
+=0A=
+#include <xen/lib.h>=0A=
+#include <xen/domain_page.h>=0A=
+=0A=
+#include <asm/page.h>=0A=
+#include <asm/mm-walk.h>=0A=
+=0A=
+typedef struct {=0A=
+    /* Keeps track of all the table offsets so we can reconstruct the VA i=
f we need to */=0A=
+    int off[4];=0A=
+=0A=
+    /* Keeps track of root level so we can make sense of the table offsets=
 */=0A=
+    int root_level;=0A=
+    int root_table_idx; /* only meaningful when nr_root_tables > 1 */=0A=
+} walk_info_t;=0A=
+=0A=
+/*=0A=
+ * Turn a walk_info_t into a virtual address=0A=
+ *=0A=
+ * XXX: This only applies to the lower VA range=0A=
+ * Ie. if you are looking at a table in ttbr1, this is different=0A=
+ * XXX: doesn't work for concat tables right now either=0A=
+ */=0A=
+static unsigned long walk_to_va(int level, walk_info_t *walk)=0A=
+{=0A=
+/* #define off_valid(x) (((x) <=3D level) && ((x) >=3D walk->root_level)) =
*/=0A=
+#define off_valid(x) ((x) <=3D level)=0A=
+#define off_val(x) ((u64)(off_valid(x) ? walk->off[x] : 0))=0A=
+=0A=
+    return (off_val(0) << ZEROETH_SHIFT)  \=0A=
+           | (off_val(1) << FIRST_SHIFT)  \=0A=
+           | (off_val(2) << SECOND_SHIFT) \=0A=
+           | (off_val(3) << THIRD_SHIFT);=0A=
+}=0A=
+=0A=
+/* Prints each entry in the form "\t @XTH TABLE:0.0.0.0 =3D 0xENTRY" */=0A=
+static void dump_entry(int level, lpae_t pte, walk_info_t *walk)=0A=
+{=0A=
+    int i;=0A=
+    static const char *level_strs[4] =3D { "0TH", "1ST", "2ND", "3RD" };=
=0A=
+    ASSERT(level <=3D 3);=0A=
+=0A=
+    for (i =3D 0; i < level; i++)=0A=
+        printk("  ");=0A=
+=0A=
+    printk("@%s %i:", level_strs[level], walk->root_table_idx);=0A=
+=0A=
+    for (i =3D walk->root_level; i < level; i++)=0A=
+        printk("%d.", walk->off[i]);=0A=
+=0A=
+    printk("%d =3D 0x%lx\n", walk->off[level], pte.bits);=0A=
+}=0A=
+=0A=
+/* Prints each mapping in the form IA:0xIA -> OFN:0xOFN XG,M,K */=0A=
+static void dump_mapping(int level, lpae_t pte, walk_info_t *walk)=0A=
+{=0A=
+    unsigned long va;=0A=
+    unsigned long ofn =3D pte.walk.base;=0A=
+    const char *size[4] =3D {"??", "1G", "2M", "4K"};=0A=
+=0A=
+    ASSERT(level >=3D 1);=0A=
+    ASSERT(level <=3D 3);=0A=
+=0A=
+    va =3D walk_to_va(level, walk);=0A=
+=0A=
+    /* ofn stands for output frame number.. I just made it up. */=0A=
+    printk("0x%lx -> 0x%lx %s\n", va, ofn, size[level]);=0A=
+}=0A=
+=0A=
+/* Recursive walk function */=0A=
+static void walk_table(mfn_t mfn, int level, walk_info_t *walk, int flags)=
=0A=
+{=0A=
+    lpae_t *table;=0A=
+=0A=
+    #define i (walk->off[level])=0A=
+=0A=
+    BUG_ON(level > 3);=0A=
+=0A=
+    table =3D map_domain_page(mfn);=0A=
+    for ( i =3D 0; i < XEN_PT_LPAE_ENTRIES; i++ )=0A=
+    {=0A=
+        lpae_t pte =3D table[i];=0A=
+        if ( !lpae_is_valid(pte) )=0A=
+            continue;=0A=
+=0A=
+        /* Skip recursive mapping */=0A=
+        if ( level =3D=3D 0 && i =3D=3D RECURSIVE_IDX )=0A=
+            continue;=0A=
+=0A=
+        if ( flags & WALK_DUMP_ENTRIES )=0A=
+            dump_entry(level, pte, walk);=0A=
+=0A=
+        if ( lpae_is_mapping(pte, level) )=0A=
+        {=0A=
+            /* Do mapping related things */=0A=
+            if ( flags & WALK_DUMP_MAPPINGS )=0A=
+                dump_mapping(level, pte, walk);=0A=
+            if ( flags & WALK_HIDE_GUEST_MAPPING )=0A=
+                /* Destroy all of Xen's mappings to the physical frames co=
vered by this entry */=0A=
+                destroy_directmap_mapping(pte.walk.base, 1 << XEN_PT_LEVEL=
_ORDER(level));=0A=
+        }=0A=
+        else if ( lpae_is_table(pte, level) )=0A=
+        {=0A=
+            /* else, pte is a table: recurse! */=0A=
+            walk_table(lpae_get_mfn(pte), level + 1, walk, flags);=0A=
+=0A=
+            /* Note that the entry is a normal entry in xen's page tables =
*/=0A=
+            if ( flags & WALK_HIDE_GUEST_TABLE )=0A=
+                /*=0A=
+                 * This call will look up the table pointed to by this ent=
ry in the directmap=0A=
+                 * and remove it in the typical way=0A=
+                 * This leaves the table intact, but removes the directmap=
 mapping to it, hiding it from xen=0A=
+                 */=0A=
+                destroy_directmap_mapping(pte.walk.base, 1);=0A=
+            if ( flags & WALK_SPLIT_DIRECTMAP_TABLE )=0A=
+                /*=0A=
+                 * This call will look up the table pointed to by this ent=
ry in the directmap=0A=
+                 * and make sure that it has it's own l3 entry, splitting =
superpages if needed=0A=
+                 */=0A=
+                split_directmap_mapping(pte.walk.base, 1);=0A=
+            if ( flags & WALK_HIDE_DIRECTMAP_TABLE )=0A=
+                /*=0A=
+                 * This call will look up the table pointed to by this ent=
ry in the directmap=0A=
+                 * and (now that it has it's own l3 entry) overwrite that =
entry with 0's=0A=
+                 * This leaves the table intact, but removes the directmap=
 mapping to it, hiding it from xen=0A=
+                 */=0A=
+                destroy_directmap_table(pte.walk.base);=0A=
+        }=0A=
+        /* else, invalid pte, level =3D=3D 3, vaild =3D=3D true, table =3D=
 false */=0A=
+    }=0A=
+    unmap_domain_page(table);=0A=
+=0A=
+    #undef i=0A=
+}=0A=
+=0A=
+void do_walk_tables(paddr_t ttbr, int root_level, int nr_root_tables, int =
flags)=0A=
+{=0A=
+    int i;=0A=
+    mfn_t root =3D maddr_to_mfn(ttbr & PADDR_MASK);=0A=
+    walk_info_t walk =3D {=0A=
+        .off =3D {0},=0A=
+        .root_level =3D root_level,=0A=
+    };=0A=
+=0A=
+    BUG_ON( !mfn_x(root) || !mfn_valid(root) );=0A=
+=0A=
+    for ( i =3D 0; i < nr_root_tables; i++, root =3D mfn_add(root, 1) ) {=
=0A=
+        walk.root_table_idx =3D i;=0A=
+        walk_table(root, root_level, &walk, flags);=0A=
+=0A=
+        /* Our walk doesn't consider the root table, so do that here */=0A=
+        if ( flags & WALK_SPLIT_DIRECTMAP_TABLE )=0A=
+            split_directmap_mapping(mfn_x(root), 1);=0A=
+        if ( flags & WALK_HIDE_GUEST_TABLE )=0A=
+            destroy_directmap_mapping(mfn_x(root), 1);=0A=
+        if ( flags & WALK_HIDE_DIRECTMAP_TABLE )=0A=
+            destroy_directmap_table(mfn_x(root));=0A=
+    }=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Local variables:=0A=
+ * mode: C=0A=
+ * c-file-style: "BSD"=0A=
+ * c-basic-offset: 4=0A=
+ * indent-tabs-mode: nil=0A=
+ * End:=0A=
+ */=0A=
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c=0A=
index 91b9c2b..64e9efd 100644=0A=
--- a/xen/arch/arm/mm.c=0A=
+++ b/xen/arch/arm/mm.c=0A=
@@ -21,11 +21,13 @@=0A=
 #include <xen/sizes.h>=0A=
 #include <xen/types.h>=0A=
 #include <xen/vmap.h>=0A=
+#include <xen/vmf.h>=0A=
 =0A=
 #include <xsm/xsm.h>=0A=
 =0A=
 #include <asm/fixmap.h>=0A=
 #include <asm/setup.h>=0A=
+#include <asm/mm-walk.h>=0A=
 =0A=
 #include <public/memory.h>=0A=
 =0A=
@@ -1164,7 +1166,8 @@ static int xen_pt_update(unsigned long virt,=0A=
      *=0A=
      * XXX: Add a check.=0A=
      */=0A=
-    const mfn_t root =3D virt_to_mfn(THIS_CPU_PGTABLE);=0A=
+    /* TODO: does this change have a negative performance impact? */=0A=
+    const mfn_t root =3D maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));=0A=
 =0A=
     /*=0A=
      * The hardware was configured to forbid mapping both writeable and=0A=
@@ -1273,6 +1276,199 @@ int modify_xen_mappings(unsigned long s, unsigned l=
ong e, unsigned int flags)=0A=
     return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, flags);=0A=
 }=0A=
 =0A=
+static void insert_recursive_mapping(void)=0A=
+{=0A=
+    uint64_t ttbr =3D READ_SYSREG64(TTBR0_EL2);=0A=
+    const mfn_t root_mfn =3D maddr_to_mfn(ttbr & PADDR_MASK);=0A=
+    lpae_t *pgtable =3D map_domain_page(root_mfn);=0A=
+=0A=
+    lpae_t pte =3D mfn_to_xen_entry(root_mfn, MT_NORMAL);=0A=
+    pte.pt.table =3D 1;=0A=
+=0A=
+    spin_lock(&xen_pt_lock);=0A=
+=0A=
+    write_pte(&pgtable[RECURSIVE_IDX], pte);=0A=
+    clean_dcache(pgtable[RECURSIVE_IDX]);=0A=
+=0A=
+    unmap_domain_page(pgtable);=0A=
+    spin_unlock(&xen_pt_lock);=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Converts va to a table pointer through the recursive mapping=0A=
+ * Only valid for the current address space obviously=0A=
+ */=0A=
+static lpae_t *va_to_table(int level, unsigned long va)=0A=
+{=0A=
+    /* Shift everything by 9 for each walk we skip */=0A=
+    /* Last off shifted out becomes becomes offset into page */=0A=
+    for ( ;level <=3D 3; level++ ) {=0A=
+        va >>=3D XEN_PT_LPAE_SHIFT;=0A=
+        va |=3D RECURSIVE_VA;=0A=
+    }=0A=
+=0A=
+    /* Mask out any offset, in case caller is asking about a misalligned v=
a */=0A=
+    va &=3D ~0x7;=0A=
+    return (lpae_t *)va;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Zero out the table at level when walking to virt=0A=
+ * Do this through the recursive mapping, in case we have already=0A=
+ * removed part of the directmap and can't walk to that entry=0A=
+ */=0A=
+static void clear_pte_directly(int level, void *virt)=0A=
+{=0A=
+    unsigned long va =3D (unsigned long)virt;=0A=
+    lpae_t empty =3D {.pt =3D {0x0}};=0A=
+    lpae_t *table;=0A=
+=0A=
+    spin_lock(&xen_pt_lock);=0A=
+=0A=
+    /* We're assuming we can safely remove an entry at `level` */=0A=
+    /* This depends on va not living in a superpage */=0A=
+    BUG_ON(level > 1 && !va_to_table(1, va)->pt.table);=0A=
+    BUG_ON(level > 2 && !va_to_table(2, va)->pt.table);=0A=
+=0A=
+    table =3D va_to_table(level, va);=0A=
+    write_pte(table, empty);=0A=
+    clean_dcache(*table);=0A=
+    flush_xen_tlb_range_va((vaddr_t)table, sizeof(*table));=0A=
+=0A=
+    spin_unlock(&xen_pt_lock);=0A=
+}=0A=
+=0A=
+static void remove_recursive_mapping(void)=0A=
+{=0A=
+    clear_pte_directly(0, (void *)RECURSIVE_VA);=0A=
+}=0A=
+=0A=
+static int modify_virt_mapping(void *virt, int nr_pages, int flags)=0A=
+{=0A=
+    unsigned long va =3D (unsigned long)virt;=0A=
+    return modify_xen_mappings(va, va + (PAGE_SIZE * nr_pages), flags);=0A=
+}=0A=
+=0A=
+static int destroy_virt_mapping(void *virt, int nr_pages)=0A=
+{=0A=
+    return modify_virt_mapping(virt, nr_pages, 0);=0A=
+}=0A=
+=0A=
+static int modify_directmap_mapping(unsigned long mfn, unsigned long nr_mf=
ns, int flags)=0A=
+{=0A=
+    if ( mfn & pfn_hole_mask )=0A=
+    {=0A=
+        printk("** Skipping mfn 0x%lx because it lives in the pfn hole **\=
n", mfn);=0A=
+        return 0;=0A=
+    }=0A=
+=0A=
+    return modify_virt_mapping(__mfn_to_virt(mfn), nr_mfns, flags);=0A=
+}=0A=
+=0A=
+int split_directmap_mapping(unsigned long mfn, unsigned long nr_mfns)=0A=
+{=0A=
+    return modify_directmap_mapping(mfn, nr_mfns, PAGE_HYPERVISOR);=0A=
+}=0A=
+=0A=
+int destroy_directmap_mapping(unsigned long mfn, unsigned long nr_mfns)=0A=
+{=0A=
+    return modify_directmap_mapping(mfn, nr_mfns, 0);=0A=
+}=0A=
+=0A=
+void destroy_directmap_table(unsigned long mfn)=0A=
+{=0A=
+    BUG_ON(mfn & pfn_hole_mask);=0A=
+    clear_pte_directly(3, __mfn_to_virt(mfn));=0A=
+}=0A=
+=0A=
+static void unmap_xen_root_tables(void)=0A=
+{=0A=
+    destroy_virt_mapping(xen_xenmap, 1);=0A=
+    destroy_virt_mapping(xen_fixmap, 1);=0A=
+    destroy_virt_mapping(xen_second, 1);=0A=
+#if defined(CONFIG_ARM_64)=0A=
+    destroy_virt_mapping(xen_first, 1);=0A=
+    destroy_virt_mapping(xen_pgtable, 1);=0A=
+#endif=0A=
+}=0A=
+=0A=
+static void walk_hyp_tables(int flags)=0A=
+{=0A=
+    uint64_t httbr =3D READ_SYSREG64(TTBR0_EL2);=0A=
+    do_walk_tables(httbr, HYP_PT_ROOT_LEVEL, 1, flags);=0A=
+}=0A=
+=0A=
+static void walk_guest_tables(struct domain *d, int flags)=0A=
+{=0A=
+    uint64_t vttbr =3D d->arch.p2m.vttbr;=0A=
+    do_walk_tables(vttbr, P2M_ROOT_LEVEL, 1<<P2M_ROOT_ORDER, flags);=0A=
+}=0A=
+=0A=
+=0A=
+void vmf_unmap_guest(struct domain *d)=0A=
+{=0A=
+    /* Remove all of directmap mappings to guest */=0A=
+    walk_guest_tables(d, WALK_HIDE_GUEST_MAPPING);=0A=
+=0A=
+    /* Remove all mappings to guest second stage tables */=0A=
+    walk_guest_tables(d, WALK_HIDE_GUEST_TABLE);=0A=
+}=0A=
+=0A=
+void vmf_lock_xen_pgtables(void)=0A=
+{=0A=
+    /* Remove all of the static allocated root tables */=0A=
+    unmap_xen_root_tables();=0A=
+=0A=
+    /*=0A=
+     * Remove all tables from directmap=0A=
+     * Becuase we can't use the directmap to walk tables while we are remo=
ving=0A=
+     * the directmap, add a recursive pointer and use that to erase pte's=
=0A=
+     */=0A=
+    insert_recursive_mapping();=0A=
+    walk_hyp_tables(WALK_SPLIT_DIRECTMAP_TABLE);=0A=
+    walk_hyp_tables(WALK_HIDE_DIRECTMAP_TABLE);=0A=
+    remove_recursive_mapping();=0A=
+}=0A=
+=0A=
+void vmf_dump_xen_info()=0A=
+{=0A=
+    printk("Dump reg info...\n");=0A=
+    printk("current httbr0 is 0x%lx\n", READ_SYSREG64(TTBR0_EL2));=0A=
+    printk("current vttbr is 0x%lx\n", READ_SYSREG64(VTTBR_EL2));=0A=
+    printk("current ttbr0 is 0x%lx\n", READ_SYSREG64(TTBR0_EL1));=0A=
+    printk("current ttbr1 is 0x%lx\n", READ_SYSREG64(TTBR1_EL1));=0A=
+    printk("\n");=0A=
+=0A=
+    printk("Dump xen table info...\n");=0A=
+#if defined(CONFIG_ARM_64)=0A=
+    printk("xen_pgtable: 0x%"PRIvaddr"\n", (vaddr_t)xen_pgtable);=0A=
+    printk("xen_first: 0x%"PRIvaddr"\n", (vaddr_t)xen_first);=0A=
+#endif=0A=
+    printk("xen_second: 0x%"PRIvaddr"\n", (vaddr_t)xen_second);=0A=
+    printk("xen_xenmap: 0x%"PRIvaddr"\n", (vaddr_t)xen_xenmap);=0A=
+    printk("xen_fixmap: 0x%"PRIvaddr"\n", (vaddr_t)xen_fixmap);=0A=
+}=0A=
+=0A=
+void vmf_dump_domain_info(struct domain *d)=0A=
+{=0A=
+    uint64_t vttbr =3D d->arch.p2m.vttbr;=0A=
+    uint64_t httbr =3D READ_SYSREG64(TTBR0_EL2);=0A=
+=0A=
+    printk("Dump domain info...\n");=0A=
+    printk("guest mfn =3D 0x%lx\n", paddr_to_pfn(vttbr & PADDR_MASK));=0A=
+    printk("xen mfn =3D 0x%lx\n", paddr_to_pfn(httbr & PADDR_MASK));=0A=
+}=0A=
+=0A=
+void vmf_dump_xen_tables()=0A=
+{=0A=
+    walk_hyp_tables(WALK_DUMP_MAPPINGS | WALK_DUMP_ENTRIES);=0A=
+}=0A=
+=0A=
+void vmf_dump_domain_tables(struct domain *d)=0A=
+{=0A=
+    walk_guest_tables(d, WALK_DUMP_MAPPINGS | WALK_DUMP_ENTRIES);=0A=
+}=0A=
+=0A=
 /* Release all __init and __initdata ranges to be reused */=0A=
 void free_init_memory(void)=0A=
 {=0A=
diff --git a/xen/common/Kconfig b/xen/common/Kconfig=0A=
index 3bf92b8..c087371 100644=0A=
--- a/xen/common/Kconfig=0A=
+++ b/xen/common/Kconfig=0A=
@@ -94,6 +94,8 @@ config STATIC_MEMORY=0A=
 =0A=
 config VMF=0A=
 	bool "Virtual Memory Fuse Support"=0A=
+	depends on ARM_64=0A=
+	default y=0A=
 =0A=
 menu "Speculative hardening"=0A=
 =0A=
-- =0A=
2.7.4=0A=
=0A=

