Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E96C8A5E6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 15:38:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172980.1498082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGeu-0001Zn-5L; Wed, 26 Nov 2025 14:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172980.1498082; Wed, 26 Nov 2025 14:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGeu-0001XS-1q; Wed, 26 Nov 2025 14:38:16 +0000
Received: by outflank-mailman (input) for mailman id 1172980;
 Wed, 26 Nov 2025 14:38:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOGet-0001XM-EU
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 14:38:15 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89f93854-cad5-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 15:38:14 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-477b91680f8so53479305e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 06:38:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790b0cc39csm48763525e9.14.2025.11.26.06.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 06:38:13 -0800 (PST)
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
X-Inumbo-ID: 89f93854-cad5-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764167893; x=1764772693; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=njASJ/nBXaJugyDd/dGxfpQZEhP3Dmqwkfhj1VAnsnE=;
        b=S9Cw73YeLpSyBNaIUadbIsDPorJFPZrjIYhGYmf9ld43r7gzmuOJEqhzZ0udkBcT9S
         65h/0434xgbVUYzCyJ9EE4KrtiPQJFw3I81aC+epB4AF+c5HHdvNsHForaqtJm+cRv1d
         wsuzNm7SuVaUPvzMXNxIYAoPn5jkRfT5DTQkv1pLbGxbvaFdjeYkOIrLLR0BkVTP80va
         +fOUNh7a6FyF0eM+e+ymN6O0rxxUOIRrvOvYUFsZBItthbbVJDH6AecLXVFraKifEKjb
         pOSJgFRYZmyqKFQzp6QF1c4kkaFWNaBIx/mKy1xMDw9Oxpksq+4W8aC+RAGz85zXOt1T
         eySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764167893; x=1764772693;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njASJ/nBXaJugyDd/dGxfpQZEhP3Dmqwkfhj1VAnsnE=;
        b=HD8XRYdU/p0MGbnpCbMQxoNKeKX5pufqraw+ojYMcuFVzxNXdaEfxPfrusCRNf9pWH
         qzRyMEUzcZ9X6I7bX0yZh5BjkMxwVT4klkV2XP12YsByYXSgitBtmuVAMpYyRIiDAdtA
         zgHgu8JiENdrCLBXGDVzp0abCBWa6lsDdzIAW1hF5R0GMMjmmQKeIucf1QCB9bIzPUV8
         PkN4/mAG2OvnM+95Yy4kJczk23FBbEfK36btbc1FtZHqrrf+FKGRPoFrrLFhECzpJwbA
         bXthHH2+Va1TSUqcuARhoeU595W1ftoChAZk5ZtFRB5z4jwloM2+YFZJKVwBDM6zrB8y
         +Qfw==
X-Forwarded-Encrypted: i=1; AJvYcCW+4VKLc6vkXtz6SuGLrcFSJecDao0NwGZbMg9qiYP6S9PccMAflJLX0gbyIV2fhMJSDsujnvbzpNg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyyibPTTSr5T1y+sYZcDlmKpN1XfWkVEkMFmZtKGBFFxRAq5GYt
	tA0d2ar8BUqNMZ5IiinJO2R+m4rhGYHzTdyCM7N+F0JU9AnsP6OexAYB7CVNcXOTaQ==
X-Gm-Gg: ASbGncthbtI2SYVPRZeD3wIPQVHeH6TlVFn6bgOpZo/hsWg1pmwyjplMaTGbVMpbWqB
	awDmFIA8w97UONHBOt8KVOZ62N98iqAHaAW7r7VzGveRzMgb2JY1SaiJWih/SqBaoD3GsgPWrq7
	B3Oo5bgy3LaErvUh9nDrqUPv2s8iKZj/cqPgdV3WuJpPsJM2B6/kMz3GfxGxLuB4tyS8mtEI6QC
	+aRbOQ6K8+ESxKTLb7w3xfNIT04Bn3RqD6m3XbUt8p1ewJKfqaM6gGKFpEo239ryqK42n+MN98A
	Am6jAQH57JxyUyuzB/cwbVrcPyau/ZUfyhhN0VZ2pFdXYGBghw1pfarsamV1f5PXsRQcKBFQdXq
	dObbgQXOAdsBjeOWl3yz1Hj1lEqB7C9TVhB55hlR5ze7wMXFBW48jxHigmyLt+55i3WlWfMXop8
	vip5kmEoaxBulFRVaqVeoS/GqGuq7+50C44SMLYNRxmoX7Bt/c55tvyuYyhG8kKK09E1Wc9DZc5
	js=
X-Google-Smtp-Source: AGHT+IFi1eJNJMUoWmCM3RdneTyCo19GJCSGhrPDG6OBI9/M9pk/5gNqh9SiEEUcYkyaxvvcDzdNOA==
X-Received: by 2002:a05:600c:350e:b0:477:ae31:1311 with SMTP id 5b1f17b1804b1-477c10e2a64mr172221395e9.13.1764167893524;
        Wed, 26 Nov 2025 06:38:13 -0800 (PST)
Message-ID: <17d26c00-f5d0-4c49-95be-18e20f28c6e1@suse.com>
Date: Wed, 26 Nov 2025 15:38:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86: move arch_generic_hweightl() to arch-specific
 library
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <245fbc16-924b-4fd9-8cbc-a539b569edac@suse.com>
 <76f2d454-ee2b-4aba-a6e5-974b1b2dfbb3@suse.com>
 <859d60ce-165d-416f-a1f1-89ba11de2839@citrix.com>
 <3e6d9b74-f606-4774-8767-c71391b9c741@suse.com>
 <afb03d32-c723-457f-8a29-fd2f6c9c69f2@citrix.com>
 <0c0cb917-ae36-48c0-83cd-80764a01587b@suse.com>
 <ca6d6c10-f757-4abc-9884-ca283a0a9197@citrix.com>
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
In-Reply-To: <ca6d6c10-f757-4abc-9884-ca283a0a9197@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2025 15:17, Andrew Cooper wrote:
> On 26/11/2025 2:09 pm, Jan Beulich wrote:
>> On 26.11.2025 15:05, Andrew Cooper wrote:
>>> On 26/11/2025 1:58 pm, Jan Beulich wrote:
>>>> On 26.11.2025 14:51, Andrew Cooper wrote:
>>>>> On 26/11/2025 1:24 pm, Jan Beulich wrote:
>>>>>> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
>>>>>> index 16368a498bb7..a0ee050c931b 100644
>>>>>> --- a/xen/arch/x86/arch.mk
>>>>>> +++ b/xen/arch/x86/arch.mk
>>>>>> @@ -3,6 +3,8 @@
>>>>>>  
>>>>>>  export XEN_IMG_OFFSET := 0x200000
>>>>>>  
>>>>>> +ALL_LIBS-y += arch/x86/lib/lib.a
>>>>>> +
>>>>> Oh, I'd realised it was this easy, I'd have done so straight away when
>>>>> adding x86's custom arch_generic_hweightl().
>>>>>
>>>>> I assumed it was going to be more complicated getting the order of the
>>>>> arch specific lib correct with the generic lib.
>>>>>
>>>>> More concretely.  Given an x86 lib, we should move things like
>>>>> arch/x86/memcpy.S to it.
>>>>>
>>>>> Therefore, when we have common/lib.a and arch/lib.a, do we guarantee to
>>>>> have arch/lib.a with higher precedence so for matching functions the
>>>>> arch specific one guarantees to be taken?
>>>> Not with the change above, it would need to become
>>>>
>>>> ALL_LIBS-y := arch/x86/lib/lib.a $(ALL_LIBS-y)
>>>>
>>>> to achieve that, requiring that ALL_LIBS-y won't change into a lazy-expansion
>>>> variable. If that's okay (please confirm), I can adjust the patch.
>>>>
>>>> Things would be yet easier if every arch had a lib/lib.a, as then in
>>>> xen/Makefile we could simply have
>>>>
>>>> ALL_LIBS-y                := arch/$(SRCARCH)/lib/lib.a
>>>> ALL_LIBS-y                += lib/lib.a
>>>>
>>>> Alternatively we could move the setting of ALL_LIBS-y in xen/Makefile to
>>>> after the arch/$(SRCARCH)/arch.mk inclusion. I'd be a little wary of that,
>>>> though, as it would then be different from ALL_OBJS-y.
>>> I think this would be better handled by common code.
>>>
>>> Arches are going to want a lib.a eventually.  ARM even has
>>> arch/arm/arm{32,64}/lib/ but like x86 they're just simple obj-y += at
>>> the moment.
>>>
>>> However, arches shouldn't be forced to make an empty one simply to build.
>>>
>>> Does this work:
>>>
>>> ALL_LIBS-y                := $(wildcard arch/$(SRCARCH)/lib/lib.a)
>>> ALL_LIBS-y                += lib/lib.a
>>>
>>> ?  If so, I think it's the nicest option.
>> I had thought of doing it this way initially, but on a fresh build
>> arch/$(SRCARCH)/lib/lib.a wouldn't be there when the Makefile is read in.
>> Whether switching ALL_LIBS-y to be a lazy-expansion variable would work
>> I didn't try; I'd prefer not to change the kind of variable that it is.
> 
> Hmm.  What about:
> 
>     $(filter arch%,$(ALL_LIBS-y)) $(filter-out arch%,$(ALL_LIBS-y))
> 
> in the link, at which point it doesn't matter about the exact order in
> ALL_LIBS-y?

Hmm, we could apparently do something like that, but looking at how ALL_LIBS
(note: not ALL_LIBS-y) is used, I wonder if I didn't make us depend on
unspecified behavior in f301f9a9e84f ("lib: collect library files in an
archive"): I don't think it is well-defined whether undefined symbols are
resolved by pulling in archive members when doing a relocatable link. (Of
course this is only a tangential aspect here.)

Another question is whether it is really always going to be the case that
arch-specific libraries want to take precedence over common ones.

To summarize, I think by this point I'd still prefer the

ALL_LIBS-y := arch/x86/lib/lib.a $(ALL_LIBS-y)

approach mentioned earlier.

Jan

