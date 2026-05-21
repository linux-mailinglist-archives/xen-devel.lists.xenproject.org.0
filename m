Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Gc6FKIhD2rPGAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:15:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4895A81A9
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:15:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315348.1585152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ57X-0000dU-Cb; Thu, 21 May 2026 15:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315348.1585152; Thu, 21 May 2026 15:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ57X-0000bu-9l; Thu, 21 May 2026 15:15:35 +0000
Received: by outflank-mailman (input) for mailman id 1315348;
 Thu, 21 May 2026 15:15:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQ57V-0000bk-Rh
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:15:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ57V-0034aG-8K
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:15:33 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f2177-e002-0a2a0a5209dd-0a2a45098682-46
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:15:33 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f2194-2497-0a2a45090019-d155dd2ab115-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:15:32 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-45ea19f412aso781019f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 08:15:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa756d61sm3580079f8f.0.2026.05.21.08.15.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 08:15:31 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779376532; x=1779981332; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zvnwyGfWO+aykVDdTfFo9jZYML1o5FaJFSxKnq9Hzn4=;
        b=aBn1uyVoPp4b2+wqaKqJOveD4ILEPhHKNlOBYOXh24Kr7O9ouKUWeV8qxAIbLT/rm5
         GLMiYGhbF4lD8BAnPVNMsdDinCyLTGZNu0xuBmZLGgxb7HsM0KYxceadpvoaZ08UjHt6
         yiKnkvVhYsMkqvh4RYtV3cS12kkwYPRS18s1F3SHDoVtxG/ENJ2xEFpXJ67UvcfJu2ua
         HazSs5lqI1ret2YIDb+MdLEfnI7kF61+nq3eWOPa88Joi4i9NrJP5m9xBUvv/k6KmPJ2
         8txUxQZUCmA+XlStu4lSSCDNDRt2OkxRd5tdNKHomYQNAzGDWjv3nNfwMXjcinuq1HQm
         EKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779376532; x=1779981332;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvnwyGfWO+aykVDdTfFo9jZYML1o5FaJFSxKnq9Hzn4=;
        b=SPQF52GUCbZHMBmVW3ZWXINbADH5cqHnvxcH6yQ6HQ0DdHdMMFduxFHxP2xUjxQ/7A
         oqgaRaYwdNYMzZJc8G2xX1hHJ0RTsuzRuuKzqQnUFK9LFYM3VmWSoZzVtvBrQCby/xAe
         x/CSimEbnl0L9fTVz++fXtFxXYbEYjgwL9Qv0+hNYbZz3GNVUp2H7njFvqMOtGuxQoQk
         3CiVArQncnle66JMfO16ijHQRYyXNPY0JsHyMHB0TAOmzThk2iNWZcRWxe+b1h4m0txe
         1x7fC1lkZ+vsGPuJxCzn3zl0zpdrLwYFK+XBL6g/smI5JKyfAYFGMKANEgcR7qvWYYYN
         w+eA==
X-Gm-Message-State: AOJu0YxUz0HJZiuTsKsHAKkaOvOJ4RBFCksStVslbumynBZ5UEiaACf1
	I0cy68bVSE37TduPoORXHBwZEDH4HPcoTBp48R3NbTLlSo5QOv7UvKU2GlKzq+ubukiSDvPi2dD
	yqBg=
X-Gm-Gg: Acq92OH88Uua0Vo+UJdx4QjOT4l+KUNTHYshS3qcNbUf+rhZSjQ/Uc9t8BeWH2ywuBL
	CEx3YfgcZZBxoN/+B4AaHcQ0Xlm0vEQBrx/GimHj5kCMx58fV44D4VFmPb6K+dT8AF3Bn2dQYtS
	rOO4u8n8zgofQRSrUqv1K4PeVsnsmYOzFR9Y159svgOhG31QUkVwSzPZt3U/6C0KIyl0Yrk1s/F
	PtDgMERZxjvspRJthR8kU5Jer31RNsUf5Zm9eRVm6yPY1ZDSLwkmS20Hairb0XwkvfHiMArKk04
	H6iqDedDuOImbCThieu9KB1T9+NqSG/oE/ucQUbRqvdhUo356nmmkXMP4WTx19SnAS/bG1B5tIU
	VVM4LxV/XmxMwt8eDdZNlO4gXLFpxY/QjXqkgT9p8MvOCyQ/gThr1TwnIG6WVVTLszI42gbWQ/r
	Vfq3ITOWTc6SZCIic2Zdmjx3eREqUBaDGe05itiZ679aLuPXiDCoicpYThqQPrlADkijTuSb0XT
	QzsXmkRDHhPuZ4=
X-Received: by 2002:a05:6000:41e5:b0:45e:a19f:22e4 with SMTP id ffacd0b85a97d-45ea3ef2dc8mr5634208f8f.17.1779376532074;
        Thu, 21 May 2026 08:15:32 -0700 (PDT)
Message-ID: <f532fc29-f3cc-484f-b137-c3f8d04279fb@suse.com>
Date: Thu, 21 May 2026 17:15:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/4] x86/shadow: split get_unsafe() invocations
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <738daea9-ebec-4299-b0f9-49448293106d@suse.com>
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
In-Reply-To: <738daea9-ebec-4299-b0f9-49448293106d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1779376532-8B790A53-F1F82B1D/0/0
X-purgate-type: clean
X-purgate-size: 4442
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BD4895A81A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Misra C:2012 rule 13.6 takes issue with is_hvm_vcpu() uses (deep) inside
sizeof(), as used by get_unsafe(). While sh_linear_l1_table() doesn't
involve is_hvm_vcpu(), the rule there kicks in for "call to function
`__builtin_expect(long, long)' (unevaluated `nothrow' call effect)".
Break out the address calculations.

This, overall, turns out to also improve generated code (with gcc15 at
least). No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2197,16 +2197,19 @@ static int cf_check sh_page_fault(
 #if (SHADOW_OPTIMIZATIONS & SHOPT_FAST_FAULT_PATH)
     if ( (regs->error_code & PFEC_reserved_bit) )
     {
+        const shadow_l1e_t *psl1e;
+
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
         /* First, need to check that this isn't an out-of-sync
          * shadow l1e.  If it is, we fall back to the slow path, which
          * will sync it up again. */
         {
             shadow_l2e_t sl2e;
+            const shadow_l2e_t *psl2e = sh_linear_l2_table(v) +
+                                        shadow_l2_linear_offset(va);
             mfn_t gl1mfn;
-            if ( (get_unsafe(sl2e,
-                             (sh_linear_l2_table(v) +
-                              shadow_l2_linear_offset(va))) != 0)
+
+            if ( (get_unsafe(sl2e, psl2e) != 0)
                  || !(shadow_l2e_get_flags(sl2e) & _PAGE_PRESENT)
                  || !mfn_valid(gl1mfn = backpointer(mfn_to_page(
                                   shadow_l2e_get_mfn(sl2e))))
@@ -2222,9 +2225,8 @@ static int cf_check sh_page_fault(
 #endif /* SHOPT_OUT_OF_SYNC */
         /* The only reasons for reserved bits to be set in shadow entries
          * are the two "magic" shadow_l1e entries. */
-        if ( likely((get_unsafe(sl1e,
-                                (sh_linear_l1_table(v) +
-                                 shadow_l1_linear_offset(va))) == 0)
+        psl1e = sh_linear_l1_table(v) + shadow_l1_linear_offset(va);
+        if ( likely((get_unsafe(sl1e, psl1e) == 0)
                     && sh_l1e_is_magic(sl1e)) )
         {
 
@@ -2879,6 +2881,7 @@ static bool cf_check sh_invlpg(struct vc
 {
     mfn_t sl1mfn;
     shadow_l2e_t sl2e;
+    const shadow_l2e_t *psl2e;
 
     perfc_incr(shadow_invlpg);
 
@@ -2897,6 +2900,9 @@ static bool cf_check sh_invlpg(struct vc
 #if SHADOW_PAGING_LEVELS == 4
     {
         shadow_l3e_t sl3e;
+        const shadow_l3e_t *psl3e = sh_linear_l3_table(v) +
+                                    shadow_l3_linear_offset(linear);
+
         if ( !(shadow_l4e_get_flags(
                    sh_linear_l4_table(v)[shadow_l4_linear_offset(linear)])
                & _PAGE_PRESENT) )
@@ -2904,9 +2910,7 @@ static bool cf_check sh_invlpg(struct vc
         /* This must still be a copy-from-unsafe because we don't have the
          * paging lock, and the higher-level shadows might disappear
          * under our feet. */
-        if ( get_unsafe(sl3e,
-                        (sh_linear_l3_table(v) +
-                         shadow_l3_linear_offset(linear))) != 0 )
+        if ( get_unsafe(sl3e, psl3e) != 0 )
         {
             perfc_incr(shadow_invlpg_fault);
             return false;
@@ -2925,9 +2929,8 @@ static bool cf_check sh_invlpg(struct vc
 
     /* This must still be a copy-from-unsafe because we don't have the shadow
      * lock, and the higher-level shadows might disappear under our feet. */
-    if ( get_unsafe(sl2e,
-                    (sh_linear_l2_table(v) +
-                     shadow_l2_linear_offset(linear))) != 0 )
+    psl2e = sh_linear_l2_table(v) + shadow_l2_linear_offset(linear);
+    if ( get_unsafe(sl2e, psl2e) != 0 )
     {
         perfc_incr(shadow_invlpg_fault);
         return false;
@@ -2968,9 +2971,7 @@ static bool cf_check sh_invlpg(struct vc
              * have the paging lock last time we checked, and the
              * higher-level shadows might have disappeared under our
              * feet. */
-            if ( get_unsafe(sl2e,
-                            (sh_linear_l2_table(v) +
-                             shadow_l2_linear_offset(linear))) != 0 )
+            if ( get_unsafe(sl2e, psl2e) != 0 )
             {
                 perfc_incr(shadow_invlpg_fault);
                 paging_unlock(d);


