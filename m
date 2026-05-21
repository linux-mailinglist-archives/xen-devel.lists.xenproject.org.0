Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BqlHx/6DmoSDwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 14:27:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E80075A4C58
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 14:27:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315139.1585000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ2UM-0004sz-K2; Thu, 21 May 2026 12:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315139.1585000; Thu, 21 May 2026 12:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ2UM-0004qX-H7; Thu, 21 May 2026 12:26:58 +0000
Received: by outflank-mailman (input) for mailman id 1315139;
 Thu, 21 May 2026 12:26:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQ2UK-0004qK-SS
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 12:26:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ2UK-00AbLQ-0u
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 14:26:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0efa0e-2eae-0a2a0a5409dd-0a2a4506a0a8-6
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 14:26:55 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0efa0f-7371-0a2a45060019-d1558032e013-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 14:26:55 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so85653735e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 05:26:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49035c6766fsm28801355e9.2.2026.05.21.05.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 05:26:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1779366415; x=1779971215; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pMQC9WfYWkVK3lty7thI05rOPXTziYFSPJAYYHL7gY0=;
        b=C92PtEJXm6asL243rrXxXkjbuG4ARhdaZonIyWDyqno+kpl20j2KN5TJn4JunMJ+ej
         ZCv2Yzwnq8WQEARMpYtPqNS6pehfiHqTnvtZ0bP6JX+oL3XDDSxq8rVQoGQgDOFBHaSS
         Vj1SA7P/G9zdg8INp1GWjhGJejeFDDa+WylQ2x/0RUru1TR5xuRuMdk+6JfWu3ZQlTBA
         jG2smmXiNjWaIBybuPmWjpl83xRv5lMdReBVP7Sm/GyapbpXnGNIRHoEKxYOV110TJ2z
         4sWwCSvL2R3H8iQniieU0aY5dwN3TCWdXnVyBnaVpr3f14fFcmmlqJIDq+lCsm7Z0q8r
         3HJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779366415; x=1779971215;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMQC9WfYWkVK3lty7thI05rOPXTziYFSPJAYYHL7gY0=;
        b=YBVPw9jnCi7DfDMA0VnUU3OZZlfxrycquBDwdw0RQrPm9ypEa0lqTxaygLWhAZJql5
         i4kX6bQOG6NTodofhwBD0oEsWZ1UuYWn0DH0KkcN56zTSeLCTsENVZ9FZ2dqjDGL6HMr
         AB2pB55lItqnLHn7PI/z9k11wPzIHtn2k4hNt1tJy8sC2RZS8jyrpyT6nHNcEH0ptwWI
         hzeTltdlxU5eD/1vxsDOGTzmyoN5WUrfvZRz93fOru36cbrV1vfgb20HrSsY0ma3iCUg
         djc0u48U9nI5mbJqCZoyCMEYxdSBvyHig/gIZB6vyR7bDiy6xotCBQpQkJ7I6A3F8Wjr
         F/aw==
X-Gm-Message-State: AOJu0YyLyEkogJLxsvJecN1Ko4uxXdDOooTRSZiD+lvwYt5R7p3KxA4Y
	VAY/lGJN9XZ2RgO1CHqi6MIMyrHpods9eDe43jhDtihBVOI45zh87dWUHVtP2CTUx/0Gsz8z5o7
	ruQM=
X-Gm-Gg: Acq92OEfOTPzP82pAslgovJXawbao7ryZkTQ+raOGEa/KrxzhWicUAS3UFHNKHQJppS
	JYJEMgz1IIgzBlsGmMhhzt3GUtm8tVtedORxGlcRL0qcQ9gx84lIq4mGQaejzj/YuXTXwq1bQbh
	zSrr+o8O+f6gAAacvd5cFIq6uX6cD6o2YK/zOkdbru5Xn0VkD16J+HTr7DE7867ohX/gtTr7Iv9
	hdQxflFDH1YX9QSQluPQtqi7rR0RNSuGicb4EqraWp+6NRDX37UjJs2rV5kQGIGDgOTcIMEVWqG
	mHqN4h/wWf7uKacziyq0Vvcowfeb4CV/a1JN/tKD0C84FlQL/TMaBQ8Jan4ldlw/5qSVS0ssRNQ
	tH54dUPReJg7IWC9th/diLoedi9mOGWb4fQeaMkRJdMxRk6jd+7DiWIj6wrkT9ed19KcMRN1F3y
	4lI7U/+FITUOJlzv9BnVrBqKlcGmjIIhUe3+rGMoMyBLHEWeKsE2HZGHERhoVg0FT08KH924mDn
	37Y1GE2KJUpuzmrhMR4F+J8GQ==
X-Received: by 2002:a05:600c:a15:b0:490:3cef:bd90 with SMTP id 5b1f17b1804b1-4903cefbe6emr20882785e9.26.1779366415434;
        Thu, 21 May 2026 05:26:55 -0700 (PDT)
Message-ID: <09e58463-4eda-46da-83e0-bc66c84afb25@suse.com>
Date: Thu, 21 May 2026 14:26:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] x86/time: address Misra C:2012 rule 8.3
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <2ad2b572-45b4-42a5-9b7a-80eebfacc80e@suse.com>
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
In-Reply-To: <2ad2b572-45b4-42a5-9b7a-80eebfacc80e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1779366415-7FB7DD75-9373102C/0/0
X-purgate-type: clean
X-purgate-size: 1860
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E80075A4C58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Before we can enable scanning of time.c, it needs to be clean wrt blocking
rules. Bring boot_tsc_stamp's definition in line with its declaration. For
get_s_time_fixed() go a little farther and move it to the x86 header (the
function only exists in x86) and do, along with correcting the parameter
name, the u64 -> uint64_t a little more widely than strictly necessary.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/time.h
+++ b/xen/arch/x86/include/asm/time.h
@@ -13,6 +13,8 @@ static inline cycles_t get_cycles(void)
     return rdtsc_ordered();
 }
 
+s_time_t get_s_time_fixed(uint64_t at_tsc);
+
 unsigned long
 mktime (unsigned int year, unsigned int mon,
         unsigned int day, unsigned int hour,
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -95,7 +95,7 @@ static u32 pit_stamp32;
 static bool __read_mostly using_pit;
 
 /* Boot timestamp, filled in head.S */
-u64 __initdata boot_tsc_stamp;
+uint64_t __initdata boot_tsc_stamp;
 
 /* Per-socket TSC_ADJUST values, for secondary cores/threads to sync to. */
 static uint64_t *__read_mostly tsc_adjust;
@@ -1656,10 +1656,10 @@ static unsigned long get_wallclock_time(
  * System Time
  ***************************************************************************/
 
-s_time_t get_s_time_fixed(u64 at_tsc)
+s_time_t get_s_time_fixed(uint64_t at_tsc)
 {
     const struct cpu_time *t = &this_cpu(cpu_time);
-    u64 tsc, delta;
+    uint64_t tsc, delta;
 
     if ( at_tsc )
         tsc = at_tsc;
--- a/xen/include/xen/time.h
+++ b/xen/include/xen/time.h
@@ -33,7 +33,6 @@ struct vcpu;
 typedef int64_t s_time_t;
 #define PRI_stime PRId64
 
-s_time_t get_s_time_fixed(u64 at_tick);
 s_time_t get_s_time(void);
 unsigned long get_localtime(struct domain *d);
 uint64_t get_localtime_us(struct domain *d);


