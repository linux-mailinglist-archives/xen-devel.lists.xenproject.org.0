Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C91E1A65CAF
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:34:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917739.1322581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFII-0007Fk-Hq; Mon, 17 Mar 2025 18:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917739.1322581; Mon, 17 Mar 2025 18:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFII-0007Dw-CG; Mon, 17 Mar 2025 18:34:34 +0000
Received: by outflank-mailman (input) for mailman id 917739;
 Mon, 17 Mar 2025 18:34:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuFIG-0006VW-Hq
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:34:32 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77490491-035e-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 19:34:32 +0100 (CET)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-225fbdfc17dso32762495ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:34:32 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:30 -0700 (PDT)
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
X-Inumbo-ID: 77490491-035e-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742236470; x=1742841270; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wT5ohu0Ui7xrH+jgYqMJMpKemGPcZNvy7jzdyuAyzEs=;
        b=aelFy+ihIfqbeG6i6oFawfIrjTkHKz6ILXxMq3n0Y23AFH5yCvASuvxdo9iAEO7OAA
         sSJjrVZp73G7ONRghDcco5Q32seTEASxfUv17SfH6RzIhGhfLcnt2BKcQllk9a56Cipm
         lkQhcKZisVcj1pXVHABAops2r50M16uXFqExhw5OG63mLhbXWNcBEKm2undaGWC7RzmA
         g3vEpSZirqsKhEwxnu1nWo0kvRRRTU3zZhyemtUpA8Zs1fNMRjCmhexY7TQUKttLpSvk
         j63vhh6vzfJKUyrtPk5eKDN9fVy8kL3Vr9bG2gfa9wHjmvk0YB3Zj7n+JV2iAAFHAPYn
         vx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236470; x=1742841270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wT5ohu0Ui7xrH+jgYqMJMpKemGPcZNvy7jzdyuAyzEs=;
        b=sUm8MgpnG/lYfmWKb1JaL5odxBj/nMhkwRweYRusiNt4kEp1cmmYuo9Am5iZdqmo6E
         B10C/eM34eMyYO1AN/HSI9mTHmXWh1iWMrR88h9cSoKsGX+FXszekGvKkB32TKVAt8Ld
         qUQgEN5SeSyayYRVaAmhzZpLz5DxtyWTdTrmhB/EKLjjYwp83o2mOVoMot0kyBI6mhEw
         XfsoD5aQSQS492srhYiIp8XKw3DSdNxeqcH7WKfsNP3bpeMoit5P3hzGHgTPI29ACZKT
         c3iewI7ogSpY5M4MLuXAMS5rJPcA+a0wEBPuJOMQkVs3q3vYyn97ZMhGx6yS9QGsKiRT
         Zx7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSBhedPHfTnudSjeYy9Z8cffFuY9te792cYE0Et6QHbT5rOzfhUfTQcagpbF1n8+LWsQmY2dDuFEA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyh5M+y9Hi9yJIL8TeDgvxVvkbPs2DCS/P0JDTEeticqxwJnuwV
	SkTndlx6kG+RESd3ZQTz7OgbtpGhd5kjrJn90mLhZDB7GegafHdgqSpP9Bbywkk=
X-Gm-Gg: ASbGncvQ6z3YCxuHTA8fpEtyI+KovP+g8xfmleDMnxMbDRZqcOVxUYkt7pZTGIyeo99
	hL2dS9sfbQtnS25wqB4pUl/lu1FfBIRPfNUzR5BxUZf+5gRyGxyrbKrzm8HsRYC48m67+EmPJJ1
	o30H7tOwchgjr8gkb4WkQSPqzEcoxU+p3sDxLn9BfSo/nE7plo/Klzn833jnlsA5uTtoCapGTSC
	JpMiDFVzuBLQ+rsRoUixNpmqNNiQncW52ejoGa22/cYF0mxaz9oJpVTeR9BG9YpimjEXeOz9IGs
	9WrTFYomxSg+8ivlr/SBigmuYVGStOqy6EUuZ/Xm6y5L
X-Google-Smtp-Source: AGHT+IHwzlIJ6LxZBvPsjg5l1kKbXhEFWIu9N9qHSrE9Y+TBbc5aw9FWPh64Zl9aShUUkawUwyHzSA==
X-Received: by 2002:a17:903:22c8:b0:223:517c:bfa1 with SMTP id d9443c01a7336-225e0af0323mr191813145ad.38.1742236470577;
        Mon, 17 Mar 2025 11:34:30 -0700 (PDT)
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
Subject: [PATCH v6 05/18] exec/memory.h: make devend_memop "target defines" agnostic
Date: Mon, 17 Mar 2025 11:34:04 -0700
Message-Id: <20250317183417.285700-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Will allow to make system/memory.c common later.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/memory.h | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index da21e9150b5..069021ac3ff 100644
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


