Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9213BC0244C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:57:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149445.1481109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxh1-0000Dy-C3; Thu, 23 Oct 2025 15:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149445.1481109; Thu, 23 Oct 2025 15:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxh1-0000BP-8u; Thu, 23 Oct 2025 15:57:35 +0000
Received: by outflank-mailman (input) for mailman id 1149445;
 Thu, 23 Oct 2025 15:57:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBxcX-0003ZG-G8
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:52:57 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57481c2d-b028-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 17:52:55 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-4270a3464caso470211f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 08:52:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898eac60sm4517747f8f.39.2025.10.23.08.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 08:52:55 -0700 (PDT)
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
X-Inumbo-ID: 57481c2d-b028-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761234775; x=1761839575; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PS7ucokoN9+hEjFZSIghu/GmWjPiHcD6tMlnYOR0lq8=;
        b=WuLmgoDMlTfnp7crL3D29ifCTcFUeb0DBuMatdNj8e3XZWUZbAOttwxdqIuXmWvyO1
         tksLcqURiXWYT2ALB83zhRpHBalHjZOOP23dPkFMRByUlvKqocEcViPJ+GgooPF/8+dW
         61Ux5UDO89HJUY+l5q7u2xtUyWM8A5S7OAxNU41ZXh9TahAd0EYLYYgDfWXa317KlZCH
         Hpl5gpFYEPDcZeyBnsmBmfCAgLlz+BzXRXxOvuK2+Lvnp26RKALCbe9GfK3jj6KXck5X
         vg1WsFV1VqzG/s7DmCXI+UjJ6vc5ABbYdOD1DlX+RQswxOFGKnkeumSb6yNoM22f7qG7
         gnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234775; x=1761839575;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PS7ucokoN9+hEjFZSIghu/GmWjPiHcD6tMlnYOR0lq8=;
        b=HtJV+fs70Jj77cjXRpF5qs358Dprh6c7T99V2kJAUBqgyxrLUjr3+NSexzYD7u8l7V
         6lHzl1xWG7ON0tTjB/jks8jJDHzReXjF2jR+zAs2jdhuYxYLNYCXc7WGFT0i0MUViGRO
         Mus1fZH+kg9r5aaUGbHGsQP62WTxAFwKOybA3GO5RYeOCwD5hE70z8p1+JRgQg7nAo1P
         +GwBIuYm2vRi7zoU0P5mfM+7eZRFfLsXtiKKXjMrU5Gx9T0rtPk3ozmiqd/OeMQP+fUQ
         oSDOt9w+t8Os2eODoC5iD5FndwLjTdEaR0a+eSJ/oOuxkZrRpNxGfe220ov5YFzH3JKw
         Vi/Q==
X-Gm-Message-State: AOJu0YzI5Rs94RJ8ZUGOorHP4XHlu3QYct7VKEd4RbcQ1OU40o2isWEe
	SDlLURdI7zIwEEcLlVKZp77dT+jSMQl2Cg3/HzW2o9u8E2/S9nLtAUJptobwXGDRebw1evLSjw6
	x7eA=
X-Gm-Gg: ASbGncueGt8SujS/h4k0+sZUygIOgO8Llp20UOY5IWFhjXLUAcf+HiCd501IBdq2oT1
	2pKGEkHGjzM9bI4qQwoi64o8SaOahwIAESdjuxehfL2ZQaFJLkxXxrfIWL7zA92bhWDHWn00cOX
	HJNdVENdZSj9S5U58uIyXgXFvylBVMxMqn2HHSwLpcexbN8vKvr+2he5ziB+vaV+nEypcmRgZ+/
	YqomjGaPfbIp2EzcfEX5FuU+WdKWXJ+imECHs6ogaBRDQcKqoDeEC3nNEa94KBXlJTzk7s/XhO7
	JZ4htuVKuKblnfYB2KQNcid2vc6FERYv5wMY6TWWxzb9GiQjbxZH3VzUPHGhSwqW66fN9fOZfW4
	/4R1K2diAtpktvxLhoBtVksag2UC4p+yOZdC1D3Au95tpZPTdH8KrnRwsK5cSvpknqKtrpdifae
	neBMWB3FUSYvWv605+L1fXfh2+gihk9TZh8NZ1+Eq5ydSITH+NzfAegz6AGAb1
X-Google-Smtp-Source: AGHT+IEw5vr3sX4/p69hMs8HEEAiC3uG/ZgZS22kpenU9sT4/lr2eWLaAk4CkFjapBhq7Fp+0eTpSg==
X-Received: by 2002:a5d:5f91:0:b0:428:3d14:7385 with SMTP id ffacd0b85a97d-4298a059f15mr1799694f8f.28.1761234775377;
        Thu, 23 Oct 2025 08:52:55 -0700 (PDT)
Message-ID: <b5cf4646-54aa-4d66-9475-b49068a7001f@suse.com>
Date: Thu, 23 Oct 2025 17:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 8/9] x86/HPET: drop "long timeout" handling from
 reprogram_hpet_evt_channel()
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

Neither caller passes STIME_MAX, so (bogusly) handling the case isn't
necessary.

"Bogusly" because with 32-bit counters, writing 0 means on average half
the wrapping period until an interrupt would be raised, while of course
in extreme cases an interrupt would be raised almost right away.

Amends: aa42fc0e9cd9 ("cpuidle: remove hpet access in hpet_broadcast_exit")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Drop the code instead of adjusting it.

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -162,13 +162,6 @@ static int reprogram_hpet_evt_channel(
 
     ch->next_event = expire;
 
-    if ( expire == STIME_MAX )
-    {
-        /* We assume it will take a long time for the timer to wrap. */
-        hpet_write32(0, HPET_Tn_CMP(ch->idx));
-        return 0;
-    }
-
     delta = min_t(int64_t, delta, MAX_DELTA_NS);
     delta = max_t(int64_t, delta, MIN_DELTA_NS);
     delta = ns2ticks(delta, ch->shift, ch->mult);


