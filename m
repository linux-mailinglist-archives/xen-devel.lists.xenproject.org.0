Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 165B7C64060
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 13:24:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163655.1490743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyHV-00028q-EE; Mon, 17 Nov 2025 12:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163655.1490743; Mon, 17 Nov 2025 12:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyHV-00026J-Be; Mon, 17 Nov 2025 12:24:29 +0000
Received: by outflank-mailman (input) for mailman id 1163655;
 Mon, 17 Nov 2025 12:24:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vKyHU-00026D-Ew
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 12:24:28 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bd49fe1-c3b0-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 13:24:27 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-640c6577120so7247443a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 04:24:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3d839esm9882450a12.8.2025.11.17.04.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 04:24:25 -0800 (PST)
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
X-Inumbo-ID: 5bd49fe1-c3b0-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763382266; x=1763987066; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jlpKt/C4yNPfozY6tNjls1g1YxVyS6BZDULTzNUprhk=;
        b=Zwg+eCWEbtkFJutgG0To/wDfb4tgmlH5FwJtWhWVRh4D2o3TqmEvxKjPXjSYs4muKX
         +8YQowxDN6MV9TEzjxQyDFRW23UN3lsinWjOkdRAzaq+8bdhQcEtuXHvnq8CAZBJf7Ki
         h/4Ez3GabOqXc7J9fHaj2vHZ3QszspP6ftT6EdRCipKvWnaNmBdM1wlpsNu7mp6EBBkX
         irfUzLBmp79qI+xYYH9jJQ1VAZDYeDd3hlaqehDMudWU/vtW7gyNMRzHu1wx02NlhaVf
         XwRLqO4ftk2Cr/LGB1q1xNLSLoOJoVlS9pl+eab5FC73cJOAIXgy44UoSSPPnRE04NRq
         wSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763382266; x=1763987066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlpKt/C4yNPfozY6tNjls1g1YxVyS6BZDULTzNUprhk=;
        b=SIgfkGUPVaaBlyOFu3J/vNnj1S9rGohfrRzoNJkRTZ12dUcTOkZrk6IOnbB9ku4tnf
         /OGCpY3Xv441GLfngHXrBRe1qaKhHZGXUAGn9hto1RY6w389vFXklEWNPrXSxYUgKIT/
         K+T0KonSzjlIBUAq3R9iq1MWtpie+N+oYdEhk9dAYQs5ZEZmyPDuDKS6lBR62gP/7Wvt
         XBofc6eLBGAEs7pqLivxHBl7GfSiKWQeA/YuKeOm4IJxPHt/dzBnpIuuMU1YXX9SbN/R
         fLi/bBYL9OwByiBQp4N7WCyhP0HPqkdSTGyDooESasdSoL0P61MkSM6z0zlG4ew1WStl
         Gcxw==
X-Forwarded-Encrypted: i=1; AJvYcCXpAqq2Tlm9rZ5hQU1iwuCX1EeALvmVd6v4D318oSr9CBC7hPIW9zimj9YZnC00r1dWC4XVe5eDK2o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCFT+0RT3G0a2iwVV8uRD0/6w/12J9gsKGYswY7Q2ufojP4xKG
	ZsgCI5cFn9981sqHDgMYiYFMX3I+/Jt4KQVrxbHwPmjc+dTlxxpBh2GRm0omlLKzu96W1INv7BY
	ZTOE=
X-Gm-Gg: ASbGnctGDEV3sVlz924jeD5MUgeZHkrpcbrVKOqDBcRnh/RoMeCz2AQM2pFAbEQCttJ
	r8mL155VOwC0xSlD59RmS2sYHE+O8mfnDM8l0W3/XrStplpGXTZXef1uAMSp6QqggnjCfWK6vM3
	glqese9WUJGXkEPtQL5TCg6fAabcUWsPs55slOoRomPRxN9irnbZXlP2p3XwqPhcjDJvB+6fSXY
	54naWwwdWX6lPHxiEvhBi9YKOtZt92SBnPCchumbSsOhSYey9Io+I2Q6RXjZyE6oMZdYAWBoZx8
	G5Wvcg5IJtew+scQfbKxlBVqJqPIZ4aDeQrY+inhuFO7XM3mJSIhF5A8siwmr7gpIpzQfVtW2Cs
	zKAQTZpcQ09a/Nrx7r8bdPCnKEOKAUAuWqunNflwVG4wZu7iEvE1dAHYbFfckd6nbXTga24OkJe
	GFgw3M230uTg2f7BfaXyyddZ7tpqNj2mUn8qELNJ1dh111JRl95iHgUtXXURD6k+Q/
X-Google-Smtp-Source: AGHT+IFQYms9f8/Uw3McJcfQoPfjIt5vspFPNHLehTpPDagg5GNzj8pv4VNCwW3y4304AUjeYZmRoQ==
X-Received: by 2002:a05:6402:34c5:b0:643:130c:eb6 with SMTP id 4fb4d7f45d1cf-64350e89f2emr12691973a12.22.1763382266494;
        Mon, 17 Nov 2025 04:24:26 -0800 (PST)
Message-ID: <113c9cc1-5e39-4a54-88de-dd2b70b90a49@suse.com>
Date: Mon, 17 Nov 2025 13:24:25 +0100
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
In-Reply-To: <cc90d18b-f88e-49d9-a55f-b7035ce43167@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.11.2025 13:54, Jürgen Groß wrote:
> On 14.11.25 12:42, Andrew Cooper wrote:
>> On 14/11/2025 11:32 am, Juergen Gross wrote:
>>> diff --git a/Config.mk b/Config.mk
>>> index e1556dfbfa..d21d67945a 100644
>>> --- a/Config.mk
>>> +++ b/Config.mk
>>> @@ -159,6 +159,19 @@ define move-if-changed
>>>   	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
>>>   endef
>>>   
>>> +PATH_FILES := Paths
>>> +INC_FILES := $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
>>> +
>>> +include $(INC_FILES)
>>> +
>>> +BUILD_MAKE_VARS := $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))
>>> +
>>> +# Replace @xxx@ markers in $(1).in with $(xxx) variable contents, write to $(1)
>>> +define apply-build-vars
>>> + $(1): $(1).in
>>> +	sed $$(foreach v, $$(BUILD_MAKE_VARS), -e 's#@$$(v)@#$$($$(v))#g') <$$< >$$@
>>> +endef
>>
>> Shouldn't this write to a tmp file, and use move-if-changed?  Most of
>> the time the markers won't have changed, and we'll want to short circuit
>> dependent rules.
> 
> I can see this being an advantage when e.g. generating header files, as
> those being generated again would potentially cause lots of rebuilds.
> 
> In this case I can hardly see any case where make wouldn't do the right
> thing already. Either the *.in file is newer than the generated file due
> to a git update or a manual edit, so make will regenerate the target (and
> this is what we want), or the *.in file hasn't changed, so make won't
> regenerate the file as it is newer than the *.in file already.
> 
> Or did I miss some aspect?

Aren't some of the generated files Makefile fragments? Them being re-generated
means make re-invoking itself, which could be avoided if the contents don't
really change. (This isn't just a performance concern; this re-invocation has
been the source of, well, surprising behavior in certain cases.)

Jan

