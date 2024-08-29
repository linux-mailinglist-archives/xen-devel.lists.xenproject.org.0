Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED4A96454C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 14:52:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785850.1195364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjed1-0003Ze-65; Thu, 29 Aug 2024 12:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785850.1195364; Thu, 29 Aug 2024 12:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjed1-0003Y9-3O; Thu, 29 Aug 2024 12:51:55 +0000
Received: by outflank-mailman (input) for mailman id 785850;
 Thu, 29 Aug 2024 12:51:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zolI=P4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjecz-0003Y3-Fl
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 12:51:53 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76ba96d1-6605-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 14:51:52 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8677ae5a35so65900866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 05:51:52 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ccfe8fsm675413a12.62.2024.08.29.05.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 05:51:50 -0700 (PDT)
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
X-Inumbo-ID: 76ba96d1-6605-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724935912; x=1725540712; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rMo5bRBH0nbWBgalqxyESbnLNu0WPfOm0dwY46yOmtg=;
        b=cOqFwZ+KiVjVHItxGGfnDrCd2OwbYUwU0Bvs2Dh92H2ntdbkvkE6NzvnG+tXJXjaR2
         J8RWljszTrepXGJsExWCG8XTCzmnmCmftwj0x4wPi/SeTkWBkIq2yESpHdgdJnFex7Ia
         SIOHJGJlcXqoYFqnwGt1u4BM++tjzCj3OQlvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724935912; x=1725540712;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMo5bRBH0nbWBgalqxyESbnLNu0WPfOm0dwY46yOmtg=;
        b=JVO87mYZjU7U/m8DIxwLrjjzHkaXl4MH5NcPKDKGae1JkGXPoMRroXbenw+5005Gj5
         8w1C205+ED4zDFuU/8vgDwcBIhJFs5G4LqGZY32BKjYqaLmes0euR+0fjIkuV/9vRj8s
         uOhZnkYhzH+QIsifiKNfJhY+k2/dcazA3SKQyBKtDQmh77+Zs9CFJsRv7t89wWBW7Feo
         zdb1c7DItW8pS+INqhLmZ3QeJ923pMZNIVfHqF9ghHalsSKJI3i+0EtWi38znZxFCqmP
         IszDsTC1d9eInNGZjnK830xrVrFeQ+eUToDQVDQK8SCSKXlonWAp36cD9IRV45NSGDTg
         E0TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNlk3RBhNnjbyPb1dJ0XvaPdi11l+n9SehYMxgOSmKYYopYy3Yzr7Wy8RaPuqb88EJojw40X0oZiw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztmPB/VBTacZUE5D43j3DlYBR4jPIkILnuMxZqdMhYIQ2eexvE
	cVY7GJDNE8HiMBBnankqu3dRk+cgobtTZ5BnHFmwGeJ8P73kmLiLLvEAf9HXxuI=
X-Google-Smtp-Source: AGHT+IEADzLFDdxJ7ZbXj0f8Rai7E/6yYg00EFkWxZej1niUB0xi7nr6H012BmnkJc+QxMfT92R5CQ==
X-Received: by 2002:a05:6402:34c4:b0:5be:fbce:9391 with SMTP id 4fb4d7f45d1cf-5c21ed41d7amr2186629a12.11.1724935911403;
        Thu, 29 Aug 2024 05:51:51 -0700 (PDT)
Message-ID: <737c8726-f290-4abf-b46a-344dd63862fa@citrix.com>
Date: Thu, 29 Aug 2024 13:51:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] types: replace remaining uses of s64
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <b1ded557-63b8-4999-98ca-de80488ebad1@suse.com>
 <50ffc0e1-ff3d-421f-a703-295541357e17@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <50ffc0e1-ff3d-421f-a703-295541357e17@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/08/2024 1:01 pm, Jan Beulich wrote:
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -66,10 +66,10 @@ struct cpu_time {
>  struct platform_timesource {
>      const char *id;
>      const char *name;
> -    u64 frequency;
> +    uint64_t frequency;
>      /* Post-init this hook may only be invoked via the read_counter() wrapper! */
> -    u64 (*read_counter)(void);
> -    s64 (*init)(struct platform_timesource *);
> +    uint64_t (*read_counter)(void);
> +    int64_t (*init)(struct platform_timesource *);
>      void (*resume)(struct platform_timesource *);

I'm surprised that we haven't seen MISRA complaints about this.  That,
or I've not been paying enough attention.

> --- a/xen/common/ubsan/ubsan.c
> +++ b/xen/common/ubsan/ubsan.c
> @@ -21,7 +21,6 @@ static DEFINE_PER_CPU(struct xen_ubsan[1
>  #define current this_cpu(in_ubsan)
>  #define dump_stack dump_execution_state
>  #define u64 long long unsigned int
> -#define s64 long long int

This block of defines was my magic to use ubsan.c otherwise unmodified
from Linux.

It ought to use linux-compat.h now it exists, rather than swapping away
from {u,s}64.

Everything else looks good.

~Andrew

