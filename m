Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C48A9BE32E4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 13:51:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144504.1477893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9MVs-0001Vd-S3; Thu, 16 Oct 2025 11:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144504.1477893; Thu, 16 Oct 2025 11:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9MVs-0001SZ-PP; Thu, 16 Oct 2025 11:51:20 +0000
Received: by outflank-mailman (input) for mailman id 1144504;
 Thu, 16 Oct 2025 11:51:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9MVr-0001ST-1v
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 11:51:19 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c5604d6-aa86-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 13:51:17 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3f99ac9acc4so498157f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 04:51:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57d49bsm35873285f8f.10.2025.10.16.04.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 04:51:16 -0700 (PDT)
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
X-Inumbo-ID: 6c5604d6-aa86-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760615476; x=1761220276; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hIYyQfW0hjADQt2GaKTqFZOuaCC1G2JFdW9A7ayegYE=;
        b=PnbzZ7JaqbWSNNjVJ/7jNviQ3NYy+hlt1SkNhh7cV0kcVabxheCa/RrM9gYw1uPNKU
         WGZhgVXZxiNzoYr0AVHliAeAq+AEiRddJ6r+zP1pmgv5glpoecdD5qKpUMBrpnxJuiJA
         2T++99f0g1cLE20YIhzXD840qjWpyjscSV4ocwzVxPtuqSO8nnEzsO6XP37tkDge3kq0
         zexroWHg8VGOX9h6fHrqlW9ndeNWkNraKJhV0lkd+6U6ZAPLBrpsVJ9lrmDJKM9sV1TL
         QpxLlzq9gSEAoQUg2a0j6Sp6hMi5KA2N06d4XR3cYOQdQnM7+IWc9k0W/q4KYQWmxdJc
         8f2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760615476; x=1761220276;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIYyQfW0hjADQt2GaKTqFZOuaCC1G2JFdW9A7ayegYE=;
        b=u83qK/tRPJgzzPtZUjJjMLud83Rzu4VdRQ9WPZf5vBzV6bxYa2xjinqb9TMng9KWeB
         4EqH4DmqD6o5ta2vckpte0UmDPoUeHwYDSeBgiNa3Y15e7cTom2rUa8MH2YdtXGOFts2
         mDNk3m9kd6TmZkRs70Z6QSocq07kMto1yuO4hfiDKMD21QsYK9jRe8F2o950NYmKbUzD
         fBLwUFUkh/zeEouTDwamUVH7US6oMRHrTV5lNEaWN2fzttYm2cispeEWUrNUJPZHaY2P
         XmiJ8z2/KcL9WDh5DEdGzlT+XVeD6RZM+1V0WG+6T4KRAF6ZN4Kfvdqo9HoKb4TeeZ6d
         UHIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0/0Xwdm3SkTbF8/7kpz9n22iXIQFnb8wVnCm3378ZWnkvXSOJlPI/RzT1T89w+c6LaiPfUi6May8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzeibDFSy0ussCy8yHRgz6iPfgGeeEgD6GlN8dpZUQ70vDTW4N3
	cu32/F3YBG3sadZ1sjcMIFmymG4CC/tzbOdRT7rGVnWNh7Xl0TVd39PKOf5TQ6WRKw==
X-Gm-Gg: ASbGncvGv8BuZxzZHDHiwPFvqk0NLruKSISuir5VkLrkup8kkgdXRegC7sjolCL+/jk
	dFykyWXuGR+5CVr8epQKA8HsdrhLSLY6EdImbUz6Z/UgHLaEUO+Rlw0fOXEt4tnu8C/qU+BoKFd
	W/c1i8H2BAJqNGW98FTIxyxdznQYFc8y59ZPWZ/Glbn3LSCZdxY10r6sN4mwDBTarF1XGzBYGoT
	IBeXHZlp6lJH85pZ/K+MMnU3f5YN88j+VGlKEbXZf+GKFXefzndjniP5T5VaWsoja7q+PvXvPjv
	hc8lXPr86XHvo4uwMFadSI/ZBdQUFNPjAnYfa+7rDp3Vb+Fj9SR5F78ala9KPJ24QU+faNWMm7G
	pg9gMarsbc0T4K8fV4xh1/6YMlczyb3Bp8yWfr/Kb5JxqjY5iRdn30/Pg5zr884jtDrutUmBHDD
	5W5gFNj96b0yAgFFENtKPJxfMSfM6x7exznwAO7smfdo2feP6644u8fht7T2wRcAdzbG/ODIo=
X-Google-Smtp-Source: AGHT+IF4e6N+sq27wDRbftssM26SbbP6YQo7PueenXhfvQCJFI1c3mB+LIUeH0UdqmgxuDNdBfUVyQ==
X-Received: by 2002:a5d:5d13:0:b0:425:7313:b561 with SMTP id ffacd0b85a97d-4266e8e5115mr20596418f8f.63.1760615476289;
        Thu, 16 Oct 2025 04:51:16 -0700 (PDT)
Message-ID: <81c56c9c-882e-4433-b41a-6952315efa25@suse.com>
Date: Thu, 16 Oct 2025 13:51:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] libxl: make gentypes.py compatible with Python
 older than 3.9
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <751bb140-3f00-47f1-9492-464c01ea1429@suse.com>
 <ce0bc10e-cef2-4c74-9fd2-9301416754b1@citrix.com>
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
In-Reply-To: <ce0bc10e-cef2-4c74-9fd2-9301416754b1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.10.2025 13:45, Andrew Cooper wrote:
> On 16/10/2025 12:22 pm, Jan Beulich wrote:
>> removeprefix() was added only in 3.9. As long as the "jso_sub_" prefix is
>> always going to be there anyway, switch to a less specific but more
>> compatible construct.
>>
>> Fixes: f6c6f2679d49 ("libxl: libxl__object_to_json() to json-c")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Sadly this is only the tip of the iceberg. Some minimum version of the
>> json-c library is apparently needed for the toolstack to build, but no
>> minimum version is being checked for.
> 
> Well, this is why we have release candidates, and a bug queue.
> 
>>
>> --- a/tools/libs/light/gentypes.py
>> +++ b/tools/libs/light/gentypes.py
>> @@ -384,7 +384,7 @@ def libxl_C_type_gen_jso(ty, v, indent =
>>          s += "int rc;\n"
>>          sub_scope_object = "jso_sub_1"
>>      else:
>> -        sub_scope_object = "jso_sub_%d" % (1+int(scope_object.removeprefix("jso_sub_")))
>> +        sub_scope_object = "jso_sub_%d" % (1+int(scope_object[8:]))
> 
> This isn't quite an equivalent change.

Yes, as said in the description.

>  You want:
> 
> def removeprefix(s, p): # Py < 3.9 compat
>     if s.startswith(p):
>         return s[len(p):]
>     return s
> 
> at the top level somewhere, and to call removeprefix(scope_object,
> "jso_sub_") here.

I first thought of doing something like this, but then didn't really see why
we would need such. If the prefix is anything else, the original construct
wouldn't work anyway (I expect an exception would be raised unless the incoming
string was itself consisting of only digits).

Jan

