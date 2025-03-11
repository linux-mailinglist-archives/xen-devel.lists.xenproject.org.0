Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C624FA5CB82
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 18:01:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908820.1315888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts2ym-0007DE-Mb; Tue, 11 Mar 2025 17:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908820.1315888; Tue, 11 Mar 2025 17:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts2ym-0007As-JR; Tue, 11 Mar 2025 17:01:20 +0000
Received: by outflank-mailman (input) for mailman id 908820;
 Tue, 11 Mar 2025 17:01:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ts2yk-0007Aj-IX
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 17:01:18 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ba73490-fe9a-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 18:01:05 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso6338985e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 10:01:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ceba8d727sm116891255e9.25.2025.03.11.10.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 10:01:04 -0700 (PDT)
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
X-Inumbo-ID: 6ba73490-fe9a-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741712465; x=1742317265; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fAgzANV4fpi95DidZLdr9ATxtnSWLY2xRjhmMXrOwPM=;
        b=URBQtbldrjjtlf3X6SkTyJfgvPqCpvIAa+8q42u00O2rldhwmv+5AqtT34rtScWhdK
         H50+N7IrdbJ2STm99cWBGhLTIUsgAByXcsgHqr207Q8qjDLEQVWDKj9H2+Gs/f4mGiA2
         wRTIU40d7MevnexOIlGcC2p5NNhkuyjbEs1Ee7ECdAkPFj9dLyEzx7lkXRKcMjDDSbBV
         jPt4BxPJKSjBxynoN7wdX7owYdvdjxs3alsVBEg3+DdCgdBQ8UyyhzimwSgAiSAXAjoe
         IO2aZDiZ7wDt6O+DrBs9fMlBiVPoZ0w6zVDSpCOPabsW5Jne1E/OsNSKb9jjyOzkpToE
         QCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741712465; x=1742317265;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAgzANV4fpi95DidZLdr9ATxtnSWLY2xRjhmMXrOwPM=;
        b=xMg5qCpYV5jzpA1Ig+qdWJlWQpBZOt49tYPMgRWinuptQweoqqmrlaQ5kH+t3fCOEw
         bKrmcocRYAryuvIDw6JE+UTfoTIppDUMSukVpBJB0FaRPQ2yTqei5zS0APcbWr+kuZLK
         oZqTdrI1zRYf8VlOXvusvxfjV0NZIBWWCYIURJz3HPGfqZaOTPNZdk4N6G7qoorNSef5
         iSsa/3Z2mFfD1lbtVxI40ac7x7OCEPH18pA6DoCY7LmS54o0xL1UlQzKK3VE1DX5fKYF
         WhgMoAHofv9H7JXCV/CP+N9Iloc9rTSX3s5vKZSb+XnDLW+ME/ts1/9eJnbx0VEIRzEx
         Zumw==
X-Forwarded-Encrypted: i=1; AJvYcCUyaM5rlu3TdqQrJZgsdl0SSA/bAvlTYFCjWxt1YbAphRAxfnMgojZSTZvoouLfw9mkAbUUEclK4/s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWtXWUBm83RLoKwBzuvQmKcUmDcHA2bYdaUxbmiNFKm/mG7I6R
	j3AWqQxdulImbtM3jBBk+qTSbGstpTmyqTJPj0SwgMUNBR/42sHrnMkBRAd/tA==
X-Gm-Gg: ASbGncuk7KhnDnOeL7l4FqaRf4yX9VnH6WvlU6iDQ7YedOcAAJip3rnsBC4zI0LSH9o
	I7a+XOEUvUWcV4nUIlmyjOGPoAPzEeMqIs+6532g4eFleLRuL5yO3kad3QZcbrxAbEgPNY/gqSZ
	3jMFD2103C5xQ+sdr3R5HeRNZOVSmdgzz3+F5TbltMuSNy7hYuRsdk0QiyDk2K7UfN4WOa9MvTw
	xHLDcn1+hwrpCXkBoNR3NjDt5OiWeIGUJHTZd2FIL1ELtnZ0yFcOaUwn9ohFcdgAHamRnI/O7Oi
	QwC79t6Ume7bgMlv1D3X+bN7jvqu0gEtno1bqwgYiSKTDP+0lNGU2f/saKmormXytvpRRI6khmn
	mcx9YdN7bTfXiUiSgcb1X3PJOOPYEGnGs53c5gaBZ
X-Google-Smtp-Source: AGHT+IGlbBk5RbeAwHfpfeEPuaJZDh4JlWVJLa2WEYqpSDFhWeJsOS7C6rdMh47b7/VVNNv8cQQs/g==
X-Received: by 2002:a05:600c:1d18:b0:43c:f050:fed1 with SMTP id 5b1f17b1804b1-43cf051014bmr99573715e9.12.1741712465020;
        Tue, 11 Mar 2025 10:01:05 -0700 (PDT)
Message-ID: <5ccc36f4-0fda-4b28-9e7d-bbb2e3a66df3@suse.com>
Date: Tue, 11 Mar 2025 18:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/iocap.h: add documentation
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Grygorii Strashko <gragst.linux@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250224113828.151794-1-grygorii_strashko@epam.com>
 <83d5d612-2f6a-430a-8aee-4738f43204e0@suse.com>
 <d7fe19f2-f8ac-497a-833e-44a04e1ca4c7@epam.com>
 <60eff646-724f-4ff9-9dde-3a7f9a1da66a@suse.com>
 <49e28768-3b9e-42da-922b-64b0bf8dec34@epam.com>
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
In-Reply-To: <49e28768-3b9e-42da-922b-64b0bf8dec34@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 17:11, Grygorii Strashko wrote:
> 
> Hi Jan,
> 
> On 11.03.25 17:35, Jan Beulich wrote:
>> On 11.03.2025 15:53, Grygorii Strashko wrote:
>>> On 05.03.25 12:37, Jan Beulich wrote:
>>>> On 24.02.2025 12:38, Grygorii Strashko wrote:
>>>>> Change rangeset parameters to "start, last" as proposed in [1],
>>>>> and add documentation for public interface.
>>>>>
>>>>> No functional changes.
>>>>>
>>>>> [1] https://patchwork.kernel.org/comment/26251962/
>>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>
>>>> To be honest, this is getting too verbose for my taste. I also don't think
>>>> title and description fit together: One says the main thing the patch does
>>>> is add doc, the other says the main thing is the parameter renaming. When
>>>> then there's at least one further parameter which is also renamed, despite
>>>> not fitting the description.
>>>
>>> I can update subject and commit message and resend.
>>
>> This would address the latter part of my comment, but ...
>>
>>> Or you want me to drop some parts?
>>
>> ... only this would address the former part.
> 
> I'm very sorry, but I feel very much confused about your above comment :(
> 
> So I'd be appreciated if You can provide some clarification here.
> 
> 1) you do not want API documentation at all?
> 2) you want API documentation, but only for some API?
> 3) you are not satisfied with documentation style?
> 
> In case 3, how do you want it to be look like? Could you point on any .h or function in Xen,
> to inherit the doc style?
> 
> Here I've followed doxygen style (like in xen/include/xen/vmap.h for example)
> Before proceeding I've checked CODING_STYLE and other headers as well and saw that
> there is no generic style for code documentation.

As said, my take is that this ends up too verbose. Personally I'm happy
without any doc for these relatively simple interfaces. I could live
with something lightweight. And if other maintainers think having this
kind of extensive doc is useful, I also wouldn't veto this going in. But
in the current shape I don#t think I'm willing to ack it.

Jan

