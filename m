Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A726AD516D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 12:19:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011439.1389876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIYU-0003lN-Ly; Wed, 11 Jun 2025 10:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011439.1389876; Wed, 11 Jun 2025 10:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIYU-0003jn-J7; Wed, 11 Jun 2025 10:19:38 +0000
Received: by outflank-mailman (input) for mailman id 1011439;
 Wed, 11 Jun 2025 10:19:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPIYT-0003jf-8u
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 10:19:37 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 929766b4-46ad-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 12:19:35 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a51d552de4so3530345f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 03:19:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2f5f899ceasm6906310a12.73.2025.06.11.03.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 03:19:34 -0700 (PDT)
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
X-Inumbo-ID: 929766b4-46ad-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749637175; x=1750241975; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aDoIDq6YgdTc5VfakrhU/gJLnYd10GkjT0bAtWU5IDg=;
        b=ScmsTNu90/llf9QvuFvQ0HP57BHI4on8TnjrnigRb3DBT1VJ9rjXtcI5+HibPgFQbD
         n2TQQvlRgX/LrrleStovi5E+1OhYgGFRrukCLqcMEaP6nSKUydz568Z72AFO0KjDTwPp
         /FsLI8CfMrS/JETyf/JrqLhTD7/jNP4xqoicJOjvqoaiNfftiiKV3eJ+lVHz20bO/3O+
         p4MGURx35yacL2UlcNKh/NDbQswxBw0Rt2W94kC1JGOCKROTFxlgxA74jduh8xFXWaML
         MHhGi8g6wh5V6Oja9WGiCvv4m0oSVSmW3Vp/eKzmQdQeQCubtrzehpD7Ln94uCKhpbY6
         Xl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749637175; x=1750241975;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aDoIDq6YgdTc5VfakrhU/gJLnYd10GkjT0bAtWU5IDg=;
        b=E1XaxvwCDTO/1C27x3WEFtuv2z1E7RZuFe8/JVLDU2Fy3OOvRsaZCNWPgg/euEyqZz
         s6T6qFsNSyavaW+RvKGel2InBQ9Yd6RZwFW0S87NKtxaY7aJOdCAWm7XFg9fSLnd5MMW
         dZH3lnJZapB2L2ZbfsgPYVYSKfWMlmFypJouzKWpXBJV7+TfdGfdJ1a5xmkbUrMxm2Xc
         ccsQKqd0tHsAUtjGgGjHjP7iYvZVPBOGteKsTOBHJ5Vl2JyBnb4jZbUxnOJQSwrmamZy
         F7m3CBoQWYcCjMe0LPUq252IlcDcwwqH08QGkqtdjfSX/EBoEU4TxlZEuVl73H/9sUH9
         QZ9A==
X-Gm-Message-State: AOJu0Ywro0712rHywYjWo/xaMO/nWSG6kVt2TgJhV9mzuqOTM6yvFDAM
	c8jTgQLC1R1uklGRP+ZgFy/Xglf8MM0g7wM8COwgArScyJDIJ+kbGLMJaXtSdDrvctTyhFpqlGn
	yDCA=
X-Gm-Gg: ASbGncsUefO6+VfOxz18EF3Xny7PHrpjCaYdim7ydM+PN2Y1fNqd0regX/TDNzKtkQU
	6faCkhzsDORR04r/Z0BuPNrGhFtTcyHim2Ug459MOcfh02OXPAAttulclfrQQg/M9oQKhEGRASP
	QBQlwFzABUSk06I1sTBBf+eVgz7L6vn/WBA+9yDaC9LEh8oTPPzavk9zbY7Tfku/W9mzdWYJQtf
	CiH26O22ykdDNmxcXxxVfLR8m4e11++IcfSwfFQyehGeTYneKhUq3y1hPM7BYgcFp6n6OJiCs6F
	Ov8JZsoEVNDmqsMy6z8tL3Mwbtb31FWelTds0qafrUX3E1Die65CU811+VYKdUOlvgJEpaC1+aY
	ccPZls4A/yr6OPI/i+lAPK7yoRBzMfoVw/YTEhwLp1Rv0X6A=
X-Google-Smtp-Source: AGHT+IFEBbW0kPSs8I7ptHmP0SIgPB6M8BWEWo/cs5/Qgi2/6p6h8cDZ1GF8OOnDLbSurdAURei9cw==
X-Received: by 2002:a05:6000:24c7:b0:3a3:6991:dcbb with SMTP id ffacd0b85a97d-3a558a92771mr1806341f8f.12.1749637174534;
        Wed, 11 Jun 2025 03:19:34 -0700 (PDT)
Message-ID: <35ba8ca3-ed00-491e-a782-2974597cfdb3@suse.com>
Date: Wed, 11 Jun 2025 12:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86/HVM: restrict use of pinned cache attributes as well
 as associated flushing
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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

We don't permit use of uncachable memory types elsewhere unless a domain
meets certain criteria. Enforce this also during registration of pinned
cache attribute ranges.

Furthermore restrict cache flushing to just
- registration of uncachable ranges,
- de-registration of cachable ranges.

While there, also (mainly by calling memory_type_changed())
- take CPU self-snoop as well as IOMMU snoop into account (albeit the
  latter still is a global property rather than a per-domain one),
- avoid flushes when the domain isn't running yet (which ought to be the
  common case).

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
At the expense of yet larger a diff it would be possible to get away
without any "goto", by moving the whole "new entry" handling into the
switch(). Personally I'd prefer that, but the larger diff may be
unwelcome.

I have to admit that I can't spot what part of epte_get_entry_emt() the
comment refers to that is being deleted. The function does use
hvm_get_mem_pinned_cacheattr(), yes, but there's nothing there that talks
about cache flushes (and their avoiding) in any way.

Is it really sensible to add/remove ranges once the guest is already
running? (If it is, limiting the scope of the flush would be nice, but
would require knowing dirtyness for the domain wrt the caches, which
currently we don't track.)

This is kind of amending XSA-428.
---
v3: Drop a conditional and move a comment. Further amend description.
v2: Use memory_type_changed() and conditionalize call to
    p2m_memory_type_changed().

--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -582,6 +582,7 @@ int hvm_set_mem_pinned_cacheattr(struct
 {
     struct hvm_mem_pinned_cacheattr_range *range, *newr;
     unsigned int nr = 0;
+    bool flush = false;
     int rc = 1;
 
     if ( !is_hvm_domain(d) )
@@ -605,31 +606,34 @@ int hvm_set_mem_pinned_cacheattr(struct
 
                 type = range->type;
                 call_rcu(&range->rcu, free_pinned_cacheattr_entry);
-                p2m_memory_type_changed(d);
                 switch ( type )
                 {
-                case X86_MT_UCM:
+                case X86_MT_WB:
+                case X86_MT_WP:
+                case X86_MT_WT:
                     /*
-                     * For EPT we can also avoid the flush in this case;
-                     * see epte_get_entry_emt().
+                     * Flush since we don't know what the cachability is going
+                     * to be.
                      */
-                    if ( hap_enabled(d) && cpu_has_vmx )
-                case X86_MT_UC:
-                        break;
-                    /* fall through */
-                default:
-                    flush_all(FLUSH_CACHE);
+                    flush = true;
                     break;
                 }
-                return 0;
+                rc = 0;
+                goto finish;
             }
         domain_unlock(d);
         return -ENOENT;
 
     case X86_MT_UCM:
     case X86_MT_UC:
-    case X86_MT_WB:
     case X86_MT_WC:
+        if ( !is_iommu_enabled(d) && !cache_flush_permitted(d) )
+            return -EPERM;
+        /* Flush since we don't know what the cachability was. */
+        flush = true;
+        break;
+
+    case X86_MT_WB:
     case X86_MT_WP:
     case X86_MT_WT:
         break;
@@ -682,9 +686,11 @@ int hvm_set_mem_pinned_cacheattr(struct
 
     xfree(newr);
 
-    p2m_memory_type_changed(d);
-    if ( type != X86_MT_WB )
-        flush_all(FLUSH_CACHE);
+ finish:
+    if ( flush )
+        memory_type_changed(d);
+    else if ( d->vcpu && d->vcpu[0] )
+        p2m_memory_type_changed(d);
 
     return rc;
 }

