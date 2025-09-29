Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3141BAA560
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:36:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133176.1471363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IjF-00059Z-2b; Mon, 29 Sep 2025 18:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133176.1471363; Mon, 29 Sep 2025 18:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IjE-00054c-Tl; Mon, 29 Sep 2025 18:36:04 +0000
Received: by outflank-mailman (input) for mailman id 1133176;
 Mon, 29 Sep 2025 18:36:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BPw2=4I=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3IhU-0000iD-Ck
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:34:16 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e62002a6-9d62-11f0-9809-7dc792cee155;
 Mon, 29 Sep 2025 20:34:14 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3ee1381b835so4178802f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 11:34:14 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2a7c8531sm237281965e9.0.2025.09.29.11.34.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 11:34:13 -0700 (PDT)
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
X-Inumbo-ID: e62002a6-9d62-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759170854; x=1759775654; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBpejQiq0e/vydo49FSQoIaJ0P/BjZpeA7dR40L/9NI=;
        b=BliYw8ObxLx0c2q/rLWRW/7rj/rwztZlcklyFoN5poh9KkHSmpLhlQtuvdVdg/9Fru
         wdXAAKD5LEr84Y+U8jlGNoPUaSVesTvfgB2mED8CpmHX7zMl6tIjEUPDmEc0wwbtiung
         lNts7nCgL/PNjEnMygd/6hvlHimwsX+5/6XepUIo0JWGDj0kDXGRAEzDPf5sPU9weGXk
         JfYbO4mcuDoIYQLPIPSjpwaf/amNKGwmpWwl2352veYY01CPevanVjYdrDAoEVaC294K
         DJwZeymUgIIIyAjOfN+ChrCCYy8vKfp30BC8wHTGGIRwAgQklQXOoNbWW7jlogoo8+a8
         Bjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170854; x=1759775654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBpejQiq0e/vydo49FSQoIaJ0P/BjZpeA7dR40L/9NI=;
        b=nLlghcP4GXq9wyDS5oNMpkfMJSteDpBuxPbWhoq+ORGfOzziVfwR/wc9wvZRKiSGgF
         4QWocVs431IWYSqlfj6QcwDbXeeZvU2vTequuTsVsGbJ24nRa0QCOuV+IIxt72Bnf6px
         dj4EMaCQTSlV7oCRMINOALso1QM+duUAlJXcUqtc0n4S6MA2ef5U48WOgS8Fzo356Vbe
         PQktNcpIjqI9izHTu6gct9i7fyEOIV1EtcFVRTaxmg1IcGqN5mTKpMjey4H/C28ojr6D
         FaerTMt2izDWvLKUEYWzbioFMCCnoYAPlxvoXSToYAQFNDKENdtTgnferfmi3esaA9eZ
         JSjw==
X-Forwarded-Encrypted: i=1; AJvYcCXxkQrXI9fpn+CdzqVDCQq526Ut+lLBpGFS1CQ6fQ+b/WV1p4DEElbWHSmFUob+Hw8JmoX4sVUMzGM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJqDiwGrPPWSxn2Gb0rGP5ACbbWOG6qo9LAA23fMueOi3Fe8WG
	6laUtis7z7EYZQ0QnR+GXMCnoLezrwJ4pg/2fTLU551A0V/IN7ikxbxZ3dVhcg+BpUQ=
X-Gm-Gg: ASbGnctv7vpJZs0R78gVEvqSno2uKxMA9TqCsa5S6Gs38ifR04Rln2Wcwl4mUOTXjn9
	QWjAYaquJHbG6vMZxF0XCshCZbUXsc1E1eMOz/AxtIWQFrszk9nVEO4WAKMdzm0qTYTzvN3DQIS
	GQQmzMDDi1qsrJnJNWOVIe3e1IAJAluPdJA2f/lYtEZKVqwywIr9wDch+/0oT15VfvzGBymGwzz
	JZmokCGXtY2CGbv41KccjnQd+1PK7Jb8i4+p89h72TeI7UoB5tFN1PjUrAoL/MwISxBLpgLgljd
	8gThzzmVy2PhBggBr6jb/C1F/K40Dj60Alke4zqwBkGBHpJieuLI/9jxEujF00EVwMsIicpvPEu
	CwABIRNde3nOzyhxno0hGVtGME+Duw/yZlBSi/BQz3VWNt0LzHL6LjY8Jfeq+GjaS0cS238WSFx
	Eo/gm7GRE=
X-Google-Smtp-Source: AGHT+IGDdDVnNCTQHNmf7VOOiV8zymTG0ZaCom+HQXr9Sc1CkJ/8s/f399s7GfQrqulF9pKPADkmMg==
X-Received: by 2002:a05:6000:22c5:b0:3ec:d78d:8fde with SMTP id ffacd0b85a97d-40e4ce4bademr17302303f8f.44.1759170853668;
        Mon, 29 Sep 2025 11:34:13 -0700 (PDT)
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
Subject: [PATCH 14/15] hw/virtio/vhost: Replace legacy cpu_physical_memory_*map() calls
Date: Mon, 29 Sep 2025 20:32:53 +0200
Message-ID: <20250929183254.85478-15-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929183254.85478-1-philmd@linaro.org>
References: <20250929183254.85478-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use VirtIODevice::dma_as address space to convert the legacy
cpu_physical_memory_[un]map() calls to address_space_[un]map().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/virtio/vhost.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 6557c58d12a..890d2bac585 100644
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
+        return address_space_map(vdev->dma_as, addr, plen, is_write,
+                                 MEMTXATTRS_UNSPECIFIED);
     } else {
         return (void *)(uintptr_t)addr;
     }
@@ -466,7 +468,7 @@ static void vhost_memory_unmap(struct vhost_dev *dev, void *buffer,
                                hwaddr access_len)
 {
     if (!vhost_dev_has_iommu(dev)) {
-        cpu_physical_memory_unmap(buffer, len, is_write, access_len);
+        address_space_unmap(vdev->dma_as, buffer, len, is_write, access_len);
     }
 }
 
-- 
2.51.0


