Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28A38129D6
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 08:58:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654308.1021081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDgbV-0003c4-8O; Thu, 14 Dec 2023 07:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654308.1021081; Thu, 14 Dec 2023 07:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDgbV-0003ZN-5B; Thu, 14 Dec 2023 07:57:57 +0000
Received: by outflank-mailman (input) for mailman id 654308;
 Thu, 14 Dec 2023 07:57:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDgbT-0003Yy-Pl
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 07:57:55 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c384115-9a56-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 08:57:53 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50d176eb382so8334355e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 23:57:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ul5-20020a170907ca8500b00a1fa7e39957sm5302163ejc.136.2023.12.13.23.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 23:57:52 -0800 (PST)
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
X-Inumbo-ID: 7c384115-9a56-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702540673; x=1703145473; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5qwfQ1fYnd2+9zNdiB4JsEFPiMnM3Cpj43jXBGS7xTg=;
        b=bVDXKUPM1XNoyJHeS2uOWMoWySsQ9cpA3FSWKrxsPXkZ069EaCd3G5+9C3Ti79ouAg
         Pp2Pyoad+DSH/aIXo+ESnWDb8Q2zUG4cEYKWCcCFKW0aDyvsLoUHfeV07jkqkWTO6h4U
         Mact5a39NBANj0gJNq5qUYpcsUsDjtKPIFf/nu0+lFZOAMabGBm0UdHGhoe7/glnXWe5
         uv6uJKJ/8VnceFKf4aUljzrSS4ckTd8+VBZpWtQsJxJSwqqrt9M6wr2KoKOZEqKuE3qL
         5IUThO44aPLmdVG9pThT6qp3chTNZobjyd/BQD2R/9ufY2pYFw8L75IRD1C62HBPDlex
         66tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702540673; x=1703145473;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5qwfQ1fYnd2+9zNdiB4JsEFPiMnM3Cpj43jXBGS7xTg=;
        b=Wgsb0E4D/8Mq8SGcfKd6pqA+HeGnZqh58uP0VGG8s9hfWgcD8YErhJ9UDixKRkUoX+
         +3zY9r0BABaJ7BIfsh89CRVrZ5DtDe9fQ8NJ1dxuEVfK9lGu0Q6Sc+yyRFBiVAW4ApZi
         EKjY3uf8tq1I5PuuzKfFqmBOQNCyCB3IDJ4mglWRlHUGNcn8kCBKChCtL13fjnUtZdub
         JFB/3uiCb7OZd6snjwFDkM1QQWVpa5ukDz9atBaQ9EAGUa7FWcl22lKLeSIcqn+2lDPz
         IP305XFvlIAhQUdS8rdrOXG9ayNTIZNIxOaUn3f46YgwcEIcUUq3KPd+yAU6ScWWWxQ7
         i0bg==
X-Gm-Message-State: AOJu0YzEyfGzmplfWcoTvKvA6z9aFRZBn8MEvaVdlWVj8J5mkITVIQVa
	bkP3QSg0YCm3C7+gy2cqbO9K
X-Google-Smtp-Source: AGHT+IFrGFdO5vu4jx7cIPrbOFGu87mJSTJTV6uPVFwo/L3U3R+KigYXKgc28u41mwKP50Bq5wtpUA==
X-Received: by 2002:ac2:4141:0:b0:50e:1514:e56 with SMTP id c1-20020ac24141000000b0050e15140e56mr573142lfi.79.1702540673278;
        Wed, 13 Dec 2023 23:57:53 -0800 (PST)
Message-ID: <21dae6f8-6f79-4952-94e0-1b7c13c7c1a6@suse.com>
Date: Thu, 14 Dec 2023 08:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/7] x86/mm: address MISRA C:2012 Rule 2.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <5913d8871ff6c4f320c521e50e550a64e58d4351.1702283415.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2312111741390.1703076@ubuntu-linux-20-04-desktop>
 <ff95c65f53ab8acfd577ec132009cd7b@bugseng.com>
 <0ad1d3f5-2a23-4ee9-a6e7-ebb824d2b7d7@suse.com>
 <8a49facc4fbf4d3fefb91b9b5bef3305@bugseng.com>
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
In-Reply-To: <8a49facc4fbf4d3fefb91b9b5bef3305@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.12.2023 15:44, Nicola Vetrini wrote:
> On 2023-12-12 10:53, Jan Beulich wrote:
>> On 12.12.2023 10:12, Nicola Vetrini wrote:
>>> On 2023-12-12 02:42, Stefano Stabellini wrote:
>>>> On Mon, 11 Dec 2023, Nicola Vetrini wrote:
>>>>> The "return 0" after the swich statement in 'xen/arch/x86/mm.c'
>>>>> is unreachable because all switch clauses end with returns.
>>>>> However, some of them can be substituted with "break"s to allow
>>>>> the "return 0" outside the switch to be reachable.
>>>>>
>>>>> No functional changes.
>>>>
>>>> This is correct but makes the code inconsistent. I would either 
>>>> remove
>>>> the return 0; at the end of arch_memory_op, or do the following:
>>>>
>>>> - initialize rc to 0 at the beginning: int rc = 0;
>>>> - all switch clauses break instead of return;
>>>> - at the end: return rc;
>>>
>>> Given the feedback on the Arm side, the first solution is likely to be
>>> preferred.
>>
>> I wouldn't mind either option, with
>> - the former ensured to be okay with all compiler versions we (still)
>>   support,
> 
> I tested a stripped-down version of the switch on godbolt.org (as far 
> back as gcc-4.8.5) and it doesn't complain. It should be tested on a 
> real Xen build, though.

I didn't fear any issue when going back to just 4.8. Quoting ./README:

      - For x86:
        - GCC 4.1.2_20070115 or later

>> - the latter having the initialize rc to 0 part dropped; imo it's 
>> better
>>   if every case block makes sure to set the intended value explicitly.
> 
> This is a lot of churn, I'd rather avoid it.

Rant (sorry): There's already excessive churn for entirely benign issues
that Misra claims need adjusting.

Jan

