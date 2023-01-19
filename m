Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED8167353D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 11:15:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480915.745560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIRwY-0008UY-Hu; Thu, 19 Jan 2023 10:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480915.745560; Thu, 19 Jan 2023 10:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIRwY-0008Qs-EC; Thu, 19 Jan 2023 10:14:50 +0000
Received: by outflank-mailman (input) for mailman id 480915;
 Thu, 19 Jan 2023 10:14:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7itS=5Q=amazon.com=prvs=3763fc082=mstrasun@srs-se1.protection.inumbo.net>)
 id 1pIRwW-0007Sb-VV
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 10:14:49 +0000
Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com
 [207.171.190.10]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19f1060f-97e2-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 11:14:47 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2a-m6i4x-8a14c045.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-33001.sea14.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 10:14:44 +0000
Received: from EX13D48EUA002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2a-m6i4x-8a14c045.us-west-2.amazon.com (Postfix)
 with ESMTPS id 3F2A383120
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jan 2023 10:14:42 +0000 (UTC)
Received: from EX19D042EUA004.ant.amazon.com (10.252.50.16) by
 EX13D48EUA002.ant.amazon.com (10.43.165.27) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Thu, 19 Jan 2023 10:14:40 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX19D042EUA004.ant.amazon.com (10.252.50.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.7;
 Thu, 19 Jan 2023 10:14:40 +0000
Received: from dev-dsk-mstrasun-1c-15417e94.eu-west-1.amazon.com
 (172.19.92.214) by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP
 Server id 15.0.1497.45 via Frontend Transport; Thu, 19 Jan 2023 10:14:38
 +0000
Received: by dev-dsk-mstrasun-1c-15417e94.eu-west-1.amazon.com (Postfix,
 from userid 17415739)
 id CB9DE21426; Thu, 19 Jan 2023 10:14:38 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 19f1060f-97e2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1674123288; x=1705659288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gXy2lSCqzAzPVhs9Pixrebyr+33aF5wrQ+8+7LICdlw=;
  b=RxuYz8n7hbLoIRnhaMyplwEpnpFgya/QnJazk6905YwuO7DvgY7yhpZG
   8/czkV+UicRU/2zHvrwZ6SC8CoO0BlJ2WwNIjSi1FGRhLubPUKnMdvDcb
   HjQQWqpT2CVHlQ+pw3dPIrnbuGnFeZKn/IOQ5uQbLmflomVU+td5/p099
   E=;
X-IronPort-AV: E=Sophos;i="5.97,228,1669075200"; 
   d="scan'208";a="256252906"
From: Mihails Strasuns <mstrasun@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <mstrasun@amazon.com>, Stanislav Uschakow <suschako@amazon.com>, "Bjoern
 Doebel" <doebel@amazon.de>, Martin Pohlack <mpohlack@amazon.de>
Subject: [PATCH v1 4/4] create-diff-object: Add new symbols for relocation aliases
Date: Thu, 19 Jan 2023 10:13:06 +0000
Message-ID: <eb9dc975083baadf9490195cf984eb13b556e244.1673623880.git.mstrasun@amazon.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673623880.git.mstrasun@amazon.com>
References: <cover.1673623880.git.mstrasun@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Stanislav Uschakow <suschako@amazon.com>

This fixes an issue when stacking multiple hotpatches modifying the same
function when there is also an internal call to that function within
these patches.

Two hotpatches touching the same subset of functions can result in a
situation where the second hotpatch is loaded but the code is never
executed. This happens when the symbol resolution of the first hotpatch
calculates the target address for the relocation entries based on the
hotpach instead of the original function. The resulting address for the
relocation-target will become the patched function instead of the
original one (A' -> B' instead of A' -> B).  In this case the trampoline
in the original function is not used. Patching this function again (B'')
re-sets the trampoline to the newly patched method. Since callq points
to the first patched function it never reaches the second version.

    2nd patch |          B''
    1st patch |  A'  ->  B'
    original  |  A   ->  B

This fix provides a solution for this problem by resolving the symbols
during patch generation using xen-syms. The patch iterates over all
relocation entries, and creates duplicates of all referenced symbols
with the scope set to SHN_ABS and the address to the one resolved from
xen-syms. This new symbol is prefixed with a unique string to generate a
new name.

This forces all calls to be directed to the original function which
contains the trampoline.

Signed-off-by: Stanislav Uschakow <suschako@amazon.com>
Signed-off-by: Mihails Strasuns <mstrasun@amazon.com>
Reviewed-by: Bjoern Doebel <doebel@amazon.de>
Reviewed-by: Martin Pohlack <mpohlack@amazon.de>
---
 create-diff-object.c | 132 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/create-diff-object.c b/create-diff-object.c
index a516670..808b288 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -1878,6 +1878,25 @@ static char *mangle_local_symbol(char *filename, char *symname)
 	return s;
 }
 
+/*
+ * For a given mangled symbol name allocates a copy with the filename and the
+ * unmangled symbol separated by a null terminator.
+ */
+static bool unmangle_local_symbol(const char *mangled, char **filename,
+								  char **symname)
+{
+	if (filename == NULL || symname == NULL)
+		ERROR("Malformed output arguments passed to 'unmangle_local_symbol'");
+	char *sep = strchr(mangled, '#');
+	if (!sep)
+		return false;
+	int i = sep - mangled;
+	*filename = strdup(mangled);
+	(*filename)[i] = '\0';
+	*symname = *filename + i + 1;
+	return true;
+}
+
 /*
  * Rename local symbols to the filename#symbol format used by Xen's "special"
  * symbol table.
@@ -2290,6 +2309,116 @@ static error_t parse_opt (int key, char *arg, struct argp_state *state)
 	return 0;
 }
 
+/*
+ * For a given elf output target add a new entry to the symbol table
+ * which duplicates the provided source symbol.
+ */
+static struct symbol *insert_symbol_copy(struct kpatch_elf *elf,
+										 struct symbol *src, int index,
+										 char *new_name)
+{
+	struct symbol *new_sym;
+	ALLOC_LINK(new_sym, &elf->symbols);
+	new_sym->index = index;
+	new_sym->twin = NULL;
+	new_sym->sec = NULL;
+	new_sym->bind = src->bind;
+	new_sym->type = src->type;
+	new_sym->status = NEW;
+	new_sym->strip = 0;
+	new_sym->name = new_name;
+	/* The copy here will keep referring to the original symbol
+	   name which is fine - it will be updated later during the final elf
+	   generation. */
+	new_sym->sym = src->sym;
+	return new_sym;
+}
+
+/*
+ * In certain cases when 2 hotpatches are loaded patching the same subset of
+ * functions calling each other, the topmost hotpatch can become unreachable.
+ * This is caused by the loader when resolving symbols. If a symbol is both
+ * to be relocated and loaded (foo calls bar and both are patched to foo' and
+ * bar'), the callq target in foo' is set to bar' instead of the original bar.
+ * Patching bar again (bar'') cannot be reached from foo' because foo' does not
+ * use the trampoline in bar.
+ *
+ * This post-processing function fixes the problem by updating all
+ * non-livepatch relocation entries (i.e. originally created by a compiler) to
+ * be based on a special SHN_ABS with a fixed value resolved from xen-syms.
+ * These new symbols are not used by livepatch loader itself and only exist as
+ * a named constant for the relevant function address in the host process.
+ *
+ *	All new symbols are prefixed with a scalpel-specific prefix string. As they
+ *  are not used outside of a specific livepatch linking/relocation process,
+ *  the prefix can be the same across multiple livepatches.
+ */
+void add_absolute_symbol_aliases(struct kpatch_elf *elf,
+								 struct lookup_table *lookup)
+{
+	const char *prefix = "__livepatch_unique_";
+
+	int sym_count = 0;
+	struct symbol *sym;
+	list_for_each_entry (sym, &elf->symbols, list)
+		sym_count++;
+
+	struct section *sec;
+	list_for_each_entry (sec, &elf->sections, list) {
+		if (!is_rela_section(sec))
+			continue;
+		/* Ignore any relocation sections that are not related to a symbol
+		   text sections: */
+		if (strncmp(sec->name, ".rela.text.", 11) != 0)
+			continue;
+
+		struct rela *rel;
+		list_for_each_entry (rel, &sec->relas, list) {
+			if ((rel->sym->type != STT_FUNC) &&
+				(rel->sym->type != STT_OBJECT) &&
+				(rel->sym->type != STT_NOTYPE))
+				continue;
+			if (strlen(rel->sym->name) == 0)
+				ERROR("Unnamed symbol used in relocation");
+
+			struct lookup_result res = {0};
+			bool found = false;
+			/* Static/local symbols are mangled to include a filename prefix,
+			   thus need a special treatment for xen-syms lookup: */
+			if (rel->sym->bind == STB_LOCAL) {
+				char *filename, *symname;
+				if (!unmangle_local_symbol(rel->sym->name, &filename, &symname))
+					continue;
+				found = !lookup_local_symbol(lookup, symname, filename, &res);
+			} else
+				found = !lookup_global_symbol(lookup, rel->sym->name, &res);
+
+			if (found) {
+				char *buf = malloc(strlen(prefix) + strlen(rel->sym->name) + 1);
+				if (!buf)
+					ERROR("Failed to allocate buffer\n");
+				strcpy(buf, prefix);
+				strcpy(buf + strlen(prefix), rel->sym->name);
+
+				struct symbol *new_sym =
+					insert_symbol_copy(elf, rel->sym, sym_count++, buf);
+				/* Override key fields after copying. GLOBAL/LOCAL binding
+				   most likely doesn't matter here but forcing GLOBAL in case
+				   linker tries to do something smart: */
+				new_sym->bind = STB_GLOBAL;
+				new_sym->sym.st_value = res.value;
+				new_sym->sym.st_shndx = SHN_ABS;
+				new_sym->sym.st_info = GELF_ST_INFO(new_sym->bind, new_sym->type);
+ 
+				/* TODO: translate X86_64_PC32 rel type to X86_64_64 and
+				   validate that the relocation is still correvtly computed. */
+				log_debug("Added '%s' alias for '%s'\n", buf,  rel->sym->name);
+				rel->sym = new_sym;
+			}
+		}
+	}
+}
+
 static struct argp argp = { options, parse_opt, args_doc, 0 };
 
 int main(int argc, char *argv[])
@@ -2434,6 +2563,9 @@ int main(int argc, char *argv[])
 	log_debug("Rename local symbols\n");
 	livepatch_rename_local_symbols(kelf_out, hint);
 
+	log_debug("Add absolute symbol aliases for internal calls\n");
+	add_absolute_symbol_aliases(kelf_out, lookup);
+
 	/*
 	 *  At this point, the set of output sections and symbols is
 	 *  finalized.  Reorder the symbols into linker-compliant
-- 
2.38.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




