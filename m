Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3882E1853
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 06:20:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58164.102126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krwYY-0002XG-WA; Wed, 23 Dec 2020 05:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58164.102126; Wed, 23 Dec 2020 05:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krwYY-0002Wd-R5; Wed, 23 Dec 2020 05:19:26 +0000
Received: by outflank-mailman (input) for mailman id 58164;
 Wed, 23 Dec 2020 05:19:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xcbs=F3=redhat.com=jpoimboe@srs-us1.protection.inumbo.net>)
 id 1krwYW-0002OV-QN
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 05:19:24 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 964faad1-99ad-44e8-92f4-6a7cf143853c;
 Wed, 23 Dec 2020 05:19:15 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-OYXhaivwNG27pgyrOvM83g-1; Wed, 23 Dec 2020 00:19:11 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C7CA18C8C02;
 Wed, 23 Dec 2020 05:19:09 +0000 (UTC)
Received: from treble.redhat.com (ovpn-117-91.rdu2.redhat.com [10.10.117.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A400319D9C;
 Wed, 23 Dec 2020 05:19:08 +0000 (UTC)
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
X-Inumbo-ID: 964faad1-99ad-44e8-92f4-6a7cf143853c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608700755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7GfgB281hzscc78Xu7z2MmSIJrE3t6vhDKCus+aT9gA=;
	b=BRDPlzYLGZxjOjK1kSh5NMB7++HUO+SUs3CJCT15W3G2lbI5UYOQ2idVD6VdVt4kcyHQ8J
	rcTq3+3nwjGVOfmdPAjyYwaP+7l95Cc705J7JJvJDYZFv0UJbAicnMLSkUIwGDriazXY2b
	PCxuTbbrhmhcdEUZ4LlZYKjyAFBWu7c=
X-MC-Unique: OYXhaivwNG27pgyrOvM83g-1
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH 3/3] objtool: Support stack layout changes in alternatives
Date: Tue, 22 Dec 2020 23:18:10 -0600
Message-Id: <9f78604e49b400eb3b2ca613591f8c357474ed4e.1608700338.git.jpoimboe@redhat.com>
In-Reply-To: <cover.1608700338.git.jpoimboe@redhat.com>
References: <cover.1608700338.git.jpoimboe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23

The ORC unwinder showed a warning [1] which revealed the stack layout
didn't match what was expected.  The problem was that paravirt patching
had replaced "CALL *pv_ops.irq.save_fl" with "PUSHF;POP".  That changed
the stack layout between the PUSHF and the POP, so unwinding from an
interrupt which occurred between those two instructions would fail.

Part of the agreed upon solution was to rework the custom paravirt
patching code to use alternatives instead, since objtool already knows
how to read alternatives (and converging runtime patching infrastructure
is always a good thing anyway).  But the main problem still remains,
which is that runtime patching can change the stack layout.

Making stack layout changes in alternatives was disallowed with commit
7117f16bf460 ("objtool: Fix ORC vs alternatives"), but now that paravirt
is going to be doing it, it needs to be supported.

One way to do so would be to modify the ORC table when the code gets
patched.  But ORC is simple -- a good thing! -- and it's best to leave
it alone.

Instead, support stack layout changes by "flattening" all possible stack
states (CFI) from parallel alternative code streams into a single set of
linear states.  The only necessary limitation is that CFI conflicts are
disallowed at all possible instruction boundaries.

For example, this scenario is allowed:

          Alt1                    Alt2                    Alt3

   0x00   CALL *pv_ops.save_fl    CALL xen_save_fl        PUSHF
   0x01                                                   POP %RAX
   0x02                                                   NOP
   ...
   0x05                           NOP
   ...
   0x07   <insn>

The unwind information for offset-0x00 is identical for all 3
alternatives.  Similarly offset-0x05 and higher also are identical (and
the same as 0x00).  However offset-0x01 has deviating CFI, but that is
only relevant for Alt3, neither of the other alternative instruction
streams will ever hit that offset.

This scenario is NOT allowed:

          Alt1                    Alt2

   0x00   CALL *pv_ops.save_fl    PUSHF
   0x01                           NOP6
   ...
   0x07   NOP                     POP %RAX

The problem here is that offset-0x7, which is an instruction boundary in
both possible instruction patch streams, has two conflicting stack
layouts.

[ The above examples were stolen from Peter Zijlstra. ]

The new flattened CFI array is used both for the detection of conflicts
(like the second example above) and the generation of linear ORC
entries.

BTW, another benefit of these changes is that, thanks to some related
cleanups (new fake nops and alt_group struct) objtool can finally be rid
of fake jumps, which were a constant source of headaches.

[1] https://lkml.kernel.org/r/20201111170536.arx2zbn4ngvjoov7@treble

Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
---
 .../Documentation/stack-validation.txt        |  16 +-
 tools/objtool/check.c                         | 175 ++++++++++--------
 tools/objtool/check.h                         |   6 +
 tools/objtool/orc_gen.c                       |  56 +++++-
 4 files changed, 157 insertions(+), 96 deletions(-)

diff --git a/tools/objtool/Documentation/stack-validation.txt b/tools/objtool/Documentation/stack-validation.txt
index 0542e46c7552..30f38fdc0d56 100644
--- a/tools/objtool/Documentation/stack-validation.txt
+++ b/tools/objtool/Documentation/stack-validation.txt
@@ -315,13 +315,15 @@ they mean, and suggestions for how to fix them.
       function tracing inserts additional calls, which is not obvious from the
       sources).
 
-10. file.o: warning: func()+0x5c: alternative modifies stack
-
-    This means that an alternative includes instructions that modify the
-    stack. The problem is that there is only one ORC unwind table, this means
-    that the ORC unwind entries must be valid for each of the alternatives.
-    The easiest way to enforce this is to ensure alternatives do not contain
-    any ORC entries, which in turn implies the above constraint.
+10. file.o: warning: func()+0x5c: stack layout conflict in alternatives
+
+    This means that in the use of the alternative() or ALTERNATIVE()
+    macro, the code paths have conflicting modifications to the stack.
+    The problem is that there is only one ORC unwind table, which means
+    that the ORC unwind entries must be consistent for all possible
+    instruction boundaries regardless of which code has been patched.
+    This limitation can be overcome by massaging the alternatives with
+    NOPs to shift the stack changes around so they no longer conflict.
 
 11. file.o: warning: unannotated intra-function call
 
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 67f39b57c6f7..81d56fdef1c3 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -19,8 +19,6 @@
 #include <linux/kernel.h>
 #include <linux/static_call_types.h>
 
-#define FAKE_JUMP_OFFSET -1
-
 struct alternative {
 	struct list_head list;
 	struct instruction *insn;
@@ -767,9 +765,6 @@ static int add_jump_destinations(struct objtool_file *file)
 		if (!is_static_jump(insn))
 			continue;
 
-		if (insn->offset == FAKE_JUMP_OFFSET)
-			continue;
-
 		reloc = find_reloc_by_dest_range(file->elf, insn->sec,
 					       insn->offset, insn->len);
 		if (!reloc) {
@@ -984,7 +979,7 @@ static int handle_group_alt(struct objtool_file *file,
 			    struct instruction *orig_insn,
 			    struct instruction **new_insn)
 {
-	struct instruction *last_orig_insn, *last_new_insn, *insn, *fake_jump = NULL;
+	struct instruction *last_orig_insn, *last_new_insn = NULL, *insn, *nop = NULL;
 	struct alt_group *orig_alt_group, *new_alt_group;
 	unsigned long dest_off;
 
@@ -994,6 +989,13 @@ static int handle_group_alt(struct objtool_file *file,
 		WARN("malloc failed");
 		return -1;
 	}
+	orig_alt_group->cfi = calloc(special_alt->orig_len,
+				     sizeof(struct cfi_state *));
+	if (!orig_alt_group->cfi) {
+		WARN("calloc failed");
+		return -1;
+	}
+
 	last_orig_insn = NULL;
 	insn = orig_insn;
 	sec_for_each_insn_from(file, insn) {
@@ -1007,42 +1009,45 @@ static int handle_group_alt(struct objtool_file *file,
 	orig_alt_group->first_insn = orig_insn;
 	orig_alt_group->last_insn = last_orig_insn;
 
-	if (next_insn_same_sec(file, last_orig_insn)) {
-		fake_jump = malloc(sizeof(*fake_jump));
-		if (!fake_jump) {
-			WARN("malloc failed");
-			return -1;
-		}
-		memset(fake_jump, 0, sizeof(*fake_jump));
-		INIT_LIST_HEAD(&fake_jump->alts);
-		INIT_LIST_HEAD(&fake_jump->stack_ops);
-		init_cfi_state(&fake_jump->cfi);
 
-		fake_jump->sec = special_alt->new_sec;
-		fake_jump->offset = FAKE_JUMP_OFFSET;
-		fake_jump->type = INSN_JUMP_UNCONDITIONAL;
-		fake_jump->jump_dest = list_next_entry(last_orig_insn, list);
-		fake_jump->func = orig_insn->func;
+	new_alt_group = malloc(sizeof(*new_alt_group));
+	if (!new_alt_group) {
+		WARN("malloc failed");
+		return -1;
 	}
 
-	if (!special_alt->new_len) {
-		if (!fake_jump) {
-			WARN("%s: empty alternative at end of section",
-			     special_alt->orig_sec->name);
+	if (special_alt->new_len < special_alt->orig_len) {
+		/*
+		 * Insert a fake nop at the end to make the replacement
+		 * alt_group the same size as the original.  This is needed to
+		 * allow propagate_alt_cfi() to do its magic.  When the last
+		 * instruction affects the stack, the instruction after it (the
+		 * nop) will propagate the new state to the shared CFI array.
+		 */
+		nop = malloc(sizeof(*nop));
+		if (!nop) {
+			WARN("malloc failed");
 			return -1;
 		}
+		memset(nop, 0, sizeof(*nop));
+		INIT_LIST_HEAD(&nop->alts);
+		INIT_LIST_HEAD(&nop->stack_ops);
+		init_cfi_state(&nop->cfi);
 
-		*new_insn = fake_jump;
-		return 0;
+		nop->sec = special_alt->new_sec;
+		nop->offset = special_alt->new_off + special_alt->new_len;
+		nop->len = special_alt->orig_len - special_alt->new_len;
+		nop->type = INSN_NOP;
+		nop->func = orig_insn->func;
+		nop->alt_group = new_alt_group;
+		nop->ignore = orig_insn->ignore_alts;
 	}
 
-	new_alt_group = malloc(sizeof(*new_alt_group));
-	if (!new_alt_group) {
-		WARN("malloc failed");
-		return -1;
+	if (!special_alt->new_len) {
+		*new_insn = nop;
+		goto end;
 	}
 
-	last_new_insn = NULL;
 	insn = *new_insn;
 	sec_for_each_insn_from(file, insn) {
 		struct reloc *alt_reloc;
@@ -1081,14 +1086,8 @@ static int handle_group_alt(struct objtool_file *file,
 			continue;
 
 		dest_off = arch_jump_destination(insn);
-		if (dest_off == special_alt->new_off + special_alt->new_len) {
-			if (!fake_jump) {
-				WARN("%s: alternative jump to end of section",
-				     special_alt->orig_sec->name);
-				return -1;
-			}
-			insn->jump_dest = fake_jump;
-		}
+		if (dest_off == special_alt->new_off + special_alt->new_len)
+			insn->jump_dest = next_insn_same_sec(file, last_orig_insn);
 
 		if (!insn->jump_dest) {
 			WARN_FUNC("can't find alternative jump destination",
@@ -1103,13 +1102,13 @@ static int handle_group_alt(struct objtool_file *file,
 		return -1;
 	}
 
+	if (nop)
+		list_add(&nop->list, &last_new_insn->list);
+end:
 	new_alt_group->orig_group = orig_alt_group;
 	new_alt_group->first_insn = *new_insn;
-	new_alt_group->last_insn = last_new_insn;
-
-	if (fake_jump)
-		list_add(&fake_jump->list, &last_new_insn->list);
-
+	new_alt_group->last_insn = nop ? : last_new_insn;
+	new_alt_group->cfi = orig_alt_group->cfi;
 	return 0;
 }
 
@@ -2202,22 +2201,47 @@ static int update_cfi_state(struct instruction *insn, struct cfi_state *cfi,
 	return 0;
 }
 
-static int handle_insn_ops(struct instruction *insn, struct insn_state *state)
+/*
+ * The stack layouts of alternatives instructions can sometimes diverge when
+ * they have stack modifications.  That's fine as long as the potential stack
+ * layouts don't conflict at any given potential instruction boundary.
+ *
+ * Flatten the CFIs of the different alternative code streams (both original
+ * and replacement) into a single shared CFI array which can be used to detect
+ * conflicts and nicely feed a linear array of ORC entries to the unwinder.
+ */
+static int propagate_alt_cfi(struct objtool_file *file, struct instruction *insn)
 {
-	struct stack_op *op;
+	struct cfi_state **alt_cfi;
+	int group_off;
 
-	list_for_each_entry(op, &insn->stack_ops, list) {
-		struct cfi_state old_cfi = state->cfi;
-		int res;
+	if (!insn->alt_group)
+		return 0;
 
-		res = update_cfi_state(insn, &state->cfi, op);
-		if (res)
-			return res;
+	alt_cfi = insn->alt_group->cfi;
+	group_off = insn->offset - insn->alt_group->first_insn->offset;
 
-		if (insn->alt_group && memcmp(&state->cfi, &old_cfi, sizeof(struct cfi_state))) {
-			WARN_FUNC("alternative modifies stack", insn->sec, insn->offset);
+	if (!alt_cfi[group_off]) {
+		alt_cfi[group_off] = &insn->cfi;
+	} else {
+		if (memcmp(alt_cfi[group_off], &insn->cfi, sizeof(struct cfi_state))) {
+			WARN_FUNC("stack layout conflict in alternatives",
+				  insn->sec, insn->offset);
 			return -1;
 		}
+	}
+
+	return 0;
+}
+
+static int handle_insn_ops(struct instruction *insn, struct insn_state *state)
+{
+	struct stack_op *op;
+
+	list_for_each_entry(op, &insn->stack_ops, list) {
+
+		if (update_cfi_state(insn, &state->cfi, op))
+			return 1;
 
 		if (op->dest.type == OP_DEST_PUSHF) {
 			if (!state->uaccess_stack) {
@@ -2407,28 +2431,20 @@ static int validate_return(struct symbol *func, struct instruction *insn, struct
 	return 0;
 }
 
-/*
- * Alternatives should not contain any ORC entries, this in turn means they
- * should not contain any CFI ops, which implies all instructions should have
- * the same same CFI state.
- *
- * It is possible to constuct alternatives that have unreachable holes that go
- * unreported (because they're NOPs), such holes would result in CFI_UNDEFINED
- * states which then results in ORC entries, which we just said we didn't want.
- *
- * Avoid them by copying the CFI entry of the first instruction into the whole
- * alternative.
- */
-static void fill_alternative_cfi(struct objtool_file *file, struct instruction *insn)
+static struct instruction *next_insn_to_validate(struct objtool_file *file,
+						 struct instruction *insn)
 {
-	struct instruction *first_insn = insn;
 	struct alt_group *alt_group = insn->alt_group;
 
-	sec_for_each_insn_continue(file, insn) {
-		if (insn->alt_group != alt_group)
-			break;
-		insn->cfi = first_insn->cfi;
-	}
+	/*
+	 * Simulate the fact that alternatives are patched in-place.  When the
+	 * end of a replacement alt_group is reached, redirect objtool flow to
+	 * the end of the original alt_group.
+	 */
+	if (alt_group && insn == alt_group->last_insn && alt_group->orig_group)
+		return next_insn_same_sec(file, alt_group->orig_group->last_insn);
+
+	return next_insn_same_sec(file, insn);
 }
 
 /*
@@ -2449,7 +2465,7 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 	sec = insn->sec;
 
 	while (1) {
-		next_insn = next_insn_same_sec(file, insn);
+		next_insn = next_insn_to_validate(file, insn);
 
 		if (file->c_file && func && insn->func && func != insn->func->pfunc) {
 			WARN("%s() falls through to next function %s()",
@@ -2482,6 +2498,9 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 
 		insn->visited |= visited;
 
+		if (propagate_alt_cfi(file, insn))
+			return 1;
+
 		if (!insn->ignore_alts && !list_empty(&insn->alts)) {
 			bool skip_orig = false;
 
@@ -2497,9 +2516,6 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 				}
 			}
 
-			if (insn->alt_group)
-				fill_alternative_cfi(file, insn);
-
 			if (skip_orig)
 				return 0;
 		}
@@ -2733,9 +2749,6 @@ static bool ignore_unreachable_insn(struct objtool_file *file, struct instructio
 	    !strcmp(insn->sec->name, ".altinstr_aux"))
 		return true;
 
-	if (insn->type == INSN_JUMP_UNCONDITIONAL && insn->offset == FAKE_JUMP_OFFSET)
-		return true;
-
 	if (!insn->func)
 		return false;
 
diff --git a/tools/objtool/check.h b/tools/objtool/check.h
index b74c383c2d83..45fe87ad662b 100644
--- a/tools/objtool/check.h
+++ b/tools/objtool/check.h
@@ -28,6 +28,12 @@ struct alt_group {
 
 	/* First and last instructions in the group */
 	struct instruction *first_insn, *last_insn;
+
+	/*
+	 * Byte-offset-addressed len-sized array of pointers to CFI structs.
+	 * This is shared with the other alt_groups in the same alternative.
+	 */
+	struct cfi_state **cfi;
 };
 
 struct instruction {
diff --git a/tools/objtool/orc_gen.c b/tools/objtool/orc_gen.c
index 73efba2bfa72..2c1e3b909be5 100644
--- a/tools/objtool/orc_gen.c
+++ b/tools/objtool/orc_gen.c
@@ -160,6 +160,13 @@ static int orc_list_add(struct list_head *orc_list, struct orc_entry *orc,
 	return 0;
 }
 
+static unsigned long alt_group_len(struct alt_group *alt_group)
+{
+	return alt_group->last_insn->offset +
+	       alt_group->last_insn->len -
+	       alt_group->first_insn->offset;
+}
+
 int orc_create(struct objtool_file *file)
 {
 	struct section *sec, *ip_rsec, *orc_sec;
@@ -184,15 +191,48 @@ int orc_create(struct objtool_file *file)
 			continue;
 
 		sec_for_each_insn(file, sec, insn) {
-			if (init_orc_entry(&orc, &insn->cfi))
-				return -1;
-			if (!memcmp(&prev_orc, &orc, sizeof(orc)))
+			struct alt_group *alt_group = insn->alt_group;
+			int i;
+
+			if (!alt_group) {
+				if (init_orc_entry(&orc, &insn->cfi))
+					return -1;
+				if (!memcmp(&prev_orc, &orc, sizeof(orc)))
+					continue;
+				if (orc_list_add(&orc_list, &orc, sec,
+						 insn->offset))
+					return -1;
+				nr++;
+				prev_orc = orc;
+				empty = false;
 				continue;
-			if (orc_list_add(&orc_list, &orc, sec, insn->offset))
-				return -1;
-			nr++;
-			prev_orc = orc;
-			empty = false;
+			}
+
+			/*
+			 * Alternatives can have different stack layout
+			 * possibilities (but they shouldn't conflict).
+			 * Instead of traversing the instructions, use the
+			 * alt_group's flattened byte-offset-addressed CFI
+			 * array.
+			 */
+			for (i = 0; i < alt_group_len(alt_group); i++) {
+				struct cfi_state *cfi = alt_group->cfi[i];
+				if (!cfi)
+					continue;
+				if (init_orc_entry(&orc, cfi))
+					return -1;
+				if (!memcmp(&prev_orc, &orc, sizeof(orc)))
+					continue;
+				if (orc_list_add(&orc_list, &orc, insn->sec,
+						 insn->offset + i))
+					return -1;
+				nr++;
+				prev_orc = orc;
+				empty = false;
+			}
+
+			/* Skip to the end of the alt_group */
+			insn = alt_group->last_insn;
 		}
 
 		/* Add a section terminator */
-- 
2.29.2


