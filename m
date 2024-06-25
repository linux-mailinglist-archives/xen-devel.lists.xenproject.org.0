Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E387915F07
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 08:41:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747232.1154586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLzry-0004MK-5t; Tue, 25 Jun 2024 06:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747232.1154586; Tue, 25 Jun 2024 06:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLzry-0004KI-2r; Tue, 25 Jun 2024 06:41:34 +0000
Received: by outflank-mailman (input) for mailman id 747232;
 Tue, 25 Jun 2024 06:41:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLzrw-0004KC-VA
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 06:41:32 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f547b5c5-32bd-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 08:41:31 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ec3f875e68so57710371fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 23:41:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7066c2ebd85sm5304268b3a.93.2024.06.24.23.41.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 23:41:30 -0700 (PDT)
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
X-Inumbo-ID: f547b5c5-32bd-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719297691; x=1719902491; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7TihY1bbYRB9CqY586eDl31+yNlMblXuuqYEfzYh/Rs=;
        b=AEP5C9/NkRA9ptjAx/3xUn1TJM+xshYCd1F5VWL4+iQfAspp6kOfLDqHS8KRMUfLRw
         AoLn+A/ULrpm0ml7SYANllyCGtNdLLW+qCLQIDUotZ2QzWcoJU0K79/vsrq7cMDM9m0s
         Pn7X40LgetT2QgrEiY/KDzwGbVYV16onAxto+sfkjbWJrIUeDNAbK//k2pXNkSTv5b2o
         0EhdDaI/7KQxN/0pvjZGLU0jbwr2ElxO8FRBYyUXtu71q7qD34Mq9KHw7htKjyLJEoUC
         rxrTjSNb4ovzSFTslCUAGn3cG8YxIYa7CIo/C2DTZ4XdnXcz/BQFF6cMiBI4fcCWbeq8
         73kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719297691; x=1719902491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TihY1bbYRB9CqY586eDl31+yNlMblXuuqYEfzYh/Rs=;
        b=iJ7U3b8BgQmFvzYsFY1ojuk3w0u5NhiZ+mHxPWZEowQpqKECEl9XDC5VfFR4VL5JpM
         0ugB+bsnFD3ziTzAU1YW75vXZ2s3d7Y+WFAFNoaAgFT8taMoFKmTvG7zLN30HTSi+kuI
         zqRTUMJM4Csx9lqJ9QgZzncRzLn81L35BKc8rwTK2RheDk6wSE6mAaueEJ9EUGnb/nKx
         pRbUVBokYRfT0RYGnKr70eYZmAfKviHpbUGSyuenVvpDN4XxW1gPAAJRZchzG/ccNBLY
         nOdt/fp0PueM4ianTwlLiD+wkqldZ9tFJqKDbVuAfHGGL6c9CXrHjl97x8RiFatj2q+z
         rMHA==
X-Gm-Message-State: AOJu0YyzPJrC+lng5g00BwNG5hng8L2pREIABn0YeEZynQbyWNJRmFrj
	BmH5FmQxVLIA69rNoiMONOQxzzL5g0LBK6SX+pduH2DdQ0FzOQlrJylaF4mIow==
X-Google-Smtp-Source: AGHT+IFRNg4IcFw8/1wM8DmKL4/9a9am+X9D/EWYh54vGiSLKvgr42BV0JPw7kEMa5L+szjSd1Oc7A==
X-Received: by 2002:a05:651c:220e:b0:2ec:5e2e:39a8 with SMTP id 38308e7fff4ca-2ec5e2e3aaamr41748591fa.3.1719297691186;
        Mon, 24 Jun 2024 23:41:31 -0700 (PDT)
Message-ID: <a5b47b7e-9dc0-4108-bd6f-eb34f7cb8c3c@suse.com>
Date: Tue, 25 Jun 2024 08:41:23 +0200
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
In-Reply-To: <alpine.DEB.2.22.394.2406241753260.3870429@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 02:54, Stefano Stabellini wrote:
> On Mon, 24 Jun 2024, Federico Serafini wrote:
>> Add break or pseudo keyword fallthrough to address violations of
>> MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
>> every switch-clause".
>>
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>>  xen/arch/x86/traps.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
>> index 9906e874d5..cbcec3fafb 100644
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -1186,6 +1186,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>>  
>>      default:
>>          ASSERT_UNREACHABLE();
>> +        break;
> 
> Please add ASSERT_UNREACHABLE to the list of "unconditional flow control
> statements" that can terminate a case, in addition to break.

Why? Exactly the opposite is part of the subject of a recent patch, iirc.
Simply because of the rules needing to cover both debug and release builds.

Jan

