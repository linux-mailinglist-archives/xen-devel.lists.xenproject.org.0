Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4919487A8E6
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 15:00:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692445.1079593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkP9k-00089e-6o; Wed, 13 Mar 2024 14:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692445.1079593; Wed, 13 Mar 2024 14:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkP9k-00087l-3x; Wed, 13 Mar 2024 14:00:32 +0000
Received: by outflank-mailman (input) for mailman id 692445;
 Wed, 13 Mar 2024 14:00:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bR7k=KT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkP9i-00087f-Dn
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 14:00:30 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c9f83a3-e142-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 15:00:29 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so8961870a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 07:00:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 hg13-20020a1709072ccd00b00a45fefe4fc5sm4816032ejc.135.2024.03.13.07.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 07:00:28 -0700 (PDT)
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
X-Inumbo-ID: 0c9f83a3-e142-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710338429; x=1710943229; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqVblptFSYqrUaUw2YhIZpKb+B+OQXgBxRb0Ru7EDt0=;
        b=FVQRpjSz0Cv95fkMb8COxxiCDJWTc57M9GrpMYq4bDLCJ/Lm1/7tGDhi+kxzCD4q9e
         rEgdD/TidGUVMO6tUuScXJbfS/olsHns6AR4/C3pUljhaMbrzoKBcLmKLie3HnlM22hR
         khOhaEkK7m1z4zdikTU06Up1rKWmI/z9nrDrA+TRQvXw0lCffkeS98MdTovXlxGaC/DJ
         Bd37/+9TCb+GJ0V6jOJJbNAOqspG6PxJl+tku/8C7Rqkt+iR/hwwJd48U7vpX1F01o6a
         d8S8pJcs9IiO0N5hfRrmLH2FaoiAaoV/WobLocy0yISP+1q9ajwhU7vbu58u7jC9mz9X
         YqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710338429; x=1710943229;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqVblptFSYqrUaUw2YhIZpKb+B+OQXgBxRb0Ru7EDt0=;
        b=gvGIw9sTzroJLvk4Vqypt9MLiZcDWBhf4HmiuwlhZp/F0D/hWQ477+cGqdiSts6UI5
         LLpzMg745r6OXYlbqkuuiNMOvXVHb0zY3OCy+lD3PRHS/XK79j+VW9pOF9HPpKuLAqn2
         nOX1+xAhvXTUFknJfknZV9K94x0Ya/qbmk7cWtTzQ7c18iQjTnqtqflcUqEawwIf/WZ5
         dum1Ks1F6oy6rKIjEaU8fcHvP46EE/x0v9Tew093u9WbEYgQht777Fm3+MrDRQYLKp+9
         VR1apNoAfDPW+x1EecFgZUiVYH7l4zyioaI3HwPeXa3qkSbhnN5ZBHQ8h4XhdNkvjJQ4
         Tpww==
X-Gm-Message-State: AOJu0YxL7Q0B9mTtotNryAzAUUuk4Odd5O5BFuBUEjtyD/8eb70ZBgUu
	yll4MprtGQQku+tY1+haCnsAWBZ6jcNm+wBYWrar3k3V6eqkSeQw1BiO767gk2YXJG5mf2/QvGw
	=
X-Google-Smtp-Source: AGHT+IGfZUYgv0LBZI7ynmBibYHGydGzTJEVXyDq9KBWg4ePpew7ngHM3nni36MeEenbTSu/ZgtW6g==
X-Received: by 2002:a17:906:2b8c:b0:a46:13d5:46fe with SMTP id m12-20020a1709062b8c00b00a4613d546femr6612028ejg.11.1710338428583;
        Wed, 13 Mar 2024 07:00:28 -0700 (PDT)
Message-ID: <3daef84c-47dd-4a6b-9984-402e997598dc@suse.com>
Date: Wed, 13 Mar 2024 15:00:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4] x86/PoD: tie together P2M update and increment of entry
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
v4: Shrink locked region a little again, where possible.
v3: Extend locked region instead. Add Fixes: tag.
v2: Add comments.

--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -1348,12 +1348,19 @@ mark_populate_on_demand(struct domain *d
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
@@ -1363,6 +1370,8 @@ mark_populate_on_demand(struct domain *d
     }
     else if ( order )
     {
+        pod_unlock(p2m);
+
         /*
          * If this failed, we can't tell how much of the range was changed.
          * Best to crash the domain.
@@ -1372,6 +1381,8 @@ mark_populate_on_demand(struct domain *d
                d, gfn_l, order, rc);
         domain_crash(d);
     }
+    else
+        pod_unlock(p2m);
 
 out:
     gfn_unlock(p2m, gfn, order);

