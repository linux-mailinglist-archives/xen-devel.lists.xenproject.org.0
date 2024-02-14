Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 950D0854A09
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 14:06:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680733.1058817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raEyE-0005oc-RY; Wed, 14 Feb 2024 13:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680733.1058817; Wed, 14 Feb 2024 13:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raEyE-0005lQ-OU; Wed, 14 Feb 2024 13:06:38 +0000
Received: by outflank-mailman (input) for mailman id 680733;
 Wed, 14 Feb 2024 13:06:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raEyD-0005lJ-OL
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 13:06:37 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1907fcc-cb39-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 14:06:35 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-410e676c6bbso15157975e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 05:06:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c294900b00410cc2f5550sm1874323wmd.19.2024.02.14.05.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 05:06:34 -0800 (PST)
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
X-Inumbo-ID: e1907fcc-cb39-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707915995; x=1708520795; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/+SBJH3tyuiPYvHw7rIW+L4RszvBgnNudqwloHmO/Us=;
        b=Z0X/x97xmj+4UdYCpSsnwuC887C7oKk2ZJksQV1XVL9VxwJUyrCnnwmYIiSjew+0/5
         sWIrzwarAsVjGcIeML/IUccxP1p0f4Lmkl32HfZLo5i5bqzuKs69JKM8YHJlBGLw9EIm
         H2jRZSCAqkpG6cgSDLRYcipL8YPWrFDFfp659p9xAvtKTLeuCeU2InAG+HB+cOObnxVo
         dGs2C0ycRvXychrPFVoV8YxE/csx963efJbWTuWbVg7NZVJepVX6uLbL8SWinY18bJW0
         DQWPzG8IyV8I2Rys0XDAVsUH+Szyos5E1NqccHZ65LuDM4XB2ibLCpv/0nr5csvzZ+bc
         yDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707915995; x=1708520795;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/+SBJH3tyuiPYvHw7rIW+L4RszvBgnNudqwloHmO/Us=;
        b=AtkyizKuShkqI02vuzsSSQCLM0im6VuiPAxeCaphrG2DsCiscXwqiInkY//T/deJaw
         nIGIpLemDyrkJ2PwBLsvjvtb6S2enSzj4tr+oKIOYePLRwHpCy+Gliibv5Vl9mJeEtSI
         q+7P0f2fYieDy4YnaaI5zapdc42x4XaKPc5BW9vJilAfXVua6q/Sgp8i2pMFDXqQtFrY
         O6YGDiOBiqqXD9HnoGHLsM4YZDwPBU/u2+clmXM3jqxo0LI2cclzU8LDs/rpZGho3RKH
         VNPcwFdf/EpsCAwTKOy3xmrg4klylU8iy67LUirLGMP6IePnudhVu3M4q/W79ve1DoUK
         plDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjGizBXl7/cplOlDonep/U9xMg29PTUE/7CpEU+MNwQuFEqoD1ocvrDgokrxlM8KNid/tUVRejJtvxMNAC+2DYqRmzqwxYW/gGgI3FE4M=
X-Gm-Message-State: AOJu0YzjmPWXWhf3DorJZ28KX9AyphJq5ZLR837JuPQTAWTOE8KVmns4
	elf6iTMvgl++k/x0AqB514wbdLiggu9yICYJy3AX9DxhphAoBJ8mToPK7YrMEQ==
X-Google-Smtp-Source: AGHT+IHD4CcEeoZH1+OX4/V+HxpW3HboiNhhdvuL2DWjtyLH0Y08NzWxImaf33FkaHhye4qtMByUaw==
X-Received: by 2002:a05:600c:470f:b0:410:d1bd:150e with SMTP id v15-20020a05600c470f00b00410d1bd150emr1869377wmo.14.1707915994916;
        Wed, 14 Feb 2024 05:06:34 -0800 (PST)
Message-ID: <d63e0139-8f75-4c14-b612-27b003592d3d@suse.com>
Date: Wed, 14 Feb 2024 14:06:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 30/30] xen/README: add compiler and binutils versions
 for RISC-V64
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <d62dff38ee661f3fb713554d544c966fa889fd83.1707146506.git.oleksii.kurochko@gmail.com>
 <16162577-dc0f-4c4b-acd5-9c2519f94c9a@suse.com>
 <4b7ff366d58089a1c755c01cef21c503f408464b.camel@gmail.com>
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
In-Reply-To: <4b7ff366d58089a1c755c01cef21c503f408464b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.02.2024 13:21, Oleksii wrote:
> On Wed, 2024-02-14 at 10:52 +0100, Jan Beulich wrote:
>> On 05.02.2024 16:32, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>>  Changes in V4:
>>>   - Update version of GCC (12.2) and GNU Binutils (2.39) to the
>>> version
>>>     which are in Xen's contrainter for RISC-V
>>> ---
>>>  Changes in V3:
>>>   - new patch
>>> ---
>>>  README | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/README b/README
>>> index c8a108449e..9a898125e1 100644
>>> --- a/README
>>> +++ b/README
>>> @@ -48,6 +48,9 @@ provided by your OS distributor:
>>>        - For ARM 64-bit:
>>>          - GCC 5.1 or later
>>>          - GNU Binutils 2.24 or later
>>> +      - For RISC-V 64-bit:
>>> +        - GCC 12.2 or later
>>> +        - GNU Binutils 2.39 or later
>>
>> And neither gcc 12.1 nor binutils 2.38 are good enough? Once again
>> the
>> question likely wouldn't have needed raising if there was a non-empty
>> description ...
> I haven't verified gcc 12.1 and binutils 2.38. gcc 12.2 and binutils
> 2.39 were chosen because this veriosn is used in Xen contrainer for
> RISC-V, on my system I have newer versions. So this is the minimal
> versions which would be always tested and I can't be sure that the
> lessser version will work fine, as there is not any compilation testing
> for that.
> 
>>
>> Also - Clang pretty certainly supports RISC-V, too. Any information
>> on
>> a minimally required version there?
> I haven't verified that. I am only testing gcc for now.
> I can add this information to commit message.

Yes please. And if this isn't a firm lower bound, that fact imo wants
reflecting in README itself as well.

Jan

