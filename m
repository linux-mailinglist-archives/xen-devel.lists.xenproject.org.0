Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3C3A76B47
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 17:53:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932786.1334852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzHRF-00048I-TJ; Mon, 31 Mar 2025 15:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932786.1334852; Mon, 31 Mar 2025 15:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzHRF-00046J-Pf; Mon, 31 Mar 2025 15:52:37 +0000
Received: by outflank-mailman (input) for mailman id 932786;
 Mon, 31 Mar 2025 15:52:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzHRE-00046D-K6
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 15:52:36 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26823595-0e48-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 17:52:29 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso51620375e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 08:52:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8fbbfebasm125154385e9.10.2025.03.31.08.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 08:52:28 -0700 (PDT)
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
X-Inumbo-ID: 26823595-0e48-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743436349; x=1744041149; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8aDUtkwLW0hb9Nm2CdKBls+FPVW7o7Mh5O1fBHdlds=;
        b=TskB5zVKx8MwmbNyJgywaMsNxdjjkYn0bRS/GKX6kEk0j8Kyxus5yb3hSWc/LClusq
         +UZoRd93lZp482XaxWPIUm3ovh0ysxpaTlCuiEbdnv4U8z0I9c3fKsiHHQUPXBeQ2htl
         jwthBfrzEghI5dhrTt6UonUdjF0SNK5C/IhJk29ZCcyuuA9DjSVKPLkOr2mH1/vXykMd
         2PrAhxckdEItnxNkyfE2I7QeDHOpHIIn/s4euti/kY9OCeDN5XAFAkBh8oDdMGIh/qUr
         xmGHvfU7z8cfe5S/Ht0Quhonq617B1ZWbufhg5yJzP7k/Zpjjr0XOYkzGYj5/8z4gDCs
         0ZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743436349; x=1744041149;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W8aDUtkwLW0hb9Nm2CdKBls+FPVW7o7Mh5O1fBHdlds=;
        b=lauBTkGvSP6lmbJ0UYY5jZ1AHTn7xHCvBJN12ZUIdUEleoHaxyhUlBfmQurTbMYaHY
         ulgSLxM4h5FTLqhM7KcRcmqENL0Ye+C+UzqculcG6+c9w6jFwRO4WUlcuUOw98yhIyXG
         eTqXxKmltB3DalvkvOUrT/wrBjsLye9kA7Bx/dycF+qdllnT7YeAMfNxPg3eG2byzir7
         ZEDGe1K+zvBXrBxcqEuY5yfS3fDE4DZn4RM6EZbnWkhDI4ZZmSml8+8sJ9LvHGBhJpwm
         9eY6tq7g18fAQthXU5P1M/rCfMHF3A+RSUoHDFHeSDh7NH4LGusTzgl9flViJEFRyIFV
         tjYQ==
X-Gm-Message-State: AOJu0YwND+jZNCepRNvQn3aDXdT9Qqe69czpPPMV1fU8FpZqbnyjjJrn
	+HX55ghPJIcbUUXeUY/OqVvFTQbdUsR9ajIS//nAOxlNKWEX3pJA/cv48yqB01/r/EGHV97as98
	=
X-Gm-Gg: ASbGncvb0Z9ox+vPq65xAOlwKVhUSBnF7YkBA9pDxjuLbYeS02DXaqS+SIY7WmUyD/d
	zVQVOufl/C623Byx7NKLvSQnRK7JxIXTM4ON1tpDe5EErTao8FvydsGBLlZQ4vMsUziWFLI4ygj
	BFZMYoyJcjtDEMZGdgt5QVoHDXmeFw76DJC2p+7nQMiGBEawFJ/pcQBjjHu7GsFc5ue3V4+LY9P
	rmcqJu1eVDRE+KMsvfCcfEWbx+HW3QfcykAh8l9ZjPSZgSmM5TVw2C5GCp1zZGYJT4Zs8/dN3aD
	DvvCiqUGSRRgL1JSAtstZeAofIRVltxeo0pFWGPf3yIRLzMnkHI9shjEibjzq4DR4WMLP3XAn/g
	sKOK/6ABp+mAM2txwu9blm56B6kjQRuk3wIFXoyaO
X-Google-Smtp-Source: AGHT+IGLxKIUJvn+/C1gpUiKAjYZqBDP6ZCapBOSOJwwAHVagmHxanrp3/oVXBgPRKSkoxxfeDsd5Q==
X-Received: by 2002:a05:600c:699b:b0:43c:e305:6d50 with SMTP id 5b1f17b1804b1-43db62c034bmr89947305e9.24.1743436349103;
        Mon, 31 Mar 2025 08:52:29 -0700 (PDT)
Message-ID: <09082f8f-5c1a-43c9-9b84-19d832e0849d@suse.com>
Date: Mon, 31 Mar 2025 17:52:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: replace _BYTES_PER_LONG
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

We can now easily use __SIZEOF_LONG__ instead. For this to also work in
the test harness, move hvmloader's STR() to common-macros.h.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Quite likely libxl{,u}_internal.h's STRINGIFY() could then also be
replaced.

--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -633,11 +633,9 @@ amd_like(const struct x86_emulate_ctxt *
 #if defined(__x86_64__)
 #define _LO32 "k"          /* force 32-bit operand */
 #define _STK  "%%rsp"      /* stack pointer */
-#define _BYTES_PER_LONG "8"
 #elif defined(__i386__)
 #define _LO32 ""           /* force 32-bit operand */
 #define _STK  "%%esp"      /* stack pointer */
-#define _BYTES_PER_LONG "4"
 #endif
 
 /* Before executing instruction: restore necessary bits in EFLAGS. */
@@ -651,7 +649,7 @@ amd_like(const struct x86_emulate_ctxt *
 "pushf; "                                                       \
 "notl %"_LO32 _tmp"; "                                          \
 "andl %"_LO32 _tmp",("_STK"); "                                 \
-"andl %"_LO32 _tmp",2*"_BYTES_PER_LONG"("_STK"); "              \
+"andl %"_LO32 _tmp", 2 * " STR(__SIZEOF_LONG__) "("_STK"); "    \
 "pop  %"_tmp"; "                                                \
 "orl  %"_LO32 _tmp",("_STK"); "                                 \
 "popf; "                                                        \
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -21,9 +21,6 @@ enum {
 /* Cause xs_wire.h to give us xsd_errors[]. */
 #define EINVAL EINVAL
 
-#define __STR(...) #__VA_ARGS__
-#define STR(...) __STR(__VA_ARGS__)
-
 /* GDT selector values. */
 #define SEL_CODE16          0x0008
 #define SEL_DATA16          0x0010
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -88,6 +88,9 @@
     (type *)((char *)mptr__ - offsetof(type, member));  \
 })
 
+#define __STR(...) #__VA_ARGS__
+#define STR(...) __STR(__VA_ARGS__)
+
 #define __AC(X, Y)   (X ## Y)
 #define _AC(X, Y)    __AC(X, Y)
 

