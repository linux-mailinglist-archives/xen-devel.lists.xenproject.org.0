Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A74E9917A8D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 10:11:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748470.1156188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMNkM-0008QD-Tb; Wed, 26 Jun 2024 08:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748470.1156188; Wed, 26 Jun 2024 08:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMNkM-0008O1-Qr; Wed, 26 Jun 2024 08:11:18 +0000
Received: by outflank-mailman (input) for mailman id 748470;
 Wed, 26 Jun 2024 08:11:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMNkL-0008Nq-8x
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 08:11:17 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a868df1c-3393-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 10:11:15 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ec61eeed8eso34575001fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 01:11:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fa1bbef429sm68348135ad.251.2024.06.26.01.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 01:11:14 -0700 (PDT)
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
X-Inumbo-ID: a868df1c-3393-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719389474; x=1719994274; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=11AcoKAhBh6rVhIm012Zwt71yoIGRLv2lXfIw9ttWaY=;
        b=O9FboZgKG3OR5BWALNeckwfPFopttjhzUXVtp14savwNtTaxXJ0IXpS2Dfl6c/XLg/
         3aDjSE0Qdp7uRI2WWFfVXTNI4CDLLgFwOG+d0ZZMP0PnA0I05KJJxRsUohUezEikj3zJ
         0Y41WwYsfDYRSEzunjXIvEgQvqUPXDgdXS6+3FNPVBcEiPohYrIsvNK+/0pzjt37n9O3
         bwunZSpxLN1IbUM8a7kPQOPeww39QK2yaLUfn51+c/HVs+VKU+uVh+b+MyHFknLI1c08
         /VDsG+GVIhH/Y3f7KAIpxeAGcyMBcvPItJ6WLaC3/Nr+kZRB0TxzQeSeyg2YGvRd30uj
         odIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719389474; x=1719994274;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11AcoKAhBh6rVhIm012Zwt71yoIGRLv2lXfIw9ttWaY=;
        b=fZ60pIROeeNZfBF1aP7cQQJeaIgaTa6+VPqnMDvk+t9yaWHkKAm+Jyfe4B2VkJJsZg
         W9kauoQobz6s10yCK9np48RW2HGGV0JzIgoRic6hqhy3riJFd6/kfCAvj3BMfFVxdrP+
         dxywgQnWRunA6sFKRYnjwiHhUg0LLTc0sPkHjEso8OUeGKVL9AXz7rMzB+IwOHRs0fLR
         TVdZ/oXdhoMQocLem6GpyMV05yZXigOd4Twd18qkiUVXRRKrSv+M66zC8N/3Z3/AiAyD
         EMgpkIPjKCrASj4nhMEKR2cdPcLq2a2J+AomgnkzlNKbGuLLI1h+HFrrQPa2ru/JaQJn
         xX4g==
X-Gm-Message-State: AOJu0Yy5AwiNjBOr828sxdBwwDkDPFzH1wozr+BKeMRx7OSEf+UmC3p2
	cc0W65Z7bWkZyPdoPTW5QC2X+/DJBMWHGWtaRDr0FDj18iI8qiLAiw+tCWUJQQ==
X-Google-Smtp-Source: AGHT+IEez0vYVmI/xC05r7gA9e3go7fFxePj8UgymbiGn0uP/3AFGfttd7wOQ3KarOmGAPP4ChKixQ==
X-Received: by 2002:a2e:9054:0:b0:2ed:59af:ecb7 with SMTP id 38308e7fff4ca-2ed59afeef3mr7269881fa.15.1719389474514;
        Wed, 26 Jun 2024 01:11:14 -0700 (PDT)
Message-ID: <6441010f-c2f6-4098-bf23-837955dcf803@suse.com>
Date: Wed, 26 Jun 2024 10:11:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 05/13] x86/traps: address violations of MISRA C
 Rule 16.3
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Federico Serafini <federico.serafini@bugseng.com>
References: <cover.1719218291.git.federico.serafini@bugseng.com>
 <4f44a7b021eb4f78ccf1ce69b500b48b75df81c5.1719218291.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2406241753260.3870429@ubuntu-linux-20-04-desktop>
 <a5b47b7e-9dc0-4108-bd6f-eb34f7cb8c3c@suse.com>
 <alpine.DEB.2.22.394.2406251808040.3635@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2406251808040.3635@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 03:11, Stefano Stabellini wrote:
> On Tue, 25 Jun 2024, Jan Beulich wrote:
>> On 25.06.2024 02:54, Stefano Stabellini wrote:
>>> On Mon, 24 Jun 2024, Federico Serafini wrote:
>>>> Add break or pseudo keyword fallthrough to address violations of
>>>> MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
>>>> every switch-clause".
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>> ---
>>>>  xen/arch/x86/traps.c | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
>>>> index 9906e874d5..cbcec3fafb 100644
>>>> --- a/xen/arch/x86/traps.c
>>>> +++ b/xen/arch/x86/traps.c
>>>> @@ -1186,6 +1186,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>>>>  
>>>>      default:
>>>>          ASSERT_UNREACHABLE();
>>>> +        break;
>>>
>>> Please add ASSERT_UNREACHABLE to the list of "unconditional flow control
>>> statements" that can terminate a case, in addition to break.
>>
>> Why? Exactly the opposite is part of the subject of a recent patch, iirc.
>> Simply because of the rules needing to cover both debug and release builds.
> 
> The reason is that ASSERT_UNREACHABLE() might disappear from the release
> build but it can still be used as a marker during static analysis. In
> my view, ASSERT_UNREACHABLE() is equivalent to a noreturn function call
> which has an empty implementation in release builds.
> 
> The only reason I can think of to require a break; after an
> ASSERT_UNREACHABLE() would be if we think the unreachability only apply
> to debug build, not release build:
> 
> - debug build: it is unreachable
> - release build: it is reachable
> 
> I don't think that is meant to be possible so I think we can use
> ASSERT_UNREACHABLE() as a marker.

Well. For one such an assumption takes as a prereq that a debug build will
be run through full coverage testing, i.e. all reachable paths proven to
be taken. I understand that this prereq is intended to somehow be met,
even if I'm having difficulty seeing how such a final proof would look
like: Full coverage would, to me, mean that _every_ line is reachable. Yet
clearly any ASSERT_UNREACHABLE() must never be reached.

And then not covering for such cases takes the further assumption that
debug and release builds are functionally identical. I'm afraid this would
be a wrong assumption to make:
1) We may screw up somewhere, with code wrongly enabled only in one of the
   two build modes.
2) The compiler may screw up, in particular with optimization.

Jan

