Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF9DBABFF8
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:22:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133866.1471948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vch-0001q4-Sy; Tue, 30 Sep 2025 08:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133866.1471948; Tue, 30 Sep 2025 08:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vch-0001nq-PL; Tue, 30 Sep 2025 08:22:11 +0000
Received: by outflank-mailman (input) for mailman id 1133866;
 Tue, 30 Sep 2025 08:22:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Vcg-0007Nm-31
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:22:10 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dabc4a3-9dd6-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 10:22:07 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b90so3554851f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:22:07 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc6921bcfsm23056408f8f.43.2025.09.30.01.22.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Sep 2025 01:22:06 -0700 (PDT)
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
X-Inumbo-ID: 8dabc4a3-9dd6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759220527; x=1759825327; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkYmQo8nriy/yGfh4HWmKxNmJbyJBkEcEbiWP0BNxvs=;
        b=dNxCbGWbONCGtrKZUodXj6K1M4g6+5J8ZprI9GH3rCZ5/GIsijAuZsw4hEuF/2olLF
         q0UeB8RsY9hYrG/wJa2DomCym4XFYDvkLx34/1Ecv746CNTuNWv8xqR6WM/uKeCMogo8
         fDSO/1ku1HsBGjVdToADxNVB2ATJG8YDyaSUXCZ9fIzC9QMEiXCv4VkNloQ1jS2UX1gn
         5AoBoyS+63azvRpM6IGdzbGAX/SzUpBlFWtAo7RHWGtDHG1AhQocV1PLfsT9JFC0zvWC
         Ow3c0IhX1Bnt1Jxds33/dbKYkoTDJSV+BRnHadouZE6DLheIFzdd1GSYn7gQPJGVdaRx
         kL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220527; x=1759825327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YkYmQo8nriy/yGfh4HWmKxNmJbyJBkEcEbiWP0BNxvs=;
        b=FhGyJVtNv9By/IgE/ASKWJR7J889IZ4SBGV/JRu/pcO3we7tyPu7BtlcVWWAgMu/5Z
         vbcje32pnfZPYJvBOqunlk52JF4Ywg4HtzJe9gs7W1kmhtgS+9JvHnbbEo7Og3ToDC2D
         D2T4+8/nhfLiDUjEzjOkj0wAjJ1p1LlBJ1vRMiVcfzpR2OF4xEDAKZoa10Yp5K2yzpcg
         Qg7NZUEbk3mo2ElIkuHeilkqjv75YA1N3eHkfT5zWiKrVHSaKl+ToK3JDT8eKtlHX/B7
         /6hnmpkdk8FyNerdyzub4BlBXiAzb8W1B3FpivpMDWZR1Z8X7fJdtgcXbSe6c7+gaEpL
         NKgw==
X-Forwarded-Encrypted: i=1; AJvYcCV99CW27X1yQxYWx93zXMQRfMf1s298X8yWzXM2hc5LgXbi1xfXuwW2k6mDhROKk02RIOy3tCiD5C8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDP0h8/ue4iYI7JVchzkL7RzF9y6FIS/f9ddF09KdUolVTN+Fi
	s724Uk0gOgv3BPbRN4Er2Fyy/9DPUyq2cb5Y5FmiHuPoKJmXgpgrKwtyjVGumCpsG7E=
X-Gm-Gg: ASbGncstcq66Ve8yge6MhsvBKuVHL9AL+jdQMOhCkCswD+UCRBdqp8iYPkhrqKQ/6w3
	i/czrNnzZLgnsiEbVx9/faMtHbhqDJ01tgnFa10061All+WIbjJe5QdHvums6BfVW1zaPnrfmQN
	v6Ce4h1O6zjkrFCECa/eDrljKC+3/ALwEiaPv8BqeJQ5FlZ6CT9/nqrOD49JrBCkNfxXqY7tMM+
	JAFpo0xGGNBDOS5zwzqifA2nTcKAr8w+VzJfAqhd27MUUEQYOSRPOgNb0kgUkYzcmtlWK07fqf2
	SYTXDpxeJBVADyVxmpDDUKwfqhOnXoJZF9OZ/tjiKKwPORQ93ysYCI5rL6PbqysOx3O6/kezZBA
	ChSeEzhsSUpjKQkTZPS1CehZwj6qvhhm2Y7XYCd7rQfBzaVo6UoUqUnW041JOa1EOy/2ucj5sXD
	joXfyvHf0kfE0mSO9yqXHOc4OCK4/Dg61M8t0CpjbmqQ==
X-Google-Smtp-Source: AGHT+IHzRQHYpgb/DyIfYTEXGiArYWqeYdxWvyGmM8w8s+84+M4R5T3PN9QeVLlNgQQ0W4P8WfSxtg==
X-Received: by 2002:a05:6000:26c9:b0:3d2:9cbf:5b73 with SMTP id ffacd0b85a97d-40e46515110mr15910423f8f.6.1759220526791;
        Tue, 30 Sep 2025 01:22:06 -0700 (PDT)
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
Subject: [PATCH v3 07/18] system/physmem: Pass address space argument to cpu_flush_icache_range()
Date: Tue, 30 Sep 2025 10:21:14 +0200
Message-ID: <20250930082126.28618-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930082126.28618-1-philmd@linaro.org>
References: <20250930082126.28618-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename cpu_flush_icache_range() as address_space_flush_icache_range(),
passing an address space by argument. The single caller, rom_reset(),
already operates on an address space. Use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index dff8bd5bab7..e0c2962251a 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3215,7 +3215,7 @@ MemTxResult address_space_write_rom(AddressSpace *as, hwaddr addr,
     return MEMTX_OK;
 }
 
-void cpu_flush_icache_range(hwaddr addr, hwaddr len)
+void address_space_flush_icache_range(AddressSpace *as, hwaddr addr, hwaddr len)
 {
     /*
      * This function should do the same thing as an icache flush that was
@@ -3230,8 +3230,7 @@ void cpu_flush_icache_range(hwaddr addr, hwaddr len)
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


