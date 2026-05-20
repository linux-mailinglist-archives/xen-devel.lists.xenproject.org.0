Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPfQLyXJDWo33QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 16:45:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CBA58FF60
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 16:45:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314042.1584066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPiB9-0003hF-T7; Wed, 20 May 2026 14:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314042.1584066; Wed, 20 May 2026 14:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPiB9-0003fY-QC; Wed, 20 May 2026 14:45:47 +0000
Received: by outflank-mailman (input) for mailman id 1314042;
 Wed, 20 May 2026 14:45:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPiB7-0003cN-W1
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 14:45:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPiB7-00GaD1-Bu
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 16:45:45 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0dc919-bab6-0a2a0a5309dd-0a2a4508d5b0-0
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 16:45:45 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0dc919-63b5-0a2a45080019-d1558034e079-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 16:45:45 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so72536565e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 07:45:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4dac000sm411296365e9.0.2026.05.20.07.45.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 07:45:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1779288345; x=1779893145; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yi1J6oBQQCDF544YYXBhrqWzrznLLlVPi+0upj+pGUE=;
        b=cCy/m2yxiaZNn0KcgZOPTURz8LAVxhP091VhHykY7rdNib82B5PFJgAv0brO2MJnfa
         mAga18IcYErM8hb+VVk5qDgWiE5vZhIgJ63LHngchNBj1tdUGvyU9jqyAg7kv6bHYUnL
         WeuA+TWyxU/PMbCxydliJFVjFATwLoXJbDM1F9PgTkxdsLpq5Jlay2cgYJa2fKQBa/7L
         YaWBO2XBHCUsj1u6v5QgOP6UhleDKzbv7c8o840wTFNsPJHG9yutE+AfSo3u48tjBTT6
         Oa/Cg+O/p/21HtCQKVvaoFOje+HDxJfGs9FIDX3mBWbL4GpbiVw9LBhQvb9a4dZdMwyf
         WyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288345; x=1779893145;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yi1J6oBQQCDF544YYXBhrqWzrznLLlVPi+0upj+pGUE=;
        b=Acl6S7TWU33Gb58DlvbB4iTbBoMfRMNeWJxutCXwn6B76u+7TyUch+4r6Ut0FB+L3r
         YdBIGzX7S8RlxVnwjYnDKUN+Uwmyd22wTp42nlrrmE1zIynuPAcKjpMDvVNfEsfB0bPA
         1kl1dZ5QE6DQdEr66kviiLAfobcLiIUSoivFZkNSoexOaWho/Y2AjidprbZ0VrnX0dmK
         S3kOuFJqEK5kxwaLIPA6rj92hJqcs+lUIlJZUcsqU1mc5Sl9mdXXbfAbBWkzak1mEzbj
         4roSl8h5z0u/JIObl/bux0qgdV+MQm7YmzIY8Vgfql3gp/VdjBQ2gThOzOzpk/pruwod
         hSKw==
X-Gm-Message-State: AOJu0YxCLOtzzmlHOmSsbgQqn0IOv8GxjCyz5R2zD/PDlY+LHn1qkHMH
	0z54VfZF4mVi6ql5jrrHyR3IzndKyLw67Zv65177bS5T9+WqKLvKhDBNWXfAK25qPdXEeTjXTl6
	Hq/o=
X-Gm-Gg: Acq92OEmIzENuuBVZ6KlUBNy3D1TW0f6xsrztUa9Vj3CSg5MCObyXSzQMD3uVfcgldu
	M1wO0H8iuG7hIrnFdoLHvB5uaWVseyKys3JgrDNojlQnmCDAZjrXmGZcQViZj5cSB/+m/TLsxIR
	2JcAyB5oauWWeRK16eSnWHoGdnkZpxG7yPvufzhLP+PbpcyRCHevYmzWEvuLusx5eNUeqoUIqWl
	FPZelF49UF2sc9WaoMog+afProLh0vn/eJBb6KfvL9vZn8e6Ik1af3hxkXOHAcfmheRfvsPq6eK
	UQqRxPEp8usY0aP/wIDM8+RckEFiHSFGErf7UQXX3XctR44A7VJCKuNWZihxr4fM23OcX7qOIN+
	drTkOuj8j36+DlDPh5rT1h+jfRr6f46uVX9Uk/xCBBGaXzcXNe1BUqulIHgew0oGlqKyPvdLVpH
	Vbxnpz3zC/SELcigpnedT+TuWp74sFrE7I2zzl0PW39MYrmtTbLrF9gJElDWDoRhoYl/RhfNNJO
	bw7zwHGiwaZESc=
X-Received: by 2002:a05:600d:10:b0:48f:e230:2a21 with SMTP id 5b1f17b1804b1-48fe662fd6bmr309525975e9.32.1779288344783;
        Wed, 20 May 2026 07:45:44 -0700 (PDT)
Message-ID: <401037ba-97d3-4d16-926d-ecbb99947004@suse.com>
Date: Wed, 20 May 2026 16:45:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH RFC v3 1/3] x86/Intel: split model-specific freq calculation
 off of intel_log_freq()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <a3e034a4-621a-45ad-9b96-9a85cbe5eafd@suse.com>
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
In-Reply-To: <a3e034a4-621a-45ad-9b96-9a85cbe5eafd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1779288345-B6577DB1-981F97E3/0/0
X-purgate-type: clean
X-purgate-size: 4526
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Queue-Id: 48CBA58FF60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

..., for that logic to become reusable. While doing so undo the open-
coding of DIV_ROUND_UP(). Also switch to the new struct cpuinfo_x86 field
names.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
If Misra didn't dislike non-static functions without external callers, the
new function could be put below the old one, thus reducing churn and
improving readability of the diff (really I moved the code for the new
function up, but the diff representation is the other way around).
---
v3: New.

--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -476,51 +476,14 @@ static int num_cpu_cores(struct cpuinfo_
 		return 1;
 }
 
-static void intel_log_freq(const struct cpuinfo_x86 *c)
+static void intel_process_freq(const struct cpuinfo_x86 *c,
+                               unsigned int *min_mhz, unsigned int *max_mhz)
 {
-    unsigned int eax, ebx, ecx, edx, factor;
     uint64_t msrval;
     uint8_t max_ratio, min_ratio;
+    unsigned int factor;
 
-    if ( c->cpuid_level >= 0x15 )
-    {
-        cpuid(0x15, &eax, &ebx, &ecx, &edx);
-        if ( ecx && ebx && eax )
-        {
-            unsigned long long val = ecx;
-
-            val *= ebx;
-            printk("CPU%u: TSC: %u Hz * %u / %u = %Lu Hz\n",
-                   smp_processor_id(), ecx, ebx, eax, val / eax);
-        }
-        else if ( ecx | eax | ebx )
-        {
-            printk("CPU%u: TSC:", smp_processor_id());
-            if ( ecx )
-                printk(" core: %u Hz", ecx);
-            if ( ebx && eax )
-                printk(" ratio: %u / %u", ebx, eax);
-            printk("\n");
-        }
-    }
-
-    if ( c->cpuid_level >= 0x16 )
-    {
-        cpuid(0x16, &eax, &ebx, &ecx, &edx);
-        if ( ecx | eax | ebx )
-        {
-            printk("CPU%u:", smp_processor_id());
-            if ( ecx )
-                printk(" bus: %u MHz", ecx);
-            if ( eax )
-                printk(" base: %u MHz", eax);
-            if ( ebx )
-                printk(" max: %u MHz", ebx);
-            printk("\n");
-        }
-    }
-
-    switch ( c->x86 )
+    switch ( c->family )
     {
         static const unsigned short core_factors[] =
             { 26667, 13333, 20000, 16667, 33333, 10000, 40000 };
@@ -533,7 +496,7 @@ static void intel_log_freq(const struct
         if ( !max_ratio )
             return;
 
-        switch ( c->x86_model )
+        switch ( c->model )
         {
         case 0x0e: /* Core */
         case 0x0f: case 0x16: case 0x17: case 0x1d: /* Core2 */
@@ -578,10 +541,61 @@ static void intel_log_freq(const struct
         return;
     }
 
+    if ( min_mhz )
+        *min_mhz = DIV_ROUND_UP(factor * min_ratio, 100);
+    *max_mhz = DIV_ROUND_UP(factor * max_ratio, 100);
+}
+
+static void intel_log_freq(const struct cpuinfo_x86 *c)
+{
+    unsigned int eax, ebx, ecx, edx, min_mhz = 0, max_mhz = 0;
+
+    if ( c->cpuid_level >= 0x15 )
+    {
+        cpuid(0x15, &eax, &ebx, &ecx, &edx);
+        if ( ecx && ebx && eax )
+        {
+            unsigned long long val = ecx;
+
+            val *= ebx;
+            printk("CPU%u: TSC: %u Hz * %u / %u = %Lu Hz\n",
+                   smp_processor_id(), ecx, ebx, eax, val / eax);
+        }
+        else if ( ecx | eax | ebx )
+        {
+            printk("CPU%u: TSC:", smp_processor_id());
+            if ( ecx )
+                printk(" core: %u Hz", ecx);
+            if ( ebx && eax )
+                printk(" ratio: %u / %u", ebx, eax);
+            printk("\n");
+        }
+    }
+
+    if ( c->cpuid_level >= 0x16 )
+    {
+        cpuid(0x16, &eax, &ebx, &ecx, &edx);
+        if ( ecx | eax | ebx )
+        {
+            printk("CPU%u:", smp_processor_id());
+            if ( ecx )
+                printk(" bus: %u MHz", ecx);
+            if ( eax )
+                printk(" base: %u MHz", eax);
+            if ( ebx )
+                printk(" max: %u MHz", ebx);
+            printk("\n");
+        }
+    }
+
+    intel_process_freq(c, &min_mhz, &max_mhz);
+    if ( !max_mhz )
+        return;
+
     printk("CPU%u: ", smp_processor_id());
-    if ( min_ratio )
-        printk("%u ... ", (factor * min_ratio + 50) / 100);
-    printk("%u MHz\n", (factor * max_ratio + 50) / 100);
+    if ( min_mhz )
+        printk("%u ... ", min_mhz);
+    printk("%u MHz\n", max_mhz);
 }
 
 static void init_intel_perf(struct cpuinfo_x86 *c)


