Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EA186AAF3
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 10:10:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686430.1068446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfFxA-0006VK-3N; Wed, 28 Feb 2024 09:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686430.1068446; Wed, 28 Feb 2024 09:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfFx9-0006Sa-VT; Wed, 28 Feb 2024 09:10:15 +0000
Received: by outflank-mailman (input) for mailman id 686430;
 Wed, 28 Feb 2024 09:10:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfFx8-0006SS-Rw
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 09:10:14 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e672aba-d619-11ee-afd7-a90da7624cb6;
 Wed, 28 Feb 2024 10:10:13 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a3e6f79e83dso613775866b.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 01:10:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 he37-20020a1709073da500b00a3e51df2280sm1598788ejc.223.2024.02.28.01.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 01:10:12 -0800 (PST)
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
X-Inumbo-ID: 2e672aba-d619-11ee-afd7-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709111413; x=1709716213; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6BxTp3fIYjYk9mhDu7zbmBjT4KnrNQ7URUXMzdcEneg=;
        b=OLJfUW85JnZvyiIRKWbaP2be0eecXfQfhIJ28gOqKA951N4beu9rSaxA3mEkxVk6iX
         3PgNUwI3n/CF00KkK5qqUTAm+3eIUfHKDsUrNO8bLJDigkwO6I6QYqpoo5r46Hlehjot
         z8ke9yznb6ibS7M1N3FMUUo3HOOoI+xbFH+Hm7/Z6jetvetkxxJ34aJv7puN+dKqRpFp
         K8DtogaMLwm6KX6oLs0BiqyuL+HbA63Wul1IUtptuVZmbIhMflFSw33JJV8sEAdTPJx2
         NjVVbyb7931awtUaoM8mI2deS4Mbm1ifMJrWfJDlRP/P8GyrSpfO5lpXtkxpwlqu80b+
         6+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709111413; x=1709716213;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6BxTp3fIYjYk9mhDu7zbmBjT4KnrNQ7URUXMzdcEneg=;
        b=cEvhAcUSTXBvKpAGMRvPkdsQVycAakfoe4e6An9ZYGfBx2142RIn2lJlW/W78rQmHM
         VtCPvEjYriKdT/o+BHPu1iJ33cooWjKlwNL2bY9pPuP5XrwL264SyxM3POK1DvxJNHjX
         Pi/SpxNCr6TTVfombS5bo0igBtIRVnh7z3BDpQ/7CiwBH7IOPwj6eTzr6bN+dmf1lGNI
         55nBMSGYkzjKCCiD6G5l7WNze32yeF3L1eMf9r/n336tP8AXoW8uq23vmuwXQXdlX8Jd
         YRDjLqSmc/L4yINwn7YRHX4KNrkupM3q8gVWvV+kDv2o2Oy2NP+At7qfUtftZ1mFPnMD
         HnLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNCeo53QiCGgAajyJTumPfWmhA9FBvLux39rtoYplx3DnGXCP5KMbijSZRLptJu5z8xE6tQinp0JTsbhper/3++NJ/diMEBlfTuL2+THQ=
X-Gm-Message-State: AOJu0Yyiy56piklB8PKUVWyJswuTV4yolq5mf70JQKmzzdGy+OvDuoFs
	AYdMY0GlqdmxYgnlL0tPteZYjPJugv1qbxTtqlLwLvM2QUmUZbJ5/aJ23PdVTA==
X-Google-Smtp-Source: AGHT+IG6YRx/4CTeETPale057kTXHxFTbbgMM0y7NPCOG2ytcYGW/Px+F7LNY0QM0llYr5ivFsfRxg==
X-Received: by 2002:a17:906:34cb:b0:a3f:7e1:5166 with SMTP id h11-20020a17090634cb00b00a3f07e15166mr8086118ejb.10.1709111413181;
        Wed, 28 Feb 2024 01:10:13 -0800 (PST)
Message-ID: <654dc3e7-b7c3-439a-b784-38834989bd43@suse.com>
Date: Wed, 28 Feb 2024 10:10:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Resync intel-family.h from Linux
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240227160940.2054111-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240227160940.2054111-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.02.2024 17:09, Andrew Cooper wrote:
> From v6.8-rc8

Typo or time leap? There wasn't even rc7 yet ...

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



