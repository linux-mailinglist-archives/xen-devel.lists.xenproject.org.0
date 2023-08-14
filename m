Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855EC77B2E9
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:48:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583329.913520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSIq-0005AX-Fh; Mon, 14 Aug 2023 07:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583329.913520; Mon, 14 Aug 2023 07:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSIq-00057o-CB; Mon, 14 Aug 2023 07:47:52 +0000
Received: by outflank-mailman (input) for mailman id 583329;
 Mon, 14 Aug 2023 07:47:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzbS=D7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qVSIo-0002SK-Pk
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:47:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddd89b19-3a76-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 09:47:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A5C442195D;
 Mon, 14 Aug 2023 07:47:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7976F138EE;
 Mon, 14 Aug 2023 07:47:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OYhOHCXc2WTnQQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 14 Aug 2023 07:47:49 +0000
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
X-Inumbo-ID: ddd89b19-3a76-11ee-b288-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691999269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7fhN47uhVKwt7gKu3+NNZ/ZsErsC4Q4pzFPHtw7oHuU=;
	b=Y9dISKFO+RNFWPY0Ark9I6RXWHrDFVwAcwB9L6ZNKx6cjUfa0W97gpolwN360SW1+mCtxE
	/xRhPuwmjT6JYM28+mX7aWa9ZRxtgf0bsoYN10lfiE5ppkABAeUkmQwxPr6aTXaXLYxrzm
	awF3gDcXF20YlGpPONd+npnq7UO9DKk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 07/19] tools/xenstore: change talloc_free() to take a const pointer
Date: Mon, 14 Aug 2023 09:46:55 +0200
Message-Id: <20230814074707.27696-8-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814074707.27696-1-jgross@suse.com>
References: <20230814074707.27696-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With talloc_free() and related functions not taking a pointer to const
it is tedious to use the const attribute for talloc()-ed memory in
many cases.

Change the related prototypes to use "const void *" instead of
"void *".

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
V4:
- add comment (Julien Grall)
---
 tools/xenstore/talloc.c | 10 ++++++----
 tools/xenstore/talloc.h |  4 ++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/xenstore/talloc.c b/tools/xenstore/talloc.c
index 23c3a23b19..e42c7d4471 100644
--- a/tools/xenstore/talloc.c
+++ b/tools/xenstore/talloc.c
@@ -319,7 +319,7 @@ static int talloc_unreference(const void *context, const void *ptr)
   remove a specific parent context from a pointer. This is a more
   controlled varient of talloc_free()
 */
-int talloc_unlink(const void *context, void *ptr)
+int talloc_unlink(const void *context, const void *ptr)
 {
 	struct talloc_chunk *tc_p, *new_p;
 	void *new_parent;
@@ -499,7 +499,7 @@ void *talloc_init(const char *fmt, ...)
   should probably not be used in new code. It's in here to keep the talloc
   code consistent across Samba 3 and 4.
 */
-static void talloc_free_children(void *ptr)
+static void talloc_free_children(const void *ptr)
 {
 	struct talloc_chunk *tc;
 
@@ -539,7 +539,7 @@ static void talloc_free_children(void *ptr)
    will not be freed if the ref_count is > 1 or the destructor (if
    any) returns non-zero
 */
-int talloc_free(void *ptr)
+int talloc_free(const void *ptr)
 {
 	int saved_errno = errno;
 	struct talloc_chunk *tc;
@@ -571,7 +571,9 @@ int talloc_free(void *ptr)
 			goto err;
 		}
 		tc->destructor = (talloc_destructor_t)-1;
-		if (d(ptr) == -1) {
+
+		/* The destructor needs to be able to change the object! */
+		if (d((void *)ptr) == -1) {
 			tc->destructor = d;
 			goto err;
 		}
diff --git a/tools/xenstore/talloc.h b/tools/xenstore/talloc.h
index 518fcac151..32cee63d4d 100644
--- a/tools/xenstore/talloc.h
+++ b/tools/xenstore/talloc.h
@@ -92,7 +92,7 @@ void *_talloc(const void *context, size_t size);
 void talloc_set_destructor(const void *ptr, int (*destructor)(void *));
 void talloc_increase_ref_count(const void *ptr);
 void *talloc_reference(const void *context, const void *ptr);
-int talloc_unlink(const void *context, void *ptr);
+int talloc_unlink(const void *context, const void *ptr);
 void talloc_set_name(const void *ptr, const char *fmt, ...) PRINTF_ATTRIBUTE(2,3);
 void talloc_set_name_const(const void *ptr, const char *name);
 void *talloc_named(const void *context, size_t size, 
@@ -103,7 +103,7 @@ void *talloc_check_name(const void *ptr, const char *name);
 void talloc_report_depth(const void *ptr, FILE *f, int depth);
 void *talloc_parent(const void *ptr);
 void *talloc_init(const char *fmt, ...) PRINTF_ATTRIBUTE(1,2);
-int talloc_free(void *ptr);
+int talloc_free(const void *ptr);
 void *_talloc_realloc(const void *context, void *ptr, size_t size, const char *name);
 void *talloc_steal(const void *new_ctx, const void *ptr);
 off_t talloc_total_size(const void *ptr);
-- 
2.35.3


