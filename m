Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7CE91DA3F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 10:42:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751371.1159309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCbq-0004TZ-GZ; Mon, 01 Jul 2024 08:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751371.1159309; Mon, 01 Jul 2024 08:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCbq-0004R4-DE; Mon, 01 Jul 2024 08:42:02 +0000
Received: by outflank-mailman (input) for mailman id 751371;
 Mon, 01 Jul 2024 08:42:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOCbo-0004Qy-Ks
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 08:42:00 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c75b98fd-3785-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 10:41:58 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so28482091fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 01:41:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac15389a8sm59308365ad.176.2024.07.01.01.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 01:41:57 -0700 (PDT)
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
X-Inumbo-ID: c75b98fd-3785-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719823318; x=1720428118; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MpdFJkUFLFW/PgH6rB/uLN09yl1+avOBdQMVhFfoCXk=;
        b=U5gKBhqmRnEtY31QNakTRxFjnVsQRJkwd1Hcx9a9Grk7zftJdGlumnOqSbHskW3HqP
         FT6Xb5uMgdqtY5w0nGRVXQ+UFpZtuY9cKRu7z6MB552vpPvOa9d75J7S7uGNgqHlBdJq
         iAF8gIowPW7eUOqCtd+J+ZYwsQann/ej4jtbpZPgeGb9G1kmdpkq8KDJ1HOpqJ6rU4yS
         rIS2hSXTG46o8UuxiZ3ns/szzhiTQlwA2sr84zAyo30TJqThTk1vCy4cWOQ1WYEOMk/c
         zWI00fSO2Qsu2BQWCnf36HC7AE0o+rqDyZZSZLnWWi9PAwEBE2MhiX0AeZsg/sRzZSWU
         wfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719823318; x=1720428118;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpdFJkUFLFW/PgH6rB/uLN09yl1+avOBdQMVhFfoCXk=;
        b=EOs/KSi+QF6Dsaeg+jPfBEt6bJnW/RSnxNvQhWcCgBlssSjEd0cppq6KRjjq858dPp
         AOJk9ioPW6IsP2A3/Bqto/akzwi1M0ZkFJZynsAuypJpfELJQddlgv/Bj+ACpPF1MfJe
         5UE0++tMEepqXW/JUDo67Vsz3aJjQ/FTtvPy8/esyMJ4N79kK7IQRv9XJxtecE96kBLJ
         pG+utxU8PneTu2FaCoEzPAacSuqm5H0jxgBClHYvV/KO9gwFMr+kx9UBa9JpEgJ59nEd
         dCyXV5SSWdHB3UGQVTnsYAIblMWMVi43kPffb1uUHMMwMfy9k1UgaR7NwAx3FAdcAOfy
         oTkA==
X-Gm-Message-State: AOJu0YysdXhGMZo3dbK1547pO1ZIpUan4tHHwX4OE67+/B8i36SNWW4F
	Ao0U6nK1dKfhMztgBoAai2GrqFe2Jij69i4cyreO/tHiEtKXqw0IDG9P0nyB3QjV0UYGA11zpkY
	=
X-Google-Smtp-Source: AGHT+IGOcvpBNc9EXevNoo5ThUmu6uhZTXedeYFaKZAFplmtoycdGzr8bj5IAd6NDJeP0aKPLttkqw==
X-Received: by 2002:a2e:a605:0:b0:2ec:559d:991 with SMTP id 38308e7fff4ca-2ee5e6f7af0mr26743011fa.50.1719823318236;
        Mon, 01 Jul 2024 01:41:58 -0700 (PDT)
Message-ID: <9871db38-0274-4267-a4fd-eb2c6dbdd5ea@suse.com>
Date: Mon, 1 Jul 2024 10:41:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 05/12] x86/traps: address violations of MISRA C
 Rule 16.3
To: Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1719383180.git.federico.serafini@bugseng.com>
 <e7aea6bacb9c914a06a929dfe3606f7cc360588f.1719383180.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2406261751370.3635@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2406261751370.3635@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.06.2024 02:52, Stefano Stabellini wrote:
> On Wed, 26 Jun 2024, Federico Serafini wrote:
>> Add break or pseudo keyword fallthrough to address violations of
>> MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
>> every switch-clause".
>>
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>> Changes in v3:
>> - use break instead of fallthrough.
>> ---
>>  xen/arch/x86/traps.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
>> index 9906e874d5..d62598a4c2 100644
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -1186,6 +1186,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>>  
>>      default:
>>          ASSERT_UNREACHABLE();
>> +        break;
> 
> FYI the ASSERT_UNREACHABLE is still being discussed

Could you clarify what this means for this patch and you R-b? Is it somehow
conditional upon the outcome of that discussion, and hence you'd rather not
see this patch go in yet?

> Other than that:
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

