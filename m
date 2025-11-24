Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FF5C81546
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 16:28:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171461.1496476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNYTc-0003DE-Ky; Mon, 24 Nov 2025 15:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171461.1496476; Mon, 24 Nov 2025 15:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNYTc-0003AJ-Hk; Mon, 24 Nov 2025 15:27:40 +0000
Received: by outflank-mailman (input) for mailman id 1171461;
 Mon, 24 Nov 2025 15:27:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNYTa-0003AD-6u
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 15:27:38 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 192930e6-c94a-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 16:27:33 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477aa218f20so27742815e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 07:27:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf22dfcesm204183895e9.13.2025.11.24.07.27.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 07:27:32 -0800 (PST)
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
X-Inumbo-ID: 192930e6-c94a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763998053; x=1764602853; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yC/bZLu+EIxdCkEcr1l6dhxqmfTALUd18Ae0pypNCPw=;
        b=O2Ot9saf8IaDdqt8aui+45wIjA8dB4yriWhYZZBNDgwIo5eTlim1lytKRHCLSFxb20
         zhB2FSawivV5vBoYulxZhArQg0tRco7JmpAouSICIA5pYDYN+8gVJQM7HbEALjjQiKWF
         bEpN8IAByvg+ttHJ6kmyTaE7b/a96ZWGs2G/aGZS10/dfuinNS3LE4MO0H0Svz9nFbD4
         IK4Nx/jnudVgeycOc6VlmcWAJw7jvb1pSw81RGqoyAjyYmcBScKT7cAddQch1SAQUt59
         jwpTvbUDSQ5+2hAVGm3z8OQ9ZWHYAY3wcHd5u2tCb7JQvN4CD7HWSaLkUnWNJ5R5yQhD
         xCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763998053; x=1764602853;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yC/bZLu+EIxdCkEcr1l6dhxqmfTALUd18Ae0pypNCPw=;
        b=F/2TwQ63F+GzKTum4A7ewwX+evg9ILm+Q4iEB6UQONxp3EJEskJV5vMeMGzA4cRBhM
         Jb0i/encqVX/bGlmttdJLBoFT2PDKEEv6cw+1a/9ueoBujZLQ8OUKKppoljKr21t2lzY
         KBu/xGVAeg5FvHokUbPrgCofvCAeL2tJVzaQkJ9FC6ZAfuVt8jV4UsAiTgNAcR27z9oM
         4pPcVcnwsLsMyfgWcjNfw4xinqytX0GfNgRBI5jcwAgYNGrRWMWEX7xLY8Wb77NSr/hq
         hIvg1ED0qunEK28DwGfglXVGl9ikRRCiltwmGpfYUDIM2rXR2xZ8XY8IwPyBgKe3M+ld
         vWdg==
X-Forwarded-Encrypted: i=1; AJvYcCVFAkAZyKvBU/ySu94H3ttoCwhWZNpwUx/bEqc+W4VqsPjwlEnV/Fu0zNIH19x58tP7+7AYtRMdAfE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzseC5uJpBdB5XQQSGRiis5C4Lkf5QpOdRme/Piayby1WHKuaK6
	sqk54HT/OEYG/r3H0RJdOzHcdUj4ZE2Fmh96DZ1qiqb1EIFuClNkm/1GY9pEjTl3Pg==
X-Gm-Gg: ASbGncsiWHO0i4rWuqqQ/+pqOeqAcu3Q9zaA1Of9LfcOvCoFxh28+PSkdvX4vZJaGdW
	I3w40n+o7fa+Yjmbx1byrw+nD+VldvAKkd7GiEskRPD0sSw6Q6QoJigu9pGuRZt37/hbWF1UL10
	2A2jLswJEbzFxn1G79P/gT71W6Ws6zn6MVKZdHHf3epyc+fo84diy05U4F/39XCx9wbCnRcppaB
	/6SoOE4ZSCJJQZn6VfgJnfxxJHwFiEd9s3faGpu5t7Q/c5SQkOZFV4w+s6m24o9H2iYW/jfevuZ
	c4JTS/c1AvBpSqYR6uonxAyIq4TpPlfvBrdHYCJpKOlLUGrRZNSDx9hPR8cLrE46qcaIUnqemTv
	7uN9OO2G446WV2B4sNhwoPQlqm3ySUB29aGHfVIs1ZgVsXcWjpLucm7/4CnZ5g8HhFLzS8JheRb
	XAfq8s+Lty8/GSFL52b/oUyP4uE1wv6J5S8qBwass+4DVyFQcDGXeVbykse3QbTRxmFtQcOSPB+
	4g=
X-Google-Smtp-Source: AGHT+IHBM//D9k1OavE524VofWHnJt08S27ZWc4T7ADWjVurht+kS7pHtF1pVJ4BSBbsXCJBdfBKSQ==
X-Received: by 2002:a05:600c:190a:b0:477:76cb:4812 with SMTP id 5b1f17b1804b1-477c00ef528mr153973365e9.0.1763998052959;
        Mon, 24 Nov 2025 07:27:32 -0800 (PST)
Message-ID: <610bc497-4a83-49c5-bd1d-8e63794c62f3@suse.com>
Date: Mon, 24 Nov 2025 16:27:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251121132332.23514-1-jgross@suse.com>
 <20251121132332.23514-2-jgross@suse.com>
 <d34e3e86-c51a-49b3-8b46-140526755f0f@suse.com>
 <826037a5-dacf-434f-90d9-8f12e61bdd6e@suse.com>
 <0ece9df6-8a04-4ffa-bcf4-d7a3fd4bbef4@suse.com>
 <bf7e1a66-1696-477a-bdef-79b08df0b57c@suse.com>
 <bbcaf4f2-c52e-4b3e-ab6a-ca5020a8b786@suse.com>
 <a593e8cb-fa56-4301-a7da-ca4b51dfab9a@suse.com>
 <39df58e5-6b04-45fb-bd25-8ebc8972a7ed@suse.com>
 <158df666-9359-4fe8-976b-f194a1fb317b@suse.com>
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
In-Reply-To: <158df666-9359-4fe8-976b-f194a1fb317b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.11.2025 15:58, Jürgen Groß wrote:
> On 24.11.25 15:30, Jan Beulich wrote:
>> On 24.11.2025 13:45, Jürgen Groß wrote:
>>> On 24.11.25 13:18, Jan Beulich wrote:
>>>> On 24.11.2025 12:27, Juergen Gross wrote:
>>>>> On 24.11.25 12:15, Jan Beulich wrote:
>>>>>> On 24.11.2025 12:05, Jürgen Groß wrote:
>>>>>>> On 24.11.25 11:41, Jan Beulich wrote:
>>>>>>>> On 21.11.2025 14:23, Juergen Gross wrote:
>>>>>>>>> --- a/Config.mk
>>>>>>>>> +++ b/Config.mk
>>>>>>>>> @@ -159,6 +159,19 @@ define move-if-changed
>>>>>>>>>      	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
>>>>>>>>>      endef
>>>>>>>>>      
>>>>>>>>> +PATH_FILES := Paths
>>>>>>>>> +INC_FILES = $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
>>>>>>>>> +
>>>>>>>>> +include $(INC_FILES)
>>>>>>>>> +
>>>>>>>>> +BUILD_MAKE_VARS = $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))
>>>>>>>>
>>>>>>>> Feels like my prior comments weren't really addressed. I continue to think that
>>>>>>>> none of the above is part of what the subject says.
>>>>>>>
>>>>>>> I really don't understand your concern here.
>>>>>>>
>>>>>>> For replacing the @markers@ make needs to know what should be replaced.
>>>>>>> So it needs to scan the files containing the markers and gather them.
>>>>>>> This is what is done above.
>>>>>>>
>>>>>>> In the final macro below the replacements are done then. How would you
>>>>>>> handle that?
>>>>>>
>>>>>> By passing (another) argument to the macro, for example. As indicated
>>>>>> earlier, different sub-trees may have different places where these
>>>>>> definitions live, and they would want to be able to pass that in
>>>>>> (ideally without needing to put this in a common part of the tree).
>>>>>
>>>>> I don't get what you want to pass in additionally.
>>>>>
>>>>> I've already changed the macro and the Makefiles to be able to add another
>>>>> marker file to the PATH_FILES variable. What else do you need?
>>>>
>>>> Well, that's simply an odd way of passing a parameter. Plus, the extra file
>>>
>>> We do that all the times, e.g. by "OBJ-y += ..."
>>
>> That's sufficiently different though: Accumulating the set of objects to
>> produce is kind of naturally done that way.
>>
>>>> won't affect INC_FILES, or more precisely its use in the include directive
>>>> in patch 1: At least aiui, $(INC_FILES) is expanded at the point when the
>>>> directive is processed. Hence why you need to open-code another include
>>>> there.
>>>
>>> The INC_FILES variable is mostly needed for specifying the dependence of
>>> the generated files on the files mentioned in PATH_FILES.
>>>
>>> It might be better to just have "-include $(XEN_ROOT/config/Paths.mk" in
>>> Config.mk, matching the setting of PATH_FILES there.
>>
>> Looking at this the 3rd or 4th time now, I still don't quite get why the
>> include is needed in the first place. You don't mean to use (right here)
>> any of the settings the file produces, do you? Really, as also mentioned
>> by Andrew, you really can't, because in a pure hypervisor build the file
>> wouldn't have been made, as no configure would have run.
>>
>> If I'm not mistaken, you really need those values only at the time you
>> execute the rule. And I'm worried of these definitions to collide with
>> something else. Hence one desire would be to limit the scope of these
>> variables to just the new rule. Maybe something like
>>
>> # Replace @xxx@ markers in $(1).in with $(xxx) variable contents, write to $(1)
>> define apply-build-vars
>> $(1): $$(shell grep -h := $$(wildcard $$(INC_FILES)) /dev/null)
>> $(1): $(1).in $$(INC_FILES)
>> 	sed $$(foreach v, $$(BUILD_MAKE_VARS), -e 's#@$$(v)@#$$($$(v))#g') <$$< >$$@
>> endef
>>
>> could work? (This likely depends on INC_FILES to only list files which
>> are configure generated, i.e. wouldn't be updated by a make rule.)
> 
> And who is setting BUILD_MAKE_VARS? You didn't think the snippet doing that
> should be there.

I didn't mean to replace how that's done (albeit, as indicated earlier, I
think it wants doing differently). Hence I've only shown the sketch of the
updated macro wrt the specific aspect above. (Or am I misunderstanding
your reply?)

> And TBH: any setting from Paths.mk colliding with something else would
> _really_ be worrying.

No, why? Those settings should all be fine to use in e.g. the hypervisor
build system, for whatever purpose.

Jan

