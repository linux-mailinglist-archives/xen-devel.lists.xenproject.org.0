Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0064FB14F36
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 16:28:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062778.1428508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uglIO-00007p-4y; Tue, 29 Jul 2025 14:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062778.1428508; Tue, 29 Jul 2025 14:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uglIO-00006L-1f; Tue, 29 Jul 2025 14:27:12 +0000
Received: by outflank-mailman (input) for mailman id 1062778;
 Tue, 29 Jul 2025 14:27:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uglIM-00006B-FC
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 14:27:10 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bec16a3-6c88-11f0-a31f-13f23c93f187;
 Tue, 29 Jul 2025 16:27:09 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b786421e36so1757772f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 07:27:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f7f6b63c4sm7093491a12.56.2025.07.29.07.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 07:27:07 -0700 (PDT)
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
X-Inumbo-ID: 1bec16a3-6c88-11f0-a31f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753799228; x=1754404028; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVfDdgM2IcEt9IGmhVSkrtLnYQ4r5H5DQM4ntH4ZNls=;
        b=aSagPPKMvX3DvQf1miLzv8WxlPNqtj9WdH5mljgXoNaiEGvftlksDwNU8NdN+weIck
         jxOHEnljT9lylY1esC3fGM+6Tl0ZJhQ1Zp1v/klP+8gGBzjUU/EZYqa1uEnRffrPPuiW
         oT9S2GyH9KDJXqvk/mz34sr+MhTtDhE/deUfHaga/uA5NZLa0Kmkz0QgtkGKlQnsvOjX
         9F9U/O/hp8dRSVa7ZrhXUV/ROF/qIEze6ryMwH00jAP8W4oiOcVqTX4iD2nvH5i8KGh6
         OZ5S4f6VD48AZxOmMpBb2hl6zMgUP6O7VqaDKO225fSXQuMQO+wkarpqm0HKy5VuLjbi
         G/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753799228; x=1754404028;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BVfDdgM2IcEt9IGmhVSkrtLnYQ4r5H5DQM4ntH4ZNls=;
        b=RU8lpnmPjSYfPat0Cod6fKYqWzZY7ECad4CI7KBwgyKpr12+UTgVNjqrK2I95TzFKY
         Jdyq7Ry+pFhHPcI8e5uyEjam3t64oy8oUokX7TgEXZ4yHnSp6i0qBPpSd2Mue7S90jM6
         2TboV1yc2mu6EKQkP+ONOPBCHPAY0Gl4DgNHejBV4ekozOyS+/gseMieDDf556z2XL1g
         tEuZsJFBPvGCdz9NH7o+ARCXzBvGoMyIqliCjzVA/lXh7qcrt8g2hV9RTzR3Kk5J9sN1
         v6GdVR+UcPhBQuqZvGOkGk+b962dD3pdZKvWSwNQOBhUmg22QGd4Lipcbi1qmZ5MqNxp
         h47Q==
X-Gm-Message-State: AOJu0YwXjmHzEpr3eQ1qLGWQCRX/nWPtY6dv1rfifiufQwKczn7eoO40
	j7H6+z560uEGxokOQ93YQeqyDaZtx6Ub+bgQMuzBDQNARGnmTx+tURCyiz6E5lCjQS4CuOxpPub
	Lxpw=
X-Gm-Gg: ASbGncsdgkG7xOZtaQKcItpC+dXADurmgf2SUge2EV0gic3Xd2+QdSBEYYFE5P9zs15
	BL4u5dprAdFNZ+JG/UShV3ntgueMOiVrTLG9kZO8C/LakgEYmg/9bPYJ72OUvyJr5z6oq6Jvw8q
	ISlhL5TAIDmJwU8+0URiszTYDjRnMthZsUs1AmIdJ7DcdhCrWFt2vh54wa2OMwgG5qPoFjGBSjy
	q7L67qO1okd711MesFOAKCK2gqoxtAswosnprq7sWK2k6jZ3olLf0+UgcBVyPik32mtBy3JJTaj
	/QFYpQnqYPE7a9KoS7PdllZPTPsULYavdm2qdaeDBAJm+K9cKPctgvcv7FLNvoYwFPb1PevkyzD
	yDRJNxpWIckGEvWkXR9cBDf1ayD7ypJ9Ya57htVG+rz9Lu5UD8WSeiRb5RyKO99rrtwQm2PPM3w
	UiKhK+I/z5OG3uu5XNdQ==
X-Google-Smtp-Source: AGHT+IFW/O/JUulGE46l+yUDxzgySCuirCxGGpiURLew6sjSrnR3ZKWYOGK+NRoHQvnm6daUePeCxw==
X-Received: by 2002:a5d:5f44:0:b0:3b5:e792:18ce with SMTP id ffacd0b85a97d-3b7767326ebmr9625544f8f.22.1753799228365;
        Tue, 29 Jul 2025 07:27:08 -0700 (PDT)
Message-ID: <fe3b486e-5122-4196-810b-38b3a58233bb@suse.com>
Date: Tue, 29 Jul 2025 16:26:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] lib: drop size parameter from sort()'s swap callback
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

This was needed only for generic_swap(), which disappeared in
8cb0341a61fa ("xen/sort: Switch to an extern inline implementation").

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -100,7 +100,7 @@ static int cmp_mmio_handler(const void *
     return 0;
 }
 
-static void swap_mmio_handler(void *_a, void *_b, size_t size)
+static void swap_mmio_handler(void *_a, void *_b)
 {
     struct mmio_handler *a = _a, *b = _b;
 
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -39,7 +39,7 @@ static int init_or_livepatch cf_check cm
 	return 0;
 }
 
-static void init_or_livepatch cf_check swap_ex(void *a, void *b, size_t size)
+static void init_or_livepatch cf_check swap_ex(void *a, void *b)
 {
 	struct exception_table_entry *l = a, *r = b, tmp;
 	long delta = b - a;
--- a/xen/common/device-tree/bootinfo-fdt.c
+++ b/xen/common/device-tree/bootinfo-fdt.c
@@ -449,7 +449,7 @@ static int __init cmp_memory_node(const
     return 0;
 }
 
-static void __init swap_memory_node(void *_a, void *_b, size_t size)
+static void __init swap_memory_node(void *_a, void *_b)
 {
     struct membank *a = _a, *b = _b;
 
--- a/xen/include/xen/sort.h
+++ b/xen/include/xen/sort.h
@@ -24,7 +24,7 @@ extern gnu_inline
 #endif
 void sort(void *base, size_t num, size_t size,
           int (*cmp)(const void *a, const void *b),
-          void (*swap)(void *a, void *b, size_t size))
+          void (*swap)(void *a, void *b))
 {
     /* pre-scale counters for performance */
     size_t i = (num / 2) * size, n = num * size, c, r;
@@ -39,7 +39,7 @@ void sort(void *base, size_t num, size_t
                 c += size;
             if ( cmp(base + r, base + c) >= 0 )
                 break;
-            swap(base + r, base + c, size);
+            swap(base + r, base + c);
         }
     }
 
@@ -47,7 +47,7 @@ void sort(void *base, size_t num, size_t
     for ( i = n; i > 0; )
     {
         i -= size;
-        swap(base, base + i, size);
+        swap(base, base + i);
         for ( r = 0; r * 2 + size < i; r = c )
         {
             c = r * 2 + size;
@@ -55,7 +55,7 @@ void sort(void *base, size_t num, size_t
                 c += size;
             if ( cmp(base + r, base + c) >= 0 )
                 break;
-            swap(base + r, base + c, size);
+            swap(base + r, base + c);
         }
     }
 }

