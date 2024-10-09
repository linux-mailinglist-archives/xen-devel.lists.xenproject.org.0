Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE18099602D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 08:55:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813750.1226766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syQb2-0003K2-0O; Wed, 09 Oct 2024 06:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813750.1226766; Wed, 09 Oct 2024 06:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syQb1-0003IX-Th; Wed, 09 Oct 2024 06:54:55 +0000
Received: by outflank-mailman (input) for mailman id 813750;
 Wed, 09 Oct 2024 06:54:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syQb0-0003A6-Cy
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 06:54:54 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6303dbbb-860b-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 08:54:53 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c91e5bf6efso682722a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 23:54:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994d5745e2sm437333366b.23.2024.10.08.23.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 23:54:52 -0700 (PDT)
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
X-Inumbo-ID: 6303dbbb-860b-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728456893; x=1729061693; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ft6UkXLQS7If4k2EgtzOTIc8mRyscossG+LRnlaN2L0=;
        b=ZouAsIZWqbYGKNSrvzvk6mcAObk7UARC086a9esmGa5YrFbaMO3HYoev3j/wHMLCnV
         cgF1bVxPduJb6iQ3WQLTTRNlCzSdt0dbiJ7rN2bZf8HmZHXjlAIKpOQ0JB82iL+7WfGg
         CIytrFc85dBrGqx1XS46E6AuU6fW54xv68BPP/Qibtk7Tee5w+rgb3XT7Iquo/CPx0wW
         xKstLb9/z61tm5yvpMOZYS9oDM+ESvotSoMZ1zIwNUsx50OkHqP7TUUSBq46vGNbNxty
         zkedAM36f/MhLHQSgg7nJyoo/QDAuyMHRNaYSkSNVqRBSx/MoOotSxQ23vL6BXmwDmqC
         NX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728456893; x=1729061693;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ft6UkXLQS7If4k2EgtzOTIc8mRyscossG+LRnlaN2L0=;
        b=UXfutUNvpnQn3YsGfVtays+ExJVQkqdH73rdg7SFptzp1GJbTpnybK40ziF2ll42fL
         Wl4Z7F95sGBWgiP8WDGk5OX0JfyjC6BiCrzh0k7K5S+wARi+/CQMljQXYeWcMROA5HCf
         Yil6Zb8b58sIjslYpF4XQGBCsmeDvXWXMIX8xFMKdSTqPPFCkeVFLXgT2uAOqPNeVkWB
         0Y8OrSE3DR8j0ZeBzzC8xEnM69he24MUf/xJH+z+zsrw9jvJ82KGSN5ojeMZK8lsbfw1
         GwLtge1BVxjEZaJyVIEap9vMne1w93dtMMR0PGmM+f5+DVV0Cpbl+bXsLu2kFhSg/pGf
         IVmg==
X-Forwarded-Encrypted: i=1; AJvYcCXLcgFoiG+l4LVFnNhYqW7yg/hxMPeYAVs9f5+QYi3luhJxjoHhBcJGPhgW6SsV65cFcic7tMoeW0E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMI+JimeqsCITYcUmz3abjMrJpilUtqtXoBXtZzvQdBfEAh3hO
	XSaK2H/PiN4fgtRH+8j8ZR+JwUADT4arxw08y8ndkxbVH3GYHfz8086Lf7Sg2w==
X-Google-Smtp-Source: AGHT+IE2sww8yUX+aoH3CcBXPvb+8ZUE0MKi09dUpHh1BLuWHCG3U6E9sPj/gTiY0cIjFov/MdWtEA==
X-Received: by 2002:a17:907:c890:b0:a99:4e74:52aa with SMTP id a640c23a62f3a-a998b45edcamr150773066b.33.1728456893043;
        Tue, 08 Oct 2024 23:54:53 -0700 (PDT)
Message-ID: <ea688319-e53e-4d29-b6b7-54ec097d629d@suse.com>
Date: Wed, 9 Oct 2024 08:54:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 39/44] x86/boot: introduce domid field to struct
 boot_domain
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-40-dpsmith@apertussolutions.com>
 <a51d0a6e-7050-44af-9a66-edbfba67bab1@amd.com>
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
In-Reply-To: <a51d0a6e-7050-44af-9a66-edbfba67bab1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.10.2024 21:36, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> Add a domid field to struct boot_domain to hold the assigned domain id for the
>> domain. During initialization, ensure all instances of struct boot_domain have
>> the invalid domid to ensure that the domid must be set either by convention or
>> configuration.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/include/asm/bootdomain.h |  2 ++
>>   xen/arch/x86/setup.c                  | 12 +++++++-----
>>   2 files changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
>> index 4285223ac5ab..d6264d554dba 100644
>> --- a/xen/arch/x86/include/asm/bootdomain.h
>> +++ b/xen/arch/x86/include/asm/bootdomain.h
>> @@ -11,6 +11,8 @@
>>   struct boot_module;
>>   
>>   struct boot_domain {
>> +    domid_t domid;
>> +
>>       struct boot_module *kernel;
>>       struct boot_module *ramdisk;
>>   };
> 
> Oh, you should probably move domid after the pointers to avoid a hole.

That would only move the hole to the end of the struct.

Jan

