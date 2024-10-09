Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE0199653A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 11:25:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814052.1227148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySwe-000704-CO; Wed, 09 Oct 2024 09:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814052.1227148; Wed, 09 Oct 2024 09:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySwe-0006wt-9f; Wed, 09 Oct 2024 09:25:24 +0000
Received: by outflank-mailman (input) for mailman id 814052;
 Wed, 09 Oct 2024 09:25:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sySwc-0006TZ-HR
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 09:25:22 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67f4a20d-8620-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 11:25:21 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c8967dd2c7so8154207a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 02:25:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05bc56asm5212583a12.45.2024.10.09.02.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 02:25:20 -0700 (PDT)
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
X-Inumbo-ID: 67f4a20d-8620-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728465921; x=1729070721; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gP7lbN35wCGIUuM79IuL2uQrQmd6PPoQxchjzUNEOWM=;
        b=K0QUIxYxT9H87KdHsBOLjK6vf2zxRPx4D4ERibCwuWG2ICm3h9/0NMKJJ9QEaGlAsY
         8qjYwRri5hezNeon1agu1V+BY6h/vXzu0MrGChnI6n7KuvaSnhPwbQrth647LZy1FXCl
         NosSbNT0rFIt2mFkSoymE7XtGrZOyvOf11wCKkNbaf/SQikKzTsdEGFdZ1S42v9yHqRn
         jf31t+7+/fhlgtaVvZENBe2RfBzYUBsRVoiLyAPVHryH1a+feK9v3UsoOR7dkv6gM4O9
         tBrtXYB9E4nRufDAi5b/zCjP0LvTpjl6EVEM7xXhM9uLaEb1FlVJgo85+hMjQgtpHCcx
         39xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728465921; x=1729070721;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gP7lbN35wCGIUuM79IuL2uQrQmd6PPoQxchjzUNEOWM=;
        b=JtQkjBHXhrdOlw/Rs0F3M8ohTcnaiXzRM67StoVASCvhWdje/12qgRGSjv72fCbNsl
         3ZBI30MxKsz5h9aPFB8PifdsbxJ/apeTc6vv0BeHi4p41vUaLK4MkkHGDVmYHLeZGGIx
         kWABaGCrgo61zKGlWSHvvcF9cqUkzs+NaQz7lNMKYrxcjRX53/fiF4yxtaZHZiPk2eCq
         QE9yF5VVUGBbpe6ghuKEm81jh5nHd1Z3rQ1leseQTzL04e5EzBTUldqufGeybQ8TlTY0
         Xpo6sgRvbGe+k6oy63PkzicobQFN9QxcTN5aWMabCozkZHq07NdwSp9nfNBQmIXrnIXQ
         tG6Q==
X-Gm-Message-State: AOJu0YwfIgt3HDySmEmBMwNI9319ARuBl+0kdpzHIwtojL36w3X8vkPO
	UInGCg/hdVDQFCfXzOKvqI8PXlYYuoNoOd5/sh44DXt9FirgGY/p7wdlkf2cDT4QoZ52i0P4HQk
	=
X-Google-Smtp-Source: AGHT+IGF+XuBUT0D8UHGLgMmKt+ASiWxSsAIdlF5aAfY98eLC1T/mVfHqaKXmMf+VDdE8uPgTY4B1A==
X-Received: by 2002:a05:6402:3513:b0:5c8:bdbe:33a6 with SMTP id 4fb4d7f45d1cf-5c91d689226mr1347734a12.31.1728465920754;
        Wed, 09 Oct 2024 02:25:20 -0700 (PDT)
Message-ID: <674bed79-1db6-4838-85a4-2dcba9655ebd@suse.com>
Date: Wed, 9 Oct 2024 11:25:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 6/7] byteorder: replace __u64
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
___swab64()'s local variable is renamed, and __arch__swab64()'s is
dropped as being redundant with ___swab64()'s.

Excessive casts compared to ___{,constant_}swab{16,32}() are also
dropped. Much like excessive ones in __fswab64().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm unconvinced of the need of the separate ___constant_swab64(). I'm
also unconvinced of the need for some of said constants (that even had
casts on them).

--- a/xen/include/xen/byteorder/big_endian.h
+++ b/xen/include/xen/byteorder/big_endian.h
@@ -12,37 +12,37 @@
 #include <xen/byteorder/swab.h>
 
 #define __constant_cpu_to_le64(x) ((__force __le64)___constant_swab64((x)))
-#define __constant_le64_to_cpu(x) ___constant_swab64((__force __u64)(__le64)(x))
+#define __constant_le64_to_cpu(x) ___constant_swab64((__force uint64_t)(__le64)(x))
 #define __constant_cpu_to_le32(x) ((__force __le32)___constant_swab32((x)))
 #define __constant_le32_to_cpu(x) ___constant_swab32((__force uint32_t)(__le32)(x))
 #define __constant_cpu_to_le16(x) ((__force __le16)___constant_swab16((x)))
 #define __constant_le16_to_cpu(x) ___constant_swab16((__force uint16_t)(__le16)(x))
-#define __constant_cpu_to_be64(x) ((__force __be64)(__u64)(x))
-#define __constant_be64_to_cpu(x) ((__force __u64)(__be64)(x))
+#define __constant_cpu_to_be64(x) ((__force __be64)(uint64_t)(x))
+#define __constant_be64_to_cpu(x) ((__force uint64_t)(__be64)(x))
 #define __constant_cpu_to_be32(x) ((__force __be32)(uint32_t)(x))
 #define __constant_be32_to_cpu(x) ((__force uint32_t)(__be32)(x))
 #define __constant_cpu_to_be16(x) ((__force __be16)(uint16_t)(x))
 #define __constant_be16_to_cpu(x) ((__force uint16_t)(__be16)(x))
 #define __cpu_to_le64(x) ((__force __le64)__swab64((x)))
-#define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
+#define __le64_to_cpu(x) __swab64((__force uint64_t)(__le64)(x))
 #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
 #define __le32_to_cpu(x) __swab32((__force uint32_t)(__le32)(x))
 #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
 #define __le16_to_cpu(x) __swab16((__force uint16_t)(__le16)(x))
-#define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
-#define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
+#define __cpu_to_be64(x) ((__force __be64)(uint64_t)(x))
+#define __be64_to_cpu(x) ((__force uint64_t)(__be64)(x))
 #define __cpu_to_be32(x) ((__force __be32)(uint32_t)(x))
 #define __be32_to_cpu(x) ((__force uint32_t)(__be32)(x))
 #define __cpu_to_be16(x) ((__force __be16)(uint16_t)(x))
 #define __be16_to_cpu(x) ((__force uint16_t)(__be16)(x))
 
-static inline __le64 __cpu_to_le64p(const __u64 *p)
+static inline __le64 __cpu_to_le64p(const uint64_t *p)
 {
     return (__force __le64)__swab64p(p);
 }
-static inline __u64 __le64_to_cpup(const __le64 *p)
+static inline uint64_t __le64_to_cpup(const __le64 *p)
 {
-    return __swab64p((__u64 *)p);
+    return __swab64p((const uint64_t *)p);
 }
 static inline __le32 __cpu_to_le32p(const uint32_t *p)
 {
@@ -60,13 +60,13 @@ static inline uint16_t __le16_to_cpup(co
 {
     return __swab16p((const uint16_t *)p);
 }
-static inline __be64 __cpu_to_be64p(const __u64 *p)
+static inline __be64 __cpu_to_be64p(const uint64_t *p)
 {
     return (__force __be64)*p;
 }
-static inline __u64 __be64_to_cpup(const __be64 *p)
+static inline uint64_t __be64_to_cpup(const __be64 *p)
 {
-    return (__force __u64)*p;
+    return (__force uint64_t)*p;
 }
 static inline __be32 __cpu_to_be32p(const uint32_t *p)
 {
--- a/xen/include/xen/byteorder/little_endian.h
+++ b/xen/include/xen/byteorder/little_endian.h
@@ -11,38 +11,38 @@
 #include <xen/types.h>
 #include <xen/byteorder/swab.h>
 
-#define __constant_cpu_to_le64(x) ((__force __le64)(__u64)(x))
-#define __constant_le64_to_cpu(x) ((__force __u64)(__le64)(x))
+#define __constant_cpu_to_le64(x) ((__force __le64)(uint64_t)(x))
+#define __constant_le64_to_cpu(x) ((__force uint64_t)(__le64)(x))
 #define __constant_cpu_to_le32(x) ((__force __le32)(uint32_t)(x))
 #define __constant_le32_to_cpu(x) ((__force uint32_t)(__le32)(x))
 #define __constant_cpu_to_le16(x) ((__force __le16)(uint16_t)(x))
 #define __constant_le16_to_cpu(x) ((__force uint16_t)(__le16)(x))
 #define __constant_cpu_to_be64(x) ((__force __be64)___constant_swab64((x)))
-#define __constant_be64_to_cpu(x) ___constant_swab64((__force __u64)(__be64)(x))
+#define __constant_be64_to_cpu(x) ___constant_swab64((__force uint64_t)(__be64)(x))
 #define __constant_cpu_to_be32(x) ((__force __be32)___constant_swab32((x)))
 #define __constant_be32_to_cpu(x) ___constant_swab32((__force uint32_t)(__be32)(x))
 #define __constant_cpu_to_be16(x) ((__force __be16)___constant_swab16((x)))
 #define __constant_be16_to_cpu(x) ___constant_swab16((__force uint16_t)(__be16)(x))
-#define __cpu_to_le64(x) ((__force __le64)(__u64)(x))
-#define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
+#define __cpu_to_le64(x) ((__force __le64)(uint64_t)(x))
+#define __le64_to_cpu(x) ((__force uint64_t)(__le64)(x))
 #define __cpu_to_le32(x) ((__force __le32)(uint32_t)(x))
 #define __le32_to_cpu(x) ((__force uint32_t)(__le32)(x))
 #define __cpu_to_le16(x) ((__force __le16)(uint16_t)(x))
 #define __le16_to_cpu(x) ((__force uint16_t)(__le16)(x))
 #define __cpu_to_be64(x) ((__force __be64)__swab64((x)))
-#define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
+#define __be64_to_cpu(x) __swab64((__force uint64_t)(__be64)(x))
 #define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
 #define __be32_to_cpu(x) __swab32((__force uint32_t)(__be32)(x))
 #define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
 #define __be16_to_cpu(x) __swab16((__force uint16_t)(__be16)(x))
 
-static inline __le64 __cpu_to_le64p(const __u64 *p)
+static inline __le64 __cpu_to_le64p(const uint64_t *p)
 {
     return (__force __le64)*p;
 }
-static inline __u64 __le64_to_cpup(const __le64 *p)
+static inline uint64_t __le64_to_cpup(const __le64 *p)
 {
-    return (__force __u64)*p;
+    return (__force uint64_t)*p;
 }
 static inline __le32 __cpu_to_le32p(const uint32_t *p)
 {
@@ -60,13 +60,13 @@ static inline uint16_t __le16_to_cpup(co
 {
     return (__force uint16_t)*p;
 }
-static inline __be64 __cpu_to_be64p(const __u64 *p)
+static inline __be64 __cpu_to_be64p(const uint64_t *p)
 {
     return (__force __be64)__swab64p(p);
 }
-static inline __u64 __be64_to_cpup(const __be64 *p)
+static inline uint64_t __be64_to_cpup(const __be64 *p)
 {
-    return __swab64p((__u64 *)p);
+    return __swab64p((const uint64_t *)p);
 }
 static inline __be32 __cpu_to_be32p(const uint32_t *p)
 {
--- a/xen/include/xen/byteorder/swab.h
+++ b/xen/include/xen/byteorder/swab.h
@@ -10,10 +10,6 @@
  *    to clean up support for bizarre-endian architectures.
  */
 
-/*
- * Casts are necessary for constants, because we never know for sure how
- * UL/ULL map to __u64. At least not in a portable way.
- */
 #define ___swab16(x)                                    \
 ({                                                      \
     uint16_t x_ = (x);                                  \
@@ -34,16 +30,16 @@
 
 #define ___swab64(x)                                                       \
 ({                                                                         \
-    __u64 __x = (x);                                                       \
-    ((__u64)(                                                              \
-        (__u64)(((__u64)(__x) & (__u64)0x00000000000000ffULL) << 56) |     \
-        (__u64)(((__u64)(__x) & (__u64)0x000000000000ff00ULL) << 40) |     \
-        (__u64)(((__u64)(__x) & (__u64)0x0000000000ff0000ULL) << 24) |     \
-        (__u64)(((__u64)(__x) & (__u64)0x00000000ff000000ULL) <<  8) |     \
-            (__u64)(((__u64)(__x) & (__u64)0x000000ff00000000ULL) >>  8) | \
-        (__u64)(((__u64)(__x) & (__u64)0x0000ff0000000000ULL) >> 24) |     \
-        (__u64)(((__u64)(__x) & (__u64)0x00ff000000000000ULL) >> 40) |     \
-        (__u64)(((__u64)(__x) & (__u64)0xff00000000000000ULL) >> 56) ));   \
+    uint64_t x_ = (x);                                                     \
+    (uint64_t)(                                                            \
+        (((uint64_t)(x_) & 0x00000000000000ffULL) << 56) |                 \
+        (((uint64_t)(x_) & 0x000000000000ff00ULL) << 40) |                 \
+        (((uint64_t)(x_) & 0x0000000000ff0000ULL) << 24) |                 \
+        (((uint64_t)(x_) & 0x00000000ff000000ULL) <<  8) |                 \
+        (((uint64_t)(x_) & 0x000000ff00000000ULL) >>  8) |                 \
+        (((uint64_t)(x_) & 0x0000ff0000000000ULL) >> 24) |                 \
+        (((uint64_t)(x_) & 0x00ff000000000000ULL) >> 40) |                 \
+        (((uint64_t)(x_) & 0xff00000000000000ULL) >> 56));                 \
 })
 
 #define ___constant_swab16(x)                   \
@@ -57,15 +53,15 @@
         (((uint32_t)(x) & 0x00ff0000U) >>  8) |         \
         (((uint32_t)(x) & 0xff000000U) >> 24)))
 #define ___constant_swab64(x)                                            \
-    ((__u64)(                                                            \
-        (__u64)(((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |     \
-        (__u64)(((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |     \
-        (__u64)(((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |     \
-        (__u64)(((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |     \
-            (__u64)(((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) | \
-        (__u64)(((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |     \
-        (__u64)(((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |     \
-        (__u64)(((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56) ))
+    ((uint64_t)(                                                         \
+        (((uint64_t)(x) & 0x00000000000000ffULL) << 56) |                \
+        (((uint64_t)(x) & 0x000000000000ff00ULL) << 40) |                \
+        (((uint64_t)(x) & 0x0000000000ff0000ULL) << 24) |                \
+        (((uint64_t)(x) & 0x00000000ff000000ULL) <<  8) |                \
+        (((uint64_t)(x) & 0x000000ff00000000ULL) >>  8) |                \
+        (((uint64_t)(x) & 0x0000ff0000000000ULL) >> 24) |                \
+        (((uint64_t)(x) & 0x00ff000000000000ULL) >> 40) |                \
+        (((uint64_t)(x) & 0xff00000000000000ULL) >> 56)))
 
 /*
  * provide defaults when no architecture-specific optimization is detected
@@ -77,7 +73,7 @@
 #  define __arch__swab32(x) ___swab32(x)
 #endif
 #ifndef __arch__swab64
-#  define __arch__swab64(x) ({ __u64 __tmp = (x) ; ___swab64(__tmp); })
+#  define __arch__swab64(x) ___swab64(x)
 #endif
 
 #ifndef __arch__swab16p
@@ -114,7 +110,7 @@
  ___swab32((x)) : \
  __fswab32((x)))
 #  define __swab64(x) \
-(__builtin_constant_p((__u64)(x)) ? \
+(__builtin_constant_p((uint64_t)(x)) ? \
  ___swab64((x)) : \
  __fswab64((x)))
 #else
@@ -151,20 +147,20 @@ static inline void __swab32s(uint32_t *a
 }
 
 #ifdef __BYTEORDER_HAS_U64__
-static inline attr_const __u64 __fswab64(__u64 x)
+static inline attr_const uint64_t __fswab64(uint64_t x)
 {
 #  ifdef __SWAB_64_THRU_32__
     uint32_t h = x >> 32, l = x;
-        return (((__u64)__swab32(l)) << 32) | ((__u64)(__swab32(h)));
+    return ((uint64_t)__swab32(l) << 32) | __swab32(h);
 #  else
     return __arch__swab64(x);
 #  endif
 }
-static inline __u64 __swab64p(const __u64 *x)
+static inline uint64_t __swab64p(const uint64_t *x)
 {
     return __arch__swab64p(x);
 }
-static inline void __swab64s(__u64 *addr)
+static inline void __swab64s(uint64_t *addr)
 {
     __arch__swab64s(addr);
 }


