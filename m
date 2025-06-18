Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49D8ADE91D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 12:35:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019046.1395908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRq8p-00076B-7E; Wed, 18 Jun 2025 10:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019046.1395908; Wed, 18 Jun 2025 10:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRq8p-00073U-46; Wed, 18 Jun 2025 10:35:39 +0000
Received: by outflank-mailman (input) for mailman id 1019046;
 Wed, 18 Jun 2025 10:35:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRq8m-00073O-TX
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 10:35:36 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f77e423a-4c2f-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 12:35:35 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so4705820f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 03:35:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365deb87ddsm96601295ad.177.2025.06.18.03.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 03:35:33 -0700 (PDT)
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
X-Inumbo-ID: f77e423a-4c2f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750242934; x=1750847734; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xkeOw2RFxhc3i1l1Ye9F1X5bFVCvJghO+E1EtWrnr0=;
        b=UEhlQdeznWyUkByUcBrLdaoGntbUyifbK/EF2CQs52itrc1Pgtm8fstsXawzyfoHOR
         dzq3JlxXJTZXJrl93gdZ+GPPnmR4yp8vpJst4t2eX/Vi8Ts5O2/oZikjPN5IYXkAcZki
         huf+wGec1iALOWg4EiIdSyYOy/bniAbFXAfnML3uFmAXrQP0tE49IuobtU1G33Swz54Z
         zZK6AfSFlNevtpUofPAuyvFCiyB140sKC5fKxtFceuI1ew2gFJgTI/pzDwrupBn+FUhg
         Y73lW31CaGYN5u6WGONdYqZgoY5XgOcn7pUEfjCyt+zLycisM5hbhdFs1olL0Mhp2uKG
         nLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750242934; x=1750847734;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8xkeOw2RFxhc3i1l1Ye9F1X5bFVCvJghO+E1EtWrnr0=;
        b=oAeWB+QYwItptoaP/HjB6Yhjc9nr/4XibACRtQTcm40PopFsOYIGt6uaFGH71XXWX/
         tPG7yGJsnEIJIYzbIMMgqU1lyAmIFvTyzEDF1Gs2xZfYXAwOwf+12Hyw6KnMAjif71qH
         Wy/wVbImSjSHM9e/3YKEsRPQFBfhXDhu4JD4yK6vWTKifb/0Prq8FgZUZRDs51x5G78s
         pDKw0LKCwM+PxxEtOEhDWlJS1fhsWhapAS02tym9bU2no9DuaAem+T1PFSeUxMro4wz7
         ib8Q26UAlcOBHpA7LRtTjr6NVIEaNVD8upTMqIQfgrzM4VIrQqu4LTHqXAvvRDwLxlmq
         dPdA==
X-Gm-Message-State: AOJu0YwsEQ84lpikRUJ3m/4+b29DLolMKyvvS1BBirqBQ6Q2R+dY6Zz+
	TFFJnzI9DA5PLeco4WiYb/hTFOJEvAOA1xEliBvE8HcqsI0B9yMJUrhMv3p3kUP7yqZaYeJUDT3
	jjJo=
X-Gm-Gg: ASbGncueCVPquezKI1U8i7vkDCN1P6LI1ryhuGbPuZfdQqfsd1Vk2z4dtPtlh9nUf5O
	wYxN+i4UnvMnQyXWN05Cxu26+EzP5g+PksRQs0D8mH6krh4oGqWftr4EA8xOXVm5lJfLnap8qOi
	JuYaHvUUErCNTQeeXsdzJfkVKMYRdwkwiOmuUTzaW4GRkBMiPVkK/t1jI2EebByT5QT/ZYaZoNU
	tNRi7d0F0+L00D8tb0tOKIoeRcLx9Gf+mBLTiOqSvyT2z+DXZ6ek+RqE60vDspo13Iyzxxj5k82
	wp0HCaAoniyxtV0y4xl7DIJpMDX2DBBhdvQKn+DQe0E6yAtAppWbzcBRPp76iWWM2ubcMexGE2w
	HcN0hUrVfPVlgr2jocAbyj5DHOExJD3uLfQ53wFrAfaw19CA=
X-Google-Smtp-Source: AGHT+IGxUaKuUNhO2EryXxYcTI4kA1LbTs4SK+Bwop9pRfn379NzQawiHDXKUjYCMsHBETpduKXMCw==
X-Received: by 2002:a05:6000:2dc4:b0:3a5:2b1d:7889 with SMTP id ffacd0b85a97d-3a5723af48amr14570188f8f.43.1750242934358;
        Wed, 18 Jun 2025 03:35:34 -0700 (PDT)
Message-ID: <2e354a84-2277-4a7f-8291-3f19526d645a@suse.com>
Date: Wed, 18 Jun 2025 12:35:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Penny Zheng <Penny.Zheng@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/pmstat: restore changes lost by "consolidation"
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

Both c6e0a5539623 ("cpufreq: use existing local var in
cpufreq_statistic_init()") and a1ce987411f6 ("cpufreq: don't leave stale
statistics pointer") were lost in the course of "moving" the code,
presumably due to overly lax re-basing.

Fixes: bf0cd071db2a ("xen/pmstat: consolidate code into pmstat.c")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -124,7 +124,6 @@ int cpufreq_statistic_init(unsigned int
         spin_unlock(cpufreq_statistic_lock);
         return -ENOMEM;
     }
-    per_cpu(cpufreq_statistic_data, cpu) = pxpt;
 
     pxpt->u.trans_pt = xzalloc_array(uint64_t, count * count);
     if ( !pxpt->u.trans_pt )
@@ -143,15 +142,17 @@ int cpufreq_statistic_init(unsigned int
         return -ENOMEM;
     }
 
-    pxpt->u.total = pmpt->perf.state_count;
-    pxpt->u.usable = pmpt->perf.state_count - pmpt->perf.platform_limit;
+    pxpt->u.total = count;
+    pxpt->u.usable = count - pmpt->perf.platform_limit;
 
-    for ( i = 0; i < pmpt->perf.state_count; i++ )
+    for ( i = 0; i < count; i++ )
         pxpt->u.pt[i].freq = pmpt->perf.states[i].core_frequency;
 
     pxpt->prev_state_wall = NOW();
     pxpt->prev_idle_wall = get_cpu_idle_time(cpu);
 
+    per_cpu(cpufreq_statistic_data, cpu) = pxpt;
+
     spin_unlock(cpufreq_statistic_lock);
 
     return 0;

