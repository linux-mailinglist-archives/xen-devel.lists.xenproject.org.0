Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90640AD7109
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 15:03:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013043.1391570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPha9-00026f-2t; Thu, 12 Jun 2025 13:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013043.1391570; Thu, 12 Jun 2025 13:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPha9-00024D-0K; Thu, 12 Jun 2025 13:03:01 +0000
Received: by outflank-mailman (input) for mailman id 1013043;
 Thu, 12 Jun 2025 13:03:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPha8-000247-56
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 13:03:00 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f254185-478d-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 15:02:56 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5534f3722caso1013773e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 06:02:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7488087e769sm1419408b3a.11.2025.06.12.06.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 06:02:54 -0700 (PDT)
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
X-Inumbo-ID: 8f254185-478d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749733376; x=1750338176; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=niArqT7V6tzGmiUGru0YJoC/Q3HSp+fFuua2zUzXqTQ=;
        b=MssvEvJYbQfn6073i7Jn9a7KV1RT00aVzWbpYCejIrhhlSfIGvy0KRgHlz5LB9hl/Z
         I9fEoglCq463jsMJM5gL539lgKe/ntuUNMpo1zBHicuQZWcGmhbDeeQNTBl6uiLLcK0M
         bFhXZYvyz0fGcDARdITAq6DKLB7F7mBc2w3/USHcApRPDlxntVXzk2+l7uF2R2KJYSS4
         Skqh2CJ+hnlyG2cbdWnT/QGW1/d5TLrAM6GCd+Wz9uP8QMxU5e1DmdN8mJ9nnTx7d4au
         EZYxJz9NJExH2q6RBVAQmplAWsfMFwLXJR1li4z1BawI0LpWFdyvdhSFHvTDyxJVgdM0
         99Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749733376; x=1750338176;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niArqT7V6tzGmiUGru0YJoC/Q3HSp+fFuua2zUzXqTQ=;
        b=T7Gy2ZOVfivym5pn+YymoddFaLSNqliNbDp+uU3ZSYtauivvzdEERhUM0epOsT5nQM
         g1rhvnPfPUNRPkJLUZ52eSEWSFpMH8ztpV/7lz7k1zdh45iEtQbJiwb3Isp2RBSbHVsd
         EuZQMphyvlqNm4D8uFSjKfCvJvttCQvTYJ4ASrY1urUU6LxYv0JSyQevfs9QaGw81OMR
         YwMEUsAw7FYOhkZBtl9P7ZqRpfuBFh9xY745cJVE64Sp7mJg/njD5P0o5nPuxyQp/ldB
         MZCYfcNvBsy0vIn8kT/NQf3++RFNGhnq1Ade8cZl9HdeYsooCdpnMlrfFf7ygFg1T9c2
         caGA==
X-Forwarded-Encrypted: i=1; AJvYcCWv8v/JK2pTemMRI/ZcIMFnwsgDv/wSn4F4CkT3bBC0aM4O9kMZCQ0C5S9t+Nkai79gGX4JUmLau7g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+G5MfI55nxQCzf1ZQqWCyaMiCfchhMz3t8ilp94rTw10Nn+BZ
	1fOng3bMAidJBd8DoDemyzNCmAC1ImcJQrdrg4uTzw7sHiyzd5X7pxrS6GEic+sG4w==
X-Gm-Gg: ASbGnct0zS+IS/14m5LjY2j1eUCigm8L1Iyc1F575JP7M1gGjpUOOZCEZwUyGwY/NoE
	XiYR7/J2PmHRWBWF38ep0Ciex3gIEHYPpbwnXUehWj6sEIBqzXOtS28zmdSvgikSEonJXStw1++
	9sLILFH/av5+WgRHVd+l3y2EBgU7MrqVnMdASaa0WWnaCGECK7etm1bxNjJ/uNoIla98ESS7Brw
	E0Byv2GbeWAA4Rc7YpRZcNrJKrWw2qzkPVK/YriF/p+Fvv/riasRu1/yyqI8KJ5PTSj4ESCcfwg
	JIDZ/j4X40Nchwwf9SE9wXtO4Cq4xqU716D3ndZn6SWiR3/alPwEJlmX8h+Z/HZ9RUftx2Vm+Gj
	MODYmP0yu/ivECrsYw5HMY9DI0qo/zwsQMqqjp3vj5sqA0+A=
X-Google-Smtp-Source: AGHT+IGy5cp0OjzybkdEJmP57uw4j2n7b1ezM6HadPUhx/dohvoavhxgyAMDrfvn+eGSgWU21a0YcQ==
X-Received: by 2002:a05:6512:31c3:b0:553:642f:b037 with SMTP id 2adb3069b0e04-553a646804dmr716292e87.13.1749733375830;
        Thu, 12 Jun 2025 06:02:55 -0700 (PDT)
Message-ID: <95f78e64-77b0-4d27-b43a-268d1791233e@suse.com>
Date: Thu, 12 Jun 2025 15:02:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/18] xen/cpufreq: disable px statistic info in
 amd-cppc mode
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-8-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-8-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
> We want to bypass construction of px statistic info, while not bypassing
> cpufreq_statistic_lock initialization for a good reason, in
> cpufreq_statistic_init() for amd-cppc mode, as P-states is not necessary there.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

I was considering to put this in together with patch 02 (if and when you confirmed
that it can go in with the one hunk dropped), but then noticed that ...

> --- a/xen/drivers/cpufreq/utility.c
> +++ b/xen/drivers/cpufreq/utility.c
> @@ -98,6 +98,9 @@ int cpufreq_statistic_init(unsigned int cpu)
>      if ( !pmpt )
>          return -EINVAL;
>  
> +    if ( !(pmpt->init & XEN_PX_INIT) )
> +        return 0;

... this check is pointless with how things are right now (the same check living at
the top of the sole caller). Hence I think this change should be folded into patch
04. Perhaps to be accompanied by a sentence why cpufreq_statistic_exit() doesn't
need a similar guard.

Jan

