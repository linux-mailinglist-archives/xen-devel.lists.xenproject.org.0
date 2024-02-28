Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDBF86B0D6
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 14:52:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686641.1068898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKMO-0001e1-60; Wed, 28 Feb 2024 13:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686641.1068898; Wed, 28 Feb 2024 13:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKMO-0001c7-30; Wed, 28 Feb 2024 13:52:36 +0000
Received: by outflank-mailman (input) for mailman id 686641;
 Wed, 28 Feb 2024 13:52:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfKMM-0000eZ-49
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 13:52:34 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ea85554-d640-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 14:52:32 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a43dba50bb7so162533766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 05:52:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s24-20020a170906bc5800b00a3efa4e033asm1870713ejv.151.2024.02.28.05.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 05:52:31 -0800 (PST)
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
X-Inumbo-ID: 9ea85554-d640-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709128352; x=1709733152; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q/QgX3d2GmmEaeKazC02JMPPR+cdwuaWvIKU6akMN0U=;
        b=UHGSrD3sxscb+9I8SDvCFpl7XcCK7zxkzdQgPy5rNcF8VEV7/pEbatmfEsco78Lm6F
         gdQjtxHkE+8R6FX4KTW/leivPFH8Spc+6Gd+awyy1ksoy3Qn7SCxa3XqZJqplshqyf4N
         5P7P2kSZp0nehIXtHqCQTJCBBlhdfQDlm/S2vgT6FcKd5hsCNuKyvbk1Ko5QQnKxSAfF
         tcw+fvBCSxtZwYzQ8SQa5zqqNgsjq6AGCyDa1LAyP9XJinpSaSarWKx4TiNitohq8yhG
         2y7xJ+leIpWL2kPeIC+jMhY8ZB5NIBLa4tHokIlGt3RGEeYnp2Q3a0oDPPQgohbrBk9E
         L+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709128352; x=1709733152;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/QgX3d2GmmEaeKazC02JMPPR+cdwuaWvIKU6akMN0U=;
        b=Ogdh2pCWGWaoeu2mafflGFdmYi/VVCebOGldbCbJhO9yrH72X1sJH43KPTw8q+r0Ac
         oWzxFDwAJP7zye9fCWtfhHTOdgavqBH8TGGO0/MRkaQb99a5LfWETfq1mvfyviAZWNbe
         rRkA59wmol1iGRVbugbOs0W0TzwwRfo3/9CQcA1DIEix5fTT00qBEUJfusycwCwC/4uw
         UuMyTdsUPFCSFsXo29ooTCL70BAKJArVMXk3URk3ejxTLY89f4GFBo7t+bw8gZrEM5XJ
         jigr9VEUggXJ6Iacr7dGBRX7L/EM3Pcj31IA5lDtK6t2brc8zrSFP9wFGIYgTzGIHrXn
         lfPg==
X-Gm-Message-State: AOJu0YzWLSHogjE3LhPLJ3sEpVwnjphp/nm/Y/Ev054AuJV4Deo2v1SP
	5QgpsezdR7TdDI9u52gjLso0LcCVM/nCfTqlZ83h9MOQ3IvzPMOe3OAKtPNfRHE9NBBozuQ5r54
	=
X-Google-Smtp-Source: AGHT+IHw+/IuBLaeeo8x6NbzlhNGLECq9A1xf3dIcqlbJd62TTy6LJ4i9ZBlmf4YPKGTOwnwHCbpJQ==
X-Received: by 2002:a17:906:6d45:b0:a43:4c0a:5360 with SMTP id a5-20020a1709066d4500b00a434c0a5360mr5894721ejt.32.1709128351933;
        Wed, 28 Feb 2024 05:52:31 -0800 (PST)
Message-ID: <45f89d82-bdc6-44b6-a784-bcdfdcca403d@suse.com>
Date: Wed, 28 Feb 2024 14:52:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/4] x86/traps: use entry_ssp in fixup_exception_return()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <33da6f8b-af22-48c8-acce-3aa55c0e0414@suse.com>
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
In-Reply-To: <33da6f8b-af22-48c8-acce-3aa55c0e0414@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

With the value recorded on entry there's no need anymore to go hunt for
the respective exception frame on the shadow stack. By deriving "ptr"
from that field (without any offset), it then ends up pointin one slot
lower than before. Therefore all array indexes need incrementing, nicely
doing away with all the negative ones.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Indentation of the prior inner (but not innermost) if()'s body is
deliberately left untouched, to aid review. It'll be adjusted in a
separate follow-on patch.

--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -434,18 +434,6 @@ unsigned long get_stack_trace_bottom(uns
     }
 }
 
-static unsigned long get_shstk_bottom(unsigned long sp)
-{
-    switch ( get_stack_page(sp) )
-    {
-#ifdef CONFIG_XEN_SHSTK
-    case 0:  return ROUNDUP(sp, IST_SHSTK_SIZE) - sizeof(unsigned long);
-    case 5:  return ROUNDUP(sp, PAGE_SIZE)      - sizeof(unsigned long);
-#endif
-    default: return sp - sizeof(unsigned long);
-    }
-}
-
 unsigned long get_stack_dump_bottom(unsigned long sp)
 {
     switch ( get_stack_page(sp) )
@@ -837,24 +825,26 @@ static void fixup_exception_return(struc
 {
     if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
     {
-        unsigned long ssp, *ptr, *base;
+        unsigned long ssp = rdssp();
 
-        if ( (ssp = rdssp()) == SSP_NO_SHSTK )
-            goto shstk_done;
+        if ( ssp != SSP_NO_SHSTK )
+        {
+            unsigned long *ptr = _p(regs->entry_ssp);
+            unsigned long primary_shstk =
+                (ssp & ~(STACK_SIZE - 1)) +
+                (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8;
 
-        ptr = _p(ssp);
-        base = _p(get_shstk_bottom(ssp));
+            BUG_ON((regs->entry_ssp ^ primary_shstk) >> PAGE_SHIFT);
 
-        for ( ; ptr < base; ++ptr )
-        {
             /*
-             * Search for %rip.  The shstk currently looks like this:
+             * The shstk currently looks like this:
              *
              *   tok  [Supervisor token, == &tok | BUSY, only with FRED inactive]
              *   ...  [Pointed to by SSP for most exceptions, empty in IST cases]
              *   %cs  [== regs->cs]
              *   %rip [== regs->rip]
-             *   SSP  [Likely points to 3 slots higher, above %cs]
+             *   SSP  [Pointed to by entry_ssp; Likely points to 3 slots
+             *         higher, above %cs]
              *   ...  [call tree to this function, likely 2/3 slots]
              *
              * and we want to overwrite %rip with fixup.  There are two
@@ -867,13 +857,10 @@ static void fixup_exception_return(struc
              *
              * Check for both regs->rip and regs->cs matching.
              */
-            if ( ptr[0] == regs->rip && ptr[1] == regs->cs )
-            {
-                unsigned long primary_shstk =
-                    (ssp & ~(STACK_SIZE - 1)) +
-                    (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8;
+            BUG_ON(ptr[1] != regs->rip || ptr[2] != regs->cs);
 
-                wrss(fixup, ptr);
+            {
+                wrss(fixup, &ptr[1]);
 
                 if ( !stub_ra )
                     goto shstk_done;
@@ -890,7 +877,7 @@ static void fixup_exception_return(struc
                  * - if we're on an IST stack, we need to increment the
                  *   original SSP.
                  */
-                BUG_ON((ptr[-1] ^ primary_shstk) >> PAGE_SHIFT);
+                BUG_ON((ptr[0] ^ primary_shstk) >> PAGE_SHIFT);
 
                 if ( (ssp ^ primary_shstk) >> PAGE_SHIFT )
                 {
@@ -899,37 +886,27 @@ static void fixup_exception_return(struc
                      * addresses actually match.  Then increment the interrupted
                      * context's SSP.
                      */
-                    BUG_ON(stub_ra != *(unsigned long*)ptr[-1]);
-                    wrss(ptr[-1] + 8, &ptr[-1]);
+                    BUG_ON(stub_ra != *(unsigned long*)ptr[0]);
+                    wrss(ptr[0] + 8, &ptr[0]);
                     goto shstk_done;
                 }
 
                 /* Make sure the two return addresses actually match. */
-                BUG_ON(stub_ra != ptr[2]);
+                BUG_ON(stub_ra != ptr[3]);
 
                 /* Move exception frame, updating SSP there. */
-                wrss(ptr[1], &ptr[2]); /* %cs */
-                wrss(ptr[0], &ptr[1]); /* %rip */
-                wrss(ptr[-1] + 8, &ptr[0]); /* SSP */
+                wrss(ptr[2], &ptr[3]); /* %cs */
+                wrss(ptr[1], &ptr[2]); /* %rip */
+                wrss(ptr[0] + 8, &ptr[1]); /* SSP */
 
                 /* Move all newer entries. */
-                while ( --ptr != _p(ssp) )
-                    wrss(ptr[-1], &ptr[0]);
+                while ( ptr-- != _p(ssp) )
+                    wrss(ptr[0], &ptr[1]);
 
                 /* Finally account for our own stack having shifted up. */
                 asm volatile ( "incsspd %0" :: "r" (2) );
-
-                goto shstk_done;
             }
         }
-
-        /*
-         * We failed to locate and fix up the shadow IRET frame.  This could
-         * be due to shadow stack corruption, or bad logic above.  We cannot
-         * continue executing the interrupted context.
-         */
-        BUG();
-
     }
  shstk_done:
 


