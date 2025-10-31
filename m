Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6072EC242F6
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 10:35:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154119.1484226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vElXB-0003il-VJ; Fri, 31 Oct 2025 09:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154119.1484226; Fri, 31 Oct 2025 09:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vElXB-0003gm-Rr; Fri, 31 Oct 2025 09:35:01 +0000
Received: by outflank-mailman (input) for mailman id 1154119;
 Fri, 31 Oct 2025 09:35:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vElXA-0003gg-AV
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 09:35:00 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbde6623-b63c-11f0-980a-7dc792cee155;
 Fri, 31 Oct 2025 10:34:55 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so19519935e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 31 Oct 2025 02:34:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289adc18sm88705625e9.6.2025.10.31.02.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 02:34:54 -0700 (PDT)
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
X-Inumbo-ID: dbde6623-b63c-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761903294; x=1762508094; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ucx/c0ASjpItN89Vmj8stRuDy8yxJ6s5W7X6PIDEQso=;
        b=KekngdWRgTP1CUghn6VXugLpG5Yzo7W0w973PamEAq7S1RzRCTaz8NDnIaGVYQLx8y
         0W09ej6C31TMTtlc/zrJWhXSD7WEhSP99bIUubllUFczZEBjuIj0FqJETmLUJefFuwqI
         khMO4PUFG03dsCVsm8Ruq428oGvg7koG/H1VyQcFz1RJ0RadqQvFhC8Fqo9CEEtx955T
         CUJ8MIl5IIG0wiy1m7oUfrcT8VjRNgSzrpMSnH6L+X09dQzkLnS1uK1Uj65dbIFqmT/O
         gT6meFIRi6NP05YsNKdhE9ifp5+QuX43J6NAbUTykIZYtUAgHSFTS638wnMGzYCCyYZu
         cikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761903294; x=1762508094;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ucx/c0ASjpItN89Vmj8stRuDy8yxJ6s5W7X6PIDEQso=;
        b=wYpk/7X8mXWnbuCmGbUf5RU5otxOCd3OBDQuSGKyTmHgFjmazeK11Z+/+U5JM2M687
         H50fPTkHw3XRJLUm4VM6OeWz/o/euSElliBt1pyEhCvnXUU6dJ9jVH3/bSnfABp+Mvtc
         ioOejnNM8beB6QpgUGW03gtvthmDMJiSZoJQmRmz/meyxnblugwDeIxUbIBN659H75at
         G0kp8DTjpnE0xGtWpLAfyEspxCFYgZ0BG1Kcg6DLGxuwe7STUB/ZsxGEhZxUwEbHgEom
         N4Rcl4CtFw+GKYW67qSUsILZxgR1/eJiO/H9r7AdOIWOrKSbn8MkJLLlfNQXhB7kiTBy
         AB+A==
X-Forwarded-Encrypted: i=1; AJvYcCUqRLDSs6dywt36v1O7+rnQXtDeO99yVb9WLcS29GsDsbeWr+uWPCSN0eyp+tbrqBiCS6vQMJvgehg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4dgNF9sZYJh+y0A65bf+VMPx8yDzNVyDc9PrBn+TrUgOtQcvu
	8SPNtNpv8QwgaqKwxV0PLaokEjBOPuLmpZaF/41RR/BzIewi/8qgiu1/A9p+uazDnw==
X-Gm-Gg: ASbGncuDolrr9f8dMbDtJ//F1/TyRYAbQ5TA1eq8zL4N9crHg6QVZnskLUs9YMZaWDj
	vtrEV2q0tgf6q5yLSpCNm7tz6J/J8k634R/N7ZsdbI0Y2NjdyFG7WqjPMz2XPC3L4G+1kOZ6GPe
	7PfHJzlmHVibu1zrnEE96emSPp6v4Urhkklv09NDyFyOcVZSHbvJBeAs81kcPm8awY0nSVYIsEJ
	9NrfSV5rFVyuc7J/qOtLzvlXATpwR74RxzFGAS0HrU19fvM2/VWLFSqSJNuJq5gZgHubJzmRguM
	zqrRvc2rgUlvO3lG/JuFum2n1yZFEbdzT4CnmBQX1HYOxLtkWlS/i///Rxen6czcomFi8Krt+8e
	RmnP5Qy/o2RwLLRevOUG1GefjgLU6Ks4pWqY4KVY7ZKVjN8cqvfX1LFy3jD9L975pOx+fq2VVxO
	do2mYBU/eK6hfhuNGh7iYT7Ue9ksbuEmIsvkGv9XETOFxKBnEi6ww7+PtIoc5TgLp2exiTbtA=
X-Google-Smtp-Source: AGHT+IEI8pCskrwGN0LmcsWKPiDLQ8gqkkRetQRGEkoRwi6O8aeZWNUXwZH37AmEtA+GqQXRtWVv2A==
X-Received: by 2002:a05:600c:190e:b0:471:669:ec1f with SMTP id 5b1f17b1804b1-47730791083mr27143415e9.8.1761903294575;
        Fri, 31 Oct 2025 02:34:54 -0700 (PDT)
Message-ID: <f4dc4064-43f5-4bb0-8387-298a5d62cb5b@suse.com>
Date: Fri, 31 Oct 2025 10:34:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21 0/2] x86/AMD: deal with RDSEED issues
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
 <abf30e99-47be-48c9-b826-18d142453dcf@gmail.com>
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
In-Reply-To: <abf30e99-47be-48c9-b826-18d142453dcf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.10.2025 10:31, Oleksii Kurochko wrote:
> 
> On 10/28/25 4:32 PM, Jan Beulich wrote:
>> Both patches also want 'x86/CPU: extend is_forced_cpu_cap()'s "reach"' in
>> place.
>>
>> 1: disable RDSEED on Fam17 model 47 stepping 0
>> 2: disable RDSEED on most of Zen5
> 
> Both patches LGTM to be in 4.21:
>    Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks, yet: What about the 3rd patch mentioned in the text above?

Jan

