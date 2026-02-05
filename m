Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AO1RIFtbhGl92gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 09:56:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C43F023D
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 09:56:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221640.1529828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnvAS-0007Ep-9k; Thu, 05 Feb 2026 08:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221640.1529828; Thu, 05 Feb 2026 08:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnvAS-0007CP-6v; Thu, 05 Feb 2026 08:56:52 +0000
Received: by outflank-mailman (input) for mailman id 1221640;
 Thu, 05 Feb 2026 08:56:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnvAR-00073Q-HN
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 08:56:51 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b7ef31e-0270-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 09:56:49 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so6919465e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 00:56:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d58214sm37468545e9.15.2026.02.05.00.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 00:56:48 -0800 (PST)
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
X-Inumbo-ID: 9b7ef31e-0270-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770281809; x=1770886609; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A7Ac80wrYxoM97kg0aFixqE5HnhAgyPQ0q0t7jyQ20Q=;
        b=UGodCQEdD606AHb/6sXqrXRDkk4WqGX8k/onbn7hfaAdCXcHrevG51XStUvrBBSgUi
         f4ZRJ3o38L22Ay4T3NoM9Pu4MPlDfb0jJ64KnjtXbAzEOAuufhfUnibp/CRZpBfg6sjV
         G8kXzWgAAH7f0HUvo2K/57fHhtDG8Vo/p0+lLUNjCY3DeXOCPLcEYlycBeLyiR0OTOVI
         lAHY9MvWhuv7uSZCCbOZQFwrLRFOT0XrMycvneq+KepHf/jOarQWG+xlRJ86nVDOF1sY
         4y7eWz9vBa8Z8JNbGOMpQMM/aDxzz4xxnoLknEbeQuhpw3egzSVfZ+M1Y7eO2qZH6B0n
         u1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770281809; x=1770886609;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7Ac80wrYxoM97kg0aFixqE5HnhAgyPQ0q0t7jyQ20Q=;
        b=MZab7kC1GNjQtwZ7oxHeKg5tV1WBX3YhwdiyhSnAsPkjITDpD6xskzPsZqWBsHi85d
         K1XbB5Qoc1CBgaXbzSZlu8sFak9Oj5/2RFkYx+4vOZBDfjALqWCjyMOa8Mr5sxQCiGOH
         J3kJ2fXoJXPDy4hUl7tlSiTeIz14j8yK6xBd0ZEDHyBq0sL35MbcZOx82eM0d5waRYqT
         lXKqblmtfmVmaWfF817a7yuL4i/5tcoGqt1PNhExPxJK8REgs2+iWO9pSrwRYQ5mVZbe
         8Eq/JtK5+50SNmZLN8ANB4+v6JuEuvSHIen0stIr4grSvqi6L0l4jOCOS+xZ+k/0mx8b
         ah6A==
X-Forwarded-Encrypted: i=1; AJvYcCUn800LR2VcKukMLFqJbqvCi7fj1iYNJNskvGUgkuHO/cdi4imGRswuP/SVUJHzCNYSaZkaegFTMBQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzygWlFF4N5dwe7EsUJwKHmvcAfuiZdaamKaW5EqX7mRjX38/yr
	dRbaK7oQXXJtzDOBCmV1WZzKrfOcwdLRsVwkt1BZqfsZPnW6c7eTpI86Sv12/Z8rIQ==
X-Gm-Gg: AZuq6aIgHsfwUaEEFWil17Vt57gB9E5H772tWFUqoyu65c1grWk3yNmS1K+dPtydhab
	E8ayXqxDMbKr+JfH9dppjDbfI4M9ZTjuIvRCASuseMaqGeSQ3BkKVP7sFN/s7YFmUsttNEuJfG3
	WRBT5Bb2nQ/8mlsKtojv7OSGyDpOfQQrw1ulErNvIArd8HuCVUvqSRKN7npTMnyvMlMtYe7GlZ6
	DHGBab+wOM9LyAK+UBWGNPtYRYAz1k9VborwE+rG4ZahTvAx3weBucMBG/tFCfyZSo+1yZkPLUJ
	aqTdDKcf05gOjsv++zSVuuazuOoXlcLIu5UgrIJ3pFjdGfMRnrVy9jG5G+lajGNGizYBfj4fcr0
	StOEyTjcbyX+zFOGg1A0D2gDBS5KZ+XuinHq9fgWHXLw3+fkGDT6jA3MXgxgA9OL6IEjgPpDDJa
	Ng7euG7K2vaEiU8hgOZpw1F1MT/7Jb3vx+pUh3l0iVk+Ie0kNq63hLfXnAEMGPkJYm5oBvLr5HF
	jA=
X-Received: by 2002:a05:600c:4e05:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-4830e979260mr83756785e9.19.1770281808911;
        Thu, 05 Feb 2026 00:56:48 -0800 (PST)
Message-ID: <e77fc7ab-39fe-444d-bc04-591155f68aa3@suse.com>
Date: Thu, 5 Feb 2026 09:56:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen: Add macOS hypervisor build support
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d923a50ff7870087347ef783516f3c2d2764dc6e.1770210872.git.bertrand.marquis@arm.com>
 <a3637eb3-ff0d-4a69-aa7e-e86be92b062b@suse.com>
 <5062E1F2-D023-4BF9-A829-BB996686B04C@arm.com>
 <eca1e783-b147-4230-a340-41b8cb694c5e@suse.com>
 <65D4FEA7-DECD-4DDD-B119-4625F72ED585@arm.com>
 <eed4bb7b-5836-4345-984d-c542b9f1da34@suse.com>
 <C8CFD80F-057C-40D5-93B4-176F3D785C44@arm.com>
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
In-Reply-To: <C8CFD80F-057C-40D5-93B4-176F3D785C44@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 19C43F023D
X-Rspamd-Action: no action

On 05.02.2026 09:44, Bertrand Marquis wrote:
> Hi Jan,
> 
>> On 5 Feb 2026, at 09:23, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 05.02.2026 08:44, Bertrand Marquis wrote:
>>>> On 4 Feb 2026, at 17:15, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 04.02.2026 16:45, Bertrand Marquis wrote:
>>>>>> On 4 Feb 2026, at 16:31, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 04.02.2026 14:16, Bertrand Marquis wrote:
>>>>>>> Xen does not currently document how to build the hypervisor on macOS, and
>>>>>>> there is no Darwin configuration for a Homebrew-based toolchain. In
>>>>>>> addition, the Makefile silent-mode detection can be tripped by -I paths
>>>>>>> that contain an "s", which hides build commands unexpectedly.
>>>>>>
>>>>>> This wants submitting as a standalone fix, so it can be backported. But see
>>>>>> also below. I don't, however, understand how -I could be useful here - our
>>>>>> build system is self-contained, so any include directives used should be
>>>>>> satisfiable without any -I.
>>>>>
>>>>> This is added automatically inside our Makefile if you build out of tree:
>>>>>
>>>>> MAKEFLAGS += --include-dir=$(abs_srctree)
>>>>>
>>>>> which ends up being -Ixxx when tested.
>>>>
>>>> Hmm, but I do have an 's' in my source path, yet I need to explicitly pass
>>>> -s for the build to be silent.
>>>
>>> I did further investigations and my previous assumptions where actually
>>> wrong because i looked tat MAKEFLAGS value once the whole Makefile
>>> was parsed and the include-dir flag is added after so it was not the reason
>>> of the issue.
>>>
>>> In fact the issue is coming from variables set on the command line (and
>>> in my case O= with a path containing a s).
>>> So you can easily reproduce the issue by just passing XX=s to the make
>>> command line to do a test.
>>>
>>> As a consequence, your proposed solution filtering -% is not working and
>>> the only reliable solution is to actually use firstword to actually get the
>>> short options list. This is making an assumption on MAKEFLAGS having
>>> them first but my tests are showing that it is always the case.
>>> I would propose to put a comment to explain the assumptions on which
>>> the filtering is based on top:
>>>
>>> Something like this:
>>> diff --git a/xen/Makefile b/xen/Makefile
>>> index 13e336ba5484..a7924fcb7af5 100644
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -113,10 +113,10 @@ else
>>>     Q := @
>>> endif
>>>
>>> -# If the user is running make -s (silent mode), suppress echoing of
>>> -# commands
>>> -
>>> -ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
>>> +# If the user is running make -s (silent mode), suppress echoing of commands.
>>> +# This relies on GNU make encoding short options in the first MAKEFLAGS word;
>>> +# if this changes in the future, this check may need revisiting.
>>> +ifneq ($(findstring s,$(firstword $(MAKEFLAGS))),)
>>>     quiet := silent_
>>> endif
>>>
>>> Also i can put a fixes tag if you think that is useful:
>>> Fixes: 4fdb4b71b152 ("xen/build: introduce if_changed and if_changed_rule")
>>>
>>> Please tell me if that sounds ok for you and I will resubmit this as 2 different patches
>>> instead of a single one.
>>
>> Sadly no, see my other reply sent earlier today. Furthermore, as said there, even
> 
> Sorry missed you reply when i wrote mine.
> 
>> with O= I can't repro what you say. In fact with a Makefile containing just
> 
> interesting
> 
>>
>> $(warning MAKEFLAGS="$(MAKEFLAGS)" ABC="$(ABC)" XYZ="$(XYZ)")
>>
>> all:
>> @echo 'MFLAGS=$(MFLAGS)'
>> @echo 'MAKEFLAGS=$(MAKEFLAGS)'
>>
>> I can observe (with both make 4.0 and make 4.2.1) $(MAKEFLAGS) expanding
>> differently depending on where it's used (I'm passing ABC= and/or XYZ= to
>> experiment): Only the use in the rule has the variables. What version of make are
>> you using?
> 
> I am using make 4.4.1 on both my Linux and brew based builds which might explain
> why i always see the same.
> 
> I have an other linux system where i have make 4.3 and in this one, MAKEFLAGS does
> not contain O= options when the test is done so the issue is not appearing there:
> 
> adding:
> @@ -116,6 +116,7 @@ endif
>  # If the user is running make -s (silent mode), suppress echoing of
>  # commands
> 
> +$(info MAKEFLAGS=$(MAKEFLAGS))
> +$(info MFLAGS=$(MFLAGS))
>  ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
>      quiet := silent_
>  endif
> 
> ## On linux with make 4.3 i see:
> MAKEFLAGS=-rR
> MFLAGS=
> and the build is not silent
> 
> with -s:
> MAKEFLAGS=s -rR
> MFLAGS=-s
> 
> with --warn-undefined-variables
> MAKEFLAGS= --warn-undefined-variables -rR
> MFLAGS=--warn-undefined-variables
> 
> ## but on linux with 4.4.1 i see (same with brew make 4.4.4:
> MAKEFLAGS=rR -- XEN_TARGET_ARCH=arm64 O=builddir-s-test
> MFLAGS=-rR
> and the build is silent
> 
> with -s:
> MAKEFLAGS=rRs -- XEN_TARGET_ARCH=arm64 O=/home/bermar01/Work/xen/xen/builddir
> MFLAGS=-rRs
> 
> with --warn-undefined-variables
> MAKEFLAGS=rR --warn-undefined-variables -- XEN_TARGET_ARCH=arm64 O=/home/bermar01/Work/xen/xen/builddir
> MFLAGS=-rR --warn-undefined-variables

Ah yes, and here is a quote from make 4.4's NEWS:

"* WARNING: Backward-incompatibility!
   Previously only simple (one-letter) options were added to the MAKEFLAGS
   variable that was visible while parsing makefiles.  Now, all options are
   available in MAKEFLAGS.  If you want to check MAKEFLAGS for a one-letter
   option, expanding "$(firstword -$(MAKEFLAGS))" is a reliable way to return
   the set of one-letter options which can be examined via findstring, etc."

> So i think the working solution would be to keep the current test but do it on MFLAGS instead of MAKEFLAGS:
> 
>  ifneq ($(findstring s,$(filter-out --%,$(MFLAGS))),)
>      quiet := silent_
>  endif
> 
> Could you quickly do the same test than me on make 4.0 and 4.2.1 to confirm ?

Well, I did confirm this already with my earlier experimenting. IOW either
this or the $(firstword -$(MAKEFLAGS)) they suggest (effectively matching my
earlier suggestion, prepending '.' instead of '-', as really any char other
than 's' or a whitespace one will do here). Personally I'm slightly in favor
of the MFLAGS variant.

Jan

