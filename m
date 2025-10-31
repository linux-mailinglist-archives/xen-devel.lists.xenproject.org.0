Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D218C25092
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 13:36:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154265.1484348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEoMQ-00007T-8p; Fri, 31 Oct 2025 12:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154265.1484348; Fri, 31 Oct 2025 12:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEoMQ-00005J-5z; Fri, 31 Oct 2025 12:36:06 +0000
Received: by outflank-mailman (input) for mailman id 1154265;
 Fri, 31 Oct 2025 12:36:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vEoMO-0007wF-EB
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 12:36:04 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 296bc190-b656-11f0-980a-7dc792cee155;
 Fri, 31 Oct 2025 13:36:02 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4710022571cso23480335e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Oct 2025 05:36:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c1142e7dsm3373697f8f.17.2025.10.31.05.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 05:36:01 -0700 (PDT)
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
X-Inumbo-ID: 296bc190-b656-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761914162; x=1762518962; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MepbcA/2+XSf1XNT3X8pZwp2/iwXw3E1VQe9DOsNm3U=;
        b=Zo8iq+woBCktNCCtvkFe4H9JezaR7tV70sGrE30Zrv8ZCo1mpCNlQBCz2Owts2lI8B
         UWTjv0lbiWzq5gyIpUGOpDyX1Hb6pl4QQ+POwdkHaBDNNLUQ5G5LG1pPSTI+y5nx/0Ma
         xgqqy9RxOywrI6rVr+ToCeGhFpYktDXopMr7SwOWRK197BJPWN8bhh4e0CbcPFwI81cE
         YN3Ei1RD3YLSHvHQ8i1zZgZ+ZsPJbnebpE7Csq+rWHbr+5kL1FgeT3E2Whpr0vBMFoWT
         8nJE3K5eYjwnwfAYg95WPd9ikeujFaWOVUQ6PQxm92l8h7VF80gYCF4kebv+PiK+Nm9V
         +tFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761914162; x=1762518962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MepbcA/2+XSf1XNT3X8pZwp2/iwXw3E1VQe9DOsNm3U=;
        b=wXZmWCuGtS6aT5/O7Sh6t6kmyzsOkIBCDxjapv7PXIY/SMFqSscfQTOUgl5cgtoONx
         8x+lCr7Xt3JOUNyX6a9pYUYv7Y9VEiaQnW8kvkKiAW22nX6CY4fgkKBNSuE58xIrUbg0
         z+OSMKdGUguZWaG84UNxYnj/68Ylzo1/TFXBjaxWcNxVksQL8ELrzizcZ9WxOhwJ456g
         Geyf8tNk11YIEqdhkOd6ssBV19yWGg/+D2CLc8oPyqSDd6mOCxQ3G79/jdyjmBMvumk8
         de1cs83RxzP38pdAZ/uObNlP8aRs208hwXH6nWyYoR//PMxyjiFh04mgG3VFLbG89+sp
         OFvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcENKKa+ArUxby2acOgfhZREdhS6oNW8jLCgqt4OpGrEUGCcB7B2G1FbCmonDx1OeJ03K9FzEAMgo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlYMRMGEC5jSdFJHG4SEsHLJKzDccf2aWkDxtli3csPMUW+F9T
	sJi+ZE8+I3ZSrm9pYYlzGoovmux+pRGnrQtADUUhyUWQAXzdDD6e/1KD1PU18V1s+w==
X-Gm-Gg: ASbGnctRhSp6uHezzFLCgdtHX06n3l0CFsBUARSebk4HQtuKFv2coyAS+Z/j6SyzKIH
	3k3mNLI9sfokMPu2fh2w/nkr0JUsxqnvdK70rmVZ1l7WLdfAxp8I74PrBvB1KB6sYbTzTPmN9qK
	kMwH7QLZa2l6zz5BVNLPbuUyTqQIN7GHJaVJqPmtbOhM4WLG/Xq8orm8ixij9GZgrvUDIeJ34hI
	QPh5VEMILpS7XMhNJcyki8gzsTdlOfHFnkMoJwU/6kXS6kQHqnIoW12ljmW956B+mSGbBC2Raeq
	lKB5AagKG92Tl1SrDdzecf5MS9Pvna6EJAA94ZW/AKznXU7HkLLEzYH93D8NuKU4C3s5taog0TC
	gzLO5mdvTW6NygErzS4H9s1gQyEqAbi+s4OgUUiAobGs7qj4MLFyxZ6zUTYSESmZobkBzTWdJsF
	/mK9ABZEUuxqxItvRPl58K4c6YfcmNBLDJClpyRbEa+wyYOZK4B+Jbte6yzc0UG/NfFAs2cSA=
X-Google-Smtp-Source: AGHT+IEUQ4kgYdJGsOP72IorQnEmuYtBiAQw5uZDSuGGJpcfvqXXec+m5DsjJYHPVSBfsbAK1CKjJg==
X-Received: by 2002:a05:600c:6389:b0:475:de05:6611 with SMTP id 5b1f17b1804b1-47730793c68mr33223895e9.7.1761914162243;
        Fri, 31 Oct 2025 05:36:02 -0700 (PDT)
Message-ID: <32623b69-3171-44e6-8fdf-ea67e7838b00@suse.com>
Date: Fri, 31 Oct 2025 13:36:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: remove references to
 docs/misc/kconfig{,-language}.txt files
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6f72dcebf5dbb69e9496b7f0ef96198e9bb9f1e9.1761745058.git.dmytro_prokopchuk1@epam.com>
 <9f264a58-9ca2-4323-8f79-edabe70a07a0@suse.com>
 <98fc0e0c-f298-4252-8e7d-f49af56146b6@epam.com>
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
In-Reply-To: <98fc0e0c-f298-4252-8e7d-f49af56146b6@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.10.2025 13:04, Dmytro Prokopchuk1 wrote:
> On 10/29/25 15:57, Jan Beulich wrote:
>> On 29.10.2025 14:38, Dmytro Prokopchuk1 wrote:
>>> These files 'docs/misc/kconfig{,-language}.txt' were deleted, but
>>> references are still present in Xen. Remove them to clean-up.
>>>
>>> Fixes: f80fe2b34f08 ("xen: Update Kconfig to Linux v5.4")
>>
>> Hmm, that commit replaced the .txt files with .rst ones, so maybe you want a
>> 2nd tag here referencing 044503f61c95 ("docs: Delete kconfig docs to fix
>> licensing violation")?
> Well, I saw that commit, but intentionally selected first one.
> Looks like commit 044503f61c95 is more appropriate.

I'd suggest to keep the other one as well.

Jan

