Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C930DBAB50E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:16:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133507.1471671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rmc-0003Ul-Rl; Tue, 30 Sep 2025 04:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133507.1471671; Tue, 30 Sep 2025 04:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rmc-0003LK-C5; Tue, 30 Sep 2025 04:16:10 +0000
Received: by outflank-mailman (input) for mailman id 1133507;
 Tue, 30 Sep 2025 04:16:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Rki-0006gD-1B
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:14:12 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e99a04a1-9db3-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 06:14:09 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3f0ae439bc3so2702479f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:14:09 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e5b69bc0bsm5141855e9.3.2025.09.29.21.14.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 21:14:08 -0700 (PDT)
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
X-Inumbo-ID: e99a04a1-9db3-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759205649; x=1759810449; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uk5+wyHN7CkT7HC+T4CiL8GLFFBvq7A2wJEeem4enV4=;
        b=eWdKJLfb2akGaqL0w5RBNmdQBGpZMIrcpsdg1SO/rsjS4blWeOjCUQ21OXhZV+dRC1
         q+donle6dNBA+YjLvUeunSxgrut1/wH/ugY1GRw+ws6XgQ+B/sJzGAbZhDWT0Y15AJmC
         Xw+nqTlUPKU19Oh3CY+gRZb2rmEGgerytEBm5FebAhJcHGh9OEqm2LrlCrCjE9BZFrs5
         Ywvv/jllfm+naevyepYz5xtobfguexr9xxa+lTsF5EhfqTM2+PXIrlqPOCcA/017jQ/j
         FuxYDqOsDj4RdHy+/I5ZWHbnT1AaU6brFbnJU/4iqP1L1dWhBWDgR+wHVj6Z40TfKlDK
         MqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205649; x=1759810449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uk5+wyHN7CkT7HC+T4CiL8GLFFBvq7A2wJEeem4enV4=;
        b=psmpZcKfxd6uOX9MN4cUK1+9Ig4jwtpXI872qFh8e2yvx5aXTMpxNPzqptDXh2336j
         vZQT/B2wFdK680Br91jOP9zM7oqKIkk+rSShde0ZeI7UwQ6mX5glGCcfTWNBSpUL4hfx
         WLbOyC6ZhkTvlh+k6fMXcUvJnuVepLIt9/6AB6YhJpw8tFRiLKn1JPp9zHoozd9LjSdb
         6BMB6gXPMBchWJ/wI+azbudihaBxuEALKJ9XqIdSJxEBKn6DYW8KEqVxw+M/YlVaLv4s
         8sNPdG0dTRC/fZp55rl2kKlVdejDFwY+C+KyvkELnYK6t1vfvK9gtWzkFyT7FrAaQMaA
         Mq/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUK9bhMb0JksMX7zVfMbfOBd7T/uHuGm/1x1y8+gCxEWV6tvCSia3aWLRyL1EWubfsQ4e1SWLpr2RA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysXyb/D1kO+C2hnqxWBliazXpIPJ1VcAzlfdDeLTS8j/gHftVu
	vPNex9EpEYz7+gLv6JyB352UlaLR/Z23+5uf7xL+xYY2mYSuQQ6UcaZCykvJduyHo3I=
X-Gm-Gg: ASbGncu8Rv4kYZqq8IeulPQFWeTOMmBYSgzOFsKpmbXpP4FSkng+fZ8wDcCC4Z3+Fun
	td3B4OJtp098Kvy00zG5FBALlovSKf5Y71FhTQxdk451BXI4i3b9jgVfVMgIar5gelryFzNqz9h
	ThgPewwALNbPz5bV5WL41B8FfIKNsjjA2NLsARSEBjiwmqf/s4spQsoWCMmZAOWP54SzrJVKEuD
	OMIQmwo7E8nyoMdZ0IDCU4xZnt9W5qau/A01RfHF7QMVx6PBT4EAY7yKlp94WgxQhHKAH+HQpUb
	mDeiv98UenLYoIrNYyXWKpLmMLU7C4/w5S3+mxe799WJVzgio2YXNkolbUH4rlsEEa34LJ3Ig96
	TANgMqFaCylL0+d/yvXE39NY4/1J6CLmo0WBrVA6OyXS/KF/NN+0ukP9yExLvLOVWeLv+e/iHxB
	Mjg7uozcKsQBORM96r8XAWXRcDUWGgze0=
X-Google-Smtp-Source: AGHT+IHVwaY6Q4s0F84QmaOmJAx4BK9ueW3Bbg0HpiOJvzkr7RtDJkQ0plXWj1SaEJLGINz1Ov7KPQ==
X-Received: by 2002:a05:6000:3101:b0:3eb:5e99:cbbc with SMTP id ffacd0b85a97d-40e458a9394mr12531634f8f.9.1759205648705;
        Mon, 29 Sep 2025 21:14:08 -0700 (PDT)
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
Subject: [PATCH v2 07/17] system/physmem: Pass address space argument to cpu_flush_icache_range()
Date: Tue, 30 Sep 2025 06:13:15 +0200
Message-ID: <20250930041326.6448-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930041326.6448-1-philmd@linaro.org>
References: <20250930041326.6448-1-philmd@linaro.org>
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
index 546c643961d..dfea90c4d6b 100644
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
index 573e5bb1adc..70b02675b93 100644
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


