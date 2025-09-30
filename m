Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920C9BAC070
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:26:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133919.1472019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VgZ-0005Jp-KA; Tue, 30 Sep 2025 08:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133919.1472019; Tue, 30 Sep 2025 08:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VgZ-0005Gy-DH; Tue, 30 Sep 2025 08:26:11 +0000
Received: by outflank-mailman (input) for mailman id 1133919;
 Tue, 30 Sep 2025 08:26:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Vdd-0007Nm-B0
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:23:09 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b197e6de-9dd6-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 10:23:07 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-46e4473d7f6so24843515e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:23:07 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc82f2965sm21484653f8f.55.2025.09.30.01.23.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Sep 2025 01:23:06 -0700 (PDT)
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
X-Inumbo-ID: b197e6de-9dd6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759220587; x=1759825387; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+R20KfaeepivX48ztS5Qk+Utu4Wf2nP4nwxC8R0e4a4=;
        b=XsLGFzWQTOCJYDfyRB1ZDBDRURr/nK7iRq+id4fav97QU/FyV44/btlMMGnv9IGtw+
         UhgDRpOlZv4aZDxGfQtR/seRHmYD3ei0P8fh59PwyCiZUrc6sbEA5hcY8EqabSheI9PG
         LVeISu8DHegvqU8w/JbvUDLnQzjFeCSs52sAPh1vMgSMOi10IX2sLNTi/spPr9q6Dqzn
         poQpGfvfGo8YgSbCIEynUQ0Y8JKOQdfNfvxovXxGV/FskzPhOzTW5Gbce5kSmguNvaNb
         6y34WRMg9DaMBZ2C1phR9LBhd6xF1aP0kAb4uu71MA6ZQy9fnAxM5WAu2yasAfiwQpAP
         55ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220587; x=1759825387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+R20KfaeepivX48ztS5Qk+Utu4Wf2nP4nwxC8R0e4a4=;
        b=QalbMQ5CSoRONE+Wb0KlbQFr+jD0QIYnTqIO+ytw0GzH9+GTF3nWHtnP247TACyaZE
         WiA0FG3cHdo73Tb3skYV4NQC3smG4dCxeYb+zeaaYyLM8aR3eqXHupNboL4t8eIIhiKl
         Hid4XbNLQSz1fZ2N0i0FvdVGvf3vVW7Hrs2Dw8sy54ZuQb9Cily8T/wuv0svvMGdw6Su
         vD2K60QXmlhPhDsQjlmGlpVtUTsRaNEZ0LHL7niegBqv8iKfSaZEujXdUPuJR8YsvS09
         FhyYBvCmkB/UbfNWLClkTxC7iBZYG7TOJcC80150CR5KHGdlZNw7YUnFOjHU7so1ITWi
         r3cw==
X-Forwarded-Encrypted: i=1; AJvYcCXVNkJ0n08NBo9wLu1krtlwuTGKD0okPHC3aLi7MLF0KDOoLcPl2SQ0d5s/OHXPp+Ro+jj10t1z1No=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKg/ZrOxQPW2+HJOpe/OqzH7pZe9cMRTOALFJI12NNAg1x2iA9
	FcUNpuzFdFrWhzqcRmngPujNZHXeDAlTIR2OnIFfPfVmskv500pOrKEBcbzr3uM6jJE=
X-Gm-Gg: ASbGncuGcEaD6R7E3fYVqiTY3sJ4H8w56YwnmSe2+2s/NQGCyPwPebClANBny+Kof+H
	ubTYz+BHyaT4BnakvQhLqlkXrnKpTvF72qjaA5cGBRZAZ46wL5RGf8SERzkYJ5RZq84V8TSVCzx
	o+3sLuVbncIIVWB1Ek969yu/Gi2DwK1F3Bkr8PTof7WlpjppKl1UGq4NKFzAv0q0Ffa+s7GBxWR
	aLFvv8P7cB5RG/rSYLRpTdwdQs2pRgtExHGtK7cc1R+5hNISp1SMa+cOIWx4LSWjQJn4ou4ZiP8
	+COrhB0EL36MPxzicFald7MjHztp760pHouJfOk4VzI709uhnFNsVFkjSWhGZ82sbi/JNZvmH53
	5OayJ96I6mEN+MjQwkCIrPwoFzL+NoZ7DwxiU3zcKw5fQEHOA/qkSy+p3aAeaGWlIS0kxzXQBzy
	PPTO21GOBb7E5EWJNEqd9iatp4N6u5bUc=
X-Google-Smtp-Source: AGHT+IGvdNJkPsXhO7mhTBAmSS24HJr1NcQFoKlHMGEeSQcfQp9VTD/G8Mg1Kg5Mqclxy+K9+gFIZw==
X-Received: by 2002:a05:600c:4e8c:b0:46e:477a:16cc with SMTP id 5b1f17b1804b1-46e477a1b4emr94534015e9.24.1759220587242;
        Tue, 30 Sep 2025 01:23:07 -0700 (PDT)
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
Subject: [PATCH v3 18/18] hw/virtio/virtio: Replace legacy cpu_physical_memory_map() call
Date: Tue, 30 Sep 2025 10:21:25 +0200
Message-ID: <20250930082126.28618-19-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930082126.28618-1-philmd@linaro.org>
References: <20250930082126.28618-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Propagate VirtIODevice::dma_as to virtqueue_undo_map_desc()
in order to replace the legacy cpu_physical_memory_unmap()
call by address_space_unmap().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/virtio/virtio.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 9a81ad912e0..1ed3aa6abab 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -31,6 +31,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-access.h"
 #include "system/dma.h"
+#include "system/memory.h"
 #include "system/runstate.h"
 #include "virtio-qmp.h"
 
@@ -1622,7 +1623,8 @@ out:
  * virtqueue_unmap_sg() can't be used).  Assumes buffers weren't written to
  * yet.
  */
-static void virtqueue_undo_map_desc(unsigned int out_num, unsigned int in_num,
+static void virtqueue_undo_map_desc(AddressSpace *as,
+                                    unsigned int out_num, unsigned int in_num,
                                     struct iovec *iov)
 {
     unsigned int i;
@@ -1630,7 +1632,7 @@ static void virtqueue_undo_map_desc(unsigned int out_num, unsigned int in_num,
     for (i = 0; i < out_num + in_num; i++) {
         int is_write = i >= out_num;
 
-        cpu_physical_memory_unmap(iov->iov_base, iov->iov_len, is_write, 0);
+        address_space_unmap(as, iov->iov_base, iov->iov_len, is_write, 0);
         iov++;
     }
 }
@@ -1832,7 +1834,7 @@ done:
     return elem;
 
 err_undo_map:
-    virtqueue_undo_map_desc(out_num, in_num, iov);
+    virtqueue_undo_map_desc(vdev->dma_as, out_num, in_num, iov);
     goto done;
 }
 
@@ -1982,7 +1984,7 @@ done:
     return elem;
 
 err_undo_map:
-    virtqueue_undo_map_desc(out_num, in_num, iov);
+    virtqueue_undo_map_desc(vdev->dma_as, out_num, in_num, iov);
     goto done;
 }
 
-- 
2.51.0


