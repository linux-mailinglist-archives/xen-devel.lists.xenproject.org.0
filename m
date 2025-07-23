Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 581E4B0F1C7
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 14:00:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053852.1422647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueY8g-0007Ft-AM; Wed, 23 Jul 2025 12:00:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053852.1422647; Wed, 23 Jul 2025 12:00:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueY8g-0007CE-7O; Wed, 23 Jul 2025 12:00:02 +0000
Received: by outflank-mailman (input) for mailman id 1053852;
 Wed, 23 Jul 2025 12:00:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueY8e-00077G-Op
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 12:00:00 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e296a3b-67bc-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 13:59:58 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a6e2d85705so3412487f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 04:59:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6d2a8dsm95524805ad.165.2025.07.23.04.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 04:59:57 -0700 (PDT)
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
X-Inumbo-ID: 8e296a3b-67bc-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753271998; x=1753876798; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkLtzKWTr7VWTz1c5nZAKZ9xc/t7FKu3CJQjNdsnyLE=;
        b=Q8ZUniuVna/bwcaYAWxI2VQMzohleAOtk7Cx7zn8giNRuVXbAR2yp3+t//Mhbcdwb8
         SmxFx9uO4tZK8xE0QyPf5TKXrauK5Wf/yuT86PovnpQ/1hWpy6zfVjbTb8rlRGSUBwsg
         K3S5PZiXlkuMp7BdhPlNmY1KbmDC19gBJ91bmtGKXx/W50nPIf9KlaS1cIvxaGPQUjfK
         F58tY+ZDAJymVe5E8PZ9v8Ie16aHSsVYHWo/z3FDAOduI+4mkAkJzD/4QIiPGN/qlAau
         5R4Qov67tF7+PiF+F7k2jsAruU4nujagI99uTh0AxDfkeKXMN/zImlcRtI0hVKY+EWie
         jJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753271998; x=1753876798;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QkLtzKWTr7VWTz1c5nZAKZ9xc/t7FKu3CJQjNdsnyLE=;
        b=Ibmd4RblIyR2aJjlleKYnyFzdRnXHH0T5wnGObel/jXvLjYsuIUoDHJwhe4rIgZ6dE
         E4BerG9TJKJGTITFHVBoqaM8Y2GNWCCHJex8kZIu/MJ62kCFgns+Q8pBpq43hAI9C0ku
         D1sBT6yJvR+eAUYjKgMHr4faX2VJ3dKR16N19cQdVN3V1wvmNJqsDFGHhRM6G77rkSoC
         vJbbVCSLi4DVgfq+IDxapK/uMqxS7zZKE8emuZDvdec0/bvJXGhTx1d5PZx2uolkoG3s
         a+kibEH6dKeu/93lT3horlawff1TTIjUkeBsc4uegQe0wnhRxHjyER2oo9NUpckeTdgO
         tHeQ==
X-Gm-Message-State: AOJu0YygpGJ6uv1PkB7l4lhdstm63m0/Rzsxjni/dhfqu+DVkvq6G5JO
	uK1I9tK5SZJqwGhWXkK42EJTMDQne3qJHCARgPhIX4aTmOlN7bzmu9k53Bzi3YtuunVCXWi0+OR
	Bo9Q=
X-Gm-Gg: ASbGncvVZ/r1teIThhWaW+nJe/eJxFsFcOOU1BY1qGhyVhRkOnsXnS4kf46Mmx391Fj
	vjVx4NkDSjZrjPZzG5ow0+Oyjc/HqThJcz9fcJprB+Ze1gpPfUwXkuUkmXyA5Vid1HSmr3pMarM
	c6l9VVCr2U5BmHrWUp+GvkPNdjFnUzzE3VZram1ZhQkmoh2xIk1wm80BPIm/Rglambvt/wt2gpa
	acn3xd76jE+Mvgiwh79d2SGpHM6ljA0PiVFPozZgqGmtOJ7Z0xlSDY4f2Af2dgpw+kXv+ew4mf3
	5R+7Qj0fMS7L43Xa24vczUk8a6UOxfYEGqpAURMOYomoM/ojJ88djoYBwlA2Jciu6oKr+bVgLFz
	RrOWnpv2KdKzJp4kyFZVOF0Lwe5SCaae5+6NzyRRskR/rkTlCiSAqcPp4vzHhEmJPXa02lMtEMC
	8LSaHeYoI=
X-Google-Smtp-Source: AGHT+IFHEyJwBGDuggbqZ288KRxe48fdG3kRxMAUNOT/bRX/AuhrCAW6M52syirj8asMPXL/3v4RXw==
X-Received: by 2002:a05:6000:2389:b0:3aa:34f4:d437 with SMTP id ffacd0b85a97d-3b768ef9577mr2042851f8f.37.1753271997983;
        Wed, 23 Jul 2025 04:59:57 -0700 (PDT)
Message-ID: <4897cfe9-f5d5-4ab6-a29c-cda32ab56122@suse.com>
Date: Wed, 23 Jul 2025 13:59:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/pmstat: drop struct px_stat's usable field
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

Its initial calculation in cpufreq_statistic_init() is entirely unused,
as do_get_pm_info() recalculates it before use. That re-calculation can
then be done right where the output field is set, eliminating the need
for the internal field. In turn the struct pointer there can then be
constified.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -144,7 +144,6 @@ int cpufreq_statistic_init(unsigned int
     }
 
     pxpt->u.total = count;
-    pxpt->u.usable = count - pmpt->perf.platform_limit;
 
     for ( i = 0; i < count; i++ )
         pxpt->u.pt[i].freq = pmpt->perf.states[i].core_frequency;
@@ -257,7 +256,7 @@ int do_get_pm_info(struct xen_sysctl_get
     case PMSTAT_get_pxstat:
     {
         uint32_t ct;
-        struct pm_px *pxpt;
+        const struct pm_px *pxpt;
         spinlock_t *cpufreq_statistic_lock = 
                    &per_cpu(cpufreq_statistic_lock, op->cpuid);
 
@@ -270,8 +269,6 @@ int do_get_pm_info(struct xen_sysctl_get
             return -ENODATA;
         }
 
-        pxpt->u.usable = pmpt->perf.state_count - pmpt->perf.platform_limit;
-
         cpufreq_residency_update(op->cpuid, pxpt->u.cur);
 
         /*
@@ -296,7 +293,7 @@ int do_get_pm_info(struct xen_sysctl_get
         }
 
         op->u.getpx.total = pxpt->u.total;
-        op->u.getpx.usable = pxpt->u.usable;
+        op->u.getpx.usable = pmpt->perf.state_count - pmpt->perf.platform_limit;
         op->u.getpx.last = pxpt->u.last;
         op->u.getpx.cur = pxpt->u.cur;
 
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -51,7 +51,6 @@ extern struct processor_pminfo *processo
 
 struct px_stat {
     uint8_t total;        /* total Px states */
-    uint8_t usable;       /* usable Px states */
     uint8_t last;         /* last Px state */
     uint8_t cur;          /* current Px state */
     uint64_t *trans_pt;   /* Px transition table */

