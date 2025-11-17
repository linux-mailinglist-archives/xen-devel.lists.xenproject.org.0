Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ECDC642F8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 13:51:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163763.1490832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyhv-0002Qc-FA; Mon, 17 Nov 2025 12:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163763.1490832; Mon, 17 Nov 2025 12:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyhv-0002P4-C8; Mon, 17 Nov 2025 12:51:47 +0000
Received: by outflank-mailman (input) for mailman id 1163763;
 Mon, 17 Nov 2025 12:51:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vKyhu-0001xJ-HO
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 12:51:46 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bf225f9-c3b4-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 13:51:44 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6406f3dcc66so7168999a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 04:51:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa81172sm1065371066b.15.2025.11.17.04.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 04:51:43 -0800 (PST)
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
X-Inumbo-ID: 2bf225f9-c3b4-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763383904; x=1763988704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+R9BOcERIeXU8LRQN4JtCf/Y5k3H9zQGXysn+KICTKQ=;
        b=eN1XKCyWzx3Qgdc2Oney2UhMceCCKCnXvKMAacmLUoSD4tPMMyrsDccqQkKaef0Aky
         7pLTjZeQrVRk9+ns3HSBZ5pIU2TltJqB20lF8doBoHmZ4E2gFBdMXXwt+FVc+S1J5mm5
         gO/ReYW2C9O08uE80nRJv7AsWVuVyfN+i7FOl9aYM5lFzc09aY1uiiX0RheG+L2zpVKa
         +IPRbvJa1nbyxnCKjOge4/xFZ/Qp8y4tZamjCn9EEkRtQYnniNVSjIvdbyGX5hO5D3Bz
         Og4infx5ULwNSCcVmJqcDIDS5tJbnkgMfY45eoS3VO9x7kFN4WqDjl436K9UhFPr8R+H
         61yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763383904; x=1763988704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+R9BOcERIeXU8LRQN4JtCf/Y5k3H9zQGXysn+KICTKQ=;
        b=OiVHwN5s/HZqahpxF/bt85AfJmpchT2Qb9nXH76666UdRi5bNr208SSeZOUzqeCx5z
         Y2sus3vNTTF6VRW6iamw9P+sLMN3AtncXaMS/KkeK5xVxN1EwQ9EIQGZwK5IHvnHHfhU
         +zOfFZ7Do5bsbr07C22tSqfAcSUyiJq9oS5SmE2Bzo6YwBYUAu49o39hK0kkE0t+xzVR
         c9FZmO/RAA3mPboX6/Kixqi3To9Or3aYFrWk98Iglvd4nkFjw57m4ss8L0ltIvzUofwr
         gsOTwGUTuFZY7DDqZyhxvGdHMtQ/k8RbDl9ekcO5A5mePV8RFkCZidaKROPkqFOeSh3r
         ZGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0gnayhmkJQx7lSRhJ7FuvlQO52YuZzA5aP/wc5nUNJwD0ZeSbKMspgg49uEcsCvXQ1B3wR1XoDhg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjFwm5qEwEvPJLod746gE1uCabU0MmR0/tkr39jghGNVMj4wbz
	6mv47fEei5JMDD7YSR98/90tDVT0PLwe2Q7SnD1FFMlA/UvaF3v8+DRzs4wwk0VRDw==
X-Gm-Gg: ASbGncssO2SlFExSPt4KAJ3KuUxEPh0aoTbjuwA6ImVac4qtXR+SjEun4WfcsHiP+j7
	jF+LWFXVN6/zVgyyvJ75I9gmH6G1/Dt5PT6cXweZzi1vyX86jS1X4ElRQfAKGFp2BipN1obPlQS
	q9korzAUvzZGdPNUjppkxg3BJ9asI+B5YvqC3UrfawGLCPEzcgN0Zn/0KvS6n942jYEObtaitTn
	78M458lPVn7ESMiDvVtR1Nu1W5QkB0HrNajAvCdA/BLPHSdV9NNrTxTEgf5MOfGOkXcqArYuuDq
	SD4JuxKJDNr3F+g2ySmfKI30rGjbcGzfVXmXuz/TFezPYENW+tswLKuW0oT9+S4UfYmWxowes6R
	g/uzLHa8psczDEKxBK7dcBF8MQc2FyplpYHfFT0+7kbJBpO2Dpi3DUp5srCG4y233qiZ3TXyp8r
	VcwRFxCNJ2SFXTQXLpARnwOplRDD0+szmizCQmXahH9+9YmNkJH7kJZmeEVq5PPu7v
X-Google-Smtp-Source: AGHT+IHvF7DgeRfsK6km58wxrA5A+/iIdBKLUsvdxoJlKAFZ7dGiUy/YMg9Uaw8ni1qTBV45KTjqCw==
X-Received: by 2002:a17:906:f58b:b0:b4a:ed12:ce51 with SMTP id a640c23a62f3a-b73678b33c7mr1192356466b.23.1763383904222;
        Mon, 17 Nov 2025 04:51:44 -0800 (PST)
Message-ID: <c1b9bfb6-8ff8-4f60-953a-0f23818b5f95@suse.com>
Date: Mon, 17 Nov 2025 13:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] build: add make macro for making file from file.in
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-2-jgross@suse.com>
 <468c6686-43e5-4c35-8366-58558f199e22@citrix.com>
 <cc90d18b-f88e-49d9-a55f-b7035ce43167@suse.com>
 <113c9cc1-5e39-4a54-88de-dd2b70b90a49@suse.com>
 <88e6b9d8-21b6-4b37-97fc-d35b90ed9b49@suse.com>
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
In-Reply-To: <88e6b9d8-21b6-4b37-97fc-d35b90ed9b49@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.11.2025 13:37, Jürgen Groß wrote:
> On 17.11.25 13:24, Jan Beulich wrote:
>> On 14.11.2025 13:54, Jürgen Groß wrote:
>>> On 14.11.25 12:42, Andrew Cooper wrote:
>>>> On 14/11/2025 11:32 am, Juergen Gross wrote:
>>>>> diff --git a/Config.mk b/Config.mk
>>>>> index e1556dfbfa..d21d67945a 100644
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
>>>>> +
>>>>> +BUILD_MAKE_VARS := $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))
>>>>> +
>>>>> +# Replace @xxx@ markers in $(1).in with $(xxx) variable contents, write to $(1)
>>>>> +define apply-build-vars
>>>>> + $(1): $(1).in
>>>>> +	sed $$(foreach v, $$(BUILD_MAKE_VARS), -e 's#@$$(v)@#$$($$(v))#g') <$$< >$$@
>>>>> +endef
>>>>
>>>> Shouldn't this write to a tmp file, and use move-if-changed?  Most of
>>>> the time the markers won't have changed, and we'll want to short circuit
>>>> dependent rules.
>>>
>>> I can see this being an advantage when e.g. generating header files, as
>>> those being generated again would potentially cause lots of rebuilds.
>>>
>>> In this case I can hardly see any case where make wouldn't do the right
>>> thing already. Either the *.in file is newer than the generated file due
>>> to a git update or a manual edit, so make will regenerate the target (and
>>> this is what we want), or the *.in file hasn't changed, so make won't
>>> regenerate the file as it is newer than the *.in file already.
>>>
>>> Or did I miss some aspect?
>>
>> Aren't some of the generated files Makefile fragments? Them being re-generated
> 
> No.
> 
> Man-pages, shell scripts and some Ocaml files (one config file and one .ml file,
> which is similar to an include file I believe).
> 
>> means make re-invoking itself, which could be avoided if the contents don't
>> really change. (This isn't just a performance concern; this re-invocation has
>> been the source of, well, surprising behavior in certain cases.)
> 
> I still don't see a case where make would consider rebuilding the file from
> its .in file without the .in file having changed, thus resulting in the built
> file to change, too.

As Andrew indicated, Paths.mk might have changed, so at the very least an
explicit dependency would need adding. But as alluded to elsewhere, I'm not
quite convinced Paths.mk should be hard-coded as the sole source of patterns
in Config.mk. At the point further such file come into play, dealing with the
dependencies might get interesting / clumsy.

> Well, with one probably very rare exception: in case a
> different @marker@ is used in the .in file, but without changing the resulting
> file due to old and new marker resulting in the same output.
> 
> In case we really care about such cases, we should think about using
> move-if-changed everywhere, as e.g. building a program with $HOSTCC could
> result in an unchanged binary even with source files having changed, and the
> resulting program could be used to generate other files ...

For some of the cases this might actually be worthwhile. It all depends on
how much of a knock-on effect the re-building of a particular file has.

Jan

