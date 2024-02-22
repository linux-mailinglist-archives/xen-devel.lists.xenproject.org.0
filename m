Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2110285FBD7
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 16:06:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684461.1064323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdAdW-0003GJ-Kn; Thu, 22 Feb 2024 15:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684461.1064323; Thu, 22 Feb 2024 15:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdAdW-0003E3-HH; Thu, 22 Feb 2024 15:05:22 +0000
Received: by outflank-mailman (input) for mailman id 684461;
 Thu, 22 Feb 2024 15:05:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rdAdU-0003Dx-9U
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 15:05:20 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9d780f6-d193-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 16:05:18 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56454c695e6so1806877a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 07:05:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 em8-20020a056402364800b005652389a8b9sm922226edb.11.2024.02.22.07.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 07:05:16 -0800 (PST)
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
X-Inumbo-ID: c9d780f6-d193-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708614317; x=1709219117; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VC908Y92RI65RPaybLWx5sFvrvu8aEfhnIPjrp0p2/k=;
        b=TA1djCiimKt1IMHd+46h1tOSkOvgZeiY18TOh5eOQ9T7SQZ/4Jisgx0cyGeVHqbCYh
         ODEl/FIvB78Ry9oKgnLrFkPcIOLgUBhp9pf+TQmev89kDmUu/gdV4SniAJg+BHdslSuw
         jeqTOMGFdedrhzoUxFSWFwQ9Mo1Z8VAa/g2elg3oI0C/xXKQQUN/nDxDLJChllf9ecSC
         ErNwPw127ThwT59gjeWkVKVwNPwAZKE2AHBLRe0kADCuCKshZUkYWhpxarbnerglvC9t
         /WVmaNITcpQVON4z5qvh+5+2gNTDjY+qOFK1siqKFjTNTtvIg/TnyUtcnEYbUcOd+lBf
         xdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708614317; x=1709219117;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VC908Y92RI65RPaybLWx5sFvrvu8aEfhnIPjrp0p2/k=;
        b=eaduam4+8Qhc/WU0O1+OUdOMTe5YnMUl/Q3hRO36QkdEnlOmeQzc6obAg5wjpMlUgv
         HzhtBJe8MBtQ5HGw1gh0kNS9tz707EBa/rceyIudQgbhCb7kvZfqMuZeothd7f0ctdXB
         dReOVWr2cK3XvuX2a1k/Q0JMRVXLiQD80NuV8UlKWb4ol/BpaqhNt6MorALl+DQHwsxe
         wachJyal7RCjTkbBDBCUHbBidgQ4NavHGmXR5b9Wv2qIZWW91a0ubt3yrdTrMh6Bk8sV
         YWAb70kZ3oIAHnVzCLqryln5exLuGt/WNicijwogJeyH0zmjfGth94qeI/IG7HTpIY4n
         EgKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTSiUZ6B/6x8tZGp61Tz1GrjGEMeMEsf6fNyOqbGQcrkBeW+TjV6xV/mFlLA6RcfR01ZfV8ObUVPqpwQn3m4Kyi7HSwzkrEkvQUDEFMGc=
X-Gm-Message-State: AOJu0YzBoEoQ3HrCQYZxu6xTv1mbcdZO2rZVuXwdruFmoI7OV/pEp+Ha
	PhKFDByHyeQRPT4m99eFscmPNNAwN61zYgxy8p56qJyT7e0AkSTZW+POIEEzcA==
X-Google-Smtp-Source: AGHT+IGdWqQol7qeXwuwWvkMLmgV48dZ227GYIX1gCB7P2039NhGRafa922tP8YA38wAm1jFQVY6mg==
X-Received: by 2002:a05:6402:d4f:b0:565:32ec:204b with SMTP id ec15-20020a0564020d4f00b0056532ec204bmr1845137edb.2.1708614316755;
        Thu, 22 Feb 2024 07:05:16 -0800 (PST)
Message-ID: <34c2c2a9-85e9-4caf-a936-b574ac710ee5@suse.com>
Date: Thu, 22 Feb 2024 16:05:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] svm/nestedvm: Introduce nested capabilities bit
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-7-george.dunlap@cloud.com>
 <8ee35193-9715-4c4b-a1cb-11af04c4dab9@suse.com>
 <CA+zSX=YuLmZRz=1wwV=svOrhfQ66E-CZ9TEtqNCVM++JVQ5CzQ@mail.gmail.com>
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
In-Reply-To: <CA+zSX=YuLmZRz=1wwV=svOrhfQ66E-CZ9TEtqNCVM++JVQ5CzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.02.2024 15:33, George Dunlap wrote:
> On Tue, Feb 20, 2024 at 12:25 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 06.02.2024 02:20, George Dunlap wrote:
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -3021,6 +3021,9 @@ const struct hvm_function_table * __init start_vmx(void)
>>>      if ( cpu_has_vmx_tsc_scaling )
>>>          vmx_function_table.tsc_scaling.ratio_frac_bits = 48;
>>>
>>> +    /* TODO: Require hardware support before enabling nested virt */
>>> +    vmx_function_table.caps.nested_virt = vmx_function_table.caps.hap;
>>
>> This won't have the intended effect if hap_supported() ends up clearing
>> the bit (used as input here) due to a command line option override. I
>> wonder if instead this wants doing e.g. in a new hook to be called from
>> nestedhvm_setup(). On the SVM side the hook function would then be the
>> start_nested_svm() that you already introduce, with a caps.hap check
>> added.
> 
> I take it presmp_initcall()'s are guaranteed to run before __initcall()'s?

Yes - the former happen ahead of AP bringup, the latter after.

>> Since you leave the other nested-related if() in place in
>> arch_sanitise_domain_config(), all ought to be well, but I think that
>> other if() really wants replacing by the one you presently add.
> 
> Ack.
> 
> I'll probably check in patches 1,2,3, and 5, and resend the other two,
> unless you'd like to see all the changes again...

No need imo to re-post anything that was agreed upon.

Jan

