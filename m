Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE238AD302A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 10:26:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010594.1388728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOuJO-0000Uu-90; Tue, 10 Jun 2025 08:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010594.1388728; Tue, 10 Jun 2025 08:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOuJO-0000TP-5S; Tue, 10 Jun 2025 08:26:26 +0000
Received: by outflank-mailman (input) for mailman id 1010594;
 Tue, 10 Jun 2025 08:26:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOuJM-0000TJ-8r
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 08:26:24 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97d66064-45d4-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 10:26:23 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-450dd065828so34588385e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 01:26:23 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4521370936esm133663955e9.20.2025.06.10.01.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 01:26:22 -0700 (PDT)
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
X-Inumbo-ID: 97d66064-45d4-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749543983; x=1750148783; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8OtPQd3BNGsbzCYQd7Cgvi5Cg+O5c+T2fPfHfNlcul8=;
        b=bKzeDZf/9XQ29g3ESVYxXsnMzcbthwTyP1kAoPEj+u5cbHjChJ1A7a0rdmHG+psuW0
         y7BGBjXDH6JuO4/iP1mvrYL9KMVuKtcwqXkJQnNhi1omKOoh+tsvfdzwSOM1r4JMhV2H
         aVCmE1kPQNq70McqttFz/MsXu4oHK0EIFvYn+fN1aivmLzWey1nNaEFvsmQEOMRVTaYA
         ct3Q/quhBlC1eeaXP3zuztfvz9yvSZaNU8S2eD0tFd4psHvJq3B2gxbftG5RRTnZDDsH
         /EVztYYhgtCDxnZ5HSZm5thwSlitYdwh+a5Y7yyk8xchQNmKF6OvaF9AbNb+eIRKd2Z1
         725g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543983; x=1750148783;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OtPQd3BNGsbzCYQd7Cgvi5Cg+O5c+T2fPfHfNlcul8=;
        b=vZ+iaGkjaRR5pIy3WrFWF3MWkjdbDQmRJNeNV9wyxKRAaKqicE4PkAPMN8QJ7k3JMe
         Mmi7BwB7kBbXkLyjpcag0xf3DJcKg+Aw2w+E3/QtclPJVQGDNvrdwv3PJn33pGK8a4NB
         FJMRHgJDMax3jT38Yj4Qi8GdM2D4gRtG8aV9FWEZbouh4Jdt4TPcb2hrTyNbjtF8L+Ce
         rW/BdaqJhafJrpahCYlKjJArBbJHBcTE9cDkGaWVGm2fbq/lzub9FUkjyPF7u7NQ72bp
         +rbVz5xFpyFqdN1kLKkpLVlhgsPi3WXwqSPUWTvc5Ws0cVO5R4qvu3IL/ZNeSPMKZgQl
         b9Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUDok03r4ibSALWbjZ5SS+O9rfW3x2F/dY7IYxlBzHHd7IuxKAmvK0dpCDfwsEbANbXdv8dg39LLMg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlC1OdKI7rRd4THy+9iqLy6g7EhvOU5SUpWdlQQgjeHN3fWe8C
	daf5eiY3i1TS8HK5wzWVhCe5/4rRZNyj6BiM0UrCRhrs0ndF3KSLT0/UJIJikZH2Yg==
X-Gm-Gg: ASbGncs48UzEPY0hdRlVWcRaiDEAiyn3W5U0hC/8M4msAbmjzY2kOm5ZhpD4J/6rKn3
	Wbs7yi/e7P2FhRLltWqggcWEBEWCOfARKkapeDg+PdLehtcVtVFmDFCmkUfeJoq9tsXQ+5Hjosj
	TXbfm+HVdkxOlvWstVJmyZj9AlcmhCAlL3pr00pSXMlqLlvfgGrjijFEheXNI04qpyc4TEPlZSm
	tSf2TTHOrdSbmz/Y+48JdltWMWuT2WBL6D7T0ZZ3bRDOVoE2kOsPlDD5BI/LM9XWMHFTCwIrBDM
	Ddv4Mq0HiiQIAqGYLgmEyhI+O1mgwQO5eY6UpHsMymXMoMNGNKRscu2iHR6iZST66hovJoFX7Co
	9dzLPUen0gBv690+nlqYK8OwYgeftyl2VwHmn4dr7hGZ+wt9V42fCtleGuT5zXa/CWW3+rl2xNZ
	wWbjTyqGegrueQTO7hQ+uy
X-Google-Smtp-Source: AGHT+IFyk04OF2d0aTUnSZNb7vhYnP/WewiwxKAkvPJASxvHReRWoeXSxb6IopI1N3+f7i6N7YFZjw==
X-Received: by 2002:a05:600c:c163:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-452fa7ed515mr113449025e9.23.1749543982676;
        Tue, 10 Jun 2025 01:26:22 -0700 (PDT)
Message-ID: <11ea9475-d963-473d-a85b-d1c461e7b213@suse.com>
Date: Tue, 10 Jun 2025 10:26:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] xen/domain: adjust domain ID allocation for Arm
To: dmkhn@proton.me
Cc: Julien Grall <julien@xen.org>, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, roger.pau@citrix.com, sstabellini@kernel.org,
 teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250528225030.2652166-1-dmukhin@ford.com>
 <20250528225030.2652166-3-dmukhin@ford.com>
 <63087c42-d709-4e53-a2c3-8b812f13190a@xen.org>
 <a4c860d7-1fa0-43f4-8ae1-af59b7c6506f@xen.org>
 <30c01c78-5a5e-435f-9b1c-faca3af04a76@suse.com> <aEfmkMBW7r1KHuV0@kraken>
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
In-Reply-To: <aEfmkMBW7r1KHuV0@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.06.2025 10:02, dmkhn@proton.me wrote:
> On Tue, Jun 10, 2025 at 08:53:12AM +0200, Jan Beulich wrote:
>> On 06.06.2025 23:29, Julien Grall wrote:
>>> Hi Denis,
>>>
>>> On 05/06/2025 23:05, Julien Grall wrote:
>>>> Hi Denis,
>>>>
>>>> On 28/05/2025 23:50, dmkhn@proton.me wrote:
>>>>> From: Denis Mukhin <dmkhn@proton.me>
>>>>>
>>>>> From: Denis Mukhin <dmukhin@ford.com>
>>>>>
>>>>> Remove the hardcoded domain ID 0 allocation for hardware domain and replace it
>>>>> with a call to get_initial_domain_id() (returns the value of hardware_domid on
>>>>> Arm).
>>>>
>>>> I am not entirely why this is done. Are you intending to pass a different domain ID? If so...
>>>>
>>>>>
>>>>> Update domid_alloc(DOMID_INVALID) case to ensure that get_initial_domain_id()
>>>>> ID is skipped during domain ID allocation to cover domU case in dom0less
>>>>> configuration. That also fixes a potential issue with re-using ID#0 for domUs
>>>>> when get_initial_domain_id() returns non-zero.
>>>>>
>>>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>>>> ---
>>>>> Changes since v8:
>>>>> - rebased
>>>>> ---
>>>>>   xen/arch/arm/domain_build.c             | 4 ++--
>>>>>   xen/common/device-tree/dom0less-build.c | 9 +++------
>>>>>   xen/common/domain.c                     | 4 ++--
>>>>>   3 files changed, 7 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>>> index e9d563c269..0ad80b020a 100644
>>>>> --- a/xen/arch/arm/domain_build.c
>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>> @@ -2035,9 +2035,9 @@ void __init create_dom0(void)
>>>>
>>>> ... naming like create_dom0() probably wants to be renamed.
>>>>
>>>> That said, I am not convinced a domain other than 0 should have full privilege by default. So I would argue it should stay as ...
>>>>
>>>>>       if ( !llc_coloring_enabled )
>>>>>           flags |= CDF_directmap;
>>>>> -    domid = domid_alloc(0);
>>>>> +    domid = domid_alloc(get_initial_domain_id());
>>>>
>>>> ... 0.
>>>
>>> Looking at the implementation of get_initial_domain_id(), I noticed the behavior was changed for x86 by [1].
>>>
>>> Before, get_initial_domain_id() was returning 0 except for the PV shim.
>>> But now, it would could return the domain ID specified on the command line (via hardware_dom).
>>>
>>> From my understanding, the goal of the command line was to create the hardware domain *after* boot. So initially we create dom0 and then initialize the hardware domain. With the patch below, this has changed.
>>>
>>> However, from the commit message, I don't understand why. It seems like we broke late hwdom?
>>>
>>> For instance, late_hwdom_init() has the following assert:
>>>
>>>     dom0 = rcu_lock_domain_by_id(0);
>>>     ASSERT(dom0 != NULL);
>>>
>>> Jan, I saw you were involved in the review of the series. Any idea why this was changed?
>>
>> I simply overlooked this aspect when looking at the change. You're right, things
>> were broken there. Unless a simple and clean fix can be made relatively soon, I
>> think this simply needs reverting (which may mean to revert any later commits
>> that depend on that). I can't help noting that in this console rework there were
>> way too many issues, and I fear more than just this one may have slipped
>> through. I therefore wonder whether taken as a whole this was/is worth both the
>> submitter's and all the reviewers' time.
> 
> Yes, sorry, I overlooked late_hwdom_init() modification.
> 
> IMO, the clean fix would be adding another command line parameter
> `control_domid` (with default value 0), make get_initial_domain_id() return it
> instead of current `hardware_domid` and update late_hwdom_init() to use
> `control_domid` insted of open-coded 0.

No, no new command line option will address this. Original behavior needs to be
restored (either by correcting the earlier change or, as said, be reverting).

Jan

