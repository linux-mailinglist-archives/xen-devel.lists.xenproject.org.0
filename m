Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432D8A983F1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 10:44:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964181.1355043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Vi5-0007J8-NA; Wed, 23 Apr 2025 08:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964181.1355043; Wed, 23 Apr 2025 08:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Vi5-0007HK-Kd; Wed, 23 Apr 2025 08:44:01 +0000
Received: by outflank-mailman (input) for mailman id 964181;
 Wed, 23 Apr 2025 08:44:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7Vi4-0007Gy-Fu
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 08:44:00 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18c546f6-201f-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 10:43:58 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a064a3e143so839247f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 01:43:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa493230sm18286034f8f.64.2025.04.23.01.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 01:43:57 -0700 (PDT)
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
X-Inumbo-ID: 18c546f6-201f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745397837; x=1746002637; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sRXJAQPaiLmZqT+mF6PCtOvMLYU1hzDAfxemuId4gd8=;
        b=RrAL0rYFMs/aMEGP4lthhInIvVwMLGcstibjkzeULQFdPzTtRfovp8SzasCwJGtXsn
         ARFzvUf/vN8s5UuWK6RkOUH+HbeXRVTFCzf4E/5dgurJrgmwG4LPVqL3vRymMAm+S5oH
         LoP7OonBlrhgbUt/XAfFc2s98AUA19uAMdKdUJyfARVChI1HTIMywy2jfEu58GIborTZ
         F4xJC7robBHpBpcd4IwBrC41FflnKtbUkSBb/iOTNOzQ/9bJaN3XLfyHb4XX+WLcuf+Q
         TK4QvUUiSZgkE+HiEnoNCxL6j7smCqE/92LmQr6K+wfcjYTidVyJ6L40fr+a61GcjgFS
         +gSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397837; x=1746002637;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sRXJAQPaiLmZqT+mF6PCtOvMLYU1hzDAfxemuId4gd8=;
        b=Omc/fgfgN3zLASwdLzWomMuqfJi6wuQcaFC15GB5Wxjirzu/zKiAt0mcVvJr5SiI0h
         HaNdKzXVFlBtUM8xbH4ULKUUMRCN5EE+hbL3Xs21XpKVp5cRvXKir+IWhaCC3KCF/Tyb
         FLmp6Ge80AxbejUAUdfOOb45YgbHHIuxIPHG4ZbAptE+FQZALiMTOjRj3uhURVx6JxW+
         MCL/ii3QTJTylJRk+DJjXikat2NWlkjmvztK6uzFYQJK4IgvAUJmnOxRAhcVWgBj7s2X
         LSy7Giab51tJFfLhHr7SBSyUpn6vf/Qn32tne9gi5CGXS03tinU8aPjRvvxdmcHN1C4N
         bC+A==
X-Gm-Message-State: AOJu0YwQIqvp7PkKVcA68Ajs81jjeoLffBwfeMCpkRCTzV/Qd4VFUhOJ
	RUwByA6lSYhHuFDlUs0ru1mECWMTMxGQ3DjVgB1yUdRjmEYs6tixystXqPy7USVRcR9hPJWxHw4
	=
X-Gm-Gg: ASbGncuJ0Hx6BpOKXA9mz+b7hgf+lPMsDHXRwjM9mFqVOnnhCNqmj9TI+id1IdolP8x
	qkPMM94lZFB6lyik+2cQP8wABxoHs+5iLRudIbe6FBgsgrZTEVE6MIuUp6q7i4rCWccen2DcF+P
	xMFYVqAMzU/pCHMYkNl8RRFQ/XkAn7OEga0VCngUhOlkmATnMDv8MiVirKvUxFZ5gOS9Cn4gMVa
	9aOltAsMvqisw5ocfR964wv3jbO6yKM3A79RJynibiibfeod+BzsyR9SpwWTn4kwxn76o5HRtVx
	3XAL210viSO90SIIvZ6PWeSLTE7I6Wl4d2azLAjfoW70hzP7Yq6ZePUpuruNBRiYmvI+U9BY5Bt
	IKKzWvIGnhcA6Mdcrx8xTIhEpGQ==
X-Google-Smtp-Source: AGHT+IGrDWdbEn1bJF16CdwpXCotm0IS9q51faRT3Bus6600G8ZHXsCEUCRHBIjuw5k7x9vsfYBctg==
X-Received: by 2002:a05:6000:2405:b0:39c:266c:136d with SMTP id ffacd0b85a97d-39efba2aa92mr14093802f8f.12.1745397837633;
        Wed, 23 Apr 2025 01:43:57 -0700 (PDT)
Message-ID: <570ad3f2-7f3b-4579-a000-c85d27e8bf77@suse.com>
Date: Wed, 23 Apr 2025 10:43:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: constrain sub-page access length in
 mmio_ro_emulated_write()
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

Without doing so we could trigger the ASSERT_UNREACHABLE() in
subpage_mmio_write_emulate(). A comment there actually says this
validation would already have been done ...

Fixes: 8847d6e23f97 ("x86/mm: add API for marking only part of a MMIO page read only")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Alternatively we could drop comment and assertion from
subpage_mmio_write_emulate().

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5195,8 +5195,9 @@ int cf_check mmio_ro_emulated_write(
         return X86EMUL_UNHANDLEABLE;
     }
 
-    subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
-                               p_data, bytes);
+    if ( bytes <= 8 )
+        subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
+                                   p_data, bytes);
 
     return X86EMUL_OKAY;
 }

