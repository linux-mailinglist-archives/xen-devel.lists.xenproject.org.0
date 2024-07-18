Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4417B9350E7
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 18:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760594.1170494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUJI-0007lx-Fz; Thu, 18 Jul 2024 16:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760594.1170494; Thu, 18 Jul 2024 16:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUJI-0007hK-90; Thu, 18 Jul 2024 16:48:52 +0000
Received: by outflank-mailman (input) for mailman id 760594;
 Thu, 18 Jul 2024 16:48:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AEHZ=OS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sUUJG-0007PV-UA
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 16:48:50 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bc77dde-4525-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 18:48:50 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52ea79e6979so731745e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 09:48:50 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc820f2bsm576882466b.206.2024.07.18.09.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 09:48:48 -0700 (PDT)
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
X-Inumbo-ID: 9bc77dde-4525-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721321329; x=1721926129; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xuo7u/zXkhIBsvPwcy6H4PeF57mIJAldQoYHTVo90WI=;
        b=mflds8n3s2rRfb4Muk97juUZW++hDeYqlmL84wvRmuj3kKD2GhAoddkNCgl1PkapCf
         R+A6G2LDlOttVd8I7OenmyiCAOR6+WEH0zgwf6x7IrVMEVYhS1yqjSMrJR6GENkhpGcG
         sLINNTRKGkPn0kdTjZXorA3SXXEU833lPcpVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721321329; x=1721926129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xuo7u/zXkhIBsvPwcy6H4PeF57mIJAldQoYHTVo90WI=;
        b=UEKH17Zn7FnN9TdZ0G+accpKZbScqOvGjq3d88OKb3rP7IMWRlJR1p4gT1qWr0imJe
         Ah/JviVT9fAb/KNfzm00T03K7d3dpF+h9sb3eIR9yBnqVzWcq9afR/fZzp/xQ6Q0oglQ
         gJDAam9SIntDWVruMRN5EKHqubMiuhXnyHWbFKuIMLWbNAtVMrEYvsUUcPnvGDXY+Fm7
         Qb58kNhOhrS/w0uULJQFBhpPe9MFiYnXEQQLYm7D4NK2KpA4fVi8pRNt5Jh9IobEwTKS
         rFqVvdtZXugHbzelT6cjqKQgU2EI3sEFJQVuTiSeehRQirjVX69Q1XSRkQ+ysw8HfkIE
         JJ+g==
X-Gm-Message-State: AOJu0YyIWj+05o5FZ5gqESj5+1bg5gdJcdsRtPnPb5i+CR82u94EwP1K
	kH7V6RSmzW6fRaEykhZlnVUZpMQBMgDAzFD6xz9bZS5VlYCng5pvwDcBRjPd21hrcjLHc1JvEXS
	9
X-Google-Smtp-Source: AGHT+IH+I4nN2nmQzuvSuwTsqBxTrwMpY51AkGdJw+JG371v4KDIMQo1MbwaSewsmi5uAI1yd9joww==
X-Received: by 2002:a05:6512:3ba8:b0:52c:dfe1:44ea with SMTP id 2adb3069b0e04-52ee53a2502mr4486308e87.6.1721321328990;
        Thu, 18 Jul 2024 09:48:48 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 3/6] tools/libxs: Rationalise the definition of struct xs_handle
Date: Thu, 18 Jul 2024 17:48:39 +0100
Message-Id: <20240718164842.3650702-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Right now there are two completely different struct xs_handle definitions,
depend on #ifdef USE_PTHREAD.  One is especially well hidden, and often
escapes updates.

Rework struct xs_handle using some interior ifdefary.  It's slightly longer,
but much easier to follow.  Importanly, this makes it much harder to forget
the !PTHREAD case when adding a "common" variable.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
---
 tools/libs/store/xs.c | 77 +++++++++++++++++++++----------------------
 1 file changed, 37 insertions(+), 40 deletions(-)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index 1b5a913a1594..96ea2b192924 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -40,6 +40,14 @@
 #include <xentoolcore_internal.h>
 #include <xen_list.h>
 
+#ifdef USE_PTHREAD
+# include <pthread.h>
+#endif
+
+#ifdef USE_DLSYM
+# include <dlfcn.h>
+#endif
+
 #ifndef O_CLOEXEC
 #define O_CLOEXEC 0
 #endif
@@ -54,14 +62,6 @@ struct xs_stored_msg {
 	char *body;
 };
 
-#ifdef USE_PTHREAD
-
-#include <pthread.h>
-
-#ifdef USE_DLSYM
-#include <dlfcn.h>
-#endif
-
 struct xs_handle {
 	/* Communications channel to xenstore daemon. */
 	int fd;
@@ -71,16 +71,20 @@ struct xs_handle {
          * A read thread which pulls messages off the comms channel and
          * signals waiters.
          */
+#ifdef USE_PTHREAD
 	pthread_t read_thr;
 	int read_thr_exists;
+#endif
 
 	/*
          * A list of fired watch messages, protected by a mutex. Users can
          * wait on the conditional variable until a watch is pending.
          */
 	XEN_TAILQ_HEAD(, struct xs_stored_msg) watch_list;
+#ifdef USE_PTHREAD
 	pthread_mutex_t watch_mutex;
 	pthread_cond_t watch_condvar;
+#endif
 
 	/* Clients can select() on this pipe to wait for a watch to fire. */
 	int watch_pipe[2];
@@ -93,6 +97,7 @@ struct xs_handle {
          * conditional variable for its response.
          */
 	XEN_TAILQ_HEAD(, struct xs_stored_msg) reply_list;
+#ifdef USE_PTHREAD
 	pthread_mutex_t reply_mutex;
 	pthread_cond_t reply_condvar;
 
@@ -112,55 +117,47 @@ struct xs_handle {
 	 *     reply_mutex
 	 *     watch_mutex
 	 */
+#endif
 };
 
-#define mutex_lock(m)		pthread_mutex_lock(m)
-#define mutex_unlock(m)		pthread_mutex_unlock(m)
-#define condvar_signal(c)	pthread_cond_signal(c)
-#define condvar_wait(c,m)	pthread_cond_wait(c,m)
-#define cleanup_push(f, a)	\
-    pthread_cleanup_push((void (*)(void *))(f), (void *)(a))
+
+#ifdef USE_PTHREAD
+
+# define mutex_lock(m)             pthread_mutex_lock(m)
+# define mutex_unlock(m)           pthread_mutex_unlock(m)
+# define condvar_signal(c)         pthread_cond_signal(c)
+# define condvar_wait(c, m)        pthread_cond_wait(c, m)
+# define cleanup_push(f, a)        pthread_cleanup_push((void (*)(void *))(f), (void *)(a))
 /*
  * Some definitions of pthread_cleanup_pop() are a macro starting with an
  * end-brace. GCC then complains if we immediately precede that with a label.
  * Hence we insert a dummy statement to appease the compiler in this situation.
  */
-#define cleanup_pop(run)        ((void)0); pthread_cleanup_pop(run)
+# define cleanup_pop(run)          ((void)0); pthread_cleanup_pop(run)
 
-#define read_thread_exists(h)	(h->read_thr_exists)
+# define read_thread_exists(h)     ((h)->read_thr_exists)
 
 /* Because pthread_cleanup_p* are not available when USE_PTHREAD is
  * disabled, use these macros which convert appropriately. */
-#define cleanup_push_heap(p)        cleanup_push(free, p)
-#define cleanup_pop_heap(run, p)    cleanup_pop((run))
+# define cleanup_push_heap(p)      cleanup_push(free, p)
+# define cleanup_pop_heap(run, p)  cleanup_pop((run))
 
 static void *read_thread(void *arg);
 
-#else /* !defined(USE_PTHREAD) */
+#else /* USE_PTHREAD */
 
-struct xs_handle {
-	int fd;
-	Xentoolcore__Active_Handle tc_ah; /* for restrict */
-	XEN_TAILQ_HEAD(, struct xs_stored_msg) reply_list;
-	XEN_TAILQ_HEAD(, struct xs_stored_msg) watch_list;
-	/* Clients can select() on this pipe to wait for a watch to fire. */
-	int watch_pipe[2];
-	/* Filtering watch event in unwatch function? */
-	bool unwatch_filter;
-};
+# define mutex_lock(m)               ((void)0)
+# define mutex_unlock(m)             ((void)0)
+# define condvar_signal(c)           ((void)0)
+# define condvar_wait(c, m)          ((void)0)
+# define cleanup_push(f, a)          ((void)0)
+# define cleanup_pop(run)            ((void)0)
+# define read_thread_exists(h)       (0)
+# define cleanup_push_heap(p)        ((void)0)
+# define cleanup_pop_heap(run, p)    do { if ((run)) free(p); } while(0)
 
-#define mutex_lock(m)		((void)0)
-#define mutex_unlock(m)		((void)0)
-#define condvar_signal(c)	((void)0)
-#define condvar_wait(c,m)	((void)0)
-#define cleanup_push(f, a)	((void)0)
-#define cleanup_pop(run)	((void)0)
-#define read_thread_exists(h)	(0)
+#endif /* !USE_PTHREAD */
 
-#define cleanup_push_heap(p)        ((void)0)
-#define cleanup_pop_heap(run, p)    do { if ((run)) free(p); } while(0)
-
-#endif
 
 static int read_message(struct xs_handle *h, int nonblocking);
 
-- 
2.39.2


