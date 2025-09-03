Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C790B41756
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 09:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107944.1458122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utiLW-0006LN-3Z; Wed, 03 Sep 2025 07:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107944.1458122; Wed, 03 Sep 2025 07:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utiLV-0006Jf-Vn; Wed, 03 Sep 2025 07:55:57 +0000
Received: by outflank-mailman (input) for mailman id 1107944;
 Wed, 03 Sep 2025 07:55:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utiLU-0006JU-7i
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 07:55:56 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b5dfc16-889b-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 09:55:55 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61cbfa1d820so12380343a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 00:55:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcbd874bsm1312198966b.57.2025.09.03.00.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 00:55:54 -0700 (PDT)
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
X-Inumbo-ID: 6b5dfc16-889b-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756886155; x=1757490955; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LG18tho9TDeej44L4XAv91aRvSPRwD20YKPihFcGYo0=;
        b=IL3aoGoxCmS0E5np3fLw852xY64qZqOhakDdixCvgeqDa/VjGPn9zQBgWt3shEOBun
         E28SK+2KNzQfCw3dY53fgmL8bDjSjiOuYFfKc0L6amb+GzNR23dOTbD9iBUjMG0Squvs
         y9UtUdxabg6k6rGGeOUnKUupeekGd9U9mIbUZyVokyM7ex8PueZkHlS6zqSkSEcC0quO
         XXOPgcZBRuC6d0ofm1cBal9qMwT0zU0eXAjmskc5eC4Faqbhh2JTxCv/khEKspZgWvxv
         s5ZiI8qA9ZQFnuHPEsH/GdfyXH8m6cAVqdmEb6lAC0AGatJql7SwQRE0mjAYgEMES+wf
         iqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886155; x=1757490955;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LG18tho9TDeej44L4XAv91aRvSPRwD20YKPihFcGYo0=;
        b=UKZiRz1xRQGOkIJgYaCMwDMH6AXqnBpvYe0jDeBN/grxdmOEvRJg3bAc0LL6aETEHn
         RTNqsCiMAUC2A4AnGJVw4Et1HczDdn4UdfXGaiH3kCF7aq2n2Dh8ay7HjbBT4Xo0AqMr
         8BN3Xxi+81HGrExtNOQYhGdbazSI0uoCdUwpyKvRFcfq0o7mLKN3EE1qs94mwKgnZiJu
         HMIw+En6pavmqhJomnOqifBUtYanPSLnkOOXx4389ALPzEefQ1yk7930lkL7thjRQerH
         628yELXODMUqk1TINkttkKAyvc/2Nd7bmicRo3+fuQoIR1pjk7vIOBbVfm8ihwgJ5TW4
         AXuw==
X-Gm-Message-State: AOJu0Yxry782m1bW2eOFAkY4dafPAN2AKwdBxsY+bH71WCb0yVsoYDdF
	M2Lp4uH1CzyBOSJ6OFfJMwslqdwaCUc68KJxaTAQKnjEDRnK5g+wJeysxfBwicYJXJcU9J/Z3/a
	uCZo=
X-Gm-Gg: ASbGncvC/XgJVe8Ucn4hnfGy2Puosy7e0pwYAzeKOrsllq5ehS3km+zvy/fKMEs2rJc
	BEAiCCg9gbsH367dwRgyKobhfSQ3c/4Ao5xnZFG0xixz/3NbqC09roEPqgPQYl0CVB9I33WpxO7
	j5jTMqwbhpJ4EBtHqXX5Ltj8eyWkTv7uhOlQ3Gaf8qe649AHVsoHsfnrRcLu9C9Uy5p51m9AZKZ
	mh0+fm785sClqMq8ZZdr26E7abbqO3DV/whHH2YX5bcoN1jEIpddfBujY3vhtOThnvB88iRcOXe
	ouQdze2cB+dtbXFgY+gQLsWKMysoSb1Rus2JP1zGEe2jrZhHuCcDSr5/daaX1Bt7x8I2edHVHzl
	JNIg0VWl+sinRcdbmDjX8vxDV7OByK/wEN8PIqb6M9i5OKIZQGIwe6UnnL9nOjRga+NaXQGOhJL
	oVW6p0dx6AcbfRngK0Nyb3clnUgjW2
X-Google-Smtp-Source: AGHT+IHuLZVTLOWVnTFZ3HRpxYvwAECX2by0fldLjh2nrwdQdGd8D9LhUBxNtYRk8OClqASrob597A==
X-Received: by 2002:a17:907:1ca0:b0:b04:286a:2fb8 with SMTP id a640c23a62f3a-b04286a4b87mr1062345166b.56.1756886154577;
        Wed, 03 Sep 2025 00:55:54 -0700 (PDT)
Message-ID: <034dd6dd-4e3f-4353-9a11-7a0ebda9a664@suse.com>
Date: Wed, 3 Sep 2025 09:55:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] x86/IO-APIC: drop setup_ioapic_ids_from_mpc()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>
References: <e2e54b68-1521-4bf6-9cb9-5703ed2a69fc@suse.com>
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
In-Reply-To: <e2e54b68-1521-4bf6-9cb9-5703ed2a69fc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Along the lines of what b89f8f054f96 ("x86/apic: Drop sync_Arb_IDs()")
said, the function is dead logic as well: All 64-bit capable Intel systems
have (at least) xAPIC (if not x2APIC).

Even if Eclair can't know it, such code is violating Misra rule 2.2 (dead
code; we didn't accept that yet, but - where possible - we probably would
better follow it). Depending on one's reading, this code may actually be a
violation of rule 2.1 (unreachable), which we did accept:

"Code is unreachable if, ..., there is no combination of program inputs
 that can cause it to be executed."

Otoh it's "only" __init code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1459,119 +1459,6 @@ void disable_IO_APIC(void)
 }
 
 /*
- * function to set the IO-APIC physical IDs based on the
- * values stored in the MPC table.
- *
- * by Matt Domsch <Matt_Domsch@dell.com>  Tue Dec 21 12:25:05 CST 1999
- */
-
-static void __init setup_ioapic_ids_from_mpc(void)
-{
-    union IO_APIC_reg_00 reg_00;
-    static physid_mask_t __initdata phys_id_present_map;
-    int apic;
-    int i;
-    unsigned char old_id;
-    unsigned long flags;
-    const uint32_t broadcast_id = 0xf;
-
-    /*
-     * Don't check I/O APIC IDs for xAPIC systems. They have
-     * no meaning without the serial APIC bus.
-     */
-    if (!(boot_cpu_data.x86_vendor == X86_VENDOR_INTEL)
-        || APIC_XAPIC(apic_version[boot_cpu_physical_apicid]))
-        return;
-
-    /*
-     * This is broken; anything with a real cpu count has to
-     * circumvent this idiocy regardless.
-     */
-    phys_id_present_map = phys_cpu_present_map;
-
-    /*
-     * Set the IOAPIC ID to the value stored in the MPC table.
-     */
-    for (apic = 0; apic < nr_ioapics; apic++) {
-        if (!nr_ioapic_entries[apic])
-            continue;
-
-        /* Read the register 0 value */
-        spin_lock_irqsave(&ioapic_lock, flags);
-        reg_00.raw = io_apic_read(apic, 0);
-        spin_unlock_irqrestore(&ioapic_lock, flags);
-		
-        old_id = mp_ioapics[apic].mpc_apicid;
-
-        if (mp_ioapics[apic].mpc_apicid >= broadcast_id) {
-            printk(KERN_ERR "BIOS bug, IO-APIC#%d ID is %d in the MPC table!...\n",
-                   apic, mp_ioapics[apic].mpc_apicid);
-            printk(KERN_ERR "... fixing up to %d. (tell your hw vendor)\n",
-                   reg_00.bits.ID);
-            mp_ioapics[apic].mpc_apicid = reg_00.bits.ID;
-        }
-
-        /*
-         * Sanity check, is the ID really free? Every APIC in a
-         * system must have a unique ID or we get lots of nice
-         * 'stuck on smp_invalidate_needed IPI wait' messages.
-         */
-        if ( physid_isset(mp_ioapics[apic].mpc_apicid, phys_id_present_map) )
-        {
-            printk(KERN_ERR "BIOS bug, IO-APIC#%d ID %d is already used!...\n",
-                   apic, mp_ioapics[apic].mpc_apicid);
-            for (i = 0; i < broadcast_id; i++)
-                if (!physid_isset(i, phys_id_present_map))
-                    break;
-            if (i >= broadcast_id)
-                panic("Max APIC ID exceeded\n");
-            printk(KERN_ERR "... fixing up to %d. (tell your hw vendor)\n",
-                   i);
-            mp_ioapics[apic].mpc_apicid = i;
-        } else {
-            apic_printk(APIC_VERBOSE, "Setting %d in the "
-                        "phys_id_present_map\n",
-                        mp_ioapics[apic].mpc_apicid);
-        }
-        physid_set(mp_ioapics[apic].mpc_apicid, phys_id_present_map);
-
-        /*
-         * We need to adjust the IRQ routing table
-         * if the ID changed.
-         */
-        if (old_id != mp_ioapics[apic].mpc_apicid)
-            for (i = 0; i < mp_irq_entries; i++)
-                if (mp_irqs[i].mpc_dstapic == old_id)
-                    mp_irqs[i].mpc_dstapic
-                        = mp_ioapics[apic].mpc_apicid;
-
-        /*
-         * Read the right value from the MPC table and
-         * write it into the ID register.
-         */
-        apic_printk(APIC_VERBOSE, KERN_INFO
-                    "...changing IO-APIC physical APIC ID to %d ...",
-                    mp_ioapics[apic].mpc_apicid);
-
-        reg_00.bits.ID = mp_ioapics[apic].mpc_apicid;
-        spin_lock_irqsave(&ioapic_lock, flags);
-        io_apic_write(apic, 0, reg_00.raw);
-        spin_unlock_irqrestore(&ioapic_lock, flags);
-
-        /*
-         * Sanity check
-         */
-        spin_lock_irqsave(&ioapic_lock, flags);
-        reg_00.raw = io_apic_read(apic, 0);
-        spin_unlock_irqrestore(&ioapic_lock, flags);
-        if (reg_00.bits.ID != mp_ioapics[apic].mpc_apicid)
-            printk("could not set ID!\n");
-        else
-            apic_printk(APIC_VERBOSE, " ok.\n");
-    }
-}
-
-/*
  * There is a nasty bug in some older SMP boards, their mptable lies
  * about the timer IRQ. We do the following to work around the situation:
  *
@@ -2158,12 +2045,6 @@ void __init setup_IO_APIC(void)
         ioapic_level_type.end = end_level_ioapic_irq_new;
     }
 
-    /*
-     * Set up IO-APIC IRQ routing.
-     */
-    if (!acpi_ioapic)
-        setup_ioapic_ids_from_mpc();
-
     setup_IO_APIC_irqs();
     init_IO_APIC_traps();
     check_timer();


