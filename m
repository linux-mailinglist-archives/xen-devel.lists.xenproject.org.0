Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 104E4BAB4B1
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:14:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133437.1471570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3RkM-0007ZJ-Rn; Tue, 30 Sep 2025 04:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133437.1471570; Tue, 30 Sep 2025 04:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3RkM-0007XN-O7; Tue, 30 Sep 2025 04:13:50 +0000
Received: by outflank-mailman (input) for mailman id 1133437;
 Tue, 30 Sep 2025 04:13:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3RkK-0006gD-Dl
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:13:48 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc2685f6-9db3-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 06:13:46 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3ee1221ceaaso4373187f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:13:46 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc56f7badsm20596977f8f.29.2025.09.29.21.13.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 21:13:45 -0700 (PDT)
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
X-Inumbo-ID: dc2685f6-9db3-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759205626; x=1759810426; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6XZQA4g1t2k7eXHW7Di/TUkQvEa/xc7WHxCnzJSKoM=;
        b=rvEfaaVf5DZYXnk02ew5puqhy9s9ozh72EXeXMu2qbrNQbdwCrLPTNo0+TSPGZJ7sM
         EQ/aEWBdV9SqJLKmrOOgUJy3swe2haJEsI9u9atJPi+Bir7hGna7CfCz75NP+Nm08XEi
         lOzIgCV1i1ja9BHuAoaQn+NteDTeGHZ4BYCDtj/vh/9cU4TK5YZpvjNjZFrsxxCt4PyY
         EMtU/t5PZfM+MYZFmEtpswkSJTQzo/wRqyHaPWuf54yeE/jKLfTIaShviFLif1j4pWO8
         Rwd8OQ/vTUnf5qAbY8nSiTPVS8nmGJghjwgOiwptzZEEX4WrVOtOSN/R5oaHpmxAPr6u
         wamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205626; x=1759810426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6XZQA4g1t2k7eXHW7Di/TUkQvEa/xc7WHxCnzJSKoM=;
        b=WfieuLb1DJgnXOa22p0fh4qgX/sNGz6YS3khFhn8tESq8il2fNdfUe5xxc6kVhOXl+
         phprWbcgQxfZLC/PtcvKt6kBrgRCCe6ctm3Bd8wHzkkM+/NZhj19iqRse3m44JKif2BS
         be0NJglU3RBu7hwoqd68msVmF2CS6l4ZPlya4cxRxQUH31VbQEeYlcTum6skr+LKFaxK
         YZKBl2l5WmnEoF/RbbVdMKS0k5tMOov3c5RU0Jqnlj/1BHrwpcmasS4rSWpGbNK1HPuu
         /Ka0BaoWueOxd/k1KWSBnW4DqL9OuVNt4+ZBk4HPh8Usj4MpAhwkfdUNDAIS+O+Y44xE
         fvKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRoGfJOvuxw5SA2GUyzd5vd1KmpG4VrFsqluNWEXBsVASWKRF5Z2H0B6+7BkJhgkEB0Ll5XLWJNDM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxy8pDQc5IDyd3qZq5In3DPW+h9qyetWaNmTYxXbub2KYLxhzBJ
	+bMJ2oVMf8SARbGjkQJkM7X5zGDZ7EwbsyLnZ9GhCXleUDGLnSxrnKEqwIwHqsTaFsA=
X-Gm-Gg: ASbGncsQEZCt0XAPN0lxlEAJveFejIXyQBArbhE+IxSxALWwNYaix8LkhAUSw3J8aE5
	iAmIATNswBaC6r7KlOhh0sQ/u6tooEu68bCSuWKmcu/Yu3HvWicU5j+TUnER0UR9wtsMx8D3pY/
	5PJIeys94jXc0X8tFsKque5zCWNz1p3Hz9X/C1+3FxyBp13QaLQYvxzWlAmJTLyWA4jOGfS+GIo
	Bh2aY8mCeUKXzqq4knlnf+Hs534XwUTuC7JobqIUeB7TFI8fDz6hm2XJ9xgoZvTsXBRFw/leuc0
	JCc3hNKRjkOTggASH6SSJS+on3W3SBHN5L8Hi9bZHOQ9f55qVJmzgWa5rSNKlbNRTB1qrJBzM1B
	cxaqrsc6P2rBKN+rXgujaWeU0SzSIoRIS7jM8/LCjF7USLNgh42xB4B0pkY+6jgoLMcg0BXFrjc
	UeeqVMuMM1Phb0SnPStEf1xbnLRuPov/0XrwohLatZmA==
X-Google-Smtp-Source: AGHT+IH4qhPqaNC0ZqE7vVzxj8tSipzOFCi7y5DLl309Ye1K/9debpwVgj0eZ2sdSCTFy4WRMq+1ZQ==
X-Received: by 2002:a05:6000:2901:b0:3ef:42fe:8539 with SMTP id ffacd0b85a97d-40e47ee0a37mr19502672f8f.25.1759205626154;
        Mon, 29 Sep 2025 21:13:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jason Herne <jjherne@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	Eric Farman <farman@linux.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 03/17] system/memory: Factor address_space_is_io() out
Date: Tue, 30 Sep 2025 06:13:11 +0200
Message-ID: <20250930041326.6448-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930041326.6448-1-philmd@linaro.org>
References: <20250930041326.6448-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Factor address_space_is_io() out of cpu_physical_memory_is_io().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/memory.h |  9 +++++++++
 system/physmem.c        | 21 ++++++++++++---------
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/include/system/memory.h b/include/system/memory.h
index 3e5bf3ef05e..546c643961d 100644
--- a/include/system/memory.h
+++ b/include/system/memory.h
@@ -3030,6 +3030,15 @@ static inline MemoryRegion *address_space_translate(AddressSpace *as,
 bool address_space_access_valid(AddressSpace *as, hwaddr addr, hwaddr len,
                                 bool is_write, MemTxAttrs attrs);
 
+/**
+ * address_space_is_io: check whether an guest physical addresses
+ *                      whithin an address space is I/O memory.
+ *
+ * @as: #AddressSpace to be accessed
+ * @addr: address within that address space
+ */
+bool address_space_is_io(AddressSpace *as, hwaddr addr);
+
 /* address_space_map: map a physical memory region into a host virtual address
  *
  * May map a subset of the requested range, given by and returned in @plen.
diff --git a/system/physmem.c b/system/physmem.c
index 2d1697fce4c..be8e66dfe02 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3358,6 +3358,17 @@ bool address_space_access_valid(AddressSpace *as, hwaddr addr,
     return flatview_access_valid(fv, addr, len, is_write, attrs);
 }
 
+bool address_space_is_io(AddressSpace *as, hwaddr addr)
+{
+    MemoryRegion *mr;
+
+    RCU_READ_LOCK_GUARD();
+    mr = address_space_translate(as, addr, &addr, NULL, false,
+                                 MEMTXATTRS_UNSPECIFIED);
+
+    return !(memory_region_is_ram(mr) || memory_region_is_romd(mr));
+}
+
 static hwaddr
 flatview_extend_translation(FlatView *fv, hwaddr addr,
                             hwaddr target_len,
@@ -3754,15 +3765,7 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
 
 bool cpu_physical_memory_is_io(hwaddr phys_addr)
 {
-    MemoryRegion*mr;
-    hwaddr l = 1;
-
-    RCU_READ_LOCK_GUARD();
-    mr = address_space_translate(&address_space_memory,
-                                 phys_addr, &phys_addr, &l, false,
-                                 MEMTXATTRS_UNSPECIFIED);
-
-    return !(memory_region_is_ram(mr) || memory_region_is_romd(mr));
+    return address_space_is_io(&address_space_memory, phys_addr);
 }
 
 int qemu_ram_foreach_block(RAMBlockIterFunc func, void *opaque)
-- 
2.51.0


