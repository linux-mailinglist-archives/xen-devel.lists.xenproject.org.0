Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EB7AB82FF
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 11:39:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985052.1371007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFV3L-0006RF-9o; Thu, 15 May 2025 09:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985052.1371007; Thu, 15 May 2025 09:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFV3L-0006Oz-5d; Thu, 15 May 2025 09:38:59 +0000
Received: by outflank-mailman (input) for mailman id 985052;
 Thu, 15 May 2025 09:38:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DjGQ=X7=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uFV3J-00064K-RB
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 09:38:57 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c734429-3170-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 11:38:57 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5f4d0da2d2cso1336216a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 02:38:57 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad23ad2b386sm895152066b.104.2025.05.15.02.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 02:38:45 -0700 (PDT)
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
X-Inumbo-ID: 6c734429-3170-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747301937; x=1747906737; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mI8pwGmu4+lpXzloXzs62CfY/4mwVbPPP3HB7j9Crbc=;
        b=LIOymE3HvUV6fV5iIeb/R+4iKaEvQjewGW5P3w5+L+sbDJxs7t/NfPpD6LCLG1dhjR
         i9zYR9s7YNnM5BBCESwp/yKdtQccmi6+aM74GQRm2XMZLWXS5XwIH/vlNnN7jC7VTLjI
         JrXQ89NfWIIxQh/jHiNc2FTfqQQkAQRNkrR4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747301937; x=1747906737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mI8pwGmu4+lpXzloXzs62CfY/4mwVbPPP3HB7j9Crbc=;
        b=nobgdEIxPWPerVEi7WUkpYf91CevOhGlq7TmLb0kwgXWuRvI65/Lz2S+bYzrZF5haK
         etEeIZ6I0N0+LpphDLpp3XlRLas4LmCQu4qgHMzQ4walm/EouQceSNqnwTvOUKVRUZ+g
         9xI0NFyOM9w7oJD+dQrEvcdRyV+RkITQQ1KLwbXba9amd+E8rL4t3xitqOijP/yQ/87+
         z4HSpl86fvSGFApG9jYjOwpFR+CcY+OMG39v7S5TJ7tFQF0W3BJnC6lzGmJ0gFthbjrs
         RZqy07GWMgzuGyjCTfVvDad3IEnKSD3U0pbaP4ZT9wW3mz0Hg7/V8eedHAZ7lbicMMHU
         /4bQ==
X-Gm-Message-State: AOJu0YzTO/w5EDvE+4TmSRtB99k6N3JJTC5GUGIaHHSlJCflLzBA99c7
	LMQV/G92AfdDXydH5aVdWqobLiFh8DbsU0iA+LBMa2NgI8anS9UrhgtVXsMFHqucwQzQbp/3/Cc
	=
X-Gm-Gg: ASbGncvyt69qTOIpI0etAxKlfzVw09/hr7FEDR8ISNovwAYbjpwDhm+x7XTLFTsSCmj
	lRghvngGb6FzmhyNZ3mVLrPOtBnZdhE/p5tm8tvWZuPYyBXVzM9bFBwGW98gIbSBevbQKzlqA8L
	S237t40M4p8yokoRxhGeSX7Gtsix3Zh/Ko9bjUpuLncaN3ysaOG3PfVK+2r/ENerElvx8oifHtA
	/OxZv9Cwq8RA5AymlacxLjiO54yq/7P4ZF+Z7K2CDZcsyKAQkmRKPNUzJdvWisZEbWNNxO8I0at
	8O6twg8ZLdmOs8stRfvNjvpwKtOuEXXtw3xn7ohsH2q9ekbIair096xFnGuDOWihE4iqZ7pCt0s
	=
X-Google-Smtp-Source: AGHT+IEc0aCKX8aM831QI5j5in052DGx5TrDoOOTTvkREwyfXgYPfKZpNrkdblEGBzby2dBNg5eLVA==
X-Received: by 2002:a17:907:7ba3:b0:aca:cac8:1cf9 with SMTP id a640c23a62f3a-ad515e73b6bmr140690166b.33.1747301925861;
        Thu, 15 May 2025 02:38:45 -0700 (PDT)
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
Subject: [PATCH v2 2/5] livepatch: Embed public key in Xen
Date: Thu, 15 May 2025 10:38:17 +0100
Message-ID: <20250515093822.659916-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515093822.659916-1-ross.lagerwall@citrix.com>
References: <20250515093822.659916-1-ross.lagerwall@citrix.com>
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

In v2:

* Split the loading part into a separate patch.
* Expect public key in object tree rather than source tree.
* Rename Kconfig symbols and others to reflect that it is used for
  verification in Xen rather than signing.
* Move extern declaration to a header.
* Move raw key data to init.rodata.

 xen/common/Kconfig          | 18 ++++++++++++++++++
 xen/crypto/Makefile         | 13 +++++++++++++
 xen/include/xen/livepatch.h |  6 ++++++
 xen/tools/extract-key.py    | 37 +++++++++++++++++++++++++++++++++++++
 4 files changed, 74 insertions(+)
 create mode 100755 xen/tools/extract-key.py

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6d43be2e6e8a..e4466db595c2 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -461,6 +461,24 @@ config LIVEPATCH
 
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
index db29655333a3..64ed90ba55b1 100644
--- a/xen/crypto/Makefile
+++ b/xen/crypto/Makefile
@@ -1,2 +1,15 @@
 obj-y += rijndael.o
 obj-y += vmac.o
+
+obj-$(CONFIG_PAYLOAD_VERIFY) += builtin_payload_key.o
+
+ifeq ($(CONFIG_PAYLOAD_VERIFY),y)
+key_path := $(objtree)/$(patsubst "%",%,$(CONFIG_PAYLOAD_VERIFY_KEY))
+$(obj)/builtin_payload_key.bin: $(key_path) $(srctree)/tools/extract-key.py
+	$(srctree)/tools/extract-key.py < $< > $@.new
+	$(call move-if-changed,$@.new,$@)
+
+$(obj)/builtin_payload_key.S: BINFILE_FLAGS := -i
+$(obj)/builtin_payload_key.S: $(srctree)/tools/binfile $(obj)/builtin_payload_key.bin FORCE
+	$(call if_changed,binfile,$(obj)/builtin_payload_key.bin xen_livepatch_key_data)
+endif
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index d074a5bebecc..0265f1fce057 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -18,6 +18,7 @@ struct xen_sysctl_livepatch_op;
 
 #ifdef CONFIG_LIVEPATCH
 
+#include <xen/init.h>
 #include <xen/lib.h>
 
 /*
@@ -143,6 +144,11 @@ struct payload;
 int revert_payload(struct payload *data);
 void revert_payload_tail(struct payload *data);
 
+#ifdef CONFIG_PAYLOAD_VERIFY
+/* The public key data contained with Xen used to verify payload signatures. */
+extern const uint8_t __initconst xen_livepatch_key_data[];
+#endif
+
 #else
 
 /*
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


