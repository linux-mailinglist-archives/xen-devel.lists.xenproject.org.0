Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A125859DCE
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 09:07:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682684.1061781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbygN-0002uo-Rd; Mon, 19 Feb 2024 08:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682684.1061781; Mon, 19 Feb 2024 08:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbygN-0002tE-Nj; Mon, 19 Feb 2024 08:07:23 +0000
Received: by outflank-mailman (input) for mailman id 682684;
 Mon, 19 Feb 2024 08:07:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rbygM-0002t8-EH
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 08:07:22 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e851d994-cefd-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 09:07:21 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5129e5b8cecso2258253e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 00:07:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dn23-20020a05600c655700b0040fafd84095sm10449766wmb.41.2024.02.19.00.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 00:07:20 -0800 (PST)
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
X-Inumbo-ID: e851d994-cefd-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708330041; x=1708934841; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cbHN8iehOY44UGITfjPuxpNYlsb4ToDDW5BrYCEfMmg=;
        b=AxPuYZr0PY94eW+aPjq3dxSmdnwn7NU2obos+mAuHD38e/Im1619DnzJOS9be7JCAo
         IF1P0imq4QsO0Mez5XS2g2RD2rC0+IS1iOgFRGYb+dLlsn4r6RQZCk0V1FW0oKlj0577
         x5bXAeer8978IyTmLUFDOb7olk01cHYMuGQ/aqP92wS5G1kA2ZJ3Yi903rpU16UVj662
         h5l/N/SQPXEFk9DNJJ4AMIw7RkonjcuYsH+2avhx2hXfCeCcY8IWrKPNw0BQlvFOOPb+
         SxaftNf6Cv7II+b76IIJCUy3icNEOp8k9tV52nPtMxuy/HRKswnLCQtUJ/w85Y54faTR
         YnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708330041; x=1708934841;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cbHN8iehOY44UGITfjPuxpNYlsb4ToDDW5BrYCEfMmg=;
        b=JXxiJzWUfHgYt0MJVzQXeS1c+8i7kXOCoq09nWW7wh0PCq7/otEs+nk+D7f7wmZY6H
         v6WouzMT0YrEpWQYqZOO+MSCUDn3Ks/42rS7T50pNUTZrhmvN3AK4rlAowMPfNkVzVKu
         BkjBQL8OGo0gUy6opbWX57N3mrBF38J9+mTT0JCzZDXSReBcdF9FuK1P/tEu12/DhJad
         X0H31aT6n5SkwVtz8czK7x6zpHiSvb7Gcyy4n15pccpJxoq8EuHYYux+g+ElfA6YkxEl
         j/cisiuBqjAw74tRCCHPT2+6fXh7B4J/fB0aJXN9mb0NUuemMI+Qap84JMkzeptkTCW6
         Zaeg==
X-Forwarded-Encrypted: i=1; AJvYcCWZLOdPvRVbsSb6sM5Lawl7kQBJqoGZH/1B7ALfwT3tI9j8JhAiBNpTnVX/ccA3J0ixI5rZj/m2PYj6A5eLP8UAHdIO+dThflmX1ejMrJQ=
X-Gm-Message-State: AOJu0YxGMRNbRrZrfoK/xAhx+kPNFg84cE2/OZ3+NcvwKhVNq5l9sSEg
	nconTody1kKqZg7ozHAV5G0IriCiHM7m8u8PDGSPSbyl/S7K6j8NKal7LT7blg==
X-Google-Smtp-Source: AGHT+IFp6Ls6InEyqnx8mGNRGtMKeRWnj/TuRq9D92L9hV/ztymQXfckf+FeyFe+NNrjwO1QVBClZQ==
X-Received: by 2002:a05:6512:234c:b0:512:a8e1:abd1 with SMTP id p12-20020a056512234c00b00512a8e1abd1mr3805101lfu.23.1708330041029;
        Mon, 19 Feb 2024 00:07:21 -0800 (PST)
Message-ID: <a6ee0e99-0df0-40d0-84df-ab62a8dab8a6@suse.com>
Date: Mon, 19 Feb 2024 09:07:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 26/30] xen/riscv: add minimal stuff to mm.h to build
 full Xen
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <369fe9e80d11c5e499810a6819fc1c282ce60628.1707146506.git.oleksii.kurochko@gmail.com>
 <6f5e7e21-067e-4323-88bc-f9b5975e95c5@suse.com>
 <6339742ea1a26c9808b108a1282e521dcf0fc9d0.camel@gmail.com>
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
In-Reply-To: <6339742ea1a26c9808b108a1282e521dcf0fc9d0.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.02.2024 12:03, Oleksii wrote:
>>
>>> +        } free;
>>> +    } u;
>>> +
>>> +    union {
>>> +        /* Page is in use, but not as a shadow. */
>>
>> I'm also pretty sure I asked before what shadow this comment alludes
>> to.
> I missed your request about 'shadow' before.
> 
> The comment arrived from Arm.
> 
> I tried to find out the answer by investigation how 'inuse' is used,
> and, unfortunately, I couldn't find an answer what 'shadow' alludes to.

That's from x86'es shadow paging, where a page can serve as a "shadow" of
a guest page table page.

Jan

