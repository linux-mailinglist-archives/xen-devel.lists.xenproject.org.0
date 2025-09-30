Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4E4BAC065
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133902.1471968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VgS-0003lp-K6; Tue, 30 Sep 2025 08:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133902.1471968; Tue, 30 Sep 2025 08:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VgS-0003it-GT; Tue, 30 Sep 2025 08:26:04 +0000
Received: by outflank-mailman (input) for mailman id 1133902;
 Tue, 30 Sep 2025 08:26:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3VdW-0007Nn-TQ
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:23:02 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae7d968a-9dd6-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 10:23:02 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3ee13baf2e1so4389325f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:23:02 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fb21esm21742490f8f.7.2025.09.30.01.23.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Sep 2025 01:23:01 -0700 (PDT)
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
X-Inumbo-ID: ae7d968a-9dd6-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759220582; x=1759825382; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72P8ycFgSBQVWBZ3tJbVWDsHTvBRP8LSmdHVD/So9uo=;
        b=BwcWYdnAKol/338lhKXf71n0HYv/xU94CMdkDxqXQ0rueCgSfaYVxwOxa8ge8uBXQm
         BuM1JwJE95+vpAEunhQWk/5x/8HfyUYZh815h4wmMO7SyoFGvWTEgOQdrDZsXCDbJg3P
         QjRyk4iyh6j+3MpeAABeqa+xHc9XL4PLopalad6OSI9k5l/PFK99STiRK6O6fvUqTkSb
         gYAZoGFjqiKXJ8T37BH338F9ta16n+iC2HE7P6gwqmpu/ptjcRwIUwjPN4ikvwtOGziB
         mN6UXSUxgVJugZZHAecCsaU7aR4w02bEW5BS50FsoDB//u2kETXy83rhEfmS4D/zcurj
         SWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220582; x=1759825382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72P8ycFgSBQVWBZ3tJbVWDsHTvBRP8LSmdHVD/So9uo=;
        b=hMdrsqCqfM3cZ+8CPT/W9Q3TnGjdU7pflbYeQRDuampeZGIvJMXF45L5PH8W7ffBT7
         MikaCLhhs2m6uYv7YEkQHP1rCqeqL8ocD0WjCKxNY/zUf4mrxmG/kc1mHFYxg4oFbF4s
         HeYzPNlb7KDGALq/a9jUhJmluUgga0rBOlJkHNG4TbjCaNNt0KyC5tPaHdL/3elOtcRy
         NJtBqtilbSg+uRRLfPYqQWENc69U+8t7wQNKkpTn9tWN1R/hUMNjx6womBwnVgaGJUS8
         uiV+qjFJiWj5ccO2HTlgdWiEPe1ETiSSQojVWioU0/7UbvJPlCw5L2/HxKJOaUWH28ai
         VUeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXibgvEnR7Pj2N0u/5ChTHvMGPltFUhYl48o4aTbyn1SZVkQl+N29CUjOqHtoW4D9FI1GHS7OVoO5M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEChA3/AV5csHtsdg+Wxqx/fa6sj/qt+mOTRCiZ1u2AAKlurlI
	pGChnFufQNgco7OFKh10uJxFuWTvXqrcCWpdeGgnM4vWnk2BFzQMhECa4VwW7SZsntA=
X-Gm-Gg: ASbGncuvtE1mXmMQxQDqHIHukiQbqesDt+GX2h58JwAzDeu0hbZ03gxJlax03sL2IYB
	uYGmo0zwJgWcWbxDSSjnndw0udYOqsOafQXRAaucT6/iEN72VQI7l19ToDTfGQ+oXIrsgJBEWy1
	3O+ZTYiJjIAEdKylE8IWqnFa+QObzQJnY6fV4LCmm2ce7KQVt/BDZdakukIN3kTb7RzZhWP6iWK
	emm4qvnqKluRubq/D+GKZxS8cKG8k9BuTNdRpoF5FY7V8OZXeNuI62qmQf8GiJKU8stwMFw6SNY
	IUshi6g8oHPdcPIjgXp4KOq0yG4W/5SdRiAN1eqM75LeyiwkmB3KBQaUgl+U+plEjCI8VIgnbyS
	GRDqVz2DM5jQHI3vrSPMzATRILXBOOw8Lx4MHqb6FbOIHH5o/IepOzwbWILEVdcu4b/lTp5A28v
	3Q2fFIWvy/a/DILec/nxG9
X-Google-Smtp-Source: AGHT+IG0fDZU6KltrERn3higtjD7tJ2dh/0k92N8Tps8ggqNo2HbrRNaueeSukMTmfKt9k8lWLLnpA==
X-Received: by 2002:a05:6000:3101:b0:3e7:492f:72b4 with SMTP id ffacd0b85a97d-40e4be0c940mr16811180f8f.42.1759220581872;
        Tue, 30 Sep 2025 01:23:01 -0700 (PDT)
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
Subject: [PATCH v3 17/18] hw/virtio/vhost: Replace legacy cpu_physical_memory_*map() calls
Date: Tue, 30 Sep 2025 10:21:24 +0200
Message-ID: <20250930082126.28618-18-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930082126.28618-1-philmd@linaro.org>
References: <20250930082126.28618-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use VirtIODevice::dma_as address space to convert the legacy
cpu_physical_memory_[un]map() calls to address_space_[un]map().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/virtio/vhost.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 6557c58d12a..efa24aee609 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -27,6 +27,7 @@
 #include "migration/blocker.h"
 #include "migration/qemu-file-types.h"
 #include "system/dma.h"
+#include "system/memory.h"
 #include "trace.h"
 
 /* enabled until disconnected backend stabilizes */
@@ -455,7 +456,8 @@ static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
                               hwaddr *plen, bool is_write)
 {
     if (!vhost_dev_has_iommu(dev)) {
-        return cpu_physical_memory_map(addr, plen, is_write);
+        return address_space_map(dev->vdev->dma_as, addr, plen, is_write,
+                                 MEMTXATTRS_UNSPECIFIED);
     } else {
         return (void *)(uintptr_t)addr;
     }
@@ -466,7 +468,8 @@ static void vhost_memory_unmap(struct vhost_dev *dev, void *buffer,
                                hwaddr access_len)
 {
     if (!vhost_dev_has_iommu(dev)) {
-        cpu_physical_memory_unmap(buffer, len, is_write, access_len);
+        address_space_unmap(dev->vdev->dma_as, buffer, len, is_write,
+                            access_len);
     }
 }
 
-- 
2.51.0


