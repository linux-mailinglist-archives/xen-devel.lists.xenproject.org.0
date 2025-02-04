Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1CEA27264
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:04:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881422.1291562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfIbY-0005zh-9G; Tue, 04 Feb 2025 13:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881422.1291562; Tue, 04 Feb 2025 13:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfIbY-0005yF-6b; Tue, 04 Feb 2025 13:04:40 +0000
Received: by outflank-mailman (input) for mailman id 881422;
 Tue, 04 Feb 2025 13:04:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfIbX-0005y7-1E
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:04:39 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9612616b-e2f8-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 14:04:37 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d3e6274015so9506695a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 05:04:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc724aa1b1sm9133149a12.50.2025.02.04.05.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 05:04:35 -0800 (PST)
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
X-Inumbo-ID: 9612616b-e2f8-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738674276; x=1739279076; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LL+AjvDFE1HQ/xW0epZ/WCF9BjnJU7VBrhoI6GIBxOU=;
        b=IOzkJWQghouo/kOi5vvlTSSz78BLwZrPQdSeQT7sqFw1WBXubJfv/iQAcyGbqVee2q
         zdFDYFmLTGWHrXYnlQMObSNBD+JAb67Ifwz83lsKaH5100gNXW7njkpVt6gcXr4hK9d2
         VYVte8YeOgi+COKfKAmgnnzVp+HKmtE3zFlu7V8vJ8m3vn69WWwpRUkY05BH70SOMXvd
         WQYq8/fIPlAZcoHZwcEJD8ArCwJwRqKY5s8MPx+DDOkRG9pF+59MjCU/Qd9kzhwhGIvE
         /9+FCtfzAytJEA8YKjQrTRauEF/8Dz8Fwu2wLgJn2PmVliMiV6liK0U+ikyZRwYnEvi9
         sa3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738674276; x=1739279076;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LL+AjvDFE1HQ/xW0epZ/WCF9BjnJU7VBrhoI6GIBxOU=;
        b=BHv1cdkcPQYUcFbVjq7/2y2JD5MgZmpTkDr0BXbGRg2sdRQwzGM6HOMfj7bzZC+zXl
         FDDCv1JfS3AnsmpUQTFTc17S9xETcndWo5WppQH8zwSZZYewJNb16g9YksrHf4rSfhKt
         eWBsWyNUEJc2SaRmoHXB/PeCkl5xhl1w7p3FR6gpevTcBMXMORpOHgQ7u4WTl7n4eoui
         EUpqjXsO/kQpx5hImQ0sBVWTIBsfAHRhJb56lKpFuUmidzhe4vOut86Zqg6j4x/Hegff
         TDXGWgLBO8xudiH/zV/rysdHPBxH821oGzEdomkEIUXJ3fT95T0mgHbvCbAi3KHv+xTy
         IwXg==
X-Gm-Message-State: AOJu0Yydj3StNX9K3zopEUtW1WTF7PiHUXpkVr8Y6taeDSF8MgypI7bA
	a9uKeIyL8G/2ekx5FoxMG2ArVRpvaq/XCA5TlBrdEdrdGrhDia6LV7X+40s4C2QTnXezCpE2GEI
	=
X-Gm-Gg: ASbGncs866ge14n8nZYu+JhIUOgblJeqsEgjuQP2d7nrg7DNOzEOyluFqWbjwRvSlju
	+WBc0dS7VjXclOar34bIubUNTYAhlue5h4vYdjtZ+3PCxGdDRiYYLfJZrvoaEWIFzmWPYvlNGWh
	kw69INr+6VS4C8QNd5XAfhfVTjm64ihYdg6Ir9x5+NlELfuCGNJxWIX++RrqXNDrxFhQLuW0yZq
	tqBW+UOXQ1je/zMiLs9XhLMwvv34VJerw1hhttIDTZllegz1VyS2+YVP+7w+14Ns+W574bqTtab
	zZE+IG6RzMSJqLhgveSiF1Qc6migIdFKZkyTN63Uoyz3Dr97iK91vvdK+Q4IJ/grFKen4DFyizl
	v
X-Google-Smtp-Source: AGHT+IHuUn07R6KRj61Y7LFHincz8m7nXSdZ0NZzKE9JyWTxZ42o6ddJEfLF8b9GhRDFnwFrpEMetA==
X-Received: by 2002:a05:6402:34d3:b0:5d2:8f70:75f6 with SMTP id 4fb4d7f45d1cf-5dc5effcb22mr31410891a12.30.1738674276275;
        Tue, 04 Feb 2025 05:04:36 -0800 (PST)
Message-ID: <b7b148fc-ee74-4f02-9dab-f80b1707e44e@suse.com>
Date: Tue, 4 Feb 2025 14:04:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 for-4.21 4/4] PCI: drop pci_segments_init()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <0a006732-2b6e-46f0-a706-f432abd45d2c@suse.com>
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
In-Reply-To: <0a006732-2b6e-46f0-a706-f432abd45d2c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Have callers invoke pci_add_segment() directly instead: With radix tree
initialization moved out of the function, its name isn't quite
describing anymore what it actually does.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is entirely optional and up for discussion. There certainly also is
an argument towards keeping the function.
---
v3: Adjust description to accont for and re-base over dropped earlier
    patch.
v2: New.

--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -88,7 +88,8 @@ static int __init pci_init(void)
     if ( !pci_passthrough_enabled )
         return 0;
 
-    pci_segments_init();
+    if ( pci_add_segment(0) )
+        panic("Could not initialize PCI segment 0\n");
 
     if ( acpi_disabled )
         return dt_pci_init();
--- a/xen/arch/x86/x86_64/mmconfig-shared.c
+++ b/xen/arch/x86/x86_64/mmconfig-shared.c
@@ -402,7 +402,8 @@ void __init acpi_mmcfg_init(void)
 {
     bool valid = true;
 
-    pci_segments_init();
+    if ( pci_add_segment(0) )
+        panic("Could not initialize PCI segment 0\n");
 
     /* MMCONFIG disabled */
     if ((pci_probe & PCI_PROBE_MMCONF) == 0)
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -122,12 +122,6 @@ static int pci_segments_iterate(
     return rc;
 }
 
-void __init pci_segments_init(void)
-{
-    if ( !alloc_pseg(0) )
-        panic("Could not initialize PCI segment 0\n");
-}
-
 int __init pci_add_segment(u16 seg)
 {
     return alloc_pseg(seg) ? 0 : -ENOMEM;
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -214,7 +214,6 @@ void setup_hwdom_pci_devices(struct doma
                              int (*handler)(uint8_t devfn,
                                             struct pci_dev *pdev));
 int pci_release_devices(struct domain *d);
-void pci_segments_init(void);
 int pci_add_segment(u16 seg);
 const unsigned long *pci_get_ro_map(u16 seg);
 int pci_add_device(u16 seg, u8 bus, u8 devfn,


