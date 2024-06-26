Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F60918362
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748997.1156958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMT6F-0008EN-8J; Wed, 26 Jun 2024 13:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748997.1156958; Wed, 26 Jun 2024 13:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMT6F-0008CU-5B; Wed, 26 Jun 2024 13:54:15 +0000
Received: by outflank-mailman (input) for mailman id 748997;
 Wed, 26 Jun 2024 13:54:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m54e=N4=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sMT6D-0008CO-Qo
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:54:13 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91acfa60-33c3-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 15:54:13 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a72604c8c5bso394524666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 06:54:13 -0700 (PDT)
Received: from localhost ([160.101.139.1]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7261c5bc2asm231591566b.186.2024.06.26.06.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 06:54:11 -0700 (PDT)
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
X-Inumbo-ID: 91acfa60-33c3-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719410052; x=1720014852; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFtLwp8M26ePMhbl9+A2uXgdQgcBjsL8/TaCHyqwhpc=;
        b=O76vV0Y0o7Vl0lHiRn9uGJkJ3UXbPer3ew8pdjYmvXcGsqpg6ggLWAw76KSpN1he5R
         aCErgMh2dF0wo8/FC4j03L4i+8gDHeI3X6pRONQHMPHIkBWFVWoW66JY/vUvGdeMTykK
         PDcP5gbjrQXClC8c3njAIGEf2+em9lVTdTous=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410052; x=1720014852;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sFtLwp8M26ePMhbl9+A2uXgdQgcBjsL8/TaCHyqwhpc=;
        b=Sr1Od3/TmGlAWRs5mnv0yzQtyGvx+LKxmTGRCueoM7x8NIUB2jgx9iF/Qrw5nToCDN
         9xvRqStHIa9zBMrEWKn048FAeeh1C3RXg58IU7VDaoXRAJivpCtK1OhczPTCbBfvHNt2
         6LUqrqDnQm9ViHSs98yt6oNAqFAHqxf8jUB14Bwk0gH6ehn71KxSe4aZBF9FRiDrj3nv
         FPTEjfYan/AhS7GjxZes0odW+vrbncLqJlXF3wybCFgKjnNiM8wqqYyCEfxxzVytejhS
         deJk1T3lqecxg6xSDUBrGEqWNFyhBY8aHxjAWM0beG5+SZFsYtsR6YxMsL6lBv7wGAz8
         NWpg==
X-Forwarded-Encrypted: i=1; AJvYcCUolHO6HeyHCZZ374YEfbsthkWe3hBZ28ibr973v5mjNrxziWrEd0aSO4q68KiWOpvrXzivu0jJR8lbcKosaQV2c6456emYcpEhuqlr9x0=
X-Gm-Message-State: AOJu0YzGxJZz/1DXyNResc8orbs8Jcs4Su4ZmI6gHKWuu13vJV4X3HzT
	VzvhlVEBzktP0lHZZP+T67fePPQJw3QgWmub0LmZHynS9BU1Rfi3Z77b2H6Bbek=
X-Google-Smtp-Source: AGHT+IF8cUiv3tjJ6utpl38WSBWja90vLzoHtxrvWKI4aGmBgkqr2e4E5Oe/tQcOHvqfkUYnOJdjjg==
X-Received: by 2002:a17:906:1995:b0:a6e:fa0a:4899 with SMTP id a640c23a62f3a-a7245b45affmr658484366b.16.1719410052274;
        Wed, 26 Jun 2024 06:54:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Jun 2024 14:54:11 +0100
Message-Id: <D29ZZSXN0QPV.2627WUC2J3NUK@cloud.com>
Subject: Re: [PATCH v2 (resend) 04/27] acpi: vmap pages in
 acpi_os_alloc_memory
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Elias El Yandouzi" <eliasely@amazon.com>,
 <xen-devel@lists.xenproject.org>
Cc: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, "Hongyan
 Xia" <hongyxia@amazon.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "George Dunlap" <george.dunlap@citrix.com>, "Jan Beulich"
 <jbeulich@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Wei
 Liu" <wl@xen.org>, "Julien Grall" <jgrall@amazon.com>
X-Mailer: aerc 0.17.0
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-5-eliasely@amazon.com>
In-Reply-To: <20240116192611.41112-5-eliasely@amazon.com>

I'm late to the party but there's something bothering me a little.

On Tue Jan 16, 2024 at 7:25 PM GMT, Elias El Yandouzi wrote:
> diff --git a/xen/common/vmap.c b/xen/common/vmap.c
> index 171271fae3..966a7e763f 100644
> --- a/xen/common/vmap.c
> +++ b/xen/common/vmap.c
> @@ -245,6 +245,11 @@ void *vmap(const mfn_t *mfn, unsigned int nr)
>      return __vmap(mfn, 1, nr, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
>  }
> =20
> +void *vmap_contig(mfn_t mfn, unsigned int nr)
> +{
> +    return __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
> +}
> +
>  unsigned int vmap_size(const void *va)
>  {
>      unsigned int pages =3D vm_size(va, VMAP_DEFAULT);

How is vmap_contig() different from regular vmap()?

vmap() calls map_pages_to_xen() `nr` times, while vmap_contig() calls it ju=
st
once. I'd expect both cases to work fine as they are. What am I missing? Wh=
at
would make...

> diff --git a/xen/drivers/acpi/osl.c b/xen/drivers/acpi/osl.c
> index 389505f786..ab80d6b2a9 100644
> --- a/xen/drivers/acpi/osl.c
> +++ b/xen/drivers/acpi/osl.c
> @@ -221,7 +221,11 @@ void *__init acpi_os_alloc_memory(size_t sz)
>  	void *ptr;
> =20
>  	if (system_state =3D=3D SYS_STATE_early_boot)
> -		return mfn_to_virt(mfn_x(alloc_boot_pages(PFN_UP(sz), 1)));
> +	{
> +		mfn_t mfn =3D alloc_boot_pages(PFN_UP(sz), 1);
> +
> +		return vmap_contig(mfn, PFN_UP(sz));
... this statement not operate identically with regular vmap()? Or
probably more interestingly, what would preclude existing calls to vmap() n=
ot
operate under vmap_contig() instead?

I'm guessing it has to do with ARM having granules, but the looping logic s=
eems
wonky in the non 4K case anyway seeing how the va jumps are based on PAGE_S=
IZE.

> +	}
> =20
>  	ptr =3D xmalloc_bytes(sz);
>  	ASSERT(!ptr || is_xmalloc_memory(ptr));
> @@ -246,5 +250,11 @@ void __init acpi_os_free_memory(void *ptr)
>  	if (is_xmalloc_memory(ptr))
>  		xfree(ptr);
>  	else if (ptr && system_state =3D=3D SYS_STATE_early_boot)
> -		init_boot_pages(__pa(ptr), __pa(ptr) + PAGE_SIZE);
> +	{
> +		paddr_t addr =3D mfn_to_maddr(vmap_to_mfn(ptr));
> +		unsigned int nr =3D vmap_size(ptr);
> +
> +		vunmap(ptr);
> +		init_boot_pages(addr, addr + nr * PAGE_SIZE);
> +	}
>  }
> diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
> index 24c85de490..0c16baa85f 100644
> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -15,6 +15,7 @@ void vm_init_type(enum vmap_region type, void *start, v=
oid *end);
>  void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr=
,
>               unsigned int align, unsigned int flags, enum vmap_region ty=
pe);
>  void *vmap(const mfn_t *mfn, unsigned int nr);
> +void *vmap_contig(mfn_t mfn, unsigned int nr);
>  void vunmap(const void *va);
> =20
>  void *vmalloc(size_t size);

