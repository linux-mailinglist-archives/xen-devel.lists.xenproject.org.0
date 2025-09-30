Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254FBBABFDE
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133834.1471919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VcP-00004v-T3; Tue, 30 Sep 2025 08:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133834.1471919; Tue, 30 Sep 2025 08:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VcP-0008Tv-OW; Tue, 30 Sep 2025 08:21:53 +0000
Received: by outflank-mailman (input) for mailman id 1133834;
 Tue, 30 Sep 2025 08:21:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3VcN-0007Nn-QA
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:21:51 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 841659e9-9dd6-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 10:21:51 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3c68ac7e18aso3798086f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:21:51 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5602f15sm21609359f8f.39.2025.09.30.01.21.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Sep 2025 01:21:50 -0700 (PDT)
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
X-Inumbo-ID: 841659e9-9dd6-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759220511; x=1759825311; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPaFfZE+Vm6W3t7QC31lKwf41cuqTfJ0BWTKMrsHvkU=;
        b=mG0+b/VURtvrMm/lC9C4YR0fWETRSotoiXmjoEiR8HEpQfE0oGlzA6p34Yi1/fvw3T
         f8uBL3+UbGwfacsykLe82zJIZEGi76RE2352SNv3IFB1SkKTHaT+J10Tr+r6ijo1OXvp
         v1OjuWmO2aW0xCqayOsYgYl3R5JMCHbvuuQYNiwVN0N+BFkJCaG2CNHPEGi7zXssZ2jO
         eaVGyf7KBxfzQ/qwVefJletBVUZMr7jQLHWzXqhFDgFioV4JRdOerxaJ9+Aqk/gqBfKA
         kd4sof/eSGiAAlQrBWy9HFksct1Kj9sLGWK3iD9XmMu/MIT00dgA8jS9jYtf2qX8TPvX
         K2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220511; x=1759825311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPaFfZE+Vm6W3t7QC31lKwf41cuqTfJ0BWTKMrsHvkU=;
        b=VSFybwbKHWv65+0Vhk5LuvH2FtTbS4olcw4rvpeDl3F7PsN//157zZemEPNrIJ+2qt
         nkFCYC/prMeikmZd3Uz+11MfJieUFGY8sZmnjyV9+ZgBaxMLlVSDyngklOKDIEdDwZeR
         zF2MEQDvyGzcVLvEEyB46dCT2WmsfpCKOq1f98tfJU4FEw8NrQlmbksHM1Ty6OD4+RrL
         7jSbCSmM9vZjW1yy+U9MGWj0p3kcWUXpNJVSZTIBYIeM23D9cGa5zdgKaI8RmGewRKLd
         XJ90v7BaLD9wfkUH7hh7rygSz3W9LDxxzeacAlomm3rfXB1w7d5Q2WLh05DnrBhQ1Prk
         u9YA==
X-Forwarded-Encrypted: i=1; AJvYcCUeU1vVRWDgZ4WGJRpC36tR5Hu5vmlDIe38cF7BsfPBt5xawJmWisvA9ydQ2jSsEcV5bgz7CU2aCcM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDLp+pyETzZuOS/71cVhAiUNNPrMlkLdMeFeeqwx9k7L6xwWyh
	nEK5yMFa2DVVIK+MqX32y7qAVGV72VWajemB5YfTKGyCJdzFqeZ7gDVa4ZuUe3LoyHw=
X-Gm-Gg: ASbGnct7/zH0guN24g3BI/v87zOHuRQkOlhbryG9ei5AKnI+Hh6wOthYJ6Dr/MhB+9H
	5EqqanQBPa/CwuaVYCjOmAdKBVqRpx4scgFsQCIyz/mqCGHoLYG6TDzP3LUPPRwetutxZGR0yIR
	9GQfHt46QPP+MhlgJTIexw5fNAbV7xUt1Ypa6altSjP8JAgFPnh6jktM5nXcBnQI3pyoe+QxAbu
	tAzekf9fpDI9LfVKzcWrgVXkr/fefb4mPtRIcxPFeE1iIdVxn++5Fx0z6GLtZWHtZzvZL2+SV4x
	DgSSYUY26xEYEakG4PEilKoStWBH/Xb53AVReoVGpQzl2GEBz6LJJLMULpFBFbwXJ0MJjqzJfxo
	zO1XWKgvdvfnSDgH+6TnPWUVCr/lXaJ889n9ss3wIaIDcPxLUsglufIgJdbYx8Laz0W8l1HW6bC
	hyrSUtWRX/weBxo7xTr02u
X-Google-Smtp-Source: AGHT+IEB8eNGO8ibaj4OUUkCL1Gk/lot4nZRiwg5YPnw3XMPBC9mULq1peqy0gUd0OsdrauuTBslPQ==
X-Received: by 2002:a05:6000:2511:b0:3d8:3eca:a978 with SMTP id ffacd0b85a97d-40e44682229mr16305754f8f.21.1759220510700;
        Tue, 30 Sep 2025 01:21:50 -0700 (PDT)
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
Subject: [PATCH v3 04/18] target/i386/arch_memory_mapping: Use address_space_memory_is_io()
Date: Tue, 30 Sep 2025 10:21:11 +0200
Message-ID: <20250930082126.28618-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930082126.28618-1-philmd@linaro.org>
References: <20250930082126.28618-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since all functions have an address space argument, it is
trivial to replace cpu_physical_memory_is_io() by
address_space_memory_is_io().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/arch_memory_mapping.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/arch_memory_mapping.c b/target/i386/arch_memory_mapping.c
index a2398c21732..560f4689abc 100644
--- a/target/i386/arch_memory_mapping.c
+++ b/target/i386/arch_memory_mapping.c
@@ -35,7 +35,7 @@ static void walk_pte(MemoryMappingList *list, AddressSpace *as,
         }
 
         start_paddr = (pte & ~0xfff) & ~(0x1ULL << 63);
-        if (cpu_physical_memory_is_io(start_paddr)) {
+        if (address_space_is_io(as, start_paddr)) {
             /* I/O region */
             continue;
         }
@@ -65,7 +65,7 @@ static void walk_pte2(MemoryMappingList *list, AddressSpace *as,
         }
 
         start_paddr = pte & ~0xfff;
-        if (cpu_physical_memory_is_io(start_paddr)) {
+        if (address_space_is_io(as, start_paddr)) {
             /* I/O region */
             continue;
         }
@@ -100,7 +100,7 @@ static void walk_pde(MemoryMappingList *list, AddressSpace *as,
         if (pde & PG_PSE_MASK) {
             /* 2 MB page */
             start_paddr = (pde & ~0x1fffff) & ~(0x1ULL << 63);
-            if (cpu_physical_memory_is_io(start_paddr)) {
+            if (address_space_is_io(as, start_paddr)) {
                 /* I/O region */
                 continue;
             }
@@ -142,7 +142,7 @@ static void walk_pde2(MemoryMappingList *list, AddressSpace *as,
              */
             high_paddr = ((hwaddr)(pde & 0x1fe000) << 19);
             start_paddr = (pde & ~0x3fffff) | high_paddr;
-            if (cpu_physical_memory_is_io(start_paddr)) {
+            if (address_space_is_io(as, start_paddr)) {
                 /* I/O region */
                 continue;
             }
@@ -203,7 +203,7 @@ static void walk_pdpe(MemoryMappingList *list, AddressSpace *as,
         if (pdpe & PG_PSE_MASK) {
             /* 1 GB page */
             start_paddr = (pdpe & ~0x3fffffff) & ~(0x1ULL << 63);
-            if (cpu_physical_memory_is_io(start_paddr)) {
+            if (address_space_is_io(as, start_paddr)) {
                 /* I/O region */
                 continue;
             }
-- 
2.51.0


