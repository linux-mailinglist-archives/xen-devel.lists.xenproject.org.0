Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 342BB5A7564
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 07:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395175.634994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFv8-00005C-AN; Wed, 31 Aug 2022 05:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395175.634994; Wed, 31 Aug 2022 05:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFv7-0008Ff-SM; Wed, 31 Aug 2022 05:05:45 +0000
Received: by outflank-mailman (input) for mailman id 395175;
 Tue, 30 Aug 2022 21:49:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sd60=ZC=flex--surenb.bounces.google.com=384UOYwYKCVgIKH4D16EE6B4.2ECN4D-34L4BB8IJI.N4DFHE942J.EH6@srs-se1.protection.inumbo.net>)
 id 1oT977-0008CX-BV
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 21:49:41 +0000
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [2607:f8b0:4864:20::114a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a600e262-28ad-11ed-a60c-1f1ba7de4fb0;
 Tue, 30 Aug 2022 23:49:40 +0200 (CEST)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-340e618b145so120878437b3.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Aug 2022 14:49:40 -0700 (PDT)
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
X-Inumbo-ID: a600e262-28ad-11ed-a60c-1f1ba7de4fb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=98WyT1z35HcvSKL2J7VN7g/2jl2Mia82SjRaCpg7p/8=;
        b=ppQwolWM0xAnRwum2KKY24m6a3yzqCKoXnrVhpHLwdzhEX68q/9GWwURRXRAJwAXGE
         4hx2+McVJ/jsyFytRFbe+OPGYzeVEhiv30wYy3Dbv2te49LJhVOTWhRl89blVyPEgJ5w
         k3Kn066cwQfYjgsoqDMdWYBFuCQId3TWaakWpKvAmlWCCQJJyDWDc/PSlpx9kgm9lJqq
         PzMv/4CnJ/6J/uOAkl+MbChdqUZ3xBMeEP2NgbSdh/KBp25WeMEzsbU/mEvRjqtr/S/B
         +8o+9cRhHtG5HXvPx6nUDeXaaa6TO2tjt+mMpb6RSrzIfgp9N/6Vm98rkMF4T4b9tOCX
         x/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=98WyT1z35HcvSKL2J7VN7g/2jl2Mia82SjRaCpg7p/8=;
        b=EF+hRNvTTlVH3bdw373Cru5rUdM7INtLHRnGuXg5IQH/N7Db5ViUP4KgFidGLNTtk3
         SRbCHoTyK271GmlGULC4U3bZLf7I25airMNJ7QDYR4T2SuO/s3l/Op7CWz6OEzQ5mdvz
         MRENcp1OKVJA9cQCLFJEiPBqFOBrC06ar/dCMk+93uVUi7yl6W7AXz9SqPWPmxhRkgOk
         qEM2eJdBNWfoE40+3aPauA6SnLzOwC+M3lahBenxEYLt7C+n2dAjG39ImKQikoYs3EdY
         tu7hD7eNcptK5dPMU4Kt8bFswFw+mBf+biusXDsLF3EQkSipGwcUhdN2tCcecLK038Ek
         0Kow==
X-Gm-Message-State: ACgBeo3aNvRRgi2ULbPyEwDMUtSVclTn3irmWHI5BwfTs4RKHcaCG9ur
	X+8p7MUs3B5JJggg8xvkZYACCHrhATo=
X-Google-Smtp-Source: AA6agR6q8iUNu3CLxqQx3h199RKUO7Cut/Mgh7jMzVJUDX7OllJVViu9/IZhn89ZbhwU0FUSjxhVMQRhhhM=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:a005:55b3:6c26:b3e4])
 (user=surenb job=sendgmr) by 2002:a05:6902:2cb:b0:684:aebe:49ab with SMTP id
 w11-20020a05690202cb00b00684aebe49abmr13690932ybh.242.1661896179352; Tue, 30
 Aug 2022 14:49:39 -0700 (PDT)
Date: Tue, 30 Aug 2022 14:48:55 -0700
In-Reply-To: <20220830214919.53220-1-surenb@google.com>
Mime-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220830214919.53220-7-surenb@google.com>
Subject: [RFC PATCH 06/30] lib: code tagging module support
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

Add support for code tagging from dynamically loaded modules.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Co-developed-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
---
 include/linux/codetag.h | 12 ++++++++++
 kernel/module/main.c    |  4 ++++
 lib/codetag.c           | 51 ++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/include/linux/codetag.h b/include/linux/codetag.h
index a9d7adecc2a5..386733e89b31 100644
--- a/include/linux/codetag.h
+++ b/include/linux/codetag.h
@@ -42,6 +42,10 @@ struct codetag_module {
 struct codetag_type_desc {
 	const char *section;
 	size_t tag_size;
+	void (*module_load)(struct codetag_type *cttype,
+			    struct codetag_module *cmod);
+	void (*module_unload)(struct codetag_type *cttype,
+			      struct codetag_module *cmod);
 };
 
 struct codetag_iterator {
@@ -68,4 +72,12 @@ void codetag_to_text(struct seq_buf *out, struct codetag *ct);
 struct codetag_type *
 codetag_register_type(const struct codetag_type_desc *desc);
 
+#ifdef CONFIG_CODE_TAGGING
+void codetag_load_module(struct module *mod);
+void codetag_unload_module(struct module *mod);
+#else
+static inline void codetag_load_module(struct module *mod) {}
+static inline void codetag_unload_module(struct module *mod) {}
+#endif
+
 #endif /* _LINUX_CODETAG_H */
diff --git a/kernel/module/main.c b/kernel/module/main.c
index a4e4d84b6f4e..d253277492fd 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -53,6 +53,7 @@
 #include <linux/bsearch.h>
 #include <linux/dynamic_debug.h>
 #include <linux/audit.h>
+#include <linux/codetag.h>
 #include <uapi/linux/module.h>
 #include "internal.h"
 
@@ -1151,6 +1152,7 @@ static void free_module(struct module *mod)
 {
 	trace_module_free(mod);
 
+	codetag_unload_module(mod);
 	mod_sysfs_teardown(mod);
 
 	/*
@@ -2849,6 +2851,8 @@ static int load_module(struct load_info *info, const char __user *uargs,
 	/* Get rid of temporary copy. */
 	free_copy(info, flags);
 
+	codetag_load_module(mod);
+
 	/* Done! */
 	trace_module_load(mod);
 
diff --git a/lib/codetag.c b/lib/codetag.c
index 7708f8388e55..f0a3174f9b71 100644
--- a/lib/codetag.c
+++ b/lib/codetag.c
@@ -157,8 +157,11 @@ static int codetag_module_init(struct codetag_type *cttype, struct module *mod)
 
 	down_write(&cttype->mod_lock);
 	err = idr_alloc(&cttype->mod_idr, cmod, 0, 0, GFP_KERNEL);
-	if (err >= 0)
+	if (err >= 0) {
 		cttype->count += range_size(cttype, &range);
+		if (cttype->desc.module_load)
+			cttype->desc.module_load(cttype, cmod);
+	}
 	up_write(&cttype->mod_lock);
 
 	if (err < 0) {
@@ -197,3 +200,49 @@ codetag_register_type(const struct codetag_type_desc *desc)
 
 	return cttype;
 }
+
+void codetag_load_module(struct module *mod)
+{
+	struct codetag_type *cttype;
+
+	if (!mod)
+		return;
+
+	mutex_lock(&codetag_lock);
+	list_for_each_entry(cttype, &codetag_types, link)
+		codetag_module_init(cttype, mod);
+	mutex_unlock(&codetag_lock);
+}
+
+void codetag_unload_module(struct module *mod)
+{
+	struct codetag_type *cttype;
+
+	if (!mod)
+		return;
+
+	mutex_lock(&codetag_lock);
+	list_for_each_entry(cttype, &codetag_types, link) {
+		struct codetag_module *found = NULL;
+		struct codetag_module *cmod;
+		unsigned long mod_id, tmp;
+
+		down_write(&cttype->mod_lock);
+		idr_for_each_entry_ul(&cttype->mod_idr, cmod, tmp, mod_id) {
+			if (cmod->mod && cmod->mod == mod) {
+				found = cmod;
+				break;
+			}
+		}
+		if (found) {
+			if (cttype->desc.module_unload)
+				cttype->desc.module_unload(cttype, cmod);
+
+			cttype->count -= range_size(cttype, &cmod->range);
+			idr_remove(&cttype->mod_idr, mod_id);
+			kfree(cmod);
+		}
+		up_write(&cttype->mod_lock);
+	}
+	mutex_unlock(&codetag_lock);
+}
-- 
2.37.2.672.g94769d06f0-goog


