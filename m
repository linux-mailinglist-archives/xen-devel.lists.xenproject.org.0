Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOIiFrxDqGnPrwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 15:37:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF53C201ABF
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 15:37:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245494.1544865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnLu-0000cH-Ma; Wed, 04 Mar 2026 14:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245494.1544865; Wed, 04 Mar 2026 14:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnLu-0000ZF-Ic; Wed, 04 Mar 2026 14:37:30 +0000
Received: by outflank-mailman (input) for mailman id 1245494;
 Wed, 04 Mar 2026 14:37:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xh4z=BE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxnLt-0000VJ-Ir
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 14:37:29 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aae12be4-17d7-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 15:37:28 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439b6d9c981so2327488f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 06:37:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b503424fsm28047245f8f.22.2026.03.04.06.37.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 06:37:26 -0800 (PST)
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
X-Inumbo-ID: aae12be4-17d7-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772635047; x=1773239847; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixD03YAwPbqTVrVB8LuXCa5+sDpUh7SDQBZiiZDsct4=;
        b=cyedKOU+uLOqRa9NydOM/ng1Wz2ZA9lQSU+wNpYjIb9AjNhHNkFpQmWl3VRg79U/Cg
         HHEG+jVJAOCYqGOUiABZNoNxyPdfgEJOYddBjB2Y+FMIXZ6DtK8bhXshB2aEEkfCfSkZ
         xXrW8utv90Z6+8XauaUTqmO8ztLRQe708nooxrBFZZxRLrzePpprok+0lBRbc2LuN9p7
         I+0KW+4ZsWdn6QPMShohDZVJ8aRS6cXr2cpCMCjo7h9sPyVWa8SBfd6JY/Uxpi2HvrSp
         n3wCWi7vBDwUyr4R8zDEDivP5ZJgfnz+UhMSlPYXZYofasVD0Lerbi7z35Ih9N9Ai4oU
         SGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772635047; x=1773239847;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ixD03YAwPbqTVrVB8LuXCa5+sDpUh7SDQBZiiZDsct4=;
        b=rnU+HiGK2ZyCUohpU+pw36D8oQN/XSAlxskmeM+u1ngXt1Hs36cVpoWmxPB8kRo7hm
         IPlzMsJS9LGglVE7ZZHcLgigQxSotFM7h6CLncjh7Rogr4lRObZIyCdjRX86Q5rF8Phu
         md+FDie6u74w+MRoQUgJNOMonPA8qe6YUjJwoLrdhyW6cmYrCo4jzbbkMy/nwJk6B0Hg
         aen7YWxXMLZ7i/+6JX0oRBLqbUZjr5WUgGuhxLPidzWHFJhst9e0Jlo5AYmlLZkhDdrY
         kBeDyVW7QYIWaNJ2Aavva07zg//bJErMAQFa11ZVvE84aMKXpe6jWO8ZY8UxaMegfW7s
         OBDw==
X-Gm-Message-State: AOJu0YzpLjmAYv/AHJshCQpwfQCLWtZdLw/A/0A+EFDrpzC4GDIcI0Vq
	+b5GqemYFK1wKiCBlT9bXyLQO6ZmEpjymmKPv/SU2ahe5ly7FnyJjmvnP7Y78CVIGVkbcJ1mJl2
	dn+A=
X-Gm-Gg: ATEYQzwnYtdi+4YKRgLxu4cDCUHENnLwBoFb0EAFUBZBfCTD2WCSOU7Q6Kaqa52n4vd
	MzKUdNasW+mBZjlFJYlfPICxLJgZwGOweLIGivTAOniuXXo0ClyLzWeKsRl3bShAfr2f4NkFt+/
	L4M7rn9tLu1tqNdl/GdEycMpoxnmSp+xgdzvVX5EIM7hs0ZifoLxxwFYfQg/sA8f1rXHhbYhQvA
	ndP1v/AiPU6bAj2Qx6R564QYk9JofQb6sDUquBSX+o3Ede83hK3/OpQnjK4DVP5kQikjinSWVi+
	cRSSCv71QNqWqZdLZEsh+okbk8NsazYirRuenK9kuFK73QGqKItugU0D69QhF6AkCaTjetfRL74
	P6Z3QK1E8ftqua6dO4jwgYYEE0E8vzkOIp8sg4qSOUYrGmtzBfoEREL6zy9FdAeTqmlSgVjzZID
	JGNdgAi0NQVAVQpLm4+LenJRbuRqqXysDC8SqDmt2tCX4cv/1ALnvD7FUc8436cKKaNBxhqu7Ob
	y3MSqLStOjPSnM=
X-Received: by 2002:a5d:588a:0:b0:439:b79d:b9a6 with SMTP id ffacd0b85a97d-439c10adc38mr11817885f8f.11.1772635047019;
        Wed, 04 Mar 2026 06:37:27 -0800 (PST)
Message-ID: <ca1812c2-dadf-422a-a195-9c285ce08077@suse.com>
Date: Wed, 4 Mar 2026 15:37:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Penny Zheng <Penny.Zheng@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/ACPI: _PDC bits vs HWP/CPPC
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
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BF53C201ABF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:Penny.Zheng@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

The treatment of ACPI_PDC_CPPC_NATIVE_INTR should follow that of other P-
state related bits. Add the bit to ACPI_PDC_P_MASK and apply "mask" in
arch_acpi_set_pdc_bits() when setting that bit. Move this next to the
other P-state related logic.

Further apply ACPI_PDC_P_MASK also when the amd-cppc driver is in use.

Also leave a comment regarding the clearing of bits and add a couple of
blank lines.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Including XEN_PROCESSOR_PM_CPPC may need accompanying with some change to
arch_acpi_set_pdc_bits(), but it's entirely unclear to me what to do
there. I'm unaware of an AMD counterpart of Intel's "Intel® Processor
Vendor-Specific ACPI". Plus even when the powernow driver is in use, we
never set any bits, as EIST is an Intel-only feature.

acpi_set_pdc_bits() having moved to the cpufreq driver looks to have been
a mistake. It covers not only P-state related bits, but also C-state and
T-state ones. (This is only a latent issue as long as
https://lists.xen.org/archives/html/xen-devel/2026-02/msg00875.html
wouldn't land.)

--- a/xen/arch/x86/acpi/lib.c
+++ b/xen/arch/x86/acpi/lib.c
@@ -124,6 +124,9 @@ int arch_acpi_set_pdc_bits(u32 acpi_id,
 	if (cpu_has(c, X86_FEATURE_EIST))
 		pdc[2] |= ACPI_PDC_EST_CAPABILITY_SWSMP & mask;
 
+	if (hwp_active())
+		pdc[2] |= ACPI_PDC_CPPC_NATIVE_INTR & mask;
+
 	if (cpu_has(c, X86_FEATURE_ACPI))
 		pdc[2] |= ACPI_PDC_T_FFH & mask;
 
@@ -142,8 +145,5 @@ int arch_acpi_set_pdc_bits(u32 acpi_id,
 	    !(ecx & CPUID5_ECX_INTERRUPT_BREAK))
 		pdc[2] &= ~(ACPI_PDC_C_C1_FFH | ACPI_PDC_C_C2C3_FFH);
 
-	if (hwp_active())
-		pdc[2] |= ACPI_PDC_CPPC_NATIVE_INTR;
-
 	return 0;
 }
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -694,14 +694,23 @@ int acpi_set_pdc_bits(unsigned int acpi_
     {
         uint32_t mask = 0;
 
+        /*
+         * Accumulate all the bits under Xen's control, to mask them off, for
+         * arch_acpi_set_pdc_bits() to then set those we want set.
+         */
         if ( xen_processor_pmbits & XEN_PROCESSOR_PM_CX )
             mask |= ACPI_PDC_C_MASK | ACPI_PDC_SMP_C1PT;
-        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_PX )
+
+        if ( xen_processor_pmbits &
+             (XEN_PROCESSOR_PM_PX | XEN_PROCESSOR_PM_CPPC) )
             mask |= ACPI_PDC_P_MASK | ACPI_PDC_SMP_C1PT;
+
         if ( xen_processor_pmbits & XEN_PROCESSOR_PM_TX )
             mask |= ACPI_PDC_T_MASK | ACPI_PDC_SMP_C1PT;
+
         bits[2] &= (ACPI_PDC_C_MASK | ACPI_PDC_P_MASK | ACPI_PDC_T_MASK |
                     ACPI_PDC_SMP_C1PT) & ~mask;
+
         ret = arch_acpi_set_pdc_bits(acpi_id, bits, mask);
     }
     if ( !ret && __copy_to_guest_offset(pdc, 2, bits + 2, 1) )
--- a/xen/include/acpi/pdc_intel.h
+++ b/xen/include/acpi/pdc_intel.h
@@ -43,7 +43,8 @@
 
 #define ACPI_PDC_P_MASK			(ACPI_PDC_P_FFH | \
 					 ACPI_PDC_SMP_P_SWCOORD | \
-					 ACPI_PDC_SMP_P_HWCOORD)
+					 ACPI_PDC_SMP_P_HWCOORD | \
+					 ACPI_PDC_CPPC_NATIVE_INTR)
 
 #define ACPI_PDC_T_MASK			(ACPI_PDC_T_FFH | \
 					 ACPI_PDC_SMP_T_SWCOORD)

