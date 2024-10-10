Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F584997E91
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 09:47:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815604.1229585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1synsP-0005kQ-Bi; Thu, 10 Oct 2024 07:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815604.1229585; Thu, 10 Oct 2024 07:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1synsP-0005hV-8M; Thu, 10 Oct 2024 07:46:25 +0000
Received: by outflank-mailman (input) for mailman id 815604;
 Thu, 10 Oct 2024 07:46:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1synsN-0005eJ-9x
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 07:46:23 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bde42b8c-86db-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 09:46:21 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53993564cb1so695953e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 00:46:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a7f24574sm48666066b.50.2024.10.10.00.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2024 00:46:20 -0700 (PDT)
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
X-Inumbo-ID: bde42b8c-86db-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728546381; x=1729151181; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yBFbtpsNxcKFnfYflurJWYgY7VsZT6VjBajSlF0bRFc=;
        b=ZyCCx5V771kpD/susT4300VfWllN2X9c6X07AGvyG9hD2Jj9XkGSxCYcY1eiWGHBOh
         TXU/56ff0ZrB7OgaL/63N7lfbbXZKugwOuwFwD4BtJIqYhapYj5pggbrPTW2h9KRJY1V
         mGXsoVm7m0m5gZPVZnbPFy5m7MvSkYHLDjGZFnBzpiFniCXsbbkjv3Sr41jUPd1GUhEx
         oqEZzcbyEs0YG7OqBFJXp2KwEioiyQzeHa1As0JREauU5UkV5lMufwpu+QJcERkKKtcn
         SXsoscQwZMxNHrQsmc7vmd2uEDPojC6AbWPkcKlX6Cvi1MOu3Jz3bBaBHKR0YvXi01YB
         I5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728546381; x=1729151181;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBFbtpsNxcKFnfYflurJWYgY7VsZT6VjBajSlF0bRFc=;
        b=eH6RKu7YPY7wsIdhybtYY/aRA7Zuu2ngkHXc37yDYTJbBv9EB1tiISZqWnvv1YgOyJ
         zi5KxTo88Yui6kU2YlzvWc6TYuGPNFJNQ1uYTbUk2QbA7jTtsGLz3LQjt02WR7eTleOE
         LpXpHgwOeP/K2yL2+1uILOyJhdhtCSjsSpgz55y0LhrcBiB8YbG2T76Y4CYwT/+dSRnO
         /I6TlKKnrPR6ON+CIdf2N7qeo2cfmTFyhz9/RBsk5si3UqYsOgovtE7uE0WvlDOVE4v/
         tKCDN+v52ZlL392MNK+JJ1tp+7Rxtflb0nFJIY4/rx7nWbjdDakks+n5KJlMs+3izNCN
         Hm7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlPY8HSVVbVCsTtXMbuyQ4Fm9f/d/DK921ekgQU5qbYJl/NoT7zS7IYScdQ/FecEM20ae2PPqFa1U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVcPx81oTiXK2TuCLO1ZqaAcdpNCzuEgOkB0kTCX5dyHbuDTeH
	A16AZHil4Sk3/Tcmlvo+4HhBwiBYUQAQhTfTCm5175ufOeuVXIoow04YCq6Bzg==
X-Google-Smtp-Source: AGHT+IHUkhRpNg9Czdodp7FJCafGHla0ZGWQtV3z+Rp14N+WflY8NEDuODURYp0jA9jyR/tl/y7x4w==
X-Received: by 2002:a05:6512:10d3:b0:530:aea3:4659 with SMTP id 2adb3069b0e04-539c4892bd7mr3121372e87.9.1728546380629;
        Thu, 10 Oct 2024 00:46:20 -0700 (PDT)
Message-ID: <effce766-687b-4cbc-b5e3-46dd7a194370@suse.com>
Date: Thu, 10 Oct 2024 09:46:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/11] xen/x86: Add supporting code for uploading LAPIC
 contexts during domain create
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-5-alejandro.vallejo@cloud.com>
 <acb85f02-351d-4ca2-9fd2-276276ed1c8e@suse.com>
 <D4RFD776JP2U.373W6D66DFGC6@cloud.com>
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
In-Reply-To: <D4RFD776JP2U.373W6D66DFGC6@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.10.2024 18:44, Alejandro Vallejo wrote:
> On Wed Oct 9, 2024 at 2:28 PM BST, Jan Beulich wrote:
>> On 01.10.2024 14:38, Alejandro Vallejo wrote:
>>> If toolstack were to upload LAPIC contexts as part of domain creation it
>>
>> If it were to - yes. But it doesn't, an peeking ahead in the series I also
>> couldn't spot this changing. Hence I don#t think I see why this change
>> would be needed, and why ...
> 
> Patch 10 does. It's the means by which (in a rather roundabout way)
> toolstack overrides vlapic->hw.x2apic_id.

Oh, indeed - I managed to not spot this. I think you want to either re-word
the description here to make clear there's actually a plan to do what is
being said as purely hypothetical, or simply fold the patches.

>>> would encounter a problem were the architectural state does not reflect
>>> the APIC ID in the hidden state. This patch ensures updates to the
>>> hidden state trigger an update in the architectural registers so the
>>> APIC ID in both is consistent.
>>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>> ---
>>>  xen/arch/x86/hvm/vlapic.c | 20 ++++++++++++++++++++
>>>  1 file changed, 20 insertions(+)
>>>
>>> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
>>> index 02570f9dd63a..a8183c3023da 100644
>>> --- a/xen/arch/x86/hvm/vlapic.c
>>> +++ b/xen/arch/x86/hvm/vlapic.c
>>> @@ -1640,7 +1640,27 @@ static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
>>>  
>>>      s->loaded.hw = 1;
>>>      if ( s->loaded.regs )
>>> +    {
>>> +        /*
>>> +         * We already processed architectural regs in lapic_load_regs(), so
>>> +         * this must be a migration. Fix up inconsistencies from any older Xen.
>>> +         */
>>>          lapic_load_fixup(s);
>>> +    }
>>> +    else
>>> +    {
>>> +        /*
>>> +         * We haven't seen architectural regs so this could be a migration or a
>>> +         * plain domain create. In the domain create case it's fine to modify
>>> +         * the architectural state to align it to the APIC ID that was just
>>> +         * uploaded and in the migrate case it doesn't matter because the
>>> +         * architectural state will be replaced by the LAPIC_REGS ctx later on.
>>> +         */
>>
>> ... a comment would need to mention a case that never really happens, thus
>> only risking to cause confusion.
> 
> I assume the "never really happens" is about the same as the previous
> paragraph? If so, the same answer applies.

Yes.

> About the lack of ordering in the migrate stream the code already makes no
> assumptions as to which HVM context blob might appear first in the vLAPIC area.
> 
> I'm not sure why, but I assumed it may be different on older Xen.

I agree with being flexible here; I'm not aware of anything in the migration spec
(and certainly not in the unwritten v1 one) mandating particular ordering.

Jan

