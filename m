Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B27BABFDB
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133830.1471893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VcE-0007ey-C8; Tue, 30 Sep 2025 08:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133830.1471893; Tue, 30 Sep 2025 08:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VcE-0007ZJ-8a; Tue, 30 Sep 2025 08:21:42 +0000
Received: by outflank-mailman (input) for mailman id 1133830;
 Tue, 30 Sep 2025 08:21:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3VcD-0007Nn-1f
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:21:41 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7da6eb91-9dd6-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 10:21:40 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3f44000626bso3412264f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:21:40 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fb1a3sm22070432f8f.10.2025.09.30.01.21.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Sep 2025 01:21:39 -0700 (PDT)
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
X-Inumbo-ID: 7da6eb91-9dd6-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759220500; x=1759825300; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6Y+9YynyQUWZr+3xZXfGIWc6Jhbj4AT6sZ58oDn40Q=;
        b=Y+cM7YYeLTxfQkqKS2tGafYM6ACeJL+5PwfoYXtJvCjlfoIMGKEdpb3xw4rI9JfvwV
         TZhmcVCz0WZmFjmEs6HN31nEu60M9XrIFy7R4qiKpbfqfXU6abVQY7iqw5OnqqyKq/21
         NiHL1x4v3rJEgbgJd1ErF0lOtTnq/3teCHJzgc23ZQUeo+ScJr8gSMUS35bfoL66L7Lx
         zlGU6s98FZtAAqNteP+H9LMFUDnSUGSDcrd7AARTQNqgce3V3VoLI3+zgrK+h2/kpQ7M
         /fmkR0OztvcIaMrEEqLNKg4XC1oj/2TXNgrq8CvAovUp/6gyrJZY2TkqEBi9aRajO+7I
         UR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220500; x=1759825300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6Y+9YynyQUWZr+3xZXfGIWc6Jhbj4AT6sZ58oDn40Q=;
        b=cfdZ5eSGtrsGd3C6KuPMN6YFp8vGDVYqlPMFCsURDrG02rT4AaYNEfeWkoiUvGi8WG
         vlt0PNlFwvWIf5S6Ls5/sBe6mi1K6FUPtRYfKB9SDNBKIbISo4DwT58VUaWDnjhj7JKY
         PYlgO5meUqUPp5F9UGm3L+kqlvcozkyec5GKReWQSWlIuPykUpJBHZ2PrDHqK6zBqPzo
         5ElwLLzFsA0wt+YiBbktKPYgIW8aorMBKZage8h6omyZXFy8/lR6clSMdQe34B3/odnX
         CXA6VoxKO24Ph/7LJV8eIg7lQRjaw2ta9taLarTHm90fNmFgeyyHFcBTBMoAXjIaWe4Y
         XBiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGW2YeVGD+EV41LobJFQbX62997gaC619aPkNjtg2ESNoHZxGtD8/xNZ2PsD+eaXg5IGaP8+hwlUM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzI8J7Y6SIWs0lZH/PLsEs7ZUqgyyfk/99OS6Ud8fChSeneB4aA
	e5JucdrWkjKDINdy5k0jg1SXhVGK1z6Ekw9ET6BEgEfjkiivBekCNwq1WbjloHdqEMo=
X-Gm-Gg: ASbGncu+8Jqs9p41sZnKrwd2S2o12XvXk7a3bOGka0fUorY/aLnIaJ9kuwq5DPQvTog
	b5AQToqbKnw37nRYvO1bAc/mqdaKeYbZnp8cDCXpJ2Zswa/LbU93PIBWNWZfN3L3rjM8Qxa9EsG
	DIwhrjElIvFMjtyxQ5DkSVy3WJNI14Q5j8WNotllAnvfxg2wxqTG1p9jofruu6TOvtsvBzsI9IV
	cxlSk9ClOq3BqpEzGMGrmBMkx58HfMSLRIn7RPxyEbGqRTU5zI5/7cnLYWvKvQzBjWgSNXQb3j8
	0iv0ZiXnKF+jIHeNmjrk2PqrzXSNn162utoIsqSZPrOOo59DEIUFunxZt8l2lVsWXYAiZ4gsgKZ
	cj9mO2Z0pq7xKO4/INKG3dugO70+LloQBUetLYzdbM8KBLqZY8pQAfhK2pKaMIkBex6tWFyLrNI
	yisFY7a+jr7we7jlRAqkxX
X-Google-Smtp-Source: AGHT+IEvqZbVxTkOzuE7/OdSy85DpVZk0C8frEdFACso26c6+h9s7puUVSPKjShsswhtViU8Ba02iA==
X-Received: by 2002:a05:6000:18a7:b0:3e9:d0a5:e436 with SMTP id ffacd0b85a97d-40e437371acmr19688375f8f.23.1759220499859;
        Tue, 30 Sep 2025 01:21:39 -0700 (PDT)
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
Subject: [PATCH v3 02/18] system/memory: Better describe @plen argument of flatview_translate()
Date: Tue, 30 Sep 2025 10:21:09 +0200
Message-ID: <20250930082126.28618-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930082126.28618-1-philmd@linaro.org>
References: <20250930082126.28618-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

flatview_translate()'s @plen argument is output-only and can be NULL.

When Xen is enabled, only update @plen_out when non-NULL.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/memory.h | 5 +++--
 system/physmem.c        | 9 +++++----
 2 files changed, 8 insertions(+), 6 deletions(-)

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
index 8a8be3a80e2..86422f294e2 100644
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
@@ -574,13 +574,14 @@ MemoryRegion *flatview_translate(FlatView *fv, hwaddr addr, hwaddr *xlat,
     AddressSpace *as = NULL;
 
     /* This can be MMIO, so setup MMIO bit. */
-    section = flatview_do_translate(fv, addr, xlat, plen, NULL,
+    section = flatview_do_translate(fv, addr, xlat, plen_out, NULL,
                                     is_write, true, &as, attrs);
     mr = section.mr;
 
-    if (xen_enabled() && memory_access_is_direct(mr, is_write, attrs)) {
+    if (xen_enabled() && plen_out && memory_access_is_direct(mr, is_write,
+                                                             attrs)) {
         hwaddr page = ((addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE) - addr;
-        *plen = MIN(page, *plen);
+        *plen_out = MIN(page, *plen_out);
     }
 
     return mr;
-- 
2.51.0


