Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5452BB1A093
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 13:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069121.1432959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uitNH-0004Gh-LU; Mon, 04 Aug 2025 11:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069121.1432959; Mon, 04 Aug 2025 11:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uitNH-0004EH-If; Mon, 04 Aug 2025 11:29:03 +0000
Received: by outflank-mailman (input) for mailman id 1069121;
 Mon, 04 Aug 2025 11:29:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uitNF-0004Dv-Gf
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 11:29:01 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37118024-7126-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 13:28:59 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-61557997574so6436142a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 04:28:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe77cfsm6796126a12.42.2025.08.04.04.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 04:28:57 -0700 (PDT)
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
X-Inumbo-ID: 37118024-7126-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754306939; x=1754911739; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tQDWXUl/GGUvwCEmhBVfJ90ztk2vRfzUXGib0Q+gbg=;
        b=cetFKnwoYrcJIGV+jUlCxNOVpXd85RTfD4wAjdylpfTB4V7ul1e9xDNZC1xJy6BFQR
         DaIhgMFvOXdzHUE6C61LlSndSz7hjtnTP0ZZc+9CczeCNKrC0UaswLwmK3uGLmBeKwRc
         cCSBc2bBCnfLgBBaIvkLKYJJXeOy5xPoEpztG51d6/Qk8ozyEfieTeBBUIhIMtphd/z4
         rZQHIFQhybPwg6trfHScvgASMZCBkjSYzlPgKHbPcWBMkdKmPYDNIHJ9h6/4LWK9v9gA
         YIcLgz5cJ9kqXqFvQRk6UOLOWsbb12iWvYFsyHVMe2f02ECeeJRhhAIHE1WPTemus5VB
         Hklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754306939; x=1754911739;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4tQDWXUl/GGUvwCEmhBVfJ90ztk2vRfzUXGib0Q+gbg=;
        b=deLW5luLU72JIoncrve4a7W/YC6PByR8PrSLGYpdUYg3v4HI2o01cHT99In5ooZprX
         npewE1znuIG/P/HMNAi5ChKMD5Eme5MLC6yfP12d3r5391tPcJ7s8QDa8Oo+mPl1NPPP
         NNdPdyvKquijFi53f1C0mgJ8nro5ZVl+Mbm3Mk5afq5wRCoNwnUz1KKAIv31mnmQj2Id
         hvd9CbXID1O4+U5wX48xz5HhFTkRApWhDTiSZHL9bmm6Rt7ubTsIwuRcf8ZmgvRFmhwf
         DOpoPm99PhonobmGc8+2TFwpyfEYOs3mTLMvAFPGPBzjEdG3XSU+c4rOXGQlJGJyKCTj
         fKZA==
X-Gm-Message-State: AOJu0YywUVH3IFOQr8alH2ol79olLpIRjWzvxVfcg+k18Lm3YiyDCLbZ
	0RUpHGnZWHwNVyMGEQle2MjUplFPs/W6W/t+Iak9xvB9W1wPhRMHSI+LiL7ImjFQgHJTI2qexiW
	SxrA=
X-Gm-Gg: ASbGncvfBs8zHHQ8zZNM08XRiNMmZmcK6N8S3WbAHCqzLNCFc+W5SEi+b3sGxICcx9L
	xcCAZA0iyzp60rHcXV87Lej7xYwix38wrNbPsl0vnIrbgvynoGnVe+VdQxGCoFXtq2eXBbf/WSK
	w9ZkdtG0BsQSjDvf0J3E6xcgx7rEqORRkuZ1p1FRNX1lDZ3s9vexnVBbQ1yv2JwWfKrPocAuVik
	x9iEPCOhqcHJ9NZqBukIi+3RgwMP6tVJSecrTHTYYVw+/dsw1lDGrGGXl9+iM8uTbYSKo9QMNSd
	hYT0Q/gF/ZZG3+ux4dsTrB7elHKx5zRxte6QBwop2+Rvai8QnqhG3Z41Nz6sRNKBoJWwGeKJgkA
	jid9gN1l3NsWaESSDU/VSR09Gr6B65WIJMGQzM3HGQ2JXly/vccgsy94FtsNpAycXzMtYc/D6Wf
	S4je/2DyevlGWw1qbppQ==
X-Google-Smtp-Source: AGHT+IGPpsnKx/zspjBOkezE2xrWpZCzUKKHIyv8n2GXqG5L/naHwtmxgFiaDyA9lkyd5Uudp9FTTA==
X-Received: by 2002:a05:6402:274c:b0:615:539b:7acf with SMTP id 4fb4d7f45d1cf-615e6eb694bmr7184812a12.2.1754306938220;
        Mon, 04 Aug 2025 04:28:58 -0700 (PDT)
Message-ID: <df6ce908-4c8e-4ac0-b663-95772d6ff9c9@suse.com>
Date: Mon, 4 Aug 2025 13:28:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/CPU: extend is_forced_cpu_cap()'s "reach"
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

"cpuid=no-rdrand" cannot actually be used to suppress the respective
boot warning on certain AMD hardware. That's because cleared_caps[] are
only applied after the ->c_init() hooks ran, i.e. cpu_has() still
returns true in init_amd().

Fixes: 93401e28a84b ("x86: clear RDRAND CPUID bit on AMD family 15h/16h")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: It's not clear whether doing it this way is actually a good idea;
     it may need to be two of the three call sites to be amended by a
     new is_cleared_cpu_cap().

Also relevant to "x86/AMD: disable RDSEED on Fam17 model 47 stepping 0".

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -108,7 +108,7 @@ void __init setup_force_cpu_cap(unsigned
 
 bool __init is_forced_cpu_cap(unsigned int cap)
 {
-	return test_bit(cap, forced_caps);
+	return test_bit(cap, forced_caps) || test_bit(cap, cleared_caps);
 }
 
 static void cf_check default_init(struct cpuinfo_x86 * c)

