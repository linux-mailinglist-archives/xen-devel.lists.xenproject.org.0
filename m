Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8AF59FB5F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 15:28:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392605.631085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQqQT-00071s-FQ; Wed, 24 Aug 2022 13:28:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392605.631085; Wed, 24 Aug 2022 13:28:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQqQT-0006xA-BW; Wed, 24 Aug 2022 13:28:09 +0000
Received: by outflank-mailman (input) for mailman id 392605;
 Wed, 24 Aug 2022 13:28:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GaRE=Y4=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1oQqQR-0006FJ-On
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 13:28:07 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96bb7103-23b0-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 15:28:07 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso860701wmb.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Aug 2022 06:28:07 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:19f:35f0:dde5:d55a:20f5:7ef5])
 by smtp.gmail.com with ESMTPSA id
 j27-20020a05600c1c1b00b003a5ce167a68sm2220599wms.7.2022.08.24.06.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 06:28:05 -0700 (PDT)
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
X-Inumbo-ID: 96bb7103-23b0-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=59izKsatWx93ZlS9Q48JeXcPM/kkJK4lT2iqQF0AUr8=;
        b=li+lc8LIPUN0y7KhIgvxw2Bp602rvWMjswmCVPydIJo1NS3XJKnMY8HJsvYuoj3JMZ
         nbO6IMp4JNK+kDCc/ei9BjBa8+gEvgaEBbaA+cGc2czklox+3m6H1U8awwq2hAWeX99x
         0oU4HbE4akgfQuWuoqVgidlPpEtEApdpYFqQSgzS8m+MmYPm0/duKEjn5NMDyZMyF0bS
         JmaXSfYOHXA5yhUR2p1bVC/wW54a2Anch17u8A6ulLLe2EbF0uGUzLzyXLumYzCkzLMu
         AjrjKjN456qPfoqEkXDfV9ODshm6n9Ut1SWXBJs+rPTqiFXdOzLB48cFzakhowQ2xwm6
         XALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=59izKsatWx93ZlS9Q48JeXcPM/kkJK4lT2iqQF0AUr8=;
        b=q1D0kBBf1uFlmr2IgYm246otj90quHb79740jzH+Uy4e4KOZUddIInYFWlS3SxcQgI
         BuiKlspAqnVb+VyD7yiOZFd3UaEPl7MemawAe6rhwKjNpzfBpY0KIUNaOxgOfqCPKl0r
         y6vbm0O/qn+99810rRcygh4h8hfI396c/7/8r3XpcEeaJ2RIZvGHyKqKlQ4yKVUZfqeI
         3p8TgbQW6CIIJD4e5D5vXXdFlcoMxbSAzgPfkU2be51XJ5md7AgsqZRL6Y0DsIp9tFay
         ovtSOHTVCJkIULF7f83dHw92Fr22oFDfbXj2LAGmCEzioyOD+dWowKr9wElE1kanCGsv
         2LSA==
X-Gm-Message-State: ACgBeo0T2uUAYeyNERd23gi6HnzJY9wFH3SuiysbmpTcSDmNp7yBHWfJ
	QEhJCxbBTBpNYP6+Tkww+eCWbCjXt0rVJQ==
X-Google-Smtp-Source: AA6agR7ndbWxAHEobxliUdBG3EnIJEGWqWn/Wx4e+XiZTaMrK+K4/Y6YLhUNj5Kbxta/z/L32dD0dQ==
X-Received: by 2002:a05:600c:5023:b0:3a6:3f9:a031 with SMTP id n35-20020a05600c502300b003a603f9a031mr5091369wmr.131.1661347686216;
        Wed, 24 Aug 2022 06:28:06 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
X-Google-Original-From: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
To: xen-devel@lists.xenproject.org
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC PATCH v1 2/2] tools/misc: Add xen-vcpus-stats tool
Date: Wed, 24 Aug 2022 15:27:31 +0200
Message-Id: <c17fc1382cdf0b5975573759c790eed5d4a16192.1661330065.git.matias.vara@vates.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661330065.git.matias.vara@vates.fr>
References: <cover.1661330065.git.matias.vara@vates.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a demostration tool that uses the stats_table resource to
query vcpus' RUNSTATE_running counter for a DomU.

Signed-off-by: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
---
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
 tools/misc/Makefile          |  6 +++
 tools/misc/xen-vcpus-stats.c | 76 ++++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 tools/misc/xen-vcpus-stats.c

diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 2b683819d4..837e4b50da 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -49,6 +49,7 @@ TARGETS_COPY += xenpvnetboot
 
 # Everything which needs to be built
 TARGETS_BUILD := $(filter-out $(TARGETS_COPY),$(TARGETS_ALL))
+TARGETS_BUILD += xen-vcpus-stats
 
 # ... including build-only targets
 TARGETS_BUILD-$(CONFIG_X86)    += xen-vmtrace
@@ -135,4 +136,9 @@ xencov: xencov.o
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
index 0000000000..d56d1493e4
--- /dev/null
+++ b/tools/misc/xen-vcpus-stats.c
@@ -0,0 +1,76 @@
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
+    int rc, domid, frec, vcpu;
+    shared_vcpustatspage_t * info;
+    struct sigaction act;
+
+    if (argc != 4 ) {
+        fprintf(stderr, "Usage: %s <domid> <vcpu> <period>\n", argv[0]);
+        return 1;
+    }
+
+    domid = atoi(argv[1]);
+    vcpu = atoi(argv[2]);
+    frec = atoi(argv[3]);
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
+        0, &size);
+
+    if ( rc )
+        err(1, "Fail: Get size");
+
+    res = xenforeignmemory_map_resource(
+        fh, domid, XENMEM_resource_stats_table,
+        0, XENMEM_resource_stats_frame_vcpustats, size >> XC_PAGE_SHIFT,
+        (void **)&info, PROT_READ, 0);
+
+    if ( !res )
+        err(1, "Fail: Map");
+
+    while ( !interrupted ) {
+        sleep(frec);
+        printf("running cpu_time: %ld\n", info->vcpu_info[vcpu].runstate_running_time);
+    }
+
+    rc = xenforeignmemory_unmap_resource(fh, res);
+    if ( rc )
+        err(1, "Fail: Unmap");
+
+    return 0;
+}
-- 
2.25.1


