Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A2AC806F0
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:19:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170403.1495469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVWY-0007kP-Ea; Mon, 24 Nov 2025 12:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170403.1495469; Mon, 24 Nov 2025 12:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVWY-0007hw-BD; Mon, 24 Nov 2025 12:18:30 +0000
Received: by outflank-mailman (input) for mailman id 1170403;
 Mon, 24 Nov 2025 12:18:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNVWX-0007ho-GH
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:18:29 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id addf20bb-c92f-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 13:18:26 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-429c4c65485so3448581f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:18:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f49a7bsm27688435f8f.19.2025.11.24.04.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:18:25 -0800 (PST)
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
X-Inumbo-ID: addf20bb-c92f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763986706; x=1764591506; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+aKzSlO0FYcL1JvCqmyhHBMOH9OmZmRRSYMBODN08HU=;
        b=QldeVht6ZqX3wLWL+icmXWBjQ9HGxN/7587sbnqXC3gCjGQO/RXYyL9pC5Tbv205J9
         6NB+lCvof7rFxwr5ctIpv/BOZUtxS0othyCkjwLfDGX0Xldch0Uc58fTIWpo/pml36m7
         TxE88oJtgg6/D2pkBvPDNS2MuZtSB39py1oMllWN6Ch+nO5lal0gmNZtDqPWNuInthno
         nK+9zByNImo2CJljRrTLLgBrSjjC5u8MAZ/He4NkZqGg9sYp+JZcE2ENwh73llA9P5Mc
         J1UjPRruOrzpAJNMOW2Wtbxb+ViLFJPtcExU2A1QV8efC8j1MKc0DugJKoLbI/AzSC6O
         M/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763986706; x=1764591506;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aKzSlO0FYcL1JvCqmyhHBMOH9OmZmRRSYMBODN08HU=;
        b=TegwYT/XSgWBpGtORUDNHspt67HO/oPZL8ibOGwf2HqVnafJtLX9SJcCWOQcHWNy6j
         mAB+7MUERqq91dbz5n7xjMJQHGip5FaOW8ekD9ZHwLP9Mrwssq8Z+Q46aeRyQXjWdp3M
         0SkXlZB+f1TLxe1W2BqQ2au/3Dn2PMEzCOlFU04xoeCoDE0zfduOy+SgFzu1ryGYKMkq
         w8Nk0vAAj/vUyG/9EtqZU1o7g12CTWip7/IUAZESv+oxoEPkqJeq2ZcyRCJv2rx/r/2M
         X2MUB9L1n99Ag9xy2Cv8lJdCeskzXu6gzlqa4XAGD9L3ZojrT5a+DtJAdvGc8RFfh+Ac
         Pm6g==
X-Forwarded-Encrypted: i=1; AJvYcCUZgQbApGDUuOLt2/dgKnqkWmnKY+ga0k5SPXkfuovPcUI90nryC1XzFla9zuZTWwX0Jl+E6a46Vl0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/znNhaaIOdM1fSv056Cvcgj6Ajt+uiaja0pbUtNvu2vjDRlV4
	oOITXbIeTsnXctmnVJsvUebAYScH3eK22WYcUQJt81i8HnT687U4yXHp8w0t4lSYZQ==
X-Gm-Gg: ASbGncvhrsA7wndApfmWZn3yW3/NuOTEfY6iwuj3f56sAYozynXyWRMmrxJGUosywbE
	cztnTU0mFhc0/EtSD2pe8qZi4yITP1k4uX9bcpAZuLWBU1aKYJ72R943AI4lD6Es83nsOaAnURN
	HJqkLVdoOsgOW5YVz9pkHzjGM6z286/f29m1WsD/DP3p1MzFEhzmhyKfjC6tb94voH9EQYuevv+
	0UXKBei2PDkpt+2i3lYrNNZSeovuE52pcufR/q9aIUqYoH4IePUCfcgvctRrXs1mHyP5qy6kxsR
	yEVaHvV3rXKBYNrjwVKWg9MXVmgwQWVdlvZ4cW1h4Kh4V67Xf87aZI1QViaRQiZkak/mx3saC11
	rcmxWG59EHQ6tQSWk/lIzxeHdhaPHz+jSPANxFqm8frBxDv+aC8Xq61N2eLfmV4lsKA+8MLQUb2
	B0hKcJxIGo/XtbRNBU28T5J/pzavnvdZlfx6sLhXaeqya4tM/o7HtV2N1SHNs7PsRfIvhk+deor
	1U=
X-Google-Smtp-Source: AGHT+IH2yxkX4mRm4l9/NRj8vbP1PKjBQ6+BFYJe4rrLlWYvWbDFlJAh827w6jaOUgf/88yFyTK8hQ==
X-Received: by 2002:a05:6000:22c7:b0:42b:55a1:214f with SMTP id ffacd0b85a97d-42cc1cedae7mr11593459f8f.21.1763986706138;
        Mon, 24 Nov 2025 04:18:26 -0800 (PST)
Message-ID: <bbcaf4f2-c52e-4b3e-ab6a-ca5020a8b786@suse.com>
Date: Mon, 24 Nov 2025 13:18:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
To: Juergen Gross <jgross@suse.com>
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
In-Reply-To: <bf7e1a66-1696-477a-bdef-79b08df0b57c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.11.2025 12:27, Juergen Gross wrote:
> On 24.11.25 12:15, Jan Beulich wrote:
>> On 24.11.2025 12:05, Jürgen Groß wrote:
>>> On 24.11.25 11:41, Jan Beulich wrote:
>>>> On 21.11.2025 14:23, Juergen Gross wrote:
>>>>> --- a/Config.mk
>>>>> +++ b/Config.mk
>>>>> @@ -159,6 +159,19 @@ define move-if-changed
>>>>>    	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
>>>>>    endef
>>>>>    
>>>>> +PATH_FILES := Paths
>>>>> +INC_FILES = $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
>>>>> +
>>>>> +include $(INC_FILES)
>>>>> +
>>>>> +BUILD_MAKE_VARS = $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))
>>>>
>>>> Feels like my prior comments weren't really addressed. I continue to think that
>>>> none of the above is part of what the subject says.
>>>
>>> I really don't understand your concern here.
>>>
>>> For replacing the @markers@ make needs to know what should be replaced.
>>> So it needs to scan the files containing the markers and gather them.
>>> This is what is done above.
>>>
>>> In the final macro below the replacements are done then. How would you
>>> handle that?
>>
>> By passing (another) argument to the macro, for example. As indicated
>> earlier, different sub-trees may have different places where these
>> definitions live, and they would want to be able to pass that in
>> (ideally without needing to put this in a common part of the tree).
> 
> I don't get what you want to pass in additionally.
> 
> I've already changed the macro and the Makefiles to be able to add another
> marker file to the PATH_FILES variable. What else do you need?

Well, that's simply an odd way of passing a parameter. Plus, the extra file
won't affect INC_FILES, or more precisely its use in the include directive
in patch 1: At least aiui, $(INC_FILES) is expanded at the point when the
directive is processed. Hence why you need to open-code another include
there.

Jan

> See patch 4 in tools/Rules.mk adding the additional reference to
> Tools-paths.mk by doing:
> 
> PATH_FILES += Tools-paths.mk
> 
> 
> Juergen


