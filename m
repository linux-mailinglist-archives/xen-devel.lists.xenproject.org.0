Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7826DB139D7
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 13:26:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061341.1426894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugLyv-00066W-5l; Mon, 28 Jul 2025 11:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061341.1426894; Mon, 28 Jul 2025 11:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugLyv-00064Z-2P; Mon, 28 Jul 2025 11:25:25 +0000
Received: by outflank-mailman (input) for mailman id 1061341;
 Mon, 28 Jul 2025 11:25:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugLyt-00064T-VC
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 11:25:23 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c493a7f-6ba5-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 13:25:21 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b7886bee77so918442f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 04:25:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76408cf75dfsm4954374b3a.50.2025.07.28.04.25.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 04:25:20 -0700 (PDT)
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
X-Inumbo-ID: 8c493a7f-6ba5-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753701921; x=1754306721; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Iq1fRZ0po/R3onCIRKQ1fPWiawPfIQLk+2wIsbgGwA=;
        b=ULUuSCtYFBSmIrSXSjzkEXpmI6kTbkf3lYDlkTSJEc9A8QXWk2/Lh8A8jDa8GihMLC
         ozU87ep1fR7aqnPYY0OyzCIS0z/APxY/02Dg5Tr0a4eTGcMBSd5foyqrXdr594AbkHIo
         lAvCehtchNxqJ4OmKNGpQ6Rz5h0Lvy9nJWZV6FKgnhfbc4AF925xLpJ6Y1P+O5YdxKrW
         9hd4dRiKv9zl4/cFfQH/KssiVYVZJHfDndr5Ne3r9yj08t4AMBTbuVnOgL4JymttLFF8
         DL/vEk1wBqHlscH/iUjdgefGnJxKO6wDAgUVPJRxozLQFUJ47kb4lXxSLrGi8+KkNV94
         RVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753701921; x=1754306721;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Iq1fRZ0po/R3onCIRKQ1fPWiawPfIQLk+2wIsbgGwA=;
        b=EdOgMOjGvNEUA9MFk3ZSUOGB9ON0rOty7KofcAZdHVcYs9czRbV0O9DQh+AJ5VTJoh
         kBPZs1Ts0SPovDbfhhTV6dbhXAbVP0cn0/wR2kVKsUmI0HJk7SITAB7+orPFo67bXmpM
         c+rEq0XdbuPiX054uCORcbYsaLCRHPS9B4khAAeXSiqMz2NJNvtRkI8KnR9yYuMT4eUk
         vf0uCbNgJWt7Do2npZ0KvopvEpzisG6lA6gUyvqzbqHk87YKlEcdoxlvFGuPadWnorUz
         OiIkEXn5bmKnf55owsA9MFKImqGGoDNMRaUuq9eGHVwya05Igi6uPoVlABW30EHwdZyd
         0uRQ==
X-Gm-Message-State: AOJu0Yws+cX9GIxxYyGRmAWfopQxT1JVe4goRvs3N5FrHAii+HsqdxAq
	j0DtEQXvYwAKHWz0p4zbGvdt/qqdopWUtt74g4H4d6lSJh8ab37Qf1G15bllTpin8xEdqZ1C7Rl
	BuMM=
X-Gm-Gg: ASbGncvphEH5/svG5T+mPRYfEzYFKbYsJV+JTo+mdkHZuajfFFLFHpdWbVWPYzOrhcD
	R/lJ+lrOsE3hIotShMjUUg24hdglRGxRr5ppMz+6fdu+5XF29MC9O/MasJ/fgHnt3Nu5uXZJSw+
	PT5GeNwYw0DZgiBVFbPKIiXCeh7nR4zNUXIOGmtddumJ/WRaSh7O/SxM/WE//6WaYkyCg39Jau6
	hZyMyGLnXhe2kSDSqTkQmq8Fw2faOfMM48MUFjdkgHKXwQXfXQWKQbpO0gnhesVoWzslhziQekT
	Xj6ZYI0hHSWqJrQ3/pEPtnjMF0Yn5xRW7VnejmWhUeI0IvujlnTP56L/+rEQeMdEfkyumZ+/JD1
	ke40go+R9E40833HrTqSHjd5mlHcNwZumqLsygmaYqxvGJ9bqK+QZVlEuNH1lVwabeIP1NiublD
	+0C4Q6Vv8=
X-Google-Smtp-Source: AGHT+IEbsD2psx066NVDTxJf9tu2uSHVSdaAoi/prgKduwi3ATueNpvKsFet7m8DDMCX5v3HsdEnlQ==
X-Received: by 2002:a5d:5d0e:0:b0:3b7:8473:31c3 with SMTP id ffacd0b85a97d-3b784733291mr3481929f8f.9.1753701920921;
        Mon, 28 Jul 2025 04:25:20 -0700 (PDT)
Message-ID: <f5a056ab-006b-4bb0-ae17-528a879f661f@suse.com>
Date: Mon, 28 Jul 2025 13:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86/HVM: fully switch emulate.c to use xvmalloc_array()
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

Use the more "modern" forms consistently, thus doing away with
effectively open-coding xmalloc_array() at the same time. While there
is a difference in generated code, as xmalloc_bytes() forces
SMP_CACHE_BYTES alignment, if code really cared about such higher than
default alignment, it should request so explicitly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Use xvmalloc_array().

--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -17,6 +17,7 @@
 #include <xen/paging.h>
 #include <xen/trace.h>
 #include <xen/vm_event.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/altp2m.h>
 #include <asm/event.h>
@@ -2050,7 +2051,7 @@ static int cf_check hvmemul_rep_movs(
         dgpa -= bytes - bytes_per_rep;
 
     /* Allocate temporary buffer. Fall back to slow emulation if this fails. */
-    buf = xmalloc_bytes(bytes);
+    buf = xvmalloc_array(char, bytes);
     if ( buf == NULL )
         return X86EMUL_UNHANDLEABLE;
 
@@ -2060,7 +2061,7 @@ static int cf_check hvmemul_rep_movs(
 
         if ( rc != X86EMUL_OKAY)
         {
-            xfree(buf);
+            xvfree(buf);
             return rc;
         }
 
@@ -2082,7 +2083,7 @@ static int cf_check hvmemul_rep_movs(
     if ( rc == HVMTRANS_okay )
         rc = hvm_copy_to_guest_phys(dgpa, buf, bytes, curr);
 
-    xfree(buf);
+    xvfree(buf);
 
     switch ( rc )
     {
@@ -2162,7 +2163,7 @@ static int cf_check hvmemul_rep_stos(
         for ( ; ; )
         {
             bytes = *reps * bytes_per_rep;
-            buf = xmalloc_bytes(bytes);
+            buf = xvmalloc_array(char, bytes);
             if ( buf || *reps <= 1 )
                 break;
             *reps >>= 1;
@@ -2191,7 +2192,7 @@ static int cf_check hvmemul_rep_stos(
 
             default:
                 ASSERT_UNREACHABLE();
-                xfree(buf);
+                xvfree(buf);
                 return X86EMUL_UNHANDLEABLE;
             }
 
@@ -2202,7 +2203,7 @@ static int cf_check hvmemul_rep_stos(
         rc = hvm_copy_to_guest_phys(gpa, buf, bytes, curr);
 
         if ( buf != p_data )
-            xfree(buf);
+            xvfree(buf);
 
         switch ( rc )
         {

