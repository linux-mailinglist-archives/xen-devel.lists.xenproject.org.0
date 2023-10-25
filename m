Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CAA7D762A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 22:59:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623307.971057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvky7-0002sf-O1; Wed, 25 Oct 2023 20:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623307.971057; Wed, 25 Oct 2023 20:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvky7-0002qB-Kg; Wed, 25 Oct 2023 20:59:11 +0000
Received: by outflank-mailman (input) for mailman id 623307;
 Wed, 25 Oct 2023 20:59:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iZwN=GH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qvky6-0002q3-Sp
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 20:59:10 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 573f788f-7379-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 22:59:08 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53de8fc1ad8so247219a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 13:59:08 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 g1-20020a1709063b0100b0099b8234a9fesm10497590ejf.1.2023.10.25.13.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 13:59:08 -0700 (PDT)
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
X-Inumbo-ID: 573f788f-7379-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698267548; x=1698872348; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BmA2Nxs2AZstbJrEbC/Zjou/qgAHeQdF6t33hq9pXic=;
        b=fDxsJWwoIho4FssF9Z8yldrwI/gEeXzhts6Kr2LJLBk3EosscptjS4oy7nPXNWvLSS
         U9y8A4KzE14eY6bDng+yW+lUOtGMxDy16MA29rKtgwOKwjlYaJYZTxgcoFP4LVe/5aUi
         G1iobCvRjloivMyYI8QjKAz2fuLBTg7jV8Vm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698267548; x=1698872348;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmA2Nxs2AZstbJrEbC/Zjou/qgAHeQdF6t33hq9pXic=;
        b=YzkoESJAMbSMrfqV9hlSI+eVW3DMjdE8FRGbumwHw0AwOzEskUfyiq8JHFEavUwmh6
         Qu5qMtoPJDqy8w4DnDPi/WJajMIXtVgo5YeyNC8TPyDvK9Z97O9Yrf1UpjO7fst7Advq
         HXoQUOhsyQ0ExSEKKoj5tkZ9LxtoJQ4JlezxgzrKkefGnZZj5SC8uM1hY1R6YQdujZzp
         wkz/HG6VCHaxlPgbVz2yr1kvwoEWV1aw1skaUseFhJC+iuhbnadu++ioXvUQlwCQDoRC
         86RKNEgYH31sZJs1uKs1UdymX7lTE8ZE5dgzqPRsYnDWG4KBa1SRuoZUHXawf0Cr6VsH
         KMOg==
X-Gm-Message-State: AOJu0YzAEafFG10LNdpc0oZPoL+OtNKBygg5Xf3HA6kuJi8Wm5K5gezh
	25iF7fx5DAdI18ZulvrUUXLtrg==
X-Google-Smtp-Source: AGHT+IG1lVuckgbJHPvvHoB90agXW7WFUX/5RzuKJJz9fvzboOzTmIoECbuSwRnXk64d+WKVIelKPg==
X-Received: by 2002:a17:906:db09:b0:994:555a:e49f with SMTP id xj9-20020a170906db0900b00994555ae49fmr13036610ejb.31.1698267548279;
        Wed, 25 Oct 2023 13:59:08 -0700 (PDT)
Message-ID: <20d0e946-f156-4472-a253-7517e831f44d@citrix.com>
Date: Wed, 25 Oct 2023 21:59:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC PATCH 22/22] x86/AMD: add IRPerf support
Content-Language: en-GB
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1698261255.git.edwin.torok@cloud.com>
 <6cd765e98fa4888b9e94215f3572a94e95fe2a4b.1698261255.git.edwin.torok@cloud.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6cd765e98fa4888b9e94215f3572a94e95fe2a4b.1698261255.git.edwin.torok@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/10/2023 8:29 pm, Edwin Török wrote:
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index 483b5e4f70..b3cd851d9d 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -584,6 +584,13 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>          }
>          break;
>  
> +    case MSR_K8_HWCR:
> +        if ( !(cp->x86_vendor & X86_VENDOR_AMD) ||
> +             (val & ~K8_HWCR_IRPERF_EN) ||
> +             wrmsr_safe(msr, val) != 0 )
> +            goto gp_fault;
> +        break;
> +
>      case MSR_AMD64_DE_CFG:
>          /*
>           * OpenBSD 6.7 will panic if writing to DE_CFG triggers a #GP:
> diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
> index 5faca0bf7a..40f74cd5e8 100644
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -241,7 +241,7 @@ XEN_CPUFEATURE(EFRO,          7*32+10) /*   APERF/MPERF Read Only interface */
>  
>  /* AMD-defined CPU features, CPUID level 0x80000008.ebx, word 8 */
>  XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
> -XEN_CPUFEATURE(IRPERF,        8*32+ 1) /* Instruction Retired Performance Counter */
> +XEN_CPUFEATURE(IRPERF,        8*32+ 1) /*A! Instruction Retired Performance Counter */
>  XEN_CPUFEATURE(RSTR_FP_ERR_PTRS, 8*32+ 2) /*A  (F)X{SAVE,RSTOR} always saves/restores FPU Error pointers */
>  XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*   WBNOINVD instruction */
>  XEN_CPUFEATURE(IBPB,          8*32+12) /*A  IBPB support only (no IBRS, used by AMD) */

Last things first.  You can advertise this bit to guests, but I'm
looking at the AMD manuals and woefully little information on what this
is an how it works.

It does have an architectural enumeration, but there isn't even a a
description of what HWCR.IPERF_EN does.

The HWCR documentation says "enables Core::X86::Msr::IRPerfCount", but
the IRPERF MSR says no such think, noting only that EFRO_LOCK makes the
MSR non-writeable (which in turn means we can't always offer it to
guests anyway.  See below).

At a guess, the HWCR bit activates the counter, but nothing states
this.  At a guess, it's a free-running, reset-able counter, but again
nothing states this.  The manual just says "is a dedicated counter" and
doesn't even state whether it is (or is not) tied into the other core
fixed counters and whether it is integrated with PMI or not.

Which brings us on to the middle hunk.  Putting it there short circuits
the PV-specific handling, but you can't do that in general without
arranging for HWCR to be context switched properly for vCPUs, nor in
this case IPERF_COUNT itself.

Unless you context switch HWCR and IPERF_COUNT, a guest will see it not
counting, or the count going backwards, 50% of the time as the vCPU is
scheduled around.

So while in principle we could let guests use this facility (it would
have to be off by default, because there doesn't appear to be any
filtering capability in it at all, so we can't restrict it to
instructions retired in guest context), it will need a far larger patch
than this to do it safely.

~Andrew

