Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA36A5B7C6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 05:09:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907040.1314434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvq-0004is-SA; Tue, 11 Mar 2025 04:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907040.1314434; Tue, 11 Mar 2025 04:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvq-0004S7-3T; Tue, 11 Mar 2025 04:09:30 +0000
Received: by outflank-mailman (input) for mailman id 907040;
 Tue, 11 Mar 2025 04:09:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trqvo-0003IE-F6
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 04:09:28 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 917d52d2-fe2e-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 05:09:04 +0100 (CET)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2fec13a4067so7695710a91.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 21:09:04 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:02 -0700 (PDT)
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
X-Inumbo-ID: 917d52d2-fe2e-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741666143; x=1742270943; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igRm5DauylZU7kF6A9LJbRIXn+glPoGkFsEjcODvlvM=;
        b=B3qIhjGNC6w616SHELrFG4osL6QD6fRkSAp4uap6KhjrwVsNcpLksdtsc8Rgn3kmVQ
         UpGbnVYIeDK6lOqPmOcsfkGi7riUabdoSrqo3QeF9eIL86jkQCB7+y+HVKhispF59bwA
         mNQRLWi68qRz/Q5HYWjqEXibW7RWLDpqA+XD8LvgzqiQNUHaDAXZErhP2djwmo/QJkMZ
         21ckhIDBSiHVPbeDy5787zsMJWNBjcXGzUhLQtcI1tPsvqiif+ZJUxgPMf+8E8SNyUcl
         EFLz6IzG4TrULtIZMBO653M1Z4EyZkrevmH5cd/bcH/AekD8hMuoqnGm9AtB6gqDHzt3
         7Q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741666143; x=1742270943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igRm5DauylZU7kF6A9LJbRIXn+glPoGkFsEjcODvlvM=;
        b=Y3lAQLTZR/Ng6nCr3b+PTPkJ860K5UTniCa954Kn/RaATrqQoI5hZKgwOtl24QbNUl
         wdSfmNN8qe+WKmMndcYYftk+88732O6WKbYgzflmIvf+LzCKoQMb4iU3bwwEx7UA1Y3Z
         hRW90AYXdHLilw5h1phygKkA+LQoHxBkoLuYBayMJTkZBIuN3sewxEqPVRY0tj3qfZ+j
         0uQ8mBPgwKWHXZsnEllXq6k9RVdm/o90C8iL6W99HGV9ZwMrYc4GYiWJlU+cun7YOmZY
         T+Ed2mI31m/7lDsZmdMov9eet7xFEImyL7heT0ivGhjx+PDF3CdEzUk6Zj0kqQlg5ejr
         2Qog==
X-Forwarded-Encrypted: i=1; AJvYcCWjQgXc4K0/fKjhLTr01YICLktgfqEYOICK70846TNh0x38UkfMNzRqPCqCB4wJbHWvWMsQpsYjqvs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXnXoiRTGboTtfjqyZyopUmoaSuyFxMU2pObB5MAe1X0Hdmx+A
	iUcFluoO1xhOUxqyiL9SgsNd6zrTNYHjHsvbsrGTQ5nrEDNbubeZ45qlrKxMADs=
X-Gm-Gg: ASbGnculGOI1sTF/XOJXCBPA7pmSXlgdAc4OE8/DT0gjcdiGG01c6fnyoYxqzOnyGGn
	mjhLx99dsf23WI4kfCRWgZgcTeRYtwpXAJ3jdhsRvIUSSJX30V06g2M7W2BjNHrwTkFyFm8K6AQ
	WK+iaVtG9yJWdzc4C6SGgcrySxalkhE/0KJEMjj5j75N4b5fyvStmBljhJc+GH6TmSHz7KqoGIl
	dos7C7WZ+nTobbctkJ6uPaj1hHWUb78e7NCc77v1Pt2InQ7rwnekh0BZn38O9crjr3KRXVnEhf5
	X7Ogoo5CaKljKxtYbPOgfThIRdQP7JPa5qeQpBD1TxmJ
X-Google-Smtp-Source: AGHT+IHqGisSQCK+iGHuI44FF+Puo0WshM2hC7DuGryTfuE/I3BKO7cRhsCQCZNyA9pqBEuzvyba5w==
X-Received: by 2002:a05:6a21:3a85:b0:1f3:40a9:2c36 with SMTP id adf61e73a8af0-1f58cb20502mr3303668637.10.1741666142929;
        Mon, 10 Mar 2025 21:09:02 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 05/16] exec/memory.h: make devend_memop "target defines" agnostic
Date: Mon, 10 Mar 2025 21:08:27 -0700
Message-Id: <20250311040838.3937136-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Will allow to make system/memory.c common later.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/memory.h | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index ff3a06e6ced..60c0fb6ccd4 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -3138,25 +3138,17 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
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
-    const int non_host_endianness =
-        DEVICE_LITTLE_ENDIAN ^ DEVICE_BIG_ENDIAN ^ DEVICE_HOST_ENDIAN;
-
-    /* In this case, native (target) endianness needs no swap.  */
-    return (end == non_host_endianness) ? MO_BSWAP : 0;
-#endif
+    bool big_endian = (end == DEVICE_NATIVE_ENDIAN
+                       ? target_words_bigendian()
+                       : end == DEVICE_BIG_ENDIAN);
+    return big_endian ? MO_BE : MO_LE;
 }
-#endif /* COMPILING_PER_TARGET */
 
 /*
  * Inhibit technologies that require discarding of pages in RAM blocks, e.g.,
-- 
2.39.5


