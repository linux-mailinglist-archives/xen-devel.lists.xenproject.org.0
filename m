Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B89E188FBE0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 10:43:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698857.1091037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpmI8-0007cK-9l; Thu, 28 Mar 2024 09:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698857.1091037; Thu, 28 Mar 2024 09:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpmI8-0007a3-6h; Thu, 28 Mar 2024 09:43:24 +0000
Received: by outflank-mailman (input) for mailman id 698857;
 Thu, 28 Mar 2024 09:43:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFXD=LC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpmI7-0007Zx-HZ
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 09:43:23 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9894a8c7-ece7-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 10:43:14 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a466e53f8c0so88201366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 02:43:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 lh23-20020a170906f8d700b00a46ab5aaffcsm542320ejb.178.2024.03.28.02.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 02:43:20 -0700 (PDT)
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
X-Inumbo-ID: 9894a8c7-ece7-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711619000; x=1712223800; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fTGIqDU1OcIE3IM7792eQ8mgZrEHRTl596q3shAwzsw=;
        b=SU1QwU9QE1ixd4Lho8otZ7zZ2qBTi9bbmGdawx3FYaebmo+pX3AorkuIZqHaMesvYP
         fQh3Ij4DleWc/EPoldEEF4zVnNLET7N/3xq4KlBgM6XRAMUHdK7eT/aKvTyuX07XoVjx
         iQLnbd9b6th6UvHtDa74iuBhcFLgVlNiKnyR+US9vWKaQM3uLXs/s4ULhEao/bgJWOwc
         crU3EB3oJCDbZM4CnTJAr1LoxqWpZfb1hGRu4qhxDNRZb/141JdFuIhlzTkbF+sLiSc+
         jtZNrKhPw3fUBJLFWaKgxqJDt+wPUNsCg/3+LI32V2OWtL40OUc7D5v4boS8hGoU3RFp
         9njQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711619000; x=1712223800;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTGIqDU1OcIE3IM7792eQ8mgZrEHRTl596q3shAwzsw=;
        b=Em+/U/sFdjEL9TwtOg5YRCgoL1Dp/2F0mtrg8xfpo5+i2IlIly26zFBVQd6nOGMry3
         ccrTORN0zNYrphNjOiQZ8CW3Jbo6qtO4hp2aKKphOAzqJf4eNU7d6IAjepGENJbjR1CD
         L4OEogrRs8VJHkPTlGq+I6Sv5otYwLsS+rDszKC62q/QYy6Xr5v4zWRUNMVxco4ylW2D
         m88xSprtZ5FiAWptb143eR80k5Hn8/7kg54S+EdX8mrJx7CBTmXCWS58aCNgw7QshbCM
         3PvdoJ3Zn3kB3uyz1PMOJtRX4gQ1dh+8+c7kJPxlFeyRnNJFO3bQlkuoHxn/JTow59+y
         EUkA==
X-Forwarded-Encrypted: i=1; AJvYcCVZVSMzXcXtAtc5tAGz3JK4q1Czht8DK03b+7GvtUSdRbC4Bu1gsVds5P3ravr7MVE3w0zIXQmJylt7lrmpDJX9i4mNCCkatdPJ14DxIOI=
X-Gm-Message-State: AOJu0YzliHOIxw6795Eh6Z48nleqyYhn7mkJY7qchSE+VOjKMraYDb0D
	RYQj0ku0G1JtBxOilBaJEhz2zIwxSUxBVv6b+Wk8gFHbGzdVf6fs3+IwyqMQ+g==
X-Google-Smtp-Source: AGHT+IF+DyI++XQt8QnHbSaPv8gYSf0zv4kJdPheyvsh69RPcTNuDLaTOJwSMIWlX7CsbWgIpbqmjQ==
X-Received: by 2002:a17:907:940a:b0:a4e:196c:bb8a with SMTP id dk10-20020a170907940a00b00a4e196cbb8amr1343930ejc.7.1711619000406;
        Thu, 28 Mar 2024 02:43:20 -0700 (PDT)
Message-ID: <72363f38-cd1b-4d7f-9b79-4d3be8e6fdf4@suse.com>
Date: Thu, 28 Mar 2024 10:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] tools/misc: rework xenwatchdogd signal handling
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: leigh@solinno.co.uk
Cc: andrew.cooper3@citrix.com, anthony.perard@citrix.com, slack@rabbit.lu,
 xen-devel@lists.xenproject.org
References: <55416d60-cae7-4e79-8bde-bc07ee9e3830@suse.com>
 <20240327181353.10951-1-leigh@solinno.co.uk>
 <20240327181353.10951-3-leigh@solinno.co.uk>
 <21da34a4-d946-47d0-86a6-b184fd010c94@suse.com>
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
In-Reply-To: <21da34a4-d946-47d0-86a6-b184fd010c94@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2024 10:31, Jan Beulich wrote:
> On 27.03.2024 19:13, leigh@solinno.co.uk wrote:
>> From: Leigh Brown <leigh@solinno.co.uk>
>>
>> Rework xenwatchdogd signal handling to do the minimum in the signal
>> handler. This is a very minor enhancement.
>> ---
>>  tools/misc/xenwatchdogd.c | 20 ++++++++++++--------
>>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> Throughout the series Signed-off-by: are missing from both you and Leigh.
> The latter you may of course add only in case of this either having been
> provided earlier (and dropped for an unknown reason), or with respective
> agreement.

Correction: I was misguided by the mention of someone else's name in the
cover letter. It's really you who is the author aiui. And it's just that
the S-o-b doesn't belong in the cover letter, but on every individual
patch.

Jan

