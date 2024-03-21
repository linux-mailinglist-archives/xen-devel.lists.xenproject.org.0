Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C3F885CA5
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 16:53:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696461.1087423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnKjE-0005pW-14; Thu, 21 Mar 2024 15:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696461.1087423; Thu, 21 Mar 2024 15:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnKjD-0005nN-UX; Thu, 21 Mar 2024 15:53:15 +0000
Received: by outflank-mailman (input) for mailman id 696461;
 Thu, 21 Mar 2024 15:53:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnKjC-0005nB-NB
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 15:53:14 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f26a6d9-e79b-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 16:53:12 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56b0af675deso1359530a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 08:53:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x3-20020a05640226c300b0056851310a04sm19751edd.16.2024.03.21.08.53.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 08:53:11 -0700 (PDT)
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
X-Inumbo-ID: 1f26a6d9-e79b-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711036392; x=1711641192; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qgj0ZJ8KZAy92Cb/7XwYPJOE6A/pJwKYnrMYa63ERBA=;
        b=dYh0vg/QyYeGlELY/bL9S5NS2akOdGs4IA7mJ884m1v1oV6Y/cBg9qc4297wR2mjXE
         jA7lzrRW7QiGDAkrj8iBxlxiR7i2jUd/qAJZAa9ZIugfAS9Fwlgd23BuUkpRn6qVDBHJ
         BBBvEb2CcRh70Ali9gdTkGR6GyIuV2qSxTdTv9Ty0NB6b/bclqk1QEGM0/wN7MzEg25h
         RudkHfAE4zPxpJ3vhm5t51Rz2BCRN/5Y6s83wcdbFkMPF7ZLtTCQdKjQBpHdQF+tTVFF
         P6tiWb+28KxYCYTYcEV62CVHtlrcfGaRaenrmD7J091jogH4aGTgx5j1B7z4Dp9+tfjr
         jk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711036392; x=1711641192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qgj0ZJ8KZAy92Cb/7XwYPJOE6A/pJwKYnrMYa63ERBA=;
        b=SYf6FeP7cEndRkpuWQvuXSuh1meZ82iheu9UetCPj6HijugOQBSBCywXK7w8W8RXM6
         Y/2knfYHpmsW+i8aQdTs1sfyTtSzjDAT9rLR6dKQ4eZOpEgWpEXwjrU/azuO9e8gmi6u
         Fuy3OmgntRaCEoPxaKb9RlS39BKa/3Q8AKWF9+CSM0FbODMfR1exIuFH2eF0/es6kdhC
         ICYvD8Sz1PWL2DbyN4vcOJJjxnqFDRZLf8eY0RZIs1rshx4UDNhxm080fAYzc9yKnkSh
         kwA7CdPvsssKaWC6RDMUmgxfUMBRIu+yMQbHf+Qpg/LNil9rmNtYfkVPlhrRAj0KNsAi
         v/Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWG7c3t3peCoD4gwXiZL7EgXgKDK8Hwwc0F0fpBaD7bTpOMQV25jGQq6jYTwRsddt0xIH1vQBUgrDFnvewXbvjtLzTx0hrELnZ6Hch9X04=
X-Gm-Message-State: AOJu0YzWeIKQHWBzO89qO98/EqCLHfv06AABN7kb4wYH57j0eo/7gp/+
	rfRazX4u7k8UbM/I7QwsZijyU/iTEFHJcDlpPSvxeziEKfZtu9atJ5f6Y9DRIg==
X-Google-Smtp-Source: AGHT+IEjyM7NWddGREwNi/evqBT8p1DomaLXw2yD4K6TA2EolVhHqm8bok99odJjK6b/gLUFYIGX8A==
X-Received: by 2002:a05:6402:3789:b0:568:bda1:9640 with SMTP id et9-20020a056402378900b00568bda19640mr3733364edb.13.1711036392000;
        Thu, 21 Mar 2024 08:53:12 -0700 (PDT)
Message-ID: <2b4d6e96-0f04-4327-9875-cd0587931621@suse.com>
Date: Thu, 21 Mar 2024 16:53:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/14] xen/common: add cache coloring common code
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-2-carlo.nonato@minervasys.tech>
 <05e4d3da-4130-4c57-9855-43b685ce5005@suse.com>
 <CAG+AhRU4W+umVhOHn0ZnHvex-rmEn4+T_mKVczYG4o52EV+YtA@mail.gmail.com>
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
In-Reply-To: <CAG+AhRU4W+umVhOHn0ZnHvex-rmEn4+T_mKVczYG4o52EV+YtA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.03.2024 16:03, Carlo Nonato wrote:
> On Tue, Mar 19, 2024 at 3:58 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 15.03.2024 11:58, Carlo Nonato wrote:
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -1706,6 +1706,43 @@ This option is intended for debugging purposes only.  Enable MSR_DEBUGCTL.LBR
>>>  in hypervisor context to be able to dump the Last Interrupt/Exception To/From
>>>  record with other registers.
>>>
>>> +### llc-coloring
>>> +> `= <boolean>`
>>> +
>>> +> Default: `false`
>>> +
>>> +Flag to enable or disable LLC coloring support at runtime. This option is
>>> +available only when `CONFIG_LLC_COLORING` is enabled. See the general
>>> +cache coloring documentation for more info.
>>> +
>>> +### llc-nr-ways
>>> +> `= <integer>`
>>> +
>>> +> Default: `Obtained from hardware`
>>> +
>>> +Specify the number of ways of the Last Level Cache. This option is available
>>> +only when `CONFIG_LLC_COLORING` is enabled. LLC size and number of ways are used
>>> +to find the number of supported cache colors. By default the value is
>>> +automatically computed by probing the hardware, but in case of specific needs,
>>> +it can be manually set. Those include failing probing and debugging/testing
>>> +purposes so that it's possibile to emulate platforms with different number of
>>> +supported colors. If set, also "llc-size" must be set, otherwise the default
>>> +will be used.
>>> +
>>> +### llc-size
>>> +> `= <size>`
>>> +
>>> +> Default: `Obtained from hardware`
>>> +
>>> +Specify the size of the Last Level Cache. This option is available only when
>>> +`CONFIG_LLC_COLORING` is enabled. LLC size and number of ways are used to find
>>> +the number of supported cache colors. By default the value is automatically
>>> +computed by probing the hardware, but in case of specific needs, it can be
>>> +manually set. Those include failing probing and debugging/testing purposes so
>>> +that it's possibile to emulate platforms with different number of supported
>>> +colors. If set, also "llc-nr-ways" must be set, otherwise the default will be
>>> +used.
>>
>> Wouldn't it make sense to infer "llc-coloring" when both of the latter options
>> were supplied?
> 
> To me it looks a bit strange that specifying some attributes of the cache
> automatically enables cache coloring. Also it would require some changes in
> how to express the auto-probing for such attributes.

Whereas to me it looks strange that, when having llc-size and llc-nr-ways
provided, I'd need to add a 3rd option. What purpose other than enabling
coloring could there be when specifying those parameters?

Jan

