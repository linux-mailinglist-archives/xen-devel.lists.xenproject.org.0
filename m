Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMmJIIEL+2mbVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:36:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3B94D8B29
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:36:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301424.1575709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYfV-0007Mf-9y; Wed, 06 May 2026 09:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301424.1575709; Wed, 06 May 2026 09:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYfV-0007Jh-6S; Wed, 06 May 2026 09:35:49 +0000
Received: by outflank-mailman (input) for mailman id 1301424;
 Wed, 06 May 2026 09:35:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKYfU-0007JZ-1A
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:35:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKYfT-008DZC-Cn
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:35:47 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb0b64-2eae-0a2a0a5409dd-0a2a450badd6-38
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:35:47 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb0b73-212f-0a2a450b0019-d155dd29c5a2-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:35:47 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-445795cf6f1so3825595f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 02:35:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45055e2d3d0sm10670559f8f.34.2026.05.06.02.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 02:35:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1778060147; x=1778664947; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L71mztXwVFtsnyfyfV2aEurTsxFn8kQ6HteBxm3JtcE=;
        b=UkbaDlSiU2eLaKfY4RHVUxF2iDSUTMq0fskqFCBcZHgaamthOKQLHQBoXPhtuuaE6p
         z2i3rMgBrlY1zVxySDy/PbWtNuvuh2qQUqvkCTjqP9dPa3a+uiKaEO+P2UMzLvoEYeFZ
         GrOV9FN9RMNFnGiCoF/VcV4cGPHlvYsbMG9eVkmWVYUS4VzOtjoGeo+f3aJ/K6h9Koeg
         z3Z3DNtj2OYefiadno1z1vh1p2oSXgK7+rTqbA8BkqAQWN2D43IHU4MXQUxGeHNndIpZ
         en+0endntig4xiUtX976gvUjcqmPx0Yq3E9kcYsoEQPF71cXEeNqMp5gLLfUWjwHdbQ8
         trFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778060147; x=1778664947;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L71mztXwVFtsnyfyfV2aEurTsxFn8kQ6HteBxm3JtcE=;
        b=S2S+PEkeuRnkeDjI0ToEDDDO918plDMckRRfPsmu1DMg7c/UzdnNDkLJJ2bRLOvuZS
         CuQF6HJsbxzi0vT/BXbyzWMxwaPT//SLLSF2jmMH0YY0HmngKk4KIQ4Y/BLcFtrF78CJ
         9J5FSWbCyH7PxU32Q622CI7CNPx8gXvdVToO9bSxwyE5aqFTgIHaswNDcuiclD0TbQ74
         uvAJdV5GLAZSQBSMFCMrMWVjAZjYyBWnW0T19Wx6nf1/X9Jg4ohdN48Tdon+N3VM5VUp
         sHJTIjOw7OJPiARJug3fcBnBMIs9tN+/7Z+wuM/r/XZZxMcvjsBqCvp1q+Y6nqTuBk1I
         ITmg==
X-Gm-Message-State: AOJu0YxSFA7tVN5W/8G92LcWZELzfmy6e0fz5qDv2pd7b+yvoTFkmO3a
	Ng58YXH7N2/OJF9u2gcGiM3aW7dSEOVCBZT+TGfugpJ2h6hem7F524FHDVncTfcxrwIl3zH3oIM
	4iOg=
X-Gm-Gg: AeBDiesk3ESBTRxXDPjfTzko7thyPnGg4MasfOEAlNvhzBEQEp0sAYiAcFF/NxFh8lC
	xi49qrtvyUI7UBuaLth8ed9ivQXrEuNGp6C0VGJ0Q9E6yVkuYyjnMUB1dZgcy8qkUT6YW6xu2vs
	Q4eOm54MnoVQzdThLDn0omS0hGyB6ybz2oiC05oFuUzVJjKMe4j6hjVIKpYtiLnUQTLYMqAgEtr
	9d8i9TsiC8ppVLsos7LymF3Ogijq6QA6+9QuZs7UYVr6lgQC1ws4h0OmDSKQB52yNqJA4p8EUjk
	kvEX15Gd/fHcoJgn66jXXn0s7bZvBgKspLfCQBWBDvwSHnTBLzQ0uDN8R4t1Ha6o3vnmqi37FkP
	twSj2BgKk2jGXWctBPfxb0r7Z1lXb44wyMDICl/XXfbfUqx6Upfz6+s0DIUenXHO7wUkKd/8nSG
	ilwuZtaA38rS0maKJR6q+xQYx3c63ga5ZYq0b5uFYo/idJKmlKLYeurAFteXp7wnl4vJYun108Y
	+gZiSpojU66MkkrbGWyjTQ0pw==
X-Received: by 2002:adf:e014:0:20b0:452:273:5cd6 with SMTP id ffacd0b85a97d-45202735d7emr1339868f8f.1.1778060146709;
        Wed, 06 May 2026 02:35:46 -0700 (PDT)
Message-ID: <99a4a514-3ed5-43f7-823c-54771f3bd03d@suse.com>
Date: Wed, 6 May 2026 11:35:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/time: make do_settime() uses more accurate
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
X-purgate-ID: tlsNG-42698a/1778060147-19F6EF3B-ACEBE957/0/0
X-purgate-type: clean
X-purgate-size: 2801
X-Rspamd-Queue-Id: DC3B94D8B29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

As a comment next to one of the invocations states, get_wallclock_time()
can take over a second. The order of evaluation of function arguments is
in principle unspecified; in practice at least gcc looks to be evaluating
them from last to first. Hence with NOW() invoked first, the respective
value passed to do_settime() can be off by over a second (which is in
contrast to __get_cmos_time() attempting to get the time exactly after an
update, i.e. [pretty] precisely at a seconds boundary).

This also addresses a Misra C:2012 rule 13.2 ("The value of an expression
and its persistent side-effects shall be the same under all permitted
evaluation orders") violation each.

Fixes: f64134cdb81c ("x86: Fix time_resume() to notify all domains of wallclock change")
Fixes: 0bfcf984b727 ("x86: Reintroduce clocksource=tsc")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course the time it takes to do all the CMOS reads (or whichever else
wallclock time source is in use) also results in an inaccuracy. For
__get_cmos_time() this might be solvable by having it latch NOW() before
doing the 6 reads, but in particular for efi_get_time() there's hardly
anything we can do.

As to Misra rule 13.2: tagging.ecl lists the rule as clean. I also can't
find any deviation for the two instances fixed here. What am I missing?

For __get_cmos_time(), tangentially: Wouldn't we better use the
century byte if available? As it stands, things will break in 2070. Which
is a long way out, yes, but still. (Of course this would mean a 7th slow
I/O port write/read pair.)

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2575,6 +2575,8 @@ __initcall(verify_tsc_reliability);
 /* Late init function (after interrupts are enabled). */
 int __init init_xen_time(void)
 {
+    unsigned long wc;
+
     tsc_check_writability();
 
     open_softirq(TIME_CALIBRATE_SOFTIRQ, local_time_calibration);
@@ -2592,7 +2594,8 @@ int __init init_xen_time(void)
     printk(XENLOG_INFO "Wallclock source: %s\n", wallclock_type_to_string());
 
     /* NB. get_wallclock_time() can take over one second to execute. */
-    do_settime(get_wallclock_time(), 0, NOW());
+    wc = get_wallclock_time();
+    do_settime(wc, 0,  NOW());
 
     /* Finish platform timer initialization. */
     try_platform_timer_tail();
@@ -2745,6 +2748,8 @@ int time_suspend(void)
 
 int time_resume(void)
 {
+    unsigned long wc;
+
     preinit_pit();
 
     resume_platform_timer();
@@ -2756,7 +2761,8 @@ int time_resume(void)
 
     set_timer(&calibration_timer, NOW() + EPOCH);
 
-    do_settime(get_wallclock_time() + cmos_utc_offset, 0, NOW());
+    wc = get_wallclock_time();
+    do_settime(wc + cmos_utc_offset, 0, NOW());
 
     update_vcpu_system_time(current);
 

