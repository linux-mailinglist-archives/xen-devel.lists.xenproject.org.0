Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8849658DA
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 09:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786234.1195795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjwFw-0004w1-EH; Fri, 30 Aug 2024 07:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786234.1195795; Fri, 30 Aug 2024 07:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjwFw-0004uV-BN; Fri, 30 Aug 2024 07:41:16 +0000
Received: by outflank-mailman (input) for mailman id 786234;
 Fri, 30 Aug 2024 07:41:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q2fe=P5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjwFv-0004uP-9x
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 07:41:15 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b6d2aa2-66a3-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 09:41:13 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f3f07ac2dcso16548711fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 00:41:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c7bf75sm1605470a12.54.2024.08.30.00.41.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 00:41:12 -0700 (PDT)
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
X-Inumbo-ID: 3b6d2aa2-66a3-11ef-a0b1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725003673; x=1725608473; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YYH2sn2oQE6qGAyiuI1lWBLefo0YZ9BTGfkr9+Sg5JM=;
        b=RN1CKKnToH2Zfj9othyw1edzmPmtQRR3N5rOOzlWPkFmJ7vimvFzroL4u7GOgieVfl
         qXzU98pRNx+gypOhFWMFaofNpHpoTDQnTHqWI+kN3pUrVXciVcB75bUHijq5vW2gQdRr
         pFZQ67KPXdA3/1v26u8UTrK5hjcdL1qQL5jYRVM2ubHb7eBwGZ8hkK3qSk7jMXGrNO5L
         ueAQZ1KmFQCQnA/aRdwheESQ/7SH++FsXJk5b8svD0aX/l4dQFM0j3Hy1Z323XXf/+DJ
         8C9F2dLTgYqKpIMB2G2TIWeHBPUTTUOf+jEiNbPM0UBSBi90u9WlJoVj21iw26sBNS1L
         mQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725003673; x=1725608473;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYH2sn2oQE6qGAyiuI1lWBLefo0YZ9BTGfkr9+Sg5JM=;
        b=NfruHLjdChmYWw8UXtPJe5aE4vxI7yoxNvjHCcxhfPD2kDg48AnCVBpadeqD9q/8rW
         4wVxbBYg0J23a/164g83djZY3EYGng1Hr/m/2HzP7y2q52CYKa55G2wqzwUR0jMGih6G
         rTEkzzVQ7VFRBmzd6HNTOnMncp7yRxUftlq6fAbh4qO7qMCYUF3JJ5XDgFRgbr67baYx
         Mk4Sd7enKwK6QAvR7nifdpdwerB2s3NYl5RhVZfw+q5hABxdlvxEAErDQBaDTS9RP0hg
         kmwug+1NMpoOB0J8FTk4edY6ExmOy43MwqMVe/O385b8KOkfbZ05Dk8f7wDpyhJ/HXWy
         2fhw==
X-Forwarded-Encrypted: i=1; AJvYcCX5KOK6/mM8iRadfzGO7XL40k+UBcvhll4sN96owUyyuU+bJP66uhU6kw1xJK5ATitXuvWtz1z9osw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLuL2iKrg7HbS8UYil/nxPo4GUYNzeGiOwOc697toHgCui4LhP
	gLVn2Yi+Jyo9LOTvhimFADJFan1jBGc0T2dImkbH9CU51f0pVXeMwIBJ2uunVA==
X-Google-Smtp-Source: AGHT+IEixPUtc8uieyCMor6sv8U7YbGEwTATR2wGFKl1GiPhNCiUCJqTfwueXGJTy+kEEf0OO9Ii8Q==
X-Received: by 2002:a2e:b889:0:b0:2f5:966:c220 with SMTP id 38308e7fff4ca-2f6103a5272mr36795041fa.20.1725003672646;
        Fri, 30 Aug 2024 00:41:12 -0700 (PDT)
Message-ID: <92a35397-9fd0-40de-b0b5-228a7962a661@suse.com>
Date: Fri, 30 Aug 2024 09:41:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/5] x86/spec-ctrl: configurable
 Intlel/AMD-specific calculations
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
 <b789679a7edd41c88eca41d3c703d2292cfcce0e.1723806405.git.Sergiy_Kibrik@epam.com>
 <1f3772da-94cc-465e-bcc2-2d857ebe8552@citrix.com>
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
In-Reply-To: <1f3772da-94cc-465e-bcc2-2d857ebe8552@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.08.2024 21:25, Andrew Cooper wrote:
> On 16/08/2024 12:14 pm, Sergiy Kibrik wrote:
>> Put platforms-specific code under #ifdef CONFIG_{AMD,INTEL} so that when
>> corresponding CPU support is disabled by configuration less dead code will end
>> up in the build.
>>
>> This includes re-ordering of calls to ibpb_calculations() & div_calculations(),
>> but since they don't access common variables or feature bits it should be
>> safe to do.
>>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>> CC: Jan Beulich <jbeulich@suse.com>
> 
> Sorry, but no.
> 
> This logic is security critical, highly fragile, gets chopped/changed
> multiple times a year (as researchers keep on finding new things), and
> all major work is done to it under embargo.
> 
> Just look at the history of the file.
> 
> The ifdefary around the tsx_init() call is bad enough and I intend to
> revert it and do that differently.  I would have objected if I'd got to
> the patch in time.
> 
> 
> The only relevant cost in this file is whether I (and the other security
> team members) can edit it correctly or not in staging and all prior
> in-support branches.  You really don't want to know how many times
> there's been a bug in backports...
> 
> Saving 451 lines from certification is not cheaper than the
> problems/risks you're introducing with this change.

Did you see my earlier reply? I don't think the issue is with hiding source
lines. We want to have the compiler DCE stuff wherever possible, hence why
I did respond asking to switch to IS_ENABLED(). That imo fits pretty well
with the vendor checks we have there already anyway.

Jan

