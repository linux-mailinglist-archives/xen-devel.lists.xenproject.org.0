Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIXGLRbA12mdSQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:04:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BF93CC5EC
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277722.1562854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqvw-00015u-GH; Thu, 09 Apr 2026 15:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277722.1562854; Thu, 09 Apr 2026 15:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqvw-00013O-DA; Thu, 09 Apr 2026 15:04:40 +0000
Received: by outflank-mailman (input) for mailman id 1277722;
 Thu, 09 Apr 2026 15:04:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAqvv-000132-Im
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:04:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAqvu-0029M9-Un
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:04:38 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7bff1-e002-0a2a0a5209dd-0a2a4502e448-36
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:04:38 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c006-42fa-0a2a45020019-d1558035dc3b-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:04:38 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-488ba6366a7so12122215e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 08:04:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd1999c6sm43003585e9.4.2026.04.09.08.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 08:04:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1775747078; x=1776351878; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sk4QjbaA4C4zd++R6vZvuA+gGTh5nm2Now1s0GL3ozA=;
        b=aJ6HX6AuAae1cCPG0swNqB/DHFdcrs863dFr0KkGqK751JWRuo1QkjE+niVAHcVxQu
         G1HPLGkkNFKOTmPWlLjw6f9eaXe/gqYZ1vIwE/2zDAtYKU6Xm+rmZEkcZkbyk9vTVLDR
         UOfFW9bNyGy6gswj+JZmiJdke3FcAyNxGjrZIhC+KSa/MTaYugpid7/xID9LeeE6/lgG
         ajzQgCfTqaLkAp66KxzbUvQALWfbTJrUmbTI8nq12WYcOoc+6SOxudbv8UAgWjb3vXgb
         AjXXGN3ON4FvcK4eerP4fo2uOQjU3Lakcr7Cev8r3OCuyeCcYJHuA1pMy/pdpKACk3Lt
         0kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775747078; x=1776351878;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sk4QjbaA4C4zd++R6vZvuA+gGTh5nm2Now1s0GL3ozA=;
        b=i/QDoQXPomkiU+YmVD0GV3sCWp0b07SyC19eQ9Vwhe7bKTeTm6/+3PW9I/vtjG5xSb
         XWLLJr/Gm4CEl8UGw87BysoHXRCno/1ebi7MZYrchs9EqvKLRVUSGcnKawn5NGAbAiBT
         cvJHY7dluJgXyeC55eN1OFBcfLDC9siNlIqjWMT8bOw9cGrjjXPo++/8ASbaCqSj3Vme
         OOA7Bx+sA2Jv4gYWinA7XUusQyUXsjlEGuYDyKuzvIlur2Jc04UAgg0z80y05UXHGvz6
         ifjK92Ae2faxiWwRWO528ZxunvwbRv+nqVlE7o8/2b4r3i4wMBUS9SRBgBGFKIGHEGSG
         Si3Q==
X-Gm-Message-State: AOJu0Yxb6icKyFS5Rsb2sE9ur21jMzatsama+iXw0ZIgEeyq8Igi3vYy
	kL8vKKlitMHP34hvybL1qAxZf8SYtMQt/F7bIWeayfpnoC1sxdkCpLIgIOC7id4Di6BGWptoP70
	ZBnF1jw==
X-Gm-Gg: AeBDietD6GeZZB4TlE7GnjFEPSSmptusMy5NzU3KSIuUGthNoqiAfwzbcfouE6KoikP
	sNwhrY/IOxauk55LEJGpI7WXLSg7jM2+jgdeAR/zQeSa1Q1yPNd4IPioMjNe1etztWXe1KA1tqu
	xyT8rwFHJfs1faScamuzDqhP2jK0uVamvTmQjq1gBnmm8ZM9/LGPz2+tbjtqgthFs2ZAUox2dHZ
	yyOJTnrzQyoq4w6a+DNMbMmuIsOjPJsmHuOgwfcPyDi/dJAaiWmJscRANHetYsTjpkwGE5/qMkA
	sv5u7vaHPup9t5tqPyEYaywjacnlL34xCev+itnRSynaVGYzWSNlTRm5Mn5/mYWKXSD/qbsINrr
	83ifY9D6Zlcy3P1qHh1QO4xVkGpLTDUEsR559mRcgun6T7DbXUmRYVrgUKWLI060fF/JBEkP5Pv
	7XAnoxDkDSGpHQnyVoyQfJRU15IHkSYI++dgW8sOBEo5fDQSHKM7aOfFFChEpcatNhKjY9bFFoU
	JSAafMmEGwRktE=
X-Received: by 2002:a05:600c:1381:b0:487:1108:48af with SMTP id 5b1f17b1804b1-488996a351bmr359902395e9.4.1775747078262;
        Thu, 09 Apr 2026 08:04:38 -0700 (PDT)
Message-ID: <36d9ab74-a7e0-4ec3-ae3e-4c9cae6982e5@suse.com>
Date: Thu, 9 Apr 2026 17:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 05/16] x86emul/test: drop cpu_has_avx512vl
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
X-purgate-ID: tlsNG-720697/1775747078-ADB3FCD1-543089F8/0/0
X-purgate-type: clean
X-purgate-size: 2885
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
X-Rspamd-Queue-Id: 46BF93CC5EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

AVX512VL not being a standalone feature anyway, but always needing
to be combined with some other AVX512*, replace uses of
cpu_has_avx512vl by just the feature bit check.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base over dropping of Xeon Phi support.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1025,7 +1025,8 @@ static void test_group(const struct test
     {
         for ( j = 0; j < nr_vl; ++j )
         {
-            if ( vl[0] == VL_512 && vl[j] != VL_512 && !cpu_has_avx512vl )
+            if ( vl[0] == VL_512 && vl[j] != VL_512 &&
+                 !cpu_policy.feat.avx512vl )
                 continue;
 
             switch ( tests[i].esz )
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -131,7 +131,7 @@ static bool simd_check_avx512f(void)
 
 static bool simd_check_avx512f_vl(void)
 {
-    return cpu_has_avx512f && cpu_has_avx512vl;
+    return cpu_has_avx512f && cpu_policy.feat.avx512vl;
 }
 #define simd_check_avx512vl_sg simd_check_avx512f_vl
 
@@ -143,7 +143,7 @@ static bool simd_check_avx512dq(void)
 
 static bool simd_check_avx512dq_vl(void)
 {
-    return cpu_has_avx512dq && cpu_has_avx512vl;
+    return cpu_has_avx512dq && cpu_policy.feat.avx512vl;
 }
 
 static bool simd_check_avx512bw(void)
@@ -154,7 +154,7 @@ static bool simd_check_avx512bw(void)
 
 static bool simd_check_avx512bw_vl(void)
 {
-    return cpu_has_avx512bw && cpu_has_avx512vl;
+    return cpu_has_avx512bw && cpu_policy.feat.avx512vl;
 }
 
 static bool simd_check_avx512vbmi(void)
@@ -164,7 +164,7 @@ static bool simd_check_avx512vbmi(void)
 
 static bool simd_check_avx512vbmi_vl(void)
 {
-    return cpu_has_avx512_vbmi && cpu_has_avx512vl;
+    return cpu_has_avx512_vbmi && cpu_policy.feat.avx512vl;
 }
 
 static bool simd_check_avx512vbmi2(void)
@@ -260,7 +260,7 @@ static bool simd_check_avx512fp16(void)
 
 static bool simd_check_avx512fp16_vl(void)
 {
-    return cpu_has_avx512_fp16 && cpu_has_avx512vl;
+    return cpu_has_avx512_fp16 && cpu_policy.feat.avx512vl;
 }
 
 static void simd_set_regs(struct cpu_user_regs *regs)
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -179,8 +179,6 @@ void wrpkru(unsigned int val);
 #define cpu_has_sha                  cpu_policy.feat.sha
 #define cpu_has_avx512bw            (cpu_policy.feat.avx512bw && \
                                      xcr0_mask(0xe6))
-#define cpu_has_avx512vl            (cpu_policy.feat.avx512vl && \
-                                     xcr0_mask(0xe6))
 #define cpu_has_avx512_vbmi         (cpu_policy.feat.avx512_vbmi && \
                                      xcr0_mask(0xe6))
 #define cpu_has_avx512_vbmi2        (cpu_policy.feat.avx512_vbmi2 && \


