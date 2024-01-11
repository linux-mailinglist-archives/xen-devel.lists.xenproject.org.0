Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D91D182AA07
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 10:01:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666035.1036456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNqw8-00078O-Cd; Thu, 11 Jan 2024 09:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666035.1036456; Thu, 11 Jan 2024 09:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNqw8-00076R-98; Thu, 11 Jan 2024 09:01:16 +0000
Received: by outflank-mailman (input) for mailman id 666035;
 Thu, 11 Jan 2024 09:01:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNqw7-0006N6-12
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 09:01:15 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f90ff9e1-b05f-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 10:01:14 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3374eb61cbcso4575808f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 01:01:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h6-20020adf9cc6000000b003375d8b0460sm643239wre.1.2024.01.11.01.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 01:01:13 -0800 (PST)
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
X-Inumbo-ID: f90ff9e1-b05f-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704963674; x=1705568474; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QNpyXAGCsk8LjmM4N4uqf0ywUr9U5lVsuSLaYtpMT1I=;
        b=AKmQ0VBwyZ/zyZKEtdYuOee+LXHUBmnkxgl+qADVHkkFJived8Mh9AZpbBS8vXme0d
         Rej3RXGQUtTKj1rLkvHS5ZzocOwksgjQxiTfhdtZynoRZsDHeO2SpIfXrmlxbGoyMSoa
         Xhsfa9Uayz46HuN7XAH9RJFB4O4LGB/U3dewzPhYLyeVLWxdRWOUYQedTqPyb9Co+Ewu
         QGDOxTbSy9lUWPMgPh827V/MBecB+09QLavyngWCugUoTHhQ9/ZdZWIzAsJYGDEx63su
         y03OhucrFfjcPVycf8J4WScLEMF+tVh53AP2M2nVS9BWfRQNerS48uUCrUAfGyUpNqnd
         rZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704963674; x=1705568474;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNpyXAGCsk8LjmM4N4uqf0ywUr9U5lVsuSLaYtpMT1I=;
        b=GIoGTBkWE3yfqHib36aSMAwQ70v99FaEknQqu3PY6gjgNLfk7F4CkleGuO8o3saqkr
         5qX2/e9+kram+eJfB8NVhYE71bWCGA/KV2itDNLif/yaHfoQZcLysu/l6i3ERsILFRDp
         zKo8juRbfNwwnmUnW+Czt3Ey3j/t5esEMk1Yr9CpXzneFruFviqPj88otDV/x/zjv7ec
         YLVGtcIAnPBHf1EaRB0BzvpIO58tg33xrPsH3LRr6XalucL44K5B8EgCmVCkh7RzOqJ8
         dri5+/Lldrgf95/XeOGlrZpKngU4FY13xaebrVwMAneMg3uW7tDxZp9IkkshZ8+yqGXJ
         4hug==
X-Gm-Message-State: AOJu0Yy6ZvSlvhZgUY/BNHXAwLOYe5b6P6hUjx+at/LodGHCghFo1kZ5
	jtTHVsivc4PuF8JTPq6F20vUTUwXNI7E7EQdLeekFObDfQ==
X-Google-Smtp-Source: AGHT+IEg11sMa37R39NIji2QSJCwoFtz/NnispEcGmpEG7qxuoetx12dHuSiCVduOJEfaVMnvrZCZA==
X-Received: by 2002:a05:6000:156d:b0:337:5557:acf5 with SMTP id 13-20020a056000156d00b003375557acf5mr482845wrz.106.1704963673814;
        Thu, 11 Jan 2024 01:01:13 -0800 (PST)
Message-ID: <9263a08c-8301-4c2d-a4da-801e203adb57@suse.com>
Date: Thu, 11 Jan 2024 10:01:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 5/8] x86: introduce x86_seg_sys
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com>
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
In-Reply-To: <9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

To represent the USER-MSR bitmap access, a new segment type needs
introducing, behaving like x86_seg_none in terms of address treatment,
but behaving like a system segment for page walk purposes (implicit
supervisor-mode access).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This feels a little fragile: Of course I did look through uses of the
enumerators, and I didn't find further places which would need
adjustment, but I'm not really sure I didn't miss any place.
---
v3: New.

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -603,6 +603,7 @@ static int read(
     default:
         if ( !is_x86_user_segment(seg) )
             return X86EMUL_UNHANDLEABLE;
+    case x86_seg_sys:
     case x86_seg_none:
         bytes_read += bytes;
         break;
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -837,7 +837,7 @@ static int hvmemul_virtual_to_linear(
     int okay;
     unsigned long reps = 1;
 
-    if ( seg == x86_seg_none )
+    if ( seg == x86_seg_none || seg == x86_seg_sys )
     {
         *linear = offset;
         return X86EMUL_OKAY;
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2578,7 +2578,7 @@ bool hvm_vcpu_virtual_to_linear(
      * It is expected that the access rights of reg are suitable for seg (and
      * that this is enforced at the point that seg is loaded).
      */
-    ASSERT(seg < x86_seg_none);
+    ASSERT(seg < x86_seg_sys);
 
     /* However, check that insn fetches only ever specify CS. */
     ASSERT(access_type != hvm_access_insn_fetch || seg == x86_seg_cs);
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -749,6 +749,7 @@ static void cf_check svm_set_segment_reg
         vmcb->ldtr = *reg;
         break;
 
+    case x86_seg_sys:
     case x86_seg_none:
         ASSERT_UNREACHABLE();
         break;
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -43,7 +43,8 @@ enum x86_segment {
     x86_seg_ldtr,
     x86_seg_gdtr,
     x86_seg_idtr,
-    /* No Segment: For accesses which are already linear. */
+    /* No Segment: For (system/normal) accesses which are already linear. */
+    x86_seg_sys,
     x86_seg_none
 };
 


