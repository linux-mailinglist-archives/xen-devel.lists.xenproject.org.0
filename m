Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA9999C1DE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 09:47:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818481.1231796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Fmr-0005Rc-Ek; Mon, 14 Oct 2024 07:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818481.1231796; Mon, 14 Oct 2024 07:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Fmr-0005Pd-C9; Mon, 14 Oct 2024 07:46:41 +0000
Received: by outflank-mailman (input) for mailman id 818481;
 Mon, 14 Oct 2024 07:46:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kmr=RK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t0Fmp-0005PX-Om
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 07:46:39 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 713cb021-8a00-11ef-99a2-01e77a169b0f;
 Mon, 14 Oct 2024 09:46:37 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-37d49ffaba6so2501170f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 00:46:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-430ccf51834sm145102565e9.26.2024.10.14.00.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 00:46:36 -0700 (PDT)
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
X-Inumbo-ID: 713cb021-8a00-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728891997; x=1729496797; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2p/WnuPzRNfiYorQAZQmqnQygwNRVAJRi3a2J69I89U=;
        b=Kh8b90dYhjGY4Cv7WC2rSR0CAzxvOEbc30MdF6pvw8GeIabn8FbEJeceJcMUS895vY
         jq2kdiJgZo9QrScfWkbWaCCINenwHyuCzn/cKPH87BSkbwLqbCLQBADieeNfqI4U9zn8
         P9pkTtJFtoH6FY5qKGkNrgpBEgrF8VdvfvWljdHEC48Kgccrt8erhcBJRZM7gjQk62Wg
         yxq96tkbUWmquL0oES22Ts2vspK+6ajkN4Sh7d3EOa8FelDbHICaz8dTrZXl43BRK2Ve
         0RImFKMgqVkRwjepQd1bu9Puw+dfr5C9moN+fD353gWqZpGfe959j1eT1+OCt3nWoRb0
         Y66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728891997; x=1729496797;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2p/WnuPzRNfiYorQAZQmqnQygwNRVAJRi3a2J69I89U=;
        b=JXM8HXX9YH/uWyeFmXn5XMDFEhUtKvzyz/pYj4p7bGGLcvVapZJrc1o3sVOES+nbHb
         zucvbU41r/YtuAZThsXqBEgu/QFvE6wWkgrfDQD9iZi9yYpVJCDb4xWaOQlAoBpVItCT
         ecA676fhQV1bRZSwOL3fZafq7ysgUl7pwTJA7nqjK+wvWewfuuOw5PPbHwHhYX5/rQ4q
         dNZbQwb7AJ4WcfysF0+D/1NWkb4/93B3ptfn2bjO84Gyu1AfxRbL39uTglBhJVa62cV2
         Bb/JPG6iyAkcge+aD5Yf+MDaqvlcFi/xvMrQd7QuDc7Kqup1I6mVogviMl68ISTZuGhA
         ENLw==
X-Forwarded-Encrypted: i=1; AJvYcCWBtgIok76Fh9iqVknJRSr0szG0BAbAb4nt/bcuL91RcASb+RRk5R8u7f5f8C41VX6yT9b5DkEaxYU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3dMtep9t6i5qfBfrpUlAe8TxSk2RyfzdIdY8cNlIaSzvSuxvF
	BZqyDqmpa386Ok+afchzwtBkz6e+ITSH1/GbsUlpQUR5oLPSmChfG7a0K9Hfqw==
X-Google-Smtp-Source: AGHT+IFmpQey6nP2muLK+fV6qhTvo+sPNt8yeNDzRXsYuUhoEPCMu4dPwxkFOh3kNr5v/PBUAlBwVQ==
X-Received: by 2002:a5d:63d1:0:b0:37d:45ab:422b with SMTP id ffacd0b85a97d-37d551dce47mr7696062f8f.31.1728891997176;
        Mon, 14 Oct 2024 00:46:37 -0700 (PDT)
Message-ID: <2082c6ea-c778-444f-ad5f-15f25b87ba10@suse.com>
Date: Mon, 14 Oct 2024 09:46:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: increment domctl interface version
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241014070650.14296-1-jgross@suse.com>
 <c7ea754e-e250-4431-b698-a10c2299ce75@suse.com>
 <79dca12b-6f16-4008-99cd-d0c3c1e7509c@suse.com>
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
In-Reply-To: <79dca12b-6f16-4008-99cd-d0c3c1e7509c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.10.2024 09:36, Jürgen Groß wrote:
> On 14.10.24 09:14, Jan Beulich wrote:
>> On 14.10.2024 09:06, Juergen Gross wrote:
>>> The recent addition of the XEN_DOMCTL_dt_overlay function was missing
>>> the related update of XEN_DOMCTL_INTERFACE_VERSION, as it has been the
>>> first interface change of the 4.20 release cycle.
>>>
>>> Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains")
>>
>> I'm confused: That change (a) pre-dates the branching of 4.20 and (b)
>> bumped the version ...
>>
>>> --- a/xen/include/public/domctl.h
>>> +++ b/xen/include/public/domctl.h
>>> @@ -21,7 +21,7 @@
>>>   #include "hvm/save.h"
>>>   #include "memory.h"
>>>   
>>> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
>>> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000018
>>
>> ... from 0x16 to 0x17. And for no apparent reason, as plain additions don't
>> require a bump. Did you maybe mean to reference a different commit?
> 
> Oh, indeed. I wanted to reference d6e9a2aab39e.
> 
> And regarding to "plain additions don't require a bump": 4c733873b5c2 did
> a plain addition and bumped the version.

Right, hence why I said "for no apparent reason".

Jan

