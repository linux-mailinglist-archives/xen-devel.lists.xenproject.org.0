Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFBFAF152E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 14:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031006.1404681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwNw-0000IY-4z; Wed, 02 Jul 2025 12:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031006.1404681; Wed, 02 Jul 2025 12:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwNw-0000G7-1q; Wed, 02 Jul 2025 12:16:20 +0000
Received: by outflank-mailman (input) for mailman id 1031006;
 Wed, 02 Jul 2025 12:16:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWwNu-0000Fz-Ub
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 12:16:18 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aa685eb-573e-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 14:16:17 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-453066fad06so45780015e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 05:16:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-318c13a509asm14558195a91.20.2025.07.02.05.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 05:16:15 -0700 (PDT)
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
X-Inumbo-ID: 5aa685eb-573e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751458576; x=1752063376; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PRY+zNrdOJssR5FV1ZBdSspoE8MCt50jDjF3DFcSHMs=;
        b=BSTV8eNDcj3Z/upncgOfn8cRwNVj/Hvz0B+54X8elN+ktse8ATvF+Ii2vZsl5gtA1o
         4Q+Ez1OEFejGdlvoeYgbA5Udi1r40Jku/H19KeBmYbz5NzcODviEqLUvkszoyAAzTQBe
         8q2nUZvjIkJFhLQInBe96PQhDA7kr1eLm5j/rd6wVl72w8j3tJZgz+3OcQ6NWLyFuTmb
         CmnmQvHW2aITWm0gCr8EEAX8dFloJL8dZ+bROLLq1MIpq9QXx0XuasGZAFP7kvNv3/Xh
         Cg0NY4S5NCvd3iLopGG8tZn4rkLLT4ImgCkFsLhP+MoyDr84PPgRcBM59PqpapgD4l38
         Z8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751458576; x=1752063376;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRY+zNrdOJssR5FV1ZBdSspoE8MCt50jDjF3DFcSHMs=;
        b=UXvgaQeDEgKuP51RFkExtrRHTFLZnAk4lF86odu7v30mWL6ZuAGrTeKi83X5UhI5UW
         dlPbRTNQKRSjaRyy6ggJtnDRwuFkQoYqUdFiZq2kph/C/j+nhrr1R/arHzvxckXHHNVb
         f2kdK7c3gFwTIOornEzgEhvRHappsRqX0lLOtBBO15rttDsfvUPCDyTHQrbRjWKO0s/f
         3QkSayOak8osy9eXRgXg4RIMz2hHS5k58j+IirTzZgGm5ojbXdyBehTu6V2tGSwGMBpP
         aZlWAy1D73YxID5dMyX285Z5yTZtQThKtuCO4JUr9kPotvybawleHpERTt2Y4RWSvS+O
         jrhQ==
X-Gm-Message-State: AOJu0YxHxSgqORrC1suehLDwv3zLymxKZK6PAd6UFj2aiRH3mDxLrRLh
	2/3WexyEnvnazhkr1YV3EX0NiuJanU09aiD1vtcvV1mVmsQmLyuzjj0P1I6gnakFvmIjWp0Vawz
	zQCk=
X-Gm-Gg: ASbGncsMPONkepYTyL9qi7CqVt5w7l30Fx9057XHSFhWR3lrNMPsGAk2ZGaIUSgJT05
	krgmMC6bHk915e8qlRECCas2N18Nq/Cx9HKBcGZbfSyHTDvfR+K4VJZv7Zcg3309EBLlyr6mm3a
	8XFDu3fod2+3wJJAnLrzZ77yEHi0VtRRwmdA2hff/j9bl1ePcdCAC0sLi46nVYtiws3y9dc6sF6
	zxJ/asiFOzzKDpRizQk3ocICO2F92sLQ0HliLSLpnoLZNOJqeZF5fgaQVOuaY6t3FWB/ZUko6Ea
	tdObRXK/epHiAwl+AZoNQLPP4EsxTaPR7ushn4CKnZKT/wSBTngPed+74tfjC7gSsbpNBolSXiZ
	QWSzkkDuriLbsBjEDYMsCpJJdAcJof7OXGjZQHYcQZWfpt9s=
X-Google-Smtp-Source: AGHT+IGc2CgXwlHd+Bez7F409OcAi+ZlHzorV8utjIrmquyoqLxYgNFxJCtIehW6tffwQFy1Slbtuw==
X-Received: by 2002:a05:6000:2809:b0:3a5:232c:6976 with SMTP id ffacd0b85a97d-3b200865de2mr1636662f8f.44.1751458576196;
        Wed, 02 Jul 2025 05:16:16 -0700 (PDT)
Message-ID: <a2086fdc-d5c2-4ad0-8052-8e1b74bfd09f@suse.com>
Date: Wed, 2 Jul 2025 14:16:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7 2/7] x86/alternatives: serialize after (self-)modifying
 code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <0b57c6f0-9fd0-4f8a-93f8-dc494a1e952c@suse.com>
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
In-Reply-To: <0b57c6f0-9fd0-4f8a-93f8-dc494a1e952c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While supposedly safe via enforcing a control flow change when modifying
already prefetched code, it may not really be. Afaik a request is
pending to drop the first of the two options in the SDM's "Handling
Self- and Cross-Modifying Code" section (still present there as of
version 087). Insert a serializing instruction there, and remove the
"noinline" in exchange.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Strictly speaking with LIVEPATCH=n the if() (but not its body) is dead
code. Adding IS_ENABLED(CONFIG_LIVEPATCH) would feel quite a bit like
extra clutter, though. Plus Misra rule 2.2 is globally deviated anyway.
---
v6: Split off. Extend commentary. Load deterministic value into CR2.
    Drop "noinline".

--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -194,13 +194,18 @@ void *place_ret(void *ptr)
  * You should run this with interrupts disabled or on code that is not
  * executing.
  *
- * "noinline" to cause control flow change and thus invalidate I$ and
- * cause refetch after modification.
+ * While the SDM continues to suggest using "noinline" would be sufficient, it
+ * may not be, e.g. due to errata.  Issue a serializing insn afterwards, unless
+ * this is for live-patching, where we modify code before it goes live.  Issue
+ * a serializing insn which is unlikely to be intercepted by a hypervisor, in
+ * case we run virtualized ourselves.
  */
-static void init_or_livepatch noinline
+static void init_or_livepatch
 text_poke(void *addr, const void *opcode, size_t len)
 {
     memcpy(addr, opcode, len);
+    if ( system_state < SYS_STATE_active )
+        asm volatile ( "mov %0, %%cr2" :: "r" (0L) : "memory" );
 }
 
 extern void *const __initdata_cf_clobber_start[];


