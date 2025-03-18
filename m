Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9492A6784B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 16:49:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919461.1323903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuZCA-0001Rf-K1; Tue, 18 Mar 2025 15:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919461.1323903; Tue, 18 Mar 2025 15:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuZCA-0001Ob-Gm; Tue, 18 Mar 2025 15:49:34 +0000
Received: by outflank-mailman (input) for mailman id 919461;
 Tue, 18 Mar 2025 15:49:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuZC9-0001OT-SX
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 15:49:33 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95c40d8a-0410-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 16:49:32 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so19525945e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 08:49:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df320csm18319266f8f.7.2025.03.18.08.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 08:49:31 -0700 (PDT)
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
X-Inumbo-ID: 95c40d8a-0410-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742312972; x=1742917772; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8vFv0hB8RegVmIY/Y+dmetmqzUdJsxXaL+cchkdgGkk=;
        b=VuFGv28eN2fr3AN2PUGWGdHO8eXNqDUO7nAU7NC7Ldv1yJjGpisX888H6YQG66PcFy
         gHtn5xJ4o7OCydlKx2BWiKLufPvLaTRHv+rEAFei8vgeVywoI8e1ErZGqXKFH2W8tw2G
         g2jS1i/3VMeMyASlyN9gUuAV34JN3LCJ5+UAJb87t+SzeRJ66Ppw2Ej0DcfoZNINexXH
         cou0qYOtlPDQlhWoGqC4EingOHQNKdLCzmwmHmH5qmMEUMCGDGNK5CQ7z+98IyBd4wJP
         S4z5Gnc0N67d+lMA3GShXL14dVgSq4E1GSKg58m0GZiDUWBpO1suBndDOz1EPIuz5WSZ
         9h+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742312972; x=1742917772;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vFv0hB8RegVmIY/Y+dmetmqzUdJsxXaL+cchkdgGkk=;
        b=YhBUn8e74HHVPikeAjAIVrW59stQp3py11TE0wf8zflPZeqDhQFRBvyOPOMu1kWJev
         3batqtmySrAJFxm4YD8CJcaEEmE4+MEHoYq9qkv9id5vDOmFBLnSBPvUGMhN6+JxTFxi
         bd01eJ5D8TUAiyXwMFBFEG8PKlY0/tKKo6VgzooAVLbTEZZU+jNgfmwoCWHncxngMf8s
         sF+1uNL/RNWDPPA62xXT4X/giAjLG/jBStEYz9v7t3bcNV1Sm8fIv3ENcllsn13App3b
         8z/b+lJ6P7gLqPsVUXWrO91sVj1S7a/OKBaZiXwrh+VZvnjwxKOvnxYh89FNB07B9a29
         +2PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmw1yRnKqsjlyTwatO+P5Uf2Hp7skWYllxvidRWPmKWFZ15PiiMDBrrdnljawX5VorTvRTqwP8qQg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRmlmtb2nBB7IV0ltuUXqlZJLUKmLu/sFiU1TWRgivq2jLYvI0
	4+l/Ms/6cbtwsSQ/wobhM++YKrQJ72PepVGLgrNJSbgSxOXcYLKVTFDwaSJh7g==
X-Gm-Gg: ASbGncu395p6tEHpivZzdhkGk+QegAkfPIHPNvAKnWVIOxLnTaaah5AxFRtDP5sDkhq
	VSAx6xwz5daPZM4kDn22p6j7F6m6yx18KCzqmK3vVK8pyGxwgsfuCNjzjWaQV8XRN/n5JbOUCFB
	jUMdyFApB6HW8oG9QZIhrSIVmOsgBsUfSajaiN8SXNVqGSLhXbjB2foT7ahgA0/GOCozqtDN22W
	Ixhvlgde6gS3CixHYaSGXSYzTGibYfvxSQJjFeQFFwhJkS6dY4ZuF7awSjVQNt83tCpt5CgN46Y
	FdATjf8Moud7GzbI8Sli5rD7kioV77pMIQdVoGCp+xix7yz/4bKDbYPWsKTCapVJ0VhkE2sE9x8
	Vs10qssMT2zt9nT5kSXOQuhnOuUH4a939/RcAxreT
X-Google-Smtp-Source: AGHT+IGnlqL320Ve3m4QvufVQcMrZxf5/XsfK8AqfCVt6uLqre0iUCCBea6i0DTTVCRv5ndJCcxfFw==
X-Received: by 2002:a05:6000:1868:b0:38d:b52d:e11c with SMTP id ffacd0b85a97d-3996b94b920mr3230505f8f.15.1742312972203;
        Tue, 18 Mar 2025 08:49:32 -0700 (PDT)
Message-ID: <749b27a6-3079-438e-980f-14d0eb5241b9@suse.com>
Date: Tue, 18 Mar 2025 16:49:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] x86/vga: fix mapping of the VGA text buffer
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250318091904.52903-1-roger.pau@citrix.com>
 <20250318091904.52903-3-roger.pau@citrix.com>
 <cc882f93-b5d0-45ad-bb2a-1c6b9455509b@citrix.com>
 <f2fa59b3-83cd-41e4-a921-5c6eaa89e759@suse.com>
 <Z9mRu3JCwgffgEKd@macbook.local>
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
In-Reply-To: <Z9mRu3JCwgffgEKd@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.03.2025 16:31, Roger Pau Monné wrote:
> On Tue, Mar 18, 2025 at 03:28:32PM +0100, Jan Beulich wrote:
>> On 18.03.2025 14:11, Andrew Cooper wrote:
>>> On 18/03/2025 9:19 am, Roger Pau Monne wrote:
>>>> The call to ioremap_wc() in video_init() will always fail, because
>>>> video_init() is called ahead of vm_init_type(), and so the underlying
>>>> __vmap() call will fail to allocate the linear address space.
>>>>
>>>> Fix by reverting to the previous behavior and using ioremap() for the VGA
>>>> text buffer.
>>>>
>>>> Fixes: 81d195c6c0e2 ('x86: introduce ioremap_wc()')
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> This is somewhat ugly.
>>>
>>> ioremap() isn't really any better than ioremap_wc(); this only works
>>> because plain ioremap() has a special case for the bottom 1M where it
>>> does nothing and exits.
>>
>> And this is exactly why I screwed up back then. Imo we would be better
>> off moving to using __va() directly here. Otherwise the same mistake
>> could be made again by someone (perhaps even me) noticing the less
>> efficient ioremap(), when ioremap_wc() really would be wanted.
> 
> I can switch to using __va(), that's fine.  I guess we should then
> remove the special casing for the low 1MB in ioremap()?

I'm not sure we can - DMI and ACPI might use that, and who knows what
else. But of course if you're sure nothing depends on that anymore ...

Jan

