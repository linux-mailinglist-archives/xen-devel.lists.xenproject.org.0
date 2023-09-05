Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD35F792286
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 14:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595656.929273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdV4F-0002PG-Md; Tue, 05 Sep 2023 12:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595656.929273; Tue, 05 Sep 2023 12:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdV4F-0002N7-IT; Tue, 05 Sep 2023 12:22:03 +0000
Received: by outflank-mailman (input) for mailman id 595656;
 Tue, 05 Sep 2023 12:22:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddRg=EV=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qdV4E-0002LV-97
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 12:22:02 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d026ab34-4be6-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 14:22:00 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31c3726cc45so2171385f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Sep 2023 05:22:00 -0700 (PDT)
Received: from localhost.localdomain ([37.69.27.38])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c294900b003feff926fc5sm16775933wmd.17.2023.09.05.05.21.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Sep 2023 05:21:59 -0700 (PDT)
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
X-Inumbo-ID: d026ab34-4be6-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693916520; x=1694521320; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sB86fzFOmVDgMvea5i3OluWg93+WlVCOeLM0GI/SSvo=;
        b=CFSys+oEQ1mwFgJd9akO2EGuY4ZT651m0Qx6NOmtc1Hcnpz2p1IuFxWNkK2mLZmDo8
         Q7SMn4UIXPbILk6yNA05CDAMaw5TShzBY3UF3qUbDP1RJpHS9iWTH3+2fnZmFdoqHUJS
         SHXqiJzxMz0mBZ5PgsZeyNLb+SHXSvGpf790BizG/sbcKcxOuPmYUhjc7Xsfuc6sHuf2
         1XiYzKCBNHd0okpWfPCwkdddGK2BquRdjFKrfJ4ZgXoCtVFpd+WdEKE/DmhIGPdxNPbV
         /BuAkdxDXjD7tEE/FX5xWi+eApmWz5Eu/EKYzz0Iv13BtD0OWaunFPldw7Wc7WiB1PhB
         Ohqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693916520; x=1694521320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sB86fzFOmVDgMvea5i3OluWg93+WlVCOeLM0GI/SSvo=;
        b=gPWjyHgy5uBnNw08EQL05E4HVwaf86N7pioQ/GmMpzjduS0tpkRc7bRMVls8LE7WY0
         BwXxac/7vaM/oO8p5f5XgCkZs/4ODU2u5GKD9bsWJfUOlRNNTZSsIiekWssHe/FOntML
         Potd0WQLjWj109VSAY0cT1CCiD5SWM52U/xMU96aXBhSzgxUEG5XG9DLBl4ogShrHnv1
         tOdBKHKzkd9v7VDwerXrrRsuLkh4UnMVwIq28iEJBTdkFlAE2oLXPPFe1h/jTXcUiSNA
         5AqmEJ3AW8/4nbycPCjQ0FFnsi5Kdys4AdUBIVgUw9GXo3ipxgiWT7vvz+GjWIEYaquM
         HS/Q==
X-Gm-Message-State: AOJu0YzvMwqld4inTSc2/Ju4SS2X8Oju9Zau2LcxbqIVeiiZf0ltryE6
	6js8LIx6noCsno4zWKePEGUSUg==
X-Google-Smtp-Source: AGHT+IGMv++IXwOb16f2+PfK5YVZCa7H80s2i/rxCKRU0mJ1BiJzgJBBclvgdAZjwKfes8Lh0/ctrQ==
X-Received: by 2002:a5d:5510:0:b0:319:6fff:f2c1 with SMTP id b16-20020a5d5510000000b003196ffff2c1mr8841138wrv.38.1693916519881;
        Tue, 05 Sep 2023 05:21:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH 3/3] sysemu/xen: Allow elision of xen_hvm_modified_memory()
Date: Tue,  5 Sep 2023 14:21:42 +0200
Message-ID: <20230905122142.5939-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905122142.5939-1-philmd@linaro.org>
References: <20230905122142.5939-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Call xen_enabled() before xen_hvm_modified_memory() to let
the compiler elide its call.

Have xen_enabled() return a boolean to match its declaration
in the CONFIG_XEN_IS_POSSIBLE case.

Suggested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/ram_addr.h |  8 ++++++--
 include/sysemu/xen.h    | 15 ++-------------
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 9f2e3893f5..66e849ac4e 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -330,7 +330,9 @@ static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
         }
     }
 
-    xen_hvm_modified_memory(start, length);
+    if (xen_enabled()) {
+        xen_hvm_modified_memory(start, length);
+    }
 }
 
 #if !defined(_WIN32)
@@ -406,7 +408,9 @@ uint64_t cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
             }
         }
 
-        xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
+        if (xen_enabled()) {
+            xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
+        }
     } else {
         uint8_t clients = tcg_enabled() ? DIRTY_CLIENTS_ALL : DIRTY_CLIENTS_NOCODE;
 
diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
index 1f797a9abe..d84a5f3551 100644
--- a/include/sysemu/xen.h
+++ b/include/sysemu/xen.h
@@ -21,24 +21,13 @@
 #endif
 
 #ifdef CONFIG_XEN_IS_POSSIBLE
-
 extern bool xen_allowed;
-
 #define xen_enabled()           (xen_allowed)
-
-void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
-
 #else /* !CONFIG_XEN_IS_POSSIBLE */
-
-#define xen_enabled() 0
-
-static inline void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
-{
-    /* nothing */
-}
-
+#define xen_enabled()           false
 #endif /* CONFIG_XEN_IS_POSSIBLE */
 
+void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
                    struct MemoryRegion *mr, Error **errp);
 
-- 
2.41.0


