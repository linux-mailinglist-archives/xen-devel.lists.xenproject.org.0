Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7344A996515
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 11:22:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814025.1227109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySta-0004mo-6N; Wed, 09 Oct 2024 09:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814025.1227109; Wed, 09 Oct 2024 09:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySta-0004jS-33; Wed, 09 Oct 2024 09:22:14 +0000
Received: by outflank-mailman (input) for mailman id 814025;
 Wed, 09 Oct 2024 09:22:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syStZ-0004i5-0m
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 09:22:13 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6768ff0-861f-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 11:22:11 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so764049466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 02:22:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9944d35ae0sm516341966b.179.2024.10.09.02.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 02:22:10 -0700 (PDT)
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
X-Inumbo-ID: f6768ff0-861f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728465730; x=1729070530; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V8c2SNQ211TOqrrm1XFnwxCRfjvpxqWFiyYI1q9RatQ=;
        b=FLCL+zCS9rgtbiEcrw6aT7R+1c8za3nVuMGVvyRHBm+NPtDUJjdN8FF+qRro5QqJvm
         OpeKVeKRsKmHivEJF2xF6pE3FtmlOTC0J2NMkNq3sZ3KLpOTEAMSN8xE0ccc3h62U0ww
         z7H6DWr5MhmFzgSD5GN9hB8LDmD/7A+WT93nWbixviGL4C5N4PWJmkPUQAZKNgMg15GP
         Of64NUs4lsIDn6jafacBTytJMJyQiYbJInvCNYeJShsiskVC2NBiSbXiAehrrLLiQUw8
         96KvsDlvGrbwymkUUNKcPetU59jmCoqN9nW5CbbQqNAJrXRPK+pqYzB5cG5I+u4n/H7Y
         kPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728465730; x=1729070530;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8c2SNQ211TOqrrm1XFnwxCRfjvpxqWFiyYI1q9RatQ=;
        b=WytvuwgTUAu4bu/y5m3WXSJYAIKRvMTjjOPnO8V2iHNXbk5NYjnT2DAKv16pO8ku82
         s37IIU1kLYmdPTgVWuHGdkI+LtW4/08uye/jVB3xoPrSFzjXM5FCMOr/ud/raRAwZaK2
         yGyqypCauuW7faIpD4iTJRUdViwZf2S0cTpjWPgXIEJcTVheYkbIBX2trDVkF2nZVpoI
         2GSEnscraIgf1MEuS5qJtYkL0DArbPwhYtO9s6kKD5+uxR+VViYpScy2xBpDR0Nypb5a
         kQteNZPvcN8F8cio+XUOm1XNS3CgQ9zsLjpt8pM2hOvRMniZXMFLYT/7xF3/IXS0tBJv
         d7mQ==
X-Gm-Message-State: AOJu0YwHErNLbAldJyOOASA3cIzs6KOFJumnaFbyN5G5V0XqZAoP6vFq
	fnqJ7evfzrFXoDxQEAEpvJIfPGCdXxnYE6pCwDOf4e2FslclgjNh0UGPqaMDFjQ40EqvA3b/QTE
	=
X-Google-Smtp-Source: AGHT+IFxx9aAXs9K3UWLUkNoPTxnyQgFbFDiv6QuguA0fBJfC6nx4QcDbNYAPGOBVLbci3y7zpLYtg==
X-Received: by 2002:a17:906:c105:b0:a99:403e:2578 with SMTP id a640c23a62f3a-a998d0ffcc4mr141469566b.5.1728465730378;
        Wed, 09 Oct 2024 02:22:10 -0700 (PDT)
Message-ID: <ec9a5268-f4fc-44f0-b8b6-803c9f935026@suse.com>
Date: Wed, 9 Oct 2024 11:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/7] byteorder: replace __u32
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <17b6b894-9b41-4e8c-a3a9-ce837797eac3@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <17b6b894-9b41-4e8c-a3a9-ce837797eac3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In {big,little}_endian.h the changes are entirely mechanical, except for
dealing with casting away of const from pointers-to-const on lines
touched anyway.

In swab.h the casting of constants is done away with as well - I simply
don't see what the respective comment is concerned about in our
environment (sizeof(int) >= 4, sizeof(long) >= {4,8} depending on
architecture, sizeof(long long) >= 8). The comment is certainly relevant
in more general cases. Excess parentheses are dropped as well,
___swab32()'s local variable is renamed, and __arch__swab32()'s is
dropped as being redundant with ___swab32()'s.

The masking operation is also dropped from __fswab64().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm unconvinced of the need of the separate ___constant_swab32(). I'm
also unconvinced of the need for some of said constants (that even had
casts on them).

--- a/xen/include/xen/byteorder/big_endian.h
+++ b/xen/include/xen/byteorder/big_endian.h
@@ -14,25 +14,25 @@
 #define __constant_cpu_to_le64(x) ((__force __le64)___constant_swab64((x)))
 #define __constant_le64_to_cpu(x) ___constant_swab64((__force __u64)(__le64)(x))
 #define __constant_cpu_to_le32(x) ((__force __le32)___constant_swab32((x)))
-#define __constant_le32_to_cpu(x) ___constant_swab32((__force __u32)(__le32)(x))
+#define __constant_le32_to_cpu(x) ___constant_swab32((__force uint32_t)(__le32)(x))
 #define __constant_cpu_to_le16(x) ((__force __le16)___constant_swab16((x)))
 #define __constant_le16_to_cpu(x) ___constant_swab16((__force uint16_t)(__le16)(x))
 #define __constant_cpu_to_be64(x) ((__force __be64)(__u64)(x))
 #define __constant_be64_to_cpu(x) ((__force __u64)(__be64)(x))
-#define __constant_cpu_to_be32(x) ((__force __be32)(__u32)(x))
-#define __constant_be32_to_cpu(x) ((__force __u32)(__be32)(x))
+#define __constant_cpu_to_be32(x) ((__force __be32)(uint32_t)(x))
+#define __constant_be32_to_cpu(x) ((__force uint32_t)(__be32)(x))
 #define __constant_cpu_to_be16(x) ((__force __be16)(uint16_t)(x))
 #define __constant_be16_to_cpu(x) ((__force uint16_t)(__be16)(x))
 #define __cpu_to_le64(x) ((__force __le64)__swab64((x)))
 #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
 #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
-#define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
+#define __le32_to_cpu(x) __swab32((__force uint32_t)(__le32)(x))
 #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
 #define __le16_to_cpu(x) __swab16((__force uint16_t)(__le16)(x))
 #define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
 #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
-#define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
-#define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
+#define __cpu_to_be32(x) ((__force __be32)(uint32_t)(x))
+#define __be32_to_cpu(x) ((__force uint32_t)(__be32)(x))
 #define __cpu_to_be16(x) ((__force __be16)(uint16_t)(x))
 #define __be16_to_cpu(x) ((__force uint16_t)(__be16)(x))
 
@@ -44,13 +44,13 @@ static inline __u64 __le64_to_cpup(const
 {
     return __swab64p((__u64 *)p);
 }
-static inline __le32 __cpu_to_le32p(const __u32 *p)
+static inline __le32 __cpu_to_le32p(const uint32_t *p)
 {
     return (__force __le32)__swab32p(p);
 }
-static inline __u32 __le32_to_cpup(const __le32 *p)
+static inline uint32_t __le32_to_cpup(const __le32 *p)
 {
-    return __swab32p((__u32 *)p);
+    return __swab32p((const uint32_t *)p);
 }
 static inline __le16 __cpu_to_le16p(const uint16_t *p)
 {
@@ -68,13 +68,13 @@ static inline __u64 __be64_to_cpup(const
 {
     return (__force __u64)*p;
 }
-static inline __be32 __cpu_to_be32p(const __u32 *p)
+static inline __be32 __cpu_to_be32p(const uint32_t *p)
 {
     return (__force __be32)*p;
 }
-static inline __u32 __be32_to_cpup(const __be32 *p)
+static inline uint32_t __be32_to_cpup(const __be32 *p)
 {
-    return (__force __u32)*p;
+    return (__force uint32_t)*p;
 }
 static inline __be16 __cpu_to_be16p(const uint16_t *p)
 {
--- a/xen/include/xen/byteorder/little_endian.h
+++ b/xen/include/xen/byteorder/little_endian.h
@@ -13,26 +13,26 @@
 
 #define __constant_cpu_to_le64(x) ((__force __le64)(__u64)(x))
 #define __constant_le64_to_cpu(x) ((__force __u64)(__le64)(x))
-#define __constant_cpu_to_le32(x) ((__force __le32)(__u32)(x))
-#define __constant_le32_to_cpu(x) ((__force __u32)(__le32)(x))
+#define __constant_cpu_to_le32(x) ((__force __le32)(uint32_t)(x))
+#define __constant_le32_to_cpu(x) ((__force uint32_t)(__le32)(x))
 #define __constant_cpu_to_le16(x) ((__force __le16)(uint16_t)(x))
 #define __constant_le16_to_cpu(x) ((__force uint16_t)(__le16)(x))
 #define __constant_cpu_to_be64(x) ((__force __be64)___constant_swab64((x)))
 #define __constant_be64_to_cpu(x) ___constant_swab64((__force __u64)(__be64)(x))
 #define __constant_cpu_to_be32(x) ((__force __be32)___constant_swab32((x)))
-#define __constant_be32_to_cpu(x) ___constant_swab32((__force __u32)(__be32)(x))
+#define __constant_be32_to_cpu(x) ___constant_swab32((__force uint32_t)(__be32)(x))
 #define __constant_cpu_to_be16(x) ((__force __be16)___constant_swab16((x)))
 #define __constant_be16_to_cpu(x) ___constant_swab16((__force uint16_t)(__be16)(x))
 #define __cpu_to_le64(x) ((__force __le64)(__u64)(x))
 #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
-#define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
-#define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
+#define __cpu_to_le32(x) ((__force __le32)(uint32_t)(x))
+#define __le32_to_cpu(x) ((__force uint32_t)(__le32)(x))
 #define __cpu_to_le16(x) ((__force __le16)(uint16_t)(x))
 #define __le16_to_cpu(x) ((__force uint16_t)(__le16)(x))
 #define __cpu_to_be64(x) ((__force __be64)__swab64((x)))
 #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
 #define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
-#define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
+#define __be32_to_cpu(x) __swab32((__force uint32_t)(__be32)(x))
 #define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
 #define __be16_to_cpu(x) __swab16((__force uint16_t)(__be16)(x))
 
@@ -44,13 +44,13 @@ static inline __u64 __le64_to_cpup(const
 {
     return (__force __u64)*p;
 }
-static inline __le32 __cpu_to_le32p(const __u32 *p)
+static inline __le32 __cpu_to_le32p(const uint32_t *p)
 {
     return (__force __le32)*p;
 }
-static inline __u32 __le32_to_cpup(const __le32 *p)
+static inline uint32_t __le32_to_cpup(const __le32 *p)
 {
-    return (__force __u32)*p;
+    return (__force uint32_t)*p;
 }
 static inline __le16 __cpu_to_le16p(const uint16_t *p)
 {
@@ -68,13 +68,13 @@ static inline __u64 __be64_to_cpup(const
 {
     return __swab64p((__u64 *)p);
 }
-static inline __be32 __cpu_to_be32p(const __u32 *p)
+static inline __be32 __cpu_to_be32p(const uint32_t *p)
 {
     return (__force __be32)__swab32p(p);
 }
-static inline __u32 __be32_to_cpup(const __be32 *p)
+static inline uint32_t __be32_to_cpup(const __be32 *p)
 {
-    return __swab32p((__u32 *)p);
+    return __swab32p((const uint32_t *)p);
 }
 static inline __be16 __cpu_to_be16p(const uint16_t *p)
 {
--- a/xen/include/xen/byteorder/swab.h
+++ b/xen/include/xen/byteorder/swab.h
@@ -12,7 +12,7 @@
 
 /*
  * Casts are necessary for constants, because we never know for sure how
- * U/UL/ULL map to __u32, __u64. At least not in a portable way.
+ * UL/ULL map to __u64. At least not in a portable way.
  */
 #define ___swab16(x)                                    \
 ({                                                      \
@@ -24,12 +24,12 @@
 
 #define ___swab32(x)                                            \
 ({                                                              \
-    __u32 __x = (x);                                            \
-    ((__u32)(                                                   \
-        (((__u32)(__x) & (__u32)0x000000ffUL) << 24) |          \
-        (((__u32)(__x) & (__u32)0x0000ff00UL) <<  8) |          \
-        (((__u32)(__x) & (__u32)0x00ff0000UL) >>  8) |          \
-        (((__u32)(__x) & (__u32)0xff000000UL) >> 24) ));        \
+    uint32_t x_ = (x);                                          \
+    (uint32_t)(                                                 \
+        (((uint32_t)(x_) & 0x000000ffU) << 24) |                \
+        (((uint32_t)(x_) & 0x0000ff00U) <<  8) |                \
+        (((uint32_t)(x_) & 0x00ff0000U) >>  8) |                \
+        (((uint32_t)(x_) & 0xff000000U) >> 24));                \
 })
 
 #define ___swab64(x)                                                       \
@@ -51,11 +51,11 @@
         (((uint16_t)(x) & 0x00ffU) << 8) |      \
         (((uint16_t)(x) & 0xff00U) >> 8)))
 #define ___constant_swab32(x)                           \
-    ((__u32)(                                           \
-        (((__u32)(x) & (__u32)0x000000ffUL) << 24) |    \
-        (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |    \
-        (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |    \
-        (((__u32)(x) & (__u32)0xff000000UL) >> 24) ))
+    ((uint32_t)(                                        \
+        (((uint32_t)(x) & 0x000000ffU) << 24) |         \
+        (((uint32_t)(x) & 0x0000ff00U) <<  8) |         \
+        (((uint32_t)(x) & 0x00ff0000U) >>  8) |         \
+        (((uint32_t)(x) & 0xff000000U) >> 24)))
 #define ___constant_swab64(x)                                            \
     ((__u64)(                                                            \
         (__u64)(((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |     \
@@ -74,7 +74,7 @@
 #  define __arch__swab16(x) ___swab16(x)
 #endif
 #ifndef __arch__swab32
-#  define __arch__swab32(x) ({ __u32 __tmp = (x) ; ___swab32(__tmp); })
+#  define __arch__swab32(x) ___swab32(x)
 #endif
 #ifndef __arch__swab64
 #  define __arch__swab64(x) ({ __u64 __tmp = (x) ; ___swab64(__tmp); })
@@ -110,7 +110,7 @@
  ___swab16((x)) : \
  __fswab16((x)))
 #  define __swab32(x) \
-(__builtin_constant_p((__u32)(x)) ? \
+(__builtin_constant_p((uint32_t)(x)) ? \
  ___swab32((x)) : \
  __fswab32((x)))
 #  define __swab64(x) \
@@ -137,15 +137,15 @@ static inline void __swab16s(uint16_t *a
     __arch__swab16s(addr);
 }
 
-static inline attr_const __u32 __fswab32(__u32 x)
+static inline attr_const uint32_t __fswab32(uint32_t x)
 {
     return __arch__swab32(x);
 }
-static inline __u32 __swab32p(const __u32 *x)
+static inline uint32_t __swab32p(const uint32_t *x)
 {
     return __arch__swab32p(x);
 }
-static inline void __swab32s(__u32 *addr)
+static inline void __swab32s(uint32_t *addr)
 {
     __arch__swab32s(addr);
 }
@@ -154,8 +154,7 @@ static inline void __swab32s(__u32 *addr
 static inline attr_const __u64 __fswab64(__u64 x)
 {
 #  ifdef __SWAB_64_THRU_32__
-    __u32 h = x >> 32;
-        __u32 l = x & ((1ULL<<32)-1);
+    uint32_t h = x >> 32, l = x;
         return (((__u64)__swab32(l)) << 32) | ((__u64)(__swab32(h)));
 #  else
     return __arch__swab64(x);


