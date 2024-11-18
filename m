Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D1E9D0A5F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 08:45:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839091.1254895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCwRv-0002w5-3Q; Mon, 18 Nov 2024 07:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839091.1254895; Mon, 18 Nov 2024 07:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCwRv-0002tO-0h; Mon, 18 Nov 2024 07:45:31 +0000
Received: by outflank-mailman (input) for mailman id 839091;
 Mon, 18 Nov 2024 07:45:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i7IS=SN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tCwRt-0002tI-JD
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 07:45:29 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1337aacf-a581-11ef-a0c8-8be0dac302b0;
 Mon, 18 Nov 2024 08:45:26 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-539f8490856so2790995e87.2
 for <xen-devel@lists.xenproject.org>; Sun, 17 Nov 2024 23:45:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3823b395066sm5544979f8f.55.2024.11.17.23.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Nov 2024 23:45:25 -0800 (PST)
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
X-Inumbo-ID: 1337aacf-a581-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzYiLCJoZWxvIjoibWFpbC1sZjEteDEzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjEzMzdhYWNmLWE1ODEtMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTE1OTI2LjU3MTYxMywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731915926; x=1732520726; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hyX7Hdl5N/HJ1JJXEllUqKY5cF1NKOKoXp4P58AA5Cg=;
        b=gDHM1UZpXoWgcY8MIz3IO3kVCJubV6mXv6R3voufaV5H3T2naoe/XUr8BeYIENFbQz
         X06pJd2E2sONDEeRz+IrA0Y8UtPVgS4evGXflge06r3e0mur7GA9TCA8+EcxErV8utV0
         3WGOT4EoPxVulqRR+xIUzrOiuDpucDt/uROqUfOVPZBax/6FPqUfuk26mrqo7+k/Ie1d
         x/Aw95jQ8Q57yMoh+/UCYCFVU2Xz30MoZTRko4LBkW5zkGZ5qlYHK5hxuAzZecx2NbcJ
         9SUJexnAn0GuBz+x3iUmiCmk9UD/BSvG2jp14X67HMLPlzVE2Fi05TtZNJhU3a0N+E4h
         Mj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731915926; x=1732520726;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyX7Hdl5N/HJ1JJXEllUqKY5cF1NKOKoXp4P58AA5Cg=;
        b=MeiWHJOQS0soymu3TNQ1m3H87X49H6Q2GNY/KE2/ytb8l8+w8cRzBolWIdCKLcwT94
         KJfH2mlqxb8kYY30hiXChFGHypFNyg+8DbuYnNqoO9NKDxNX5s2QYsKaXZ4EfxarcI/T
         X26rbH3uH0VnJKnnkbId+3iY42QVa2CzE0hWzu3YXpyVtF9KgwpFbUW+s0FvxhuQ6NVJ
         LkETJNxUtOht6rd3p9LhtoomuBgM1/QvU6uV8Yyy99imiMEsDROYkIrjrNGi96tUKYrU
         jcdzAM5A0058yt9TMdLk7jMly+vQrC/SCgYExEARthRZfwK99ispVf9RMYqmdhTEr/9d
         Ej0w==
X-Forwarded-Encrypted: i=1; AJvYcCUaYT/Kct0pHyzrW757fIV54UMDOq3tncCe7cU2lT32n18EMEIJnyVhjiXTSt/Ptp+8WAD8S4ftbp8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9uDWUZr4luXWdnTf2iwzde6Mb0sFbvi6b4gScOh8HMW1I9kTc
	uNGT9xgDttn1zBpCHdO3VC6kiAJj3/4peQrBWw8P4lb9GJXc93WzlgpehzYxKQ==
X-Google-Smtp-Source: AGHT+IEUI4NSEkGO+6SsmB2bVAPJV0pkEawMS79wssmcY3Eaiv48fMiaTGfPLVgAJtuQ1qj/bsD4Ow==
X-Received: by 2002:a05:6512:3c87:b0:53d:a2cb:349e with SMTP id 2adb3069b0e04-53dab291a9amr4294289e87.4.1731915925866;
        Sun, 17 Nov 2024 23:45:25 -0800 (PST)
Message-ID: <de8c88d4-5b79-41eb-955a-d015ef94aa15@suse.com>
Date: Mon, 18 Nov 2024 08:45:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86/ucode: Fix cache handling in
 microcode_update_helper()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241112211915.1473121-1-andrew.cooper3@citrix.com>
 <20241112211915.1473121-3-andrew.cooper3@citrix.com>
 <c25b7a62-fc47-440f-9521-f11b65e2cb8b@suse.com>
 <babfdcb5-c23f-4a18-b1bb-52026f9bf2f7@citrix.com>
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
In-Reply-To: <babfdcb5-c23f-4a18-b1bb-52026f9bf2f7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.11.2024 19:03, Andrew Cooper wrote:
> On 14/11/2024 11:26 am, Jan Beulich wrote:
>> On 12.11.2024 22:19, Andrew Cooper wrote:
>>> microcode_update_cache() now has a single caller, but inlining it shows how
>>> unnecessarily complicated the logic really is.
>>>
>>> Outside of error paths, there is always one microcode patch to free.  Its
>>> either result of parse_blob(), or it's the old cached value.
>>>
>>> In order to fix this, have a local patch pointer (mostly to avoid the
>>> unnecessary verbosity of patch_with_flags.patch), and always free it at the
>>> end.  The only error path needing care is the IS_ERR(patch) path, which is
>>> easy enough to handle.
>>>
>>> Also, widen the scope of result.  We only need to call compare_patch() once,
>>> and the answer is still good later when updating the cache.  In order to
>>> update the cache, simply SWAP() the patch and the cache pointers, allowing the
>>> singular xfree() at the end to cover both cases.
>>>
>>> This also removes all callers microcode_free_patch() which fixes the need to
>>> cast away const to allow it to compile.
>> I'm sure you're well aware that this in turn is just because of your opposition
>> to xfree() and alike taking const void *.
> 
> My opposition, and the C standards committee, and MISRA to name but a few.

The C standard's committee - yes, if we mean to stick to free()'s properties
to the letter (I don't think they have any idea about unmap-like things). For
Misra though, would you mind educating me where they would have a concern?

Jan

