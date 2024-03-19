Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B17B287FEAD
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 14:22:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695373.1085061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmZPy-00072C-IX; Tue, 19 Mar 2024 13:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695373.1085061; Tue, 19 Mar 2024 13:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmZPy-0006zN-Fs; Tue, 19 Mar 2024 13:22:14 +0000
Received: by outflank-mailman (input) for mailman id 695373;
 Tue, 19 Mar 2024 13:22:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmZPx-0006zH-5I
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 13:22:13 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1fa7bb7-e5f3-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 14:22:12 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a46a7b8e07fso415358266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 06:22:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o20-20020a170906289400b00a4668980c12sm6046479ejd.182.2024.03.19.06.22.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 06:22:11 -0700 (PDT)
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
X-Inumbo-ID: b1fa7bb7-e5f3-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710854531; x=1711459331; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iNHqaS4hCYlzXBeIJcF37JkLflryMYj84q8OtdKaqUc=;
        b=TLxRYrpLg2FVEDe/5B699AlyiAOFmsIdY3PCZoqTCQK3aD/FcDvzoTuOOtgA9B5tCF
         JB4mTUEMuPH1vzIIS+kItHVjKPFPsdtWet2zaSVG5n2q2Kd7oF39qlDHXfDw7PQFjuY2
         who01+1rVCU609V4cyc6rkdd56N/w/pwTwW+ET6gDPZTdeT9wZxS8pH1JOp9EtUMT84X
         NxD+LMWtgJKdBx4zz9gsyeW7T3QXq8xx9Zs0T1LznPCkqtXyuYe7ovyTzTWnvKylTGPy
         aCADYjcOPuEY7GFcz8TenpTvUiyV/5IM7NdMJNTT87kB25p0OCoTpMQF3VhLm13or/v1
         ZeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710854531; x=1711459331;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNHqaS4hCYlzXBeIJcF37JkLflryMYj84q8OtdKaqUc=;
        b=m0BBgbXkugHpdxlktv2tHPfGdidxsayFaq+qmCF+mJCUizW2fleA1JH3G/1KCyB137
         XLeNKkf72IQofN8+6k9WpvR+zzxZDL0Cia2WgbyWWIVxED/wHBoAp8oDZ3w0yRxZtnPj
         tvPQULOSKpo8SZSeJjrfsIiq8WB1Ao2g4AOrGeVw27qBpe9n1J3wLrWfNpsSdTGD2JZH
         GsiViBYlipXUqVsMtvdRXQqE5vGcNpXy4wQJvZvHxkR+6PemKArGthc2defqK4OQdIOR
         tUfpYz2J+kye3FAfWV9OdaJ7hCqYQ0cf9OkUWjx5DuhcVypF2ywtJlfeusbCfKIpDF0o
         4K0Q==
X-Gm-Message-State: AOJu0YyEezz7J5EFzUPP6zcnlXvFG6qjWTAqfjQCgdJkfor1J89/QwSk
	bMCj9bBW9jp0Pwa1Rj246sGmW1lS8ojVxpL12fgLozA80Fs/8Ko6PGzaFI0s9SaCi4udIPh3dVw
	=
X-Google-Smtp-Source: AGHT+IF5I93HlWa1k48yzQp5rLpOSD1GUXFpYyMPj6ExHw4qGKj5DTFa2ZHs6as+JVJ0AxG3nCOZ+A==
X-Received: by 2002:a17:906:7b8f:b0:a46:50ca:b318 with SMTP id s15-20020a1709067b8f00b00a4650cab318mr11159149ejo.16.1710854531640;
        Tue, 19 Mar 2024 06:22:11 -0700 (PDT)
Message-ID: <95699d2c-7e2a-40db-875f-907990797317@suse.com>
Date: Tue, 19 Mar 2024 14:22:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5] x86/PoD: tie together P2M update and increment of entry
 count
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@cloud.com>
References: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
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
In-Reply-To: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

When not holding the PoD lock across the entire region covering P2M
update and stats update, the entry count - if to be incorrect at all -
should indicate too large a value in preference to a too small one, to
avoid functions bailing early when they find the count is zero. However,
instead of moving the increment ahead (and adjust back upon failure),
extend the PoD-locked region.

Fixes: 99af3cd40b6e ("x86/mm: Rework locking in the PoD layer")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: Re-arrange conditionals to have just a single unlock.
v4: Shrink locked region a little again, where possible.
v3: Extend locked region instead. Add Fixes: tag.
v2: Add comments.

--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -1348,19 +1348,28 @@ mark_populate_on_demand(struct domain *d
         }
     }
 
+    /*
+     * P2M update and stats increment need to collectively be under PoD lock,
+     * to prevent code elsewhere observing PoD entry count being zero despite
+     * there actually still being PoD entries (created by the p2m_set_entry()
+     * invocation below).
+     */
+    pod_lock(p2m);
+
     /* Now, actually do the two-way mapping */
     rc = p2m_set_entry(p2m, gfn, INVALID_MFN, order,
                        p2m_populate_on_demand, p2m->default_access);
     if ( rc == 0 )
     {
-        pod_lock(p2m);
         p2m->pod.entry_count += 1UL << order;
         p2m->pod.entry_count -= pod_count;
         BUG_ON(p2m->pod.entry_count < 0);
-        pod_unlock(p2m);
+    }
+
+    pod_unlock(p2m);
 
+    if ( rc == 0 )
         ioreq_request_mapcache_invalidate(d);
-    }
     else if ( order )
     {
         /*

