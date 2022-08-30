Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 472F55A7566
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 07:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395197.635103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFvM-0003CO-St; Wed, 31 Aug 2022 05:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395197.635103; Wed, 31 Aug 2022 05:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFvK-0002hl-D7; Wed, 31 Aug 2022 05:05:58 +0000
Received: by outflank-mailman (input) for mailman id 395197;
 Tue, 30 Aug 2022 21:50:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7ELB=ZC=flex--surenb.bounces.google.com=3EIYOYwYKCXUlnkXgUZhhZeX.VhfqXg-WXoXeeblml.qXgikhcXVm.hkZ@srs-se1.protection.inumbo.net>)
 id 1oT97b-0008CX-2n
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 21:50:11 +0000
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [2607:f8b0:4864:20::b49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7d0832b-28ad-11ed-a60c-1f1ba7de4fb0;
 Tue, 30 Aug 2022 23:50:10 +0200 (CEST)
Received: by mail-yb1-xb49.google.com with SMTP id
 i194-20020a253bcb000000b00676d86fc5d7so709137yba.9
 for <xen-devel@lists.xenproject.org>; Tue, 30 Aug 2022 14:50:10 -0700 (PDT)
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
X-Inumbo-ID: b7d0832b-28ad-11ed-a60c-1f1ba7de4fb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=PaZc/ErQmIz9CmZWuOwZKmMvFAFDhrfR0u4+oqULyqs=;
        b=hebs9Ab4jQ13PLVsrCINOWSpgoH5EATUTa9Cks3Eg1nmkxH7qE2oRwCx7AF5BNZXTH
         AHzIFQ24Or2oJnVcja+AOnCs2XgXBCldmNcsagLkjdyOLpIpceU0bsUf62DWg4fCi92e
         s30PWdmXxABwFMNU1JgUL6Fp0h2PBQ5hgdc0oQExPZeqJt/0xfqCgMF0cTxAmuBThoZJ
         frR4uwNwpRrRdJWEew4t7LzoFroWP+hLZBEH0mT+P1Yv4GgQEDG37uiXZMEF+0m6Voke
         PgoPiZ8qXrLB1DY6fUVv3gddg9c6Rea7O2e0xIyCiy2p7GROj3EzsKBaYmh74I5z0+5s
         1/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=PaZc/ErQmIz9CmZWuOwZKmMvFAFDhrfR0u4+oqULyqs=;
        b=NTUkR0l+WuB1rHvoIscsvqR5fAe0NsJYEl4sdyCUP2RUkLQvaueG/U13jcYZVvc+dn
         ZzFN/FvvSL1k10y+i9IJPT2H5BYROAzeq+UtXIRdd+4LyfW16bFQd0PJSgqbK2sXFhM/
         VrEcv0kdgVrAgxOj8JMMTGJcAmIGpZbffgKcWGM7OT6kHwsdidqEfrP5JYgzLiPeUSOZ
         2+xM2HoRgKG7/StgpEH21ORjRGVC242s7iXcFnaTMbxABWEBJXmg18nMW/2ZM5Qi2Dc7
         HIP2gILZMzBvhZtBRg74DWWDWuN5olXfREjyPvzI8E7kHH+PRyhccH/T0WZsOLXkvfia
         EhlA==
X-Gm-Message-State: ACgBeo2Umo0NITODL8iKozqj5kzFOEDXQQgy/HONfWyQzifNUxsoUqsD
	F+c5jBBoESTTenRdQnvv5IEBjxHRRXM=
X-Google-Smtp-Source: AA6agR60bKzipuEg+9xXy+Pee21QZvBbTBPOhKhJO0fVzuHKtaTXE6dCUM7Zh4tN5bptU+EiRysnFAQW6po=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:a005:55b3:6c26:b3e4])
 (user=surenb job=sendgmr) by 2002:a25:31d5:0:b0:677:28b:1451 with SMTP id
 x204-20020a2531d5000000b00677028b1451mr13217805ybx.437.1661896208990; Tue, 30
 Aug 2022 14:50:08 -0700 (PDT)
Date: Tue, 30 Aug 2022 14:49:06 -0700
In-Reply-To: <20220830214919.53220-1-surenb@google.com>
Mime-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220830214919.53220-18-surenb@google.com>
Subject: [RFC PATCH 17/30] lib/string.c: strsep_no_empty()
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

From: Kent Overstreet <kent.overstreet@linux.dev>

This adds a new helper which is like strsep, except that it skips empty
tokens.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
---
 include/linux/string.h |  1 +
 lib/string.c           | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index 61ec7e4f6311..b950ac9cfa56 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -96,6 +96,7 @@ extern char * strpbrk(const char *,const char *);
 #ifndef __HAVE_ARCH_STRSEP
 extern char * strsep(char **,const char *);
 #endif
+extern char *strsep_no_empty(char **, const char *);
 #ifndef __HAVE_ARCH_STRSPN
 extern __kernel_size_t strspn(const char *,const char *);
 #endif
diff --git a/lib/string.c b/lib/string.c
index 6f334420f687..6939f5b751f2 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -596,6 +596,25 @@ char *strsep(char **s, const char *ct)
 EXPORT_SYMBOL(strsep);
 #endif
 
+/**
+ * strsep_no_empt - Split a string into tokens, but don't return empty tokens
+ * @s: The string to be searched
+ * @ct: The characters to search for
+ *
+ * strsep() updates @s to point after the token, ready for the next call.
+ */
+char *strsep_no_empty(char **s, const char *ct)
+{
+	char *ret;
+
+	do {
+		ret = strsep(s, ct);
+	} while (ret && !*ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(strsep_no_empty);
+
 #ifndef __HAVE_ARCH_MEMSET
 /**
  * memset - Fill a region of memory with the given value
-- 
2.37.2.672.g94769d06f0-goog


