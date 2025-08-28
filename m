Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B86B393A6
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 08:11:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097513.1451800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urVrJ-0000aL-PO; Thu, 28 Aug 2025 06:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097513.1451800; Thu, 28 Aug 2025 06:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urVrJ-0000XA-M3; Thu, 28 Aug 2025 06:11:41 +0000
Received: by outflank-mailman (input) for mailman id 1097513;
 Thu, 28 Aug 2025 06:11:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urVrH-0000X2-FT
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 06:11:39 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daef6796-83d5-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 08:11:37 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-afcb732eee6so88963966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 23:11:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe77c2b758sm873434566b.84.2025.08.27.23.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 23:11:36 -0700 (PDT)
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
X-Inumbo-ID: daef6796-83d5-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756361497; x=1756966297; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M8Sg9f2cGuFhekkWvLGQGRQLiQcEw8TzFl+k1pmOrl4=;
        b=NAR38e0BiYCE/J+vE2Uz0kbEvYR6kmsyJq6oIGX3mEpqlIUU5kjLjWYzz0IpL7k+1h
         YY2aSTlTMWDHs1FLMjlcgztvX1I1F/TM8bWFYPsvSVef4xgHZ7V1hVNtybfiuF6dDcbH
         cJxTB1iZsml5l5jgaEe+d5cZIQfmtqvxrVXYRh9rVijtCCfxl4Sx5rGBWkspUmVAmIzy
         sruBkNTkgI/dDj8/ZthAmXG+iZuUpHemwEOTZGVCFOwGKqaltSnHBOUJ2ud6Z88l8kMd
         uzp9POvCYWlBSW/DvU5OFvwdbpcSmCuAE1AsecxfI6bkMJ/pf1beU5P8LifeMGNkigBI
         fQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756361497; x=1756966297;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8Sg9f2cGuFhekkWvLGQGRQLiQcEw8TzFl+k1pmOrl4=;
        b=WL6sd9tObYvGl1yihybWRRmGiqN8rEujRezsD0RpwLErGHoegYCvlmbYQ/x7HrcZ9T
         oF3f+4rwr5RPbUCIoA9Lxm6IjcZGSGBzbC+kjO/2NiK9nR5qhYHO8gBuI5sL8VTlFJ+u
         7HcuHQDhrnLpTTUtt/e001VGOvkIarZD2/OLfuJV+pVh/Lfmr5y+uzFKG+Ifi/oTK9dZ
         7EJHecI809/c3jSMx3Sr2hbX6eqskIyJBJweA3vALFWq7bz0XcMtzQdS0POCiphFQypW
         atnMKrANh1gFontfMae3yONgmyFum8lTnYKvnVwuP6anvRfFgcDW20I11PesJX3eM20N
         wpZA==
X-Forwarded-Encrypted: i=1; AJvYcCWucTsOSivlyKSN+8WzyjpWBtg0aekrlMeoIQr4JMv5rKXBWREhh1a1xQsKjSkg56XCusMV2oyx9yo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5Et62aatmLYQvDCp7e0PjIRL7HAATOl4g+lLRfPArImtfbD7T
	PYB1iJgMIYCOMLTCb57Lr1BsrkN5CaiSlG6BAjcfxdNDerKyaTk54mrgfK9EefEM/Q==
X-Gm-Gg: ASbGncvxxYTXE6sOAKlNIxJxCRykR+1GgNjjav1234kOlcCw+C9c7zI7IFhwDYkg7pp
	G72IwZ2Gnlt3L+eGe7iolaWD21zJfV1DVK2kqWT1P/TbVfbU7+RrOV21ejwTDqBEfCEtYG/u4/r
	u0kfhp2Db7YRQCwaQ5o1h8+A+Slx/kfuGqc5j3gcFSTrkJb9MB5icr1M15hgyb0WMehdwgtmbDH
	oNLBsQsNop9U8p/SPXLYaMEyj9cyf/AuFkEIf/R9+VkalS2W8moAbFcvnCnF6zgcuoaMFvGwbyW
	LuCut6TomMbcyJ44CT/fMinItyb+39SFBAUA4wMHsMuiZSl31XtQGZln3i/vINIK+OkyhbQL+0f
	5xHC6E+wce3x0wDxEpTBQj9CArly35Ke/QLJC7gfq/EDVIt1z9L+ZGLl1BgmSLc3vH74AGkBpVF
	leMCDy/g0xX+ioqiXVtw==
X-Google-Smtp-Source: AGHT+IGe3LBHOTwzorR9wCwKkvUQuE2xC5UllzOSjALNq5m7XKSvMKIHI6FUx/TVw6f9AwN09L9Cvw==
X-Received: by 2002:a17:906:aeda:b0:afe:be04:5ce4 with SMTP id a640c23a62f3a-afebe13a7d2mr431300766b.38.1756361496810;
        Wed, 27 Aug 2025 23:11:36 -0700 (PDT)
Message-ID: <c16f3417-4af6-4214-9275-6d3806d29990@suse.com>
Date: Thu, 28 Aug 2025 08:11:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl: preserve errno in libxl__xcinfo2xlinfo()
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e567c234-473d-40c3-86dc-53317812baf7@suse.com>
 <c4ce1651-3881-4af0-bfe4-294917c31c9d@amd.com>
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
In-Reply-To: <c4ce1651-3881-4af0-bfe4-294917c31c9d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 03:16, Jason Andryuk wrote:
> On 2025-08-27 01:57, Jan Beulich wrote:
>> Callers observing errors elsewhere may be confused by the ENOSYS that
>> the Flask operation would yield on a Flask-disabled hypervisor.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Of course I don't know whether clobbering errno is perhaps deemed "fine"
>> in libxl.
> 
> I wonder if it would be better to special case 
> libxl_flask_sid_to_context() to preserve errno on ENOSYS.  flask 
> returning ENOSYS is common, but libxl_flask_sid_to_context() can 
> legitimately have error.

But then libxl__xcinfo2xlinfo() also shouldn't (effectively) ignore such
other errors? Question is what it should do in such an event.

> I guess this is fine if we want to use this approach:
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks.

Jan

