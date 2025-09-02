Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAD2B40180
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 14:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106408.1457099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQYm-0000kQ-IN; Tue, 02 Sep 2025 12:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106408.1457099; Tue, 02 Sep 2025 12:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQYm-0000ha-Fg; Tue, 02 Sep 2025 12:56:28 +0000
Received: by outflank-mailman (input) for mailman id 1106408;
 Tue, 02 Sep 2025 12:56:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utQYl-0000hN-4j
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 12:56:27 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b7ce92c-87fc-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 14:56:25 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-61a8c134533so9660449a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 05:56:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4bbcc7sm9390400a12.24.2025.09.02.05.56.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 05:56:24 -0700 (PDT)
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
X-Inumbo-ID: 3b7ce92c-87fc-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756817784; x=1757422584; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cxEmf8jKtqP9DgLcpkszv1taQDwhXj+TB4X+KX4NdnU=;
        b=KiF0COKoduhEMf1zSi8a9EMNhmmMGs8lf7AWJMlgbObJ5rDQv6bNfczJqzJEKxSF7q
         22aauSDFeWvFpmUGkWS+mFINXduvys9S8sqjikX60AMsk/J88i5KMoQS3ecqkikbcl3u
         VRG6U+L6jAnS2FO0yxvS9tuLiZXWGQHu3tEA1h8RCqPqB2cx/tkDfsLD9VnOcng2PH8D
         qIPUtrtiQap/hzEuvpGqjck5LaXpYby6joAypLT5kJ/u3f/NZvYKxuTx4+0R0E7p7LRt
         YzaIFdw8wW/4Q3jQ0jL+XLIJyMBRiWVWintk88pgfs02VxZae+dRbgD7jnVbbankY+nX
         XK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817784; x=1757422584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxEmf8jKtqP9DgLcpkszv1taQDwhXj+TB4X+KX4NdnU=;
        b=ruO8Eq/qjtJJd4S6NriDbG7Q4qiZRIdHx2cv8A5PvsanZ/yT7JY6niOcaAG6F+3t/i
         iHZl0elOp+c9CLxTUdbJAIzWIWC6IREmaq6854G7LLKZiuKFFTCXAk/WA8n7DNgMy7xV
         Mp0vn97+JPz1bPgM+PVzuMrZJJgx77BjzOUqA2sor5oJTTfP/yTDrbP+dA80GoVgacan
         bOz8LYlekfgT/i6cmlWcRXfvNz5nHH51vJcHo4m7cmlMLVyBDN+xezV/SLyp9hk5gKgs
         4j05g7gMtv5s/Ew5vqRWQym9mOh6NdaPG52VGm24i8YG7tpcWXnxQpRhfTxJhp0ppVLO
         jZ7w==
X-Forwarded-Encrypted: i=1; AJvYcCXHr8z8I+340BBkUyMjp02FpGX5vDzx2O3EeXq7L7os7gtGagabMa2kBh9Vd6LdEVvfqVlwlRfNIeI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4m8KJbRltcz+iRT9+iareEnTe1KskWzZ5WHwHwFgx/jgtF0lu
	BfCpWjmgv16KfwYoLUs4hhFePDH6avFg4H6O5WHCTpUn+i+srxYyJFgYfQLRCYKRKA==
X-Gm-Gg: ASbGncv1/0nK3dzeMg5NoeUqNSo6J7AYNLrfQO+uGAuJhDDMkGzaMm6VDEOiMTneCYz
	hhfaXf6lKvGrsUp3uYWkK/uDCJu2PuYfBSpOAvbfvPXnyCdcJk/X8nfk9DdrpUKuSAKRv/qqp1F
	k6cI4Q3hztRhE9AKxlasOEh2qUUmbgiIqFvha11mTSuSsA7TLNtVev3jbrXkBAgdUwg4/DExLSN
	I+Xy79j9E/Zki/KhMN9YRgVeRCkB0YbF5xXhgo9767+mDFbUBdAx6X8TLKEtkmhoxLtJqV5QdJT
	djcXTuv3xXoUSCI69I7rqsLBJw7rXQPvxq2hTKjzpM/fEtICnXZpXaExhG1W4smFfkpKSXJo8eO
	+t5w8yqVdy9sXiWen3DjetVoVDyFAKLhGrPjisq3uF3aF+eysEm9vivStCy0hmVDCQ8jDA0tNyf
	1NnVOLkUg=
X-Google-Smtp-Source: AGHT+IEly4ATefmI7CxtKeh7/EbG28xcd3d0OaZ3FKNqBVqTgJqrdgOi232tbMO2kOSEZnLwF05zTw==
X-Received: by 2002:a05:6402:40ce:b0:61c:c086:8092 with SMTP id 4fb4d7f45d1cf-61d26fd0c7emr11599428a12.23.1756817784349;
        Tue, 02 Sep 2025 05:56:24 -0700 (PDT)
Message-ID: <8a1fa32f-e7fb-4879-8516-1ddca5367619@suse.com>
Date: Tue, 2 Sep 2025 14:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: issue with dom0_pvh on Xen 4.20
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
 <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
 <aLbNbiHLntX13E46@mail.soc.lip6.fr>
 <957429d8-ec8c-4327-b8fc-71fe9ddb2d33@suse.com>
 <aLbi7QhGy4QEH8E9@mail.soc.lip6.fr>
 <7d0fc0eb-52a4-4478-8c1b-9a359513abdd@suse.com>
 <aLbpFH2jPRPEqjhe@mail.soc.lip6.fr>
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
In-Reply-To: <aLbpFH2jPRPEqjhe@mail.soc.lip6.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.09.2025 14:54, Manuel Bouyer wrote:
> On Tue, Sep 02, 2025 at 02:45:04PM +0200, Jan Beulich wrote:
>>>> What puzzles me is that:
>>>>
>>>> - %cr2 is 0, so probably the first fault wasn't a page fault
>>>
>>> AFAIK it can't be as we're still in real mode
>>
>> It's protected mode, but with paging still off.
>>
>>>> - RIP is %ebx + 8, so maybe the code was just clobbered by the loop?
>>>>
>>>> Could it be the code has been moved to this location, or is about to
>>>> be moved away afterwards?
>>>
>>> No. RIP shouldn't end up there in any way. the assembly code is quite simple,
>>> it's just a loop and I'm quite confident that we did enter the loop with
>>> sane values
>>
>> Yet Jürgen has a point - entry point and what is being modified are on the
>> same page (and despite paging still being off, you writing page tables here
>> makes pages a relevant unit). Considering
>> - entry point @ 0x20e4d0
>> - %ecx = 0xdfeb7
>> - %ebx = 0x20e260
>> the loop continuing a little further will overwrite the entry point code.
>> And with the entry point not at an even (e.g page-aligned) address, other
>> code (like the one here) could conceivably live immediately ahead of it.
>> (Of course this overwriting may be intentional, but it looks suspicious in
>> this context.)
> 
> Indeed. Now the exact same kernel is booting fine with Xen 4.18 (and also
> the same bootstrap is used for domU PVH which works with Xen 4.20).
> I guess something changed in the way Xen sets up the dom0 kernel.

Hence why Andrew asked for full logs of both boots, to put side by side.

Jan

