Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDDE9566D0
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 11:23:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779488.1189200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfybJ-00061z-9S; Mon, 19 Aug 2024 09:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779488.1189200; Mon, 19 Aug 2024 09:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfybJ-00060T-65; Mon, 19 Aug 2024 09:22:57 +0000
Received: by outflank-mailman (input) for mailman id 779488;
 Mon, 19 Aug 2024 09:22:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sfybH-000607-PN
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 09:22:55 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ce12ac9-5e0c-11ef-8776-851b0ebba9a2;
 Mon, 19 Aug 2024 11:22:53 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5bf068aebe5so147006a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 02:22:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838d001fsm610619466b.84.2024.08.19.02.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 02:22:52 -0700 (PDT)
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
X-Inumbo-ID: 9ce12ac9-5e0c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724059373; x=1724664173; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TiZrJCg3oByHdETQZAoNBJWOB6MWW/UFvhhA0Wkz8w0=;
        b=aIuYTx9vgEvMD1BzehlUK0WXZ7pbBNN5qIAtE8jQdDp60elspexpOGi4aRoi5LHm+P
         3wWX18fkrMr1XoALPyHzytIUX+1lJIpQFSem0HVA5KBeDY8J5AirPSgvHITLesgRTAUY
         UFp6U3ewnaRkQ9i6HMrYbUe7o691h0nMTDHTewog9jImWp5dIpqHpYVZCvCHjR1SbtWv
         ybCI4XV99k07mzbdvStfiAseJxGOSCaSInCo9VPnc9GWkeRNqpY5CFOj4DR+INdBmanL
         rxQ13awEJhuIn6bTBE+saxwnN0ol/2DyjGMXhrsVICaaj0wV/CStSFiCO3Ob/MRBJu2i
         tfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724059373; x=1724664173;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiZrJCg3oByHdETQZAoNBJWOB6MWW/UFvhhA0Wkz8w0=;
        b=TZz1BBp7K3jLZgMpX+WFs6D91QsNdrMaVERomE9Bn/IJg5LK6hsL+KVN/tr5vns4qf
         ggjEStUCUBCCC0ZBsrhuQWD8Tt1WdIDJcellxCU1hZAfUeDG1QZuZmsdqXofn3LrJt8h
         BUJcPif2hyXlwbvP2NqdrHwv3sE5siZDj1cWZxuJFzFFydbrFa4zHtdTOe31n8o14m5r
         xrx2Kdo9wO8DBQBr4JUT4c/Yjr3gaaJMssW4DV+bcKoR2/o6C24xK21IZgI5C95TMwof
         QcgHjtrw2XuzgPc/wT0uj3KQzbRkaqUNU+qTMam0XT3gO29Wfms+Plblp3bjO1yTM6Q1
         FVJA==
X-Forwarded-Encrypted: i=1; AJvYcCWakCd4A9MY8tRBh9tFhFPfDhF+2IRRDwG6PqB//sXBjq4Du8ijKMSxqLiwdJj/vondurgqNLqhhOBSYr+It2rUKAxj/55CI7JEwfaHPuc=
X-Gm-Message-State: AOJu0YxEwlNBUSmggVvE76L0o7bB6q4OHlPaR+g2p32xG93PJq4xiW/3
	L3j0YXfzxrm2I4pWivgHYVmfKG8o4Zw7oq4Xamwwlzggdw1PhZHBViwqc6GFPg==
X-Google-Smtp-Source: AGHT+IHHIOgPq3ZWNozzUwnF3NpuWg0psKGdLqG/A+ES7HK+IJ4VGIMMuHmu70/TifI+aPc7sXbeog==
X-Received: by 2002:a17:907:3f0f:b0:a7a:9d70:82b9 with SMTP id a640c23a62f3a-a8392930c5dmr717029866b.17.1724059373197;
        Mon, 19 Aug 2024 02:22:53 -0700 (PDT)
Message-ID: <0f17e8ff-caef-4494-8478-c8203992c1df@suse.com>
Date: Mon, 19 Aug 2024 11:22:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] x86/ucode: Utilize ucode_force and remove
 opt_ucode_allow_same
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240725082725.2685481-1-fouad.hilly@cloud.com>
 <20240725082725.2685481-5-fouad.hilly@cloud.com>
 <f0925d77-db8d-410c-873f-0bf38727aca9@suse.com>
 <CAJKAvHY1CiXM+S1TNLrasPFZZPrdZo5QsJvhxCbptJFPyBqtqA@mail.gmail.com>
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
In-Reply-To: <CAJKAvHY1CiXM+S1TNLrasPFZZPrdZo5QsJvhxCbptJFPyBqtqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.08.2024 10:57, Fouad Hilly wrote:
> On Mon, Jul 29, 2024 at 12:30 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 25.07.2024 10:27, Fouad Hilly wrote:
>>> --- a/xen/arch/x86/cpu/microcode/core.c
>>> +++ b/xen/arch/x86/cpu/microcode/core.c
>>> @@ -90,6 +90,11 @@ struct ucode_mod_blob {
>>>      size_t size;
>>>  };
>>>
>>> +struct patch_with_flags {
>>> +    unsigned int flags;
>>> +    struct microcode_patch *patch;
>>
>> Pointer-to-const? If the const was omitted here just because of
>> microcode_free_patch(), then I think the issue should be taken care
>> of there.
> 
> This struct is required as is, I initially added a similar struct with
> const (which was removed in v6).
> updated control_thread_fn()
> -static int control_thread_fn(const struct microcode_patch *patch)
> +static int control_thread_fn(struct microcode_patch *patch,
> +                             unsigned int flags)

And why's that change necessary, other than to cater for the omitted const
in the struct?

Jan

