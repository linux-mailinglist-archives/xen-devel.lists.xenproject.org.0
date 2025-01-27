Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A9FA1D43D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 11:15:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877590.1287727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcM9L-0002Cy-H7; Mon, 27 Jan 2025 10:15:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877590.1287727; Mon, 27 Jan 2025 10:15:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcM9L-0002BW-ER; Mon, 27 Jan 2025 10:15:23 +0000
Received: by outflank-mailman (input) for mailman id 877590;
 Mon, 27 Jan 2025 10:15:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcM9J-0002BM-VF
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 10:15:21 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d1f1bd9-dc97-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 11:15:20 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5dc149e14fcso6181059a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 02:15:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc186f1c4bsm5209763a12.81.2025.01.27.02.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 02:15:19 -0800 (PST)
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
X-Inumbo-ID: 9d1f1bd9-dc97-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737972920; x=1738577720; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nGaowH9dYFvSfPuZ8QS4xHL6+BSe9sQpqO6jV1ExWKE=;
        b=Rv2WZNnAK2TuF6rtOqqA/NqlNsciJqLqKHZNUZpPVsZxfN1ziKAny0aj2gLZmeN+iu
         evjkEtdoAv4BhOa5qay+ucwB4BYjVHIS1zGmQnsusMmpj9kwgBXKVKW6b+MavBYlfuFg
         E1o85DF4k3LbyMiDAECpn8wqOYE2sW5L47zb3318Q7KjMleaAHPGbvEh32rZp7JPZYet
         t0tWdpNctVSrrDsQ42TuZnjTrHYJGRTtYj1OX7D3tOKB2AHWlWPlZACu6uA1S7VMtBut
         hhwjxioYQGrHqSFio+l7cQ/q2Vy2nyzCKhkdo7yo7kBKITcPR+Tutyv5NqdK0THPGKU1
         RDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737972920; x=1738577720;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nGaowH9dYFvSfPuZ8QS4xHL6+BSe9sQpqO6jV1ExWKE=;
        b=tis3QBRtBwZh2Afz+WzJ0BWNUpgTFMZ1Kb7jdemSPVGfS3fVmayT12Jba4xb1Ia7fI
         xb4yWMLyacJofeHUY/wO7j9+3ySKjg65fhM6wQugs0VPAb9NCvDq9a+lP/KKt1rtkUAV
         9uwRv9/hMztgA9FAzx91SAMZ95sUVtgdPs0weY4YfSM6K+nFvW3OMvjaTNdnEvyHxxqQ
         o0BEWj4RhWNOq14yMFcqyU9Ha1MZU9EXHhlTQ/cOW5OFZVu2UcnoRUhESqMxrByQOO4K
         pGYaCvHJkn+e4Ft9lfcm5DjhACUQJ8tyKR2wrLyA/q/zcQjQjLPx8MKjaLxDcWsPTXTb
         wqIw==
X-Gm-Message-State: AOJu0YwJOh707q06B7TD5nGOojIkmkhize9vMNeK6Wrnc6P0229PGJBe
	Upd3ASBp/Z5G36i/lrLThg/b14Mx7JINfgABEgFWf71F94BoxvkAi8NRHR+gH09+bKjgATmLqRg
	=
X-Gm-Gg: ASbGncvOna8fZxlvZKBeF0WA3d63Re1CDkubdBxyz5tVY22I4hlRldCSryYJagbYXRe
	jeIlP2bT9ZqfMUubtmVsB96xTIqsV+KF4B/qtJmrAbIr+Z8wWx74hMUYnVNthqewb1of2m+Xu9W
	eSEAehhGpHuQVD00AvN0y/VlBk56Mh72wmc5Ads/3bpJ7aDgUFNxjHVVR9ZmVse+lfIM9gnn/xp
	85BCwavdJSI2uM5XlAcsOiQ9otd4KaZhARcMaNeaWuGTtLGK7AOGUa0pi/1zxQKxSW7sTRzgikW
	eKe/eZ2w5xw+RHeh0PzQwi05jNSBkLEQZ1DDdux7hdCbZ1n4HdU3k/G5cBBBXndLMQ==
X-Google-Smtp-Source: AGHT+IHCaFaM2/nTC+OOFqL0d4WI6Cy5oEUGr1f6rlJjVZ9KQM092jO166tod8walMcATMC1mEomYQ==
X-Received: by 2002:a05:6402:278f:b0:5d9:b50e:7008 with SMTP id 4fb4d7f45d1cf-5db7d2f8c49mr33710087a12.8.1737972920162;
        Mon, 27 Jan 2025 02:15:20 -0800 (PST)
Message-ID: <a615a96e-95d2-442f-b57d-0bb51142c977@suse.com>
Date: Mon, 27 Jan 2025 11:15:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.20] x86/PV: further harden guest memory accesses against
 speculative abuse
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The original implementation has two issues: For one it doesn't preserve
non-canonical-ness of inputs in the range 0x8000000000000000 through
0x80007fffffffffff. Bogus guest pointers in that range would not cause a
(#GP) fault upon access, when they should.

And then there is an AMD-specific aspect, where only the low 48 bits of
an address are used for speculative execution; the architecturally
mandated #GP for non-canonical addresses would be raised at a later
execution stage. Therefore to prevent Xen controlled data to make it
into any of the caches in a guest controllable manner, we need to
additionally ensure that for non-canonical inputs bit 47 would be clear.

See the code comment for how addressing both is being achieved.

Fixes: 4dc181599142 ("x86/PV: harden guest memory accesses against speculative abuse")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: When scratch2 isn't %r8...%r15, the MOV, CMOVNB, and XOR will have
     unnecessary REX prefixes emitted, as users of the macro pass in 64-
     bit registers. Similar to what was done to be able to use SETcc (in
     the earlier alternative code sequence), we could derive %e.. from
     %r.. to shrink code size some; there are a few dozen instances of
     this code, after all. (An alternative, requiring to touch the use
     sites, would be to constrain the scratch registers to rAX...rDI and
     pass in only the last two characters of the names [e.g. "di", i.e.
     also without the leading %]. That would make it straightforward to
     use both %r.. and %e.. at the same time.)
---
v2: Drop the non-RCR alternative.

--- a/xen/arch/x86/include/asm/asm-defns.h
+++ b/xen/arch/x86/include/asm/asm-defns.h
@@ -1,3 +1,5 @@
+#include <asm/page-bits.h>
+
 #ifndef HAVE_AS_CLAC_STAC
 .macro clac
     .byte 0x0f, 0x01, 0xca
@@ -65,17 +67,36 @@
 .macro guest_access_mask_ptr ptr:req, scratch1:req, scratch2:req
 #if defined(CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS)
     /*
-     * Here we want
-     *
-     * ptr &= ~0ull >> (ptr < HYPERVISOR_VIRT_END);
-     *
+     * Here we want to adjust \ptr such that
+     * - if it's within Xen range, it becomes non-canonical,
+     * - otherwise if it's (non-)canonical on input, it retains that property,
+     * - if the result is non-canonical, bit 47 is clear (to avoid
+     *   potentially populating the cache with Xen data),
      * but guaranteed without any conditional branches (hence in assembly).
+     *
+     * To achieve this we determine which bit to forcibly clear: Either bit 47
+     * (in case the address is below HYPERVISOR_VIRT_END) or bit 63.  Further
+     * we determine whether for forcably set bit 63: In case we first cleared
+     * it, we'll merely restore the original address.  In case we ended up
+     * clearing bit 47 (i.e. the address was either non-canonical or within Xen
+     * range), setting the bit will yield a guaranteed non-canonical address.
+     * If we didn't clear a bit, we also won't set one: The address was in the
+     * low half of address space in that case with bit 47 already clear.  The
+     * address can thus be left unchanged, whether canonical or not.
      */
     mov $(HYPERVISOR_VIRT_END - 1), \scratch1
-    mov $~0, \scratch2
+    mov $(VADDR_BITS - 1), \scratch2
     cmp \ptr, \scratch1
+    /*
+     * Not needed: The value we have in \scratch1 will be truncated to 6 bits,
+     * thus yielding the value we need.
+    mov $63, \scratch1
+     */
+    cmovnb \scratch2, \scratch1
+    xor \scratch2, \scratch2
+    btr \scratch1, \ptr
     rcr $1, \scratch2
-    and \scratch2, \ptr
+    or \scratch2, \ptr
 #elif defined(CONFIG_DEBUG) && defined(CONFIG_PV)
     xor $~\@, \scratch1
     xor $~\@, \scratch2

