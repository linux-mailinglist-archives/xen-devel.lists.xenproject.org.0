Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0D0BB348E
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 10:46:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135476.1472636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ex1-0005P9-5D; Thu, 02 Oct 2025 08:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135476.1472636; Thu, 02 Oct 2025 08:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ex0-0005J3-TJ; Thu, 02 Oct 2025 08:46:10 +0000
Received: by outflank-mailman (input) for mailman id 1135476;
 Thu, 02 Oct 2025 08:46:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9sj0=4L=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v4EuJ-000821-6p
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 08:43:23 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da9abe38-9f6b-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 10:43:22 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3ee12a63af1so427231f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 01:43:22 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e5c3eca22sm54562995e9.4.2025.10.02.01.43.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 01:43:21 -0700 (PDT)
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
X-Inumbo-ID: da9abe38-9f6b-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759394602; x=1759999402; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9bjNs8nbmPHtqp1O3nLNnIUYP6MFEbM89LgRhzC8Oo=;
        b=ILJSkoAsGlVVd3mE8qpsb4hz0g4nNw+IgrD4AqC3+KbcJawhFMx2C5SkAdOHwYGx9w
         YfWZuenPxPQ38WS90gODtjh+rybtDKuhNg2cTjQ3GG/SUHgB5u1PDSmiVlNWIB7URuIk
         ZXdIvAD1hR78Ij7g3hrUBizJ8hbLHja1ASxF8SznI4PnS8qF9rZDq2vyCBoejgQvwq2S
         HG0PQBROJHPd0JgaJw2az5xeYx2bBy4X3MRRDSMRhXiekdWBGQaJFKSyC8JRywZDuh34
         BmKWVz/YPqlvyslzVIuiNhqtMQw2nytWSiOzmFxLuvyOJZXnJ14f5b4lMJfYctA1RJPh
         tk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759394602; x=1759999402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9bjNs8nbmPHtqp1O3nLNnIUYP6MFEbM89LgRhzC8Oo=;
        b=aYzkHgSr8QnpKygbjJQqn6fi8QwlB2HP5Soscxy00vjuXvjtvjwdU0R6sYDi4DS7V8
         0EanXkRV1v5mTR+y5Ph5W1O/9KdHQ15BdPNvgt0W6IWvSLjjYWbQ3d9+/h3TbCpbwBhg
         hZ6bLMN+WBm5hzi6o4rBP4+2SCsNCQBzy0ZEkarlPu8efro1ky/RvRoKB/HkvsJbdWkv
         AJLEHQBIJV7OEUodyviFVSIUqX7LOhS2VjtUtOhkNmEDTsJ9+fzvCejHVm77Bm0c+w+B
         8dm3DdoC/xutqjdOAKcUt4iwwZ2IZC9Eb5xwxO5asdoZc9ukluC7tBjh8XDMfxgIpt4v
         XGEA==
X-Forwarded-Encrypted: i=1; AJvYcCUmUBm3ySChWojsQWFg2+TFlCAcFuZ3M7ZIAjQLBIZifTSDLcw+6FPoIIzoSwDaTWpevDGHebuy1VE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSicjuhyPG05JhDZVLqhh0nPoMIQrtAHu3C7fNPZmdcezst88D
	X9DWfVeLuxoP+0jOBnMrOUrSHaZsgsHQV/jmVUf8bDp1BevhYCQ6SFPjtdC8mR62bHLjMwLOq8D
	abnt4isq0Qg==
X-Gm-Gg: ASbGncuvhjIpeYHu8FYvPsCAmjhHUYoFmHfpWMNmC4wkitRNO/Vuk5x5mIqTuQ+tO+h
	VA9IYsUEszVjqkIICWvuDTyKaigit2HEAToU0yNlGi2nWBtNw5PAjRHPnerPb1tc7DV/m9LEwE/
	uXyJTGsNGei7eU8+TApGaOm3MCunVQc9s7RMqQSemxojOqt1ivQqctbXFHB8D0pXpaAlvz8ZY0S
	SG7q6TiA1+WdaKDIgxYTepvZoKYVJipXDrIJRckbnDiTp4bqRqvKh2KoU9UFRl5yuV8LadFgYvz
	JgQxWbYc/NblGLplOygRg6C26s34W2ALoJ5WJEsVHGCZXgxZQiJyStqbHIzCk0dXY9rzE8jp2xT
	9G9qCFk+bhaEOTzjgHwsCvuWPUdktayP5mkYWoUR6P1ur5IRWpllUvz1tPdrRC22afrqR3DxjVB
	2YbUTbgxpW+064xURAEN7bIUIYNEjbBw==
X-Google-Smtp-Source: AGHT+IGyb5rK3wU2eYffbepInpQ5nRpyDFkLvUQpXIwaKbJPhsQ9zk9+/o3WwrGqdXtMXrkY9srT5g==
X-Received: by 2002:a05:6000:40cc:b0:3fd:eb15:77a with SMTP id ffacd0b85a97d-425577ee891mr3832972f8f.6.1759394602152;
        Thu, 02 Oct 2025 01:43:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v4 16/17] hw/virtio/vhost: Replace legacy cpu_physical_memory_*map() calls
Date: Thu,  2 Oct 2025 10:42:01 +0200
Message-ID: <20251002084203.63899-17-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002084203.63899-1-philmd@linaro.org>
References: <20251002084203.63899-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use VirtIODevice::dma_as address space to convert the legacy
cpu_physical_memory_[un]map() calls to address_space_[un]map().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


