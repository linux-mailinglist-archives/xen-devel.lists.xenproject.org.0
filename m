Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74E1A30888
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 11:30:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885318.1295114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thnXD-0006ps-KQ; Tue, 11 Feb 2025 10:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885318.1295114; Tue, 11 Feb 2025 10:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thnXD-0006nN-HO; Tue, 11 Feb 2025 10:30:31 +0000
Received: by outflank-mailman (input) for mailman id 885318;
 Tue, 11 Feb 2025 10:30:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thnXC-0006n9-Jf
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 10:30:30 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 366de8bc-e863-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 11:30:28 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso870464766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 02:30:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7e9853560sm31847466b.111.2025.02.11.02.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 02:30:27 -0800 (PST)
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
X-Inumbo-ID: 366de8bc-e863-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739269828; x=1739874628; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PU7IoTnr8tAFuTeKYrNffXnK7LEgmD5nnQZgCsIll8A=;
        b=QdmSxeQ28ab2k0t4T5vGTCmfnDH1eTwTavh8dwIwphbWaaW2WRlKbXgn4QF/2qqVaH
         T2lI5sdE8krGToaZhHcbpnZJTlsGhLmGBnRCWah5CohfUwFl1FFFmbthQwro2wy7XPjF
         q7390LoU8QoS+jGBIjouCCuPvUaPFUw7gO+3ADniRHf/yHLkgk1C5dT9063Q61b6awSq
         xPOHGYLdK30jyF5t+Us1Ts2ryphl+hFphoU6wWj1hibCuZqo/mbEUcnh3NPtJw1rDXpZ
         Ihz3B6Z7vJy+HqNLrx35FJBNlFIMwFcc3ipk4oTAqpVnrA3K25CTIQdpdb0PVB3+IuJo
         a1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739269828; x=1739874628;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PU7IoTnr8tAFuTeKYrNffXnK7LEgmD5nnQZgCsIll8A=;
        b=uPG9QtUJ/kuW/cK8dYjw3hpjNPLbJOp4C7gZbPkTjGSGswoxLAT9tKco4SdsDC5E/M
         7bKyzkXPQoXSRzLE2PPHibsWi2UhCznsWEEQm+Yp89C1lPNPOYU5ZUgjirOYgMO2iAwm
         dTJMLwtWXUKUFdRioiDDfJ6Q0UrGLEERj5RvaCe/IBJpGVkKMtW37l7cx4veQG2pipl3
         FCsL/jNxebbsyGRsp07E1cvjQxYQ9bl49MSs7WItvB7oSAj+AeE9tiIkW1EiOyGWSm0F
         nAlCH7veDJqbKlwFjQx70F7ploO+c5yKAY+ZOaNuN0z1vUVcsrIv12ohgnUH/RAWMyZ8
         35Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUQO+z1WNrli2OoV2skuUgfJcC1iR0AiZSpLouyqSRbjbeTiuwI0VZGa/NA2LVzrCd7JtrQ9ArsYUU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpKINMV6hK1vx7/jPI49h7kXCynK+thtOTaeyif2MNdNTLQd+6
	v97fp4pcSHDgqaF1eReenNXzaJrxW1dMHcud/4ufPvZNk9b83Z2FR0N1ASMSqQ==
X-Gm-Gg: ASbGnct1d21pfwDFvM9dvOgyvOVe82gDHu12kIct1avxFkb/sjwS44snUd4CTDI3ie5
	qPSI6vZRN7BKALe6oty1t0abm4vGoCvN7xUnaSB21F25Eb+BEgSd3U4ev2nTaHr858zLmfjgPQK
	ex3AYpr5Bn5KDU6f4ZtdU/iRA1H4EJHUkrZ8ZG3d1hBvPzhoBhLqc2HaqcuBhfAYl9LYBaembZv
	fuZzReLtoNN7dkK6ZlPMaIsZ6hsQrQWc7NiLJdoC5b3wl1mCL+ox0vAsmFzl+LxBPIRLQu8bCx3
	EFmRjvuGykvL/zy2agUBvtYiF5OpDFnh2dIImn3iaH/ZWqZci08AvI8EB3zE3YPbaz4zJiacsqs
	G
X-Google-Smtp-Source: AGHT+IHvFmlrFPBBmGMlXpsmKYJJvXuutz0kCqvy95ofIHKzET0F5kwLP1FVis1FgkQkB6A8xUySIw==
X-Received: by 2002:a17:907:7b89:b0:ab7:e7c5:b368 with SMTP id a640c23a62f3a-ab7e7c5ba60mr83983366b.38.1739269827915;
        Tue, 11 Feb 2025 02:30:27 -0800 (PST)
Message-ID: <9a165134-5684-49c9-9b65-df8ef6b70bf8@suse.com>
Date: Tue, 11 Feb 2025 11:30:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Coding Style Review and Automation
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
 <Z6sR87FrKcOhgEqX@macbook.local>
 <4677686F-97C4-4D35-A113-0D8A1C0BC328@arm.com>
 <Z6sY_YsjJ6rGi8zS@macbook.local>
 <904D5489-29C7-4377-B50C-CED2F13A7D35@arm.com>
 <Z6slzXnBALUyZj1f@macbook.local>
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
In-Reply-To: <Z6slzXnBALUyZj1f@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.02.2025 11:26, Roger Pau Monné wrote:
> On Tue, Feb 11, 2025 at 09:49:54AM +0000, Luca Fancellu wrote:
>> Hi Roger,
>>
>>>>>>
>>>>>> 5) You name it. I think many people in the community can name their points for
>>>>>> and against clang-format.
>>>>>
>>>>> What are the parts of our coding style that clang-format cannot
>>>>> correctly represent?  Could you make a list of what would need to
>>>>> change in Xen coding style for it to match perfectly what clang-format
>>>>> will check?
>>>>
>>>> we already went through that route, there is no checker anywhere that matches
>>>> the Xen coding style perfectly, so it’s either we change the coding style or we
>>>> don’t proceed further with any automatic check
>>>
>>> I'm probably fine with changing coding style, that's why I'm asking
>>> for a list of what needs to be changed (unless we switch to a
>>> completely different coding style).
>>
>> Sure, I think listing the differences is fine.
>>
>>>
>>>>>
>>>>> Ideally the first step would be to prepare a patch to adjust the
>>>>> coding style so it's in line with what clang-format will do.
>>>>
>>>> It’s easy to say that, but difficult to implement, if we could accept the clang-format
>>>> rules it would be easier to adopt the configuration itself as coding style, maybe
>>>> enhanced with some comments.
>>>
>>> I'm kind of lost, why is it difficult to implement?  What I'm asking
>>> for is a patch to CODING_STYLE that modifies it in a way that we could
>>> use clang-format.  In any case we need to do that if we want to use
>>> clang-format.
>>
>> Changes to the CODING_STYLE are historically difficult, given that the natural
>> language is prone to interpretation. I’m not opposing to that, I’m just pointing out that
>> starting changing the CODING_STYLE in order to accept the clang-format feels
>> more risky and time consuming than testing clang-format and modifying the
>> CODING_STYLE accordingly.
> 
> I suggested that because it's IMO important to see the resulting
> style.  I'm not suggesting to modify CODING_STYLE in a single change,
> it should be multiple patches that adjust the different areas that
> require changes to match what clang-format can do.
> 
> I think it's important that we can see how the final style will look
> like, otherwise it's hard to compromise on intermediate seemingly
> unconnected changes without knowing what the end result will be.

+1 on both points.

Jan

