Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2DD96B85A
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 12:24:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790032.1199728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnBl-0003i2-G1; Wed, 04 Sep 2024 10:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790032.1199728; Wed, 04 Sep 2024 10:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnBl-0003g4-Cg; Wed, 04 Sep 2024 10:24:37 +0000
Received: by outflank-mailman (input) for mailman id 790032;
 Wed, 04 Sep 2024 10:24:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFI/=QC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slnBj-0003ft-R2
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 10:24:35 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e193980e-6aa7-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 12:24:34 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2f029e9c9cfso80138181fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 03:24:34 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891dc6a1sm802139066b.175.2024.09.04.03.24.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 03:24:33 -0700 (PDT)
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
X-Inumbo-ID: e193980e-6aa7-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725445474; x=1726050274; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6fK4+SmOOhNId+bm802p6TFSjnYXjiV0jiIgtzSw+Ls=;
        b=dulJAlMTe4Snytq65k6utt/ks9ri2xMfWdhAEc/eq7xaNxoGforunWS6jgeZ8bsk6N
         eUKp5BUtNe8H4y8hfbKmli8K7gmqcxBsERUY6Sl65g325hwrjZycSk71KMIUoAaQ+Tgi
         nqm10ymN8leQYQfdVyK8gbd+MpT0uzAdodt9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725445474; x=1726050274;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fK4+SmOOhNId+bm802p6TFSjnYXjiV0jiIgtzSw+Ls=;
        b=go4ZvFImBaE3QQOz/F/05gIRynKdsdHc7W9UE4rGPn5S4eUfidDnypm1HW93EcRnc/
         CII+bvapkPwqycGSDwQ6tu5wJldMyePQXkYahho9WH77cQGBwMMx89GnZWjmfGJ/eder
         YcW2m0NugCJrD/pcfcMUziuSLdBCnOmTq2+xe/fGn/iHqHAmiT96cEu3FpifjaGtsT/+
         VXknBn8JVQg0wtguOygRzgC5OfBRng79KEP1vVbJISv590eadfESfo/nGT7BxM0AMLwN
         +MCA7nBEoRO6+escuZBdj0F5RL9SDqqI92e6wEy2+fSvCx8jjZCA2NzzPV1Igqg+k6ps
         vhaA==
X-Forwarded-Encrypted: i=1; AJvYcCWjbFJxw6eprJ8F1IQKERKV/qf5Aq6aK41XFsdvS5nDnQGjKyUFWfceISW9TueVuFmmzW68CRZPNyc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/oRIQIc6h4+ckLsivaQ9eExh1UsUMqwQD4+5Sue9E0EMHcvq1
	a/pIRctxarQ/e2XHer2xu/zRfJwEDoxMqkXlaUPXL+O+J3o2BeL+lXt22Y9/ohE=
X-Google-Smtp-Source: AGHT+IFEx5gvdoD4Zrc0pqo7tpAEBPlxvqnzo7/GhTlowj961Of3/+m7M0CGsFBl0RRysSEcxuqCEw==
X-Received: by 2002:a2e:beaa:0:b0:2f3:cd4e:b931 with SMTP id 38308e7fff4ca-2f6105c4987mr168319411fa.10.1725445473730;
        Wed, 04 Sep 2024 03:24:33 -0700 (PDT)
Message-ID: <ed5504e5-072b-48ed-abb6-fde5f994626e@citrix.com>
Date: Wed, 4 Sep 2024 11:24:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: fix UP build with gcc14
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <6c7e29c6-eefa-48a2-9f02-e74b35d0438c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6c7e29c6-eefa-48a2-9f02-e74b35d0438c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/09/2024 11:15 am, Jan Beulich wrote:
> The complaint is:
>
> In file included from ././include/xen/config.h:17,
>                  from <command-line>:
> arch/x86/smpboot.c: In function ‘link_thread_siblings.constprop’:
> ./include/asm-generic/percpu.h:16:51: error: array subscript [0, 0] is outside array bounds of ‘long unsigned int[1]’ [-Werror=array-bounds=]
>    16 |     (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
> ./include/xen/compiler.h:140:29: note: in definition of macro ‘RELOC_HIDE’
>   140 |     (typeof(ptr)) (__ptr + (off)); })
>       |                             ^~~
> arch/x86/smpboot.c:238:27: note: in expansion of macro ‘per_cpu’
>   238 |     cpumask_set_cpu(cpu2, per_cpu(cpu_sibling_mask, cpu1));
>       |                           ^~~~~~~
> In file included from ./arch/x86/include/generated/asm/percpu.h:1,
>                  from ./include/xen/percpu.h:30,
>                  from ./arch/x86/include/asm/cpuid.h:9,
>                  from ./arch/x86/include/asm/cpufeature.h:11,
>                  from ./arch/x86/include/asm/system.h:6,
>                  from ./include/xen/list.h:11,
>                  from ./include/xen/mm.h:68,
>                  from arch/x86/smpboot.c:12:
> ./include/asm-generic/percpu.h:12:22: note: while referencing ‘__per_cpu_offset’
>    12 | extern unsigned long __per_cpu_offset[NR_CPUS];
>       |                      ^~~~~~~~~~~~~~~~
>
> Which I consider bogus in the first place ("array subscript [0, 0]" vs a
> 1-element array). Yet taking the experience from 99f942f3d410 ("Arm64:
> adjust __irq_to_desc() to fix build with gcc14") I guessed that
> switching function parameters to unsigned int (which they should have
> been anyway) might help. And voilà ...
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Presumably we're going to pick this up very very rarely on RANDCONFIG
now that someone regenerated the Tumbleweed containers ?

