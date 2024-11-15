Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DC89CDDD1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837179.1253190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBusy-0008Du-MY; Fri, 15 Nov 2024 11:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837179.1253190; Fri, 15 Nov 2024 11:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBusy-00088T-DI; Fri, 15 Nov 2024 11:53:12 +0000
Received: by outflank-mailman (input) for mailman id 837179;
 Fri, 15 Nov 2024 11:53:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBusw-0005UF-FV
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:10 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e019b8d-a348-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 12:53:07 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aa3a79d4d59so270568166b.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:07 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:53:06 -0800 (PST)
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
X-Inumbo-ID: 2e019b8d-a348-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzEiLCJoZWxvIjoibWFpbC1lajEteDYzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJlMDE5YjhkLWEzNDgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjcxNTg3LjgyNjk2Niwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671587; x=1732276387; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTgBp3u8P0cZs4GoU1pcL/XsrDo/t/R26kaPSnnnZ/I=;
        b=QRqOoqN6TNL+Uqykknt2PjpKKFg5G58/0oc5nPD2EgH2xErwrkK9Zyl1u5lCqfAe2D
         Mlr4NJMbpgYgyjN31lM7VRaG5yJiD3RD1Z2wra45GqTaDpQWV6MUBC2WPIiYKpslR92k
         JQXsr69ftEppoxpw1KN7kDae+AxhZZ720EtPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671587; x=1732276387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTgBp3u8P0cZs4GoU1pcL/XsrDo/t/R26kaPSnnnZ/I=;
        b=LIaGNOyH5MYmTD4Zjyyv1VVnQT7DOpLJcdwrmoFcT0edHRTQ22H2vwx0Z3p6whNgxI
         +Sh2pVRb55RequwHFt+VKFYdGk0vmgV9fKsOo2LdDRgePSy78HxXvMV+coMeGEedpBhq
         bVo6goWe2/A+x3Tz6sqVFyTYMghLhMXyPKxWmQaYhFBsWk7linAgCEduPAx1vqK8lGCa
         qhRFMmLrnCxSbGGkelK+KnpYwwvYXA+H1VqO93dLkHsJRQr9m/ggJUuO/scCVL0LOVOp
         WaldrSw2umsgnNY/pm+SXdcBCWJvpThPLzplSdqCIRCrgGKMomS6puiZu96jz0HbxL7D
         9FOg==
X-Gm-Message-State: AOJu0Yy3ipifTA0l5LfgAAPt3zyg11V4NR1sq7aS32sVU6b4q0+2HPnp
	lQw37hrf/++g0p1m5ygc3ykvicYw3GZ4kMp37qTaUYZwvze7eHJT54xLwbC7ah1VUSt8piSn7fY
	3
X-Google-Smtp-Source: AGHT+IGGf7chMiYoWULTA+4FqsplpwjC0gZstVC0KtP0DCVj+5C9GYogkSgo5Czrly1ZKHbWy2xagw==
X-Received: by 2002:a17:907:3d86:b0:a9f:508:5924 with SMTP id a640c23a62f3a-aa483525ef4mr207071166b.43.1731671586933;
        Fri, 15 Nov 2024 03:53:06 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [RFC PATCH 12/25] xen: Replace sysctl/readconsole with autogenerated version
Date: Fri, 15 Nov 2024 11:51:41 +0000
Message-ID: <20241115115200.2824-13-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe sysctl/readconsole as a TOML specification, remove old
hand-coded version and replace it with autogenerated file.

While at it, transform the console driver to use uint8_t rather than
char in order to mandate the type to be unsigned and ensure the ABI is
not defined with regards to C-specific types.

Also grant stubdom access to the new autogen folder, or it won't build.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 stubdom/Makefile                              |  2 +-
 tools/rust/Makefile                           | 19 ++++++++
 .../xenbindgen/extra/sysctl/readconsole.toml  | 43 +++++++++++++++++++
 xen/drivers/char/console.c                    | 12 +++---
 xen/include/public/autogen/sysctl.h           | 35 +++++++++++++++
 xen/include/public/sysctl.h                   | 23 +---------
 xen/include/public/xen.h                      |  1 +
 7 files changed, 108 insertions(+), 27 deletions(-)
 create mode 100644 tools/rust/xenbindgen/extra/sysctl/readconsole.toml
 create mode 100644 xen/include/public/autogen/sysctl.h

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 2a81af28a16e..5e919889836b 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -362,7 +362,7 @@ LINK_STAMPS := $(foreach dir,$(LINK_DIRS),$(dir)/stamp)
 mk-headers-$(XEN_TARGET_ARCH): $(IOEMU_LINKFARM_TARGET) $(LINK_STAMPS)
 	mkdir -p include/xen && \
           ln -sf $(wildcard $(XEN_ROOT)/xen/include/public/*.h) include/xen && \
-          ln -sf $(addprefix $(XEN_ROOT)/xen/include/public/,arch-x86 hvm io xsm) include/xen && \
+          ln -sf $(addprefix $(XEN_ROOT)/xen/include/public/,arch-x86 autogen hvm io xsm) include/xen && \
           ( [ -h include/xen/sys ] || ln -sf $(XEN_ROOT)/tools/include/xen-sys/MiniOS include/xen/sys ) && \
           ( [ -h include/xen/libelf ] || ln -sf $(XEN_ROOT)/tools/include/xen/libelf include/xen/libelf ) && \
 	  mkdir -p include/xen-foreign && \
diff --git a/tools/rust/Makefile b/tools/rust/Makefile
index f5db0a9c5e81..80e2f0e2817e 100644
--- a/tools/rust/Makefile
+++ b/tools/rust/Makefile
@@ -3,6 +3,11 @@ XEN_ROOT=$(CURDIR)/../..
 # Path to the Xen hypercall IDL parser
 XENBINDGEN=$(CURDIR)/xenbindgen
 
+# Output folder for the autogenerated C headers
+#
+# Must contain autogenerated files only because they're all wiped on update
+AUTOGEN_C=$(XEN_ROOT)/xen/include/public/autogen/
+
 # Clippy settings for all Rust projects
 CLIPPY_ARGS=-D warnings \
             -D missing_docs \
@@ -14,6 +19,20 @@ CLIPPY_ARGS=-D warnings \
 .PHONY: all install uninstall clean
 all install uninstall clean:
 
+# Remove all autogenerated files
+.PHONY: clean-autogen
+clean-autogen:
+	rm -rf "${AUTOGEN_C}"
+
+# Refresh autogenerated files. Depending on clean-autogen is required in order
+# for removals of specification files to cause the removal of their
+# autogenerated files.
+.PHONY: update
+update: clean-autogen
+	# Update C bindings
+	cargo run --manifest-path "${XENBINDGEN}/Cargo.toml" -- --lang c \
+	          --indir "${XENBINDGEN}/extra" --outdir "${AUTOGEN_C}"
+
 # Verify Rust crates pass lint checks. This is enforced in CI
 .PHONY: verify
 verify:
diff --git a/tools/rust/xenbindgen/extra/sysctl/readconsole.toml b/tools/rust/xenbindgen/extra/sysctl/readconsole.toml
new file mode 100644
index 000000000000..868743a453ff
--- /dev/null
+++ b/tools/rust/xenbindgen/extra/sysctl/readconsole.toml
@@ -0,0 +1,43 @@
+[[structs]]
+name = "xen_sysctl_readconsole"
+description = "Read console content from Xen buffer ring."
+
+[[structs.fields]]
+name = "clear"
+description = "IN: Non-zero -> clear after reading."
+typ = { tag = "u8" }
+
+[[structs.fields]]
+name = "incremental"
+description = "IN: Non-zero -> start index specified by `index` field."
+typ = { tag = "u8" }
+
+[[structs.fields]]
+name = "_pad"
+description = "Unused."
+typ = { tag = "u16" }
+
+[[structs.fields]]
+name = "index"
+description = """
+IN:  Start index for consuming from ring buffer (if @incremental);
+OUT: End index after consuming from ring buffer."""
+typ = { tag = "u32" }
+
+[[structs.fields]]
+name = "buffer"
+description = """
+IN: Virtual address to write console data.
+
+NOTE: The pointer itself is IN, but the contents of the buffer are OUT."""
+typ = { tag = "ptr", args = { tag = "u8" } }
+
+[[structs.fields]]
+name = "count"
+description = "IN: Size of buffer; OUT: Bytes written to buffer."
+typ = { tag = "u32" }
+
+[[structs.fields]]
+name = "rsvd0_a"
+description = "Tail padding reserved to zero."
+typ = { tag = "u32" }
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 7da8c5296f3b..82f6ad7b32cb 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -42,6 +42,8 @@
 #include <asm/vpl011.h>
 #endif
 
+#include <public/xen.h>
+
 /* console: comma-separated list of console outputs. */
 static char __initdata opt_console[30] = OPT_CONSOLE_STR;
 string_param("console", opt_console);
@@ -108,8 +110,8 @@ size_param("conring_size", opt_conring_size);
 
 #define _CONRING_SIZE 16384
 #define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
-static char __initdata _conring[_CONRING_SIZE];
-static char *__read_mostly conring = _conring;
+static uint8_t __initdata _conring[_CONRING_SIZE];
+static uint8_t *__read_mostly conring = _conring;
 static uint32_t __read_mostly conring_size = _CONRING_SIZE;
 static uint32_t conringc, conringp;
 
@@ -339,10 +341,10 @@ static void conring_puts(const char *str, size_t len)
 
 long read_console_ring(struct xen_sysctl_readconsole *op)
 {
-    XEN_GUEST_HANDLE_PARAM(char) str;
+    XEN_GUEST_HANDLE_PARAM(uint8_t) str;
     uint32_t idx, len, max, sofar, c, p;
 
-    str   = guest_handle_cast(op->buffer, char),
+    str   = guest_handle_cast(op->buffer, uint8_t),
     max   = op->count;
     sofar = 0;
 
@@ -1052,7 +1054,7 @@ void __init console_init_preirq(void)
 
 void __init console_init_ring(void)
 {
-    char *ring;
+    uint8_t *ring;
     unsigned int i, order, memflags;
     unsigned long flags;
 
diff --git a/xen/include/public/autogen/sysctl.h b/xen/include/public/autogen/sysctl.h
new file mode 100644
index 000000000000..f728b13374d3
--- /dev/null
+++ b/xen/include/public/autogen/sysctl.h
@@ -0,0 +1,35 @@
+/*
+ * sysctl
+ *
+ * AUTOGENERATED. DO NOT MODIFY
+ */
+#ifndef __XEN_AUTOGEN_SYSCTL_H
+#define __XEN_AUTOGEN_SYSCTL_H
+
+/* Read console content from Xen buffer ring. */
+struct xen_sysctl_readconsole {
+    /* IN: Non-zero -> clear after reading. */
+    uint8_t clear;
+    /* IN: Non-zero -> start index specified by `index` field. */
+    uint8_t incremental;
+    /* Unused. */
+    uint16_t _pad;
+    /*
+     * IN:  Start index for consuming from ring buffer (if @incremental);
+     * OUT: End index after consuming from ring buffer.
+     */
+    uint32_t index;
+    /*
+     * IN: Virtual address to write console data.
+     *
+     * NOTE: The pointer itself is IN, but the contents of the buffer are OUT.
+     */
+    XEN_GUEST_HANDLE_64(uint8) buffer;
+    /* IN: Size of buffer; OUT: Bytes written to buffer. */
+    uint32_t count;
+    /* Tail padding reserved to zero. */
+    uint32_t rsvd0_a;
+};
+
+#endif /* __XEN_AUTOGEN_SYSCTL_H */
+
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index b0fec271d36f..9e773490a5ac 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -18,6 +18,8 @@
 #include "domctl.h"
 #include "physdev.h"
 
+#include "autogen/sysctl.h"
+
 /*
  * The interface version needs to be incremented by 1 in case the interface
  * is modified in an incompatible way AND if the version hasn't been
@@ -30,27 +32,6 @@
  */
 #define XEN_SYSCTL_INTERFACE_VERSION 0x00000015
 
-/*
- * Read console content from Xen buffer ring.
- */
-/* XEN_SYSCTL_readconsole */
-struct xen_sysctl_readconsole {
-    /* IN: Non-zero -> clear after reading. */
-    uint8_t clear;
-    /* IN: Non-zero -> start index specified by @index field. */
-    uint8_t incremental;
-    uint8_t pad0, pad1;
-    /*
-     * IN:  Start index for consuming from ring buffer (if @incremental);
-     * OUT: End index after consuming from ring buffer.
-     */
-    uint32_t index;
-    /* IN: Virtual address to write console data. */
-    XEN_GUEST_HANDLE_64(char) buffer;
-    /* IN: Size of buffer; OUT: Bytes written to buffer. */
-    uint32_t count;
-};
-
 /* Get trace buffers machine base address */
 /* XEN_SYSCTL_tbuf_op */
 struct xen_sysctl_tbuf_op {
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index e051f989a5ca..cc5133fc19b8 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -36,6 +36,7 @@ __DEFINE_XEN_GUEST_HANDLE(ulong, unsigned long);
 #endif
 DEFINE_XEN_GUEST_HANDLE(void);
 
+DEFINE_XEN_GUEST_HANDLE(uint8_t);
 DEFINE_XEN_GUEST_HANDLE(uint64_t);
 DEFINE_XEN_GUEST_HANDLE(xen_pfn_t);
 DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
-- 
2.47.0


