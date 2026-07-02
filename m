Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kaNoKrlDRmqeNAsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 12:55:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD546F6464
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 12:55:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=QSciwZm4;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1351652.1608765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfF55-0005Iv-HM; Thu, 02 Jul 2026 10:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351652.1608765; Thu, 02 Jul 2026 10:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfF55-0005G4-E4; Thu, 02 Jul 2026 10:55:43 +0000
Received: by outflank-mailman (input) for mailman id 1351652;
 Thu, 02 Jul 2026 10:55:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfF53-0005Cy-U6
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 10:55:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfF53-005SQm-Ai
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 12:55:41 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4643a0-bab6-0a2a0a5309dd-0a2a45078f00-16
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 12:55:41 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4643ad-9c8e-0a2a45070019-d155dd2eec47-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 12:55:41 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-476a130c138so1548930f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 03:55:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477de3dcf59sm8095181f8f.34.2026.07.02.03.55.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 03:55:40 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782989741; x=1783594541; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v/oOuLNsb9sp/2KN0lUVF17VXE209vMr5egGnhDKc+8=;
        b=QSciwZm4Sqjo8HcN3GFTnHote/Ra7qMd14YkrQLee5zAAvkTv82OUXgeuLQ7rJRHdL
         wUzmOc4bZu7wXpak+iKvRv7vFFt/f5gcX5I10PdQx3spqrw4nD/JVIk8XRHiwF3iSzQS
         BBu4ocYe4Su66/CnKhVx7C196L+lW03Odk9QkIaUpCpfRnd3oBUWBeFEPELmrbDtT1CW
         GHnALswW+tO5gYU8pOiYr6OtMU1A+a7/qw/YZ6Bi4565lVRn18Qo0vqTKYA4qT0bk1s1
         ZRSLPzjrXwQGCNTaXmiso6n0LTwtkn3vQQ6p2h3pI1s6F65X0YOsV1Hos1sPwVph5XAs
         BkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989741; x=1783594541;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v/oOuLNsb9sp/2KN0lUVF17VXE209vMr5egGnhDKc+8=;
        b=gvr4Hf0JcZl53EqtnnMm8PZdWITNe6ntjQkHYK6U6AZpJNxJg0qOWY677X7Uj7HrOM
         PXK0bF0zWyIYNWmEewFZN7tS1qiG9/Q5Jz27mJEou6oZXdLzrK5YeExndehv1Og7pclu
         ggVWkLyGA0GSiooPK7KF1s/gZj2C0S5Ecfj0X4LJcT4VvvEbjHZW2KgW4dXg/8Con5xC
         7ll0upuzLT9uf4JBpimxtupEUvIrl83GhrswjbMhS5xaJJAVJ4kz4Zkp+lD7FvTaZJhy
         56iJ72hjimYsAcuGaLP4N6Tohi2tbMbuQlMsGZSul2lvmBGemIIidM7wNliO9PJKOPTe
         1fEw==
X-Gm-Message-State: AOJu0YwjR8Xyi2+PlTIaRlRAMf72VHAwlqca1pR1y5CG8V7QVvySYdkU
	Jm0ZYHLahvisDz0TiMOZK46JoD2+L9s5KOgm/h90nik8DWXeBXcfC2uEZw3imJV8DKX/iHqa4Jm
	lIczSqA==
X-Gm-Gg: AfdE7ckIJ0u3oeQGE8y8wA/Ot2DGrvWEHuwWdf36xjjSqZFYBBpAN7jjaaGM+qSmMyM
	QAn+8yveSYSsALb7UZ5fyr6E9TrCh1UVLjFFWdfx4vro304ru3vOJFcGpoRwyFF8GCBMATEnq2N
	QqaWaSDxHKZ0AqkUJfSN0buj9v/xk4Yh86Uzk9inc6DuLftCKz3HygVCl+o1Eq/MFiFp6LqF11A
	5J8MrZXVSplfuRUFn0E15Gzk1oAIlH+9zeVMq0Y6NY+Sr5+1AnAwoFyQQZBKON6ut/UirrPGInD
	vQ8piYhM/FjkniS71UzdVLJlZHia6fSqSoIjrPE1RA0Z6+VpEE7TjhYUBuhQ+72w7XE3mZv6dkI
	DPXTXtxjy361IybuyiLFmhfCLGiCmqPiK/L9SYbYXSKufS8RsVluCZeRM7BdNUvKyEOj65cQRLj
	+wc5twcX1TYLzXbdas6jawumAyIwoXXmcB9jJYhuRlur96pTqwaIwbDKlG9wnqiqThtCKmXD7yO
	j5c
X-Received: by 2002:a5d:5f56:0:b0:470:390c:1e73 with SMTP id ffacd0b85a97d-477b39839cbmr7299589f8f.18.1782989740669;
        Thu, 02 Jul 2026 03:55:40 -0700 (PDT)
Message-ID: <8af61c08-71f9-4d18-ba9c-952b7894c44d@suse.com>
Date: Thu, 2 Jul 2026 12:55:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 3/4] x86/traps: use entry_ssp in fixup_exception_return()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7ba5ecff-af64-49c0-abf9-23963ca56aa6@suse.com>
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
In-Reply-To: <7ba5ecff-af64-49c0-abf9-23963ca56aa6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1782989741-7DB2325E-58462B72/0/0
X-purgate-type: clean
X-purgate-size: 5876
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:wl@xen.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
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
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3FD546F6464

With the value recorded on entry there's no need anymore to go hunt for
the respective exception frame on the shadow stack. By deriving "ptr"
from that field (without any offset), it then ends up pointing one slot
lower than before. Therefore all array indexes need incrementing, nicely
doing away with all the negative ones.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Indentation of the prior inner (but not innermost) if()'s body is
deliberately left untouched, to aid review. It'll be adjusted in a
separate follow-on patch.
---
v3: Relax the first BUG_ON().
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
@@ -1187,26 +1174,29 @@ void asmlinkage noreturn do_unhandled_tr
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
+            BUG_ON((regs->entry_ssp ^ primary_shstk) >>
+                   (PAGE_SHIFT + STACK_ORDER));
 
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
@@ -1219,13 +1209,10 @@ static void fixup_exception_return(struc
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
@@ -1242,7 +1229,7 @@ static void fixup_exception_return(struc
                  * - if we're on an IST stack, we need to increment the
                  *   original SSP.
                  */
-                BUG_ON((ptr[-1] ^ primary_shstk) >> PAGE_SHIFT);
+                BUG_ON((ptr[0] ^ primary_shstk) >> PAGE_SHIFT);
 
                 if ( (ssp ^ primary_shstk) >> PAGE_SHIFT )
                 {
@@ -1251,39 +1238,30 @@ static void fixup_exception_return(struc
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


