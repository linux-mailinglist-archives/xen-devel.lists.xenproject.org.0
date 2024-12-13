Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B515B9F0D9D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 14:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856725.1269268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM5zf-0004HP-MG; Fri, 13 Dec 2024 13:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856725.1269268; Fri, 13 Dec 2024 13:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM5zf-0004Fc-JP; Fri, 13 Dec 2024 13:46:11 +0000
Received: by outflank-mailman (input) for mailman id 856725;
 Fri, 13 Dec 2024 13:46:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gKjA=TG=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tM5ze-0004FW-1w
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 13:46:10 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9af8bebc-b958-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 14:46:08 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d3f28a4fccso2722437a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 05:46:08 -0800 (PST)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3d0f93d54sm10009063a12.68.2024.12.13.05.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 05:46:07 -0800 (PST)
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
X-Inumbo-ID: 9af8bebc-b958-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1734097567; x=1734702367; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZaGjiDFdfKCuOOiiuffu/nMjDxG6MPP4FdpAqr9SNc=;
        b=QS0zXcLh2KYnAvoRSxpAYL/D53mIKNgfP7gWTwTLJllG6h9xSmK6jgbNVkGfLa9bWR
         LhSbe3/6OkThwdfOYjHaMnAF1UXJhhv5kV2JWj06LUsmNl/kdl9k2054Lb8gphmJCxpk
         MNUQaxZnNe+1AVi8YAp1/Yt4jQrV5oz5xouPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734097567; x=1734702367;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aZaGjiDFdfKCuOOiiuffu/nMjDxG6MPP4FdpAqr9SNc=;
        b=MTW8hJvQFG9fZPPEX5r3I8JHVpTk+C61dlSvei2nc0pTHJ9o2hyUb6k4f8TFiHCAuI
         XrjfEitwyhDcAjCf9unUF+TsjunHa9HWb1AXRauVoA0s2P+1qMFysGE662q13NFE6bh1
         qn1DQJ+SgjDp3TckVOyKAAMsU+CUEb4vL/Q8gCsZzNvgJakH6TUfyO04ZW9h14kbwEQr
         FDjV9VIVDjU9IPB8w1TNSVZXVWrK5cbqKxa+E7wQLz0213SrXAlHAe95OwdADGk9IxnT
         NE555oG/0+9IfgCAy70rIYlIHA+VP5PMOCZe1N0Yt/CHEGBVikYgyDclHOJEpVaLIA58
         Sp2g==
X-Forwarded-Encrypted: i=1; AJvYcCVVhbDsooMAOXi2+Gafxv6XLKaprOYPVpV3t7wdaYge3aAjze6do6IHARf8hEPkyygaLt3OIdVhIxA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHzxG6LSb0njAo50thH7KwRE3crExaWaxyeWU+XsVjE6TQGxsk
	QraO4dHZMpONVTmtsBL5ZOuW0pQXL3jHiVwQ3ypo6oNqgr1NDahfEpiEcx5Sou8=
X-Gm-Gg: ASbGnctxW5aJrDssibhk9WbolPbXvJb4NOprCQCKl88AKv5JirjE2RwIfuAeGN7Ih6/
	Qd0i8+XJNB+T96+waw+UdEd83tAef3+eHTANWudB9S9MXOVwqnIK+2Lbaz4AjUeqL0AGJQQT8bC
	3WfSmjBhWk1J78eEtboIM3Pv9btyM8CPMb0H+JJ7OaO/Xsib02mp0mU8tTj0uW7EgFTkpQufzKi
	JQwZMb63OooeFTFtDxKvCtKgRbG/6o6MhIsv8edyTKEIxWJR03TIldu1t90F3mPxg==
X-Google-Smtp-Source: AGHT+IGlAD7Sru8l3ygJa8G6VFVdhaXx5a2J2czGBUSSUSw9IT66WR2V/W6KZp9d//yhJ+3yTK4JpA==
X-Received: by 2002:a17:907:7fa5:b0:aa6:8a1b:8b78 with SMTP id a640c23a62f3a-aab778c1e9dmr322961266b.6.1734097567534;
        Fri, 13 Dec 2024 05:46:07 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Dec 2024 13:46:05 +0000
Message-Id: <D6AMA7U9AVIW.OWFABSVW5AJC@cloud.com>
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

Hi,

I'm seeing crashes on NUMA machines, which can be attributed to a bug below=
:

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

This isn't quite the same thing, I think it regressed in v4 when acting on
Roger's feedback. It should be:

   if ( arch_mfns_in_directmap(mfn, needed) )
       _heap[node] =3D mfn_to_virt(mfn);
   else
       _heap[node] =3D vmap_contig(_mfn(mfn), needed);

Otherwise `use_tail` serves is unconditionally considered as set. With this
change in place, I can boot on NUMA machines.

> +
> +        BUG_ON(!_heap[node]);
> +        avail[node] =3D (void *)(_heap[node]) + (needed << PAGE_SHIFT) -
> +                        sizeof(**avail) * NR_ZONES;
> +
>          *use_tail =3D false;
>      }
>      else if ( get_order_from_bytes(sizeof(**_heap)) =3D=3D

Cheers,
Alejandro

