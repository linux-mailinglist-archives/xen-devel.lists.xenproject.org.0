Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E63F9C89E7
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 13:27:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836384.1252276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBYvw-00058c-C2; Thu, 14 Nov 2024 12:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836384.1252276; Thu, 14 Nov 2024 12:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBYvw-000564-8m; Thu, 14 Nov 2024 12:26:48 +0000
Received: by outflank-mailman (input) for mailman id 836384;
 Thu, 14 Nov 2024 12:26:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBYvu-00055m-92
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 12:26:46 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4860285-a283-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 13:26:42 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-539e8607c2aso543402e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 04:26:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da2800absm22147425e9.25.2024.11.14.04.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 04:26:41 -0800 (PST)
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
X-Inumbo-ID: b4860285-a283-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzYiLCJoZWxvIjoibWFpbC1sZjEteDEzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI0ODYwMjg1LWEyODMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTg3MjAyLjYwNDIzMiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731587202; x=1732192002; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FcE999/2te3VNnABXtvaSDhTIx8pnu2+4cAjn+yCADU=;
        b=O56GrJwvRm/OUe0IyjZ9FlNqBsLJh4EyWMXYdxd9zirEAU6YRvgEhQoD9zmfI7sztn
         MveskugaynADFEHNcNEhm35Cv576Css0o0RkNhvwdKttnNlzt/VgowPJD79OEaL+Iuiy
         Ssdhd1BPOxgSqpCt6BzTYwWq2VUxOazj8DJx269AN31WvrZm6GurIGxS5utKpdczgsR/
         DOMiPw6+W/QN6jSLKr7lz48tmROUb9f2wU68yLnlFvL0n+mpuFdBm01t9c1EB3pxyo7C
         Nw4Qk6h3+ffR0/MsXTh0v8pc9wumMRby2hPwiKIAGeJ211IgcWyxou6FLfmNwxZDdwmR
         RKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731587202; x=1732192002;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FcE999/2te3VNnABXtvaSDhTIx8pnu2+4cAjn+yCADU=;
        b=BivFOlCmVsBHf86wg3puFIKFMjXx4oVOUChEHORRupmelkLTYWgP/IYo3iIEzlgNjW
         resfJGGawSJBxyNyhgBdFdzEPot5tR/2YXZA2KP1vXkKolSKekJKW/uUq7auqh8eJKaP
         bl3AR4mwjehTXzHRSy3AJDSwTTKVb7I+BTj4GUEl/0b3IUr4F0Je6s4AWEn8d9b4jP29
         0w8eIMhOEu70RKVfoClcmG526bCBl6QXCeJhM4Usmk2SDZ44+GegdoYozXnBIVsxx47K
         q1tBaGAy5bPMdVjiHjHZyacfqJGHOsssGtW+EAp6tYSsJ6VB3n97Np0yFCM5r5DZhXqy
         GZvg==
X-Forwarded-Encrypted: i=1; AJvYcCVXR5+yAo8FLwUeKaqMpu2AdanSJTH+yEQYCBFBiiiz4Etl6KS2hlcKe3h/t0JMdwEXgzx6WlKuutw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9QxL6B/ClyCU51auv0PC0IA8Uf33gVhIjFTILko+qIbAFQR46
	cWvLMOiIKVifmSQmwbQ6hsNvZgR6JRB+ojZBc1XCJd/Vv7db32l7f3Nlc08u6w==
X-Google-Smtp-Source: AGHT+IHmjCHBP9HrKjGL1wqLPoVjRpXfgeq05lJyYOin+hBVkscXOtqJKdWmJRljigTjilAz6lDy2g==
X-Received: by 2002:a05:6512:128a:b0:53d:a273:7da6 with SMTP id 2adb3069b0e04-53da2737e4bmr2422804e87.57.1731587201959;
        Thu, 14 Nov 2024 04:26:41 -0800 (PST)
Message-ID: <9d97a479-f5e4-4bd4-b47e-8503b3fdc806@suse.com>
Date: Thu, 14 Nov 2024 13:26:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.19.1
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Kelly Choi <kelly.choi@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ddc41c9d-9754-4fde-bac0-6389511a7f7c@suse.com>
 <686facb6-0a6a-471c-a91c-b593cee7831a@citrix.com>
 <103dd682-cfb6-4f61-bced-f4e742813232@suse.com>
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
In-Reply-To: <103dd682-cfb6-4f61-bced-f4e742813232@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.11.2024 16:29, Jürgen Groß wrote:
> On 13.11.24 16:20, Andrew Cooper wrote:
>> Looking over the XenServer patchqueue:
> 
> ...
> 
>> These are a SIGPIPE bugfix which happen to also have a perf
>> improvement.  I cant remember if we discussed backporting them before.
>> (Juergen/Anthony?)
>>
>> 42db2deb5e76: tools/libxs: Fix length check in xs_talkv()
>> e2a93bed8b9e: tools/libxs: Rework xs_talkv() to take xsd_sockmsg within
>> the iovec
>> f050c03ce2ad: tools/libxs: Rationalise the definition of struct xs_handle
>> 046efe529e82: tools/libxs: Track whether we're using a socket or file
>> ebaeb0c64a6d: tools/libxs: Use writev()/sendmsg() instead of write()
>> a17b6db9b007: tools/libxs: Stop playing with SIGPIPE
> 
> I'd take these, as playing with signals behind the back of a library user
> is something which should be fixed.

No question about the first and last one. Are all the intermediate ones
necessary, though?

Jan

