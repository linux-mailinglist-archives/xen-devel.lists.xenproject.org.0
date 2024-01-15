Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FB582DCFD
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 17:08:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667499.1038823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPPVb-0000Gx-BH; Mon, 15 Jan 2024 16:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667499.1038823; Mon, 15 Jan 2024 16:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPPVb-0000Ek-7w; Mon, 15 Jan 2024 16:08:19 +0000
Received: by outflank-mailman (input) for mailman id 667499;
 Mon, 15 Jan 2024 16:08:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPPVZ-0000Ee-36
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 16:08:17 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a8b3a04-b3c0-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 17:08:16 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2cd853c159eso51127881fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 08:08:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fa1-20020a056638618100b0046e4e92e0aesm2438604jab.174.2024.01.15.08.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 08:08:15 -0800 (PST)
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
X-Inumbo-ID: 4a8b3a04-b3c0-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705334896; x=1705939696; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lE0eudnGHo8w4a3AubvqhY+42NwJjhy0HH3HoGUR5Qk=;
        b=MeBqbyS99CZV7waUjyBNQ/MW5+66EKmjG2OCwn+8dp20QSgyDvsQzIv4v7yvjtAzS6
         AZjcqU8FNHIdpU/uqJKfAjW+Lekoqry3EGVsdndInNMFJMzY7dSSbviigEMzVILX7IvC
         ngqvu7xOBjbiA5UNF2f2jjqJf5uuTTYuU/OLDfrn/l7AGhLJ0nf23x6RO6rg9NQhJ/O0
         KcgP6VtGPxzqvpP38qvjHb2MWEmbXBK/T1MsH95k5f/ekIO4WqxjpyuyBzZXLEavDLfz
         KTMWyMnNVhVPo+JfUSn3vC3BrrmLGMXTDBmtM82m+oZftIdGczLX0porFjk0cKQaEnZv
         P0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705334896; x=1705939696;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lE0eudnGHo8w4a3AubvqhY+42NwJjhy0HH3HoGUR5Qk=;
        b=U/GVfQFPAaG8oemUexs34MqbD67HX/a8NAb/ZfO6FFbODz8pQpsVPvrhgDaDli3r/S
         fpgnEPaVUPDybNyjvScJgZsoTMunA5ROzzB56EVxDqOOjTlrRD9So7MabShRSn+GIu4w
         pNAWY+jVpmR4FEnsDL6vV3ybtzpVMMjEtSmUDrK8tg2FSserB3JOMKM2N6GnF9VzS/KQ
         9/g6UbQf1UyzgPtlJd6ts4GLMnMBQWpbrvlMxCCODPIrdYLNTaG1cAH9PgHGJIgbpb+m
         GtYIfxa1IxRcRDurTN/5tEjOSO0QrHHbRGbHZPw0Q26fplAm4bD1vJkLAMJVxP2dpiaQ
         PZPA==
X-Gm-Message-State: AOJu0Yz0zRy3+EQuRSYhrOh61a1BUE0Q5QqKE3yVfe0yClRxZJ5lWiPa
	Mttfc4jMLiCLUl0Ct8WFSa9znNeJbnUqexQTybfOBZggWQ==
X-Google-Smtp-Source: AGHT+IFRbHVTiwlQR0YepCbbEHE3F1iv1DiYYbVaWzuC/iFgJJhTAGNkxjaXINvnoH87ZZNa0QSDIw==
X-Received: by 2002:a2e:2419:0:b0:2cd:56ab:caa1 with SMTP id k25-20020a2e2419000000b002cd56abcaa1mr2487316ljk.5.1705334895737;
        Mon, 15 Jan 2024 08:08:15 -0800 (PST)
Message-ID: <c48df0a3-f837-4e03-84d8-ef63c09b6da7@suse.com>
Date: Mon, 15 Jan 2024 17:08:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/APIC: finish genapic conversion to altcall
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

While .probe() doesn't need fiddling with for being run only very early,
init_apic_ldr() wants converting too despite not being on a frequently
executed path: This way all pre-filled struct genapic instances can
become __initconst_cf_clobber, thus allowing to eliminate 15 more ENDBR
during the 2nd phase of alternatives patching.

While fiddling with section annotations here, also move "genapic" itself
to .data.ro_after_init.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/genapic/bigsmp.c
+++ b/xen/arch/x86/genapic/bigsmp.c
@@ -44,7 +44,7 @@ static int __init cf_check probe_bigsmp(
 	return def_to_bigsmp;
 } 
 
-const struct genapic __initconstrel apic_bigsmp = {
+const struct genapic __initconst_cf_clobber apic_bigsmp = {
 	APIC_INIT("bigsmp", probe_bigsmp),
 	GENAPIC_PHYS
 };
--- a/xen/arch/x86/genapic/default.c
+++ b/xen/arch/x86/genapic/default.c
@@ -14,7 +14,7 @@
 #include <asm/io_apic.h>
 
 /* should be called last. */
-const struct genapic __initconstrel apic_default = {
+const struct genapic __initconst_cf_clobber apic_default = {
 	APIC_INIT("default", NULL),
 	GENAPIC_FLAT
 };
--- a/xen/arch/x86/genapic/probe.c
+++ b/xen/arch/x86/genapic/probe.c
@@ -16,7 +16,7 @@
 #include <asm/mach-generic/mach_apic.h>
 #include <asm/setup.h>
 
-struct genapic __read_mostly genapic;
+struct genapic __ro_after_init genapic;
 
 static const struct genapic *const __initconstrel apic_probe[] = {
 	&apic_bigsmp, 
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -158,7 +158,7 @@ static void cf_check send_IPI_mask_x2api
     local_irq_restore(flags);
 }
 
-static const struct genapic __initconstrel apic_x2apic_phys = {
+static const struct genapic __initconst_cf_clobber apic_x2apic_phys = {
     APIC_INIT("x2apic_phys", NULL),
     .int_delivery_mode = dest_Fixed,
     .int_dest_mode = 0 /* physical delivery */,
@@ -169,7 +169,7 @@ static const struct genapic __initconstr
     .send_IPI_self = send_IPI_self_x2apic
 };
 
-static const struct genapic __initconstrel apic_x2apic_cluster = {
+static const struct genapic __initconst_cf_clobber apic_x2apic_cluster = {
     APIC_INIT("x2apic_cluster", NULL),
     .int_delivery_mode = dest_LowestPrio,
     .int_dest_mode = 1 /* logical delivery */,
@@ -187,7 +187,7 @@ static const struct genapic __initconstr
  * IPIs to be more efficiently delivered by not having to perform an ICR write
  * for each target CPU.
  */
-static const struct genapic __initconstrel apic_x2apic_mixed = {
+static const struct genapic __initconst_cf_clobber apic_x2apic_mixed = {
     APIC_INIT("x2apic_mixed", NULL),
 
     /*
--- a/xen/arch/x86/include/asm/mach-generic/mach_apic.h
+++ b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
@@ -10,7 +10,7 @@
 #define INT_DELIVERY_MODE (genapic.int_delivery_mode)
 #define INT_DEST_MODE (genapic.int_dest_mode)
 #define TARGET_CPUS ((const typeof(cpu_online_map) *)&cpu_online_map)
-#define init_apic_ldr (genapic.init_apic_ldr)
+#define init_apic_ldr() alternative_vcall(genapic.init_apic_ldr)
 #define cpu_mask_to_apicid(mask) ({ \
 	/* \
 	 * There are a number of places where the address of a local variable \

