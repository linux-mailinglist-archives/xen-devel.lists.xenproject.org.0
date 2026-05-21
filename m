Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sILfM7MhD2rPGAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:16:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDD65A81D9
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:16:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315350.1585162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ57q-00012O-LP; Thu, 21 May 2026 15:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315350.1585162; Thu, 21 May 2026 15:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ57q-0000yP-IT; Thu, 21 May 2026 15:15:54 +0000
Received: by outflank-mailman (input) for mailman id 1315350;
 Thu, 21 May 2026 15:15:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQ57o-0000wa-MI
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:15:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ57o-003RkT-2S
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:15:52 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f21a1-5cb7-0a2a0a5109dd-0a2a4506e020-24
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:15:52 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f21a7-7371-0a2a45060019-d155802adcd2-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:15:52 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48909558b3aso64242765e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 08:15:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033d44705sm66282045e9.4.2026.05.21.08.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 08:15:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1779376551; x=1779981351; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e9nzObur1F+0YwQCb6VhkGWkPYh337ms8dSLVHnK8/g=;
        b=BeKLZX7ZXrauQCVGn9sXH84rl2NRsW/wVif+S5VD/UkvBRea52t+b71bF3nATntSAt
         cWUXUW9PjeSoCPklrNLy3jOaWDS1Q02CSmO749kLUtBYffEs4syz93W75qmhPZpw4Pw7
         BMChFHVP3BYMPytDIx9ZoTk6rSU1uNJwyFlh2gmpfbWbkA41G7eY1aYDClihU1e5UB5V
         KTk0EAWnRmrwJK4yS2xAqIK1Bg6/3UctMPNIgUk4ENmZQsjalAWCNX1fztbrYcANmfdK
         cwoIQmh6irfeqsYrkrhz6KEnGWSva+jNK/3kpjz3bZL1uOvpN7cCuB0liGTlip62Qxhf
         wyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779376551; x=1779981351;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9nzObur1F+0YwQCb6VhkGWkPYh337ms8dSLVHnK8/g=;
        b=ic56ntJm9QTMA5hzyWiMJThjskw1zyppxaEuDQha+wQ71lYdBYEwuNWnVQIzMuTlZa
         mQ5dSZAEBm5DQpr1omT3tZt95qcfUVh9H9bnUCxlrO7z8b1gddrIdmOBEPgmbHyl4aXA
         80QGDsyDjoxSxOXSdrVzkcvEsJPjR/CPMGOFxTgFHlLDQbPoa++nXKDyqq8tw5ZNrvcb
         nDwxX3pcCR1m1D0b9CmrB0M+BFSB4TEZbui3PhhR5cYaX5GQKZzXVG6TbfbE+IkCAEmN
         aRzaQv8kgWpTLLvSDdmqMfNkyywcnBxsvCqfFC8pnJdzWBT54ILDKAJTHtnAp2Pxyr9n
         aw7Q==
X-Gm-Message-State: AOJu0Yx44pZToT/OQZbvwgAzV1cMogN/8Vk2k6aOycNmu/ddfydx1EL8
	M4QnOqSL1nu4bGzDX1anuq3AvzH3UcDFC1lryZlb4nYI06kyUThjU+Ni2qGajdVybKSshjw4xVz
	I79U=
X-Gm-Gg: Acq92OHDJZQ//GjLbUB0e6pqrtA+yy8SQUY0ksVncnfey8xFwSKZCG1AqFgQ9l04gPI
	wn8Wj8KVtM7YWgxZ9s7cd/UkwliNqmB3prBbQ8mQ9S+cvKNjLOlnWpNCHNebTIrDoTIavR7jcaY
	GZsO19a3rBGxc9Cf3tTQ6CH02/g9//cFzsRofl9gX4PCl4jv4SNgpJusjrz3nJCJwphW90/9A6v
	KQ1GRonVtdb035OBHSEAxxXVkJVioBY6r2SZpFy1WIC+MoK3Qx/hw4GpotSWTK67Vrl7SA4OBZy
	/nrAxvBOyD91Q36zna093kecAAM8uN27u5MzX/N4TjBNhw+5Af+wCa9UXiZwtyW3W3gftpgE+0k
	g517nn5RXqguiTEADDB2DAryDmWxY6+J8Dwd5WZzxp1jncw+pYpiURxQVMMmzeVXi+0BHSzEkoU
	3PCd/IJndWZLjA87NJuH8lUj9/7nfhldk13Bw5HqnjzWfF8ui9AP+pN+FPeK/OkM8kTEUyRxATL
	5M7kNnxRXvyYuJQ3cvqQqaHAA==
X-Received: by 2002:a05:600c:81c9:b0:490:3cec:52f5 with SMTP id 5b1f17b1804b1-4903cec55f5mr29327415e9.2.1779376551501;
        Thu, 21 May 2026 08:15:51 -0700 (PDT)
Message-ID: <3e70e912-cb57-42ba-88a9-45e9e3ebab49@suse.com>
Date: Thu, 21 May 2026 17:15:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/4] x86/shadow: avoid sizeof(this_cpu(...))
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <738daea9-ebec-4299-b0f9-49448293106d@suse.com>
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
In-Reply-To: <738daea9-ebec-4299-b0f9-49448293106d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1779376552-7F77FD75-61876E58/0/0
X-purgate-type: clean
X-purgate-size: 1607
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Queue-Id: 4EDD65A81D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Misra C:2012 rule 13.6 takes issue with RELOC_HIDE() uses inside sizeof(),
as used by this_cpu(). Latch the address of the per-CPU variable into a
local variable, and use that in the two sizeof().

No difference in generated code for 2- and 4-level code. There's a small
improvement for the 3-level case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2057,22 +2057,24 @@ static DEFINE_PER_CPU(guest_l1e_t, trace
 static void cf_check trace_emulate_write_val(
     const void *ptr, unsigned long vaddr, const void *src, unsigned int bytes)
 {
-    if ( bytes > sizeof(this_cpu(trace_emulate_write_val)) )
-        bytes = sizeof(this_cpu(trace_emulate_write_val));
+    guest_l1e_t *pval = &this_cpu(trace_emulate_write_val);
+
+    if ( bytes > sizeof(*pval) )
+        bytes = sizeof(*pval);
 
 #if GUEST_PAGING_LEVELS == 3
     if ( vaddr == this_cpu(trace_emulate_initial_va) )
-        memcpy(&this_cpu(trace_emulate_write_val), src, bytes);
+        memcpy(pval, src, bytes);
     else if ( (vaddr & ~(GUEST_PTE_SIZE - 1)) ==
               this_cpu(trace_emulate_initial_va) )
     {
         TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_EMULATE_FULL_PT);
-        memcpy(&this_cpu(trace_emulate_write_val),
+        memcpy(pval,
                (typeof(ptr))((unsigned long)ptr & ~(GUEST_PTE_SIZE - 1)),
                GUEST_PTE_SIZE);
     }
 #else
-    memcpy(&this_cpu(trace_emulate_write_val), src, bytes);
+    memcpy(pval, src, bytes);
 #endif
 }
 #endif /* CONFIG_TRACEBUFFER */


