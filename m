Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A490CBD638
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 11:40:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186767.1508195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV5zW-0004ja-1p; Mon, 15 Dec 2025 10:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186767.1508195; Mon, 15 Dec 2025 10:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV5zV-0004h4-Uo; Mon, 15 Dec 2025 10:39:45 +0000
Received: by outflank-mailman (input) for mailman id 1186767;
 Mon, 15 Dec 2025 10:39:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=szLt=6V=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vV5zU-0004gy-Bb
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 10:39:44 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d660169-d9a2-11f0-b15b-2bf370ae4941;
 Mon, 15 Dec 2025 11:39:42 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b79e7112398so675608766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 02:39:42 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64982040d14sm13187434a12.5.2025.12.15.02.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 02:39:41 -0800 (PST)
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
X-Inumbo-ID: 5d660169-d9a2-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765795182; x=1766399982; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DOfKKSrtAb6cFI3nSoQHjwPgBGIIiKulvgsgTHtlZ/U=;
        b=dSFoAGHQR6TeSCbImy7SLosXwJBOogJE0qaHAH3ZAvkLdZqeOon1/zpW2ruT6ee66f
         t4OLwCIK3uKcSlF4T+MVtwWZVrHrizI2rWUtLB0Iqk+5fZ436XHq/cLCpM8LQvblPdOX
         7f5jIMkLDR0gAe6s8mqFdOu1K+Eg+LNilMA/uHIM4TpM3j5Ib+ZajwDN04JkELPC02wn
         cMRoHbXUi3s1sJt+WpCE39D75dc2ectyrU7bx6J/k0FYKvBICUvfscW+XcwyHwefzcDv
         sqbTBr/qMTgNBT5U0INDtjiSsKswXzVwUOeNYhiWr4jo4ngV58CvE7HztuqZJpqQSrtv
         /mDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765795182; x=1766399982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOfKKSrtAb6cFI3nSoQHjwPgBGIIiKulvgsgTHtlZ/U=;
        b=r71PU53qL5KKoERBlSsgwx/JK4k9r0Hqzx0ZzyTJWUuCC2fm99HV8ZQapk5lvPSz8G
         x1qmSGUyMd1MWdoUY9ky2EBfDICyS/5yhyVAcl9wbuckRLYroHgROJROsOX88GpyaCom
         bOqcrEtuupbiP343fyJYlenZwss5N2kNOYuYfGHFoNJ7bQt2Uz4oO61djoZl3s/KGjxY
         EwnpCwxk1qhG4zjlN/K95eZuU4g5C1SbWOcvr9mjBHBU26UtlvgTpQWJGrUOfjgRz9py
         P7K3ExK91xMCDsh14F27fQlUPQS59+Ip9vQVCndqZfZclU7iFpTu/HBgbTHXB1hgCb+e
         MGRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO2xr9yrddZyA0zleW/ud22V32RgESxenkUovICGLfHlUQBFRYAWrWs4Vfmb1HqUy23w/4QvvcUZ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzmfbuv8zjI1cRlpgRkvNArC6T+rCwlTpiOOe7Ha6VxBoML2CQW
	j2eOsN/mgzv3PdoWO3C9YX75W4gBBKdYjpmiA6bcPBqf6kPX6j4SP5OZ
X-Gm-Gg: AY/fxX4DC9s1ffazPDWCgrgdEtuWvPfyyLP3V9Y+mcJuBB28eSXGHXAvdweKtbZehTo
	+A+FMmHASuaEwtX3+FmwXBPKdanpDC9+B3vj/AFuEycbjzGzFFfgQ9KadoUIGDpebExEkLu71uL
	T2rTS/qbBBGD7C5L3XOPhoWh4UWTUmtanGx1YRhTKsYdHIRmHRURL3R3VSpp1WYaE4tYlfHMjvc
	u8glh1UB7+uHttbIEQ0h7xXn0W2b4BzUrwpvJmyLQFo07N4nLHVZPgk2Ihje8v75SecN5ycqJii
	zpzmKQaVncU/YDcigqm9qggiaPa2dpi3lfG8Gpy9zaFB9/NFIOE7CsPLlBYz/amDcc/pOzu4KsX
	QbM/pfcOcJdk+itO26vpjnaivxehUgC/Ex5Mq8TeXyzY+hfXJIHN2n7ZNWsMjld/JMcRaVjZAKC
	AI/+Zz7UmoVnRRK7CymckQRxsTR+l+HNyuWZhS0qFFLxVHlHPKezQ+YY7eiCAR
X-Google-Smtp-Source: AGHT+IG5ns1IG1SNSU8dw7wognIV4X9ExgF6x/eT1TeQJceAvXLLdVQVUupWbY5KrfkrOO5/ouJbfQ==
X-Received: by 2002:a17:907:7e97:b0:b74:983b:4056 with SMTP id a640c23a62f3a-b7d235c8495mr1011544866b.8.1765795181479;
        Mon, 15 Dec 2025 02:39:41 -0800 (PST)
Message-ID: <4162d1b6-ea66-4a90-95fe-11d0f7c1897f@gmail.com>
Date: Mon, 15 Dec 2025 11:39:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/riscv: add RISC-V virtual SBI base extension
 support for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1764582112.git.oleksii.kurochko@gmail.com>
 <d17dcac47752681eed6703360389dd542433ab3e.1764582112.git.oleksii.kurochko@gmail.com>
 <275721bc-07c2-4f69-93c2-e6d3022fee4f@suse.com>
 <5154e129-675b-4027-b97f-257559c7ea50@gmail.com>
 <3cf7d382-3a05-401b-8483-41aa436079c5@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3cf7d382-3a05-401b-8483-41aa436079c5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/15/25 9:20 AM, Jan Beulich wrote:
> On 12.12.2025 16:25, Oleksii Kurochko wrote:
>> On 12/8/25 4:15 PM, Jan Beulich wrote:
>>> On 01.12.2025 11:24, Oleksii Kurochko wrote:
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/vsbi/vsbi-base-extension.c
>>>> @@ -0,0 +1,52 @@
>>>> +
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +
>>>> +#include <xen/lib.h>
>>>> +#include <xen/sched.h>
>>>> +
>>>> +#include <asm/processor.h>
>>>> +#include <asm/sbi.h>
>>>> +#include <asm/vsbi.h>
>>>> +
>>>> +extern unsigned long __ro_after_init sbi_spec_version;
>>>> +extern long __ro_after_init sbi_fw_id;
>>>> +extern long __ro_after_init sbi_fw_version;
>>>> +
>>>> +static int vsbi_base_ecall_handler(struct vcpu *vcpu, unsigned long eid,
>>>> +                                   unsigned long fid,
>>>> +                                   struct cpu_user_regs *regs)
>>>> +{
>>>> +    int ret = 0;
>>>> +    struct sbiret sbi_ret;
>>>> +
>>>> +    switch ( fid ) {
>>>> +    case SBI_EXT_BASE_GET_SPEC_VERSION:
>>>> +        regs->a1 = sbi_spec_version;
>>> Wouldn't this need to be the minimum of what firmware supports and what Xen
>>> supports / knows about? (Assuming backward compatibility among the spec
>>> versions of course.)
>> The base extension is mandatory (according to the spec), and based on some Linux
>> commits from contributors to the OpenSBI spec, it is also intended to allow
>> backward compatibility and probing of future extensions (although I was not able
>> to find this explicitly stated in the spec).
>>
>> However, none of this guarantees that everything else is backward compatible.
>> For example, the entire v0.1 SBI has been moved to the legacy extension, which
>> is now an optional extension. This is technically a backwards-incompatible
>> change because the legacy extension is optional, and v0.1 of the SBI does not
>> allow probing.
>>
>> Regarding what should be written to|regs->a1|, I think you are right: it should
>> be the minimum of what the firmware provides and what Xen supports. Otherwise,
>> if|sbi_spec_version| is set to 2.0 and we return 2.0 to the guest, the guest might
>> try to probe the DBGN (which Xen does not currently support) extension and use
>> it instead of the legacy extension for the early console.
>>
>>
>>>> +        break;
>>>> +    case SBI_EXT_BASE_GET_IMP_ID:
>>>> +        regs->a1 = sbi_fw_id;
>>>> +        break;
>>>> +    case SBI_EXT_BASE_GET_IMP_VERSION:
>>>> +        regs->a1 = sbi_fw_version;
>>> Same concern here, but see also below.
>> For SBI_EXT_BASE_GET_IMP_ID, I think we want to return XEN id which is according
>> to OpenSBI spec is 7.
>>
>> Something similar for SBI_EXT_BASE_GET_IMP_VERSION, maybe we want to return Xen
>> version code (XEN_FULLVERSION).
>>
>>>> +        break;
>>>> +    case SBI_EXT_BASE_GET_MVENDORID:
>>>> +    case SBI_EXT_BASE_GET_MARCHID:
>>>> +    case SBI_EXT_BASE_GET_MIMPID:
>>>> +        sbi_ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
>>> This may be okay to do for the hardware domain, but hardly for DomU-s.
>> I don’t see an issue with returning the vendor, microarchitecture, and
>> processor ID. This is essentially what other hypervisors do.
>>
>> What would be better to return? Returning 0 could be an option, and according
>> to the RISC-V spec:
>>     This register must be readable in any implementation, but a value of 0 can
>>     be returned to indicate the field is not implemented.
>>
>> So returning 0 would simply indicate that the field is not provided for case
>> of DomUs, and provide it for hardware domain.
>>
>> Would it be better?
>>
>>> Same concern for SBI_EXT_BASE_GET_IMP_ID.
>>>
>>>> +        ret = sbi_ret.error;
>>>> +        regs->a1 = sbi_ret.value;
>>>> +        break;
>>>> +    case SBI_EXT_BASE_PROBE_EXT:
>>>> +        regs->a1 = vsbi_find_extension(regs->a0) ? 1 : 0;
>>> At least for hwdom doesn't this also need combining virtual and
>>> underlying physical lookup, if for some extensions you may pass the
>>> requests down to the physical one (as done above)?
>> I think I understand your intention, but I am not 100% sure that we need to
>> perform a physical lookup. There may be implementation-specific cases where
>> a call is emulated by the hypervisor instead of being passthroughed to
>> OpenSBI.
>> In other words, it could be the case that an extension is fully emulated
>> without requiring support for the corresponding physical extension.
> I don't have sufficient RISC-V knowledge to further comment on this. My main
> concern is that we have to present (a) a consistent picture to both hwdom
> and DomU-s while (b) presenting a properly virtualized view to DomU-s (i.e.
> abstracting away hardware implementation details). In particular for DomU-s
> you will already now need to think of what happens if a guest is migrated:
> Data returned from vSBI probably shouldn't change across migration, or else
> you may confuse the guest.

Okay, now I see more sense in applying your suggestions.

I’ve changed the implementation for all EIDs except|SBI_*_PROBE_EXT| for now.
It still seems unnecessary to perform a physical lookup. In particular, doing a
physical lookup for hwdom in the following way:
     case SBI_EXT_BASE_PROBE_EXT:
         regs.a1 = vsbi_find_extension(regs->a0) ? 1 : 0;

         if ( regs->a1 && is_hardware_domain(vcpu->domain) )
         {
             sbi_ret = sbi_ecall(SBI_EXT_BASE,
                                 SBI_EXT_BASE_PROBE_EXT,
                                 regs->a0, 0, 0, 0, 0, 0);
             regs->a1 = !sbi_ret.error && sbi_ret.value;
         }

         break;

would only result in extra SBI ecall traps into Xen. Eventually, this would lead
to adding support for a new|VSBI_EXT(...)|, which, in the hwdom case, would simply
forward the call to SBI. Once such a|VSBI_EXT()| is provided,|vsbi_find_extension() |would handle everything, and there would be no need for the|is_hardware_domain() |check anymore.

In other words, this approach might help identify which extensions would be useful
to implement in Xen for hwdom. However, I don’t see much value in this kind of
detection logic. If an extension is needed for hwdom, it seems simpler to just
provide a|VSBI_EXT(...)| implementation for it.
That said, I’m generally okay with keeping the|is_hardware_domain()| handling for
|SBI_EXT_BASE_PROBE_EXT|. Just let me know if you still think it would be useful.

Thanks.

~ Oleksii


