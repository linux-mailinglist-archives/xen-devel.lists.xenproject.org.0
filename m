Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB40FA90470
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 15:34:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956098.1349604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u52tn-00080Z-4o; Wed, 16 Apr 2025 13:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956098.1349604; Wed, 16 Apr 2025 13:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u52tn-0007z0-23; Wed, 16 Apr 2025 13:33:55 +0000
Received: by outflank-mailman (input) for mailman id 956098;
 Wed, 16 Apr 2025 13:33:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u52tl-0007nd-BW
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 13:33:53 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f12525f-1ac7-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 15:33:51 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39ee682e0ddso249900f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 06:33:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43cb29sm17148749f8f.76.2025.04.16.06.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 06:33:50 -0700 (PDT)
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
X-Inumbo-ID: 6f12525f-1ac7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744810431; x=1745415231; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SZd9tlIV0ow4F22V7CoFyY97vTWF0opytI2WGOTmgw0=;
        b=TYCHS0oUBQEypZ1lWUdK90sy0yuMwsPpZGQVA4WHB/sjT1trIDFjHxMBq5uH1UfWSU
         EAWYgq32tAefX6t4A1INdQhSoP8IRf+LAGSz/0KVC8MOuZqKdb6a9KVXWdmc4hiDibjO
         x+YERx5fb+i+uMbbzgSnSdg4Z4bQEGvqvvCfvwTIQZJscKoCEAMgykdRPTaz4ZOtLVNu
         KrB4Ledau48Cdoj4stxvq9t42pC1mS/iblpOLtFAmFj/L0FsTO5HnL4Hcd3Rksc4axRi
         +bQ8XQakO9xrayzR5yH5ySWPZ0TahGqT9NUGlMVSbh1n+6i+cmklUiYQMhDapkkMrM4Q
         XG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744810431; x=1745415231;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZd9tlIV0ow4F22V7CoFyY97vTWF0opytI2WGOTmgw0=;
        b=TRW9eZGXnXSsOA3w3lKOyqo2sOgfCosO13Nmynw0aPIuEYsLgQUBaVjc/5dOPbSpuk
         onzuUZJyP15s+ynU/VP9u5sX0P/g8WA+6BMfeYI8AiaXdwa6oQaWiquoaSPaGr/ZfD5+
         3/RbN6Ui0Im6Ssx4GTqHYi4N+uCw68j2TO3Q4B9H/g44Gte/ME+chGGLEd7+SXCy4isM
         mlyluZT7urwWCMLO7LayY6jgBXVMrBDMLcz/Im06dWSRio2LWb0zkDQnxK0p9LCHMvO5
         Ykri7/8B/HE7u6qOBkd2VmOIWuHC33FlOxqSUQVxJDlZ/mWrOm8D7RNw1N6fWzgr5gBJ
         imzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFhG6Dcel7gjGlx3ORppp/x1s78GHMzMW5NEYyhhc90xj/n/CBpQsquAMvwUCE7oiRE39OED5vbL8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7v70Dy7oTSkpjOuFlT7xWNaSJmndHZ/NKw60Bp9jeUsXx/ed8
	GvhuxEkwSNkgCyzU6RN/+kYq9GVgg64jF/YUIv5d3Qfm4LChHD4vdJtz4PR8xQ==
X-Gm-Gg: ASbGnctUAZtevPajO5o/tTKHvrwGuddFtaIWd/ifJUFJ3qa/K+padDbuZpx67r08thM
	OuiLXw5oeaBoP6fnrt/5OBBoqhlnOTz6SLI96B6tA8XjHFMYcITdKkojqIMCqyHC7nLmTT6Txl1
	X2sdKmv1YoDlDrKWXjrApxwuyE/u1ZEgecdFlUouWp0k6sAqjXTvjkvlIfd25lMF+8mlGdBXKvq
	FVgvGndiJg0sUPhMwauV9FIG6eKbyWIZH1fHK5H9es4CdNYqLGepvs3sssLJTHUjDAJpb3z7vI2
	+umXkkVGP87VozQ2yVNtSR090UPWgPwTJDcg+j9VV94ZOYfEd87wNUXLL/QE7iEgD4dl4AG2VlG
	JQjBiIR7OQpZc3SzavBoJf9ET5w==
X-Google-Smtp-Source: AGHT+IGNs6P2ffpVtz4TlVjy7uRdtY7HwSwhw9U99wz77oJrDnAHvwTvw8EaG75inT2Dt4VZx9oLbA==
X-Received: by 2002:a05:6000:1a8b:b0:391:4bfd:6d5 with SMTP id ffacd0b85a97d-39ee5bb1a1emr2024771f8f.52.1744810430773;
        Wed, 16 Apr 2025 06:33:50 -0700 (PDT)
Message-ID: <73c8dacd-c1d7-459e-ac18-decaa5c9c5bd@suse.com>
Date: Wed, 16 Apr 2025 15:33:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/16] x86/boot: introduce boot domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Alejandro Vallejo <agarciav@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-2-agarciav@amd.com>
 <141229a0-2cd2-4886-b5e5-02c85b0ca5ab@suse.com>
 <7fa754f8-d785-45d8-b9da-de5c85bc793b@apertussolutions.com>
 <f0a14866-0f38-4f8d-8e11-993a58c7da7b@suse.com>
 <644cdc5a-b96a-4e43-ae7a-4cadda1d1084@amd.com>
 <3832bb2b-978c-4990-928c-c18a003adcf4@apertussolutions.com>
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
In-Reply-To: <3832bb2b-978c-4990-928c-c18a003adcf4@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.04.2025 15:02, Daniel P. Smith wrote:
> On 4/10/25 16:56, Jason Andryuk wrote:
>> On 2025-04-10 11:01, Jan Beulich wrote:
>>> On 10.04.2025 15:09, Daniel P. Smith wrote:
>>>> On 4/9/25 02:24, Jan Beulich wrote:
>>>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>>>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>>>>>
>>>>>> To begin moving toward allowing the hypervisor to construct more 
>>>>>> than one
>>>>>> domain at boot, a container is needed for a domain's build 
>>>>>> information.
>>>>>> Introduce a new header, <xen/asm/bootdomain.h>, that contains the 
>>>>>> initial
>>>>>> struct boot_domain that encapsulate the build information for a 
>>>>>> domain.
>>>>>>
>>>>>> Add a kernel and ramdisk boot module reference along with a struct 
>>>>>> domain
>>>>>> reference to the new struct boot_domain. This allows a struct 
>>>>>> boot_domain
>>>>>> reference to be the only parameter necessary to pass down through 
>>>>>> the domain
>>>>>> construction call chain.
>>>>>>
>>>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>>>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>>>>>
>>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> I have to object because the meaningless rename is going cause
>>>> significant pain in the rebase of the follow-on series for no improved
>>>> code clarity.
>>>
>>> Sorry, then an incremental patch undoing the rename that happened (with
>>> appropriate justification) will need proposing - the patch here has gone
>>> in already.
>>
>> Coming from a Linux background, ramdisk seemed more natural to me.  But 
>> looking at hvm_start_info, the fields are called module there.  And 
>> since we shouldn't tie this to the Linux naming, the more generic 
>> "module" name seemed fine to me.
> 
> Again, as I have stated, ramdisk is not a Linux only concept. In fact, 
> as Jan points out, initrd/initramfs are Linux specific implementations 
> of a ramdisk for which Xen doesn't even fully support. I am inclined to 
> ask the inverse of why hvm_start_info uses the name module. But that 
> aside, let's consider the fact that the field is only populated by the 
> device tree when a module type of BOOTMOD_RAMDISK is matched. And all 
> the uses of the field are when its value is stored into a local variable 
> called initrd.
> 
> Though the biggest irony is that generally obtuse abstraction are 
> routinely blocked unless there is a tangible future case. Yet none was 
> offered in the comment. Thus on that principle alone, a request for a 
> tangible future use should have been requested and provided for the 
> change to be considered.

Does it even need to be a _future_ use here? Aren't you working on
abstracting domain creation, suitable (in principle) for all architectures?
Isn't therefore a more generic name (as "module" is) preferable over a more
specific one?

Jan

