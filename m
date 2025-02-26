Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA785A45DBC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 12:52:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896441.1305146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnFxo-0006ga-AH; Wed, 26 Feb 2025 11:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896441.1305146; Wed, 26 Feb 2025 11:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnFxo-0006dN-6v; Wed, 26 Feb 2025 11:52:32 +0000
Received: by outflank-mailman (input) for mailman id 896441;
 Wed, 26 Feb 2025 11:52:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnFxm-00069K-NL
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 11:52:30 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27825486-f438-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 12:52:29 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso44400475e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 03:52:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8fbef5sm5529678f8f.90.2025.02.26.03.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 03:52:28 -0800 (PST)
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
X-Inumbo-ID: 27825486-f438-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740570748; x=1741175548; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EMk5+NKhGum3QtmdtmnLKhjInNSavSN0lNc/5reLNog=;
        b=MA/TutLZ+PRn+HgHd0k0rZZ+Eqte0w02VL4r1aQAso6FWeOcBpcUt2Y0syArZKtsCy
         emVGWqdIWKFWZBaNXcm/GNsCKA157GSC3r44HJSr41KsDjBcSLQ1koncJFUcw4WsKoMl
         rnpPo7NgLXxenShX/00vx6A8ZZHTtNdxm8xt8IG64XlmtLKiNVC48crmGuBQN5SxosNc
         zTJ0DI2mBJxcxkx0kvxCnkJTls8M0dmFqEziZB5yqaqjcPpRtp16PIqOAlLfLTJ7wqOV
         M8INH4Z3YcvMXbAcIJjBFY9AejwcWyiJI3abzUEd4XHN0zDqrA+R1FRn2UMC78J7tTEO
         XkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740570748; x=1741175548;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMk5+NKhGum3QtmdtmnLKhjInNSavSN0lNc/5reLNog=;
        b=hmZLs72lcIW/tlIqZ/V5Nm7w21pyGdvtFM1Q04scVNOg6sxkhvSjoOdn5WJwFlL2Bu
         5ZXWVJhS1B+H5IYj3ifr28rXaSNj2RDyYWNC9n6sSCM5VLcmYExwMRoZzuOMGqtXP/vS
         tdsRl0QOYnFeMSafIynrExKytc17NuEU13BVl/bfp/QkClE9Qx9O9waKqhGtp8LJ+JiC
         YkJttKv1Y8wA+MWJayBYTd5+oGzzx1XGbrU1oeM7SlSPqi13ySLM2rFa54MKjBvOEg4q
         ZNrHRgHiL3P/sq3jMG6pqbofzUbpwq0VwQj/iK8gaeHn63KraStCUNfCl9nwCl7Rgwf3
         +C7A==
X-Gm-Message-State: AOJu0Yyi5WT968VaQaOvQqyjhCNMEMcAgenAvprDZMUJkDvXE0RQzBFD
	wAqwwFBqJ5ae2w2yg0REhBvqutJuWhdXHdERE56Lc/pzU6/9mTtqX/tmfd4F8RG5Hs7KIRW+sMQ
	=
X-Gm-Gg: ASbGncuyPsuwNqYPqjabWNCDjD8wheqOAU35hJYRGFBRrh6/Q7LYQ4cxHOlDRTXiYWG
	k93LyHi8A2qsB+JAgFjICsEQn2dauh92GeDMMZEBYwmwlXB9F3Msc9I23E+ez507QIumiPLN2qf
	m15WR+fD41q0mhriki7fLfdYke7WPH2qstP3LpIKHbY4W2nlq+Hazc3NPQe4GmvZb3W6GrcP23g
	WzqJfEyjRhsEaNGZeYiTLiv07z7DkwsUEK0rYWIyLUQE382X+LuYX1scn9i5gBlPBMMdxrBagL0
	jsZi/w7o8os/vZe8lWceMVzW2otvtlKhC6GqnKmJCLBtt+PT02FAupirzKNe0JjHiD7JWagtJE9
	9GofqXTLCp+0=
X-Google-Smtp-Source: AGHT+IHQY7RTeKP0ltTVsquDyu/YAHdfXAHfnqDyZUcwG+GP+QTT79o/6RilxPQzaRalIBCNcvYIag==
X-Received: by 2002:a05:6000:178f:b0:38f:2073:1493 with SMTP id ffacd0b85a97d-38f70789bedmr14073315f8f.15.1740570748568;
        Wed, 26 Feb 2025 03:52:28 -0800 (PST)
Message-ID: <88d24595-50be-4f99-97d6-9126340b791e@suse.com>
Date: Wed, 26 Feb 2025 12:52:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/3] x86/P2M: synchronize fast and slow paths of
 p2m_get_page_from_gfn()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7363b2ee-f297-4b0b-9c4d-bdebe08d514b@suse.com>
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
In-Reply-To: <7363b2ee-f297-4b0b-9c4d-bdebe08d514b@suse.com>
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
RFC: While the helper could take const struct domain * as first
     parameter, for a P2M function it seemed more natural to have it
     take const struct p2m_domain *.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -328,12 +328,45 @@ void p2m_put_gfn(struct p2m_domain *p2m,
     gfn_unlock(p2m, gfn_x(gfn), 0);
 }
 
+static struct page_info *get_page_from_mfn_and_type(
+    const struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t)
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
+        const struct domain *d = !p2m_is_shared(t) ? p2m->domain : dom_cow;
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
+            if ( likely(fdom != p2m->domain) )
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
@@ -347,26 +380,9 @@ struct page_info *p2m_get_page_from_gfn(
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
+               ? get_page_from_mfn_and_type(p2m, mfn, *t)
+               : NULL;
         p2m_read_unlock(p2m);
 
         if ( page )
@@ -380,14 +396,7 @@ struct page_info *p2m_get_page_from_gfn(
 
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
+    page = get_page_from_mfn_and_type(p2m, mfn, *t);
     put_gfn(p2m->domain, gfn_x(gfn));
 
     return page;


