Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A17A25FD3
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:24:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880791.1290891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezFb-0005wk-DG; Mon, 03 Feb 2025 16:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880791.1290891; Mon, 03 Feb 2025 16:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezFb-0005ti-9k; Mon, 03 Feb 2025 16:24:43 +0000
Received: by outflank-mailman (input) for mailman id 880791;
 Mon, 03 Feb 2025 16:24:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tezFZ-0005sg-Ro
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:24:41 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e46e26f-e24b-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 17:24:40 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ab6f636d821so683544066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:24:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e49ffe7asm784122466b.102.2025.02.03.08.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 08:24:39 -0800 (PST)
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
X-Inumbo-ID: 5e46e26f-e24b-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738599880; x=1739204680; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rghaj4ZjOzXehAiZ3WxOiVs5CufQM8CYuAaY5QdYnBc=;
        b=fRnM853FvnGvi7G9UHt83hQlmyrRvbyejTJmn/4uv8e3Tcn8Ku2Tk6QyRE2GUQZPCl
         ljy15TYiSyse5ZCpvwOMNt0LOyJqUjyOsUtn6FyC6fvU27iffWuZa3PoUSThmEgoq2s5
         jk5XPrWRsC+FFtvizLSkLvIb0DpfWJ9/CuKeC6uSjno+8vQZ/jLuKsrrodC+HTtp8wt8
         Lb72QiXIcT9zfAdru08RMsvt58QxP639JXDi80cjsqjnc206xKmEJBzO6jDJr2fh0pCU
         IsxCJunKRAni3aqGgNspHZlS8Jt120PhdQWDTJh6tTAGku7R6L670tXv7iZPz1tVwKeR
         0p1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738599880; x=1739204680;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rghaj4ZjOzXehAiZ3WxOiVs5CufQM8CYuAaY5QdYnBc=;
        b=ldkwDcXB2ajxES8Mru8I4Z1pWmpZITxoA+U9D8OMv3pqTnJ6v4zy1OEwZ6wI2K+h4h
         SCrzWuvretxUvgXg/FJqxX0JK9T44pyZ/bsYIo45STcGpcl4/QJ1JNPl5qVAov5oHUA6
         0ovvkRcOa3iLBaqMKNjSZcEcG4vD1ii8iLZeAHcpO1yk3wLTWKT08J3Mpy2FhJMRAd+J
         cK09u+yQK/7a3McQjm4ggOcuqs9uckU1vvkbUxX/iYOWPnFvFPuS9G0DnW4z0xsBmufw
         sJ7g6MWt57bkxZgoaLaonRXHyFm7CUg4URCFa2EoWRHEkxAfnNNe4f6P9zVB0X6+E2PO
         EdAg==
X-Gm-Message-State: AOJu0YydSNGlFxHkW8YYWGdz32pTjCM/FaypTYZaUs57ygtzjPfhmrus
	KdmCw03Z30psI4NNQXMtYohWYDBNIzkN1CqwckuwdLjDKzqD5sUadHLTeoih27mHFJkYSYtMT6U
	=
X-Gm-Gg: ASbGncs9mtB8EW1qbWW5yKqpVX63bnGrZzME4hAat5TsMf4uzV6eM+weFz8L+wFVaOa
	di6RU+7PRRIDCkqTZHjky4LAGwvGG0Hj/ecYU7Tj4If4Rut0IpibuG+UY+cfDFPaXrv47BKg0ze
	/razcSzQpItZ7omxF/qy/Wh12JTSX+eLcQwCCJax0skYNox2+aOQye6z40AU1QgOHJ2IHZJGaoL
	3KWshX5xvMU2VLkiE0Ls7RaFWJWzPyq6FTchk9y8PMLg8cDhV176jmWtXda82JFcU5gC3YI/pei
	38a5yOOcmMpsHKNQDq0UMQTsq908f9zIxgG2tROvhbDpLQtrd80unN9EcI/dSI/UjffBkA+y0sa
	f
X-Google-Smtp-Source: AGHT+IGVLHfKQRmGfk5y3XE5eEwO3CBkpHtHEm9iKGl7MXC6R8QbkMUPB9f8ZKa0VWCIKm/jvDRoZg==
X-Received: by 2002:a17:907:2d0e:b0:ab6:f68f:ea9a with SMTP id a640c23a62f3a-ab6f68febd4mr1758065866b.1.1738599879883;
        Mon, 03 Feb 2025 08:24:39 -0800 (PST)
Message-ID: <fc207c1d-80ae-49fb-96e0-ffa335510044@suse.com>
Date: Mon, 3 Feb 2025 17:24:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.20 2/6] x86/PCI: init segments earlier
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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

In order for amd_iommu_detect_one_acpi()'s call to pci_ro_device() to
have permanent effect, pci_segments_init() needs to be called ahead of
making it there. Without this we're losing segment 0's r/o map, and thus
we're losing write-protection of the PCI devices representing IOMMUs.
Which in turn means that half-way recent Linux Dom0 will, as it boots,
turn off MSI on these devices, thus preventing any IOMMU events (faults
in particular) from being reported on pre-x2APIC hardware.

As the acpi_iommu_init() invocation was moved ahead of
acpi_mmcfg_init()'s by the offending commit, move the call to
pci_segments_init() accordingly.

Fixes: 3950f2485bbc ("x86/x2APIC: defer probe until after IOMMU ACPI table parsing")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Tested-by: Jason Andryuk <jason.andryuk@amd.com>
---
Of course it would have been quite a bit easier to notice this issue if
radix_tree_insert() wouldn't work fine ahead of radix_tree_init() being
invoked for a given radix tree, when the index inserted at is 0.

While hunting down various other dead paths to actually find the root
cause, it occurred to me that it's probably not a good idea to fully
disallow config space writes for r/o devices: Dom0 won't be able to size
their BARs (luckily the IOMMU "devices" don't have any, but e.g. serial
ones generally will have at least one), for example. Without being able
to size BARs it also will likely be unable to correctly account for the
address space taken by these BARs. However, outside of vPCI it's not
really clear to me how we could reasonably emulate such BAR sizing
writes - we can't, after all, allow Dom0 to actually write to the
underlying physical registers, yet we don't intercept reads (i.e. we
can't mimic expected behavior then).

--- a/xen/arch/x86/x86_64/mmconfig-shared.c
+++ b/xen/arch/x86/x86_64/mmconfig-shared.c
@@ -402,8 +402,6 @@ void __init acpi_mmcfg_init(void)
 {
     bool valid = true;
 
-    pci_segments_init();
-
     /* MMCONFIG disabled */
     if ((pci_probe & PCI_PROBE_MMCONF) == 0)
         return;
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -55,6 +55,8 @@ void __init acpi_iommu_init(void)
 {
     int ret = -ENODEV;
 
+    pci_segments_init();
+
     if ( !iommu_enable && !iommu_intremap )
         return;
 


