Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAD5ACAF29
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 15:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003321.1382858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5LR-0000Qd-JS; Mon, 02 Jun 2025 13:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003321.1382858; Mon, 02 Jun 2025 13:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5LR-0000Nw-FK; Mon, 02 Jun 2025 13:36:53 +0000
Received: by outflank-mailman (input) for mailman id 1003321;
 Mon, 02 Jun 2025 13:36:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2MT+=YR=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uM5LQ-0000AN-S9
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 13:36:52 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a39e7a3b-3fb6-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 15:36:51 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ad51ef2424bso850932766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 06:36:51 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d82becbsm801962166b.39.2025.06.02.06.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 06:36:49 -0700 (PDT)
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
X-Inumbo-ID: a39e7a3b-3fb6-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748871410; x=1749476210; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXyFKt8SkeFv2JRAXt3PYp9ZfiPqxDGxVcFws6/GjMQ=;
        b=C7S7NmLvXn4Aiavsyg3n9EpbG/w5QwFcli1QncfilI8mGHC49wLHJ/t93944dvjf6A
         kx6bHqBuOzNfPqMHlMcl5CFuB0k+Fuw4GXtDRnt3snAeXmfY8woiswB8vY+Suyejw5at
         DLIfOmZEeediUplTaR4aiLj5oqOspaj62hF8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748871410; x=1749476210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXyFKt8SkeFv2JRAXt3PYp9ZfiPqxDGxVcFws6/GjMQ=;
        b=GgnKT5rEbA1QCulOqrVkOEshQMr43bFH1royt6Ov66frSPYsQ1MrwYbeks1FeFusug
         Q8kVXeG7FF85c4OQrZhixbx6MHpM0LZvAxmMey31R5VTq7xdbG0AqecFMpXDJKZB5PYK
         UUbsyjSw7JQp+s8is/oI4xwXP0PI6g4KHgBazBQEkpvIJz44bIhU+bxLFbM60z/M/F3N
         pr5i8+Edqe81u7CrChXnJKtf6q8DPCAcWpzymtakeJ9SSJsEB3OZRKqfOuAPKE3D4ZDU
         QlWTPd6iG7f4mfsj/DUJNTGWE7ALKND1pgNqB8aY0LPMhxloFyuz2AFSfC9hZaYsfj3V
         pV9w==
X-Gm-Message-State: AOJu0YwY+zYtZm1GgdVYn/CGvFr2/kruQINrMI9kOzPBStf6d3yYb/O7
	CYk4VOX59kqA7B7L7aWL0TjVyry0NTG5tJDjQgDqQHTM5SISYWnFz0zZkFqPksmGuruLAAard4Y
	bR7Q=
X-Gm-Gg: ASbGncuyyOXAIzHW53MB+r1Tsa5WJckwCNv77Q3uON1nKKT7dRteN/eoV6r1dCbi9Z3
	1Fo4he6oy4ywIORY3/AzoPrJLRt7mNNzB5kgBcE1PXjiPJSsCceYEGdfzWOEN8GESBMJVqHlB85
	rCGTqgUP3Kn6U8uZrEQWuz74/rQjKv2pv8M//Gr+iJTr0xU3PC0GOOhf/CCTI64cvCBxA2mqjYr
	MWV31a7NvpfsqEy5tLjXzTL1C7n1u9NqCXWbDIXzG1+dsyWCZtz7sgMlCSKSsFH7N5tIW4S4U2D
	N3lQfT7zp72lwnSu6hjN5gOjQty5d2i9Cvc6UdIih90OLiiuu8GJDmltVY8UvcvyHm/RUV7xyEo
	=
X-Google-Smtp-Source: AGHT+IFDR2jTnNkplK5MDSg0EiFkL63MSZQoNcI1lDzXXdOHZRHY4hs4m38UOsREknK3kO+gkCgGBA==
X-Received: by 2002:a17:907:9488:b0:ad8:99e7:171 with SMTP id a640c23a62f3a-adb493e28f3mr800031766b.21.1748871410169;
        Mon, 02 Jun 2025 06:36:50 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Kevin Lampis <kevin.lampis@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v3 2/5] livepatch: Embed public key in Xen
Date: Mon,  2 Jun 2025 14:36:34 +0100
Message-ID: <20250602133639.2871212-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
References: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kevin Lampis <kevin.lampis@cloud.com>

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
openssl x509 -inform PEM -in pub.pem -outform PEM -pubkey -nocert -out verify_key.pem

Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

In v3:

* Drop unnecessary condition in Makefile
* Use dashes instead of underscores
* Drop section placement annotation on declaration
* Clarify endianness of embedded key

 xen/common/Kconfig          | 18 +++++++++++++++++
 xen/crypto/Makefile         | 11 ++++++++++
 xen/include/xen/livepatch.h |  5 +++++
 xen/tools/extract-key.py    | 40 +++++++++++++++++++++++++++++++++++++
 4 files changed, 74 insertions(+)
 create mode 100755 xen/tools/extract-key.py

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0951d4c2f286..74673078202a 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -472,6 +472,24 @@ config LIVEPATCH
 
 	  If unsure, say Y.
 
+config PAYLOAD_VERIFY
+	bool "Verify signed LivePatch payloads"
+	depends on LIVEPATCH
+	select CRYPTO
+	help
+	  Verify signed LivePatch payloads using an RSA public key built
+	  into the Xen hypervisor. Selecting this option requires a
+	  public key in PEM format to be available for embedding during
+	  the build.
+
+config PAYLOAD_VERIFY_KEY
+	string "File name of public key used to verify payloads"
+	default "verify_key.pem"
+	depends on PAYLOAD_VERIFY
+	help
+	  The file name of an RSA public key in PEM format to be used for
+	  verifying signed LivePatch payloads.
+
 config FAST_SYMBOL_LOOKUP
 	bool "Fast symbol lookup (bigger binary)"
 	default y
diff --git a/xen/crypto/Makefile b/xen/crypto/Makefile
index db29655333a3..3d17232b78bc 100644
--- a/xen/crypto/Makefile
+++ b/xen/crypto/Makefile
@@ -1,2 +1,13 @@
 obj-y += rijndael.o
 obj-y += vmac.o
+
+obj-$(CONFIG_PAYLOAD_VERIFY) += builtin-payload-key.o
+
+key-path := $(objtree)/$(patsubst "%",%,$(CONFIG_PAYLOAD_VERIFY_KEY))
+$(obj)/builtin-payload-key.bin: $(key-path) $(srctree)/tools/extract-key.py
+	$(srctree)/tools/extract-key.py < $< > $@.new
+	$(call move-if-changed,$@.new,$@)
+
+$(obj)/builtin-payload-key.S: BINFILE_FLAGS := -i
+$(obj)/builtin-payload-key.S: $(srctree)/tools/binfile $(obj)/builtin-payload-key.bin FORCE
+	$(call if_changed,binfile,$(obj)/builtin-payload-key.bin xen_livepatch_key_data)
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index d074a5bebecc..52f90cbed45b 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -143,6 +143,11 @@ struct payload;
 int revert_payload(struct payload *data);
 void revert_payload_tail(struct payload *data);
 
+#ifdef CONFIG_PAYLOAD_VERIFY
+/* The public key data contained with Xen used to verify payload signatures. */
+extern const uint8_t xen_livepatch_key_data[];
+#endif
+
 #else
 
 /*
diff --git a/xen/tools/extract-key.py b/xen/tools/extract-key.py
new file mode 100755
index 000000000000..05c6bc261b3f
--- /dev/null
+++ b/xen/tools/extract-key.py
@@ -0,0 +1,40 @@
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
+# Use little-endian for lengths.
+# Use big-endian for byte sequences (as openssl does).
+
+sys.stdout.buffer.write(struct.pack('<I', len(n)))
+sys.stdout.buffer.write(n)
+sys.stdout.buffer.write(struct.pack('<I', len(e)))
+sys.stdout.buffer.write(e)
-- 
2.49.0


