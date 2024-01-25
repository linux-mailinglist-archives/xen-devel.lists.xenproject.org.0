Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D31C983C46E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 15:13:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671543.1044934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT0TL-0006jR-EL; Thu, 25 Jan 2024 14:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671543.1044934; Thu, 25 Jan 2024 14:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT0TL-0006h7-B9; Thu, 25 Jan 2024 14:12:51 +0000
Received: by outflank-mailman (input) for mailman id 671543;
 Thu, 25 Jan 2024 14:12:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rT0TJ-0006h1-Kb
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 14:12:49 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0d86541-bb8b-11ee-98f5-efadbce2ee36;
 Thu, 25 Jan 2024 15:12:47 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2cdf69bb732so74091161fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 06:12:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h9-20020a0566380f0900b0046e3bcd98eesm4625016jas.172.2024.01.25.06.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 06:12:45 -0800 (PST)
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
X-Inumbo-ID: d0d86541-bb8b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706191967; x=1706796767; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxxgccS1wSEPKkgUnRWqhvznqPhyruj6fiIenO88NeM=;
        b=CvVAunpqhuo2aBz2iOqp+xpPJ585yNQTGecjfZbOb3V88c9KRizBeezWAp64THcNoK
         nXzj4Gn+Wsrvus/XdX07MggA5UXpvvxqJcCvhJ7NTF00GW6BV9SxQBwkY+NlgVdKGV19
         BbRAn4ZLHpDeiJGJYafhOVPPcq+0Q7q2KbG6Wd63Fy0J/O5y3aE8bIgo4ndf7O83Hi12
         ltB136NKd9liZ7el3pvMdnbcZyXhUrabXou/OUoLQDKto+i1cxZlVi7pfMLbqF72rTwW
         7/4eWENsOFjFrLtwKKDDwHX1QMk4lW1zaGDFTLE6fC50aNPx5rXzk8Ma5qVYp+eKlbWH
         FDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706191967; x=1706796767;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gxxgccS1wSEPKkgUnRWqhvznqPhyruj6fiIenO88NeM=;
        b=GfnSQmGh7LPfAPcoP18nKXpFk51WtmEJD3csG9FokN+aQMcXsSuYTIm6hSR43qY22S
         6lRA/HKb1HFQuNe92STzJ/KK0HrpMnb1SedPwqEBji3kAEaO6LFvODv+A42WBTpCjh8/
         C6BPOt1XQqw5XLom5EDv2ASu779NL3Z5IS3DSgCzmfuhHN53lCqE3Ve/ZrWWnBIC6bdU
         WlSsSXpmepopUaeMYBX7NXPNxrIC1PLCYSWAz7m4fB/WmGqFjwzUsilFT/JAGiMS1k6y
         lJOQEUZZr3ZNdSD8S2VC2I2BhaazE0LUUEDmKb+raS62cWwJNjny/V3yNQfLb4+CXom3
         U0Kw==
X-Gm-Message-State: AOJu0YwL69jd2/xzEsjrm4uqAPGEC+5MFsn4Vrkyb3H77O6yoqD/T+xQ
	KJq+tQCMzhTJaNrTYIgY+Nen4fDjXznYSTo4/ynWC3JP/oaODZ7+HO+UdARrIu2iQ55Q5bSLSRY
	=
X-Google-Smtp-Source: AGHT+IGovENTqxzjsjwjWmNL10NACWg2Gr2HgEoTxT7qhRWxplycGBueJjNzAZvqdrOoscjSYbRmXQ==
X-Received: by 2002:a2e:8046:0:b0:2cf:4017:64f5 with SMTP id p6-20020a2e8046000000b002cf401764f5mr104632ljg.37.1706191967015;
        Thu, 25 Jan 2024 06:12:47 -0800 (PST)
Message-ID: <fe289ca1-aa3a-49af-b7d7-70949237464b@suse.com>
Date: Thu, 25 Jan 2024 15:12:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: adjust initial setting of watchdog kind
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

"watchdog_timeout=0" is documented to disable the watchdog. Make sure
this also is true when there's a subsequent "watchdog" command line
option (and no further "watchdog_timeout=" one).

While there also switch watchdog_setup() to returning void, bringing it
in line with the !CONFIG_WATCHDOG case. Further amend command line
documentation to also mention the implicit effect of specifying a non-
zero timeout.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Alternatively "watchdog" following "watchdog_timeout=0" could be taken
to mean to use the default timeout again.

Really I think the comment in watchdog_setup() is wrong, and the
function would hence better go away. The CPU notifier registration can
surely be done in a pre-SMP initcall, which would have the benefit of
boot-time AP bringup then working the same as runtime CPU-onlining. (In
particular the set_timer() out of CPU_UP_PREPARE is a little suspicious,
as the timer can't possibly be run right away when a CPU isn't online
yet.) Which would leave __start_xen() to call watchdog_enable() in the
place it's calling watchdog_setup() now.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2795,7 +2795,7 @@ unknown NMIs will still be processed.
 > Default: `5`
 
 Set the NMI watchdog timeout in seconds.  Specifying `0` will turn off
-the watchdog.
+the watchdog.  Specifying a non-zero value enables the watchdog.
 
 ### x2apic (x86)
 > `= <boolean>`
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -473,7 +473,16 @@ bool watchdog_enabled(void)
     return !atomic_read(&watchdog_disable_count);
 }
 
-int __init watchdog_setup(void)
+void __init watchdog_configure(void)
+{
+    if ( !opt_watchdog_timeout )
+        opt_watchdog = false;
+
+    if ( opt_watchdog )
+        nmi_watchdog = NMI_LOCAL_APIC;
+}
+
+void __init watchdog_setup(void)
 {
     unsigned int cpu;
 
@@ -486,7 +495,6 @@ int __init watchdog_setup(void)
     register_cpu_notifier(&cpu_nmi_nfb);
 
     watchdog_enable();
-    return 0;
 }
 
 /* Returns false if this was not a watchdog NMI, true otherwise */
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1783,8 +1783,7 @@ void asmlinkage __init noreturn __start_
 
     open_softirq(NEW_TLBFLUSH_CLOCK_PERIOD_SOFTIRQ, new_tlbflush_clock_period);
 
-    if ( opt_watchdog ) 
-        nmi_watchdog = NMI_LOCAL_APIC;
+    watchdog_configure();
 
     find_smp_config();
 
--- a/xen/include/xen/watchdog.h
+++ b/xen/include/xen/watchdog.h
@@ -11,8 +11,11 @@
 
 #ifdef CONFIG_WATCHDOG
 
+/* Configure what, if any, watchdog to (try to) use. */
+void watchdog_configure(void);
+
 /* Try to set up a watchdog. */
-int watchdog_setup(void);
+void watchdog_setup(void);
 
 /* Enable the watchdog. */
 void watchdog_enable(void);

