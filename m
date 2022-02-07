Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 400BD4AB520
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 07:42:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266407.460091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGxil-00036U-1w; Mon, 07 Feb 2022 06:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266407.460091; Mon, 07 Feb 2022 06:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGxik-00030W-Ur; Mon, 07 Feb 2022 06:41:54 +0000
Received: by outflank-mailman (input) for mailman id 266407;
 Mon, 07 Feb 2022 06:41:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddl1=SW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nGxij-0002yP-Rz
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 06:41:53 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08762e80-87e1-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 07:41:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 02A4D210F3;
 Mon,  7 Feb 2022 06:41:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA71F13519;
 Mon,  7 Feb 2022 06:41:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IDQIMC+/AGLDUgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 07 Feb 2022 06:41:51 +0000
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
X-Inumbo-ID: 08762e80-87e1-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644216112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mCUb5g78LuJVrOtCJeFF2txQ1SfvngrUecaJfWrIMSg=;
	b=d2uVq85MoPreBkE3vvjYcNOhddy4m2VjdVk1NUxkocWQADPs+aLKRuZ0lpEU5MayHQWaqL
	pLr2ReNHBhw572FdsMZA6n77VVHxD6y0szQ7sFXWeYjBFoGmJJwJGW6qWO10T3Tc9Y0IJZ
	2H6h/43BSA10kIP2c5JgW2WKrm6VF+o=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 1/5] tools/include: generate a _xen_list.h file
Date: Mon,  7 Feb 2022 07:41:43 +0100
Message-Id: <20220207064147.9585-2-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207064147.9585-1-jgross@suse.com>
References: <20220207064147.9585-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today tools/include contains two basically identical header files
generated from the same source. They just differ by the used name space
and they are being generated from different Makefiles via a perl
script.

Prepare to have only one such header by using a more generic namespace
"XEN" for _xen_list.h.

As the original header hasn't been updated in the Xen tree since its
introduction about 10 years ago, and the updates of FreeBSD side have
mostly covered BSD internal debugging aids, just don't generate the
new header during build, especially as using the current FreeBSD
version of the file would require some updates of the perl script,
which are potentially more work than just doing the needed editing by
hand. Additionally this enables to remove the not needed debugging
extensions of FreeBSD.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/include/Makefile    |   2 +
 tools/include/_xen_list.h | 509 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 511 insertions(+)
 create mode 100644 tools/include/_xen_list.h

diff --git a/tools/include/Makefile b/tools/include/Makefile
index d7b51006e0..d965987f55 100644
--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -70,11 +70,13 @@ install: all
 	$(INSTALL_DATA) xen/io/*.h $(DESTDIR)$(includedir)/xen/io
 	$(INSTALL_DATA) xen/sys/*.h $(DESTDIR)$(includedir)/xen/sys
 	$(INSTALL_DATA) xen/xsm/*.h $(DESTDIR)$(includedir)/xen/xsm
+	$(INSTALL_DATA) _xen_list.h $(DESTDIR)$(includedir)
 
 .PHONY: uninstall
 uninstall:
 	echo "[FIXME] uninstall headers"
 	rm -rf $(DESTDIR)$(includedir)/xen
+	rm -f $(DESTDIR)$(includedir)/_xen_list.h
 
 .PHONY: clean
 clean:
diff --git a/tools/include/_xen_list.h b/tools/include/_xen_list.h
new file mode 100644
index 0000000000..ce246f95c9
--- /dev/null
+++ b/tools/include/_xen_list.h
@@ -0,0 +1,509 @@
+/*-
+ * Copyright (c) 1991, 1993
+ *	The Regents of the University of California.  All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ * 4. Neither the name of the University nor the names of its contributors
+ *    may be used to endorse or promote products derived from this software
+ *    without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
+ * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
+ * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+ * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+ * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+ * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+ * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+ * SUCH DAMAGE.
+ *
+ *	@(#)queue.h	8.5 (Berkeley) 8/20/94
+ * $FreeBSD$
+ */
+
+#ifndef XEN__SYS_QUEUE_H_
+#define	XEN__SYS_QUEUE_H_
+
+/* #include <sys/cdefs.h> */
+
+/*
+ * This file defines four types of data structures: singly-linked lists,
+ * singly-linked tail queues, lists and tail queues.
+ *
+ * A singly-linked list is headed by a single forward pointer. The elements
+ * are singly linked for minimum space and pointer manipulation overhead at
+ * the expense of O(n) removal for arbitrary elements. New elements can be
+ * added to the list after an existing element or at the head of the list.
+ * Elements being removed from the head of the list should use the explicit
+ * macro for this purpose for optimum efficiency. A singly-linked list may
+ * only be traversed in the forward direction.  Singly-linked lists are ideal
+ * for applications with large datasets and few or no removals or for
+ * implementing a LIFO queue.
+ *
+ * A singly-linked tail queue is headed by a pair of pointers, one to the
+ * head of the list and the other to the tail of the list. The elements are
+ * singly linked for minimum space and pointer manipulation overhead at the
+ * expense of O(n) removal for arbitrary elements. New elements can be added
+ * to the list after an existing element, at the head of the list, or at the
+ * end of the list. Elements being removed from the head of the tail queue
+ * should use the explicit macro for this purpose for optimum efficiency.
+ * A singly-linked tail queue may only be traversed in the forward direction.
+ * Singly-linked tail queues are ideal for applications with large datasets
+ * and few or no removals or for implementing a FIFO queue.
+ *
+ * A list is headed by a single forward pointer (or an array of forward
+ * pointers for a hash table header). The elements are doubly linked
+ * so that an arbitrary element can be removed without a need to
+ * traverse the list. New elements can be added to the list before
+ * or after an existing element or at the head of the list. A list
+ * may only be traversed in the forward direction.
+ *
+ * A tail queue is headed by a pair of pointers, one to the head of the
+ * list and the other to the tail of the list. The elements are doubly
+ * linked so that an arbitrary element can be removed without a need to
+ * traverse the list. New elements can be added to the list before or
+ * after an existing element, at the head of the list, or at the end of
+ * the list. A tail queue may be traversed in either direction.
+ *
+ * For details on the use of these macros, see the queue(3) manual page.
+ *
+ *
+ *				XEN_SLIST	XEN_LIST	XEN_STAILQ	XEN_TAILQ
+ * _HEAD			+	+	+	+
+ * _HEAD_INITIALIZER		+	+	+	+
+ * _ENTRY			+	+	+	+
+ * _INIT			+	+	+	+
+ * _EMPTY			+	+	+	+
+ * _FIRST			+	+	+	+
+ * _NEXT			+	+	+	+
+ * _PREV			-	-	-	+
+ * _LAST			-	-	+	+
+ * _FOREACH			+	+	+	+
+ * _FOREACH_SAFE		+	+	+	+
+ * _FOREACH_REVERSE		-	-	-	+
+ * _FOREACH_REVERSE_SAFE	-	-	-	+
+ * _INSERT_HEAD			+	+	+	+
+ * _INSERT_BEFORE		-	+	-	+
+ * _INSERT_AFTER		+	+	+	+
+ * _INSERT_TAIL			-	-	+	+
+ * _CONCAT			-	-	+	+
+ * _REMOVE_AFTER		+	-	+	-
+ * _REMOVE_HEAD			+	-	+	-
+ * _REMOVE			+	+	+	+
+ * _SWAP			+	+	+	+
+ *
+ */
+
+/*
+ * Singly-linked List declarations.
+ */
+#define	XEN_SLIST_HEAD(name, type)					\
+struct name {								\
+	type *slh_first;	/* first element */			\
+}
+
+#define	XEN_SLIST_HEAD_INITIALIZER(head)				\
+	{ 0 }
+
+#define	XEN_SLIST_ENTRY(type)						\
+struct {								\
+	type *sle_next;	/* next element */				\
+}
+
+/*
+ * Singly-linked List functions.
+ */
+#define	XEN_SLIST_EMPTY(head)	((head)->slh_first == 0)
+
+#define	XEN_SLIST_FIRST(head)	((head)->slh_first)
+
+#define	XEN_SLIST_FOREACH(var, head, field)				\
+	for ((var) = XEN_SLIST_FIRST((head));				\
+	    (var);							\
+	    (var) = XEN_SLIST_NEXT((var), field))
+
+#define	XEN_SLIST_FOREACH_SAFE(var, head, field, tvar)			\
+	for ((var) = XEN_SLIST_FIRST((head));				\
+	    (var) && ((tvar) = XEN_SLIST_NEXT((var), field), 1);	\
+	    (var) = (tvar))
+
+#define	XEN_SLIST_FOREACH_PREVPTR(var, varp, head, field)		\
+	for ((varp) = &XEN_SLIST_FIRST((head));				\
+	    ((var) = *(varp)) != 0;					\
+	    (varp) = &XEN_SLIST_NEXT((var), field))
+
+#define	XEN_SLIST_INIT(head) do {					\
+	XEN_SLIST_FIRST((head)) = 0;					\
+} while (0)
+
+#define	XEN_SLIST_INSERT_AFTER(slistelm, elm, field) do {		\
+	XEN_SLIST_NEXT((elm), field) = XEN_SLIST_NEXT((slistelm), field);\
+	XEN_SLIST_NEXT((slistelm), field) = (elm);			\
+} while (0)
+
+#define	XEN_SLIST_INSERT_HEAD(head, elm, field) do {			\
+	XEN_SLIST_NEXT((elm), field) = XEN_SLIST_FIRST((head));		\
+	XEN_SLIST_FIRST((head)) = (elm);				\
+} while (0)
+
+#define	XEN_SLIST_NEXT(elm, field)	((elm)->field.sle_next)
+
+#define	XEN_SLIST_REMOVE(head, elm, type, field) do {			\
+	if (XEN_SLIST_FIRST((head)) == (elm)) {				\
+		XEN_SLIST_REMOVE_HEAD((head), field);			\
+	}								\
+	else {								\
+		type *curelm = XEN_SLIST_FIRST((head));			\
+		while (XEN_SLIST_NEXT(curelm, field) != (elm))		\
+			curelm = XEN_SLIST_NEXT(curelm, field);		\
+		XEN_SLIST_REMOVE_AFTER(curelm, field);			\
+	}								\
+} while (0)
+
+#define XEN_SLIST_REMOVE_AFTER(elm, field) do {				\
+	XEN_SLIST_NEXT(elm, field) =					\
+	    XEN_SLIST_NEXT(XEN_SLIST_NEXT(elm, field), field);		\
+} while (0)
+
+#define	XEN_SLIST_REMOVE_HEAD(head, field) do {				\
+	XEN_SLIST_FIRST((head)) = XEN_SLIST_NEXT(XEN_SLIST_FIRST((head)), field);\
+} while (0)
+
+#define XEN_SLIST_SWAP(head1, head2, type) do {				\
+	type *swap_first = XEN_SLIST_FIRST(head1);			\
+	XEN_SLIST_FIRST(head1) = XEN_SLIST_FIRST(head2);		\
+	XEN_SLIST_FIRST(head2) = swap_first;				\
+} while (0)
+
+/*
+ * Singly-linked Tail queue declarations.
+ */
+#define	XEN_STAILQ_HEAD(name, type)					\
+struct name {								\
+	type *stqh_first;/* first element */				\
+	type **stqh_last;/* addr of last next element */		\
+}
+
+#define	XEN_STAILQ_HEAD_INITIALIZER(head)				\
+	{ 0, &(head).stqh_first }
+
+#define	XEN_STAILQ_ENTRY(type)						\
+struct {								\
+	type *stqe_next;	/* next element */			\
+}
+
+/*
+ * Singly-linked Tail queue functions.
+ */
+#define	XEN_STAILQ_CONCAT(head1, head2) do {				\
+	if (!XEN_STAILQ_EMPTY((head2))) {				\
+		*(head1)->stqh_last = (head2)->stqh_first;		\
+		(head1)->stqh_last = (head2)->stqh_last;		\
+		XEN_STAILQ_INIT((head2));				\
+	}								\
+} while (0)
+
+#define	XEN_STAILQ_EMPTY(head)	((head)->stqh_first == 0)
+
+#define	XEN_STAILQ_FIRST(head)	((head)->stqh_first)
+
+#define	XEN_STAILQ_FOREACH(var, head, field)				\
+	for((var) = XEN_STAILQ_FIRST((head));				\
+	   (var);							\
+	   (var) = XEN_STAILQ_NEXT((var), field))
+
+
+#define	XEN_STAILQ_FOREACH_SAFE(var, head, field, tvar)			\
+	for ((var) = XEN_STAILQ_FIRST((head));				\
+	    (var) && ((tvar) = XEN_STAILQ_NEXT((var), field), 1);	\
+	    (var) = (tvar))
+
+#define	XEN_STAILQ_INIT(head) do {					\
+	XEN_STAILQ_FIRST((head)) = 0;					\
+	(head)->stqh_last = &XEN_STAILQ_FIRST((head));			\
+} while (0)
+
+#define	XEN_STAILQ_INSERT_AFTER(head, tqelm, elm, field) do {		\
+	if ((XEN_STAILQ_NEXT((elm), field) = XEN_STAILQ_NEXT((tqelm), field)) == 0)\
+		(head)->stqh_last = &XEN_STAILQ_NEXT((elm), field);	\
+	XEN_STAILQ_NEXT((tqelm), field) = (elm);			\
+} while (0)
+
+#define	XEN_STAILQ_INSERT_HEAD(head, elm, field) do {			\
+	if ((XEN_STAILQ_NEXT((elm), field) = XEN_STAILQ_FIRST((head))) == 0)\
+		(head)->stqh_last = &XEN_STAILQ_NEXT((elm), field);	\
+	XEN_STAILQ_FIRST((head)) = (elm);				\
+} while (0)
+
+#define	XEN_STAILQ_INSERT_TAIL(head, elm, field) do {			\
+	XEN_STAILQ_NEXT((elm), field) = 0;				\
+	*(head)->stqh_last = (elm);					\
+	(head)->stqh_last = &XEN_STAILQ_NEXT((elm), field);		\
+} while (0)
+
+#define	XEN_STAILQ_LAST(head, type, field)				\
+	(XEN_STAILQ_EMPTY((head)) ?					\
+		0 :							\
+	        ((type *)(void *)					\
+		((char *)((head)->stqh_last) - offsetof(type, field))))
+
+#define	XEN_STAILQ_NEXT(elm, field)	((elm)->field.stqe_next)
+
+#define	XEN_STAILQ_REMOVE(head, elm, type, field) do {			\
+	if (XEN_STAILQ_FIRST((head)) == (elm)) {			\
+		XEN_STAILQ_REMOVE_HEAD((head), field);			\
+	}								\
+	else {								\
+		type *curelm = XEN_STAILQ_FIRST((head));		\
+		while (XEN_STAILQ_NEXT(curelm, field) != (elm))		\
+			curelm = XEN_STAILQ_NEXT(curelm, field);	\
+		XEN_STAILQ_REMOVE_AFTER(head, curelm, field);		\
+	}								\
+} while (0)
+
+#define XEN_STAILQ_REMOVE_AFTER(head, elm, field) do {			\
+	if ((XEN_STAILQ_NEXT(elm, field) =				\
+	     XEN_STAILQ_NEXT(XEN_STAILQ_NEXT(elm, field), field)) == 0)	\
+		(head)->stqh_last = &XEN_STAILQ_NEXT((elm), field);	\
+} while (0)
+
+#define	XEN_STAILQ_REMOVE_HEAD(head, field) do {			\
+	if ((XEN_STAILQ_FIRST((head)) =					\
+	     XEN_STAILQ_NEXT(XEN_STAILQ_FIRST((head)), field)) == 0)	\
+		(head)->stqh_last = &XEN_STAILQ_FIRST((head));		\
+} while (0)
+
+#define XEN_STAILQ_SWAP(head1, head2, type) do {			\
+	type *swap_first = XEN_STAILQ_FIRST(head1);			\
+	type **swap_last = (head1)->stqh_last;				\
+	XEN_STAILQ_FIRST(head1) = XEN_STAILQ_FIRST(head2);		\
+	(head1)->stqh_last = (head2)->stqh_last;			\
+	XEN_STAILQ_FIRST(head2) = swap_first;				\
+	(head2)->stqh_last = swap_last;					\
+	if (XEN_STAILQ_EMPTY(head1))					\
+		(head1)->stqh_last = &XEN_STAILQ_FIRST(head1);		\
+	if (XEN_STAILQ_EMPTY(head2))					\
+		(head2)->stqh_last = &XEN_STAILQ_FIRST(head2);		\
+} while (0)
+
+
+/*
+ * List declarations.
+ */
+#define	XEN_LIST_HEAD(name, type)					\
+struct name {								\
+	type *lh_first;	/* first element */				\
+}
+
+#define	XEN_LIST_HEAD_INITIALIZER(head)					\
+	{ 0 }
+
+#define	XEN_LIST_ENTRY(type)						\
+struct {								\
+	type *le_next;	/* next element */				\
+	type **le_prev;	/* address of previous next element */		\
+}
+
+/*
+ * List functions.
+ */
+
+#define	XEN_LIST_EMPTY(head)	((head)->lh_first == 0)
+
+#define	XEN_LIST_FIRST(head)	((head)->lh_first)
+
+#define	XEN_LIST_FOREACH(var, head, field)				\
+	for ((var) = XEN_LIST_FIRST((head));				\
+	    (var);							\
+	    (var) = XEN_LIST_NEXT((var), field))
+
+#define	XEN_LIST_FOREACH_SAFE(var, head, field, tvar)			\
+	for ((var) = XEN_LIST_FIRST((head));				\
+	    (var) && ((tvar) = XEN_LIST_NEXT((var), field), 1);		\
+	    (var) = (tvar))
+
+#define	XEN_LIST_INIT(head) do {					\
+	XEN_LIST_FIRST((head)) = 0;					\
+} while (0)
+
+#define	XEN_LIST_INSERT_AFTER(listelm, elm, field) do {			\
+	if ((XEN_LIST_NEXT((elm), field) = XEN_LIST_NEXT((listelm), field)) != 0)\
+		XEN_LIST_NEXT((listelm), field)->field.le_prev =	\
+		    &XEN_LIST_NEXT((elm), field);			\
+	XEN_LIST_NEXT((listelm), field) = (elm);			\
+	(elm)->field.le_prev = &XEN_LIST_NEXT((listelm), field);	\
+} while (0)
+
+#define	XEN_LIST_INSERT_BEFORE(listelm, elm, field) do {		\
+	(elm)->field.le_prev = (listelm)->field.le_prev;		\
+	XEN_LIST_NEXT((elm), field) = (listelm);			\
+	*(listelm)->field.le_prev = (elm);				\
+	(listelm)->field.le_prev = &XEN_LIST_NEXT((elm), field);	\
+} while (0)
+
+#define	XEN_LIST_INSERT_HEAD(head, elm, field) do {			\
+	if ((XEN_LIST_NEXT((elm), field) = XEN_LIST_FIRST((head))) != 0)\
+		XEN_LIST_FIRST((head))->field.le_prev = &XEN_LIST_NEXT((elm), field);\
+	XEN_LIST_FIRST((head)) = (elm);					\
+	(elm)->field.le_prev = &XEN_LIST_FIRST((head));			\
+} while (0)
+
+#define	XEN_LIST_NEXT(elm, field)	((elm)->field.le_next)
+
+#define	XEN_LIST_REMOVE(elm, field) do {				\
+	if (XEN_LIST_NEXT((elm), field) != 0)				\
+		XEN_LIST_NEXT((elm), field)->field.le_prev =		\
+		    (elm)->field.le_prev;				\
+	*(elm)->field.le_prev = XEN_LIST_NEXT((elm), field);		\
+} while (0)
+
+#define XEN_LIST_SWAP(head1, head2, type, field) do {			\
+	type *swap_tmp = XEN_LIST_FIRST((head1));			\
+	XEN_LIST_FIRST((head1)) = XEN_LIST_FIRST((head2));		\
+	XEN_LIST_FIRST((head2)) = swap_tmp;				\
+	if ((swap_tmp = XEN_LIST_FIRST((head1))) != 0)			\
+		swap_tmp->field.le_prev = &XEN_LIST_FIRST((head1));	\
+	if ((swap_tmp = XEN_LIST_FIRST((head2))) != 0)			\
+		swap_tmp->field.le_prev = &XEN_LIST_FIRST((head2));	\
+} while (0)
+
+/*
+ * Tail queue declarations.
+ */
+#define	XEN_TAILQ_HEAD(name, type)					\
+struct name {								\
+	type *tqh_first;	/* first element */			\
+	type **tqh_last;	/* addr of last next element */		\
+}
+
+#define	XEN_TAILQ_HEAD_INITIALIZER(head)				\
+	{ 0, &(head).tqh_first }
+
+#define	XEN_TAILQ_ENTRY(type)						\
+struct {								\
+	type *tqe_next;	/* next element */				\
+	type **tqe_prev;	/* address of previous next element */	\
+}
+
+/*
+ * Tail queue functions.
+ */
+
+#define	XEN_TAILQ_CONCAT(head1, head2, field) do {			\
+	if (!XEN_TAILQ_EMPTY(head2)) {					\
+		*(head1)->tqh_last = (head2)->tqh_first;		\
+		(head2)->tqh_first->field.tqe_prev = (head1)->tqh_last;	\
+		(head1)->tqh_last = (head2)->tqh_last;			\
+		XEN_TAILQ_INIT((head2));				\
+	}								\
+} while (0)
+
+#define	XEN_TAILQ_EMPTY(head)	((head)->tqh_first == 0)
+
+#define	XEN_TAILQ_FIRST(head)	((head)->tqh_first)
+
+#define	XEN_TAILQ_FOREACH(var, head, field)				\
+	for ((var) = XEN_TAILQ_FIRST((head));				\
+	    (var);							\
+	    (var) = XEN_TAILQ_NEXT((var), field))
+
+#define	XEN_TAILQ_FOREACH_SAFE(var, head, field, tvar)			\
+	for ((var) = XEN_TAILQ_FIRST((head));				\
+	    (var) && ((tvar) = XEN_TAILQ_NEXT((var), field), 1);	\
+	    (var) = (tvar))
+
+#define	XEN_TAILQ_FOREACH_REVERSE(var, head, headname, field)		\
+	for ((var) = XEN_TAILQ_LAST((head), headname);			\
+	    (var);							\
+	    (var) = XEN_TAILQ_PREV((var), headname, field))
+
+#define	XEN_TAILQ_FOREACH_REVERSE_SAFE(var, head, headname, field, tvar)	\
+	for ((var) = XEN_TAILQ_LAST((head), headname);			\
+	    (var) && ((tvar) = XEN_TAILQ_PREV((var), headname, field), 1);\
+	    (var) = (tvar))
+
+#define	XEN_TAILQ_INIT(head) do {					\
+	XEN_TAILQ_FIRST((head)) = 0;					\
+	(head)->tqh_last = &XEN_TAILQ_FIRST((head));			\
+} while (0)
+
+#define	XEN_TAILQ_INSERT_AFTER(head, listelm, elm, field) do {		\
+	if ((XEN_TAILQ_NEXT((elm), field) = XEN_TAILQ_NEXT((listelm), field)) != 0)\
+		XEN_TAILQ_NEXT((elm), field)->field.tqe_prev =		\
+		    &XEN_TAILQ_NEXT((elm), field);			\
+	else {								\
+		(head)->tqh_last = &XEN_TAILQ_NEXT((elm), field);	\
+	}								\
+	XEN_TAILQ_NEXT((listelm), field) = (elm);			\
+	(elm)->field.tqe_prev = &XEN_TAILQ_NEXT((listelm), field);	\
+} while (0)
+
+#define	XEN_TAILQ_INSERT_BEFORE(listelm, elm, field) do {		\
+	(elm)->field.tqe_prev = (listelm)->field.tqe_prev;		\
+	XEN_TAILQ_NEXT((elm), field) = (listelm);			\
+	*(listelm)->field.tqe_prev = (elm);				\
+	(listelm)->field.tqe_prev = &XEN_TAILQ_NEXT((elm), field);	\
+} while (0)
+
+#define	XEN_TAILQ_INSERT_HEAD(head, elm, field) do {			\
+	if ((XEN_TAILQ_NEXT((elm), field) = XEN_TAILQ_FIRST((head))) != 0)\
+		XEN_TAILQ_FIRST((head))->field.tqe_prev =		\
+		    &XEN_TAILQ_NEXT((elm), field);			\
+	else								\
+		(head)->tqh_last = &XEN_TAILQ_NEXT((elm), field);	\
+	XEN_TAILQ_FIRST((head)) = (elm);				\
+	(elm)->field.tqe_prev = &XEN_TAILQ_FIRST((head));		\
+} while (0)
+
+#define	XEN_TAILQ_INSERT_TAIL(head, elm, field) do {			\
+	XEN_TAILQ_NEXT((elm), field) = 0;				\
+	(elm)->field.tqe_prev = (head)->tqh_last;			\
+	*(head)->tqh_last = (elm);					\
+	(head)->tqh_last = &XEN_TAILQ_NEXT((elm), field);		\
+} while (0)
+
+#define	XEN_TAILQ_LAST(head, headname)					\
+	(*(((struct headname *)((head)->tqh_last))->tqh_last))
+
+#define	XEN_TAILQ_NEXT(elm, field) ((elm)->field.tqe_next)
+
+#define	XEN_TAILQ_PREV(elm, headname, field)				\
+	(*(((struct headname *)((elm)->field.tqe_prev))->tqh_last))
+
+#define	XEN_TAILQ_REMOVE(head, elm, field) do {				\
+	if ((XEN_TAILQ_NEXT((elm), field)) != 0)			\
+		XEN_TAILQ_NEXT((elm), field)->field.tqe_prev =		\
+		    (elm)->field.tqe_prev;				\
+	else {								\
+		(head)->tqh_last = (elm)->field.tqe_prev;		\
+	}								\
+	*(elm)->field.tqe_prev = XEN_TAILQ_NEXT((elm), field);		\
+} while (0)
+
+#define XEN_TAILQ_SWAP(head1, head2, type, field) do {			\
+	type *swap_first = (head1)->tqh_first;				\
+	type **swap_last = (head1)->tqh_last;				\
+	(head1)->tqh_first = (head2)->tqh_first;			\
+	(head1)->tqh_last = (head2)->tqh_last;				\
+	(head2)->tqh_first = swap_first;				\
+	(head2)->tqh_last = swap_last;					\
+	if ((swap_first = (head1)->tqh_first) != 0)			\
+		swap_first->field.tqe_prev = &(head1)->tqh_first;	\
+	else								\
+		(head1)->tqh_last = &(head1)->tqh_first;		\
+	if ((swap_first = (head2)->tqh_first) != 0)			\
+		swap_first->field.tqe_prev = &(head2)->tqh_first;	\
+	else								\
+		(head2)->tqh_last = &(head2)->tqh_first;		\
+} while (0)
+
+#endif /* !XEN__SYS_QUEUE_H_ */
-- 
2.34.1


