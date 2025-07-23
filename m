Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 304FCB0F0F1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 13:13:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053791.1422578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueXPA-0006l0-FZ; Wed, 23 Jul 2025 11:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053791.1422578; Wed, 23 Jul 2025 11:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueXPA-0006jK-BP; Wed, 23 Jul 2025 11:13:00 +0000
Received: by outflank-mailman (input) for mailman id 1053791;
 Wed, 23 Jul 2025 11:12:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmaN=2E=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ueXP8-0006jE-NX
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 11:12:58 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa34fdfb-67b5-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 13:12:53 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso5811752f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 04:12:53 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca253e1sm16186778f8f.5.2025.07.23.04.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 04:12:52 -0700 (PDT)
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
X-Inumbo-ID: fa34fdfb-67b5-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753269173; x=1753873973; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/IEEOBjpOLRVnMDe6HIToRKxqa/KTw8V9M+vHl4FwJc=;
        b=uLOQYAD21te+HHyCxpwjWbAp9EKZbQIiviRBxnd8ds1gHSxeo/hDycauyJInJeJcLW
         ARhVOKCl+xpEl0r2zHD1ZKSP3o7yu2e77lG0/wuuc+9nHoeX8kZe17NDrluLza4+YMr9
         +YMunQiWUSAjGBAfBXVizpNmH3V/vvnNgvChI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753269173; x=1753873973;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IEEOBjpOLRVnMDe6HIToRKxqa/KTw8V9M+vHl4FwJc=;
        b=d9pZ/SEuMV5obWxSrNDf+nnKxcCc0wlnLVaCBa9IRi/hbz5+NBzveUBMjZjUMRrCnR
         ICFFWEYJbVfBHqwuzhN2PR/vmRIzH4s8Ye3P1bPQjZJc67C+feOuvd5vGV98LF/fia3k
         o0XdF9N/7U6aMyZ8Sh7VkeYOjQGw6OcA2H282iDzyy65a5Kfj58wUUG4q7U7Uqowl+CE
         iEbVgLJ8/H3j9hU/sPrxySh80gvHht0pgcYMZZErMHUk8F7qvyrcx0OyF7Wx4fCRng93
         XlaEGXU0PPcwrBoH/2q56xzjD0UtGtNVGLgCyiQPRYInUbiqcBKHbLw62MgWNbwp3xlH
         PyLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5ot71uuN0rqZQUbJE1WS2+qFWNTQQd3rtT9gZa8lR0APX5qxCTWX6CAObhJTkArENxZMzsbTfTRw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxc/DCJdOeHondbESaSSRt3Bn2U1ZR/QJ4zUwX/NuCaqIfT9i7c
	quqrTTdjrB2ebYo2spie97yqNUvIoFVQBeslife2dh0pTBejd9g5U1vZ+TouV/bphwY=
X-Gm-Gg: ASbGncslTBVBL9hynNt6N0Y+eFKAs40Trfv+yU/5wFC1xdMhhyhu9arPZIiQX62XZOO
	kgQImfGnPlD84jpS3UebxxgYFlPZ0ufdaRb8xoNxLqIm4aUkVieezR/CC8ajAJtZVrO4+7EzchU
	wIbMWsEVi6IigjPWCcwRbtz0Zo5c0weRPWPuHfPmL6abgjSf/wpN2TNwhhU82rriXYIIqsZ4/Ys
	f5O8L7aK8T4NvUZVI3cLwmDCj1qoVsbgFoa0AXDC+wKB3rr+SiyHClKkjVFq1tsGHHB56UGgsdn
	NhEnAqkG/CS044UprjX17A9H8Ykzq6MHyVG2WLqpSUFHp21TsPlgIveZ92IoPR3WxACwRcl7AyQ
	TnMxCmp/ZatjmEZZ9/WHZ2m1afRRzuUY8RYShHnhsSvb0SFmUPOl4lqqhOeuCns6jxo5D
X-Google-Smtp-Source: AGHT+IEci+oWzjH7CyYO9aJfWlFjjFkJFvBF1ue2Ai98mKUWzhDASjL/rUOMlavxeYSI9B2UgMjvwQ==
X-Received: by 2002:a05:6000:4027:b0:3b6:11c:78df with SMTP id ffacd0b85a97d-3b768f060c7mr2004574f8f.41.1753269172679;
        Wed, 23 Jul 2025 04:12:52 -0700 (PDT)
Message-ID: <9fda6eb2-82c1-48e1-9a10-804089a2475f@citrix.com>
Date: Wed, 23 Jul 2025 12:12:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/8] xen/arm: move vcpu_switch_to_aarch64_mode() in
 arch_vcpu_create()
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
 <20250723075835.3993182-3-grygorii_strashko@epam.com>
 <99c88af9-7f89-4d7c-9827-1ba85c803195@xen.org>
 <fdf7d2b9-aca9-4392-8e4d-a7fc8ce036f2@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fdf7d2b9-aca9-4392-8e4d-a7fc8ce036f2@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/07/2025 11:19 am, Grygorii Strashko wrote:
>
>
> On 23.07.25 12:16, Julien Grall wrote:
>> Hi,
>>
>> On 23/07/2025 08:58, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Move vcpu_switch_to_aarch64_mode() in arch_vcpu_create() callback
>>> instead
>>> of calling it manually from few different places after vcpu_create().
>>>
>>> Before doing above ensure vcpu0 is created after kernel_probe() is
>>> done and
>>> domain's guest execution mode (32-bit/64-bit) is set for dom0 and
>>> dom0less
>>> domains.
>>
>> The commit message doesn't mention anything about domains created by
>> the toolstack. In this case, from my understanding, the switch to
>> 64-bit domain happens *after* the vCPUs are created.
>>
>> At the moment, I think this is probably ok to call...
>>
>>>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> ---
>>>   xen/arch/arm/domain.c                    |  3 +++
>>>   xen/arch/arm/domain_build.c              | 13 +++++--------
>>>   xen/common/device-tree/dom0less-build.c  |  6 +++---
>>>   xen/include/asm-generic/dom0less-build.h |  2 +-
>>>   4 files changed, 12 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>> index 79a144e61be9..bbd4a764c696 100644
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -586,6 +586,9 @@ int arch_vcpu_create(struct vcpu *v)
>>>       if ( get_ssbd_state() == ARM_SSBD_RUNTIME )
>>>           v->arch.cpu_info->flags |= CPUINFO_WORKAROUND_2_FLAG;
>>> +    if ( is_64bit_domain(v->domain) )
>>> +        vcpu_switch_to_aarch64_mode(v);
>>
>> ... this function here because I *think* it would be NOP. But this
>> feels really fragile.
>
> The toolstack configures domain and vcpus through
> XEN_DOMCTL_set_address_size on Arm64:
> - toolstack creates domain and parses kernel binary: domain created
> with DOMAIN_32BIT mode by default
> - toolstack creates vcpus (still 32 bit mode):
> libxl__build_pre()->xc_domain_max_vcpus()
> - toolstack switches domain mode depending on kernel binary type:
> libxl__build_dom()->xc_dom_boot_mem_init(),
>   which triggers XEN_DOMCTL_set_address_size hypercall.
>   Xen: arm64: switches domain mode and re-configures vcpus:
> subarch_do_domctl()->set_address_size()
>
> So, this patch does not affect toolstack path, only optimizes Xen
> boots a bit.
>
> Also, during Xen boot or by toolstack - the domain is always created
> before it's type is even known, which, in turn,
> is based on guest binary which is parsed later during domain
> configuration stage.

This is an error which has existed in Xen since the outset.  ARM
inherited it from x86 PV (albeit the opposite way around).

It is literally backwards to create a VM in one mode, do some setup,
then decide "no actually I want it in the other mode".

For both x86 PV, and ARM it seems, parsing the kernel first and choosing
the right mode(s) at create time would be a substantial improvement.

As a note, x86 HVM has no concept of 64bit existing without 32bit.

~Andrew

