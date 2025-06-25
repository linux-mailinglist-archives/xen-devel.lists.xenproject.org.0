Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99E1AE766E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 07:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024316.1400221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUIkF-0006WP-1L; Wed, 25 Jun 2025 05:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024316.1400221; Wed, 25 Jun 2025 05:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUIkE-0006TB-Um; Wed, 25 Jun 2025 05:32:26 +0000
Received: by outflank-mailman (input) for mailman id 1024316;
 Wed, 25 Jun 2025 05:32:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUIkD-0006T0-TE
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 05:32:25 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c64fa774-5185-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 07:32:25 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-450cb2ddd46so6520455e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 22:32:25 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f22a:dc83:b72e:7a24:c0fa?
 (p200300cab711f22adc83b72e7a24c0fa.dip0.t-ipconnect.de.
 [2003:ca:b711:f22a:dc83:b72e:7a24:c0fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e810010fsm3599457f8f.74.2025.06.24.22.32.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 22:32:24 -0700 (PDT)
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
X-Inumbo-ID: c64fa774-5185-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750829544; x=1751434344; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0PBeaqPshxiz7kaMy08XNTLoyNAXF1MsQkoXvieZLy8=;
        b=D3Et8j9vF2KZOklJl1eGKdqnnurUBnMJQoxVKSldlS8AGLZudwM02/NHIX5ZkoPa8B
         tHFIN62Q0QPTaV/BP6Pph73bEEoRTNgGq1FxQQv+FcTUAjbqYunLmZHsHYJ6/nhDybxB
         Ys/M8neFDGLrzpPFoMweMs2mfoIexlKmpdNMe4/Nvdbpol89cUwDmU1Qy78aCiuHrgm3
         kNCbCFmNQidJmUX9aZj5LnscQFgB7ntgRMTiFY2ROT0loJqzlVks7ULh3x3b7Kf2QzSQ
         qtGIDt4aQx/FCpyArz3LAHWxIdVlloS3q5ynZl8H/3Aj3OBx+/7l3bjhHv/O7SkKv7em
         +E3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750829544; x=1751434344;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PBeaqPshxiz7kaMy08XNTLoyNAXF1MsQkoXvieZLy8=;
        b=UmgXmaxhB7pWskPJilX8D8dKtzrBWMts09QsTVvYVFPHIuvOAmTDrcE0hsGIM2A/dH
         mvEJesGvSgpi4vUWFqnOPXmhP/JEpXTz9/pYkbjHA32BeuIgIHgLO+oQ7pl1FfA1/hYC
         Y3VEHj80GganqBxOLK+PnE4JOEz4EzoDF++Y64D4C+hr63+X9zGdEzvGe7K96JautgyL
         oV6Rz4g20LT9pSHcvuuHyKLoiyLxJJvOLjrFuG9eXxWlYDUHcHWwtxrywLxJs5iemgHi
         u9jlYCU0jCEp5UUh2jjRYAcyyuHag33tG284e9RtevuPYd9HcEkxtkFSiZdH7hFKYBjo
         y58w==
X-Forwarded-Encrypted: i=1; AJvYcCWADSsVr+ftSpyMQ33TzvCcRacvramvboasPNmqwjtLkvNtmtTkKD5Gpru2LNV+2y+4m5jD4Ta076I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz99gK6yz7dWK1eghxZNfUD+ltjj9n1PU2GCY5OGtBVoMucCpRa
	Y3gEjPtTvzSi0pild1NU0VbETLenhNRoLh4EtcKeJVV8rXZ74eovX8inb73OZ2H8WA==
X-Gm-Gg: ASbGnctpYYFGY76zSUXa7ZY/VuV9M5Ka0b3NN+p0K2mFx+Nun4Kh1cRzDxp0ztUKSc6
	nc8vDfztR3dZS4t8xQNJcRebcfwoWfe36vI68WZJHFObZODX7yobLH1QAEzO5HubKmh25v4U3ln
	YaD7e2iqjrOSIc34+upoACvqnWTYeCFoPMR6mQ8wjhvdsGlrAZGWBhJGJ/RmarJQvLp4BgaG3jm
	hdwAcnRp1iPHAtaIyCW4/UtrZW1IBzdiCpzObTljzvk/+RgXBvE0sSCYowx4U5YFTt/3ihN0m8i
	o7ds9rbWxvwrBp+avBsicXIQOOdEJeBmNwWu7nzxVa8TnxUeFEPCCoJe4AprJTnQ7h42UPVyOV4
	YEwxpkSMEsq7VNl8g+wfOq3rBzDN/SP8+K141sUI2+uwnMziYUcQvCC+8GFa1zHbkETAX0Vz+qf
	Wtzggs1okQpVt3QPd24TQvlfPzMwE9uMg=
X-Google-Smtp-Source: AGHT+IE4GUMgzm5cjuU+Nl98c5+rJJc6D4oFhIG4jh1M3MjA1L8b2HMBMVhiO3K2IjCFiO2i4vfsRA==
X-Received: by 2002:a05:600c:1e03:b0:453:c39:d0c2 with SMTP id 5b1f17b1804b1-453839047d5mr2680805e9.24.1750829544444;
        Tue, 24 Jun 2025 22:32:24 -0700 (PDT)
Message-ID: <48def2b5-44ad-45fa-b052-67520c0961f0@suse.com>
Date: Wed, 25 Jun 2025 07:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hardware domain and control domain separation
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, ayankuma@amd.com,
 xen-devel@lists.xenproject.org, demiobenour@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2506181757282.1780597@ubuntu-linux-20-04-desktop>
 <942a6178-0fe7-468e-8e45-ea255fd20680@suse.com>
 <bc36d2c0-3b25-4735-92c7-6a37c47978aa@gmail.com>
 <alpine.DEB.2.22.394.2506231448430.862517@ubuntu-linux-20-04-desktop>
 <381dba84-3108-42c8-a4e5-7bc74d5e1075@suse.com>
 <2e27e128-398a-4714-b019-eab04520cc97@amd.com>
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
In-Reply-To: <2e27e128-398a-4714-b019-eab04520cc97@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.06.2025 22:14, Jason Andryuk wrote:
> On 2025-06-24 01:25, Jan Beulich wrote:
>> On 24.06.2025 00:51, Stefano Stabellini wrote:
>>> On Mon, 23 Jun 2025, Demi Marie Obenour wrote:
>>>> On 6/23/25 11:44, Jan Beulich wrote:
>>>>> On 21.06.2025 02:41, Stefano Stabellini wrote:
>>>>> Also a more fundamental question I was wondering about: If Control had
>>>>> full privilege, nothing else in the system ought to be able to interfere
>>>>> with it. Yet then how does that domain communicate with the outside
>>>>> world? It can't have PV or Virtio drivers after all. And even if its
>>>>> sole communication channel was a UART, Hardware would likely be able to
>>>>> interfere.
>>>
>>> There are well-established methods for implementing domain-to-domain
>>> communication that are free from interference, such as using carefully
>>> defined rings on static shared memory. I believe one of these techniques
>>> involves placing the indexes on separate pages and mapping them
>>> read-only from one of the two domains.
>>
>> How's that going to help with the backend refusing service, which I view
>> as one "method" of interference? Or else, what exactly does "interference"
>> mean in this context? (More generally, I think it is necessary to very
>> clearly define terminology used. Without such, words can easily mean
>> different things to different people.)
> 
> Yes, there are different kids of interference.  We are concerned about a domain blocking another domain.  The main example is an ioreq blocking a vCPU.  The blocked domain is unable to recover on its own.

On which insns an ioreq server may kick in can be well known. A kernel
can therefore, in principle, come with recovery code, just like it can ...

> A PV backend not servicing a request is interference, but it doesn't block the frontend domain or vcpu.  The primitives don't block, so drivers can be written to handle the lack of a response.  As you note, this can't be a critical service for the domain.

... here. (Not responding at all is also only one way of refusing service,
just to mention it.)

Jan

