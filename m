Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08179BB3494
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 10:46:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135481.1472649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ex2-0005m3-FR; Thu, 02 Oct 2025 08:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135481.1472649; Thu, 02 Oct 2025 08:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ex2-0005fu-8p; Thu, 02 Oct 2025 08:46:12 +0000
Received: by outflank-mailman (input) for mailman id 1135481;
 Thu, 02 Oct 2025 08:46:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9sj0=4L=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v4EuP-00006C-2E
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 08:43:29 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd69c319-9f6b-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 10:43:27 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e384dfde0so7881915e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 01:43:27 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e693bd655sm26669815e9.14.2025.10.02.01.43.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 01:43:26 -0700 (PDT)
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
X-Inumbo-ID: dd69c319-9f6b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759394607; x=1759999407; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sizE8fixTdjMLNdHvH96mSdoNGp/FmemDWUp22VSw54=;
        b=iECfgEh3AzeBxuudwgLQs2r6Vhy7zA+ROH/bBhO3XwBL0/AxJL10l8d/P3ndi72ZHS
         h5PHF30B+Teeu5KFgNxj3NaiXOkTsmC8o+QoL3Y6Rm61djyBGe/XxUYiGKs3ZNU0vblK
         osksOpCb8D+BZbbXrDExtsMcTJbyBkKOk5jXdbNzx8ckLIzSMoU7YfPJ2pNhdOm9J31P
         nGvzOYLQxqJ7YsL4RQoj1kqCJ6wkq9nskLw6oJQzcyTdiP+RtSmyUGjnckKqtD8v9IEy
         WCCAnTNJSYi24sDO6efNWuZDXNb55jgWCy3tuaiJ/26Qak0okXSLdQDcIxzSFGmVpRdr
         yKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759394607; x=1759999407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sizE8fixTdjMLNdHvH96mSdoNGp/FmemDWUp22VSw54=;
        b=gFCvg2SjmeFPMfrL/TmquxyGKT2qNU7M1y5sAahmgGitX4yOjfkiRHoSenQo50vsWy
         EYoeYd/oPMnqgK7HhcUiE7cFyBVZc9xAv+1fDrNDVYTqDun58sZBEMSkDmDwbPuwVD6q
         U26sOasgKmJWMAGLoZKfLRP5mRT/9AOlLmRSYw6SjD0f4QoHzvcJsdY0FT8p//e2sRu2
         WSCmvMNW1ZqXY+qyukGPmsCbyz9adZGlmhycIl0IqnHk81f2uRB+/grnJXPIj7K3BoJ5
         rDTvhMojagSu/Pfoa/xOK/WGa+LqGWtjwmLywGE5pV1++U8kno6Bfxnr/lgPa2K+hmq7
         4qRA==
X-Forwarded-Encrypted: i=1; AJvYcCXBWO+2azKuOJ8XVQ6hfgv7UGrY5XR5rYnd3gprsuFeYyAnpMrFIpLNj59b8c9rU8ZOXxhlW/OVwoE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/Nmhc+rwQuLb5W2kWH/oPXP3qdVwnZq2pAjN2iBqpPBoEMFHm
	DnX6SBTbJd4ue9K9abkidFxqo6kbgwQww3s7luYVr67jwiQA8jIpLevvjmfCFixDpy4=
X-Gm-Gg: ASbGnctH225ANBZ2KoNIabrdHEs7B5JD0Rgw5Tg3jIOyn9sbkTH5dJnjm6Zr7RWgmZE
	nDo3R40ipo6uFG5bS27CvNhbgUSAzZAs9Oy/CEWTpaprA6RtOVsnqX8Tf/LKHbX6LlfmWUjP+gg
	u6Gz2opnt6HrrnsWt2hThxWu6p3VlJR/UR2AsKFwp6pcqc4Mz0ZGIc0uO8E0h7qBlVN8f84554S
	sAtFRMdHOdW+L0Iqdo8U9sH1bBawyGZzgMtzhpTAJNZ1czvTm9sYp+E/trkME6hibgJc7UP6TkZ
	JARNHhVc7NiTXJzMkjk8hHs5ylfSQKs/ZTyekNwXcWGsJp5lZjolNCcvJplSShSxL+RzD7pAgiu
	ybtDeF3rlLFcb6BhEpnXdG1F0atORHcsrcETSXZcAINT63tRJgc6a7Fat5rAUwRMfucmxGXN8B+
	beQsPwckeIjuNhXAqzeMAo8CIIg96fzA==
X-Google-Smtp-Source: AGHT+IF9YgQxjGmfBS/VLSZ9Yn1NV8aiLQRYv9H/Rha4by/slLu+GOg0yeUsYkmlZm+Qs2ADprJnow==
X-Received: by 2002:a05:600c:5289:b0:46e:6d5f:f59 with SMTP id 5b1f17b1804b1-46e6d5f1183mr8939815e9.4.1759394606884;
        Thu, 02 Oct 2025 01:43:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v4 17/17] hw/virtio/virtio: Replace legacy cpu_physical_memory_map() call
Date: Thu,  2 Oct 2025 10:42:02 +0200
Message-ID: <20251002084203.63899-18-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002084203.63899-1-philmd@linaro.org>
References: <20251002084203.63899-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Propagate VirtIODevice::dma_as to virtqueue_undo_map_desc()
in order to replace the legacy cpu_physical_memory_unmap()
call by address_space_unmap().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


