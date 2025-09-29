Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68100BAA572
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133210.1471423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IjS-0007DJ-0h; Mon, 29 Sep 2025 18:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133210.1471423; Mon, 29 Sep 2025 18:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IjR-00078u-PY; Mon, 29 Sep 2025 18:36:17 +0000
Received: by outflank-mailman (input) for mailman id 1133210;
 Mon, 29 Sep 2025 18:36:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BPw2=4I=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3IhZ-0001U2-7G
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:34:21 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e96d1105-9d62-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 20:34:19 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e52279279so10850945e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 11:34:19 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc6de90desm19572933f8f.47.2025.09.29.11.34.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 11:34:18 -0700 (PDT)
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
X-Inumbo-ID: e96d1105-9d62-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759170859; x=1759775659; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+R20KfaeepivX48ztS5Qk+Utu4Wf2nP4nwxC8R0e4a4=;
        b=Y9+30Hkz4HHQfdraVyqByB/w2vXuPn5+NgKp75yXarQCOItV4arzp+UljZnDb2r+wk
         uOtH/8hu/grT1nFpqIw+vFiwHI66+1xxDeIBp+BiypFmu7fl4twgnT7Be6RNDX0hfYmN
         ozT4+xQSVKySdSGZ/7GW8hE8d/qVVEM/aFXgnRDlmqZQeGw9LTrIQU1MoKlYQbXKINw9
         pehIP/lffCEoWF+8z5b7ovpOdmT73pFJXYXHpPblQxyh+dJoK2R7mHqwIhaeQSPD/doG
         PRnlOMpbtAG0puLc6U/46RgN6ueuqHt25FygtxeZKkCY3DT2Hwl+V1BACy/GZAfDDlZ+
         A98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170859; x=1759775659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+R20KfaeepivX48ztS5Qk+Utu4Wf2nP4nwxC8R0e4a4=;
        b=HBt/UqifR5AuGk3jA0Yx3dzY/w6l9sRG7niKwT3Y/39olE80Jy2rqVFV4CiW9ZOO66
         Akv120kaE8skmJYAjYe3Vzeg8t7iKfNOO72RN9kGukpc/On6YfDKv+/+HDuY2YEY2psc
         xq8grKwErZC9Rgg8rWdTa0ulN4YUItqE36gyMYQ4Yv3ftBMkqz5KUVUXOaxqOWBLddmN
         h4+1dsOGHYYPmLIMWxtrk8QBrgrcQG3vG7FzdqyyWP9ok2fy3WZsaDQz75yKWbkkoxU0
         7JcKUKcOfC20XUktUMC1RXFRul5tRl9F8LpGk0FWGXtTecXcKD0IqqboJcLGetKLJbU6
         omPg==
X-Forwarded-Encrypted: i=1; AJvYcCUM0eD5DrHj8qohU4credFtCl1j9Ohtu01W7gqv8DIyevge4puOWhzwKxo1bu2PHxkqckAELoIMqLE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3ccE60tPD6cdNenC3g2VfXA46eiqp92TM4F/8wDyRErp3Ud7Y
	E8YIlAiRlPJVzrjK4o/+P6ct4NHjkfiu2274aBFe5UZSZW8q0lMm4sGDDjuMHZ6KvRI=
X-Gm-Gg: ASbGncsbacjyyi8UPlOO2zqObZstwhMhNtJFBDL//BlwrTDVyfkS7oV9QoTFIrmz2bs
	+pxSApQ+YVYj4hH8Q6Rm429MBAiH3SnFUIj75o6KvIjkl4PfC2QvyILL1XJDe0vMv8k3UVZm1nW
	aLz9mTdB85zhiG6q0+cCziAv5r0d0iJBie1cUnD8sAQRIaAxf5b8UBMW9XAazXIBQlX7571ypNT
	Da3pmgQ/8US5p/wSgZdwDp0MiEchdvBdhRRALNN/YJrXdjav4bffnuSC0PioiJxMbcai5toyupB
	gP120Sc/o7BEWVHOQbhR3VpUB2nS92GMK3T3bgcgR2Y3b7Ds7wR5s0yOmHAyv8rM88AqchtkklG
	26Dzob9U+4yLU9OkTn+LhYukTywSFhGOOGN8+LmHy5i2TO6NfYBvqsDznkG9sBDNNu6cS4ZiB3V
	94EV0E/SY=
X-Google-Smtp-Source: AGHT+IESuOr/9kkTMP61JEo78aO/qu+Se16k4y0bZLp5zO2vT4tUYcRGwPC2KF7trcFZOrvkB6y8nA==
X-Received: by 2002:a05:600c:5491:b0:46e:345d:dfde with SMTP id 5b1f17b1804b1-46e345de049mr203777245e9.16.1759170859187;
        Mon, 29 Sep 2025 11:34:19 -0700 (PDT)
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
Subject: [PATCH 15/15] hw/virtio/virtio: Replace legacy cpu_physical_memory_map() call
Date: Mon, 29 Sep 2025 20:32:54 +0200
Message-ID: <20250929183254.85478-16-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929183254.85478-1-philmd@linaro.org>
References: <20250929183254.85478-1-philmd@linaro.org>
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


