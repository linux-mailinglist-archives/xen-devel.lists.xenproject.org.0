Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CAA80561D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 14:35:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647876.1011552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVaO-0004fU-B4; Tue, 05 Dec 2023 13:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647876.1011552; Tue, 05 Dec 2023 13:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVaO-0004df-7q; Tue, 05 Dec 2023 13:35:40 +0000
Received: by outflank-mailman (input) for mailman id 647876;
 Tue, 05 Dec 2023 13:35:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAVaN-0004c9-00
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 13:35:39 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bcbeadc-9373-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 14:35:36 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40c09f4814eso32000475e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 05:35:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b004083a105f27sm22034752wmo.26.2023.12.05.05.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 05:35:35 -0800 (PST)
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
X-Inumbo-ID: 2bcbeadc-9373-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701783335; x=1702388135; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=icdcTl4R53Kx/pBJJ95pkV2aMDgZm8pZTvVT9ZSHUhc=;
        b=CFgTk8qO08u6e/Fcp/Q0r7v49gXPg/glENjjOZw9LL9+MrEFJdWA64NK0g1vTwl+pt
         CpYyB/dntDavatwwwAiu5xAzW3cLO+XcSI472Gp42w/YaCpc3efk1ChP5VHCsc5/YSre
         HMjSSQtHsAb+es5d49EuktnvFCKUsaPbe5i3kRl5ZFHRkkd2WXv8JyqyzuB+jEU8sKZh
         //fR0INedhQp3+OzZKWIXbQLja+msDFYvK8vOvdiMX9L6DOczjguKarDWSYgBKuPIQNK
         E5SvTWWa3OaOaeH/QVvpGyi7OV6Cs0QoSS2J8VoaFv3wO7nJf08n6Q9YMvkqGAMVP5oW
         PqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701783335; x=1702388135;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=icdcTl4R53Kx/pBJJ95pkV2aMDgZm8pZTvVT9ZSHUhc=;
        b=k8fqiMVKv4JgUc1JT3XwUyiAbh/W2wbF0m7uiTioIcZrLvuzuCplCBjZd8HSBrvvEa
         rpOyy6Ae5T9lnnRUyZm4RQTVeDfAg4ga545G6IhzUBDbW4m4a0z6nOK36nmpF3tEoFaW
         CX3v8uhKOdcXXp0VOLh8VXm+j70BWL/zOCflO7AI5996V1XQr2GP2nH1r+/0kqkYRl3k
         lteE4sWnHAeFSUfY7vwYFC1yiN25pVtTKgOC30DZbljijW4A1364o/FHMgAlaKcpsTAX
         At1B+KCqD2A05oEOoOxxlXkufZsMOtNeSE+0V+FMXWmsyH/PzMoOaUSNffMBHspAzCjM
         M9rA==
X-Gm-Message-State: AOJu0YzfV8KrwK9vdAI0eXqkBn0HGSwVY/5Tw8BkVG/DD/VNUgWCe/AY
	eIzwuzKffV038ArHXNNeioudn5hWIbNIw5VrqE1l
X-Google-Smtp-Source: AGHT+IEbR74fT7sx5xeMZ2d8yer15hxtkcPZfg9BatZ6kIsb2hk+7ezkXulY8PdRIZaKJiL+SsdCNQ==
X-Received: by 2002:a05:600c:30d4:b0:40b:5e59:cc9e with SMTP id h20-20020a05600c30d400b0040b5e59cc9emr567904wmn.127.1701783335428;
        Tue, 05 Dec 2023 05:35:35 -0800 (PST)
Message-ID: <1ca903e7-ed2c-435e-999d-2a8519957498@suse.com>
Date: Tue, 5 Dec 2023 14:35:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/DMI: adjustments to comply with Misra C:2012 Rule 9.3
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
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

The rule demands that all array elements be initialized (or dedicated
initializers be used). Introduce a small set of macros to allow doing so
without unduly affecting use sites (in particular in terms of how many
elements .matches[] actually has; right now there's no use of
DMI_MATCH4(), so we could even consider reducing the array size to 3).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course a question is how many of these DMI table entries are in fact
no longer applicable (e.g. because of naming 32-bit-only systems).
Subsequently the table in dmi_scan.c itself may want cleaning up as
well, yet I guess the question of stale entries is even more relevant
there.
---
v2: Make things also build with older gcc.

--- a/xen/arch/x86/genapic/bigsmp.c
+++ b/xen/arch/x86/genapic/bigsmp.c
@@ -19,11 +19,14 @@ static int __init cf_check force_bigsmp(
 
 
 static const struct dmi_system_id __initconstrel bigsmp_dmi_table[] = {
-	{ force_bigsmp, "UNISYS ES7000-ONE", {
-		DMI_MATCH(DMI_PRODUCT_NAME, "ES7000-ONE")
-	 }},
+	{
+	    .ident = "UNISYS ES7000-ONE",
+	    .callback = force_bigsmp,
+	    DMI_MATCH1(
+		DMI_MATCH(DMI_PRODUCT_NAME, "ES7000-ONE")),
+	},
 	
-	 { }
+	{ }
 };
 
 
--- a/xen/arch/x86/hvm/quirks.c
+++ b/xen/arch/x86/hvm/quirks.c
@@ -36,42 +36,37 @@ static int __init cf_check check_port80(
         {
             .callback = dmi_hvm_deny_port80,
             .ident    = "Compaq Presario V6000",
-            .matches  = {
+	    DMI_MATCH2(
                 DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
-                DMI_MATCH(DMI_BOARD_NAME,   "30B7")
-            }
+                DMI_MATCH(DMI_BOARD_NAME,   "30B7")),
         },
         {
             .callback = dmi_hvm_deny_port80,
             .ident    = "HP Pavilion dv9000z",
-            .matches  = {
+	    DMI_MATCH2(
                 DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
-                DMI_MATCH(DMI_BOARD_NAME,   "30B9")
-            }
+                DMI_MATCH(DMI_BOARD_NAME,   "30B9")),
         },
         {
             .callback = dmi_hvm_deny_port80,
             .ident    = "HP Pavilion dv6000",
-            .matches  = {
+	    DMI_MATCH2(
                 DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
-                DMI_MATCH(DMI_BOARD_NAME,   "30B8")
-            }
+                DMI_MATCH(DMI_BOARD_NAME,   "30B8")),
         },
         {
             .callback = dmi_hvm_deny_port80,
             .ident    = "HP Pavilion tx1000",
-            .matches  = {
+	    DMI_MATCH2(
                 DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
-                DMI_MATCH(DMI_BOARD_NAME,   "30BF")
-            }
+                DMI_MATCH(DMI_BOARD_NAME,   "30BF")),
         },
         {
             .callback = dmi_hvm_deny_port80,
             .ident    = "Presario F700",
-            .matches  = {
+	    DMI_MATCH2(
                 DMI_MATCH(DMI_BOARD_VENDOR, "Quanta"),
-                DMI_MATCH(DMI_BOARD_NAME,   "30D3")
-            }
+                DMI_MATCH(DMI_BOARD_NAME,   "30D3")),
         },
         { }
     };
--- a/xen/arch/x86/ioport_emulate.c
+++ b/xen/arch/x86/ioport_emulate.c
@@ -43,59 +43,51 @@ static const struct dmi_system_id __init
      */
     {
         .ident = "HP ProLiant DL3xx",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL3"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL3")),
     },
     {
         .ident = "HP ProLiant DL5xx",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL5"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL5")),
     },
     {
         .ident = "HP ProLiant DL7xx",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL7"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL7")),
     },
     {
         .ident = "HP ProLiant ML3xx",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML3"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML3")),
     },
     {
         .ident = "HP ProLiant ML5xx",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML5"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML5")),
     },
     {
         .ident = "HP ProLiant BL2xx",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL2"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL2")),
     },
     {
         .ident = "HP ProLiant BL4xx",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL4"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL4")),
     },
     {
         .ident = "HP ProLiant BL6xx",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL6"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL6")),
     },
     { }
 };
--- a/xen/arch/x86/shutdown.c
+++ b/xen/arch/x86/shutdown.c
@@ -187,348 +187,310 @@ static const struct dmi_system_id __init
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell E520",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Dell DM061"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Dell DM061")),
     },
     {    /* Handle problems with rebooting on Dell 1300's */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell PowerEdge 1300",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 1300/"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 1300/")),
     },
     {    /* Handle problems with rebooting on Dell 300's */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell PowerEdge 300",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 300/"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 300/")),
     },
     {    /* Handle problems with rebooting on Dell Optiplex 745's SFF */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell OptiPlex 745",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745")),
     },
     {    /* Handle problems with rebooting on Dell Optiplex 745's DFF */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell OptiPlex 745",
-        .matches = {
+        DMI_MATCH3(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
             DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745"),
-            DMI_MATCH(DMI_BOARD_NAME, "0MM599"),
-        },
+            DMI_MATCH(DMI_BOARD_NAME, "0MM599")),
     },
     {    /* Handle problems with rebooting on Dell Optiplex 745 with 0KW626 */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell OptiPlex 745",
-        .matches = {
+        DMI_MATCH3(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
             DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 745"),
-            DMI_MATCH(DMI_BOARD_NAME, "0KW626"),
-        },
+            DMI_MATCH(DMI_BOARD_NAME, "0KW626")),
     },
     {    /* Handle problems with rebooting on Dell Optiplex 330 with 0KP561 */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell OptiPlex 330",
-        .matches = {
+        DMI_MATCH3(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
             DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 330"),
-            DMI_MATCH(DMI_BOARD_NAME, "0KP561"),
-        },
+            DMI_MATCH(DMI_BOARD_NAME, "0KP561")),
     },
     {    /* Handle problems with rebooting on Dell Optiplex 360 with 0T656F */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell OptiPlex 360",
-        .matches = {
+        DMI_MATCH3(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
             DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 360"),
-            DMI_MATCH(DMI_BOARD_NAME, "0T656F"),
-        },
+            DMI_MATCH(DMI_BOARD_NAME, "0T656F")),
     },
     {    /* Handle problems with rebooting on Dell OptiPlex 760 with 0G919G */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell OptiPlex 760",
-        .matches = {
+        DMI_MATCH3(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
             DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 760"),
-            DMI_MATCH(DMI_BOARD_NAME, "0G919G"),
-        },
+            DMI_MATCH(DMI_BOARD_NAME, "0G919G")),
     },
     {    /* Handle problems with rebooting on Dell 2400's */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell PowerEdge 2400",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 2400"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 2400")),
     },
     {    /* Handle problems with rebooting on Dell T5400's */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell Precision T5400",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Precision WorkStation T5400"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Precision WorkStation T5400")),
     },
     {    /* Handle problems with rebooting on Dell T7400's */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell Precision T7400",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Precision WorkStation T7400"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Precision WorkStation T7400")),
     },
     {    /* Handle problems with rebooting on HP laptops */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "HP Compaq Laptop",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "HP Compaq"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "HP Compaq")),
     },
     {    /* Handle problems with rebooting on Dell XPS710 */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell XPS710",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Dell XPS710"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Dell XPS710")),
     },
     {    /* Handle problems with rebooting on Dell DXP061 */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Dell DXP061",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Dell DXP061"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Dell DXP061")),
     },
     {    /* Handle problems with rebooting on Sony VGN-Z540N */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Sony VGN-Z540N",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "VGN-Z540N"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "VGN-Z540N")),
     },
     {    /* Handle problems with rebooting on ASUS P4S800 */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "ASUS P4S800",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK Computer INC."),
-            DMI_MATCH(DMI_BOARD_NAME, "P4S800"),
-        },
+            DMI_MATCH(DMI_BOARD_NAME, "P4S800")),
     },
     {    /* Handle reboot issue on Acer Aspire one */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_KBD,
         .ident = "Acer Aspire One A110",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "AOA110"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "AOA110")),
     },
     {    /* Handle problems with rebooting on Apple MacBook5 */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Apple MacBook5",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "MacBook5"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "MacBook5")),
     },
     {    /* Handle problems with rebooting on Apple MacBookPro5 */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Apple MacBookPro5",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro5"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro5")),
     },
     {    /* Handle problems with rebooting on Apple Macmini3,1 */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Apple Macmini3,1",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Macmini3,1"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Macmini3,1")),
     },
     {    /* Handle problems with rebooting on the iMac9,1. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Apple iMac9,1",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "iMac9,1"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "iMac9,1")),
     },
     {    /* Handle problems with rebooting on the Latitude E6320. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6320",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6320"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6320")),
     },
     {    /* Handle problems with rebooting on the Latitude E5420. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E5420",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5420"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5420")),
     },
     {       /* Handle problems with rebooting on the Latitude E6220. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6220",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6220"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6220")),
     },
     {    /* Handle problems with rebooting on the Latitude E6420. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6420",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6420"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6420")),
     },
     {    /* Handle problems with rebooting on the OptiPlex 990. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell OptiPlex 990",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 990"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 990")),
     },
     {    /* Handle problems with rebooting on the Precision M6600. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell OptiPlex 990",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Precision M6600"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Precision M6600")),
     },
     {    /* Handle problems with rebooting on the Latitude E6520. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6520",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6520"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6520")),
     },
     {       /* Handle problems with rebooting on the OptiPlex 790. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell OptiPlex 790",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 790"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 790")),
     },
     {    /* Handle problems with rebooting on the OptiPlex 990. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell OptiPlex 990",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 990"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 990")),
     },
     {    /* Handle problems with rebooting on the OptiPlex 390. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell OptiPlex 390",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 390"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 390")),
     },
     {    /* Handle problems with rebooting on Dell OptiPlex 9020. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_ACPI,
         .ident = "Dell OptiPlex 9020",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 9020"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 9020")),
     },
     {    /* Handle problems with rebooting on the Latitude E6320. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6320",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6320"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6320")),
     },
     {    /* Handle problems with rebooting on the Latitude E6420. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6420",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6420"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6420")),
     },
     {    /* Handle problems with rebooting on the Latitude E6520. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_CF9,
         .ident = "Dell Latitude E6520",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6520"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6520")),
     },
     {    /* Handle problems with rebooting on Dell PowerEdge R540. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_ACPI,
         .ident = "Dell PowerEdge R540",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R540"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R540")),
     },
     {    /* Handle problems with rebooting on Dell PowerEdge R740. */
         .callback = override_reboot,
         .driver_data = (void *)(long)BOOT_ACPI,
         .ident = "Dell PowerEdge R740",
-        .matches = {
+        DMI_MATCH2(
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R740"),
-        },
+            DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R740")),
     },
     { }
 };
--- a/xen/arch/x86/x86_64/mmconf-fam10h.c
+++ b/xen/arch/x86/x86_64/mmconf-fam10h.c
@@ -188,9 +188,8 @@ void fam10h_check_enable_mmcfg(void)
 static const struct dmi_system_id __initconstrel mmconf_dmi_table[] = {
 	{
 		.ident = "Sun Microsystems Machine",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Sun Microsystems"),
-		},
+		DMI_MATCH1(
+			DMI_MATCH(DMI_SYS_VENDOR, "Sun Microsystems")),
 	},
 	{}
 };
--- a/xen/include/xen/dmi.h
+++ b/xen/include/xen/dmi.h
@@ -32,6 +32,11 @@ struct dmi_system_id {
 
 #define DMI_MATCH(a,b)	{ a, b }
 
+#define DMI_MATCH4(m1, m2, m3, m4) .matches = { m1, m2, m3, m4 }
+#define DMI_MATCH3(m1, m2, m3)     .matches = { [0] = m1, [1] = m2, [2] = m3 }
+#define DMI_MATCH2(m1, m2)         .matches = { [0] = m1, [1] = m2 }
+#define DMI_MATCH1(m1)             .matches = { [0] = m1 }
+
 extern int dmi_check_system(const struct dmi_system_id *list);
 extern void dmi_scan_machine(void);
 extern const char *dmi_get_table(paddr_t *base, u32 *len);

