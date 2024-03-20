Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F105F880E1E
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 09:59:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695813.1085952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrnK-0006C3-Se; Wed, 20 Mar 2024 08:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695813.1085952; Wed, 20 Mar 2024 08:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrnK-0006Ak-PM; Wed, 20 Mar 2024 08:59:34 +0000
Received: by outflank-mailman (input) for mailman id 695813;
 Wed, 20 Mar 2024 08:59:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmrnJ-00069K-IL
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 08:59:33 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29fad84f-e698-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 09:59:31 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-568a53d2ce0so7908345a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 01:59:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g17-20020a170906199100b00a46a49d661fsm4914494ejd.210.2024.03.20.01.59.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 01:59:30 -0700 (PDT)
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
X-Inumbo-ID: 29fad84f-e698-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710925170; x=1711529970; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NuW4BV4feiLlFcgba4D4nWoYUPZxvV4iNQtI5hWg7Dc=;
        b=ZVVPJ7GG+61xgc4TVIBqlY2zPkHb3maiUlTtDPzKxLf7Z3WFLOShKcYMxmuKgZpZgC
         qqaq5DtxAj4iBCuaTKBNE95foLr0NpVldqUyx58f4e85U1/MrmmHQqy/C7BzctO85w6r
         DdAN8IPBZ9aJDn/RAeoTzwOHOU7R9AA3nt+Cc8lMf7QVJfZ+gzJvYcAYs5P+mAnfMWLW
         f6nCcPGtCvOm7Kc40DkQMnzdk6gm0BuXLB/2OO/BaYmsvdXr5Hv9ey/INejmdLL11e2g
         lpn2DjdmfJBy/f0hcFP9lpz9HnNd5GnhEykOZygKNKwxjJHkACZCfHBzsnju1vnH7/B2
         qavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710925170; x=1711529970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NuW4BV4feiLlFcgba4D4nWoYUPZxvV4iNQtI5hWg7Dc=;
        b=e7dBvx/8tLmh8frim3zgpqKLCoRiL/qahz8nWx+62hxlZLmpX2A9/KIjU00ALHywr6
         1ptY9VSaI4ixWkbT+AM4Uz7Da0oHqNhtH/kCErP1Bx+EYjgulZZY+2s85tWC0l70Tk2x
         K+wRwgEvg/12adVhvCum+SfCaVlEhaxPz3Tw3zX6ZsEGANyWsu1abATHORYLp+H+Nal/
         xqZNtjg82Wo27/SWGMcqtKg+NeSeGp0/y042S5vQRpN51/4S9EASqg1DBglXpABLrK7o
         xGUfanYZUtKctAxrIQzEzV754GxrAMyCvOcMoS/oCEc4kkQVPZ3IsuFe78YZC/Pv1Qn+
         ogPA==
X-Forwarded-Encrypted: i=1; AJvYcCUaQzbRifuVi6YZZxsKRJaVEtz5jwp/KVqkaRPf/0hxf10APJbgvOZuWoB/fZrRqP68SyuicCIfBNopzDRGCpl8prMDCYRv8GKjcrXXaMA=
X-Gm-Message-State: AOJu0Yx9Ez1/sikOtfBxbXW+VBAzEjCVb+3an2GzMlVagePgltxVzWRm
	FAdq0j+HNaeomGMNieiDyMKfUuT4jOoevS/NHQBhRVFRHzIQKH24Oz+GxBRawQ==
X-Google-Smtp-Source: AGHT+IEtYicCv3XcpOtVQDvzD9rkeX8Z1QWFwNGO7sAbiUYQfxmafI5LvGADPTYBNyIMlrVSNnZZJg==
X-Received: by 2002:a17:907:971c:b0:a46:9a9e:f3b0 with SMTP id jg28-20020a170907971c00b00a469a9ef3b0mr11572017ejc.67.1710925170531;
        Wed, 20 Mar 2024 01:59:30 -0700 (PDT)
Message-ID: <e3f69f47-88a8-4eb5-a019-ec4de0c9deb3@suse.com>
Date: Wed, 20 Mar 2024 09:59:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: adjust initial setting of watchdog kind
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fe289ca1-aa3a-49af-b7d7-70949237464b@suse.com>
 <1c3d790d-bdac-495a-868b-36e12d45c457@citrix.com>
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
In-Reply-To: <1c3d790d-bdac-495a-868b-36e12d45c457@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.03.2024 21:35, Andrew Cooper wrote:
> On 25/01/2024 2:12 pm, Jan Beulich wrote:
>> "watchdog_timeout=0" is documented to disable the watchdog. Make sure
>> this also is true when there's a subsequent "watchdog" command line
>> option (and no further "watchdog_timeout=" one).
> 
> We also document that latest takes precedence, at which point "watchdog"
> would re-activate.

True, so perhaps ...

>> While there also switch watchdog_setup() to returning void, bringing it
>> in line with the !CONFIG_WATCHDOG case. Further amend command line
>> documentation to also mention the implicit effect of specifying a non-
>> zero timeout.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Alternatively "watchdog" following "watchdog_timeout=0" could be taken
>> to mean to use the default timeout again.

... this alternative wants following.

> I realise that watchdog_timeout is my fault, but in fairness it was an
> early change of mine in Xen and didn't exactly get the kind of review it
> would get these days.  It also wasn't used by XenServer in the end - we
> just stayed at a default 5s.
> 
> I'm very tempted to suggest deleting watchdog_timeout, and extending
> watchdog= to have `force | <bool> | <int>s` so you could specify e.g.
> `watchdog=10s`.
> 
> The watchdog is off by default so I don't expect this will impact
> people.  It is also more convenient for the end user, and means that we
> don't have have the current split approach of two separate options
> fighting for control over each other.

While I'd be happy to fold the two options, I don't think the watchdog
being off by default is relevant here. People using just the
watchdog_timeout= option with a non-zero value will already have the
watchdog enabled. They'd need to pay attention to an eventual CHANGELOG
entry and change their command line.

Furthermore consolidating the two options isn't going to remove any
of the problems. What effect would e.g. "watchdog=off,10s" have? The
principle of "latest takes precedence" assigns clear meaning to
"watchdog=off watchdog=10s", but the above remains as ambiguous as
e.g. "watchdog=force,0s". I'd be inclined to follow those to the
letter, i.e. "watchdog=off,10s" sets the timeout to 10 but disables
the watchdog while "watchdog=force,0s" simply results in a non-
functioning watchdog (due to 0s effectively meaning 4 billion seconds
and hence for all practical purposes "never").

Jan

