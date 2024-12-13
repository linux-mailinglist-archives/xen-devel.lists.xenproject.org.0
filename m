Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 613A39F0912
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 11:08:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856512.1269107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM2b5-0001c4-9E; Fri, 13 Dec 2024 10:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856512.1269107; Fri, 13 Dec 2024 10:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM2b5-0001ZH-6c; Fri, 13 Dec 2024 10:08:35 +0000
Received: by outflank-mailman (input) for mailman id 856512;
 Fri, 13 Dec 2024 10:08:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tM2b3-0001Z9-M4
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 10:08:33 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34c295fd-b93a-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 11:08:31 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d0d32cd31aso1882633a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 02:08:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa67a4f8dc2sm773572466b.179.2024.12.13.02.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 02:08:30 -0800 (PST)
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
X-Inumbo-ID: 34c295fd-b93a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734084511; x=1734689311; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LRSpUNKBeXZVxNb/VM3hMwYQFc91eslLe3UGCA9xs9k=;
        b=J24wgW5TWtxnWkbapn+TaTGjPnLMU32uormcESPdcVIXT3H/WS/d6GeGHoFfqAhgEE
         DC7IucOFJ5zNG6T4PpQzfU3uIAFQDCvdjx6l2ace50ng8GTucQ6Rz2+z0guJj5tOdNtH
         zFSUSurcWTifsKB8CqT0WCUgInW4g/uh/aZ+7ANqmQP5RCiGUqqV7t0q7kNpGeSl1EM+
         xu2YKcWs7NKMMWRmVNPWB2m31OSaS9p/+rXBqQ0YWHwnIOKKnFX0YTIx8SZknbvUbEP/
         FZckRf0s1fukyJ9/htUAhLs1e3jxoxVipqe7NTJozqME1vb0FUCS52e2vgTbKJdsUm41
         a0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734084511; x=1734689311;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRSpUNKBeXZVxNb/VM3hMwYQFc91eslLe3UGCA9xs9k=;
        b=QOONBQ3dmCyJCcPiYRwS4hZNyXoUs25gX+IHCLZ59c3rRWPngXhB66h9ppwBNLlM3i
         EV52gJHbqTB7gwn5GiIYJ+CNIdJQa49jG3axQiK7ivSb5pvTRv3fzd5IocRHxspIjPGA
         IuNrbKKnjdVqPE7twVrs0rYvQOLy6mIAbk+qv8y+wOXJ7qzDcZK2ceS07wdIFd7DQcqI
         m+o0kW2MsG4s+rLO5h9Cqtrt2q9Pw2Js05CGwojhkgwdLamrBuz1B3DWz+wv6je78UIG
         Uys1JhB6xXwl2EjXAi7lor8BfDFQ9KNE380u5lFOfE/phZTIBSoJYMp+D9iMBgWOnvi3
         9ddw==
X-Forwarded-Encrypted: i=1; AJvYcCUx+7sT9m28bKVdb+6BY/ILi5VvVYwbvhtp7oh/0OG3Ds97A860ofgozQRHO+3wxEku2Luu3kfRP9k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlFJWhxBTMaPjzOq2Ts0Y/Q65Q+3vVZ3rGAvrtFkEFJbLX0cVc
	lVVDC4rKDZRrPgAxdLhr9bgXcEVUKt/MyfiMXrdX5H2PQrbvqJgijVJBw7uiIA==
X-Gm-Gg: ASbGncsBl1+yhlt5FQBS779CejvAwdClzuzkt4b0K7j5EdT6fy+C/nuQqVajsSRllN0
	wsxfomNtwF87SyGJAFiIB4KYpEFyDSpns9F34FhLULAWn3P7YGk/GzNmXK3o7vIb9y3MV29aUfI
	6HD4i9CCnPjKSdp1rSlLaPwb/LTUaKyU2H3HnyP9m71SSt2qgSnaLzZJ/hR8CJlpEtDw5Om9Qrg
	UQNV3y8XeF11PHc813j76aOQoGBuWuyT0UQ6vz9VYLabnwUqdTI2UMfT8SgKQWfMd1n7UAnLQKh
	Ib0/ifhcn5RbeOiywKc3pBtI2uehtkSdBVz65Zx5aw==
X-Google-Smtp-Source: AGHT+IFzFWfWlqgH46qYmeUkjwgn8S0sfvbujyPMwoPMydDyLxsGed0L8FiLFHptOqzr15vTs8QubQ==
X-Received: by 2002:a05:6402:35c2:b0:5d0:d3eb:a78f with SMTP id 4fb4d7f45d1cf-5d63c157955mr4467272a12.0.1734084511143;
        Fri, 13 Dec 2024 02:08:31 -0800 (PST)
Message-ID: <d4b988aa-48f8-4e35-bb7d-49c2a9d532e6@suse.com>
Date: Fri, 13 Dec 2024 11:08:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: address violation of MISRA C Rule 11.1
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 consulting@bugseng.com, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <7debd63f3900bad62bcbcc03081e4c04e6099135.1733914487.git.alessandro.zucchelli@bugseng.com>
 <bded3d90-0644-46c2-a43e-d6b06faa5650@suse.com>
 <alpine.DEB.2.22.394.2412111826440.463523@ubuntu-linux-20-04-desktop>
 <26600bb0-93af-45b5-a341-5771bad844a1@suse.com>
 <alpine.DEB.2.22.394.2412121647450.463523@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2412121647450.463523@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.12.2024 01:53, Stefano Stabellini wrote:
> On Thu, 12 Dec 2024, Jan Beulich wrote:
>> On 12.12.2024 03:27, Stefano Stabellini wrote:
>>> On Wed, 11 Dec 2024, Jan Beulich wrote:
>>>> On 11.12.2024 12:02, Alessandro Zucchelli wrote:
>>>>> Rule 11.1 states as following: "Conversions shall not be performed
>>>>> between a pointer to a function and any other type".
>>>>>
>>>>> Functions "__machine_restart" and "__machine_halt" in "x86/shutdown.c"
>>>>> and "halt_this_cpu" in "arm/shutdown.c" are defined as noreturn
>>>>> functions and subsequently passed as parameters to function calls.
>>>>> This violates the rule in Clang, where the "noreturn" attribute is
>>>>> considered part of the function"s type.
>>>>
>>>> I'm unaware of build issues with Clang, hence can you clarify how Clang's
>>>> view comes into play here? In principle various attributes ought to be
>>>> part of a function's type; iirc that's also the case for gcc. Yet how
>>>> that matters to Eclair is still entirely unclear to me.
>>>>
>>>>> By removing the "noreturn"
>>>>> attribbute and replacing it with uses of the ASSERT_UNREACHABLE macro,
>>>>> these violations are addressed.
>>>>
>>>> Papered over, I'd say. What about release builds, for example?
>>>>
>>>> Deleting the attribute also has a clear downside documentation-wise. If
>>>> we really mean to remove them from what the compiler gets to see, I think
>>>> we ought to still retain them in commented-out shape.
>>>
>>> Another option would be to #define noreturn to nothing for ECLAIR builds ?
>>
>> That again would feel like papering over things. Plus I don't know if that's
>> an option at all.
> 
> What is "papering over" and what is a "nice solution" is often up to the
> personal opinions.
> 
> From my point of view, Alessandro's patch doesn't make the code worse.
> The ASSERT_UNREACHABLE solution is OK. I do agree with you that it
> should not be required for us to remove "noreturn", but I don't think we
> have used it consistently anyway across the Xen codebase.
> ASSERT_UNREACHABLE is also a form of documentation that the function
> does not return.
> 
> In conclusion, I think all three options are acceptable:
> 1) this patch as is
> 2) this patch plus /* noreturn */ as a comment
> 3) #define noreturn to nothing just for ECLAIR builds
> 
> I don't mind either way, maybe option 2) is the best compromise.

The variant with least impact on what we currently have (generated code
wise) is 3), though, which hence would be my preference (well, not exactly
a preference, but the least bad one).

Jan

