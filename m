Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1EE9149D6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 14:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746548.1153635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLiol-0007vf-Jm; Mon, 24 Jun 2024 12:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746548.1153635; Mon, 24 Jun 2024 12:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLiol-0007th-Gx; Mon, 24 Jun 2024 12:29:07 +0000
Received: by outflank-mailman (input) for mailman id 746548;
 Mon, 24 Jun 2024 12:29:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLiok-0007tZ-DZ
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 12:29:06 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58002706-3225-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 14:29:04 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ec0f3b9cfeso49606561fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 05:29:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fa2921e21dsm28243335ad.94.2024.06.24.05.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 05:29:03 -0700 (PDT)
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
X-Inumbo-ID: 58002706-3225-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719232144; x=1719836944; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T49lwRJXT9LLlXuByh3ICxUBFnlr1lvpGV1zsmwF7II=;
        b=Bm3HaTUYp+Bvpo24AE1Ah8hl2LpEU8tn0swwQYCvLIp0B7J68t/GtDHbvvV2wwuB8J
         xlsesLTgVJjXUEV5qMiekaE4+/OymUYyO1Q6Uggt10oQ6UNRUWcqG6kUs/sPIP9ChVvy
         LDjeKr7q6M2h6sPlVlLhr6pOs0oNhrfCUvr6hJpIO0drxxxoBd+upNN2W9XgTFp/rUk7
         Q8OtOCuZ0Nl2Eq7vbyfwuCZAQ5wnN+8tSBurECM2CPWu4J1zhV51WFrJa+QsUYiTuD8m
         qEfndjhTm0DsZosy8/TZo02RjhEbRf6ghPyV9eVPqrl7+UgPsO0M+axR78h9Hw5OgdMv
         jPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719232144; x=1719836944;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T49lwRJXT9LLlXuByh3ICxUBFnlr1lvpGV1zsmwF7II=;
        b=sTI7Xn07xsjS584MgkRpRW/VHzmuu4+Xn9abSM7OPn8LKFmeuFLGwwmD+sARf1fFiF
         vCps/McVnr1Y1Dz+W9GJUD1g6O3XuEZCc8GQei1l4jfc19ZYuJbbr8L+JDngJ2rrWej7
         NKTsePnP4LWUN28i/ysHAMVB6/xmuqor0T5OkKtEyVTfWysd6ulUx2cnIKinQPrQARbZ
         uT3pIfyOlE74OOAjN2JlWFwvL9Qa/e8iQ9Y303RlWJqb0sb7GCQwItV6PvWeH9MWPFd3
         gvN3lVGTmupD4HEHnwHdt9fnr3JhBKUA25SOkBJea7pgLBnzP5WtvcCawe/tRecAk+M+
         zDxQ==
X-Gm-Message-State: AOJu0Yw1fnwtspyaiC00LrH25hjAmElnCxPBg4zYt2KRucAaQwwl3B1h
	ydhdhbKQ4BxCiZHYdB2ADBfLHkrd3UatvZpC312lUwvc4pm2ATaN6GHqtfx+3FM5FGEFxSBSh84
	=
X-Google-Smtp-Source: AGHT+IFQy9PeRggWTF/W705bvZkk2NMYDXLGeQ+j+VInT5+eS6MDMGHKHpKBJsqONdI8wByiG7+GDw==
X-Received: by 2002:a2e:98d6:0:b0:2ec:4d74:8025 with SMTP id 38308e7fff4ca-2ec593d93abmr28361281fa.20.1719232143755;
        Mon, 24 Jun 2024 05:29:03 -0700 (PDT)
Message-ID: <d0b9a1e0-5c70-42c5-9c63-2e3af82487b2@suse.com>
Date: Mon, 24 Jun 2024 14:28:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.19?] xen: avoid UB in guest handle field accessors
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Much like noted in 43d5c5d5f70b ("xen: avoid UB in guest handle
arithmetic"), address calculations involved in accessing a struct field
can overflow, too. Cast respective pointers to "unsigned long" and
convert type checking accordingly. Remaining arithmetic is, despite
there possibly being mathematical overflow, okay as per the C99 spec:
"A computation involving unsigned operands can never overflow, because a
result that cannot be represented by the resulting unsigned integer type
is reduced modulo the number that is one greater than the largest value
that can be represented by the resulting type." The overflow that we
need to guard against is checked for in array_access_ok().

While there add the missing (see {,__}copy_to_guest_offset()) is-not-
const checks to {,__}copy_field_to_guest().

Typically, but not always, no change to generated code; code generation
(register allocation) is different for at least common/grant_table.c.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I notice that {,__}copy_field_from_guest() are actually unused, which
may not be all that surprising: There's perhaps little point in copying
in just a single field, as then any further input fields of a struct
would likely also need copying that way (to avoid multi-read issues).
copy_field_to_guest() has a mere two callers, in x86. All other sites
use __copy_field_to_guest(). Overall there may hence be room here for
simplification / reduction of redundancy.

--- unstable.orig/xen/include/xen/guest_access.h	2024-06-24 13:48:30.384279937 +0200
+++ unstable/xen/include/xen/guest_access.h	2024-06-24 13:51:35.390248096 +0200
@@ -95,16 +95,23 @@
 /* Copy sub-field of a structure to guest context via a guest handle. */
 #define copy_field_to_guest(hnd, ptr, field) ({         \
     const typeof(&(ptr)->field) _s = &(ptr)->field;     \
-    void *_d = &(hnd).p->field;                         \
-    (void)(&(hnd).p->field == _s);                      \
-    raw_copy_to_guest(_d, _s, sizeof(*_s));             \
+    unsigned long d_ = (unsigned long)(hnd).p;          \
+    /* Check that the handle is not for a const type */ \
+    void *__maybe_unused _t = (hnd).p;                  \
+    (void)((typeof_field(typeof(*(hnd).p), field) *)NULL == _s); \
+    raw_copy_to_guest((void *)(d_ + offsetof(typeof(*(hnd).p), field)), \
+                      _s, sizeof(*_s));                 \
 })
 
 /* Copy sub-field of a structure from guest context via a guest handle. */
 #define copy_field_from_guest(ptr, hnd, field) ({       \
-    const typeof(&(ptr)->field) _s = &(hnd).p->field;   \
+    unsigned long s_ = (unsigned long)(hnd).p;          \
     typeof(&(ptr)->field) _d = &(ptr)->field;           \
-    raw_copy_from_guest(_d, _s, sizeof(*_d));           \
+    (void)((typeof_field(typeof(*(hnd).p), field) *)NULL == _d); \
+    raw_copy_from_guest(_d,                             \
+                        (const void *)(s_ +             \
+                            offsetof(typeof(*(hnd).p), field)), \
+                        sizeof(*_d));                   \
 })
 
 #define copy_to_guest(hnd, ptr, nr)                     \
@@ -149,15 +156,22 @@
 
 #define __copy_field_to_guest(hnd, ptr, field) ({       \
     const typeof(&(ptr)->field) _s = &(ptr)->field;     \
-    void *_d = &(hnd).p->field;                         \
-    (void)(&(hnd).p->field == _s);                      \
-    __raw_copy_to_guest(_d, _s, sizeof(*_s));           \
+    unsigned long d_ = (unsigned long)(hnd).p;          \
+    /* Check that the handle is not for a const type */ \
+    void *__maybe_unused _t = (hnd).p;                  \
+    (void)((typeof_field(typeof(*(hnd).p), field) *)NULL == _s); \
+    __raw_copy_to_guest((void *)(d_ + offsetof(typeof(*(hnd).p), field)), \
+                        _s, sizeof(*_s));               \
 })
 
 #define __copy_field_from_guest(ptr, hnd, field) ({     \
-    const typeof(&(ptr)->field) _s = &(hnd).p->field;   \
+    unsigned long s_ = (unsigned long)(hnd).p;          \
     typeof(&(ptr)->field) _d = &(ptr)->field;           \
-    __raw_copy_from_guest(_d, _s, sizeof(*_d));         \
+    (void)((typeof_field(typeof(*(hnd).p), field) *)NULL == _d); \
+    __raw_copy_from_guest(_d,                           \
+                          (const void *)(s_ +           \
+                              offsetof(typeof(*(hnd).p), field)), \
+                          sizeof(*_d));                 \
 })
 
 #define __copy_to_guest(hnd, ptr, nr)                   \

