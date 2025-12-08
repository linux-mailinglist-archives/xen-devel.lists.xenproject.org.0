Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A5CCAD964
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 16:28:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180866.1503975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSd9J-00033B-9T; Mon, 08 Dec 2025 15:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180866.1503975; Mon, 08 Dec 2025 15:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSd9J-00031k-6Q; Mon, 08 Dec 2025 15:27:41 +0000
Received: by outflank-mailman (input) for mailman id 1180866;
 Mon, 08 Dec 2025 15:27:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSd9G-00030R-Vb
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 15:27:38 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c70eb7b-d44a-11f0-9cce-f158ae23cfc8;
 Mon, 08 Dec 2025 16:27:36 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42e33956e76so2094566f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 07:27:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d331aeasm26029604f8f.37.2025.12.08.07.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 07:27:35 -0800 (PST)
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
X-Inumbo-ID: 6c70eb7b-d44a-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765207655; x=1765812455; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X21/XsyGOixSLXeIFRS7tmetW67PlpexqjAb0yia/28=;
        b=dPSjixzDUDoFNcPnNvgFbTNjG3MUSCM0ETsI7uQupd/Rx2cwI//kL7GQ/7ThoYCIEx
         QspeFiocWSTD1KgO2zYjGzouf4dPOauCMIwHCbTClsF0RB2lz4y5WAuEO+six1s1SGic
         NYVMZ8UTDguGJrD9TUujIZR3ukXeToJIPyEADUjqhPrmGMckP347BjN6KYDXzCvOQwe1
         PC8ZJNY3tZHoXMqXBNNetOf4+Ue5UkBuPsN+1jGF0mAHRwqbMYv0jTAlll6b2U3giQPg
         5b2o7vH9HcYTIchdFzf3jnHDVM7opgXMXAjhtF4Jq31tZSlyrKCdKg3yPqqCq+3SnIoD
         Ecbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765207655; x=1765812455;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X21/XsyGOixSLXeIFRS7tmetW67PlpexqjAb0yia/28=;
        b=JdsXRJkM5qW/SMbMEfNjr+P84oeNVWxau30+JGNaggcdYSMGaYqIbiin+0+kLE9bfR
         C92fResrOkgu69Ntj0JbbC0TV/cFvP+opKtSdF4ODdrQeRtd9WwXuP6wwxMp7A46Vci4
         xLvQe7iKrTk6W7NcPYD58EFFGGqsz4c2MmhWRtQyMs0k5/oqkmN0OThcCISrpYn5VCM1
         pTU4R8FmPehDTEJ0H6RSj9fj6m78pykCiYD/aY+4xP88ZC6jLBCNL/B7YbH808lV3fIx
         ZPObigOYgBC75j+x8NvBgV+QiQ7HDPoEMBdMIS+4jW1zogCjf8SDw2X6PEkbSGB0zOs6
         P+7w==
X-Forwarded-Encrypted: i=1; AJvYcCWc5EPhxIVjZtAPTCHIeKHE+rEJNAvusjbDzH9Ozc0gVZK8Fhr9+8v9xUZJ4NAevB5gQyT/dFdV5us=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxffz0ZEyGjuyYZZGrXLyHQ/kjh6nKPw5GcUH16BXGe7mgIFsjR
	zvn2RcmH6PH/4JtHAqHl3bUyDZpG2oPUyQ+610GgZBb5i9vUmZlDgNLS9bDvbjTA8A==
X-Gm-Gg: ASbGncuh/XrOsroS7lBikkCcMhfv3SfU69Y6CYqws7qGF6eLfL4BrybftDrFynatfSI
	mi9L0Fzn4QpMtiHyyXZ3fR8YTwKfO1sGh6JTATgmuLb9NgmFaQP55Gu2stVRulWXJxNnwzpAyhn
	gZGqGfoIvWV0Yt/max3aiGIJH6oBeHB3ah7PNmUd4tQeIe1ZGIO8VqOEaOfMgaogmvVufl9z4Jj
	Fmsoo+AP7twLsA+lmMqNksOdMjbY3IH7CL8MJPBMlgLytOSucgb3adxpcA5uwVAeLjUE+w8FnNk
	D/VgCxvUe7vYeux687rwuTOZ0Ka3TzeKY4u4ju+pE9Yh1GCDKh84GX0gwxWWpC58PQ5GIbnGc5q
	9Q6meRSGFoVv8Kcyl0oZmb1VLF/KEa4mnoydY1GLnM2CiYUZOEgrpLapjxlWy29hrv/A7AQyNNv
	9K+Q5zd0EPep9S1qXo71ycTnalD3dMH0CZj1FYcR0iYNE5TQGH7Vl/EcgBzCHJgu0lG63bj2wFM
	gXLTuYdOgzMzw==
X-Google-Smtp-Source: AGHT+IGLZliiqhzXMGk3WimZGjk7T5GDPTYLNjrAnxc3a7YY6GkeSsHOdg6I4t7KmoGnFlk45CpQOw==
X-Received: by 2002:a05:6000:2905:b0:42b:5521:31c6 with SMTP id ffacd0b85a97d-42f89f63592mr9003462f8f.54.1765207655536;
        Mon, 08 Dec 2025 07:27:35 -0800 (PST)
Message-ID: <90711e71-d9e1-486f-bf66-74cc0866e913@suse.com>
Date: Mon, 8 Dec 2025 16:27:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] symbols: drop symbols-dummy.c
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
 <639fb816-c2f6-45d6-9081-238a6b3c5c08@suse.com>
 <ae96860a-02b2-4ae1-ae98-eba0b749ff90@suse.com>
 <47070C53-9EAE-48F8-BACE-B554BAF2DFA2@arm.com>
 <265bbc9b-d9e6-4e1c-b59d-cf77fb4d6786@suse.com>
 <ADB858CD-D8B3-474A-8E1C-1FDB415D51D2@arm.com>
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
In-Reply-To: <ADB858CD-D8B3-474A-8E1C-1FDB415D51D2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.12.2025 16:19, Luca Fancellu wrote:
>>>> Now this is (to me at least) absurd: I'm removing a file, just to find the pipeline
>>>> fails because cppcheck doesn't like docs/misra/exclude-list.json containing a
>>>> reference to a non-existing file.
>>>>
>>>> I'll amend the commit with
>>>>
>>>> --- a/docs/misra/exclude-list.json
>>>> +++ b/docs/misra/exclude-list.json
>>>> @@ -170,10 +170,6 @@
>>>>            "comment": "Imported from Linux, ignore for now"
>>>>        },
>>>>        {
>>>> -            "rel_path": "common/symbols-dummy.c",
>>>> -            "comment": "The resulting code is not included in the final Xen binary, ignore for now"
>>>> -        },
>>>> -        {
>>>>            "rel_path": "crypto/*",
>>>>            "comment": "Origin is external and documented in crypto/README.source"
>>>>        },
>>>>
>>>> but I think such tidying should be optional.
>>>
>>> Can you share the error?
>>
>> + xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra -- -j16
>> ERROR: Issue with reading file /builds/xen-project/hardware/xen-staging/docs/misra/exclude-list.json: Malformed path: common/symbols-dummy.c refers to /builds/xen-project/hardware/xen-staging/xen/common/symbols-dummy.c that does not exists
> 
> Oh ok I see, seems to me a good feedback from the tool to keep everything consistent.

Well. If I remove a file from the xen/ subtree, then seeing empty grep output on that
subtree should allow me to be sufficiently sure that no problematic (as in: breaking
the build) references have survived.

Plus while I agree that consistency is desirable to have here, is a stale file ref
really a reason to cause a build to fail? Wouldn't a warning suffice?

How many tools' behaviors can we (as developers, reviewers, and committers) keep in
mind when putting together otherwise simple changes?

Jan

