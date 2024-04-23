Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E448AE992
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 16:32:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710688.1110063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHBy-00016U-1S; Tue, 23 Apr 2024 14:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710688.1110063; Tue, 23 Apr 2024 14:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHBx-00013M-Te; Tue, 23 Apr 2024 14:32:17 +0000
Received: by outflank-mailman (input) for mailman id 710688;
 Tue, 23 Apr 2024 14:32:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzHBw-00082U-TL
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 14:32:16 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47abb492-017e-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 16:32:15 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41a5b68ed0aso15415335e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 07:32:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fl18-20020a05600c0b9200b0041ae0048b5dsm481577wmb.45.2024.04.23.07.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 07:32:14 -0700 (PDT)
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
X-Inumbo-ID: 47abb492-017e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713882735; x=1714487535; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rxvduw49sEMo1AmOKfLcnwBmnciDEleJ9FmgDixVJkw=;
        b=USsnZDbuB44TcLaBj6Wnp8nCTHWxhmH2lbygjvciwDsuvW1nrrmTLiZzqO9rkzdnLh
         ID0t4e11t+RMwHrX0xYBGspbw1PDOIgQE1zUJChwSPG3NB0np2pijVN9MWL0v4bqEWcl
         pUgtlHHFfwP0+4IHeFuBtLuKUNJQlCj9XavcL7z7BXo8aGFyRyotGxjZF+imb2/ggUJD
         5caoLin57MWj9yb1bkCaJBEXT2mOtBLyCcbzZHyQuStLs8C7dorNTQe/XEtkQDymahhd
         NGGHlwOldZzItAfTQ5LPd3vZdOk1295u0R+SrRuirmWC76JJGg+RNiFO4NIS4NPb+AS+
         TL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713882735; x=1714487535;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxvduw49sEMo1AmOKfLcnwBmnciDEleJ9FmgDixVJkw=;
        b=NOit2jfFs97oS2NTeVDKhrnTu5ed58K53rbjpBdmVp8NfLTDpVbM9I6nwemIIUgsaX
         RgBo6WKarLO5aNnxzAUIdacCcEnlgbv2W9f0kdyGrK7VJB1BdwpFvYWXoVQjNLvXkta5
         1oSYhWfQLk3o0XIDWmAZ8GhhLsOKz+zcm9D43vTwESAOL0Fm0Q9rXVkhHI9cLAIYY82V
         53H3ZF99f+/6ragn+keLbh4H8LJJl5VKlRna3IUXocHm7s4Ui6JXWnpJUMcwM+k6sc4C
         L2LB5gEclKHy58q40DAaubWf+bpiYDg4cJYl3Ukqg18WobndA0RjV8rEb5zlrAu4Vv5N
         pmCw==
X-Gm-Message-State: AOJu0YyNLRN9H4dL+SUZIpXLmaTQg5yW8H0b6hgDkRKOJ5dyubwUCQKO
	LJ8y82bU/0bJJcjYVUERwcsxaQteorfD8yX6JVU/bfhbopcI+SRPaj36AM5nJCi0MTO0J68jKX4
	=
X-Google-Smtp-Source: AGHT+IEJc+Eu3hdLEKjEJgge/Jbryo6rZHXTd6WRUSDkXXMZiUPVZcAJQORr5j/lVcxqLE0mZVCfNA==
X-Received: by 2002:a05:600c:1d15:b0:41a:41c8:d8e7 with SMTP id l21-20020a05600c1d1500b0041a41c8d8e7mr4598456wms.3.1713882734733;
        Tue, 23 Apr 2024 07:32:14 -0700 (PDT)
Message-ID: <52b4b0d8-1761-45c7-b6e6-91e1c308209c@suse.com>
Date: Tue, 23 Apr 2024 16:32:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/4] x86/P2M: un-indent write_p2m_entry()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
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
In-Reply-To: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Drop the inner scope that was left from earlier if/else removal. Take
the opportunity and make the paging_unlock() invocation common to
success and error paths, though.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -110,49 +110,43 @@ static int write_p2m_entry(struct p2m_do
                            unsigned int level)
 {
     struct domain *d = p2m->domain;
-
+    unsigned int oflags;
+    mfn_t omfn;
+    int rc;
+
+    paging_lock(d);
+
+    if ( p2m->write_p2m_entry_pre && gfn != gfn_x(INVALID_GFN) )
+        p2m->write_p2m_entry_pre(d, gfn, *p, new, level);
+
+    oflags = l1e_get_flags(*p);
+    omfn = l1e_get_mfn(*p);
+
+    rc = p2m_entry_modify(p2m, p2m_flags_to_type(l1e_get_flags(new)),
+                          p2m_flags_to_type(oflags), l1e_get_mfn(new),
+                          omfn, level);
+    if ( !rc )
     {
-        unsigned int oflags;
-        mfn_t omfn;
-        int rc;
-
-        paging_lock(d);
-
-        if ( p2m->write_p2m_entry_pre && gfn != gfn_x(INVALID_GFN) )
-            p2m->write_p2m_entry_pre(d, gfn, *p, new, level);
-
-        oflags = l1e_get_flags(*p);
-        omfn = l1e_get_mfn(*p);
-
-        rc = p2m_entry_modify(p2m, p2m_flags_to_type(l1e_get_flags(new)),
-                              p2m_flags_to_type(oflags), l1e_get_mfn(new),
-                              omfn, level);
-        if ( rc )
-        {
-            paging_unlock(d);
-            return rc;
-        }
-
         safe_write_pte(p, new);
 
         if ( p2m->write_p2m_entry_post )
             p2m->write_p2m_entry_post(p2m, oflags);
+    }
 
-        paging_unlock(d);
+    paging_unlock(d);
 
-        if ( nestedhvm_enabled(d) && !p2m_is_nestedp2m(p2m) &&
-             (oflags & _PAGE_PRESENT) &&
-             !p2m_get_hostp2m(d)->defer_nested_flush &&
-             /*
-              * We are replacing a valid entry so we need to flush nested p2ms,
-              * unless the only change is an increase in access rights.
-              */
-             (!mfn_eq(omfn, l1e_get_mfn(new)) ||
-              !perms_strictly_increased(oflags, l1e_get_flags(new))) )
-            p2m_flush_nestedp2m(d);
-    }
+    if ( !rc && nestedhvm_enabled(d) && !p2m_is_nestedp2m(p2m) &&
+         (oflags & _PAGE_PRESENT) &&
+         !p2m_get_hostp2m(d)->defer_nested_flush &&
+         /*
+          * We are replacing a valid entry so we need to flush nested p2ms,
+          * unless the only change is an increase in access rights.
+          */
+         (!mfn_eq(omfn, l1e_get_mfn(new)) ||
+          !perms_strictly_increased(oflags, l1e_get_flags(new))) )
+        p2m_flush_nestedp2m(d);
 
-    return 0;
+    return rc;
 }
 
 // Find the next level's P2M entry, checking for out-of-range gfn's...


