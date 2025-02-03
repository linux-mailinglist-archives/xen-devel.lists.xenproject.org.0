Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F62A26029
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:33:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880859.1290951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezNZ-0002Xl-7J; Mon, 03 Feb 2025 16:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880859.1290951; Mon, 03 Feb 2025 16:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezNZ-0002W1-3Q; Mon, 03 Feb 2025 16:32:57 +0000
Received: by outflank-mailman (input) for mailman id 880859;
 Mon, 03 Feb 2025 16:32:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tezIF-0006gZ-Ms
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:27:27 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c103a5f0-e24b-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 17:27:26 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aaf57c2e0beso943962866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:27:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47d070bsm772781666b.48.2025.02.03.08.27.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 08:27:25 -0800 (PST)
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
X-Inumbo-ID: c103a5f0-e24b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738600046; x=1739204846; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oIG8+dfgv5JrBN9qiubMzxCH8fENGmq0/5ptspun5xg=;
        b=F1CSUD0421d0LFTvLog1YkCUNtLhLqYYKf9oB8RU8t7K2SwfLNl7ixCed+bFWUlrn6
         UP8meVAr1rkjN1L8ixZkcvNvufAARHXu1itJ+JfE6NZ/Z6T6qSiNPrDYaOYR91reCgx/
         mb+7ZqVxK2aqLDQ7NZ/eq06+amsESpNl5u3Ym9exMoZCwDPKDIP6xg9NAeuBHVrUepz7
         7223ggMOOfkUkZN9LuAIHZr/EWd8ZqKFj8QcoV8xMSEdk3RHnuJilrRK4AA8T5Udl8bR
         Dt0DNab+wddBbCytWmQ+t2tMi+LoU0lzNuAXm2FFcu0L3DI9lDD0Hv/knaRrk9zN9eC+
         KDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600046; x=1739204846;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIG8+dfgv5JrBN9qiubMzxCH8fENGmq0/5ptspun5xg=;
        b=aMb+VmjucGbUVgeiKX5aK3hMtLM7eThaEv3C78ne9a9okwpK12RjV8fiGDDrvy+E/W
         zqdsYSxHDHpdB0I8qEcvzm8BkrXCE1aW7VpzxgrP7JztIBtUAQIxJykLcFyg0ek6Jmn0
         RMnvxjQscmsWDnozvWdC9i6adE9kMzuU8jxBk2oUa6c8D0BxxUtnz3AGOe1b8g2cYuz1
         KwrZxKewGhZKJTvLwwXG0X3DMAYhxB+MmVARfJDwX3BmsogOBVJIsMthYSwLYhEVA0+/
         fOSdExDDvkxsEcsn+B+DwBZGkUz2oJTNlcRzTxzxp46Bqz6arHJAOqUT8f/AH1z/pgsB
         +DHw==
X-Gm-Message-State: AOJu0YyOegYKLcC3mfZvQkH7PV4YfdNKK1wP1j8TTHORPtu7llIUh5uX
	m1OSbQBPxUmfaAY6vDACfC1Tcgcy5x2X4nrw7BcycjejWQ/CX/eLd8+/hKcEc7fEYKSXWE0NIsc
	=
X-Gm-Gg: ASbGnctZxc+9jgVMNwsxMnp55fgkzAW0fNcMA23a2ttdrllLMk/f3XgGQ9EpFj9FZrg
	gIH5XojdALAj+JtMcrwKnUEC6a8eAqPSjqCRBxhdweZvayROHS5EDCQ3o7NbJLgzu3lrL1zJwVk
	f/6OrDcUd7HaUvstijLayEdo7aM5ASgyujqV3H8A/yFk72CCAsfX+P6mqi+CbPDvT0xyuJa9NgK
	/yJaC8CxfG3oSPTKeolxvk4Gxf3gManecOqktGIjXLhbAKDyOg26hsmtU8/7JbwWMNU/xqInIo2
	wOaOruANpAiGfua7EgKXWP5FnHV/7EfGCgyVZtKJPREAKTRGZjRrgEAffqVQEQQMf6CmIChbB5G
	s
X-Google-Smtp-Source: AGHT+IHihczvoIXGJfjJMfSlrCjW2GvCHbT5w24tirZXoVH4RlueR8nqEW1Pfm5TUrSdqQNbeXA42Q==
X-Received: by 2002:a17:906:6a23:b0:ab6:de3a:351d with SMTP id a640c23a62f3a-ab6de3a358emr2081002466b.12.1738600045611;
        Mon, 03 Feb 2025 08:27:25 -0800 (PST)
Message-ID: <3abd753b-b1f2-499a-8c02-6b6d64a78a17@suse.com>
Date: Mon, 3 Feb 2025 17:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.20? 6/6] PCI: drop pci_segments_init()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
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
In-Reply-To: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Have callers invoke pci_add_segment() directly instead. On x86 move the
invocation back to acpi_mmcfg_init(), where it was prior to ????????????
("x86/PCI: init segments earlier").
---
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
@@ -402,6 +402,9 @@ void __init acpi_mmcfg_init(void)
 {
     bool valid = true;
 
+    if ( pci_add_segment(0) )
+        panic("Could not initialize PCI segment 0\n");
+
     /* MMCONFIG disabled */
     if ((pci_probe & PCI_PROBE_MMCONF) == 0)
         return;
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
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -55,8 +55,6 @@ void __init acpi_iommu_init(void)
 {
     int ret = -ENODEV;
 
-    pci_segments_init();
-
     if ( !iommu_enable && !iommu_intremap )
         return;
 
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


