Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB28F5A7569
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 07:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395179.635013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFv9-0000TW-SA; Wed, 31 Aug 2022 05:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395179.635013; Wed, 31 Aug 2022 05:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFv9-0000Hu-2P; Wed, 31 Aug 2022 05:05:47 +0000
Received: by outflank-mailman (input) for mailman id 395179;
 Tue, 30 Aug 2022 21:49:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2RAu=ZC=flex--surenb.bounces.google.com=3-IUOYwYKCV0NPM9I6BJJBG9.7JHS9I-89Q9GGDNON.S9IKMJE97O.JMB@srs-se1.protection.inumbo.net>)
 id 1oT97C-0008Cd-LC
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 21:49:46 +0000
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [2607:f8b0:4864:20::1149])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a93c329c-28ad-11ed-bd2e-47488cf2e6aa;
 Tue, 30 Aug 2022 23:49:45 +0200 (CEST)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-340c6cfc388so139162587b3.20
 for <xen-devel@lists.xenproject.org>; Tue, 30 Aug 2022 14:49:45 -0700 (PDT)
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
X-Inumbo-ID: a93c329c-28ad-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=6wmSIFSfHrn7NaG14r3E9vE6XZmoNzeOL4K0xpw9Sss=;
        b=U5dHm0ISPIOLMTxnmdJQWXA78Rd17S+5/1lv6jv1jaCvgl2EQMbJ9rsmgDNdrDNInX
         r6k/9wVO8+G1D9fLXaRbQ+fgsHGPVnRmhDau0Jf/al55Nd9kk7GQ20qWjTwu8vglhLE+
         3PiRhO95cWm0bgNaWlaQf68qN6Xl56a4Ea06ODeuAoBkBLBVNj2p2wKR1fVJamPhQROd
         m/J25psoHq4bGP+9+2UOdK5IJRKeT6PJER8/+rdWAJbYTakEyRla+xNdK6dgdf+KYmis
         CkIEz6UMG+Lc5WuSZw5HpKbNBdk17ykSRPGJ6mFMzPJalO+24uoHVv3eVDTzjtfYfPny
         H4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=6wmSIFSfHrn7NaG14r3E9vE6XZmoNzeOL4K0xpw9Sss=;
        b=vTTfOlXooNa8seEgOtiyczQ5qceJnmW9LtIHMUdN3Jcuii0s8/Z4JDxBB3wPH2dWkE
         HGkb9QB33dGljUJOvktufzuBq3PiZ+kAvxVrjHsEPFxyP9MsIgFCad5iAf58OhTymicH
         o+EGq32VgluoK6+Qp2CeJ1OVl2svA/RHOKB60n5MEvhJcVt2hsZf8otvEf/84aSeq24h
         /OFipC6vtsiLcoEuHZmoDx58baUT/UQZncW/79znkKyRo+hbRG/ZUrXp6CtI3W9tFx2A
         l0JWbAqxQbDh210thActrB4Jy5i2dYHhu4CLQBZgWWiYX2Wogw0jx2RzcQ5SconFCnN7
         D9BA==
X-Gm-Message-State: ACgBeo2o0iILYq2hfPNARaLK4K0sb6Tm1HrrXOXQT91MWZiTcyG2ePbT
	6UXBYi3mfP3MOIbnrPcNSQ0/JltKHBw=
X-Google-Smtp-Source: AA6agR7ZicVg+8FFu5BCSLxIsHS/72reGV/Sx3q1E28zgHvzeDh99UkhDovyJoKjdHzkG5X9TjhbL9HgAEQ=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:a005:55b3:6c26:b3e4])
 (user=surenb job=sendgmr) by 2002:a81:47c4:0:b0:341:2cab:a63c with SMTP id
 u187-20020a8147c4000000b003412caba63cmr8994715ywa.58.1661896184744; Tue, 30
 Aug 2022 14:49:44 -0700 (PDT)
Date: Tue, 30 Aug 2022 14:48:57 -0700
In-Reply-To: <20220830214919.53220-1-surenb@google.com>
Mime-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220830214919.53220-9-surenb@google.com>
Subject: [RFC PATCH 08/30] lib: introduce page allocation tagging
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com, 
	ldufour@linux.ibm.com, peterx@redhat.com, david@redhat.com, axboe@kernel.dk, 
	mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
	changbin.du@intel.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, arnd@arndb.de, jbaron@akamai.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	surenb@google.com, kernel-team@android.com, linux-mm@kvack.org, 
	iommu@lists.linux.dev, kasan-dev@googlegroups.com, io-uring@vger.kernel.org, 
	linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Introduce CONFIG_PAGE_ALLOC_TAGGING which provides helper functions to
easily instrument page allocators and adds a page_ext field to store a
pointer to the allocation tag associated with the code that allocated
the page.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Co-developed-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
---
 include/linux/pgalloc_tag.h | 28 ++++++++++++++++++++++++++++
 lib/Kconfig.debug           | 11 +++++++++++
 lib/Makefile                |  1 +
 lib/pgalloc_tag.c           | 22 ++++++++++++++++++++++
 mm/page_ext.c               |  6 ++++++
 5 files changed, 68 insertions(+)
 create mode 100644 include/linux/pgalloc_tag.h
 create mode 100644 lib/pgalloc_tag.c

diff --git a/include/linux/pgalloc_tag.h b/include/linux/pgalloc_tag.h
new file mode 100644
index 000000000000..f525abfe51d4
--- /dev/null
+++ b/include/linux/pgalloc_tag.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * page allocation tagging
+ */
+#ifndef _LINUX_PGALLOC_TAG_H
+#define _LINUX_PGALLOC_TAG_H
+
+#include <linux/alloc_tag.h>
+#include <linux/page_ext.h>
+
+extern struct page_ext_operations page_alloc_tagging_ops;
+struct page_ext *lookup_page_ext(const struct page *page);
+
+static inline union codetag_ref *get_page_tag_ref(struct page *page)
+{
+	struct page_ext *page_ext = lookup_page_ext(page);
+
+	return page_ext ? (void *)page_ext + page_alloc_tagging_ops.offset
+			: NULL;
+}
+
+static inline void pgalloc_tag_dec(struct page *page, unsigned int order)
+{
+	if (page)
+		alloc_tag_sub(get_page_tag_ref(page), PAGE_SIZE << order);
+}
+
+#endif /* _LINUX_PGALLOC_TAG_H */
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 795bf6993f8a..6686648843b3 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -978,6 +978,17 @@ config ALLOC_TAGGING
 	select CODE_TAGGING
 	select LAZY_PERCPU_COUNTER
 
+config PAGE_ALLOC_TAGGING
+	bool "Enable page allocation tagging"
+	default n
+	select ALLOC_TAGGING
+	select PAGE_EXTENSION
+	help
+	  Instrument page allocators to track allocation source code and
+	  collect statistics on the number of allocations and their total size
+	  initiated at that code location. The mechanism can be used to track
+	  memory leaks with a low performance impact.
+
 source "lib/Kconfig.kasan"
 source "lib/Kconfig.kfence"
 
diff --git a/lib/Makefile b/lib/Makefile
index dc00533fc5c8..99f732156673 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -229,6 +229,7 @@ obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 
 obj-$(CONFIG_CODE_TAGGING) += codetag.o
 obj-$(CONFIG_ALLOC_TAGGING) += alloc_tag.o
+obj-$(CONFIG_PAGE_ALLOC_TAGGING) += pgalloc_tag.o
 
 lib-$(CONFIG_GENERIC_BUG) += bug.o
 
diff --git a/lib/pgalloc_tag.c b/lib/pgalloc_tag.c
new file mode 100644
index 000000000000..7d97372ca0df
--- /dev/null
+++ b/lib/pgalloc_tag.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/pgalloc_tag.h>
+#include <linux/seq_file.h>
+
+static __init bool need_page_alloc_tagging(void)
+{
+	return true;
+}
+
+static __init void init_page_alloc_tagging(void)
+{
+}
+
+struct page_ext_operations page_alloc_tagging_ops = {
+	.size = sizeof(union codetag_ref),
+	.need = need_page_alloc_tagging,
+	.init = init_page_alloc_tagging,
+};
+EXPORT_SYMBOL(page_alloc_tagging_ops);
+
diff --git a/mm/page_ext.c b/mm/page_ext.c
index 3dc715d7ac29..a22f514ff4da 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -9,6 +9,7 @@
 #include <linux/page_owner.h>
 #include <linux/page_idle.h>
 #include <linux/page_table_check.h>
+#include <linux/pgalloc_tag.h>
 
 /*
  * struct page extension
@@ -76,6 +77,9 @@ static struct page_ext_operations *page_ext_ops[] __initdata = {
 #if defined(CONFIG_PAGE_IDLE_FLAG) && !defined(CONFIG_64BIT)
 	&page_idle_ops,
 #endif
+#ifdef CONFIG_PAGE_ALLOC_TAGGING
+	&page_alloc_tagging_ops,
+#endif
 #ifdef CONFIG_PAGE_TABLE_CHECK
 	&page_table_check_ops,
 #endif
@@ -152,6 +156,7 @@ struct page_ext *lookup_page_ext(const struct page *page)
 					MAX_ORDER_NR_PAGES);
 	return get_entry(base, index);
 }
+EXPORT_SYMBOL(lookup_page_ext);
 
 static int __init alloc_node_page_ext(int nid)
 {
@@ -221,6 +226,7 @@ struct page_ext *lookup_page_ext(const struct page *page)
 		return NULL;
 	return get_entry(section->page_ext, pfn);
 }
+EXPORT_SYMBOL(lookup_page_ext);
 
 static void *__meminit alloc_page_ext(size_t size, int nid)
 {
-- 
2.37.2.672.g94769d06f0-goog


