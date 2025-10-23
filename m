Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD449C023FB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149416.1481078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxba-0006aI-A5; Thu, 23 Oct 2025 15:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149416.1481078; Thu, 23 Oct 2025 15:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxba-0006Xi-6w; Thu, 23 Oct 2025 15:51:58 +0000
Received: by outflank-mailman (input) for mailman id 1149416;
 Thu, 23 Oct 2025 15:51:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBxbZ-0003ZG-Nc
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:51:57 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 336534cc-b028-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 17:51:55 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46fcf9f63b6so5940215e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 08:51:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-474949dd479sm67938045e9.0.2025.10.23.08.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 08:51:54 -0700 (PDT)
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
X-Inumbo-ID: 336534cc-b028-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761234715; x=1761839515; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+mHbAOKYHQAzDXnfae+5y/OBfyT/X7+SHGVm0yj/ZMY=;
        b=C5ML9nQ1XjcoZQ0ofrSnVDoYqzHb7TSd6mF1LLpNXfJqT8VpjoQsv39xNa4FOu0jFG
         WvLVMzPhKU+3zTLbtd11GRqyG9BVYdQuDv6vvi5SiXiyLMjYQDDRHerw3loSZpGPpMsJ
         FJp3ol8coinYfmAw+YcN8/YELJEs5atbg5C/vuQiVZjyyKDC9h0jzA+oGDqnGlHbJh0x
         bg29899PgSoRVfRgFYx+JWZWMrxOXaevhFZYFTxPS2jU0906Y5HiqOU8vG9pTUkEZW+F
         3QVF+r1OyHrHTadu+2dV2ZfKDs2A6g66ej2pw38EOwXJUQnr/0y6O+Z0xkiPgd3PngMJ
         MSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234715; x=1761839515;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mHbAOKYHQAzDXnfae+5y/OBfyT/X7+SHGVm0yj/ZMY=;
        b=WrNlX9Oonw7J+5FlffNYC/QTOzlinDG5ZPRUheIZcA7GUlwA2QkV27soGjt+/S7luA
         g5zEa3JPfisVLaMS/D3p3YtSfdxI7JVhX2ssqMqvYtD4jITzE2xJGyc1ZOk1YKnhsRnZ
         G9B0ZITwnGV3nru66kasPsp7z2OQQLgtqZi7h9BgB4jBFMMvzZVVSg6WZHS3bhr5GcgQ
         DsN4MYGSNCcKbprKNfDlX2O7U599/QFTS5newkjnff/8ZLfg/hotCY52yik8fHBUFBWo
         zkor/KItOB5EKTsNkZQOb+XdTWOhhvLfkLfrmeJSwPmS3xYuUGq5YTuQVGhzwotHUlnT
         iWZQ==
X-Gm-Message-State: AOJu0Yw/VqXeAuT2vuxBJZJa4iirMalMhI28Gg3dI4b7Uij1IZOBabdi
	qvmCQ58sMF2+y/FEuSJUke+reKs8rY91ulblOpyIKFvc88Lni1LpxX5dK4sJS9Zs7dhqP3XgEwE
	3034=
X-Gm-Gg: ASbGncu/E7dJR5LBQlK/Txb2nkFT1xAOLbrZMn2Bj+ZVoDnCNh9GDHpJtnsZLwiZrfU
	70H8HLbDSyWukF2D3OK45ySuoYC6S5k2t6q1/tT4eL1KcvFX/NQvHHmaC3g6A3iXqnXI+cwPc6r
	TSxEKv12cg72WAG4PTuEqaQMwDwVpmGHPbqSJ0jlHBm1ha/H6e9RBy6lBEuU4rXsgJuScr4nIjX
	2fzmc05XlXdKa87La31JSJCgZih6QS7uf0XhkAJsJWC4ujbKgqLchzjMitawhV8YayE9lDQfHqZ
	D+XFW2+t1mh0FJTxEIknO9e4iQSWgrTmq1a9AwMNpjul1++cfXRQbL8FBVzkO4g1FKyn1/2stOm
	0vHTrYa7X6a3VuagXylNDHhgLlPngUvK69mnXkhaNuJAM0HNeX+2f2hIVDTUwqDoinV2X1zvvLO
	bh4Mm/+pWYJKXS/OZkgFdo/N5Qi0M4AycHOFN6PeA4Srls7AAk3kUvR73qUIs5+oo23T2iP/o=
X-Google-Smtp-Source: AGHT+IH25LbB6uYFvxruMTxCvVvSzakrZAUjmNAH48P1fuANhCw+Tv86aJwHv4rh3i481lwkSEmfew==
X-Received: by 2002:a05:600c:820f:b0:46f:b42e:e365 with SMTP id 5b1f17b1804b1-4711791dce8mr186824585e9.39.1761234715199;
        Thu, 23 Oct 2025 08:51:55 -0700 (PDT)
Message-ID: <a83cce00-77ab-496e-b9aa-a73019ac97c8@suse.com>
Date: Thu, 23 Oct 2025 17:51:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 5/9] x86/HPET: make another channel flags update atomic
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
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
In-Reply-To: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Unlike the setting of HPET_EVT_LEGACY in hpet_broadcast_init(), the
setting of HPET_EVT_DISABLE in hpet_disable_legacy_broadcast() isn't init-
only and hence can race other flag manipulation (not all of which occur
while holding the channel's lock). While possibly any such updates would
only ever occur when HPET_EVT_LEGACY isn't set in the first place, this
doesn't look straightforward to prove, so better be on the safe side.

Fixes: d09486dba36a ("cpuidle: Enable hpet broadcast by default")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -725,7 +725,7 @@ void hpet_disable_legacy_broadcast(void)
 
     spin_lock_irqsave(&hpet_events->lock, flags);
 
-    hpet_events->flags |= HPET_EVT_DISABLE;
+    set_bit(HPET_EVT_DISABLE_BIT, &hpet_events->flags);
 
     /* disable HPET T0 */
     cfg = hpet_read32(HPET_Tn_CFG(0));


