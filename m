Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHKIKVCeBGr3LwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 17:52:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA91536890
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 17:52:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308257.1579790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNBsh-0001D5-8v; Wed, 13 May 2026 15:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308257.1579790; Wed, 13 May 2026 15:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNBsh-0001AD-60; Wed, 13 May 2026 15:52:19 +0000
Received: by outflank-mailman (input) for mailman id 1308257;
 Wed, 13 May 2026 15:52:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNBsf-00019y-18
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 15:52:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNBse-0080Y1-Dz
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 17:52:16 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a049e1a-2eae-0a2a0a5409dd-0a2a450ad0ce-38
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 17:52:16 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a049e30-56b3-0a2a450a0019-d1558035c952-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 17:52:16 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so44299255e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 08:52:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fd64960f3sm99045e9.7.2026.05.13.08.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 08:52:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1778687536; x=1779292336; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnFUSVfslOxXss64ij04OSkTYoivoaUv4MLt6D7FnpM=;
        b=MrgHBwJ8CeVVkEZsdztcK6AS6+RuMjTR4/0t/zhRwSZPEDT4M6vqykvOCKELur8A5F
         y1L2Naxn32zUbcBLREByShhVdqGiJqwzSRW6iQa4VxU5QhdmUkgLp67Et12Mve3/J1P5
         kRbJF9BSEEy0N3GztNaJGZmWjR59a9fFCjqhNSkg8FqhlJ9sNFQbfRrDzdW2MNDHINVZ
         I7Ej5/jrLx/KLuaBNinOqLCNhnuRFu18GL5i7xQmsp1CAzdx2A4EE8rb7OWNgGDuaGej
         vzhOWn2vkFV62eXVZD7R8lx8tuEYbdmbmJIuk47oPVAxAUz9K3e54yNJ2DVXu5C78gq9
         UL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778687536; x=1779292336;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WnFUSVfslOxXss64ij04OSkTYoivoaUv4MLt6D7FnpM=;
        b=IkY5yQK9vPfFTNGY0o81nEHWsmfQ/elpjnNV538WGEHOcLd9U0z4hxf1Otsgc/ZJnJ
         qckBF1wnrprzsGwawfLh0KiolwttXYWBzF6wcoRfmo8mZyGdBB2615Sn68gFhrkHyxhh
         WXaWw0/TEiJ96XmgxwM3Km3rmIla8hsjyiC0YxD8/Yb2K52B/GibUycDN8/+E7QCSW7p
         WEA4vmllgjEE4wI50OMANYdCOARaBaw7tV+EG88CLrAqcXtiUrnXymkDFBqVYeSbf57H
         yw2ASt63ugx5rNA1inPt7WFN8LAzUO3v7JNhF+Vj5oW74apKL+mn+ZrRa5ITses1yfgw
         /0Lw==
X-Gm-Message-State: AOJu0Yx/We8ph19OQm9ngvMFjlAP0rs90otDWL8APmj1VYr6wkb+XwMe
	dtkMFsOsOVW+9O1XbmkYewOKaM94Ju0GURbSiLDsvJpysYIpYNlOqF1AoOU2Zddu0t5Bu0GsodK
	NuRE=
X-Gm-Gg: Acq92OGhvZnAMutpm6T7vzG+N9Bb1vTkJ3i34eEWxit/XDWESH2ywyD19j4t9Vs/yau
	RjU7o9FQkQSAd727U79q/lLHhDAe5USa//F9N34hOB3lMbuUIWr0knWpsfLEaL5aSZBcEhqH/ec
	FMXhDIlfUIz/IfO3vkmbbMHGMbgVQA9+ENNcdDHZNvnjJsauaJjxTlXHDiOuH2sIZWOvVtFopdx
	rvf3PeUcFGPBqLwTegLAJ9BFRn5284EcGGv4TbOCTc2JULrzlur5TsCsWePMy2z28Yhv+cHrD2O
	5aQaAHH55Pc8e4XHqp+YgieHc5BjcfDwj/YQRArqkghm+xxan6iKgvSXHZaTaReWSu6at0/Mxfe
	75Hi4b6Tn2GPjG17cwCgpd50uO0PFanhqHvBncudbS0xYQHl9yt6oiKuGt+pcPukrnEHQQRC9f7
	J0ysiQFVhiNOzE43uSmog55Ve/Z66G1RKdPV/wLlaUDSezdNN58kJXUKcoR0foxp8Aqqzs4mXUD
	PjGEvGYIzc5cGc=
X-Received: by 2002:a05:600c:3107:b0:48e:635a:18d2 with SMTP id 5b1f17b1804b1-48fc9a08e2dmr56663645e9.2.1778687535850;
        Wed, 13 May 2026 08:52:15 -0700 (PDT)
Message-ID: <ed512e2e-a3ff-4fe3-8847-80985722c4d3@suse.com>
Date: Wed, 13 May 2026 17:52:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/shim: adjust for Misra C:2012 rule 20.12
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
X-purgate-ID: tlsNG-4011c0/1778687536-705648B7-B1D06B79/0/0
X-purgate-type: clean
X-purgate-size: 3509
X-Rspamd-Queue-Id: 2DA91536890
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,suse.com:email,suse.com:mid,suse.com:dkim];
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
X-Rspamd-Action: no action

... ("A macro parameter used as an operand to the `#' or `##' operators,
which is itself subject to further macro replacement, shall only be used
as an operand to these operators"). Move the HVM_PARAM_ prefixes into the
macro body, to use ## on the 2nd use (each) of the macro parameter.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I understand that this "absorbing" of prefixes isn't liked by some people,
so I'm all ears towards alternative suggestions.

https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14354119193
(also covering the 17.5 patch)

--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -116,17 +116,17 @@ void __init pv_shim_fixup_e820(void)
 
     ASSERT(xen_guest);
 
-#define MARK_PARAM_RAM(p) ({                    \
-    rc = xen_hypercall_hvm_get_param(p, &pfn);  \
-    if ( rc )                                   \
-        panic("Unable to get " #p "\n");        \
-    mark_pfn_as_ram(pfn);                       \
-    ASSERT(i < ARRAY_SIZE(reserved_pages));     \
-    reserved_pages[i++].mfn = pfn;              \
+#define MARK_PARAM_RAM(p) ({                                 \
+    rc = xen_hypercall_hvm_get_param(HVM_PARAM_ ## p, &pfn); \
+    if ( rc )                                                \
+        panic("Unable to get HVM_PARAM_" #p "\n");           \
+    mark_pfn_as_ram(pfn);                                    \
+    ASSERT(i < ARRAY_SIZE(reserved_pages));                  \
+    reserved_pages[i++].mfn = pfn;                           \
 })
-    MARK_PARAM_RAM(HVM_PARAM_STORE_PFN);
+    MARK_PARAM_RAM(STORE_PFN);
     if ( !pv_console )
-        MARK_PARAM_RAM(HVM_PARAM_CONSOLE_PFN);
+        MARK_PARAM_RAM(CONSOLE_PFN);
 #undef MARK_PARAM_RAM
 }
 
@@ -190,9 +190,9 @@ void __init pv_shim_setup_dom(struct dom
     long rc;
 
 #define SET_AND_MAP_PARAM(p, si, va) ({                                        \
-    rc = xen_hypercall_hvm_get_param(p, &param);                               \
+    rc = xen_hypercall_hvm_get_param(HVM_PARAM_ ## p, &param);                 \
     if ( rc )                                                                  \
-        panic("Unable to get " #p "\n");                                       \
+        panic("Unable to get HVM_PARAM_" #p "\n");                             \
     (si) = param;                                                              \
     if ( va )                                                                  \
     {                                                                          \
@@ -207,12 +207,11 @@ void __init pv_shim_setup_dom(struct dom
         evtchn_reserve(d, param);                                              \
     }                                                                          \
 })
-    SET_AND_MAP_PARAM(HVM_PARAM_STORE_PFN, si->store_mfn, store_va);
-    SET_AND_MAP_PARAM(HVM_PARAM_STORE_EVTCHN, si->store_evtchn, 0);
-    SET_AND_MAP_PARAM(HVM_PARAM_CONSOLE_EVTCHN, si->console.domU.evtchn, 0);
+    SET_AND_MAP_PARAM(STORE_PFN, si->store_mfn, store_va);
+    SET_AND_MAP_PARAM(STORE_EVTCHN, si->store_evtchn, 0);
+    SET_AND_MAP_PARAM(CONSOLE_EVTCHN, si->console.domU.evtchn, 0);
     if ( !pv_console )
-        SET_AND_MAP_PARAM(HVM_PARAM_CONSOLE_PFN, si->console.domU.mfn,
-                          console_va);
+        SET_AND_MAP_PARAM(CONSOLE_PFN, si->console.domU.mfn, console_va);
 #undef SET_AND_MAP_PARAM
     else
     {

