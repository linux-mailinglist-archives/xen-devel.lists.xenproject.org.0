Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B33F3C8934D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 11:14:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172476.1497548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOCWw-00027X-2s; Wed, 26 Nov 2025 10:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172476.1497548; Wed, 26 Nov 2025 10:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOCWv-000262-WF; Wed, 26 Nov 2025 10:13:46 +0000
Received: by outflank-mailman (input) for mailman id 1172476;
 Wed, 26 Nov 2025 10:13:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOCWu-00024s-Gq
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 10:13:44 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 946a8d2d-cab0-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 11:13:40 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so45855095e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 02:13:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47905302ef1sm36518255e9.16.2025.11.26.02.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 02:13:39 -0800 (PST)
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
X-Inumbo-ID: 946a8d2d-cab0-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764152020; x=1764756820; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0vgm+o7qWC1XeVXe1SxdEPrcMN0iYRL6RStXgNpRsg=;
        b=LRPwtJxtP+DnHkS1ussWEMW1k5mYWGos5/bsaBi/3MTa3d9j0XxxQzT/vrWPs7NEk/
         59jzQ943fqM3QxoEkAPg01dfugBr4Y5lGS2afGOe4WC/5lTWouV1f2amUPwC9v49GN15
         eFr0ezr/IQz0bNWZtZwX6SRCIIrK68JzBCK4qLbDOESCX6Mz5hzduDxk2VwdwLnfFfB8
         3PaPAOZedep9wO78mKAlfojlY5OOG8p/2QkByp18EKdFJKbrwfg7g38ZPloe7PwYEebC
         7ka4gtUCyD/juFfl1TxqyfAsFEdEivG+QcUx39k6e/v2LnhSlSjstrHnRZxZjzXYlfqw
         Dn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764152020; x=1764756820;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N0vgm+o7qWC1XeVXe1SxdEPrcMN0iYRL6RStXgNpRsg=;
        b=EbINLWizJLvuDdEVEPSjwTY22lLJmXtPdqLqIf9A8IBnGQ5b2I7eX+w4JbkiFmIBAP
         u5a/nn9Jo/JQLGepxgDgLMKWW0PhzrI+cMC0CLCJ6NXuMyqQmDFnvuWFGHxANA6uPQk7
         suYl1iPAL62OPK0gKyZshKGPCe6PtmF93eDaB9EAhIUpFynmToI/XiEbpv+6tKOVkUl/
         7ipSdMSS/o9QkWdaf3fnYXu09J6++4wsaG0oNzSSQRpsR9HF9NuMtcorzGYuui67j6ZL
         c0xtaSmcKLvrIQbNZQCAZHY6K/MW0mIM1vgZqePmksel819zx/Jtga/6t4aqPtrjVogp
         Yv6w==
X-Gm-Message-State: AOJu0YzIkidpP9tHBhBRmpTEgEsNbGeVrq/eF+bGTs3BOJtPxuwimeGD
	i6e/OVomjv0VlKESOwv0YXmxGrlbpjK1QhA2ac93RIcR3qdCL4/0L9cOpHjIRyykSSjU5Uu2Uka
	5kHk=
X-Gm-Gg: ASbGncv20kwYwHKiRR3srk1qBxAycAlHU/vCzLzfHNppjuu5g70XdyJOzrs7YKLoGGy
	KIZzD4JTdlZ6lo78fEwUa2flNAdgI6VPU38eEuHsoIOSsxv639+PIpT8QP/sqoW2o0zDQgklMdI
	F8JVqCg6ypelWXRxWYcKdsF2/+8hlP7P+DE0qPTPgJuSe+OR4rqECxfuOwq0PRf2roNzQTEA5Xj
	Pt1vpiURPRb0ueePyoVtWl/Em55PM1JlCuh6KSCJctyogu3DKasEzqbp1eebQ2Pqim+l+9d1BWA
	ZIUwhdT8tgzZrhoGhOfZ5Ig3/e7saGDvDo4m0BL3xY0wYYCzvU7ruY9LFbusvCgU87HYVRdLUkp
	FCaHVKj3i2bQdJQnZJ1Osy08pu6CrHwJTBFkqAJ01mZjy4HwdVbJr90z982ReUNMv90j3N/pCfe
	vRJsl0F4OSgcPKjaGxCQjxhJQtbYZT///Evfk7M903Hjvf5BDWMqaP4GBSg0p8LbHmehSLap9ct
	PI=
X-Google-Smtp-Source: AGHT+IGaDRZ9yaaTE6nHBcyf5iWoyOVpAwKXbl6GlpDFW4QfoZEIcSS2zuj5gpRyNA3DbmrhUXkmGg==
X-Received: by 2002:a05:600c:4fce:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-47904b2bff2mr55335455e9.35.1764152019674;
        Wed, 26 Nov 2025 02:13:39 -0800 (PST)
Message-ID: <bea22906-5805-4fad-b73a-fb2e3a8da807@suse.com>
Date: Wed, 26 Nov 2025 11:13:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] domain: add barrier in vcpu_create()
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

The lock-less list updating isn't safe against racing for_each_vcpu(),
unless done (by hardware) in exactly the order written.

Fixes: 3037c5a2cb82 ("arm: domain")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The Fixes: tag is pretty arbitrary; the issue was becoming non-latent when
Arm support was added. (Strictly speaking IA-64 and PPC would have been
affected too afaict, just that now that doesn't matter anymore [or, for
PPC, not yet, seeing that its support is being re-built from scratch].)

I'm not quite happy about prev_id being plain int, but changing it to
unsigned (with suitable other adjustments) actually makes gcc15 generate
worse code on x86.

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -464,6 +464,7 @@ struct vcpu *vcpu_create(struct domain *
             prev_id--;
         BUG_ON(prev_id < 0);
         v->next_in_list = d->vcpu[prev_id]->next_in_list;
+        smp_wmb();
         d->vcpu[prev_id]->next_in_list = v;
     }
 

