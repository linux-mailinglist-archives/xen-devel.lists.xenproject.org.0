Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EC899650C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 11:22:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814022.1227098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syStG-0004MI-TC; Wed, 09 Oct 2024 09:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814022.1227098; Wed, 09 Oct 2024 09:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syStG-0004Ii-QL; Wed, 09 Oct 2024 09:21:54 +0000
Received: by outflank-mailman (input) for mailman id 814022;
 Wed, 09 Oct 2024 09:21:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syStF-0004IZ-1d
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 09:21:53 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eae4b11b-861f-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 11:21:51 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c90333aaf1so1573264a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 02:21:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05c13d2sm5254411a12.58.2024.10.09.02.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 02:21:50 -0700 (PDT)
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
X-Inumbo-ID: eae4b11b-861f-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728465711; x=1729070511; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SwJiQ5LRjRsB466O+oDjAIYFHy+oGvNSb3+tByj4BgU=;
        b=RaS2y0R1sU4c64svLQxjqDujQgdzxj8zge1BMfJet/l+tD6ipFfVjkll3mmxejzH9H
         JVqo2ywQQUaiGrmgJW8qr8mdwgau9S/XqsKSZ2dGAIoZ7ThcmxEsYkK6oejlixr/rMU/
         Agan4HOzvJmEKrqq0lm9a6/yToOcTZ10xPVgYw1LUsAfITiPe9sYSau3/lNcwdcJuhk5
         NiYOpV4aMAscadkxnHSRg50X2maM8G9klr3sAe7ev9X6x+CINVeT+QZ9TkiA3WGkBxMe
         Q3WWTbacdWfCPN6P4UgVFjIXMCEGLGakkcYdMYFDgcFtdWIgMUEfs/uQLQDoKrVIbYY9
         5vJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728465711; x=1729070511;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwJiQ5LRjRsB466O+oDjAIYFHy+oGvNSb3+tByj4BgU=;
        b=wf9+nWR3sfQt7kk8FtyA4joi7maI6nwya4nwO/t4iI8LZwVqGd5n8TzHrW3s6tgihi
         1OSLy4JTrQZqk/8wpqoAmX48qkY0xus60t9kJkrO77tP9keI2xVK5R3Xh2GJcUKAOgJJ
         X/+ty4YaZPiIv4RT3XDFfiucOoNDv5EqKi6y0eN2ISsEp6btri7PboStn2KZ6ayb/zOr
         nfyoDgyI6cf/euNdaN6/XrLoN2P9xfuMIrrHYO2COYiZE6y4zD9XBIqHpgeKURYP4pp8
         C4FnIcFiQi4pvgtEeVsnTW8Zo544ECYrz6OqtaZb7QhTSAkkOuNf9shNtPUY68u/xUul
         8CQA==
X-Gm-Message-State: AOJu0Yy79kOM5KRi0ss1XbRIX23celS61O0Qm4F/5TXigqtl7pd1znpB
	nCBYWm6CDSeAxxVHRRRxCphD1WRXrxoMWnDsvR/8ejeKQt98+5GrHzaCecf085R/gT5Slk3V+Z8
	=
X-Google-Smtp-Source: AGHT+IEFHgyD+96nHThn9bhtlHZFpzeg925t7VqO8Uu/o1tgfwGnnC4RJhMOZYDVngN7O+qp8oAdAA==
X-Received: by 2002:a05:6402:5248:b0:5c8:9553:a1fb with SMTP id 4fb4d7f45d1cf-5c91d551f57mr1769075a12.9.1728465710920;
        Wed, 09 Oct 2024 02:21:50 -0700 (PDT)
Message-ID: <dee82fce-ffc8-493e-8d99-f5c3b321e5b3@suse.com>
Date: Wed, 9 Oct 2024 11:21:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/7] byteorder: replace __u16
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
___swab16()'s local variable is renamed, and __arch__swab16()'s is
dropped as being redundant with ___swab16()'s.

With that no uses of the type remain, so it moves to linux-compat.h.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm unconvinced of the need of the separate ___constant_swab16(). I'm
also unconvinced of the need for said constants (that even had casts on
them).

--- a/xen/include/xen/byteorder/big_endian.h
+++ b/xen/include/xen/byteorder/big_endian.h
@@ -16,25 +16,25 @@
 #define __constant_cpu_to_le32(x) ((__force __le32)___constant_swab32((x)))
 #define __constant_le32_to_cpu(x) ___constant_swab32((__force __u32)(__le32)(x))
 #define __constant_cpu_to_le16(x) ((__force __le16)___constant_swab16((x)))
-#define __constant_le16_to_cpu(x) ___constant_swab16((__force __u16)(__le16)(x))
+#define __constant_le16_to_cpu(x) ___constant_swab16((__force uint16_t)(__le16)(x))
 #define __constant_cpu_to_be64(x) ((__force __be64)(__u64)(x))
 #define __constant_be64_to_cpu(x) ((__force __u64)(__be64)(x))
 #define __constant_cpu_to_be32(x) ((__force __be32)(__u32)(x))
 #define __constant_be32_to_cpu(x) ((__force __u32)(__be32)(x))
-#define __constant_cpu_to_be16(x) ((__force __be16)(__u16)(x))
-#define __constant_be16_to_cpu(x) ((__force __u16)(__be16)(x))
+#define __constant_cpu_to_be16(x) ((__force __be16)(uint16_t)(x))
+#define __constant_be16_to_cpu(x) ((__force uint16_t)(__be16)(x))
 #define __cpu_to_le64(x) ((__force __le64)__swab64((x)))
 #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
 #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
 #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
 #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
-#define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
+#define __le16_to_cpu(x) __swab16((__force uint16_t)(__le16)(x))
 #define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
 #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
 #define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
 #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
-#define __cpu_to_be16(x) ((__force __be16)(__u16)(x))
-#define __be16_to_cpu(x) ((__force __u16)(__be16)(x))
+#define __cpu_to_be16(x) ((__force __be16)(uint16_t)(x))
+#define __be16_to_cpu(x) ((__force uint16_t)(__be16)(x))
 
 static inline __le64 __cpu_to_le64p(const __u64 *p)
 {
@@ -52,13 +52,13 @@ static inline __u32 __le32_to_cpup(const
 {
     return __swab32p((__u32 *)p);
 }
-static inline __le16 __cpu_to_le16p(const __u16 *p)
+static inline __le16 __cpu_to_le16p(const uint16_t *p)
 {
     return (__force __le16)__swab16p(p);
 }
-static inline __u16 __le16_to_cpup(const __le16 *p)
+static inline uint16_t __le16_to_cpup(const __le16 *p)
 {
-    return __swab16p((__u16 *)p);
+    return __swab16p((const uint16_t *)p);
 }
 static inline __be64 __cpu_to_be64p(const __u64 *p)
 {
@@ -76,13 +76,13 @@ static inline __u32 __be32_to_cpup(const
 {
     return (__force __u32)*p;
 }
-static inline __be16 __cpu_to_be16p(const __u16 *p)
+static inline __be16 __cpu_to_be16p(const uint16_t *p)
 {
     return (__force __be16)*p;
 }
-static inline __u16 __be16_to_cpup(const __be16 *p)
+static inline uint16_t __be16_to_cpup(const __be16 *p)
 {
-    return (__force __u16)*p;
+    return (__force uint16_t)*p;
 }
 #define __cpu_to_le64s(x) __swab64s((x))
 #define __le64_to_cpus(x) __swab64s((x))
--- a/xen/include/xen/byteorder/little_endian.h
+++ b/xen/include/xen/byteorder/little_endian.h
@@ -15,26 +15,26 @@
 #define __constant_le64_to_cpu(x) ((__force __u64)(__le64)(x))
 #define __constant_cpu_to_le32(x) ((__force __le32)(__u32)(x))
 #define __constant_le32_to_cpu(x) ((__force __u32)(__le32)(x))
-#define __constant_cpu_to_le16(x) ((__force __le16)(__u16)(x))
-#define __constant_le16_to_cpu(x) ((__force __u16)(__le16)(x))
+#define __constant_cpu_to_le16(x) ((__force __le16)(uint16_t)(x))
+#define __constant_le16_to_cpu(x) ((__force uint16_t)(__le16)(x))
 #define __constant_cpu_to_be64(x) ((__force __be64)___constant_swab64((x)))
 #define __constant_be64_to_cpu(x) ___constant_swab64((__force __u64)(__be64)(x))
 #define __constant_cpu_to_be32(x) ((__force __be32)___constant_swab32((x)))
 #define __constant_be32_to_cpu(x) ___constant_swab32((__force __u32)(__be32)(x))
 #define __constant_cpu_to_be16(x) ((__force __be16)___constant_swab16((x)))
-#define __constant_be16_to_cpu(x) ___constant_swab16((__force __u16)(__be16)(x))
+#define __constant_be16_to_cpu(x) ___constant_swab16((__force uint16_t)(__be16)(x))
 #define __cpu_to_le64(x) ((__force __le64)(__u64)(x))
 #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
 #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
 #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
-#define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
-#define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
+#define __cpu_to_le16(x) ((__force __le16)(uint16_t)(x))
+#define __le16_to_cpu(x) ((__force uint16_t)(__le16)(x))
 #define __cpu_to_be64(x) ((__force __be64)__swab64((x)))
 #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
 #define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
 #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
 #define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
-#define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
+#define __be16_to_cpu(x) __swab16((__force uint16_t)(__be16)(x))
 
 static inline __le64 __cpu_to_le64p(const __u64 *p)
 {
@@ -52,13 +52,13 @@ static inline __u32 __le32_to_cpup(const
 {
     return (__force __u32)*p;
 }
-static inline __le16 __cpu_to_le16p(const __u16 *p)
+static inline __le16 __cpu_to_le16p(const uint16_t *p)
 {
     return (__force __le16)*p;
 }
-static inline __u16 __le16_to_cpup(const __le16 *p)
+static inline uint16_t __le16_to_cpup(const __le16 *p)
 {
-    return (__force __u16)*p;
+    return (__force uint16_t)*p;
 }
 static inline __be64 __cpu_to_be64p(const __u64 *p)
 {
@@ -76,13 +76,13 @@ static inline __u32 __be32_to_cpup(const
 {
     return __swab32p((__u32 *)p);
 }
-static inline __be16 __cpu_to_be16p(const __u16 *p)
+static inline __be16 __cpu_to_be16p(const uint16_t *p)
 {
     return (__force __be16)__swab16p(p);
 }
-static inline __u16 __be16_to_cpup(const __be16 *p)
+static inline uint16_t __be16_to_cpup(const __be16 *p)
 {
-    return __swab16p((__u16 *)p);
+    return __swab16p((const uint16_t *)p);
 }
 #define __cpu_to_le64s(x) do {} while (0)
 #define __le64_to_cpus(x) do {} while (0)
--- a/xen/include/xen/byteorder/swab.h
+++ b/xen/include/xen/byteorder/swab.h
@@ -10,15 +10,16 @@
  *    to clean up support for bizarre-endian architectures.
  */
 
-/* casts are necessary for constants, because we never know how for sure
- * how U/UL/ULL map to __u16, __u32, __u64. At least not in a portable way.
+/*
+ * Casts are necessary for constants, because we never know for sure how
+ * U/UL/ULL map to __u32, __u64. At least not in a portable way.
  */
 #define ___swab16(x)                                    \
 ({                                                      \
-    __u16 __x = (x);                                    \
-    ((__u16)(                                           \
-        (((__u16)(__x) & (__u16)0x00ffU) << 8) |        \
-        (((__u16)(__x) & (__u16)0xff00U) >> 8) ));      \
+    uint16_t x_ = (x);                                  \
+    (uint16_t)(                                         \
+        (((uint16_t)(x_) & 0x00ffU) << 8) |             \
+        (((uint16_t)(x_) & 0xff00U) >> 8));             \
 })
 
 #define ___swab32(x)                                            \
@@ -46,9 +47,9 @@
 })
 
 #define ___constant_swab16(x)                   \
-    ((__u16)(                                   \
-        (((__u16)(x) & (__u16)0x00ffU) << 8) |  \
-        (((__u16)(x) & (__u16)0xff00U) >> 8) ))
+    ((uint16_t)(                                \
+        (((uint16_t)(x) & 0x00ffU) << 8) |      \
+        (((uint16_t)(x) & 0xff00U) >> 8)))
 #define ___constant_swab32(x)                           \
     ((__u32)(                                           \
         (((__u32)(x) & (__u32)0x000000ffUL) << 24) |    \
@@ -70,7 +71,7 @@
  * provide defaults when no architecture-specific optimization is detected
  */
 #ifndef __arch__swab16
-#  define __arch__swab16(x) ({ __u16 __tmp = (x) ; ___swab16(__tmp); })
+#  define __arch__swab16(x) ___swab16(x)
 #endif
 #ifndef __arch__swab32
 #  define __arch__swab32(x) ({ __u32 __tmp = (x) ; ___swab32(__tmp); })
@@ -105,7 +106,7 @@
  */
 #if defined(__GNUC__) && defined(__OPTIMIZE__)
 #  define __swab16(x) \
-(__builtin_constant_p((__u16)(x)) ? \
+(__builtin_constant_p((uint16_t)(x)) ? \
  ___swab16((x)) : \
  __fswab16((x)))
 #  define __swab32(x) \
@@ -123,15 +124,15 @@
 #endif /* OPTIMIZE */
 
 
-static inline attr_const __u16 __fswab16(__u16 x)
+static inline attr_const uint16_t __fswab16(uint16_t x)
 {
     return __arch__swab16(x);
 }
-static inline __u16 __swab16p(const __u16 *x)
+static inline uint16_t __swab16p(const uint16_t *x)
 {
     return __arch__swab16p(x);
 }
-static inline void __swab16s(__u16 *addr)
+static inline void __swab16s(uint16_t *addr)
 {
     __arch__swab16s(addr);
 }
--- a/xen/include/xen/linux-compat.h
+++ b/xen/include/xen/linux-compat.h
@@ -14,6 +14,7 @@
 typedef int8_t  s8, __s8;
 typedef uint8_t __u8;
 typedef int16_t s16, __s16;
+typedef uint16_t __u16;
 typedef int32_t s32, __s32;
 typedef int64_t s64, __s64;
 
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -6,7 +6,7 @@
 
 /* Linux inherited types which are being phased out */
 typedef uint8_t u8;
-typedef uint16_t u16, __u16;
+typedef uint16_t u16;
 typedef uint32_t u32, __u32;
 typedef uint64_t u64, __u64;
 
@@ -51,8 +51,8 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
 #define LONG_MIN        (-LONG_MAX - 1)
 #define ULONG_MAX       (~0UL)
 
-typedef __u16 __le16;
-typedef __u16 __be16;
+typedef uint16_t __le16;
+typedef uint16_t __be16;
 typedef __u32 __le32;
 typedef __u32 __be32;
 typedef __u64 __le64;


