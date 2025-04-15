Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B066CA89AFA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 12:50:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952666.1348051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dri-0003fv-6M; Tue, 15 Apr 2025 10:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952666.1348051; Tue, 15 Apr 2025 10:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dri-0003eV-33; Tue, 15 Apr 2025 10:50:06 +0000
Received: by outflank-mailman (input) for mailman id 952666;
 Tue, 15 Apr 2025 10:50:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4drh-0003WV-Dz
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 10:50:05 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62a42c9f-19e7-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 12:50:03 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso36526815e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 03:50:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43ccd8sm14031451f8f.72.2025.04.15.03.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 03:50:02 -0700 (PDT)
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
X-Inumbo-ID: 62a42c9f-19e7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744714203; x=1745319003; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yy54S/trDAtLHWlpfeSQ55qPsceiWwmVkkcTriPDLj0=;
        b=eEQCbJMbLznQV34zGq4k5f3o2Cch4Kq9a++JMcuRQHXP7b4WmZq7OX3hEin2iidowY
         H7jRaB1hVKi35RRHIfeqp5OdufAxWDgRyNbOSqOC9uD1td8SQUriliy9eHuQ1Il3O0eY
         DtVhiJSZxtzG6jE7FFYwDVDu9eCmvL0GNRQEWfpUWUrX8M/OqxlYrmvO/NYrP9xl1PB8
         ugrHisDHOnDW3sxCbl4dbLRHRKVbUHLYnICfvWWoCXDXEeNLXHXF3cwO0M3hEG3jJDxn
         djwk4amR0OHvfiayfGAnWxBEwSg7KLJHsx0cFXTwRE7HgVGY+LbEOYCTb3HzgxY7NQDL
         YGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744714203; x=1745319003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yy54S/trDAtLHWlpfeSQ55qPsceiWwmVkkcTriPDLj0=;
        b=KgXPmBFejbMGN8R9xp+h2IpOpgdfcCvYYdSmGWqLr3fP2DBfGZtGpxW0dVf3HHpS3S
         Ga6HXcYS5sF5En/nxAUWfqhJYsn18hwSfASbewnxH73oNuVxUJEeRhDiJVG9jePwO9mv
         bq3Mz9YIp4CBx2Zf7tinWvv6QG+ZtJhTi/UfXAWnql4fA+4tCFyAaP678HeQTNunCvcD
         u99VbY0tyVKxOVx9Mju7MEvZMEwfGtscU9WVYfdpQzlliIaX9da4loBLdZc5zEsyQe2+
         eqdBibS9feQHKMxl9IuH3uEfpDj+d3pF8y7BALyh3FVmXSnWkPhZ7Fd/2d5LoeO7bpu3
         T6gg==
X-Forwarded-Encrypted: i=1; AJvYcCW2U4IbNQorGqKWubUZ32H9iTAVzOa285MHmpmsbgNisrO2Ie7hwr1h5Au2nu3LjaCVMVbVkHjqci0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOYisOrgZnVDvjapKo3fmCkkm2qsTVITYuGPsSXsvcIpSaYhNZ
	K5Z9Uh64oFuLrLYMzoPtfhMxyrvO4yBg+hr4+XEyrEPVaNgN8gZI8OFKn0EuaA==
X-Gm-Gg: ASbGncs9z2QibvUhyKTWX411rzFEepV6CT4IWn5O1MAWsiZnEaJp2onrEgDG4rwbzKS
	iRqIBNSn0lJ7dXWTeiWxIJyLa0PvKPCPRajrZPbVfMYK7ngXzyBiX53VUlGOuv9bvAHWZKPJvvR
	UkdloZKnmSBwKORWBo3neGAJ8HjGLcvA6ZY9txifa/2Ty/Y5Oq+4e3woWl0vAolebjnY4EQqERr
	lXU3G0IA4lzeica+itHgjN6sJjVupAd19evaJACGELN68cXb+G/tschWvWM9VUnxlumOeVg5aVz
	r9PE6Tfbon4tW3Bo41QE0/Cntp9PQi2vs3+wg68xTyUB+Up7m1ZLyKNCE5ayS37IOVhCB9TVD3Q
	Oeg2ux67VffXUet6ZR4qml5ItGg==
X-Google-Smtp-Source: AGHT+IEf45lhk0MKIgVnERcYOnmcJBD0N4P6JT4O1a3dXp1My+/rkfaboFDtXJpEV46ldslv87Xt8g==
X-Received: by 2002:a05:6000:18af:b0:391:4743:6dc2 with SMTP id ffacd0b85a97d-39ea52120e2mr12872496f8f.25.1744714202755;
        Tue, 15 Apr 2025 03:50:02 -0700 (PDT)
Message-ID: <b526ed97-62cf-49c3-8e74-9cc04fc228bc@suse.com>
Date: Tue, 15 Apr 2025 12:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/hvm: fix handling of accesses to partial r/o MMIO
 pages
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250411105411.22334-4-roger.pau@citrix.com>
 <eaf5f71b-2c56-4bd8-a45f-35280af16466@suse.com>
 <Z_0TXKMe6tfrYR9T@macbook.lan>
 <c92d5665-0940-40b5-8cbb-81889adf40c5@suse.com>
 <Z_00JReo7Ji7RwkD@macbook.lan>
 <7c3c91d9-4de8-4910-b26e-8782a0f0d364@suse.com>
 <Z_4aBL7JhTv_oxWR@macbook.lan>
 <4dd5ada8-32e7-4b94-b2a4-51b20e09eb79@suse.com>
 <Z_4vE1qHlvGliqXY@macbook.lan>
 <0c74e9c9-c01d-4213-af01-cc287d1ef76b@suse.com> <Z_43iyD0Sod4uTN2@mail-itl>
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
In-Reply-To: <Z_43iyD0Sod4uTN2@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.04.2025 12:40, Marek Marczykowski wrote:
> On Tue, Apr 15, 2025 at 12:18:04PM +0200, Jan Beulich wrote:
>> On 15.04.2025 12:04, Roger Pau Monné wrote:
>>> On Tue, Apr 15, 2025 at 11:41:27AM +0200, Jan Beulich wrote:
>>>> On 15.04.2025 10:34, Roger Pau Monné wrote:
>>>>> Emulation of r/o MMIO accesses failing wouldn't be an issue from Xen's
>>>>> perspective, that would "just" result in the guest getting a #GP
>>>>> injected.
>>>>
>>>> That's not the part I'm worried about. What worries me is that we open up
>>>> another (or better: we're widening a) way to hit the emulator in the first
>>>> place. (Plus, as said, the issue with the not really tidy P2M type system.)
>>>
>>> But the hit would be limited to domains having r/o p2m_mmio_direct
>>> entries in the p2m, as otherwise the path would be unreachable?
>>
>> I fear I don't follow - all you look for in the newly extended conditional
>> is the type being p2m_mmio_direct. There's no r/o-ness being checked for
>> until we'd make it through the emulator and into subpage_mmio_accept().
> 
> But EPT violation can be hit on p2m_mmio_direct page only if it's a
> write and the page is read-only, no? Is there any other case that exists
> today?

Today and if everything works as it should - yes, I think so.

Jan

