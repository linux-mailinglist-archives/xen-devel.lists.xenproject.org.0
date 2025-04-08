Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DA3A80D24
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 16:00:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942215.1341461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29V6-0000FH-AV; Tue, 08 Apr 2025 14:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942215.1341461; Tue, 08 Apr 2025 14:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29V6-0000D5-7p; Tue, 08 Apr 2025 14:00:28 +0000
Received: by outflank-mailman (input) for mailman id 942215;
 Tue, 08 Apr 2025 14:00:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u29V5-0000Cz-6O
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 14:00:27 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d270161a-1481-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 16:00:26 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso3345933f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 07:00:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f11eb0511sm16461605e9.1.2025.04.08.07.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 07:00:25 -0700 (PDT)
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
X-Inumbo-ID: d270161a-1481-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744120826; x=1744725626; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xj23WDm9CsdK9bxr0xNjZLGeA3vVy1BDgAe+9GNRJJY=;
        b=IyMX38OaptOoNlcMygvQQi82gmCj4E8sZXT2Nc0cqNAeGMpTp46KJvP5SkVtEZVeLz
         ijSRglBlArx/aCywN9pxz5F9UzPGyKeB77Qus1LUxBvBYPw+NlGVlbIOu6cMyRj5aTjY
         orWv4Y2/EkLMCAQhzsyY2+3mpd0JayiSGREIjxZUpeu2zJ5bSjxSPX2jEw9lfhSNeLSN
         Cv7fT8Io6KP1Fca13GiDp2HIH8PeX5tAJGcwt2WN4eJtv2QtmzwUTeX8q8Kqt8XieegA
         jWKHRyeGF5vr19l7loviWUBRa9yoV4LP+ivL2qJvgNy3Lbel7aUqZ9XxRmmShnSSjvXG
         ofBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744120826; x=1744725626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xj23WDm9CsdK9bxr0xNjZLGeA3vVy1BDgAe+9GNRJJY=;
        b=cMgpFQYvzuANl5YylxrkXj0YMmp0jJDPfd54nVrGT5A9H7sAZ8E8ruq1V1E5TH8BpV
         jf83vzpJCMEFRLfHezEnZV4ltTXgiryEerp5+8AYMEsm7DvyYabmAVbQVv53t5WSvzsQ
         5akbmmfp2UoziQtWWghfKmeVHfGT5JQ8WIzxXa/9rMCQLhKrg+A2o0AJLYOm1NRmRd4l
         C9k/4TlqVE0bF8UeqN1c+bNzEfTQD3ZeXbrPJEbxo9e8KcyIgDVwTSiCAGspNUx25/hr
         noO+5+0x4DPwdhqovaEdieCwlI3kPkrgsRXdTTkMk/3c6CecANCNaDx3ergo+rOKEdae
         crAA==
X-Forwarded-Encrypted: i=1; AJvYcCVcrW0+vv4a8OUKRU3sMTV5UZFbn8UStYPi2s2dm+GgW7w1tG87k9jcG2smzQc2XjzVPIv9K2jEHqQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwL42CSSCuMT3OEl8cuqRNDYyliqZ10bgp2sn9Np3fJgDiEwypR
	srj9zNwPdeYr2eNH/ziGrMPcd7BOhTdOy4g6jtbY9EcI1J+yLwOesqOcj7HOkg==
X-Gm-Gg: ASbGncsMi0YlqvDoQaH4b7sGLoI0u0baVd5Gjf8/WyECs9Cr60bL1YdoXGGqN+ifUx4
	tIgrXP5Mz9rylsW+MPEbmP4FPcRBHneClJfX1NyTcI8PYKk3TR4ycOD//+MCgrqdg1XIIOuiYOE
	EfJOLTK4kZQ4Ixwz7T2V9pMVjBPpU8BsN3umLXRnzB6M/v5T+VLOv4CbAADBZ484/OOODbM6mxS
	zMt8xUbziErHZjwlYd3mdRdaEYiom4wb0wqS563KOJwapZc26QRpQsnuELrZM+GncZMI/yjFjfA
	9IFErvuxnoC7tJodkgWt8phZf4f3CNtP1FQYyBD+3jFtKrfQKNfgJ+DL58jNDkc0hB6HZwkZa1s
	VRXSGAMzu4rvcEVO0MiqsVTNDJW26jw==
X-Google-Smtp-Source: AGHT+IFwtYKCP5H2PQnrhPnNxwj7f8FOrMCdWsrwL2NifX555uh4QOscmVRUPeUsRSvk7ZQVEm2EhA==
X-Received: by 2002:a05:6000:2512:b0:391:253b:405d with SMTP id ffacd0b85a97d-39d0de62927mr13320013f8f.41.1744120825830;
        Tue, 08 Apr 2025 07:00:25 -0700 (PDT)
Message-ID: <b8771688-bd89-4a38-a03d-1ee1cb3d8799@suse.com>
Date: Tue, 8 Apr 2025 16:00:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] xen: introduce hardware domain create flag
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250407194038.83860-1-jason.andryuk@amd.com>
 <20250407194038.83860-2-jason.andryuk@amd.com>
 <b032e7bc-61a4-4dac-97c1-171771869156@suse.com>
 <2843a46d-0b30-4fa1-b8de-b0030a98e636@amd.com>
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
In-Reply-To: <2843a46d-0b30-4fa1-b8de-b0030a98e636@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 15:54, Jason Andryuk wrote:
> On 2025-04-08 02:37, Jan Beulich wrote:
>> On 07.04.2025 21:40, Jason Andryuk wrote:
>>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>>
>>> Add and use a new internal create domain flag to specify the hardware
>>> domain.  This removes the hardcoding of domid 0 as the hardware domain.
>>>
>>> This allows more flexibility with domain creation.
>>>
>>> The assignment of d->cdf is moved later so CDF_hardware is added for the
>>> late_hwdom case.  Also old_hwdom has the flag removed to reflect the
>>> change.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> i.e. ...
> 
> Thanks.
> 
>>> ---
>>> v4:
>>> Move d->cdf assignment later
>>
>> ... despite my earlier concern this movement looks fine to me.
> 
> Double checking today, I see that in the failure case, hardware_domain 
> is restored from old_hwdom.  So in that case, CDF_hardware should be 
> restored:
> 
> @@ -986,7 +987,11 @@ struct domain *domain_create(domid_t domid,
> 
>       d->is_dying = DOMDYING_dead;
>       if ( hardware_domain == d )
> +    {
> +        if ( old_hwdom )
> +            old_hwdom->cdf |= CDF_hardware;
>           hardware_domain = old_hwdom;
> +    }
>       atomic_set(&d->refcnt, DOMAIN_DESTROYED);
> 
>       sched_destroy_domain(d);

Oh, right. Please retain my R-b with this added.

Jan

