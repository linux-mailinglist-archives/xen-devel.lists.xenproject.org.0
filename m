Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7565520540B
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 16:00:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnjSu-0006Fu-Ti; Tue, 23 Jun 2020 13:59:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8LJ6=AE=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jnjSt-0006Fp-A0
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 13:59:55 +0000
X-Inumbo-ID: d056ad44-b559-11ea-bb8b-bc764e2007e4
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d056ad44-b559-11ea-bb8b-bc764e2007e4;
 Tue, 23 Jun 2020 13:59:54 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id l12so21720543ejn.10
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2020 06:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=Gb4NUvBy8Ph9fUEr6tjOnT5CVBwQHg6EKwdsE8jZlHI=;
 b=KIusJk/PNEedoAuvJiCt0JCS9KYU7S500X6vPJU32fvO22P7X6in5YpnLFfydYOPKS
 WOd68I236TknwkO7DSRHAywtSPHqYvLgLeO99YqUPKHz/hUOn2jKjc3jw6GqnTAjxND5
 s1HZoxL5r4/acfqoZDyZbmR2TgZ8YVtKeyYQnV0JkiqIItI0zDcWlC+pXrqyPdv6fxgr
 1IU81/+29LHb4FF3lJfgcgl5fpLtNZ+YEaRDp2o19HU5W/YOIVDkYZwZ4Ryr6tnqd/oS
 TA1SDGHjubDQuIH91iJH2MMIkr1TKZKHgoc2VRCYV21nHqwJR5egKjiDKVjAZMniekLa
 jBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=Gb4NUvBy8Ph9fUEr6tjOnT5CVBwQHg6EKwdsE8jZlHI=;
 b=QKzQfleO2TIow8XKfSw5qZKAs5FGkAjL6leSLZlJj78bziYuH7MA0hZG1j6PzJleg8
 F/a1CIOtTrxkXhVKhR+mN6m/IHGIgDovjjhWHknkdFWKaoDT7rXtTt2zcyWLwXhCvE27
 jOjgI0oyDUk5a0PzPJQuV5W5TSsSqM0GKOe248FojBeJLDHJ9BMfqIngkE+EkFzn3ja+
 50yvHlH08xoGiZAY9P4ieZhYRx4POvC16K9V40+FyPlBYUWf15ECoLnETa4lheq667pG
 3Y92UpcgWhnItWUGGnY5btVEidfz/AarxW/GTi5thDSw4Rz8q/cPdqf/fvNn0t91LGOc
 3VPg==
X-Gm-Message-State: AOAM5310TsLwAupa5bdVtt85lDUTaNUZQArqL05u87311LKXoT+PXXuc
 1Ag25NwSH7AH6DeGgovnCYM=
X-Google-Smtp-Source: ABdhPJzh05rjZKezVhzRfFRQY8mV1Aikv3riqynG4p9Gvyt9Q+Xp1b0IYAwzef6dsSb0tfgsrr+2FA==
X-Received: by 2002:a17:906:434f:: with SMTP id
 z15mr19947384ejm.178.1592920793664; 
 Tue, 23 Jun 2020 06:59:53 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id k23sm13539600ejg.89.2020.06.23.06.59.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jun 2020 06:59:53 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200623135246.66170-1-roger.pau@citrix.com>
In-Reply-To: <20200623135246.66170-1-roger.pau@citrix.com>
Subject: RE: [PATCH for-4.14] mm: fix public declaration of struct
 xen_mem_acquire_resource
Date: Tue, 23 Jun 2020 14:59:51 +0100
Message-ID: <000301d64966$91885090$b498f1b0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJU5g6mkfXrDLlGsNt841F72IbClqfo/9Sw
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monne <roger.pau@citrix.com>
> Sent: 23 June 2020 14:53
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Roger Pau Monne <roger.pau@citrix.com>; Andrew =
Cooper <andrew.cooper3@citrix.com>;
> George Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Jan Beulich
> <jbeulich@suse.com>; Julien Grall <julien@xen.org>; Stefano Stabellini =
<sstabellini@kernel.org>; Wei
> Liu <wl@xen.org>
> Subject: [PATCH for-4.14] mm: fix public declaration of struct =
xen_mem_acquire_resource
>=20
> XENMEM_acquire_resource and it's related structure is currently inside
> a __XEN__ or __XEN_TOOLS__ guarded section to limit it's scope to the
> hypervisor or the toolstack only. This is wrong as the hypercall is
> already being used by the Linux kernel at least, and as such needs to
> be public.
>=20
> Also switch the usage of uint64_aligned_t to plain uint64_t, as
> uint64_aligned_t is only to be used by the toolstack. Note that the
> layout of the structure will be the same, as the field is already
> naturally aligned to a 8 byte boundary.
>=20
> No functional change expected.
>=20
> Fixes: 3f8f12281dd20 ('x86/mm: add HYPERVISOR_memory_op to acquire =
guest resources')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Would be good to get this fixed before the release in order to avoid
> shipping bogus headers. Should also be backported.

Reviewed-by: Paul Durrant <paul@xen.org>
Release-acked-by: Paul Durrant <paul@xen.org>

> ---
>  xen/include/public/memory.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> index dbd35305df..1767d7d5f5 100644
> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -607,6 +607,8 @@ struct xen_reserved_device_memory_map {
>  typedef struct xen_reserved_device_memory_map =
xen_reserved_device_memory_map_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_reserved_device_memory_map_t);
>=20
> +#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
> +
>  /*
>   * Get the pages for a particular guest resource, so that they can be
>   * mapped directly by a tools domain.
> @@ -645,7 +647,7 @@ struct xen_mem_acquire_resource {
>       * IN - the index of the initial frame to be mapped. This =
parameter
>       *      is ignored if nr_frames is 0.
>       */
> -    uint64_aligned_t frame;
> +    uint64_t frame;
>=20
>  #define XENMEM_resource_ioreq_server_frame_bufioreq 0
>  #define XENMEM_resource_ioreq_server_frame_ioreq(n) (1 + (n))
> @@ -666,8 +668,6 @@ struct xen_mem_acquire_resource {
>  typedef struct xen_mem_acquire_resource xen_mem_acquire_resource_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_mem_acquire_resource_t);
>=20
> -#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
> -
>  /*
>   * XENMEM_get_vnumainfo used by guest to get
>   * vNUMA topology from hypervisor.
> --
> 2.26.2



