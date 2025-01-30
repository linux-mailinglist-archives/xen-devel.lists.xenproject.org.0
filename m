Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8673A22C53
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 12:12:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879484.1289694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdSTL-0004O4-6a; Thu, 30 Jan 2025 11:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879484.1289694; Thu, 30 Jan 2025 11:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdSTL-0004MH-2K; Thu, 30 Jan 2025 11:12:35 +0000
Received: by outflank-mailman (input) for mailman id 879484;
 Thu, 30 Jan 2025 11:12:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdSTJ-0004Eh-BP
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 11:12:33 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a06b5c8-defb-11ef-a0e6-8be0dac302b0;
 Thu, 30 Jan 2025 12:12:32 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5dbfab8a2b0so1292027a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 03:12:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc723efc45sm889777a12.32.2025.01.30.03.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 03:12:31 -0800 (PST)
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
X-Inumbo-ID: 1a06b5c8-defb-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738235552; x=1738840352; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=203/lJVcbBuSiBOTZslr+MFpCzEbnnZrAdk7fuxdPb4=;
        b=OFRAeVTNsraLQIm+bh5zg0AIJY9e/e2fmIk8EQH0q43YrtVrH2uOcya/WPSsQzV4Ze
         gL52OATTt7gFrC9Fprcwc65MwKBo+hBeV/5H/6rTxfuBso+rj6/VlP+qDQZ66Y5CcCAE
         hsvOXrCkEMChHvNhjI14NpaAZo2BgXY5tiwtbbU2KH5PI6B35GhzGoydm24mX20q4Moh
         3gYN10FL1ZAxf1atGA2fn+zW5QCAnOBQObtwUmo3Fiw6iU+uqyVs6N0hLUBMLV1CSq/o
         eqMtpZxsRgAvPfbxTJZOtkcyMQW1IPTqxi7EMYBG3Hk1xiHRi6fJ37LENC9+u0a2iPSD
         Bz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738235552; x=1738840352;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=203/lJVcbBuSiBOTZslr+MFpCzEbnnZrAdk7fuxdPb4=;
        b=Zks/y7fL5H9Zf6hmqQPdG+mDLDlDZ2SMvLzTGCTvDzlkyA6Ok6GReFOjeG8y9HM6+p
         +cH1/FBVflbr9vFMWqFdQF2i5vxWrtEQlveQqEUhVcJPK0BmYDKjVixXFMc0a8sRoYv/
         8QZQjIpa26APYsparv98fYeGzE16k13EYEO0mO7Vgj3K6qPWenZ2hM/jYHIeifM8e++Q
         hDGRVpE2lkKD5ks8HoAu/Xkf8eiYNgW/ihhHEyeV8dS07zbYHpOIZXsm5Smw7nBVrQKv
         eN/7nD1dqGgoB2MSYUVZZATnqZ0Rz8WqKuyc3KA+zdxg8JgKRplwz74Cx8pFRHp40Bd9
         S4uw==
X-Gm-Message-State: AOJu0YxNH17Gp8/nCusUf6Fxdj0tzppNC4EAXNzWfMSjCYyeL/8iU0YK
	bNviCrIwJWIdwbL19rkfsiBoum+K+XqLEfFrDwp6Ezl21QkR3Q8r6o2lqRv8q4WytOELUP/DT+U
	=
X-Gm-Gg: ASbGncuhjGuGdZx1aloXAhxzQV+WO4Bf8guKlTXvtk9U7cMAuiQrbaK6E+bsEojyz3I
	YW6jeDjOkZrA80KZhv3G/nvwjPpQVJhS1odJ0fDCvpE8ShTM6871yfIQoeuVZgH1oowqYhjHWBY
	OXCf4O6pRM7QKLsrW8cuLySEvfPQE5RgSZygfvI9KM4Y9xkJfY8txbBQQPn//M+gbnXpWhYqxMe
	PTyeIoLGTTI+jsfhJAquVjJIwVUk1Ipr6uU6Lpt9Tp2noHsJRdFLo/elcV9hdY+QXSa/AGqt4hJ
	xnN0Ydn3coNbs2cZ5ZHrfPs8hOae1fDRC2pBztn/WFbx6HdznS9ZVbymOsVvfjxDfWQiKPBbsf/
	V
X-Google-Smtp-Source: AGHT+IGudiXusSP2uHk+VdJeM7vMvtwwfZHKTitaJdmZMgsqHjKiyq6vHxtlyr40vNZ9sUkp2r6mNg==
X-Received: by 2002:a05:6402:5109:b0:5dc:5a34:1296 with SMTP id 4fb4d7f45d1cf-5dc5efc5e1amr5442094a12.16.1738235552204;
        Thu, 30 Jan 2025 03:12:32 -0800 (PST)
Message-ID: <940ccd1b-9ad8-4b68-a035-36f45326872b@suse.com>
Date: Thu, 30 Jan 2025 12:12:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.20 2/3] x86/PCI: init segments earlier
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
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
In-Reply-To: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
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
 


