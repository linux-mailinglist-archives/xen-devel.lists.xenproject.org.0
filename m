Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C1588174A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 19:25:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696094.1086729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn0cC-0002Mx-Kz; Wed, 20 Mar 2024 18:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696094.1086729; Wed, 20 Mar 2024 18:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn0cC-0002K5-Gp; Wed, 20 Mar 2024 18:24:40 +0000
Received: by outflank-mailman (input) for mailman id 696094;
 Wed, 20 Mar 2024 18:24:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FoSn=K2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rn0cB-0002Jz-4E
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 18:24:39 +0000
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [2607:f8b0:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b0078fa-e6e7-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 19:24:37 +0100 (CET)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3c398187b4dso156414b6e.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 11:24:37 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ge16-20020a05622a5c9000b00430b79aaa1esm5963929qtb.94.2024.03.20.11.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 11:24:34 -0700 (PDT)
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
X-Inumbo-ID: 1b0078fa-e6e7-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710959075; x=1711563875; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TuZek9bnFjLuMH9tITh2oa+4tTdqpkIFYiXhJCJJmoI=;
        b=N5YxeFJkkMWSXgkOEEcvMCMFFB7vjWaa4aRfeITA5OX4jtIKySNF2tvh4mpzRUu0VO
         eqirPhoJ+Yr+du8Px5+aRHRkQPQGZXd87zBUnMC27r53nlLfU1z+9f4QUmUy1UyOe+6x
         f5HzdbOvcYkuhge3jQwHHWugBKPFce6VR7iVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710959075; x=1711563875;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TuZek9bnFjLuMH9tITh2oa+4tTdqpkIFYiXhJCJJmoI=;
        b=KPS8IUE6eAVA+OEsTDHb8Acv5ePsY9IcTVNe5ChDKTgqyCB3LmHnb2jpQkLJLB7zQ/
         HiNG0Qy+gTuxUcJwPYR0Yc+jsg7wSFqqXhaZm8HAD4zmUCLsVH5UuFPnVcsbkvykY7Ee
         jEZ7/lUPZRX++F/7ejH9Zq3KDcvAmFuaoFqsjvamSyIsS4agk5z+kd9SjG3Yx3C6KaZN
         5vaWSky+ueCSXohhwIggQaG+M7ALXYjlrRI5cX7u69ne9J6w8PKDToGB8lZ3MTF1Ym6R
         BhMNDI70v5zd8sQeL02GzJXJ9uz04VgXXWp57VLU7O/hfkcFFfvaR7QNujHJ9CLnX5CY
         dfpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXYdQk4qXyBeGIQPjHA2l4icZ8h5eLXPCx4KG19/ZMrCPvEAarhlF07ba/rMwasnqnftwFbAh5P3rL/g7K1QwMh7ZesU6u61gfjlEPmiA=
X-Gm-Message-State: AOJu0YwIl8N1+/SlwejvU0GO6MWg527EydF9ReVZRsmrI9wfBR8SEmwy
	u/PY+9MRQ+PNEctE74t9uu5zcayKdmAMgpzVQ/NYu8MRDL1QXWJCk7WqUkPVQ3Tyii8csjTre/p
	Q
X-Google-Smtp-Source: AGHT+IEOpB56/mKx2IyLKd38j6ThBujl9ke9z3ITgUhHQNQXEWtUpZWb6NMbNrISDmt4pO/wsODrJA==
X-Received: by 2002:a05:6808:1185:b0:3c3:9933:9afa with SMTP id j5-20020a056808118500b003c399339afamr5851687oil.24.1710959075555;
        Wed, 20 Mar 2024 11:24:35 -0700 (PDT)
Message-ID: <0dc5010b-a960-42af-b02f-c10da54f05ea@citrix.com>
Date: Wed, 20 Mar 2024 18:24:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/ppc: Ensure ELF sections' physical load addresses
 start at 0x0
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, Jan Beulich <jbeulich@suse.com>
References: <20240320180021.70373-1-sanastasio@raptorengineering.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240320180021.70373-1-sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/03/2024 6:00 pm, Shawn Anastasio wrote:
> Some boot mechanisms, including the new linux file_load kexec systemcall
> used by system firmware v2.10 on RaptorCS systems will try to honor the
> physical address field of the ELF LOAD section header, which will fail
> when the address is based off of XEN_VIRT_START (0xc000000000000000).
>
> To ensure that the physical address of the LOAD section header starts at
> 0x0, import the DECL_SECTION macro from x86's xen.lds.S.
>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>  xen/arch/ppc/xen.lds.S | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
>
> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> index 05b6db2728..0ed285f0a7 100644
> --- a/xen/arch/ppc/xen.lds.S
> +++ b/xen/arch/ppc/xen.lds.S
> @@ -4,6 +4,12 @@
>  OUTPUT_ARCH(powerpc:common64)
>  ENTRY(start)
>  
> +#ifdef CONFIG_LD_IS_GNU
> +# define DECL_SECTION(x) x : AT(ADDR(#x) - XEN_VIRT_START)
> +#else
> +# define DECL_SECTION(x) x : AT(ADDR(x) - XEN_VIRT_START)
> +#endif

Could you put this in xen.lds.h please, and dedup it from x86 ?

With that done, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

