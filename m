Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4845752A4EE
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 16:33:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330965.554408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyGZ-0008U5-V6; Tue, 17 May 2022 14:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330965.554408; Tue, 17 May 2022 14:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyGZ-0008Qg-Po; Tue, 17 May 2022 14:33:39 +0000
Received: by outflank-mailman (input) for mailman id 330965;
 Tue, 17 May 2022 14:33:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NT3h=VZ=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1nqyGY-0007sV-1O
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 14:33:38 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5676ab00-d5ee-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 16:33:37 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id j24so9790354wrb.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 May 2022 07:33:37 -0700 (PDT)
Received: from horizon.home (amontsouris-681-1-37-131.w90-87.abo.wanadoo.fr.
 [90.87.156.131]) by smtp.gmail.com with ESMTPSA id
 f21-20020a7bcd15000000b003942a244f30sm2544884wmj.9.2022.05.17.07.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 07:33:36 -0700 (PDT)
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
X-Inumbo-ID: 5676ab00-d5ee-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gpzhC736ZCcknGHWj7xlGwQP3KKn5gNkOz0b71J0xEk=;
        b=b/jhAljctA8SSJZRjApK/ajrQuLJdVc/6RBDV3owMBNa3Fc4Dr/YNdXXQ5DHjl3mzB
         LhA9T7p3TNvdWiUkRXIAdRoyNJhSpy4NZMF4X4gqJTFzUXv2aVsKLGP+Bp1/l5/5Fw+e
         fNTtR1ZoESUJh2P/c3cvB0JRgnQK3rcdjqaqkcPhtRFARx4gHr4L8Vb9xGIGhsquH80B
         4vfnuvkyREGSdNGEOMLbbw70a0OriT1kYOLF5jzN88SGc+V0hegLx34nd1rXHqaAkzIm
         zlBpUVUmD8z11TlWSKMDQpvft8iLx7K3GGnb/XRZEWk6arT3eTd5pgeBfskfddhXWZr4
         gtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gpzhC736ZCcknGHWj7xlGwQP3KKn5gNkOz0b71J0xEk=;
        b=ks8kzvpm/hURk9rZdT03A020FbRyNtFQukNsIQXbsMdwG53za2FxarIOKuudbre4BN
         d3qrK5F5A/MqtcxomSnCkdCPPy2vldDnvIEn0DUKKqlOqbrEds1BcsnfmxwA1tRyHile
         +fNKH3Il2+vgD6hI0cbJ/u906ejJHBNQh9cJVC8weoRakTKRV0RP6QkdsYTxv6QqZ4PU
         xqW4JbKXMGSXxLY+gSfXmZdyi/yl2/FWalt6Sau+NbuWRj8LTBhJYFIUyhumFt4z25n/
         e1q+bCdOLmKLq8kB27B+QMmsbwJcdV8UkhpqsBX8e6cUNUf5Y9ytiQ1PNCM8ThC9JIeC
         01yA==
X-Gm-Message-State: AOAM533zn53bRo7hm3kpPoQgyxnnEloXLgQwoqHU2AtUa8J1qAyx5AMW
	mf3pOXsbhmZvT7tVQAx+pdX7RcTcWIUjGQ==
X-Google-Smtp-Source: ABdhPJy00iSU9MGY4ElHHizz5q64eggXdUyF8ugDubELNhWZeMFlJKgjswaZAjB2s8FXFaicvsp6kQ==
X-Received: by 2002:adf:eb4b:0:b0:20c:dfe2:bed7 with SMTP id u11-20020adfeb4b000000b0020cdfe2bed7mr18409036wrn.672.1652798016532;
        Tue, 17 May 2022 07:33:36 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
X-Google-Original-From: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
To: xen-devel@lists.xenproject.org
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC PATCH 2/2] tools/misc: Add xen-stats tool
Date: Tue, 17 May 2022 16:33:15 +0200
Message-Id: <e233c4f60c6fe97b93b3adf9affeb0404c554130.1652797713.git.matias.vara@vates.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652797713.git.matias.vara@vates.fr>
References: <cover.1652797713.git.matias.vara@vates.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a demostration tool that uses the stats_table resource to
query vcpu time for a DomU.

Signed-off-by: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
---
 tools/misc/Makefile    |  5 +++
 tools/misc/xen-stats.c | 83 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 tools/misc/xen-stats.c

diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 2b683819d4..b510e3aceb 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -135,4 +135,9 @@ xencov: xencov.o
 xen-ucode: xen-ucode.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
+xen-stats.o: CFLAGS += $(CFLAGS_libxenforeginmemory)
+
+xen-stats: xen-stats.o
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenforeignmemory) $(APPEND_LDFLAGS)
+
 -include $(DEPS_INCLUDE)
diff --git a/tools/misc/xen-stats.c b/tools/misc/xen-stats.c
new file mode 100644
index 0000000000..5d4a3239cc
--- /dev/null
+++ b/tools/misc/xen-stats.c
@@ -0,0 +1,83 @@
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
+#include <xen-tools/libs.h>
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
+    int rc, nr_frames, domid, frec, vcpu;
+    uint64_t * info;
+    struct sigaction act;
+
+    if (argc != 4 ) {
+        fprintf(stderr, "Usage: %s <domid> <vcpu> <period>\n", argv[0]);
+        return 1;
+    }
+
+    // TODO: this depends on the resource
+    nr_frames = 1;
+
+    domid = atoi(argv[1]);
+    frec = atoi(argv[3]);
+    vcpu = atoi(argv[2]);
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
+        vcpu, &size);
+
+    if ( rc )
+        err(1, "    Fail: Get size: %d - %s\n", errno, strerror(errno));
+
+    if ( (size >> XC_PAGE_SHIFT) != nr_frames )
+        err(1, "    Fail: Get size: expected %u frames, got %zu\n",
+                    nr_frames, size >> XC_PAGE_SHIFT);
+
+    res = xenforeignmemory_map_resource(
+        fh, domid, XENMEM_resource_stats_table,
+        vcpu, 0, size >> XC_PAGE_SHIFT,
+        (void **)&info, PROT_READ, 0);
+
+    if ( !res )
+        err(1, "    Fail: Map %d - %s\n", errno, strerror(errno));
+
+    while ( !interrupted ) {
+        sleep(frec);
+        printf("running cpu_time: %ld\n", *info);
+    }
+
+    rc = xenforeignmemory_unmap_resource(fh, res);
+    if ( rc )
+        err(1, "    Fail: Unmap %d - %s\n", errno, strerror(errno));
+
+    return 0;
+}
-- 
2.25.1


