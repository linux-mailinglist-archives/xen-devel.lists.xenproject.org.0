Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767CC8D3AAE
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 17:22:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732170.1138042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCL7t-0002w7-C4; Wed, 29 May 2024 15:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732170.1138042; Wed, 29 May 2024 15:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCL7t-0002th-9V; Wed, 29 May 2024 15:22:05 +0000
Received: by outflank-mailman (input) for mailman id 732170;
 Wed, 29 May 2024 15:22:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuQ4=NA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCL7s-0002sI-KV
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 15:22:04 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 339bee64-1dcf-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 17:22:03 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a621cb07d8fso250072466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 08:22:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc8dcbdsm741528166b.175.2024.05.29.08.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 08:22:02 -0700 (PDT)
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
X-Inumbo-ID: 339bee64-1dcf-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716996123; x=1717600923; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tdxYn410jYiX71+OkYGeRpynQ7LAu99vUNbAzovPB3g=;
        b=gJLy4z4GnpYKXJGkw7OUKql3G6SwcmhBS5qZwWxuX4cETe+YG5PkQ+WFY4K/n5TxhX
         nODLES2hUusutoSfC20LV09taFavzxFGMeBI75sc2pkwsORpyUKBy5ZB5cBWSuzbKXGV
         jzZPNzrgUMEqNIAkQeNBPlHcZNt1+rcBCKMx2xvHHXu2a/Eh6GD0X2ZWJUxdyFOadXuH
         V7uAegaUdUiC08Tk5/H4jDn+ufa4cyxq1iIg1LVGrlS0bzrIwaaDN/g+4sxJZVSv89Ix
         YM8Rh6JT2vkA1DINl/qmY+uAV1AAAO9Yd7uJwCoy32jU9Vo6LUTCKdj9ps6/ZQoBfbKq
         r0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716996123; x=1717600923;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdxYn410jYiX71+OkYGeRpynQ7LAu99vUNbAzovPB3g=;
        b=TklcYug8BJXHK2BL9aZ9gAKOuGvnRhNiwMJFpmIiEYwy8JqNM2QWfx3MOfZ4ciLC+F
         sa7tQ0MAaSAVdLxTbsYnqMWIxCKl0xh7oKMMMk/TN1ExPQCuoQwuF2oRHYXIb/x7eBfD
         Pbzj1mtfymPrvW0oQ2TEzXvyc5f0fLv66VdW1DdxsoLYxJcOtm5rq3Qh9iDsPQ3ewqam
         hpHjN7pu89f2gD/6g4LSaWJSj6kvwoJzn8k8DTh8426O5JBusjb4qKpArArdyAEHkeb5
         4ohbRAKvSPbhecpK4uye4k9xblNz2l7TfoD2TulNXhmvFS5CBudfjFHgsvqwdMg1FiJk
         7v3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdqdoI2fjFo+2aEWGXiMVlsirG2Lp8ED75qQCNLly1BnsAcENk1ATUyKdCMRUctUUp0QNybl01fh+oECOaHlqgKHylb5tvpSEaKlrAhfM=
X-Gm-Message-State: AOJu0Yxg/BGbYMFBYxyKtwdimbXXB0Nm6x0rUrUBGbIkcblTFf5bAzYX
	g8jSw0+QLqo7V68yHCIOe/FuzwVDM5H19fMBHvedy8B3e9x7Nw4DMgWgNmZEcw==
X-Google-Smtp-Source: AGHT+IFdsCupvYhSyVJvwfh2MXpfu9RkSBdAsD0GB8snKmg/jUgZ0JBK3sD92cdE7lZNTFGCA3u8lg==
X-Received: by 2002:a17:907:76d6:b0:a63:3c57:5806 with SMTP id a640c23a62f3a-a633c575ccbmr360740266b.32.1716996122927;
        Wed, 29 May 2024 08:22:02 -0700 (PDT)
Message-ID: <23790bd6-e06a-4adc-90a9-517f947be00a@suse.com>
Date: Wed, 29 May 2024 17:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/9] xen: introduce generic non-atomic test_*bit()
To: "Oleksii K." <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <cover.1716547693.git.oleksii.kurochko@gmail.com>
 <79c3c31f0032a79c25d0a458b6091904457c8939.1716547693.git.oleksii.kurochko@gmail.com>
 <ab275ed4-29c3-4473-b1ee-2a9cda63eeaf@suse.com>
 <d8fd70469a1ac8d8cc291dddd0496f6bfabf6720.camel@gmail.com>
 <a39c3c03-ef54-4329-833d-03b60f162234@xen.org>
 <56b97916d1c36040a0be547759d5d10d311c9ed3.camel@gmail.com>
 <5438a9b1-d13a-415b-95e4-af520c228e01@suse.com>
 <c72784d5-20d2-4583-9e8a-f8b1cbf31aa6@xen.org>
 <ded13a36-b790-4989-a952-9a4130293b50@suse.com>
 <2bc05407cc62c829d63da757e071db51a003eb79.camel@gmail.com>
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
In-Reply-To: <2bc05407cc62c829d63da757e071db51a003eb79.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.05.2024 16:58, Oleksii K. wrote:
> static always_inline bool test_bit(int nr, const volatile void *addr)On
> Wed, 2024-05-29 at 12:06 +0200, Jan Beulich wrote:
>> On 29.05.2024 11:59, Julien Grall wrote:
>>> I didn't realise this was an existing comment. I think the
>>> suggestion is 
>>> a little bit odd because you could use the atomic version of the
>>> helper.
>>>
>>> Looking at Linux, the second sentence was dropped. But not the
>>> first 
>>> one. I would suggest to do the same. IOW keep:
>>>
>>> "
>>> If two examples of this operation race, one can appear to succeed
>>> but 
>>> actually fail.
>>> "
>>
>> As indicated, I'm okay with that being retained, but only in a form
>> that
>> actually makes sense. I've explained before (to Oleksii) what I
>> consider
>> wrong in this way of wording things.
> 
> Would it be suitable to rephrase it in the following way:
>      * This operation is non-atomic and can be reordered.
>    - * If two examples of this operation race, one can appear to
>    succeed
>    - * but actually fail.  You must protect multiple accesses with a
>    lock.
>    + * If two instances of this operation race, one may succeed in
>    updating
>    + * the bit in memory, but actually fail. It should be protected
>    from
>    + * potentially racy behavior.
>      */
>     static always_inline bool
>     __test_and_set_bit(int nr, volatile void *addr)

You've lost the "appear to" ahead of "succeed". Yet even with the adjustment
I still don't see what the "appear to succeed" really is supposed to mean
here. The issue (imo) isn't with success or failure, but with the write of
one CPU potentially being immediately overwritten by another CPU, not
observing the bit change that the first CPU did. IOW both will succeed (or
appear to succeed), but one update may end up being lost. Maybe "..., both
may update memory with their view of the new value, not taking into account
the update the respectively other one did"? Or "..., both will appear to
succeed, but one of the updates may be lost"?

Jan

