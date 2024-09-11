Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A8F974E61
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 11:19:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796319.1205846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soJVa-0001Mf-CD; Wed, 11 Sep 2024 09:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796319.1205846; Wed, 11 Sep 2024 09:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soJVa-0001Jg-8n; Wed, 11 Sep 2024 09:19:30 +0000
Received: by outflank-mailman (input) for mailman id 796319;
 Wed, 11 Sep 2024 09:19:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soJVY-0001Ja-LJ
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 09:19:28 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0e50f22-701e-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 11:19:26 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c3ed267a7bso2089794a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 02:19:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76f27sm5150007a12.66.2024.09.11.02.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 02:19:25 -0700 (PDT)
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
X-Inumbo-ID: f0e50f22-701e-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726046366; x=1726651166; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rBq45GUCZoEeIXYSDFfILe0zt18u+wzDp+fWiV3U1xI=;
        b=EPhqf1Fv0G8wRyJpFvCg6gESWyGwB6OrpToi8J/XAJvo99wXyc2JtfxUi2nnVs/fGa
         oOLZbvY66r14uYKJ+BMUzqfTL4WSbr6Rc7jnE3Ez7jgs857xTWMJFwa+nBcixSGjEtz2
         2iAeQDjFXU9VopeHDubPLxfM50CuFrkrEmn2AuLZGUK8ePh33mZoYbDBPVgmVhz+Qjek
         NbScp7mcgcNK23NvMnssZTHQGoF21GVW5XC/qZ64AdyQ3GWV1kjlYLvn7httKhSWLQda
         32TLfL2hsadkElOk5WWJcWo6m/WXHilDsAEmERPsjEuumQ0taUK5vwW8fJXqLWReZUVt
         8Xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726046366; x=1726651166;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBq45GUCZoEeIXYSDFfILe0zt18u+wzDp+fWiV3U1xI=;
        b=T+qDIdPkE1zC6fN/t/MFF+MAn7zkrbNcZRG9CKysg3pSVru/szOCKnK0wEwp6MF9Vs
         p6gaboeRREseFwIbYGxGwAw3JBHnyD5C8a5WSwAJYnVPJOjIy/U9bXqf+ftHZrUtFqAE
         qVAHQ4ZO6krPhFBydhfHyuWzIvjbdmL9k1Nc1Q9ojWJuCMXgsY4DKFCy5uU62Zj1Y92p
         DHhX+lACmySjmWgFnPX4Pbl4G4AgWUIvesCYJRMFMz7Dfte2sqxgqw7TDfBwHGqqMGAU
         iw+7d5RsBPvi1mwuv4ioFrr5TFo6pnWvgjsl7xqHnrVRP5ybcUth4yRqViC7qboiuZvQ
         5ifA==
X-Forwarded-Encrypted: i=1; AJvYcCUNr9GS70+zrxlVbq1MzZTpPtHrqD8tKN/5rRKezydigKxuqIsuDDX8Yy+LpIfl1LHRUw0W91EH4Hc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6y8idm0mu1UES5wzIvTr1/Dx+KCpmYwY6gNB8LLQ+WtMEBd+m
	c7WNbaT9to9UhOy2MBgUwufEiC81dT3ctSjUGDSIw+IOzccrQ4xkhmvwRxHTRA==
X-Google-Smtp-Source: AGHT+IFgjva9sZ/QWXfG3sAHKup0y33Jlw7W97/SFlGMPIM5XgygOR1wxB2MF/NzW9XzRz0ilXbejg==
X-Received: by 2002:a50:c90b:0:b0:5c3:d0d9:dafb with SMTP id 4fb4d7f45d1cf-5c40bc2e01dmr1163722a12.18.1726046365848;
        Wed, 11 Sep 2024 02:19:25 -0700 (PDT)
Message-ID: <3f876b0d-8f2e-4f92-8c94-db16d89fc102@suse.com>
Date: Wed, 11 Sep 2024 11:19:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] x86/HVM: drop stdvga's "vram_page[]" struct member
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cd97dd61-c75c-4ab6-b36f-b2b035c4a564@suse.com>
 <abbd917c-d13d-4572-ae9e-1c413c7d4cf2@suse.com>
 <6feab1d8-54fe-4dfb-8e4d-7e5b22099482@citrix.com>
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
In-Reply-To: <6feab1d8-54fe-4dfb-8e4d-7e5b22099482@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.09.2024 20:28, Andrew Cooper wrote:
> On 10/09/2024 3:41 pm, Jan Beulich wrote:
>> No uses are left, hence its setup, teardown, and the field itself can
>> also go away. stdvga_deinit() is then empty and can be dropped as well.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>,

Thanks.

> although I think there's more to do.
> 
>> --- a/xen/arch/x86/include/asm/hvm/io.h
>> +++ b/xen/arch/x86/include/asm/hvm/io.h
>> @@ -111,12 +111,10 @@ struct vpci_arch_msix_entry {
>>  };
>>  
>>  struct hvm_hw_stdvga {
>> -    struct page_info *vram_page[64];  /* shadow of 0xa0000-0xaffff */
>>      spinlock_t lock;
>>  };
> 
> I'm pretty sure you can drop the lock too.  It's taken in accept(), and
> dropped in complete(), but there's no state at all to be protected.
> 
> stdvga_mem_accept()'s return value is a simple expression of p.

I think you're right. Previously I was assuming the lock was (also) about
serializing the bufioreq sending, yet ioreq_send_buffered() has its own
serialization. And hence yes, with all other state gone, the lock can go
too, as can ...

> With that dropped, the complete() handler disappears, and it's the only
> hvm_io_ops->complete() handler in Xen so the whole field can go.

... this hook.

> So I'm pretty sure there are 2 more patches that ought to be part of
> this series, which go in a further negative direction.

Will do.

Jan

