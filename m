Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0C8C73F7F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 13:31:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167239.1493575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3pC-0005Xy-75; Thu, 20 Nov 2025 12:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167239.1493575; Thu, 20 Nov 2025 12:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3pC-0005VE-2o; Thu, 20 Nov 2025 12:31:46 +0000
Received: by outflank-mailman (input) for mailman id 1167239;
 Thu, 20 Nov 2025 12:31:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vM3pA-0005V6-Mb
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 12:31:44 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df366165-c60c-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 13:31:43 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b75c7cb722aso116364166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 04:31:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cdd5e0sm211308266b.1.2025.11.20.04.31.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 04:31:42 -0800 (PST)
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
X-Inumbo-ID: df366165-c60c-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763641903; x=1764246703; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iUJNvtSs1ArzqqmSIRBjdE4Eji3ImF/s8WfukGe1JS4=;
        b=Z2NpH4wCbo17FvUUqPZkSW+lu0obj8jMsxPQk+u/bHH4Fp3GN/l2CjpKv0v6KwxJtf
         8E1BY+yrB8i501WISQ9bSganluVMD6pM0cuacxEaPseu7kX8Y9cmCbZRVx+/v8PGZEaW
         KcOiZIh0ZTlkSh5SI6E7S+HkLdvcSEwYCam56pFSEh45/lJ5dHsVtvO3ez2hHYMmc2e/
         YCMaVSgbbcFvA7YzYA2iqWVG8X+kzqkR97+oXCkGJ0Uc+McjmC3n/JfwcVL5zr5E0rmj
         aUd4ImDCw+6cz4CF9LTvimohxadqPeeDfdWtxzGpBD7KyawNgyndRadCnmRg1f6Czdky
         +E7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763641903; x=1764246703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUJNvtSs1ArzqqmSIRBjdE4Eji3ImF/s8WfukGe1JS4=;
        b=Ug8gw5pZQfH1M3YcW02DNt2hPxsxr9ssLtM6LKNbVA2hEcprxt4s7tv/G4EASzv7+T
         5UOwNerTnpyKldwLDuyLabgi9mX31wZr6gxFrn/POUguysQC9mLYIWWS4gdiBEaEh8oa
         DHMTb/4TivJ34ApCj8POgtQlFmloIV6K8VXLSyTb1Ejl52uebGiAZV/jGUfwIiKJTyzK
         nTW0TOLIL5yywjOqhPY1zugafigcCQS9z1q4S+tcpQQICzC/C3Y40aw9p20ES/kYX9Mw
         5dMkSU9iQ5RTpPEsi2bHlVY81jT/6fPKWsVPT7jIOW59VX0gHwb2v+guosnLdPTXMb6B
         hn2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcdxzjXlX6ttRujw7YgzsZqqWp1lIkhAYfx2uJDXRRIIiN0mlO/J2/5TQDZTAcxdR1rbpJaaW8hOE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxedt5msXiEQXbotv5nsd1dkTascuyH1U8GY9gAnSJEqMouTyRO
	TDEXkrYHe5O+pTDTp4x2Q125t33sYiLciBZ4jJEvzcWPhXapXdgojujwjtE2/UYdCA==
X-Gm-Gg: ASbGnctnSaz4Ywcje+9qXWe2078KH93Kym6h0RTsltr2/a7Vs29uYSDkdG4rs2yY07g
	WDCbqJAnw5/LdReRcf3RqQPnQ0AokmDAParSRLCbGlQfbgMgc8rci5RRexPuTlm4EfE+g6otgT9
	0tmebOeAEakypNtSqsM58rhFVhcQtetFHFdXQ1bLpu8/CuX2sV5GH310avgp5nxZPgbXVmprItK
	I/+1JJXDNskLgLSdeGjt4sBO/viHWDsE7Br0JY2myaP2Gxltse13JYy/MuZPJXra4BZ8iMP2u3k
	8mOs7O3WK4Z7giDWkRVp55uMtbJY0ufJHT5/+bTp3gOBt1dJFIRX3nsPKDkPm1pxJaQVxoq8wWn
	KDu5RMjPIyEk4S+IT3OV3w4/wpc92Gh+Fd+e7WPkOiQ2qjW0sIMc852ocWy//uOYdOh0kCpM3s2
	XqWLCzwWpIJRELNXVmr6oslsgxcXysyz0UDwhwpTU5/QoXKSLsmi8g+kqw2DBXXRGawaBGwRA3Q
	cS6M0+f4thS/w==
X-Google-Smtp-Source: AGHT+IF0TMS7zrzBuCH2WOENvRPyABjyK7paL2o17cflsp9vX8gTp2YuxKyrACEP0hXjQhoeEmRI7g==
X-Received: by 2002:a17:907:60cb:b0:b73:8c6e:cf6f with SMTP id a640c23a62f3a-b76553f9a58mr280242466b.32.1763641902964;
        Thu, 20 Nov 2025 04:31:42 -0800 (PST)
Message-ID: <bde84a94-77af-4fec-9075-a709323abdc4@suse.com>
Date: Thu, 20 Nov 2025 13:31:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/vPMU: don't statically reserve the interrupt
 vector
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
 <06f2081b-64e0-47f5-b66a-26363979cfdb@suse.com>
 <f491eb9c-7822-4637-95a3-bcd994b20dea@citrix.com>
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
In-Reply-To: <f491eb9c-7822-4637-95a3-bcd994b20dea@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2025 13:24, Andrew Cooper wrote:
> On 19/11/2025 10:51 am, Jan Beulich wrote:
>> --- a/xen/arch/x86/apic.c
>> +++ b/xen/arch/x86/apic.c
>> @@ -1313,16 +1313,6 @@ static void cf_check error_interrupt(voi
>>             entries[3], entries[2], entries[1], entries[0]);
>>  }
>>  
>> -/*
>> - * This interrupt handles performance counters interrupt
>> - */
>> -
>> -static void cf_check pmu_interrupt(void)
>> -{
>> -    ack_APIC_irq();
>> -    vpmu_do_interrupt();
>> -}
>> -
> 
> I know you're only moving this, but it's likely-buggy before and after. 
> ack_APIC_irq() needs to be last, and Xen's habit for acking early is why
> we have reentrancy problems.

I was wondering, but was vaguely (but apparently wrongly) remembering that
the PMU interrupt is self-disabling (i.e. requires re-enabling before it
can fire again). Should have checked vpmu_do_interrupt() a little more
closely, where from the various plain "return" it's pretty clear that isn't
the case.

> I think there wants to be a patch ahead of this one swapping the order
> so the ack is at the end, so that this patch can retain that property
> when merging the functions.
> 
> Or, if you're absolutely certain it doesn't need backporting as a
> bugfix, then merging into this patch is probably ok as long as it's
> called out clearly in the commit message.

No, I'll make this a separate, prereq patch.

Jan

