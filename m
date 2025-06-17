Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9270CADC18D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 07:24:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017685.1394680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uROng-0004dy-7I; Tue, 17 Jun 2025 05:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017685.1394680; Tue, 17 Jun 2025 05:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uROng-0004bz-4H; Tue, 17 Jun 2025 05:24:00 +0000
Received: by outflank-mailman (input) for mailman id 1017685;
 Tue, 17 Jun 2025 05:23:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uROne-0004bt-Qz
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 05:23:58 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e6d2bbd-4b3b-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 07:23:47 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4531e146a24so32167925e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 22:23:47 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f21a:fe:66b6:9dc3:86d6?
 (p200300cab711f21a00fe66b69dc386d6.dip0.t-ipconnect.de.
 [2003:ca:b711:f21a:fe:66b6:9dc3:86d6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e243e59sm161778605e9.19.2025.06.16.22.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 22:23:46 -0700 (PDT)
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
X-Inumbo-ID: 3e6d2bbd-4b3b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750137827; x=1750742627; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5MR8GbeSgTR/iq6fE8LX+vUJKse8ToE0O9/sKPOHwyw=;
        b=R91j+64ozeUoDYscA+/YRq5slQ5Ogo4h9tlPXi5IKKVcIRQjLGdvb0o7jVhlKsoxVY
         nqJzhR7DnXtlFwNCKPpcK+lBhLwDHi0VUcEAAu9+UYAWAosOyzaEC+NGJby749vT9wnT
         kbEFoBJGXe4/gEzH2eL9Z7dkoVVpgMjjhCKnIES9UFojYqyB+P+MYdl+7SCxlGV75gYY
         Tfp8RvvNO2bc79/xB7M2bRci30TM0x3u5UIJJqIM+nlvgCu+Z946DbMu2XRED9Yz9Tih
         gXy6fKnTzYm9zppu/qKpD5VPJL2ADgBQBH7EFUMzDR+mnzD7d6VgI11ym9WBaY+Nt86Q
         N0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750137827; x=1750742627;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MR8GbeSgTR/iq6fE8LX+vUJKse8ToE0O9/sKPOHwyw=;
        b=f/d+9H87dmRPcIjBR9WSMpvAPy7CxevRDGRW6/1qa63od/qxa025Ki/bnhivCVdGv1
         /RvZpqEpJ7g94k6kBK05vBsSn2kktPecggP62cAfgi0GL+vJ6XsbsOGcHpPe8gRUoH3D
         +ema0EL6+PzbhFWMHdXlrd2P/t5xvgpqKKQlmmpxq3I0LzsxaQWutKJ1c0UN8L2UHkB8
         3xcNSvJugvP2EcvuM0/U4GjwjrXEYLBo8QEsjduoREB87p92+kKBbklF7Km9FjdCm6AW
         cJsFjocHucTlVuZawWWmy97goFVOYQp8lD8wl6rW5lHgAGC8ryjrhm4cKV3YFjDG0DAx
         ah3g==
X-Forwarded-Encrypted: i=1; AJvYcCVp35J/v+Fatkp+4/A4YO6mfgXqRhjDIlCQk9uP3asaKM6e7zK5sLfkG1am1CfZov9+9icVujKmXGc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwW08HiBJ57DiJsntU+VJSoRVVGIzgi1klerOrZ/XRMvtX7BISu
	nuKVLvF53q9W+ow5QiMi7Vz8zwla3S+wZUznFoJKzCQ+jK7KEZ4rokQa6Z8NeVlvMA==
X-Gm-Gg: ASbGnctXCtxbEnnlaPaDBlF408ppVN2XvuB9jiLMr9BX6avI9mdbkwPNB0mWnLZ2C8S
	BqYOM+Cw6cUiTZYF4DgOq46M3Sti05ueGHrfYr0g5dip9RBE1Mw9antMLm369EsgEgGUbDHqiDG
	bcCLmkCQKwPrIrFDVVtchmN4MtzPlixaxNLhzyk6S+4dVJ5EQrzvAh/q/KB+dbvjGgPBfZ0zauJ
	Lk5E7rksR6kiyHQl6xVSwxeHDRAtfhYbSR4eTtOihVSkOHZTuAGh70p8tckCfcJfMj5+k+QHr1I
	QF6KztOHKrJfUt63w0SmsDjOCTrpApnHUnDBKvC/uePsz+85eb+MjuXJgyUEQnllKm3DzI5j5gB
	ywqnYu83xxGD0BTD+Bupu4HRoPvpvSieeFwKy8d7Pqk2Ocfzx5mjOX0wEohkXrmCd/wiTMv0Xws
	qcBsFdi3R1q/KYnn2SPl5Y1W859Q==
X-Google-Smtp-Source: AGHT+IEyC6SDQFvjNXMqoRIyXX2T6kdz29iwAANorohWJlk7paeNKUgxqgCQ8X/enVKEQhWzLaD2VA==
X-Received: by 2002:a05:600c:1d01:b0:442:ccf9:e6f2 with SMTP id 5b1f17b1804b1-4533caa6bb6mr108711325e9.16.1750137826620;
        Mon, 16 Jun 2025 22:23:46 -0700 (PDT)
Message-ID: <5645e4dc-7598-414d-a2b5-39066401e9b3@suse.com>
Date: Tue, 17 Jun 2025 07:23:43 +0200
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
In-Reply-To: <alpine.DEB.2.22.394.2506161705370.1384757@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2025 02:10, Stefano Stabellini wrote:
> On Mon, 16 Jun 2025, Jan Beulich wrote:
>> On 14.06.2025 00:51, Stefano Stabellini wrote:
>>> On Wed, 11 Jun 2025, Jason Andryuk wrote:
>>>> On 2025-06-11 09:27, Jan Beulich wrote:
>>>>> On 11.06.2025 00:57, Jason Andryuk wrote:
>>>>>> Allow the hwdom to access the console, and to access physical
>>>>>> information about the system.
>>>>>>
>>>>>> xenconsoled can read Xen's dmesg.  If it's in hwdom, then that
>>>>>> permission would be required.
>>>>>
>>>>> Why would xenconsoled run in the hardware domain? It's purely a software
>>>>> construct, isn't it? As a daemon, putting it in the control domain may
>>>>> make sense. Otherwise it probably ought to go in a service domain.
>>>>
>>>> My approach has been to transform dom0 into the hardware domain and add a new
>>>> control domain.  xenconsoled was left running in the hardware domain.
>>>
>>> I think we should keep xenconsoled in the hardware domain because the
>>> control domain should be just optional. (However, one could say that with
>>> Denis' recent changes xenconsoled is also optional because one can use
>>> console hypercalls or emulators (PL011, NS16550) for all DomUs.)
>>>
>>>
>>>
>>>> I suppose it could move.  Maybe that would be fine?  I haven't tried. The
>>>> Hyperlaunch code populates the console grants to point at the hardware domain,
>>>> and I just followed that.
>>>>
>>>> One aspect of why I left most things running in the Hardware domain was to not
>>>> run things in the Control domain.  If Control is the highest privileged
>>>> entity, we'd rather run software in lower privileged places. Especially
>>>> something like xenconsoled which is receiving data from the domUs.
>>>
>>> Yes, I agree with Jason. It is a bad idea to run xenconsoled in the
>>> Control Domain because the Control Domain is meant to be safe from
>>> interference. We want to keep the number of potential vehicles for
>>> interference down to a minimum and shared memory between Control Domain
>>> and DomUs is certainly a vehicle for interference.
>>
>> As much as it is when xenconsoled runs in the hardware domain? Especially
>> if the hardware domain is also running e.g. PV backends or qemu instances?
> 
> It looks like you are thinking of the possible
> interference from the Hardware Domain to the Control Domain via
> xenconsoled, correct?

More like interference with the system as a whole, which simply includes
Control.

> If that is the case, good thinking. I can see that you have really
> understood the essence of the problem we are trying to solve.
> 
> That is not an issue because the Control Domain shouldn't use PV
> console. Instead, it should use the console hypercall, or the
> PL011/NS16550 emulators in Xen.

Well. I think the underlying concept of Control Domain being highly
privileged needs more general discussion. As indicated elsewhere, I
didn't think disaggregation (whichever way done) would leave any
domain with effectively full privilege. I wonder what others think.

Jan

