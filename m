Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HA+EmeFBGrVKwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:06:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64EB534ADF
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:06:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308083.1579632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNAEC-0001WX-6k; Wed, 13 May 2026 14:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308083.1579632; Wed, 13 May 2026 14:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNAEC-0001Ti-3s; Wed, 13 May 2026 14:06:24 +0000
Received: by outflank-mailman (input) for mailman id 1308083;
 Wed, 13 May 2026 14:06:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNAEA-0001TM-IT
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 14:06:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNAE8-00CJHY-DX
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 16:06:21 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a04855b-5cb7-0a2a0a5109dd-0a2a45029b4a-14
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:06:21 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a04855d-af86-0a2a45020019-d1558034e582-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:06:21 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-48e8132c6d0so30464545e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 07:06:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491f8d4c3sm41175703f8f.34.2026.05.13.07.06.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 07:06:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1778681181; x=1779285981; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wy+UKfr0jpUKnUnHywACAxAHzw2WJmvRPSq5Ydx2cgA=;
        b=LTqa4d4CptUL/o1ZQ1dz+3eY4yOhYFzHJcz4/s/67tlwjEBGYgJl3NVZfCNqeZfAGY
         itPxzMVAQouhngLeDDmV4BQBfS5LGjmKQr6r6WmvJfFmn8pEuIhMTqLEOnzY9PYOw+4E
         JQkwhKlrC5ggKZz8ZPv71ZzV3EY303G+m7dPwrK4dpCPKHEZ4FOWZoRw+9pk9tsAjz3b
         LC/t99+TuU3g7fm3C15VE7DYimBX5f+RIgcJL+kRgyzJLJ4ZiBcPDeaImZQ7lLoI1XUi
         ixRRproB/qgfInNeShzHNSG8WiH7vKmvQzMRYPC9sAwEG+aSWVXZcwApcNiEsQQ8d+/u
         e3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778681181; x=1779285981;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wy+UKfr0jpUKnUnHywACAxAHzw2WJmvRPSq5Ydx2cgA=;
        b=mrYc4voN9bUvwKWSkKEo7SyqfeeCMu1VtBQ+fNJnLKTwnc0Ud5bQQO5+9ZiRIbxUKs
         zGaOUL9OWFmp+0JJAb5jkUH84LrxsftFOg4qCwhv9K3Ve7Q3N/ZiMp3lKgRqMbmch9+l
         IGGUzb7zXkkrp1rGUE3QkNc8RTG6hghZP4bXKZ6Q15cIwqQdJUmnyK+tYmIapRDJZfyd
         zLa5s2bHKYbH8k3/hw5kBCj87O7j6eyuUWwts7USVorvhzpE5vn0OYXZCA1uDXiwsEp9
         y9Erkost9jLfvghmzKFy3OSFHRDZjp4dwpgCygZ+4JrTNPNsr3RmsSYIkPqPupy82WYD
         aM2w==
X-Gm-Message-State: AOJu0YwKTByDRiTxdq6WEEFvZBAp2M42FCLosVWxdry8601pGwG/zajU
	vFn6pcY7kyCUdrfRCYRhdiwkqm4aOw9tvc7M+IZ8uNKYmrUtcIpwbPBnZTfa9XTMVSX61U25qrZ
	k8zY=
X-Gm-Gg: Acq92OG5nWc4mwsQ6/pBBnKCvk67DjlAQlGFo7M56Hsqf5myHtrNWSqqh3OX8uK0orG
	LtKyLZjZ7R/C6jQiaSKw0xX0Hmi/pbCbJ9gsO0idgJBNynfyYNIkeXJ8qglcNZpYk6loRg2hnU9
	KDZ6xNrombL3wggYd5fN9FTjRkG++O0rp+k7cCiYMxIGENKf54FWSsOoVae/H+uhiGgQCbqxV75
	OUfq+13HtwIGdB4YYw4dR8HUWepVfEakr4ath5ZLcRmosesxcFoLZFTLnAC5Ae7r7l2ojJVTkRu
	WZ+ge6lIs2NTu5pu3TKkbJ/81oZbyojx2YS+em0oCwKjZobYQoIwWsKTQzZQv0uG7Ui86K9Bi6D
	SDI4X9vh5vi0hGspjF0Psw0rvmdBdm90ERJ9ek3MCdcceAKSYVhHwB09IF5HbUwb7ha8NhXDN1x
	ny9wxps83hRibQONBt61njQEYquSDVy9IRTbtumw9QpSE9t6UGdY7p1At1R0El/suun8V9yEAJm
	u9eJhHsWNHqkZ0=
X-Received: by 2002:a05:600d:18:b0:48a:5574:3a5d with SMTP id 5b1f17b1804b1-48fce9bd5d1mr35850885e9.7.1778681181303;
        Wed, 13 May 2026 07:06:21 -0700 (PDT)
Message-ID: <d04afa56-1197-4f5c-b158-b4b7eb7fc6b9@suse.com>
Date: Wed, 13 May 2026 16:06:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] x86/PV: address Misra C:2012 rule 16.2
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <e3cdf68f-122a-4a41-a72c-8e6ed857b282@suse.com>
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
In-Reply-To: <e3cdf68f-122a-4a41-a72c-8e6ed857b282@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1778681181-AB36C161-C8707750/0/0
X-purgate-type: clean
X-purgate-size: 3535
X-Rspamd-Queue-Id: B64EB534ADF
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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

... ("A switch label shall only be used when the most closely-enclosing
compound statement is the body of a `switch' statement"). While I don't
really like doing so, use a few "goto" instead. No change in generated
code (somewhat to my surprise).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -897,7 +897,7 @@ static int cf_check read_msr(
     struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
     const struct cpu_policy *cp = currd->arch.cpu_policy;
-    bool vpmu_msr = false, warn = false;
+    bool warn = false;
     uint64_t tmp;
     int ret;
 
@@ -996,21 +996,21 @@ static int cf_check read_msr(
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
         if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
-        {
-            vpmu_msr = true;
-            /* fall through */
+            goto vpmu;
+        goto check_relaxed;
+
     case MSR_AMD_FAM15H_EVNTSEL0 ... MSR_AMD_FAM15H_PERFCTR5:
     case MSR_K7_EVNTSEL0 ... MSR_K7_PERFCTR3:
-            if ( vpmu_msr || (boot_cpu_data.vendor &
-                              (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
-            {
-                if ( vpmu_do_rdmsr(reg, val) )
-                    break;
-                return X86EMUL_OKAY;
-            }
+        if ( boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+        {
+    vpmu:
+            if ( vpmu_do_rdmsr(reg, val) )
+                break;
+            return X86EMUL_OKAY;
         }
         /* fall through */
     default:
+    check_relaxed:
         if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, &tmp) )
         {
             *val = 0;
@@ -1049,7 +1049,6 @@ static int cf_check write_msr(
     const struct domain *currd = curr->domain;
     const struct cpu_policy *cp = currd->arch.cpu_policy;
     uint64_t temp = 0;
-    bool vpmu_msr = false;
     int ret;
 
     if ( (ret = guest_wrmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
@@ -1179,24 +1178,25 @@ static int cf_check write_msr(
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
         if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
-        {
-            vpmu_msr = true;
+            goto vpmu;
+        goto check_relaxed;
+
     case MSR_AMD_FAM15H_EVNTSEL0 ... MSR_AMD_FAM15H_PERFCTR5:
     case MSR_K7_EVNTSEL0 ... MSR_K7_PERFCTR3:
-            if ( vpmu_msr || (boot_cpu_data.vendor &
-                              (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
-            {
-                if ( (vpmu_mode & XENPMU_MODE_ALL) &&
-                     !is_hardware_domain(currd) )
-                    return X86EMUL_OKAY;
-
-                if ( vpmu_do_wrmsr(reg, val) )
-                    break;
+        if ( boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+        {
+    vpmu:
+            if ( (vpmu_mode & XENPMU_MODE_ALL) &&
+                 !is_hardware_domain(currd) )
                 return X86EMUL_OKAY;
-            }
+
+            if ( vpmu_do_wrmsr(reg, val) )
+                break;
+            return X86EMUL_OKAY;
         }
         /* fall through */
     default:
+    check_relaxed:
         if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, &val) )
             return X86EMUL_OKAY;
 


