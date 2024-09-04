Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C6396BC4E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 14:29:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790202.1199922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slp8L-00072t-VU; Wed, 04 Sep 2024 12:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790202.1199922; Wed, 04 Sep 2024 12:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slp8L-000710-S4; Wed, 04 Sep 2024 12:29:13 +0000
Received: by outflank-mailman (input) for mailman id 790202;
 Wed, 04 Sep 2024 12:29:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slp8K-0005XG-Ke
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 12:29:12 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49b41760-6ab9-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 14:29:11 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-533de5a88f8so6707382e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 05:29:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898900e95dsm805156966b.54.2024.09.04.05.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 05:29:10 -0700 (PDT)
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
X-Inumbo-ID: 49b41760-6ab9-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725452950; x=1726057750; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WqSiVfSnQTZgKA0BdgKdxzFsODpy0o2S9lm9pdR2p8o=;
        b=Y2/AiJ0izKt3IdtmYS6tiPkgsX+oNpSE6QYOMeYNVxyP8NbRG/b/WFLAVPRoSDjCDp
         Fsi/t+8Q/gtCUDM7ek0UHWSUqf0/nxKKXC4PWfQdWKJi7kmmpmohJ4CqmSFvzrYh8Wlu
         Jw4Xl4VW1zaPVzRtUHTeENOMm9ZlPG9e4SNsKny8lQ9jdcUmWkXbhUNfPeOsTB24UN9I
         44qzVUP6T/jOakyiC5eE7/bSN8VsI4FCCu0hXXFLym/EntnrVjM1tWZl03jRHM0EXVpI
         gNuneBO1yAZ5CwA5mHmugvxZF2oqSUijg+2FMdG7YQWNcuMXZUnh9xDOaaEnt46O1pX4
         tThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725452950; x=1726057750;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqSiVfSnQTZgKA0BdgKdxzFsODpy0o2S9lm9pdR2p8o=;
        b=jrEQ9ZeovoKIuVbxj9Ncgn1oOWJDCi+pS6x99IJrVia7DQShrT/rQa5aqhz/Uvh/5o
         j4PE7tkiDv70Ni861y6amxQgg2TgS8Dk4//5NtXOFyqde/1+PS6qxCutTAbel0czrgdi
         GwMNws5Kke+zRaQcTQ0fF3Pv/vxHp2IWNEyIa+s1llbcUUpkDs/O9pA0o4bcYtHarnvo
         cKqJS9BSPBKkMc1u1D0gv2pyM5T2j9I8r04zfu2iVkwkyBiON5CVCuQAwznwH3OTPiTA
         kCzKtmc58dkgqnoBIlpHkk2aLYV6tPxkQTHa/saGkGSAKfrRK2kYLtNIE6fvKxFrL8oi
         Gmzg==
X-Gm-Message-State: AOJu0YwwMjPuFgy+7f2j/fmbM4vmGgaAJqGLx2453hH0lOmlKTn8+XIc
	q154zghAit6VALxHLlDs+ttVoStY/wzzH1H+mF/9y6PIoGJ5q3Em9yCfLhbUq3pJwV+EdccedMo
	=
X-Google-Smtp-Source: AGHT+IGcQypvUzZY0qD+rqgZE1l2nBmkA2nzqgFoPlK0qUgLHgB3pjhClaOqbf6Yo/KhrgNnsGAwuQ==
X-Received: by 2002:a05:6512:118f:b0:530:c2f0:4a98 with SMTP id 2adb3069b0e04-53546ba900amr10711085e87.51.1725452950331;
        Wed, 04 Sep 2024 05:29:10 -0700 (PDT)
Message-ID: <2848ec72-6e26-4331-a218-0e3e8f16572f@suse.com>
Date: Wed, 4 Sep 2024 14:29:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 4/7] x86: introduce x86_seg_sys
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <0b9a0ae8-a39c-49d8-b4e7-f2a463128058@suse.com>
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
In-Reply-To: <0b9a0ae8-a39c-49d8-b4e7-f2a463128058@suse.com>
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
@@ -593,6 +593,7 @@ static int read(
     default:
         if ( !is_x86_user_segment(seg) )
             return X86EMUL_UNHANDLEABLE;
+    case x86_seg_sys:
     case x86_seg_none:
         bytes_read += bytes;
         break;
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -840,7 +840,7 @@ static int hvmemul_virtual_to_linear(
     int okay;
     unsigned long reps = 1;
 
-    if ( seg == x86_seg_none )
+    if ( seg == x86_seg_none || seg == x86_seg_sys )
     {
         *linear = offset;
         return X86EMUL_OKAY;
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2601,7 +2601,7 @@ bool hvm_vcpu_virtual_to_linear(
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
 


