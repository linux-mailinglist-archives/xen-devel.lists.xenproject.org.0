Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 005FA8395DE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 18:07:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670557.1043431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSKE8-0002pW-Vm; Tue, 23 Jan 2024 17:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670557.1043431; Tue, 23 Jan 2024 17:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSKE8-0002nG-S0; Tue, 23 Jan 2024 17:06:20 +0000
Received: by outflank-mailman (input) for mailman id 670557;
 Tue, 23 Jan 2024 17:06:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSKE7-0002nA-FO
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 17:06:19 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b91ebbb0-ba11-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 18:06:18 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cc9fa5e8e1so49144111fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 09:06:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a6-20020a056638004600b0046e29003e62sm3610148jap.112.2024.01.23.09.05.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 09:05:55 -0800 (PST)
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
X-Inumbo-ID: b91ebbb0-ba11-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706029577; x=1706634377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lM6wddXLaKmnMFYBd4JVRJ4sE/tAa2qKs8bjtRnvS2k=;
        b=BXGLdVDKTdSZlJbcV66NPpDRju8gwIuGDdgKclsLQkpIvVmCFVT6vHdEGQVoxLPEkR
         F0JfrYcGslT5NEgAcFQMWgrVthI44wGrir3GhOMJj2DD7iic3Ln0tJgm0vW8k/oE0u+G
         2jVk+4g2C7e2aZmNnVkWPTzG5jncD/7xuF81fQS+ZsP+t+7MgC7L8uMwaSFA0kWtD5bQ
         Y5alWxrL3I26yQ8e3iMD4S2nMMR2Y+8t3bUAOiEvz01E59LJffL9nhphhr9AhP+eieKd
         BwqSg7X109+ocXckoCelgnbHhW85IaWNtkEUf3IXbptIpMZGO+3UIpIHIgNot5NFOsP6
         vwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706029577; x=1706634377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lM6wddXLaKmnMFYBd4JVRJ4sE/tAa2qKs8bjtRnvS2k=;
        b=NOEuZPWVRAYXSU17Wsi7guf+prw7p3uuxV1AC+5k1sdeTLKQl+MFWFT5oG91NvImJq
         jLyutYDKUdtCAb6ZHdevE1Etp7I7nEoQCzjGv644RQ/L1x55qiWyhl/0SpikX5bH9Q1D
         psrY2PWLgxTm1geuKWB4qxoKB69/KBKZuqMtS1FiY9o44tIQPcve2TAc5/iMcbwnvAdt
         So0vOHl8wDZYUE1ip500z1vQm1v8yTL3cr07MoxGASEoUtjSYBv6fK96s7OEI05oDQfK
         YI4e9f9iqPyvnKNf67GQjIVoP1GaF+KKxHuYAcpCrTLOtTU9cksBaynNJ2pPvnbEcLwU
         EJhA==
X-Gm-Message-State: AOJu0YyzjW3AgA0Su2YXU5oV5lCgr361uZUNfJmZfLJgKV5MCp5Gykoa
	3vlm/6eT/mvisMEGZ/I40mecReahQlVMrXsvkhw+1KKNEbjbmr23ANtr8sIQng==
X-Google-Smtp-Source: AGHT+IEIA42SJFruZWRejPHY2mzX0f5HxqmsdKYHBQJ3ovF1tnHC94k1yz8bpWqKeNy9KdS2fP+blQ==
X-Received: by 2002:a2e:3515:0:b0:2ce:d1d:e97e with SMTP id z21-20020a2e3515000000b002ce0d1de97emr66077ljz.102.1706029577418;
        Tue, 23 Jan 2024 09:06:17 -0800 (PST)
Message-ID: <d04ec806-f0c1-4992-96ef-229f0ebb468a@suse.com>
Date: Tue, 23 Jan 2024 18:05:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 34/34] xen/README: add compiler and binutils versions
 for RISC-V64
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <c4d579f02b431d6ac9366dee73ebd7ab74e44715.1703255175.git.oleksii.kurochko@gmail.com>
 <88a7e5af-197b-41ef-b3c2-7d4f85a3cb85@suse.com>
 <2a08cae2c6db049dc08db59f38c4e75573e37064.camel@gmail.com>
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
In-Reply-To: <2a08cae2c6db049dc08db59f38c4e75573e37064.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.01.2024 15:49, Oleksii wrote:
> On Tue, 2024-01-23 at 12:22 +0100, Jan Beulich wrote:
>> On 22.12.2023 16:13, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>>  Changes in V3:
>>>   - new patch
>>> ---
>>>  README | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/README b/README
>>> index c8a108449e..1015a285c0 100644
>>> --- a/README
>>> +++ b/README
>>> @@ -48,6 +48,9 @@ provided by your OS distributor:
>>>        - For ARM 64-bit:
>>>          - GCC 5.1 or later
>>>          - GNU Binutils 2.24 or later
>>> +      - For RISC-V 64-bit:
>>> +        - GCC 13.2.1 or later
>>> +        - GNU Binutils 2.40 or later
>>
>> That's pretty new. For gcc that's even newer than the newest release.
>> If older versions really won't do, I don't think you can leave this
>> unjustified (by having an empty description). Till now gcc 13.2 has
>> served me well, and iirc 13.1, 12.3, and 12.2 were fine, too.
> It can be 12.2.0 for GCC and 2.39 for GNU Binutils. ( it is toolchain
> which is used by contrainer for RISC-V in Xen ). I'll update versions
> then.
> 
> But could you please explain again why it can't be 13.2.1 ( it is a
> version which I have in my distribution, so it is the reason why I used
> this version in README file ) ?

13.2.1 is a pre-release of 13.3.0. Only versions ending in .0 are upstream
released versions these days. And I think it would be helpful if the
minimum version also was the first in a major-version series, i.e. I'd
generally prefer naming <N>.1.0 (or <N>.1 for simplicity; see Arm's entry).
Of course if no such suitable version exists (because of being buggy), then
specifying another one is okay. As to x.y.1 - nobody will then really know
which version it is, because every distro will ship its own variant.

Jan

