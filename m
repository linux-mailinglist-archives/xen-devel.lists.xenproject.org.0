Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 524F9BAB514
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133511.1471684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rme-0003mF-7v; Tue, 30 Sep 2025 04:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133511.1471684; Tue, 30 Sep 2025 04:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rmd-0003ds-QG; Tue, 30 Sep 2025 04:16:11 +0000
Received: by outflank-mailman (input) for mailman id 1133511;
 Tue, 30 Sep 2025 04:16:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Rlf-0006tq-2Q
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:15:11 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e420c34-9db4-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 06:15:10 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46e4473d7f6so23421625e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:15:10 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e56f3dcacsm39499115e9.2.2025.09.29.21.15.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 21:15:09 -0700 (PDT)
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
X-Inumbo-ID: 0e420c34-9db4-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759205710; x=1759810510; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+R20KfaeepivX48ztS5Qk+Utu4Wf2nP4nwxC8R0e4a4=;
        b=Xv/gr6yTwLqgOvpmNTYhf6c5qNvdYAuPM3joeK0qrz+7BS224EumNMIVaA643XzCVO
         GG46/6S1kESHKDT1E0fhOvboy4rQHgqNGw755pOwG+TGdIsejYMlNjqiIT7aiSKDOSc2
         9RMm9j32JEAqryvE/lvQaDyY+Xh0x6HjJFbniZky2lp69f6BgjrN3uMfu9Mj6zI8ecRe
         2lTBjGO6JdJY3sWqUvJERdlhTt5rZ3hPRPvKTyQrNxAwfAtXTkW5oAl3SIoZ/yXadWEh
         Z0fqPBaPKE1+T8nky1I1IIYhzDIq1NDpPEXfZgwCWbz4X6ViuW3B44xTBw+bPtu32kc/
         v0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205710; x=1759810510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+R20KfaeepivX48ztS5Qk+Utu4Wf2nP4nwxC8R0e4a4=;
        b=ozE65R/mE/tyyDZZUxN2pPhZpejUoB1rth+g58cEEHzmCSbkKexI/K1ihohX0DK7eC
         1vJW05jkOBmkBpm5j5EFfvLsi/DT/BbMVwor5p/u3zSD4yM9p/SmfUcV06P429HXbpAo
         m7PJ4WCD35JH8ochyDSsb/QoiTtEYuKAYUbBxsNm9/BH/KBYYKbxAtvoL3OyImOvOgfN
         CELN99pTiImD+NnkeDRXoV8yPkqd0fCzZdJwxVS9YuQObBQndJzu9IB1rRUbsJ2gD++P
         A8Dh+iXP5WsM0ZaOh8JVsOqrHI2IENDtP/psZGbgfaUjwR4YIRuLSLccA5YEdrgqwt+3
         E6vQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4IoVIq+6Ku+NUyX1iiDfma29y//JHLavP9hmyxJIvU7hVTZw2fbIcAPn81ENjyntm9KHt+ciMx68=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtNOMod29coQopMbQBAOOcGvRP2RfUa8e3xMSNVGqsa4Kg6gCk
	/+QSh0k05U5tWwCrjw+cb9n1MO99MAD2y8mxJznOShhXeotbw7+gDHvJMLNU17VXs38=
X-Gm-Gg: ASbGncvAbAn3iQ0r/9CEYAgC7ag5vTqJlTtJKvSvi7EJ7QGFpFVW9EcTaRzI8TLLW51
	6BSwQDGheksLvDnM+R7VvaLdFjGtUhmGCZ5BHoGegiY/bf/8dcSRLcokHVq4u17XHfcakLjkaCR
	f4T6CXZdaTajBuPPmSBPtvgqSnJg6IMRNq4FO50nKceSW3IFai8f+3X7P1PGi9MrvCigA42hkcR
	Y/VMRtz9NcrwXcHzPq+GxRp63SFGODRvqKqU+Ty1v5chtkPQC7+iZ6EZXULBmWPtVPWt6gZtXel
	zYcx9Q1GIqO/Oen+8kCaWYaE+h1I62EOBLCM+AI0rC5YL/rG/I+g4pLLflphNkxs0DFT72b91Ed
	oisw0AdQEmjj5Vpaaxvxqmjo7mil9+3NJm8QZ10D7jZP74Ld0pzOQN7NwfbfRBIGzRuBB0SKZDg
	KmFxElVHWKdJkbK8YnXD2aTRVOFJQYsQY=
X-Google-Smtp-Source: AGHT+IEUJE1IYP/kfT6NPYb+xEkszrcjL4tSyyPjenIF9G8p6iMdA3UofkAUQEEOCpstatyYsaodDw==
X-Received: by 2002:a05:600c:5290:b0:46e:394b:4991 with SMTP id 5b1f17b1804b1-46e394b4b1emr152224145e9.11.1759205710145;
        Mon, 29 Sep 2025 21:15:10 -0700 (PDT)
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
Subject: [PATCH v2 17/17] hw/virtio/virtio: Replace legacy cpu_physical_memory_map() call
Date: Tue, 30 Sep 2025 06:13:25 +0200
Message-ID: <20250930041326.6448-18-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930041326.6448-1-philmd@linaro.org>
References: <20250930041326.6448-1-philmd@linaro.org>
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


