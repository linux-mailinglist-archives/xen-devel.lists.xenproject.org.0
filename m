Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0679589E2A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 17:05:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380523.614748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJcPX-00036N-OC; Thu, 04 Aug 2022 15:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380523.614748; Thu, 04 Aug 2022 15:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJcPX-00033L-Ks; Thu, 04 Aug 2022 15:05:19 +0000
Received: by outflank-mailman (input) for mailman id 380523;
 Thu, 04 Aug 2022 15:05:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMPZ=YI=citrix.com=prvs=2084bc4d8=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1oJcPW-0001pR-LQ
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 15:05:18 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d886c8f3-1406-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 17:05:17 +0200 (CEST)
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
X-Inumbo-ID: d886c8f3-1406-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659625516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=CdtbkD3eQ8hKPJiJTBFFPb8a5m5PwrGLe0HfMNmqQaQ=;
  b=G7ZY9PbNyfVRA65s7s85gODyhEWswcsgLbPFXzByoWhiY0L+8fb7NfM9
   qoiZAkGQwBiDvJmcYW/Ga6LUmnOAkHP1F4z8KVmKFm9FCqDTaep/zikLg
   PgNVXCDdLDjK9sRFOUTCY8srB6B/DaqnDeSIg0hlt2KKxLxYvoaxgGaEe
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 79938458
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TzcxsqCcdd+35BVW/z3jw5YqxClBgxIJ4kV8jS/XYbTApGwh3zFSz
 jYYXD+DO6qJMWGkct10bYmz9k4H6MPSy9NgQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pa31GONgWYuaDpEs/7b83uDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJWyDxnfAwIWUfB5Un9r5MQkZN5
 P0bcQlYO3hvh8ruqF66Yuxlh8BlJ8j3JoIP/HpnyFk1D95/H8qFGf+To4YFgnFg3aiiHt6HD
 yYdQRhmahmGRhRLM1MeDp8Wl+a0nHjvNTZfrTp5oIJosjmInFAsgNABNvLxXoCLGOJ+jn/bi
 VLEpTjWAzYhaP+QnG/tHnWE2baUwHKTtJgpPL+l8v9nhnWDy2pVDwcZPXOkpdGph0j4XMhQQ
 2QP4TYnp6U28E2tT/H+Uge+rXrCuQQTM/JAHut/5AyTx6785weCGnNCXjNHcMYhtsI9WXotz
 FDht9HjCCFrsbaVYWmA7brSpjS3URX5NkdbO3VCF1FcpYC+/sdj1XojU+qPDobuk4PwRxzU6
 gqSkyRmvPY0jt8K1PyCqAWvby2XmnTZcuIkzlyJAzP5tl4gOdTNi5+AsgaCs6sZRGqNZhzY5
 SVfxZDDhAwbJcvV/BFhVtnhC11ACxytFDTHyWBiEJA6n9hG0y7yJNsAiN2SyaoADyrlRdMKS
 BWK0e+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHarXwzPBHAhDCyyyDAdJ3T3
 r/LGftA8F5AUfg3pNZIb711PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYo43K+1RrlgtMus/VSKm
 +uzwuPQlH2zpsWiPXSMmWPSRHhWRUUG6Wfe9JYGK7bSe1o7cIzjYteIqY4cl0Vet/w9vo/1E
 ruVAye0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:B8WLcq6W0Rs8HKcvWgPXwMrXdLJyesId70hD6qhwISY6TiX4rb
 HWoB1173/JYVoqNE3I3OrwXZVoIkmsk6Kdg7NhXotKNTOO0ADDQb2Kr7GSpwEIcxeOkdK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.93,216,1654574400"; 
   d="scan'208";a="79938458"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/4] xen: Port linkage.h from kernel code
Date: Thu, 4 Aug 2022 16:04:22 +0100
Message-ID: <20220804150424.17584-3-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220804150424.17584-1-jane.malalane@citrix.com>
References: <20220804150424.17584-1-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
---
 xen/include/xen/linkage.h | 260 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 260 insertions(+)
 create mode 100644 xen/include/xen/linkage.h

diff --git a/xen/include/xen/linkage.h b/xen/include/xen/linkage.h
new file mode 100644
index 0000000000..adc00c356b
--- /dev/null
+++ b/xen/include/xen/linkage.h
@@ -0,0 +1,260 @@
+#ifndef __XEN_LINKAGE_H
+#define __XEN_LINKAGE_H
+
+/*
+ * Imported from linux-5.19:include/linux/linkage.h
+ */
+
+/* Some toolchains use other characters (e.g. '`') to mark new line in macro */
+#ifndef ASM_NL
+#define ASM_NL		 ;
+#endif
+
+#ifdef __ASSEMBLY__
+
+/* SYM_T_FUNC -- type used by assembler to mark functions */
+#ifndef SYM_T_FUNC
+#define SYM_T_FUNC				STT_FUNC
+#endif
+
+/* SYM_T_OBJECT -- type used by assembler to mark data */
+#ifndef SYM_T_OBJECT
+#define SYM_T_OBJECT				STT_OBJECT
+#endif
+
+/* SYM_T_NONE -- type used by assembler to mark entries of unknown type */
+#ifndef SYM_T_NONE
+#define SYM_T_NONE				STT_NOTYPE
+#endif
+
+/* SYM_A_* -- align the symbol? */
+#define SYM_A_ALIGN				ALIGN
+#define SYM_A_NONE				/* nothing */
+
+/* SYM_L_* -- linkage of symbols */
+#define SYM_L_GLOBAL(name)			.globl name
+#define SYM_L_WEAK(name)			.weak name
+#define SYM_L_LOCAL(name)			/* nothing */
+
+/* === generic annotations === */
+
+/* SYM_ENTRY -- use only if you have to for non-paired symbols */
+#ifndef SYM_ENTRY
+#define SYM_ENTRY(name, linkage, align...)		\
+	linkage(name) ASM_NL				\
+	align ASM_NL					\
+	name:
+#endif
+
+/* SYM_START -- use only if you have to */
+#ifndef SYM_START
+#define SYM_START(name, linkage, align...)		\
+	SYM_ENTRY(name, linkage, align)
+#endif
+
+/* SYM_END -- use only if you have to */
+#ifndef SYM_END
+#define SYM_END(name, sym_type)				\
+	.type name sym_type ASM_NL			\
+	.set .L__sym_size_##name, .-name ASM_NL		\
+	.size name, .L__sym_size_##name
+#endif
+
+/* SYM_ALIAS -- use only if you have to */
+#ifndef SYM_ALIAS
+#define SYM_ALIAS(alias, name, linkage)			\
+	linkage(alias) ASM_NL				\
+	.set alias, name ASM_NL
+#endif
+
+/* === code annotations === */
+
+/*
+ * FUNC -- C-like functions (proper stack frame etc.)
+ * CODE -- non-C code (e.g. irq handlers with different, special stack etc.)
+ *
+ * Objtool validates stack for FUNC, but not for CODE.
+ * Objtool generates debug info for both FUNC & CODE, but needs special
+ * annotations for each CODE's start (to describe the actual stack frame).
+ *
+ * Objtool requires that all code must be contained in an ELF symbol. Symbol
+ * names that have a  .L prefix do not emit symbol table entries. .L
+ * prefixed symbols can be used within a code region, but should be avoided for
+ * denoting a range of code via ``SYM_*_START/END`` annotations.
+ *
+ * ALIAS -- does not generate debug info -- the aliased function will
+ */
+
+/* SYM_INNER_LABEL_ALIGN -- only for labels in the middle of code,
+ * w/ alignment
+ */
+#ifndef SYM_INNER_LABEL_ALIGN
+#define SYM_INNER_LABEL_ALIGN(name, linkage)	\
+	.type name SYM_T_NONE ASM_NL			\
+	SYM_ENTRY(name, linkage, SYM_A_ALIGN)
+#endif
+
+/* SYM_INNER_LABEL_LOCAL -- only for local labels in the middle of code */
+#ifndef SYM_INNER_LABEL_LOCAL
+#define SYM_INNER_LABEL_LOCAL(name)			\
+	.type name SYM_T_NONE ASM_NL			\
+	SYM_ENTRY(name, SYM_L_LOCAL, SYM_A_NONE)
+#endif
+
+/* SYM_INNER_LABEL_GLOBAL -- only for global labels in the middle of code */
+#ifndef SYM_INNER_LABEL_GLOBAL
+#define SYM_INNER_LABEL_GLOBAL(name)				    \
+            .type name SYM_T_NONE ASM_NL                    \
+	    SYM_ENTRY(name, SYM_L_GLOBAL, SYM_A_NONE)
+#endif
+
+/* SYM_FUNC_START -- use for global functions */
+#ifndef SYM_FUNC_START
+#define SYM_FUNC_START(name)				\
+	SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)
+#endif
+
+/* SYM_FUNC_START_NOALIGN -- use for global functions, w/o alignment */
+#ifndef SYM_FUNC_START_NOALIGN
+#define SYM_FUNC_START_NOALIGN(name)			\
+	SYM_START(name, SYM_L_GLOBAL, SYM_A_NONE)
+#endif
+
+/* SYM_FUNC_START_LOCAL -- use for local functions */
+#ifndef SYM_FUNC_START_LOCAL
+#define SYM_FUNC_START_LOCAL(name)			\
+	SYM_START(name, SYM_L_LOCAL, SYM_A_ALIGN)
+#endif
+
+/* SYM_FUNC_START_LOCAL_NOALIGN -- use for local functions, w/o alignment */
+#ifndef SYM_FUNC_START_LOCAL_NOALIGN
+#define SYM_FUNC_START_LOCAL_NOALIGN(name)		\
+	SYM_START(name, SYM_L_LOCAL, SYM_A_NONE)
+#endif
+
+/* SYM_FUNC_START_WEAK -- use for weak functions */
+#ifndef SYM_FUNC_START_WEAK
+#define SYM_FUNC_START_WEAK(name)			\
+	SYM_START(name, SYM_L_WEAK, SYM_A_ALIGN)
+#endif
+
+/* SYM_FUNC_START_WEAK_NOALIGN -- use for weak functions, w/o alignment */
+#ifndef SYM_FUNC_START_WEAK_NOALIGN
+#define SYM_FUNC_START_WEAK_NOALIGN(name)		\
+	SYM_START(name, SYM_L_WEAK, SYM_A_NONE)
+#endif
+
+/*
+ * SYM_FUNC_END -- the end of SYM_FUNC_START_LOCAL, SYM_FUNC_START,
+ * SYM_FUNC_START_WEAK, ...
+ */
+#ifndef SYM_FUNC_END
+#define SYM_FUNC_END(name)				\
+	SYM_END(name, SYM_T_FUNC)
+#endif
+
+/*
+ * SYM_FUNC_ALIAS -- define a global alias for an existing function
+ */
+#ifndef SYM_FUNC_ALIAS
+#define SYM_FUNC_ALIAS(alias, name)					\
+	SYM_ALIAS(alias, name, SYM_L_GLOBAL)
+#endif
+
+/*
+ * SYM_FUNC_ALIAS_LOCAL -- define a local alias for an existing function
+ */
+#ifndef SYM_FUNC_ALIAS_LOCAL
+#define SYM_FUNC_ALIAS_LOCAL(alias, name)				\
+	SYM_ALIAS(alias, name, SYM_L_LOCAL)
+#endif
+
+/*
+ * SYM_FUNC_ALIAS_WEAK -- define a weak global alias for an existing function
+ */
+#ifndef SYM_FUNC_ALIAS_WEAK
+#define SYM_FUNC_ALIAS_WEAK(alias, name)				\
+	SYM_ALIAS(alias, name, SYM_L_WEAK)
+#endif
+
+/* SYM_CODE_START -- use for non-C (special) functions */
+#ifndef SYM_CODE_START
+#define SYM_CODE_START(name)				\
+	SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)
+#endif
+
+/* SYM_CODE_START_NOALIGN -- use for non-C (special) functions, w/o alignment */
+#ifndef SYM_CODE_START_NOALIGN
+#define SYM_CODE_START_NOALIGN(name)			\
+	SYM_START(name, SYM_L_GLOBAL, SYM_A_NONE)
+#endif
+
+/* SYM_CODE_START_LOCAL -- use for local non-C (special) functions */
+#ifndef SYM_CODE_START_LOCAL
+#define SYM_CODE_START_LOCAL(name)			\
+	SYM_START(name, SYM_L_LOCAL, SYM_A_ALIGN)
+#endif
+
+/*
+ * SYM_CODE_START_LOCAL_NOALIGN -- use for local non-C (special) functions,
+ * w/o alignment
+ */
+#ifndef SYM_CODE_START_LOCAL_NOALIGN
+#define SYM_CODE_START_LOCAL_NOALIGN(name)		\
+	SYM_START(name, SYM_L_LOCAL, SYM_A_NONE)
+#endif
+
+/* SYM_CODE_END -- the end of SYM_CODE_START_LOCAL, SYM_CODE_START, ... */
+#ifndef SYM_CODE_END
+#define SYM_CODE_END(name)				\
+	SYM_END(name, SYM_T_NONE)
+#endif
+
+/* === data annotations === */
+
+/* SYM_DATA_START -- global data symbol */
+#ifndef SYM_DATA_START
+#define SYM_DATA_START(name)				\
+	SYM_START(name, SYM_L_GLOBAL, SYM_A_NONE)
+#endif
+
+/* SYM_DATA_START -- local data symbol */
+#ifndef SYM_DATA_START_LOCAL
+#define SYM_DATA_START_LOCAL(name)			\
+	SYM_START(name, SYM_L_LOCAL, SYM_A_NONE)
+#endif
+
+/* SYM_DATA_END -- the end of SYM_DATA_START symbol */
+#ifndef SYM_DATA_END
+#define SYM_DATA_END(name)				\
+	SYM_END(name, SYM_T_OBJECT)
+#endif
+
+/* SYM_DATA_END_LABEL -- the labeled end of SYM_DATA_START symbol */
+#ifndef SYM_DATA_END_LABEL
+#define SYM_DATA_END_LABEL(name, linkage, label)	\
+	linkage(label) ASM_NL				\
+	.type label SYM_T_OBJECT ASM_NL			\
+	label:						\
+	SYM_END(name, SYM_T_OBJECT)
+#endif
+
+/* SYM_DATA -- start+end wrapper around simple global data */
+#ifndef SYM_DATA
+#define SYM_DATA(name, data...)				\
+	SYM_DATA_START(name) ASM_NL				\
+	data ASM_NL						\
+	SYM_DATA_END(name)
+#endif
+
+/* SYM_DATA_LOCAL -- start+end wrapper around simple local data */
+#ifndef SYM_DATA_LOCAL
+#define SYM_DATA_LOCAL(name, data...)			\
+	SYM_DATA_START_LOCAL(name) ASM_NL			\
+	data ASM_NL						\
+	SYM_DATA_END(name)
+#endif
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __XEN_LINKAGE_H */
-- 
2.11.0


