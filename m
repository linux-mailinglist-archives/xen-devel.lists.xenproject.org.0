Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EEUWAcvGQ2oihgoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 15:38:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6727E6E4EE0
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 15:38:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=RFCx9gme;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1348917.1606715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYf5-0004S2-PN; Tue, 30 Jun 2026 13:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348917.1606715; Tue, 30 Jun 2026 13:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYf5-0004QD-M3; Tue, 30 Jun 2026 13:38:03 +0000
Received: by outflank-mailman (input) for mailman id 1348917;
 Tue, 30 Jun 2026 13:38:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weYf4-0004PZ-Bd
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 13:38:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weYf3-0009v8-Oi
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:38:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43c6b1-bab6-0a2a0a5309dd-0a2a4507c744-24
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:38:01 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43c6b9-9c8e-0a2a45070019-d155dd2ff136-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:38:01 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-475881b9a4bso1026592f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 06:38:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493b8d0496csm64434035e9.10.2026.06.30.06.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 06:38:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1782826681; x=1783431481; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aWw5oXdUq4wThRxwerDBhYcqgBm3b57dsTIMT7oKGWE=;
        b=RFCx9gmeLh309nIaMhjbHxEw5w7+sjUnCp9qTNUfyC8UHtPCHmY66KgzSOoLaYHEp5
         vNZAebXUCI5ex1bxQjaWm+caOa+D2sPxdWgDwBhLjTAErXUKUJAFgxqbcZSoPRFRxVht
         lS5u0Weuz4zxvx1xy75zxkJ+/tpmtGGhNJijOjOlpyHiBmXHDANibvs98ohaA++ZACIN
         0E2aW22TX0sgYmoKBfrZ4UPR/hJk3zWm/ErOz9SE7CR/OfHlyRO/Kk8Q+GM8eYgwESNt
         Z8cBEijYKadPHRtLztIJ3NptsA/yYatNXn+ZRWrPs4OxoP8wdgCAEH5iPHQ4X/vNDdGK
         C9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826681; x=1783431481;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWw5oXdUq4wThRxwerDBhYcqgBm3b57dsTIMT7oKGWE=;
        b=j9gTXY4140X2+qrDP8s/B2Wre5TPDdTU7DQnYEdcqLXTIrCWbsjT7YNttLb+FdoqkN
         BgQLKq6RgtwXas1VlvxihcgErq+tjHahei0xnyD8QmNR7OrxsPovrkUq7rvmy8UTFSqT
         2HJFEAUaKoaWVRjQkZPe4Irgac8Hug6gc9MTDQpbpnnzkytevTPhm/YNnDHika2u6sU9
         jfJDWbm9pTG+VPLBiaQL7WeuLw+wKOwqP5QkaegblfC+vi0Zqu6pSUxMyUDDZDrt6pPf
         GLXQ2qdzRS5YWoDOX7vnVMC7zI6247fNW7tOoJAvT0OrGxvzKWNms50OonKubHYpiMF0
         B/8w==
X-Gm-Message-State: AOJu0Yw9EE3VpoCsD9rE60ES4Y41cNb+o7bik97veE2xtU5cm4lT6QxF
	UUniJH+wSTGEbbAvg9nLsNCqWA1MQLLB3SuLwcIVo42VFj/ykqLj47kvD7mzI3WiF4tyNqdyc8s
	jz7jLzA==
X-Gm-Gg: AfdE7cmrQEh/eRbLjKGKycJjOMUIF28Kx+hsR0MUhdtagQyC/MI3ustnrqrK2OJ7mcl
	deHS39XDXatru5ohNBjsQnj1uw/TWkezyMxBCdw4gB4OMz1k25kqq5HDAL7q4HLkE30bVaSu38K
	8ENdhqP4HZWlo+251GRnc6ArnjNQ9Zzh+WYx8xJ3oSixTmzrHPtno4P3bT6xv7gfGFVwiWeqfVY
	MOqEisasYFaqzhj9jJrT5e9zDSyeX+4x33CSX8NboZEe3BT/6LBAS7kx5Y31O2z+NMtOyFkEmim
	O1xrZXmeXxjTLiafK2Z3VNOHj14TyF0szCJLYO0I4XHgip2DS5vuOEf99sKJUojWNvyBHkPZJ06
	n3VR7C+0t18m2+m8VTTD3rg6nj8WId0C3wx/GwpYTAlTGtVyzh5iXwxuIN35v5XYJyk7JadvG/p
	q76WPFjpmew6c0/HnAwskf3B7UbtHZyn5G6gwoJITxuJ9vK606vVku9dMC+84FDs2DWNwRdktr9
	bee
X-Received: by 2002:a05:600c:c3c1:20b0:492:6447:7a7f with SMTP id 5b1f17b1804b1-493b827fd66mr41872975e9.6.1782826680919;
        Tue, 30 Jun 2026 06:38:00 -0700 (PDT)
Message-ID: <8e6f5ad5-21e4-4325-96de-e03ba65a1b8d@suse.com>
Date: Tue, 30 Jun 2026 15:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC] x86/PV: avoid HVM-copying alternatives in PV-only code
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
X-purgate-ID: tlsNG-ef75cf/1782826681-FFD3425E-1B0CB24B/0/0
X-purgate-type: clean
X-purgate-size: 5185
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 6727E6E4EE0

raw_copy_*_guest*() expanding to both a HVM and a PV alternative leaves a
lot of unreachable code, violating Misra C:2012 rule 2.1 (without Eclair
being able to spot this). Introduce a mechanism to avoid that in handling
of PV-only hypercalls (i.e. ones which only PV domains can issue and which
only act on PV domains [or which are not domain related]).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In my default test build this reduces overall code size by almost 2k, and
that's with PV_SHIM=n.

RFC: Is something like this going to be acceptable at all?

RFC: The HVM-only enabling is just in case; right now it doesn't look as
     if that would actually be usable anywhere.

Overriding is_hvm_vcpu() (and/or is_hvm_domain()) of course has yet better
effects, which pv/shim.c shows particularly well. Yet Misra won't like us
doing so.

--- a/xen/arch/x86/compat.c
+++ b/xen/arch/x86/compat.c
@@ -5,6 +5,8 @@
  * hypercall after doing necessary argument munging.
  */
 
+#define PV_ONLY_SOURCE 1
+
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/trace.h>
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1262,6 +1262,8 @@ static void cf_check __maybe_unused x86_
 
 #ifdef CONFIG_PV /* do_mca() hypercall is PV-only */
 
+#define PV_ONLY_SOURCE 1
+
 #if BITS_PER_LONG == 64
 
 /* Two layers of casting to cover Misra C:2012 rule 11.2. */
@@ -1666,6 +1668,8 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_m
     return ret;
 }
 
+#undef PV_ONLY_SOURCE
+
 #endif /* CONFIG_PV */
 
 static int mcinfo_dumped;
--- a/xen/arch/x86/include/asm/guest_access.h
+++ b/xen/arch/x86/include/asm/guest_access.h
@@ -14,11 +14,15 @@
 
 /* Raw access functions: no type checking. */
 #define raw_copy_to_guest(dst, src, len)        \
-    (is_hvm_vcpu(current) ?                     \
+    ((IS_ENABLED(HVM_ONLY_SOURCE) ||            \
+      (!IS_ENABLED(PV_ONLY_SOURCE) &&           \
+       is_hvm_vcpu(current))) ?                 \
      copy_to_user_hvm((dst), (src), (len)) :    \
      copy_to_guest_pv(dst, src, len))
 #define raw_copy_from_guest(dst, src, len)      \
-    (is_hvm_vcpu(current) ?                     \
+    ((IS_ENABLED(HVM_ONLY_SOURCE) ||            \
+      (!IS_ENABLED(PV_ONLY_SOURCE) &&           \
+       is_hvm_vcpu(current))) ?                 \
      copy_from_user_hvm((dst), (src), (len)) :  \
      copy_from_guest_pv(dst, src, len))
 #define raw_clear_guest(dst,  len)              \
@@ -26,11 +30,15 @@
      clear_user_hvm((dst), (len)) :             \
      clear_guest_pv(dst, len))
 #define __raw_copy_to_guest(dst, src, len)      \
-    (is_hvm_vcpu(current) ?                     \
+    ((IS_ENABLED(HVM_ONLY_SOURCE) ||            \
+      (!IS_ENABLED(PV_ONLY_SOURCE) &&           \
+       is_hvm_vcpu(current))) ?                 \
      copy_to_user_hvm((dst), (src), (len)) :    \
      __copy_to_guest_pv(dst, src, len))
 #define __raw_copy_from_guest(dst, src, len)    \
-    (is_hvm_vcpu(current) ?                     \
+    ((IS_ENABLED(HVM_ONLY_SOURCE) ||            \
+      (!IS_ENABLED(PV_ONLY_SOURCE) &&           \
+       is_hvm_vcpu(current))) ?                 \
      copy_from_user_hvm((dst), (src), (len)) :  \
      __copy_from_guest_pv(dst, src, len))
 
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3407,6 +3407,9 @@ int new_guest_cr3(mfn_t mfn)
 #endif
 
 #ifdef CONFIG_PV
+
+#define PV_ONLY_SOURCE 1
+
 static int vcpumask_to_pcpumask(
     struct domain *d, XEN_GUEST_HANDLE_PARAM(const_void) bmap, cpumask_t *pmask)
 {
@@ -3447,6 +3450,8 @@ static int vcpumask_to_pcpumask(
     }
 }
 
+#undef PV_ONLY_SOURCE
+
 long do_mmuext_op(
     XEN_GUEST_HANDLE_PARAM(mmuext_op_t) uops,
     unsigned int count,
@@ -3983,6 +3988,8 @@ long do_mmuext_op(
     return rc;
 }
 
+#define PV_ONLY_SOURCE 1
+
 long do_mmu_update(
     XEN_GUEST_HANDLE_PARAM(mmu_update_t) ureqs,
     unsigned int count,
@@ -4361,6 +4364,9 @@ long do_mmu_update(
 
     return rc;
 }
+
+#undef PV_ONLY_SOURCE
+
 #endif /* CONFIG_PV */
 
 /*
--- a/xen/arch/x86/pv/callback.c
+++ b/xen/arch/x86/pv/callback.c
@@ -5,6 +5,8 @@
  * hypercall handles and helper functions for guest callback
  */
 
+#define PV_ONLY_SOURCE 1
+
 #include <xen/event.h>
 #include <xen/hypercall.h>
 #include <xen/guest_access.h>
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -8,6 +8,8 @@
  * Copyright (c) 2004 Christian Limpach
  */
 
+#define PV_ONLY_SOURCE 1
+
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -6,6 +6,9 @@
  *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
+
+#define PV_ONLY_SOURCE 1
+
 #include <xen/event.h>
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -6,6 +6,8 @@
  * - Magnus Damm <magnus@valinux.co.jp>
  */
 
+#define PV_ONLY_SOURCE 1 /* Relevant only for x86. */
+
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/acpi.h>

