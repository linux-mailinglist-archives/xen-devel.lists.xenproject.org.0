Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD47830309
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 11:00:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668343.1040467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2iW-0007Pd-EV; Wed, 17 Jan 2024 10:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668343.1040467; Wed, 17 Jan 2024 10:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2iW-0007Ni-BB; Wed, 17 Jan 2024 10:00:16 +0000
Received: by outflank-mailman (input) for mailman id 668343;
 Wed, 17 Jan 2024 10:00:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQ2iU-0007K4-L1
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 10:00:14 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34fb0fc7-b51f-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 11:00:13 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e8d3b29f2so416945e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 02:00:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s8-20020a05600c45c800b0040e527602c8sm26023093wmo.9.2024.01.17.02.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 02:00:12 -0800 (PST)
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
X-Inumbo-ID: 34fb0fc7-b51f-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705485613; x=1706090413; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vREreRDX9LMqGtvWcecYgobHNabcN+0PAlDNZTRFwQA=;
        b=O5z3JSUz3y3YIK4/fg90ujp1wFLIpJhugNhUzXdp19FJ3GjRb3DbYD1sv1+sZ34a4g
         Xtg81fCN++7oP9LQG96R28BTX/+Ahy/IVkg4gJcBBgZ3/xq6neM/j7yY8YyA3xqgilny
         wuJiEbXulOptm/Ws+Dp4u+vNRxJp0g708Ux3RnGHm4oofebpOvfO95LzU9tl8Dq+sEDW
         KDLvQXms6yPiYjSNJ2oReFKIGak8dTuwiltjV/DBt65uE7052Ak9VtAIBpKeLhQuDlDC
         C5fvh3fKKdFByIGA9ir6VS6b5Qz3OkbF2ySJzB3qHvsU5Rc4UMbEQGfs8iXzajE0EnSx
         txEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705485613; x=1706090413;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vREreRDX9LMqGtvWcecYgobHNabcN+0PAlDNZTRFwQA=;
        b=U+OZrZpIbAr7I2eNMdBDPBTB08whbbjsQyfBOPGNkCxlCkMa8N2CxfHkeeT+yzXFdn
         7K2b71BNm136GCTKp8ESC2w376Dxwf8RbKe3S+Uqgz5VX/qQSA2jMNumQgFz0zIXKAbi
         79Lbsy3Lay5vZoXoSOaI+0LvT1tRyi/+8nfD640K9QlxClitjTi98oh7WheLeDh5Xn/p
         ILUd7WUSBH4JOT4NCsXQ2bAnzs0mdlC5GACwNnmds/Ng+FKjsmYR8AFtNOOLDtRM4krA
         UBLisPSG5E/Fup9mTh+DqopVEYWKVJC9A6r+9+Uu5xYx60KlVtvIyetp36RiyC27+9YN
         w7KA==
X-Gm-Message-State: AOJu0YwU8cl+/jYvAQ+hWz+5V02TcXIXn/OeEm9CAKKaR2AQMOKzl/33
	MgK7h891v3p3YUGpsKnbVGKDGp5yowtFwbhmzzGu/SNJNA==
X-Google-Smtp-Source: AGHT+IFyewiTkgrNoTGXpEpPW2+PgOCt7EPZlj0s/APz/lct0lSREN4/aCLougsFsQhhJN6Io6w1AQ==
X-Received: by 2002:a7b:c5cb:0:b0:40e:4921:5038 with SMTP id n11-20020a7bc5cb000000b0040e49215038mr3279439wmk.91.1705485612718;
        Wed, 17 Jan 2024 02:00:12 -0800 (PST)
Message-ID: <00444077-4a43-4069-bf57-ea7aa7e0dca4@suse.com>
Date: Wed, 17 Jan 2024 11:00:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] x86/MCE: switch some callback invocations to altcall
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <0fb20fcf-1580-41c9-946b-7daf865f4b49@suse.com>
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
In-Reply-To: <0fb20fcf-1580-41c9-946b-7daf865f4b49@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While not performance critical, these hook invocations still would
better be converted: This way all pre-filled (and newly introduced)
struct mce_callback instances can become __initconst_cf_clobber, thus
allowing to eliminate another 9 ENDBR during the 2nd phase of
alternatives patching.

While this means registering callbacks a little earlier, doing so is
perhaps even advantageous, for having pointers be non-NULL earlier on.
Only one set of callbacks would only ever be registered anyway, and
neither of the respective initialization function can (subsequently)
fail.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Of course there's concern about alternatives patching happening
     only after setting CR4.MCE, meaning that #MC could actually be
     raised while patching. If this is deemed unacceptable, a (not
     really nice) option may be to defer setting the bit until after the
     first alternatives patching pass.

Of course this could be split to convert every previously separate
function pointer individually. But I think it's better done all in one
go. (This change could of course also be folded with the prereq one.)

--- a/xen/arch/x86/cpu/mcheck/mcaction.c
+++ b/xen/arch/x86/cpu/mcheck/mcaction.c
@@ -27,13 +27,6 @@ mci_action_add_pageoffline(int bank, str
     return rec;
 }
 
-mce_check_addr_t mc_check_addr = NULL;
-
-void __init mce_register_addrcheck(mce_check_addr_t cbfunc)
-{
-    mc_check_addr = cbfunc;
-}
-
 void
 mc_memerr_dhandler(struct mca_binfo *binfo,
                    enum mce_result *result,
@@ -48,7 +41,8 @@ mc_memerr_dhandler(struct mca_binfo *bin
     int vmce_vcpuid;
     unsigned int mc_vcpuid;
 
-    if ( !mc_check_addr(bank->mc_status, bank->mc_misc, MC_ADDR_PHYSICAL) )
+    if ( !alternative_call(mce_callbacks.check_addr, bank->mc_status,
+                           bank->mc_misc, MC_ADDR_PHYSICAL) )
     {
         dprintk(XENLOG_WARNING,
                 "No physical address provided for memory error\n");
--- a/xen/arch/x86/cpu/mcheck/mcaction.h
+++ b/xen/arch/x86/cpu/mcheck/mcaction.h
@@ -12,9 +12,4 @@ mc_memerr_dhandler(struct mca_binfo *bin
 #define MC_ADDR_PHYSICAL  0
 #define MC_ADDR_VIRTUAL   1
 
-typedef bool (*mce_check_addr_t)(uint64_t status, uint64_t misc, int addr_type);
-extern void mce_register_addrcheck(mce_check_addr_t cbfunc);
-
-extern mce_check_addr_t mc_check_addr;
-
 #endif
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -82,47 +82,21 @@ static void cf_check unexpected_machine_
     fatal_trap(regs, 1);
 }
 
-static x86_mce_vector_t _machine_check_vector = unexpected_machine_check;
-
-void __init x86_mce_vector_register(x86_mce_vector_t hdlr)
-{
-    _machine_check_vector = hdlr;
-}
+struct mce_callbacks __ro_after_init mce_callbacks = {
+    .handler = unexpected_machine_check,
+};
+static const typeof(mce_callbacks.handler) __initconst_cf_clobber __used
+    default_handler = unexpected_machine_check;
 
 /* Call the installed machine check handler for this CPU setup. */
 
 void do_machine_check(const struct cpu_user_regs *regs)
 {
     mce_enter();
-    _machine_check_vector(regs);
+    alternative_vcall(mce_callbacks.handler, regs);
     mce_exit();
 }
 
-/*
- * Init machine check callback handler
- * It is used to collect additional information provided by newer
- * CPU families/models without the need to duplicate the whole handler.
- * This avoids having many handlers doing almost nearly the same and each
- * with its own tweaks ands bugs.
- */
-static x86_mce_callback_t mc_callback_bank_extended = NULL;
-
-void __init x86_mce_callback_register(x86_mce_callback_t cbfunc)
-{
-    mc_callback_bank_extended = cbfunc;
-}
-
-/*
- * Machine check recoverable judgement callback handler
- * It is used to judge whether an UC error is recoverable by software
- */
-static mce_recoverable_t mc_recoverable_scan = NULL;
-
-void __init mce_recoverable_register(mce_recoverable_t cbfunc)
-{
-    mc_recoverable_scan = cbfunc;
-}
-
 struct mca_banks *mcabanks_alloc(unsigned int nr)
 {
     struct mca_banks *mb;
@@ -174,19 +148,6 @@ static void mcabank_clear(int banknum)
 }
 
 /*
- * Judging whether to Clear Machine Check error bank callback handler
- * According to Intel latest MCA OS Recovery Writer's Guide,
- * whether the error MCA bank needs to be cleared is decided by the mca_source
- * and MCi_status bit value.
- */
-static mce_need_clearbank_t mc_need_clearbank_scan = NULL;
-
-void __init mce_need_clearbank_register(mce_need_clearbank_t cbfunc)
-{
-    mc_need_clearbank_scan = cbfunc;
-}
-
-/*
  * mce_logout_lock should only be used in the trap handler,
  * while MCIP has not been cleared yet in the global status
  * register. Other use is not safe, since an MCE trap can
@@ -226,7 +187,8 @@ static void mca_init_bank(enum mca_sourc
 
     if ( (mib->mc_status & MCi_STATUS_MISCV) &&
          (mib->mc_status & MCi_STATUS_ADDRV) &&
-         (mc_check_addr(mib->mc_status, mib->mc_misc, MC_ADDR_PHYSICAL)) &&
+         alternative_call(mce_callbacks.check_addr, mib->mc_status,
+                          mib->mc_misc, MC_ADDR_PHYSICAL) &&
          (who == MCA_POLLER || who == MCA_CMCI_HANDLER) &&
          (mfn_valid(_mfn(paddr_to_pfn(mib->mc_addr)))) )
     {
@@ -326,7 +288,7 @@ mcheck_mca_logout(enum mca_source who, s
      * If no mc_recovery_scan callback handler registered,
      * this error is not recoverable
      */
-    recover = mc_recoverable_scan ? 1 : 0;
+    recover = mce_callbacks.recoverable_scan;
 
     for ( i = 0; i < this_cpu(nr_mce_banks); i++ )
     {
@@ -343,8 +305,9 @@ mcheck_mca_logout(enum mca_source who, s
          * decide whether to clear bank by MCi_STATUS bit value such as
          * OVER/UC/EN/PCC/S/AR
          */
-        if ( mc_need_clearbank_scan )
-            need_clear = mc_need_clearbank_scan(who, status);
+        if ( mce_callbacks.need_clearbank_scan )
+            need_clear = alternative_call(mce_callbacks.need_clearbank_scan,
+                                          who, status);
 
         /*
          * If this is the first bank with valid MCA DATA, then
@@ -380,12 +343,12 @@ mcheck_mca_logout(enum mca_source who, s
 
         if ( recover && uc )
             /* uc = true, recover = true, we need not panic. */
-            recover = mc_recoverable_scan(status);
+            recover = alternative_call(mce_callbacks.recoverable_scan, status);
 
         mca_init_bank(who, mci, i);
 
-        if ( mc_callback_bank_extended )
-            mc_callback_bank_extended(mci, i, status);
+        if ( mce_callbacks.info_collect )
+            alternative_vcall(mce_callbacks.info_collect, mci, i, status);
 
         /* By default, need_clear = true */
         if ( who != MCA_MCE_SCAN && need_clear )
@@ -1913,9 +1876,11 @@ static void cf_check mce_softirq(void)
  * will help to collect and log those MCE errors.
  * Round2: Do all MCE processing logic as normal.
  */
-void __init mce_handler_init(void)
+void __init mce_handler_init(const struct mce_callbacks *cb)
 {
     /* callback register, do we really need so many callback? */
+    mce_callbacks = *cb;
+
     /* mce handler data initialization */
     spin_lock_init(&mce_logout_lock);
     open_softirq(MACHINE_CHECK_SOFTIRQ, mce_softirq);
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -63,20 +63,12 @@ void x86_mc_get_cpu_info(unsigned cpu, u
                          unsigned *ncores, unsigned *ncores_active,
                          unsigned *nthreads);
 
-/* Register a handler for machine check exceptions. */
-typedef void (*x86_mce_vector_t)(const struct cpu_user_regs *regs);
-extern void x86_mce_vector_register(x86_mce_vector_t hdlr);
-
 /*
  * Common generic MCE handler that implementations may nominate
  * via x86_mce_vector_register.
  */
 void cf_check mcheck_cmn_handler(const struct cpu_user_regs *regs);
 
-/* Register a handler for judging whether mce is recoverable. */
-typedef bool (*mce_recoverable_t)(uint64_t status);
-extern void mce_recoverable_register(mce_recoverable_t cbfunc);
-
 /* Read an MSR, checking for an interposed value first */
 extern struct intpose_ent *intpose_lookup(unsigned int cpu_nr, uint64_t msr,
     uint64_t *valp);
@@ -137,30 +129,6 @@ extern mctelem_cookie_t mcheck_mca_logou
                                           struct mca_summary *sp,
                                           struct mca_banks *clear_bank);
 
-/*
- * Register callbacks to be made during bank telemetry logout.
- * Those callbacks are only available to those machine check handlers
- * that call to the common mcheck_cmn_handler or who use the common
- * telemetry logout function mcheck_mca_logout in error polling.
- */
-
-/* Register a handler for judging whether the bank need to be cleared */
-typedef bool (*mce_need_clearbank_t)(enum mca_source who, u64 status);
-extern void mce_need_clearbank_register(mce_need_clearbank_t cbfunc);
-
-/*
- * Register a callback to collect additional information (typically non-
- * architectural) provided by newer CPU families/models without the need
- * to duplicate the whole handler resulting in various handlers each with
- * its own tweaks and bugs. The callback receives an struct mc_info pointer
- * which it can use with x86_mcinfo_reserve to add additional telemetry,
- * the current MCA bank number we are reading telemetry from, and the
- * MCi_STATUS value for that bank.
- */
-typedef struct mcinfo_extended *(*x86_mce_callback_t)
-    (struct mc_info *mi, uint16_t bank, uint64_t status);
-extern void x86_mce_callback_register(x86_mce_callback_t cbfunc);
-
 void *x86_mcinfo_reserve(struct mc_info *mi,
                          unsigned int size, unsigned int type);
 void x86_mcinfo_dump(struct mc_info *mi);
@@ -201,8 +169,44 @@ static inline int mce_bank_msr(const str
     return 0;
 }
 
-/* MC softirq */
-void mce_handler_init(void);
+struct mce_callbacks {
+    void (*handler)(const struct cpu_user_regs *regs);
+    bool (*check_addr)(uint64_t status, uint64_t misc, int addr_type);
+
+    /* Handler for judging whether mce is recoverable. */
+    bool (*recoverable_scan)(uint64_t status);
+
+    /*
+     * Callbacks to be made during bank telemetry logout.
+     * They are only available to those machine check handlers
+     * that call to the common mcheck_cmn_handler or who use the common
+     * telemetry logout function mcheck_mca_logout in error polling.
+     */
+
+    /*
+     * Judging whether to Clear Machine Check error bank callback handler.
+     * According to Intel latest MCA OS Recovery Writer's Guide, whether
+     * the error MCA bank needs to be cleared is decided by the mca_source
+     * and MCi_status bit value.
+     */
+    bool (*need_clearbank_scan)(enum mca_source who, u64 status);
+
+    /*
+     * Callback to collect additional information (typically non-
+     * architectural) provided by newer CPU families/models without the need
+     * to duplicate the whole handler resulting in various handlers each with
+     * its own tweaks and bugs. The callback receives an struct mc_info pointer
+     * which it can use with x86_mcinfo_reserve to add additional telemetry,
+     * the current MCA bank number we are reading telemetry from, and the
+     * MCi_STATUS value for that bank.
+     */
+    struct mcinfo_extended *(*info_collect)
+        (struct mc_info *mi, uint16_t bank, uint64_t status);
+};
+
+extern struct mce_callbacks mce_callbacks;
+
+void mce_handler_init(const struct mce_callbacks *cb);
 
 extern const struct mca_error_handler *mce_dhandlers;
 extern const struct mca_error_handler *mce_uhandlers;
--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -271,6 +271,19 @@ int vmce_amd_rdmsr(const struct vcpu *v,
     return 1;
 }
 
+static const struct mce_callbacks __initconst_cf_clobber k8_callbacks = {
+    .handler = mcheck_cmn_handler,
+    .need_clearbank_scan = amd_need_clearbank_scan,
+};
+
+static const struct mce_callbacks __initconst_cf_clobber k10_callbacks = {
+    .handler = mcheck_cmn_handler,
+    .check_addr = mc_amd_addrcheck,
+    .recoverable_scan = mc_amd_recoverable_scan,
+    .need_clearbank_scan = amd_need_clearbank_scan,
+    .info_collect = amd_f10_handler,
+};
+
 enum mcheck_type
 amd_mcheck_init(const struct cpuinfo_x86 *c, bool bsp)
 {
@@ -283,11 +296,7 @@ amd_mcheck_init(const struct cpuinfo_x86
     /* Assume that machine check support is available.
      * The minimum provided support is at least the K8. */
     if ( bsp )
-    {
-        mce_handler_init();
-        x86_mce_vector_register(mcheck_cmn_handler);
-        mce_need_clearbank_register(amd_need_clearbank_scan);
-    }
+        mce_handler_init(c->x86 == 0xf ? &k8_callbacks : &k10_callbacks);
 
     for ( i = 0; i < this_cpu(nr_mce_banks); i++ )
     {
@@ -327,13 +336,6 @@ amd_mcheck_init(const struct cpuinfo_x86
             ppin_msr = MSR_AMD_PPIN;
     }
 
-    if ( bsp )
-    {
-        x86_mce_callback_register(amd_f10_handler);
-        mce_recoverable_register(mc_amd_recoverable_scan);
-        mce_register_addrcheck(mc_amd_addrcheck);
-    }
-
     return c->x86_vendor == X86_VENDOR_HYGON ?
             mcheck_hygon : mcheck_amd_famXX;
 }
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -849,11 +849,6 @@ static void intel_init_mce(bool bsp)
     if ( !bsp )
         return;
 
-    x86_mce_vector_register(mcheck_cmn_handler);
-    mce_recoverable_register(intel_recoverable_scan);
-    mce_need_clearbank_register(intel_need_clearbank_scan);
-    mce_register_addrcheck(intel_checkaddr);
-
     mce_dhandlers = intel_mce_dhandlers;
     mce_dhandler_num = ARRAY_SIZE(intel_mce_dhandlers);
     mce_uhandlers = intel_mce_uhandlers;
@@ -963,6 +958,13 @@ static int cf_check cpu_callback(
     return notifier_from_errno(rc);
 }
 
+static const struct mce_callbacks __initconst_cf_clobber intel_callbacks = {
+    .handler = mcheck_cmn_handler,
+    .check_addr = intel_checkaddr,
+    .recoverable_scan = intel_recoverable_scan,
+    .need_clearbank_scan = intel_need_clearbank_scan,
+};
+
 static struct notifier_block cpu_nfb = {
     .notifier_call = cpu_callback
 };
@@ -989,7 +991,7 @@ enum mcheck_type intel_mcheck_init(struc
     intel_init_mca(c);
 
     if ( bsp )
-        mce_handler_init();
+        mce_handler_init(&intel_callbacks);
 
     intel_init_mce(bsp);
 


