Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B399BAFCB
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 10:36:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829893.1244812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7tVQ-0005Hw-B5; Mon, 04 Nov 2024 09:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829893.1244812; Mon, 04 Nov 2024 09:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7tVQ-0005FV-8J; Mon, 04 Nov 2024 09:36:16 +0000
Received: by outflank-mailman (input) for mailman id 829893;
 Mon, 04 Nov 2024 09:36:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r6Gf=R7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t7tVO-0005FN-4K
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 09:36:14 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39730870-9a90-11ef-99a3-01e77a169b0f;
 Mon, 04 Nov 2024 10:36:10 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9a68480164so629183466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Nov 2024 01:36:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c1185b4bsm12615033f8f.112.2024.11.04.01.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 01:35:58 -0800 (PST)
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
X-Inumbo-ID: 39730870-9a90-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzUiLCJoZWxvIjoibWFpbC1lajEteDYzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM5NzMwODcwLTlhOTAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNzEyOTcwLjMzNjY0NCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730712970; x=1731317770; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DvnLglFM1tuDsFW4OVsCzZpsadjdbj0baeGOeNTrx9w=;
        b=DtV6L+bak5oRDjXKFXnkNuCYWLuaHUTZc+SlszyOao7F1hU87VGkzgwsHXbGZRlTWK
         Fsa6k50OrB3lfr51FUr0LKPcbeSUroD4fgWG+ASYfGblkFtvY+N3LQexEC9DjjUm7Gs5
         FQZwUVes/8GuIpsBlP+WYQ73RtejFF7Nmf+2/o/CJ8Bcz9er2TolhkU8JirO50xL13Op
         W8elpJpuAun97qPkDtD1q1me8SeJkcIuCeh7aDBHO6irQKpbzw7V1Ypemmj58ECDSUTz
         I45HW55JpaTrRIU1wSBeFHEOr/x8ON5zsd/k7c17RBUWjQPlaBGQhOHNhpRlzPspPxpv
         4Z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730712970; x=1731317770;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvnLglFM1tuDsFW4OVsCzZpsadjdbj0baeGOeNTrx9w=;
        b=E8KkFr6fjX5yBHFpCFNkEOiFTir7+1lVdP89pc9jM84odpNDev42w332gf+Fu6jlOa
         MUMZlBnalwmsdlrzVAVO3fGDuaIqY9HPFNXDVwBkX+cdjj733s0qzbr/RM2RXhbq0VQK
         1Ln9r6PP4weZfrZAolbPynb37k5HUSIQyJ9Rkkr6rPkrS1bsFtt+v26VqVuW8KaAV7Rg
         kpGfb7iWgVlOpHLYVXz5gueyO2F+qwZWE/aACE8geDo6ulBdlHMAnL4Z6nYHisPY4SHE
         pzIaYAW5BvpuMNTl9dWoNLefABEW+cj17PiAndLdAZEQJYl/PPoHR5SyP3yKQ5yBb5wd
         6G3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4cTCaFBQgseK2alaeb1YDo+bs6mbTnebdaVVk7v6p6abG/nd36PyODpx45DWMPVX6w5egkDcgx9M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykL72W7VAqnyJuQI0iaZtamXqlTq8HQymcRHNTCHNaL+ts3sDU
	AfK6an5E4cgAo8M9GmMpehx5YuIzsK76u1ERL8HCMhfNHX5R31FugEOhiyF6z2R2UWNntl3rltA
	=
X-Google-Smtp-Source: AGHT+IHZ7BrWYcUt2Uw2nWsW6Ms380kvbhoRwkrwwcd62jENrG27uR94gEELpuHEx1TB1jPI8C5jkg==
X-Received: by 2002:a05:600c:3ca3:b0:42f:823d:dde9 with SMTP id 5b1f17b1804b1-4319acbba20mr298609145e9.21.1730712958947;
        Mon, 04 Nov 2024 01:35:58 -0800 (PST)
Message-ID: <7b4015a0-9d02-40a9-9919-10e7bdd73291@suse.com>
Date: Mon, 4 Nov 2024 10:35:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] xen: add bitmap to indicate per-domain state changes
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-3-jgross@suse.com>
 <6823a222-63ad-4a5a-83d2-70c6f39f38c0@suse.com>
 <fadbb6da-a314-4f1b-8a59-92c1c201dd09@suse.com>
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
In-Reply-To: <fadbb6da-a314-4f1b-8a59-92c1c201dd09@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.11.2024 07:48, Jürgen Groß wrote:
> On 31.10.24 11:59, Jan Beulich wrote:
>> On 23.10.2024 15:10, Juergen Gross wrote:
>>> Add a bitmap with one bit per possible domid indicating the respective
>>> domain has changed its state (created, deleted, dying, crashed,
>>> shutdown).
>>>
>>> Registering the VIRQ_DOM_EXC event will result in setting the bits for
>>> all existing domains and resetting all other bits.
>>
>> That's furthering the "there can be only one consumer" model that also
>> is used for VIRQ_DOM_EXC itself. I consider the existing model flawed
>> (nothing keeps a 2nd party with sufficient privilege from invoking
>> XEN_DOMCTL_set_virq_handler a 2nd time, taking away the notification
>> from whoever had first requested it), and hence I dislike this being
>> extended. Conceivably multiple parties may indeed be interested in
>> this kind of information. At which point resetting state when the vIRQ
>> is bound is questionable (or the data would need to become per-domain
>> rather than global, or even yet more fine-grained, albeit
>> ->virq_to_evtchn[] is also per-domain, when considering global vIRQ-s).
> 
> The bitmap is directly tied to the VIRQ_DOM_EXC anyway, as it is that
> event which makes the consumer look into the bitmap via the new hypercall.
> 
> If we decide to allow multiple consumers of VIRQ_DOM_EXC, we'll need to
> have one bitmap per consumer of the event. This is not very hard to
> modify.
> 
> If you'd like that better, I can dynamically allocate the bitmap on
> binding VIRQ_DOM_EXC and freeing it again when unbinding is done.

I'd prefer that indeed, yet I'm also curious what other maintainers think.

Jan

