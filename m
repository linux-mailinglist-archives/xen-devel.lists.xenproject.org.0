Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BE6879254
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 11:44:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691750.1078038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzbj-0001WC-G1; Tue, 12 Mar 2024 10:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691750.1078038; Tue, 12 Mar 2024 10:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzbj-0001Ty-D9; Tue, 12 Mar 2024 10:43:43 +0000
Received: by outflank-mailman (input) for mailman id 691750;
 Tue, 12 Mar 2024 10:43:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjzbi-0001Ts-GL
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 10:43:42 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6409958a-e05d-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 11:43:41 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56829f41f81so5951562a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 03:43:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 el9-20020a056402360900b005680901f82dsm3825076edb.64.2024.03.12.03.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 03:43:40 -0700 (PDT)
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
X-Inumbo-ID: 6409958a-e05d-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710240220; x=1710845020; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+akJXHpgWaKevayBSjDyJFXSNvF4Bj8a+Qoj4DJiGus=;
        b=FbGp70910pFNmJGSZYspIW7vT2Ewd8I7EW+gIA5ti1bEoTBETlQAWopxA2BCO3HxBX
         XVH4Z/Vsj/p0CwOVwaYh7bs0obSo06dXlFbm+UKY0VBF9d+7/DYboIRpSpFWGsCzrRCM
         yWavb5DUeG6OtTUNJrEr2m41yCYzB15T2QIk2f0s9ZC3FlUy9yRN2/1GrF1cWuwY7S2T
         pMrYXlijgWkS40R7m6I2YWL13DTiRFLT8tJ0QYgWijzJ0wdrjfuJ03/JAqhZjDltVVjY
         j8XQKMfpJBrUefc2yY8ktjrANvMQBbH5mTJs6d4ezmmML4IfNUpw5DDaSbI30alamYe2
         gTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710240220; x=1710845020;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+akJXHpgWaKevayBSjDyJFXSNvF4Bj8a+Qoj4DJiGus=;
        b=KNelK5HlCRqBrB7tQMoWT0yai2hNvshE3Go1Yc1Td/KGJuRI+RJj+vESzZR9qjrOfM
         ISLNfSY/9yHbiGDseNS5/Ii+QLX4FRdJVGmhvQCtwRkUBYzSs22+7QrWuLLeyqO62dvk
         AYZcM10H9QrEbGH7+jFkB5vv43yfVcnI5xetGbi3N++oLxys8red8EaAX1ZVJQKasbx2
         +ayO8Ev4vBBoqP3kAT/CLkM1LBgowbUpCf/u9Pj3fUk92Jy4UaRmunMXRsARPBXZ6Lam
         77Vn8e0r4tePsZknuZx+dAEvvXkAxg4jHWGhCgq+Su1dBJkEkgZl5Abv7uv/pGupjFie
         DS8w==
X-Forwarded-Encrypted: i=1; AJvYcCU7S7hvpOwyHwZwSyMKrWSce5XtA3LqNs4wUESG6jBPMJFVphbH+/vTR/7Jhd+Rv123dbQ/827JkHHaHh9rWClS6Q0M2BKXFWn2SqaeppA=
X-Gm-Message-State: AOJu0YxYWiveYZQ7T2sVYGDOwe+ShChUClMqypID8nb4kYJ1MvOgUfPb
	IXVomQCa7GuZ48hmT4Dq/YA53MRsavw8wplXTkecJBOxrHKK/zwxJFd79WFG8w==
X-Google-Smtp-Source: AGHT+IFU+mabnlHPmGw4W+UkuSwE+5wGPZYSlb6cSZ6q8wqMZ5ADXuapaYUPQpT5rF0pnmMrwGFyJw==
X-Received: by 2002:a50:baa4:0:b0:564:71:ccf0 with SMTP id x33-20020a50baa4000000b005640071ccf0mr6084452ede.2.1710240220639;
        Tue, 12 Mar 2024 03:43:40 -0700 (PDT)
Message-ID: <5bf4120f-3cc5-44b2-994f-fbdb85054a49@suse.com>
Date: Tue, 12 Mar 2024 11:43:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86+Arm: drop (rename) __virt_to_maddr() /
 __maddr_to_virt()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f7b82e17-8282-400b-a6c2-b74761bbd6ce@suse.com>
 <cb41fa55-5c05-4156-87d8-1ef1c2bf5ce5@xen.org>
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
In-Reply-To: <cb41fa55-5c05-4156-87d8-1ef1c2bf5ce5@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2024 11:33, Julien Grall wrote:
> Hi Jan,
> 
> On 12/03/2024 10:27, Jan Beulich wrote:
>> There's no use of them anymore except in the definitions of the non-
>> underscore-prefixed aliases.
>>
>> On Arm convert the (renamed) inline function to a macro.
>>
>> On x86 rename the inline functions, adjust the virt_to_maddr() #define,
>> and purge the maddr_to_virt() one, thus eliminating a bogus cast which
>> would have allowed the passing of a pointer type variable into
>> maddr_to_virt() to go silently.
>>
>> No functional change intended.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> v2: Avoid aliasing macro on Arm.
> 
> Interesting, I was expecting x86 to follow the same approach. I don't 
> quite understand the benefit of the aliasing here but at the same time I 
> don't maintain it.

In the absence of respective feedback from x86 maintainers I had to guess
what would be preferred, and my guessing is that retaining inline functions
where we can use them would be preferred. If that turned out wrong, I'd
then switch to purely a macro on x86 too.

> So for Arm (only):
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks.

Jan

