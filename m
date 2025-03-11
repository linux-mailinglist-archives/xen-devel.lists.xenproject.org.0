Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A48A5B7CD
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 05:09:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907015.1314311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvQ-0000hR-4A; Tue, 11 Mar 2025 04:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907015.1314311; Tue, 11 Mar 2025 04:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvQ-0000fY-0Q; Tue, 11 Mar 2025 04:09:04 +0000
Received: by outflank-mailman (input) for mailman id 907015;
 Tue, 11 Mar 2025 04:09:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trqvO-0000fJ-2e
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 04:09:02 +0000
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ee12b85-fe2e-11ef-9ab8-95dc52dad729;
 Tue, 11 Mar 2025 05:09:00 +0100 (CET)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-300f92661fcso1724700a91.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 21:09:00 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:08:58 -0700 (PDT)
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
X-Inumbo-ID: 8ee12b85-fe2e-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741666138; x=1742270938; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
        b=QSIGkaZavC1QxSA5/aRCC2Kcj7KeBDlPtwOnycoI0r7AYlC80dxWIbJpzvaK4j7wW/
         kt2QkXrON1Eofzn6w7+bcPM9LJxw8sLpXcNDYpOIsIqJqk42Ocp+xprtTHrqz9CuzpeI
         dnz3ipftSgd4uFJhBpXwY9gLN1J9IUMwiSRUDJD478QdqbHMXn1CUS58mBp+aW4EXw0s
         fEdWbE5/ANUfUbKVsMbZRimldT6Vb4hiTREG2qLaWcfjcugKQbgTunlpkMNQPKAb3+hx
         Sdfc5Jy9C7HaXHR5MYh53ajOwVj9UMPo1bp/qfQ14SMIrXeJPp1QsntB5c4kcN8MbUfi
         N95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741666138; x=1742270938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
        b=LVkNPbDqb+2feCCAuHGfZQTZEtSaaG56HAfqWmKQQ53ONrZDAA46D6ROVdFyHG46nI
         rj6AqGSplTvcLMYO/lLR5k06kp28P4TsHIH4qcqTrWe2Gdz7Iks8OdOJJdYj2/hlwuDe
         //2x/1gu50jMqn7kvWzwzIj7qNTgbZReDR1cLwzr/NgFhbxHfPLxxjmBaPz/ePpG2sS+
         7ncsGFEKyZF3DO2s9CBJIrM7EKe+Gvz1UXxqh5UGuxyGcfbdh8ld/qiXDLEh/j7PcY92
         qhIT84USkdaRcDbqDH5z5aknZPK5ga6FsEiJZQUydZD6t+4dd/rzg7nwYC2wPtz2iFV5
         /EYA==
X-Forwarded-Encrypted: i=1; AJvYcCUbn69sO2+PeavTPJAfi/qtokfI7NiLXYsUN6EcOGHbyQXPW+tlehD3y6mZBmxrCXGo+FtNxQn8WG8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuzqIYVUs4uNUP3bSrK051pYD+qHzenIqXCwtuNdBXb7F5r3ZF
	4jSefw6UpO+EvqhrBJ0GIQ2ahXCQsElmVgXSBKfJLjDqwQcFxUB7hDqdvwUpqYc=
X-Gm-Gg: ASbGnct43PpZZt79HiliiFv4/qd1BgZVSfNc9pOtrnAndlQDJB8OSV03GNdntm1ixxG
	X1TM/lbABhtHa+zN5DnP4w6STSu735B6sh5R9UoZQWKL+xJMfugeGRdB6S7/tL7UeIejWcoXVaR
	xfNe1rqpglcASX8w9R0ip3fWepDosSrk40g2dIWII4QvuT8d/rBMObixfJWOhVGLKroYRWf9O+4
	NNvKhC2NWcBGelGjCkgY0NUK4xAQKzxbyyDTZkuJRRAcEUtT03qt8BjjfT2WqmctK6rdk4xwicx
	7a5zIPm/849ZAIdBvh4aOzOPYk+LyskWGftrHiyxiXkq
X-Google-Smtp-Source: AGHT+IEzBJ4Y504tWVEKTLiAl14rUz4i3nUGGoyaKrgK43oaArjDd5np2LA5f1JQHmiuxtYBHKlEDg==
X-Received: by 2002:a05:6a21:b97:b0:1f5:889c:3cdb with SMTP id adf61e73a8af0-1f5889c6dc7mr5899820637.8.1741666138527;
        Mon, 10 Mar 2025 21:08:58 -0700 (PDT)
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
Subject: [PATCH v2 01/16] exec/tswap: target code can use TARGET_BIG_ENDIAN instead of target_words_bigendian()
Date: Mon, 10 Mar 2025 21:08:23 -0700
Message-Id: <20250311040838.3937136-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/tswap.h | 11 ++++++-----
 cpu-target.c         |  1 +
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/exec/tswap.h b/include/exec/tswap.h
index ecd4faef015..2683da0adb7 100644
--- a/include/exec/tswap.h
+++ b/include/exec/tswap.h
@@ -13,13 +13,14 @@
 /**
  * target_words_bigendian:
  * Returns true if the (default) endianness of the target is big endian,
- * false otherwise. Note that in target-specific code, you can use
- * TARGET_BIG_ENDIAN directly instead. On the other hand, common
- * code should normally never need to know about the endianness of the
- * target, so please do *not* use this function unless you know very well
- * what you are doing!
+ * false otherwise. Common code should normally never need to know about the
+ * endianness of the target, so please do *not* use this function unless you
+ * know very well what you are doing!
  */
 bool target_words_bigendian(void);
+#ifdef COMPILING_PER_TARGET
+#define target_words_bigendian()  TARGET_BIG_ENDIAN
+#endif
 
 /*
  * If we're in target-specific code, we can hard-code the swapping
diff --git a/cpu-target.c b/cpu-target.c
index cae77374b38..519b0f89005 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -155,6 +155,7 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
     abort();
 }
 
+#undef target_words_bigendian
 bool target_words_bigendian(void)
 {
     return TARGET_BIG_ENDIAN;
-- 
2.39.5


