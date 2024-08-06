Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E8A948A0D
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 09:24:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772528.1182975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbEYV-0007Jr-NI; Tue, 06 Aug 2024 07:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772528.1182975; Tue, 06 Aug 2024 07:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbEYV-0007HF-KQ; Tue, 06 Aug 2024 07:24:27 +0000
Received: by outflank-mailman (input) for mailman id 772528;
 Tue, 06 Aug 2024 07:24:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kFQN=PF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbEYU-0007H9-9i
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 07:24:26 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e773c953-53c4-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 09:24:24 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5afa207b8bfso256993a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2024 00:24:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5baec9a2818sm3102043a12.61.2024.08.06.00.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 00:24:22 -0700 (PDT)
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
X-Inumbo-ID: e773c953-53c4-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722929063; x=1723533863; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WbIyOJ9gzY7TRfqlw7xGjPDDzi5zeJl+EwN6wz/Pya4=;
        b=Q9DFzmMklmfyqNeNLrs57xQQ1BuhtqP4rln9j3Zd+1YQC9M2u57Dq2nLh3Y9wcxc3r
         xNvw9OZOigGTuOVVc4d6xbM/fqbP8l+b+e531akHi4Tk2ZuJyq5cuOx71G53BEck8lYc
         df+IMfpr8+L7REjPeqZc+t51gwlajnhlGZo04piRnDQoM7+EUGwdjMSCDzB10EpGJy3Y
         b/J/9DbX4T+yCZBU1Siu6l7RmVBa7oZAlhTCm7EnzKRTakWx3RjfrmnWMpDlOiP1K7/M
         TXTAlMDOsIhlHYZFkg6yoVoESnZwd9DT+PjnKCp2J9n29gRrty4Mz6OkD+BOa7YNaahP
         qKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722929063; x=1723533863;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbIyOJ9gzY7TRfqlw7xGjPDDzi5zeJl+EwN6wz/Pya4=;
        b=wYmDSao3iWmyLGJgpyhyWKq7ncyc4/dfJFkcHfGayxu1QVnGnsXXGxm9p6vf8/AS6q
         aVssRas2L78phbr8kOrtlpxgKHSb8PeIPQCtqTmmwmbrFeH2cn+o2/WMC8guV7sKjeza
         WYtgM5FZJOBxSvwt/pwOV+I+JSYBay3awLU32x8aJJ5igeB++qTpik+glHn9SYEALJno
         /aNdppie8XkcNRN9m0/VfyHMBSwD9444aE02GLGZyrxtsNUh2KOdJLinxOOVjjIhq1LF
         k3ntr/v0p674pVRhZDnhYwBQlGgoDqVj4ieXZAQFiDVYocgYhhUbttSzU6ZiTwcN6uG9
         otIw==
X-Gm-Message-State: AOJu0YzFAc75E4zJSs8zK6HPlcZToh7YDj01iRwL4JB1fDyHcUk5ci7W
	7mH5pc5tIxI02aJHdhw4Lz6RuDLGUTMgAfUJPAxdLZF93VIH8zKfKu8GPWzP4tXIUNoQqvcxHvQ
	=
X-Google-Smtp-Source: AGHT+IH/oGgqXqZahz/hxqJJlhnCsbL4EMrjgFZbNkeBg6+WtuMn5o2q77CmiJik937CQmpMqYDkaw==
X-Received: by 2002:a05:6402:2689:b0:5b9:462d:c539 with SMTP id 4fb4d7f45d1cf-5b9462dcb76mr9288594a12.3.1722929062769;
        Tue, 06 Aug 2024 00:24:22 -0700 (PDT)
Message-ID: <0f69e94a-5720-4f1f-b51d-b4fb2c6bbe0b@suse.com>
Date: Tue, 6 Aug 2024 09:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Help with Understanding vcpu xstate restore error during vm
 migration
To: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <60751777.2038091.1720694327760.JavaMail.zimbra@inria.fr>
 <94e94a94-14f2-4fa6-bc3b-6c64c1b84b59@citrix.com>
 <1546743760.2065506.1720696161057.JavaMail.zimbra@inria.fr>
 <8f8dac21-92fe-4760-8578-2fbfde2f2c14@citrix.com>
 <1557490999.4048664.1721029086794.JavaMail.zimbra@inria.fr>
 <77f1ff6e-a7dd-45c8-b706-429674b559f2@suse.com>
 <ece26efe-c1af-4fd2-910d-01a33beda5cc@citrix.com>
 <120712863.15929301.1722927890402.JavaMail.zimbra@inria.fr>
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
In-Reply-To: <120712863.15929301.1722927890402.JavaMail.zimbra@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.08.2024 09:04, Fonyuy-Asheri Caleb wrote:
>> On 15/07/2024 9:16 am, Jan Beulich wrote:
>>> On 15.07.2024 09:38, Fonyuy-Asheri Caleb wrote:
>>>>> Perhaps the more important question, are you booting the skylake with
>>>>> cpuid=no-avx on the command line by any chance?
>>>> No. I didn't boot any of the machines with any cpuid modification whatsoever.
>>> Yet is there perhaps "Mitigating GDS by disabling AVX" in the boot log of
>>> the hypervisor (which sadly so far you didn't supply anywhere afaics)?
>>
>> Oh - good point.  I'd completely forgotten about that.
>>
>> If you've got out-of-date microcode (specifically microcode prior to
>> 2023-08-08), then yes, Xen will disable AVX by default to mitigate
>> CVE-2022-40982 / "Gather Data Sampling", and the symptoms would look
>> exactly like this.
> 
> I was able to obtain access to an Ice Lake Xeon processor
> which is one of the processors affected by the GDS vulnerability.
> 
> I will like to know what could be the effect of this "cpuid=no-avx" xen default
> on the xstates handled by the system. How does this disabling manifest itself 
> between on my CPUID or list of features? 
> 
> Also, I would like to understand the relationship between xstates in xen and xsave
> dependencies on the system? I was expecting to have more xstates once i have more
> xsave dependencies but was surprised to notice a live migration go through from a 
> cpu with more xsave dependencies to one with fewer dependencies(features which 
> use xsave). Is there something I'm understanding wrongly? 

Here and ...

> Lastly, during vm migration, do we consider all possible xstates or just the active 
> xstates of the cpu? I am not able to figure that out from the code yet. 

... here everything depends on what the guest gets to see. I.e. in your wording
"possible" would mean "possible from the guest's perspective", i.e. what it sees
when it executes CPUID insns with respective inputs. During migration we cannot
go below that, but we certainly can go below what the host may support.

If what you say in the earlier paragraph was the case with upstream Xen and
without you restricting what the guest being migrated was able to see on the
source host, then I think that would indicate a bug somewhere. Yet you don't
provide enough details to be certain.

Jan

