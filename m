Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E20AA74B65
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 14:45:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930674.1333350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0w-0008DY-MP; Fri, 28 Mar 2025 13:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930674.1333350; Fri, 28 Mar 2025 13:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0w-00088S-8H; Fri, 28 Mar 2025 13:44:50 +0000
Received: by outflank-mailman (input) for mailman id 930674;
 Fri, 28 Mar 2025 13:44:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyA0t-0005Dp-VE
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 13:44:47 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfabb72b-0bda-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 14:44:46 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so1577889f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 06:44:46 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314f5c6sm73339085e9.40.2025.03.28.06.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 06:44:45 -0700 (PDT)
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
X-Inumbo-ID: cfabb72b-0bda-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743169486; x=1743774286; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPiphnUaO7ugL9sM7Fivw+OCXGn6oQ+TuuGwtrqgEik=;
        b=WXcOrQFZpy4MQo4bk+bL7Ts+DpmuFbK4OUuHFl9eX9Yg1nT4cohfuz3dqCbPSk6/x5
         h8gHIB2mgzbr3NNQx8vnSCHeZXHdjBcHj9y6KVRgfzIjrF4pnKemFX4DMnwWrCgPnZdw
         1lmAINTyMFE9F8KMZ1JRrwb6GnGou1syl3wQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169486; x=1743774286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPiphnUaO7ugL9sM7Fivw+OCXGn6oQ+TuuGwtrqgEik=;
        b=xCgslDTE5sKDxSJvfqcUSOIapsvikPalVoM8RmwhpkZZKdEwRedgL+z3/nka/O8nen
         EcGju3X16g8tYpjTDBQlqJahW69/v2lOqgmXTc3orbOiLW7V1CVDjYSjyKGx12XibDzr
         iGSgkKYUh8lqsS66tUnz2LLw6L4nzV4ugDhRCwOp8y7uTS6o7uOqFNUEyy6UAI3O90fc
         NniIfWNzUw/rWszLEis+eXTb83GA6sATZZpHn4BAP3aCjNKJvHQajyrxebA78MMH2iDp
         R+4ggqI+wWfw61izBWnvBLfRkaKKP29NYsHSH2KjbzKZQP8qPMmV1nzfnL+UNmUgLPZQ
         Mh1g==
X-Gm-Message-State: AOJu0YwneMs19WW3aWItEsrBfzIATLs5Trc5d0mibf2B8a/QOKV8eUpw
	q743LrBOLDfFVsaaYoY/m0MFBqPfnsVuko96K59WPofHFrWZTLi/cGc2uySDaNdtpODvhelHmKw
	++sQ=
X-Gm-Gg: ASbGncsHdHicOo6Nk40DkHp13HjPC3Dg9CMo9wfHx6+espRv5G4stl/QfwIFtUAVg+t
	22E4AuuAHGBhCw8ZAAm1/3R217ZX9DvPNS0HpHbEM8PjaO3WgEuRqX0Mx9ay64BqoZ1sw7ZmO8d
	F7t/pOTq8idhcmafPWrHEeZvywxgsdbiPgLJnMJBpiYHMYJ7bQfqSvWRPTOLePFhbGXSOE7/ChZ
	Bm2W8cjKfwGu1msDZPvv6veq25ZnWQYhHhITi/B5CZpdrg5I1cYCuzT9lWZTV1wfbOuxzRZ6+eY
	jHiu2+O19hNeGoUSYxPvCTdJjtgpDBkX7k1xg7tyPTpDKXXaIFRa1beoNiQX3hITDTUEtbr8okp
	bNZ/jkY1pu9DbihBLhA==
X-Google-Smtp-Source: AGHT+IHB7XUpDqHtiaz95nxliZmnFd4VtG0oJAk+yY+CAy7MT4jnzocP1fTBggA3PBjVFpoV21XUfQ==
X-Received: by 2002:a5d:47ac:0:b0:38d:d371:e04d with SMTP id ffacd0b85a97d-39ad175c0cfmr6503103f8f.34.1743169485521;
        Fri, 28 Mar 2025 06:44:45 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Lin Liu <lin.liu@citrix.com>
Subject: [PATCH v5 12/16] xen/common: Switch {asm -> xen}/byteorder.h
Date: Fri, 28 Mar 2025 13:44:23 +0000
Message-Id: <20250328134427.874848-13-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328134427.874848-1-andrew.cooper3@citrix.com>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sort the includes.  Drop useless includes of xen/types.h

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Lin Liu <lin.liu@citrix.com>

v5:
 * New
---
 xen/common/bitmap.c                 | 5 ++---
 xen/common/libelf/libelf-private.h  | 3 ++-
 xen/drivers/char/ehci-dbgp.c        | 4 +++-
 xen/include/xen/bitmap.h            | 2 +-
 xen/include/xen/device_tree.h       | 3 ++-
 xen/include/xen/libfdt/libfdt_env.h | 3 +--
 xen/include/xen/unaligned.h         | 3 +--
 7 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
index 3da63a32a680..f605c98a02b2 100644
--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -5,14 +5,13 @@
  * This source code is licensed under the GNU General Public License,
  * Version 2.  See the file COPYING for more details.
  */
-#include <xen/types.h>
-#include <xen/errno.h>
 #include <xen/bitmap.h>
 #include <xen/bitops.h>
+#include <xen/byteorder.h>
 #include <xen/cpumask.h>
+#include <xen/errno.h>
 #include <xen/guest_access.h>
 #include <xen/lib.h>
-#include <asm/byteorder.h>
 
 /*
  * bitmaps provide an array of bits, implemented using an an
diff --git a/xen/common/libelf/libelf-private.h b/xen/common/libelf/libelf-private.h
index 65417dffc8a0..e5c9cc109972 100644
--- a/xen/common/libelf/libelf-private.h
+++ b/xen/common/libelf/libelf-private.h
@@ -17,10 +17,11 @@
 
 #ifdef __XEN__
 
+#include <xen/byteorder.h>
 #include <xen/lib.h>
 #include <xen/libelf.h>
 #include <xen/softirq.h>
-#include <asm/byteorder.h>
+
 #include <public/elfnote.h>
 
 /* we would like to use elf->log_callback but we can't because
diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index 1ad3c6bebf87..e9cd59b25463 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -5,15 +5,17 @@
  * Linux; see the Linux source for authorship and copyrights.
  */
 
+#include <xen/byteorder.h>
 #include <xen/console.h>
 #include <xen/delay.h>
 #include <xen/errno.h>
 #include <xen/param.h>
 #include <xen/pci.h>
 #include <xen/serial.h>
-#include <asm/byteorder.h>
+
 #include <asm/io.h>
 #include <asm/fixmap.h>
+
 #include <public/physdev.h>
 
 /* #define DBGP_DEBUG */
diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
index 4b642cd4207b..b5e9cdd3db86 100644
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -230,7 +230,7 @@ static inline unsigned int bitmap_weight(const unsigned long *src,
 	return __bitmap_weight(src, nbits);
 }
 
-#include <asm/byteorder.h>
+#include <xen/byteorder.h>
 
 #ifdef __LITTLE_ENDIAN
 #define BITMAP_MEM_ALIGNMENT 8
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 0ff80fda04da..6dc1fb5159cd 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -10,7 +10,8 @@
 #ifndef __XEN_DEVICE_TREE_H__
 #define __XEN_DEVICE_TREE_H__
 
-#include <asm/byteorder.h>
+#include <xen/byteorder.h>
+
 #include <asm/device.h>
 #include <public/xen.h>
 #include <public/device_tree_defs.h>
diff --git a/xen/include/xen/libfdt/libfdt_env.h b/xen/include/xen/libfdt/libfdt_env.h
index 8368787391b7..04abc6bb68c6 100644
--- a/xen/include/xen/libfdt/libfdt_env.h
+++ b/xen/include/xen/libfdt/libfdt_env.h
@@ -7,9 +7,8 @@
  * Copyright 2012 Kim Phillips, Freescale Semiconductor.
  */
 
-#include <xen/types.h>
+#include <xen/byteorder.h>
 #include <xen/string.h>
-#include <asm/byteorder.h>
 
 #ifdef __CHECKER__
 #define FDT_FORCE __attribute__((force))
diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
index 8c8b08338b8d..e64813ab4b20 100644
--- a/xen/include/xen/unaligned.h
+++ b/xen/include/xen/unaligned.h
@@ -3,8 +3,7 @@
 #define __XEN_UNALIGNED_H__
 
 #ifdef __XEN__
-#include <xen/types.h>
-#include <asm/byteorder.h>
+#include <xen/byteorder.h>
 #endif
 
 /*
-- 
2.39.5


