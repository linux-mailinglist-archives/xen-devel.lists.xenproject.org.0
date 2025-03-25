Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDADA6EA42
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 08:18:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926044.1328895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twyXD-0003UI-QM; Tue, 25 Mar 2025 07:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926044.1328895; Tue, 25 Mar 2025 07:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twyXD-0003Rx-MM; Tue, 25 Mar 2025 07:17:15 +0000
Received: by outflank-mailman (input) for mailman id 926044;
 Tue, 25 Mar 2025 07:17:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twyXC-0003Rr-04
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 07:17:14 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 289da184-0949-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 08:17:06 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5e60cfef9cfso7829475a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 00:17:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efbdecedsm811809466b.140.2025.03.25.00.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 00:17:05 -0700 (PDT)
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
X-Inumbo-ID: 289da184-0949-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742887026; x=1743491826; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrNWs8DEDKZTnfvrHKbcO5s7JbNIoUh/ZnTwRdW9r5Q=;
        b=Zw3+rw/LivASr8ad2gWvIzQpWrows3+i9+NkGzjxZRrKK8d7jJdvHW6j2Ju9RfKwqj
         v702oDSkvTcogmijfYkYxNnvX9ils/vGxl8GAPgjUVZcgpBHwEQMYk69yyimL8GaBMZy
         7ugnI55TENOKDBOQTLNuQedk0soZ2MqwLlbyVsMJNp5NTMq5Ht1bmZSFziOg1v5+g4Yh
         ySiNKs1RvgJa6d8W8z404FqNpykMm42rQtNgJx6dnyXiwwK6e8w0/HzIhGuVhG89syeK
         qKYJCHQASRTqdWvzG0HubkmScBq6yXMzIg2a1HZxJBvJ1LXZEnSN1jff67CjQ6Dgy5ll
         j4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742887026; x=1743491826;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mrNWs8DEDKZTnfvrHKbcO5s7JbNIoUh/ZnTwRdW9r5Q=;
        b=GGmq4W5nZ3qM4py/GnvoG/vJpdVNm/pwp87Qihebs7dbgwLRP1ODcau6+pshkjwpCP
         8Rbvi5oCrUHxFbV/2XNYchrYje1Do3Ha1wSDpb70bDi+jEOarOIQCccwVZaEf8DIqMuy
         l7Y2sdNKinMAsmPJ0E2necClexyNfiPnO/o4bBa8Sg051rreBCZSmxNdY6h999o2Cjb1
         BlFsuARj7lt0xSnhqjjndIRJD0tGWVagbwNSeWSMv0r4PttVbEjw11eSTg/Q9LbEbtQe
         RLLMO/2N+frsDE0GbtoBpleE1cdHUTzCSb1bP/2tS9+R49YW8YBAOnfj/fg1qvdw4tsS
         lNaQ==
X-Gm-Message-State: AOJu0YzIEwsn+RWjt/gc0fM8c6VKku5z/8y5J7oy9ak+EE8BPxa7PWOd
	5LNFPGWuooEOULMi1w1XbJeIQnJl9Vtz+m8f5bF8Vum8c7NZ23ndozqYBy4Ti4ixJ/33QCcU1gE
	=
X-Gm-Gg: ASbGncvnSe9g5dtvhVbHJl9i/1+r6bW1j9IHkt36Fv+yorQpEQfxvDQLFSw7h0WBNRY
	3zcoKy3lzMim41Yu1JtEsNEOxvkBDLwmvOzqESi9iLmO/VLvv6PWG0W9V87kH6hlumMfcz6QmMz
	OlEqLwBETyQhjYuIb5mAkSgGCPO9S0vd2ubSAmQAU7tsMZPiVF+UDOrfBALCT5YOmZBcHvZEkOt
	u4hBSP7Jn3H19erwQ+ufmKT5g/dkA/kVdEm1YOlENXQZ6+0ywHJyMkAeaMhHIqODEVW4ZrNvO1o
	+AuaW+lf9yc/THKo5ITfc7TEb918/IQ04pHUMjAhEWpwW1u+UI/jLx/ANCRr7tP85mCBgQERs/p
	C/8cTwx5IDqSs5zNUKIh4+lMyRcobKn2o5T9fwSaW
X-Google-Smtp-Source: AGHT+IEXgJSm1XCe90dyGmboSwglGpk6T6Y46xrO3dCQutFdixpUAPWbE23WzAoF16/RjdqtLg/a1Q==
X-Received: by 2002:a17:907:f50a:b0:ac3:f494:c0a2 with SMTP id a640c23a62f3a-ac3f494c0d0mr1573554966b.13.1742887026195;
        Tue, 25 Mar 2025 00:17:06 -0700 (PDT)
Message-ID: <b590b590-764a-4dfe-9e13-975122790329@suse.com>
Date: Tue, 25 Mar 2025 08:17:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/P2M: synchronize fast and slow paths of
 p2m_get_page_from_gfn()
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

Handling of both grants and foreign pages was different between the two
paths.

While permitting access to grants would be desirable, doing so would
require more involved handling; undo that for the time being. In
particular the page reference obtained would prevent the owning domain
from changing e.g. the page's type (after the grantee has released the
last reference of the grant). Instead perhaps another reference on the
grant would need obtaining. Which in turn would require determining
which grant that was.

Foreign pages in any event need permitting on both paths.

Introduce a helper function to be used on both paths, such that
respective checking differs in just the extra "to be unshared" condition
on the fast path.

While there adjust the sanity check for foreign pages: Don't leak the
reference on release builds when on a debug build the assertion would
have triggered. (Thanks to Roger for the suggestion.)

Fixes: 80ea7af17269 ("x86/mm: Introduce get_page_from_gfn()")
Fixes: 50fe6e737059 ("pvh dom0: add and remove foreign pages")
Fixes: cbbca7be4aaa ("x86/p2m: make p2m_get_page_from_gfn() handle grant case correctly")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Have helper take const struct domain *.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -328,12 +328,46 @@ void p2m_put_gfn(struct p2m_domain *p2m,
     gfn_unlock(p2m, gfn_x(gfn), 0);
 }
 
+static struct page_info *get_page_from_mfn_and_type(
+    const struct domain *d, mfn_t mfn, p2m_type_t t)
+{
+    struct page_info *page;
+
+    if ( !mfn_valid(mfn) )
+        return NULL;
+
+    page = mfn_to_page(mfn);
+
+    if ( p2m_is_ram(t) )
+    {
+        if ( p2m_is_shared(t) )
+            d = dom_cow;
+
+        if ( get_page(page, d) )
+            return page;
+    }
+    else if ( unlikely(p2m_is_foreign(t)) )
+    {
+        const struct domain *fdom = page_get_owner_and_reference(page);
+
+        if ( fdom )
+        {
+            if ( likely(fdom != d) )
+                return page;
+            ASSERT_UNREACHABLE();
+            put_page(page);
+        }
+    }
+
+    return NULL;
+}
+
 /* Atomically look up a GFN and take a reference count on the backing page. */
 struct page_info *p2m_get_page_from_gfn(
     struct p2m_domain *p2m, gfn_t gfn,
     p2m_type_t *t, p2m_access_t *a, p2m_query_t q)
 {
-    struct page_info *page = NULL;
+    struct page_info *page;
     p2m_access_t _a;
     p2m_type_t _t;
     mfn_t mfn;
@@ -347,26 +381,9 @@ struct page_info *p2m_get_page_from_gfn(
         /* Fast path: look up and get out */
         p2m_read_lock(p2m);
         mfn = p2m_get_gfn_type_access(p2m, gfn, t, a, 0, NULL, 0);
-        if ( p2m_is_any_ram(*t) && mfn_valid(mfn)
-             && !((q & P2M_UNSHARE) && p2m_is_shared(*t)) )
-        {
-            page = mfn_to_page(mfn);
-            if ( unlikely(p2m_is_foreign(*t)) || unlikely(p2m_is_grant(*t)) )
-            {
-                struct domain *fdom = page_get_owner_and_reference(page);
-
-                ASSERT(!p2m_is_foreign(*t) || fdom != p2m->domain);
-                if ( fdom == NULL )
-                    page = NULL;
-            }
-            else
-            {
-                struct domain *d = !p2m_is_shared(*t) ? p2m->domain : dom_cow;
-
-                if ( !get_page(page, d) )
-                    page = NULL;
-            }
-        }
+        page = !(q & P2M_UNSHARE) || !p2m_is_shared(*t)
+               ? get_page_from_mfn_and_type(p2m->domain, mfn, *t)
+               : NULL;
         p2m_read_unlock(p2m);
 
         if ( page )
@@ -380,14 +397,7 @@ struct page_info *p2m_get_page_from_gfn(
 
     /* Slow path: take the write lock and do fixups */
     mfn = get_gfn_type_access(p2m, gfn_x(gfn), t, a, q, NULL);
-    if ( p2m_is_ram(*t) && mfn_valid(mfn) )
-    {
-        struct domain *d = !p2m_is_shared(*t) ? p2m->domain : dom_cow;
-
-        page = mfn_to_page(mfn);
-        if ( !get_page(page, d) )
-            page = NULL;
-    }
+    page = get_page_from_mfn_and_type(p2m->domain, mfn, *t);
     put_gfn(p2m->domain, gfn_x(gfn));
 
     return page;

