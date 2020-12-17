Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 458952DCE65
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 10:32:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55801.97359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kppeA-0007bp-1w; Thu, 17 Dec 2020 09:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55801.97359; Thu, 17 Dec 2020 09:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kppe9-0007au-SH; Thu, 17 Dec 2020 09:32:29 +0000
Received: by outflank-mailman (input) for mailman id 55801;
 Thu, 17 Dec 2020 09:32:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gjir=FV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kppe8-0006RQ-Uv
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 09:32:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64467509-9ba3-4397-a690-daff3eb10b49;
 Thu, 17 Dec 2020 09:31:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8CE63B720;
 Thu, 17 Dec 2020 09:31:49 +0000 (UTC)
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
X-Inumbo-ID: 64467509-9ba3-4397-a690-daff3eb10b49
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608197509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yGVPjX9+LeHHbOMZCGVkaq8fLleyCYczOXjLlFm6RmQ=;
	b=Rt+6Mw4VMJLhHHbz6Zscgaw/jkKFJ3XCDRpw+jF+o49rsRqsrKg3cAV77v5CqZh4tnko9O
	IMm4MYV3g2Jt9qGnBnDfrw7kTwHQaBo2IO6/8ZfCn1ccCvULWQ0PJKcUAj6tTWqmh0wtEv
	2TxHeauUuKRnzXPc1Ik3Aecd474R22k=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 12/15] objtool: Alternatives vs ORC, the hard way
Date: Thu, 17 Dec 2020 10:31:30 +0100
Message-Id: <20201217093133.1507-13-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201217093133.1507-1-jgross@suse.com>
References: <20201217093133.1507-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Zijlstra <peterz@infradead.org>

Alternatives pose an interesting problem for unwinders because from
the unwinders PoV we're just executing instructions, it has no idea
the text is modified, nor any way of retrieving what with.

Therefore the stance has been that alternatives must not change stack
state, as encoded by commit: 7117f16bf460 ("objtool: Fix ORC vs
alternatives"). This obviously guarantees that whatever actual
instructions end up in the text, the unwind information is correct.

However, there is one additional source of text patching that isn't
currently visible to objtool: paravirt immediate patching. And it
turns out one of these violates the rule.

As part of cleaning that up, the unfortunate reality is that objtool
now has to deal with alternatives modifying unwind state and validate
the combination is valid and generate ORC data to match.

The problem is that a single instance of unwind information (ORC) must
capture and correctly unwind all alternatives. Since the trivially
correct mandate is out, implement the straight forward brute-force
approach:

 1) generate CFI information for each alternative

 2) unwind every alternative with the merge-sort of the previously
    generated CFI information -- O(n^2)

 3) for any possible conflict: yell.

 4) Generate ORC with merge-sort

Specifically for 3 there are two possible classes of conflicts:

 - the merge-sort itself could find conflicting CFI for the same
   offset.

 - the unwind can fail with the merged CFI.

In specific, this allows us to deal with:

        Alt1                    Alt2                    Alt3

 0x00   CALL *pv_ops.save_fl    CALL xen_save_fl        PUSHF
 0x01                                                   POP %RAX
 0x02                                                   NOP
 ...
 0x05                           NOP
 ...
 0x07   <insn>

The unwind information for offset-0x00 is identical for all 3
alternatives. Similarly offset-0x05 and higher also are identical (and
the same as 0x00). However offset-0x01 has deviating CFI, but that is
only relevant for Alt3, neither of the other alternative instruction
streams will ever hit that offset.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
V3:
- new patch; there is still an ongoing discussion whether this patch
  couldn't be made simpler, but I'm including it here nevertheless, as
  there is some solution required in objtool for the following patches
  of the series.
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/objtool/check.c   | 180 ++++++++++++++++++++++++++++++++++++----
 tools/objtool/check.h   |   5 ++
 tools/objtool/orc_gen.c | 178 +++++++++++++++++++++++++--------------
 3 files changed, 289 insertions(+), 74 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index c6ab44543c92..2d70766af857 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1090,6 +1090,32 @@ static int handle_group_alt(struct objtool_file *file,
 		return -1;
 	}
 
+	/*
+	 * Add the filler NOP, required for alternative CFI.
+	 */
+	if (special_alt->group && special_alt->new_len < special_alt->orig_len) {
+		struct instruction *nop = malloc(sizeof(*nop));
+		if (!nop) {
+			WARN("malloc failed");
+			return -1;
+		}
+		memset(nop, 0, sizeof(*nop));
+		INIT_LIST_HEAD(&nop->alts);
+		INIT_LIST_HEAD(&nop->stack_ops);
+		init_cfi_state(&nop->cfi);
+
+		nop->sec = last_new_insn->sec;
+		nop->ignore = last_new_insn->ignore;
+		nop->func = last_new_insn->func;
+		nop->alt_group = alt_group;
+		nop->offset = last_new_insn->offset + last_new_insn->len;
+		nop->type = INSN_NOP;
+		nop->len = special_alt->orig_len - special_alt->new_len;
+
+		list_add(&nop->list, &last_new_insn->list);
+		last_new_insn = nop;
+	}
+
 	if (fake_jump)
 		list_add(&fake_jump->list, &last_new_insn->list);
 
@@ -2190,18 +2216,12 @@ static int handle_insn_ops(struct instruction *insn, struct insn_state *state)
 	struct stack_op *op;
 
 	list_for_each_entry(op, &insn->stack_ops, list) {
-		struct cfi_state old_cfi = state->cfi;
 		int res;
 
 		res = update_cfi_state(insn, &state->cfi, op);
 		if (res)
 			return res;
 
-		if (insn->alt_group && memcmp(&state->cfi, &old_cfi, sizeof(struct cfi_state))) {
-			WARN_FUNC("alternative modifies stack", insn->sec, insn->offset);
-			return -1;
-		}
-
 		if (op->dest.type == OP_DEST_PUSHF) {
 			if (!state->uaccess_stack) {
 				state->uaccess_stack = 1;
@@ -2399,19 +2419,137 @@ static int validate_return(struct symbol *func, struct instruction *insn, struct
  * unreported (because they're NOPs), such holes would result in CFI_UNDEFINED
  * states which then results in ORC entries, which we just said we didn't want.
  *
- * Avoid them by copying the CFI entry of the first instruction into the whole
- * alternative.
+ * Avoid them by copying the CFI entry of the first instruction into the hole.
  */
-static void fill_alternative_cfi(struct objtool_file *file, struct instruction *insn)
+static void __fill_alt_cfi(struct objtool_file *file, struct instruction *insn)
 {
 	struct instruction *first_insn = insn;
 	int alt_group = insn->alt_group;
 
-	sec_for_each_insn_continue(file, insn) {
+	sec_for_each_insn_from(file, insn) {
 		if (insn->alt_group != alt_group)
 			break;
-		insn->cfi = first_insn->cfi;
+
+		if (!insn->visited)
+			insn->cfi = first_insn->cfi;
+	}
+}
+
+static void fill_alt_cfi(struct objtool_file *file, struct instruction *alt_insn)
+{
+	struct alternative *alt;
+
+	__fill_alt_cfi(file, alt_insn);
+
+	list_for_each_entry(alt, &alt_insn->alts, list)
+		__fill_alt_cfi(file, alt->insn);
+}
+
+static struct instruction *
+__find_unwind(struct objtool_file *file,
+	      struct instruction *insn, unsigned long offset)
+{
+	int alt_group = insn->alt_group;
+	struct instruction *next;
+	unsigned long off = 0;
+
+	while ((off + insn->len) <= offset) {
+		next = next_insn_same_sec(file, insn);
+		if (next && next->alt_group != alt_group)
+			next = NULL;
+
+		if (!next)
+			break;
+
+		off += insn->len;
+		insn = next;
 	}
+
+	return insn;
+}
+
+struct instruction *
+find_alt_unwind(struct objtool_file *file,
+		struct instruction *alt_insn, unsigned long offset)
+{
+	struct instruction *fit;
+	struct alternative *alt;
+	unsigned long fit_off;
+
+	fit = __find_unwind(file, alt_insn, offset);
+	fit_off = (fit->offset - alt_insn->offset);
+
+	list_for_each_entry(alt, &alt_insn->alts, list) {
+		struct instruction *x;
+		unsigned long x_off;
+
+		x = __find_unwind(file, alt->insn, offset);
+		x_off = (x->offset - alt->insn->offset);
+
+		if (fit_off < x_off) {
+			fit = x;
+			fit_off = x_off;
+
+		} else if (fit_off == x_off &&
+			   memcmp(&fit->cfi, &x->cfi, sizeof(struct cfi_state))) {
+
+			char *_str1 = offstr(fit->sec, fit->offset);
+			char *_str2 = offstr(x->sec, x->offset);
+			WARN("%s: equal-offset incompatible alternative: %s\n", _str1, _str2);
+			free(_str1);
+			free(_str2);
+			return fit;
+		}
+	}
+
+	return fit;
+}
+
+static int __validate_unwind(struct objtool_file *file,
+			     struct instruction *alt_insn,
+			     struct instruction *insn)
+{
+	int alt_group = insn->alt_group;
+	struct instruction *unwind;
+	unsigned long offset = 0;
+
+	sec_for_each_insn_from(file, insn) {
+		if (insn->alt_group != alt_group)
+			break;
+
+		unwind = find_alt_unwind(file, alt_insn, offset);
+
+		if (memcmp(&insn->cfi, &unwind->cfi, sizeof(struct cfi_state))) {
+
+			char *_str1 = offstr(insn->sec, insn->offset);
+			char *_str2 = offstr(unwind->sec, unwind->offset);
+			WARN("%s: unwind incompatible alternative: %s (%ld)\n",
+			     _str1, _str2, offset);
+			free(_str1);
+			free(_str2);
+			return 1;
+		}
+
+		offset += insn->len;
+	}
+
+	return 0;
+}
+
+static int validate_alt_unwind(struct objtool_file *file,
+			       struct instruction *alt_insn)
+{
+	struct alternative *alt;
+
+	if (__validate_unwind(file, alt_insn, alt_insn))
+		return 1;
+
+	list_for_each_entry(alt, &alt_insn->alts, list) {
+		if (__validate_unwind(file, alt_insn, alt->insn))
+			return 1;
+	}
+
+	return 0;
 }
 
 /*
@@ -2423,9 +2561,10 @@ static void fill_alternative_cfi(struct objtool_file *file, struct instruction *
 static int validate_branch(struct objtool_file *file, struct symbol *func,
 			   struct instruction *insn, struct insn_state state)
 {
+	struct instruction *next_insn, *alt_insn = NULL;
 	struct alternative *alt;
-	struct instruction *next_insn;
 	struct section *sec;
+	int alt_group = 0;
 	u8 visited;
 	int ret;
 
@@ -2480,8 +2619,10 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 				}
 			}
 
-			if (insn->alt_group)
-				fill_alternative_cfi(file, insn);
+			if (insn->alt_group) {
+				alt_insn = insn;
+				alt_group = insn->alt_group;
+			}
 
 			if (skip_orig)
 				return 0;
@@ -2613,6 +2754,17 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 		}
 
 		insn = next_insn;
+
+		if (alt_insn && insn->alt_group != alt_group) {
+			alt_insn->alt_end = insn;
+
+			fill_alt_cfi(file, alt_insn);
+
+			if (validate_alt_unwind(file, alt_insn))
+				return 1;
+
+			alt_insn = NULL;
+		}
 	}
 
 	return 0;
diff --git a/tools/objtool/check.h b/tools/objtool/check.h
index 5ec00a4b891b..b3215aa4bcdd 100644
--- a/tools/objtool/check.h
+++ b/tools/objtool/check.h
@@ -40,6 +40,7 @@ struct instruction {
 	struct instruction *first_jump_src;
 	struct reloc *jump_table;
 	struct list_head alts;
+	struct instruction *alt_end;
 	struct symbol *func;
 	struct list_head stack_ops;
 	struct cfi_state cfi;
@@ -54,6 +55,10 @@ static inline bool is_static_jump(struct instruction *insn)
 	       insn->type == INSN_JUMP_UNCONDITIONAL;
 }
 
+struct instruction *
+find_alt_unwind(struct objtool_file *file,
+		struct instruction *alt_insn, unsigned long offset);
+
 struct instruction *find_insn(struct objtool_file *file,
 			      struct section *sec, unsigned long offset);
 
diff --git a/tools/objtool/orc_gen.c b/tools/objtool/orc_gen.c
index 235663b96adc..75afbaffae23 100644
--- a/tools/objtool/orc_gen.c
+++ b/tools/objtool/orc_gen.c
@@ -12,75 +12,86 @@
 #include "check.h"
 #include "warn.h"
 
+static int create_orc_insn(struct objtool_file *file, struct instruction *insn)
+{
+	struct orc_entry *orc = &insn->orc;
+	struct cfi_reg *cfa = &insn->cfi.cfa;
+	struct cfi_reg *bp = &insn->cfi.regs[CFI_BP];
+
+	orc->end = insn->cfi.end;
+
+	if (cfa->base == CFI_UNDEFINED) {
+		orc->sp_reg = ORC_REG_UNDEFINED;
+		return 0;
+	}
+
+	switch (cfa->base) {
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
+			  insn->sec, insn->offset, cfa->base);
+		return -1;
+	}
+
+	switch(bp->base) {
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
+	}
+
+	orc->sp_offset = cfa->offset;
+	orc->bp_offset = bp->offset;
+	orc->type = insn->cfi.type;
+
+	return 0;
+}
+
 int create_orc(struct objtool_file *file)
 {
 	struct instruction *insn;
 
 	for_each_insn(file, insn) {
-		struct orc_entry *orc = &insn->orc;
-		struct cfi_reg *cfa = &insn->cfi.cfa;
-		struct cfi_reg *bp = &insn->cfi.regs[CFI_BP];
+		int ret;
 
 		if (!insn->sec->text)
 			continue;
 
-		orc->end = insn->cfi.end;
-
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
-
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
-
-		orc->sp_offset = cfa->offset;
-		orc->bp_offset = bp->offset;
-		orc->type = insn->cfi.type;
+		ret = create_orc_insn(file, insn);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
@@ -166,6 +177,28 @@ int create_orc_sections(struct objtool_file *file)
 
 		prev_insn = NULL;
 		sec_for_each_insn(file, sec, insn) {
+
+			if (insn->alt_end) {
+				unsigned int offset, alt_len;
+				struct instruction *unwind;
+
+				alt_len = insn->alt_end->offset - insn->offset;
+				for (offset = 0; offset < alt_len; offset++) {
+					unwind = find_alt_unwind(file, insn, offset);
+					/* XXX: skipped earlier ! */
+					create_orc_insn(file, unwind);
+					if (!prev_insn ||
+					    memcmp(&unwind->orc, &prev_insn->orc,
+						   sizeof(struct orc_entry))) {
+						idx++;
+//						WARN_FUNC("ORC @ %d/%d", sec, insn->offset+offset, offset, alt_len);
+					}
+					prev_insn = unwind;
+				}
+
+				insn = insn->alt_end;
+			}
+
 			if (!prev_insn ||
 			    memcmp(&insn->orc, &prev_insn->orc,
 				   sizeof(struct orc_entry))) {
@@ -203,6 +236,31 @@ int create_orc_sections(struct objtool_file *file)
 
 		prev_insn = NULL;
 		sec_for_each_insn(file, sec, insn) {
+
+			if (insn->alt_end) {
+				unsigned int offset, alt_len;
+				struct instruction *unwind;
+
+				alt_len = insn->alt_end->offset - insn->offset;
+				for (offset = 0; offset < alt_len; offset++) {
+					unwind = find_alt_unwind(file, insn, offset);
+					if (!prev_insn ||
+					    memcmp(&unwind->orc, &prev_insn->orc,
+						   sizeof(struct orc_entry))) {
+
+						if (create_orc_entry(file->elf, u_sec, ip_relocsec, idx,
+								     insn->sec, insn->offset + offset,
+								     &unwind->orc))
+							return -1;
+
+						idx++;
+					}
+					prev_insn = unwind;
+				}
+
+				insn = insn->alt_end;
+			}
+
 			if (!prev_insn || memcmp(&insn->orc, &prev_insn->orc,
 						 sizeof(struct orc_entry))) {
 
-- 
2.26.2


