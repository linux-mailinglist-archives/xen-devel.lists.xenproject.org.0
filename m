Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3F98C4D9C
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 10:20:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721220.1124454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nOd-0005tq-IV; Tue, 14 May 2024 08:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721220.1124454; Tue, 14 May 2024 08:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nOd-0005ra-Fw; Tue, 14 May 2024 08:20:27 +0000
Received: by outflank-mailman (input) for mailman id 721220;
 Tue, 14 May 2024 08:20:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6nOb-0005rU-Ml
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 08:20:25 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d007297b-11ca-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 10:20:24 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5231efd80f2so2620452e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 01:20:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b0172fsm693066766b.183.2024.05.14.01.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 01:20:23 -0700 (PDT)
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
X-Inumbo-ID: d007297b-11ca-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715674824; x=1716279624; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Zgh8G1aqBfIdEFiPl2LajYHgmz7y437ztgTEUef/IM=;
        b=daquiFQaPGlx+VN8xoiSUI8Sz7yjl43ZVCh3XqCIzU9nHEBPQn4QG4dP1r0md9yQpm
         sQUHZKliCNipt8pUAxU0/dCL3hhxk+x9+c1P0UP5KnSiAKuIvbiSXOyLOvsxbNv/9OSE
         tQDhplck/hqPLh8H7afyu94JLdiY3Qfz/9Wfq8bo0OGo3xwJOkq9BGbPpJ8qUPYy9mwb
         Bx3U71SRzYRsBXsjbEnqn/qw1TVBD+PU0NfBAfiMMI2vRrLXp8/A18QpzVuJEB78ho5d
         ivYGyJqezYlu6IBvRl0j6BuoruhVqDWkxZu8cDwOzApqLWpIsBfuLGl960tlpzyrdk1T
         ZGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715674824; x=1716279624;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Zgh8G1aqBfIdEFiPl2LajYHgmz7y437ztgTEUef/IM=;
        b=GGDbddsK+v10MPnqeqtvUJPzGI+s9/dAYVCnMvajxRt/AR7rLeh8rGpwdRbrcxuk3o
         /+4VygNj6pCmF1z90Lu/3m0bzNXWT2deMJ3UpYXfP5onzygZUCqsH4dmBP88JvvsW+ZY
         wFzDTklwMczH5NVTgNSoPn1PAUuQwFM1embKR41ZZNTpAiA+46iLuY/GYmDUQxm/TKRN
         GCpUhSnR3Rs7MTX/7yBquEEug9Zrss7oj1mGysEk1nvpRLm1UViylUHFr+5IcDdzM0jv
         9JDPXOzwAXio2ZsdMDCECpz4oQtNo2DzVrW9iahIMq4h5mv/A6c0lU6qzZBaQxJnRQIf
         faVQ==
X-Gm-Message-State: AOJu0YxMaS1fJMzXGkWrlm96AYiRwF6u+8S49l5LpGapf5e6j43CxmSB
	WGvZ/Q5p03Ns5hclD3LkDO25I4JwtEl4uR0iiXlB0TqGgwlzqOKyfL945G1DdA==
X-Google-Smtp-Source: AGHT+IGEHAN1vsFQid7mIRKMTBlXUy5mOBAdf4XSnOrKUDI4Jj4zpPMB0W3XhUGZjzGjbDwQb2a8jA==
X-Received: by 2002:a05:6512:33c5:b0:522:2a2c:759e with SMTP id 2adb3069b0e04-5222a2c76c2mr8441709e87.6.1715674823897;
        Tue, 14 May 2024 01:20:23 -0700 (PDT)
Message-ID: <0b95b04d-22c1-4ec9-8d3e-a4974e7610bc@suse.com>
Date: Tue, 14 May 2024 10:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Serious AMD-Vi(?) issue
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kelly Choi <kelly.choi@cloud.com>, Elliott Mitchell <ehem+xen@m5p.com>
References: <e9b1c9c4-523b-481b-946e-37c7c18ea1d2@suse.com>
 <ZgHwEGCsCLHiYU5J@mattapan.m5p.com> <ZgRXHQpamLIdu7dk@mattapan.m5p.com>
 <c2ce4002-58d5-48a3-949c-3c361c78c0ac@suse.com>
 <ZhdNxWNpM0KCzz8E@mattapan.m5p.com>
 <2aa4d1f4-ff37-4f12-bfbb-3ef5ad3f6fdd@suse.com>
 <ZiDBc3ye2wqmBAfq@mattapan.m5p.com>
 <f0bdb386-0870-4468-846c-6c8a91eaf806@suse.com>
 <ZiH0G5kN6m+wlNjn@mattapan.m5p.com> <Zj7vkp4r0EY9rxT4@mattapan.m5p.com>
 <ZkHTC4RpUSpKj4wf@macbook>
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
In-Reply-To: <ZkHTC4RpUSpKj4wf@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.05.2024 10:44, Roger Pau Monné wrote:
> On Fri, May 10, 2024 at 09:09:54PM -0700, Elliott Mitchell wrote:
>> On Thu, Apr 18, 2024 at 09:33:31PM -0700, Elliott Mitchell wrote:
>>>
>>> I suspect this is a case of there is some step which is missing from
>>> Xen's IOMMU handling.  Perhaps something which Linux does during an early
>>> DMA setup stage, but the current Xen implementation does lazily?
>>> Alternatively some flag setting or missing step?
>>>
>>> I should be able to do another test approach in a few weeks, but I would
>>> love if something could be found sooner.
>>
>> Turned out to be disturbingly easy to get the first entry when it
>> happened.  Didn't even need `dbench`, it simply showed once the OS was
>> fully loaded.  I did get some additional data points.
>>
>> Appears this requires an AMD IOMMUv2.  A test system with known
>> functioning AMD IOMMUv1 didn't display the issue at all.
>>
>> (XEN) AMD-Vi: IO_PAGE_FAULT: DDDD:bb:dd.f d0 addr fffffffdf8000000 flags 0x8 I
> 
> I would expect the address field to contain more information about the
> fault, but I'm not finding any information on the AMD-Vi specification
> apart from that it contains the DVA, which makes no sense when the
> fault is caused by an interrupt.

Isn't the address above in the "magic" HT range (and hence still meaningful
as an address)?

Jan

