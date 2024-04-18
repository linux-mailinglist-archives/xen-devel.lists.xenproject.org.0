Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4C98A93BD
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 09:10:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707981.1106468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxLu7-0002ru-Uv; Thu, 18 Apr 2024 07:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707981.1106468; Thu, 18 Apr 2024 07:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxLu7-0002pn-RW; Thu, 18 Apr 2024 07:09:55 +0000
Received: by outflank-mailman (input) for mailman id 707981;
 Thu, 18 Apr 2024 07:09:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxLu7-0002ph-CH
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 07:09:55 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6eba4d2-fd52-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 09:09:52 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-349caee176bso313099f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 00:09:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a9-20020adfeec9000000b0034744966ff0sm1052896wrp.59.2024.04.18.00.09.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 00:09:52 -0700 (PDT)
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
X-Inumbo-ID: a6eba4d2-fd52-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713424192; x=1714028992; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cVXiLwEK4lo2rGQQrknzRwST23jPGZVmFUBcXdSz3KU=;
        b=aj3Vut7q93fcHdkV1+Wg6oWCgA2SaCapQ0xj457gp0PEmArcuOaNAn+ljw24G6ghLq
         VUFZxSWvCHsl46tjm/tVI19vhnyoasfcXtYjQLT1VWA0ktrGIAU5YhdE1c/z/P0zePLE
         BfAxEc2Fg+1/H8c6clxaSjEFkr5asAImN+j3w9JsCp3e5Rcv7DwkL0z/FSLE1UsGa7fy
         rCQn0Qytj6bRTEi3sBkyOjd43+3ze3IWKT+pq0P/2R58RJuMgqt0QvDFt9ax4snJte2Z
         hIgYm3Ly+5lIYzIC0zICK5zrs831hGomaW5EadxUxOgln/tMNPz2YrEZlu5B+7zcASzl
         ZHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713424192; x=1714028992;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cVXiLwEK4lo2rGQQrknzRwST23jPGZVmFUBcXdSz3KU=;
        b=l8GeTPXNfXMvafq3dxqRD+yxTcJKQ7fNgtlNsp5RR3fQ9tp9iiQgKFnn3UQdYZoB8s
         CUnJYNZC3H1KZ8I0TuCplaIaFvuFU0qJZ9eydSQHRV+iwsgoHf05v4Dzr8vU2L3LR60S
         iiC801NCXOvbekewrKvLO2aRVk0HQHLkYkCQSwrW6zSS/hHp1I8t/NcECNyFUIa8i7r+
         PsJqv18on2NUYL8av5aLrW7Orh+biIf6mezrNQPqYUv7cXNtknUpLa4VWo9ZiRgJuiRn
         S2GOgq0yUq5DzdgeXSZ1tTmpNQpjnUrw45XcxSMuQTtttqurEDpXHsG6/GpfwAwuQwmm
         FR6A==
X-Gm-Message-State: AOJu0YxQohWc2iUqg94FYP9FgkOkFRRt/k0/Top8+VhGOUYt+zAy3yDf
	hZ3GhDA3+Uxg+1WdefMTd306snP7C7rP3ZdSnJkvc7hFfncz8Nxido8pTDjshQ==
X-Google-Smtp-Source: AGHT+IELgKLDS++NfbgaZ06tTRUjdt3quYpFqwbTLotkP7eOSdFcaGadmJyGBD7mmYKgSthVVfK0XA==
X-Received: by 2002:a5d:4150:0:b0:341:8c29:20c6 with SMTP id c16-20020a5d4150000000b003418c2920c6mr874424wrq.50.1713424192534;
        Thu, 18 Apr 2024 00:09:52 -0700 (PDT)
Message-ID: <f0bdb386-0870-4468-846c-6c8a91eaf806@suse.com>
Date: Thu, 18 Apr 2024 09:09:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Serious AMD-Vi(?) issue
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Kelly Choi <kelly.choi@cloud.com>
References: <ZcqoVBnsgUJw8G0l@mattapan.m5p.com>
 <ZfiY7/FBTwPQlfYi@mattapan.m5p.com>
 <CAO-mL=xndFd7xTU4Q+9hjLL-7zqZUGjYcp3_REa6QqXvtyAEYg@mail.gmail.com>
 <Zf3aWXfCANR7zXj8@mattapan.m5p.com>
 <e9b1c9c4-523b-481b-946e-37c7c18ea1d2@suse.com>
 <ZgHwEGCsCLHiYU5J@mattapan.m5p.com> <ZgRXHQpamLIdu7dk@mattapan.m5p.com>
 <c2ce4002-58d5-48a3-949c-3c361c78c0ac@suse.com>
 <ZhdNxWNpM0KCzz8E@mattapan.m5p.com>
 <2aa4d1f4-ff37-4f12-bfbb-3ef5ad3f6fdd@suse.com>
 <ZiDBc3ye2wqmBAfq@mattapan.m5p.com>
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
In-Reply-To: <ZiDBc3ye2wqmBAfq@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.04.2024 08:45, Elliott Mitchell wrote:
> On Wed, Apr 17, 2024 at 02:40:09PM +0200, Jan Beulich wrote:
>> On 11.04.2024 04:41, Elliott Mitchell wrote:
>>> On Thu, Mar 28, 2024 at 07:25:02AM +0100, Jan Beulich wrote:
>>>> On 27.03.2024 18:27, Elliott Mitchell wrote:
>>>>> On Mon, Mar 25, 2024 at 02:43:44PM -0700, Elliott Mitchell wrote:
>>>>>> On Mon, Mar 25, 2024 at 08:55:56AM +0100, Jan Beulich wrote:
>>>>>>>
>>>>>>> In fact when running into trouble, the usual course of action would be to
>>>>>>> increase verbosity in both hypervisor and kernel, just to make sure no
>>>>>>> potentially relevant message is missed.
>>>>>>
>>>>>> More/better information might have been obtained if I'd been engaged
>>>>>> earlier.
>>>>>
>>>>> This is still true, things are in full mitigation mode and I'll be
>>>>> quite unhappy to go back with experiments at this point.
>>>>
>>>> Well, it very likely won't work without further experimenting by someone
>>>> able to observe the bad behavior. Recall we're on xen-devel here; it is
>>>> kind of expected that without clear (and practical) repro instructions
>>>> experimenting as well as info collection will remain with the reporter.
>>>
>>> After looking at the situation and considering the issues, I /may/ be
>>> able to setup for doing more testing.  I guess I should confirm, which of
>>> those criteria do you think currently provided information fails at?
>>>
>>> AMD-IOMMU + Linux MD RAID1 + dual Samsung SATA (or various NVMe) +
>>> dbench; seems a pretty specific setup.
>>
>> Indeed. If that's the only way to observe the issue, it suggests to me
>> that it'll need to be mainly you to do further testing, and perhaps even
>> debugging. Which isn't to say we're not available to help, but from all
>> I have gathered so far we're pretty much in the dark even as to which
>> component(s) may be to blame. As can still be seen at the top in reply
>> context, some suggestions were given as to obtaining possible further
>> information (or confirming the absence thereof).
> 
> There may be other ways which haven't yet been found.
> 
> I've been left with the suspicion AMD was to some degree sponsoring
> work to ensure Xen works on their hardware.  Given the severity of this
> problem I would kind of expect them not want to gain a reputation for
> having data loss issues.  Assuming a suitable pair of devices weren't
> already on-hand, I would kind of expect this to be well within their
> budget.

You've got to talk to AMD then. Plus I assume it's clear to you that
even if the (presumably) necessary hardware was available, it still
would require respective setup, leaving open whether the issue then
could indeed be reproduced.

>> I'd also like to come back to the vague theory you did voice, in that
>> you're suspecting flushes to take too long. I continue to have trouble
>> with this, and I would therefore like to ask that you put this down in
>> more technical terms, making connections to actual actions taken by
>> software / hardware.
> 
> I'm trying to figure out a pattern.
> 
> Nominally all the devices are roughly on par (only a very cheap flash
> device will be unable to overwhelm SATA's bandwidth).  Yet why did the
> Crucial SATA device /seem/ not to have the issue?  Why did a Crucial NVMe
> device demonstrate the issue.
> 
> My guess is the flash controllers Samsung uses may be able to start
> executing commands faster than the ones Crucial uses.  Meanwhile NVMe
> is lower overhead and latency than SATA (SATA's overhead isn't an issue
> for actual disks).  Perhaps the IOMMU is still flushing its TLB, or
> hasn't loaded the new tables.

Which would be an IOMMU issue then, that software at best may be able to
work around.

Jan

> I suspect when the MD-RAID1 issues block requests to a pair of devices,
> it likely sends the block to one device and then reuses most/all of the
> structures for the second device.  As a result the second request would
> likely get a command to the device rather faster than the first request.
> 
> Perhaps look into what structures the MD-RAID1 subsystem reuses are.
> Then see whether doing early setup of those structures triggers the
> issue?
> 
> (okay I'm deep into speculation here, but this seems the simplest
> explanation for what could be occuring)
> 
> 


