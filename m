Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPjyA9VIA2pU2wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:35:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76046523C19
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:35:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306994.1578722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMp8z-0002yK-88; Tue, 12 May 2026 15:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306994.1578722; Tue, 12 May 2026 15:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMp8z-0002wg-5P; Tue, 12 May 2026 15:35:37 +0000
Received: by outflank-mailman (input) for mailman id 1306994;
 Tue, 12 May 2026 15:35:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMp8y-0002wY-7F
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:35:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMp8x-00HGoL-Gh
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:35:35 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0348c3-e002-0a2a0a5209dd-0a2a450794fc-26
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:35:35 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0348c7-229c-0a2a45070019-d155dd33b8ad-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:35:35 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43d76dd4ee8so5264888f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 08:35:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491304505sm33585782f8f.22.2026.05.12.08.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 08:35:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1778600135; x=1779204935; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+F18zTQ2tYhuJeL6OBgVxAMYMHPNiYmv6o58vYh8r4k=;
        b=OQKxYwGUB1j7rijXPZQ+DtPbrw+MKIcVxEZfMOjEU6xrBy2ogOVxlTJ1f4CSAolZjO
         VKp5plf/1Ridv+XFQDbfprO7192DMp80DiDkEwk1TPKtBJz/6D//GL7FFqCqynAwZXUg
         fexPyqelIRthaFPi9v33EqwgclBy5jCCGgVZLFHAW6k/u1O9s78Q5dysVE571zqlAFD9
         MX/dwIwIyEF7x6YkHRGMC1f6sU/bKdfsaKivV5dmdyZXeiyzHmkQdB0vfZmSnv2afJbz
         HzlZOvHd1g+2kSmdp7vEkKyxeZ36IcUL7eFmzKj2PHsaWYXDFBF6Dx6xXraI00cJwE7H
         FXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600135; x=1779204935;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+F18zTQ2tYhuJeL6OBgVxAMYMHPNiYmv6o58vYh8r4k=;
        b=GclHBz0L4AO2XV2QVUGbDYDkjNBJTk7vM7qcIXom5NRIQov2WFNXLnOwYLZrau4VLK
         abAyAe/lz6tvZaKeea93d3yjZ+sRWYcDrX6i+MOYccmU6h+5L71DwgVxl5H4WLrZVKuJ
         JpJMLubqL5kUGYvpTDxeBWGTw+Orb74nlKOk5JMuS04KHLwb01Gb213WDxj3v/4zXwQm
         lcFuVQdrv9UpYdfnL7bO377SQKGJuXkxhAEPbwpg2AJVbtMaIjMubmhSRdN3cWREtgP7
         F2zrUcbQ7XjtjXauBLvDFvOxNYMNx8RXcAjTTYKZnDGqRjKisQxHTDntjqU92agueF/v
         zjZQ==
X-Gm-Message-State: AOJu0YxMJVY7H33s5nSoxbrcmb637zedoJY2rmgOGoGym53K8mSbgHm4
	ftgMxXwlVcKJziCn1VxRXSYKdqO+iFDEYbOgh180opOpPj3Iqq5/I6cm1RAnGXmeYBTBmHR0Av0
	BFcw=
X-Gm-Gg: Acq92OGZE7dgxLd4Q+UinBrGfYwqEQyCJ5ZN7cTgxspUInG2/Vi6Kudekjj2aTtjrFg
	PX5jqx75Kp1C6sOhHIe+4Fnu1IojE5Lwx8FCt8fFmpkkdbDpJvCwxQQEahh/Z+GXXzRRt05QdOf
	7AnEFiFYubFFI8KshTi+lL6JIr2y1qUblrjYKueiO4dFKClUEaSx+7fiexd7tLZFKKxNx1JdQZ8
	yvGct3n+ZV6RUzZbGkKaMslyZrM37DNHcIbobrQ7xTHMFDJD9hzP1roOclHsLl8p1owom985Z0C
	JOTr9Fo1lJThZIja4XH+BPKDOV/07j/L7+S7/JocxcRjXGJsewLCTTHqhSj8/AFJybFp75M3ONJ
	LR5livL5aPeQRhOX65CkM2WE7krd87dCjZQ6YX+sRiVGMu7BkJmK0CNs+Z+EeMiin4o+z1jWOIC
	E4m3aDZGGri4yvYTY2i0wxZzQrgzbSb2nYKmzvsIpM9OguuT5wUWM2ZRmqkwH+/W87DiUi4Q8+X
	4yHXftFhC+H8yM=
X-Received: by 2002:a05:6000:3113:b0:456:15fa:9eba with SMTP id ffacd0b85a97d-456a4daccb9mr21661640f8f.43.1778600134763;
        Tue, 12 May 2026 08:35:34 -0700 (PDT)
Message-ID: <5c66cfb1-e234-4efa-9a01-88acb284e414@suse.com>
Date: Tue, 12 May 2026 17:35:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.22 v2 1/8] x86/mwait-idle: arrange for BSP MSR
 adjustments during S3 resume
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <178739fe-fa41-4ff7-b16e-67c4b2a99b38@suse.com>
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
In-Reply-To: <178739fe-fa41-4ff7-b16e-67c4b2a99b38@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1778600135-0AB70C48-33CB9FDF/0/0
X-purgate-type: clean
X-purgate-size: 3124
X-Rspamd-Queue-Id: 76046523C19
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:mid,suse.com:dkim];
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
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

mwait_idle_cpu_init() is only called for APs, yet MSR writes will
typically need re-doing post-S3 even for the BSP. When multiple cores /
threads are present (and to come back online) in a package, for package
scope MSRs this may be covered by APs doing the writes, but we can't rely
on that.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -28,6 +28,7 @@
 #include <asm/io_apic.h>
 #include <asm/irq.h>
 #include <asm/microcode.h>
+#include <asm/mwait.h>
 #include <asm/prot-key.h>
 #include <asm/spec_ctrl.h>
 #include <asm/tboot.h>
@@ -299,6 +300,7 @@ static int enter_state(u32 state)
     acpi_sleep_post(state);
     if ( hvm_cpu_up() )
         BUG();
+    mwait_idle_resume();
     cpufreq_add_cpu(0);
 
  enable_cpu:
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1677,6 +1677,28 @@ static int __init mwait_idle_probe(void)
 	return 0;
 }
 
+static void mwait_idle_cpu_tweak(unsigned int cpu)
+{
+	if (icpu->auto_demotion_disable_flags)
+		on_selected_cpus(cpumask_of(cpu), auto_demotion_disable, NULL, 1);
+
+	if (icpu->byt_auto_demotion_disable_flag)
+		on_selected_cpus(cpumask_of(cpu), byt_auto_demotion_disable, NULL, 1);
+
+	switch (icpu->c1e_promotion) {
+	case C1E_PROMOTION_DISABLE:
+		on_selected_cpus(cpumask_of(cpu), c1e_promotion_disable, NULL, 1);
+		break;
+
+	case C1E_PROMOTION_ENABLE:
+		on_selected_cpus(cpumask_of(cpu), c1e_promotion_enable, NULL, 1);
+		break;
+
+	case C1E_PROMOTION_PRESERVE:
+		break;
+	}
+}
+
 static int cf_check mwait_idle_cpu_init(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
@@ -1759,24 +1781,7 @@ static int cf_check mwait_idle_cpu_init(
 		dev->count++;
 	}
 
-	if (icpu->auto_demotion_disable_flags)
-		on_selected_cpus(cpumask_of(cpu), auto_demotion_disable, NULL, 1);
-
-	if (icpu->byt_auto_demotion_disable_flag)
-		on_selected_cpus(cpumask_of(cpu), byt_auto_demotion_disable, NULL, 1);
-
-	switch (icpu->c1e_promotion) {
-	case C1E_PROMOTION_DISABLE:
-		on_selected_cpus(cpumask_of(cpu), c1e_promotion_disable, NULL, 1);
-		break;
-
-	case C1E_PROMOTION_ENABLE:
-		on_selected_cpus(cpumask_of(cpu), c1e_promotion_enable, NULL, 1);
-		break;
-
-	case C1E_PROMOTION_PRESERVE:
-		break;
-	}
+	mwait_idle_cpu_tweak(cpu);
 
 	return NOTIFY_DONE;
 }
@@ -1808,6 +1813,14 @@ int __init mwait_idle_init(struct notifi
 	return err;
 }
 
+void mwait_idle_resume(void)
+{
+	if (!icpu)
+		return;
+
+	mwait_idle_cpu_tweak(smp_processor_id());
+}
+
 /* Helper function for HPET. */
 bool __init mwait_pc10_supported(void)
 {
--- a/xen/arch/x86/include/asm/mwait.h
+++ b/xen/arch/x86/include/asm/mwait.h
@@ -14,9 +14,12 @@
 #define MWAIT_ECX_INTERRUPT_BREAK	0x1
 
 void mwait_idle_with_hints(unsigned int eax, unsigned int ecx);
+
 #ifdef CONFIG_INTEL
+void mwait_idle_resume(void);
 bool mwait_pc10_supported(void);
 #else
+static inline void mwait_idle_resume(void) {}
 static inline bool mwait_pc10_supported(void)
 {
     return false;


