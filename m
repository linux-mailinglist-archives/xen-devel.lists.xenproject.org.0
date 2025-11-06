Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A009C3B666
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 14:47:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156965.1485904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH0Ka-0005EQ-O3; Thu, 06 Nov 2025 13:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156965.1485904; Thu, 06 Nov 2025 13:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH0Ka-0005CF-L7; Thu, 06 Nov 2025 13:47:16 +0000
Received: by outflank-mailman (input) for mailman id 1156965;
 Thu, 06 Nov 2025 13:47:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vH0KZ-0005C9-2T
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 13:47:15 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19b413f8-bb17-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 14:47:14 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-640c48b3b90so1077572a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 05:47:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f7139bdsm1868137a12.4.2025.11.06.05.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 05:47:12 -0800 (PST)
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
X-Inumbo-ID: 19b413f8-bb17-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762436833; x=1763041633; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L3AbpyYwSqCxvM/Tkgw+VkYmaSYN1ATWzlJnRnGy5lI=;
        b=gUHDUGn1Z1kOlgueKpZNS3slL1lvdkCX7M85nN5XAUS8y+krJ15evP+Z9KkiRPgjGq
         yXTHVi3aA8FK6p9rVtJCqGIW2xYg2N5JQuYSM7DnYJapteEeTbjx7r+NwyBNwdNLWuhy
         Jtmd89O2/2kjXrB+pLPIk3s0e6sopsAOEmJEp39aGdRFjuvnJY1zHkcpQPc+CUd34vGD
         RxdvrVFxsxoK4EwaKAqvTqSSBPtXxwuq+PE5+EiQZY4XRiVR+R6Fe8/816hCe6g3qggr
         rQFuZFOeEu7QmZuD+hXpjk/wBrWn4CT4EENGov4siCxYjWIhMiUEPTtqW48qXINJ3Ywu
         EzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762436833; x=1763041633;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3AbpyYwSqCxvM/Tkgw+VkYmaSYN1ATWzlJnRnGy5lI=;
        b=Dv4lZdfWri8mkpRhu7jJDCF0YsZpSIF04kRg50GGF8UPZjUkudYKkTjukU/u6MNTUb
         o0e9vJ5vp/qj5ZyXCqocE3YVZVFEV6sySdRwsVPQAfo82M/lNG/0p6qWsddTb5cHogpu
         L+ZkB/tDaWAoCguI7tXPfrU81PpZxMxEgVGTq5ZJ6ZcqI6bXispClKDtdiLTx/XrGrks
         FcxuKJK94/FxUEMgcD4r7X+gNzqE3UWWf986CkpZdzMm3ZcOK217mvyZHKR1mJQ1J46T
         q7vc02Tbgxu3LziHBxfKCEhCQyh/WvUkvm0FN4Wg6k2eZTqNMNA+5dzaoa5sBuzw7pM0
         CjWA==
X-Forwarded-Encrypted: i=1; AJvYcCX7uP2Eafqnyn9fNnr7g1N2EbErMAHXDeh/YYUk3TerPrJa3LazxxQKKZ6djJzrJFW7mWQKx4VAzes=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHQqZa9SXZKEo3OyJbMg3EiirITtucNjYQ3MNnAkZLzV7E6Xta
	Mlbeiqo0MDyLOaINgCjIVxdV9IB25+SF1Zn/kUMIPVie+KlDQGIaBG9CiQE9Mv1mDA==
X-Gm-Gg: ASbGncuvplCpvWOtUci0juPFFd4sOC75VEN8O/tFrKSxEXTeubkxkrHjOgzX4dgzlgO
	85pexuOnjmUKiqwzUm890ujHLUQTKyl7ircirJDbVqHLR9c360IhHwEzRIwNtudxx/O0JaotzUx
	wW6Ip0Br2Cwjy/a9mp94guJ7KLd2x6FVX922ix+xxVY4VWTUDh9AoK9GoPwnXqavxTqm7wBPXVn
	gz7YnwkE0RWmDXeofTS2eRKdSjk0AJ8Zj/vci3fvALQ9iPJrctiG5Iq02llaQAIUOUs90gT+a1c
	vWdMIhgiQ+O62tsM/QQgNASqXHU4bRENtRE92CY0E7f33I0oon1mv9Pax+L499dcbhIqSdVKXJe
	R5aOUGYvwf9XetJSK3g7BW6Si5DjdTKDjXNQ5JMnPOEKjAsxnQsl60L0cjXdLipLo2GPGAfVi7C
	2HgxW6X1pZPTSWSsa+2SiyUAbAMMeMHCVvLUhuQpQXc/qtb34zMw6JUWDviv/ibHLV6x+FN98q1
	b0osdXwUA==
X-Google-Smtp-Source: AGHT+IEfyYjThR7/ucQ+E4YT4/e1Y5ozQ7IIIxexYvfgVH74tWng8qDGXb6OXIPY692r3VwZ4sSS9w==
X-Received: by 2002:a05:6402:909:b0:641:3189:a183 with SMTP id 4fb4d7f45d1cf-6413189a7femr813497a12.14.1762436833165;
        Thu, 06 Nov 2025 05:47:13 -0800 (PST)
Message-ID: <210edee7-8525-47a9-8191-ea7d94db5fce@suse.com>
Date: Thu, 6 Nov 2025 14:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v7] x86: make Viridian support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20251031161716.1222956-1-grygorii_strashko@epam.com>
 <a4d3eb8d-17ea-4d3c-87ef-ba5c3477b8c3@suse.com>
 <edb590e4-340d-4a0f-9543-0dfdcc7b54b1@epam.com>
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
In-Reply-To: <edb590e4-340d-4a0f-9543-0dfdcc7b54b1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.11.2025 14:42, Grygorii Strashko wrote:
> On 06.11.25 13:35, Jan Beulich wrote:
>> On 31.10.2025 17:17, Grygorii Strashko wrote:
>>> --- a/xen/arch/x86/hvm/Makefile
>>> +++ b/xen/arch/x86/hvm/Makefile
>>> @@ -1,6 +1,6 @@
>>>   obj-$(CONFIG_AMD_SVM) += svm/
>>>   obj-$(CONFIG_INTEL_VMX) += vmx/
>>> -obj-y += viridian/
>>> +obj-$(CONFIG_VIRIDIAN) += viridian/
>>
>> With this, what is the point of the additions to viridian_load_{domain,vcpu}_ctxt()?
>> You're adding dead code there, aren't you?
> 
> Hgrr. And we end up back to v3 regarding this part.
> Check in viridian_load_{domain,vcpu}_ctxt() may/may not work depending on toolstack
> behavior which is not strictly defined (loading HVM_PARAM_VIRIDIAN before/after
> viridian_load_{domain,vcpu}_ctxt()).
> 
> So what's the conclusion here - drop this check?

Well, Misra wants us to not have any dead code. Hence why would we add new
instances of such?

>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -4231,8 +4231,9 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>>>               rc = -EINVAL;
>>>           break;
>>>       case HVM_PARAM_VIRIDIAN:
>>> -        if ( (value & ~HVMPV_feature_mask) ||
>>> -             !(value & HVMPV_base_freq) )
>>> +        if ( !IS_ENABLED(CONFIG_VIRIDIAN) && value )
>>> +            rc = -ENODEV;
>>> +        else if ( (value & ~HVMPV_feature_mask) || !(value & HVMPV_base_freq) )
>>>               rc = -EINVAL;
>>
>> I find the check for value to be (non-)zero a little dubious here: If any caller
>> passed in 0, it would get back -EINVAL anyway. Imo -ENODEV would be more suitable
>> in that case as well. Things would be different if 0 was a valid value to pass in.
> 
> The idea was to distinguish between "Feature enabled, Invalid parameter" and "Feature disabled".

But you don't, or else the addition would need to live after the -EINVAL checks.
I also question the utility of knowing "parameter was invalid" when the feature
isn't available anyway.

Jan

