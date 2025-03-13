Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB38A5FBF6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:39:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912881.1319055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslaV-0000Yv-W7; Thu, 13 Mar 2025 16:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912881.1319055; Thu, 13 Mar 2025 16:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslaV-0000X6-TG; Thu, 13 Mar 2025 16:39:15 +0000
Received: by outflank-mailman (input) for mailman id 912881;
 Thu, 13 Mar 2025 16:39:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNRr=WA=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tslaV-0000Wy-4P
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:39:15 +0000
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b23bbf4a-0029-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:39:14 +0100 (CET)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2fec3176ef3so2136572a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:39:14 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:12 -0700 (PDT)
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
X-Inumbo-ID: b23bbf4a-0029-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741883952; x=1742488752; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
        b=YH5rqFqnX49zqTEf4vVezPYhQybdK54XEaraA65SFuGPPbrTPuEc3RXiTZn9I9hlcG
         GGD47vu5vYqFu8F7P/98fd2gwT0IXYODklAc9Axi1clCTufRFVo4aQZeekFYAtbF0etv
         snVB1ydsuNnzypl1B3cxe+fjFutkj5a5vhJNcCfPhnq0UYitGW/pY+55+Zed7QmGv2Eg
         1mjozC151IH/zg7A7Gkfuc8mGSKNy7mzKb4IZeZJD9hZ2StrLjt982paE/essqrQCcAd
         jYK55SR7fcyYEkNCQO7Q4iaFwbAGvKJd4nmTUTEUKHXePP/Di7YGQpit8vTh7KvNOFB7
         8YoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883952; x=1742488752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
        b=J+WZ6Re5WU2/WTigBXwIh3hJag/vPqrAx+Wwuetw0Q16Y9t6+7z/RujlSYaJBO30FM
         D0e/b5n0TH9da+u+MQyACTJcg/aXq/CYQ+2whIpSZSh6T7TbERpYOGunduHoUZQP/lkj
         z97AmSaCTT70Ub8kNMNu4zQk6Uv5yPcRgNTOHcApiff46QuBeD2bkZ2LITbdDawtP+kJ
         PZAcU6iohxy78sQmaGX+oZd1bsbAx1YTBA28X67ijVbxtrn2osu3o/Edm7E6/wUSNZ4I
         pWLVLdiAEZJeoKEf8MnbqyJ0NOArrGZeCrZFNEo4P84j7c/CwI+pWTEwT9h1bwTSgL5m
         Q9EA==
X-Forwarded-Encrypted: i=1; AJvYcCWGpLwva4OdSrykQY7Q5+2Rv/zCCWNU3u7+Y8hpFftIvxFGkWhxANysmA/iN3GRu1zjVz+iNtxjcYQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7gTXOUGg/gMQEKMYM0i7dhDe3oEtcnosgP9i8lUPSrHtfPH8Y
	CbXJ+sNEob6tRtEaeyvEsw9/c+2q1xlw1JUXJUh7eb+tbC94g/NkUoYubnwyITE=
X-Gm-Gg: ASbGncuFBdP3SVF68FVAIaj/hfE04lOCG54ucbXLSmxOUyrefYAAQeSkVXDUuLbGGmw
	saI2vePViW7VuRD6YEfTgvVJPCl0qYp433PUPgW0KvDi9BGV6zdeLBHIqCankq5QLjJh3ZOd8t3
	b7X6wJn0311z4NHAzARp1TSwcayPILX2ikvFy4LLR75KRu+zzhwdGVDcKL/IjPxSQ2xYYsqMIL8
	seSLeUwwGHUGkGJarUQTfNX9bRu7VzmhL/muCQX+5mpBKX6tD+Q6U/Y6R7Vm6xLZLJRi0VPj+Sj
	+oJNoTmurF14xgCaZ4gF8Fd5wyRqaiXmS/39Lg+p2Rya
X-Google-Smtp-Source: AGHT+IGev37PyaCRPVTSAXm6sa8QmcuQfkCR4AEqF/Tkfr+Zh7Bhff2KfoPULWlCloRr8rbLF7MLgw==
X-Received: by 2002:a17:90b:3850:b0:2ff:7b15:813b with SMTP id 98e67ed59e1d1-3014e855f52mr302864a91.17.1741883952691;
        Thu, 13 Mar 2025 09:39:12 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 01/17] exec/tswap: target code can use TARGET_BIG_ENDIAN instead of target_words_bigendian()
Date: Thu, 13 Mar 2025 09:38:47 -0700
Message-Id: <20250313163903.1738581-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
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


