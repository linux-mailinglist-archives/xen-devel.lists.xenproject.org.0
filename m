Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNebFotkBGq6HgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:46:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C39485327C3
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307896.1579467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN82V-0006oU-2T; Wed, 13 May 2026 11:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307896.1579467; Wed, 13 May 2026 11:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN82U-0006mS-Vv; Wed, 13 May 2026 11:46:10 +0000
Received: by outflank-mailman (input) for mailman id 1307896;
 Wed, 13 May 2026 11:46:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wN82U-0006mM-7C
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 11:46:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN82T-00D90v-K3
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 13:46:09 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a04647c-2eae-0a2a0a5409dd-0a2a450ad202-16
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:46:09 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a046481-56b3-0a2a450a0019-d155802adc46-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:46:09 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48909558b3aso66381825e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 04:46:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d74536sm71732675e9.15.2026.05.13.04.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 04:46:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1778672769; x=1779277569; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pZuQ87zTRQs5K2PzA9WOyQftHPdtCVC/Cj62DUtB07o=;
        b=cvgG9udHWEIoY2pPm3m/wYgF5cgUpkMFnYjy7ZiRZGSQrpzzQEN23bUusSDpC2k0u3
         OAPNXtGN6BMXhhqBFfhGLprySX/uQ2dmT16KDnPWQjXTWJwmpVxfxoT0G34KQc/emisu
         FSf6dwDzqavPr1j3lqTzSBRMLNfSbt3vtAN7+ADhV5eiddRLO5I6fwS45uLg07c+l0o4
         ZqBIVozG2vLkW2dv3dK9TqHTkfZ4TM8RZXBNJz1zopi5kvFBpoC+xNaR8al1kODkBRAc
         LQWL2O4zBy56AIIIAtMvcumpHoCYUvft7Y1hoRiCOYwLQlu2fNyqHqzYGw1ZR/kD9clV
         nRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672769; x=1779277569;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZuQ87zTRQs5K2PzA9WOyQftHPdtCVC/Cj62DUtB07o=;
        b=M+JfRidLO7aEfyyJ07qFBMoyCpSRzP79kRBMdKUvJYnu898LVKwx5WLj25Kgv2+Z9G
         isVmU95NyrFDnwHZt3jOvbka+jFUFO9fU6hHHCTyfhqLsf1M7mZIgO8IbyUpy2wu3Nws
         TdV/heKqyr4f47/IZsK6PT8XcZYJ4on8SVkbIgRFvII/XKNXLxf+srLRYf2S2KzIv2Pc
         9lFg/mg7+Z6m6YEm6tOtZ3GV9Cq0+jztI11AtyEJ2vdUQLj1FNP0gBqo1Qi1VMBPn5at
         /GIhFdFDO6Lf0IZw86meOem4cBSS7Tx0VaCtYOLMXjplaDUNl9CeWvwmMZmtxgiTX5l9
         mhXw==
X-Gm-Message-State: AOJu0YyGBcaMoq4EkvJYEoxLgZKXwnknLHB/FqF/Me6GI+fxMORctQVL
	KetvTxyIvsy3JRo66ybF/eAcxFkJKkl6rZ0D4EvfNpoUsszPB++JjfQfBb1IQffvWO6BZd0UJmd
	ycKQ=
X-Gm-Gg: Acq92OGkRkNiffrrfbf+lxapcJjaSq8xu5uyJEOddGyxr8oEcBauzxx9kLXNNWGoHS8
	2lxsN/t16bmx6a7qWekZmC3aclOTxEJ8XOWsIRRGJ1gBlu+RwXQiKY1hI3h25XW6yxJ48XkMluv
	fEzj6oL39wgRWLCgJLzx7stwPWKMIgYDmivbdVCZ9xhd0cLqfa4FqhsHQC/DqVs30YKoi1tALM3
	oLMcINHZ+69QwNYWDX+Q1yWYmsWDh4ZfzE+8XP2Mskn8HFW/ycs+MhyXRYAaIWwKyRDb4jhhtUA
	W4V2d9wnKXRZCAAKW6q/WVjDxKNIwvmF7a//E0xbWGnrOwoNUL6ysthVqv8VsV/9WIuq/Iwxn++
	mavwLeRbWzCg9qsFuEGIEam0Ux0FPDxpaEWGyutcHj0zIxj9c3YpTrJRRK7C3vs6xm3ggPmbYj+
	FHZ9R/vGhe/hW14be+JxaACF6uxP/QMGY7/Drd/i17QoPrVRPtwLBig++u8zIBKLZJ+yMnPUKgF
	Ha66Azugl19nU8=
X-Received: by 2002:a05:600c:4583:b0:487:2439:b7be with SMTP id 5b1f17b1804b1-48fce9b2fe7mr33310625e9.6.1778672769058;
        Wed, 13 May 2026 04:46:09 -0700 (PDT)
Message-ID: <146d214c-e766-4b3f-bc50-0b9beee50473@suse.com>
Date: Wed, 13 May 2026 13:46:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/5] x86/shadow: split a nested max() invocation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <5eaaf72a-850c-4535-9f20-13b4feed38d1@suse.com>
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
In-Reply-To: <5eaaf72a-850c-4535-9f20-13b4feed38d1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1778672769-73F798B7-C5C149AD/0/0
X-purgate-type: clean
X-purgate-size: 1655
X-Rspamd-Queue-Id: C39485327C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:sstabellini@kernel.org,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:mid,suse.com:dkim];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Such nesting causes the inner instance to shadow the outer instance's
macro-local variables, thus violating Misra C:2012 rule 5.3 ("An
identifier declared in an inner scope shall not hide an identifier
declared in an outer scope"). Use an intermediate variable for the
inner invocation. No difference in generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Supposedly this case is deviated (rules.rst). Does that deviation not work
quite right? Actually, am I mis-reading deviations.ecl or is the
respective setting only covering the combination of min() and max(), but
not multiple use of the same macro? Furthermore, why would e.g.
min(max_t(), ...) need a deviation? Even more generally, aren't those
expressions too permissive?

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -767,11 +767,12 @@ static unsigned int sh_min_allocation(co
      * megabyte of RAM (for the p2m table, minimally enough for HVM's setting
      * up of slot zero and an LAPIC page), plus one for HVM's 1-to-1 pagetable.
      */
+    unsigned int extra = max(domain_tot_pages(d) / 256,
+                             is_hvm_domain(d) ? CONFIG_PAGING_LEVELS + 2 : 0U) +
+                         is_hvm_domain(d);
+
     return shadow_min_acceptable_pages(d) +
-           max(max(domain_tot_pages(d) / 256,
-                   is_hvm_domain(d) ? CONFIG_PAGING_LEVELS + 2 : 0U) +
-               is_hvm_domain(d),
-               d->arch.paging.p2m_pages);
+           max(extra, d->arch.paging.p2m_pages);
 }
 
 int shadow_set_allocation(struct domain *d, unsigned int pages, bool *preempted)


