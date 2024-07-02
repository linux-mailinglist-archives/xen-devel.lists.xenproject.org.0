Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9D19238EC
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 10:53:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752085.1160216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOZ86-0000vi-AF; Tue, 02 Jul 2024 08:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752085.1160216; Tue, 02 Jul 2024 08:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOZ86-0000tP-6h; Tue, 02 Jul 2024 08:44:50 +0000
Received: by outflank-mailman (input) for mailman id 752085;
 Tue, 02 Jul 2024 08:44:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WXFQ=OC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOZ84-0000tJ-9x
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 08:44:48 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 559916f0-384f-11ef-a59d-41c015c667e1;
 Tue, 02 Jul 2024 10:44:46 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2eaae2a6dc1so51287991fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 01:44:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fad58f5f1dsm65612565ad.54.2024.07.02.01.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 01:44:45 -0700 (PDT)
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
X-Inumbo-ID: 559916f0-384f-11ef-a59d-41c015c667e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719909886; x=1720514686; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uxjq6ObVcuKBDxQRvpbX/yQKx09IVAzZODL5DefPg9g=;
        b=ab7ZTT1SfvR38U9K/8SgxbN4rAolvHBenDXFikkKCkUlztkZe3TLMLjpYoWshNBn+z
         KVqUmO9/LZhe4kULH66ABxCQXFzwR9uiVFEvHIxc8NFPC3jLIaaAgbiwfQkGYCWLmmjd
         +hzBv/OUk+rU8WrFGpUZrdqYtOlEp3mXegkCwSXchS79ofyon8hEAVE1I0QQ7mWVWz2Y
         UBGGuoHkvzzMgK4bQTbG+qjR+EjIzQ4alDSO0GMbg2t0HM5Y38VIV9+fXNT01R2udVVY
         1yDEdyn8cf4h1008mOICQG1qz0ROJGXIWK4R/TIWGEhCPG8eomi496XKexhIrGiN76WP
         huKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719909886; x=1720514686;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uxjq6ObVcuKBDxQRvpbX/yQKx09IVAzZODL5DefPg9g=;
        b=OZ2fGv7kaeQF4UMM6jRR+bWugF35CsO91ZuOk1oXYzrEqhWnZNigYZSR9BTnCERzXy
         0hqc986+t8GKknmziA9Vjfuuq73PzK/zoyBTS8PwN1X/lyID7tO8SR4kBaD3eS1fji0X
         bTZygFbVdUv/88ceg8qgk3AaqjZTflaFAb9PQbdarspZFhwReMXAY4bGBsMwlGmL6DqO
         hzHqaJcGUMseU9tu5fCPEUedGsUo5Qr9BGZAJwBqI6K9UKgwbiqDqnaQ2B04uiaMHLkT
         Yz6n4ikqC9qHXcPbSPrUpOFYI0ogeUjfvePi+ZGKMz/DmJHXyCqln9iJzRPIgNqJHoIs
         7yTA==
X-Forwarded-Encrypted: i=1; AJvYcCXG3GbeJ7U6cECQDwgDrGaUvx6olS7g+G71zbULoDKUbq+/V4xjXNYqrHnIXSamkNlxO1d7qewRiViFaXdM0SK4sURs+IJxFEZpmUwUjJ4=
X-Gm-Message-State: AOJu0Yyxj8AIxUC5FpTJrnqGA0AomJo/qmMNwdWfurg34kBp0vPvXjDm
	YtFO9r2AXvOB+IGYwJqkB1LI8mIuVWA3JVseoC0grJL1kyS+estJL/GWnwALfQ==
X-Google-Smtp-Source: AGHT+IE7Uy08cpVdCW2nMjUoNB0Hq23JbGEC81eA8OVHFavR5+uKS5aK5neX5Si5mNskIvxfyj7fyA==
X-Received: by 2002:a2e:a418:0:b0:2ec:557b:f895 with SMTP id 38308e7fff4ca-2ee5e4b91cdmr65157301fa.31.1719909885596;
        Tue, 02 Jul 2024 01:44:45 -0700 (PDT)
Message-ID: <d1b22fa7-870e-4968-ba5d-c5d6fccb0af7@suse.com>
Date: Tue, 2 Jul 2024 10:44:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v11 2/8] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-3-Jiqian.Chen@amd.com>
 <9a311ee0-dcf2-4609-aced-7f57b322da5f@suse.com>
 <BL1PR12MB5849C3882D31620ADAC55ADAE7DC2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849C3882D31620ADAC55ADAE7DC2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2024 05:15, Chen, Jiqian wrote:
> On 2024/7/1 15:44, Jan Beulich wrote:
>> On 30.06.2024 14:33, Jiqian Chen wrote:
>>> If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
>>> a passthrough device by using gsi, see qemu code
>>> xen_pt_realize->xc_physdev_map_pirq and libxl code
>>> pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
>>> will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
>>> is not allowed because currd is PVH dom0 and PVH has no
>>> X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.
>>>
>>> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
>>> PHYSDEVOP_unmap_pirq for the removal device path to unmap pirq.
>>> And add a new check to prevent (un)map when the subject domain
>>> has no X86_EMU_USE_PIRQ flag.
>>>
>>> So that the interrupt of a passthrough device can be
>>> successfully mapped to pirq for domU with X86_EMU_USE_PIRQ flag
>>> when dom0 is PVH
>>>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> You keep carrying this R-b, despite making functional changes. This can't be
>> quite right.
> Will remove in next version.
> 
>>
>> While functionally I'm now okay with the change, I still have a code structure
>> concern:
>>
>>> --- a/xen/arch/x86/physdev.c
>>> +++ b/xen/arch/x86/physdev.c
>>> @@ -323,6 +323,13 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>          if ( !d )
>>>              break;
>>>  
>>> +        /* Prevent mapping when the subject domain has no X86_EMU_USE_PIRQ */
>>> +        if ( is_hvm_domain(d) && !has_pirq(d) )
>>> +        {
>>> +            rcu_unlock_domain(d);
>>> +            return -EOPNOTSUPP;
>>> +        }
>>> +
>>>          ret = physdev_map_pirq(d, map.type, &map.index, &map.pirq, &msi);
>>>  
>>>          rcu_unlock_domain(d);
>>> @@ -346,6 +353,13 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>          if ( !d )
>>>              break;
>>>  
>>> +        /* Prevent unmapping when the subject domain has no X86_EMU_USE_PIRQ */
>>> +        if ( is_hvm_domain(d) && !has_pirq(d) )
>>> +        {
>>> +            rcu_unlock_domain(d);
>>> +            return -EOPNOTSUPP;
>>> +        }
>>> +
>>>          ret = physdev_unmap_pirq(d, unmap.pirq);
>>>  
>>>          rcu_unlock_domain(d);
>>
>> If you did go look, you will have noticed that we use "return" in the middle
>> of this function only very sparingly (when alternatives would result in more
>> complicated code elsewhere). I think you want to avoid "return" here, too,
>> and probably go even further and avoid the extra rcu_unlock_domain() as well.
>> That's easily possible to arrange for (taking the latter case as example):
>>
>>         /* Prevent unmapping when the subject domain has no X86_EMU_USE_PIRQ */
>>         if ( !is_hvm_domain(d) || has_pirq(d) )
>>             ret = physdev_unmap_pirq(d, unmap.pirq);
>>         else
>>             ret = -EOPNOTSUPP;
>>
>>         rcu_unlock_domain(d);
>>
>> Personally I would even use a conditional operator here, but I believe
>> others might dislike its use in situations like this one.
>>
>> The re-arrangement make a little more noticeable though that the comment
>> isn't quite right either: PV domains necessarily have no
>> X86_EMU_USE_PIRQ. Maybe "... has no notion of pIRQ"?
> 
> Or just like below?
> 
>         /*
>          * Prevent unmapping when the subject hvm domain has no
>          * X86_EMU_USE_PIRQ
>          */
>         if ( is_hvm_domain(d) && !has_pirq(d) )
>             ret = -EOPNOTSUPP;
>         else
>             ret = physdev_unmap_pirq(d, unmap.pirq);

No objection to the slightly changed comment. The code alternative you
present is of course functionally identical, yet personally I prefer to
have the "good" case on the "if" branch and the "bad" one following
"else". I wouldn't insist, though.

Jan

