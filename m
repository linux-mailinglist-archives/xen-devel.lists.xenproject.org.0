Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F304481741C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 15:48:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656094.1024067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEty-0007Q4-Jd; Mon, 18 Dec 2023 14:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656094.1024067; Mon, 18 Dec 2023 14:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEty-0007ND-Go; Mon, 18 Dec 2023 14:47:26 +0000
Received: by outflank-mailman (input) for mailman id 656094;
 Mon, 18 Dec 2023 14:47:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFEtx-0007N3-53
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 14:47:25 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5af23cc0-9db4-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 15:47:24 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-336668a5a8dso1348899f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 06:47:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j29-20020a5d6e5d000000b003364e437577sm10175351wrz.84.2023.12.18.06.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 06:47:23 -0800 (PST)
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
X-Inumbo-ID: 5af23cc0-9db4-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702910843; x=1703515643; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/fMlAv9ea8KmO95h1rEr/bKlXlzXc/GyAyAyQRSshWQ=;
        b=K9ndiHpo/nJKD3gSh9ZRw7a4F4sHUiXYc4ZOWIhLtvgJJLdDjgsbWRdE0Zo7ca9o+j
         xqBEcHHJ+yunc/Jadgf66ppkFQx+PhDwmDGaVkJVVc39YZCGld+HXtxeMXYSovpiBoEz
         Hv5ApNGpHyjhM+OXQreRbqtThpSk6CRtuqI9HDVqyOQhTZrONLHxFfFiX04TdIiKiNvN
         hR8kxfxZhZzicHbRIs2Lm0YtfnuJ+F82hI6fCCUIYuezS2xTlyM7OJTc4O6/aeLHZccR
         bKL7tcJCKn5FZsWxPZjgs6tt5GSoooUgo43bxTox2UYaVDheb5nbze68zXwrg0lhzb3H
         at4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702910843; x=1703515643;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fMlAv9ea8KmO95h1rEr/bKlXlzXc/GyAyAyQRSshWQ=;
        b=kNL7tQaauYg6UUgt5m3KveWg9DqUpgdxFCLPI/tom7E/RZMe+R0M/kreJ2nQudJ7EK
         WsX9SQuI8UkEdESo5aNX3Mq/7Qkoc26MhbzDzla+NaTkTFj+2xGKrf4p5xV6vvSS8Z5X
         QUH3ECPzPtGZtMIZ77dz+sp2i0UX8HTSMN5LZ0Piwdmw0AIieqnemokb9Yf+98BvoJUE
         KCrmVwRax5zQJ9/Lcfaq2QuCfO49JGukSxXHvSrrDHn+UO6VH2I5d5hFx3Fn72BW46rY
         nmtH1044/EA6OsNM9LQuvKm2F14eMjbOgd6y+9JSEn1rObkYRKiSb7SAWWYTfhAFi7QS
         b6fg==
X-Gm-Message-State: AOJu0Yxc7ruYyZdAG/xq9uSSRZhjqCA93yMR2I6STPtpIK8ivoSBk0H7
	JQkqXkEYSM0VrDLvPcrjwg2mhlEWfFyarvakhKJm
X-Google-Smtp-Source: AGHT+IEEWLq7N/yo94hEvikQL8/wPkeWEXKD8oVGf1W5HpGeD4qe37bbrWxPQNmlpNA+UW9AGlaq0A==
X-Received: by 2002:a5d:55c6:0:b0:336:6e7d:3aff with SMTP id i6-20020a5d55c6000000b003366e7d3affmr185148wrw.37.1702910843678;
        Mon, 18 Dec 2023 06:47:23 -0800 (PST)
Message-ID: <bd116645-3451-47d7-8b8e-6e4b1af0680d@suse.com>
Date: Mon, 18 Dec 2023 15:47:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/3] x86: allow to suppress port-alias probing
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <0c45155a-2beb-4e69-bca3-cdf42ba22f2b@suse.com>
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
In-Reply-To: <0c45155a-2beb-4e69-bca3-cdf42ba22f2b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

By default there's already no use for this when we run in shim mode.
Plus there may also be a need to suppress the probing in case of issues
with it. Before introducing further port alias probing, introduce a
command line option allowing to bypass it, default it to on when in shim
mode, and gate RTC/CMOS port alias probing on it.

Requested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While "probe-port-aliases" is longish, shorter forms (e.g. "port-probe")
partially lose the intended meaning.
---
v2: New.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2000,6 +2000,17 @@ INVPCID is supported and not disabled vi
 This is a mask of C-states which are to be used preferably.  This option is
 applicable only on hardware were certain C-states are exclusive of one another.
 
+### probe-port-aliases (x86)
+> `= <boolean>`
+
+> Default: `true` outside of shim mode, `false` in shim mode
+
+Certain devices accessible by I/O ports may be accessible also through "alias"
+ports (originally a result of incomplete address decoding).  When such devices
+are solely under Xen's control, Xen disallows even Dom0 access to the "primary"
+ports.  When alias probing is active and aliases are detected, "alias" ports
+would then be treated similar to the "primary" ones.
+
 ### psr (Intel)
 > `= List of ( cmt:<boolean> | rmid_max:<integer> | cat:<boolean> | cos_max:<integer> | cdp:<boolean> )`
 
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -47,6 +47,7 @@ extern unsigned long highmem_start;
 #endif
 
 extern int8_t opt_smt;
+extern int8_t opt_probe_port_aliases;
 
 #ifdef CONFIG_SHADOW_PAGING
 extern bool opt_dom0_shadow;
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -75,6 +75,9 @@ static bool __initdata opt_invpcid = tru
 boolean_param("invpcid", opt_invpcid);
 bool __read_mostly use_invpcid;
 
+int8_t __initdata opt_probe_port_aliases = -1;
+boolean_param("probe-port-aliases", opt_probe_port_aliases);
+
 /* Only used in asm code and within this source file */
 unsigned long asmlinkage __read_mostly cr4_pv32_mask;
 
@@ -1844,6 +1847,9 @@ void asmlinkage __init noreturn __start_
     /* Low mappings were only needed for some BIOS table parsing. */
     zap_low_mappings();
 
+    if ( opt_probe_port_aliases < 0 )
+        opt_probe_port_aliases = !pv_shim;
+
     init_apic_mappings();
 
     normalise_cpu_order();
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1253,7 +1253,8 @@ static int __init cf_check probe_cmos_al
 {
     unsigned int offs;
 
-    if ( acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC )
+    if ( (acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) ||
+         !opt_probe_port_aliases )
         return 0;
 
     for ( offs = 2; offs < 8; offs <<= 1 )


