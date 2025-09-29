Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 867DCBAA4D8
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:33:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133116.1471303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IgS-0001FX-11; Mon, 29 Sep 2025 18:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133116.1471303; Mon, 29 Sep 2025 18:33:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IgR-0001DQ-Sm; Mon, 29 Sep 2025 18:33:11 +0000
Received: by outflank-mailman (input) for mailman id 1133116;
 Mon, 29 Sep 2025 18:33:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BPw2=4I=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3IgQ-0000iD-Bw
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:33:10 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf092008-9d62-11f0-9809-7dc792cee155;
 Mon, 29 Sep 2025 20:33:08 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e2e6a708fso32634665e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 11:33:08 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5602f15sm19310452f8f.39.2025.09.29.11.33.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 11:33:07 -0700 (PDT)
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
X-Inumbo-ID: bf092008-9d62-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759170788; x=1759775588; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGMp7t36URRQSytZ84th6z88iiyCKyUd2WF0ymWy9Sc=;
        b=bkg76a5r4eVsmU0pu9ZzzVUVDnDKMWB8BiF7gykQDQI4Rb0QrVsg2iEMazeUi3n8NO
         8CuH11s81FtNP66bcG8eGu0wgLDYyZyw87YJRmND338QFCvOZ/gWUWDI2grA/w/GGLWm
         SBcMnr/qyl7j5FNy9MkyLhp7Q3QA4XYyHRZRVV1URqoReAYD8wlH5o7X09ASTscvEog0
         B57Plxi2Xkml8obROdsB+7pK6Ue47Ob7rsmdYqFxu8btO9ENUcoGRp9vK9NOP+5z2sWP
         01WYvawR+BWYnkjxc9fzhhB/7hTC4WyO1Ex3W29jTpMwRGVppYatXuW+ZX18yuMZiXuP
         7p6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170788; x=1759775588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGMp7t36URRQSytZ84th6z88iiyCKyUd2WF0ymWy9Sc=;
        b=K1aCXBeGjYPka6u0b+JSRoMZy/2gVpMfCDDZMXoOUqzkpus+vkdQyiEkWUXM+gG87I
         8wPYbbmT/SJ34AnD4WYGoovd3OaGqipzg41Z/AU4lQE5//X4icQtoDpG0nhlUzmRVkUD
         Qu3QX2BaSk4m0UWuWMt77O3RFk78pzuW8zNIClmt7o8A7wBaZSJgW8WkpkkkQ6G/dHXS
         J3BAFHgqFneylDvneuQAbPQu5VP5qSlRmlI1QyhFEvnR2uChn5j1G2Ou0ItQJuxLHU0S
         lsNQ8vRecVHtxlOkKLmRg2VhqQkRBg+Q5CAna1iJQHhT+vIuOx1ukKwt/rQ3Ct+sZZqF
         n0kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUynGZ8iVtCyNxfSmby61XE1J95Be5Qg+iqij2/FrEq31Ta7mlO2W9QVZN8BR79v6zD7shdTe7VqLY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWhLSyxIJ34ostEqaG/L51UXw3VENJblvkGb6MByW9nTED5Lxu
	PNmE0SzssN2TmNL7J/+9arVPNyPeiWhSmYTuUnSnxo25Uj/UM3yta0/Plf6+TbW7GY4=
X-Gm-Gg: ASbGncspl5WQ3FXJsUhI8u8kicxx8PXbf7P6nSKdaitkzqc9CAfIVxca0Z5L9+qth7v
	NlNK7AK+XkD7NmfTETnPMbbEzB56K3xTTuoY4qK2B6G5TKo04XP3k0aM2doMRF5rIKwFESsdyq0
	xfzenu1GTTdhuHe17XiwDrXeUE24gH8QNF6yJ4E3k5D8oSwG5WpMq6aUmO2iGEhs1Z4VECgoh0P
	srfNLWVTqKXxf4NZv05GteV1fj1B7xijp0xcQ8rNr5kyXWYBz8KaVCN7bu9oBZTvCrz49kOSJld
	GY9Afd9zuby5ZDC3rS3KJBIizwm/0iHueX5h4DN4BBNSvGViouiZvMLXOEYbkVmiJM8VzRQmFVO
	sAHBO3zxc/7PdFi/K4Zsgzq5X34QfL0OPxKQFdRNNlM8q+Z8Vum9UGELBF4n5AS6YC8hwzP/U
X-Google-Smtp-Source: AGHT+IHywbu3bHq36g4SNbzTfpiE+7B23z7rbV7w73oeTvg9ANkjyrRL+PYW3W+Y3jHxmFSC/MGdsQ==
X-Received: by 2002:a05:600c:6303:b0:46e:376c:b1f0 with SMTP id 5b1f17b1804b1-46e376cb318mr142020765e9.7.1759170788090;
        Mon, 29 Sep 2025 11:33:08 -0700 (PDT)
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
Subject: [PATCH 02/15] system/memory: Factor address_space_memory_is_io() out
Date: Mon, 29 Sep 2025 20:32:41 +0200
Message-ID: <20250929183254.85478-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929183254.85478-1-philmd@linaro.org>
References: <20250929183254.85478-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Factor address_space_memory_is_io() out of cpu_physical_memory_is_io()
passing the address space and range length as argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/memory.h | 10 ++++++++++
 system/physmem.c        | 21 ++++++++++++---------
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/include/system/memory.h b/include/system/memory.h
index aa85fc27a10..6cfa22d7a80 100644
--- a/include/system/memory.h
+++ b/include/system/memory.h
@@ -3029,6 +3029,16 @@ static inline MemoryRegion *address_space_translate(AddressSpace *as,
 bool address_space_access_valid(AddressSpace *as, hwaddr addr, hwaddr len,
                                 bool is_write, MemTxAttrs attrs);
 
+/**
+ * address_space_memory_is_io: check whether an address space range is
+ *                             I/O memory.
+ *
+ * @as: #AddressSpace to be accessed
+ * @addr: address within that address space
+ * @len: length of the area to be checked
+ */
+bool address_space_memory_is_io(AddressSpace *as, hwaddr addr, hwaddr len);
+
 /* address_space_map: map a physical memory region into a host virtual address
  *
  * May map a subset of the requested range, given by and returned in @plen.
diff --git a/system/physmem.c b/system/physmem.c
index 8a8be3a80e2..18b3d38dc0c 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3358,6 +3358,17 @@ bool address_space_access_valid(AddressSpace *as, hwaddr addr,
     return flatview_access_valid(fv, addr, len, is_write, attrs);
 }
 
+bool address_space_memory_is_io(AddressSpace *as, hwaddr addr, hwaddr len)
+{
+    MemoryRegion*mr;
+
+    RCU_READ_LOCK_GUARD();
+    mr = address_space_translate(as, addr, &addr, &len, false,
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
+    return address_space_memory_is_io(&address_space_memory, phys_addr, 1);
 }
 
 int qemu_ram_foreach_block(RAMBlockIterFunc func, void *opaque)
-- 
2.51.0


