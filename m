Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CE0BAB4B0
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:14:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133434.1471561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3RkF-0007C4-Jy; Tue, 30 Sep 2025 04:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133434.1471561; Tue, 30 Sep 2025 04:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3RkF-0007AV-GE; Tue, 30 Sep 2025 04:13:43 +0000
Received: by outflank-mailman (input) for mailman id 1133434;
 Tue, 30 Sep 2025 04:13:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3RkD-0006tq-W8
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:13:41 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9164c8e-9db3-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 06:13:41 +0200 (CEST)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso34332435e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:13:41 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e56f3dbcfsm38006405e9.3.2025.09.29.21.13.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 21:13:39 -0700 (PDT)
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
X-Inumbo-ID: d9164c8e-9db3-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759205621; x=1759810421; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJyVnOWNCddCGl/+ypfUNoAsZWxoJ+Iw1ZeRnG+UY2M=;
        b=ACXfFaboSEXrvFZAkO+AUOw52QTW3XvN0agAckRm4Lt4kX6TxN4ZE/Hp6vmLTW32ur
         hWaQbQuxIZ7TFkOlfHAXdzlAKf5sma9x3dkdUaqvtOkSP6eqenxJmDiF0lUrCtDaS5Yi
         EJM4k6IEJNnxLpWhlQ+mA2DPZYIj1erKD84AbmTS9x2EFnIjkI+vpanfLF+P+pnPKdKp
         /J7hwuPCMd8+83DiS9Jq1cfkPJB87oH6+Pf2m7eduiYOJwziRdSQOgN8sYJ9KNUyZ79y
         B7arW6OC5zYANZq0ygvXoKl4tB6QHJDwMnZ8DcV7LRlX7urNeMaOKw6zl3/xQdYiIaZI
         cL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205621; x=1759810421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJyVnOWNCddCGl/+ypfUNoAsZWxoJ+Iw1ZeRnG+UY2M=;
        b=THN2Wz+l2fDwVvyHmla3zZF1mN9tz6aphs9hGtT2kllgXnXIXlsHrdqs7m0aKPXG/4
         ofSvPyKJJ6PFJZT/YFdSC50lOjYNfBLHz4Da7foWSPJE2vFaO9esSEUq9g7jvkCHyiQk
         u5CN7ysSbMSiOdsyxnSz6vFlPIc3XanwJsD050tAZgS7j4BQS81porIMUEXRVSx/h6Ov
         sHIj4tqs9AFDUADsGXIcwq+UfzTMbsQ0GO4btBzsHzKFdo6zZUOPq5cJwTx4+NKRWwtH
         pVOV7I+ygO4tTywrp0v/kb2NcD1hSa5FA3U/sjcfZ+0MLXG9X1RddNWhvvvqgQ4ZhyKP
         QAvg==
X-Forwarded-Encrypted: i=1; AJvYcCUBSE2MQOh7Y0PYIX9N52wCF9+KYohl1cY/SupqrEl2kPKsoCbRj15EdreUswWDAewXFgmdR+ir/Sk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKftsxll2uZZWJ72fNTEK2X3hWrkhy/rWCjN6ECVQTJNQzAXON
	AS1ZYdDzs/3UKCUIF3b6R/xEHPtdk/dbrOPiHbhsy+AT3MP4wK+vAJ+5LvEEBUTCOxQ=
X-Gm-Gg: ASbGncvb2vwDVDritsdLrBJE+N8uzWKTOyn6sN6nOMplrLZ+CWPzDa0OzJC91hDV/AY
	5w8MWgqTSDL7F8yWcKMga3f49WNgfPpZHwVknZenH3UTEu0D93GSKDanPtTtBGfJE1laGYOyMH8
	0K851Jg6ol04XbJKmPudLbMVBcMDgE0ACLo6NeA0WJahwaB7aUrbdUNEViEISh2aBjO5rLGaMD7
	YaNSzVFBPlhAacNXz4Vw53Zua6ZgQWZWAd/rQY8sxDypg6MHc3KGDE80D3uC5R0HRYOYDLHpapt
	I559l5pO0rAugmotW7X3pvPeG25VD+9YIJNRKJYq/AQD3g86tONfnOyXB1ZpPdildwgLW0yUxLl
	sqHTAgu8ef72S89zuwLTLnsDwVfBxYd9TPtYx3+i/W3miQs5umTkCWVGNeFIjo7Q7fkIaQ4tjYX
	nNSpMo85HroXBd4Y7iJzR0
X-Google-Smtp-Source: AGHT+IEBLGmPjHaV6MityTIXBSpNltcXVYjuhb00aWpIbO25PxYLKS/w9T+ltaJf/K1UbWKlm67UDQ==
X-Received: by 2002:a05:600c:4ec6:b0:46c:7097:6363 with SMTP id 5b1f17b1804b1-46e329b441cmr166612445e9.13.1759205620914;
        Mon, 29 Sep 2025 21:13:40 -0700 (PDT)
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
Subject: [PATCH v2 02/17] system/memory: Better describe @plen argument of flatview_translate()
Date: Tue, 30 Sep 2025 06:13:10 +0200
Message-ID: <20250930041326.6448-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930041326.6448-1-philmd@linaro.org>
References: <20250930041326.6448-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

flatview_translate()'s @plen argument is output-only and can be NULL.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/memory.h | 5 +++--
 system/physmem.c        | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/system/memory.h b/include/system/memory.h
index aa85fc27a10..3e5bf3ef05e 100644
--- a/include/system/memory.h
+++ b/include/system/memory.h
@@ -2992,13 +2992,14 @@ IOMMUTLBEntry address_space_get_iotlb_entry(AddressSpace *as, hwaddr addr,
  * @addr: address within that address space
  * @xlat: pointer to address within the returned memory region section's
  * #MemoryRegion.
- * @len: pointer to length
+ * @plen_out: pointer to valid read/write length of the translated address.
+ *            It can be @NULL when we don't care about it.
  * @is_write: indicates the transfer direction
  * @attrs: memory attributes
  */
 MemoryRegion *flatview_translate(FlatView *fv,
                                  hwaddr addr, hwaddr *xlat,
-                                 hwaddr *len, bool is_write,
+                                 hwaddr *plen_out, bool is_write,
                                  MemTxAttrs attrs);
 
 static inline MemoryRegion *address_space_translate(AddressSpace *as,
diff --git a/system/physmem.c b/system/physmem.c
index 8a8be3a80e2..2d1697fce4c 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -566,7 +566,7 @@ iotlb_fail:
 
 /* Called from RCU critical section */
 MemoryRegion *flatview_translate(FlatView *fv, hwaddr addr, hwaddr *xlat,
-                                 hwaddr *plen, bool is_write,
+                                 hwaddr *plen_out, bool is_write,
                                  MemTxAttrs attrs)
 {
     MemoryRegion *mr;
@@ -574,13 +574,13 @@ MemoryRegion *flatview_translate(FlatView *fv, hwaddr addr, hwaddr *xlat,
     AddressSpace *as = NULL;
 
     /* This can be MMIO, so setup MMIO bit. */
-    section = flatview_do_translate(fv, addr, xlat, plen, NULL,
+    section = flatview_do_translate(fv, addr, xlat, plen_out, NULL,
                                     is_write, true, &as, attrs);
     mr = section.mr;
 
     if (xen_enabled() && memory_access_is_direct(mr, is_write, attrs)) {
         hwaddr page = ((addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE) - addr;
-        *plen = MIN(page, *plen);
+        *plen_out = MIN(page, *plen_out);
     }
 
     return mr;
-- 
2.51.0


