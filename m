Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A447894EF0
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 11:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700069.1092640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rragH-0007Zk-Nf; Tue, 02 Apr 2024 09:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700069.1092640; Tue, 02 Apr 2024 09:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rragH-0007Wp-L3; Tue, 02 Apr 2024 09:43:49 +0000
Received: by outflank-mailman (input) for mailman id 700069;
 Tue, 02 Apr 2024 09:43:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hiiI=LH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rragF-0007Wj-VU
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 09:43:47 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f93586f-f0d5-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 11:43:45 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-415515178ceso23585315e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 02:43:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c4f4600b004147db8a91asm20541587wmq.40.2024.04.02.02.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 02:43:44 -0700 (PDT)
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
X-Inumbo-ID: 7f93586f-f0d5-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712051025; x=1712655825; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m7JX+nqVaEyKH5zglSH0f6PgIaauSCZx8dBDeFNQ2+U=;
        b=HrR2lBfc012Fa31Rn6LUGyOBsKT+MFOV1T0QBUbUx02bcENaC55PiuqTSxp/lIOdUR
         TKcT64Kh30wUGu9nfOUM8cKva5h0K0EgA+4DAaKYu1c7tPH0vtQVwiPXLz9a4JuKMtkd
         ILUMWY6TSKKcnBSGoKw0LS36G88qPIMSQLvLU1Y4NNlTwMZaq1KHx408exWi6aOn8Umo
         t/0GVYxGKV1Xm/zJH/o2QyZ+r8XUW1vnCDoYz6T4TrMeFUwQvx60gSTiu7DuFpL339+o
         r+KgiFQMopyipNt6beg/H9p0oTxNxbHLMc9i+0NmMu7AElERyW6+3/DKFxAMGaHatZjD
         mxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051025; x=1712655825;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7JX+nqVaEyKH5zglSH0f6PgIaauSCZx8dBDeFNQ2+U=;
        b=XogbgQLpLWnHoqL4OZTVZTaJYyLVUZFZY9Sm8Q83lPYtCm0GWvI0fKi8UgQMf8m8is
         cj0yGrY9SmdDczK5UDIBf+U66fgaanCiwnT8tCKeHGyaEpBD3+aLjfrgCbsOmv/CgnG2
         EeWDCKXUiv4qNFoCmVs9fh/TjJwFZM4nrG4qQFCoZ51c7D9iSF8G8z01D6XmiUaB++6K
         hZ46Dk/xAU6jvbXz99gGmvXpq8GksGVty02PC8R4clHDMgTnbjlmqJpspPzUuGeWEMPJ
         ZNLhE/YuKigxfRyvCWUsfIyrzDObVjeVOPhHSUjbzEXMjDAbKMKiNg303RGvKMAPhS+j
         PxiA==
X-Forwarded-Encrypted: i=1; AJvYcCUd05rAOF2sUGsFki7xOIdsejePXp9hwaj1Ed6jvqaOvvHKzwJbIgUfj2ap3Iw62N17rA+I7GUGemCwfwusNZcLohBu9EcpM+x5YjWTV48=
X-Gm-Message-State: AOJu0Yw5/4SejQxIDGENUqG7iMrgASlVtW8ss6x+CeN1NwzXBNN/NkKP
	mo+RM2/7Ny0T/R+b//4c3/OkwqAlUBYOst4myBy0YM5SQzls5zbTfzdRuFXVIg==
X-Google-Smtp-Source: AGHT+IGO3AGxrzcf6dY3W9P/rHABlERuHcXBUsShWYp5b19p0XFQzi1Wif1iVI4Lmead35p2ARvLcA==
X-Received: by 2002:a05:600c:358b:b0:414:8e02:e432 with SMTP id p11-20020a05600c358b00b004148e02e432mr8556624wmq.7.1712051025024;
        Tue, 02 Apr 2024 02:43:45 -0700 (PDT)
Message-ID: <02d072e2-6bf4-4024-b7b6-d5aa0ec13bc1@suse.com>
Date: Tue, 2 Apr 2024 11:43:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/video: add boot_video_info offset generation to
 asm-offsets
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240328153523.4155-1-roger.pau@citrix.com>
 <20240328153523.4155-2-roger.pau@citrix.com>
 <473870c9-1134-4f17-b063-68ac93ad28e0@suse.com>
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
In-Reply-To: <473870c9-1134-4f17-b063-68ac93ad28e0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.04.2024 11:38, Jan Beulich wrote:
> On 28.03.2024 16:35, Roger Pau Monne wrote:
>> Currently the offsets into the boot_video_info struct are manually encoded in
>> video.S, which is fragile.  Generate them in asm-offsets.c and switch the
>> current code to use those instead.
> 
> Just to mention it (without asking for immediate action): Defining boot_vid_info
> in assembly code then is as fragile. Moving to C would likely be problematic
> because it needs to be in the trampoline range. But at least its size should (at
> some point) perhaps better be tied to the C struct's sizeof().

Actually I overlooked that you partly do this. The use of BVI_capabilities there
looks odd to me, though. Why not

        .space  BVI_size - (. - boot_vid_info)

? I realize it becomes just BVI_size in patch 2, but I have some question there,
too.

Jan

> The fields, with
> some effort, could also be converted using the new BVI_* constants. That would
> still leave the field sizes; maybe those could at least be cross-checked by some
> BUILD_BUG_ONs.
> 
> Jan


