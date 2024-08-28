Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 727269628A7
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 15:31:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784824.1194221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjIl2-00088s-4W; Wed, 28 Aug 2024 13:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784824.1194221; Wed, 28 Aug 2024 13:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjIl2-00085j-1L; Wed, 28 Aug 2024 13:30:44 +0000
Received: by outflank-mailman (input) for mailman id 784824;
 Wed, 28 Aug 2024 13:30:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjIl0-00085d-JK
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 13:30:42 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7c00c89-6541-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 15:30:40 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c0a9ae3665so3827321a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 06:30:40 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e54852f5sm245821366b.25.2024.08.28.06.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 06:30:38 -0700 (PDT)
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
X-Inumbo-ID: b7c00c89-6541-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724851839; x=1725456639; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jRsj11XV1fVGwS7FB2o0nFLySj8EnNqCoZEfVWbPM/A=;
        b=jBQtDANLkoXgfuBZ7xL0nlz+Qcifgb30+HcEbh4T7tu6QEDTVh060JPDNfK1tcrJdW
         lCwxhnysxK6S1MZDGyn3rQJ39QODBoGJpZwOYJCVUB20/qADXSKatH+MfiahJBZ9ZdnE
         4SemfZqLTsWzcFhpZwuvxev826SVut74rXESM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724851839; x=1725456639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRsj11XV1fVGwS7FB2o0nFLySj8EnNqCoZEfVWbPM/A=;
        b=hnAmxq+8yZL5BvApUzRi7Puo4gJcPegGCbg76hvu70nyhzytA8IfyooAOo1grTen7D
         flkRc+QCe5Eks1IXxiI/DFhfT/0QXKmpNIr0KSJMrMuMYxXiLYkM/mD8/cKmAA6CIfyT
         H6wvnkCcbqazb6MzdF2daEbd7ATHHwaHi+82QXzccbT+adYqpJnTujJltAr/n5ZJuZ29
         xzcxA3dFBvdGdJeDVdkoZ5Mh2U4M7CP/0b4IlQSjx+NZnt0rLB09x4Ei74kmbGpBUjIn
         CL/mSwDxNgeW7YhH0xEtIDHGfOFV6GETndzv8mXvj6aGU6aXUlmXdpKNuVqjP1W2OdmW
         XIAw==
X-Gm-Message-State: AOJu0Yy9w6dISXNBAFBYuYIX1gXl9yPT/rXujc23o+QfBHT2ZhgwykHy
	C1xN4QPcjPjY7qEta6043Qrt+pIqCehMBcnzAPx3M961FoMEhcTiEGmG+oOKKSTSNzIsEQHiHxr
	F
X-Google-Smtp-Source: AGHT+IH4Z3pKu7AOfwQIwZoBfP/sRISuxlD3gzCHt8+rLYokFpknOs81rt/qkJafGJJBiLdhp3qGMQ==
X-Received: by 2002:a17:907:1b19:b0:a7a:952b:95b1 with SMTP id a640c23a62f3a-a870a97464amr158936666b.24.1724851838735;
        Wed, 28 Aug 2024 06:30:38 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Rob Hoes <Rob.Hoes@citrix.com>,
	Andrii Sultanov <andrii.sultanov@cloud.com>
Subject: [PATCH] tools/ocaml: Factor out compatiblity handling
Date: Wed, 28 Aug 2024 14:30:33 +0100
Message-Id: <20240828133033.2378322-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... rather than having each library implement its own subset.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
CC: Andrii Sultanov <andrii.sultanov@cloud.com>

Broken out of a larger series, to help Andrii with his dynlib work.
---
 tools/ocaml/libs/xc/Makefile        |  2 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c | 13 +++----------
 tools/ocaml/libs/xen-caml-compat.h  | 23 +++++++++++++++++++++++
 3 files changed, 27 insertions(+), 11 deletions(-)
 create mode 100644 tools/ocaml/libs/xen-caml-compat.h

diff --git a/tools/ocaml/libs/xc/Makefile b/tools/ocaml/libs/xc/Makefile
index 1d9fecb06ef2..cdf4d01dac52 100644
--- a/tools/ocaml/libs/xc/Makefile
+++ b/tools/ocaml/libs/xc/Makefile
@@ -2,7 +2,7 @@ OCAML_TOPLEVEL=$(CURDIR)/../..
 XEN_ROOT=$(OCAML_TOPLEVEL)/../..
 include $(OCAML_TOPLEVEL)/common.make
 
-CFLAGS += -I../mmap $(CFLAGS_libxenctrl) $(CFLAGS_libxenguest)
+CFLAGS += -I../ -I../mmap $(CFLAGS_libxenctrl) $(CFLAGS_libxenguest)
 CFLAGS += $(APPEND_CFLAGS)
 OCAMLINCLUDE += -I ../mmap -I ../eventchn
 
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index a52908012960..c78191f95abc 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -25,6 +25,8 @@
 #include <caml/fail.h>
 #include <caml/callback.h>
 
+#include "xen-caml-compat.h"
+
 #include <sys/mman.h>
 #include <stdint.h>
 #include <string.h>
@@ -37,14 +39,6 @@
 
 #include "mmap_stubs.h"
 
-#ifndef Val_none
-#define Val_none (Val_int(0))
-#endif
-
-#ifndef Tag_some
-#define Tag_some 0
-#endif
-
 static inline xc_interface *xch_of_val(value v)
 {
 	xc_interface *xch = *(xc_interface **)Data_custom_val(v);
@@ -744,8 +738,7 @@ CAMLprim value stub_xc_evtchn_status(value xch_val, value domid, value port)
 	Store_field(result_status, 0, Val_int(status.vcpu));
 	Store_field(result_status, 1, stat);
 
-	result = caml_alloc_small(1, Tag_some);
-	Store_field(result, 0, result_status);
+	result = caml_alloc_some(result_status);
 
 	CAMLreturn(result);
 }
diff --git a/tools/ocaml/libs/xen-caml-compat.h b/tools/ocaml/libs/xen-caml-compat.h
new file mode 100644
index 000000000000..b4a0ca4ce90c
--- /dev/null
+++ b/tools/ocaml/libs/xen-caml-compat.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: LGPL-2.1-only WITH OCaml-LGPL-linking-exception */
+#ifndef XEN_CAML_COMPAT_H
+#define XEN_CAML_COMPAT_H
+
+#ifndef Val_none /* Option handling.  Compat for Ocaml < 4.12 */
+
+#define Val_none Val_int(0)
+#define Tag_some 0
+#define Some_val(v) Field(v, 0)
+
+static inline value caml_alloc_some(value v)
+{
+    CAMLparam1(v);
+
+    value some = caml_alloc_small(1, Tag_some);
+    Store_field(some, 0, v);
+
+    CAMLreturn(some);
+}
+
+#endif /* !Val_none */
+
+#endif /* XEN_CAML_COMPAT_H */

base-commit: 75c64db3722f0245137a1e8cfd3435f4790d0fd7
-- 
2.39.2


