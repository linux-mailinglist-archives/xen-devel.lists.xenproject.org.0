Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D45D908395
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 08:24:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740388.1147463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI0LZ-0007Aa-78; Fri, 14 Jun 2024 06:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740388.1147463; Fri, 14 Jun 2024 06:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI0LZ-000795-4W; Fri, 14 Jun 2024 06:23:37 +0000
Received: by outflank-mailman (input) for mailman id 740388;
 Fri, 14 Jun 2024 06:23:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5IQt=NQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sI0LX-00078z-H5
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 06:23:35 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f1fdbab-2a16-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 08:23:33 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a6f09eaf420so205863066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 23:23:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56db67e5sm148611466b.66.2024.06.13.23.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 23:23:31 -0700 (PDT)
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
X-Inumbo-ID: 9f1fdbab-2a16-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718346211; x=1718951011; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MjPFxLQdffOSAFJB98ZTDFQqB/Q5QxWzfVKUdWHijdE=;
        b=Nn4apzEQRxa4jIHg6yYxcadflY8OulZz7g07c7ppcUefAf6l1FQ/eKJexNgKZKWwpb
         5JqM4oklgtGmqd7zTvBfbjNlgOv0gGzDM9TUQZlDj81fDMIuWjQdbFZ4pE0o08Yf0evZ
         jjvujFxFDvbOgz19nshpahJCima2tYRTsukEHLvWFFL0M6ZdwxFF4HxvpDyM4ssRCYH2
         JuxmXSArFj7wUBQonSjEFk1KxaG6b7weH/gczxVWKjAw4wm0t/rcu9GkMHbYYVK2HtWR
         JVPn7HsRpRNgJEp3FrG/ppvGOmEPZs6Wdf5pLNdl/shoUjHPUwMk59EnVeAvg1N47aZz
         ogvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718346211; x=1718951011;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjPFxLQdffOSAFJB98ZTDFQqB/Q5QxWzfVKUdWHijdE=;
        b=MAq2YD+guhgWLyMOJhJGX5b2ufJnhmivdI0M1HQvq5+8h6eobPPFh2WlfGMivS+57t
         r7laTslT8Tp8f/AnmbCQVsTZnvjCD9amCPzGtcU28NDW69D5vJqo711WBtRgxHRrduli
         DSp4rDQ4Y3mcBmFXQQGXoku/u4w2QCYP9bQmRPNlAivSbsE25w498Ua9kLHdGESlNxze
         xiFBrVvg4TgtDNZkhp9ibfuEvkMTuiJObyFOr8IWz98PK3vWXnnDBNAGpNIoemqtXEFv
         bb900u3kFUbKzvTd2w5clIq6bjiq0nVZWNQtpYfEgsE1lkqQnyRXcQqjSEJXcFlP4prs
         X8lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh4T36Sx0sbh9ghW9QMIiLoVNu+ss+eUjXmYhLZeBz380+Chzmx1I3BlIXuoHXMLR9/hOzYcgH6JsVBnrghLMF0JUf4aIRt+nRfge4HIY=
X-Gm-Message-State: AOJu0Yw3+B+MYu0J51eTzvBqf+wLo1ranbwXlLLnZF/RK+ROmB7mEbdp
	N1uGlVR0D3RgtqJXpb9RUJtd268Kvjw+08TKoaYa8cSRJEHVlJcqXw8NuB/78g==
X-Google-Smtp-Source: AGHT+IHTZl4IDtyta0OsljdSyemYEqeoKnFr3SMoZhE+XFwHdT22MKGr3jX2qUiuIlWKgrkvbh5Xmw==
X-Received: by 2002:a17:906:f74b:b0:a6f:2605:aaaf with SMTP id a640c23a62f3a-a6f60d204a7mr110589666b.22.1718346211414;
        Thu, 13 Jun 2024 23:23:31 -0700 (PDT)
Message-ID: <71f7b9c8-43f9-4703-b6e3-8b3fe8b740c0@suse.com>
Date: Fri, 14 Jun 2024 08:23:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 01/19] x86: Create per-domain mapping of
 guest_root_pt
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-2-eliasely@amazon.com>
 <dd145c67-8e3e-4b15-94f7-c7cd1f127d45@suse.com>
 <bda3386e-26c5-4efd-b7ad-00f3643523fa@amazon.com>
 <b50d0a83-fab4-4f59-bf4d-5c5593923f34@suse.com>
 <1ad9ccce-c02b-46c0-8fea-10b35b574cb8@amazon.com>
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
In-Reply-To: <1ad9ccce-c02b-46c0-8fea-10b35b574cb8@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.06.2024 18:31, Elias El Yandouzi wrote:
> On 16/05/2024 08:17, Jan Beulich wrote:
>> On 15.05.2024 20:25, Elias El Yandouzi wrote:
>>> However, I noticed quite a weird bug while doing some testing. I may
>>> need your expertise to find the root cause.
>>
>> Looks like you've overflowed the dom0 kernel stack, most likely because
>> of recurring nested exceptions.
>>
>>> In the case where I have more vCPUs than pCPUs (and let's consider we
>>> have one pCPU for two vCPUs), I noticed that I would always get a page
>>> fault in dom0 kernel (5.10.0-13-amd64) at the exact same location. I did
>>> a bit of investigation but I couldn't come to a clear conclusion.
>>> Looking at the stack trace [1], I have the feeling the crash occurs in a
>>> loop or a recursive call.
>>>
>>> I tried to identify where the crash occurred using addr2line:
>>>
>>>   > addr2line -e vmlinux-5.10.0-29-amd64 0xffffffff810218a0
>>> debian/build/build_amd64_none_amd64/arch/x86/xen/mmu_pv.c:880
>>>
>>> It turns out to point on the closing bracket of the function
>>> xen_mm_unpin_all()[2].
>>>
>>> I thought the crash could happen while returning from the function in
>>> the assembly epilogue but the output of objdump doesn't even show the
>>> address.
>>>
>>> The only theory I could think of was that because we only have one pCPU,
>>> we may never execute one of the two vCPUs, and never setup the mapping
>>> to the guest_root_pt in write_ptbase(), hence the page fault. This is
>>> just a random theory, I couldn't find any hint suggesting it would be
>>> the case though. Any idea how I could debug this?
>>
>> I guess you want to instrument Xen enough to catch the top level fault (or
>> the 2nd from top, depending on where the nesting actually starts) to see
>> why that happens. Quite likely some guest mapping isn't set up properly.
>>
> 
> Julien helped me with this one and I believe we have identified the 
> problem.
> 
> As you've suggested, I wrote the mapping of the guest root PT in our 
> per-domain section, root_pt_l1tab, within write_ptbase() function as 
> we'd always be in the case v == current plus switch_cr3_cr4() would 
> always flush local tlb.
> 
> However, there exists a path, in toggle_guest_mode(), where we could 
> call update_cr3()/make_cr3() without calling write_ptbase() and hence 
> not maintain mappings properly. Instead toggle_guest_mode() has a partly 
> open-coded version of write_ptbase().
> 
> Would you rather like to see the mappings written in make_cr3() or in 
> toggle_guest_mode() within the pseudo open-coded version of write_ptbase()?

Likely the latter, but that's hard to tell without seeing the resulting
code.

Jan

