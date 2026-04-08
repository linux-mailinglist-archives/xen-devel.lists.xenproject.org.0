Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLKTDL9I1mkFCwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:23:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B04873BBF3E
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:23:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275955.1561616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARwB-00057z-8q; Wed, 08 Apr 2026 12:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275955.1561616; Wed, 08 Apr 2026 12:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARwB-00056U-4p; Wed, 08 Apr 2026 12:23:15 +0000
Received: by outflank-mailman (input) for mailman id 1275955;
 Wed, 08 Apr 2026 12:23:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wARw9-00054e-Mc
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:23:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wARw9-001tBn-2b
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 14:23:13 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d648a0-bab6-0a2a0a5309dd-0a2a450bada0-44
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:23:12 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d648b0-bca8-0a2a450b0019-d155dd32c59d-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:23:12 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-43d572f7437so124452f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 05:23:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4e56fesm55610941f8f.27.2026.04.08.05.23.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 05:23:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1775650992; x=1776255792; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TZdRtcCtuhtN8vbXovqjZa6WKbRVlKT1bRPS4NdGyTY=;
        b=SBRk7/rBqVmg1JCT8ca5KXzgm2N27AmEZRDYEzNsdb1/KANGWh3R6599aGfc9CFGba
         H9XDMlQEWiRdCDIgwUt+OolHMF98seGjHwmVh5i1Er/M0/OYuKpUy3e+BllqRBzJGaNS
         zt49/cn97JicTBxkh2nz+plwIFDGzZVyOxzE3Zx/UhxjtHG3Va3L4GUc1jAQppi5skkO
         CtgE+NM22t2XXyRqrowd7m7+zYGe3F8f4UVlGWwZIFoy/1x1sF35zlrbGogwj1cjeul2
         Bu3YCgpDCizzAw3dBOZgx2IdcgWFnxgrV9Onkfqb/lWklQ3laqA+ucA8P0YcVmBejYKx
         ODpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775650992; x=1776255792;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZdRtcCtuhtN8vbXovqjZa6WKbRVlKT1bRPS4NdGyTY=;
        b=WmB3UhDl8pn3iJ6TL/SfFWLUgQFmJFXpZDUmQCR59Yuf1g06mcdikpscvrRKHrBpNS
         1shLVD8uxr/OvOLUhrAG9TNj2/4dC5029ztC5eWnk9xnU8xZLGHazGdjBpVgOsSaXhMP
         q+ilhE7PuCYrCAa8iuV4SRZYCFr2kRG6C4FAB6qVRIhTX93BpCxRYyC41/EJhVWnQEN1
         lxzrGpo5b4PBJ6uytKCKLpsGo1/yHGuS3i9gWZRBJ8hvfm+XG2o90OgwphQ25r4R9FK1
         2FZiiJ8zIdeKyZ6H9Z9ghALbRKxyLcVofrc1+OxzRI9b7yYMz9yG8sbjzmazybbmiMkt
         IxrQ==
X-Gm-Message-State: AOJu0YwrIEDBD+STTkse73pTGe/2bxtS0fD0bh5aPfNdCkSiF7/mcbZJ
	6MpBLH5dniwi6t0zrLWvCB/XdEgDc6Nm7dBxFqRQLCdGD659WF89s96S34p9xNka8uwsHPQk43H
	1ahzsdw==
X-Gm-Gg: AeBDiettZSvhE70GklXl98eEZegA3fsptVEpCqnl1e9Eq/hOzuJNieOVTFBCtXSr45n
	2Ck2So7HsHSqWJyghALd0sqkVVU2anwHtMGA6L10QtmGowv/EVbPo0n00xzViNdHYUqu21x2JiI
	QWwYENbXLd0U1oEsH2OJoBRX+mYh6t1ga5oxI41XQ9ZYoURSRCUCqqPdZeqezLzuOP67p8TuKip
	W+Oma1rS+i77XMNuJ/Fjml4rUNnUgTR+DdyzV4Uhp9bttC3vlkFr98oFcs+8VzQsUPypvxPAQPL
	u+8UmJwjYtj7SAJz4WdpmP/oHHXqaA+IrmILjoypqK/E4lPtWdUydDykkX0Q9EKDAqqZh/mSrKK
	rAY+LuNDCfgo7yGMdVZj1Sq+jYwoFCoCY0VUa3nr7zWVr/NJlldoTHvhMrkUP09G6lHccerF7Ko
	gC5A4Eh1JbDM2fNw1v0dhpSoFPzGM91WMgLsTPBLKkqeDcbjeMJsyIIsrDS7g4kGaKXX1zzM9xz
	kI4Bg3JEfvEWaB/sszF/crQ1Q==
X-Received: by 2002:a5d:64e4:0:b0:43b:8fa4:194d with SMTP id ffacd0b85a97d-43d292855famr29512917f8f.6.1775650992265;
        Wed, 08 Apr 2026 05:23:12 -0700 (PDT)
Message-ID: <79c90706-0530-4b72-9b43-f003dfe87291@suse.com>
Date: Wed, 8 Apr 2026 14:23:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/3] x86/traps: use entry_ssp in fixup_exception_return()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <f064c3af-c22a-40e0-a268-ee37e34297a3@suse.com>
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
In-Reply-To: <f064c3af-c22a-40e0-a268-ee37e34297a3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1775650992-EE54B2A1-38389B42/0/0
X-purgate-type: clean
X-purgate-size: 5807
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
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
X-Rspamd-Queue-Id: B04873BBF3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
---
v2: IS_ENABLED() -> #ifdef. Re-base.

--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -690,19 +690,6 @@ unsigned long get_stack_trace_bottom(uns
     }
 }
 
-static unsigned long get_shstk_bottom(unsigned long sp)
-{
-    /* SAF-11-safe */
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
@@ -1187,26 +1174,28 @@ void asmlinkage noreturn do_unhandled_tr
 static void fixup_exception_return(struct cpu_user_regs *regs,
                                    unsigned long fixup, unsigned long stub_ra)
 {
-    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
+#ifdef CONFIG_XEN_SHSTK
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
@@ -1219,13 +1208,10 @@ static void fixup_exception_return(struc
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
@@ -1242,7 +1228,7 @@ static void fixup_exception_return(struc
                  * - if we're on an IST stack, we need to increment the
                  *   original SSP.
                  */
-                BUG_ON((ptr[-1] ^ primary_shstk) >> PAGE_SHIFT);
+                BUG_ON((ptr[0] ^ primary_shstk) >> PAGE_SHIFT);
 
                 if ( (ssp ^ primary_shstk) >> PAGE_SHIFT )
                 {
@@ -1251,39 +1237,30 @@ static void fixup_exception_return(struc
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
+#endif /* CONFIG_XEN_SHSTK */
 
     /* Fixup the regular stack. */
     regs->rip = fixup;


