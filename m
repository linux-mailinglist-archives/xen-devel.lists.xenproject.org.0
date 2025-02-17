Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E83EA37C37
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 08:30:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889730.1298777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjvaO-0005lO-Jd; Mon, 17 Feb 2025 07:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889730.1298777; Mon, 17 Feb 2025 07:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjvaO-0005jp-GI; Mon, 17 Feb 2025 07:30:36 +0000
Received: by outflank-mailman (input) for mailman id 889730;
 Mon, 17 Feb 2025 07:30:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tjvaN-0005jj-BH
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 07:30:35 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12e858bc-ed01-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 08:30:34 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5deb956aa5eso5719709a12.2
 for <xen-devel@lists.xenproject.org>; Sun, 16 Feb 2025 23:30:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb86c9320csm322926266b.55.2025.02.16.23.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2025 23:30:32 -0800 (PST)
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
X-Inumbo-ID: 12e858bc-ed01-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739777433; x=1740382233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1dB6GYxS2tKjf9rcRkoOWyUEXTyn6febSZyf6qkZAK8=;
        b=Mtw/LYy6Oy8aHB5zfHaDyojkxMMBSLlc91otFVInRnZMQdpqfzffBKZEpUTd48wqCX
         dpuUEDewAkvLhhhEr2AXQy4u/vp+wVSkMRanI1nDA1LT3Jfc3ERGlNOdbGolQqEL0xQp
         EiPANTEQRLzu19wty8xTu0yR3UyKLGtvkKCloEM8Qop5aV73ZIsiSq/ndE1fJUAiVpyE
         OrFjgSYQWaC7fcJ6qyw66j79+q6fqvlQlueRGQVW5sLorlEjzi+/gEXEv7AhjuUFp2o4
         3hzMVA5Q9pxMEgT/i6DHmPwzCkfv9UgVBzinXyiIZpvwqKM6dgb8vUh3sSnxuECsoF4g
         s/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739777433; x=1740382233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dB6GYxS2tKjf9rcRkoOWyUEXTyn6febSZyf6qkZAK8=;
        b=Z/yg4Wj307dUwsygx3U+zg5+vQLt6K+ZwamCdbXzGa7SZKDN3QzZvqBnTERDZGpYmb
         gRb7MOUS8DjEyHs/bbuXsCD0PifdFzsw1WU5rxu6WWFQujxww/eXo0fNbXnrZOuNjX09
         9ydEg+z7PbhhFIgCjpU0ZJLS+mg3UY1mmjEzHi6jjCK432h5XHCkyQix1GxwEnOgLI2C
         lHDBi8kiQI+wvu3vRRmMoeZH+ZN3opARxLqiEo0c5UfMeX23Keyvy9v9YSrlVqSIy9Hs
         f4PPdikDhRypRYLLXhxPmWb7GazmsNYIpiHO0HkojYbEw75qULPV5aei1YoAyTml01A+
         zDwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ0ZijuubFfEnmuJmt/Cf4itNP0/Mo42DD86V0HqtN23He5sCkcJ7YlS86wqdapQgx1qaRe0vlTeE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5BPktHZBbyMXFjLGuSVCuCcKpmBidJ98pAurXUEC6vpz15W/z
	6gZtUNSWZgwMUP1mQ7PP++ogfZICPu79p80PcFGtA1XBXs+Qi+9lg44rApUK7g==
X-Gm-Gg: ASbGncvVXs5Pgzd5sbQEonCgyYycvPQNtnMp8CptN5eRNYws3DrcyZ0qItx7C25MPFA
	lKltzMu2srmUn1UT8C7VjczlAtfszp/lSjLw7cYBhOd3yHfWTP0k+pv/9IUrwpSWVLARN5PijcR
	6UhhsUcntecxRq/dYrIZRA3EIxxvmiwuYrEnlKRWlI42q6fz+T3P1X5w3jkjqlLkaBGHbN2vHaj
	EzJtTe5xHeRiFWx9BrRNc1MrMYr8o13lzyswRp5ZS3YUZPLh8P/kAaS6y/ns14B7MfQBeUsKAQ5
	wacmnCjLalKLRsR+cajtoldGL7lMoTDOXm+Ujrp/7FrVBl5CDrmtN/6uSQNEZhxytVxDeo2rTFk
	P
X-Google-Smtp-Source: AGHT+IEfq0+0kv3U5mi+6ik+Eymqac7vPPrz7xvExPotzRGboOjXpIK15fmewsAHbHo3BdB58T39YA==
X-Received: by 2002:a05:6402:5186:b0:5de:dfde:c8b1 with SMTP id 4fb4d7f45d1cf-5e036003fecmr22928496a12.4.1739777433246;
        Sun, 16 Feb 2025 23:30:33 -0800 (PST)
Message-ID: <a8df35bd-cd87-4dd7-9841-a0a7469524ed@suse.com>
Date: Mon, 17 Feb 2025 08:30:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/watchdog: Identify which domain watchdog fired
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250213164618.38167-1-andrew.cooper3@citrix.com>
 <7f105533-f80c-41f3-bf3b-8cf8dabdf02c@suse.com>
 <3e4f1f62-137a-48c9-a402-cb6017ed440d@citrix.com>
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
In-Reply-To: <3e4f1f62-137a-48c9-a402-cb6017ed440d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.02.2025 16:09, Andrew Cooper wrote:
> On 13/02/2025 5:00 pm, Jan Beulich wrote:
>> On 13.02.2025 17:46, Andrew Cooper wrote:
>>> @@ -1593,7 +1598,17 @@ void watchdog_domain_init(struct domain *d)
>>>      d->watchdog_inuse_map = 0;
>>>  
>>>      for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
>>> -        init_timer(&d->watchdog_timer[i], domain_watchdog_timeout, d, 0);
>>> +    {
>>> +        void *data = d;
>>> +
>>> +        BUILD_BUG_ON(NR_DOMAIN_WATCHDOG_TIMERS >= PAGE_SIZE);
>>> +
>>> +        /*
>>> +         * For the timer callback parameter, encode the watchdog id in
>>> +         * the low bits of the domain pointer.
>>> +         */
>>> +        init_timer(&d->watchdog_timer[i], domain_watchdog_timeout, data + i, 0);
>>> +    }
>> This way we'll be promising to ourselves that we're never going to alter
>> the allocation mechanism of struct domain instances, always requiring
>> them to have at least page alignment. If someone wanted to change that,
>> they'll have a hard time spotting the logic here. Sadly I have no good
>> suggestion towards improving the situation.
> 
> I wasn't terribly happy either, but something has occurred to me.
> 
> For both struct domain and vcpu, we could have an __aligned(PAGE_SIZE)
> attribute.  It's accurate and unlikely to change (and helps x86 code
> generation at least).
> 
> Then, we can use:
> 
>     BUILD_BUG_ON((NR_DOMAIN_WATCHDOG_TIMERS > alignof(d));
> 
> which should trigger cleanly if the precondition is violated.

Hmm, yes, why not. That would establish the missing link.

> For watchdog specifically, we only actually need uint16_t alignment to
> be safe, and there's no way that's going to break in practice.

Right.

Jan

