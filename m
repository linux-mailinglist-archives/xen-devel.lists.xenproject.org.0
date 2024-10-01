Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 326FB98C15B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 17:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808237.1220103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sveb3-0006jI-PP; Tue, 01 Oct 2024 15:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808237.1220103; Tue, 01 Oct 2024 15:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sveb3-0006gk-MP; Tue, 01 Oct 2024 15:15:29 +0000
Received: by outflank-mailman (input) for mailman id 808237;
 Tue, 01 Oct 2024 15:15:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sveb2-0006cV-2K
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 15:15:28 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd274737-8007-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 17:15:27 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53994aadb66so2440231e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 08:15:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88249479csm6308383a12.86.2024.10.01.08.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 08:15:26 -0700 (PDT)
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
X-Inumbo-ID: fd274737-8007-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727795727; x=1728400527; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GYaugTRe75GrNYlcI6QrJSs2uMegyQOi+KXTpy3i8Tw=;
        b=QwQlJklQKo6iJlVO4oi0ZV3djjDHI3PGg2kn/DWk/AsNs2KeXOLrXbkVaAPWoo6iiL
         Q5cnCIrMC2Cz2hUWhr4mulE/tOPy0Dnbnw9xkLrZOPJKJPaI9gBsNVLLYxzH4TvkSXDP
         TjAeIayPbrY10XnlbnH4vydxfE75t+LyMBzWEzv6CqmoXMwQksosMRlXwU9ZvTrrEJx9
         K3QYFStDkAKn9QAMuVNq50+nij9EVQNeSsg0uj7uuYw/QzRO1De9/O29aDnqE9kI58E1
         9YpM/SEiWjamXQ3QJ4q07d6YTTJiLRncqhZ49NNN7wC6u3hH5Bt2d0LzOPiMjf9lkKun
         NmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727795727; x=1728400527;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GYaugTRe75GrNYlcI6QrJSs2uMegyQOi+KXTpy3i8Tw=;
        b=A/o3Nv9jkUCqUu5YJrhHzNUuR8+TWQi9JIOsOLXGe7gZGOXt6lXFlR50ijN+cZzqm8
         2vkMH+MB8hLmo9DHRUHzSLbQO1HQ9mTaVmRihc0dMA93GjZi313IEL5BW6Hw2+o2sj2i
         ZkNm4W+XxkkLk9gFSLPBvot8C1c6sLNQBhH2hOdJmAaD2SGMwH22aahmt38IZ7ttiZKc
         0guWoBRRMvVaIwevR27YRTdRZoftwpUw/6svRo25kpUU0xCBYemYjVb6hke/YKAKE4Ud
         x7A9IITmQoGPgxMuYw/kJ9wXiTrm0QuJ98ICLrgDm9/GF4d8kMsW2xBWYrxtifWYrhRa
         FJ0Q==
X-Gm-Message-State: AOJu0Yz4LCq2KrxReA1TZYF66arPd3/j32nEbPRT1UlPsZKYvvXpEp5q
	UemVx09hi1K98fw56tSCJRU96+pxhOy9zE7UKOV2MxW8j7UY4aiBoBCbOb7JNWfPRLrvpDKVcNo
	=
X-Google-Smtp-Source: AGHT+IHXAI56HklnkMwoY6mg2bHEa4L3szOMSLOUcGhzrytzQ9v7xzmhFml2k6/vrt0EB2aX27EL6g==
X-Received: by 2002:ac2:4f01:0:b0:52f:c27b:d572 with SMTP id 2adb3069b0e04-5389fc7d5bbmr8083293e87.59.1727795726701;
        Tue, 01 Oct 2024 08:15:26 -0700 (PDT)
Message-ID: <165b8dcb-0fa9-42f3-a7cf-16136ed78921@suse.com>
Date: Tue, 1 Oct 2024 17:15:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7 05/11] x86: convert dom_crash_sync_extable() annotation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
In-Reply-To: <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... to that from the generic framework in xen/linkage.h.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v7: Split from larger patch.

--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -624,7 +624,7 @@ domain_crash_page_fault_0x8:
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         movq  %rsi,%rdi
         call  show_page_walk
-ENTRY(dom_crash_sync_extable)
+LABEL(dom_crash_sync_extable, 0)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         # Get out of the guest-save area of the stack.
         GET_STACK_END(ax)


