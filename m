Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EACB614F1F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:25:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435130.688255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opu4n-0000x3-SK; Tue, 01 Nov 2022 16:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435130.688255; Tue, 01 Nov 2022 16:25:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opu4n-0000sq-Ks; Tue, 01 Nov 2022 16:25:21 +0000
Received: by outflank-mailman (input) for mailman id 435130;
 Tue, 01 Nov 2022 16:25:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optvc-0000yH-Ra
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:15:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 736f26f5-5a00-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 17:15:50 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 182473382E;
 Tue,  1 Nov 2022 16:15:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DE1D51346F;
 Tue,  1 Nov 2022 16:15:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YhHLNDVGYWOSdwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 16:15:49 +0000
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
X-Inumbo-ID: 736f26f5-5a00-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667319350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WhOM3PNzD9bJCGoKKo33Zgli+2MPQr6UTZsqeC1HgWI=;
	b=eG9FjtjWP236isyPLSn4cWvJOdhSGJQKWtpUvyKcxBklDbp3krOAkwfa5IbKUi+K897HEq
	NNepjiSyG9K1qoT+RgBUA2kISTUQkelJ3RRROHcdfPxELrkLccd5pUgRlB+XO5+s+EQvf7
	EICx5g3e1kMZM5aGTebMgKsDZ4ZM/do=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 09/10] tools/xenstore: remove support of file backed data base
Date: Tue,  1 Nov 2022 17:14:56 +0100
Message-Id: <20221101161457.8470-10-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101161457.8470-1-jgross@suse.com>
References: <20221101161457.8470-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to prepare the replacement of TDB with direct accessible nodes
in memory, remove the support for a file backed data base.

This allows to remove xs_tdb_dump, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/Makefile         |  5 +-
 tools/xenstore/xenstored_core.c | 18 ++-----
 tools/xenstore/xs_tdb_dump.c    | 86 ---------------------------------
 3 files changed, 4 insertions(+), 105 deletions(-)
 delete mode 100644 tools/xenstore/xs_tdb_dump.c

diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
index ce7a68178f..56723139a1 100644
--- a/tools/xenstore/Makefile
+++ b/tools/xenstore/Makefile
@@ -29,7 +29,7 @@ CLIENTS += xenstore-write xenstore-ls xenstore-watch
 
 TARGETS := xenstore $(CLIENTS) xenstore-control
 ifeq ($(XENSTORE_XENSTORED),y)
-TARGETS += xs_tdb_dump xenstored
+TARGETS += xenstored
 endif
 
 .PHONY: all
@@ -50,9 +50,6 @@ xenstore: xenstore_client.o xs_lib.o
 xenstore-control: xenstore_control.o
 	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@ $(APPEND_LDFLAGS)
 
-xs_tdb_dump: xs_tdb_dump.o utils.o tdb.o talloc.o
-	$(CC) $(LDFLAGS) $^ -o $@ $(APPEND_LDFLAGS)
-
 .PHONY: clean
 clean::
 	$(RM) $(TARGETS) $(DEPS_RM)
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 5fcf96c77a..e11f796aaa 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2282,8 +2282,6 @@ static void accept_connection(int sock)
 }
 #endif
 
-static int tdb_flags = TDB_INTERNAL | TDB_NOLOCK;
-
 /* We create initial nodes manually. */
 static void manual_node(const char *name, const char *child)
 {
@@ -2335,14 +2333,11 @@ void setup_structure(bool live_update)
 {
 	char *tdbname;
 
-	tdbname = talloc_strdup(talloc_autofree_context(), xs_daemon_tdb());
+	tdbname = talloc_strdup(talloc_autofree_context(), "/dev/mem");
 	if (!tdbname)
 		barf_perror("Could not create tdbname");
 
-	if (!(tdb_flags & TDB_INTERNAL))
-		unlink(tdbname);
-
-	tdb_ctx = tdb_open_ex(tdbname, 7919, tdb_flags,
+	tdb_ctx = tdb_open_ex(tdbname, 7919, TDB_INTERNAL | TDB_NOLOCK,
 			      O_RDWR | O_CREAT | O_EXCL | O_CLOEXEC,
 			      0640, &tdb_logger, NULL);
 	if (!tdb_ctx)
@@ -2640,8 +2635,6 @@ static void usage(void)
 "                          watch-event: time a watch-event is kept pending\n"
 "  -R, --no-recovery       to request that no recovery should be attempted when\n"
 "                          the store is corrupted (debug only),\n"
-"  -I, --internal-db [on|off] store database in memory, not on disk, default is\n"
-"                          memory, with \"--internal-db off\" it is on disk\n"
 "  -K, --keep-orphans      don't delete nodes owned by a domain when the\n"
 "                          domain is deleted (this is a security risk!)\n"
 "  -V, --verbose           to request verbose execution.\n");
@@ -2668,7 +2661,6 @@ static struct option options[] = {
 	{ "quota-soft", 1, NULL, 'q' },
 	{ "timeout", 1, NULL, 'w' },
 	{ "no-recovery", 0, NULL, 'R' },
-	{ "internal-db", 2, NULL, 'I' },
 	{ "keep-orphans", 0, NULL, 'K' },
 	{ "verbose", 0, NULL, 'V' },
 	{ "watch-nb", 1, NULL, 'W' },
@@ -2781,7 +2773,7 @@ int main(int argc, char *argv[])
 	orig_argv = argv;
 
 	while ((opt = getopt_long(argc, argv,
-				  "DE:F:HI::KNPS:t:A:M:Q:q:T:RVW:w:U",
+				  "DE:F:H::KNPS:t:A:M:Q:q:T:RVW:w:U",
 				  options, NULL)) != -1) {
 		switch (opt) {
 		case 'D':
@@ -2817,10 +2809,6 @@ int main(int argc, char *argv[])
 		case 1:
 			set_trace_switch(optarg);
 			break;
-		case 'I':
-			if (optarg && !strcmp(optarg, "off"))
-				tdb_flags = 0;
-			break;
 		case 'K':
 			keep_orphans = true;
 			break;
diff --git a/tools/xenstore/xs_tdb_dump.c b/tools/xenstore/xs_tdb_dump.c
deleted file mode 100644
index 5d2db392b4..0000000000
--- a/tools/xenstore/xs_tdb_dump.c
+++ /dev/null
@@ -1,86 +0,0 @@
-/* Simple program to dump out all records of TDB */
-#include <stdint.h>
-#include <stdlib.h>
-#include <fcntl.h>
-#include <stdio.h>
-#include <stdarg.h>
-#include <string.h>
-#include <sys/types.h>
-#include "xenstore_lib.h"
-#include "tdb.h"
-#include "talloc.h"
-#include "utils.h"
-
-static uint32_t total_size(struct xs_tdb_record_hdr *hdr)
-{
-	return sizeof(*hdr) + hdr->num_perms * sizeof(struct xs_permissions) 
-		+ hdr->datalen + hdr->childlen;
-}
-
-static char perm_to_char(unsigned int perm)
-{
-	return perm == XS_PERM_READ ? 'r' :
-		perm == XS_PERM_WRITE ? 'w' :
-		perm == XS_PERM_NONE ? '-' :
-		perm == (XS_PERM_READ|XS_PERM_WRITE) ? 'b' :
-		'?';
-}
-
-static void tdb_logger(TDB_CONTEXT *tdb, int level, const char * fmt, ...)
-{
-	va_list ap;
-
-	va_start(ap, fmt);
-	vfprintf(stderr, fmt, ap);
-	va_end(ap);
-}
-
-int main(int argc, char *argv[])
-{
-	TDB_DATA key;
-	TDB_CONTEXT *tdb;
-
-	if (argc != 2)
-		barf("Usage: xs_tdb_dump <tdbfile>");
-
-	tdb = tdb_open_ex(talloc_strdup(NULL, argv[1]), 0, 0, O_RDONLY, 0,
-			  &tdb_logger, NULL);
-	if (!tdb)
-		barf_perror("Could not open %s", argv[1]);
-
-	key = tdb_firstkey(tdb);
-	while (key.dptr) {
-		TDB_DATA data;
-		struct xs_tdb_record_hdr *hdr;
-
-		data = tdb_fetch(tdb, key);
-		hdr = (void *)data.dptr;
-		if (data.dsize < sizeof(*hdr))
-			fprintf(stderr, "%.*s: BAD truncated\n",
-				(int)key.dsize, key.dptr);
-		else if (data.dsize != total_size(hdr))
-			fprintf(stderr, "%.*s: BAD length %zu for %u/%u/%u (%u)\n",
-				(int)key.dsize, key.dptr, data.dsize,
-				hdr->num_perms, hdr->datalen,
-				hdr->childlen, total_size(hdr));
-		else {
-			unsigned int i;
-			char *p;
-
-			printf("%.*s: ", (int)key.dsize, key.dptr);
-			for (i = 0; i < hdr->num_perms; i++)
-				printf("%s%c%u",
-				       i == 0 ? "" : ",",
-				       perm_to_char(hdr->perms[i].perms),
-				       hdr->perms[i].id);
-			p = (void *)&hdr->perms[hdr->num_perms];
-			printf(" %.*s\n", hdr->datalen, p);
-			p += hdr->datalen;
-			for (i = 0; i < hdr->childlen; i += strlen(p+i)+1)
-				printf("\t-> %s\n", p+i);
-		}
-		key = tdb_nextkey(tdb, key);
-	}
-	return 0;
-}
-
-- 
2.35.3


