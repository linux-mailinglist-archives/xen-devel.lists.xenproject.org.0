Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFrZEChG1mkFCwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:12:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FAD3BBD2F
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275905.1561579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARlQ-0001iZ-In; Wed, 08 Apr 2026 12:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275905.1561579; Wed, 08 Apr 2026 12:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARlQ-0001fr-GF; Wed, 08 Apr 2026 12:12:08 +0000
Received: by outflank-mailman (input) for mailman id 1275905;
 Wed, 08 Apr 2026 12:12:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wARlO-0001fd-G9
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:12:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wARlN-0059zL-SN
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 14:12:05 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d6460a-bab6-0a2a0a5309dd-0a2a4509cb86-36
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:12:05 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d64615-bf79-0a2a45090019-d155802fdcce-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:12:05 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488ba6366a7so27390915e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 05:12:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488c55d1347sm26922435e9.4.2026.04.08.05.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 05:12:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775650325; x=1776255125; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCmUHnX4lfLVvQXrlBVVBQ6jAhvuU7BVpCLwZlOIldo=;
        b=PiPFxAmJ4nWAkdaVdhwKo3Rtp/mJoYc3lE/michp2yekHOHSw81fHk9fNou0CbcJjR
         eEgsi/pvETw2D1E2g1qqsv1qFibsqlg3/vZjnn61q2ReIsMYft9S8/Qo3tj+gd+bc4Sr
         hSQXZMvt1lfoolejDJZU6Mxgw/y4QWpknWZ1Jl3SFX0bZM869QZBSFcYZBz7vydsLPt+
         Pe/FG4hrN1wIrIUux3mrToPzmh4Zx2XACKa+/dYvHaorRM2M71jKWRaeqjbWaVfrZHrg
         f0ssmYZi6ya89D/VLFw9d8E7pFaoUj4YIFgxQou31Y0EZv6O8fp2wIAVplu5nSDHot++
         Z7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775650325; x=1776255125;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HCmUHnX4lfLVvQXrlBVVBQ6jAhvuU7BVpCLwZlOIldo=;
        b=DTn+4FTP822uYrKV31AiWy59s9aRXacgOQMRd5M4PYlb5WHXepPm4utQ8/99j69yh3
         t6Pmf9gWh+D1ycrRrlNN5McZznqWygPPwCpU5cy0GLUyFczpyLMgfSN1Ha322VKCh+8a
         7oajstHIjsU6YDueXTVlmaWBOyVip2roGIYQQqDT+qA3fKBN2doA2chrmDKP0hLkNxOs
         koW6+8XPJKWVIb3/XK4Y6pIhmeXOnGARv9rckfd4Sa2FeFXpwRl2PjA/7LOVLWUgsu+4
         f8RB5/m7FVdIRcqvEjIGmx1wioghTyvoY7/MEZWdPQ1IGhOp1DaBVsPA/mOMrer4/QGB
         VWmg==
X-Gm-Message-State: AOJu0YzIM2h1NqhJnSFrp13xCOFX2L+aLD1XfO0dbChegIt7exAKOic6
	nUQyZV5TGevm91whETZ1hsgoF4mHsIq4bINCTG6AGcDIjGHMQHJkhQlTCAy5U1HTtUfQATOpTgc
	fU0a1PQ==
X-Gm-Gg: AeBDieu35CezkAgLKbCzlohEBX2+l6nRUTrUt6bXnUlhxXLNN76d/DkLHCGs8ZCba27
	AZvKRXyJOaTCGrrZ7Q85F6/jgezDFVAYVteQsZ4KunpXO2bRIJXc+2SiVqGpxi7hpo6uqJgDUpB
	g3jbRTGNYbnxG6MJ7lhoicH2K3/iuCtKFib6SWym42XZtgUHyA7HqUq7ve4CYmmThQzeENB67P0
	mU2IBm5+noaLL4XQEEMJfN9b4M0iheg5wInejKopn51lagKR4h3HmSLefZzojOa7hi9DbvtFLZu
	07uR2nH6mo5EAP1VF5VFjaxRWBL3bI4RPb4crgXppdIMD2VOeGAlK6UMuKnAl3Ogt5SoiFVZSP7
	8S4oFp9HE0gq+TVIUu2gky0sfePOI+RzlNyWKpvLigffoVUc6JJf2WgsdZGdEuNxIsZc5jkYc4E
	2YJZflGJX3bpuzIRRLFzNrefhkm+qSGv2bjxnHcz/1Gs7woyBVXLCozd9HKGKh8gKyByH8gG3mI
	WCtvsz+lAJoTUs=
X-Received: by 2002:a05:600c:1553:b0:488:acbc:b2e with SMTP id 5b1f17b1804b1-488acbc0ca8mr173907175e9.17.1775650324898;
        Wed, 08 Apr 2026 05:12:04 -0700 (PDT)
Message-ID: <deb26054-ec00-483c-bc18-1edc1b4599b3@suse.com>
Date: Wed, 8 Apr 2026 14:12:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v10] x86: use / "support" UDB
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
X-purgate-ID: tlsNG-bad1c0/1775650325-2ED4F152-29B1A2FA/0/0
X-purgate-type: clean
X-purgate-size: 2238
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 91FAD3BBD2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With opcode D6h now firmly reserved as another #UD-raising one in 64-bit
mode, use that instead of the two-byte UD2 for bug frame marking.

While there also make a minor adjustment to the emulator.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
One of the table entries in stub_selftest() uses UD1, yet in not quite
an appropriate way: The 0x90 following it (presumably meant to be a NOP)
really is a ModR/M byte, requiring a displacement to follow. Wouldn't we
better adjust that (e.g. using 0xcc instead)?
---
v10: Shrink the actual emulator change to just a comment adjustment.
     Extend .byte directive commentary.
v9: New.

--- a/xen/arch/x86/include/asm/bug.h
+++ b/xen/arch/x86/include/asm/bug.h
@@ -21,7 +21,7 @@
 
 #ifndef __ASSEMBLER__
 
-#define BUG_INSTR       "ud2"
+#define BUG_INSTR       ".byte 0xd6" /* UDB, requiring gas 2.46 */
 #define BUG_ASM_CONST   "c"
 
 #else  /* !__ASSEMBLER__ */
@@ -37,7 +37,7 @@
         .error "Invalid BUGFRAME index"
     .endif
 
-    .L\@ud: ud2a
+    .L\@ud: .byte 0xd6 /* UDB, requiring gas 2.46 */
 
     .pushsection .rodata.str1, "aMS", @progbits, 1
          .L\@s1: .asciz "\file_str"
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1338,7 +1338,7 @@ void asmlinkage do_trap(struct cpu_user_
 
 void asmlinkage do_invalid_op(struct cpu_user_regs *regs)
 {
-    u8 bug_insn[2];
+    uint8_t bug_insn;
     const void *eip = (const void *)regs->rip;
     int id;
 
@@ -1350,8 +1350,8 @@ void asmlinkage do_invalid_op(struct cpu
     }
 
     if ( !is_active_kernel_text(regs->rip) ||
-         copy_from_unsafe(bug_insn, eip, sizeof(bug_insn)) ||
-         memcmp(bug_insn, "\xf\xb", sizeof(bug_insn)) )
+         copy_from_unsafe(&bug_insn, eip, sizeof(bug_insn)) ||
+         bug_insn != 0xd6 /* UDB */ )
         goto die;
 
     id = do_bug_frame(regs, regs->rip);
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -651,7 +651,7 @@ decode_onebyte(struct x86_emulate_state
     case 0xce: /* into */
     case 0xd4: /* aam */
     case 0xd5: /* aad */
-    case 0xd6: /* salc */
+    case 0xd6: /* salc / udb */
         s->not_64bit = true;
         break;
 

