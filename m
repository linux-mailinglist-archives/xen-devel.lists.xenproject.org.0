Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6419310AD
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 10:54:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758757.1168227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTHTX-0004gH-2d; Mon, 15 Jul 2024 08:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758757.1168227; Mon, 15 Jul 2024 08:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTHTW-0004ec-Vv; Mon, 15 Jul 2024 08:54:26 +0000
Received: by outflank-mailman (input) for mailman id 758757;
 Mon, 15 Jul 2024 08:54:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FSyp=OP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTHTV-0004eV-Cr
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 08:54:25 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d50b327f-4287-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 10:54:23 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so54668741fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 01:54:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bbb0625sm35708315ad.93.2024.07.15.01.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 01:54:22 -0700 (PDT)
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
X-Inumbo-ID: d50b327f-4287-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721033663; x=1721638463; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AO3RxlduRBFozARpzjUevakUABXRs7ICr+FfUo8i7GI=;
        b=Rwq+vf7IlO9z1SsfMcQnpP3n7at92VxCph4/DcvpHg3CiKSztGEd8JBM1Yw0g+EXuc
         PrVxRA2cB8hSR9yidQnF8XiQGCyWDTuMXzXbyKZK8nM8dK1+9MEGheIsJjNmeCjw2/0q
         XuMMOjtgbF0+5toH4KM11QNagq+8oQw4ETwVI1W1gCXhNuiJOtiNsBuQypgMvINWAN7z
         QDBWaH1bI+oys0SJIzYA/gRmBDVVtUiDmVSxtFrv+lyjPFBH2t1wYvIfTKn2/zAAVaAf
         f3IvYHvR4lyBxKUA10b2KW/wbc3FoQ9FlfrYPqJYI/vfP2TrBhrkzceOPf3x+pjih0Da
         LJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033663; x=1721638463;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AO3RxlduRBFozARpzjUevakUABXRs7ICr+FfUo8i7GI=;
        b=PXc4ViGKyHYhN0CvwEAu4/LyAgYQRT4xacGo4hSxoasGQrpii6coAWE+JbtoBTnRRj
         Sd3uhAH3oG6wjNSC+aau3bhBl5kNJ2i0PGU7ERHT8GQLNmjK8XN9PL3BbFQuZ6aXzPgL
         skDE934qXi943ouMFBwIei+ZTpqLXHjLvhmqTNYwMh4a7Brq1YLV8ejc+AuisC+C6F+1
         LcovvK2nLtT2LMmtjebMM7XYX5JaAgYQk/V1Hjh15f9AJDxbpxu7Hf/+o9do/uEnZhp/
         5woYh6mH7DRW9Ey7372dE1wfGpHucQFtc/Xf+xN6jEYIwQW7Ub4jjmoSZi5kMfdhXC8E
         1wMQ==
X-Gm-Message-State: AOJu0YzPISlS8W2Xt/+2L3qc6iDh1yux9kjgQuovfJq4/eT5uXv+I4L5
	yYCAYyMOHD9rfbfWHo+xcvhW+cFQqm3yvSayytp5fdsA8ZNUOJSIu5YVFj/23g==
X-Google-Smtp-Source: AGHT+IFIwzQnTjsP55mCyRoBYuZo0ajBgyD1/s2qRCaMZVjUDe06gWa+56F1ep/kg8YwZKri4NUt/Q==
X-Received: by 2002:a2e:b059:0:b0:2ec:57c7:c72c with SMTP id 38308e7fff4ca-2eeb3182772mr113455861fa.35.1721033663000;
        Mon, 15 Jul 2024 01:54:23 -0700 (PDT)
Message-ID: <50ab12eb-70ba-4787-98fc-c3c933af2f06@suse.com>
Date: Mon, 15 Jul 2024 10:54:17 +0200
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
 <1423184950.4133169.1721031727075.JavaMail.zimbra@inria.fr>
 <61d717fd-62e3-434c-a326-687b649148c2@suse.com>
 <1365363643.4190382.1721033331904.JavaMail.zimbra@inria.fr>
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
In-Reply-To: <1365363643.4190382.1721033331904.JavaMail.zimbra@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2024 10:48, Fonyuy-Asheri Caleb wrote:
>>>> On 15.07.2024 09:38, Fonyuy-Asheri Caleb wrote:
>>>>>> Perhaps the more important question, are you booting the skylake with
>>>>>> cpuid=no-avx on the command line by any chance?
>>>>>
>>>>> No. I didn't boot any of the machines with any cpuid modification whatsoever.
>>>>
>>>> Yet is there perhaps "Mitigating GDS by disabling AVX" in the boot log of
>>>> the hypervisor (which sadly so far you didn't supply anywhere afaics)?
>>>
>>> I didn't notice that. Unfortunately I no longer have access to the logs to check
>>> since I was
>>> working on resources I reserved for a limited period.
>>>
>>> However, do you mind telling me what this would mean for my environment?
>>
>> Hard to tell, depending on what exactly you use that environment for. If
>> I'm not mistaken (Andrew will surely correct me if I'm wrong), the best
>> you can do is have such systems run with up-to-date microcode. Which of
>> course requires you have control over the physical system (to update
>> firmware) or at least the hypervisor (to hand it a microcode blob to load
>> while booting). If you had control over only the command line, you could
>> also choose to ignore the vulnerability and request AVX not to be turned
>> off ("spec-ctrl=no-gds-mit"). Yet of course you wouldn't want to do this
>> if you were running any not fully trusted guests.
> 
> Quick verification: cpuid=no-avx and spec-ctrl=no-gds-mit are options
> passed to the grub right? 

They're options passed to Xen. If you use grub as the boot loader, then
they would need putting _in_ respective grub config files / scripts.

Jan

