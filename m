Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B145390537F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 15:18:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739333.1146347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHNrE-0001Xk-GH; Wed, 12 Jun 2024 13:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739333.1146347; Wed, 12 Jun 2024 13:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHNrE-0001W8-DR; Wed, 12 Jun 2024 13:17:44 +0000
Received: by outflank-mailman (input) for mailman id 739333;
 Wed, 12 Jun 2024 13:17:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHNrC-0000uE-LP
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 13:17:42 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 254f252c-28be-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 15:17:40 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-57c6011d75dso2660444a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 06:17:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cab3f4741sm1100360a12.22.2024.06.12.06.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 06:17:40 -0700 (PDT)
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
X-Inumbo-ID: 254f252c-28be-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718198260; x=1718803060; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OE6BxbFhz/GuABFcUaV8g29dJf9tmzpd1oPgGPbHYps=;
        b=IdT5xownBC46L/4jUwkqJEUgl/IaPfATr8M6Qktcslfs2X6nIHuxs17YgMi6Q3TW53
         nYBw0Pdag5wunGCTYySK8wZSDPFUpuVnVXRlYjOolCYSJRYNeOlngdOC/o2R8rLme38b
         75yzHJUJp7FDuirLm6t5Y+pu7ElogOvKScWJDWFVrENlBAuHvyc9BPUmrt0XvM7d2ROH
         HOs4XAq1itfNuTkxSWrHtq/J78ScZQ1YEkAuEfdMSyfFVBMkU9kQ7yH5uMGe9tq8GTgH
         U3KkZr4XnIHQzDCKVyHu6/qBWzNDjyA2ch0wYvSYyapERaOHBeN0f6iAtcd8a1nl0n3a
         xdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718198260; x=1718803060;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OE6BxbFhz/GuABFcUaV8g29dJf9tmzpd1oPgGPbHYps=;
        b=o9uYJJF7IRPbodYg3l2mYdm9EjvpKQguEJJfyCtViYMT6DwiuHupGltAJOOxxd2FEU
         9pOTlhi3K0DFo61VI7HjpXm8rrODl0SD1wxFJK/AbXOL8QKPZyESzW9VocU+jTHBja69
         UaKuZ0NbxyosZ+W6wxSwKrsDDKOXyJoNEGCeB+uKtEeJMov5OEfLb3VkWwZG2Tx/MPPH
         ZQPH0VjOkK69/oaYcOYk9bhD1L2SgvcKwzPWk8KCxPRVIk/K4JuwzCpX//OE37xfYyjm
         +rRjEcpyK7r70pTH7kNnMIImHpvATDtRQjToj1T5hXEX7eJJ/D/tk6/QypvL3blvgr/r
         tbqA==
X-Gm-Message-State: AOJu0Yxu3LmDJRkQspSUlUq8LTkQt370nbN7kxK6IMvT76rl7GC/XAsU
	xqq30HANwZ6riLSRPZQ/4s241Gns40+MA38S5V4w+Eq7Ug4I8UwSA+DG26OH4mY6Kr0OUoDqOgA
	=
X-Google-Smtp-Source: AGHT+IGsMdg4tUyavdeBHQOEiXhnoC90DvTKudxzlW25vpQM2p+VKF34nC8unmxL9isU1dg41/8w2w==
X-Received: by 2002:a50:8acd:0:b0:57c:6f0a:bc57 with SMTP id 4fb4d7f45d1cf-57caaae520bmr1225185a12.36.1718198260234;
        Wed, 12 Jun 2024 06:17:40 -0700 (PDT)
Message-ID: <7607c5f7-772a-4c49-b2df-19f32ec2180b@suse.com>
Date: Wed, 12 Jun 2024 15:17:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.19 3/3] x86/EPT: drop questionable mfn_valid() from
 epte_get_entry_emt()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2936ffad-5395-45fd-877f-7fb2ca8b9dc8@suse.com>
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
In-Reply-To: <2936ffad-5395-45fd-877f-7fb2ca8b9dc8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

mfn_valid() is RAM-focused; it will often return false for MMIO. Yet
access to actual MMIO space should not generally be restricted to UC
only; especially video frame buffer accesses are unduly affected by such
a restriction.

Since, as of ???????????? ("x86/EPT: avoid marking non-present entries
for re-configuring"), the function won't be called with INVALID_MFN or,
worse, truncated forms thereof anymore, we call fully drop that check.

Fixes: 81fd0d3ca4b2 ("x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Considering that we've just declared PVH Dom0 "supported", this may well
qualify for 4.19. The issue was specifically very noticeable there.
---
v2: Different approach (and hence different title and description).

--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -501,12 +501,6 @@ int epte_get_entry_emt(struct domain *d,
         return -1;
     }
 
-    if ( !mfn_valid(mfn) )
-    {
-        *ipat = true;
-        return X86_MT_UC;
-    }
-
     /*
      * Conditional must be kept in sync with the code in
      * {iomem,ioports}_{permit,deny}_access().


