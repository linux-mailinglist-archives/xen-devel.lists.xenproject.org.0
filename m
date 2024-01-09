Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F8F82800D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 09:06:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664316.1034444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN77U-00021G-3K; Tue, 09 Jan 2024 08:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664316.1034444; Tue, 09 Jan 2024 08:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN77T-0001zS-WD; Tue, 09 Jan 2024 08:05:56 +0000
Received: by outflank-mailman (input) for mailman id 664316;
 Tue, 09 Jan 2024 08:05:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RTBC=IT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rN77S-0001zM-3v
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 08:05:54 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8a27cb4-aec5-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 09:05:53 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50eabbc3dccso2656195e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 00:05:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bw10-20020a056638460a00b0046e33773c09sm478861jab.36.2024.01.09.00.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 00:05:51 -0800 (PST)
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
X-Inumbo-ID: e8a27cb4-aec5-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704787552; x=1705392352; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEqr9QrMCey4RTfR3m71tRVavPGwQg0PARsYXTCITQU=;
        b=Xcvfs1MV2NuzBzPgyN+a+RGz8aeFHw4R09wfM8o9XHolx26i5Mn4QqNjZnjy6388ui
         Vx1I+PzBb7xQ9luyUPs4x+Iqdbzgg87+Th4BwfE8Z7krATsQveJBCspxbhK7XpTAPuiK
         SMEym+/xxSvTHfZolxjedc7F7aVaUAIpcjE+6PyhkBGP7g1hJkJu/+2UCnR4/2xwxJrp
         L7HIdcld/lktHaiAQxfeThv4TIG98b46CP/BJuYvYHFZFlTePtAhqw2UufULFJOl0ovW
         rkjKfmo+QLV3dSxaiKJBBqety3K5QIhYCsVjCvs2djWL33qP5piH6FHAFvrfbjTyBDne
         BngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704787552; x=1705392352;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CEqr9QrMCey4RTfR3m71tRVavPGwQg0PARsYXTCITQU=;
        b=r8wuihRHVUyrnCI1nkPBGS/rog5i21z9Xq6zi+4Ghj8x7UENgsEnaUOjzxATUnxV4Z
         6I6OVzfUq/VeZe7kMsBp6E82llrbsdbyoHTEULsZWQZgKsTUKgZI4eqfiRN5jTvBn1t8
         w72qEYNQjFoy3yJxd2e0wZ+cbP4/vIBx1sVkGcivnJvutfSyhTUJjN0butj5IQMAhkqW
         VITCnpSoQfwOJot84edgidJ1TrAnu8xkK1Re/Q6dTOKqmKqjFooLEQzq7jZwyLLMfTZi
         j6aTVpwB4mugy2J3XYYHFNfHfXMFWRwHOLATNsepLwQzEscSHUFW57K6xW7EmcgEi3Ve
         UmAg==
X-Gm-Message-State: AOJu0Yxsj7cszYQBCdnS2jCXZyIWoT798DE8Ynet04dAkOLSK1DvPZDd
	4eTCnKOeXU6dp7wQB+kiKbiUP9AqOzI3oqUhZS1lb63nag==
X-Google-Smtp-Source: AGHT+IGBN9o/4p+mlY9Ys2VC5UL6Z/xFCKroyp0kFr85ScG/ScerjX05b1jOo/w/M/5MhL9r9VxkZA==
X-Received: by 2002:a05:6512:2037:b0:50e:aa03:a50c with SMTP id s23-20020a056512203700b0050eaa03a50cmr967778lfs.113.1704787552501;
        Tue, 09 Jan 2024 00:05:52 -0800 (PST)
Message-ID: <d466eb44-1160-4b57-a41f-752dbf626748@suse.com>
Date: Tue, 9 Jan 2024 09:05:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] consolidate do_bug_frame() / bug_fn_t
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

The type not being used in do_bug_frame() is suspicious. Apparently
that's solely because the type uses a pointer-to-const parameter,
when run_in_exception_handler() wants functions taking pointer-to-non-
const. Drop the const, in turn requiring Arm's do_bug_frame() to also
have its const dropped. This then brings that function also closer to
the common one, with Arm's use of vaddr_t remaining as a difference.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is an alternative proposal to
https://lists.xen.org/archives/html/xen-devel/2023-12/msg01385.html,
albeit without paving a road towards Andrew's desire of getting rid of
show_execution_state_nonconst() again. Retaining (and propagating) the
const would imply the need to cast away the const-ness somewhere on (at
least) the path to invoking gdb stub code. Personally I'm averse to such
casting away of const-ness ...

--- a/xen/arch/arm/include/asm/traps.h
+++ b/xen/arch/arm/include/asm/traps.h
@@ -69,7 +69,7 @@ void do_cp(struct cpu_user_regs *regs, c
 void do_trap_smc(struct cpu_user_regs *regs, const union hsr hsr);
 void do_trap_hvc_smccc(struct cpu_user_regs *regs);
 
-int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc);
+int do_bug_frame(struct cpu_user_regs *regs, vaddr_t pc);
 
 void noreturn do_unexpected_trap(const char *msg,
                                  const struct cpu_user_regs *regs);
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1202,7 +1202,7 @@ void do_unexpected_trap(const char *msg,
     panic("CPU%d: Unexpected Trap: %s\n", smp_processor_id(), msg);
 }
 
-int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
+int do_bug_frame(struct cpu_user_regs *regs, vaddr_t pc)
 {
     const struct bug_frame *bug = NULL;
     const char *prefix = "", *filename, *predicate;
--- a/xen/common/bug.c
+++ b/xen/common/bug.c
@@ -63,14 +63,10 @@ int do_bug_frame(struct cpu_user_regs *r
 
     if ( id == BUGFRAME_run_fn )
     {
-        void (*fn)(struct cpu_user_regs *) = bug_ptr(bug);
+        bug_fn_t *fn = bug_ptr(bug);
 
         fn(regs);
 
-        /* Re-enforce consistent types, because of the casts involved. */
-        if ( false )
-            run_in_exception_handler(fn);
-
         return id;
     }
 
--- a/xen/include/xen/bug.h
+++ b/xen/include/xen/bug.h
@@ -101,12 +101,11 @@ struct bug_frame {
 #endif
 
 struct cpu_user_regs;
-typedef void bug_fn_t(const struct cpu_user_regs *regs);
+typedef void bug_fn_t(struct cpu_user_regs *regs);
 
 #ifndef run_in_exception_handler
 
-static void always_inline run_in_exception_handler(
-    void (*fn)(struct cpu_user_regs *regs))
+static void always_inline run_in_exception_handler(bug_fn_t *fn)
 {
     BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);
 }

