Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D5284C6A5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 09:50:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677291.1053801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXddB-0000Tk-Cn; Wed, 07 Feb 2024 08:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677291.1053801; Wed, 07 Feb 2024 08:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXddB-0000Qx-A4; Wed, 07 Feb 2024 08:50:09 +0000
Received: by outflank-mailman (input) for mailman id 677291;
 Wed, 07 Feb 2024 08:50:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXddA-0000Qr-Eo
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 08:50:08 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3eb1aed-c595-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 09:50:06 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5115fcef9e9so419684e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 00:50:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e18-20020adffd12000000b0033b4acb999dsm927760wrr.98.2024.02.07.00.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 00:50:05 -0800 (PST)
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
X-Inumbo-ID: e3eb1aed-c595-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707295805; x=1707900605; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nZSIqQ/iatJRbl0FM8Szbv2uOJ95WfDTljckD54FTaU=;
        b=IXg4HN+LzeUWrt/L5qJR0OklFAN1EOTtRml9vuCVxCqncpcodIQYXfSDYcCPnnjlzQ
         H/cbWgU93jjXsc7uamhXzA98uBGvsCJU6Dp44R+Z3AIFhL2q9ZIIQzDq6/NiljMhmEyX
         o7mOZoFk7W68ZEs7Ud+9DA7ksvOUKx2Kf9Xa55tO0rTLFHBmrIDg7hByHI9qBHAd2BDi
         sM1gDgB7XRIMoynXyIrTrbc5x/F+76k4T4/K/8tJ5+KWGpt56vEExSHdwuCZYvxeKvOV
         5zyS37ToGsU5l79mJQe/VpRjJknfkjruCNt2Ommzf90XN6RIJ+cdhuvuEPc7HreMe2do
         SsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707295805; x=1707900605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZSIqQ/iatJRbl0FM8Szbv2uOJ95WfDTljckD54FTaU=;
        b=KdL0FLWDyoyN6xKPvVZ8k7hvVHNnfogEp36Kf9U6+bT9MGBHvIp4uFveCnLjXf8Yix
         gR75horGTl5RIJ8gy+W4Js85wZsx1RhzT9vzcO+JLD6I4zSJXVTUa5vZPPLHTemr7Nw0
         z9t9a+o+IE+o1N2R00SJP9IbLJrWo3thkw5YFXskL8WUIb/dwNJZmfFTpg4LK3rJ2H1S
         GK2T/ptI5VX6PSGZPzfyQioo5vg2vMjs82ONRxbxvGQaMHtpRkW5Qdg6HxRfj2koQvH+
         2mX5OToG1VjPfQ5hUXENf7sRTcdQR286NHOxc3ihWfKrh48t44Slse44ubc2BeRs8B7Q
         elKw==
X-Gm-Message-State: AOJu0YzHnxB1VBXKBD3DRAMED//h4cNb8ef7zfYfAeHNg90//nd/W+Ds
	enSeTk0YefVu7TWzdA7/8U8ksEfy/EsZ7GbhEe2FDcSV137BKR0jsCU9GTKcKg==
X-Google-Smtp-Source: AGHT+IGOLhNnELKlcVJ5BnGIKomDp/JfGS0UsmV51BVpAH5sfYlHO5f5ZvOTspmgQpHzlvssHuUCZA==
X-Received: by 2002:a05:6512:480a:b0:511:62fb:6664 with SMTP id eo10-20020a056512480a00b0051162fb6664mr1239502lfb.8.1707295805407;
        Wed, 07 Feb 2024 00:50:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUW2EGouGksObthuM4TWqNMeSxx0xTxCOstkx1/IbnyntF8KI9+vssIZwhYqKVLPnpuf9TB+dUw3FnaaYNc2rfxgi8SNQBmDQKyCi1T7bKOBSv6Pdof1J6RXjBDEw6HVGXGB38EK1kwujGcIvys58VJU6dq8ouaMGqGWT/8TcBL1t1qW7A=
Message-ID: <0ee0381b-326a-412e-91f9-bd464376b7d1@suse.com>
Date: Wed, 7 Feb 2024 09:50:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/p2m: aid the compiler in folding p2m_is_...()
Content-Language: en-US
To: George Dunlap <dunlapg@umich.edu>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@cloud.com>
References: <5d6c927e-7d7c-5754-e7eb-65d1e70f6222@suse.com>
 <7cce89f4-962e-bfbe-7d30-18fea7515bed@suse.com>
 <CAFLBxZZLJMWpf1fCNN4dhoDpYpW6O=V_C==-sCAZy6t4Df_yBw@mail.gmail.com>
 <47b5a1be-280c-4e8e-a5c5-6df7da657539@suse.com>
 <CAFLBxZY4hR6mxL_Zu+AYaNFsg528zmnL45K6tcE=_Lq7s5p=0w@mail.gmail.com>
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
In-Reply-To: <CAFLBxZY4hR6mxL_Zu+AYaNFsg528zmnL45K6tcE=_Lq7s5p=0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.02.2024 04:07, George Dunlap wrote:
> On Thu, Feb 1, 2024 at 10:15 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 01.02.2024 14:32, George Dunlap wrote:
>>> On Thu, Jun 23, 2022 at 12:54 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>>> By using | instead of || or (in the negated form) && chances increase
>>>> for the compiler to recognize that both predicates can actually be
>>>> folded into an expression requiring just a single branch (via OR-ing
>>>> together the respective P2M_*_TYPES constants).
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>
>>> Sorry for the delay.  Git complains that this patch is malformed:
>>>
>>> error: `git apply --index`: error: corrupt patch at line 28
>>>
>>> Similar complaint from patchew when it was posted:
>>>
>>> https://patchew.org/Xen/5d6c927e-7d7c-5754-e7eb-65d1e70f6222@suse.com/
>>
>> Not sure what to say. The patch surely is well-formed. It applies fine
>> using patch (when not taken from email). When taken from email, patch
>> mentions that it strips CRs (I'm running my email client on Windows),
>> but the saved email still applies fine. "git am" indeed is unhappy
>> when taking the plain file as saved from email, albeit here with an
>> error different from yours. If I edit the saved email to retain just
>> the From: and Subject: tags, all is fine.
>>
> 
> That still doesn't work for me.
> 
> 
>> I can't tell what git doesn't like. The error messages (the one you
>> see and the one I got) tell me nothing.
> 
> 
> The raw email looks like this:
> 
> ```
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -379,7 +379,7 @@ struct page_info *p2m_get_page_from_gfn(
>              return page;
> =20
>          /* Error path: not a suitable GFN at all */
> -        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) &&
> +        if ( !(p2m_is_ram(*t) | p2m_is_paging(*t) | p2m_is_pod(*t)) &&
>               !mem_sharing_is_fork(p2m->domain) )
>              return NULL;
>      }
> ```
> 
> Note the "=20" at the beginning of the empty line.  Why `patch` handles it
> but `git am` doesn't, who knows.

Hmm. Nothing like that seen when I save that mail. Plus I recall having
an issue with this when applying patches coming from Shawn, where those
=20 got in the way, but only if I pruned the saved email before handing
to "git am".

>> I'm also not aware of there
>> being a requirement that patches I send via email need to be
>> "git am"-able (unlike in xsa.git, where I edit patches enough to be
>> suitable for that), nor am I aware how I would convince my email
>> client and/or server to omit whatever git doesn't like or to add
>> whatever git is missing.
>>
>> Bottom line - your response would be actionable by me only in so far
>> as I could switch to using "git send-email". Which I'm afraid I'm not
>> going to do unless left with no other choice. The way I've been
>> sending patches has worked well for over 20 years, and for different
>> projects. (I'm aware Andrew has some special "Jan" command to apply
>> patches I send, but I don't know any specifics.)
>>
> 
> In the general case, I'm not going to review a patch without being able to
> see it in context; and it's not reasonable to expect reviewers to have
> specific contributor-specific scripts for doing so.  If we run into this
> issue in the future, and you want my review, you may have to post a git
> tree somewhere, or attach the patch as an attachment or something.  (Or you
> can try to figure out why `git am` isn't working and try to upstream a fix.)

Based on my own observation mentioned above, I assume "git am" is capable
of dealing with the =20, provided some specific further encoding
specification is present in the mail. Which I'd then have to assume is
missing from what Thunderbird sends, or the =20 is being introduced
without Thunderbird being involved.

> That said, in this case, context isn't really necessary to understand the
> change, so it won't be necessary.
> 
> The logic of the change is obviously correct; but it definitely reduces the
> readability.  I kind of feel like whether this sort of optimization is
> worth the benefits is more a general x86 maintainer policy decision.  Maybe
> we can talk about it at the next maintainer's meeting I'll be at?

I see no problem doing so.

Jan

