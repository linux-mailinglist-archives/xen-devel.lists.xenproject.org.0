Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E7584E4DA
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 17:18:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678329.1055483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY75u-0004pm-15; Thu, 08 Feb 2024 16:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678329.1055483; Thu, 08 Feb 2024 16:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY75t-0004o6-US; Thu, 08 Feb 2024 16:17:45 +0000
Received: by outflank-mailman (input) for mailman id 678329;
 Thu, 08 Feb 2024 16:17:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rY75s-0004o0-3Z
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 16:17:44 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 959bd598-c69d-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 17:17:41 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d0d95e8133so401031fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 08:17:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m13-20020adfa3cd000000b0033ae50e2c6asm3959655wrb.83.2024.02.08.08.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 08:17:41 -0800 (PST)
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
X-Inumbo-ID: 959bd598-c69d-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707409061; x=1708013861; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vrAgSpRzw0VF3hyy7scsIHdqo8uFRtXsBzGWlj8EKnU=;
        b=XT3nplztcGn36BbDAxxVS6l3ICt7d3N3MeJDvggIHq4XrclezkjvJpWyhA8HmfNfQ1
         hRDceUW/jDBEUXRvlZqrLYoxddITG3Aq5ycHRQWI3YzTmpuIYicN4KrC2r+4SFiERVgX
         N5kiH7VHfr2375hFNMNm7YkW8/wH+GqVCCKy01SIPfHwMDj9aRzN3rUFi3k8bqF1XClh
         Eu4GFfPGukL965+6uhkQvYJVvedAtnm1bEd1Ikbwh/LVWEfn0WgIXtmLy2WQV678RSn5
         NdixIJ77zcuZnd7Z174qhgLpr0kDrl/Xl/0lRNlrPwohJg2UPn4mwqsrdM29v5cfRGwY
         wsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707409061; x=1708013861;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vrAgSpRzw0VF3hyy7scsIHdqo8uFRtXsBzGWlj8EKnU=;
        b=v5qVwLkXuSPhn4SSFXcNA1d2pyWD01hMOwvwz7rcBqQ+eJA/q4nNLz1tX0MXEBd3A9
         zKXRENzT///Fx//Ik6X6uI9WxLK3yVYcGvdRlJ4864PXq/UMd5gca0QdM9W2s7rNBOup
         wbyaCfJ8vzYZisMx3shDhU6MhLrK9r813EyQbA1KTBl6e93lP4n5do4lLn4ueapW7xbj
         aqnXBeMVE4XHIu0pjmb7/+vD/YjrdaQ9tvxrmLjiZu84TSvRYEGFJl7fQePWgiUJxwoj
         1k4rtwY0x5igaSIl3VSMGsInLDc42WcZ/0Ujjth4upfqKS4DBFHkKphpZDqVvXTC7V3e
         Qzgw==
X-Gm-Message-State: AOJu0YypRAkF5ELsO8TnTkDYQgWavBnrMTRTGG9iCIsXG5eAayYbbrtb
	pzXNWIjFwOlLiEhy4QXAw0lliHMNhR9DXQg/+Hfrium5V6iW74m9Br97A1nRsA==
X-Google-Smtp-Source: AGHT+IHrxvZ/S950vrLi99fwE/2Z918+m6wqxV9EhfMJRslLQ9sDzePtryHvj51c3KmI9g4GVQs9yA==
X-Received: by 2002:a2e:9bcb:0:b0:2cd:1ca6:87bf with SMTP id w11-20020a2e9bcb000000b002cd1ca687bfmr6957020ljj.8.1707409061241;
        Thu, 08 Feb 2024 08:17:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUm/bnmKOGk3/+6BAzSKuBsNyCbGwQc2a1wIXAvxsLRrNr9ZPbgO2gnF7adtSg7R0mJNDOuBdvrLX2+c/+FEQzQVXHQxJrs9rb6Kqjs30I0ACbvPQf/tjkSYw/P8ofashutoj0LJKnPcABDF+HlfrRt3RoYe83Yh/EaPMDJaSlLjXIMUS8XDC4=
Message-ID: <3120d2fe-0698-4c7c-9916-45ff5a32b3a7@suse.com>
Date: Thu, 8 Feb 2024 17:17:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HVM: tidy state on hvmemul_map_linear_addr()'s error
 path
Content-Language: en-US
To: paul@xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Manuel Andreas <manuel.andreas@tum.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c4c1d2b3-591e-403f-879b-bbb897f7ff25@suse.com>
 <c0a2b6fe-e64f-433a-accf-124a7cee3f91@suse.com>
 <d4e3ea26-961a-4c30-a366-d0afba475813@xen.org>
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
In-Reply-To: <d4e3ea26-961a-4c30-a366-d0afba475813@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.02.2024 17:11, Paul Durrant wrote:
> On 08/02/2024 15:59, Jan Beulich wrote:
>> On 06.02.2024 13:06, Jan Beulich wrote:
>>> While in the vast majority of cases failure of the function will not
>>> be followed by re-invocation with the same emulation context, a few
>>> very specific insns - involving multiple independent writes, e.g. ENTER
>>> and PUSHA - exist where this can happen. Since failure of the function
>>> only signals to the caller that it ought to try an MMIO write instead,
>>> such failure also cannot be assumed to result in wholesale failure of
>>> emulation of the current insn. Instead we have to maintain internal
>>> state such that another invocation of the function with the same
>>> emulation context remains possible. To achieve that we need to reset MFN
>>> slots after putting page references on the error path.
>>>
>>> Note that all of this affects debugging code only, in causing an
>>> assertion to trigger (higher up in the function). There's otherwise no
>>> misbehavior - such a "leftover" slot would simply be overwritten by new
>>> contents in a release build.
>>>
>>> Also extend the related unmap() assertion, to further check for MFN 0.
>>>
>>> Fixes: 8cbd4fb0b7ea ("x86/hvm: implement hvmemul_write() using real mappings")
>>> Reported.by: Manuel Andreas <manuel.andreas@tum.de>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Just noticed that I forgot to Cc Paul.
>>
>> Jan
>>
>>> ---
>>> While probably I could be convinced to omit the #ifndef, I'm really
>>> considering to extend the one in hvmemul_unmap_linear_addr(), to
>>> eliminate the zapping from release builds: Leaving MFN 0 in place is not
>>> much better than leaving a (presently) guest-owned one there. And we
>>> can't really put/leave INVALID_MFN there, as that would conflict with
>>> other debug checking.
> 
> Would it be worth defining a sentinel value for this purpose rather than 
> hardcoding _mfn(0)? (_mfn(0) seems like a reasonable sentinel... it's 
> just a question of having a #define for it).

Perhaps, but that's for a separate patch then.

> Either way...
> 
> Acked-by: Paul Durrant <paul@xen.org>

Thanks.

Jan

