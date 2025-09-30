Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8CFBABFDC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133831.1471909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VcK-00089T-Ja; Tue, 30 Sep 2025 08:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133831.1471909; Tue, 30 Sep 2025 08:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VcK-000878-Fm; Tue, 30 Sep 2025 08:21:48 +0000
Received: by outflank-mailman (input) for mailman id 1133831;
 Tue, 30 Sep 2025 08:21:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3VcI-0007Nn-Ee
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:21:46 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80e55687-9dd6-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 10:21:46 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46b303f7469so38468355e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:21:45 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e5c3cad50sm8272675e9.3.2025.09.30.01.21.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Sep 2025 01:21:44 -0700 (PDT)
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
X-Inumbo-ID: 80e55687-9dd6-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759220505; x=1759825305; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVuWODNllLBcWHkHdEzk+20qcWtQ6YA1oYWBzMhXpCQ=;
        b=oigqoUBh0Kir4Us1OzG1+OnIJdK5wmw/a9qhXj5kjyJCs5G9IlrhRS7vKrDoPU9wY8
         Jj9jsGGShHfKuVNxLbokezI2AFcvbSdk8rhKLSNk8Ocf6E3QzAp005zVfg/Xqcpbofje
         c4CGAJZg6ny7f6U4Qe1D0RKc4KuiTv7pLHTWWoT7S9BHJTDT/xod+ijb81nfkRplWTJi
         IS3IXfmEH3tNY4d65xgPRQ7FAgZlKAjaDiyVJP1e2BWjuQqWwKuZfAbHSsrg6dn6T/cp
         UNUybVYx7CFroUn/mpiFaUtgj0aX4VvaJt6Z6lbhfwG+g6ZNQAVPO0tNT4o2MiVyr1jz
         KoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220505; x=1759825305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVuWODNllLBcWHkHdEzk+20qcWtQ6YA1oYWBzMhXpCQ=;
        b=OYAtEYRnmo7fdvvYR7y51kPqDt+uoBUaNvCSOpHyjqV0AcyX7OkgKyga3R/+dXIZT+
         oIo/cVhyH9bqb7Dt/u+k5RPet7O+siosOpGWVd5B5LOi6EyNdwCJMtyHCTAyDZA+o9F/
         7tgFLyLitLCQTTjiC9ON7YekIeL4vDx1cKYUjCR5KTW7O5QKB1yYEX5PwQ2l9q2KboTP
         sf12InpHReMMRmI6nP0ErRDA1vtLMbcw8wu9U+O1Z2ozyNdFz1s8ZF22xwCKS9w95eoA
         Ib/c74mMONA3+Ul+HnIvHlohmkIrKN/kT7n8/UZc+ohNrdaiBX1yLLxzhcgGXMAkeMzR
         B+gw==
X-Forwarded-Encrypted: i=1; AJvYcCUDrl7Ztkck6WStfB3tNw4AbmuXb3Cr+N/dogrVQj5lsoiE3edvsaST7+88MuSlZ3aj04o9MNPlBXI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJ5rYrOiS8i8GXCXxmtPlTfAKoeGa3wUcDM62HbvH0zkGOFH/0
	JZkNKMaN86N3NimYiDXRArk/XVPuNO+gglQqEcrzRZ1sDfp2d5Ty8r09WfxOlklHd5c=
X-Gm-Gg: ASbGncvEMZG92zz9unm7X0z5JVoEJ73Ani/vLBJPLWuyAClOvxxXrp6GlnwOGorplA7
	D/7mxDGAR0LatTjrnuIOYiTQ8O5Rwa8Dwe3EFNqYf3fIRxPZE+mVgMA07Ukt2UQfdE1i6vmgOO/
	dbjaxJm+PAprGvzeTL+vF4Ecz04/IyeCvK5yi8MO7zoUp7JrCPcEXjFMJE5m6HTXyCW+jGHmeRB
	DFguTgaMtyop+h0OGoXvQxsSODQgKQyW5n7c42MDGmdwDWBUaVGA9BKgRVbkJNlktODPMgUfBSy
	DSH28ZYjP/1i3kPhHfNnAGPvb0dMVSFHo3uMNeVbZ2xpELJtUUeSLhUBLHrVT8qyuXfcE7Af6iP
	S6JtQlRAlfrLOg2m+E1Hr5aTNC1KBeAZi++VeMhU0B52oW7NI7t4LIiReTXAy7TqgpPbY8s2XkK
	2KI4E+l/d1MiMImt2UY/QuPRa3yV6+fZY=
X-Google-Smtp-Source: AGHT+IEnN1+Dj0G5eE22oo/LVcWK6MF1t2TvnNSxkl29p00iMJks8dqgYIqx9W0IIiNQ+maQ1TKmXg==
X-Received: by 2002:a05:600c:1e85:b0:45d:d5df:ab2d with SMTP id 5b1f17b1804b1-46e32a03456mr188255845e9.26.1759220505370;
        Tue, 30 Sep 2025 01:21:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	David Hildenbrand <david@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	qemu-s390x@nongnu.org,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Jason Herne <jjherne@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Farman <farman@linux.ibm.com>
Subject: [PATCH v3 03/18] system/memory: Factor address_space_is_io() out
Date: Tue, 30 Sep 2025 10:21:10 +0200
Message-ID: <20250930082126.28618-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930082126.28618-1-philmd@linaro.org>
References: <20250930082126.28618-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Factor address_space_is_io() out of cpu_physical_memory_is_io().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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
index 86422f294e2..84d7754ccab 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3359,6 +3359,17 @@ bool address_space_access_valid(AddressSpace *as, hwaddr addr,
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
@@ -3755,15 +3766,7 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
 
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


