Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 584F62E1855
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 06:20:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58161.102113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krwYT-0002SO-Kd; Wed, 23 Dec 2020 05:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58161.102113; Wed, 23 Dec 2020 05:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krwYT-0002Rt-H0; Wed, 23 Dec 2020 05:19:21 +0000
Received: by outflank-mailman (input) for mailman id 58161;
 Wed, 23 Dec 2020 05:19:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xcbs=F3=redhat.com=jpoimboe@srs-us1.protection.inumbo.net>)
 id 1krwYR-0002OV-QG
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 05:19:19 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a63ff240-9344-47ab-9544-97ce84c407e7;
 Wed, 23 Dec 2020 05:19:13 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-w1lCaopBMcyPQaggoedKzQ-1; Wed, 23 Dec 2020 00:19:08 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ACE1107ACE6;
 Wed, 23 Dec 2020 05:19:07 +0000 (UTC)
Received: from treble.redhat.com (ovpn-117-91.rdu2.redhat.com [10.10.117.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D78BE19D9C;
 Wed, 23 Dec 2020 05:19:06 +0000 (UTC)
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
X-Inumbo-ID: a63ff240-9344-47ab-9544-97ce84c407e7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608700753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZbJws1RViL+dhYV0RosYWexYv0hwpQMwpjgoJDxnT9E=;
	b=bO4bNhGKNBaWjXiRLOer2cLy8eIm9nXSHjzd8vnNpfko7cM5goSxBDsGSrXWW2tkGnz/bY
	DMmvjFFcfPvuv+UKEJbCaONeLx0s+4pSF+Sm3B4JS8BCJehHo3OIg58tuHj+7FzDtdwtYM
	QG4dVy9kFcEoAGyycHcneYgw5/XwPJs=
X-MC-Unique: w1lCaopBMcyPQaggoedKzQ-1
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Miroslav Benes <mbenes@suse.cz>
Subject: [PATCH 1/3] objtool: Refactor ORC section generation
Date: Tue, 22 Dec 2020 23:18:08 -0600
Message-Id: <46e2a28520d2d9ddd2a525ecc53a97af1946022f.1608700338.git.jpoimboe@redhat.com>
In-Reply-To: <cover.1608700338.git.jpoimboe@redhat.com>
References: <cover.1608700338.git.jpoimboe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23

Decouple ORC entries from instructions.  This simplifies the
control/data flow, and is going to make it easier to support alternative
instructions which change the stack layout.

Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
---
 tools/objtool/Makefile      |   4 -
 tools/objtool/arch.h        |   4 -
 tools/objtool/builtin-orc.c |   6 +-
 tools/objtool/check.h       |   3 -
 tools/objtool/objtool.h     |   3 +-
 tools/objtool/orc_gen.c     | 272 ++++++++++++++++++------------------
 tools/objtool/weak.c        |   7 +-
 7 files changed, 140 insertions(+), 159 deletions(-)

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 5cdb19036d7f..a43096f713c7 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -46,10 +46,6 @@ ifeq ($(SRCARCH),x86)
 	SUBCMD_ORC := y
 endif
 
-ifeq ($(SUBCMD_ORC),y)
-	CFLAGS += -DINSN_USE_ORC
-endif
-
 export SUBCMD_CHECK SUBCMD_ORC
 export srctree OUTPUT CFLAGS SRCARCH AWK
 include $(srctree)/tools/build/Makefile.include
diff --git a/tools/objtool/arch.h b/tools/objtool/arch.h
index 4a84c3081b8e..5e3f3ea8bb89 100644
--- a/tools/objtool/arch.h
+++ b/tools/objtool/arch.h
@@ -11,10 +11,6 @@
 #include "objtool.h"
 #include "cfi.h"
 
-#ifdef INSN_USE_ORC
-#include <asm/orc_types.h>
-#endif
-
 enum insn_type {
 	INSN_JUMP_CONDITIONAL,
 	INSN_JUMP_UNCONDITIONAL,
diff --git a/tools/objtool/builtin-orc.c b/tools/objtool/builtin-orc.c
index 7b31121fa60b..508bdf6ae8dc 100644
--- a/tools/objtool/builtin-orc.c
+++ b/tools/objtool/builtin-orc.c
@@ -51,11 +51,7 @@ int cmd_orc(int argc, const char **argv)
 		if (list_empty(&file->insn_list))
 			return 0;
 
-		ret = create_orc(file);
-		if (ret)
-			return ret;
-
-		ret = create_orc_sections(file);
+		ret = orc_create(file);
 		if (ret)
 			return ret;
 
diff --git a/tools/objtool/check.h b/tools/objtool/check.h
index 5ec00a4b891b..4c10916ff1cf 100644
--- a/tools/objtool/check.h
+++ b/tools/objtool/check.h
@@ -43,9 +43,6 @@ struct instruction {
 	struct symbol *func;
 	struct list_head stack_ops;
 	struct cfi_state cfi;
-#ifdef INSN_USE_ORC
-	struct orc_entry orc;
-#endif
 };
 
 static inline bool is_static_jump(struct instruction *insn)
diff --git a/tools/objtool/objtool.h b/tools/objtool/objtool.h
index 4125d4578b23..5e58d3537e2f 100644
--- a/tools/objtool/objtool.h
+++ b/tools/objtool/objtool.h
@@ -26,7 +26,6 @@ struct objtool_file *objtool_open_read(const char *_objname);
 
 int check(struct objtool_file *file);
 int orc_dump(const char *objname);
-int create_orc(struct objtool_file *file);
-int create_orc_sections(struct objtool_file *file);
+int orc_create(struct objtool_file *file);
 
 #endif /* _OBJTOOL_H */
diff --git a/tools/objtool/orc_gen.c b/tools/objtool/orc_gen.c
index 235663b96adc..73efba2bfa72 100644
--- a/tools/objtool/orc_gen.c
+++ b/tools/objtool/orc_gen.c
@@ -12,89 +12,84 @@
 #include "check.h"
 #include "warn.h"
 
-int create_orc(struct objtool_file *file)
+static int init_orc_entry(struct orc_entry *orc, struct cfi_state *cfi)
 {
-	struct instruction *insn;
+	struct instruction *insn = container_of(cfi, struct instruction, cfi);
+	struct cfi_reg *bp = &cfi->regs[CFI_BP];
 
-	for_each_insn(file, insn) {
-		struct orc_entry *orc = &insn->orc;
-		struct cfi_reg *cfa = &insn->cfi.cfa;
-		struct cfi_reg *bp = &insn->cfi.regs[CFI_BP];
+	memset(orc, 0, sizeof(*orc));
 
-		if (!insn->sec->text)
-			continue;
-
-		orc->end = insn->cfi.end;
+	orc->end = cfi->end;
 
-		if (cfa->base == CFI_UNDEFINED) {
-			orc->sp_reg = ORC_REG_UNDEFINED;
-			continue;
-		}
-
-		switch (cfa->base) {
-		case CFI_SP:
-			orc->sp_reg = ORC_REG_SP;
-			break;
-		case CFI_SP_INDIRECT:
-			orc->sp_reg = ORC_REG_SP_INDIRECT;
-			break;
-		case CFI_BP:
-			orc->sp_reg = ORC_REG_BP;
-			break;
-		case CFI_BP_INDIRECT:
-			orc->sp_reg = ORC_REG_BP_INDIRECT;
-			break;
-		case CFI_R10:
-			orc->sp_reg = ORC_REG_R10;
-			break;
-		case CFI_R13:
-			orc->sp_reg = ORC_REG_R13;
-			break;
-		case CFI_DI:
-			orc->sp_reg = ORC_REG_DI;
-			break;
-		case CFI_DX:
-			orc->sp_reg = ORC_REG_DX;
-			break;
-		default:
-			WARN_FUNC("unknown CFA base reg %d",
-				  insn->sec, insn->offset, cfa->base);
-			return -1;
-		}
+	if (cfi->cfa.base == CFI_UNDEFINED) {
+		orc->sp_reg = ORC_REG_UNDEFINED;
+		return 0;
+	}
 
-		switch(bp->base) {
-		case CFI_UNDEFINED:
-			orc->bp_reg = ORC_REG_UNDEFINED;
-			break;
-		case CFI_CFA:
-			orc->bp_reg = ORC_REG_PREV_SP;
-			break;
-		case CFI_BP:
-			orc->bp_reg = ORC_REG_BP;
-			break;
-		default:
-			WARN_FUNC("unknown BP base reg %d",
-				  insn->sec, insn->offset, bp->base);
-			return -1;
-		}
+	switch (cfi->cfa.base) {
+	case CFI_SP:
+		orc->sp_reg = ORC_REG_SP;
+		break;
+	case CFI_SP_INDIRECT:
+		orc->sp_reg = ORC_REG_SP_INDIRECT;
+		break;
+	case CFI_BP:
+		orc->sp_reg = ORC_REG_BP;
+		break;
+	case CFI_BP_INDIRECT:
+		orc->sp_reg = ORC_REG_BP_INDIRECT;
+		break;
+	case CFI_R10:
+		orc->sp_reg = ORC_REG_R10;
+		break;
+	case CFI_R13:
+		orc->sp_reg = ORC_REG_R13;
+		break;
+	case CFI_DI:
+		orc->sp_reg = ORC_REG_DI;
+		break;
+	case CFI_DX:
+		orc->sp_reg = ORC_REG_DX;
+		break;
+	default:
+		WARN_FUNC("unknown CFA base reg %d",
+			  insn->sec, insn->offset, cfi->cfa.base);
+		return -1;
+	}
 
-		orc->sp_offset = cfa->offset;
-		orc->bp_offset = bp->offset;
-		orc->type = insn->cfi.type;
+	switch (bp->base) {
+	case CFI_UNDEFINED:
+		orc->bp_reg = ORC_REG_UNDEFINED;
+		break;
+	case CFI_CFA:
+		orc->bp_reg = ORC_REG_PREV_SP;
+		break;
+	case CFI_BP:
+		orc->bp_reg = ORC_REG_BP;
+		break;
+	default:
+		WARN_FUNC("unknown BP base reg %d",
+			  insn->sec, insn->offset, bp->base);
+		return -1;
 	}
 
+	orc->sp_offset = cfi->cfa.offset;
+	orc->bp_offset = bp->offset;
+	orc->type = cfi->type;
+
 	return 0;
 }
 
-static int create_orc_entry(struct elf *elf, struct section *u_sec, struct section *ip_relocsec,
-				unsigned int idx, struct section *insn_sec,
-				unsigned long insn_off, struct orc_entry *o)
+static int write_orc_entry(struct elf *elf, struct section *orc_sec,
+			   struct section *ip_rsec, unsigned int idx,
+			   struct section *insn_sec, unsigned long insn_off,
+			   struct orc_entry *o)
 {
 	struct orc_entry *orc;
 	struct reloc *reloc;
 
 	/* populate ORC data */
-	orc = (struct orc_entry *)u_sec->data->d_buf + idx;
+	orc = (struct orc_entry *)orc_sec->data->d_buf + idx;
 	memcpy(orc, o, sizeof(*orc));
 
 	/* populate reloc for ip */
@@ -133,102 +128,109 @@ static int create_orc_entry(struct elf *elf, struct section *u_sec, struct secti
 
 	reloc->type = R_X86_64_PC32;
 	reloc->offset = idx * sizeof(int);
-	reloc->sec = ip_relocsec;
+	reloc->sec = ip_rsec;
 
 	elf_add_reloc(elf, reloc);
 
 	return 0;
 }
 
-int create_orc_sections(struct objtool_file *file)
+struct orc_list_entry {
+	struct list_head list;
+	struct orc_entry orc;
+	struct section *insn_sec;
+	unsigned long insn_off;
+};
+
+static int orc_list_add(struct list_head *orc_list, struct orc_entry *orc,
+			struct section *sec, unsigned long offset)
+{
+	struct orc_list_entry *entry = malloc(sizeof(*entry));
+
+	if (!entry) {
+		WARN("malloc failed");
+		return -1;
+	}
+
+	entry->orc	= *orc;
+	entry->insn_sec = sec;
+	entry->insn_off = offset;
+
+	list_add_tail(&entry->list, orc_list);
+	return 0;
+}
+
+int orc_create(struct objtool_file *file)
 {
-	struct instruction *insn, *prev_insn;
-	struct section *sec, *u_sec, *ip_relocsec;
-	unsigned int idx;
+	struct section *sec, *ip_rsec, *orc_sec;
+	unsigned int nr = 0, idx = 0;
+	struct orc_list_entry *entry;
+	struct list_head orc_list;
 
-	struct orc_entry empty = {
-		.sp_reg = ORC_REG_UNDEFINED,
+	struct orc_entry null = {
+		.sp_reg  = ORC_REG_UNDEFINED,
 		.bp_reg  = ORC_REG_UNDEFINED,
 		.type    = UNWIND_HINT_TYPE_CALL,
 	};
 
-	sec = find_section_by_name(file->elf, ".orc_unwind");
-	if (sec) {
-		WARN("file already has .orc_unwind section, skipping");
-		return -1;
-	}
-
-	/* count the number of needed orcs */
-	idx = 0;
+	/* Build a deduplicated list of ORC entries: */
+	INIT_LIST_HEAD(&orc_list);
 	for_each_sec(file, sec) {
+		struct orc_entry orc, prev_orc = {0};
+		struct instruction *insn;
+		bool empty = true;
+
 		if (!sec->text)
 			continue;
 
-		prev_insn = NULL;
 		sec_for_each_insn(file, sec, insn) {
-			if (!prev_insn ||
-			    memcmp(&insn->orc, &prev_insn->orc,
-				   sizeof(struct orc_entry))) {
-				idx++;
-			}
-			prev_insn = insn;
+			if (init_orc_entry(&orc, &insn->cfi))
+				return -1;
+			if (!memcmp(&prev_orc, &orc, sizeof(orc)))
+				continue;
+			if (orc_list_add(&orc_list, &orc, sec, insn->offset))
+				return -1;
+			nr++;
+			prev_orc = orc;
+			empty = false;
 		}
 
-		/* section terminator */
-		if (prev_insn)
-			idx++;
+		/* Add a section terminator */
+		if (!empty) {
+			orc_list_add(&orc_list, &null, sec, sec->len);
+			nr++;
+		}
 	}
-	if (!idx)
-		return -1;
+	if (!nr)
+		return 0;
 
+	/* Create .orc_unwind, .orc_unwind_ip and .rela.orc_unwind_ip sections: */
+	sec = find_section_by_name(file->elf, ".orc_unwind");
+	if (sec) {
+		WARN("file already has .orc_unwind section, skipping");
+		return -1;
+	}
+	orc_sec = elf_create_section(file->elf, ".orc_unwind", 0,
+				     sizeof(struct orc_entry), nr);
+	if (!orc_sec)
+		return -1;
 
-	/* create .orc_unwind_ip and .rela.orc_unwind_ip sections */
-	sec = elf_create_section(file->elf, ".orc_unwind_ip", 0, sizeof(int), idx);
+	sec = elf_create_section(file->elf, ".orc_unwind_ip", 0, sizeof(int), nr);
 	if (!sec)
 		return -1;
-
-	ip_relocsec = elf_create_reloc_section(file->elf, sec, SHT_RELA);
-	if (!ip_relocsec)
+	ip_rsec = elf_create_reloc_section(file->elf, sec, SHT_RELA);
+	if (!ip_rsec)
 		return -1;
 
-	/* create .orc_unwind section */
-	u_sec = elf_create_section(file->elf, ".orc_unwind", 0,
-				   sizeof(struct orc_entry), idx);
-
-	/* populate sections */
-	idx = 0;
-	for_each_sec(file, sec) {
-		if (!sec->text)
-			continue;
-
-		prev_insn = NULL;
-		sec_for_each_insn(file, sec, insn) {
-			if (!prev_insn || memcmp(&insn->orc, &prev_insn->orc,
-						 sizeof(struct orc_entry))) {
-
-				if (create_orc_entry(file->elf, u_sec, ip_relocsec, idx,
-						     insn->sec, insn->offset,
-						     &insn->orc))
-					return -1;
-
-				idx++;
-			}
-			prev_insn = insn;
-		}
-
-		/* section terminator */
-		if (prev_insn) {
-			if (create_orc_entry(file->elf, u_sec, ip_relocsec, idx,
-					     prev_insn->sec,
-					     prev_insn->offset + prev_insn->len,
-					     &empty))
-				return -1;
-
-			idx++;
-		}
+	/* Write ORC entries to sections: */
+	list_for_each_entry(entry, &orc_list, list) {
+		if (write_orc_entry(file->elf, orc_sec, ip_rsec, idx++,
+				    entry->insn_sec, entry->insn_off,
+				    &entry->orc))
+			return -1;
 	}
 
-	if (elf_rebuild_reloc_section(file->elf, ip_relocsec))
+	if (elf_rebuild_reloc_section(file->elf, ip_rsec))
 		return -1;
 
 	return 0;
diff --git a/tools/objtool/weak.c b/tools/objtool/weak.c
index 7843e9a7a72f..553ec9ce51ba 100644
--- a/tools/objtool/weak.c
+++ b/tools/objtool/weak.c
@@ -25,12 +25,7 @@ int __weak orc_dump(const char *_objname)
 	UNSUPPORTED("orc");
 }
 
-int __weak create_orc(struct objtool_file *file)
-{
-	UNSUPPORTED("orc");
-}
-
-int __weak create_orc_sections(struct objtool_file *file)
+int __weak orc_create(struct objtool_file *file)
 {
 	UNSUPPORTED("orc");
 }
-- 
2.29.2


