Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFZXK6OReGmirAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 11:21:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2081892ADA
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 11:21:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214179.1524550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkgC8-0005bJ-EC; Tue, 27 Jan 2026 10:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214179.1524550; Tue, 27 Jan 2026 10:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkgC8-0005Zs-BL; Tue, 27 Jan 2026 10:21:12 +0000
Received: by outflank-mailman (input) for mailman id 1214179;
 Tue, 27 Jan 2026 10:21:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkgC7-0005Zm-0x
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 10:21:11 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5390441-fb69-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 11:21:08 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4801eb2c0a5so53726905e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 02:21:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c24a8asm36782834f8f.12.2026.01.27.02.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 02:21:07 -0800 (PST)
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
X-Inumbo-ID: e5390441-fb69-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769509268; x=1770114068; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvOM98ARq7BtgTvs6SHEfsNaOCEcKGRIgkInqDxK0Ks=;
        b=fgaXjonolvtKagkchKilWfZ75Yis23pRqp2V319961nzV1cnSkdovVH1bbBi97v3d5
         EVNA/W8xuEDwU0g4eUeOIHAec9NUuNwSQJnfenWQ2OKtayaMcPa9ufdezcMu2WJESv5h
         V1kUcR2+jbCWtFzYBQdsL8TLrbQKh6YmpBrYJFJ2sBZFdJf2fSVCpxToXKeBvAOvq1ms
         YqC1itfTH6eA8s2j7BppSUPGPKVlxdAwipoGB9GxP9aZpxhWc0UO1f0U6vG7I4nPDJA8
         Y7EwHK/acIWKKUDBMwTE8YcSI1MRsobDLHU8ayEIQCSpKpATCbDom9dWUKac8a0LiwLY
         6EYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769509268; x=1770114068;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qvOM98ARq7BtgTvs6SHEfsNaOCEcKGRIgkInqDxK0Ks=;
        b=sQb62Kxv9KVNXcIrTraka4rGHx00DtZQE8a+fMJmW68eMqljFT+AkZA8Lm3v8CauM1
         L6fYegn39/0ILloJvgWd7vB962l4fYCsPbDW/+tlddKHrT6RD48PH2kryjvQ1C/lL29Q
         ZVmgshg949ukf0ZKJn0f+77NtsAVBYOvXT7rq47F3yWSmVBFQkET+9wisSP1wUiJszVA
         F03T+t82rFxK7ksQ4wfOvPwWAvfj2NkIZJ8gqlq3Pm1daO4BS7ZYPXSrVh1Bu5tHQiwT
         4i1TY+JHATEK/gyXkNLseyOGI1y0gOTKoWEbJGmsSLFOr+uCcTEoTXq79DTwpXfCqDmJ
         4HgA==
X-Gm-Message-State: AOJu0Yyp6WtAXt64UStZLJIu9hiKo0xqYdH1fvBbDdivCXvBEUhBtHoS
	RgzoRxUMJFwkd+QsuK7k93XkRIyksvXpqrNJTzhJgOJDkbSt2Hg9a6lRqWOIobHuPkX53SWX8Eh
	zKIE=
X-Gm-Gg: AZuq6aK9/2yL4b5nTYRiimY7X7GDXsSbXtncjiXuibUSOvmRU91LnLYyhOfeASP4ewo
	O8DrYawy8blfVsUpu4gFhmVPYZ+n6BsyALlDbogtCS/vSxWbH0a/UzcUqTANcURblJOAYHH+XEJ
	mRMa5ClmOP8cE+I1awUXvRzY5gCX5LF/eXvacZcsp9y/s+4dEbX5wuaPKGLkUHDqkLz8m04sDAY
	o4oJuno8xWpDmRkPAqfHaNGhTxw0osWmLbkIXB7YiHZkrljpEzd3NDZhoybjphOYVL4rg40m7/Y
	x8sVBX+Ot0M4zg1dDERY+gGi6ozOAOqWwkJHxTuU8CevsDYTEEY/ek8ExOki3zGhHvViSLFpCbO
	a3rnZ4aXhltaLl9mLrkWZo7vf9fPYPBXbPNVytrhnkUiPbJaf3BUu9jAef3K71J+XSzHYRDyfuf
	6ESx/ff/GEQ6jS99Fi9a7mgWpVOB0aIfFUU2moS8mrseMojRZZHpMYtdYoG2DcypUxLDicpQqTl
	H4=
X-Received: by 2002:a05:600d:15a:20b0:47e:c562:a41f with SMTP id 5b1f17b1804b1-48069c55790mr11947965e9.18.1769509267792;
        Tue, 27 Jan 2026 02:21:07 -0800 (PST)
Message-ID: <7987f1fc-5b5e-40c6-866e-ac332097c635@suse.com>
Date: Tue, 27 Jan 2026 11:21:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: allow ->write_msr() to distinguish origins of writes
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
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,sreg.base:url];
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
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2081892ADA
X-Rspamd-Action: no action

Only explicit writes are subject to e.g. the checking of the MSR intercept
bitmap, which extends to VM-event's hvm_monitor_msr(). Indicate, by way of
a new boolean parameter, to the hook functions which variant it is.

Fixes: 6eb43fcf8a0b ("x86emul: support SWAPGS")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Later, in particular for nested, ->read_msr() may need to gain a similar
parameter.

Prior to nested making use of it, the new parameter is effectively dead
code with VM_EVENT=n. If we accepted Misra rule 2.2, something would
likely need doing about this.

I've suitably re-based "x86emul: misc additions" on top of this, but I
don't think I'll re-post it just for that.

--- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
+++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
@@ -569,7 +569,8 @@ static int fuzz_read_msr(
 static int fuzz_write_msr(
     unsigned int reg,
     uint64_t val,
-    struct x86_emulate_ctxt *ctxt)
+    struct x86_emulate_ctxt *ctxt,
+    bool explicit)
 {
     struct fuzz_state *s = ctxt->data;
     struct fuzz_corpus *c = s->corpus;
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -1705,7 +1705,8 @@ static int cf_check hvmemul_write_io_dis
 static int cf_check hvmemul_write_msr_discard(
     unsigned int reg,
     uint64_t val,
-    struct x86_emulate_ctxt *ctxt)
+    struct x86_emulate_ctxt *ctxt,
+    bool explicit)
 {
     return X86EMUL_OKAY;
 }
@@ -2427,9 +2428,10 @@ static int cf_check hvmemul_read_msr(
 static int cf_check hvmemul_write_msr(
     unsigned int reg,
     uint64_t val,
-    struct x86_emulate_ctxt *ctxt)
+    struct x86_emulate_ctxt *ctxt,
+    bool explicit)
 {
-    int rc = hvm_msr_write_intercept(reg, val, true);
+    int rc = hvm_msr_write_intercept(reg, val, explicit);
 
     if ( rc == X86EMUL_EXCEPTION )
         x86_emul_hw_exception(X86_EXC_GP, 0, ctxt);
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1038,7 +1038,8 @@ static int cf_check read_msr(
 }
 
 static int cf_check write_msr(
-    unsigned int reg, uint64_t val, struct x86_emulate_ctxt *ctxt)
+    unsigned int reg, uint64_t val, struct x86_emulate_ctxt *ctxt,
+    bool explicit)
 {
     struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
--- a/xen/arch/x86/x86_emulate/0f01.c
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -40,7 +40,7 @@ int x86emul_0f01(struct x86_emulate_stat
             fail_if(!ops->write_msr);
             rc = ops->write_msr(regs->ecx,
                                 ((uint64_t)regs->r(dx) << 32) | regs->eax,
-                                ctxt);
+                                ctxt, true);
             goto done;
         }
         generate_exception(X86_EXC_UD);
@@ -194,7 +194,7 @@ int x86emul_0f01(struct x86_emulate_stat
              (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
                                  ctxt)) != X86EMUL_OKAY ||
              (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
-                                  ctxt)) != X86EMUL_OKAY )
+                                  ctxt, false)) != X86EMUL_OKAY )
             goto done;
         sreg.base = msr_val;
         if ( (rc = ops->write_segment(x86_seg_gs, &sreg,
@@ -202,7 +202,7 @@ int x86emul_0f01(struct x86_emulate_stat
         {
             /* Best effort unwind (i.e. no real error checking). */
             if ( ops->write_msr(MSR_SHADOW_GS_BASE, msr_val,
-                                ctxt) == X86EMUL_EXCEPTION )
+                                ctxt, false) == X86EMUL_EXCEPTION )
                 x86_emul_reset_event(ctxt);
             goto done;
         }
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -3814,7 +3814,7 @@ x86_emulate(
         fail_if(ops->write_msr == NULL);
         if ( (rc = ops->write_msr(_regs.ecx,
                                   ((uint64_t)_regs.r(dx) << 32) | _regs.eax,
-                                  ctxt)) != 0 )
+                                  ctxt, true)) != 0 )
             goto done;
         break;
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -470,13 +470,15 @@ struct x86_emulate_ops
         struct x86_emulate_ctxt *ctxt);
 
     /*
-     * write_dr: Write to model-specific register.
-     *  @reg:   [IN ] Register to write.
+     * write_msr: Write to model-specific register.
+     *  @reg:      [IN ] Register to write.
+     *  @explicit: [IN ] Whether this is an explicit WRMSR or alike.
      */
     int (*write_msr)(
         unsigned int reg,
         uint64_t val,
-        struct x86_emulate_ctxt *ctxt);
+        struct x86_emulate_ctxt *ctxt,
+        bool explicit);
 
     /*
      * cache_op: Write-back and/or invalidate cache contents.

