Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E068C7A06
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 18:04:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723511.1128426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dal-0000AF-Et; Thu, 16 May 2024 16:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723511.1128426; Thu, 16 May 2024 16:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dal-00008g-Bb; Thu, 16 May 2024 16:04:27 +0000
Received: by outflank-mailman (input) for mailman id 723511;
 Thu, 16 May 2024 16:04:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7dak-00008X-4x
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 16:04:26 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f68018a5-139d-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 18:04:24 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56e56ee8d5cso4210440a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 09:04:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574eaace761sm3547085a12.91.2024.05.16.09.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 09:04:23 -0700 (PDT)
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
X-Inumbo-ID: f68018a5-139d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715875463; x=1716480263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DkCeUJQ8pzOvFfOP1vuE5+6yP6OumOQEifPIhE54p8A=;
        b=AWj0V8966vSPkDKOfxpC8i9YZrL/cR06zFBvYQ/srYKxJspjknUOOw6yQ8eBF54aSq
         44ZK0kFFQy4VQAHFI45LbZITZY/znQH618ak83kN7QKLLhMngHbC775Dyy7ZzLv5sQWw
         5jlnlvNlQ2+ex3ARbAraFPi/vWHt+y6tOOpQHmRPGjnePdECn7VxAPcK+rmUrKnNUkoB
         cFJ4iPN3lQt50QEzAfNYXr7c5CNRpB2+/7/UGTlBjsPbs5OTvmzxwP5cHWK62IluXWsp
         6O5Kjbs/d62jit1tLbCTH4r8aAsVunCVZcCN8R83nBLZ+JnOxFkKKQ/gRQxf5P2VBSSu
         zJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715875463; x=1716480263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DkCeUJQ8pzOvFfOP1vuE5+6yP6OumOQEifPIhE54p8A=;
        b=fcSnYojY5cQrtLf/iCm1CAI22juwz6ZjrLwRvG6/XpYxGSc1Z/xnSBNBPjG8wt5q9M
         tTTREwgYe/gmn3H/6iNpLzx0FJhKADJmWxQ+t31ijXrJqm7oMMkJep4CoZcdl1QIqskz
         wkxduX8lo/ZJZ1Ghykmevi77AoWjSlImw1Na/+iu8jJIFtBJsmwE6zcz6+01zT3BJdC8
         g2xUMwzKVOroVOdh1fpiQdPBcF/qyvHuC7oimicUa/0eJquH+DAsWuScXCLqZHcEAXdm
         9vyhy+swvtmsOfTkeUibQWWAeZSQSI+h7C1ikTIW+AONeQOl2dIDBxJgl5/i4a64fYs7
         lR6w==
X-Forwarded-Encrypted: i=1; AJvYcCXR/dvLfwrlxIGNLq+QsulsZTOwT+hVM26IjPokZ0Hxyjiq+aHoELTIooZOUM1qd0u3qCnmSxoaj6v3lEHCZJ7y/NSWm/oWiPF4+nEc/d4=
X-Gm-Message-State: AOJu0Yz1cgTMHKBuHCsMF0WlYnc0IM8kp26hfDsvm/7svg4VbX3gbEt5
	C4GgrwRHfgerb9+A9gB/Bf/hbFee5YSFfMPL5+0/qGPkbcnopm7N65xwBpkd4K/n79efgqs6zIM
	=
X-Google-Smtp-Source: AGHT+IEBDONIco+vd/kiafnD6BJB2vUIQ1nLQHvT1Uls0XMboV5ZqtMLezi/M9wHeSjgJNQJ0AOBdA==
X-Received: by 2002:a50:9ecd:0:b0:56b:cfef:b2de with SMTP id 4fb4d7f45d1cf-5734d67ecb2mr13736134a12.26.1715875463455;
        Thu, 16 May 2024 09:04:23 -0700 (PDT)
Message-ID: <b77790c6-a5b5-40d9-9387-5101ace14a4c@suse.com>
Date: Thu, 16 May 2024 18:04:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/x86: limit interrupt movement done by
 fixup_irqs()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20240516132224.86005-1-roger.pau@citrix.com>
 <449c7562-18a5-4f5b-a7a6-36fbf0383517@suse.com> <ZkYstvGkdffWMn2z@macbook>
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
In-Reply-To: <ZkYstvGkdffWMn2z@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.05.2024 17:56, Roger Pau Monné wrote:
> On Thu, May 16, 2024 at 05:00:54PM +0200, Jan Beulich wrote:
>> On 16.05.2024 15:22, Roger Pau Monne wrote:
>>> @@ -2576,7 +2576,12 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
>>>                  release_old_vec(desc);
>>>          }
>>>  
>>> -        if ( !desc->action || cpumask_subset(desc->affinity, mask) )
>>> +        /*
>>> +         * Avoid shuffling the interrupt around if it's assigned to a CPU set
>>> +         * that's all covered by the requested affinity mask.
>>> +         */
>>> +        cpumask_and(affinity, desc->arch.cpu_mask, &cpu_online_map);
>>> +        if ( !desc->action || cpumask_subset(affinity, mask) )
>>>          {
>>>              spin_unlock(&desc->lock);
>>>              continue;
>>[...]
>> In
>> which case cpumask_subset() is going to always return true with your
>> change in place, if I'm not mistaken. That seems to make your change
>> questionable. Yet with that I guess I'm overlooking something.)
> 
> I might we wrong, but I think you are missing that the to be offlined
> CPU has been removed from cpu_online_map by the time it gets passed
> to fixup_irqs().

Just on this part (I'll need to take more time to reply to other parts):
No, I've specifically paid attention to that fact. Yet for this particular
observation of mine is doesn't matter. If mask == &cpu_online_map, then
no matter what is in cpu_online_map

        cpumask_and(affinity, desc->arch.cpu_mask, &cpu_online_map);

will mask things down to a subset of cpu_online_map, and hence

        if ( !desc->action || cpumask_subset(affinity, mask) )

(effectively being

        if ( !desc->action || cpumask_subset(affinity, &cpu_online_map) )

) is nothing else than

        if ( !desc->action || true )

. Yet that doesn't feel quite right.

Jan

