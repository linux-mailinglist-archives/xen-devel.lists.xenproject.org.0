Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D61AA65CB0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:34:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917736.1322550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFID-0006Xq-Mu; Mon, 17 Mar 2025 18:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917736.1322550; Mon, 17 Mar 2025 18:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFID-0006Vc-Jt; Mon, 17 Mar 2025 18:34:29 +0000
Received: by outflank-mailman (input) for mailman id 917736;
 Mon, 17 Mar 2025 18:34:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuFIC-0006VW-OI
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:34:28 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 749a4835-035e-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 19:34:27 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-225fbdfc17dso32761415ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:34:27 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:25 -0700 (PDT)
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
X-Inumbo-ID: 749a4835-035e-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742236466; x=1742841266; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
        b=WO1hDLydXsc7OZ7t5g4FthRZtjra2wRWu8Ilq6KjPNb4fEABSgywqUVgt9d9UsKfvr
         m+s8yBmlWacZ/u6QdmeOdH/LuNsxQ5d3dCCpILT6JlOMh9BoFE4/OW/50ZoncrP5rRJM
         Kn10rrIVBR2kf3AUVX8tqYBaitD8wyPeVyo69hMW/mFR+zHtxnTXQfL1oEQdBj1A7mJ3
         AYbTRConn83QsN+VmqvkU1P3SOkmCFWSEDaeDSJVK+ehgWyhcnd+tNJT+twuXrTK2AsW
         OLu4kz5bUMcch7Syp/PBdwcnMZkkivI4vkWkCigG2qbi5rZZXApk4su4eeYXKf9zMcz1
         g8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236466; x=1742841266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
        b=bMPzKM0s7d1H6gvugjt2yw4EGGVmptef9VRSk+nIy9zKsiDDJBHhkfavUCTcp7IM6v
         ePsvQUMy5oaYS0E3pCDhdj/lWFG4i/Y7OPMjKA6tC2vZuB4B4UXyQ5SCRHfleuJ3CFC/
         r5DVjC5vqXQ/WNJjFd3Y3kdJ0Plnl6p6UH75+sgUT+3iF3xq4WDo2ksaArTgyuT7l/zJ
         7N7mtknqdWBkoXSM5OEPHkTcQMKBQUpNLi2Wv7kFn6gNT6J27WriPiFRcIlgme1ODZpn
         JgQJ0nD5e5I8Lv6qdBEIgXVBuT5i87ldC8SFivYTwyQjwIvciwQojjDMpqCU4N1yHBI5
         VJWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7SH21ftS/5reg36w6aF68XhKpqsEiFccyzvKoH3peYkjJ9lDgKjIZ2tRwc76243+pIXo5eCK7Fbg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywb0PPYPyPIfnb+y4E4BFglq9p3mBWqbiVjcbIjaLaqgndgeedS
	AYW6jD5O5etE2SOQwevwZ9lY6Tgpaw3i9i2ioLL0JsXNg9VNzLlIRWJ9X5ViTQA=
X-Gm-Gg: ASbGncuA775tYZmbu9tnkiA4IKZXRCDbZWjUQ3f5VIoTPbnJqBO1xQ+Sf9xD1m0yE3R
	D92GEqdlv3zcrPJXmTULuL4zxvsUGjs78RhvD+Z8v5V0vIcXwPl5LBia+3Ih4K/QJMhLMkFHkKM
	0B+HWUYDRCF2tcvxzWGMt09gEFNfR6mpVY1Y1p2MT6KSpfIN2JE0kd5scquDTDy8k+K2BeQS77V
	7IVNqOc1qKbSN06RWgCzMV2rZTFKBpIX2TS5AUqU15CxfJlG/N3o7DNZoShlfOTYWrmUvb4msq9
	WNd06w4DS/nDem63fWW7cybxMQnJZBP/pB3Qz4JxJTfR
X-Google-Smtp-Source: AGHT+IEMdkhHnCOZBQ+9EV0uYxPSw6/JcOSk+BrsDVDiw8khDcGewsFrIqa6c3AgQ8Es/TqwcULwNA==
X-Received: by 2002:a05:6a00:139f:b0:736:9e40:13b1 with SMTP id d2e1a72fcca58-737224726e5mr14180634b3a.23.1742236465994;
        Mon, 17 Mar 2025 11:34:25 -0700 (PDT)
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
Subject: [PATCH v6 01/18] exec/tswap: target code can use TARGET_BIG_ENDIAN instead of target_words_bigendian()
Date: Mon, 17 Mar 2025 11:34:00 -0700
Message-Id: <20250317183417.285700-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
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


