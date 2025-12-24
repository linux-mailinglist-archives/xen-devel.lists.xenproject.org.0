Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 391C1CDBC6C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 10:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192863.1511929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYL11-0007NU-A7; Wed, 24 Dec 2025 09:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192863.1511929; Wed, 24 Dec 2025 09:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYL11-0007L5-6j; Wed, 24 Dec 2025 09:18:43 +0000
Received: by outflank-mailman (input) for mailman id 1192863;
 Wed, 24 Dec 2025 09:18:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vYL0z-0007Kz-G5
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 09:18:41 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8920586a-e0a9-11f0-b15c-2bf370ae4941;
 Wed, 24 Dec 2025 10:18:40 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b7eff205947so827360266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 01:18:40 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037a5bdb9sm1748069466b.7.2025.12.24.01.18.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Dec 2025 01:18:39 -0800 (PST)
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
X-Inumbo-ID: 8920586a-e0a9-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766567920; x=1767172720; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0r5Hsha4gUQFjOsJkLHL+CWPZx10FE5zfW8AqF73WNI=;
        b=AiYv9apQhrORyaOWQpzShfEN1TSCDZJ7tMtLOEpEWClBPRcUa82X1Ey2LGYV9YF5SW
         Nk+b8cxaXmDL1e3lEn3ycyok/e//Vatw7pnvnPfE/AL026ISkpNqGdlnPgXXY+rvKw/D
         bGujbbGIh6/VZMGcoagYMWDyKbMFi0z624H+A/Uf2K3oow3u5oWFr73+62/0X4OZeSGz
         miSFGjV9QubQjYNSRAoYvNbnPfPrGJp19P5/gpyTe5RCo8Qur9LsZlXSJxXQMkMbDJX5
         gG2hqdqnFlFWqCMkWuj1HrjjKeDhNBRGSxyAmwyG2GNNMvd54JryLdarVhwd3Z9sJviJ
         uSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766567920; x=1767172720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0r5Hsha4gUQFjOsJkLHL+CWPZx10FE5zfW8AqF73WNI=;
        b=W6WlYrfQodI8/6Kd1NLf5c7ZrW/qlyf+28zMi9XMfH9TtCre+Y0xxMjAMi5dLMmoR6
         cuhqemWX0Voi7cJF90iDAVPgg55BahMRdFFEBlb4x2Tc93ld/1Pcp37h/QDpdT03E4zE
         J7QwTfYkEcjzyvOyoxhO4jcyPzrRgM+paAp9nDugtc2CbOVL93jAgxC+1K0+nl9U1g95
         cYMkhR+Nks4Oc7NT+7fPM5jociFsADq3uJ/FwOmSmX2XvPcwd/v+rPL8tT0BoDHV8clQ
         jq6sG+M1hoT+3uErlCEq7oFoaANFf47NmZpWnO1na0EQMF+gC8iiQHohqCH7ov+KwRPR
         lrRA==
X-Forwarded-Encrypted: i=1; AJvYcCXImGB5FVK7HPK0kzOqdvQ2QNb43aiz0lNRWA4Lw5H3yt7h5QYtk9fjx8QNMbo8xK8g5lgAlIectWc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3rCXOArXF12docu5vCv1FyoAFd72Rb99hAmFktpdWPYEWRodY
	w1lk8tln1kp07m0wPV7g99LCEybx43HMXNJA3G0K9lEUpz2SKXKKvcyw
X-Gm-Gg: AY/fxX7ohfkwBNPPwhI/AUSrltmYCI9KPrR66FS/uRaCf382t2+QqF8d8viowoS9Bu2
	khZmsrJTOLWPvqzbZU7mvxBicj63eBSGbO6BzUc3rFsojFPInA3BlR8MUxuLtJKjABBVoR8/EYb
	3WKL+FNAsLtyPZUDWgrwuDKIFhM6Fz652Hh+9TPIMk6eAWFL/LVOxT0BLv5hurpUWoJ8MHZUIOm
	f3DKyduw91vdsARdBUVVHMvphljD3sVlc270WIH6ED6XdWRvPUIxNhHpG+3AKh+cxHoL2WhE1ak
	ozeF/AU9rWZ05/S7J1oyl/7hzxYhNWGiKMQiKg/ZSSLDKVHM2rhw/Nh/+lhodPkpdJyr+LCAblQ
	zQc6iymSM2GPw4X4W93UvUKYzJ9mjWlyYcxcYuSji/KdyCTm94VzftRY3z+z1szNofIxPtY9koH
	ApkeO42NIbwSoA3MQxAMyzhaB/A30n8N8IeYYe32HSbzlbZcNLiDxiJzJUnK5TH8zi
X-Google-Smtp-Source: AGHT+IHrraoXMDxoiNtAJWrMlqrjN1/jXW/2hxnrTK7tNdsl7VGvROkFYalkpzqZXaEbww3RlbQBRQ==
X-Received: by 2002:a17:907:940a:b0:b2d:830a:8c01 with SMTP id a640c23a62f3a-b80371df334mr1631515366b.61.1766567919557;
        Wed, 24 Dec 2025 01:18:39 -0800 (PST)
Message-ID: <fd28efb5-5db9-46d8-a112-6c6169d139d5@gmail.com>
Date: Wed, 24 Dec 2025 10:18:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xen/riscv: add RISC-V virtual SBI base extension
 support for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766399205.git.oleksii.kurochko@gmail.com>
 <d7c8217605ad5d88a94baf32c2543654a415236d.1766399205.git.oleksii.kurochko@gmail.com>
 <6d7304db-7b75-4b69-aec6-663f951c37f7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6d7304db-7b75-4b69-aec6-663f951c37f7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/23/25 5:13 PM, Jan Beulich wrote:
> On 22.12.2025 17:37, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/sbi.h
>> +++ b/xen/arch/riscv/include/asm/sbi.h
>> @@ -14,6 +14,13 @@
>>   
>>   #include <xen/cpumask.h>
>>   
>> +/* Xen-controlled SBI version reported to guests */
>> +#define XEN_SBI_VER_MAJOR 0
>> +#define XEN_SBI_VER_MINOR 2
> Are these going to gain a 2nd use, justifying their placement here?

Good point. I don't have any plans now to use them somewhere else, so,
at least, for now it would be really put them to base-extension.c.

>
>> --- /dev/null
>> +++ b/xen/arch/riscv/vsbi/base-extension.c
>> @@ -0,0 +1,78 @@
>> +
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/lib.h>
>> +#include <xen/sched.h>
>> +#include <xen/version.h>
>> +
>> +#include <asm/processor.h>
>> +#include <asm/sbi.h>
>> +#include <asm/vsbi.h>
>> +
>> +static int vsbi_base_ecall_handler(unsigned long eid, unsigned long fid,
>> +                                   struct cpu_user_regs *regs)
>> +{
>> +    int ret = 0;
>> +    struct sbiret sbi_ret;
>> +
>> +    ASSERT(eid == SBI_EXT_BASE);
>> +
>> +    switch ( fid )
>> +    {
>> +    case SBI_EXT_BASE_GET_SPEC_VERSION:
>> +        regs->a1 = MASK_INSR(XEN_SBI_VER_MAJOR, SBI_SPEC_VERSION_MAJOR_MASK) |
>> +                   XEN_SBI_VER_MINOR;
>> +        break;
>> +
>> +    case SBI_EXT_BASE_GET_IMP_ID:
>> +        regs->a1 = SBI_XEN_IMPID;
>> +        break;
>> +
>> +    case SBI_EXT_BASE_GET_IMP_VERSION:
>> +        regs->a1 = (xen_major_version() << 16) | xen_minor_version();
>> +        break;
>> +
>> +    case SBI_EXT_BASE_GET_MVENDORID:
>> +    case SBI_EXT_BASE_GET_MARCHID:
>> +    case SBI_EXT_BASE_GET_MIMPID:
>> +        if ( is_hardware_domain(current->domain) )
>> +        {
>> +            sbi_ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
>> +            ret = sbi_ret.error;
>> +            regs->a1 = sbi_ret.value;
>> +        }
>> +        else
>> +            /*
>> +             * vSBI should present a consistent, virtualized view to guests.
>> +             * In particular, DomU-visible data must remain stable across
>> +             * migration and must not expose hardware-specific details.
>> +             *
>> +             * These register(s) must be readable in any implementation,
>> +             * but a value of 0 can be returned to indicate the field
>> +             * is not implemented.
>> +             */
>> +            regs->a1 = 0;
>> +
>> +        break;
>> +
>> +    case SBI_EXT_BASE_PROBE_EXT:
>> +        regs->a1 = vsbi_find_extension(regs->a0) ? 1 : 0;
>> +        break;
>> +
>> +    default:
>> +        /*
>> +         * TODO: domain_crash() is acceptable here while things are still under
>> +         * development.
>> +         * It shouldn't stay like this in the end though: guests should not
>> +         * be punished like this for something Xen hasn't implemented.
>> +         */
>> +        domain_crash(current->domain,
>> +                     "%s: Unsupported ecall: FID: #%lx, EID: #%lx\n",
> Same remark here as for patch 2.

I'll update to #%lu for FID.

Thanks.

~ Oleksii


