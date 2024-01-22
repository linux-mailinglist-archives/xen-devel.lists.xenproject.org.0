Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E66836012
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 11:51:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669748.1042133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRrse-00045k-1e; Mon, 22 Jan 2024 10:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669748.1042133; Mon, 22 Jan 2024 10:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRrsd-00044A-V7; Mon, 22 Jan 2024 10:50:15 +0000
Received: by outflank-mailman (input) for mailman id 669748;
 Mon, 22 Jan 2024 10:50:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPlZ=JA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rRrsc-000441-HU
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 10:50:14 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 051ca626-b914-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 11:50:13 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cd1a1c5addso34018291fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 02:50:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x2-20020a92d302000000b00361931c8050sm3796812ila.62.2024.01.22.02.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 02:50:12 -0800 (PST)
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
X-Inumbo-ID: 051ca626-b914-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705920613; x=1706525413; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q+JBSme+TMZSZK1RFBQp7O9W2BPrTz1VR8WMUjAH6Vc=;
        b=Ihr94XhLG5Yiy/HDJT6lMrt4fSXCuVH7DNP7LWfF+9JHC6VPDmOkVbAWH9skxY+2D2
         KFqSrVSpK64TywR2mN0Vy+o8vH2Yy+2z37gHcQ7UKlo5kfH5B3EOiH0lq6/upOewyb/w
         j7IIPShwxkwOn6+gMA2Bzq5WxNrXLNNO9qC8oBprM5OqvD023pH0mvSD5ZUl1CUPKymA
         SO3D7jDf32HEEHfhcsXxCVhuZZpyKSn11wgm3DcfEwkXaDsNT0tAvia48aOnnjXY3tkU
         oKrYN16eAIajt+27yEHuaQ77yqYpLtBW3TLKjgOxnKqJCVfuoV5sdPoSO/9l3bUDEKZA
         BNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705920613; x=1706525413;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+JBSme+TMZSZK1RFBQp7O9W2BPrTz1VR8WMUjAH6Vc=;
        b=tyvBRlcp9j0mNNdt+izX7A7ZgpYfZOTOVPL45waakW2yEQqWXVS3+BPY2Q/5CS8ag5
         7KzemsUumcTyf0ky754jjEYRudbav5qzSbepYBVmdyiKAzXdl3hUzRWYe2hXAWBXLnKY
         amGTPyHPUF1Dfvi6XTlCg9Ipdd98x72bXyv7ardgl3cwW9IjQk+CbJLr81ElxRaNLTvE
         nhXCpgOy4DBRXHtv+6t3tKishWQJVNlqHFtysPmnMUG4/eaiV3hTAU1a1mSO2e/Y9j51
         4Gm9shCVYNnS21R7ytAA8VH2eTR4NEW+W24xkeZjgSqjN3IXpRsSBtG7L0/3BuZ+0OKY
         OoPQ==
X-Gm-Message-State: AOJu0YxlzbHl80zU8PcQGPihNvus9HV2SQpQ7aYAX6u3ts1SHHFwMVJT
	M/H9LyxqkJ5duli5B4de4geiD53mPvleHyE1qlkFoxhBY5NNQIeyT3kawy46dQ==
X-Google-Smtp-Source: AGHT+IE49WBzhJUdTnxcrXthglv34pni9jvIIyUdmZeeYjHlunD6+uSq9xCXEh8dJ/XUgT32dlhNkA==
X-Received: by 2002:a2e:924f:0:b0:2cc:94df:6d7d with SMTP id v15-20020a2e924f000000b002cc94df6d7dmr1461754ljg.8.1705920612804;
        Mon, 22 Jan 2024 02:50:12 -0800 (PST)
Message-ID: <81752c34-da03-45fc-9d57-9b91bdbfd833@suse.com>
Date: Mon, 22 Jan 2024 11:50:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] common: honor CONFIG_CC_SPLIT_SECTIONS also for
 assembly functions
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
 <5df1d87d-8e54-4e15-b1fb-46b274cb66ef@suse.com> <ZapQoLSOKew5W-Tt@macbook>
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
In-Reply-To: <ZapQoLSOKew5W-Tt@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.01.2024 11:36, Roger Pau Monné wrote:
> On Mon, Jan 15, 2024 at 03:40:19PM +0100, Jan Beulich wrote:
>> Leverage the new infrastructure in xen/linkage.h to also switch to per-
>> function sections (when configured), deriving the specific name from the
>> "base" section in use at the time FUNC() is invoked.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> TBD: Since we use .subsection in UNLIKELY_START(), a perhaps not really
>>      wanted side effect of this change is that respective out-of-line
>>      code now moves much closer to its original (invoking) code.
> 
> Hm, I'm afraid I don't have much useful suggestions here.
> 
>> TBD: Of course something with the same overall effect, but less
>>      impactful might do in Config.mk. E.g. $(filter-out -D%,$(3))
>>      instead of $(firstword (3)).
> 
> I don't have a strong opinion re those two options  My preference
> however (see below for reasoning) would be to put this detection in
> Kconfig.
> 
>> TBD: On top of Roger's respective patch (for livepatch), also respect
>>      CONFIG_FUNCTION_ALIGNMENT.
> 
> I think you can drop that, as the series is blocked.

Considering the series here has been pending for quite some time, too,
I guess I'd like to keep it just in case that other functionality
becomes unblocked or available by some other means, even if only to
remind myself.

>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -409,6 +409,9 @@ AFLAGS += -D__ASSEMBLY__
>>  
>>  $(call cc-option-add,AFLAGS,CC,-Wa$$(comma)--noexecstack)
>>  
>> +# Check to see whether the assmbler supports the --sectname-subst option.
>> +$(call cc-option-add,AFLAGS,CC,-Wa$$(comma)--sectname-subst -DHAVE_AS_SECTNAME_SUBST)
> 
> I guess you already know what I'm going to comment on.  I think this
> would be clearer if it was a Kconfig option.  For once because I think
> we should gate livapatch support on the option being available, and
> secondly it would avoid having to pass the extra -D around.
> 
> I think it's relevant to have a consistent set of build tool options
> requirements for livepatch support, so that when enabled the support
> is consistent across builds.  With this approach livepatch could be
> enabled in Kconfig, but depending on the tools support the resulting
> binary might or might not support live patching of assembly code.
> Such behavior is IMO unhelpful from a user PoV, and can lead to
> surprises down the road.

I can see the desire to have LIVEPATCH grow such a dependency. Yet there
is the bigger still open topic of the criteria towards what, if anything,
to probe for in Kconfig, what, if anything, to probe for in Makefile, and
which of the probing perhaps do in both places. I'm afraid my attempts to
move us closer to a resolution (topic on summit, making proposals on
list) have utterly failed. IOW I don't currently see how the existing
disagreement there can be resolved, which will result in me to continue
following the (traditional) Makefile approach unless I clearly view
Kconfig superior in a particular case. I could perhaps be talked into
following a "mixed Kconfig/Makefile model", along the lines of "x86:
convert CET tool chain feature checks to mixed Kconfig/Makefile model",
albeit I'm sure you're aware there are issues to sort out there, which I
see no value in putting time into as long as I can't expect things to
make progress subsequently.

Dropping this patch, while an option, would seem undesirable to me, since
even without Kconfig probing using new enough tool chains the splitting
would yield reliable results, and provide - imo - an improvement over
what we have right now.

Jan

