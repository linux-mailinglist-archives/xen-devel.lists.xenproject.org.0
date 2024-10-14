Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA00799C91C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 13:37:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818649.1231967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0JNA-0004kw-Ak; Mon, 14 Oct 2024 11:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818649.1231967; Mon, 14 Oct 2024 11:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0JNA-0004hx-7b; Mon, 14 Oct 2024 11:36:24 +0000
Received: by outflank-mailman (input) for mailman id 818649;
 Mon, 14 Oct 2024 11:36:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kmr=RK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t0JN9-0004hr-3s
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 11:36:23 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89286e01-8a20-11ef-a0be-8be0dac302b0;
 Mon, 14 Oct 2024 13:36:21 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43116f8a3c9so46865145e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 04:36:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43118355d22sm118767705e9.30.2024.10.14.04.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 04:36:20 -0700 (PDT)
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
X-Inumbo-ID: 89286e01-8a20-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728905781; x=1729510581; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jjXuWByIaP4w9Tv8Fon8KqT9LP2nbpJh9NlSq/015bc=;
        b=d5KwP2OrfXitijcftXINGK7w3JIsS+a3Ot2QbwFkIF9kfqKLH2aUzNBtmJ/8CifYe4
         XUpHjnx07hZhvIEWTJSqfVefsoSr2cwwqnVdzFXEbN2oYW5mr/6MiZJHydQO+wNYY1Gf
         tnBtWdlG4neDF2zWdOjhawDYlP//4W7wUvkIUyCMcyTryYD3p13IUiy3grVoBqoR6Up4
         SH17I65UQFTtBRHhAa011iDXSbuEOqCPLkLfTcwQWd6OSvjRB9mc+7meyesKeVbZIEJX
         qk9AvcUSgnMqzwXr/4s1yoFysNgqzeMy7Id1pyaFpW6oNQWJP0JhkjlFXcGnlO7VtTOB
         Wl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728905781; x=1729510581;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjXuWByIaP4w9Tv8Fon8KqT9LP2nbpJh9NlSq/015bc=;
        b=B10mVdMBg9Cv/dEH8p16441tjtGhm5Kn10jY4TSipS6q2OiMf9MEu85mXDAoq8xWEP
         QA4VH0ZhGjC9GZg9n1OojqHNX+GLpYizVZQT6EuvrCSPRhrI2KuWUgtULahDXRuQExmk
         CXg1gLKqirIILJe3PoZgNrHQaRIxfAqwVxTLdHbGtesFkqjQzIHfxB2NnRgSoCgXnK+B
         2JTpbo4bvTZiVxwasbHwYklZR/U+NyErFxlcAgbVSsPkt1a6pvTVIzt0RjNrxP49yQFZ
         BkQxnt/ZBAMZvleNhnD1UuP658pDS//kcgvzxFyLy5wVGfvo880+o0VT0WUXcNSnJotq
         8YUA==
X-Forwarded-Encrypted: i=1; AJvYcCXGznIFagqyPBvEZD4lbyWbT71B4qcVMDGplzATLpRVlhQhemD/GLUxdH4di1JyviwocxGkS6O9EYU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoO8CDXqcbe5PUR3Fso3d/X0cBjqJ9xm/We2Nf/ZTr9Tc4ozXR
	4tquItS89BHoourysQ8NHv3bG9FP/wB6BP1BVmRYoQKy4oN+9NtNc5D+0DPxkg==
X-Google-Smtp-Source: AGHT+IFiWSXHIkdlmwDXFO8AOXiT5t7RoVC7fXvQOuyE7B1V7EwbBekiLiFuJ+Mt+AgR436ynht6tw==
X-Received: by 2002:a05:600c:3555:b0:42f:75e0:780e with SMTP id 5b1f17b1804b1-431255dac0dmr88821225e9.10.1728905781118;
        Mon, 14 Oct 2024 04:36:21 -0700 (PDT)
Message-ID: <d3241a72-0bc4-44ab-aacb-5c7056bcb496@suse.com>
Date: Mon, 14 Oct 2024 13:36:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: add comments regarding interface version
 bumps
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Julien Grall <julien@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241014103311.31272-1-jgross@suse.com>
 <0be5b60b-c333-4718-98a8-34eae911a169@xen.org>
 <370e7307-6698-4195-a703-76542bccd60c@suse.com>
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
In-Reply-To: <370e7307-6698-4195-a703-76542bccd60c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.10.2024 13:01, Jürgen Groß wrote:
> On 14.10.24 12:48, Julien Grall wrote:
>> On 14/10/2024 11:33, Juergen Gross wrote:
>>> domctl.h and sysctl.h have an interface version, which needs to be
>>> bumped in case of incompatible modifications of the interface.
>>
>> What about vm_event.h?
> 
> Indeed.
> 
> There seem to be others missing, too. Here a git grep output of
> possible candidates (including domctl.h, sysctl.h and vm_event.h):
> 
> arch-x86/xen-mca.h:#define XEN_MCA_INTERFACE_VERSION 0x01ecc003
> domctl.h:#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
> hvm/hvm_op.h:#define HVMOP_ALTP2M_INTERFACE_VERSION 0x00000001
> platform.h:#define XENPF_INTERFACE_VERSION 0x03000001
> sysctl.h:#define XEN_SYSCTL_INTERFACE_VERSION 0x00000015
> vm_event.h:#define VM_EVENT_INTERFACE_VERSION 0x00000007
> xsm/flask_op.h:#define XEN_FLASK_INTERFACE_VERSION 1
> 
> I can add another patch for the missing ones (or 1 patch for each?)

Please don't. The situation is different there. Sysctl and domctl are
unstable interfaces, hence to change them in incompatible ways a bump
is all that's needed (in addition). That's quite different from cases
where the interface itself is stable. The only possible exception to
this is vm_event.h, which offers solely tools-only interfaces. I'm
not sure though whether "just" bumping the interface version there is
enough for an incompatible change to occur. Tamas?

Jan

