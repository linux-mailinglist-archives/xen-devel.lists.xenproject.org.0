Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIUqJ3PA12mdSQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:06:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4BB3CC645
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:06:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277753.1562881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqxT-0002gg-Co; Thu, 09 Apr 2026 15:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277753.1562881; Thu, 09 Apr 2026 15:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqxT-0002f3-9Y; Thu, 09 Apr 2026 15:06:15 +0000
Received: by outflank-mailman (input) for mailman id 1277753;
 Thu, 09 Apr 2026 15:06:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAqxR-0002eT-6N
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:06:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAqxQ-009EAb-IZ
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:06:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c05b-e002-0a2a0a5209dd-0a2a45078f46-12
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:06:12 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c064-ba2d-0a2a45070019-d1558029e56b-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:06:12 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso10677475e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 08:06:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f52easm68813087f8f.36.2026.04.09.08.06.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 08:06:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1775747172; x=1776351972; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hJ87OyB/PZNCTzsGel39eNxl/VN8B5OOlfX4awDKRis=;
        b=ehwgfxYBQFYVwBtU0udPjXYQHp/F5Ugvixfygy3Gj8g/yZpOngJD1JI3mB+0MCPCqn
         dHs5lV4aOv4cvyAJkPrreSRCJrXPeID4FKfL2W4msEW9DPNVLqzZ1n5HDMyC8MH5zi1j
         x4aUSWWTMna4v3Z81g+KXDBKE0GrqMYYE/XkCxcPRVwZfREHqJ03OMHM2JYGcp/OTeB+
         JGCyUoS2kQWcuAnPjBiuEHT37YnPILgxJ/9tyVkc3Z6ISj6LUKaVaHErbsck+LOUhLsT
         r5jWDODLSbhrStGVJ8FVLeoRJoQjo2HCynNbpOkdx14KPhlLKMHRLqTtCeID5rMPZ3eJ
         gLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775747172; x=1776351972;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJ87OyB/PZNCTzsGel39eNxl/VN8B5OOlfX4awDKRis=;
        b=AAWRiSHM0A+Ew2Ixv+hFsxbWbWcIbqBBvjCr6EQmEP96SwCjrz6TO02X09UMWVIeBK
         UigUIQ/DUzEYk0ekDg4Bb2Ow36HRLD1YF1Ii0FCjdxQwewd77xeza5I4bRkMsDMBQnI3
         WVQceXB2+vQQAZwmILDgtrBxa4KZKCVQZA1cwWmpOwkGyy2v7WUPJOw8FAdexTUKflq6
         Cem+GPeKja5jPgw1HWywvCF8YBnHpbx/IyYAUi7Dbes7GF2BeeGrOhDOY/vcj1TTtMyZ
         dKCVb1nGH/VDA3aj4ZepS7BQlGHdXaDw3UtAjbr9LODTzhcu5m7nrl+MGjX2NwjvHIVZ
         7ZeQ==
X-Gm-Message-State: AOJu0Yzus2Pj3iwoQMCesnA30c2426tk2gKvSe00Z/x1qv7+zbyHDc+y
	IhNZT4rKyEQ2rRXmMK9/K+gq6i02jI7hvaiOWbLJbjhDMRkJhkOtRr3rE6DGwpG4MJMXTVozKmD
	j0E34sQ==
X-Gm-Gg: AeBDiet4zz9vJ4YmBLGba9H3Lx3cO6zDtwO4FvEfN5m21A6mu2FxWAdKi0u5tYJagiO
	bZaVddeVqakok3RBcvTqmKKhQnTivWUjk5Pw51LhogiQ3uzw8t/8cT+ezYdjwkgKNPoe7uZVG5p
	fBpNsgq1eInmMLk+RFpENTgF+IhyNmsaN1QQRyTn9ihF4MzioCTUiZZsLxePmC5Olc+AY/VEcS5
	ibO8Lnvfv1MkDcfkEmibLI9EyghNbtJnFg/9xZSX0NLKIZ3oxdcq9JiEM4X1B6IxpOKlsADnb47
	vXFc/8rKCrYwpNgSb5PyIGDY5ksWPCuLrOvBezDuLT+WyTgpYU2f4nrvlH+21VU+1ElvtFBiPES
	BEvG+wcl8ESSY0Cx8eY/alj5y5UUBKuxewLgjI6CvGGMfeJny1BSnr8hGx9iRtfm4ofPyWxFlZq
	RkGX+EK24zYjDtIheSpBnB+fNoRSt7/w1U08eNZElsPomOfuhJozywLVlSARHxp0kNihLXoIsMq
	I/eDZxVkkzs9qo=
X-Received: by 2002:a05:600c:1381:b0:485:6e40:5584 with SMTP id 5b1f17b1804b1-488996afdaemr376676555e9.6.1775747171854;
        Thu, 09 Apr 2026 08:06:11 -0700 (PDT)
Message-ID: <fedd05ce-b952-4d3f-bc47-972b271ddd93@suse.com>
Date: Thu, 9 Apr 2026 17:06:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 08/16] x86/CPUID: enable AVX10.2 sub-leaf
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <1e2ff012-b07a-43be-9ba6-290b38d3c97c@suse.com>
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
In-Reply-To: <1e2ff012-b07a-43be-9ba6-290b38d3c97c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1775747172-1294941E-AC730DAA/0/0
X-purgate-type: clean
X-purgate-size: 5324
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
X-Rspamd-Queue-Id: 3C4BB3CC645
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The logic is modeled as closely as possible after that of leaf 7
sub-leaf handling.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While the "AVX10" infix is necessary everywhere, the "avx10" prefix on
the bitfield name is redundant with the containing structure's field
name (see "x86emul: support AVX10.2 media insns" for how this looks like
in actual use). Do we want to special-case this in gen-cpuid.py?
---
v4: New.

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -343,6 +343,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
         MSR_ENTRY(0x10a, CPUID_REG_EAX),
         MSR_ENTRY(0x10a, CPUID_REG_EDX),
         CPUID_ENTRY(0x80000021, NA, CPUID_REG_ECX),
+        CPUID_ENTRY(0x00000024,  1, CPUID_REG_ECX),
 #undef MSR_ENTRY
 #undef CPUID_ENTRY
     };
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -38,6 +38,7 @@ static const struct {
     { "MSR_ARCH_CAPS.lo",         "m10Al" },
     { "MSR_ARCH_CAPS.hi",         "m10Ah" },
     { "CPUID 0x80000021.ecx",      "e21c" },
+    { "CPUID 0x00000024:1.ecx",    "24c1" },
 };
 
 #define COL_ALIGN "24"
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -547,6 +547,17 @@ void identify_cpu(struct cpuinfo_x86 *c)
 			    &c->x86_capability[FEATURESET_Da1],
 			    &tmp, &tmp, &tmp);
 
+	if (cpu_has(c, X86_FEATURE_AVX10) && c->cpuid_level >= 0x24) {
+		uint32_t max_subleaf;
+
+		cpuid_count(0x24, 0, &max_subleaf, &tmp, &tmp, &tmp);
+		if (max_subleaf >= 1)
+			cpuid_count(0x24, 1,
+				    &tmp, &tmp,
+				    &c->x86_capability[FEATURESET_24c1],
+				    &tmp);
+	}
+
 	if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability)) {
 		val = rdmsr(MSR_ARCH_CAPABILITIES);
 		c->x86_capability[FEATURESET_m10Al] = val;
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -277,6 +277,9 @@ static void recalculate_misc(struct cpu_
     p->avx10.raw[0].b &= 0x000700ff;
     p->avx10.raw[0].c = 0;
     p->avx10.raw[0].d = 0;
+    p->avx10.raw[1].a = 0;
+    p->avx10.raw[1].b = 0;
+    p->avx10.raw[1].d = 0;
     if ( !p->feat.avx10 || !p->avx10.version ||
          !p->avx10.vsz512 || !p->avx10.vsz256 || !p->avx10.vsz128 )
     {
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -409,6 +409,9 @@ XEN_CPUFEATURE(ITS_NO,             16*32
 XEN_CPUFEATURE(TSA_SQ_NO,          18*32+ 1) /*A  No Store Queue Transitive Scheduler Attacks */
 XEN_CPUFEATURE(TSA_L1_NO,          18*32+ 2) /*A  No L1D Transitive Scheduler Attacks */
 
+/* Intel-defined CPU features, CPUID level 0x00000024:1.ecx, word 19 */
+XEN_CPUFEATURE(AVX10_V1_AUX,       19*32+ 2) /*   AVX10 V1 Auxiliary Instructions */
+
 #endif /* XEN_CPUFEATURE */
 
 /* Clean up from a default include.  Close the enum (for C). */
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -23,6 +23,7 @@
 #define FEATURESET_m10Al     16 /* 0x0000010a.eax      */
 #define FEATURESET_m10Ah     17 /* 0x0000010a.edx      */
 #define FEATURESET_e21c      18 /* 0x80000021.ecx      */
+#define FEATURESET_24c1      19 /* 0x00000024:1.ecx    */
 
 struct cpuid_leaf
 {
@@ -64,7 +65,7 @@ const char *x86_cpuid_vendor_to_str(unsi
 #define CPUID_GUEST_NR_FEAT       (2u + 1)
 #define CPUID_GUEST_NR_TOPO       (1u + 1)
 #define CPUID_GUEST_NR_XSTATE     (62u + 1)
-#define CPUID_GUEST_NR_AVX10      (0u + 1)
+#define CPUID_GUEST_NR_AVX10      (1u + 1)
 #define CPUID_GUEST_NR_EXTD_INTEL (0x8u + 1)
 #define CPUID_GUEST_NR_EXTD_AMD   (0x21u + 1)
 #define CPUID_GUEST_NR_EXTD       MAX(CPUID_GUEST_NR_EXTD_INTEL, \
@@ -275,6 +276,14 @@ struct cpu_policy
             bool vsz128:1, vsz256:1, vsz512:1;
             uint32_t :13;
             uint32_t /* c */:32, /* d */:32;
+
+            /* Subleaf 1. */
+            uint32_t /* a */:32, /* b */:32;
+            union {
+                uint32_t _24c1;
+                struct { DECL_BITFIELD(24c1); };
+            };
+            uint32_t /* d */:32;
         };
     } avx10;
 
--- a/xen/arch/x86/lib/cpu-policy/cpuid.c
+++ b/xen/arch/x86/lib/cpu-policy/cpuid.c
@@ -82,6 +82,7 @@ void x86_cpu_policy_to_featureset(
     fs[FEATURESET_m10Al]     = p->arch_caps.lo;
     fs[FEATURESET_m10Ah]     = p->arch_caps.hi;
     fs[FEATURESET_e21c]      = p->extd.e21c;
+    fs[FEATURESET_24c1]      = p->avx10._24c1;
 }
 
 void x86_cpu_featureset_to_policy(
@@ -106,6 +107,7 @@ void x86_cpu_featureset_to_policy(
     p->arch_caps.lo          = fs[FEATURESET_m10Al];
     p->arch_caps.hi          = fs[FEATURESET_m10Ah];
     p->extd.e21c             = fs[FEATURESET_e21c];
+    p->avx10._24c1           = fs[FEATURESET_24c1];
 }
 
 void x86_cpu_policy_recalc_synth(struct cpu_policy *p)
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -310,6 +310,9 @@ def crunch_numbers(state):
         AVX512BW: [AVX512_VBMI, AVX512_VBMI2, AVX512_BITALG, AVX512_BF16,
                    AVX512_FP16, AVX512_BMM],
 
+        # AVX10 discrete features.
+        AVX10: [AVX10_V1_AUX],
+
         # Extensions with VEX/EVEX encodings keyed to a separate feature
         # flag are made dependents of their respective legacy feature.
         PCLMULQDQ: [VPCLMULQDQ],


