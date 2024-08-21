Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD74B95A314
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 18:43:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781434.1190969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgoPq-0002JY-Kp; Wed, 21 Aug 2024 16:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781434.1190969; Wed, 21 Aug 2024 16:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgoPq-0002Gy-HV; Wed, 21 Aug 2024 16:42:34 +0000
Received: by outflank-mailman (input) for mailman id 781434;
 Wed, 21 Aug 2024 16:42:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zk+i=PU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sgoPo-0002GZ-QT
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 16:42:32 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b96c701-5fdc-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 18:42:30 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5bf0261f162so3748874a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 09:42:30 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838396d048sm914624066b.204.2024.08.21.09.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 09:42:29 -0700 (PDT)
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
X-Inumbo-ID: 5b96c701-5fdc-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724258550; x=1724863350; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uIToOcS9bFZSObp588RX/bNigbju3ljCQwSBwqDf8M=;
        b=LB0K29S0ivCQ/+Fp+rMBWf2lQNh5dD9SMTCGQEBhhDmMIqcLNDOarq4AoXAlY3+JZc
         eGRaQmd8zb9pMIJtYGlNALYjBrYFXvJk+dZnp4eCf0bm/3pmHX9sH4u8XPFo35mHkX6B
         p4E8gF8bFP0UgITFXqX5PlBr9MVNF9JmbvwQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724258550; x=1724863350;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/uIToOcS9bFZSObp588RX/bNigbju3ljCQwSBwqDf8M=;
        b=Sfi/jsGTbCQNv9jtPzlTyJfMriTX7zOACrGIOByB5LQ+vNnYtU7z4p4bQqYYaZpZkK
         3S6v46Gy1XnoBTHYEfBrF3+f0kAYlQRUu21rTZ+uNW+bfmaDTJlVEonnMY1qCGxj+J8P
         2kFuXz31/P5608m7fOVLgs5B9WVAJASZMNHgdvIq3JsamkP1uR3zj1rMH1RFwhQBP32Z
         C7lNOk7BR08NSiIbz3ygcV8OfZrrX+gbbTfwe3F2uP68T1xQhzDwrA8WvSopLDH13Xnm
         5qauzpGd6bmAQw8dtAT9aRbBNUkBkL/hlvQHv6SCj8QqK3SgjrRa2dwZkSC+NEx9KWUy
         dD6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHKGBEEF6/jb/T3BB+yeRskyQuKCfSol6LMeWP0+pdeuVB4HQ6jd9ESQq60QqvQhS4RakiDzz1+Ck=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPq+KfxNjjthNz4DXzYXA08begbS56gZDcPaXvpcz1O73Cn7ni
	s/mZcPU8KY36nYIsgipghTwC2auKkyuAAdzkZHOgn79PSvnjQ/LLf/6NL/f/ESk=
X-Google-Smtp-Source: AGHT+IEj65N+H978XYqlVJ2CD9FvizofeBrq+ZMOPLDW7RL7tiqfmkpEergnfNeL94qBJG1w+I0E4Q==
X-Received: by 2002:a17:907:d84a:b0:a6f:4a42:1976 with SMTP id a640c23a62f3a-a866f42df5cmr233821766b.37.1724258549984;
        Wed, 21 Aug 2024 09:42:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Aug 2024 17:42:26 +0100
Message-Id: <D3LQN57ALKYC.1RG6ZQ90U2WEB@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 15/22] x86/idle: allow using a per-pCPU L4
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-16-roger.pau@citrix.com>
In-Reply-To: <20240726152206.28411-16-roger.pau@citrix.com>

On Fri Jul 26, 2024 at 4:21 PM BST, Roger Pau Monne wrote:
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 9cfcf0dc63f3..b62c4311da6c 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -555,6 +555,7 @@ void arch_vcpu_regs_init(struct vcpu *v)
>  int arch_vcpu_create(struct vcpu *v)
>  {
>      struct domain *d =3D v->domain;
> +    root_pgentry_t *pgt =3D NULL;
>      int rc;
> =20
>      v->arch.flags =3D TF_kernel_mode;
> @@ -589,7 +590,23 @@ int arch_vcpu_create(struct vcpu *v)
>      else
>      {
>          /* Idle domain */
> -        v->arch.cr3 =3D __pa(idle_pg_table);
> +        if ( (opt_asi_pv || opt_asi_hvm) && v->vcpu_id )
> +        {
> +            pgt =3D alloc_xenheap_page();
> +
> +            /*
> +             * For the idle vCPU 0 (the BSP idle vCPU) use idle_pg_table
> +             * directly, there's no need to create yet another copy.
> +             */

Shouldn't this comment be in the else branch instead? Or reworded to refer =
to
non-0 vCPUs.

> +            rc =3D -ENOMEM;

While it's true rc is overriden later, I feel uneasy leaving it with -ENOME=
M
after the check. Could we have it immediately before "goto fail"?

> +            if ( !pgt )
> +                goto fail;
> +
> +            copy_page(pgt, idle_pg_table);
> +            v->arch.cr3 =3D __pa(pgt);
> +        }
> +        else
> +            v->arch.cr3 =3D __pa(idle_pg_table);
>          rc =3D 0;
>          v->arch.msrs =3D ZERO_BLOCK_PTR; /* Catch stray misuses */
>      }
> @@ -611,6 +628,7 @@ int arch_vcpu_create(struct vcpu *v)
>      vcpu_destroy_fpu(v);
>      xfree(v->arch.msrs);
>      v->arch.msrs =3D NULL;
> +    free_xenheap_page(pgt);
> =20
>      return rc;
>  }

I guess the idle domain has a forever lifetime and its vCPUs are kept aroun=
d
forever too, right?; otherwise we'd need extra logic in the the vcpu_destro=
y()
to free the page table copies should they exist too.

Cheers,
Alejandro

