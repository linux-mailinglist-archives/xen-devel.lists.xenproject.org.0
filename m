Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 664DBACAF2A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 15:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003323.1382873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5LW-0000k9-5n; Mon, 02 Jun 2025 13:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003323.1382873; Mon, 02 Jun 2025 13:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5LW-0000eh-0D; Mon, 02 Jun 2025 13:36:58 +0000
Received: by outflank-mailman (input) for mailman id 1003323;
 Mon, 02 Jun 2025 13:36:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2MT+=YR=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uM5LU-00009x-Az
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 13:36:56 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a557f18b-3fb6-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 15:36:54 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ad52dfe06ceso550851666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 06:36:54 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d82becbsm801962166b.39.2025.06.02.06.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 06:36:52 -0700 (PDT)
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
X-Inumbo-ID: a557f18b-3fb6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748871413; x=1749476213; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZPdtLJc6ueITKp0X/zmlW9IvyS6npVX/EwxkveUrjM=;
        b=QERCK1rnR5+NnpMy+vH7yHVHj60lMStvloWQx99XAZ9nSV1RI+Sp3as/5EuGBfeuvo
         m+HAJOYVfVuy8RpaXGGoutHWrZDk6BJystCpXLvffp/tyknhY5cGaxz16VGg5WQtTRL6
         kYKoOX+ma27Sp41neGEHs62I2RPSb4xjERyHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748871413; x=1749476213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZPdtLJc6ueITKp0X/zmlW9IvyS6npVX/EwxkveUrjM=;
        b=b8wg5lv9duhZ/kNMjE5h/4bv3MuuxRTOa4q1+in9J3efK0z4+egQ0Cktrb5QAp4IOV
         mZj+94j4HZr4GvKB6DEtbj2/5X7jdFvfJpE/04X1MxiQvisL/uHm0mBcOrFSZU3FRC/1
         HZyi8L7VsMqyH3ZOobPtMB4veEenkwY5/Zsm+sXIv/cV8qyeTDi6i5NzSw+6eGsJRE7j
         MCT94b+1lc2XJU6439NUYGNIiE6bu09JOTmVYWBQHWasP96UPDntkAuEgTazjbZUcbxa
         JfeIMnsOpXkx4mUnX3szFQrKCYVplDY3okmJLmDjCTvec0T/xPL8UGBPLg7FvEVh3TJU
         Pb1Q==
X-Gm-Message-State: AOJu0YwJf4DY/atAMqkIHE1qhZT5D7CgwB+yqj3vkmRK0ZPxiC3QVeJh
	Ikkt4ia8zJdWTmkuD/EchXb5+K1x71ehVpuMDhPc1DIJ9kymOYm1vF08P7Xo+fp/kzXaF4ls5zg
	5X0M=
X-Gm-Gg: ASbGncvFR3K0ots+kS+WVjH6yp0Np7rJOV5s4MfANigB78mVWoeJm1PIsVGbJhYrX7b
	iW0XDpDPjrU7E45P9NCYRpC9FGWlcyL+ShfnT7MDvQNZHbKXIxH/yb7JaBzt000EOaVo8k6W8Qc
	GIg9xiqpu7w4hrknn3K9E3eTNT+HP8TYvUn6S096lLy0DEV7s2KOdZoRZvcC1Kt9bLFi6PwC0ax
	ickRdc8It0MHNoXsVnjujLU590X3AzCxBKTqT1Jnr/3r4idH7fHJoDze5NVDqSu+BFTx5PHMWp/
	FgdZWuLcDJTCedUsJrCJ5R7yrHS0S0sUK0lRZAt6tXHK/rYNkxvbNMpjd/SMQlkHDiGq5VkUOyk
	=
X-Google-Smtp-Source: AGHT+IHX8If27lZf8Ncnm7cXY3VU/q8YWymJgLlu48b5CE6uCMIrbABR2hXvEzw8xHk76saiyMy5Ig==
X-Received: by 2002:a17:907:9349:b0:ad8:9257:5741 with SMTP id a640c23a62f3a-adb4936fa69mr634306066b.9.1748871412511;
        Mon, 02 Jun 2025 06:36:52 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 3/5] crypto: Add RSA support
Date: Mon,  2 Jun 2025 14:36:35 +0100
Message-ID: <20250602133639.2871212-4-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
References: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In preparation for adding support for livepatch signing, add support for
RSA crypto.

The RSA code is extracted from Nettle at tag nettle_3.2_release_20160128
(https://git.lysator.liu.se/nettle/nettle).

The MPI code is extracted from Linux at commit eef0df6a5953 (lib/mpi/*).

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

In v3:

* Move mpi.c to lib
* Fix header guard name

 xen/crypto/Makefile   |    1 +
 xen/crypto/rsa.c      |  196 +++++
 xen/include/xen/mpi.h |   68 ++
 xen/include/xen/rsa.h |   74 ++
 xen/lib/Makefile      |    1 +
 xen/lib/mpi.c         | 1729 +++++++++++++++++++++++++++++++++++++++++
 6 files changed, 2069 insertions(+)
 create mode 100644 xen/crypto/rsa.c
 create mode 100644 xen/include/xen/mpi.h
 create mode 100644 xen/include/xen/rsa.h
 create mode 100644 xen/lib/mpi.c

diff --git a/xen/crypto/Makefile b/xen/crypto/Makefile
index 3d17232b78bc..55a045a7f0c0 100644
--- a/xen/crypto/Makefile
+++ b/xen/crypto/Makefile
@@ -1,4 +1,5 @@
 obj-y += rijndael.o
+obj-$(CONFIG_PAYLOAD_VERIFY) += rsa.o
 obj-y += vmac.o
 
 obj-$(CONFIG_PAYLOAD_VERIFY) += builtin-payload-key.o
diff --git a/xen/crypto/rsa.c b/xen/crypto/rsa.c
new file mode 100644
index 000000000000..bd78c65f7393
--- /dev/null
+++ b/xen/crypto/rsa.c
@@ -0,0 +1,196 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later OR LGPL-3.0-or-later */
+/* rsa.c
+
+   The RSA publickey algorithm.
+
+   Copyright (C) 2001 Niels Möller
+
+   This file is part of GNU Nettle.
+
+   GNU Nettle is free software: you can redistribute it and/or
+   modify it under the terms of either:
+
+     * the GNU Lesser General Public License as published by the Free
+       Software Foundation; either version 3 of the License, or (at your
+       option) any later version.
+
+   or
+
+     * the GNU General Public License as published by the Free
+       Software Foundation; either version 2 of the License, or (at your
+       option) any later version.
+
+   or both in parallel, as here.
+
+   GNU Nettle is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   General Public License for more details.
+
+   You should have received copies of the GNU General Public License and
+   the GNU Lesser General Public License along with this program.  If
+   not, see http://www.gnu.org/licenses/.
+*/
+
+#include <xen/bug.h>
+#include <xen/err.h>
+#include <xen/lib.h>
+#include <xen/rsa.h>
+#include <xen/sha2.h>
+#include <xen/string.h>
+
+void rsa_public_key_init(struct rsa_public_key *key)
+{
+    key->n = NULL;
+    key->e = NULL;
+    key->size = 0;
+}
+
+/*
+ * Computes the size, in octets, of the modulo. Returns 0 if the
+ * modulo is too small to be useful, or otherwise appears invalid.
+ */
+static size_t rsa_check_size(MPI n)
+{
+    /* Round upwards */
+    size_t size;
+
+    /* Even moduli are invalid */
+    if ( mpi_test_bit(n, 0) == 0 )
+        return 0;
+
+    size = (mpi_get_nbits(n) + 7) / 8;
+
+    if ( size < RSA_MINIMUM_N_OCTETS )
+        return 0;
+
+    return size;
+}
+
+int rsa_public_key_prepare(struct rsa_public_key *key)
+{
+    if ( !key->n || !key->e || key->size )
+        return -EINVAL;
+
+    key->size = rsa_check_size(key->n);
+
+    return key->size > 0 ? 0 : -EINVAL;
+}
+
+/*
+ * Formats the PKCS#1 padding, of the form
+ *
+ *   0x00 0x01 0xff ... 0xff 0x00 id ...digest...
+ *
+ * where the 0xff ... 0xff part consists of at least 8 octets. The
+ * total size equals the octet size of n.
+ */
+static uint8_t *pkcs1_signature_prefix(unsigned int key_size, uint8_t *buffer,
+                                       unsigned int id_size, const uint8_t *id,
+                                       unsigned int digest_size)
+{
+    unsigned int j;
+
+    if ( key_size < 11 + id_size + digest_size )
+        return NULL;
+
+    j = key_size - digest_size - id_size;
+
+    memcpy(buffer + j, id, id_size);
+    buffer[0] = 0;
+    buffer[1] = 1;
+    buffer[j - 1] = 0;
+
+    ASSERT(j >= 11);
+    memset(buffer + 2, 0xff, j - 3);
+
+    return buffer + j + id_size;
+}
+
+/*
+ * From RFC 3447, Public-Key Cryptography Standards (PKCS) #1: RSA
+ * Cryptography Specifications Version 2.1.
+ *
+ *     id-sha256    OBJECT IDENTIFIER ::=
+ *       {joint-iso-itu-t(2) country(16) us(840) organization(1)
+ *         gov(101) csor(3) nistalgorithm(4) hashalgs(2) 1}
+ */
+static const uint8_t
+sha256_prefix[] =
+{
+  /* 19 octets prefix, 32 octets hash, total 51 */
+  0x30,      49, /* SEQUENCE */
+    0x30,    13, /* SEQUENCE */
+      0x06,   9, /* OBJECT IDENTIFIER */
+        0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x01,
+      0x05,   0, /* NULL */
+    0x04,    32  /* OCTET STRING */
+      /* Here comes the raw hash value */
+};
+
+static int pkcs1_rsa_sha256_encode(MPI *m, size_t key_size,
+                                   struct sha2_256_state *hash)
+{
+    uint8_t *ptr;
+    uint8_t *buf;
+
+    buf = xmalloc_bytes(key_size);
+    if ( !buf )
+        return -ENOMEM;
+
+    ptr = pkcs1_signature_prefix(key_size, buf,
+                                 sizeof(sha256_prefix), sha256_prefix,
+                                 SHA2_256_DIGEST_SIZE);
+    if ( !ptr )
+    {
+        xfree(buf);
+        return -EINVAL;
+    }
+
+    sha2_256_final(hash, ptr);
+    *m = mpi_read_raw_data(buf, key_size);
+    xfree(buf);
+    return 0;
+}
+
+static int rsa_verify(const struct rsa_public_key *key, MPI m, MPI s)
+{
+    int ret;
+    MPI m1;
+
+    /* (1) Validate 0 <= s < n */
+    if ( mpi_cmp_ui(s, 0) < 0 || mpi_cmp(s, key->n) >= 0 )
+        return -EINVAL;
+
+    m1 = mpi_alloc(key->size / BYTES_PER_MPI_LIMB);
+    if ( !m1 )
+        return -ENOMEM;
+
+    /* (2) m = s^e mod n */
+    ret = mpi_powm(m1, s, key->e, key->n);
+    if ( ret )
+        goto out;
+
+    ret = mpi_cmp(m, m1) ? -EINVAL : 0;
+
+ out:
+    mpi_free(m1);
+    return ret;
+}
+
+int rsa_sha256_verify(const struct rsa_public_key *key,
+                      struct sha2_256_state *hash, MPI s)
+{
+    int ret;
+    MPI m;
+
+    ret = pkcs1_rsa_sha256_encode(&m, key->size, hash);
+    if ( ret )
+        return ret;
+
+    ret = rsa_verify(key, m, s);
+
+    mpi_free(m);
+
+    return ret;
+}
diff --git a/xen/include/xen/mpi.h b/xen/include/xen/mpi.h
new file mode 100644
index 000000000000..2d6adb8d8d0a
--- /dev/null
+++ b/xen/include/xen/mpi.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* mpi.h  -  Multi Precision Integers
+ *        Copyright (C) 1994, 1996, 1998, 1999,
+ *                    2000, 2001 Free Software Foundation, Inc.
+ *
+ * This file is part of GNUPG.
+ *
+ * GNUPG is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * GNUPG is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
+ *
+ * Note: This code is heavily based on the GNU MP Library.
+ *         Actually it's the same code with only minor changes in the
+ *         way the data is stored; this is to support the abstraction
+ *         of an optional secure memory allocation which may be used
+ *         to avoid revealing of sensitive data due to paging etc.
+ *         The GNU MP Library itself is published under the LGPL;
+ *         however I decided to publish this code under the plain GPL.
+ */
+
+#ifndef XEN_MPI_H
+#define XEN_MPI_H
+
+#include <xen/types.h>
+
+#define BYTES_PER_MPI_LIMB      (BITS_PER_LONG / 8)
+#define BITS_PER_MPI_LIMB       BITS_PER_LONG
+
+typedef unsigned long int mpi_limb_t;
+typedef signed long int mpi_limb_signed_t;
+
+struct mpi {
+    int alloced;        /* array size (# of allocated limbs) */
+    int nlimbs;         /* number of valid limbs */
+    int nbits;          /* the real number of valid bits (info only) */
+    int sign;           /* indicates a negative number */
+#define MPI_FLAG_SECURE_MEM (1 << 0)
+#define MPI_FLAG_UNUSED     (1 << 1)
+#define MPI_FLAG_PTR_ALLOC  (1 << 4)
+#define MPI_FLAG_MASK       7
+    unsigned int flags; /* bit 0: array must be allocated in secure memory space */
+                        /* bit 1: not used */
+                        /* bit 2: the limb is a pointer to some m_alloced data */
+    mpi_limb_t *d;      /* array with the limbs */
+};
+
+typedef struct mpi *MPI;
+
+MPI mpi_alloc(unsigned nlimbs);
+void mpi_free(MPI a);
+MPI mpi_read_raw_data(const void *xbuffer, size_t nbytes);
+int mpi_powm(MPI res, MPI base, MPI exp, MPI mod);
+int mpi_cmp_ui(MPI u, unsigned long v);
+int mpi_cmp(MPI u, MPI v);
+unsigned mpi_get_nbits(MPI a);
+int mpi_test_bit(MPI a, unsigned int n);
+
+#endif /* XEN_MPI_H */
diff --git a/xen/include/xen/rsa.h b/xen/include/xen/rsa.h
new file mode 100644
index 000000000000..be60383b18d5
--- /dev/null
+++ b/xen/include/xen/rsa.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later OR LGPL-3.0-or-later */
+/* rsa.h
+
+   The RSA publickey algorithm.
+
+   Copyright (C) 2001, 2002 Niels Möller
+
+   This file is part of GNU Nettle.
+
+   GNU Nettle is free software: you can redistribute it and/or
+   modify it under the terms of either:
+
+     * the GNU Lesser General Public License as published by the Free
+       Software Foundation; either version 3 of the License, or (at your
+       option) any later version.
+
+   or
+
+     * the GNU General Public License as published by the Free
+       Software Foundation; either version 2 of the License, or (at your
+       option) any later version.
+
+   or both in parallel, as here.
+
+   GNU Nettle is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   General Public License for more details.
+
+   You should have received copies of the GNU General Public License and
+   the GNU Lesser General Public License along with this program.  If
+   not, see http://www.gnu.org/licenses/.
+*/
+ 
+#ifndef XEN_RSA_H
+#define XEN_RSA_H
+
+#include <xen/mpi.h>
+#include <xen/types.h>
+
+struct sha2_256_state;
+
+/*
+ * This limit is somewhat arbitrary. Technically, the smallest modulo
+ * which makes sense at all is 15 = 3*5, phi(15) = 8, size 4 bits. But
+ * for ridiculously small keys, not all odd e are possible (e.g., for
+ * 5 bits, the only possible modulo is 3*7 = 21, phi(21) = 12, and e =
+ * 3 don't work). The smallest size that makes sense with pkcs#1, and
+ * which allows RSA encryption of one byte messages, is 12 octets, 89
+ * bits.
+ */
+#define RSA_MINIMUM_N_OCTETS 12
+#define RSA_MINIMUM_N_BITS (8 * RSA_MINIMUM_N_OCTETS - 7)
+
+struct rsa_public_key
+{
+    /*
+     * Size of the modulo, in octets. This is also the size of all
+     * signatures that are created or verified with this key.
+     */
+    size_t size;
+    MPI n; /* Modulo */
+    MPI e; /* Public exponent */
+};
+
+void rsa_public_key_init(struct rsa_public_key *key);
+
+int rsa_public_key_prepare(struct rsa_public_key *key);
+
+int rsa_sha256_verify(const struct rsa_public_key *key,
+                      struct sha2_256_state *hash,
+                      MPI signature);
+
+#endif /* XEN_RSA_H */
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 5ccb1e5241c5..f37367277ede 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -14,6 +14,7 @@ lib-y += memcmp.o
 lib-y += memcpy.o
 lib-y += memmove.o
 lib-y += memset.o
+lib-y += mpi.o
 lib-y += muldiv64.o
 lib-y += parse-size.o
 lib-y += rbtree.o
diff --git a/xen/lib/mpi.c b/xen/lib/mpi.c
new file mode 100644
index 000000000000..94010d14b3d0
--- /dev/null
+++ b/xen/lib/mpi.c
@@ -0,0 +1,1729 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* mpi.c  -  MPI functions
+ * Copyright (C) 1994, 1996, 1998, 2000 Free Software Foundation, Inc.
+ *
+ * This file is part of GnuPG.
+ *
+ * GnuPG is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * GnuPG is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
+ *
+ * Note: This code is heavily based on the GNU MP Library.
+ *	 Actually it's the same code with only minor changes in the
+ *	 way the data is stored; this is to support the abstraction
+ *	 of an optional secure memory allocation which may be used
+ *	 to avoid revealing of sensitive data due to paging etc.
+ *	 The GNU MP Library itself is published under the LGPL;
+ *	 however I decided to publish this code under the plain GPL.
+ */
+
+#include <xen/bitops.h>
+#include <xen/bug.h>
+#include <xen/err.h>
+#include <xen/lib.h>
+#include <xen/mpi.h>
+#include <xen/string.h>
+#include <xen/xmalloc.h>
+
+#define MAX_EXTERN_MPI_BITS 16384
+
+/* Define it to a value which is good on most machines.
+ * tested 4, 16, 32 and 64, where 16 gave the best performance when
+ * checking a 768 and a 1024 bit ElGamal signature.
+ * (wk 22.12.97) */
+#define KARATSUBA_THRESHOLD 16
+
+typedef mpi_limb_t *mpi_ptr_t;	/* pointer to a limb */
+typedef int mpi_size_t;		/* (must be a signed type) */
+
+/* Copy N limbs from S to D.  */
+#define MPN_COPY(d, s, n) \
+	do {					\
+		mpi_size_t _i;			\
+		for (_i = 0; _i < (n); _i++)	\
+			(d)[_i] = (s)[_i];	\
+	} while (0)
+
+#define MPN_COPY_DECR(d, s, n) \
+	do {					\
+		mpi_size_t _i;			\
+		for (_i = (n)-1; _i >= 0; _i--) \
+			(d)[_i] = (s)[_i];	\
+	} while (0)
+
+/* Zero N limbs at D */
+#define MPN_ZERO(d, n) \
+	do {					\
+		mpi_size_t  _i;			\
+		for (_i = 0; _i < (n); _i++)	\
+			(d)[_i] = 0;		\
+	} while (0)
+
+#define MPN_NORMALIZE(d, n)  \
+	do {					\
+		while ((n) > 0) {		\
+			if ((d)[(n)-1])		\
+				break;		\
+			(n)--;			\
+		}				\
+	} while (0)
+
+#define MPN_MUL_N_RECURSE(prodp, up, vp, size, tspace)		\
+	do {							\
+		if ((size) < KARATSUBA_THRESHOLD)		\
+			mul_n_basecase(prodp, up, vp, size);	\
+		else						\
+			mul_n(prodp, up, vp, size, tspace);	\
+	} while (0);
+
+#define MPN_SQR_N_RECURSE(prodp, up, size, tspace)		\
+	do {							\
+		if ((size) < KARATSUBA_THRESHOLD)		\
+			mpih_sqr_n_basecase(prodp, up, size);	\
+		else						\
+			mpih_sqr_n(prodp, up, size, tspace);	\
+	} while (0);
+
+#define add_ssaaaa(sh, sl, ah, al, bh, bl) \
+do { \
+	mpi_limb_t __x; \
+	__x = (al) + (bl); \
+	(sh) = (ah) + (bh) + (__x < (al)); \
+	(sl) = __x; \
+} while (0)
+
+#define sub_ddmmss(sh, sl, ah, al, bh, bl) \
+do { \
+	mpi_limb_t __x; \
+	__x = (al) - (bl); \
+	(sh) = (ah) - (bh) - (__x > (al)); \
+	(sl) = __x; \
+} while (0)
+
+#define __ll_B ((mpi_limb_t) 1 << (BITS_PER_MPI_LIMB / 2))
+#define __ll_lowpart(t) ((mpi_limb_t) (t) & (__ll_B - 1))
+#define __ll_highpart(t) ((mpi_limb_t) (t) >> (BITS_PER_MPI_LIMB / 2))
+
+#define umul_ppmm(w1, w0, u, v) \
+do { \
+	mpi_limb_t __x0, __x1, __x2, __x3; \
+	unsigned int __ul, __vl, __uh, __vh; \
+	mpi_limb_t __u = (u), __v = (v); \
+	\
+	__ul = __ll_lowpart(__u); \
+	__uh = __ll_highpart(__u); \
+	__vl = __ll_lowpart(__v); \
+	__vh = __ll_highpart(__v); \
+	\
+	__x0 = (mpi_limb_t) __ul * __vl; \
+	__x1 = (mpi_limb_t) __ul * __vh; \
+	__x2 = (mpi_limb_t) __uh * __vl; \
+	__x3 = (mpi_limb_t) __uh * __vh; \
+	\
+	__x1 += __ll_highpart(__x0);/* this can't give carry */ \
+	__x1 += __x2;		/* but this indeed can */ \
+	if (__x1 < __x2)		/* did we get it? */ \
+	__x3 += __ll_B;		/* yes, add it in the proper pos. */ \
+	\
+	(w1) = __x3 + __ll_highpart(__x1); \
+	(w0) = (__ll_lowpart(__x1) << BITS_PER_MPI_LIMB/2) + __ll_lowpart(__x0); \
+} while (0)
+
+#define udiv_qrnnd(q, r, n1, n0, d) \
+do { \
+	mpi_limb_t __d1, __d0, __q1, __q0, __r1, __r0, __m; \
+	__d1 = __ll_highpart(d); \
+	__d0 = __ll_lowpart(d); \
+	\
+	__r1 = (n1) % __d1; \
+	__q1 = (n1) / __d1; \
+	__m = (mpi_limb_t) __q1 * __d0; \
+	__r1 = __r1 * __ll_B | __ll_highpart(n0); \
+	if (__r1 < __m) { \
+		__q1--, __r1 += (d); \
+		if (__r1 >= (d)) /* i.e. we didn't get carry when adding to __r1 */ \
+		if (__r1 < __m) \
+			__q1--, __r1 += (d); \
+	} \
+	__r1 -= __m; \
+	\
+	__r0 = __r1 % __d1; \
+	__q0 = __r1 / __d1; \
+	__m = (mpi_limb_t) __q0 * __d0; \
+	__r0 = __r0 * __ll_B | __ll_lowpart(n0); \
+	if (__r0 < __m) { \
+		__q0--, __r0 += (d); \
+		if (__r0 >= (d)) \
+			if (__r0 < __m) \
+				__q0--, __r0 += (d); \
+	} \
+	__r0 -= __m; \
+	\
+	(q) = (mpi_limb_t) __q1 * __ll_B | __q0; \
+	(r) = __r0; \
+} while (0)
+
+struct karatsuba_ctx {
+	struct karatsuba_ctx *next;
+	mpi_ptr_t tspace;
+	mpi_size_t tspace_size;
+	mpi_ptr_t tp;
+	mpi_size_t tp_size;
+};
+
+static void mpi_normalize(MPI a);
+static mpi_limb_t mpihelp_submul_1(mpi_ptr_t res_ptr, mpi_ptr_t s1_ptr,
+			    mpi_size_t s1_size, mpi_limb_t s2_limb);
+static mpi_limb_t mpihelp_divrem(mpi_ptr_t qp, mpi_size_t qextra_limbs,
+			  mpi_ptr_t np, mpi_size_t nsize,
+			  mpi_ptr_t dp, mpi_size_t dsize);
+static mpi_limb_t mpihelp_rshift(mpi_ptr_t wp, mpi_ptr_t up, mpi_size_t usize,
+			  unsigned cnt);
+static void mpi_assign_limb_space(MPI a, mpi_ptr_t ap, unsigned nlimbs);
+static mpi_ptr_t mpi_alloc_limb_space(unsigned nlimbs);
+static void mpi_free_limb_space(mpi_ptr_t a);
+static mpi_limb_t mpihelp_addmul_1(mpi_ptr_t res_ptr, mpi_ptr_t s1_ptr,
+			    mpi_size_t s1_size, mpi_limb_t s2_limb);
+static int mpihelp_mul(mpi_ptr_t prodp, mpi_ptr_t up, mpi_size_t usize,
+		mpi_ptr_t vp, mpi_size_t vsize, mpi_limb_t *_result);
+static mpi_limb_t mpihelp_lshift(mpi_ptr_t wp, mpi_ptr_t up, mpi_size_t usize,
+			  unsigned cnt);
+static int mpihelp_cmp(mpi_ptr_t op1_ptr, mpi_ptr_t op2_ptr, mpi_size_t size);
+static void mpih_sqr_n(mpi_ptr_t prodp, mpi_ptr_t up, mpi_size_t size,
+		mpi_ptr_t tspace);
+static mpi_limb_t mpihelp_add_n(mpi_ptr_t res_ptr, mpi_ptr_t s1_ptr,
+			 mpi_ptr_t s2_ptr, mpi_size_t size);
+static mpi_limb_t mpihelp_sub_n(mpi_ptr_t res_ptr, mpi_ptr_t s1_ptr,
+			 mpi_ptr_t s2_ptr, mpi_size_t size);
+static mpi_limb_t mpihelp_mul_1(mpi_ptr_t res_ptr, mpi_ptr_t s1_ptr,
+			 mpi_size_t s1_size, mpi_limb_t s2_limb);
+static void mpihelp_release_karatsuba_ctx(struct karatsuba_ctx *ctx);
+static void mpih_sqr_n_basecase(mpi_ptr_t prodp, mpi_ptr_t up, mpi_size_t size);
+static int mpihelp_mul_karatsuba_case(mpi_ptr_t prodp,
+			       mpi_ptr_t up, mpi_size_t usize,
+			       mpi_ptr_t vp, mpi_size_t vsize,
+			       struct karatsuba_ctx *ctx);
+static int mpi_resize(MPI a, unsigned nlimbs);
+
+/**
+ * count_leading_zeros - Count the number of zeros from the MSB back
+ * @x: The value
+ *
+ * Count the number of leading zeros from the MSB going towards the LSB in @x.
+ *
+ * If the MSB of @x is set, the result is 0.
+ * If only the LSB of @x is set, then the result is BITS_PER_LONG-1.
+ * If @x is 0 then the result is BITS_PER_LONG.
+ */
+static inline int count_leading_zeros(unsigned long x)
+{
+	if (sizeof(x) == 4)
+		return BITS_PER_LONG - fls(x);
+	else
+		return BITS_PER_LONG - fls64(x);
+}
+
+static mpi_limb_t
+mpihelp_add_1(mpi_ptr_t res_ptr, mpi_ptr_t s1_ptr,
+	      mpi_size_t s1_size, mpi_limb_t s2_limb)
+{
+	mpi_limb_t x;
+
+	x = *s1_ptr++;
+	s2_limb += x;
+	*res_ptr++ = s2_limb;
+	if (s2_limb < x) {	/* sum is less than the left operand: handle carry */
+		while (--s1_size) {
+			x = *s1_ptr++ + 1;	/* add carry */
+			*res_ptr++ = x;	/* and store */
+			if (x)	/* not 0 (no overflow): we can stop */
+				goto leave;
+		}
+		return 1;	/* return carry (size of s1 to small) */
+	}
+
+ leave:
+	if (res_ptr != s1_ptr) {	/* not the same variable */
+		mpi_size_t i;	/* copy the rest */
+		for (i = 0; i < s1_size - 1; i++)
+			res_ptr[i] = s1_ptr[i];
+	}
+	return 0;		/* no carry */
+}
+
+static mpi_limb_t
+mpihelp_sub_1(mpi_ptr_t res_ptr, mpi_ptr_t s1_ptr,
+	      mpi_size_t s1_size, mpi_limb_t s2_limb)
+{
+	mpi_limb_t x;
+
+	x = *s1_ptr++;
+	s2_limb = x - s2_limb;
+	*res_ptr++ = s2_limb;
+	if (s2_limb > x) {
+		while (--s1_size) {
+			x = *s1_ptr++;
+			*res_ptr++ = x - 1;
+			if (x)
+				goto leave;
+		}
+		return 1;
+	}
+
+ leave:
+	if (res_ptr != s1_ptr) {
+		mpi_size_t i;
+		for (i = 0; i < s1_size - 1; i++)
+			res_ptr[i] = s1_ptr[i];
+	}
+	return 0;
+}
+
+static mpi_limb_t
+mpihelp_sub(mpi_ptr_t res_ptr, mpi_ptr_t s1_ptr, mpi_size_t s1_size,
+	    mpi_ptr_t s2_ptr, mpi_size_t s2_size)
+{
+	mpi_limb_t cy = 0;
+
+	if (s2_size)
+		cy = mpihelp_sub_n(res_ptr, s1_ptr, s2_ptr, s2_size);
+
+	if (s1_size - s2_size)
+		cy = mpihelp_sub_1(res_ptr + s2_size, s1_ptr + s2_size,
+				   s1_size - s2_size, cy);
+	return cy;
+}
+
+static mpi_ptr_t mpi_alloc_limb_space(unsigned nlimbs)
+{
+	size_t len = nlimbs * sizeof(mpi_limb_t);
+
+	if (!len)
+		return NULL;
+
+	return xmalloc_bytes(len);
+}
+
+static void mpi_free_limb_space(mpi_ptr_t a)
+{
+	if (!a)
+		return;
+
+	xfree(a);
+}
+
+/****************
+ * Resize the array of A to NLIMBS. the additional space is cleared
+ * (set to 0) [done by m_realloc()]
+ */
+static int mpi_resize(MPI a, unsigned nlimbs)
+{
+	void *p;
+
+	if (nlimbs <= a->alloced)
+		return 0;	/* no need to do it */
+
+	if (a->d) {
+		p = xmalloc_array(mpi_limb_t, nlimbs);
+		if (!p)
+			return -ENOMEM;
+		memcpy(p, a->d, a->alloced * sizeof(mpi_limb_t));
+		xfree(a->d);
+		a->d = p;
+	} else {
+		a->d = xzalloc_array(mpi_limb_t, nlimbs);
+		if (!a->d)
+			return -ENOMEM;
+	}
+	a->alloced = nlimbs;
+	return 0;
+}
+
+/****************
+ * RES = BASE ^ EXP mod MOD
+ */
+int mpi_powm(MPI res, MPI base, MPI exp, MPI mod)
+{
+	mpi_ptr_t mp_marker = NULL, bp_marker = NULL, ep_marker = NULL;
+	mpi_ptr_t xp_marker = NULL;
+	mpi_ptr_t tspace = NULL;
+	mpi_ptr_t rp, ep, mp, bp;
+	mpi_size_t esize, msize, bsize, rsize;
+	int msign, bsign, rsign;
+	mpi_size_t size;
+	int mod_shift_cnt;
+	int negative_result;
+	int assign_rp = 0;
+	mpi_size_t tsize = 0;	/* to avoid compiler warning */
+	/* fixme: we should check that the warning is void */
+	int rc = -ENOMEM;
+
+	esize = exp->nlimbs;
+	msize = mod->nlimbs;
+	size = 2 * msize;
+	msign = mod->sign;
+
+	rp = res->d;
+	ep = exp->d;
+
+	if (!msize)
+		return -EINVAL;
+
+	if (!esize) {
+		/* Exponent is zero, result is 1 mod MOD, i.e., 1 or 0
+		 * depending on if MOD equals 1.  */
+		res->nlimbs = (msize == 1 && mod->d[0] == 1) ? 0 : 1;
+		if (res->nlimbs) {
+			if (mpi_resize(res, 1) < 0)
+				goto enomem;
+			rp = res->d;
+			rp[0] = 1;
+		}
+		res->sign = 0;
+		goto leave;
+	}
+
+	/* Normalize MOD (i.e. make its most significant bit set) as required by
+	 * mpn_divrem.  This will make the intermediate values in the calculation
+	 * slightly larger, but the correct result is obtained after a final
+	 * reduction using the original MOD value.  */
+	mp = mp_marker = mpi_alloc_limb_space(msize);
+	if (!mp)
+		goto enomem;
+	mod_shift_cnt = count_leading_zeros(mod->d[msize - 1]);
+	if (mod_shift_cnt)
+		mpihelp_lshift(mp, mod->d, msize, mod_shift_cnt);
+	else
+		MPN_COPY(mp, mod->d, msize);
+
+	bsize = base->nlimbs;
+	bsign = base->sign;
+	if (bsize > msize) {	/* The base is larger than the module. Reduce it. */
+		/* Allocate (BSIZE + 1) with space for remainder and quotient.
+		 * (The quotient is (bsize - msize + 1) limbs.)  */
+		bp = bp_marker = mpi_alloc_limb_space(bsize + 1);
+		if (!bp)
+			goto enomem;
+		MPN_COPY(bp, base->d, bsize);
+		/* We don't care about the quotient, store it above the remainder,
+		 * at BP + MSIZE.  */
+		mpihelp_divrem(bp + msize, 0, bp, bsize, mp, msize);
+		bsize = msize;
+		/* Canonicalize the base, since we are going to multiply with it
+		 * quite a few times.  */
+		MPN_NORMALIZE(bp, bsize);
+	} else
+		bp = base->d;
+
+	if (!bsize) {
+		res->nlimbs = 0;
+		res->sign = 0;
+		goto leave;
+	}
+
+	if (res->alloced < size) {
+		/* We have to allocate more space for RES.  If any of the input
+		 * parameters are identical to RES, defer deallocation of the old
+		 * space.  */
+		if (rp == ep || rp == mp || rp == bp) {
+			rp = mpi_alloc_limb_space(size);
+			if (!rp)
+				goto enomem;
+			assign_rp = 1;
+		} else {
+			if (mpi_resize(res, size) < 0)
+				goto enomem;
+			rp = res->d;
+		}
+	} else {		/* Make BASE, EXP and MOD not overlap with RES.  */
+		if (rp == bp) {
+			/* RES and BASE are identical.  Allocate temp. space for BASE.  */
+			BUG_ON(bp_marker);
+			bp = bp_marker = mpi_alloc_limb_space(bsize);
+			if (!bp)
+				goto enomem;
+			MPN_COPY(bp, rp, bsize);
+		}
+		if (rp == ep) {
+			/* RES and EXP are identical.  Allocate temp. space for EXP.  */
+			ep = ep_marker = mpi_alloc_limb_space(esize);
+			if (!ep)
+				goto enomem;
+			MPN_COPY(ep, rp, esize);
+		}
+		if (rp == mp) {
+			/* RES and MOD are identical.  Allocate temporary space for MOD. */
+			BUG_ON(mp_marker);
+			mp = mp_marker = mpi_alloc_limb_space(msize);
+			if (!mp)
+				goto enomem;
+			MPN_COPY(mp, rp, msize);
+		}
+	}
+
+	MPN_COPY(rp, bp, bsize);
+	rsize = bsize;
+	rsign = bsign;
+
+	{
+		mpi_size_t i;
+		mpi_ptr_t xp;
+		int c;
+		mpi_limb_t e;
+		mpi_limb_t carry_limb;
+		struct karatsuba_ctx karactx;
+
+		xp = xp_marker = mpi_alloc_limb_space(2 * (msize + 1));
+		if (!xp)
+			goto enomem;
+
+		memset(&karactx, 0, sizeof karactx);
+		negative_result = (ep[0] & 1) && base->sign;
+
+		i = esize - 1;
+		e = ep[i];
+		c = count_leading_zeros(e);
+		e = (e << c) << 1;	/* shift the exp bits to the left, lose msb */
+		c = BITS_PER_MPI_LIMB - 1 - c;
+
+		/* Main loop.
+		 *
+		 * Make the result be pointed to alternately by XP and RP.  This
+		 * helps us avoid block copying, which would otherwise be necessary
+		 * with the overlap restrictions of mpihelp_divmod. With 50% probability
+		 * the result after this loop will be in the area originally pointed
+		 * by RP (==RES->d), and with 50% probability in the area originally
+		 * pointed to by XP.
+		 */
+
+		for (;;) {
+			while (c) {
+				mpi_ptr_t tp;
+				mpi_size_t xsize;
+
+				/*if (mpihelp_mul_n(xp, rp, rp, rsize) < 0) goto enomem */
+				if (rsize < KARATSUBA_THRESHOLD)
+					mpih_sqr_n_basecase(xp, rp, rsize);
+				else {
+					if (!tspace) {
+						tsize = 2 * rsize;
+						tspace =
+						    mpi_alloc_limb_space(tsize);
+						if (!tspace)
+							goto enomem;
+					} else if (tsize < (2 * rsize)) {
+						mpi_free_limb_space(tspace);
+						tsize = 2 * rsize;
+						tspace =
+						    mpi_alloc_limb_space(tsize);
+						if (!tspace)
+							goto enomem;
+					}
+					mpih_sqr_n(xp, rp, rsize, tspace);
+				}
+
+				xsize = 2 * rsize;
+				if (xsize > msize) {
+					mpihelp_divrem(xp + msize, 0, xp, xsize,
+						       mp, msize);
+					xsize = msize;
+				}
+
+				tp = rp;
+				rp = xp;
+				xp = tp;
+				rsize = xsize;
+
+				if ((mpi_limb_signed_t) e < 0) {
+					/*mpihelp_mul( xp, rp, rsize, bp, bsize ); */
+					if (bsize < KARATSUBA_THRESHOLD) {
+						mpi_limb_t tmp;
+						if (mpihelp_mul
+						    (xp, rp, rsize, bp, bsize,
+						     &tmp) < 0)
+							goto enomem;
+					} else {
+						if (mpihelp_mul_karatsuba_case
+						    (xp, rp, rsize, bp, bsize,
+						     &karactx) < 0)
+							goto enomem;
+					}
+
+					xsize = rsize + bsize;
+					if (xsize > msize) {
+						mpihelp_divrem(xp + msize, 0,
+							       xp, xsize, mp,
+							       msize);
+						xsize = msize;
+					}
+
+					tp = rp;
+					rp = xp;
+					xp = tp;
+					rsize = xsize;
+				}
+				e <<= 1;
+				c--;
+			}
+
+			i--;
+			if (i < 0)
+				break;
+			e = ep[i];
+			c = BITS_PER_MPI_LIMB;
+		}
+
+		/* We shifted MOD, the modulo reduction argument, left MOD_SHIFT_CNT
+		 * steps.  Adjust the result by reducing it with the original MOD.
+		 *
+		 * Also make sure the result is put in RES->d (where it already
+		 * might be, see above).
+		 */
+		if (mod_shift_cnt) {
+			carry_limb =
+			    mpihelp_lshift(res->d, rp, rsize, mod_shift_cnt);
+			rp = res->d;
+			if (carry_limb) {
+				rp[rsize] = carry_limb;
+				rsize++;
+			}
+		} else {
+			MPN_COPY(res->d, rp, rsize);
+			rp = res->d;
+		}
+
+		if (rsize >= msize) {
+			mpihelp_divrem(rp + msize, 0, rp, rsize, mp, msize);
+			rsize = msize;
+		}
+
+		/* Remove any leading zero words from the result.  */
+		if (mod_shift_cnt)
+			mpihelp_rshift(rp, rp, rsize, mod_shift_cnt);
+		MPN_NORMALIZE(rp, rsize);
+
+		mpihelp_release_karatsuba_ctx(&karactx);
+	}
+
+	if (negative_result && rsize) {
+		if (mod_shift_cnt)
+			mpihelp_rshift(mp, mp, msize, mod_shift_cnt);
+		mpihelp_sub(rp, mp, msize, rp, rsize);
+		rsize = msize;
+		rsign = msign;
+		MPN_NORMALIZE(rp, rsize);
+	}
+	res->nlimbs = rsize;
+	res->sign = rsign;
+
+ leave:
+	rc = 0;
+ enomem:
+	if (assign_rp)
+		mpi_assign_limb_space(res, rp, size);
+	if (mp_marker)
+		mpi_free_limb_space(mp_marker);
+	if (bp_marker)
+		mpi_free_limb_space(bp_marker);
+	if (ep_marker)
+		mpi_free_limb_space(ep_marker);
+	if (xp_marker)
+		mpi_free_limb_space(xp_marker);
+	if (tspace)
+		mpi_free_limb_space(tspace);
+	return rc;
+}
+
+/* Multiply the natural numbers u (pointed to by UP) and v (pointed to by VP),
+ * both with SIZE limbs, and store the result at PRODP.  2 * SIZE limbs are
+ * always stored.  Return the most significant limb.
+ *
+ * Argument constraints:
+ * 1. PRODP != UP and PRODP != VP, i.e. the destination
+ *    must be distinct from the multiplier and the multiplicand.
+ *
+ *
+ * Handle simple cases with traditional multiplication.
+ *
+ * This is the most critical code of multiplication.  All multiplies rely
+ * on this, both small and huge.  Small ones arrive here immediately.  Huge
+ * ones arrive here as this is the base case for Karatsuba's recursive
+ * algorithm below.
+ */
+
+static mpi_limb_t
+mul_n_basecase(mpi_ptr_t prodp, mpi_ptr_t up, mpi_ptr_t vp, mpi_size_t size)
+{
+	mpi_size_t i;
+	mpi_limb_t cy;
+	mpi_limb_t v_limb;
+
+	/* Multiply by the first limb in V separately, as the result can be
+	 * stored (not added) to PROD.  We also avoid a loop for zeroing.  */
+	v_limb = vp[0];
+	if (v_limb <= 1) {
+		if (v_limb == 1)
+			MPN_COPY(prodp, up, size);
+		else
+			MPN_ZERO(prodp, size);
+		cy = 0;
+	} else
+		cy = mpihelp_mul_1(prodp, up, size, v_limb);
+
+	prodp[size] = cy;
+	prodp++;
+
+	/* For each iteration in the outer loop, multiply one limb from
+	 * U with one limb from V, and add it to PROD.  */
+	for (i = 1; i < size; i++) {
+		v_limb = vp[i];
+		if (v_limb <= 1) {
+			cy = 0;
+			if (v_limb == 1)
+				cy = mpihelp_add_n(prodp, prodp, up, size);
+		} else
+			cy = mpihelp_addmul_1(prodp, up, size, v_limb);
+
+		prodp[size] = cy;
+		prodp++;
+	}
+
+	return cy;
+}
+
+static void
+mul_n(mpi_ptr_t prodp, mpi_ptr_t up, mpi_ptr_t vp,
+		mpi_size_t size, mpi_ptr_t tspace)
+{
+	if (size & 1) {
+		/* The size is odd, and the code below doesn't handle that.
+		 * Multiply the least significant (size - 1) limbs with a recursive
+		 * call, and handle the most significant limb of S1 and S2
+		 * separately.
+		 * A slightly faster way to do this would be to make the Karatsuba
+		 * code below behave as if the size were even, and let it check for
+		 * odd size in the end.  I.e., in essence move this code to the end.
+		 * Doing so would save us a recursive call, and potentially make the
+		 * stack grow a lot less.
+		 */
+		mpi_size_t esize = size - 1;	/* even size */
+		mpi_limb_t cy_limb;
+
+		MPN_MUL_N_RECURSE(prodp, up, vp, esize, tspace);
+		cy_limb = mpihelp_addmul_1(prodp + esize, up, esize, vp[esize]);
+		prodp[esize + esize] = cy_limb;
+		cy_limb = mpihelp_addmul_1(prodp + esize, vp, size, up[esize]);
+		prodp[esize + size] = cy_limb;
+	} else {
+		/* Anatolij Alekseevich Karatsuba's divide-and-conquer algorithm.
+		 *
+		 * Split U in two pieces, U1 and U0, such that
+		 * U = U0 + U1*(B**n),
+		 * and V in V1 and V0, such that
+		 * V = V0 + V1*(B**n).
+		 *
+		 * UV is then computed recursively using the identity
+		 *
+		 *        2n   n          n                     n
+		 * UV = (B  + B )U V  +  B (U -U )(V -V )  +  (B + 1)U V
+		 *                1 1        1  0   0  1              0 0
+		 *
+		 * Where B = 2**BITS_PER_MP_LIMB.
+		 */
+		mpi_size_t hsize = size >> 1;
+		mpi_limb_t cy;
+		int negflg;
+
+		/* Product H.      ________________  ________________
+		 *                |_____U1 x V1____||____U0 x V0_____|
+		 * Put result in upper part of PROD and pass low part of TSPACE
+		 * as new TSPACE.
+		 */
+		MPN_MUL_N_RECURSE(prodp + size, up + hsize, vp + hsize, hsize,
+				  tspace);
+
+		/* Product M.      ________________
+		 *                |_(U1-U0)(V0-V1)_|
+		 */
+		if (mpihelp_cmp(up + hsize, up, hsize) >= 0) {
+			mpihelp_sub_n(prodp, up + hsize, up, hsize);
+			negflg = 0;
+		} else {
+			mpihelp_sub_n(prodp, up, up + hsize, hsize);
+			negflg = 1;
+		}
+		if (mpihelp_cmp(vp + hsize, vp, hsize) >= 0) {
+			mpihelp_sub_n(prodp + hsize, vp + hsize, vp, hsize);
+			negflg ^= 1;
+		} else {
+			mpihelp_sub_n(prodp + hsize, vp, vp + hsize, hsize);
+			/* No change of NEGFLG.  */
+		}
+		/* Read temporary operands from low part of PROD.
+		 * Put result in low part of TSPACE using upper part of TSPACE
+		 * as new TSPACE.
+		 */
+		MPN_MUL_N_RECURSE(tspace, prodp, prodp + hsize, hsize,
+				  tspace + size);
+
+		/* Add/copy product H. */
+		MPN_COPY(prodp + hsize, prodp + size, hsize);
+		cy = mpihelp_add_n(prodp + size, prodp + size,
+				   prodp + size + hsize, hsize);
+
+		/* Add product M (if NEGFLG M is a negative number) */
+		if (negflg)
+			cy -=
+			    mpihelp_sub_n(prodp + hsize, prodp + hsize, tspace,
+					  size);
+		else
+			cy +=
+			    mpihelp_add_n(prodp + hsize, prodp + hsize, tspace,
+					  size);
+
+		/* Product L.      ________________  ________________
+		 *                |________________||____U0 x V0_____|
+		 * Read temporary operands from low part of PROD.
+		 * Put result in low part of TSPACE using upper part of TSPACE
+		 * as new TSPACE.
+		 */
+		MPN_MUL_N_RECURSE(tspace, up, vp, hsize, tspace + size);
+
+		/* Add/copy Product L (twice) */
+
+		cy += mpihelp_add_n(prodp + hsize, prodp + hsize, tspace, size);
+		if (cy)
+			mpihelp_add_1(prodp + hsize + size,
+				      prodp + hsize + size, hsize, cy);
+
+		MPN_COPY(prodp, tspace, hsize);
+		cy = mpihelp_add_n(prodp + hsize, prodp + hsize, tspace + hsize,
+				   hsize);
+		if (cy)
+			mpihelp_add_1(prodp + size, prodp + size, size, 1);
+	}
+}
+
+static void mpih_sqr_n_basecase(mpi_ptr_t prodp, mpi_ptr_t up, mpi_size_t size)
+{
+	mpi_size_t i;
+	mpi_limb_t cy_limb;
+	mpi_limb_t v_limb;
+
+	/* Multiply by the first limb in V separately, as the result can be
+	 * stored (not added) to PROD.  We also avoid a loop for zeroing.  */
+	v_limb = up[0];
+	if (v_limb <= 1) {
+		if (v_limb == 1)
+			MPN_COPY(prodp, up, size);
+		else
+			MPN_ZERO(prodp, size);
+		cy_limb = 0;
+	} else
+		cy_limb = mpihelp_mul_1(prodp, up, size, v_limb);
+
+	prodp[size] = cy_limb;
+	prodp++;
+
+	/* For each iteration in the outer loop, multiply one limb from
+	 * U with one limb from V, and add it to PROD.  */
+	for (i = 1; i < size; i++) {
+		v_limb = up[i];
+		if (v_limb <= 1) {
+			cy_limb = 0;
+			if (v_limb == 1)
+				cy_limb = mpihelp_add_n(prodp, prodp, up, size);
+		} else
+			cy_limb = mpihelp_addmul_1(prodp, up, size, v_limb);
+
+		prodp[size] = cy_limb;
+		prodp++;
+	}
+}
+
+static void
+mpih_sqr_n(mpi_ptr_t prodp, mpi_ptr_t up, mpi_size_t size, mpi_ptr_t tspace)
+{
+	if (size & 1) {
+		/* The size is odd, and the code below doesn't handle that.
+		 * Multiply the least significant (size - 1) limbs with a recursive
+		 * call, and handle the most significant limb of S1 and S2
+		 * separately.
+		 * A slightly faster way to do this would be to make the Karatsuba
+		 * code below behave as if the size were even, and let it check for
+		 * odd size in the end.  I.e., in essence move this code to the end.
+		 * Doing so would save us a recursive call, and potentially make the
+		 * stack grow a lot less.
+		 */
+		mpi_size_t esize = size - 1;	/* even size */
+		mpi_limb_t cy_limb;
+
+		MPN_SQR_N_RECURSE(prodp, up, esize, tspace);
+		cy_limb = mpihelp_addmul_1(prodp + esize, up, esize, up[esize]);
+		prodp[esize + esize] = cy_limb;
+		cy_limb = mpihelp_addmul_1(prodp + esize, up, size, up[esize]);
+
+		prodp[esize + size] = cy_limb;
+	} else {
+		mpi_size_t hsize = size >> 1;
+		mpi_limb_t cy;
+
+		/* Product H.      ________________  ________________
+		 *                |_____U1 x U1____||____U0 x U0_____|
+		 * Put result in upper part of PROD and pass low part of TSPACE
+		 * as new TSPACE.
+		 */
+		MPN_SQR_N_RECURSE(prodp + size, up + hsize, hsize, tspace);
+
+		/* Product M.      ________________
+		 *                |_(U1-U0)(U0-U1)_|
+		 */
+		if (mpihelp_cmp(up + hsize, up, hsize) >= 0)
+			mpihelp_sub_n(prodp, up + hsize, up, hsize);
+		else
+			mpihelp_sub_n(prodp, up, up + hsize, hsize);
+
+		/* Read temporary operands from low part of PROD.
+		 * Put result in low part of TSPACE using upper part of TSPACE
+		 * as new TSPACE.  */
+		MPN_SQR_N_RECURSE(tspace, prodp, hsize, tspace + size);
+
+		/* Add/copy product H  */
+		MPN_COPY(prodp + hsize, prodp + size, hsize);
+		cy = mpihelp_add_n(prodp + size, prodp + size,
+				   prodp + size + hsize, hsize);
+
+		/* Add product M (if NEGFLG M is a negative number).  */
+		cy -= mpihelp_sub_n(prodp + hsize, prodp + hsize, tspace, size);
+
+		/* Product L.      ________________  ________________
+		 *                |________________||____U0 x U0_____|
+		 * Read temporary operands from low part of PROD.
+		 * Put result in low part of TSPACE using upper part of TSPACE
+		 * as new TSPACE.  */
+		MPN_SQR_N_RECURSE(tspace, up, hsize, tspace + size);
+
+		/* Add/copy Product L (twice).  */
+		cy += mpihelp_add_n(prodp + hsize, prodp + hsize, tspace, size);
+		if (cy)
+			mpihelp_add_1(prodp + hsize + size,
+				      prodp + hsize + size, hsize, cy);
+
+		MPN_COPY(prodp, tspace, hsize);
+		cy = mpihelp_add_n(prodp + hsize, prodp + hsize, tspace + hsize,
+				   hsize);
+		if (cy)
+			mpihelp_add_1(prodp + size, prodp + size, size, 1);
+	}
+}
+
+static int
+mpihelp_mul_karatsuba_case(mpi_ptr_t prodp,
+			   mpi_ptr_t up, mpi_size_t usize,
+			   mpi_ptr_t vp, mpi_size_t vsize,
+			   struct karatsuba_ctx *ctx)
+{
+	mpi_limb_t cy;
+
+	if (!ctx->tspace || ctx->tspace_size < vsize) {
+		if (ctx->tspace)
+			mpi_free_limb_space(ctx->tspace);
+		ctx->tspace = mpi_alloc_limb_space(2 * vsize);
+		if (!ctx->tspace)
+			return -ENOMEM;
+		ctx->tspace_size = vsize;
+	}
+
+	MPN_MUL_N_RECURSE(prodp, up, vp, vsize, ctx->tspace);
+
+	prodp += vsize;
+	up += vsize;
+	usize -= vsize;
+	if (usize >= vsize) {
+		if (!ctx->tp || ctx->tp_size < vsize) {
+			if (ctx->tp)
+				mpi_free_limb_space(ctx->tp);
+			ctx->tp = mpi_alloc_limb_space(2 * vsize);
+			if (!ctx->tp) {
+				if (ctx->tspace)
+					mpi_free_limb_space(ctx->tspace);
+				ctx->tspace = NULL;
+				return -ENOMEM;
+			}
+			ctx->tp_size = vsize;
+		}
+
+		do {
+			MPN_MUL_N_RECURSE(ctx->tp, up, vp, vsize, ctx->tspace);
+			cy = mpihelp_add_n(prodp, prodp, ctx->tp, vsize);
+			mpihelp_add_1(prodp + vsize, ctx->tp + vsize, vsize,
+				      cy);
+			prodp += vsize;
+			up += vsize;
+			usize -= vsize;
+		} while (usize >= vsize);
+	}
+
+	if (usize) {
+		if (usize < KARATSUBA_THRESHOLD) {
+			mpi_limb_t tmp;
+			if (mpihelp_mul(ctx->tspace, vp, vsize, up, usize, &tmp)
+			    < 0)
+				return -ENOMEM;
+		} else {
+			if (!ctx->next) {
+				ctx->next = xzalloc(struct karatsuba_ctx);
+				if (!ctx->next)
+					return -ENOMEM;
+			}
+			if (mpihelp_mul_karatsuba_case(ctx->tspace,
+						       vp, vsize,
+						       up, usize,
+						       ctx->next) < 0)
+				return -ENOMEM;
+		}
+
+		cy = mpihelp_add_n(prodp, prodp, ctx->tspace, vsize);
+		mpihelp_add_1(prodp + vsize, ctx->tspace + vsize, usize, cy);
+	}
+
+	return 0;
+}
+
+static void mpihelp_release_karatsuba_ctx(struct karatsuba_ctx *ctx)
+{
+	struct karatsuba_ctx *ctx2;
+
+	if (ctx->tp)
+		mpi_free_limb_space(ctx->tp);
+	if (ctx->tspace)
+		mpi_free_limb_space(ctx->tspace);
+	for (ctx = ctx->next; ctx; ctx = ctx2) {
+		ctx2 = ctx->next;
+		if (ctx->tp)
+			mpi_free_limb_space(ctx->tp);
+		if (ctx->tspace)
+			mpi_free_limb_space(ctx->tspace);
+		xfree(ctx);
+	}
+}
+
+/* Multiply the natural numbers u (pointed to by UP, with USIZE limbs)
+ * and v (pointed to by VP, with VSIZE limbs), and store the result at
+ * PRODP.  USIZE + VSIZE limbs are always stored, but if the input
+ * operands are normalized.  Return the most significant limb of the
+ * result.
+ *
+ * NOTE: The space pointed to by PRODP is overwritten before finished
+ * with U and V, so overlap is an error.
+ *
+ * Argument constraints:
+ * 1. USIZE >= VSIZE.
+ * 2. PRODP != UP and PRODP != VP, i.e. the destination
+ *    must be distinct from the multiplier and the multiplicand.
+ */
+
+static int
+mpihelp_mul(mpi_ptr_t prodp, mpi_ptr_t up, mpi_size_t usize,
+	    mpi_ptr_t vp, mpi_size_t vsize, mpi_limb_t *_result)
+{
+	mpi_ptr_t prod_endp = prodp + usize + vsize - 1;
+	mpi_limb_t cy;
+	struct karatsuba_ctx ctx;
+
+	if (vsize < KARATSUBA_THRESHOLD) {
+		mpi_size_t i;
+		mpi_limb_t v_limb;
+
+		if (!vsize) {
+			*_result = 0;
+			return 0;
+		}
+
+		/* Multiply by the first limb in V separately, as the result can be
+		 * stored (not added) to PROD.  We also avoid a loop for zeroing.  */
+		v_limb = vp[0];
+		if (v_limb <= 1) {
+			if (v_limb == 1)
+				MPN_COPY(prodp, up, usize);
+			else
+				MPN_ZERO(prodp, usize);
+			cy = 0;
+		} else
+			cy = mpihelp_mul_1(prodp, up, usize, v_limb);
+
+		prodp[usize] = cy;
+		prodp++;
+
+		/* For each iteration in the outer loop, multiply one limb from
+		 * U with one limb from V, and add it to PROD.  */
+		for (i = 1; i < vsize; i++) {
+			v_limb = vp[i];
+			if (v_limb <= 1) {
+				cy = 0;
+				if (v_limb == 1)
+					cy = mpihelp_add_n(prodp, prodp, up,
+							   usize);
+			} else
+				cy = mpihelp_addmul_1(prodp, up, usize, v_limb);
+
+			prodp[usize] = cy;
+			prodp++;
+		}
+
+		*_result = cy;
+		return 0;
+	}
+
+	memset(&ctx, 0, sizeof ctx);
+	if (mpihelp_mul_karatsuba_case(prodp, up, usize, vp, vsize, &ctx) < 0)
+		return -ENOMEM;
+	mpihelp_release_karatsuba_ctx(&ctx);
+	*_result = *prod_endp;
+	return 0;
+}
+
+static mpi_limb_t
+mpihelp_mul_1(mpi_ptr_t res_ptr, mpi_ptr_t s1_ptr, mpi_size_t s1_size,
+	      mpi_limb_t s2_limb)
+{
+	mpi_limb_t cy_limb;
+	mpi_size_t j;
+	mpi_limb_t prod_high, prod_low;
+
+	/* The loop counter and index J goes from -S1_SIZE to -1.  This way
+	 * the loop becomes faster.  */
+	j = -s1_size;
+
+	/* Offset the base pointers to compensate for the negative indices.  */
+	s1_ptr -= j;
+	res_ptr -= j;
+
+	cy_limb = 0;
+	do {
+		umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
+		prod_low += cy_limb;
+		cy_limb = (prod_low < cy_limb ? 1 : 0) + prod_high;
+		res_ptr[j] = prod_low;
+	} while (++j);
+
+	return cy_limb;
+}
+
+static mpi_limb_t
+mpihelp_add_n(mpi_ptr_t res_ptr, mpi_ptr_t s1_ptr,
+	      mpi_ptr_t s2_ptr, mpi_size_t size)
+{
+	mpi_limb_t x, y, cy;
+	mpi_size_t j;
+
+	/* The loop counter and index J goes from -SIZE to -1.  This way
+	   the loop becomes faster.  */
+	j = -size;
+
+	/* Offset the base pointers to compensate for the negative indices. */
+	s1_ptr -= j;
+	s2_ptr -= j;
+	res_ptr -= j;
+
+	cy = 0;
+	do {
+		y = s2_ptr[j];
+		x = s1_ptr[j];
+		y += cy;	/* add previous carry to one addend */
+		cy = y < cy;	/* get out carry from that addition */
+		y += x;		/* add other addend */
+		cy += y < x;	/* get out carry from that add, combine */
+		res_ptr[j] = y;
+	} while (++j);
+
+	return cy;
+}
+
+/* Shift U (pointed to by UP and USIZE digits long) CNT bits to the left
+ * and store the USIZE least significant digits of the result at WP.
+ * Return the bits shifted out from the most significant digit.
+ *
+ * Argument constraints:
+ * 1. 0 < CNT < BITS_PER_MP_LIMB
+ * 2. If the result is to be written over the input, WP must be >= UP.
+ */
+
+static mpi_limb_t
+mpihelp_lshift(mpi_ptr_t wp, mpi_ptr_t up, mpi_size_t usize, unsigned int cnt)
+{
+	mpi_limb_t high_limb, low_limb;
+	unsigned sh_1, sh_2;
+	mpi_size_t i;
+	mpi_limb_t retval;
+
+	sh_1 = cnt;
+	wp += 1;
+	sh_2 = BITS_PER_MPI_LIMB - sh_1;
+	i = usize - 1;
+	low_limb = up[i];
+	retval = low_limb >> sh_2;
+	high_limb = low_limb;
+	while (--i >= 0) {
+		low_limb = up[i];
+		wp[i] = (high_limb << sh_1) | (low_limb >> sh_2);
+		high_limb = low_limb;
+	}
+	wp[i] = high_limb << sh_1;
+
+	return retval;
+}
+
+static mpi_limb_t
+mpihelp_addmul_1(mpi_ptr_t res_ptr, mpi_ptr_t s1_ptr,
+		 mpi_size_t s1_size, mpi_limb_t s2_limb)
+{
+	mpi_limb_t cy_limb;
+	mpi_size_t j;
+	mpi_limb_t prod_high, prod_low;
+	mpi_limb_t x;
+
+	/* The loop counter and index J goes from -SIZE to -1.  This way
+	 * the loop becomes faster.  */
+	j = -s1_size;
+	res_ptr -= j;
+	s1_ptr -= j;
+
+	cy_limb = 0;
+	do {
+		umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
+
+		prod_low += cy_limb;
+		cy_limb = (prod_low < cy_limb ? 1 : 0) + prod_high;
+
+		x = res_ptr[j];
+		prod_low = x + prod_low;
+		cy_limb += prod_low < x ? 1 : 0;
+		res_ptr[j] = prod_low;
+	} while (++j);
+	return cy_limb;
+}
+
+static mpi_limb_t
+mpihelp_sub_n(mpi_ptr_t res_ptr, mpi_ptr_t s1_ptr,
+	      mpi_ptr_t s2_ptr, mpi_size_t size)
+{
+	mpi_limb_t x, y, cy;
+	mpi_size_t j;
+
+	/* The loop counter and index J goes from -SIZE to -1.  This way
+	   the loop becomes faster.  */
+	j = -size;
+
+	/* Offset the base pointers to compensate for the negative indices.  */
+	s1_ptr -= j;
+	s2_ptr -= j;
+	res_ptr -= j;
+
+	cy = 0;
+	do {
+		y = s2_ptr[j];
+		x = s1_ptr[j];
+		y += cy;	/* add previous carry to subtrahend */
+		cy = y < cy;	/* get out carry from that addition */
+		y = x - y;	/* main subtract */
+		cy += y > x;	/* get out carry from the subtract, combine */
+		res_ptr[j] = y;
+	} while (++j);
+
+	return cy;
+}
+
+/****************
+ * Compare OP1_PTR/OP1_SIZE with OP2_PTR/OP2_SIZE.
+ * There are no restrictions on the relative sizes of
+ * the two arguments.
+ * Return 1 if OP1 > OP2, 0 if they are equal, and -1 if OP1 < OP2.
+ */
+static int mpihelp_cmp(mpi_ptr_t op1_ptr, mpi_ptr_t op2_ptr, mpi_size_t size)
+{
+	mpi_size_t i;
+	mpi_limb_t op1_word, op2_word;
+
+	for (i = size - 1; i >= 0; i--) {
+		op1_word = op1_ptr[i];
+		op2_word = op2_ptr[i];
+		if (op1_word != op2_word)
+			goto diff;
+	}
+	return 0;
+
+ diff:
+	/* This can *not* be simplified to
+	 *   op2_word - op2_word
+	 * since that expression might give signed overflow.  */
+	return (op1_word > op2_word) ? 1 : -1;
+}
+
+static void mpi_assign_limb_space(MPI a, mpi_ptr_t ap, unsigned nlimbs)
+{
+	mpi_free_limb_space(a->d);
+	a->d = ap;
+	a->alloced = nlimbs;
+}
+
+/* Shift U (pointed to by UP and USIZE limbs long) CNT bits to the right
+ * and store the USIZE least significant limbs of the result at WP.
+ * The bits shifted out to the right are returned.
+ *
+ * Argument constraints:
+ * 1. 0 < CNT < BITS_PER_MP_LIMB
+ * 2. If the result is to be written over the input, WP must be <= UP.
+ */
+
+static mpi_limb_t
+mpihelp_rshift(mpi_ptr_t wp, mpi_ptr_t up, mpi_size_t usize, unsigned cnt)
+{
+	mpi_limb_t high_limb, low_limb;
+	unsigned sh_1, sh_2;
+	mpi_size_t i;
+	mpi_limb_t retval;
+
+	sh_1 = cnt;
+	wp -= 1;
+	sh_2 = BITS_PER_MPI_LIMB - sh_1;
+	high_limb = up[0];
+	retval = high_limb << sh_2;
+	low_limb = high_limb;
+	for (i = 1; i < usize; i++) {
+		high_limb = up[i];
+		wp[i] = (low_limb >> sh_1) | (high_limb << sh_2);
+		low_limb = high_limb;
+	}
+	wp[i] = low_limb >> sh_1;
+
+	return retval;
+}
+
+/* Divide num (NP/NSIZE) by den (DP/DSIZE) and write
+ * the NSIZE-DSIZE least significant quotient limbs at QP
+ * and the DSIZE long remainder at NP.	If QEXTRA_LIMBS is
+ * non-zero, generate that many fraction bits and append them after the
+ * other quotient limbs.
+ * Return the most significant limb of the quotient, this is always 0 or 1.
+ *
+ * Preconditions:
+ * 0. NSIZE >= DSIZE.
+ * 1. The most significant bit of the divisor must be set.
+ * 2. QP must either not overlap with the input operands at all, or
+ *    QP + DSIZE >= NP must hold true.	(This means that it's
+ *    possible to put the quotient in the high part of NUM, right after the
+ *    remainder in NUM.
+ * 3. NSIZE >= DSIZE, even if QEXTRA_LIMBS is non-zero.
+ */
+
+static mpi_limb_t
+mpihelp_divrem(mpi_ptr_t qp, mpi_size_t qextra_limbs,
+	       mpi_ptr_t np, mpi_size_t nsize, mpi_ptr_t dp, mpi_size_t dsize)
+{
+	mpi_limb_t most_significant_q_limb = 0;
+
+	switch (dsize) {
+	case 0:
+		/* We are asked to divide by zero, so go ahead and do it!  (To make
+		   the compiler not remove this statement, return the value.)  */
+		/*
+		 * existing clients of this function have been modified
+		 * not to call it with dsize == 0, so this should not happen
+		 */
+		return 1 / dsize;
+
+	case 1:
+		{
+			mpi_size_t i;
+			mpi_limb_t n1;
+			mpi_limb_t d;
+
+			d = dp[0];
+			n1 = np[nsize - 1];
+
+			if (n1 >= d) {
+				n1 -= d;
+				most_significant_q_limb = 1;
+			}
+
+			qp += qextra_limbs;
+			for (i = nsize - 2; i >= 0; i--)
+				udiv_qrnnd(qp[i], n1, n1, np[i], d);
+			qp -= qextra_limbs;
+
+			for (i = qextra_limbs - 1; i >= 0; i--)
+				udiv_qrnnd(qp[i], n1, n1, 0, d);
+
+			np[0] = n1;
+		}
+		break;
+
+	case 2:
+		{
+			mpi_size_t i;
+			mpi_limb_t n1, n0, n2;
+			mpi_limb_t d1, d0;
+
+			np += nsize - 2;
+			d1 = dp[1];
+			d0 = dp[0];
+			n1 = np[1];
+			n0 = np[0];
+
+			if (n1 >= d1 && (n1 > d1 || n0 >= d0)) {
+				sub_ddmmss(n1, n0, n1, n0, d1, d0);
+				most_significant_q_limb = 1;
+			}
+
+			for (i = qextra_limbs + nsize - 2 - 1; i >= 0; i--) {
+				mpi_limb_t q;
+				mpi_limb_t r;
+
+				if (i >= qextra_limbs)
+					np--;
+				else
+					np[0] = 0;
+
+				if (n1 == d1) {
+					/* Q should be either 111..111 or 111..110.  Need special
+					 * treatment of this rare case as normal division would
+					 * give overflow.  */
+					q = ~(mpi_limb_t) 0;
+
+					r = n0 + d1;
+					if (r < d1) {	/* Carry in the addition? */
+						add_ssaaaa(n1, n0, r - d0,
+							   np[0], 0, d0);
+						qp[i] = q;
+						continue;
+					}
+					n1 = d0 - (d0 != 0 ? 1 : 0);
+					n0 = -d0;
+				} else {
+					udiv_qrnnd(q, r, n1, n0, d1);
+					umul_ppmm(n1, n0, d0, q);
+				}
+
+				n2 = np[0];
+ q_test:
+				if (n1 > r || (n1 == r && n0 > n2)) {
+					/* The estimated Q was too large.  */
+					q--;
+					sub_ddmmss(n1, n0, n1, n0, 0, d0);
+					r += d1;
+					if (r >= d1)	/* If not carry, test Q again.  */
+						goto q_test;
+				}
+
+				qp[i] = q;
+				sub_ddmmss(n1, n0, r, n2, n1, n0);
+			}
+			np[1] = n1;
+			np[0] = n0;
+		}
+		break;
+
+	default:
+		{
+			mpi_size_t i;
+			mpi_limb_t dX, d1, n0;
+
+			np += nsize - dsize;
+			dX = dp[dsize - 1];
+			d1 = dp[dsize - 2];
+			n0 = np[dsize - 1];
+
+			if (n0 >= dX) {
+				if (n0 > dX
+				    || mpihelp_cmp(np, dp, dsize - 1) >= 0) {
+					mpihelp_sub_n(np, np, dp, dsize);
+					n0 = np[dsize - 1];
+					most_significant_q_limb = 1;
+				}
+			}
+
+			for (i = qextra_limbs + nsize - dsize - 1; i >= 0; i--) {
+				mpi_limb_t q;
+				mpi_limb_t n1, n2;
+				mpi_limb_t cy_limb;
+
+				if (i >= qextra_limbs) {
+					np--;
+					n2 = np[dsize];
+				} else {
+					n2 = np[dsize - 1];
+					MPN_COPY_DECR(np + 1, np, dsize - 1);
+					np[0] = 0;
+				}
+
+				if (n0 == dX) {
+					/* This might over-estimate q, but it's probably not worth
+					 * the extra code here to find out.  */
+					q = ~(mpi_limb_t) 0;
+				} else {
+					mpi_limb_t r;
+
+					udiv_qrnnd(q, r, n0, np[dsize - 1], dX);
+					umul_ppmm(n1, n0, d1, q);
+
+					while (n1 > r
+					       || (n1 == r
+						   && n0 > np[dsize - 2])) {
+						q--;
+						r += dX;
+						if (r < dX)	/* I.e. "carry in previous addition?" */
+							break;
+						n1 -= n0 < d1;
+						n0 -= d1;
+					}
+				}
+
+				/* Possible optimization: We already have (q * n0) and (1 * n1)
+				 * after the calculation of q.  Taking advantage of that, we
+				 * could make this loop make two iterations less.  */
+				cy_limb = mpihelp_submul_1(np, dp, dsize, q);
+
+				if (n2 != cy_limb) {
+					mpihelp_add_n(np, np, dp, dsize);
+					q--;
+				}
+
+				qp[i] = q;
+				n0 = np[dsize - 1];
+			}
+		}
+		break;
+	}
+
+	return most_significant_q_limb;
+}
+
+static mpi_limb_t
+mpihelp_submul_1(mpi_ptr_t res_ptr, mpi_ptr_t s1_ptr,
+		 mpi_size_t s1_size, mpi_limb_t s2_limb)
+{
+	mpi_limb_t cy_limb;
+	mpi_size_t j;
+	mpi_limb_t prod_high, prod_low;
+	mpi_limb_t x;
+
+	/* The loop counter and index J goes from -SIZE to -1.  This way
+	 * the loop becomes faster.  */
+	j = -s1_size;
+	res_ptr -= j;
+	s1_ptr -= j;
+
+	cy_limb = 0;
+	do {
+		umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
+
+		prod_low += cy_limb;
+		cy_limb = (prod_low < cy_limb ? 1 : 0) + prod_high;
+
+		x = res_ptr[j];
+		prod_low = x - prod_low;
+		cy_limb += prod_low > x ? 1 : 0;
+		res_ptr[j] = prod_low;
+	} while (++j);
+
+	return cy_limb;
+}
+
+/**
+ * mpi_read_raw_data - Read a raw byte stream as a positive integer
+ * @xbuffer: The data to read
+ * @nbytes: The amount of data to read
+ */
+MPI mpi_read_raw_data(const void *xbuffer, size_t nbytes)
+{
+	const uint8_t *buffer = xbuffer;
+	int i, j;
+	unsigned nbits, nlimbs;
+	mpi_limb_t a;
+	MPI val = NULL;
+
+	while (nbytes > 0 && buffer[0] == 0) {
+		buffer++;
+		nbytes--;
+	}
+
+	nbits = nbytes * 8;
+	if (nbits > MAX_EXTERN_MPI_BITS) {
+		printk("MPI: mpi too large (%u bits)\n", nbits);
+		return NULL;
+	}
+	if (nbytes > 0)
+		nbits -= count_leading_zeros(buffer[0]) - (BITS_PER_LONG - 8);
+
+	nlimbs = DIV_ROUND_UP(nbytes, BYTES_PER_MPI_LIMB);
+	val = mpi_alloc(nlimbs);
+	if (!val)
+		return NULL;
+	val->nbits = nbits;
+	val->sign = 0;
+	val->nlimbs = nlimbs;
+
+	if (nbytes > 0) {
+		i = BYTES_PER_MPI_LIMB - nbytes % BYTES_PER_MPI_LIMB;
+		i %= BYTES_PER_MPI_LIMB;
+		for (j = nlimbs; j > 0; j--) {
+			a = 0;
+			for (; i < BYTES_PER_MPI_LIMB; i++) {
+				a <<= 8;
+				a |= *buffer++;
+			}
+			i = 0;
+			val->d[j - 1] = a;
+		}
+	}
+	return val;
+}
+
+/****************
+ * Note:  It was a bad idea to use the number of limbs to allocate
+ *	  because on a alpha the limbs are large but we normally need
+ *	  integers of n bits - So we should chnage this to bits (or bytes).
+ *
+ *	  But mpi_alloc is used in a lot of places :-)
+ */
+MPI mpi_alloc(unsigned nlimbs)
+{
+	MPI a;
+
+	a = xmalloc(struct mpi);
+	if (!a)
+		return a;
+
+	if (nlimbs) {
+		a->d = mpi_alloc_limb_space(nlimbs);
+		if (!a->d) {
+			xfree(a);
+			return NULL;
+		}
+	} else {
+		a->d = NULL;
+	}
+
+	a->alloced = nlimbs;
+	a->nlimbs = 0;
+	a->sign = 0;
+	a->flags = 0;
+	a->nbits = 0;
+	return a;
+}
+
+void mpi_free(MPI a)
+{
+	if (!a)
+		return;
+
+	if (a->flags & MPI_FLAG_PTR_ALLOC)
+		xfree(a->d);
+	else
+		mpi_free_limb_space(a->d);
+
+	if (a->flags & ~MPI_FLAG_MASK)
+		printk("invalid flag value in mpi\n");
+	xfree(a);
+}
+
+int mpi_cmp_ui(MPI u, unsigned long v)
+{
+	mpi_limb_t limb = v;
+
+	mpi_normalize(u);
+	if (!u->nlimbs && !limb)
+		return 0;
+	if (u->sign)
+		return -1;
+	if (u->nlimbs > 1)
+		return 1;
+
+	if (u->d[0] == limb)
+		return 0;
+	else if (u->d[0] > limb)
+		return 1;
+	else
+		return -1;
+}
+
+int mpi_cmp(MPI u, MPI v)
+{
+	mpi_size_t usize, vsize;
+	int cmp;
+
+	mpi_normalize(u);
+	mpi_normalize(v);
+	usize = u->nlimbs;
+	vsize = v->nlimbs;
+	if (!u->sign && v->sign)
+		return 1;
+	if (u->sign && !v->sign)
+		return -1;
+	if (usize != vsize && !u->sign && !v->sign)
+		return usize - vsize;
+	if (usize != vsize && u->sign && v->sign)
+		return vsize - usize;
+	if (!usize)
+		return 0;
+	cmp = mpihelp_cmp(u->d, v->d, usize);
+	if (u->sign)
+		return -cmp;
+	return cmp;
+}
+
+/****************
+ * Sometimes we have MSL (most significant limbs) which are 0;
+ * this is for some reasons not good, so this function removes them.
+ */
+static void mpi_normalize(MPI a)
+{
+	for (; a->nlimbs && !a->d[a->nlimbs - 1]; a->nlimbs--)
+		;
+}
+
+/****************
+ * Return the number of bits in A.
+ */
+unsigned mpi_get_nbits(MPI a)
+{
+	unsigned n;
+
+	mpi_normalize(a);
+
+	if (a->nlimbs) {
+		mpi_limb_t alimb = a->d[a->nlimbs - 1];
+		if (alimb)
+			n = count_leading_zeros(alimb);
+		else
+			n = BITS_PER_MPI_LIMB;
+		n = BITS_PER_MPI_LIMB - n + (a->nlimbs - 1) * BITS_PER_MPI_LIMB;
+	} else
+		n = 0;
+	return n;
+}
+
+int mpi_test_bit(MPI a, unsigned int n)
+{
+	unsigned int limbno, bitno;
+	mpi_limb_t limb;
+
+	limbno = n / BITS_PER_MPI_LIMB;
+	bitno  = n % BITS_PER_MPI_LIMB;
+
+	if (limbno >= a->nlimbs)
+		return 0; /* too far left: this is a 0 */
+	limb = a->d[limbno];
+	return (limb & (((mpi_limb_t)1) << bitno))? 1: 0;
+}
-- 
2.49.0


