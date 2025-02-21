Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB7FA3F457
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 13:31:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894448.1303152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlSBn-0005XQ-Cb; Fri, 21 Feb 2025 12:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894448.1303152; Fri, 21 Feb 2025 12:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlSBn-0005Vx-9J; Fri, 21 Feb 2025 12:31:31 +0000
Received: by outflank-mailman (input) for mailman id 894448;
 Fri, 21 Feb 2025 12:31:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tlSBl-0004mk-Nj
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 12:31:29 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6382899-f04f-11ef-9aa9-95dc52dad729;
 Fri, 21 Feb 2025 13:31:29 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5e0373c7f55so3103087a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 04:31:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb8a647c7dsm1100799766b.72.2025.02.21.04.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 04:31:28 -0800 (PST)
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
X-Inumbo-ID: c6382899-f04f-11ef-9aa9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740141088; x=1740745888; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v8PXKGthjgeLdvHB2EDCrMIBZGn63LdpQZaO0CYBUWg=;
        b=SHPVgW0Q3nnrqBMUWzouv3DbNHs4NZq2Bs5iZUt+l92GQrLgsm/d84ycjq2o8XXmhl
         ECGegRprzgEu9QoZ7Alnv1Qg09N8cFgwqjNDYDJQ0UlmVbhIyZK3EeDGeAmzwv9HGXP9
         Ny+2dv3264CpQHevnUVAiiT1zkoOlt0wReS1TXZXMl4xyMjUXt7yaK9UBJ0iJPwtRyra
         +IMm+I7P7tu4bklOlvwjggB4LofPxCeObl36WmVSfERQiqfhZyvonlKPrCliT7DiHPC1
         haRwf5l0MEO8VVtrPmHAxlgadJPVODqRaWBzx/POoWDl/Xry33oXZfd1qIjg8v2hvoqn
         qVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740141088; x=1740745888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8PXKGthjgeLdvHB2EDCrMIBZGn63LdpQZaO0CYBUWg=;
        b=jjGRh3eMh8l7SIzfIqC6RI6HhNgHsoBHk84UZVRlwwsj5PWbJDxo3aHBq2ThZrr1GH
         CjzUzoQgus/TLeXuRaPEsVXzQCOyhJ6ilglXErr1N/Q+eLOjpJF6xQ50EQ6SPrb+9Tvc
         WMijpiEddIy3kUOndo3YmHdp5NEQzR0GDFm5BsTXjcxyURPy0lK+M0z/TmX2KMAc0k1y
         eYUn8nD4hXEKchB6k5yUAsJsor+k3HUaQB7IPTD8m2LH+pDpWZpJa1QoKSJ0BdP4fvn+
         wCOd173vZeZ07O/hUlzndJZE9dA6I6tocNZhgeFFPKo0b+DKzTxOAaZ60Jj4zTSWXBYF
         qbnA==
X-Forwarded-Encrypted: i=1; AJvYcCUhj4Kod/Kr0fi7U4lRK8fQtHvzTXDygJJh4JrJG2kTZZL4xWPIFbzWRqGP3cmsA6LB+AvymwRaq40=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3xIem9JPqjjvEvXT47wKKa6OMMSl/duVY+OVt0n18bTG9TUWt
	IbpZvUZzzL9aOC3a3A07R9uqk0dyiE/7m2IUm3YfMMs8dqgt0WjFw0KFMyjduw==
X-Gm-Gg: ASbGncvz4nRybZkGPItHs4KO1pkCQs4rx6VO1e3UzVSLgDkM2awFvt07KPuHkePz1FU
	mPc31lh6bcb1HVxlfACevKEkj5IAflpyJ7QEI4Z6lVGqTqkZiEX6A1pbD+GFfrkYvNE8brBV7bd
	TDTVacJlYCXcFcvEZmH1esucw8IW33VHqKRBmnSw4Y68b6Fw8gw7FN3FHOP+cI0O7tbtt1ObfSd
	fWOx9JgTi62gUSAw41YyxYoqGDHU7Bs/c08GeZ/LMn9MVEqhiEjvI4jx+Rf57o3DTeU/Wa8KxJm
	C7215hEDoLufx2w1nRQpodltvwlq1gmHDHZPDQuGvBh6Mi182+MN53KeDOj/itJqNp89kFa9gyw
	7j7st2zeB30g=
X-Google-Smtp-Source: AGHT+IFvxLUPoGCmEMDJBgagtArqCMQ86dK8gGZXai50rnS4onrZ2Cm4SNZNYimZsge8O+X6pxTQCg==
X-Received: by 2002:a17:907:948c:b0:ab7:e3cb:ca81 with SMTP id a640c23a62f3a-abc09aac8cbmr326165666b.30.1740141088566;
        Fri, 21 Feb 2025 04:31:28 -0800 (PST)
Message-ID: <f3b34493-9eea-44fa-94ea-722949efeba7@suse.com>
Date: Fri, 21 Feb 2025 13:31:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v7 1/4] automation: drop debian:11-riscv64
 container
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1740071755.git.oleksii.kurochko@gmail.com>
 <659bd8c00e79be1a47fc2aae75accd69b3bedaf4.1740071755.git.oleksii.kurochko@gmail.com>
 <d2a9d3f1-0584-4c9c-95c5-5babf0ffde06@suse.com>
 <d7b833b3-780c-449c-a07b-3b7198a0fa62@gmail.com>
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
In-Reply-To: <d7b833b3-780c-449c-a07b-3b7198a0fa62@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.02.2025 12:57, Oleksii Kurochko wrote:
> 
> On 2/21/25 9:35 AM, Jan Beulich wrote:
>> On 20.02.2025 18:44, Oleksii Kurochko wrote:
>>> There are two reasons for that:
>>> 1. In the README, GCC baseline is chosen to be 12.2, whereas Debian 11
>>>     uses GCC 10.2.1.
>> Which README is this? Not the one at the root of the tree, afaics, which
>> continues to mention only x86 and Arm.
> 
> I missed to add this patch:https://gitlab.com/xen-project/people/olkur/xen/-/commit/57901e60066e93d986670aa91fb390774c965d3f.
> 
> Would it be enough just to do a reply for this patch series and send what git format-patch gives?

Oh, and: The patch description wants to change as well before you send.

Jan

