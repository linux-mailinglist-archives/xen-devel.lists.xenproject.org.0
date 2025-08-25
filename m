Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18015B34364
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 16:20:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093265.1448798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqY3Z-0008DZ-0y; Mon, 25 Aug 2025 14:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093265.1448798; Mon, 25 Aug 2025 14:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqY3Y-0008BN-UH; Mon, 25 Aug 2025 14:20:20 +0000
Received: by outflank-mailman (input) for mailman id 1093265;
 Mon, 25 Aug 2025 14:20:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqY3X-0008BG-AV
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 14:20:19 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a04836ef-81be-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 16:20:18 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb7ace3baso800641566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 07:20:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe7aad5d61sm259882966b.105.2025.08.25.07.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 07:20:17 -0700 (PDT)
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
X-Inumbo-ID: a04836ef-81be-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756131618; x=1756736418; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kMmdUAg9dKT+h1W/k9SXvDTXrfIiRdp5JxVpR+SFhFI=;
        b=fKkr2jUiSM2F+JUbh0iHGIZ8mfnBJxgI8KGisIOx00QbbqolewdvxFixzRaClxSp9G
         Zv3Ctq5YGq6kyw5lTk20DalXM+DvlTmSAYWX+t48jhrkMN9BpVvUNJhtP3RLg/gSGsrr
         JOtBDssuitEpIzRCSbyWwuRdA93cknytAWdFSUDg9I5lH96PnzLKgLyIq3PqlAFQZ/ac
         s8mTy1eWs2dGxXSHQnbEefIcuKhupHqfu5T8BGu3OIByImPdNU3YfZZqR/dlpmsAmFdS
         znlNAxsZMv9kn4ix/6fmfuMS4fzQCg+6x7fYax2mNqe826nCYOddFDteTYj4l2ZLriFr
         VsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131618; x=1756736418;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMmdUAg9dKT+h1W/k9SXvDTXrfIiRdp5JxVpR+SFhFI=;
        b=MBPK8FhCYpQe8ShwlpFHWntN/BlMDoTdx2MWnbE7bGmpZLTz/ndW662a51QXgXrgyb
         IOEhs5eeFvAd6BJivMFINgWkC/j8y4RjyUvtJypF2BPUgamNKqvju0yxXpmcE1KsJ1eC
         FzUAS4GJeAJPQiHu4V9hGm+/g3R1GYJXDcBPuRYEcXHGxxEO5BrAy1B6AUPEGRniFJMM
         gumjsY2fpGDo+hmJKzUT6rKXF0Y0Y8mq7w618HE+avj/2O7QZUQe+lxN9mCzRaOHSWwS
         cS7fKDDX/X9loMxBCY16z1jYxc9aYH99Rb2/7BPju6hBVvEeSeDqvBdmLpxGLzeFZj61
         6gOA==
X-Forwarded-Encrypted: i=1; AJvYcCUjjIbt2w2E8nxCZ0mS/KEchfzA5UdsathSyEBguXJqYxMDD0wAIjKiRt/MqCeT0nrThhkfqySxHMw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXQmz/P5D6H6ktQIphGVspwHSkXcMGmnPKL0hzHrdn+iHP23o7
	ueAITKEfbtKiWRn1sS+lmyMp5W8aORfqh5XbVsXkz7yTG4ne8FZZcTFWHyw1AJpf1Q==
X-Gm-Gg: ASbGnctr43zYcEFQYcWKqjxjMEnu/AF1oBYub6YLjuPqU3MdEZQolZsN5gXaTzB4SOx
	fDBdTXXm5yXk2BJBW3P2VDLu70le0AB0JV+5KYtJTG++TH4LYZ5hhkqKnK0i7qzE34sUZ/ijLjU
	WZakEjHlJDcle1JZOUZBEHJw9HhmQ99GMeCDaYJWLGSr4XHdXplAZ94/TlUIeFW3KIBaea5wbPg
	xqlGiHuh9z2Z8gH0duZxqLlLnPJpTq06YMEiQX7iNk3dOo1YTBsrYWg4FcEIqu8GotXiyxj51P7
	7rFtyjYmlINX8KpPvS7rI6pZ2kL9n+uUmlcXDwXn1shGWvzDTUtk0izNY+ckuhAyi6co1Q19RHb
	jGq1ups1rDdEpm6jIV4oJ3IaOX5f6ew3FfkxZPUCRhN5f5HJJcEl8Yp94ht4epoXPjShPxzdzZR
	hhzmWiYqijrvg2/s+wFA==
X-Google-Smtp-Source: AGHT+IFUoFhjBSK6UMvgppIid5Sf2Zj3AHBTCmuv5DDvkJlC24Yl++t83W2IBJfDwJxwU40bdT1DRQ==
X-Received: by 2002:a17:906:4784:b0:af9:8c1f:c2b9 with SMTP id a640c23a62f3a-afe28f767bdmr1066510366b.8.1756131617623;
        Mon, 25 Aug 2025 07:20:17 -0700 (PDT)
Message-ID: <49416df6-83c8-4fa3-bf81-2d1e504ef31b@suse.com>
Date: Mon, 25 Aug 2025 16:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, ray.huang@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, Penny Zheng <Penny.Zheng@amd.com>
References: <20250815102728.1340505-1-Penny.Zheng@amd.com>
 <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com>
 <d6046b53-9317-43d6-bfda-e30d42c09320@gmail.com>
 <2035b14e-3836-4e80-9dad-8a49ca90864a@suse.com>
 <alpine.DEB.2.22.394.2508181646220.923618@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2508181646220.923618@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.08.2025 01:51, Stefano Stabellini wrote:
> On Mon, 18 Aug 2025, Jan Beulich wrote:
>> On 18.08.2025 15:28, Oleksii Kurochko wrote:
>>> On 8/18/25 10:31 AM, Jan Beulich wrote:
>>>> On 15.08.2025 12:27, Penny Zheng wrote:
>>>>> In order to fix CI error of a randconfig picking both PV_SHIM_EXCLUSIVE=y and
>>>>> HVM=y results in hvm.c being built, but domctl.c not being built, which leaves
>>>>> a few functions, like domctl_lock_acquire/release() undefined, causing linking
>>>>> to fail.
>>>>> To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE Makefile
>>>>> /hypercall-defs section, with this adjustment, we also need to release
>>>>> redundant vnuma_destroy() stub definition from PV_SHIM_EXCLUSIVE guardian,
>>>>> to not break compilation
>>>>> Above change will leave dead code in the shim binary temporarily and will be
>>>>> fixed with the introduction of domctl-op wrapping.
>>>> Well, "temporarily" is now getting interesting. While v1 of "Introduce
>>>> CONFIG_DOMCTL" was submitted in time to still be eligible for taking into
>>>> 4.21, that - as indicated elsewhere - is moving us further in an unwanted
>>>> direction.
>>>
>>> Do you mean that specifically this patch or the whole patch series is moving us
>>> in unwanted direction? (1)
>>
>> That series. We said we don't want individual CONFIG_SYSCTL, CONFIG_DOMCTL, etc.
>> Instead a single umbrella option wants introducing. Which means there series
>> doesn't need re-doing from scratch, but it may end up being a significant re-
>> work, especially considering that CONFIG_SYSCTL is already in the codebase and
>> hence now also needs replacing.
> 
> I would not characterize this series as "moving us in an unwanted
> direction". Yes, it introduces a separate CONFIG_DOMCTL, which we
> agreed we do not want. However, simplifying it to reuse a single
> CONFIG is a minor improvement that can be addressed in v2. The main
> challenge in this series is adding the #ifdef in the appropriate
> places, and using a single CONFIG for domctl and sysctl would
> actually help.

Well, when are we going to see a v2 then which does this? Of the three
options I mentioned in the earlier reply, Oleksii favored the revert
path, leaving open the get-everything-in one. For the latter, however,
we need to see relatively constant progress now, or else time will run
out. Whether to commit the patch here really depends on what route we
settle on for 4.21.

Jan

