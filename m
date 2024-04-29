Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECC68B593E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 15:01:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714053.1115031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Qcy-0007Ge-1R; Mon, 29 Apr 2024 13:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714053.1115031; Mon, 29 Apr 2024 13:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Qcx-0007Dg-Tq; Mon, 29 Apr 2024 13:01:03 +0000
Received: by outflank-mailman (input) for mailman id 714053;
 Mon, 29 Apr 2024 13:01:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1Qcw-0007Da-L9
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 13:01:02 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86da2ce4-0628-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 15:01:00 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41b869326daso20377545e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 06:01:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q13-20020a05600c46cd00b0041c02589a7csm6860512wmo.40.2024.04.29.06.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 06:00:59 -0700 (PDT)
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
X-Inumbo-ID: 86da2ce4-0628-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714395660; x=1715000460; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WrhiGt4t2+rTjMGnuIXdmpTNrF6ykzuSNvQRaf3DNE=;
        b=BoTYmUtkqrqEgYHk13HdxzbS8A2GwsJ7i0tYOKJyMantMdIN1m9Gx3Dsix5uJr+1Ei
         h7XwLSNYPl/Xl0SZS7fKaK7iQZEZGgScKoam+LIvMdVaIOGcznz0QWqGn7sKN11rXH3q
         DciARUMDuIZzYxK6kJWm6trcK+/mTmMVhqmpiCNFxJffyHa/C14sxBHeva5DzPYc4yzz
         JwB19C5Nyfe1mvxhLSNCGn7kEBtFkcNzVBtuVOTMdQRsm8y6xjQWVGJM1yyEnrOS7oFf
         jmY9cQHzs5IQ83bAOZswWeNaa6lu+pcaNqPY1BtJNA8VYpBJRYnQh8kLERqaI2fDGTbS
         jRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714395660; x=1715000460;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4WrhiGt4t2+rTjMGnuIXdmpTNrF6ykzuSNvQRaf3DNE=;
        b=dbE+WcGXTv5nBewST11lPS7q7G3PFiEibE1eTMKidEOsW0tK/GY+KXD0ozaSkG42qj
         93FmX7iJ0FQrsAMldsfU6J1qRMIYLpEjxBfglFGp0j8mYvt/d0kJ9ZIRCo30CqlPHBF4
         8uKJd4dX5TMaa4X0Rw0ft43JVGnap/hEy6xWec4txwcIpQbF+tnaMd0s+pKcgZRlWFcD
         O0wVy1px0v2ctSZHfOxv3faCkxJeSk0a41/xemRvL/dUcsQLoJvfcyAAMIK0WElu7CCL
         ZA6D/ARazK6hFRWURQL9fsY08ArQsikFvQxNLOmYkgonVxWkeGvQtMPx9Z5rNMK0Olqd
         agFQ==
X-Gm-Message-State: AOJu0YyNyCsWtoSYRV4wmIIN906lzQl/LnU9B3xowJevJKFajYIFn467
	lnv+39lNsSVDAzEWh1Abo9ooNR1bOHICPqoEOGzeQbONPlejIuOFdFPA+x6fsaXrxwiUe8o+Z9o
	=
X-Google-Smtp-Source: AGHT+IEEkvz0YNMLjIXFgFvG6NZf0bgqboV82FTC1jpO/zGGT1hTsjQT7UX8VbwYkFQCNCaKDbixoA==
X-Received: by 2002:a05:600c:3b16:b0:41c:1f4:9cbb with SMTP id m22-20020a05600c3b1600b0041c01f49cbbmr4546140wms.26.1714395659743;
        Mon, 29 Apr 2024 06:00:59 -0700 (PDT)
Message-ID: <f54c05d4-b61d-4e26-8e93-6e1bdc22a1d4@suse.com>
Date: Mon, 29 Apr 2024 15:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] revert "x86/mm: re-implement get_page_light() using an atomic
 increment"
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

revert "x86/mm: re-implement get_page_light() using an atomic increment"

This reverts commit c40bc0576dcc5acd4d7e22ef628eb4642f568533.

That change aimed at eliminating an open-coded lock-like construct,
which really isn't all that similar to, in particular, get_page(). The
function always succeeds. Any remaining concern would want taking care
of by placing block_lock_speculation() at the end of the function.
Since the function is called only during page (de)validation, any
possible performance concerns over such extra serialization could
likely be addressed by pre-validating (e.g. via pinning) page tables.

The fundamental issue with the change being reverted is that it detects
bad state only after already having caused possible corruption. While
the system is going to be halted in such an event, there is a time
window during which the resulting incorrect state could be leveraged by
a clever (in particular: fast enough) attacker.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2582,10 +2582,16 @@ bool get_page(struct page_info *page, const struct domain *domain)
  */
 static void get_page_light(struct page_info *page)
 {
-    unsigned long old_pgc = arch_fetch_and_add(&page->count_info, 1);
+    unsigned long x, nx, y = page->count_info;
 
-    BUG_ON(!(old_pgc & PGC_count_mask)); /* Not allocated? */
-    BUG_ON(!((old_pgc + 1) & PGC_count_mask)); /* Overflow? */
+    do {
+        x  = y;
+        nx = x + 1;
+        BUG_ON(!(x & PGC_count_mask)); /* Not allocated? */
+        BUG_ON(!(nx & PGC_count_mask)); /* Overflow? */
+        y = cmpxchg(&page->count_info, x, nx);
+    }
+    while ( unlikely(y != x) );
 }
 
 static int validate_page(struct page_info *page, unsigned long type,

