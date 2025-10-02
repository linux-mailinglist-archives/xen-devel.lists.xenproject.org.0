Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A43BB33D0
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 10:42:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135392.1472520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4EtH-0000BF-JY; Thu, 02 Oct 2025 08:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135392.1472520; Thu, 02 Oct 2025 08:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4EtH-00008S-FH; Thu, 02 Oct 2025 08:42:19 +0000
Received: by outflank-mailman (input) for mailman id 1135392;
 Thu, 02 Oct 2025 08:42:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9sj0=4L=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v4EtF-00006C-Aq
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 08:42:17 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b224fe7a-9f6b-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 10:42:15 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3f99ac9acc4so661095f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 01:42:15 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e960asm2619549f8f.37.2025.10.02.01.42.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 01:42:13 -0700 (PDT)
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
X-Inumbo-ID: b224fe7a-9f6b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759394534; x=1759999334; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWUjqrhoII9IYKgjMFDNsLi+Cgv2QEPokr0XBtkHqiA=;
        b=d2ACYnQjdJCASID/4ODKXEmYI3ls8DpnygtOYq43nb/uma58piGGaoVCDpeX/UgFm0
         3WrpL0Wq0YFEMDTU366YXAKS//gcDqGovyyV/sT+zr4UE/ridBCckz+82etsMf3VXbLV
         bxIjNc0iyb4bwU/a5Zhhn5YzoRhJGl/H5XnY2ldFy91Tde+T0JNA+YjT4IrVY/0rY+ag
         +f+/+GaiFdchEOCxQrcO5lntABcp4qlZREQKPEHkQpEx6MSv6g9bNlMJYrsmRel5lWSo
         rbfOjfxhqE11g6+54q9mwrblkdFHgW1gBXCre7G5bQ5VqPok3z4pY7EDwviXxhKzLN5Z
         DA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759394534; x=1759999334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWUjqrhoII9IYKgjMFDNsLi+Cgv2QEPokr0XBtkHqiA=;
        b=cTFR0it0HsYdBzYp2Hd15CjFvAcwsCX/z8rK+JVlxM+NNdUYJXVwJnH4rEUFTUIHPf
         9304lTyOIjCVgWtPQDOD0hvmpveDs7A0BBmRo8r3BOZ9APBgXY6n7u2GYR14Ub8iFPC2
         YvN7O+NEWiC2FeflOHqbAlDqJ+woOGMzYWCjakc9g/+gcDVOrfydj4Nd2EQ3Z6UZNI0V
         ZoIr5k5ZwswCR/L9nx1J/+KvUNc2YCZ4jsPktU6IIz6mWn8C1GaGVspe7xI2JRVnv/43
         k6NiW0qvXDGjpHzdl5AfY2q3Sf/VAUQ/a5OsCQuer83ZzIoz7xs5z00BBxzNfwnx47W0
         Yp9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpvmR4HrGrUk3jjxWTmQmtoEmb+fhbqsQ7cIoJg0u9sSrUAUGVMWP8Mwzkj9ibw7rXqXx5sYNWVf8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxENtRG6kiKYxm0I4xsqVUC4IquHCAiD4D7l/eG3rskaQY+OAtF
	3wMoQ5IAxmykSf2aHHEwrBdQYd5TcdgzVLnmuQecr7NChjGeckQ2a2O42WucUy6rcZs=
X-Gm-Gg: ASbGncsvK2SHWC6bkKSV1ApHWNu+8dbxM9BouKP7QZrW3rT4R39ZlaNQ6X4KNidWZoI
	8r1nzpc35x8W1y6n6tONl2nIrPujudvuqY0pR08QrmBW8Se01poWihxVlfQ0uyOcunUwgFVNovP
	/S2DO0Ga5DGzXoMUAKbbO7fWiTGKabb9Y2V2WK6/czPySeYdQL5oOkFn4x3/WT7pmWfeCJgdUsH
	grZeKdf5zoCuD+XU3tc2apx3DnwKb47cySpEPbq0FmeO6csHfb1oyot0hhYFdtvihE/sMDvOgAB
	utAiCWbRMGkqr+agBLUgtqss5HdvbvVQJd/pN2kPNbSixB2Ukc62G6YxdKk0S7vOVbPngcxjQs4
	yU4A8kwtQdn6SlISzBaB7pVfxdgljyc8r68e5H5RZxdz6tqmsRdW5FCbxiUylkJbsnYrPebCugR
	qHAduJlmibUyoquUp/MS2TO5fKyTvY6A==
X-Google-Smtp-Source: AGHT+IGTHDHXIrJOhOoypYRjJsVDikLhcyRvRa/vBA1Wlz/iaLsadlO4HdF+yc3FSV0R35r+UTvjog==
X-Received: by 2002:a05:6000:2586:b0:3e4:d981:e312 with SMTP id ffacd0b85a97d-42557817210mr5123294f8f.62.1759394534260;
        Thu, 02 Oct 2025 01:42:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v4 02/17] system/memory: Factor address_space_is_io() out
Date: Thu,  2 Oct 2025 10:41:47 +0200
Message-ID: <20251002084203.63899-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002084203.63899-1-philmd@linaro.org>
References: <20251002084203.63899-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Factor address_space_is_io() out of cpu_physical_memory_is_io().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/system/memory.h |  9 +++++++++
 system/physmem.c        | 21 ++++++++++++---------
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/include/system/memory.h b/include/system/memory.h
index aa85fc27a10..1b2b0e5ce1e 100644
--- a/include/system/memory.h
+++ b/include/system/memory.h
@@ -3029,6 +3029,15 @@ static inline MemoryRegion *address_space_translate(AddressSpace *as,
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
index 225ab817883..c2829ab407a 100644
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


