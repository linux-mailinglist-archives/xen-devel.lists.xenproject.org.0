Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B63BAA4F0
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:33:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133143.1471343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Igo-00035H-Cy; Mon, 29 Sep 2025 18:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133143.1471343; Mon, 29 Sep 2025 18:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Igo-00032L-8t; Mon, 29 Sep 2025 18:33:34 +0000
Received: by outflank-mailman (input) for mailman id 1133143;
 Mon, 29 Sep 2025 18:33:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BPw2=4I=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Igm-0000iD-TB
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:33:32 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc042e6e-9d62-11f0-9809-7dc792cee155;
 Mon, 29 Sep 2025 20:33:30 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e37d10ed2so48131645e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 11:33:30 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e42eee0b6sm125709405e9.10.2025.09.29.11.33.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 11:33:29 -0700 (PDT)
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
X-Inumbo-ID: cc042e6e-9d62-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759170810; x=1759775610; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEWvJYylRbkib8yXjJlQ3r1Fc9sZ+i1G3AKqr/Nn6n8=;
        b=GCwt3AlTYFW6tyHaW+MemQnB1CJRubd6bmE14DQO88o9hoMVzkTydUXloKV3CDRjfM
         lUakLoAlMhiCxQBHjr/v2L1z0mMSF+I+rM/bD6yVuVTUkJxLpTk868HHWkqOHCRV5N1x
         P4Wko6mV+Iw3K/pGbsJR/HnUJ2rM0AMYMUZuD6mHbtz23bM5kS+qgafY7C7ZHxN163/7
         X5cRpYwjVR2tc6NO2KY2xwadsN6VHPb2dm7bCDfHrBvMp2no0Zu6XrSpgFmXkDfVWTk2
         2RaJBBf1BQBYGTG5Wm4EzDeJv5c5Dj4jGFbmLjnIM7k6Y/iA+P6KCpazrlvNfURBSMDF
         HANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170810; x=1759775610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PEWvJYylRbkib8yXjJlQ3r1Fc9sZ+i1G3AKqr/Nn6n8=;
        b=TqYak0A4D4CCFrzPSV8+7VdIIRy7nHmO5wk+/+w/DiLYZa+TA8cxMKSCXtltIVwCG/
         mQwd4GZKnvNVe16XdEqg+F1ZVWBUMToBr2GmSbvvie/Sqk8MaHGGqq1nEf+yGYB1KqAU
         q6pYPMAV3bywZf69NT/3Cqywi29F6XVqOTw4x4zXBSuR3CdEKd34VmlB4WeblaMBpHFm
         lmbVj+VB3pLqB0iRnKSUpMUez9Mp5+ZiMHzsYeHTt+2XujLgF8qYatxBO+Ms1R6M+ldi
         W0woflHSNSnG2uSL4RQX7JgAbXhxY3Ke1k71R2qp3UIcEgHl2U1rQvmIW1oW67x76Z9b
         IqUg==
X-Forwarded-Encrypted: i=1; AJvYcCUF20FzEM11z3Ykz21S377TxYK1+P1ijtQyyb2diitwNme7vtYUoe245YXz0nCiSWNhPadGeuC5YWs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz84COtTaDLpqc3ZxPi/zPrNxin8oxrbdGKIiY6qQycJGcdUpWY
	Ji9Pz/85x8ro+FBaU9F+JmyCs5P5/8cNnK3uE8kUpQ941FMFQnpew28aW3DdMxe2Kdk=
X-Gm-Gg: ASbGncsnl5oF2IKkpBZStVVL+hvHQjDHNQh1hvyZmRUH7kmS6A96GHg988dJ7REoVzY
	hzbUxFNR67qMbGSftKjideSXgv6v/oMbuhGNqn7VwU0emhWePyli+SOQFTWZLuo9La5+J2pNnBA
	1QvMu1dj+RzFkAsfQAJAVtsocWLzVZgu5EKkG7CuPcek/E3GYG+4V1oBkVB4cLCnK7+suM1BZKS
	y5NRUX+O7m6rcb/hegywZny0iOsnF3lopM8CIyfXJ/1NWPii/+rJGW4I0XqogaFeZ7OgErd/3By
	UXQJtPLxS69lJ5Ovqer/Fwdb+QDBp8OVbQQIrJBZ1atKqjB0TI6I3DhjCCZpEm/CdqJwYeoP2BE
	aBPE3DH1SB4BxaYPdkHFrDGf7NM28xkXIux++HcNH2WgbxDC+WU2arlDrO3EqxLXM+KY3VOsuVZ
	yAu3pmUP8=
X-Google-Smtp-Source: AGHT+IFlycBakp5EkJDN7dbxjK7i5JzbYULjjWcaNxhP9aXTBI6jbDWLO50skO4rhy6UhWAATwe2kg==
X-Received: by 2002:a05:600c:609b:b0:46e:4814:4b6f with SMTP id 5b1f17b1804b1-46e48144bbcmr82071665e9.2.1759170809908;
        Mon, 29 Sep 2025 11:33:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	kvm@vger.kernel.org,
	Eric Farman <farman@linux.ibm.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Anthony PERARD <anthony@xenproject.org>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH 06/15] system/physmem: Pass address space argument to cpu_flush_icache_range()
Date: Mon, 29 Sep 2025 20:32:45 +0200
Message-ID: <20250929183254.85478-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929183254.85478-1-philmd@linaro.org>
References: <20250929183254.85478-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename cpu_flush_icache_range() as address_space_flush_icache_range(),
passing an address space by argument. The single caller, rom_reset(),
already operates on an address space. Use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-common.h | 2 --
 include/system/memory.h   | 2 ++
 hw/core/loader.c          | 2 +-
 system/physmem.c          | 5 ++---
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index a73463a7038..6c7d84aacb4 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -156,8 +156,6 @@ void cpu_physical_memory_unmap(void *buffer, hwaddr len,
  */
 void qemu_flush_coalesced_mmio_buffer(void);
 
-void cpu_flush_icache_range(hwaddr start, hwaddr len);
-
 typedef int (RAMBlockIterFunc)(RAMBlock *rb, void *opaque);
 
 int qemu_ram_foreach_block(RAMBlockIterFunc func, void *opaque);
diff --git a/include/system/memory.h b/include/system/memory.h
index 6cfa22d7a80..00203522ae4 100644
--- a/include/system/memory.h
+++ b/include/system/memory.h
@@ -2977,6 +2977,8 @@ void address_space_cache_invalidate(MemoryRegionCache *cache,
  */
 void address_space_cache_destroy(MemoryRegionCache *cache);
 
+void address_space_flush_icache_range(AddressSpace *as, hwaddr addr, hwaddr len);
+
 /* address_space_get_iotlb_entry: translate an address into an IOTLB
  * entry. Should be called from an RCU critical section.
  */
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 524af6f14a0..477661a0255 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1242,7 +1242,7 @@ static void rom_reset(void *unused)
          * that the instruction cache for that new region is clear, so that the
          * CPU definitely fetches its instructions from the just written data.
          */
-        cpu_flush_icache_range(rom->addr, rom->datasize);
+        address_space_flush_icache_range(rom->as, rom->addr, rom->datasize);
 
         trace_loader_write_rom(rom->name, rom->addr, rom->datasize, rom->isrom);
     }
diff --git a/system/physmem.c b/system/physmem.c
index fd2331c8d01..dc458cedc3f 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3214,7 +3214,7 @@ MemTxResult address_space_write_rom(AddressSpace *as, hwaddr addr,
     return MEMTX_OK;
 }
 
-void cpu_flush_icache_range(hwaddr addr, hwaddr len)
+void address_space_flush_icache_range(AddressSpace *as, hwaddr addr, hwaddr len)
 {
     /*
      * This function should do the same thing as an icache flush that was
@@ -3229,8 +3229,7 @@ void cpu_flush_icache_range(hwaddr addr, hwaddr len)
     RCU_READ_LOCK_GUARD();
     while (len > 0) {
         hwaddr addr1, l = len;
-        MemoryRegion *mr = address_space_translate(&address_space_memory,
-                                                   addr, &addr1, &l, true,
+        MemoryRegion *mr = address_space_translate(as, addr, &addr1, &l, true,
                                                    MEMTXATTRS_UNSPECIFIED);
 
         if (!memory_region_supports_direct_access(mr)) {
-- 
2.51.0


