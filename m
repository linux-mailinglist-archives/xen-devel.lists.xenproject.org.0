Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F92593515F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 19:54:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760686.1170583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUVJl-000712-Se; Thu, 18 Jul 2024 17:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760686.1170583; Thu, 18 Jul 2024 17:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUVJl-0006yv-OX; Thu, 18 Jul 2024 17:53:25 +0000
Received: by outflank-mailman (input) for mailman id 760686;
 Thu, 18 Jul 2024 17:53:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MiOu=OS=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sUVJk-0006ym-I8
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 17:53:24 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0416f6d-452e-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 19:53:23 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a6fd513f18bso135250566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 10:53:23 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc5b7ef5sm592451166b.82.2024.07.18.10.53.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 10:53:22 -0700 (PDT)
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
X-Inumbo-ID: a0416f6d-452e-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721325203; x=1721930003; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0lp9482kAAfJ6VbIIrSYE5SBTbQePlXwFTltb1GbOU=;
        b=X9SzttugN+3OkoI6KwwyJLy/ZaGpvoweV0I4uOPcU1uN+ArvD3gBhgYd2mhd7Sjwwp
         kn+Q85/xu6IJQ2BqyL0y0/pBrTmVvEUM66mITnaaULtam36Yj+gThSS5RGRrMwtXo1+I
         /g0JgDsvDxWEPrQ4bZ4lnXE7NWkcQ3FZKsjwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721325203; x=1721930003;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P0lp9482kAAfJ6VbIIrSYE5SBTbQePlXwFTltb1GbOU=;
        b=HaXUWAxopH7Q/iSd6tTHZsF4/Uu4G8Cz89RLKuZS6rKgYAY1vooSTQjMeYZk7M0fBO
         bfvblV/wz1CLM13d9o1Ct/yta8Es3cgoeHCL5ZqvCG/fW/9Yaywb0EpUHcSq2om/MMRH
         Eu8KRiHMVF4UwI3eejvouVzaWOOs7J6qMM6ATsXoMOPAOWwM7LRPhTRpCdFaVA7EO4KN
         oCgUSh4fEJemtLGK+uUcU0khoHXDsnFFKwbZrRQSEQQKckMOGDPqYX5CQhupYNHppB+W
         hB1c6AQddPse8VCSJEyMsLzy3SYfXh4qRp3c/jFSuKpbQjID+xlvGTbSYsFHY2ujS+Ok
         IlwA==
X-Forwarded-Encrypted: i=1; AJvYcCUdV0a+6f9/BrgQX6mB/Ho46lgxjTzxZqPT5BwsOH08b/nrX4FegTbRzXCye6G68YWH2VKuOa7UiNyomrnPsl28rQV/YQr5rrn5Yir/4IY=
X-Gm-Message-State: AOJu0Yw/GvJTccaE+mu3wjZ62r3+pTseh/TkE3yvjfXDFw/jJ6vQWap5
	n3ljeILZwxGdyo5WP3zTr2U6oG9XzvfAziz2MndJa90wQlIMjaSLAVsJ82ThRXg=
X-Google-Smtp-Source: AGHT+IGadvCqNBSMSaMYwynS6YcMzc7kXlzySGV42M//JlM17evHbQ6TGwEyt94hFQvisk/B9xlzWQ==
X-Received: by 2002:a17:906:7147:b0:a77:e55a:9e7e with SMTP id a640c23a62f3a-a7a01369423mr395561966b.73.1721325202594;
        Thu, 18 Jul 2024 10:53:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Jul 2024 18:53:19 +0100
Message-Id: <D2SUUW3IXC2L.1U5ZWSZQN1HQA@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Teddy Astie" <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.19?] x86/IOMMU: Move allocation in
 iommu_identity_mapping
X-Mailer: aerc 0.17.0
References: <20240717155136.140303-1-teddy.astie@vates.tech>
In-Reply-To: <20240717155136.140303-1-teddy.astie@vates.tech>

On Wed Jul 17, 2024 at 4:51 PM BST, Teddy Astie wrote:
> If for some reason, xmalloc fails after having mapped the
> reserved regions, a error is reported, but the regions are
> actually mapped in p2m.
>
> Move the allocation before trying to map the regions, in
> case the allocation fails, no mapping is actually done
> which could allows this operation to be retried with the
> same regions without failing due to already existing mappings.
>
> Fixes: c0e19d7c6c ("IOMMU: generalize VT-d's tracking of mapped RMRR regi=
ons")
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  xen/drivers/passthrough/x86/iommu.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthroug=
h/x86/iommu.c
> index cc0062b027..b6bc6d71cb 100644
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -267,18 +267,22 @@ int iommu_identity_mapping(struct domain *d, p2m_ac=
cess_t p2ma,
>      if ( p2ma =3D=3D p2m_access_x )
>          return -ENOENT;
> =20
> +    map =3D xmalloc(struct identity_map);
> +    if ( !map )
> +        return -ENOMEM;
> +
>      while ( base_pfn < end_pfn )
>      {
>          int err =3D set_identity_p2m_entry(d, base_pfn, p2ma, flag);
> =20
>          if ( err )
> +        {
> +            xfree(map);
>              return err;
> +        }
>          base_pfn++;
>      }
> =20
> -    map =3D xmalloc(struct identity_map);
> -    if ( !map )
> -        return -ENOMEM;
>      map->base =3D base;
>      map->end =3D end;
>      map->access =3D p2ma;

That covers the case where xmalloc fails, but what about the case where
set_identity_p2m_entry() fails in for a middle pfn? (i.e: due to ENOMEM).

Cheers,
Alejandro

