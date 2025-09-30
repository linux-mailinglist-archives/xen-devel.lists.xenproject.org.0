Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 070AFBAB503
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133501.1471637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3RmZ-0002e0-Ch; Tue, 30 Sep 2025 04:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133501.1471637; Tue, 30 Sep 2025 04:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3RmZ-0002av-2y; Tue, 30 Sep 2025 04:16:07 +0000
Received: by outflank-mailman (input) for mailman id 1133501;
 Tue, 30 Sep 2025 04:16:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Rla-0006gD-Tj
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:15:06 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0afec4bb-9db4-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 06:15:05 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-421851bca51so973983f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:15:05 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-410f2007372sm20002659f8f.16.2025.09.29.21.15.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 21:15:03 -0700 (PDT)
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
X-Inumbo-ID: 0afec4bb-9db4-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759205705; x=1759810505; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBpejQiq0e/vydo49FSQoIaJ0P/BjZpeA7dR40L/9NI=;
        b=CEWYI7sWfgToYfH3zNpYS3Y+8F0dVEJD689lzHHWBgt2kMJlxJTwUbLqrYsPrxGHzK
         gkg+ax1/tA6XFnJrERGORi1hRXLc+go8OKX70Re46URM2qEnytrYis0R2Jp2JAgmZrBf
         JHWA9P6Wzf3/9s2FePXBVirSeimC5iU2g+EVy4IiTs4+VIv1Tclt+yD2Zd/XPJbAV6EX
         ffOo6DvZ/5ftCi35Bxna7AbztCQ+aADOP6PZqWj71MTwFGdrI2wtBFeBtZh0X54hm4t3
         GjIOr22Tpdi873iuIOGvje2M1DktQhcqionkBcFtGG26EjIklp9UHFTKNrcRPXwmwngC
         C1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205705; x=1759810505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBpejQiq0e/vydo49FSQoIaJ0P/BjZpeA7dR40L/9NI=;
        b=xBdZtQXeyCPdb+uMZcFv1OrcITMnk/R1XDyTLbznGCHn7d3R9nG5PexP8D8VRzBy61
         S2KtevPQFO6qEIPkaaGVbvYb2ylJdFFevlXynIhpNYeCtQ+9itwXbDbk4/3a3ZHzYnS7
         jQsFiD8xvuhlb2VHUKqsYSnJvVlfTcvIP8MIP2KEIpI0BkpKRGGEzT5AksawCL3uGr8e
         dOUnM5eu0C4t9H8ErXiNRxbL+XEOTvyEP60ETGVogvadiMaIDWZDugwqR2ne14q5hLFz
         crYCPBwl7qrEdhC2/lKwZladfO9w+P7MXM3CyVDjXdHc0nvIADYpFTfK3rl5DSzlvkW8
         H0uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTfYy1ka5Qi3iirimemcLO5tNyUWjYR9q/s3vbnQJMa2Tw6WcSAg36dKZjptpDdqsa6KEUmRx3QFc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygKeRi79Jbl69t4q/8Fe9Vs15B1v9VtCxqy9LnDqWRNTd9HsxG
	65E7ZmnZVFiX/f8ZcZDFbm+noa17s7WBu3Q0sg8tSBXDSDkgkHYdfdzB6y6SNRVMorY=
X-Gm-Gg: ASbGnctAvYWEtrInCGO4eRKv2ep7HerPWj6WU0vs4jR1nkdbngLu8PqZbZeJXiV1cR7
	QaLqpANiM8e2B0h8zF6ncVxOf2EWdxGdXnQMntfUjhZ25v4zVY+isnXr1rFyNmU2wYxmqrdUcOL
	eT+7LJV0jFuqRnC+/CdBhU/F5yvjplFcFdbJKqPfz6hMUb33qEhg/UsZCGXY/bsxpfsW2PPvjFF
	3JpPcqO8HloQHcp8P96xZjpwCbr+zbBsIHlkFX5VYrQYVcQIQld5CckeBuefRNOD/u+o6f8rKwB
	3UeL2150xvjs44XFbUeNecbCepfa7Y9gg9JqhNpnEW6t5h8omn42Bck21TOfMmcjkv1AQE9Opwz
	b0mL4h+U3qzuSESkPmMBELNuI0mHBo9AJTYmEz5DpjqvnEFL4qw0vOpWEqP7OPjtywkhbG8ns0T
	ebsWwv6/GejLp3mb/GUTkfGt8s+rjcbrs=
X-Google-Smtp-Source: AGHT+IGgqJ0JuJ77y43D9HwYeERomJh5OkTJMDKGyPclR/IBy8JcemLZxj5L2abT5KLJLVAD5Z41ZA==
X-Received: by 2002:a05:6000:2385:b0:3da:d015:bf84 with SMTP id ffacd0b85a97d-40e481be8a9mr20254181f8f.25.1759205704783;
        Mon, 29 Sep 2025 21:15:04 -0700 (PDT)
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
Subject: [PATCH v2 16/17] hw/virtio/vhost: Replace legacy cpu_physical_memory_*map() calls
Date: Tue, 30 Sep 2025 06:13:24 +0200
Message-ID: <20250930041326.6448-17-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930041326.6448-1-philmd@linaro.org>
References: <20250930041326.6448-1-philmd@linaro.org>
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


