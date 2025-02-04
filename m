Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5081AA27656
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 16:46:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881711.1291871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfL7y-0006Y4-Kg; Tue, 04 Feb 2025 15:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881711.1291871; Tue, 04 Feb 2025 15:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfL7y-0006VZ-I0; Tue, 04 Feb 2025 15:46:18 +0000
Received: by outflank-mailman (input) for mailman id 881711;
 Tue, 04 Feb 2025 15:46:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfL7x-0006VT-58
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 15:46:17 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b1fed03-e30f-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 16:46:16 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5dca451f922so4731236a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 07:46:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc724a9ef2sm9390335a12.56.2025.02.04.07.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 07:46:15 -0800 (PST)
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
X-Inumbo-ID: 2b1fed03-e30f-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738683975; x=1739288775; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jo83YexMf0+WSkWdgjUzTKRb+xEuhiqa4cyBWVohQJg=;
        b=fuecN4Ya0WiDjp+hPVUisu687S5p9PhNuWu3JyxM1RYPKP3hQ7buuHYzgu0OJ7V8bV
         Fycsd6FtffWZtLfnFd+KAq5nHQaOtBZfiAQ/YeiFFum3lIKM6H4oL2Tkd4wCgKGRidSM
         sEtcQKuTjIlxM7KJ+yA7FNUxuCGiofN2O8XRwW5PANkuZJ/VgLk9GuqeQhc12+EENlOY
         b99RZG9bysNiVc1Qdq1ceLKdQvo5lSRNDR7UBVaRMLD4q6RPMwEu2MDKehdRMRx8lxBi
         AMmAB3cdm4QWxLk+HQtA5WCXFAu7R/bpOBfWx5lBkGw7xhav/VEjIs+ceVZZN2Z3QHxy
         dwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738683975; x=1739288775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jo83YexMf0+WSkWdgjUzTKRb+xEuhiqa4cyBWVohQJg=;
        b=mFz6P4T425XFKRL3dFfpSzjAfZpydyCpcL6WSpNMny/M5QWN4JTMiF2PF2Bq7PXrUc
         lSt8aAKSHmd20906beGKfak65n+nqbDiUbGt/LZp+7U3Yj/wi+rfSTzDuAJyRryFv5Zj
         FKkQUkYpdgZ47RkoJ4YaTJkPcf1hTKIMnm38mHtkL0pCXkGFyGdD7aLBQuXU2+e+Z2ny
         bWq2SU1TQGXB8ST6khqJb/ppK2p9qADMM6UjMRLyC2tUvCnRuBLbkfMxF2SN19JNS44N
         WUkLW/BYz0vHtFzCTZvE+YN9z751aqkLyrvEXaC4A200UyeKTId0wlBxiL7Oejb8Wyp2
         Xr9A==
X-Forwarded-Encrypted: i=1; AJvYcCWr98UfeA1VqVHlfyb+5znid0976TnnO3eXo7tpL5av0u602iZRgIOIlO9WV85MsjDGMrsrnU0D0dA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy19NCWjvSyjgp8cHFJ2+2FLrihCvd48NVNYa6DouTC/3TP0saV
	mcEFW5ci4EF+qT+h8ojWLXRrVmZBf1XpbOTlNxUzeIzgnWkYwrGnSVFsQf9Udw==
X-Gm-Gg: ASbGncusvlt+YKbv1i8nzd09vaSZSCSH63XxG9cDrZzcLN+WN9kyKTa5x4jjzTHsvde
	h7H45aSZhDnLscdC/GA1NG2EpqMlAcc3nT4mGoHMosyuKIcUAtKRcDeyOkYRJuO1Z82xN75Rpjm
	0RP62ff/54wupBoZzm3/AVG+gNbakvryTcYgQxqqOrh5qCzkPSo9wQJcQoP7KiCtvb6Y1K59JNj
	58qpwJ/BxGusMpzRJHxi0b+UDYWoTuDl5UtiWfRAxsW08LHt154SeB7XcJSvouh8hSbPWiwDG01
	o5ypzIIjWzODAZuz6dO2UVSyWJ6eN7+mI5N9yXFUp+uXkASe9FYUu437xNn9XQ3YbJhUxaCgQLf
	O
X-Google-Smtp-Source: AGHT+IGd5nfjjhF0HnnZxtphkXhQFxsql+okIwEYyWHOXiq8eo7Xt3k5T1bJY+hmjyW6at8hxJGzSQ==
X-Received: by 2002:a05:6402:34d3:b0:5d2:8f70:75f6 with SMTP id 4fb4d7f45d1cf-5dc5effcb22mr32286442a12.30.1738683975473;
        Tue, 04 Feb 2025 07:46:15 -0800 (PST)
Message-ID: <c179a661-d705-41da-988a-ff361ceaa1f9@suse.com>
Date: Tue, 4 Feb 2025 16:46:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] tools/hvmloader: Replace LAPIC_ID() with
 cpu_to_apicid[]
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250204144542.7399-1-alejandro.vallejo@cloud.com>
 <20250204144542.7399-3-alejandro.vallejo@cloud.com>
 <84c8d20e-b9f1-4593-b5df-86cc00ff33b5@suse.com>
 <D7JRLGZ0KL4Z.39AQU6NC6D0Y2@cloud.com>
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
In-Reply-To: <D7JRLGZ0KL4Z.39AQU6NC6D0Y2@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.02.2025 16:25, Alejandro Vallejo wrote:
> On Tue Feb 4, 2025 at 3:07 PM GMT, Jan Beulich wrote:
>> On 04.02.2025 15:45, Alejandro Vallejo wrote:
>>> --- a/tools/firmware/hvmloader/config.h
>>> +++ b/tools/firmware/hvmloader/config.h
>>> @@ -48,8 +48,9 @@ extern uint8_t ioapic_version;
>>>  
>>>  #define IOAPIC_ID           0x01
>>>  
>>> +extern uint32_t *cpu_to_apicid;
>>
>> Strictly speaking this ought to be part of the earlier patch. If hvmloader
>> was Misra-checked, this would be a (transient) violation.
> 
> Hmmm. I don't see it. The previous patch is fully contained in smp.c and this
> extern isn't required until now. Does MISRA have mandates on non-static symbols
> not present in headers?

Every non-static definition is expected to have exactly one earlier
declaration.

Jan

