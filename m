Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2C8AAC809
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 16:33:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977422.1364461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCJM1-0002CN-E4; Tue, 06 May 2025 14:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977422.1364461; Tue, 06 May 2025 14:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCJM1-00023h-A0; Tue, 06 May 2025 14:33:05 +0000
Received: by outflank-mailman (input) for mailman id 977422;
 Tue, 06 May 2025 14:33:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bRWV=XW=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uCJLz-0000Q4-Qm
 for xen-devel@lists.xen.org; Tue, 06 May 2025 14:33:03 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03d7f82e-2a87-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 16:33:02 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ad1d1f57a01so267621066b.2
 for <xen-devel@lists.xen.org>; Tue, 06 May 2025 07:33:02 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1894c0356sm711598966b.100.2025.05.06.07.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 07:33:00 -0700 (PDT)
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
X-Inumbo-ID: 03d7f82e-2a87-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746541981; x=1747146781; darn=lists.xen.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9eYdqxJiuFt77CPqaijLabp59oslkZaSZ7TfPtEsR98=;
        b=RG8Tko5AN79qhEwbcEXi2O/naV+30YqIqq//N68nl99Ti1IOE8+YYKc98K9sxzWRrg
         LKU36Zm7qnMwdJGlFt8xQ2LMtqlFqb/LG45MrpclchRLzg6D1HM8ChwjjIDXg9wpKCcV
         CTWPeEuZuJ40XFVBT0m8jrPON5layqLHCa6yA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746541981; x=1747146781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9eYdqxJiuFt77CPqaijLabp59oslkZaSZ7TfPtEsR98=;
        b=Ag8QwmyOhfoSAh2Lud0PkZWbuVbIczKxDZPyEOtyr5T+wGFCQ9kleih6X9VrPfdAAd
         zPA8X2zAZ2N+GipUmTZRDpFtVCmORAb3qMt10hmR7phgFscnVoGel4zcUecdo7EPXfyu
         0HYvjaV85t2xE4IiSqbYq5/y86QtqL36VEGKxfiTYNWCnw4xQmdNFU4AXvRHGdQybarq
         zpV63mT0MMPFQm9Ju71gWLUp3f93cV2a45k3Rf2YJsjKWf/6ARtrTq9Td6jFXLvRajtw
         NyaHbQEJTQPIv5ncpG7wWSDTzpT+WNm8mattaOlxfetFD4tA1glO/z1HQMaPr6smo96Q
         7Q6A==
X-Gm-Message-State: AOJu0Yw7qFYDyBwXXRjo65uARfx2DlCWDlkrDeAXWQYF7fS7N3ls1EpW
	LnLWGGzWR1uLGMtreFDlxcbPu6VkWqlTp5WGVmRDRqaqCZ5W6GTZLr53DgONA5sQOBgew9B7YPQ
	=
X-Gm-Gg: ASbGncuP7mizN/bmggUVhSvy47SV/rDiExgTcUH7T1vRQBayYQ8KY13Cayz0RC/SA1A
	/l2mBml2aAIUkz2k1TaQSUy3e5BM8/va0Aj4TEkPIhefxY0fFfdvfao03Z3LG8zVnF8kAqOKa7L
	Hsf/fNtyTqCArFLl6pNS3N6BYkylInxXBS3qYfo2VaDlsjcTPvkizmAM+MeBjcsV9ihj0nW8yhG
	KWDwPhuUePR6WvpYTB7+5nYJc5jvXuFfdLVGSfeUwbmvlH7EHbuRxsIqkRDZy81+W0HpcSQ8bFX
	d1gOMlVxLq6VW3pCI1ksxqwR2ETXBcdvZclPRHWy/plz7G6QsteSEQf0ctGTcsS2
X-Google-Smtp-Source: AGHT+IEiXGDQDlvPzzGzGCTZWf6cD7XqhHvy9Fd20UQ8ONMR3GNj0HjnJ8ERzNht3teHeTivvJGHcA==
X-Received: by 2002:a17:907:3d8c:b0:acb:4f4a:cbd0 with SMTP id a640c23a62f3a-ad17b5ad337mr1566316466b.14.1746541981299;
        Tue, 06 May 2025 07:33:01 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Xen-devel <xen-devel@lists.xen.org>,
	xen-devel@lists.xenproject.org
Cc: Kevin Lampis <klampis@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 3/4] livepatch: Embed public key in Xen
Date: Tue,  6 May 2025 15:32:15 +0100
Message-ID: <20250506143218.1782603-4-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506143218.1782603-1-ross.lagerwall@citrix.com>
References: <20250506143218.1782603-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kevin Lampis <klampis@cloud.com>

Make it possible to embed a public key in Xen to be used when verifying
live patch payloads. Inclusion of the public key is optional.

To avoid needing to include a DER / X.509 parser in the hypervisor, the
public key is unpacked at build time and included in a form that is
convenient for the hypervisor to consume. This is different approach
from that used by Linux which embeds the entire X.509 certificate and
builds in a parser for it.

A suitable key can be created using openssl:

openssl req -x509 -newkey rsa:2048 -keyout priv.pem -out pub.pem \
    -sha256 -days 3650 -nodes \
    -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"
openssl x509 -inform PEM -in pub.pem -outform PEM -pubkey -nocert -out crypto/signing_key.pem

Signed-off-by: Kevin Lampis <klampis@cloud.com>
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/common/Kconfig       | 18 ++++++++++++++++++
 xen/common/Makefile      |  2 +-
 xen/common/livepatch.c   | 41 ++++++++++++++++++++++++++++++++++++++++
 xen/crypto/Makefile      | 14 +++++++++++++-
 xen/tools/extract-key.py | 37 ++++++++++++++++++++++++++++++++++++
 5 files changed, 110 insertions(+), 2 deletions(-)
 create mode 100755 xen/tools/extract-key.py

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 4bec78c6f267..e3e4fe2f3477 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -481,6 +481,24 @@ config LIVEPATCH
 
 	  If unsure, say Y.
 
+config PAYLOAD_SIGNING
+	bool "Verify signed LivePatch payloads"
+	depends on LIVEPATCH
+	select CRYPTO
+	help
+	  Verify signed LivePatch payloads using an RSA public key built
+	  into the Xen hypervisor. Selecting this option requires a
+	  public key in PEM format to be available for embedding during
+	  the build.
+
+config PAYLOAD_SIG_KEY
+	string "File name of payload signing public key"
+	default "signing_key.pem"
+	depends on PAYLOAD_SIGNING
+	help
+	  The file name of an RSA public key in PEM format to be used for
+	  verifying signed LivePatch payloads.
+
 config FAST_SYMBOL_LOOKUP
 	bool "Fast symbol lookup (bigger binary)"
 	default y
diff --git a/xen/common/Makefile b/xen/common/Makefile
index ece6548bb072..c75cbfa868a0 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -28,7 +28,7 @@ obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o
 obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
 obj-$(CONFIG_VM_EVENT) += mem_access.o
 obj-y += memory.o
-obj-y += mpi.o
+obj-$(CONFIG_PAYLOAD_SIGNING) += mpi.o
 obj-y += multicall.o
 obj-y += notifier.o
 obj-$(CONFIG_NUMA) += numa.o
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index be9b7e367553..947d05671b4f 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -11,6 +11,8 @@
 #include <xen/lib.h>
 #include <xen/list.h>
 #include <xen/mm.h>
+#include <xen/mpi.h>
+#include <xen/rsa.h>
 #include <xen/sched.h>
 #include <xen/smp.h>
 #include <xen/softirq.h>
@@ -73,6 +75,12 @@ static struct livepatch_work livepatch_work;
 static DEFINE_PER_CPU(bool, work_to_do);
 static DEFINE_PER_CPU(struct tasklet, livepatch_tasklet);
 
+#ifdef CONFIG_PAYLOAD_SIGNING
+/* The public key contained with Xen used to verify payload signatures. */
+extern const uint8_t xen_livepatch_key_data[];
+static struct rsa_public_key builtin_payload_key;
+#endif
+
 static int get_name(const struct xen_livepatch_name *name, char *n)
 {
     if ( !name->size || name->size > XEN_LIVEPATCH_NAME_SIZE )
@@ -2287,6 +2295,34 @@ static void cf_check livepatch_printall(unsigned char key)
     spin_unlock(&payload_lock);
 }
 
+#ifdef CONFIG_PAYLOAD_SIGNING
+static int __init load_builtin_payload_key(void)
+{
+    const uint8_t *ptr;
+    uint32_t len;
+
+    rsa_public_key_init(&builtin_payload_key);
+
+    ptr = xen_livepatch_key_data;
+
+    memcpy(&len, ptr, sizeof(len));
+    ptr += sizeof(len);
+    builtin_payload_key.n = mpi_read_raw_data(ptr, len);
+    ptr += len;
+
+    memcpy(&len, ptr, sizeof(len));
+    ptr += sizeof(len);
+    builtin_payload_key.e = mpi_read_raw_data(ptr, len);
+
+    return rsa_public_key_prepare(&builtin_payload_key);
+}
+#else
+static int __init load_builtin_payload_key(void)
+{
+    return 0;
+}
+#endif
+
 static int cf_check cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
@@ -2305,6 +2341,11 @@ static struct notifier_block cpu_nfb = {
 static int __init cf_check livepatch_init(void)
 {
     unsigned int cpu;
+    int err;
+
+    err = load_builtin_payload_key();
+    if (err)
+        return err;
 
     for_each_online_cpu ( cpu )
     {
diff --git a/xen/crypto/Makefile b/xen/crypto/Makefile
index d88374ddf221..e81302d7cd54 100644
--- a/xen/crypto/Makefile
+++ b/xen/crypto/Makefile
@@ -1,3 +1,15 @@
 obj-y += rijndael.o
-obj-y += rsa.o
+obj-$(CONFIG_PAYLOAD_SIGNING) += rsa.o
 obj-y += vmac.o
+
+obj-$(CONFIG_PAYLOAD_SIGNING) += builtin_payload_key.o
+
+ifeq ($(CONFIG_PAYLOAD_SIGNING),y)
+key_path := $(srctree)/crypto/$(patsubst "%",%,$(CONFIG_PAYLOAD_SIG_KEY))
+$(obj)/builtin_payload_key.bin: $(key_path) $(srctree)/tools/extract-key.py
+	$(srctree)/tools/extract-key.py < $< > $@.new
+	$(call move-if-changed,$@.new,$@)
+
+$(obj)/builtin_payload_key.S: $(srctree)/tools/binfile $(obj)/builtin_payload_key.bin FORCE
+	$(call if_changed,binfile,$(obj)/builtin_payload_key.bin xen_livepatch_key_data)
+endif
diff --git a/xen/tools/extract-key.py b/xen/tools/extract-key.py
new file mode 100755
index 000000000000..2980264b757d
--- /dev/null
+++ b/xen/tools/extract-key.py
@@ -0,0 +1,37 @@
+#!/usr/bin/env python3
+
+# SPDX-License-Identifier: GPL-2.0
+
+import binascii
+import struct
+import sys
+import subprocess
+import re
+
+# Decode a certificate into a format suitable for embedding in Xen.
+
+out = subprocess.check_output(['openssl', 'rsa', '-pubin', '-inform', 'PEM',
+                               '-noout', '-text'], stdin=sys.stdin,
+                               universal_newlines=True)
+combined = ''
+for line in out.split('\n'):
+    line = line.rstrip()
+    if line.startswith('    '):
+        combined += line.strip().replace(':', '')
+    match = re.match(r'Exponent: .* \(0x(.*)\)', line)
+    if match:
+        e = match.group(1)
+
+n = combined.lstrip('0')
+if len(n) % 2 == 1:
+    n = '0' + n
+n = binascii.unhexlify(n)
+e = e.lstrip('0')
+if len(e) % 2 == 1:
+    e = '0' + e
+e = binascii.unhexlify(e)
+
+sys.stdout.buffer.write(struct.pack('I', len(n)))
+sys.stdout.buffer.write(n)
+sys.stdout.buffer.write(struct.pack('I', len(e)))
+sys.stdout.buffer.write(e)
-- 
2.49.0


