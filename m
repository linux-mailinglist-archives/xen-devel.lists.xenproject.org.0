Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D4687BCBA
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 13:24:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693177.1080897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkk7Y-0004J7-KP; Thu, 14 Mar 2024 12:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693177.1080897; Thu, 14 Mar 2024 12:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkk7Y-0004Gv-Hc; Thu, 14 Mar 2024 12:23:40 +0000
Received: by outflank-mailman (input) for mailman id 693177;
 Thu, 14 Mar 2024 12:23:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkk7X-0004Gp-Aw
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 12:23:39 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aee1430c-e1fd-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 13:23:37 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a45bb2a9c20so85276766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 05:23:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 qx12-20020a170906fccc00b00a44a04aa3cfsm654915ejb.225.2024.03.14.05.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 05:23:36 -0700 (PDT)
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
X-Inumbo-ID: aee1430c-e1fd-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710419017; x=1711023817; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WOjMpM+Npomr4BsE2wNuLO5CgqwO8e+gdOM4yMDJy3A=;
        b=AQBrFKrOHdY9P1yLAPta5hutET7r2vT5/DYmPRHJDP3jdCuzYbrvPKVHeOzT4t4VYF
         jp39JdX2oQW5tbt3/jGuG42205byBwYXFJuu33ATi2G7HhII68A+St8q7yEl/Tooimcu
         nYv61ospC4beOM25t7q4GJ4yx3YrstJbe2akfElKVexsx24NYTEHT5W5UfDf20XKcSNE
         7XMWzlBqbuTr2hlUnQQ6Jf7MY1uacNd2kEU9PLDxc7e8X3KrvmjH6CO7oPjMf+S1cM98
         uJpozYHoa87o4rlJbYzjcMspA6IpdbG7SCqKRRHLhW2boA2f/JohrJg6jEO3LORsarpZ
         KWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710419017; x=1711023817;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WOjMpM+Npomr4BsE2wNuLO5CgqwO8e+gdOM4yMDJy3A=;
        b=MFV1//3BZzlo16IkFWyjVJinT1BYiw2WAbdl2GJRrlctiiLamfEOxAm56Ypa2Xqa7w
         KUHBbwHxl97+HBxG/rMj5c05MjK9qb6xoEF7J7NP29w7rK8NSwI+uZrfFJG5ktKq7xmP
         WhbZ0PxLFDz/E8KXrn9iOhzWSB8hcpZAk/+4vbyyfHasIY9ZeNTfKHsHMWbD5VO6Q8xX
         B2J3E6AWvW3NRguctswqrnccTlijpzyt3jnh3qLyBsP2/PGTB5GzxOHdTGfIrBHpeGeg
         CN/ncn07oBMDYXa8XMNT21ebf/4STwLdy1TpMb2paGbCLQ4qY47qC5aSdUwmT7G+UQLB
         doRA==
X-Forwarded-Encrypted: i=1; AJvYcCXv4qCpTtdo/mPsw2yRQzYpewRBrzbNX2JWZszqGHZte4c63Sla7TvgB9hr71gEAxw75pFkXaLur+GSV4WX2VWmNt8o6GPdRptk5RUv5R0=
X-Gm-Message-State: AOJu0YxROeE8pBl5KySlAYuJ3SJqk3cG42knxj0C93HTXS1xErL2XM9E
	sFAcKDk3d8alEzThs5JCvC+NhMaXbjOrT247iOxonK5ELy+oFaEsByWdfo+h7g==
X-Google-Smtp-Source: AGHT+IGTmU40Nx3TfIrptU2UsWf0iOe22ix1XDbX6UZvv4x9DO7r3Ts1hl5e2sCTK5RyQ+CnrzJqww==
X-Received: by 2002:a17:906:a282:b0:a45:9008:ca1b with SMTP id i2-20020a170906a28200b00a459008ca1bmr1083786ejz.1.1710419016841;
        Thu, 14 Mar 2024 05:23:36 -0700 (PDT)
Message-ID: <a10bf170-da69-45c2-aa7a-97d94995d4db@suse.com>
Date: Thu, 14 Mar 2024 13:23:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] amd/iommu: add fixed size to function parameter of
 array type
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <533a2d4f0c92d7fe92aa200b64434389de546f69.1710343652.git.nicola.vetrini@bugseng.com>
 <6186b676-660c-4bfa-a825-18ff7f0d7f62@suse.com>
 <503aa63b5204e9b9eab5a21235df7c6c@bugseng.com>
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
In-Reply-To: <503aa63b5204e9b9eab5a21235df7c6c@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 10:25, Nicola Vetrini wrote:
> On 2024-03-14 09:32, Jan Beulich wrote:
>> On 14.03.2024 08:42, Nicola Vetrini wrote:
>>> The 'cmd' parameter of amd_iommu_send_guest_cmd is passed
>>> to a function that expects arrays of size 4, therefore
>>> specifying explicitly the size also in amd_iommu_send_guest_cmd
>>> allows not to accidentally pass a smaller array or assume that
>>> send_iommu_command handles array sizes >4 correctly.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> All current users pass an array of size 4, hence this patch is 
>>> addressing
>>> a potential issue noticed by the analyzer in the context of Rule 17.5
>>> ("The function argument corresponding to a parameter declared to have 
>>> an array
>>> type shall have an appropriate number of elements"), not an actual 
>>> problem in
>>> the sources.
>>
>> While true, I think we want to consider alternatives. First one being 
>> to rip
>> out this dead code (thus addressing other Misra concerns as well). 
>> Second,
>> if we meant to keep it, to properly do away with the (ab)use of u32[].
>>
> 
> I'm not understanding what you consider dead code.

iommu_guest.c:guest_iommu_{init,destroy,set_base,add_event_log}() have
no callers; guest_iommu_add_ppr_log() having one is suspicious, but the
function will still bail early due to domain_iommu() never returning
non-NULL in practice. With that I'm pretty sure nothing else in the file
is actually reachable.

> I see three users of amd_iommu_send_guest_cmd

All in said file.

> and seven for send_iommu_command.

Well, this one of course isn't dead.

> I can adjust u32 for sure. There are also other u32/uint32_t 
> incosistencies in that header.

Which we're going to take care of over time.

Jan

