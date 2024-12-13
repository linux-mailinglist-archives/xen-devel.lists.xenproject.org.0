Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D219F100F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 16:00:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856765.1269288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM78h-0005pr-Jm; Fri, 13 Dec 2024 14:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856765.1269288; Fri, 13 Dec 2024 14:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM78h-0005nG-Ff; Fri, 13 Dec 2024 14:59:35 +0000
Received: by outflank-mailman (input) for mailman id 856765;
 Fri, 13 Dec 2024 14:59:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gKjA=TG=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tM78f-0005nA-Lu
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 14:59:33 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbaf3b52-b962-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 15:59:31 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aa69077b93fso272280366b.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 06:59:31 -0800 (PST)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa68f70cc47sm671340666b.123.2024.12.13.06.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 06:59:30 -0800 (PST)
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
X-Inumbo-ID: dbaf3b52-b962-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1734101971; x=1734706771; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8FDKQbpBGmim4bWvmV4I2XHERC7FpRhL8bJGk/mvcM=;
        b=KizIyDC9hZycwYoPTC3l0v8JZfJ/0VNjvQprgyEp+nhpn+vsmfx4vcchYKFviznvoY
         pWjfXmRxDz4BgGAtPCOnUsmeY/2RQZYjwtkll2vJhTeBjzbAlYOSp6QCmsL+8CY0hDAq
         fRourpYfUwtJADpyG7VKqZuQwuse9JuytHTDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101971; x=1734706771;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+8FDKQbpBGmim4bWvmV4I2XHERC7FpRhL8bJGk/mvcM=;
        b=SXm1gbc3tLoPHBeuZvp+FB7Pzz1VtwAcYlAtcmkLC5DImbjEXvBkSJemTMaM8NPOnb
         2mxSwxBbSWPlBfBAMfr7AJU0VbfxS7J/sCAJZjAyy82j0R/IurvAjK9TYzW+/acyyJ+t
         ++4yP+Yj1vuULE/g1zgb+xUSPaYYVv/ZH9qm1biRFUkz+eD9B0qTqyq6ibQwa76bWFGN
         nPiH9XxWxod9+WkWzOLwZJNMt3Xq4ZWnjfkRL689CV3u4jC4YLMYOZLauSmBSiZLzQXI
         spCme4FgN4ZWmaxtpxw8VOPhCrh3bW0iC3niItfj1gQTLUQFwfepWMqRR2/f6MLQAcLo
         IpIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHdXhtNg4vwfH/MpATlI/P8mpL1RIphNtv7PiYNE9JhtKsepBTOB+5Zw1XAfjs7PuJvw6CtN3giis=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQN2MC2qPKXUhRp8GVM0I4hDqHTtYKeKJUMz+WzMg1nOnpQMnt
	kV9DG3DTbe1h0McuMwP/0/S7QWiRunqtGO1nWKvxLoZAQs0hbEfLINwpzS6LSos=
X-Gm-Gg: ASbGncsSui96jRsp7XYTz0RFCwkKaCR/k3IM3Cv+zljh/wq83+BFD97brhbnUGCQqkr
	h1kVulaL3GNCxxOsVl2wwPtenlvQbcfFt1fSp2d1hFHvK3i2ZO6jXWqK9v9vXlmk+Zn+QX4+UBK
	SCy+VVbMcM9o/714SgvxLQC1hgnxZTv6Xo9afPvTMA99EcRIEBx+c9bGSV1rTnEtEBhguGO6k8M
	t1/7Lz47zUvISwrfa7HOxcseEK8BMvjah0+1AZ/BAVPolJugU2aSTLtNxIYqEvstw==
X-Google-Smtp-Source: AGHT+IGjgOBtANzrdNgxVHbVz25HZtoWoznhpClsOWoBVge6zWGTY3JLSO3N09rNXlS8FBnA1h4+cQ==
X-Received: by 2002:a17:907:2d8f:b0:aa6:b4b3:5923 with SMTP id a640c23a62f3a-aab779c72e4mr345786766b.33.1734101971045;
        Fri, 13 Dec 2024 06:59:31 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Dec 2024 14:59:28 +0000
Message-Id: <D6ANUES5Q02Z.7V3FELRSIKSY@cloud.com>
Cc: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, "Hongyan
 Xia" <hongyxia@amazon.com>, "Julien Grall" <jgrall@amazon.com>
Subject: Re: [PATCH V4 10/15] xen/page_alloc: vmap heap nodes when they are
 outside the direct map
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Elias El Yandouzi" <eliasely@amazon.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241111131148.52568-1-eliasely@amazon.com>
 <20241111131148.52568-11-eliasely@amazon.com>
In-Reply-To: <20241111131148.52568-11-eliasely@amazon.com>

On Mon Nov 11, 2024 at 1:11 PM GMT, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
>
> When we do not have a direct map, archs_mfn_in_direct_map() will always
> return false, thus init_node_heap() will allocate xenheap pages from an
> existing node for the metadata of a new node. This means that the
> metadata of a new node is in a different node, slowing down heap
> allocation.
>
> Since we now have early vmap, vmap the metadata locally in the new node.
>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
>
> ----
>
>     Changes in v4:
>         * Change type of the parameters to paddr_t
>         * Use clear_domain_page() instead of open-coding it
>
>     Changes in v2:
>         * vmap_contig_pages() was renamed to vmap_contig()
>         * Fix indentation and coding style
>
>     Changes from Hongyan's version:
>         * arch_mfn_in_direct_map() was renamed to
>           arch_mfns_in_direct_map()
>         * Use vmap_contig_pages() rather than __vmap(...).
>         * Add missing include (xen/vmap.h) so it compiles on Arm
>
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 2cef521ad85a..62cdeb5013a3 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -137,6 +137,7 @@
>  #include <xen/sections.h>
>  #include <xen/softirq.h>
>  #include <xen/spinlock.h>
> +#include <xen/vmap.h>
> =20
>  #include <asm/flushtlb.h>
>  #include <asm/page.h>
> @@ -606,22 +607,32 @@ static unsigned long init_node_heap(int node, unsig=
ned long mfn,
>          needed =3D 0;
>      }
>      else if ( *use_tail && nr >=3D needed &&
> -              arch_mfns_in_directmap(mfn + nr - needed, needed) &&
>                (!xenheap_bits ||
>                 !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
>      {
> -        _heap[node] =3D mfn_to_virt(mfn + nr - needed);
> -        avail[node] =3D mfn_to_virt(mfn + nr - 1) +
> -                      PAGE_SIZE - sizeof(**avail) * NR_ZONES;
> +        if ( arch_mfns_in_directmap(mfn + nr - needed, needed) )
> +            _heap[node] =3D mfn_to_virt(mfn + nr - needed);
> +        else
> +            _heap[node] =3D vmap_contig(_mfn(mfn + nr - needed), needed)=
;

... and looking more carefully, couldn't we simply map_pages_to_xen() on th=
e
directmap using mfn_to_virt() as the target? It's not like the NUMA informa=
tion
is a secret, and even if it was the vmap is no less exposed.

I _GUESS_ this was done with the intent of eventually removing the directma=
p
altogether, but it's probably a lot better to keep it around for things lik=
e
the p2m structures and other global data (like these per-node structures).

> +
> +        BUG_ON(!_heap[node]);
> +        avail[node] =3D (void *)(_heap[node]) + (needed << PAGE_SHIFT) -
> +                        sizeof(**avail) * NR_ZONES;
> +
>      }
>      else if ( nr >=3D needed &&
> -              arch_mfns_in_directmap(mfn, needed) &&
>                (!xenheap_bits ||
> -               !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
> +              !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
>      {
> -        _heap[node] =3D mfn_to_virt(mfn);
> -        avail[node] =3D mfn_to_virt(mfn + needed - 1) +
> -                      PAGE_SIZE - sizeof(**avail) * NR_ZONES;
> +        if ( arch_mfns_in_directmap(mfn + nr - needed, needed) )
> +            _heap[node] =3D mfn_to_virt(mfn + nr - needed);
> +        else
> +            _heap[node] =3D vmap_contig(_mfn(mfn + nr - needed), needed)=
;
> +
> +        BUG_ON(!_heap[node]);
> +        avail[node] =3D (void *)(_heap[node]) + (needed << PAGE_SHIFT) -
> +                        sizeof(**avail) * NR_ZONES;
> +
>          *use_tail =3D false;
>      }
>      else if ( get_order_from_bytes(sizeof(**_heap)) =3D=3D

I'm compiling all these fixes/enhancements into a separate branch while tes=
ting
the whole thing.

Cheers,
Alejandro

