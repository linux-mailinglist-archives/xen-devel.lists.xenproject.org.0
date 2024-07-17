Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 564F7933D58
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 15:06:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759980.1169692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU4M1-00057R-2t; Wed, 17 Jul 2024 13:05:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759980.1169692; Wed, 17 Jul 2024 13:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU4M0-000557-VO; Wed, 17 Jul 2024 13:05:56 +0000
Received: by outflank-mailman (input) for mailman id 759980;
 Wed, 17 Jul 2024 13:05:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rux=OR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sU4Lz-000551-E3
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 13:05:55 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cb9f874-443d-11ef-bbfd-fd08da9f4363;
 Wed, 17 Jul 2024 15:05:54 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a77bf336171so142288166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2024 06:05:54 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc7ff780sm443598866b.169.2024.07.17.06.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 06:05:52 -0700 (PDT)
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
X-Inumbo-ID: 4cb9f874-443d-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721221554; x=1721826354; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/x4ZQD7ypZDl+Ljv6KAJWPhfFVrPqfqhGiTqZz+aQ+A=;
        b=YGPzaRJ/fJLdjRC1jTJ191MrgPBi/mrTH6ha9rrk4b25F8Adk18LAndFV4fgUmuuVu
         Jk4h6X5GMouaT/a/5WLtLm7bixNe1gUjCZaTY2LQzgeU1v8EHChYNpp4rxVe7EpVsUJI
         lhatMf05Supo95abL1AjmIwaIh+87OmRJQKn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721221554; x=1721826354;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/x4ZQD7ypZDl+Ljv6KAJWPhfFVrPqfqhGiTqZz+aQ+A=;
        b=fMSYjU0q2LJcCiK0GS1MrdIfLU9cq8JhCf7kJeBoWVqefS0L92MrRC1ZXZPOmwxv63
         sPZb7JgQhYgvWG5IOj3V06i4BvXCdTVHHlVj2c/YYkwoUoXWxLp4ULgOGxHUpc5RwKev
         C8q6l6cbH0qo073qGA5okQL8drt9+xAf1qqziKevI/ePnEsgDJ2AspuSU7k8u8oykMj+
         +FU7QfkaSIsdDkqS2myk0Zi77n49LlmQ9jYQH56B8lXx1SEu9fJCw1NIU4FUhYj927xw
         DDmFcCZQWXVGPtURuJaS4E1nC04gZfsVvnIDfWYUiOcbrhZeR0S/3bvk7ETku3dcZLht
         c1iA==
X-Forwarded-Encrypted: i=1; AJvYcCVH6Ch9p/eIPg3+GRMzvHpoMkmxeQYBMZ//NKS/J2mF5fAWVsZv7RSJVta/z4/MZSI2zyJDrvoTN3/U/cLTqrbR3YsyMB3ELwd7CHaG5yw=
X-Gm-Message-State: AOJu0YzvZ2c520TMtwBu17m7YW2XucDsfmftN4OGusww2cx3okRO8gY5
	lcyxapEh8wfdaszeosLHCJv5DOEmUmmsr4fVdNAvtTFjU85XgXuq4+zXdMHXs/uZe30o8bkjt7n
	/
X-Google-Smtp-Source: AGHT+IHyUXIWz+gITe3It0Rwb/8J+119HQYwors4+DHBfNcpXqJi1ld5qgWzq3eZAR7DYTHvC1nHkg==
X-Received: by 2002:a17:906:514:b0:a6e:f869:d718 with SMTP id a640c23a62f3a-a7a007a8853mr166091466b.21.1721221553751;
        Wed, 17 Jul 2024 06:05:53 -0700 (PDT)
Message-ID: <dd01ff4e-2f81-4291-b155-b2baa693548f@citrix.com>
Date: Wed, 17 Jul 2024 14:05:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: drop REX64_PREFIX
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <16b45b39-aadd-4a53-bcb9-214ded193db9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <16b45b39-aadd-4a53-bcb9-214ded193db9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/07/2024 1:40 pm, Jan Beulich wrote:
> While we didn't copy the full Linux commentary, Linux commit
> 7180d4fb8308 ("x86_64: Fix 64bit FXSAVE encoding") is quite explicit
> about gas 2.16 supporting FXSAVEQ / FXRSTORQ. As that's presently our
> minimal required version, we can drop the workaround that was needed for
> yet for older gas.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

It's especially nice to get rid of the __sun__ block, although having
looked through this, ...

>
> --- a/xen/arch/x86/i387.c
> +++ b/xen/arch/x86/i387.c
> @@ -64,13 +64,12 @@ static inline void fpu_fxrstor(struct vc
>      {
>      default:
>          asm volatile (
> -            /* See below for why the operands/constraints are this way. */
> -            "1: " REX64_PREFIX "fxrstor (%2)\n"
> +            "1: fxrstorq %0\n"
>              ".section .fixup,\"ax\"   \n"
>              "2: push %%"__OP"ax       \n"
>              "   push %%"__OP"cx       \n"
>              "   push %%"__OP"di       \n"
> -            "   mov  %2,%%"__OP"di    \n"
> +            "   lea  %0,%%"__OP"di    \n"
>              "   mov  %1,%%ecx         \n"
>              "   xor  %%eax,%%eax      \n"
>              "   rep ; stosl           \n"
> @@ -81,7 +80,7 @@ static inline void fpu_fxrstor(struct vc
>              ".previous                \n"
>              _ASM_EXTABLE(1b, 2b)

... the internals of the fixup section leave a lot to be desired.

My build happens to have emitted lea (%rdi), %rdi for this.

A better option than opencoding memset() would be to simply return
-EIO/-EFAULT like we do from *msr_safe(), writing the error path in C,
and getting the system optimised memset() rather than using a form which
is definitely sub-optimal on all 64bit processors.

~Andrew

