Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6904F93FA28
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 17:59:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766955.1177505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYSmI-0003Wz-K0; Mon, 29 Jul 2024 15:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766955.1177505; Mon, 29 Jul 2024 15:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYSmI-0003Uz-GM; Mon, 29 Jul 2024 15:59:14 +0000
Received: by outflank-mailman (input) for mailman id 766955;
 Mon, 29 Jul 2024 15:59:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+rL=O5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sYSmH-0003Ut-PR
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 15:59:13 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f9a66e4-4dc3-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 17:59:12 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5a2ffc346ceso5424283a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 08:59:12 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac64eb3146sm5971061a12.66.2024.07.29.08.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 08:59:11 -0700 (PDT)
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
X-Inumbo-ID: 7f9a66e4-4dc3-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722268752; x=1722873552; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ihSbzRgipOsuD09EvEfqCPX1X75vAlN/2OSNtZs5Mgs=;
        b=mUNhLMRPIBUalfiOjLSizuHw0B+SzpFXYh6RzA4T1jUi1x7OMFtvIg+bFp7k2XKXPY
         ZVZGfc3FHqdi3qvZi4XlHHip906xSRmzg8wUgo8vFE0Io2lkH0HfpcpXX/oFN9DDYwO7
         eI1ysVONkENVq830G94vXOoTdh4kQVYFUueaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722268752; x=1722873552;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihSbzRgipOsuD09EvEfqCPX1X75vAlN/2OSNtZs5Mgs=;
        b=qCZ7POimNF4g1B3ChCm+MKlM0W4OtXjozoo0m0j5Rx74+MlwDChTMI5cDqQLIMb4Un
         NZJ1wMPq8YhagBZO4K9qZezWuL+aG+CZ90L7JB0kxuk2grZZVqZsYlH4+nMmJ68QnUCN
         s4Yi4lpYNx/jKTh75abNzzECqA2ZeL/E3ITyoKeJrwJtLu9Ua8RTGbAYrpGvIlkRDTCo
         hLXc5kE6NNVt/KbTcO9r9+3w3LTIA63cW/UOeiksV8T64NZr59XxDUcZ+/2Z9bmTcKFX
         c53wkrgiuiDUX8MpFJZuAfSvgccP377bn7HxBiAOKy4Z/lRd08mkFJYpADc/xsE2nKcu
         VoQA==
X-Forwarded-Encrypted: i=1; AJvYcCXb/Y4muoDDjK7/5ca/tKDWZP9GGN4419jGGAmh5t+au2TRmWm4RLIOXiYtOMCXltF27JCwRWsDEK05KOsQ68RONbQtCA1CBffll9EAe1Q=
X-Gm-Message-State: AOJu0YxDrChuc6t7LvYckuxDu9BV6zA9b5CTUcM7h0dWP/7e/Zbuoq/5
	B1T2iZ6E7KrxzVaToFLgMjSha7R7q77TAVIwMkLsPRtAJs7d/DqrmU0n0NaYStk=
X-Google-Smtp-Source: AGHT+IGS61yS3bqMqHPfDjFOtKNu+n2YTsKUoPthJoWfR0VUlIfjW0cHCwSzGSWjW6TWOKQbhDcYBA==
X-Received: by 2002:a05:6402:2353:b0:5a1:807d:e868 with SMTP id 4fb4d7f45d1cf-5b021f0ded4mr6441071a12.24.1722268752056;
        Mon, 29 Jul 2024 08:59:12 -0700 (PDT)
Message-ID: <3077368e-caba-42ad-b6ac-3406ca5c4861@citrix.com>
Date: Mon, 29 Jul 2024 16:59:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/22] x86/dom0: only disable SMAP for the PV dom0 build
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com, Jan Beulich <jbeulich@suse.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-4-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240726152206.28411-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/07/2024 4:21 pm, Roger Pau Monne wrote:
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index eee20bb1753c..bc387d96b519 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -955,26 +955,9 @@ static struct domain *__init create_dom0(const module_t *image,
>          }
>      }
>  
> -    /*
> -     * Temporarily clear SMAP in CR4 to allow user-accesses in construct_dom0().
> -     * This saves a large number of corner cases interactions with
> -     * copy_from_user().
> -     */
> -    if ( cpu_has_smap )
> -    {
> -        cr4_pv32_mask &= ~X86_CR4_SMAP;
> -        write_cr4(read_cr4() & ~X86_CR4_SMAP);
> -    }
> -
>      if ( construct_dom0(d, image, headroom, initrd, cmdline) != 0 )
>          panic("Could not construct domain 0\n");
>  
> -    if ( cpu_has_smap )
> -    {
> -        write_cr4(read_cr4() | X86_CR4_SMAP);
> -        cr4_pv32_mask |= X86_CR4_SMAP;
> -    }
> -

Hang on.  Isn't this (preexistingly) broken given the distinction
between cpu_has_smap and X86_FEATURE_XEN_SMAP ?

I'm very tempted to use this as a justification to remove opt_smap.

~Andrew

