Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3EE87E7C4
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 11:55:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694580.1083429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmAdy-0005Y1-Q9; Mon, 18 Mar 2024 10:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694580.1083429; Mon, 18 Mar 2024 10:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmAdy-0005Uo-Mv; Mon, 18 Mar 2024 10:55:02 +0000
Received: by outflank-mailman (input) for mailman id 694580;
 Mon, 18 Mar 2024 10:55:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmAdx-0005Uh-Ej
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 10:55:01 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7458770-e515-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 11:55:00 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56b84b2c8c8so216654a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 03:55:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 er27-20020a056402449b00b00568d2518105sm1461528edb.12.2024.03.18.03.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 03:54:59 -0700 (PDT)
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
X-Inumbo-ID: f7458770-e515-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710759300; x=1711364100; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAFNlQLx2cVtsybVUptvK+eVzOW3fyA22J6ForGF3/U=;
        b=CpmAQg8VjBO3hsw3w1nWWonZf/wEO8H1sXn8XNmzQuJPr8UtdOKbz9Y2FwM2ayE/gA
         r7Idck6W+WQjh7weSBciUPjf/ILODdfcCpQdJU0d5SoAHkeMJqx2b0/tloCQOqRcdlJq
         vMHoGy66CRr3OmrxDii8/eJx6he6CZ5mOp75ABBX2Qw2rPgQW3wIDQplgnIOx+7P7ktk
         dlhDfV0YRRFsBUZr9C2a25L2+QGETgdaTVbmsmfZnDpRN9cYSbRPvRm32h8lMQVubLNy
         My8CFIUoa2sdSbposKCBqoKzvxwghRoGw1sUc6RIzwiU5Cwow1xveQ1gTPorma/1aslX
         DaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710759300; x=1711364100;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HAFNlQLx2cVtsybVUptvK+eVzOW3fyA22J6ForGF3/U=;
        b=tE7Gwk8ha5NKFbR60v04Yr4KgA5xwvfCRbks8oeauY/O/FoUcvg5u0xRuxhExwx3Wa
         ZCta0fvvSfDyQ0uUECz1WR52ZvVEBfftJT2rsyCrkbfRtL7t3alMBj0E0mXe5hymOmKC
         UFjlfFE2GubSrVr3Fwu/5QQ//+wONdnPoao15D4Re951b6+JqSGnRdFnsTFgtMlgul12
         kRUXVwebrjMpRzVrAbRJDFCFko0TfSm4FpUi3YuFWfCUd5oF35G8L8P3P6GhxYpmLvIq
         M+Ba/ye+fpxKTnDoC+lgLyU87jgdeKDIK5DjIbssaOjVv9O19R9UwTpnsqo0czbOiIpH
         W1/w==
X-Gm-Message-State: AOJu0YwSF9r1w9DMXbfofMEoSLc00MHDC4p4rI0F6a7wrrA2DXo+Lldp
	p2tA73EATATts4GIDzgHL9g5IUSX3FS17broViCDHltDaE3m/vqZ9sccNSKX4rytbESRrLnG3qU
	=
X-Google-Smtp-Source: AGHT+IEiNM3xXsvcQH7OFxm3WecjXIHkPseO8wePgSDM2H0Z13oo1KkHTDFv0dqXgK+HCStaONbZxA==
X-Received: by 2002:a05:6402:28c9:b0:567:29d9:99ae with SMTP id ef9-20020a05640228c900b0056729d999aemr7559137edb.28.1710759299669;
        Mon, 18 Mar 2024 03:54:59 -0700 (PDT)
Message-ID: <eea85453-32df-4d0e-b6b5-74b2bf16ae1a@suse.com>
Date: Mon, 18 Mar 2024 11:54:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mm: use block_lock_speculation() in _mm_write_lock()
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

I can only guess that using block_speculation() there was a leftover
from, earlier on, SPECULATIVE_HARDEN_LOCK depending on
SPECULATIVE_HARDEN_BRANCH.

Fixes: 197ecd838a2a ("locking: attempt to ensure lock wrappers are always inline")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Noticed while backporting to 4.12, where block_speculation() didn't
exist yet.

--- a/xen/arch/x86/mm/mm-locks.h
+++ b/xen/arch/x86/mm/mm-locks.h
@@ -138,7 +138,7 @@ static inline void _mm_write_lock(const struct domain *d, mm_rwlock_t *l,
         _set_lock_level(_lock_level(d, level));
     }
     else
-        block_speculation();
+        block_lock_speculation();
     l->recurse_count++;
 }
 

