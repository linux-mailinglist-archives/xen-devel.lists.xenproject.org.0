Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E5293D5BB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:12:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765480.1176080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMbe-00039d-2Z; Fri, 26 Jul 2024 15:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765480.1176080; Fri, 26 Jul 2024 15:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMbd-000377-Vv; Fri, 26 Jul 2024 15:11:41 +0000
Received: by outflank-mailman (input) for mailman id 765480;
 Fri, 26 Jul 2024 15:11:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t3f9=O2=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1sXMbd-000370-D1
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:11:41 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bf50f2e-4b61-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 17:11:40 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5a20de39cfbso2733168a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:11:40 -0700 (PDT)
Received: from [192.168.10.153] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac63590d76sm2066253a12.24.2024.07.26.08.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jul 2024 08:11:38 -0700 (PDT)
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
X-Inumbo-ID: 5bf50f2e-4b61-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722006699; x=1722611499; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PtN7YD4vWIa/pIMpNQVWBTwEYFjOjLmOFYvTvqHLV3w=;
        b=N/YL8Jyawr3EUhLRbQA038/3HLI/Fp8qCVGOmrwPExT1Rr3QDZaNVp7g+TLDPHJghv
         ME3OQtVHAClafcKyxMlokWz/gSUhgT5TO5bsVhjRIoGOzfzH7Lp1LnRgFooBeelDz/cX
         WVU4/tM5ETwJDsfxE15o+LTHTjHdsvWshrGxJtuoMVVI4YRuqeKmcKqANrIiAmORgZMM
         oq5ULjMWFIDe28+CFHWCUYCo4PZtzZXhpxh96aMmKKKxBVsiAAHrXWtMT+L5w3uNZZfy
         LWBC+f/zFomDAmrTOBGCiPnz3PMVNm5yagDKckbAjIFeXiFDVcEL/wUV1g75KrbUWcCN
         Ayuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722006699; x=1722611499;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtN7YD4vWIa/pIMpNQVWBTwEYFjOjLmOFYvTvqHLV3w=;
        b=ezugnZlADjenAGF/snlHkT7dsJpRDJTQCmtFJ7Pp3znazFfsuu7luhGkSMUOcsQlME
         20JZ7qWBMB6zqMqk+lZ5U3najZh1hqKRhgw2IXGawGZHzDOAh2j9JRbun3h/L30mJe2E
         +XJCiwjhZ9suE+6e8MUUygywTViQ+2HYs3Js08DfzVzUZnZTNnqcXXofKKs/FVGNv/oA
         HQ+SYHlxani+fI2M0hxgYmhDUzjMFMu5yIsufNIOlRXjC3DvHBsqppH/RpDinL1G7dnt
         5sXE0VnK6u38iZjKDlAu484nZNkbTO6VMfVBcy6YNuxtokdk3okxHBCsdh4KpUyVf20C
         qRrw==
X-Forwarded-Encrypted: i=1; AJvYcCX3jHKo1EVEUY0xUc613aBvt7okjQTK0dWgKcjBBk1ReTbyx+e0xzap+xBgkWnWFOxmrIs24XjZJlLdhKx/I9TLeo2cU1zK8Z1yRj3Cxmo=
X-Gm-Message-State: AOJu0YzZ7CIfZRc7DuJ8TRovDXxyFVs54f66tpmSh+uCACCncgbpN8FX
	Q+YTIUc0egS+dACTqVuyekRelSnGIW271VnwkKTMd7YVG+3y0DJJ
X-Google-Smtp-Source: AGHT+IFnKkJp/1waKWTbyIEMKJ3SRzzqtcZbM1rgXA0+cPnII/2Wg6EhA5FLBrYKYeYy3EOqA5PjZA==
X-Received: by 2002:a50:d7d3:0:b0:57c:9d54:67db with SMTP id 4fb4d7f45d1cf-5ac6349a973mr4112535a12.9.1722006699174;
        Fri, 26 Jul 2024 08:11:39 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <e757eaeb-a10f-423e-a914-ec1d77ee0491@xen.org>
Date: Fri, 26 Jul 2024 16:11:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH] x86/viridian: Clarify some viridian logging strings
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240726145200.1991-1-alejandro.vallejo@cloud.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20240726145200.1991-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/07/2024 15:52, Alejandro Vallejo wrote:
> It's sadically misleading to show an error without letters and expect
> the dmesg reader to understand it's in hex.

That depends on who's doing the reading.

> The patch adds a 0x prefix
> to all hex numbers that don't already have it.
> 
> On the one instance in which a boolean is printed as an integer, print
> it as a decimal integer instead so it's 0/1 in the common case and not
> misleading if it's ever not just that due to a bug.
> 
> While at it, rename VIRIDIAN CRASH to VIRIDIAN GUEST_CRASH. Every member
> of a support team that looks at the message systematically believes
> "viridian" crashed,

... which suggests they need educating as to what 'viridian' is (or was).

> which is absolutely not what goes on. It's the guest
> asking the hypervisor for a sudden shutdown because it crashed, and
> stating why.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> Still going through its Gitlab pipeline
> 
> ---
>   xen/arch/x86/hvm/viridian/synic.c    | 2 +-
>   xen/arch/x86/hvm/viridian/viridian.c | 9 +++++----
>   2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
> index 3375e55e95ca..c3dc573b003d 100644
> --- a/xen/arch/x86/hvm/viridian/synic.c
> +++ b/xen/arch/x86/hvm/viridian/synic.c
> @@ -172,7 +172,7 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
>           vector = new.vector;
>           vv->vector_to_sintx[vector] = sintx;
>   
> -        printk(XENLOG_G_INFO "%pv: VIRIDIAN SINT%u: vector: %x\n", v, sintx,
> +        printk(XENLOG_G_INFO "%pv: VIRIDIAN SINT%u: vector: %#x\n", v, sintx,
>                  vector);
>   
>           *vs = new;
> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
> index 0496c52ed5a2..21480d9ee700 100644
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -253,7 +253,7 @@ static void dump_guest_os_id(const struct domain *d)
>       goi = &d->arch.hvm.viridian->guest_os_id;
>   
>       printk(XENLOG_G_INFO
> -           "d%d: VIRIDIAN GUEST_OS_ID: vendor: %x os: %x major: %x minor: %x sp: %x build: %x\n",
> +           "d%d: VIRIDIAN GUEST_OS_ID: vendor: %#x os: %#x major: %#x minor: %#x sp: %#x build: %#x\n",
>              d->domain_id, goi->vendor, goi->os, goi->major, goi->minor,
>              goi->service_pack, goi->build_number);
>   }
> @@ -264,7 +264,7 @@ static void dump_hypercall(const struct domain *d)
>   
>       hg = &d->arch.hvm.viridian->hypercall_gpa;
>   
> -    printk(XENLOG_G_INFO "d%d: VIRIDIAN HYPERCALL: enabled: %x pfn: %lx\n",
> +    printk(XENLOG_G_INFO "d%d: VIRIDIAN HYPERCALL: enabled: %u pfn: %#lx\n",
>              d->domain_id,
>              hg->enabled, (unsigned long)hg->pfn);
>   }
> @@ -372,7 +372,8 @@ int guest_wrmsr_viridian(struct vcpu *v, uint32_t idx, uint64_t val)
>           d->shutdown_code = SHUTDOWN_crash;
>           spin_unlock(&d->shutdown_lock);
>   
> -        gprintk(XENLOG_WARNING, "VIRIDIAN CRASH: %lx %lx %lx %lx %lx\n",
> +        gprintk(XENLOG_WARNING,
> +                "VIRIDIAN GUEST_CRASH: %#lx %#lx %#lx %#lx %#lx\n",

Honestly this change should be unnecessary, but since this is all 
cosmetic...

Reviewed-by: Paul Durrant <paul@xen.org>

>                   vv->crash_param[0], vv->crash_param[1], vv->crash_param[2],
>                   vv->crash_param[3], vv->crash_param[4]);
>           break;
> @@ -1056,7 +1057,7 @@ void viridian_dump_guest_page(const struct vcpu *v, const char *name,
>       if ( !vp->msr.enabled )
>           return;
>   
> -    printk(XENLOG_G_INFO "%pv: VIRIDIAN %s: pfn: %lx\n",
> +    printk(XENLOG_G_INFO "%pv: VIRIDIAN %s: pfn: %#lx\n",
>              v, name, (unsigned long)vp->msr.pfn);
>   }
>   


