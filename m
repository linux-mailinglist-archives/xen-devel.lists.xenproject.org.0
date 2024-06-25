Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0912791604C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 09:47:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747352.1154736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0tK-0003pE-73; Tue, 25 Jun 2024 07:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747352.1154736; Tue, 25 Jun 2024 07:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0tK-0003nF-4J; Tue, 25 Jun 2024 07:47:02 +0000
Received: by outflank-mailman (input) for mailman id 747352;
 Tue, 25 Jun 2024 07:47:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sM0tI-0003Ct-2K
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 07:47:00 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a5643c4-32c7-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 09:46:59 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ec50a5e230so36180471fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 00:46:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706510854cbsm7429236b3a.43.2024.06.25.00.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 00:46:58 -0700 (PDT)
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
X-Inumbo-ID: 1a5643c4-32c7-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719301619; x=1719906419; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kEeFvuMCDNOqvQJ4XM1nNXDHo8tCOhCvv5tYOD/B6Dg=;
        b=TBSR0kopViYGnX9If8bMKM2VeDXO97dQ9am0415/IOT0MTYEMXOeBZy2280Jxef/k+
         mVILF5cCmEy6vLCysdbMKWD4RXgB8Kz1FeFNrdIOzzlLWqZtcI3+JL4XTwj67uzjbZi5
         vrSfZ3agrL2k+3mILGpNLleQx0NQohuPkjR54hysbN1mRZwWx81L6Pr7ZG8i8PLppu9k
         x9q7kz5NBya8lcRVPpeWZxrDDl8FYi3+Mk27k8ccv1H8loAACaPfAWwPoA3+YImasjoU
         B8ZfBKOaTYlxlKh1HJjxk5P2+zH+ZgKaeRiJvk65f+PCKw289R29i9BVjW58qQebFO/h
         qWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719301619; x=1719906419;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEeFvuMCDNOqvQJ4XM1nNXDHo8tCOhCvv5tYOD/B6Dg=;
        b=BVcr5w+iIvCeJFxFU9Rtuft9InH3PNzaWUZlGKOhhITU+4xJKUay0nNBBUKKEnD14c
         Hhqdx5a/QyoZd+KI2iPUAk1jV9wBX0VJkHuRKWijU7X9n4LZ2y7nisznM3cr7FXAlfIS
         oi53/Cip9UYnush3jQ2JcPONR4SyWsEm+x7/KbykNzQ+dTb8lVEBt7NJo6SVFh6EMKRW
         dX42IKWmgKIXF91iK28zvU4vzYvVl/jxBeQXiW3iiOpLVVU/2c0ToNAIknjjSh3K4agD
         GpnqV2q0t2dFvQBFNiOzqgCBI2HWDKBJwXs5ORYThLQ+S/YaraoI1LCZ0dAoXeTop6WR
         6LWg==
X-Forwarded-Encrypted: i=1; AJvYcCVv8Bg4P78D5s05S2HC+nHodinjlDQELgvyHtyyPFgbsmDLNHJhAW1udGH93YcAvbMpx59vFX0YDFA2OxC4p7D2KRySreMWBXTasuvUQag=
X-Gm-Message-State: AOJu0YymDz2W6V0oRkE55Nd1omS3TAjcBKg6au2FT6sHNymnCAjE4ZGc
	t30oT6Up9l5hmxSEHfOWyuCu12Ug606dFO5aie+7F5MdB8knjzyqQKTit+9whA==
X-Google-Smtp-Source: AGHT+IG2Ai9+CTpH1tBZJpF0Yl7MxAtHCFQEWClQSpqHv2oRnY0NgryWGUsdN1v3XjaD89d0N3bBtw==
X-Received: by 2002:a2e:3518:0:b0:2ec:5759:bf2f with SMTP id 38308e7fff4ca-2ec5b26954amr37131171fa.7.1719301618823;
        Tue, 25 Jun 2024 00:46:58 -0700 (PDT)
Message-ID: <360fae9f-4632-420b-a517-ff1926a24f3e@suse.com>
Date: Tue, 25 Jun 2024 09:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 07/13] x86/hvm: address violations of MISRA C Rule
 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719218291.git.federico.serafini@bugseng.com>
 <a20efca7042ea8f351516ea521edccd89b475929.1719218291.git.federico.serafini@bugseng.com>
 <087eb879-b3f6-4d1a-a52e-1e27337620c9@suse.com>
 <d1d6fda5-c619-4578-9a21-7da1a9810044@bugseng.com>
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
In-Reply-To: <d1d6fda5-c619-4578-9a21-7da1a9810044@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 09:21, Federico Serafini wrote:
> On 24/06/24 17:32, Jan Beulich wrote:
>> On 24.06.2024 11:04, Federico Serafini wrote:
>>> @@ -2674,6 +2674,7 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
>>>   
>>>       default:
>>>           ASSERT_UNREACHABLE();
>>> +        break;
>>>       }
>>>   
>>>       if ( hvmemul_ctxt->ctxt.retire.singlestep )
>>> @@ -2764,6 +2765,7 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
>>>           /* fallthrough */
>>
>> What about this? It doesn't match anything I see in deviations.rst.
> 
> The last item for R16.3 in deviations.rst explicitly says that
> existing comment of this form are considered as safe (i.e., deviated)
> but deprecated, meaning that the pseudo keyword should be used for new
> cases. We can consider a rephrasing if it is not clear enough.

Apologies. I mistakenly looked at grep output rather than actual file
contents. Please disregard this comment of mine.

>>> @@ -5283,6 +5287,8 @@ void hvm_get_segment_register(struct vcpu *v, enum x86_segment seg,
>>>            * %cs and %tr are unconditionally present.  SVM ignores these present
>>>            * bits and will happily run without them set.
>>>            */
>>> +        fallthrough;
>>> +
>>>       case x86_seg_cs:
>>>           reg->p = 1;
>>>           break;
>>
>> Why the extra blank line here, ...
>>
>>> --- a/xen/arch/x86/hvm/hypercall.c
>>> +++ b/xen/arch/x86/hvm/hypercall.c
>>> @@ -111,6 +111,7 @@ int hvm_hypercall(struct cpu_user_regs *regs)
>>>       case 8:
>>>           eax = regs->rax;
>>>           /* Fallthrough to permission check. */
>>> +        fallthrough;
>>>       case 4:
>>>       case 2:
>>>           if ( currd->arch.monitor.guest_request_userspace_enabled &&
>>
>> ... when e.g. here there's none? I'm afraid this goes back to an
>> unfinished discussion as to whether to have blank lines between blocks
>> in fall-through situations. My view is that not having them in these
>> cases is helping to make the falling through visually noticeable.
> 
> I looked ad the context to preserve the style
> of the existing cases.
> 
> What do you think about:
> -keep the existing style when a break needs to be inserted;

Even that may be a judgment call, I'd say. But commonly: Yes.

> -no blank line if a fallthrough needs to inserted.

Yes here, but others (Andrew?) may disagree with me.

Jan

