Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3279A0725A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 11:02:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867986.1279526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpN3-0006Me-Ae; Thu, 09 Jan 2025 10:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867986.1279526; Thu, 09 Jan 2025 10:02:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpN3-0006L4-6h; Thu, 09 Jan 2025 10:02:33 +0000
Received: by outflank-mailman (input) for mailman id 867986;
 Thu, 09 Jan 2025 10:02:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bl7y=UB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVpN1-0006Kw-R8
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 10:02:31 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6473498-ce70-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 11:02:30 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3863c36a731so516624f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 02:02:29 -0800 (PST)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b81b1sm1365516f8f.66.2025.01.09.02.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 02:02:28 -0800 (PST)
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
X-Inumbo-ID: d6473498-ce70-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736416949; x=1737021749; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7taUQX4gFuWHdN9JpHRdnhM6vwp4FN1NNAvz13wXefk=;
        b=MrziLrAb2FPEKGuWeHF15UDJ5+7I9zKwjcib2/KfAjC89SvabwVBtJhQG7Kn5S2Moq
         Bu0kJtzyE6TW6MWoraDHaJ55XCrg8BzTouK0RxwV7adFb/yiJAnVyFLtKfDTl9Hkiik0
         U3oJkXL2tRySkmD8uip8VKwHbxnKQp6hmV1y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736416949; x=1737021749;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7taUQX4gFuWHdN9JpHRdnhM6vwp4FN1NNAvz13wXefk=;
        b=jbOwCl3SKuim1Tg0ZYZ3WTvWuubK6fXLmxNymDVKnRVCLZrsnXOG6gBWt5JFbwxA3+
         KVYw1qCKGw6qosrSJPbX4B9tOCK5iWvXd5us+e6VmW3BGd/1rrhkVieZ8SkTu8n1pUIl
         PDw2zQCmj0Ry3U0xLlmSwDeDXz5dJLEqN8rGP5NGP0vNHNqzwqUKDgkmBDm30uQilkAQ
         pEV2IXrhfRZJyCw45b00hYteRtxDSQolnef29nqbZEP8L1lxq+29qdPIerz9zdxFW9jt
         O1LwaqINKWtWOuDGMJPC6JiXEIlQa9jm/uSG4LP2qV9svtYwKjWYIxPpLMmrwcCjAhSa
         zTbA==
X-Forwarded-Encrypted: i=1; AJvYcCWGRa5gyhuTCxkZCUET8phqKjpDZhmu0+VxGEo+PpOmLGlihEMmjMexneNSPlJg4C8/VtWSZ+RLIzI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoLspM4HqyXpWAs1kSeDkwREcmAGCSyH47FtVNSafCvQlxxRK6
	3rmE8dqS5zKVSmGIjQ+rk7S7b8UldII8STk0abJ4SdX5zyje5vD3C0CXD0W87PA=
X-Gm-Gg: ASbGncueskwfdYBW1LlIZbXNYseyvsxYy5ltQFAtgNbVk2cfiLTkCvgPxfDTcph8jfv
	vSj7/wE3ruhvOJ4bPUdakE/b0MO8JgBPhG/AScSYkE/YFHVgw5hCHPPVlnbiN4KL4smyLzcBSNW
	4SZe6CUaZ3bHZdg8xa6EoP40Dj1ZGvNf6SxV/IRyksaC771rWihzPxAuFnKRCoqXJdCyzRt6/3c
	bQW64Zy9uEB+FDxbxaPwjU9Gx6OzlswQu5t2hx2ecnseUWyTr5qUEDfKcshbkc=
X-Google-Smtp-Source: AGHT+IFhoSdng/+TCaEoK/iD6N/XGyLuXf/e0BCMtz0DFOQB36VSd0Uzas2qhhcIN+ElU8BBaI7jQw==
X-Received: by 2002:a05:6000:1f82:b0:385:f560:7924 with SMTP id ffacd0b85a97d-38a872fc5cbmr4299364f8f.4.1736416949193;
        Thu, 09 Jan 2025 02:02:29 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jan 2025 10:02:19 +0000
Message-Id: <D6XGFLRRLY4N.3IFSIDMFC4BVJ@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 05/18] x86/mm: switch destroy_perdomain_mapping()
 parameter from domain to vCPU
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-6-roger.pau@citrix.com>
In-Reply-To: <20250108142659.99490-6-roger.pau@citrix.com>

On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> In preparation for the per-domain area being populated with per-vCPU mapp=
ings
> change the parameter of destroy_perdomain_mapping() to be a vCPU instead =
of a
> domain, and also update the function logic to allow manipulation of per-d=
omain
> mappings using the linear page table mappings.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/include/asm/mm.h |  2 +-
>  xen/arch/x86/mm.c             | 24 +++++++++++++++++++++++-
>  xen/arch/x86/pv/domain.c      |  3 +--
>  xen/arch/x86/x86_64/mm.c      |  2 +-
>  4 files changed, 26 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.=
h
> index b50a51327b2b..65cd751087dc 100644
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -605,7 +605,7 @@ int create_perdomain_mapping(struct domain *d, unsign=
ed long va,
>                               struct page_info **ppg);
>  void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
>                                  mfn_t *mfn, unsigned long nr);
> -void destroy_perdomain_mapping(struct domain *d, unsigned long va,
> +void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
>                                 unsigned int nr);
>  void free_perdomain_mappings(struct domain *d);
> =20
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 0abea792486c..713ae8dd6fa3 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -6511,10 +6511,11 @@ void populate_perdomain_mapping(const struct vcpu=
 *v, unsigned long va,
>      unmap_domain_page(l3tab);
>  }
> =20
> -void destroy_perdomain_mapping(struct domain *d, unsigned long va,
> +void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
>                                 unsigned int nr)
>  {
>      const l3_pgentry_t *l3tab, *pl3e;
> +    const struct domain *d =3D v->domain;
> =20
>      ASSERT(va >=3D PERDOMAIN_VIRT_START &&
>             va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
> @@ -6523,6 +6524,27 @@ void destroy_perdomain_mapping(struct domain *d, u=
nsigned long va,
>      if ( !d->arch.perdomain_l3_pg )
>          return;
> =20
> +    /* Use likely to force the optimization for the fast path. */
> +    if ( likely(v =3D=3D current) )

As in the previous patch, doesn't using curr_vcpu here...

> +    {
> +        l1_pgentry_t *pl1e;
> +
> +        /* Ensure page-tables are from current (if current !=3D curr_vcp=
u). */
> +        sync_local_execstate();

... avoid the need for this?

> +
> +        pl1e =3D &__linear_l1_table[l1_linear_offset(va)];
> +
> +        /* Fast path: zap L1 entries using the recursive linear mappings=
. */
> +        for ( ; nr--; pl1e++ )
> +        {
> +            if ( perdomain_l1e_needs_freeing(*pl1e) )
> +                free_domheap_page(l1e_get_page(*pl1e));
> +            l1e_write(pl1e, l1e_empty());
> +        }
> +
> +        return;
> +    }
> +
>      l3tab =3D __map_domain_page(d->arch.perdomain_l3_pg);
>      pl3e =3D l3tab + l3_table_offset(va);
> =20
> diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
> index bc7cd0c62f0e..7e8bffaae9a0 100644
> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -285,8 +285,7 @@ static int pv_create_gdt_ldt_l1tab(struct vcpu *v)
> =20
>  static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
>  {
> -    destroy_perdomain_mapping(v->domain, GDT_VIRT_START(v),
> -                              1U << GDT_LDT_VCPU_SHIFT);
> +    destroy_perdomain_mapping(v, GDT_VIRT_START(v), 1U << GDT_LDT_VCPU_S=
HIFT);
>  }
> =20
>  void pv_vcpu_destroy(struct vcpu *v)
> diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
> index 389d813ebe63..c08b28d9693b 100644
> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -737,7 +737,7 @@ int setup_compat_arg_xlat(struct vcpu *v)
> =20
>  void free_compat_arg_xlat(struct vcpu *v)
>  {
> -    destroy_perdomain_mapping(v->domain, ARG_XLAT_START(v),
> +    destroy_perdomain_mapping(v, ARG_XLAT_START(v),
>                                PFN_UP(COMPAT_ARG_XLAT_SIZE));
>  }
> =20

Cheers,
Alejandro

