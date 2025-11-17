Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8384BC64AB1
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 15:38:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164071.1491087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0MW-0006ah-PW; Mon, 17 Nov 2025 14:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164071.1491087; Mon, 17 Nov 2025 14:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0MW-0006YW-MN; Mon, 17 Nov 2025 14:37:48 +0000
Received: by outflank-mailman (input) for mailman id 1164071;
 Mon, 17 Nov 2025 14:37:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vL0MV-0006Gl-LO
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 14:37:47 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb706bc0-c3c2-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 15:37:45 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-640aaa89697so5705983a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 06:37:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fed9e9fsm1088430066b.69.2025.11.17.06.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:37:44 -0800 (PST)
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
X-Inumbo-ID: fb706bc0-c3c2-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763390265; x=1763995065; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FxLRE0WPEJ3Pkau/hTURV7LKflRLzGIKPzRs3Fi2rrI=;
        b=YluFULYMLCtEiU3EFaayRBSI3AbRgLmxQwifVW4PrbcvMR1BBONmqXRsIY+yKcpp9B
         vNrGzZl1sQfd/8f11PawnBAj08ftXlYpU4zexjr9q3v6FD7KztHHgHYi70dyYElk8qWP
         D0jbxA9wKjeV/ylxX6pa6IGrZB7uw6HaMNX2wqTmU+UPcj5Vt8W2gWRf4Kiy8GkEMCbk
         v4EVCn8xExWZXiDSkR480ttEJO2hf1YBiFtPgk5+tvLImTdBeX1faqHcm/7cK/gKk+kn
         1zqJDeVjsPKL/7wPwIE0EGfIy3Op4j91VHjByh0eNfeINlu9ZFlNBWsEdvA51+XFK8U9
         N/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390265; x=1763995065;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxLRE0WPEJ3Pkau/hTURV7LKflRLzGIKPzRs3Fi2rrI=;
        b=Vo64BfkOdENM+zrSu6TwuUDuVPUJz2eDI3ODrf6biScLXN67IWYNjlcjagZQQE4cP1
         E4heFfWgu1b3dTWZIzevOuEUfzGbJOG0dRzG7JMEYNoqFoZdmzE6Tco6b2jft45wGscI
         NfjQ2HSCdhVy8Cr0jqnelbgjDUpJ9tyyvaJ/G2KbkCecINURzHnZ8g+VH0e2fIAOAXVZ
         rpm3x4M/4IRsV3ZYo84FHEUf3+rhjUIuivRZcx8dOfE09yt7ZXgqpw4UiWCIeXJomtE4
         +w6LW+8kcVYtUcdAv+GJ0KSQJ6iqnhJFtkyoC9DIXbDE42zMoXJEVuvOukQuR++qERl4
         FBAg==
X-Gm-Message-State: AOJu0YxYv75nTur4YhRGi2vO92H6jKHQC80VoHv0+K4l8gKminYfNa2U
	4pJ4qQxEnzbQ00w9QugWQHhaoSE3C+T+aWKPOyPxbq2CAoC8933Ae96W3JgWJFaVEaJPHere2eX
	KOG0=
X-Gm-Gg: ASbGncv9AUS8NmWqPrgqNGCcLsJ+B7lqoyUKAEp+V31Y42ddh9c3a5QkGdLuiJhME6D
	6dvqbO+4WgLd75n99sTXOxLpdaddNSMtBHNDOc6pfUHDU7/xmJ3g1+n7j2FEC0hZgBLMKT8frtw
	Sl8DseBiXA37j4BFZ4g7Hnh6UIHG+yrpWCNKIHoUZeJK99ECCN68GgLjmXMGIy52ZBaqRY9heap
	m5e9rGkPMcDd+yx/svwt8aFwy2VqhZPBmrXIb5BqqcIQXj+vl/bo3k47H1+Cblxm9Mb4vXWGeb5
	DN07dbNuTdmD95xH5U00i+qJdRyXTuh+K6j1g5rqwVrH3uMW4zzZ3QsAHRICr16pQg7wjAH/cV6
	pgcWWZ0CA4l590OUWYom/WMRif4Jt3MtwkHcWy91DqESXiC7Nc0awPxQOjfcfoeiHUgRbt1+3JA
	w+W1j5Yu4v/FxuMWh66ehHmHUqPZ/QbBqB4RduVQdCiAFtNYxDl9W70of6kUxRUlf8
X-Google-Smtp-Source: AGHT+IFY/O9NLahv0nVl+GxpqwZFTlElQ1yNgeGIgARKr4xxHgOQkldYRdySVAXTi4XTVWNdWDYVug==
X-Received: by 2002:a17:906:279b:b0:b73:6987:e902 with SMTP id a640c23a62f3a-b736987f3d3mr1083323466b.48.1763390265424;
        Mon, 17 Nov 2025 06:37:45 -0800 (PST)
Message-ID: <f8ccb446-44e5-4939-91f7-ac17f660f56d@suse.com>
Date: Mon, 17 Nov 2025 15:37:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 3/8] x86/HPET: move legacy tick IRQ count adjustment
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
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
In-Reply-To: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If already we play with the IRQ count, we should do so only if we actually
"consume" the interrupt; normal timer IRQs should not have any adjustment
done.

Fixes: 353533232730 ("cpuidle: fix the menu governor to enhance IO performance")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
_Why_ we do these adjustments (also elsewhere) I don't really know.

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -808,13 +808,13 @@ int hpet_broadcast_is_available(void)
 
 int hpet_legacy_irq_tick(void)
 {
-    this_cpu(irq_count)--;
-
     if ( !hpet_events ||
          (hpet_events->flags & (HPET_EVT_DISABLE|HPET_EVT_LEGACY)) !=
          HPET_EVT_LEGACY )
         return 0;
 
+    this_cpu(irq_count)--;
+
     handle_hpet_broadcast(hpet_events);
 
     return 1;


