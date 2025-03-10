Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BC2A58C2C
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 07:43:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905956.1313430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqq-0001Qx-MY; Mon, 10 Mar 2025 06:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905956.1313430; Mon, 10 Mar 2025 06:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqq-0001Gj-Hc; Mon, 10 Mar 2025 06:43:00 +0000
Received: by outflank-mailman (input) for mailman id 905956;
 Mon, 10 Mar 2025 04:58:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fu2G=V5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trVE9-00070S-Oq
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 04:58:57 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e46147a-fd6c-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 05:58:56 +0100 (CET)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-22401f4d35aso65267385ad.2
 for <xen-devel@lists.xenproject.org>; Sun, 09 Mar 2025 21:58:56 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:58:54 -0700 (PDT)
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
X-Inumbo-ID: 5e46147a-fd6c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741582734; x=1742187534; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8ktbxqhQcYI9crAlIF4CNR4KDCM1LZDZwDTggcCVc4=;
        b=hMY5kfr9jB94ogwzcxcNPnzCgH70IP+FH9lpeDPMHnV2swPOMdIZPcWovnG7AB+6IP
         VEc+INhCm+LAPX+CXI8fiZsHdKZlOGtzR8Iz3QabtBEo7BFa9QBaIngOc1CGxGkEbQ7S
         h6g4xnMlPw+cFccOa5X/nUnOmgGU5uy4yX9u5UoV52Ybrx/Nc2zVN7LncqHqVHTrpQvY
         SHsabZQMWPW3iZE83xeGE5+TCGcn6Ymb+00v4+Ki/3CkjsgshNoRXEwak5reZtooMtRV
         sU+jNMVpIDzyMiqh9stNqJW8BiMzQgyVv7wTIWX/LxMaKNCloHz1NX33eUsIITt5h/9N
         4QGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741582734; x=1742187534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8ktbxqhQcYI9crAlIF4CNR4KDCM1LZDZwDTggcCVc4=;
        b=MmbFM+DoX0URVNs7gMGPqLKWW/Z+RgJKjtvWsYc8B7n69JfX6vPCDHv4GuYiT08y5m
         54sJ7rU3DgB5rMdlmBHyEMqcZpJH1winA9h9BFt98BrV5B0iMA8WOo4d6V9f+KVAAsBX
         3qrWQLbDQbJucEmo2i2qL8P7m8bCaLDDLjuGQph7AeJFLKbLqF/2SVjLouDxK59vq44o
         jq1l08ilip20CKYy/BN7+QEaxDcajlkT+TMfZEqvHIjqqmRoTfxnZpMaJAW7wxi7xDGC
         14I6PDVv5kNRYBlWHf9WvgwqcibrRbh73dclFg3ELGfl5Ct5p7V2JHw06zywUer8FYCB
         kDLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV79mvAewapvNaPcsR7j9aawhx0PeAsaixAM9kmmkk+FKf1jiBK+Ygte1GYhOcGmMi6F4YHKQ6Idf0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTuIYW2Bep+Dz9Kxh8wZiVmhav0k0JozsRZBDR+fvUuJhw89rh
	xxmHxacV+MDrirLAkHJ25lqhRDCvlWekHrnA/XOe6ExqacJtmFPcfcIR5vi2qcg=
X-Gm-Gg: ASbGncvv6LMQG57HLQWXXAdrbsZyfTT/gCuD4vbWEFs+U+RKcSeU7iyHEM0/joYbKmp
	S4Il3O5ejKirUUCSLdZq8Qce566BwHc6q5pvESdQby0SxunlqkbOOYao9leh9ZQtSoI6DNFukz1
	KU6cyEqxJrFGdewxL+sH9hOLVxJF2ROSd5f0p5LoWozXXC+XctZZhd72DKlk8yDXUzrFOjCw9f7
	Ew0/vZ4fPny6LlbvCV6i4qPLFWB4EvwDYglL/ItheTjaJzdfGTsdZq/qP3BiYsv+NrvaJ8wqQJB
	QXuiBtwPuHYPQE380IevQq/2KjHm0ETokzyYVQsV7o2G
X-Google-Smtp-Source: AGHT+IHkXXNzkEnz2BccPlbhHJNUY3LGOIbmL0i4gzfHTIIx3yoWhp8OGUsmgyQKBXK356JOEhoSQw==
X-Received: by 2002:a05:6a00:2493:b0:736:ab48:5b0 with SMTP id d2e1a72fcca58-736ab48061fmr14740098b3a.2.1741582734610;
        Sun, 09 Mar 2025 21:58:54 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	manos.pitsidianakis@linaro.org,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 04/16] exec/memory.h: make devend_memop target agnostic
Date: Sun,  9 Mar 2025 21:58:30 -0700
Message-Id: <20250310045842.2650784-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Will allow to make system/memory.c common later.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/memory.h | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 7c20f36a312..698179b26d2 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -3164,25 +3164,23 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
 MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
                               uint8_t c, hwaddr len, MemTxAttrs attrs);
 
-#ifdef COMPILING_PER_TARGET
 /* enum device_endian to MemOp.  */
 static inline MemOp devend_memop(enum device_endian end)
 {
     QEMU_BUILD_BUG_ON(DEVICE_HOST_ENDIAN != DEVICE_LITTLE_ENDIAN &&
                       DEVICE_HOST_ENDIAN != DEVICE_BIG_ENDIAN);
 
-#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
-    /* Swap if non-host endianness or native (target) endianness */
-    return (end == DEVICE_HOST_ENDIAN) ? 0 : MO_BSWAP;
-#else
+    if (HOST_BIG_ENDIAN != target_words_bigendian()) {
+        /* Swap if non-host endianness or native (target) endianness */
+        return (end == DEVICE_HOST_ENDIAN) ? 0 : MO_BSWAP;
+    }
+
     const int non_host_endianness =
         DEVICE_LITTLE_ENDIAN ^ DEVICE_BIG_ENDIAN ^ DEVICE_HOST_ENDIAN;
 
     /* In this case, native (target) endianness needs no swap.  */
     return (end == non_host_endianness) ? MO_BSWAP : 0;
-#endif
 }
-#endif /* COMPILING_PER_TARGET */
 
 /*
  * Inhibit technologies that require discarding of pages in RAM blocks, e.g.,
-- 
2.39.5


