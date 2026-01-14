Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DB1D1F99E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 16:05:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203321.1518552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg2QE-0003XF-4d; Wed, 14 Jan 2026 15:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203321.1518552; Wed, 14 Jan 2026 15:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg2QE-0003VH-1s; Wed, 14 Jan 2026 15:04:34 +0000
Received: by outflank-mailman (input) for mailman id 1203321;
 Wed, 14 Jan 2026 15:04:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vg2QC-0003VB-58
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 15:04:32 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 535838c3-f15a-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 16:04:29 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47ee301a06aso9366935e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 07:04:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee55d42f0sm33962085e9.7.2026.01.14.07.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 07:04:28 -0800 (PST)
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
X-Inumbo-ID: 535838c3-f15a-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768403069; x=1769007869; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uw1mdVhhOFU9PBjxjNps+Ylka8ITQP/5h7t9ihrOMrY=;
        b=MFknnajAP/i9UiKUvYaWqcQcQ84vl4/BNkjSfTxTdn6SxV8qwM85H4OtgdpVe6D32i
         ee7J3eulIUzL7YwQS6OsB2mOJ+dUATPk0OhxyMG2u/lgDvaIvCxYgrhs0IOvkvGqPekG
         W8RlTgFVq6NxllVlXFuNLxQoZ7IQ2F1o2daaf6gVZ07IGIYK65LOWRrFNiua1VywsFe+
         Mm85jOPsRm/0FkwmErdLr86jkEdTo6YNgoOwYuIQmjSC2oOvn9l/V4R+Xkf7cIbdHD5M
         GFkLQRMYbI8IZc23NkQyx0Y89wFE/ZgVY9CEIUJvuNKVwzHMYim3CTRYkQW3jFE3MVSa
         gPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768403069; x=1769007869;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uw1mdVhhOFU9PBjxjNps+Ylka8ITQP/5h7t9ihrOMrY=;
        b=rBleo4uoKhOlJ2uv9mbM//vEJsyXDwTEz1tAHJqOiPmrP0cczhHNo5z26nC7cNQQB+
         03J4WOETnKIvBLI/4ZwKdWqOui8dr5/6kLruKMYeiJUfhYyApOfCwZAy8eR4VRnmvR3u
         4UhD5zKICvLI/c7pFsHJN+Ql3PtrHr/5GpkniSXyPkxTgwn3t3dmlw4FHAVH7F8ap/Ce
         IV0CRD+RR3h/15wV2FrTtCMr7DlHeEeilajHkt9VHw41G7nyhV/MGdcgNdrBR/U7r1zl
         fnzV6WM2VKt/8ic/hwIMgD/vUS2LzUFSUPW83Nx2cqkqg3gvffzn6Lr6n13ebW/qjcdG
         AS5w==
X-Forwarded-Encrypted: i=1; AJvYcCU5lD3ZWg2f9Kwm0/3+Dr+1d+9eYLLNjIT+mE+6ShAYUq6mSgjHmlR8iPM0mLqJvvHSO7y6ZkFbUnA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1kDC0ilimIeyfM1IDBDxAEKog4FazNvDXtY9CM0nYKLYVkKCQ
	gdaP3PTpmkp/mzNE5tFHI6CiUPf6j1pgYYtqCvp/4swlSjW4CTzETEtxT0jDP6kdwA==
X-Gm-Gg: AY/fxX49yid7kuy3nfyjPGq0H3wL8iQKJNiVqmZzocGpbexINa3TcQtpW520yzz77xi
	bAiSrMwQxTC+YYA75pMpCWzqri3we253zBvgYt0Al8m+A+A1XqOAbOFzGdtD9DJiCcHvsVYAuWX
	/z6igliKB/xKX3s8pEZfxqgHjH4WWXZJ2xPLIxq/W8B1Hgb9wqIbs33K/YnqihK/H0KT7uwPqHf
	YYPvLLyAqVl80Ou6T5La3GAOTpSkrxzYxxGWzpUOKKaTV7dVETQRFNDyH/3aKyav5gR3E5uPj5d
	D/zy2VXSv0k4RXBrD5gxfd+4Jye9IlFpbargbLfkapV+Zsy2rmq1axRaf6n/ieVZ6xLqxHvg6u8
	9tgw/kBPUiSBPMA0irdkCno3CpodA9aVLPsM8DwSFnO1ypMafxaopxr6PabT+UJB9Ud5rpJ6rEO
	43f5PLujk0YLjX5fhkqeDhHBUYmWGJgWAvev3I3RmNxMEIRPWFpAHF3TxkXdUZbiJDEcd5File6
	WU=
X-Received: by 2002:a05:600c:6992:b0:479:3a86:dc1a with SMTP id 5b1f17b1804b1-47ee33aa21amr33171555e9.36.1768403069176;
        Wed, 14 Jan 2026 07:04:29 -0800 (PST)
Message-ID: <922c5809-8070-4ff4-9caf-d953c4ac0c2b@suse.com>
Date: Wed, 14 Jan 2026 16:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/15] xen/riscv: implement reprogram_timer() using SBI
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <43249171def325c49541ebdac141fe99d159b60f.1766595589.git.oleksii.kurochko@gmail.com>
 <f14c8b3d-66ce-4ea7-bf50-591a4a48345a@suse.com>
 <90e7fc60-09cc-4b61-ab0a-80037f8ecaf8@gmail.com>
 <f2241dec-a115-41b9-a249-6c5a69114809@suse.com>
 <a7757fd0-7b23-451d-93f7-043cfbb6e684@gmail.com>
 <c6b2f360-5ec5-4299-9eb0-de88bf9f9ad9@suse.com>
 <4141bb71-7aef-4287-aefd-92009977294f@gmail.com>
 <c29d03ec-e83f-4594-9ef6-fcc7b99a318b@suse.com>
 <f4ffcd85-6091-47e0-8c02-e3e5a8ca1354@gmail.com>
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
In-Reply-To: <f4ffcd85-6091-47e0-8c02-e3e5a8ca1354@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.01.2026 13:41, Oleksii Kurochko wrote:
> On 1/14/26 12:17 PM, Jan Beulich wrote:
>> On 14.01.2026 11:33, Oleksii Kurochko wrote:
>>> On the other hand, if some
>>> other negative error code is returned, it might be better to return 0 and simply
>>> allow the timer programming to be retried later.
>>> However, if we look at the comments for other architectures, the meaning of a
>>> return value of 0 from this function is:
>>>    Returns 1 on success; 0 if the timeout is too soon or is in the past.
>>> In that case, it becomes difficult to distinguish whether 0 was returned due to
>>> an error or because the timeout was too soon or already in the past.
>> Well, your problem is that neither Arm nor x86 can actually fail. Hence
>> calling code isn't presently prepared for that. With panic() (and hence
>> also BUG()) and domain_crash() ruled out, maybe generic infrastructure
>> needs touching first (in a different way than making the function's return
>> type "bool")?
> 
> I think making the function's return still is fine and it is only question to
> arch-specific reprogram_timer() what to do when an error happens.
> 
> Still doesn't clear to me what should be a reaction on failure of
> reprogram_timer().
> Considering that SBI spec doesn't specify a list of possible errors and now
> the only possible error is -ENOSUPP it seems to me it is fine
> to have panic() as we don't have any other mechanism to set a timer
> except SBI call

panic() (or BUG_ON()) is pretty drastic a measure when possibly the system
could be kept alive. If is pretty certain that future SBI timer calls also
aren't going to work, then I'd agree that panic()ing might be appropriate.
If otoh a subsequent call might work, a less heavyweight action would seem
preferable. (Welcome to the funs of relying on lower-level software.)

> (except the case SSTC is supported then we can use just
> supervisor timer register directly without SBI call).

So maybe a good first step would be to use that extension if available?
Might even think about requiring it for the time being ...

Jan

