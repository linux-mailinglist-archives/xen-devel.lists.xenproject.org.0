Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A10AB25C4A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 08:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080760.1440973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umRrl-0006cp-Ro; Thu, 14 Aug 2025 06:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080760.1440973; Thu, 14 Aug 2025 06:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umRrl-0006aS-NZ; Thu, 14 Aug 2025 06:55:13 +0000
Received: by outflank-mailman (input) for mailman id 1080760;
 Thu, 14 Aug 2025 06:55:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umRrk-0006aL-H1
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 06:55:12 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9eae632c-78db-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 08:55:10 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6188b6548adso1130496a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 23:55:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618200a0159sm7596088a12.6.2025.08.13.23.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 23:55:09 -0700 (PDT)
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
X-Inumbo-ID: 9eae632c-78db-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755154510; x=1755759310; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4qXG+bIbgMiOJBFJxeVw/3rcYc8u/FkUq2D1f9zpciI=;
        b=JXRNOFcFh3qSONe/9a+f9bU+kODwxYSJLJS3NMpqfIgrhzRob4XTPrzsPVRkZ3Z3Lb
         yig9C1eJ6iJk9mKg4BcvDTxUwDE1pqlfE0WnpgLj+H2IF7ZWDI/t3ep/PO2qMdCcoIpC
         kJNa72Y+MNCLpx20adsqIne7ED7XF6r7or880rKHH/XSTMW6/odx4gNu6f0WaisJBY84
         n0wM9Zuxpnl9ruII2AqMm3cynIaKlGPh1oYFSi1/vnHlH7hHNtfNJanOIv4IcKCRg4IB
         Vn1i2EGrjNQWPqvkV44LSNedOuWWVB91jMlGxS5vO5ouYJFlscVxuXY1r+DdS3MUo0Uh
         MO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755154510; x=1755759310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qXG+bIbgMiOJBFJxeVw/3rcYc8u/FkUq2D1f9zpciI=;
        b=mAaUUMtynTFb0rYDNjliRCnPGL4KDNFNzwi1s8QxMqO5lMChQl4G75e922ScM1SsO5
         U32EnuicMRiZ430Ya9alzM2fCMWi4/h+5ifcsKS0wlxKxEN+Q8kC0USDsskigKAOvt/Z
         fikOzOStwkGMEvVCwz74DdTaEGaylLMpdSHLWMeAdzBua17tPowP0CSz1oCQUxm3gZYn
         aRW7MAwfFT9T+JJMD+xf/ikkycL/O9+ZklqTr6s8bqKozEMSIfuGDpbF5KAN7W+4EBQI
         1uC9VXp8e2v7+4gaw3dsWQQgle0R9VX+WIDz//5EQi5jpZq4FHx5i2+tZjkIwRiBvSfe
         e02Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvS4BFz5QixLoRT8heUAzxYoxjB7rrBEUHN+1LU4nkwjg35OYMPtxqeKONjrFs1Aap7Zu44ZeTLx0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3mrTT01ch6TOIPXhJaLfVx42N/JFF4nxkAet1MiK+I9zwA9HC
	ofompq6gXOb8W+w/qnszOFjFy2UiXj63/Cp1u/03x/NTTZ9+5bCymfQUR1nGJ0CERA==
X-Gm-Gg: ASbGncvlr+63cltwGKmGgqjFQYNCUsm6YOC9AEk+PxsThQhC1mW7hvm55Eh33oY+GDA
	mkJFcnjp1lblUDiGC/hvxvmSfIof/jpKlf3U2+BRReVFE7w7TtzOPHKixyKIaaL/57ZPmtXh463
	SPZwJKCA5DTYnj2K/mn1PiX3Lp4eJbnk3zoxkghKof5j3d4nWjg24SfoAwgiRk9135dFNNSBokX
	9wBz1K0l5cIVd1ywSmQNe2OrhTvdkeJ2iFVop4bfPIR0AkyUO13M/LGmNQnyrsLrlcGV3Uu7yBy
	z56rfhHb0fhekgVCJyOT82zC4xkhLfy+WGkvECmS35d4PM7ygdARPN8/5co00nuk7rAvskDMbeO
	e0XzZjByv5fDoJhdB7k3nAa82CNya+tfw7BHkgInGccwCUQFWLXqjwiaupo4WKsantbDYKXRYGz
	eqUbcRFYQi+5NAKq29Uw==
X-Google-Smtp-Source: AGHT+IEXYdI1phRO3EGwPKyO6oMR88V7KMDHVaLkVvF5pLKcpSdwuh60P6MV9XUL6wrobDFX3R6WWQ==
X-Received: by 2002:a05:6402:3596:b0:617:cd9d:e2a4 with SMTP id 4fb4d7f45d1cf-6188b934575mr1478509a12.2.1755154509723;
        Wed, 13 Aug 2025 23:55:09 -0700 (PDT)
Message-ID: <1b96f2f3-55a2-4b33-84b1-a7c18d38d10c@suse.com>
Date: Thu, 14 Aug 2025 08:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Consider changing CONFIG_ACPI default on ARM?
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-users@lists.xenproject.org, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Paul Leiber <paul@onlineschubla.de>
References: <CAO_48GG1Tg0d3ATnNAYNr0cg7Ty_zsnzT29=dpkk99DxyTWcmg@mail.gmail.com>
 <fceb5df8-d628-479d-acb3-d1d26409fbac@onlineschubla.de>
 <aJLae1Nl0pyOZgyh@mattapan.m5p.com>
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
In-Reply-To: <aJLae1Nl0pyOZgyh@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.08.2025 06:30, Elliott Mitchell wrote:
> On Tue, Jul 01, 2025 at 10:01:13PM +0200, Paul Leiber wrote:
>>
>> Unfortunately, I don't have a direct answer to the question (as is so often
>> the case, due to my limited knowledge and experience). However, I am
>> successfully running Xen on a RPi 4 (mostly, except for some VLAN related
>> networking issues).
>>
>> I used instructions in [1] to install vanilla Debian on the RPi, including
>> UEFI boot and grub. I then compiled Xen with expert options and ACPI
>> enabled.
>>
>> I don't know if there are better solutions. For example, I suffer from the
>> fact that I2C doesn't work when using UEFI boot on a RPi. Nowadays, Debian
>> provides their own vanilla Debian images for RPi and with working I2C, but
>> these images are using a different boot method that I didn't know how to use
>> with Xen.  So far, the procedure described above seems to be the easiest
>> solution for me.
> 
> 
>> [1] https://forums.raspberrypi.com/viewtopic.php?t=282839
>>
>> Am 30.06.2025 um 12:35 schrieb Sumit Semwal:
>>>
>>> I've just begun to experiment with the Raspberry Pi 5, trying to run a
>>> simple xen + Dom0 setup, using uBoot, and the bookworm based Rpi
>>> distro.
>>>
>>> I've tried combinations of the following setup:
>>>
>>> 1. prebuilt Rpi5 kernel + dtbs, and have also tried to build them from
>>> source [1]
>>> 2. Xen from upstream [2] and xen-troops [3]
>>> 3. upstream uBoot from [4]
>>>
>>> but with the same result: [short log below; I can provide a fuller log
>>> if needed]
>>>
>>> (XEN) DT: ** translation for device /axi/msi-controller@1000130000 **
>>> (XEN) DT: bus is default (na=2, ns=2) on /axi
>>> (XEN) DT: translating address:<3> 000000ff<3> fffff000<3>
>>> (XEN) DT: parent bus is default (na=2, ns=1) on /
>>> (XEN) DT: walking ranges...
>>> (XEN) DT: default map, cp=0, s=1000000000, da=fffffff000
>>> (XEN) DT: default map, cp=1000000000, s=100000000, da=fffffff000
>>> (XEN) DT: default map, cp=1400000000, s=400000000, da=fffffff000
>>> (XEN) DT: default map, cp=1800000000, s=400000000, da=fffffff000
>>> (XEN) DT: default map, cp=1c00000000, s=400000000, da=fffffff000
>>> (XEN) DT: not found !
>>> (XEN) Unable to retrieve address 1 for /axi/msi-controller@1000130000
>>> (XEN) Device tree generation failed (-22).
>>> (XEN) debugtrace_dump() global buffer starting
>>> 1 cpupool_create(pool=0,sched=6)
>>> 2 Created cpupool 0 with scheduler SMP Credit Scheduler rev2 (credit2)
>>> 3 cpupool_add_domain(dom=0,pool=0) n_dom 1 rc 0
>>> (XEN) wrap: 0
>>> (XEN) debugtrace_dump() global buffer finished
>>> (XEN)
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 0:
>>> (XEN) Could not set up DOM0 guest OS (rc = -22)
>>> (XEN) ****************************************
>>>
>>>
>>> I'm certain I'm missing something, but before I delve deeper, I just
>>> wanted to ask if this is a known issue, and if so, are there any
>>> workarounds or solutions available for this?
>>>
>>> Any help about this is highly appreciated!
>>>
>>> Thanks and Best regards,
>>> Sumit.
>>>
>>> [1]:  https://github.com/raspberrypi/linux rpi-6.12.y branch
>>> [2]: git://xenbits.xen.org/xen.git - main branch
>>> [3] xen-troops https://github.com/xen-troops/xen - rpi5_dev branch
>>> [4]: https://github.com/u-boot/u-boot.git master branch
> 
> Ultimately Debian is choosing to leave most defaults alone.  So far the
> Xen developers have left CONFIG_ACPI defaulting to off on ARM*.  The
> Debian project doesn't have paid people to support Raspberry PI hardware,
> despite being rather common.  As a result there aren't any official
> Raspberry PI images, but people associated with Tianocore have gotten
> generic images to boot on Raspberry PI hardware.
> 
> I'm unsure of the likelihood of getting the Debian maintainers to
> override the default.  Yet due being by far the simplest way to install
> Debian and Xen on a very common ARM64 platform, perhaps the Xen
> developers should consider changing?

In an open source project everyone is a developer. There is a
significant amount of work someone needs to pick up to change this
SUPPORT.md entry:

### Host ACPI (via Domain 0)

    Status, x86 PV: Supported
    Status, ARM: Experimental

Parties interested in changing the support status of any component are the
primary candidates to actually carry out the necessary work.

Jan

