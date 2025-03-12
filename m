Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF222A5DB95
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 12:30:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910267.1317003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsKIQ-0004Qt-8R; Wed, 12 Mar 2025 11:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910267.1317003; Wed, 12 Mar 2025 11:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsKIQ-0004Oa-4M; Wed, 12 Mar 2025 11:30:46 +0000
Received: by outflank-mailman (input) for mailman id 910267;
 Wed, 12 Mar 2025 11:30:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ASRr=V7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsKIO-0004OS-1T
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 11:30:44 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e156a86-ff35-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 12:30:41 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so14688445e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 04:30:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c103f57sm20853602f8f.91.2025.03.12.04.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 04:30:40 -0700 (PDT)
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
X-Inumbo-ID: 6e156a86-ff35-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741779041; x=1742383841; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGz1DMEphdyF8xaVI2+OCS6p5kClWXJUSgS3elSSYYQ=;
        b=Zpr+ibmTPdAu6IoacCqzjjk2fMNUZHI4R4sBGRIuaZUYf38+p/iCnLHqBIjtKbbWDj
         5ASTEJbqCpRYJKn7gnWdr+AHr438qEn19yQZjN+2/qkvwDlrsHYH+5YSOs2ZgtbecErZ
         xywvByTDOtJWVmhQgXo1xPL6dTO+xkz3yy5bNhMJ4Mq43z3dKhrfmKoSGxYb8b67WDvk
         6DAEWQGk8Blo3j2EGVTcG19Y3d70unvG+qaO5KTEoXLMHmcngc6R+xXmrm+RqzprzPHS
         CO16KjuoM2XYviUJSEnA5jK2+RA2EbEwQ0KP6/PjiRiKunwr5EvLDIhLUazsK5zEB4o2
         +pOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741779041; x=1742383841;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGz1DMEphdyF8xaVI2+OCS6p5kClWXJUSgS3elSSYYQ=;
        b=GJtTp7SqZJbufpGrdkzbQvCz1yeopq/qv/Nq6/zJevPlYp8xfJNlLRfQXpytiMwULB
         j3u1CVqzKhpc1aYZZJwzU+svIrByqoeZfalcA0yuwQYLkcF6osnndkCdTlIVpJ1W1OHr
         1UG+ZvIyaA5cdw7EqrFwJxwIqtyV5kJhcuiOBAWmFHfDDqtqzUnpn9AhdUHJXQAEt3J0
         FjmlwPTmZDYFclIPWlEqP1k2vXbe45vUmFt2fx9vOc3dW8SFW9WGUFZVMlFPr6vYWGqu
         sWhuybciWh/kd07WdK4K6SKdqbUutmTJ8SXJAelF2UZeWlShBZmCfK8o7GojlQdTn8cj
         7g5Q==
X-Gm-Message-State: AOJu0YyemoAIwzGIcuRezUqjF3N6pD6VQl3PhQVingAF7OzdnZoRI9tA
	FMtqwqeqquq4WddYeRSDTdPdZ3QQLSrmKTlTCQG5+h7Xq5mDCMaW07A2s+OVZBk5kVK0CkrAFzY
	=
X-Gm-Gg: ASbGncswA7YmO/Xn1gmjvEdwyYNOMdp/Dsr/UV4qOR9L8Ow6d5bHBnjSzHiZVRZ/t3B
	CjlHhu9rPX4sxzS4104lrigW2uJXMiS8VSH9oZIcFVleM+UEFi3/dKWjMu1MHnBBfwfPQZMrUcG
	86zjf+dMN+CK8zxPB0xBO4J2BeLPe/stV2xj1e/pZPzH05kmH7ap9huTLkls8m86s473PlNZvJ5
	a6NcfLx1mmWYeXA6X8Gq3mfSRsJuaSHUaMcnb2g+Xf32yPMHCE+2YXYQ3lNQ70Iqf7qtkUHx91x
	tEAmCGrtZ7nHLy8IVwLUwDQKb8qEfk4BhB03PrTkCgGGXBZYAhSRbPNDLWENz2yhSG9H0fth5jT
	0UvsfswApmPU0Kk73CrUBie0DR8WULQ==
X-Google-Smtp-Source: AGHT+IEcJLZ2MEm2fZWrmDHy8NvRCIT+M0PL0hY6eT93Neqegmuz1pXz9+Or3bu67Bxwy0N/HDxzTA==
X-Received: by 2002:a05:6000:4013:b0:391:3f94:dc9e with SMTP id ffacd0b85a97d-3913f94dde0mr15301822f8f.16.1741779041148;
        Wed, 12 Mar 2025 04:30:41 -0700 (PDT)
Message-ID: <6a7391fc-4abf-4e65-8159-30f4eae8fec5@suse.com>
Date: Wed, 12 Mar 2025 12:30:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/shadow: replace p2m_is_valid() uses
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

The justification for dropping p2m_mmio_dm from p2m_is_valid() was wrong
for two of the shadow mode uses.

In _sh_propagate() we want to create special L1 entries for p2m_mmio_dm
pages. Hence we need to make sure we don't bail early for that type.

In _sh_page_fault() we want to handle p2m_mmio_dm by forwarding to
(internal or external) emulation. Pull the !p2m_is_mmio() check out of
the || expression (as otherwise it would need adding to the lhs as
well).

In both cases, p2m_is_valid() in combination with p2m_is_grant() still
doesn't cover foreign mappings. Hence use p2m_is_any_ram() plus (as
necessary) p2m_mmio_* instead.

Fixes: be59cceb2dbb ("x86/P2M: don't include MMIO_DM in p2m_is_valid()")
Reported-by: Luca Fancellu <Luca.Fancellu@arm.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This still leaves the p2m_mmio_dm vs p2m_invalid unaddressed.

While propagating #PF to the guest based on P2M type isn't quite right,
not doing so in sh_page_fault() would lead to no forward progress in the
guest anymore: If we put in place a non-present shadow PTE, another #PF
will occur right after exiting to the guest. Doing so is only okay as a
transient measure, e.g. while paging back in a paged-out page (where the
respective type is included in P2M_RAM_TYPES).

There could likely be at least one more Fixes: tag (to cover the lack of
handling foreign mappings); the one supplied is merely to indicate the
connection to the recent regression.

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -471,9 +471,7 @@ _sh_propagate(struct vcpu *v,
     /* We don't shadow PAE l3s */
     ASSERT(GUEST_PAGING_LEVELS > 3 || level != 3);
 
-    /* Check there's something for the shadows to map to */
-    if ( (!p2m_is_valid(p2mt) && !p2m_is_grant(p2mt))
-         || !gfn_valid(d, target_gfn) )
+    if ( !gfn_valid(d, target_gfn) )
     {
         *sp = shadow_l1e_empty();
         goto done;
@@ -503,6 +501,13 @@ _sh_propagate(struct vcpu *v,
         goto done;
     }
 
+    /* Check there's something for the shadows to map to */
+    if ( !p2m_is_any_ram(p2mt) && p2mt != p2m_mmio_direct )
+    {
+        *sp = shadow_l1e_empty();
+        goto done;
+    }
+
     // Must have a valid target_mfn unless this is a prefetch or an l1
     // pointing at MMIO space.  In the case of a prefetch, an invalid
     // mfn means that we can not usefully shadow anything, and so we
@@ -2366,8 +2371,8 @@ static int cf_check sh_page_fault(
     gmfn = get_gfn(d, gfn, &p2mt);
 
     if ( shadow_mode_refcounts(d) &&
-         ((!p2m_is_valid(p2mt) && !p2m_is_grant(p2mt)) ||
-          (!p2m_is_mmio(p2mt) && !mfn_valid(gmfn))) )
+         !p2m_is_mmio(p2mt) &&
+         (!p2m_is_any_ram(p2mt) || !mfn_valid(gmfn)) )
     {
         perfc_incr(shadow_fault_bail_bad_gfn);
         SHADOW_PRINTK("BAD gfn=%"SH_PRI_gfn" gmfn=%"PRI_mfn"\n",

