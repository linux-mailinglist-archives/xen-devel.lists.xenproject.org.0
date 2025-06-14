Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3266AAD9E8E
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 19:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015771.1393311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQUr5-0005VM-1V; Sat, 14 Jun 2025 17:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015771.1393311; Sat, 14 Jun 2025 17:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQUr4-0005T4-UZ; Sat, 14 Jun 2025 17:39:46 +0000
Received: by outflank-mailman (input) for mailman id 1015771;
 Sat, 14 Jun 2025 17:39:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duY6=Y5=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1uQUr3-0005R1-Fl
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 17:39:45 +0000
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [2607:f8b0:4864:20::b2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e474e72-4946-11f0-a309-13f23c93f187;
 Sat, 14 Jun 2025 19:39:43 +0200 (CEST)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e733cd55f9eso3000258276.1; 
 Sat, 14 Jun 2025 10:39:43 -0700 (PDT)
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
X-Inumbo-ID: 8e474e72-4946-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749922783; x=1750527583; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jijwjlD7zMTQfj9ZUPoSFQPOyjJf+ju9Q9eltfAr+i0=;
        b=NEXBkN7bHPY5v+oDgJ2fUJKlsliRLRWK7WXocGsAklZvI4xdlPt6itJ1b3yOrk2E1i
         gZj/4Dq/hlBjyy0lfKGNdUAhfqjNflcT+3nO0Ankfy8UX3o7pviuNTpLcZLFJzpmE9aq
         8zTgBAlRUtZj6HniRxuAWf5uKGijZU5SnysBIVHMPUqpOUkfukyTMrU6Uvo2jGnlQwv1
         vdpKRUQYZ/Ey3K8zRag+Q0q2p5lnhaSQ2IwQGrMJu7GYIE8EqY43NPyi7739Tc9s5JKH
         INzB+v0sf9mpaoudlTnWfdlQPKBjAX2VtFhUNcBrRzSpEfteGX5man+pQudd/XXdq7Fo
         t4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749922783; x=1750527583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jijwjlD7zMTQfj9ZUPoSFQPOyjJf+ju9Q9eltfAr+i0=;
        b=Kfb+qUQhQf2AXrNR9OiDr4tJ6LqIxoiQiGhUNDiZydbbHTWqjskWixBAB3R+YsttPc
         b64YZE/L7j9kiA3ljnDZ5sMc0lgjJ+mPi1NNCOeq63m8o9Zp4IQAtcs0ecmgpo4JWb7y
         CXJIIjBpZNUp+qBYh0Y1TY1SNdncIyRseNDM4KJ462a8FOdUcqt7wr+G5QaFKo2MYIMP
         X6Mv+JtRV/2wzPDfh5n4TW6aRBNt1VhivzXL50ba3aRVP6NCFOV17sb4CH1CmsAx2bAN
         xjuaxPR/P7arpkeUg/aZCngL47FVFKwmGzL3XV68M/S/4YvX2fDbZMC8fygLDtZvK+Gf
         xORw==
X-Forwarded-Encrypted: i=1; AJvYcCWp6u5v+AeBsM9jefBgLLKfgQjetAcsXnueJgq1plU/kH81v67xiI4cvyd7zxoJ4zSuMN3niN2YiII=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKb6ArbcmVw9vgljOulFMKTdJGdEEhy6eRdzTvce5o6TDv8NYQ
	1k9zbMV7buUnHIkBAlKuv1lA5AoaStq+0/KV5rikne3dWsopfEUgR7OXRPlGTKuxPFzjak5j8IX
	1mByyIzwvE0onTYH6zyxy2jgHtxuF9f+oWg==
X-Gm-Gg: ASbGncsgCPnLUAE5Gw2d4ewyZ4qIza8yD6bMbq5mEZk7YJ0rst34F1Vi+HeG2LiVDfu
	4z2AUq6h4RoFjROaCiHmDToSL8tqUL1HCSCdKFKOxbfAklF/ABzkMlQSgwRCPjNcQBVFIg+QIbH
	1jOyK7ush+mXYhgU3M3bcDYbbMKpmc/HSDabh+YJSi
X-Google-Smtp-Source: AGHT+IEguFkYRuTDYpwR+wOtT2AGfqk3ImQrbVLvk0/Pzt5cMnO3ib5w2H1HlfJpZjLABK2GVNFH2+Go8oYA5yVxtdg=
X-Received: by 2002:a05:690c:968e:b0:70d:ffaf:48e1 with SMTP id
 00721157ae682-7117539740emr48321707b3.9.1749922782746; Sat, 14 Jun 2025
 10:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250321092451.17309-1-jgross@suse.com> <20250321092451.17309-13-jgross@suse.com>
In-Reply-To: <20250321092451.17309-13-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 14 Jun 2025 13:39:30 -0400
X-Gm-Features: AX0GCFva5OuwNXiOtNVtyFBSFpS4kWTwv5OKhrzObljnqSvIVGzUBq0rmIGD1TY
Message-ID: <CAKf6xpuyhqeONEr20BjzPxPmhBr6J+Fuw4YJUg-ecst8MLXVYg@mail.gmail.com>
Subject: Re: [MINI-OS PATCH 12/12] kexec: do the final kexec step
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, 
	samuel.thibault@ens-lyon.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 5:30=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> With all kexec preparations done, activate the new kernel.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  kexec.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/kexec.c b/kexec.c
> index 2db876e8..85b09959 100644
> --- a/kexec.c
> +++ b/kexec.c
> @@ -169,6 +169,7 @@ int kexec(void *kernel, unsigned long kernel_size, co=
nst char *cmdline)

> @@ -192,6 +193,13 @@ int kexec(void *kernel, unsigned long kernel_size, c=
onst char *cmdline)
>      if ( ret )
>          goto err;
>
> +    kexec_page =3D (void *)alloc_page();

kexec_page() is referenced already in do_kexec(), but it hasn't been
hooked up yet, right?  I guess that is okay.

If not an ASSERT on 1 page, then allocate KEXEC_SECSIZE?

Regards,
Jason

