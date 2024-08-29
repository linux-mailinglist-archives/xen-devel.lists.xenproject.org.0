Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE0F9644FD
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 14:44:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785837.1195345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjeVh-0000Pn-8S; Thu, 29 Aug 2024 12:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785837.1195345; Thu, 29 Aug 2024 12:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjeVh-0000NQ-58; Thu, 29 Aug 2024 12:44:21 +0000
Received: by outflank-mailman (input) for mailman id 785837;
 Thu, 29 Aug 2024 12:44:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zolI=P4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjeVf-0000NK-E8
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 12:44:19 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6783802a-6604-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 14:44:17 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5343eeb4973so970276e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 05:44:17 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ccff2dsm670923a12.76.2024.08.29.05.44.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 05:44:15 -0700 (PDT)
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
X-Inumbo-ID: 6783802a-6604-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724935457; x=1725540257; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kGPKwiNAmHKwo1v3eCOZXL043wrQcm3nXEP4rh3wZco=;
        b=WQOpUvyaOOK0fdWHNbrRdERCI29uy+OOjslnkqYVBsznaSdCyZpNvXJhPL4wiIbNwk
         EWe+v66ZRppihHQNolkgZBaZ57JkLTDvYlw2QDjDqw2IOUl3FkBTkynGYXp/T7qBFeTM
         nhgOl1ke7L4JjxbwBJQRJyp/PCRmx3pFRISdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724935457; x=1725540257;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGPKwiNAmHKwo1v3eCOZXL043wrQcm3nXEP4rh3wZco=;
        b=p0T2K6/lOZezDBIP3QIA/lAIpmdglIVKzBwovoXf0NEOcvn7jGWqRtsqvKcJXoQGwR
         9fQNfgbgPpdTFDlqZm1EGEC+1kLK7DfGiMxwJIVNzwbvnalxUhwJZJr0ORBTEAeuerPp
         zcbS284A3XXLcjs1KZvHOjB3SnAGiSELsxAaE/7yb+VyTkSVlJbscA4jqN4COeKoLVAc
         cEw4KvRe//J91EcK8BCDLTnE9TDSAKKILUNtaW85f79mn/xhPk7Udl5DNNvtFXu6CKeS
         PMIWLxg+T3r6RpB3ukK8hE3tfSaKgfZzcPeVxEvyI7FB7qL9uz/UZ0CcaQJaehOERfwt
         l37A==
X-Forwarded-Encrypted: i=1; AJvYcCWgvM5aGttzjIOrRZevLwdHofTI+9NrmIHEXDg8GBM9lVbTajb0+MgSAEFOz9XK4jiQWim4aB/XqaE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzppKuaSgVd2VjK+2ecXgRVU3CZZD7Qy/AX/A5fbx0YUnofndsI
	OQZrnGV0yWUqYt+JSFbM/nydvlahTPVvEU0SoDIklZz1/wHczPkZhqXoNaUrumI=
X-Google-Smtp-Source: AGHT+IE2AAM02kHEuXjnrTFagwWEj9XkAq1XEKQqbZNRtcqiDpR4+ldcZzI32ACbnruDJi7rzNfpTw==
X-Received: by 2002:a05:6512:3b21:b0:52f:cd03:a84a with SMTP id 2adb3069b0e04-5353e5acd03mr2568880e87.39.1724935456358;
        Thu, 29 Aug 2024 05:44:16 -0700 (PDT)
Message-ID: <3fa09b21-fb7e-4b3c-91cb-d47c25608771@citrix.com>
Date: Thu, 29 Aug 2024 13:44:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] types: replace remaining uses of s32
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <b1ded557-63b8-4999-98ca-de80488ebad1@suse.com>
 <0e6b7685-e061-4ace-88fd-86728d765e5a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0e6b7685-e061-4ace-88fd-86728d765e5a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/08/2024 1:01 pm, Jan Beulich wrote:
> ... and move the type itself to linux-compat.h.
>
> While doing so switch a few adjacent types as well, for (a little bit
> of) consistency.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, with a minor
formatting request.

> --- a/xen/arch/arm/arm32/livepatch.c
> +++ b/xen/arch/arm/arm32/livepatch.c
> @@ -41,11 +41,11 @@ void arch_livepatch_apply(const struct l
>           * ARM DDI 0406C.c, see A2.3 (pg 45) and A8.8.18 pg (pg 334,335)
>           *
>           */
> -        delta = (s32)func->new_addr - (s32)(func->old_addr + 8);
> +        delta = (int32_t)func->new_addr - (int32_t)(func->old_addr + 8);
>  
>          /* The arch_livepatch_symbol_ok should have caught it. */
> -        ASSERT(delta >= -(s32)ARCH_LIVEPATCH_RANGE ||
> -               delta < (s32)ARCH_LIVEPATCH_RANGE);
> +        ASSERT(delta >= -(int32_t)ARCH_LIVEPATCH_RANGE ||
> +               delta < (int32_t)ARCH_LIVEPATCH_RANGE);

Could you vertically like this, like it is ...

> @@ -203,8 +204,8 @@ static int perform_rel(unsigned char typ
>           * arch_livepatch_verify_distance can't account of addend so we have
>           * to do the check here as well.
>           */
> -        if ( (s32)val < -(s32)ARCH_LIVEPATCH_RANGE ||
> -             (s32)val >= (s32)ARCH_LIVEPATCH_RANGE )
> +        if ( (int32_t)val < -(int32_t)ARCH_LIVEPATCH_RANGE ||
> +             (int32_t)val >= (int32_t)ARCH_LIVEPATCH_RANGE )
>              return -EOVERFLOW;

... here?

I'd argue that even this one wants one extra space in the middle, so the
'-' is further to the right of the >=.

~Andrew

