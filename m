Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 001F48986D8
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 14:10:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700837.1094571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsLut-0004PG-Ub; Thu, 04 Apr 2024 12:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700837.1094571; Thu, 04 Apr 2024 12:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsLut-0004KZ-Rb; Thu, 04 Apr 2024 12:10:03 +0000
Received: by outflank-mailman (input) for mailman id 700837;
 Thu, 04 Apr 2024 12:10:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsLus-0003uB-DG
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 12:10:02 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42ca8a43-f27c-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 14:10:00 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a4e62f3e63dso113501066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 05:10:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a2-20020a1709064a4200b00a4ea067f6f8sm2044030ejv.161.2024.04.04.05.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 05:09:59 -0700 (PDT)
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
X-Inumbo-ID: 42ca8a43-f27c-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712232600; x=1712837400; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LsESoGNQKd7ZfRqH7bEnEsFhqPeG+fTEv62Vr+ADXo4=;
        b=HCDFuw/ct8oHIXM/bmOpd6VUCav1VeNpxZCw8m0WXRh6G0G1wxjF1QZPvTaXKFJl0p
         Yb13Y9ZeWkldghGIvmGdiDvyrrmxFRS/gnahX6fjYn4K4aQaO8S+9TRyiZIa5vvRrnKf
         mlgbny/3RS4X1kFjXT7IXiJOmTn1LnmNigJKCLYe6Oi5xOHx9AjxVTAy+16WkiHXfGLA
         rSospwWqRjm8qVrE8SEVno8Pd26sun7SEZpJXFVSG+3qVo3Z4bPOMSBfZa9o3eV2lvKY
         5wFbYj7amboKWQoGj86ZUDSy/WF7ntGJSMMelAM5jd4b48kWflMXjAJwyLpGj/Zaa0DU
         LLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712232600; x=1712837400;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LsESoGNQKd7ZfRqH7bEnEsFhqPeG+fTEv62Vr+ADXo4=;
        b=hSJLk9tdvDjHdQjHrnZJoyFGmhPb2qd4PWqbugmp94ED0IRJBEsaqX5GUaz0RTN+GD
         fVbY9/4mXFUpfHaIgD3GsIyXhsWkOpf4IMFtcj9gC3dNFSyo9HU4IRz9ttCXY1kOd9P5
         t4ZvCalDGKfIxPNWUDLpSiAGJ77Hx42+GYn96cUwdPIIOQrSAv88BW3sN70IRdV4QWWy
         57Y/0zwAO2rIReCxhVAGtveIZDKtZymVgn3xzsFgiRZe1YM2KLShBClndvZ2v93dYUc2
         RAdDGew6oIeS2tlpQziJdqNZ6JUl0t1WiqoNKuG8rx+wnbBDbP3hHmunRxkNeQlUqyWe
         YjHA==
X-Gm-Message-State: AOJu0YxJoz+HI1COTPIFOBGlAuJKNQ3Z6l8yZH/nb/WqIqToVAk6M3TE
	1wjOHnNtF/dcarxMVjBVNguMipjvp6VnhmiaKtWVPJENJkHSDVIKldWkinEqZHHhsI/G5S9kz9Q
	=
X-Google-Smtp-Source: AGHT+IEXN8JLM78Eec32wyznl9dKAWCYlGyp9/tvySOVN2eGnQBI/wFd0pu/rjFC2YluPnImdQB2jA==
X-Received: by 2002:a17:907:c0d:b0:a4e:68bc:a46e with SMTP id ga13-20020a1709070c0d00b00a4e68bca46emr1731806ejc.43.1712232600132;
        Thu, 04 Apr 2024 05:10:00 -0700 (PDT)
Message-ID: <58179e43-f40b-45ed-8f20-8b02fa6f2eaf@suse.com>
Date: Thu, 4 Apr 2024 14:09:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86: adjust initial setting of watchdog kind
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

"watchdog_timeout=0" is documented to disable the watchdog, which wasn't
really the case; the watchdog was rather ran with an, in practice,
infinite timeout. Fold that command line option with "watchdog",
resetting to defaults whenever encountering a new instance.

While touching opt_watchdog_timeout, also move it into .data.ro_after_init.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Really I think the comment in watchdog_setup() is wrong, and the
function would hence better go away. The CPU notifier registration can
surely be done in a pre-SMP initcall, which would have the benefit of
boot-time AP bringup then working the same as runtime CPU-onlining. (In
particular the set_timer() out of CPU_UP_PREPARE is a little suspicious,
as the timer can't possibly be run right away when a CPU isn't online
yet.) Which would leave __start_xen() to call watchdog_enable() in the
place it's calling watchdog_setup() now.
---
v2: Re-do largely from scratch.

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -13,6 +13,8 @@ The format is based on [Keep a Changelog
  - On x86:
    - HVM PIRQs are disabled by default.
    - Reduce IOMMU setup time for hardware domain.
+   - The "watchdog_timeout=" command line option is subsumed by the "watchdog="
+     one.
 
 ### Added
  - On x86:
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2790,22 +2790,19 @@ suboptimal scheduling decisions, but onl
 oversubscribed (i.e., in total there are more vCPUs than pCPUs).
 
 ### watchdog (x86)
-> `= force | <boolean>`
+> `= <boolean> | List of [ force | <integer>s ]`
 
 > Default: `false`
 
 Run an NMI watchdog on each processor.  If a processor is stuck for
-longer than the **watchdog_timeout**, a panic occurs.  When `force` is
-specified, in addition to running an NMI watchdog on each processor,
-unknown NMIs will still be processed.
+longer than the specified or default timeout, a panic occurs.
 
-### watchdog_timeout (x86)
-> `= <integer>`
+*   When `force` is specified, in addition to running an NMI watchdog on each
+    processor, unknown NMIs will still be processed.
 
-> Default: `5`
-
-Set the NMI watchdog timeout in seconds.  Specifying `0` will turn off
-the watchdog.
+*   The <integer>s value allows to set the NMI watchdog timeout in seconds
+    (default: `5s`).  Specifying `0` will turn off the watchdog.  Specifying
+    a non-zero value enables the watchdog.
 
 ### x2apic (x86)
 > `= <boolean>`
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -48,8 +48,20 @@ bool __initdata opt_watchdog;
 /* watchdog_force: If true, process unknown NMIs when running the watchdog. */
 bool watchdog_force;
 
+#define WATCHDOG_TIMEOUT_DEFAULT 5 /* seconds */
+
+/* opt_watchdog_timeout: Number of seconds to wait before panic. */
+static unsigned int __ro_after_init opt_watchdog_timeout = WATCHDOG_TIMEOUT_DEFAULT;
+
 static int __init cf_check parse_watchdog(const char *s)
 {
+    const char *ss;
+    int rc = 0;
+
+    /* Reset to defaults. */
+    watchdog_force = false;
+    opt_watchdog_timeout = WATCHDOG_TIMEOUT_DEFAULT;
+
     if ( !*s )
     {
         opt_watchdog = true;
@@ -66,28 +78,42 @@ static int __init cf_check parse_watchdo
         return 0;
     }
 
-    if ( !strcmp(s, "force") )
-        watchdog_force = opt_watchdog = true;
-    else
-        return -EINVAL;
+    do {
+        ss = strchr(s, ',');
+        if ( !ss )
+            ss = strchr(s, '\0');
+
+        if ( !cmdline_strcmp(s, "force") )
+        {
+            watchdog_force = opt_watchdog = true;
+
+            if ( !opt_watchdog_timeout )
+                opt_watchdog_timeout = WATCHDOG_TIMEOUT_DEFAULT;
+        }
+        else if ( isdigit(*s) )
+        {
+            unsigned long value = simple_strtoul(s, &s, 0);
+
+            if ( *s == 's' && s + 1 == ss )
+            {
+                opt_watchdog_timeout = value;
+                if ( opt_watchdog_timeout != value )
+                    opt_watchdog_timeout = WATCHDOG_TIMEOUT_DEFAULT;
+
+                opt_watchdog = !!opt_watchdog_timeout;
+            }
+            else
+                rc = -EINVAL;
+        }
+        else
+            rc = -EINVAL;
 
-    return 0;
-}
-custom_param("watchdog", parse_watchdog);
+        s = ss + 1;
+    } while ( *ss );
 
-/* opt_watchdog_timeout: Number of seconds to wait before panic. */
-static unsigned int opt_watchdog_timeout = 5;
-
-static int __init cf_check parse_watchdog_timeout(const char *s)
-{
-    const char *q;
-
-    opt_watchdog_timeout = simple_strtoull(s, &q, 0);
-    opt_watchdog = !!opt_watchdog_timeout;
-
-    return *q ? -EINVAL : 0;
+    return rc;
 }
-custom_param("watchdog_timeout", parse_watchdog_timeout);
+custom_param("watchdog", parse_watchdog);
 
 /*
  * lapic_nmi_owner tracks the ownership of the lapic NMI hardware:

