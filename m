Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 237E6CB25B0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 09:05:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182612.1505465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTFBy-0006bs-BC; Wed, 10 Dec 2025 08:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182612.1505465; Wed, 10 Dec 2025 08:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTFBy-0006Yv-7s; Wed, 10 Dec 2025 08:04:58 +0000
Received: by outflank-mailman (input) for mailman id 1182612;
 Wed, 10 Dec 2025 08:04:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7qh=6Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTFBw-0006Yp-Hf
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 08:04:56 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e913730c-d59e-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 09:04:54 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4779d47be12so58560645e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 00:04:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a82d255e7sm32759365e9.4.2025.12.10.00.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 00:04:53 -0800 (PST)
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
X-Inumbo-ID: e913730c-d59e-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765353893; x=1765958693; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9rzmXT9d8zfBcFDKmkT//aaKMVUubtf7TzwjmLE8A7U=;
        b=MOYxl+zj/8pDz6pj32G+cveISlDm1nK/GdYyPA1cbaOyPkycYEYYyZjv08fHlj4pQU
         NaWQaiCBfJXpoedQuMh6ZujmhsmZDCNOQkl55cEGDKLSGBn8N7xJs+L/I9FoCb2CXehS
         sSV4fExnKdnAD1ASQsl1diUv/SYuRuASUK+/CmRkzOuUrLFuJKk7C0lR3cpwJsCrPddt
         Po9oTYbypVv0svAsNnu2Xb9iorPmolRTy7vBO+oKxNxDDYpnqPN3CpQ1Ts+QqE2pqAVE
         K/UiujcJ3YjVk5wN6eJ918NIXilBBMJC1jbyEKI/LyAxo/3SPsjbgZoxVeKy8FnWuj04
         z9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765353893; x=1765958693;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rzmXT9d8zfBcFDKmkT//aaKMVUubtf7TzwjmLE8A7U=;
        b=ltKHNbY+H9bg1t2Rw0/ncMEkna1C5ClCmrjcMyKxaR2nUTdXhAY52UsCu0wv4zx8T2
         R8aTh+Ak3QR5kyhDS+oQlQ77DCQQTbp3JsyJY1NIcCRQN6hOQnf1LOATZjt2b3edDVxV
         yXdI+zc2Uh34P5ky+mF63rDyXukRpwxX6M23Ne8oM262PssTN+OtNOiKVP7UIyeQBXZ8
         uWy9ylLGPrDA6BC3w/7aYnK+AfRbxsxfgV8OfppAYE0s51UvbADMTwznOB4fKWsuMLBc
         pPzMC2Ntx5vnlaUdY0HvMWGCAed33bz5oDKu2swBx2LjDLPmOTfstysjd53P9pOZe/rX
         iBHA==
X-Forwarded-Encrypted: i=1; AJvYcCXxP/fwYE27OmAytbMQodiDzrvWdEJupoWSL9gs0XNTfKuiEiiPyfj4PiNuMRwLU8AfpNiUbOq18jU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXNngrotA6JhumOLR7to1lbpjaRmbpaKc8RXwIhkSqn8+BEdcz
	1oBxU3s6VXjFfrC3fOEtOFBoAQ3l1c9Twk5xzyZp/R+hqOkYgNGhVjXid7gNSHMQGw==
X-Gm-Gg: ASbGncs8h/VaiA4r0PHSj8nIeOH7nmNAhrGLic5Zh+UL8eKy+xVdIv4wsT9qWU+yVq1
	IgQLM4ZYqXeM3XkNacZCE5I1ZVjAvGUtWHlhxj4K2Ym7YgLZ+wNCOqvxc7wnVjmMo29nFFUnN4/
	O0REEL/uKZFtEr7m9xKpSgtypcFUtC1iBv7EollHBiaAH5z9Wjay94DyR/9CmVOS3RHApSL3/ct
	fzKdJg8DQHl7EJ6+NBl3ix7CA//eUMaP9aZBdxx9aTLdG7XsmF+gVcxlBms+iifxto30NXqaa74
	hJR05cyDlmFl0YD3VztiEyLIxaFyjl4dy/s4PxmUko+RevJBzCKcA94kmrOdcoC2v4KWLvhCnyB
	mAwDwxHO1fO1l2f9rnBI7sK75kMRnvs/DzYRSWozEjVVdION3pWt47VQDWcikApRsZEikiSe5lQ
	zUMqX/3gn4S4tFS5FzvoZofPrCIvE1KpIWi7C61XIwFs3bEsNgh5CAo4BTApDBqElwXOP9DYMzg
	Cs=
X-Google-Smtp-Source: AGHT+IHKIaCphMmCaLpoG2yKa8huvH1TFn/4Ec6Jkk1SoqOadIcjicNB7hZdwm2YRvi5txy2qFbhIw==
X-Received: by 2002:a05:600c:1381:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-47a8380b264mr13135085e9.7.1765353893553;
        Wed, 10 Dec 2025 00:04:53 -0800 (PST)
Message-ID: <d6133546-fb8c-4062-ad0a-ce6e010a007d@suse.com>
Date: Wed, 10 Dec 2025 09:04:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: Inline domain_set_alloc_bitsize() into it's
 single caller
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251209180750.2145364-1-andrew.cooper3@citrix.com>
 <83c524ed-dec0-4792-9129-0bfc7498ac97@epam.com>
 <d8a37c7e-106f-4bb3-a4fb-3ad082cda7fa@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <d8a37c7e-106f-4bb3-a4fb-3ad082cda7fa@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.12.2025 20:29, Andrew Cooper wrote:
> On 09/12/2025 7:21 pm, Grygorii Strashko wrote:
>> Hi Andrew,
>>
>> On 09.12.25 20:07, Andrew Cooper wrote:
>>> Prior to commit 02e78311cdc6 ("x86/domctl: Make
>>> XEN_DOMCTL_set_address_size
>>> singleshot") (Xen 4.9, 2016), it was possible for domains to switch
>>> to being
>>> compat, and back again.  Since then however, becoming compat is a
>>> singleton
>>> action that can't be undone.
>>>
>>>  From the context it's clear to see the is_pv_32bit_domain() check is
>>> redundant, and from the singleton nature being the only place setting
>>> physaddr_bitsize, there's no need to check it for being 0.
>>>
>>> No functional change.
>>>
>>> Co-developed-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Split out of series to simplify things.
>>>
>>> bloat-o-meter reports:
>>>
>>>    add/remove: 0/1 grow/shrink: 1/0 up/down: 25/-96 (-71)
>>>    Function                                     old     new   delta
>>>    switch_compat                                447     472     +25
>>>    domain_set_alloc_bitsize                      96       -     -96
>>>
>>> which will mostly be the LFENCEs embedded in is_pv_32bit_domain().
>>
>> Thank you for doing this.
>> Not sure if it's needed, any way.
>> Reviewed-by: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> It does help.  Technically it lets me commit the patch right now, but
> I'll leave it until at least tomorrow in case anyone else has comments.

Just to confirm:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

