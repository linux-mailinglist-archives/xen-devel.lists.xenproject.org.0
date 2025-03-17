Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481A1A65CB7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:34:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917753.1322659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFIT-00015s-AQ; Mon, 17 Mar 2025 18:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917753.1322659; Mon, 17 Mar 2025 18:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFIT-0000yo-4q; Mon, 17 Mar 2025 18:34:45 +0000
Received: by outflank-mailman (input) for mailman id 917753;
 Mon, 17 Mar 2025 18:34:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuFIQ-0006uj-Gt
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:34:42 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b5f8b39-035e-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 19:34:38 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-225df540edcso61414665ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:34:38 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:36 -0700 (PDT)
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
X-Inumbo-ID: 7b5f8b39-035e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742236477; x=1742841277; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PABH8iZPN9WF+wJr72ZMp6Lm7i1C+9jWBJAvssLik90=;
        b=AozXs1rjdznk9mpfZNnXgltxkDH4ByHsUKY3lbeMCtU4ed10uGUupSAPr3OIlRUGyf
         AUUUrCJZv8l8w5omvR6qcNVcCrM2uIJfZhZjTFl3ekVkNpIUZI3XmNLOhIpNitJZp5He
         EI+40vQhkyssfMRMf9bVX/R+SAzvpJlYvnPDsKv/hWM38yv3LXksvfaxhxr9+HyxHyyE
         XyJ8leZrlZYYs9PiC2PwkFBW3Ob3/oe6hheU17g0wnRuXX7vxBAuyLzZsMHRMIyZkl5Q
         /7/kjmBX4Fr9v3Eq66idP4KejoM+fd0Luh6b1t+dZR0QvX+gK4lNxVhxvMdj7oyWRD0U
         KZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236477; x=1742841277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PABH8iZPN9WF+wJr72ZMp6Lm7i1C+9jWBJAvssLik90=;
        b=XEp7/tIlL00CeEvzMXqDVkv6upBjxC1NyADhxG1CEQZ4VxC+ReqTc+Q+TF8d9cg6UV
         rVh8usoWUmIUSGcxp0MxJqy3BdPu4XwBHY1GTCvGklEiIVsa8dzI35sr+UX8/wkvtYIJ
         HwbhRy9YiHYuGxrRjXbgMfs8lix+RG0ngjdxczHtnOuKXPZ/GEB5Pu/oPYqwBoA6RzyY
         5lWVcBpF/m1nHdcCyPiacOEn75zT3I1cEP834L6kLFLYY5X3zbNjYQKuh+xcZbCFErV9
         +iJw9cTacRSXdMhGYZrGGxIFq4vJl8f4GWY3CZhlw/yseTYvemCht7mt7t42cxaE3B2R
         1deQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSEwdR4xcgOhlc3P6LGMc6JcgAY2SDyTWigVUy9E+qezJaPjG0dQY4skjWIJyOs2wpZfnzopX/Kn8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxW6ySBd5ug5SnONDNBzTwEWPP9KoSXH5g7Ez8sSI/mdxuENsw5
	FwSeLUlzjkvwGTjpFx0QZShvhHhdqT9Kopafl8qMEw0wuziZmOB8k9+GXlfDf4U=
X-Gm-Gg: ASbGncu0dq+9NKtl2rFhmgrVy03Fo5RMfmPOTFVM0n+OnhfRukhxneroQcmMBK5Q9zQ
	MF1OtRJ9nFX7kWy0uUeAYCTtNKnUk1hu1rE/tTw869/QEe5CzWjSzPORkOj38U88/unilFB5yG8
	4AP2sNGqO3HPcfVYzX1WjyPizjp/DQ467ZqHI8HASzqyAEn/1kwsFBOcoSpJ8+ljKmyd7XeHSHe
	Vb3LS2GiM57amWVEsZVhjDsI4IeifSKtQ5nT5URbyWU1kSNYqIEkahne/CvBl2jgXW06f/ZY+Fi
	DoPlJb7VFCvcRo9oVBz9mEUJwpP5I3Cp9Ro/uPgNLzl9
X-Google-Smtp-Source: AGHT+IG3g1g1/S4GhLMViIQmdttYJlPvvQDr2HFvFncsoI+sX7+pFPl4do/KG0rupNOCudw5OLu0nA==
X-Received: by 2002:a05:6a00:2d8a:b0:732:5875:eb95 with SMTP id d2e1a72fcca58-7375778c1femr704383b3a.4.1742236477316;
        Mon, 17 Mar 2025 11:34:37 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	David Hildenbrand <david@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-riscv@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Xu <peterx@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 11/18] exec/ram_addr: call xen_hvm_modified_memory only if xen is enabled
Date: Mon, 17 Mar 2025 11:34:10 -0700
Message-Id: <20250317183417.285700-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/ram_addr.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index f5d574261a3..92e8708af76 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -339,7 +339,9 @@ static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
         }
     }
 
-    xen_hvm_modified_memory(start, length);
+    if (xen_enabled()) {
+        xen_hvm_modified_memory(start, length);
+    }
 }
 
 #if !defined(_WIN32)
@@ -415,7 +417,9 @@ uint64_t cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
             }
         }
 
-        xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
+        if (xen_enabled()) {
+            xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
+        }
     } else {
         uint8_t clients = tcg_enabled() ? DIRTY_CLIENTS_ALL : DIRTY_CLIENTS_NOCODE;
 
-- 
2.39.5


