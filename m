Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDE796DA02
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 15:18:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791115.1200908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smCMv-0005Wl-H4; Thu, 05 Sep 2024 13:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791115.1200908; Thu, 05 Sep 2024 13:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smCMv-0005UM-Cr; Thu, 05 Sep 2024 13:17:49 +0000
Received: by outflank-mailman (input) for mailman id 791115;
 Thu, 05 Sep 2024 13:17:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1smCMt-0005UG-Hf
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 13:17:47 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d2cfdbb-6b89-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 15:17:45 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8a7cdfdd80so22380466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 06:17:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a62038c16sm135659266b.49.2024.09.05.06.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 06:17:44 -0700 (PDT)
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
X-Inumbo-ID: 3d2cfdbb-6b89-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725542265; x=1726147065; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0z5QNN3HgGxxWF40khiMFa7zt8j1sP1v1n9Jyk8LOLk=;
        b=EsxTn6nDkcQg+d0fpRJg+KJQOSFF7Gwp+51XivDGhv0yNWc/QVgSYt2bhL5uP6x1E1
         2+3mffPSVJhUBOZRvLSKmHUJUHYNmgIKJWjwHfgGudMBJ4vsNZjYDBnpfeQlbw52Be7p
         m/4vmpumGhumfyw6vEXmLoQTACLMvRptV6YSp/JAduVCXI+Iy+Jm0CHqurdOjVTbyCPn
         AibKnJKrbJAx66UFVD5JwZ0o0Y8mmcT9R6j35lUCklnLnv7xmch37fpSiwYhfaDCFfMs
         eXcTYfUnEQNz6q/ARUAwcuIRrTnDNCVBa9/jkW7YWTYQKLkehz/llzz7tio3tZ1/ivlf
         LKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725542265; x=1726147065;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0z5QNN3HgGxxWF40khiMFa7zt8j1sP1v1n9Jyk8LOLk=;
        b=pJ/s9WvC3AQWvuCYirY0y62U1tkw/2ANQrC7HykKi4SEb1ncuZeRblrDgdE5rbj5yQ
         RbcMbRvEqEtxUraXEYENk6oyY+fVWjJugTt0MklzK2tkf7Z4H3qfnnicjG94vWh4Xy3m
         CYcxxD7OAJyYC+9cIJ3boFgND4ojgdnwyyctIefTq8EtFi6HwqVwhOg8+F3TC6b/fO43
         dQjEXM7BV67M9z8vFTgHvGnFpztCrd2ZxjHj6Mc2o177soGyR1E9uQbL6KEm9I942UxP
         gqrDCNaqyVDIdWwTU6mWHYFXrZOCAWkq2UcWy2e1CeQqxUfNwAZzj4V9z/Z7n6sx2ZrC
         uofw==
X-Gm-Message-State: AOJu0YzvO1yMjiddItfLlbRV2ZWbN7ucqvwuGO07+QuqBA2k/pqkFhBs
	BMa+58+zDMFip3OGtiL4iucbqpOWeJvL5p8zeyijI/U0JqTWtxE5FfJAQJxGrQO8sGcouOrzao8
	=
X-Google-Smtp-Source: AGHT+IEz/rhWtoDPllkEvIVqCO6xlPsCCEFDPSAJM/9Ws/XIMi51T0Pf8zCx/gtr4M7BO9jG4+h2jw==
X-Received: by 2002:a17:907:36c7:b0:a7d:cf4f:180b with SMTP id a640c23a62f3a-a89d879c67emr1254239366b.32.1725542264666;
        Thu, 05 Sep 2024 06:17:44 -0700 (PDT)
Message-ID: <2354c8ca-da3e-4552-ae3b-0cfc3c416571@suse.com>
Date: Thu, 5 Sep 2024 15:17:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul/test: fix build with gas 2.43
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

Drop explicit {evex} pseudo-prefixes. New gas (validly) complains when
they're used on other than instructions. Our use was potentially ahead
of macro invocations - see simd.h's "override" macro.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/simd.c
+++ b/tools/tests/x86_emulator/simd.c
@@ -333,7 +333,7 @@ static inline vec_t movlhps(vec_t x, vec
 # if FLOAT_SIZE == 4
 #  define broadcast(x) ({ \
     vec_t t_; \
-    asm ( "%{evex%} vbroadcastss %1, %0" \
+    asm ( "vbroadcastss %1, %0" \
           : "=v" (t_) : "m" (*(float[1]){ x }) ); \
     t_; \
 })
@@ -401,14 +401,14 @@ static inline vec_t movlhps(vec_t x, vec
 #  if VEC_SIZE >= 32
 #   define broadcast(x) ({ \
     vec_t t_; \
-    asm ( "%{evex%} vbroadcastsd %1, %0" : "=v" (t_) \
+    asm ( "vbroadcastsd %1, %0" : "=v" (t_) \
           : "m" (*(double[1]){ x }) ); \
     t_; \
 })
 #  else
 #   define broadcast(x) ({ \
     vec_t t_; \
-    asm ( "%{evex%} vpbroadcastq %1, %0" \
+    asm ( "vpbroadcastq %1, %0" \
           : "=v" (t_) : "m" (*(double[1]){ x }) ); \
     t_; \
 })
@@ -601,7 +601,7 @@ static inline vec_t movlhps(vec_t x, vec
 # if INT_SIZE == 4 || UINT_SIZE == 4
 #  define broadcast(x) ({ \
     vec_t t_; \
-    asm ( "%{evex%} vpbroadcastd %1, %0" \
+    asm ( "vpbroadcastd %1, %0" \
           : "=v" (t_) : "m" (*(int[1]){ x }) ); \
     t_; \
 })
@@ -649,7 +649,7 @@ static inline vec_t movlhps(vec_t x, vec
 # elif INT_SIZE == 8 || UINT_SIZE == 8
 #  define broadcast(x) ({ \
     vec_t t_; \
-    asm ( "%{evex%} vpbroadcastq %1, %0" \
+    asm ( "vpbroadcastq %1, %0" \
           : "=v" (t_) : "m" (*(long long[1]){ x }) ); \
     t_; \
 })
@@ -716,7 +716,7 @@ static inline vec_t movlhps(vec_t x, vec
 # if INT_SIZE == 1 || UINT_SIZE == 1
 #  define broadcast(x) ({ \
     vec_t t_; \
-    asm ( "%{evex%} vpbroadcastb %1, %0" \
+    asm ( "vpbroadcastb %1, %0" \
           : "=v" (t_) : "m" (*(char[1]){ x }) ); \
     t_; \
 })
@@ -745,7 +745,7 @@ static inline vec_t movlhps(vec_t x, vec
 # elif INT_SIZE == 2 || UINT_SIZE == 2
 #  define broadcast(x) ({ \
     vec_t t_; \
-    asm ( "%{evex%} vpbroadcastw %1, %0" \
+    asm ( "vpbroadcastw %1, %0" \
           : "=v" (t_) : "m" (*(short[1]){ x }) ); \
     t_; \
 })

