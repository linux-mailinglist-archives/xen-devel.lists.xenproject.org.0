Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 967ED7DD175
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 17:22:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625961.975798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrVi-0002vu-UJ; Tue, 31 Oct 2023 16:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625961.975798; Tue, 31 Oct 2023 16:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrVi-0002st-Qk; Tue, 31 Oct 2023 16:22:34 +0000
Received: by outflank-mailman (input) for mailman id 625961;
 Tue, 31 Oct 2023 16:22:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L368=GN=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1qxrVh-0001Lp-Qy
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 16:22:33 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1f996a4-7809-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 17:22:33 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c5071165d5so35532461fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 09:22:33 -0700 (PDT)
Received: from z0rr0-Latitude-7490 ([2a01:e0a:257:8c60:c550:f26a:2ce9:e5df])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a05600c211300b004083a105f27sm2109641wml.26.2023.10.31.09.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 09:22:31 -0700 (PDT)
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
X-Inumbo-ID: b1f996a4-7809-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698769352; x=1699374152; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PbqnLiaYM/qismUJagY8WtP0Lsbpjpo6BS+NyjPaSIU=;
        b=fscKq6j1jJEXF/t8ZpM9tk4zKTRcuBq15xwTz1OAquiMWoUkRsAkjkejJKVHcfyVvE
         eHAtAHbpZib47z/07BAt4rdjLWK1WzcFDePXDpVwlUWex4h7XXfEEapMH8DqG8UL5js5
         GYrYrscnjpQq8fAALAqtsrBLEmpi9Mzp2o9WmcaynqhNlODc/SrFvLNV/5laPvvrAVPq
         N5rqFds4ApY6JkPliwyctvoI2qy6hYgiBHj3ozwE4/aebomN6aE73SgzxFaDFWuP/m8O
         FpKeVVQiiu4Cg+cDSmvTq/ZpFgrNBFRCCqE/jhbWVwR0Q9u8zS7qez4y4JAuy9W9N7kQ
         dT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698769352; x=1699374152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PbqnLiaYM/qismUJagY8WtP0Lsbpjpo6BS+NyjPaSIU=;
        b=GkJ5uLSdOlZJqzcsuj90cacO8FdShcaRhNBJOEmIjWeYIXOWM6IMNxbKzghmBC52QP
         rCmt/Lifxa8umFkyp7asqYsW1hKD8m7P0yvGiNJBBMygV/O9iRono5rOxbk/b6W5o2wv
         Lnh3+RtAPdNVKsOjs05slQQB+xuKwjQifijXzxXPeKpzb+eWdB7D49CCRP4TIjnUJFmp
         VUho5PU9doG4HAQ40QCFKEeIjzDKBMBa+MzF6ckKl1y1OsRoNj4HvEkuT1hF9V1lbdsb
         8nh4MWsCIRtBj6MetRGT/p41EawKxPqhF9JDwtBHZwvKlVfbs9Zdk/NnTfkcmSIcpNMy
         MDGg==
X-Gm-Message-State: AOJu0YwSIQvMKiS8VCEGzc3tqDksj7GunV58iHzrzskIRBP7wXDagawJ
	k2Dm/OfzyTtiQx44uEIW+amq8WXvxz4XmeVr
X-Google-Smtp-Source: AGHT+IGSvsYd/SVhWLFgXMVDqjMg9M0hSRTbFDOwVZLmzTBli4r6lzkSaUK5NcTio5bvQkfaXGDC/g==
X-Received: by 2002:a2e:9b18:0:b0:2c5:17c0:cd53 with SMTP id u24-20020a2e9b18000000b002c517c0cd53mr10890709lji.42.1698769351846;
        Tue, 31 Oct 2023 09:22:31 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
X-Google-Original-From: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
Date: Tue, 31 Oct 2023 17:22:29 +0100
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Matias Vara <matiasevara@gmail.com>
Subject: [RFC PATCH v3 3/3] tools/misc: Add xen-vcpus-stats tool
Message-ID: <3c11b71e824c1b68c8799dcafeb45098bd932149.1698589351.git.matias.vara@vates.fr>
References: <cover.1698589351.git.matias.vara@vates.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1698589351.git.matias.vara@vates.fr>

Add a demonstration tool that uses the stats_table resource to
query vcpus' RUNSTATE_running counter for a DomU.

Signed-off-by: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
---
Changes in v3:
- use memory layout as discussed at
  https://lists.xenproject.org/archives/html/xen-devel/2023-03/msg00383.html
- use virt_*()
- issue xenforeignmemory_close()

Changes in v2:
- use period instead of frec
- rely on version to ensure reading is coherent 

Changes in v1:
- change the name of the tool to xen-vcpus-stats
- set command line parameters in the same order that are passed
- remove header libs.h
- build by default
- remove errno, strerrno, "\n", and identation
- use errx when errno is not needed
- address better the number of pages requested and error msgs
- use the shared_vcpustatspage_t structure
- use the correct frame id when requesting the resource
---
 tools/misc/Makefile          |   6 ++
 tools/misc/xen-vcpus-stats.c | 132 +++++++++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+)
 create mode 100644 tools/misc/xen-vcpus-stats.c

diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 8b9558b93f..9c7cb50483 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -51,6 +51,7 @@ TARGETS_COPY += xenpvnetboot
 
 # Everything which needs to be built
 TARGETS_BUILD := $(filter-out $(TARGETS_COPY),$(TARGETS_ALL))
+TARGETS_BUILD += xen-vcpus-stats
 
 # ... including build-only targets
 TARGETS_BUILD += $(TARGETS_BUILD-y)
@@ -139,4 +140,9 @@ xencov: xencov.o
 xen-ucode: xen-ucode.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
+xen-vcpus-stats.o: CFLAGS += $(CFLAGS_libxenforeginmemory)
+
+xen-vcpus-stats: xen-vcpus-stats.o
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenforeignmemory) $(APPEND_LDFLAGS)
+
 -include $(DEPS_INCLUDE)
diff --git a/tools/misc/xen-vcpus-stats.c b/tools/misc/xen-vcpus-stats.c
new file mode 100644
index 0000000000..f277b6ce8f
--- /dev/null
+++ b/tools/misc/xen-vcpus-stats.c
@@ -0,0 +1,132 @@
+#include <err.h>
+#include <errno.h>
+#include <error.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <signal.h>
+
+#include <xenctrl.h>
+#include <xenforeignmemory.h>
+#include <xen/vcpu.h>
+
+/*
+ * Note that virt_*() is used when ordering is required between the hypevisor
+ * and the tool domain. This tool is meant to be arch-agnostic so add the
+ * corresponding barrier for each architecture.
+ *
+ */
+#if defined(__x86_64__)
+#define barrier() asm volatile("" ::: "memory")
+#define virt_rmb() barrier()
+#elif defined(__aarch64__)
+#define dmb(opt) asm volatile("dmb " #opt : : : "memory")
+#define virt_rmb() dmb(ishld)
+#else
+#error Please fill in barrier macros
+#endif
+
+static sig_atomic_t interrupted;
+static void close_handler(int signum)
+{
+    interrupted = 1;
+}
+
+int main(int argc, char **argv)
+{
+    xenforeignmemory_handle *fh;
+    xenforeignmemory_resource_handle *res;
+    size_t size;
+    int rc, domid, period, vcpu;
+    xen_vcpu_shmemstats_t *info_shmem;
+    xen_shared_vcpustats_t *info;
+    struct sigaction act;
+    uint32_t seq;
+    uint64_t value;
+
+    if ( argc != 4 )
+    {
+        fprintf(stderr, "Usage: %s <domid> <vcpu> <period>\n", argv[0]);
+        return 1;
+    }
+
+    domid = atoi(argv[1]);
+    vcpu = atoi(argv[2]);
+    period = atoi(argv[3]);
+
+    act.sa_handler = close_handler;
+    act.sa_flags = 0;
+    sigemptyset(&act.sa_mask);
+    sigaction(SIGHUP,  &act, NULL);
+    sigaction(SIGTERM, &act, NULL);
+    sigaction(SIGINT,  &act, NULL);
+    sigaction(SIGALRM, &act, NULL);
+
+    fh = xenforeignmemory_open(NULL, 0);
+
+    if ( !fh )
+        err(1, "xenforeignmemory_open");
+
+    rc = xenforeignmemory_resource_size(
+        fh, domid, XENMEM_resource_stats_table,
+        XENMEM_resource_stats_table_id_vcpustats, &size);
+
+    if ( rc )
+        err(1, "Fail: Get size");
+
+    res = xenforeignmemory_map_resource(
+        fh, domid, XENMEM_resource_stats_table,
+        XENMEM_resource_stats_table_id_vcpustats, 0, size >> XC_PAGE_SHIFT,
+        (void **)&info_shmem, PROT_READ, 0);
+
+    if ( !res )
+        err(1, "Fail: Map");
+
+    if ( info_shmem->magic != VCPU_STATS_MAGIC )
+    {
+        fprintf(stderr, "Wrong magic number\n");
+        return 1;
+    }
+
+    if ( offsetof(struct vcpu_stats, runstate_running_time) > info_shmem->size )
+    {
+        fprintf(stderr, "The counter is not produced\n");
+        return 1;
+    }
+
+    info = (xen_shared_vcpustats_t*)((void*)info_shmem
+                                     + info_shmem->offset
+                                     + info_shmem->size * vcpu);
+
+    if ( info->runstate_running_time & ((uint64_t)1 << 63) )
+    {
+        fprintf(stderr, "The counter is inactived or has overflowed\n");
+        return 1;
+    }
+
+    while ( !interrupted )
+    {
+        sleep(period);
+        do {
+            seq = info[vcpu].seq;
+            virt_rmb();
+            value = info[vcpu].runstate_running_time;
+            virt_rmb();
+        } while ( (info[vcpu].seq & 1) ||
+                  (seq != info[vcpu].seq) );
+        if ( value & ((uint64_t)1 << 63) )
+            break;
+        printf("running_vcpu_time[%d]: %ld\n", vcpu, value);
+    }
+
+    rc = xenforeignmemory_unmap_resource(fh, res);
+    if ( rc )
+        err(1, "Fail: Unmap");
+
+    rc = xenforeignmemory_close(fh);
+    if ( rc )
+        err(1, "Fail: Close");
+
+    return 0;
+}
-- 
2.34.1


