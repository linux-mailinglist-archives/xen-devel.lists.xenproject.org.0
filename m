Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA67894A1D0
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 09:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773230.1183675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbbBu-0001ad-Qk; Wed, 07 Aug 2024 07:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773230.1183675; Wed, 07 Aug 2024 07:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbbBu-0001YW-NE; Wed, 07 Aug 2024 07:34:38 +0000
Received: by outflank-mailman (input) for mailman id 773230;
 Wed, 07 Aug 2024 07:34:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbbBt-0001YN-Nn
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 07:34:37 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f05b484-548f-11ef-bc04-fd08da9f4363;
 Wed, 07 Aug 2024 09:34:36 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2f0dfdc9e16so17825001fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2024 00:34:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c0ca17sm616541366b.84.2024.08.07.00.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 00:34:35 -0700 (PDT)
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
X-Inumbo-ID: 7f05b484-548f-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723016075; x=1723620875; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KewNuW9n1edfIS0RiACMpFknIvW8EA2RWi5tQI1QLCs=;
        b=Wuk3rk1g/2/ucv3w0UCpiHQyHUz1o1abpenS8H2mtEWxH8eFsoU20xQ3596WnVc1r1
         6cUIzznc0Okyu0xtJxzLZrlKDL0hdlXoZsQaQb8FKIW8Uif81KqsRJNPnErP1j2fQkct
         XWIxUoGPRznUj6U5EQC9xiM47c2pozxe8P453Q2LmPCUmIZs7TcO9RahCwNmNdiGsit9
         c0nILiHWYYBtUnQC4c2QQ/7nfSxHdWPff33Nix7e4vNZ0OP/6saaNxiDOmu7DHPhez1Y
         KpdPpfVQ8lD/yU8/TUS5cXOAGxMosXbZbSjkWkj+PHLX3//RU2cz5gblN0SfNjT3PjKQ
         kUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723016075; x=1723620875;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KewNuW9n1edfIS0RiACMpFknIvW8EA2RWi5tQI1QLCs=;
        b=K0WoOJLCnKrMi3eDt7ObrhlfGReUmtSU0VQyCbl0Qr5oXUNaeDvrNjFQhNleuiuFJM
         cVUhxu5Rs0303+bs0yJLl/sdawqp7ZAFGJUQcjDhHpadZuoZKnNkEn4s/YU22YtHs53M
         g2/0vKgJ8AP0GH4vrZLhzm9n6KgrI07MYpkPRWFPfCpB6ByKdfB+sv5CG42ySELiwA3Y
         Zw0/YUBTnafY8vNq9hiK5nUWzk8tSsMZSZNdxk3DqstUyRBpApr/pICaqqT18dpxUMQt
         sMyrjz4Kpz27civJTb4HXnydpQ+N7eYOnje/tRTfwO4nluCJXLlHAjKlCG9C4xJfS2HJ
         nDvw==
X-Gm-Message-State: AOJu0YzyCSpsnEFdEWm8dJ8LMgKSfCqNeBLcybd3rt8LSHFymAny+c9C
	9zHG6K+AU+xRkqnbzRVnKzXjyXAztWOtODRi8Kiw8LS+zwYLi/9O6WapcdhgeQ==
X-Google-Smtp-Source: AGHT+IGgjFLQstj05pJ7r+3mPVx3HlePyDeUNg+hQQiKQXuBVzNn0t3O2ayROtkvB19LSjnGhAgTng==
X-Received: by 2002:a05:6512:2804:b0:52e:fc01:ddfa with SMTP id 2adb3069b0e04-530bb387c7cmr11515116e87.7.1723016075340;
        Wed, 07 Aug 2024 00:34:35 -0700 (PDT)
Message-ID: <d4ea2213-4c12-40d2-ba12-64f2e7e492c6@suse.com>
Date: Wed, 7 Aug 2024 09:34:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: don't call ->read_segment() with x86_seg_none
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <81ae365f-98b4-4bb6-bbb6-c5423dfda038@suse.com>
 <alpine.DEB.2.22.394.2408061117080.4954@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2408061117080.4954@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.08.2024 20:24, Stefano Stabellini wrote:
> On Mon, 5 Aug 2024, Jan Beulich wrote:
>> LAR, LSL, VERR, and VERW emulation involve calling protmode_load_seg()
>> with x86_seg_none. The fuzzer's read_segment() hook function has an
>> assertion which triggers in this case. Calling the hook function,
>> however, makes little sense for those insns, as there's no data to
>> retrieve. Instead zero-filling the output structure is what properly
>> corresponds to those insns being invoked with a NUL selector.
>>
>> Fixes: 06a3b8cd7ad2 ("x86emul: support LAR/LSL/VERR/VERW")
>> Oss-fuzz: 70918
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Looking at oss-fuzz's report and at this patch I think it is correct
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

S-o-b?

> That said, there are a few other places where read_segment is called
> without any checks for seg being x86_seg_none. The hvm implementation of
> read_segment (hvmemul_read_segment) seems to return error if
> x86_seg_none is passed as an argument, but there is no return error
> checks any time we call ops->read_segment in x86_emulate.c.

There is a pretty limited number of cases where x86_seg_none is used.
For example, state->ea.mem.seg cannot hold this value.
realmode_load_seg() also cannot be passed this value. We could add
assertions to that effect, yet that can get unwieldy as further
x86_seg_* enumerators are added (see "x86: introduce x86_seg_sys"; I
expect we'll need at least one more when adding VMX/SVM insn emulation,
where physical addresses are used as insn operands).

> It seems that there might still be an issue?

In my auditing I didn't spot any.

Jan

