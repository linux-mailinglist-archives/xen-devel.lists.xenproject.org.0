Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C27B4175D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 09:56:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107956.1458132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utiMC-0006tX-FL; Wed, 03 Sep 2025 07:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107956.1458132; Wed, 03 Sep 2025 07:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utiMC-0006rC-C2; Wed, 03 Sep 2025 07:56:40 +0000
Received: by outflank-mailman (input) for mailman id 1107956;
 Wed, 03 Sep 2025 07:56:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utiMB-0006fP-9E
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 07:56:39 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8451b886-889b-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 09:56:37 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ad4f0so8428520a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 00:56:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7caesm11215967a12.9.2025.09.03.00.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 00:56:36 -0700 (PDT)
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
X-Inumbo-ID: 8451b886-889b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756886196; x=1757490996; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=an+6YpWz4Gh3Vcy0oc++hJHbZ3MoC5BmOYat5FVoGmE=;
        b=NkkEWTVoqDXNfe1iU0lyBw9og3kVvC7wQ2m+OLlrY+AVlyUbKOk/LaCexx4FdNgPVL
         cXj6kurHRa8HiTIe9vephW2cQkxxQlCrDcuNb5yBdaXye6MafYIL4VYeYNEHgDu9XYse
         0LjebpaSx8uRTJsBtEIVJr3+k6IdTl/ffeJiRGPE5BLIxK1Bsv8CoRj9E2EG3eQo6J8f
         p0SAArq9xwf6dLKfYQvY/wl33fQvkJk16XigZq4xmeua+JWwut+jvfZKGtZk4NjkoIpY
         WyoOtk1KK5s74JwxwmWwg+WdDpgJmnZrb2yi8F14d0pGl2otfq0AydOdb+UzPDEjOsS+
         YXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886196; x=1757490996;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=an+6YpWz4Gh3Vcy0oc++hJHbZ3MoC5BmOYat5FVoGmE=;
        b=P414FaOpHrYnwxZBr5UDAwc8y3YwBIg3KdFIsNDwESDi928mHbFoOGU/veJdEIAIXp
         LHICVE7qdkszkUelJ9YXWKQS6LLmZL53rg3YvpOIBrve7eojbPiR4k4KgplyDmgz1Hnq
         hG0Ul1aNiEjSZ17WMVvzYNFEmIm0iN83V+wpmAAccc6zMOfuS143zOeeJ/lmfX5Ekb+t
         XasNOKau2udpa/fAKnHVENDeH+zXq4qzS7SnOWsHkfgachLPxLbmPEnG/QbG8Q3z3IBd
         3uw7YRr9nkA4UglpUxaBHMqMaXqJjuvhbYQHHqABXa52bpiqelbfdFvL/qEvm2U9P5mj
         tYHg==
X-Gm-Message-State: AOJu0YyGGnOL+fNM8LJ7kIu2rS90/AX4F0ZaEJwAriDtJ8fVextumBCC
	6Zbt9ZLLYLPi02ScneRuAOn42Dz34nblRNJJgjQGyjVlofmjo4LWYmjjE83PwYa3SzE6dUbJy1t
	DFS4=
X-Gm-Gg: ASbGncuAVN3Fj6ippDhyGr6KmMRKMUiATJEMrVmGBrVHnCYg8WYNq3QBPVvFzs02Pec
	ZR5U9XoA7PjNdBJQtZd2bmzA4yGRm5cY0xJD3F+e4C97dpdUxPU5IlRYqND+gbh8+dBMeBIE0Kn
	goow3rx+mRlHI+8T9WbEU0SpBGaJR0/AyBfZrMWC5I0uI7UItDpKdY15rdyhzab/s+X4ThzBZ+P
	+t5SI+gRueOiOLJC3KdDLYSX/2+jFOoMkGn3zF8d6eTSgxSH/b7vImvq2NW2ud4vMd2jkhwLa4n
	ahMaII2qj3lfsMsNa8TSKDoF45BGl3X3mdsfrCm68T3UlgnfpNmEE/+kHAsMD+hygqci9bQBzuG
	51LZT3zQWHcLlKmTWpX2CRQ2Of+CmpbMy6ykwB0FtZg/9vfvFuZrHd9xIOjCzLIrTdVKEiCzv2U
	3/ha9gEGc=
X-Google-Smtp-Source: AGHT+IFzXwY8gVHyYYT5gxbKyGgJQ7lRfPYNTvMFDy2WSksEMD2guSfs5I7ylKG+MTufiPvdOR41yg==
X-Received: by 2002:a05:6402:27ca:b0:61c:5a8c:9a4e with SMTP id 4fb4d7f45d1cf-61d2699752fmr13261626a12.4.1756886196475;
        Wed, 03 Sep 2025 00:56:36 -0700 (PDT)
Message-ID: <80c035e0-54f6-4632-a5c2-a10d2c1c8422@suse.com>
Date: Wed, 3 Sep 2025 09:56:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] x86/IO-APIC: drop io_apic_get_unique_id()
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

As this removes the last user of APIC_XAPIC(), remove the macro as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/apicdef.h
+++ b/xen/arch/x86/include/asm/apicdef.h
@@ -19,7 +19,6 @@
 #define			APIC_LVR_DIRECTED_EOI	(1 << 24)
 #define			GET_APIC_VERSION(x)	((x)&0xFF)
 #define			GET_APIC_MAXLVT(x)	(((x)>>16)&0xFF)
-#define			APIC_XAPIC(x)		((x) >= 0x14)
 #define		APIC_TASKPRI	0x80
 #define			APIC_TPRI_MASK		0xFF
 #define		APIC_ARBPRI	0x90
--- a/xen/arch/x86/include/asm/io_apic.h
+++ b/xen/arch/x86/include/asm/io_apic.h
@@ -184,7 +184,6 @@ extern bool skip_ioapic_setup;
 extern bool ioapic_ack_new;
 extern bool ioapic_ack_forced;
 
-extern int io_apic_get_unique_id (int ioapic, int apic_id);
 extern int io_apic_get_version (int ioapic);
 extern int io_apic_get_redir_entries (int ioapic);
 extern int io_apic_set_pci_routing (int ioapic, int pin, int irq, int edge_level, int active_high_low);
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2092,86 +2092,6 @@ void ioapic_resume(void)
     spin_unlock_irqrestore(&ioapic_lock, flags);
 }
 
-/* --------------------------------------------------------------------------
-                          ACPI-based IOAPIC Configuration
-   -------------------------------------------------------------------------- */
-
-
-int __init io_apic_get_unique_id (int ioapic, int apic_id)
-{
-    union IO_APIC_reg_00 reg_00;
-    static physid_mask_t __initdata apic_id_map = PHYSID_MASK_NONE;
-    unsigned long flags;
-    int i = 0;
-    const uint32_t broadcast_id = 0xf;
-
-    /*
-     * The P4 platform supports up to 256 APIC IDs on two separate APIC 
-     * buses (one for LAPICs, one for IOAPICs), where predecessors only 
-     * supports up to 16 on one shared APIC bus.
-     * 
-     * TBD: Expand LAPIC/IOAPIC support on P4-class systems to take full
-     *      advantage of new APIC bus architecture.
-     */
-
-    if (physids_empty(apic_id_map))
-        apic_id_map = phys_cpu_present_map;
-
-    spin_lock_irqsave(&ioapic_lock, flags);
-    reg_00.raw = io_apic_read(ioapic, 0);
-    spin_unlock_irqrestore(&ioapic_lock, flags);
-
-    if (apic_id >= broadcast_id) {
-        printk(KERN_WARNING "IOAPIC[%d]: Invalid apic_id %d, trying "
-               "%d\n", ioapic, apic_id, reg_00.bits.ID);
-        apic_id = reg_00.bits.ID;
-    }
-
-    /*
-     * Every APIC in a system must have a unique ID or we get lots of nice 
-     * 'stuck on smp_invalidate_needed IPI wait' messages.
-     */
-    if ( physid_isset(apic_id, apic_id_map) )
-    {
-
-        for (i = 0; i < broadcast_id; i++) {
-            if ( !physid_isset(i, apic_id_map) )
-                break;
-        }
-
-        if (i == broadcast_id)
-            panic("Max apic_id exceeded\n");
-
-        printk(KERN_WARNING "IOAPIC[%d]: apic_id %d already used, "
-               "trying %d\n", ioapic, apic_id, i);
-
-        apic_id = i;
-    } 
-
-    physid_set(apic_id, apic_id_map);
-
-    if (reg_00.bits.ID != apic_id) {
-        reg_00.bits.ID = apic_id;
-
-        spin_lock_irqsave(&ioapic_lock, flags);
-        io_apic_write(ioapic, 0, reg_00.raw);
-        reg_00.raw = io_apic_read(ioapic, 0);
-        spin_unlock_irqrestore(&ioapic_lock, flags);
-
-        /* Sanity check */
-        if (reg_00.bits.ID != apic_id) {
-            printk("IOAPIC[%d]: Unable to change apic_id!\n", ioapic);
-            return -1;
-        }
-    }
-
-    apic_printk(APIC_VERBOSE, KERN_INFO
-                "IOAPIC[%d]: Assigned apic_id %d\n", ioapic, apic_id);
-
-    return apic_id;
-}
-
-
 int __init io_apic_get_version (int ioapic)
 {
     union IO_APIC_reg_01	reg_01;
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -871,7 +871,6 @@ void __init mp_register_ioapic (
 	u32			gsi_base)
 {
 	int			idx = 0;
-	int			tmpid;
 
 	if (nr_ioapics >= MAX_IO_APICS) {
 		printk(KERN_ERR "ERROR: Max # of I/O APICs (%d) exceeded "
@@ -891,16 +890,7 @@ void __init mp_register_ioapic (
 	mp_ioapics[idx].mpc_apicaddr = address;
 
 	set_fixmap_nocache(FIX_IO_APIC_BASE_0 + idx, address);
-	if ((boot_cpu_data.x86_vendor == X86_VENDOR_INTEL)
-		&& !APIC_XAPIC(apic_version[boot_cpu_physical_apicid]))
-		tmpid = io_apic_get_unique_id(idx, id);
-	else
-		tmpid = id;
-	if (tmpid == -1) {
-		nr_ioapics--;
-		return;
-	}
-	mp_ioapics[idx].mpc_apicid = tmpid;
+	mp_ioapics[idx].mpc_apicid = id;
 	mp_ioapics[idx].mpc_apicver = io_apic_get_version(idx);
 	
 	/* 


