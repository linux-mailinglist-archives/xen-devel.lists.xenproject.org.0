Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF848735EA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 12:55:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689097.1074082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpqx-0007BI-MZ; Wed, 06 Mar 2024 11:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689097.1074082; Wed, 06 Mar 2024 11:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpqx-000794-Jj; Wed, 06 Mar 2024 11:54:31 +0000
Received: by outflank-mailman (input) for mailman id 689097;
 Wed, 06 Mar 2024 11:54:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhpqw-00078y-HA
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 11:54:30 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49a15dc3-dbb0-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 12:54:29 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a3f893ad5f4so981383566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 03:54:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w3-20020a1709064a0300b00a449ebf3d58sm5694485eju.85.2024.03.06.03.54.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 03:54:28 -0800 (PST)
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
X-Inumbo-ID: 49a15dc3-dbb0-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709726069; x=1710330869; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sQzbUWMozb32t6eQbESBiG7AGqyemyOFSeuNNrsTwfU=;
        b=W1ht+LRk6veusMmIrndSqCWRl3l9BfY699yebQrdfu3/49NSeqo+rdba5ztLA9c8Df
         LAdVjUx8hL2BmVLsxAph5hdG3AcxHvMeRoPJhzace7dr/kucMIzrJav7kg/lI1y+WcnM
         0/g0EZp2K4X0LkDY0oiCc47rVHqIsphyHlnJ2fjLboLr/aMGNnqzyhML0mECJWZc+qhb
         A7KeTsymrcpx5hfltYqJ9vdbvyAT5vRoJHDEJGFK7nvfqE/I0KKDkl6C8X5etHoe6Bee
         zmzqwalTmOdDwcto+uAhhO/zNO94pR3QcMBwTQjgfXv54cctl0R0twKijAmH2MmJ1ZCC
         uuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709726069; x=1710330869;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sQzbUWMozb32t6eQbESBiG7AGqyemyOFSeuNNrsTwfU=;
        b=T1H4/dCPMVcZnHq/7ZKa+fz7skbzVLqar7zkfYIisJNk17pJG7FgaOluu/r3Oj4Jlu
         /k0X5CsOHlaBwaGCRODTL8QwXWESnfYi4lLQX8fHCAfgxGvsDMv4pwyhZB+xnrR+aLFn
         vhakU525HSY4QcaIk1DeRzL7+sQoaK8Zs7HgAfisE4qwk7kT1+Bk7lf0TOSmn2uoqlEl
         C+u8DDmpYInjiTJl/jf4ADLQl90lXJTvpScWA0+zko3+0baimfs+FhT9pYlL5oftSygi
         4iTQZr19Vyllp4xaRwGvFJ2FVeTKyNJw8HElNG3eiiNAMqrok7eTtzDm/+imRkCkNeJD
         F5ug==
X-Forwarded-Encrypted: i=1; AJvYcCUEnJki2DyAlj8+1lFBMVq9LZ64W4cPRClEbsmZdMdnrQ7S2rzZHuxF9BPnpk1is8UCb1POh3ddTBfeKWjwnD2JcCWtg2Z420GiAohEfjU=
X-Gm-Message-State: AOJu0YysLmR7CR6uBAeNka7IGmXil/id1TsTZk3SjyKCbUMIQePy13xM
	7z4iF+9fc/ENJ7YyHaAdoI685J3MZI4VGw4mClGy4LNZBRYdHQ5LIXAfeUty2A==
X-Google-Smtp-Source: AGHT+IHhRXZMii21bXoQDuymGrboJDB4ahusTHVVkjx82tV2Hafgv5UUatuaTU29CCeoVeVXxTnpJQ==
X-Received: by 2002:a17:907:11c1:b0:a43:4ce5:db5c with SMTP id va1-20020a17090711c100b00a434ce5db5cmr10894669ejb.16.1709726068750;
        Wed, 06 Mar 2024 03:54:28 -0800 (PST)
Message-ID: <b3f08199-9f7c-40d7-9cdc-a562eb13e511@suse.com>
Date: Wed, 6 Mar 2024 12:54:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/entry: shrink insn size for some of our EFLAGS
 manipulation
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0ba4903d-638d-408e-bcd4-7c13cb56e078@suse.com>
 <76cdb4b4-a9f5-46e6-bb30-515ffb37c45a@citrix.com>
 <54bc9b3f-27af-41ea-9ab4-f35d38fe995d@suse.com>
 <e0ad8bfe-af36-4cbf-8948-8b23993198da@citrix.com>
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
In-Reply-To: <e0ad8bfe-af36-4cbf-8948-8b23993198da@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.03.2024 12:14, Andrew Cooper wrote:
> On 06/03/2024 10:49 am, Jan Beulich wrote:
>> On 06.03.2024 11:33, Andrew Cooper wrote:
>>> On 05/03/2024 2:04 pm, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/x86_64/entry.S
>>>> +++ b/xen/arch/x86/x86_64/entry.S
>>>> @@ -52,7 +52,7 @@ UNLIKELY_END(syscall_no_callback)
>>>>          movq  %rax,TRAPBOUNCE_eip(%rdx)
>>>>          movb  %cl,TRAPBOUNCE_flags(%rdx)
>>>>          call  create_bounce_frame
>>>> -        andl  $~X86_EFLAGS_DF,UREGS_eflags(%rsp)
>>>> +        andb  $~(X86_EFLAGS_DF >> 8), UREGS_eflags + 1(%rsp)
>>> The other adjustments are fine, but what on earth are we doing with DF here?
>>>
>>> This looks straight up buggy.  We've got no legitimate reason to be
>>> playing with the guest's view of DF.
>> This is the PV equivalent of the SYSCALL_MASK MSR, isn't it?
> 
> Well, is it?
> 
> It definitely never existed in 32bit builds of Xen, when the int80
> direct trap existed.
> 
> I don't see any evidence of it applying anywhere for compat PV guests
> either, even those with syscall enabled.

Neither int80 nor the 32-bit mode syscall apply the flags mask. Therefore
why would we mimic such behavior in Xen?

>> With it not
>> really being an (emulated) MSR, but an agreement that guests will only ever
>> care about having DF cleared (besides the requested way of dealing with the
>> event mask). One of the many things not written down anywhere ...
> 
> If it's not written down, it doesn't exist...

IOW the PV interface as a whole largely doesn't exist.

> And even if this is supposed to be a PV-FMASK-ish thing, it's buggy
> because it apples also when #UD is raised for no registered callback. 
> (And yes, I realise there is a chronology issues here (the #UD check is
> the newer element), but it really will corrupt state as presented in a
> SIGSEGV frame.
> 
> The question we need to answer is whether there is any remotely-credible
> way that a PV guest kernel author could be expecting this behaviour and
> relying on it.
> 
> I honestly don't think there is.

I was going to say XenoLinux and its forward ports did, but upstream
Linux does, too. The native and PV paths being largely shared, there's
no CLD in sight anywhere.

> It fails the principle of least surprise compared to native behaviour,
> 32bit PV behaviour, and to every non-SYSCALL based 64bit event also.

Why "every"? switch_to_kernel is used solely for syscall handling.

And why do you consider this behavior surprising, when really it would
be surprising for the flag to remain untouched from what user mode had,
when taking into account how the MSR is set in the native case?

> It either needs writing down somewhere (and the #UD case fixing), or it
> needs deleing, because continuing to leave it in this state isn't ok.

I can try to determine whether addressing the #UD case can be done in a
non-intrusive way. If so, I can split off that part of the change here,
and make it a separate one with the MOVL->MOVB just done on the side.
But really this is scope creep: The change as is has no (intended)
change in behavior. It ought to be fine to go in independently; the
further work you ask for could be done up front or later on.

Jan

