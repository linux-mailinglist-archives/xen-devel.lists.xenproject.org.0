Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0713985769
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 12:54:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803826.1214645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stPeJ-0003by-H5; Wed, 25 Sep 2024 10:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803826.1214645; Wed, 25 Sep 2024 10:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stPeJ-0003Zu-Dr; Wed, 25 Sep 2024 10:53:35 +0000
Received: by outflank-mailman (input) for mailman id 803826;
 Wed, 25 Sep 2024 10:53:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lFoA=QX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1stPeI-0003Zo-7z
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 10:53:34 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67f81825-7b2c-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 12:53:32 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a93a1cda54dso97350566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 03:53:32 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930c5824sm195715666b.129.2024.09.25.03.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 03:53:31 -0700 (PDT)
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
X-Inumbo-ID: 67f81825-7b2c-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727261612; x=1727866412; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1YMAdKqXQoiM2NOl27Qmy6rliABwdEJKDbsBNepEtX0=;
        b=IlDreo17IkCveGE53o124xCfLxElvHZlNPEc/n+amq26KtCFDDOjfkMeVQxkeMAhsg
         T8bMlQHpf2aGZw85IKLGS0BeTOlgz7yxFf3W/PcHFDn6kONLPbO/gvqNMQWJdbJIYm3/
         3AziBgZ98UemaNa2KWaicF0Az1ApQj8rSyDjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727261612; x=1727866412;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YMAdKqXQoiM2NOl27Qmy6rliABwdEJKDbsBNepEtX0=;
        b=OxTJduB5jPv1puK449moEu/K3Bu4l3Y/f/RnryGl1UCYHd3Z1FbAj3gZ4xnm5tP82I
         EyKgdZw80fJprhWO+8Jcneqhvz/Zsj/CADHqoJCz3o83pwYGuro8vtTtngeol7cvSDLK
         yFnz2G0bEexSYeS50uxuOAECptXsPwgBjYh3FW/cftUYKLGDXeawxa3VKcpSn1+zTwAm
         pxGuFvqNgClN3FPT4ECTF0gw64OGstzPiIyMkfMB50xUOmQ5nKc8+c1Cnx2Y4xOqkEuC
         CoCf/REFqghJ5MSO8eMsD19A2eUtW8N3gVL0K88BPOZ5b3iduM8wrLazL3ImyC/pAh4b
         h+RQ==
X-Forwarded-Encrypted: i=1; AJvYcCW07fsEpMr5hNFg1vZzOV/UQQAdCPtMEq3suy2Sp0C/5OUd2dPHvgrcTS7A0DmrsqQlBhkVeETVR/A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVmos1F26G9Qlg8LgHoCWtj90Io75AOOfu+Rh6ViG7t67YaJ3U
	uBCdvS/inlyb6pfgd8UtS0xA+7aI/p41omkb7Nv/+Ze42RDY/BRoDNU9XLEf3Kk=
X-Google-Smtp-Source: AGHT+IGkiOv280KKx9Mkgxkel4QHEXF+/HfynJ6hOQd0eyriwSt1WGl1ly99+DNCvVMmBFFmbkaWFQ==
X-Received: by 2002:a17:907:948f:b0:a8a:8c4c:3e2a with SMTP id a640c23a62f3a-a93a03603damr223671366b.23.1727261611999;
        Wed, 25 Sep 2024 03:53:31 -0700 (PDT)
Message-ID: <00ad838a-a086-4b18-a32e-0a4a6cd52fe4@citrix.com>
Date: Wed, 25 Sep 2024 11:53:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] x86/alternatives: do not BUG during apply
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-6-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240925084239.85649-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/09/2024 9:42 am, Roger Pau Monne wrote:
> alternatives is used both at boot time, and when loading livepatch payloads.
> While for the former it makes sense to panic, it's not useful for the later, as
> for livepatches it's possible to fail to load the livepatch if alternatives
> cannot be resolved and continue operating normally.
>
> Relax the BUGs in _apply_alternatives() to instead return an error code.  The
> caller will figure out whether the failures are fatal and panic.
>
> Print an error message to provide some user-readable information about what
> went wrong.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Much nicer.  A few more diagnostic comments.

> diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
> index 7824053c9d33..c8848ba6006e 100644
> --- a/xen/arch/x86/alternative.c
> +++ b/xen/arch/x86/alternative.c
> @@ -198,9 +198,29 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>          uint8_t buf[MAX_PATCH_LEN];
>          unsigned int total_len = a->orig_len + a->pad_len;
>  
> -        BUG_ON(a->repl_len > total_len);
> -        BUG_ON(total_len > sizeof(buf));
> -        BUG_ON(a->cpuid >= NCAPINTS * 32);
> +        if ( a->repl_len > total_len )
> +        {
> +            printk(XENLOG_ERR
> +                   "alt replacement size (%#x) bigger than destination (%#x)\n",

These all say "some alternative went wrong", without identifying which. 
For x86_decode_lite(), debugging was far easier when using:

"Alternative for %ps ...", ALT_ORIG_PTR(a)

If we get the order of loading correct, then %ps will even work for a
livepatch, but that's secondary - even the raw number is slightly useful
given the livepatch load address.

I could be talked down to just "Alt for %ps" as you've got it here.  I
think it's clear enough in context.  So, I'd recommend:

"Alt for %ps, replacement size %#x larger than origin %#x\n".

Here, I think origin is better than destination, when discussing
alternatives.

I can adjust on commit.  Everything else is fine.

~Andrew

