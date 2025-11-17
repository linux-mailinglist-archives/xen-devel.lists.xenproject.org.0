Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92526C648CA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 15:05:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163954.1490987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKzrB-0005Jw-7u; Mon, 17 Nov 2025 14:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163954.1490987; Mon, 17 Nov 2025 14:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKzrB-0005H6-54; Mon, 17 Nov 2025 14:05:25 +0000
Received: by outflank-mailman (input) for mailman id 1163954;
 Mon, 17 Nov 2025 14:05:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vKzr9-0005H0-8J
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 14:05:23 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7439ecfc-c3be-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 15:05:21 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-640d0ec9651so7217634a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 06:05:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4b1fadsm10885503a12.31.2025.11.17.06.05.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:05:19 -0800 (PST)
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
X-Inumbo-ID: 7439ecfc-c3be-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763388320; x=1763993120; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oi15DKT3aDsg6QpimKdL+Q5O4OWBWSHT2/3dLqG5Y+U=;
        b=Iwy1ntzgN9L4Bfk+X+vqau3AnQEk+6W47iBVStsA3aqBM9PoV/Db7As5bDHHicQfOJ
         1QNpxEHsYZLMtFUgRFX7tiwiyM0a5A6T/BtA1oJvgp7EHvKFSpTCnWmRQGN3LEN7i7qD
         QMHVriQxaVgA7wpa2/YVfvcMPOCC1dItJBlxSgunKHmHI8CfQsNz3RP3f+HKiY0R08vK
         MOZCqGabVt8c/2KG89uZwGd8pJe5Dt8ilziCJoygbd5Db+gAt2KLBtzEpYxoRGtikF4R
         sowgO2U7/ZBP/vr88uRC64eIvmTTuJEiOVJHWwsM6jGW9TzpD2tbVKLCNy/+nu6Hm4gG
         RYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763388320; x=1763993120;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oi15DKT3aDsg6QpimKdL+Q5O4OWBWSHT2/3dLqG5Y+U=;
        b=iOR/LD1f1dwn47QwP5HV4L5O1oG97zqrz8iSGtkia/3QhFQdSV5JtXhBrI3nM+eggr
         K8z+sPJQWJ1jynnQSFXnqGQVmGN06RoeIClQCuFe33Da4AMsV7M4sMdjrx5miuV1FH7a
         s8tpn6gwVORPCQp1SEtmrEyop8Io2WapAWeqa8fxl2aYVEne0NgrC2an7jQGo1xT784m
         JUrdDl9ZzWORoHcOIiKowQxWuniOOWu+OR7F479jqyI2tIPipP5I3CDavRe+2v1OJ1hw
         ++LqPBFYpLY2hkam38DQFFIN+7dGaGrOOw4wGLyRgKDQ7XqWMktMKOtMD1G04j/YxV8J
         r3Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVPYeqfJ+edZUNsjwWdDkzZFm5tijblGZNRHHN1CJv/d97jBwlhQ6x+DqdqHtobZrqKabNjt4+IIa8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz94bJZhiIYwf8J1dT3p5cyIWMkaxM1Cr+mk8Wz7pWKscrmgpH6
	HKyXFFjlN7QZLzLhfW0O5ecIOwGihTAarD7V/uSWzNZ5KYJedWP4GATXoz2NDHvuBQ==
X-Gm-Gg: ASbGncsZSjKGWyfbh3m+1//paOzI133YK3fSsoJksKuFLbEKJqe3Qi8lasS2pvCRtvc
	WtRzuxYKpZ4/bIGQSZ8jHxGNbHhBT0ob3gcjUljvwG4cC4Re7f2KiXKa47Lm7FYobTIw2jfKCez
	NvIRO011Uii0lFTuxxDitInGxlQCOHSFzkgwusi3/7dBbEsnn1ozqCMJZFuNazhAUD142od0gAS
	SoskhYPh6TnuEb5tUQHvsCrLZGbfcy3PaYJQy03QNhe4SG8W1AhKPpy8BagS4330a+7EVCQGGwV
	KyhLysTGLz4F+mP+hh45o5nq1mqke5m6A4GpPbjGISK/lwAg0LLG6tJqJeZKGgB0ePzjubOVxTu
	QFN642748IgrhgUl358QZ4gnsAyo+NoZYS2K8vTHFcHIGr9/0Dra7rgmRfATYGBQhM1BdH8XDx8
	wk1oJSuVs9LfXqnkDwUDYAlZukJjNGtBrCMer1z+PMbuG2GPY05aTwoj/XJVs0X3Tn2+NIXV6Z3
	hs=
X-Google-Smtp-Source: AGHT+IEc5NYvTEyzp4bpEqgfqSNbLl+WC01KST4xXvQKVgmfCLvJrW7R14G6A1Z6/cmBBWwvxUmk2A==
X-Received: by 2002:a05:6402:2691:b0:640:a9b1:870b with SMTP id 4fb4d7f45d1cf-64350e21a78mr11764085a12.14.1763388320485;
        Mon, 17 Nov 2025 06:05:20 -0800 (PST)
Message-ID: <3eca4c7a-0d72-4149-892e-c3ffcfca0ed4@suse.com>
Date: Mon, 17 Nov 2025 15:05:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] build: add make macro for making file from file.in
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-2-jgross@suse.com>
 <936632a3-d713-4183-b1db-5a554b617b74@suse.com>
 <7577ceec-1271-4569-91f1-fd7197a33991@suse.com>
 <f42863be-aef8-4a7b-915b-235bd89a8341@suse.com>
 <7ce4dd85-d88d-420d-b6da-9bee9fe61017@suse.com>
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
In-Reply-To: <7ce4dd85-d88d-420d-b6da-9bee9fe61017@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.11.2025 14:10, Jürgen Groß wrote:
> On 17.11.25 13:54, Jan Beulich wrote:
>> On 17.11.2025 13:48, Jürgen Groß wrote:
>>> On 17.11.25 13:29, Jan Beulich wrote:
>>>> On 14.11.2025 12:32, Juergen Gross wrote:
>>>>> --- a/Config.mk
>>>>> +++ b/Config.mk
>>>>> @@ -159,6 +159,19 @@ define move-if-changed
>>>>>    	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
>>>>>    endef
>>>>>    
>>>>> +PATH_FILES := Paths
>>>>> +INC_FILES := $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
>>>>> +
>>>>> +include $(INC_FILES)
>>>>
>>>> Is any of the above part of introducing the macro? "Paths" is already a
>>>> specific case of holding patterns that want replacing. In turn ...
>>>>
>>>>> +BUILD_MAKE_VARS := $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))
>>>>
>>>> ... it's not quite clear to me how it can be $(PATH_FILES) here.
>>>
>>> See patch 4.
>>>
>>> PATH_FILES is specifying the .mk files containing the marker definitions.
>>> I need the ability to have multiple such files in order to be able to let
>>> tools/configure build its own definitions.
>>
>> That's a good example - why would that affect the stubdom/ part of the tree?
>> Imo what pattern file(s) to use wants leaving to the invokee of the macro,
>> not pinning down globally for everyone.
> 
> Yes, I could add the tools specific marker file in the use cases under tools.
> 
> The question is whether adding it to 6 Makefiles is really worth that
> optimization, especially as only building the man files would be effected
> right now (which could change in future, of course).

Sticking to Paths.mk (which sits in the global config/ subtree anyway) might
be okay. The new (tools/ specific aiui) file you add later doesn't really
belong there, though. Therefore the macro may want to be constructed such
that it can be used both ways.

Jan

