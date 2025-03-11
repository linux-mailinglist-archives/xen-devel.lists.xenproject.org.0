Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAF6A5D01B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908966.1315995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5k1-0006bq-4n; Tue, 11 Mar 2025 19:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908966.1315995; Tue, 11 Mar 2025 19:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5k0-0006XY-Vp; Tue, 11 Mar 2025 19:58:16 +0000
Received: by outflank-mailman (input) for mailman id 908966;
 Tue, 11 Mar 2025 19:58:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts5k0-0006Vp-8r
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:58:16 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29b67500-feb3-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 20:58:13 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-223959039f4so120348505ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 12:58:13 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:11 -0700 (PDT)
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
X-Inumbo-ID: 29b67500-feb3-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741723092; x=1742327892; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
        b=xyIS890yvKZtu5TQSl53iEAb0SldLni82RUKLtE1cXqYlvD+kNRbQ5/aoz+t9EM/D0
         DldSlHWLO/Gx9/qSi4s6HokjNLim31Bp8WxzqU+zLAOl4lVOAAFGrd3va8zEA4hF3RmJ
         4Kjrhc10Vy/XeNf6kDuxxqWRD1yIiCGE8xkvSvyguJV4ENcZV4Hj0xezN4bZHm1IRtni
         eznBWjwDnPff3l2j8JlUThryp1agL88eD4kTD8zAT9a+lqaWWP/627zjVRxOsVbHxNl/
         Pip+dUoSxsxSxtFAc7ZdPs8l5nNXMK2M/P+0/GPDeDBukBIfVtqXEc40e0m/SgE5AGD5
         JPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723092; x=1742327892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=949DeBQijWmgHqYCdDdupcSTn3rDdND8nLqwkILEwEI=;
        b=suMncCLtRtkqWxOMNKQbxr/fhPHrEzCsIthSjHDX3FNy4oHbwqM1aDkugbWsQMxa94
         rTewfXIM4okbD0NNxB10MuPOY1tz3fJ4i9SbquVzpN4vqPgR1bGmekBLLP599a491Cgb
         X6dVS6Gu9eWuR2BPayYGkheCi24xq5FLagmTARVSd8uyeUiIDuFA0+PfmhzrbvrTajVV
         AziHkYu2pHFowh+7Eb2v8IhzSQOAQ1LZt+lBxfT+V/xNlGJTApwKQ8qiBt/n4bG5Wn8k
         xJu6x/gMq4FBfAI4xmvuJBlD4EwmMxRC+AFlpEbKlvpheijPYL4mB/IaRfw2LfjC85+b
         vzvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2AXN7kGbfpG/HQ+Wfi2dFfDz21f+47zyxs5+az5jP/QqzEjbzjEBJp2qJ3b0bVe1xVEOYncCRVQY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDhvKPA8Z9/pEsxhzZLW/G8l1gqb9Z4mgU4vGCK0Gg1xeZdHM6
	8O5Ym7toPDksxy1isPDo6TwJ/kSS9aSCjSYjxGgxZWJQ0Dkt/H/U/HKjVbv1U6g=
X-Gm-Gg: ASbGnctbEosqa+geEPH8R9Xg7mBfnqU43bmE6/jLMN92iywCaE/FzDeYZZea+nI+rCX
	WjET0YIqdgOjzxraMT6gvQ2vX9TQN3eFr/njk5C7CXCyUfzi5KwviWop7SaWNd+GAX9VWUVkN0I
	GSU97dOzfHPT1PviwG3LR9KIJ0iFTFRl5unVOuqz8szrwCOHUpXjq3akTdk8UgjQAPb6kyDVpit
	wTcvEWOdpR6/gwP80Pr3HseYBNAQYQefeZ6zcGDE6GN5hBosSm3Hy9aTuPcsyBeA7/O3AE0UqtX
	Q48x47YglWj13XL2tH9KCxLC0O1uh11yXespMQIVfhcloHpgCleZl7Q=
X-Google-Smtp-Source: AGHT+IEdn0vUjdqWf+0ft6dtNABWq7WqhDB4TNeuQtg0nIMIUQeKA5OeniZU9oewAupJBz+i092ynA==
X-Received: by 2002:aa7:9e43:0:b0:736:d297:164 with SMTP id d2e1a72fcca58-736d29703d5mr9263457b3a.1.1741723091837;
        Tue, 11 Mar 2025 12:58:11 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	manos.pitsidianakis@linaro.org,
	Peter Xu <peterx@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	alex.bennee@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 01/17] exec/tswap: target code can use TARGET_BIG_ENDIAN instead of target_words_bigendian()
Date: Tue, 11 Mar 2025 12:57:47 -0700
Message-Id: <20250311195803.4115788-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
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


