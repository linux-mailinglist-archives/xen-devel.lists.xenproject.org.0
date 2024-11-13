Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D96779C6D2F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 11:54:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835345.1251211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBB1A-000052-Hi; Wed, 13 Nov 2024 10:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835345.1251211; Wed, 13 Nov 2024 10:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBB1A-0008U1-EZ; Wed, 13 Nov 2024 10:54:36 +0000
Received: by outflank-mailman (input) for mailman id 835345;
 Wed, 13 Nov 2024 10:54:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBB19-0008Tq-En
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 10:54:35 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa07f7ba-a1ad-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 11:54:32 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-37d49ffaba6so4486758f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 02:54:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed970f68sm18155185f8f.11.2024.11.13.02.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 02:54:31 -0800 (PST)
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
X-Inumbo-ID: aa07f7ba-a1ad-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmQiLCJoZWxvIjoibWFpbC13cjEteDQyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImFhMDdmN2JhLWExYWQtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDk1MjcyLjc3ODE3Mywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731495272; x=1732100072; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gMUdrl/ikxQXEaRyQ+omi2QYW+VFLqeHwJSweOViyCc=;
        b=eoVkpvX+flHpN688I4LOnS6RCiryfPLAWuYF/EIAUXAd3t0dHaqWzdk2+0dUZcr1+H
         fVp49TgcX13ki8j/CER6r7S3a4RET69nE2xz1z4Y2s0syRazANsD8BJAkDwNPz15l/dq
         XzVPKcKnMvjoxXLqJfonqrlCQdLjYF+epD14vRKhqFjxTsp90qwraWppbZrJ14GPd3f0
         J2ITB4wcNPt01stFjHdx/53/wERWw3TFr1E1/nb3Z6TM+xuoCk3duZS9HZPDuVe5laE7
         3KoPuao1/0z0oZIN5GPE28X8YyrbyHlNQznfU4kkOHXOlJaT0aJo9YS4E74lR7AFztWf
         Ydyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731495272; x=1732100072;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMUdrl/ikxQXEaRyQ+omi2QYW+VFLqeHwJSweOViyCc=;
        b=mJCzglaig5NVerM9nidi2w2n0r3Xse09rF9vLZa2XQodpw3PEDLpNu8cdUb9Ac0Asl
         F+KtGzW1ROGw2BxEglF/mVzNpbw2na8e+YYuDtK11VrpwMJGL7Ma6sxaKiHVFc6lZozs
         FVwK6KE6dZgggvbohbMATz56+ty+pTlfISDoLKtv3N63Rxa7R9VHmhLAGPZvJHe8qG1t
         5CSlKoaEOjuQBnc9ohspTigV1GaRU0F9KRF/2IFCcCkdRF3fgqPYZ/YS2ULM49i6hNCw
         IOCnmy644qVqjX+H/k548foB6KM9yKKPqzpS8AG3FVtKNbNcg2wBGCAr/C6k/nxaDIpW
         Avfw==
X-Forwarded-Encrypted: i=1; AJvYcCUtw57PWQMrUSo2GFDulHuieALtOZbx1wwIhJwIpnxuLiDqa8FYWWn2/RkVB9QwtVqO54gkGYvP8Hc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuQBg64ZiVCnqOS6AdWwwR6+YM36KhGubUc0Y4x+Wg15CwPB9x
	tdS8v7SEPzSFl34BSX7PHJRzLHRa3c8c0RVtPLkZlQDg4tZpE6mHcpuwABYeUg==
X-Google-Smtp-Source: AGHT+IGByTq6uDX60JH8qzYC4m47f9OcMHM5I2eg3Aw4g0kcYluiiGrEXPIXynbeOzhJqiwiH/HrHA==
X-Received: by 2002:a5d:5d89:0:b0:374:c84d:1cfe with SMTP id ffacd0b85a97d-3820811105bmr4615681f8f.21.1731495272033;
        Wed, 13 Nov 2024 02:54:32 -0800 (PST)
Message-ID: <24b117ed-dd5a-47a7-8c5d-ddddd7407ac9@suse.com>
Date: Wed, 13 Nov 2024 11:54:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen:add deviations for MISRA C 2012 Rule R5.2
To: alessandro.zucchelli@bugseng.com
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
References: <41a1127e6d77d2be350e7679bd1034e0c2918e94.1731487210.git.alessandro.zucchelli@bugseng.com>
 <39168f90-7c80-451d-9c20-50da0de4af78@suse.com>
 <3789df92285b2c08b855369f46f3a229@bugseng.com>
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
In-Reply-To: <3789df92285b2c08b855369f46f3a229@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2024 11:48, Alessandro Zucchelli wrote:
> At this link you can see all the violations of Rule 5.2:
> 
> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/bugseng/xen/ECLAIR_normal/40_characters/X86_64/8143097084/PROJECT.ecd;/by_service/MC3R1.R5.2.html

Thank you. From a cursory look these all appear to be a result of the 40
chars limit we put in place (quite arbitrarily). That's not mentioned at
all ...

> By deviating the two macros CHECK_NAME_ and DEFINE_COMPAT_HANDLE all the 
> violations are addressed.
> 
> On 2024-11-13 11:31, Jan Beulich wrote:
>> On 13.11.2024 09:41, Alessandro Zucchelli wrote:
>>> This addresses violations of MISRA C:2012 Rule 5.2 which states as
>>> following: Identifiers declared in the same scope and name space shall
>>> be distinct.
>>>
>>> This deviation addresses violations of Rule 5.2 arising from
>>> identifiers generated through token pasting macros CHECK_NAME_ and
>>> DEFINE_COMPAT_HANDLE.

... in the description.

Together with the 5.4 patch having the same lack of context, I wonder
whether we shouldn't simply up that limit. Or else, as suggested there,
to instead exclude such derived identifiers. After all the derived ones
will be distinct as long as what they're derived from is distinct.

Finally - please don't top-post.

Jan

>> For each of the two, can you provide an example of where collisions
>> result? At least for the latter I can't even see how that would
>> work without the compiler complaining (i.e. the build breaking).
>>
>> Jan
> 


