Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DB4889C5B
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 12:17:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697712.1088757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1roiJt-0008R5-7U; Mon, 25 Mar 2024 11:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697712.1088757; Mon, 25 Mar 2024 11:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1roiJt-0008PQ-3c; Mon, 25 Mar 2024 11:16:49 +0000
Received: by outflank-mailman (input) for mailman id 697712;
 Mon, 25 Mar 2024 11:16:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1roiJs-0008PK-2K
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 11:16:48 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a710e57-ea99-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 12:16:45 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56845954ffeso5741126a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 04:16:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dk5-20020a170907940500b00a4750b2e0f0sm1767163ejc.164.2024.03.25.04.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 04:16:45 -0700 (PDT)
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
X-Inumbo-ID: 2a710e57-ea99-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711365405; x=1711970205; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dJvOqfaL61RqNqnl4Xv4E+cdJ3iNN1Bg7KaIBcfEhFs=;
        b=Cq+W68asoBWboMP9LE2u4vXxDCj2N0vQiOOUqIp1Js+/5+dujCbc9IWgaEAu7H4LEW
         9Fk6+x6/HPpC4jEZgWHQ633KRZGIofkyh8216z464QWLr3phJeyPI6q6cmKf/xqY5ica
         H5fWkry2VJQQJyL7HvdBfwvd3ep+hB/nE665ZKiodRdL16SzaMpcdGzeW1HesoDu89I+
         jsUJiZ2jQfX7PVPbSdk3Ss95XPmRdpdP0Yk5nAYrRqgoPiAVQQtVbL+mgRGDx6OSp/Uz
         VfVTHN9h/eh0X59zBpC6W3WCWDKtKta+ULr+NuWdTS9jrliRZQkO9k+Nl6WUgHXYFGBm
         JMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711365405; x=1711970205;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJvOqfaL61RqNqnl4Xv4E+cdJ3iNN1Bg7KaIBcfEhFs=;
        b=Mgznm98GYFf1GXQbCE6tTlDuC3vj+3flVHTajGm4Zsu3BQz0QTb3fcmR3oMdgFOlhL
         4Qu51qALFYhwaJ8+8StzeP0ajNaqt+wOubJ7PwF77Scv1hL7gimHXLQ142gasx14IXfP
         0oSUuvgdpvXcD4KbJg16PLtZB+SDscm6ZfPSXcMgx+P0hUiJ5fOYJe9EjjZvpvQV3hLg
         0S+g4LKcn79c4GDRlDsb7sJrjgLNiUY0Ha6wYugpkSMInqCQ7w/sP6eiNJ3qJtbrErCD
         SKPQPPnmOFkBj8x5S9JC0IykP0gqRxIzySz3rdd/Lq1tTuMBju2+YTvnsz/DHuJkPbMk
         Ysxg==
X-Forwarded-Encrypted: i=1; AJvYcCWjg/9mZxaVIyA2HnzVkrDrPiaFkpfVD6dumnYA2iqsd8KnOvWpDrjyMTzHEC2HlJkZT6sfbH4BEH8TLoGsjCZKJjhH7Af/9Hx2V6Ru2dU=
X-Gm-Message-State: AOJu0Yx+eVF1HjCMsGjM3kVmYDhsITJNUjza0Ai7lojzRDjDTL/HwSPW
	NZxzIW1iAO1zhtGuOHrOOB9U99aMW1UDv+BORSPulnuF9E5Aa7wkvSOUOTIpNg==
X-Google-Smtp-Source: AGHT+IFLmEoBBHw5JYW/7DUzCI09LutYSWcl/cNvHNrhG52EY/200nAOt0jhTNSWSZf3U2UHQmYvTQ==
X-Received: by 2002:a17:906:2486:b0:a47:3a99:89e with SMTP id e6-20020a170906248600b00a473a99089emr4138245ejb.12.1711365405456;
        Mon, 25 Mar 2024 04:16:45 -0700 (PDT)
Message-ID: <b6430745-2b1a-43e7-9f11-88c8c8f04b4a@suse.com>
Date: Mon, 25 Mar 2024 12:16:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/misra: document the expected sizes of integer
 types
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 george.dunlap@citrix.com, michal.orzel@amd.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2403141516550.853156@ubuntu-linux-20-04-desktop>
 <6a76723e-ba47-40b3-8f33-d68030b14299@suse.com>
 <alpine.DEB.2.22.394.2403151658530.853156@ubuntu-linux-20-04-desktop>
 <7ab73379-b057-4568-9869-141cef185752@suse.com>
 <alpine.DEB.2.22.394.2403181735410.853156@ubuntu-linux-20-04-desktop>
 <fadd30c9-440d-401d-bd05-7e1d965bbefe@suse.com>
 <alpine.DEB.2.22.394.2403190815220.853156@ubuntu-linux-20-04-desktop>
 <87234837-9fb3-40a9-849d-8b8574f2661c@suse.com>
 <alpine.DEB.2.22.394.2403201812380.1569010@ubuntu-linux-20-04-desktop>
 <198bade8-c6fc-4ae0-b721-3a9e2bd8acbe@suse.com>
 <alpine.DEB.2.22.394.2403211140540.1569010@ubuntu-linux-20-04-desktop>
 <a5c01d46-eb46-49d1-8ffd-98b6d1680daa@xen.org>
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
In-Reply-To: <a5c01d46-eb46-49d1-8ffd-98b6d1680daa@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.03.2024 00:17, Julien Grall wrote:
> Hi Stefano,
> 
> I haven't fully read the thread. But I wanted to clarify something.
> 
> On 21/03/2024 19:03, Stefano Stabellini wrote:
>>>> Or possibly unsigned long depending on the parameter.
>>>
>>> You're contradicting yourself: You mean to advocate for fixed-width types,
>>> yet then you suggest "unsigned long".
>>
>> No. I explained it in another thread a couple of days ago. There are
>> cases where we have fixed-width types but the type changes by
>> architecture: 32-bit for 32-bit archs and 64-bit for 64-bit archs.
>> Rather than having #ifdefs, which is also an option, that is the one
>> case where using "unsigned long" could be a decent compromise. In this
>> context "unsigned long" means register size (on ARM we even have
>> register_t). Once you pick an architecture, the size is actually meant
>> to be fixed. In fact, it is specified in this document. Which is one of
>> the reasons why we have to use == in this document and not >=. In
>> general, fixed-width types like uint32_t are better because they are
>> clearer and unambiguous. When possible I think they should be our first
>> choice in ABIs.
> 
> "unsigned long" is not fixed in a given architecture. It will change 
> base on the data model used by the OS. For instance, for Arm 64-bit, we 
> have 3 models: ILP32, LP64, LLP64. Only on LP64, 'unsigned long' is 32-bit.

"... is 64-bit" you mean?

Jan

> So effectively unsigned long can't be used in the ABI.
> 
> As a side note, Xen will use LP64, hence why we tend to use 'unsigned 
> long' to describe 32-bit for Arm32 and 64-bit for Arm64.
> 
> Cheers,
> 


