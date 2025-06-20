Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A91EAE1394
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 08:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020563.1396715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSUsa-0006cT-GC; Fri, 20 Jun 2025 06:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020563.1396715; Fri, 20 Jun 2025 06:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSUsa-0006a1-BJ; Fri, 20 Jun 2025 06:05:36 +0000
Received: by outflank-mailman (input) for mailman id 1020563;
 Fri, 20 Jun 2025 06:05:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SdMF=ZD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uSUsY-0006Zk-3i
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 06:05:34 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92ed04a3-4d9c-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 08:05:32 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a4f71831abso1230233f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jun 2025 23:05:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3159df71ec2sm973411a91.6.2025.06.19.23.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jun 2025 23:05:31 -0700 (PDT)
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
X-Inumbo-ID: 92ed04a3-4d9c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750399532; x=1751004332; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gkd41WsjguVOu2NBDtKwFOEZdFlvEA2btEl/Afg5iyw=;
        b=e0GTSXgb+q4QUuAEkKTmjQd68oVe8B0QEi39SIpmXVAnWQAE9Y9hSYD6Eo5YsKTOgo
         bY56NHcUESun6qQZlknvfwS8SFmyr7l9RMl/tQ1hBIzf+jBkOHzwJwYvF5SUtsbXj1ji
         cIu4231Rds/nirJZvM8lisLCttJKRThzFe6nfUcZhjH1bzZr07UqMMShkmC8cTYjxc7b
         b5OvSxab287V4NzkifIHZADwTUo7Kf1UbfS6ueUUhdjpDuJK3KE4Bb8U3APkgaQROGI5
         Bpv/lzjrpzofWrmZKxID2GLSRUVenrWinqCPb4CWMqFu6OacOMng1Wzw5hRO/DbLcHIL
         xODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750399532; x=1751004332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gkd41WsjguVOu2NBDtKwFOEZdFlvEA2btEl/Afg5iyw=;
        b=vqYqwetEevaTDtDF+e7bOYFjLXmKVN0gyLynJ/gabKTrLVq126Fmqq1KTveGs60/xq
         wQFgMKB1wmrCMQWwzW3ZlMJ6SV8WwC9PteqqvjHQ0SObIZu6rP39whM23Rc0i0cZjVqN
         AD9HskjelljNphYIJETO9aSC0x8Qq7W945B0zGs/V4vV2Jm5iTasSsGeD8cYFWRlc+c8
         uze5EN9x+4E41OgRoV9JU+VkgLgPDlwZIv+MbDGBpsPU7ZVv6VqmeiJTZasxzGq5lb8d
         rIJSVlu6zXHY0P54PrSDBx521AL0MNifihgEVcI1/eIALWc3X+B5AmB5qM0LUCqU3IXH
         uC2A==
X-Forwarded-Encrypted: i=1; AJvYcCVKKvoY0ISZf5e1lkyUksSYnie0nirUQwB2ID50usPqyzmXYaHpxgn+DJElFQt5DGbwnA/5+VEv2gA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdrgT68yG3cdYPkcUkvJ8qlB17LkNiirnZZJ8mpi+Ol70mWumU
	+SdxbPNxqUydE9YiLYMfWMVWhxOhuaOe059Wv9p+fvEeDLmsHZaU6+hGZxNT72cI8w==
X-Gm-Gg: ASbGncuL1fsWEoRJS+ijPkYKI3su5fGuJ9w1+bBDXmLnHDacXVg8br9RdX6bIY4bT+J
	kvSnbA98908fygV4IRNAQbTeYFrO0GbLP2SszK+4jolExuBD/7ey3sL955QkR5navMHel+5A6VB
	wof5C1xTUKghtUS66VQ0kb5ZBVIYb7L7nq1gVm8poHw9skwt54rb1w63z9DNW0RztQl9mUtfXSy
	w7Qm5T3hf8l3zKiX2ZK2pMMcQDsdLfI0woLb6DGd/Xc/AqtFJ0rDsH2Ss94w3wTgoPfgWOw6rmn
	cXuqx/ExxeTiIu6nHr5Mk0wvXy/XsYQgKpFUnQc4DDKM0qXVQrULuqWhsaGU59gPRxOXcqY5Q0D
	KvXedXoVW1VzgQQYNNMlAQT16XCwrXvLvv2Mj950qF16S8zs=
X-Google-Smtp-Source: AGHT+IHalWilCAQ8KI+kC57rKAF8fU8rIBDI3WLdoZh2xD1PCb6NaIWRHG9wUL1G72Rd+QxXM+sr2A==
X-Received: by 2002:a05:6000:41d2:b0:3a4:d994:be4b with SMTP id ffacd0b85a97d-3a6d12c4551mr1076200f8f.1.1750399531847;
        Thu, 19 Jun 2025 23:05:31 -0700 (PDT)
Message-ID: <88bb4934-014b-4710-9e81-5697255cc626@suse.com>
Date: Fri, 20 Jun 2025 08:05:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] xsm/dummy: Allow hwdom SYSCTL_readconsole/physinfo
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <20250610225737.469690-5-jason.andryuk@amd.com>
 <5f6d43da-2600-4c1c-9bcb-f13e8fce921e@suse.com>
 <bf6924f8-26c6-4f89-8441-155735384a8a@amd.com>
 <alpine.DEB.2.22.394.2506131547320.8480@ubuntu-linux-20-04-desktop>
 <bf6fd680-c608-4d64-ad8f-38eac102991e@suse.com>
 <alpine.DEB.2.22.394.2506161705370.1384757@ubuntu-linux-20-04-desktop>
 <5645e4dc-7598-414d-a2b5-39066401e9b3@suse.com>
 <alpine.DEB.2.22.394.2506181736280.1780597@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506181736280.1780597@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2025 02:36, Stefano Stabellini wrote:
> On Tue, 17 Jun 2025, Jan Beulich wrote:
>> On 17.06.2025 02:10, Stefano Stabellini wrote:
>>> On Mon, 16 Jun 2025, Jan Beulich wrote:
>>>> On 14.06.2025 00:51, Stefano Stabellini wrote:
>>>>> On Wed, 11 Jun 2025, Jason Andryuk wrote:
>>>>>> On 2025-06-11 09:27, Jan Beulich wrote:
>>>>>>> On 11.06.2025 00:57, Jason Andryuk wrote:
>>>>>>>> Allow the hwdom to access the console, and to access physical
>>>>>>>> information about the system.
>>>>>>>>
>>>>>>>> xenconsoled can read Xen's dmesg.  If it's in hwdom, then that
>>>>>>>> permission would be required.
>>>>>>>
>>>>>>> Why would xenconsoled run in the hardware domain? It's purely a software
>>>>>>> construct, isn't it? As a daemon, putting it in the control domain may
>>>>>>> make sense. Otherwise it probably ought to go in a service domain.
>>>>>>
>>>>>> My approach has been to transform dom0 into the hardware domain and add a new
>>>>>> control domain.  xenconsoled was left running in the hardware domain.
>>>>>
>>>>> I think we should keep xenconsoled in the hardware domain because the
>>>>> control domain should be just optional. (However, one could say that with
>>>>> Denis' recent changes xenconsoled is also optional because one can use
>>>>> console hypercalls or emulators (PL011, NS16550) for all DomUs.)
>>>>>
>>>>>
>>>>>
>>>>>> I suppose it could move.  Maybe that would be fine?  I haven't tried. The
>>>>>> Hyperlaunch code populates the console grants to point at the hardware domain,
>>>>>> and I just followed that.
>>>>>>
>>>>>> One aspect of why I left most things running in the Hardware domain was to not
>>>>>> run things in the Control domain.  If Control is the highest privileged
>>>>>> entity, we'd rather run software in lower privileged places. Especially
>>>>>> something like xenconsoled which is receiving data from the domUs.
>>>>>
>>>>> Yes, I agree with Jason. It is a bad idea to run xenconsoled in the
>>>>> Control Domain because the Control Domain is meant to be safe from
>>>>> interference. We want to keep the number of potential vehicles for
>>>>> interference down to a minimum and shared memory between Control Domain
>>>>> and DomUs is certainly a vehicle for interference.
>>>>
>>>> As much as it is when xenconsoled runs in the hardware domain? Especially
>>>> if the hardware domain is also running e.g. PV backends or qemu instances?
>>>
>>> It looks like you are thinking of the possible
>>> interference from the Hardware Domain to the Control Domain via
>>> xenconsoled, correct?
>>
>> More like interference with the system as a whole, which simply includes
>> Control.
>>
>>> If that is the case, good thinking. I can see that you have really
>>> understood the essence of the problem we are trying to solve.
>>>
>>> That is not an issue because the Control Domain shouldn't use PV
>>> console. Instead, it should use the console hypercall, or the
>>> PL011/NS16550 emulators in Xen.
>>
>> Well. I think the underlying concept of Control Domain being highly
>> privileged needs more general discussion. As indicated elsewhere, I
>> didn't think disaggregation (whichever way done) would leave any
>> domain with effectively full privilege. I wonder what others think.
> 
> Keep in mind that the threat model here is different from the
> datacenter. 
> 
> But the Control Domain is optional. If the user doesn't want it, the
> user can avoid it.
> 
> Even on a fully static system (no VM creation), it is convenient to have
> a domain that can monitor the others and trigger domain reset (we are
> reimplementing domain reboot to be more like a soft reset so that the VM
> doesn't need to be destroyed and recreated).

Suggesting that in such an environment Control should have no permission
to create domains. This would avoid various threats, including e.g.
massive amounts of dynamic memory allocation.

> As an example, the Control
> Domain could be used to monitor a non-safe domain such as Android,
> detect an Android crash, and trigger an Android reboot.

Yet at the same time it would have to be prevented from interfering with
any of the critical domains.

Altogether this doesn't sound like "highest privilege" to me then.

Jan

