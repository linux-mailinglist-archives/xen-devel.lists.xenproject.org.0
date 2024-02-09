Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2266884F4D8
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 12:52:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678658.1056122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYPQ1-0004e1-RA; Fri, 09 Feb 2024 11:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678658.1056122; Fri, 09 Feb 2024 11:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYPQ1-0004bg-OO; Fri, 09 Feb 2024 11:51:45 +0000
Received: by outflank-mailman (input) for mailman id 678658;
 Fri, 09 Feb 2024 11:51:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rYPQ0-0004ba-UD
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 11:51:44 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 984462ac-c741-11ee-8a4b-1f161083a0e0;
 Fri, 09 Feb 2024 12:51:43 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33b29b5ea96so443108f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 03:51:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r15-20020a5d4e4f000000b0033b17880eacsm1611218wrt.56.2024.02.09.03.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Feb 2024 03:51:43 -0800 (PST)
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
X-Inumbo-ID: 984462ac-c741-11ee-8a4b-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707479503; x=1708084303; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eX0TodQJ+EiGGJzfw7RdCoXaDa3ajnzOtvqsNFlyrgY=;
        b=BO0PotZBGvVj6MXDfHbZqdZ2FNnj6NWIehisKvevB05cFyB/dAlPGJmYNJDTcWNVJQ
         iJ8x17ugee04/WGIh3efkWhaHbHwozECuJ1DJcp5Hikq8WtvSUaAnqfJJ4iYwZXVQbJs
         rQv/A01JTKhfHSTmWRw153+vdBl0dDG9rVjZo3qn6zn5V1tWVhZv5wwtRugRVDMIFCC/
         LYEjMHNUCcGYuyJ+k/61xyikRq+6tUE+6EzzKG9lYAgjmd6QBKlm3OvVNMGsndQQEw7t
         KhlmjHYjRG3ZgRRoMxxYcOQ6P9K3yzwoRhL/RH6JU+MVLKBrYiFB7i+1mQLALJEAiWSD
         yEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707479503; x=1708084303;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eX0TodQJ+EiGGJzfw7RdCoXaDa3ajnzOtvqsNFlyrgY=;
        b=B72z2wW6/xqyJQhn18+a14Tk1sqyl5CWtxks/U22ocvbl30x8ZIL0QD85/ghsWs1dX
         5CxpL+GdNhACwjsRzxdUU73nJ62AFqwUpMNS8OXb5VdRyhiu4z3Tj6gnmsyRDt8ivJRs
         fo1fy0WbcKfwAbqS89mjij7f5wZi4eR8tcOQJU4fQsF60jbXKm24GYZHCFi5c8LMcrhs
         JG4JtLEZsOnOPdMlF4licmBq4oyXNK+nCMEM89kmHi9leZWBBzUNtn71xh4Va0CHliOf
         LD0NLVb1n0pm0U/n+mytZ49r/xuuewrd8gJwWubovXDAG+Fen188KS8KTQTozUe0aoMO
         gxPw==
X-Gm-Message-State: AOJu0Yz6Hr5r6UTAXhqs1N9iXqjh6RmMQLeOnjIA7QJqDWfNlS8zKq9I
	Z8lOeCNSfRSIArpdSHsoPe4ujulkniZ6pfmsoA3v9pVHNnhyHXsSMe6/cjhQsg==
X-Google-Smtp-Source: AGHT+IGL2wtyj8JoCK4/ne/iuallM0OrjB8j6qE4CPlaM7cJSsRVwv/ka4bYV9bfUzw/f//SV5VwtA==
X-Received: by 2002:adf:a3c2:0:b0:33b:65d3:cd91 with SMTP id m2-20020adfa3c2000000b0033b65d3cd91mr795146wrb.3.1707479503259;
        Fri, 09 Feb 2024 03:51:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWZakR/jEUPbKEmlFMnd1jemDbED3meq/I3zwxkAfk1Yf026SnWEFA6ZRBpetI4i3pDQs990GKmy357tSbDgwaajsZf/wWCpMmef0fedhN0LVAYOXlLCWn4nJLqHHlGGPAoJIHEzwN7hIoHg0AEIFCJfZI/2VBrGZUuVBvfC8E9L2NMvltBxvjAeqDt
Message-ID: <fe22b91e-227c-45df-a39a-dcccd8726cd3@suse.com>
Date: Fri, 9 Feb 2024 12:51:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vmx: add support for virtualize SPEC_CTRL
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240206142507.81985-1-roger.pau@citrix.com>
 <91e3fd09-8325-49b0-9d7b-43aacf2acd81@suse.com> <ZcYCXrEaOyxZUb2I@macbook>
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
In-Reply-To: <ZcYCXrEaOyxZUb2I@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.02.2024 11:45, Roger Pau Monné wrote:
> On Thu, Feb 08, 2024 at 02:40:53PM +0100, Jan Beulich wrote:
>> On 06.02.2024 15:25, Roger Pau Monne wrote:
>>> @@ -2086,6 +2091,9 @@ void vmcs_dump_vcpu(struct vcpu *v)
>>>      if ( v->arch.hvm.vmx.secondary_exec_control &
>>>           SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY )
>>>          printk("InterruptStatus = %04x\n", vmr16(GUEST_INTR_STATUS));
>>> +    if ( cpu_has_vmx_virt_spec_ctrl )
>>> +        printk("SPEC_CTRL mask = %#016lx  shadow = %#016lx\n",
>>> +               vmr(SPEC_CTRL_MASK), vmr(SPEC_CTRL_SHADOW));
>>
>> #0... doesn't make a lot of sense; only e.g. %#lx does. Seeing context
>> there's no 0x prefix there anyway. Having looked at the function the
>> other day, I know though that there's a fair mix of 0x-prefixed and
>> unprefixed hex numbers that are output.
> 
> For consistency with how other MSRs are printed I should use the '0x'
> prefix.

MSRs? It's VMCS fields which are printed here.

>> Personally I'd prefer if all
>> 0x prefixes were omitted here. If you and Andrew think otherwise, I can
>> live with that, so long as we're at least striving towards consistent
>> output (I may be able to get to doing a conversion patch, once I know
>> which way the conversion should be).
> 
> I usually prefer the '0x' to avoid ambiguity.  However this being all
> hardware registers, I might be fine with dropping the '0x' on the
> grounds that all registers are always printed as hex.
> 
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -823,18 +823,28 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
>>>      {
>>>          vmx_clear_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
>>>  
>>> -        rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
>>> -        if ( rc )
>>> -            goto out;
>>> +        if ( !cpu_has_vmx_virt_spec_ctrl )
>>> +        {
>>> +            rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
>>> +            if ( rc )
>>> +                goto out;
>>> +        }
>>
>> I'm certainly okay with you doing it this way, but generally I'd prefer
>> if code churn was limited whjere possible. Here leveraging that rc is 0
>> on entry, a smaller change would be to
>>
>>         if ( !cpu_has_vmx_virt_spec_ctrl )
>>             rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
>>         if ( rc )
>>             goto out;
>>
>> (similarly below then).
> 
> That looks odd to me, and is not how I would write that code.  I can
> however adjust if you insist.  Given it's just a two line difference I
> think it was worth having the more usual form.

As said, I'm okay with the change as is.

Jan

