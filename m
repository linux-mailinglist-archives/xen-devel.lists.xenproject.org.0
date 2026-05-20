Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJ5NNBbJDWr93AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 16:45:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1B658FF4B
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 16:45:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314040.1584056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPiAs-0003MI-MJ; Wed, 20 May 2026 14:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314040.1584056; Wed, 20 May 2026 14:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPiAs-0003K4-JU; Wed, 20 May 2026 14:45:30 +0000
Received: by outflank-mailman (input) for mailman id 1314040;
 Wed, 20 May 2026 14:45:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPiAr-0003Ju-7D
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 14:45:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPiAq-00DOsN-Je
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 16:45:28 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0dc907-2eae-0a2a0a5409dd-0a2a450bd9b8-10
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 16:45:28 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0dc906-212f-0a2a450b0019-d1558035c84c-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 16:45:26 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso43654415e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 07:45:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45e6a135f0csm35919031f8f.27.2026.05.20.07.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 07:45:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1779288326; x=1779893126; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dHoS210MxadB7J4xOPvWHIDlEyec0VM05s2uEJ0dyVw=;
        b=Pvk57zP8fFiBvShKpIeEr3aoe+BZ3XqX2heBLNpXopYS4NM5NOoNqMlFhRHZD22+Zv
         KHGZBVq5sXl/gDg9RSgd5/GQ3ioTltdquEZt6BRmyayjlV6+3zyC0WIpmSPKEgppfaOu
         OAdTRqPLngHs+WQWheMVd1aSxCh1yfIRcjo7yCZgOWGaShPXoeApVQeHHXVHi7dyLXdP
         stq67/rwsjUOORXG72TPMXqloIR9tkb9f1Eo3f7bT5VPXqL6LgpLl+nK6EWyVOD/koPT
         wvvNECQT+zbzO3+8hULcMhvzACzeJBsFVC+kainFKDQbNcG2qQkHbwc3R5kvHah9t9Is
         xw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288326; x=1779893126;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHoS210MxadB7J4xOPvWHIDlEyec0VM05s2uEJ0dyVw=;
        b=estBXF3mG8AfHWj5aR9zUfVbCB1YYDS76Ne5piJPkxkpWbqCI3W/WOpTVoe5R3K3PN
         MciJJIt6ZPLBgz8eQLAEh9bPOpTbnbGVtMhi0HMhmDxAGA51JEjJhG/DtRO1CenF4ZeJ
         waVZ1GhmKNSG1Z8TRO6dPjxPuDjPyX2WsvyKMfdg/VfGJOA4/fpiL5vYr26CwgpAW1LW
         Ggo+SnMb/D1Avfjc4llwQRiXqu2+pp5fLjw9NNxdbLBCxtUU40khFAMLrgLqcZbGEqG2
         veRXCGLh/MtfOUcbPPbeZEJBBs2msGiaEAN3phmbUgTHwAEpcU3kfhlq266sMtuhXzur
         66ZQ==
X-Gm-Message-State: AOJu0Ywde/J17V9v0X0omc2Opb5NghryrTOaje0fb5KtCPLD6OzjAq0B
	T+PGvXrGwOygwd8tUlimtsvRCVAOeeQysTrX669zoewTJ7FhGQhDTFwfaryTR0D5ufuLPtEDcTu
	EWFA=
X-Gm-Gg: Acq92OH2jgTqTPswMmLKqtkC9/LVQSjJeHjItdCtFjLIayGGZvjFzpITt/IdxfFcnk1
	cshEpc7bEfiNgvdrJ+l6qP03eqKfpJCwtA7Rb//BIxe/RofcOgkIT273UUFQ2YNbw0aRbf+QaF1
	WXwYSr2A89CEdLyV9yYCS/GRCABTQOFdCu/CPJIFkQGQ2XKGbnqmMoLKXPZ9Ng/XmOyiJefAKcO
	pnxcsaUE81oYWcwMt7ct0hVb9O/BrnyWcDxmXpn9SNNhxoOjCEjeC8DMTG3VTzcn9XOSGqis4l5
	OzG/8LnCCN78zIk47XgqjS6aHA3PsUtl8bwCfHKDKJugxsQDWXhs5HhVtwf5WlpVwaTbiMLgfZD
	f+MpOYmqGWP+8yL6o2DHTiUaLNwEfD41gaIbhNE10IFtb3qfeyZbvXEdxPFn3qXjJI0X3BGvxGi
	gZC9l0TRyFXFiYA5x8IVuXBGgLpyJW0I6uhv0rBtPb9pfYltlcQ5f5vQ2FXRDvBdxTpBddB4f5F
	OqqNb5NqciYM8CWcndnN2PSCA==
X-Received: by 2002:a05:600c:c096:b0:48f:d1b8:9aaa with SMTP id 5b1f17b1804b1-48fe60e525bmr279995405e9.6.1779288325690;
        Wed, 20 May 2026 07:45:25 -0700 (PDT)
Message-ID: <38b28709-eddc-4dc7-9e8e-92db67d20ea7@suse.com>
Date: Wed, 20 May 2026 16:45:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH RFC v3 1/3] time: add "NOW() good" indicator
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
X-purgate-ID: tlsNG-42698a/1779288326-21F84F3B-A81C7090/0/0
X-purgate-type: clean
X-purgate-size: 2742
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,arm.com,epam.com,wdc.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2E1B658FF4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

printk_start_of_line() checks for a value of 0 right now. In order to be
able to have NOW() return at least monotonically increasing values, that
needs replacing by an explicit indicator.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Arm and RISC-V may want to consider whether their initial get_cycles()
can't be moved yet earlier, such that the indicator also can be set
yet earlier.
---
v3: New.

--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -145,6 +145,7 @@ void __init preinit_xen_time(void)
         panic("Timer: Cannot initialize platform timer\n");
 
     boot_count = get_cycles();
+    NOW_good = true;
 }
 
 static void __init init_dt_xen_time(void)
--- a/xen/arch/riscv/time.c
+++ b/xen/arch/riscv/time.c
@@ -87,6 +87,7 @@ void __init preinit_xen_time(void)
         panic("%s: ACPI isn't supported\n", __func__);
 
     boot_clock_cycles = get_cycles();
+    NOW_good = true;
 
     /* set_xen_timer must have been set by sbi_init() already */
     ASSERT(set_xen_timer);
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2657,6 +2657,7 @@ void __init early_time_init(void)
 
     set_time_scale(&t->tsc_scale, tmp);
     t->stamp.local_tsc = boot_tsc_stamp;
+    NOW_good = true;
 
     init_percpu_time();
 
--- a/xen/common/time.c
+++ b/xen/common/time.c
@@ -22,6 +22,8 @@
 #include <asm/div64.h>
 #include <asm/domain.h>
 
+bool __ro_after_init NOW_good;
+
 /* Nonzero if YEAR is a leap year (every 4 years,
    except every 100th isn't, and every 400th is).  */
 #define __isleap(year) \
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -975,11 +975,10 @@ static void printk_start_of_line(const c
         }
         /* fall through */
     case TSM_BOOT:
-        sec = NOW();
-        nsec = do_div(sec, 1000000000);
-
-        if ( sec | nsec )
+        if ( NOW_good )
         {
+            sec = NOW();
+            nsec = do_div(sec, 1000000000);
             snprintf(tstr, sizeof(tstr), "[%5"PRIu64".%06"PRIu64"] ",
                      sec, nsec / 1000);
             break;
--- a/xen/include/xen/time.h
+++ b/xen/include/xen/time.h
@@ -63,6 +63,12 @@ struct tm wallclock_time(uint64_t *ns);
 /* Chosen so (NOW() + delta) wont overflow without an uptime of 200 years */
 #define STIME_DELTA_MAX ((s_time_t)((uint64_t)~0ULL>>2))
 
+/*
+ * Indicator that the value returned by NOW() is good (earlier invocations may
+ * return zero or very small, merely monotonically increasing values).
+ */
+extern bool NOW_good;
+
 /* Explicitly OR with 1 just in case version number gets out of sync. */
 #define version_update_begin(v) (((v) + 1) | 1)
 #define version_update_end(v)   ((v) + 1)


