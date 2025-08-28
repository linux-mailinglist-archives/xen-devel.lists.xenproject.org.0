Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6342DB393A1
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 08:09:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097504.1451790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urVpA-0007Nh-Cu; Thu, 28 Aug 2025 06:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097504.1451790; Thu, 28 Aug 2025 06:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urVpA-0007Kp-9g; Thu, 28 Aug 2025 06:09:28 +0000
Received: by outflank-mailman (input) for mailman id 1097504;
 Thu, 28 Aug 2025 06:09:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urVp8-0007Kj-GZ
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 06:09:26 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b0adff1-83d5-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 08:09:23 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-afedbb49c26so83425466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 23:09:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe89bd7acesm743123066b.73.2025.08.27.23.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 23:09:22 -0700 (PDT)
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
X-Inumbo-ID: 8b0adff1-83d5-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756361363; x=1756966163; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=smG5mKel4W0Oc6sJ0hqJJ7D/H5xsumVTrYUsbzTBZ7k=;
        b=MriQ7ub7YLRbGSk+2gToMrhTCmUY0hTSJZ8XsoB1LcAwiEh+mpIHi3ANUHcgCyLuu8
         yzSCJxcRUaLIEptFMJjfdXShQC19gbAQJS/rIWoCH/L3oY+BXXxEE19N/HysQGhG0tnw
         BaO6CT6H4r+idNN9Re7+XhBYUV4JLXnVLK876P12DA9wuk69sY5k+RguDBf5Aegdz9gI
         JTq0KhbTxgLJOHGfW7XPEKxxCGjV7PZqz81CLwsOcz9TQxwboDsHf/b56jeULIaBbQ6v
         lSkbzqx3dTJ95mYcwyZ9Q17aRbS1q1IP99DJQQpt4DnzO5ipoo78i3NvgYYWskmkKoaB
         QfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756361363; x=1756966163;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smG5mKel4W0Oc6sJ0hqJJ7D/H5xsumVTrYUsbzTBZ7k=;
        b=vMEA/6TK0OJ6C+oHoiut3MfOOLmPsi0H6XdKGAL0Wls5kyiXh5b2PaS+zd7qQnsy2x
         ivAhicKp+93IS1kuyAPelAVyV/FuiETYLAhqPgoURGxXZtdGH5Esk0pyOrhTTYfS/D9K
         KyDhfYzh2p+Hq4i6yNOOJzugZxZFVqyhfjOrmT3fq6yOMwY5zA8UMkXPELslQkiFaoXg
         RKq+NczH3GYZ1H81veOxIjxa9DqmU0OEv+X/Nzu5Yk4H5bGw88A+O4Mkbpnr5TK7+uuX
         MtE622vHLs6zcRHQXlo9t1WbmuiziiihFiGL8IyxwOYsBJuIMj060e3mY8RDgYOEKnpf
         UK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOaPXBoNk1Yq8pmP9m0kSz7yfMpjY3eLsAZwIxjTG1tiW1JG78500ogyEfreTTY4q//x1WzL6fM38=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcubMMgwE4bC1MkOHxyYkiprzdmGnZclOT3ePnhnkLHRBJpAhh
	nhgA5hQz8y3m4xCdRlSbQT/ADuAVkfDQTn7IygsiT2tzWpF/bFTiq04VYgm/sgHYb+rwEILevl3
	oc00=
X-Gm-Gg: ASbGncuRw5gG0T2leADgepIpzHhJkRHXFyyyajPJ5spG5iy7ktmZUwSoYXZsU/RmcMG
	eBLK4tVVi+m12asG3txzByUsr5yaVAL9ym2He3BuDVjgFi8V3WwYghfH+LVjLZH+ZUrnD/rdYqR
	gBgClMjoKs3weFpWg13QanNdjYV/11q+ed4KO0ZL+Ue7o+xwSIGH4UfYm8ll2KNg0YqvThi8BRI
	0OoRCUJS+9RgNHKR7Ju1S2zjtsROlAggFVhaG9S9ndw8LLYQSYqmg/waxRQFZy7nHwLwS7liiX4
	yBloVima+fA4VN4gjX8uKvv6ubId9aY6Pp9+8tZFqqcsBx9+sBhfDZWlezwvtqa8UI9LIOIxoZ6
	5soVhzuUHXbEGDoQefOPSTJwbRegiI1whcwvKTH56Ek35/UgdM4uztz+2lyd1bJ7h30PjwFKtEN
	1EPLFsx3E=
X-Google-Smtp-Source: AGHT+IE4vUgJ57a8eXkc8+Aw1RtU4ZiqqQJOipVfRHCUEdMtWYTthBdLFNj5nxTeHNuuBvnhm/gp9w==
X-Received: by 2002:a17:907:7f27:b0:afd:d994:cac with SMTP id a640c23a62f3a-afe29897202mr1831278266b.62.1756361362719;
        Wed, 27 Aug 2025 23:09:22 -0700 (PDT)
Message-ID: <20d686c7-aa86-4896-a392-947ad7e5838f@suse.com>
Date: Thu, 28 Aug 2025 08:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl: respect unset video_memkb for Dom0
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <719c456b-927d-41c3-b28d-135a895958dd@suse.com>
 <01f134a0-46fb-40d8-924d-79ab864352e9@amd.com>
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
In-Reply-To: <01f134a0-46fb-40d8-924d-79ab864352e9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 03:12, Jason Andryuk wrote:
> On 2025-08-27 01:56, Jan Beulich wrote:
>> Without this, Dom0 will have have a curiously off-by-1 target_memkb
>> value displayed by "xl list -l".
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks.

> In theory, b_info->video_memkb should have been defaulted to 0.

I don't think 0 would be a legitimate default; it might be for Dom0, but
not generally.

>  In 
> practice you found it isn't.  xen-init-dom0 could probably use some fixing.

Right, kind of as per the latter of the two post-commit-message remarks.

>> ---
>> In retrieve_domain_configuration_end(), isn't it the wrong way round to
>> set both ->b_info.target_memkb and ->b_info.max_memkb only after calling
>> libxl__get_targetmem_fudge(), when that uses the two fields? This way we
>> could as well use ->b_info->video_memkb directly there.
> 
> I think it's attempting to read the current values from xenstore, in 
> case they changed via xl mem-set, and then putting them into the d_config.

That's my understanding too, yet it still makes little sense to me to
invoke a function when data it consumes isn't set (yet).

Jan

>> Of course this may point at a bigger problem, as other fields may
>> similarly never be set for Dom0.


