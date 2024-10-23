Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 919099ACBEE
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 16:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824700.1238869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3c2j-0003f0-Vd; Wed, 23 Oct 2024 14:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824700.1238869; Wed, 23 Oct 2024 14:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3c2j-0003c8-SN; Wed, 23 Oct 2024 14:08:57 +0000
Received: by outflank-mailman (input) for mailman id 824700;
 Wed, 23 Oct 2024 14:08:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VMbu=RT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t3c2j-0003c2-7E
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 14:08:57 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56a70c4d-9148-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 16:08:55 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9a0cee600aso849979466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 07:08:55 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912d6545sm480034366b.31.2024.10.23.07.08.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2024 07:08:53 -0700 (PDT)
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
X-Inumbo-ID: 56a70c4d-9148-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729692534; x=1730297334; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Qw3URcmATMuOWneLKp7CkmWtb7Zl5Gucm3oWrGNphg=;
        b=Ghj8xj+omDrZqTT5/dMIumN37vApjkRl4O4he3iB2+NxNCnivucap1ERXDgtkeHc3t
         Tq8FECLIFph3xXEFnyIte4R1/TXrUN9/gRtoSQX0gtIidBmYvXzOCm8SnSWw03oAdhJB
         jmN0DnlypimY/gSiIRzYQWdApeJ3T+KGQcwL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729692534; x=1730297334;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Qw3URcmATMuOWneLKp7CkmWtb7Zl5Gucm3oWrGNphg=;
        b=vJp3An9Ljj5EjpJYEvxSoa0KhWI85diNFCUDfmtA5Xzp5XKLcuLTO5hWNTwOi3uskO
         Z4rZ76PAxksK4bkIJnAXROq3D+Q2D5l2Dr1fWtRaHm5LgKNyOmNX40iRuJA4mULsCaDF
         P+aKQwimXG1OQbXhABWGXH57gNOM31qCCmOerRhxrzsNFDzPmX88jjum4sC+vic/Ss5W
         zgj+bnyShkcY3FaSKclVMBz0ziUcLWOLmrYJGXtYuUPHEZO2SUxUy4A4MP1kkdjurs96
         G2S6GrjNnpN+9qVdAWOjvpqDFWnMuEGcBNITPQx3xEsw7oBlrVuahTFcPjATUq4rEOz9
         v2kg==
X-Forwarded-Encrypted: i=1; AJvYcCWYVSnrU0Bj2gas6UZzwTFyrSVHVAvpkSZAqeYg5uleXCZnaXer7dvjrC+mzhzV1f8mFIxQMZ4uMEA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvcOSvcvxmr9LsXMVvdSxfECXGZZbQ6a2pLTFQc8xA81r9rZu9
	xM1mGNonDz8pbuuxTgYm/TBe+pjIoexgKtu9JRC/5M1Em6tvbkp6z2fF6u80WJw=
X-Google-Smtp-Source: AGHT+IEdzioL8U3X5IIPQMj353Sd9ESWdoHQRF+rCnrrc1SROolwkNDAPWqbkPbiZH7UOW6MI+Ncxw==
X-Received: by 2002:a17:907:9805:b0:a9a:294:cb30 with SMTP id a640c23a62f3a-a9abf890ef7mr206541366b.16.1729692534305;
        Wed, 23 Oct 2024 07:08:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Oct 2024 15:08:51 +0100
Message-Id: <D538TV4LGFZF.J375ZVYWPIHO@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich"
 <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>
Subject: Re: [PATCH 1/6] xen: add a domain unique id to each domain
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Juergen Gross" <jgross@suse.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-2-jgross@suse.com>
In-Reply-To: <20241023131005.32144-2-jgross@suse.com>

On Wed Oct 23, 2024 at 2:10 PM BST, Juergen Gross wrote:
> Xenstore is referencing domains by their domid, but reuse of a domid
> can lead to the situation that Xenstore can't tell whether a domain
> with that domid has been deleted and created again without Xenstore
> noticing the domain is a new one now.
>
> Add a global domain creation unique id which is updated when creating
> a new domain, and store that value in struct domain of the new domain.
> The global unique id is initialized with the system time and updates
> are done via the xorshift algorithm which is used for pseudo random
> number generation, too (see https://en.wikipedia.org/wiki/Xorshift).
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> V1:
> - make unique_id local to function (Jan Beulich)
> - add lock (Julien Grall)
> - add comment (Julien Grall)
> ---
>  xen/common/domain.c     | 20 ++++++++++++++++++++
>  xen/include/xen/sched.h |  3 +++
>  2 files changed, 23 insertions(+)
>
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 92263a4fbd..3948640fb0 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -562,6 +562,25 @@ static void _domain_destroy(struct domain *d)
>      free_domain_struct(d);
>  }
> =20
> +static uint64_t get_unique_id(void)
> +{
> +    static uint64_t unique_id;
> +    static DEFINE_SPINLOCK(lock);
> +    uint64_t x =3D unique_id ? : NOW();
> +
> +    spin_lock(&lock);
> +
> +    /* Pseudo-randomize id in order to avoid consumers relying on sequen=
ce. */
> +    x ^=3D x << 13;
> +    x ^=3D x >> 7;
> +    x ^=3D x << 17;
> +    unique_id =3D x;
> +
> +    spin_unlock(&lock);
> +
> +    return x;
> +}
> +
>  static int sanitise_domain_config(struct xen_domctl_createdomain *config=
)
>  {
>      bool hvm =3D config->flags & XEN_DOMCTL_CDF_hvm;
> @@ -654,6 +673,7 @@ struct domain *domain_create(domid_t domid,
> =20
>      /* Sort out our idea of is_system_domain(). */
>      d->domain_id =3D domid;
> +    d->unique_id =3D get_unique_id();
> =20
>      /* Holding CDF_* internal flags. */
>      d->cdf =3D flags;
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 90666576c2..1dd8a425f9 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -370,6 +370,9 @@ struct domain
>      domid_t          domain_id;
> =20
>      unsigned int     max_vcpus;
> +
> +    uint64_t         unique_id;       /* Unique domain identifier */
> +

Why not xen_domain_handle_t handle, defined later on? That's meant to be a
UUID, so this feels like a duplicate field.

>      struct vcpu    **vcpu;
> =20
>      shared_info_t   *shared_info;     /* shared data area */

Cheers,
Alejandro

