Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DAAC8105F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 15:31:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171186.1496209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXak-0005xp-Et; Mon, 24 Nov 2025 14:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171186.1496209; Mon, 24 Nov 2025 14:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXak-0005uh-C4; Mon, 24 Nov 2025 14:30:58 +0000
Received: by outflank-mailman (input) for mailman id 1171186;
 Mon, 24 Nov 2025 14:30:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNXaj-0005ub-43
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 14:30:57 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fd067be-c942-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 15:30:55 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42b3d7c1321so2703027f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 06:30:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa41d2sm28755336f8f.22.2025.11.24.06.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 06:30:54 -0800 (PST)
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
X-Inumbo-ID: 2fd067be-c942-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763994655; x=1764599455; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qCA3L95yX/2jmy0Bk1Q7WNixVlERopOtXm9Egrruomo=;
        b=UcpwGxYoPkgiy4CGoB0k7WPABY7FIZXw88AQgTDJo8q4Z4YLfQsbjGXNlFsS/qXY+G
         Z0ZCUSmCw9OM4bqJ4ATJ+mcp6tefOCHOjtBeE5jarGa7finuqfTeewrgGkHx6b6V18h1
         IxViOBYP7Hpwer/aXdrHF/1uYca+gz9a2kBmBb+C1qe44QmOsl4XcIeeO14tQuUBszhb
         HIel+tUm15ttKqCIRoL6fHfS6N8CiHnkMw1s10B1lw6Sg8BbVk7RUNslWgo9FoRGBh6V
         qVtJeYEsxLeRBuR4TKTFGW+/Abez0dMgavn7kXF+C/MHe9AVhBWFocPue9GMgYlZe6uQ
         D9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763994655; x=1764599455;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCA3L95yX/2jmy0Bk1Q7WNixVlERopOtXm9Egrruomo=;
        b=YOXjSfninaFz0zboX85i6fNvA/tPH3La0qvStmpsrm2C4+lJ3Ku4hk4HIAj7aVUWuL
         Yn2bMzd1ksdjrqnful4LqyUHyv/j5w8Cl7PIgSjnMWWAqQ27DsuhFy0ggeJDqn/fYwKR
         h/CoUaxjDSoLpABsz66o6pPU90cZ6vsHmJjB8t9R+S67U5bGKHgRW/IDzgW17Qua2WBw
         yaH8VEld16s395WaIfW17cmGv4W3zwYqYLCoAbEQp4PbwKX6ajAIxWKi1nVHvcrY3Kff
         GIwcfoYrbka42KN2BCVHLb4U06PYP0Uae8sFB5DVj/FAOpE9WDyfj6QO/YXYsp73nyt8
         IL5w==
X-Forwarded-Encrypted: i=1; AJvYcCUh4u7iDMjEhWlvQ0ojOyd7X8tpzCIPx5xxe3l9mH82bax3QIZxVoT22EM5x3mYDpiFg88WESN0BHo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIamZavfGdHiJN3pGy4CL4HIVqigqT5MPAhQIH2kX/Q5js2ENB
	rbcE6pukYtjl3ff/CTr4jVT5SNP/WY5w/qUWNxZiTzv+5o/qQ5UJ7KhGy1zrLZwKKA==
X-Gm-Gg: ASbGncvzvVSnw531G9LfJCayx7+ADpVZ8B8kUosrNLVSibZY3r/4Y56dWBOJJRpGMmo
	7/zWOkt79aTPMWXmP2mWFFDI4zRZ/JddP7SStdapU4PZFDH1ffFhanmPrgQJdRmkMA+SpsUQBsk
	mUvj7GbQFRKCAr4NIsbfF1pQ3mQewN1lDnyZ3U3KzSNVPN2QnV70nwI7kzNhXFxeHRngE7OvGjS
	jpdHyovmxTl2XM+KfTHyuw7fSejinou/d6jQvDx93gz/PF1NGUxiGUkdKU8x1zmZ2cMsK2QHDsU
	AY0b+8QbxkHnYmqZDx6NkqST3a5ZZfqoG3Azy49WvWOuyYquIKrS/7dYwnxDqo1+0WUABVtbZRq
	iF12iPA+D3P5j6LGVZErhE2dr0VzilzT4K/1bPU5v/w7Sjw8vEBiXbtvHGQufpDM6H64rI/06BK
	1avy5yRc4Hc7uWvXBG22i5qGtG7k/txi4m8rkMxW6E2FJVvedsIEbwcO3oRA+EvUVJPtlVejzwT
	io=
X-Google-Smtp-Source: AGHT+IHGuQ1Lk4gMV6IoZt99xBOgPOLJVjm9F9SsZ68lGMkPuUb6+Cx81ALTl/niHKajrccQMIBgbA==
X-Received: by 2002:a05:6000:2f81:b0:429:c711:229a with SMTP id ffacd0b85a97d-42cc1d23087mr14159791f8f.56.1763994654901;
        Mon, 24 Nov 2025 06:30:54 -0800 (PST)
Message-ID: <39df58e5-6b04-45fb-bd25-8ebc8972a7ed@suse.com>
Date: Mon, 24 Nov 2025 15:30:56 +0100
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
In-Reply-To: <a593e8cb-fa56-4301-a7da-ca4b51dfab9a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.11.2025 13:45, Jürgen Groß wrote:
> On 24.11.25 13:18, Jan Beulich wrote:
>> On 24.11.2025 12:27, Juergen Gross wrote:
>>> On 24.11.25 12:15, Jan Beulich wrote:
>>>> On 24.11.2025 12:05, Jürgen Groß wrote:
>>>>> On 24.11.25 11:41, Jan Beulich wrote:
>>>>>> On 21.11.2025 14:23, Juergen Gross wrote:
>>>>>>> --- a/Config.mk
>>>>>>> +++ b/Config.mk
>>>>>>> @@ -159,6 +159,19 @@ define move-if-changed
>>>>>>>     	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
>>>>>>>     endef
>>>>>>>     
>>>>>>> +PATH_FILES := Paths
>>>>>>> +INC_FILES = $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
>>>>>>> +
>>>>>>> +include $(INC_FILES)
>>>>>>> +
>>>>>>> +BUILD_MAKE_VARS = $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))
>>>>>>
>>>>>> Feels like my prior comments weren't really addressed. I continue to think that
>>>>>> none of the above is part of what the subject says.
>>>>>
>>>>> I really don't understand your concern here.
>>>>>
>>>>> For replacing the @markers@ make needs to know what should be replaced.
>>>>> So it needs to scan the files containing the markers and gather them.
>>>>> This is what is done above.
>>>>>
>>>>> In the final macro below the replacements are done then. How would you
>>>>> handle that?
>>>>
>>>> By passing (another) argument to the macro, for example. As indicated
>>>> earlier, different sub-trees may have different places where these
>>>> definitions live, and they would want to be able to pass that in
>>>> (ideally without needing to put this in a common part of the tree).
>>>
>>> I don't get what you want to pass in additionally.
>>>
>>> I've already changed the macro and the Makefiles to be able to add another
>>> marker file to the PATH_FILES variable. What else do you need?
>>
>> Well, that's simply an odd way of passing a parameter. Plus, the extra file
> 
> We do that all the times, e.g. by "OBJ-y += ..."

That's sufficiently different though: Accumulating the set of objects to
produce is kind of naturally done that way.

>> won't affect INC_FILES, or more precisely its use in the include directive
>> in patch 1: At least aiui, $(INC_FILES) is expanded at the point when the
>> directive is processed. Hence why you need to open-code another include
>> there.
> 
> The INC_FILES variable is mostly needed for specifying the dependence of
> the generated files on the files mentioned in PATH_FILES.
> 
> It might be better to just have "-include $(XEN_ROOT/config/Paths.mk" in
> Config.mk, matching the setting of PATH_FILES there.

Looking at this the 3rd or 4th time now, I still don't quite get why the
include is needed in the first place. You don't mean to use (right here)
any of the settings the file produces, do you? Really, as also mentioned
by Andrew, you really can't, because in a pure hypervisor build the file
wouldn't have been made, as no configure would have run.

If I'm not mistaken, you really need those values only at the time you
execute the rule. And I'm worried of these definitions to collide with
something else. Hence one desire would be to limit the scope of these
variables to just the new rule. Maybe something like

# Replace @xxx@ markers in $(1).in with $(xxx) variable contents, write to $(1)
define apply-build-vars
$(1): $$(shell grep -h := $$(wildcard $$(INC_FILES)) /dev/null)
$(1): $(1).in $$(INC_FILES)
	sed $$(foreach v, $$(BUILD_MAKE_VARS), -e 's#@$$(v)@#$$($$(v))#g') <$$< >$$@
endef

could work? (This likely depends on INC_FILES to only list files which
are configure generated, i.e. wouldn't be updated by a make rule.)

Jan

