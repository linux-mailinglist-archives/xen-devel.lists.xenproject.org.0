Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D571A879771
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 16:23:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691910.1078484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk3xq-0005nO-Qd; Tue, 12 Mar 2024 15:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691910.1078484; Tue, 12 Mar 2024 15:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk3xq-0005kw-Mr; Tue, 12 Mar 2024 15:22:50 +0000
Received: by outflank-mailman (input) for mailman id 691910;
 Tue, 12 Mar 2024 15:22:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rk3xq-0005kq-6v
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 15:22:50 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62049562-e084-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 16:22:48 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d2ab9c5e83so567781fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 08:22:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h8-20020a0564020e0800b005653c441a20sm3568497edh.34.2024.03.12.08.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 08:22:47 -0700 (PDT)
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
X-Inumbo-ID: 62049562-e084-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710256967; x=1710861767; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eVS8NZ9xD+RsOm+qUk/upY9IPwTqTT6N6KGsJzYt9PM=;
        b=W+0OHNkdTf+ztfwSMDouznIS0hnk8Rfmcj3qreAYCI7nW+WKnjpbCCo7Jec8soGwRf
         zrpUGhPIgdoLothD0pVeEgcO1Cp+7qJ0CJhFr8eG9OrtT/rKOugteFc6UDehLVrha+Lc
         QbbGtAh3AfqhSVar5MM0j7zf21Q80kahPd3imWqLC9sB4EUnHPSoBZVX85szHZy+tlCb
         T+9kXw7h+tMel2oDrkHj8vPl7GnmcE8LoRuouEDMA6OLuhZoyDQb8yNDVniWi6GnvdOZ
         bSlGDF3qdFIyd4Nc8ay9lhM9zyLG9kj0OkjsH8zmw9e4BPxESLCbZQukTBm03Yx5yYxg
         7/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710256967; x=1710861767;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVS8NZ9xD+RsOm+qUk/upY9IPwTqTT6N6KGsJzYt9PM=;
        b=Us5uc5ZCizgP9xLMV2QvwwdXKncreqCfXFFiTeEuCnLrfOuI5cBa8TB+unCyjM1Edi
         xpLsRdgM5a+15CTgENB1qcnNvqcwX+8TtmbNmcdgJWtengf6QIO9zl/JRfODxUQFdGus
         RgxQSo5+Jrddx49rttS1JPavtXJ4RconjpnsiURalS9fmokkdCKZmC1OG6dVOCTPQJ6+
         s54COM3WDJZq9/jrhPUMiu/qY+jeXminjy5an2zZDH+ejuSOIBIr+d5kE0n5qwyFjEED
         Mh9t46NGGK1NE2oG4zCC8QNgmCc+bXTGSj5/S7dKJcIvEGfkl4EAG5JkE2fj77S+/AQf
         6jrA==
X-Gm-Message-State: AOJu0YyuvklvNW08ntQvRrGQD5W/niOSv7qhzOq0iBvr7cXBAD+veWA2
	8Xf8bM8Di9QHXxo+oqjHos3YFWqfcTUhYp6Y1AEsIrwZOwkTvukcEFmDrjqSqdsSwhZAAxNW7T4
	=
X-Google-Smtp-Source: AGHT+IHAxhdifFTOqPCDZrEdwk2ND3FsHuBNsNyjx64p69BDCtH3I0dVYmK6ejEipOh2GgbMKU4TfQ==
X-Received: by 2002:a2e:be9c:0:b0:2d4:522e:62f3 with SMTP id a28-20020a2ebe9c000000b002d4522e62f3mr2434688ljr.44.1710256967547;
        Tue, 12 Mar 2024 08:22:47 -0700 (PDT)
Message-ID: <740404f0-3da9-4ae5-b4a5-b24cb2907e7d@suse.com>
Date: Tue, 12 Mar 2024 16:22:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86/PoD: tie together P2M update and increment of entry
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
The locked region could be shrunk again, by having multiple unlock
calls. But I think both ioreq_request_mapcache_invalidate() and
domain_crash() are fair enough to call with the lock still held?
---
v3: Extend locked region instead. Add Fixes: tag.
v2: Add comments.

--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -1348,16 +1348,22 @@ mark_populate_on_demand(struct domain *d
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
 
         ioreq_request_mapcache_invalidate(d);
     }
@@ -1373,6 +1379,8 @@ mark_populate_on_demand(struct domain *d
         domain_crash(d);
     }
 
+    pod_unlock(p2m);
+
 out:
     gfn_unlock(p2m, gfn, order);
 

