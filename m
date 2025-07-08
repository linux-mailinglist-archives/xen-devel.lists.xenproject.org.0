Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AD3AFCB1D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 14:58:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036452.1408690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7tr-0004XL-JO; Tue, 08 Jul 2025 12:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036452.1408690; Tue, 08 Jul 2025 12:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7tr-0004Vk-Gk; Tue, 08 Jul 2025 12:58:19 +0000
Received: by outflank-mailman (input) for mailman id 1036452;
 Tue, 08 Jul 2025 12:58:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ7tp-0004VF-Vk
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 12:58:17 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36917b66-5bfb-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 14:58:16 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4535fbe0299so25664325e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 05:58:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c84351a5esm114342725ad.55.2025.07.08.05.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 05:58:14 -0700 (PDT)
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
X-Inumbo-ID: 36917b66-5bfb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751979495; x=1752584295; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=npJFDftosWcSQ3LvQtMp39FVIBuOvKCEvlmv7+JO68A=;
        b=EITnCUrL3oyx7sDOOGzuFajua7JQbMJm/zVd5bloN7617osaiIeis8HKlebKZSFwqD
         k7HJzorcP9Qie+X7tbCflG98mygrgAo1g4KTx/U3Q2gNejgpUC9XoR/WJvzwPkZGmikn
         XhZPbdc0tFDu4YiWOvXpZQN+1XEPzqmsbj6la3/oy1ze3gQp5o5EmyrMPfpynYAE+b/J
         9WyQc1eA8yJANHGQrDW396IJpbb5iHqqhdYTN1lnqdYb753sybQ4dOcw9YgVx7tJjzX4
         DN37RcolEHTd0/YCnCmlw1T+D+l7zhAw6ObVMEaybOoTbowozEUqczk0nptIAXcV+uPR
         uviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751979495; x=1752584295;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=npJFDftosWcSQ3LvQtMp39FVIBuOvKCEvlmv7+JO68A=;
        b=cx95reUwsPJJ7mbLimWtKsgkjjjJ2qvA83JPujBlsDb28J9c9dQ5XyITNuHXTIvftp
         LA07hRQWESdssB57kWaNMggxuBwHrGEf0DUjMKg/SUbo6APKnPOGOQzxl4FIeAIwzmQS
         XQqGU3aY64Y2hVIYkVlIQHkLyx0O1ig1Sze7QoWGwIlZsaCAsUewLqM/slIOqyxco32K
         yOKZf3KGmo+DNQAjEDjp0r54ZmyAgQ3OhMHOockPBVEd13+aGOvVY+5QjkS3Xl5a7C2B
         YhYwdhEhzIDMRaZk33c9CPqOKxU7HugGFDwPEmD76r1pTauoHoQo1OsKLy5mFpNiScJh
         pEYQ==
X-Gm-Message-State: AOJu0YzRSCNskWClLQWgxz2TFJxVsgbsYQZWbkiBx1VpgqdofCtlNaRv
	QQANn2JwVAo3sgpVOWW0ZbQ/DEHZr7KA1QRc2+AJxFeGAo36hXcDInd6LO5PhP6D8qJIkCdkPeP
	hCVU=
X-Gm-Gg: ASbGncuLIjXVE11lzTcMstSFKWXQVEp5OETQAicdxcZKnsQGizcQp4eqdQloGeu7rCN
	hgiuPvEP6OMqZ7Fj1qVJv05Gl0328F9HMvZGofYHAZG+upw4HCgzj9SjGtkfAEtiaA3uUiPxYfe
	sZ22OvaN/2lVuIyU6OX+Giy1ITpFNDCCvwgQg1rCL3s2rd1JdtnFdtkW3s4/T9uoTrbIEAymE/V
	8d2tLkd02tUxhf4DS99TubdGT3/X1iHq0Pl6S6bZ3Z+xlCGsu9IGj+YbbYbpwrmNRRK9qQ5aBik
	8GIBLAY68IXs3PuqE/KwYEbMa/fDQ0tGsTPC6FAiL6bvZXncaOKiy4l23KCBJ5cMIfEHoX7PZtA
	nFAgzjElfihjRCn9rah+t79bmvy9rnETTxwuBsg+OwPV3eYa/1NKEJ7B6Tw==
X-Google-Smtp-Source: AGHT+IGGXL6tloOBz7FxAxnmyzWv+48i6RktNPoMzJSAb9G34DPcVBYQIe2yj1d6JiH+dpTu+YP1ZA==
X-Received: by 2002:a05:6000:22c3:b0:3a4:eb92:b5eb with SMTP id ffacd0b85a97d-3b4964ea6c0mr12466454f8f.50.1751979495228;
        Tue, 08 Jul 2025 05:58:15 -0700 (PDT)
Message-ID: <350a2bcf-c6fa-49cf-9df5-ffe799fb8b82@suse.com>
Date: Tue, 8 Jul 2025 14:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/9] x86/mwait-idle: add Emerald Rapids Xeon support
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1df49875-99b8-4302-aed7-5a75dbdd85ca@suse.com>
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
In-Reply-To: <1df49875-99b8-4302-aed7-5a75dbdd85ca@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Emerald Rapids (EMR) is the next Intel Xeon processor after Sapphire
Rapids (SPR).

EMR C-states are the same as SPR C-states, and we expect that EMR
C-state characteristics (latency and target residency) will be the
same as in SPR. Therefore, add EMR support by using SPR C-states table.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 74528edfbc66
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1188,6 +1188,7 @@ static const struct x86_cpu_id intel_idl
 	ICPU(ALDERLAKE_L,		adl_l),
 	ICPU(ATOM_GRACEMONT,		gmt),
 	ICPU(SAPPHIRERAPIDS_X,		spr),
+	ICPU(EMERALDRAPIDS_X,		spr),
 	ICPU(ATOM_GOLDMONT,		bxt),
 	ICPU(ATOM_GOLDMONT_PLUS,	bxt),
 	ICPU(ATOM_GOLDMONT_D,		dnv),
@@ -1421,6 +1422,7 @@ static void __init mwait_idle_state_tabl
 		skx_idle_state_table_update();
 		break;
 	case INTEL_FAM6_SAPPHIRERAPIDS_X:
+	case INTEL_FAM6_EMERALDRAPIDS_X:
 		spr_idle_state_table_update();
 		break;
 	case INTEL_FAM6_ALDERLAKE:


