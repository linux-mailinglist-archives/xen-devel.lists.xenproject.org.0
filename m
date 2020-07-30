Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE999232ED6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 10:45:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k14BB-0001KK-SV; Thu, 30 Jul 2020 08:44:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gz/s=BJ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k14BA-0001KF-S5
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 08:44:44 +0000
X-Inumbo-ID: e9ce6d62-d240-11ea-8d20-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9ce6d62-d240-11ea-8d20-bc764e2007e4;
 Thu, 30 Jul 2020 08:44:43 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f18so3832565wmc.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2020 01:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=XWpXQHpy6evGpR7BHsqT2f6iSNpy/AsNc8nuYsMa8jk=;
 b=QCr7IJ0OaIHVOKkOwCDoL78ikAfRJ6ozFOYzWSZUURF6tyoCwPHkr5JmcaILmdJHXg
 GMA9RCquAfLImQ8r6MR7u/sTygPAgJJ9ZKVMUWNQdrOSQ3D25MBmJ/pE2IpxgLCdM9YI
 yJHHugHMp6CHzWexFcS2BEXlwx7nvHCe8P1o38EYRpN4sewWfVHVIMjpSXz8N//w1QaM
 qMRZORfUk0dFp0/HF5AdGO2KtHZa2zaT1IN6kp5v1AMEUketEePhWPfrXzAHb6j2VxMw
 kpfQ51Rs7GVbPNdZYSfgtSZAunhFxX+u+M87HfsqXSDiGmot9+N0gcV30W/4MN9Bc1fs
 3ZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=XWpXQHpy6evGpR7BHsqT2f6iSNpy/AsNc8nuYsMa8jk=;
 b=VuAEKg4oQ1NzZFeC8zoiH57xUS6SwAw+6Hyfihu1nzOSKg8FvQLRJDcOxzAPIG5Zdb
 cKhH+p+PKZxTVWmgsvvjyFUAkxNe2Imd8Chf94m7oO0oO1erbClfmup1iMavKxE9lzcs
 Y3353ajKkn2vALKzt6/zXSSfiCD71dMH4Tj8U8NT6ocrfRSZMX1ArPN10+ihRm0aKH0m
 wjnT4hUcnagHoWuE2VgtqEqlWEGUrJf68h3ciRklZA/LA95C0b/V5/wq8QX8SQhrpzdM
 3AuxE1xibbWLQpXjh8EpWxkqAZoyJvCpwxZNbyORzC6kOJipoFnUPCY68qDFcOsPOOPm
 UxeQ==
X-Gm-Message-State: AOAM5329IfRVvqalqQb0PqF8gHcaUSDl78We4UFruDFmNmRJMuma1s3+
 h3c2Vn6nPDDoZwx0I0kLuPo=
X-Google-Smtp-Source: ABdhPJzoqV6rEmLniZ4ER9AYfjIB0gnaocT6OrtqNZXQ9eXa7DWdbahN5SdwbtpiOIgtkpFUuhMkwQ==
X-Received: by 2002:a1c:1b93:: with SMTP id
 b141mr12669868wmb.150.1596098682705; 
 Thu, 30 Jul 2020 01:44:42 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id 128sm8337887wmz.43.2020.07.30.01.44.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jul 2020 01:44:42 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-6-andrew.cooper3@citrix.com>
In-Reply-To: <20200728113712.22966-6-andrew.cooper3@citrix.com>
Subject: RE: [PATCH 5/5] tools/foreignmem: Support querying the size of a
 resource
Date: Thu, 30 Jul 2020 09:39:29 +0100
Message-ID: <002d01d6664c$f0fc69f0$d2f53dd0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQF6ExwjYkgZ+OK4ROtT1vtJIEnjiALNw9PgqcIDgBA=
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
Cc: 'Ian Jackson' <Ian.Jackson@citrix.com>,
 =?utf-8?Q?'Micha=C5=82_Leszczy=C5=84ski'?= <michal.leszczynski@cert.pl>,
 'Hubert Jasudowicz' <hubert.jasudowicz@cert.pl>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 28 July 2020 12:37
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Ian Jackson =
<Ian.Jackson@citrix.com>; Wei Liu
> <wl@xen.org>; Paul Durrant <paul@xen.org>; Micha=C5=82 =
Leszczy=C5=84ski <michal.leszczynski@cert.pl>; Hubert
> Jasudowicz <hubert.jasudowicz@cert.pl>
> Subject: [PATCH 5/5] tools/foreignmem: Support querying the size of a =
resource
>=20
> With the Xen side of this interface fixed to return real sizes, =
userspace
> needs to be able to make the query.
>=20
> Introduce xenforeignmemory_resource_size() for the purpose, bumping =
the
> library minor version and providing compatiblity for the non-Linux =
builds.
>=20
> Its not possible to reuse the IOCTL_PRIVCMD_MMAP_RESOURCE =
infrastructure,
> because it depends on having already mmap()'d a suitably sized region =
before
> it will make an XENMEM_acquire_resource hypercall to Xen.
>=20
> Instead, open a xencall handle and make an XENMEM_acquire_resource =
hypercall
> directly.

Shame we have to do that but, as you say, it's the only option.

>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
> CC: Ian Jackson <Ian.Jackson@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Paul Durrant <paul@xen.org>
> CC: Micha=C5=82 Leszczy=C5=84ski <michal.leszczynski@cert.pl>
> CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
> ---
>  tools/libs/foreignmemory/Makefile                  |  2 +-
>  tools/libs/foreignmemory/core.c                    | 14 +++++++++
>  .../libs/foreignmemory/include/xenforeignmemory.h  | 15 ++++++++++
>  tools/libs/foreignmemory/libxenforeignmemory.map   |  4 +++
>  tools/libs/foreignmemory/linux.c                   | 35 =
++++++++++++++++++++++
>  tools/libs/foreignmemory/private.h                 | 14 +++++++++
>  6 files changed, 83 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/libs/foreignmemory/Makefile =
b/tools/libs/foreignmemory/Makefile
> index 28f1bddc96..8e07f92c59 100644
> --- a/tools/libs/foreignmemory/Makefile
> +++ b/tools/libs/foreignmemory/Makefile
> @@ -2,7 +2,7 @@ XEN_ROOT =3D $(CURDIR)/../../..
>  include $(XEN_ROOT)/tools/Rules.mk
>=20
>  MAJOR    =3D 1
> -MINOR    =3D 3
> +MINOR    =3D 4
>  LIBNAME  :=3D foreignmemory
>  USELIBS  :=3D toollog toolcore
>=20
> diff --git a/tools/libs/foreignmemory/core.c =
b/tools/libs/foreignmemory/core.c
> index 63f12e2450..5d95c59c48 100644
> --- a/tools/libs/foreignmemory/core.c
> +++ b/tools/libs/foreignmemory/core.c
> @@ -53,6 +53,10 @@ xenforeignmemory_handle =
*xenforeignmemory_open(xentoollog_logger *logger,
>          if (!fmem->logger) goto err;
>      }
>=20
> +    fmem->xcall =3D xencall_open(fmem->logger, 0);
> +    if ( !fmem->xcall )
> +        goto err;
> +
>      rc =3D osdep_xenforeignmemory_open(fmem);
>      if ( rc  < 0 ) goto err;
>=20
> @@ -61,6 +65,7 @@ xenforeignmemory_handle =
*xenforeignmemory_open(xentoollog_logger *logger,
>  err:
>      xentoolcore__deregister_active_handle(&fmem->tc_ah);
>      osdep_xenforeignmemory_close(fmem);
> +    xencall_close(fmem->xcall);
>      xtl_logger_destroy(fmem->logger_tofree);
>      free(fmem);
>      return NULL;
> @@ -75,6 +80,7 @@ int xenforeignmemory_close(xenforeignmemory_handle =
*fmem)
>=20
>      xentoolcore__deregister_active_handle(&fmem->tc_ah);
>      rc =3D osdep_xenforeignmemory_close(fmem);
> +    xencall_close(fmem->xcall);
>      xtl_logger_destroy(fmem->logger_tofree);
>      free(fmem);
>      return rc;
> @@ -188,6 +194,14 @@ int xenforeignmemory_unmap_resource(
>      return rc;
>  }
>=20
> +int xenforeignmemory_resource_size(
> +    xenforeignmemory_handle *fmem, domid_t domid, unsigned int type,
> +    unsigned int id, unsigned long *nr_frames)
> +{
> +    return osdep_xenforeignmemory_resource_size(fmem, domid, type,
> +                                                id, nr_frames);
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/tools/libs/foreignmemory/include/xenforeignmemory.h
> b/tools/libs/foreignmemory/include/xenforeignmemory.h
> index d594be8df0..1ba2f5316b 100644
> --- a/tools/libs/foreignmemory/include/xenforeignmemory.h
> +++ b/tools/libs/foreignmemory/include/xenforeignmemory.h
> @@ -179,6 +179,21 @@ xenforeignmemory_resource_handle =
*xenforeignmemory_map_resource(
>  int xenforeignmemory_unmap_resource(
>      xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle =
*fres);
>=20
> +/**
> + * Determine the maximum size of a specific resource.
> + *
> + * @parm fmem handle to the open foreignmemory interface
> + * @parm domid the domain id
> + * @parm type the resource type
> + * @parm id the type-specific resource identifier
> + *
> + * Return 0 on success and fills in *nr_frames.  Sets errno and =
return -1 on
> + * error.
> + */
> +int xenforeignmemory_resource_size(
> +    xenforeignmemory_handle *fmem, domid_t domid, unsigned int type,
> +    unsigned int id, unsigned long *nr_frames);
> +
>  #endif
>=20
>  /*
> diff --git a/tools/libs/foreignmemory/libxenforeignmemory.map
> b/tools/libs/foreignmemory/libxenforeignmemory.map
> index d5323c87d9..8aca341b99 100644
> --- a/tools/libs/foreignmemory/libxenforeignmemory.map
> +++ b/tools/libs/foreignmemory/libxenforeignmemory.map
> @@ -19,3 +19,7 @@ VERS_1.3 {
>  		xenforeignmemory_map_resource;
>  		xenforeignmemory_unmap_resource;
>  } VERS_1.2;
> +VERS_1.4 {
> +	global:
> +		xenforeignmemory_resource_size;
> +} VERS_1.3;
> diff --git a/tools/libs/foreignmemory/linux.c =
b/tools/libs/foreignmemory/linux.c
> index 8daa5828e3..67e0ca1e83 100644
> --- a/tools/libs/foreignmemory/linux.c
> +++ b/tools/libs/foreignmemory/linux.c
> @@ -28,6 +28,8 @@
>=20
>  #include "private.h"
>=20
> +#include <xen/memory.h>
> +
>  #define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & =
~((1UL<<(_w))-1))
>=20
>  #ifndef O_CLOEXEC
> @@ -340,6 +342,39 @@ int osdep_xenforeignmemory_map_resource(
>      return 0;
>  }
>=20
> +int osdep_xenforeignmemory_resource_size(
> +    xenforeignmemory_handle *fmem, domid_t domid, unsigned int type,
> +    unsigned int id, unsigned long *nr_frames)
> +{
> +    int rc;
> +    struct xen_mem_acquire_resource *xmar =3D
> +        xencall_alloc_buffer(fmem->xcall, sizeof(*xmar));
> +
> +    if ( !xmar )
> +    {
> +        PERROR("Could not bounce memory for acquire_resource =
hypercall");
> +        return -1;
> +    }
> +
> +    *xmar =3D (struct xen_mem_acquire_resource){
> +        .domid =3D domid,
> +        .type =3D type,
> +        .id =3D id,
> +    };
> +
> +    rc =3D xencall2(fmem->xcall, __HYPERVISOR_memory_op,
> +                  XENMEM_acquire_resource, (uintptr_t)xmar);
> +    if ( rc )
> +        goto out;
> +
> +    *nr_frames =3D xmar->nr_frames;
> +
> + out:
> +    xencall_free_buffer(fmem->xcall, xmar);
> +
> +    return rc;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/tools/libs/foreignmemory/private.h =
b/tools/libs/foreignmemory/private.h
> index 8f1bf081ed..1a6b685f45 100644
> --- a/tools/libs/foreignmemory/private.h
> +++ b/tools/libs/foreignmemory/private.h
> @@ -4,6 +4,7 @@
>  #include <xentoollog.h>
>=20
>  #include <xenforeignmemory.h>
> +#include <xencall.h>
>=20
>  #include <xentoolcore_internal.h>
>=20
> @@ -20,6 +21,7 @@
>=20
>  struct xenforeignmemory_handle {
>      xentoollog_logger *logger, *logger_tofree;
> +    xencall_handle *xcall;
>      unsigned flags;
>      int fd;
>      Xentoolcore__Active_Handle tc_ah;
> @@ -74,6 +76,15 @@ static inline int =
osdep_xenforeignmemory_unmap_resource(
>  {
>      return 0;
>  }
> +
> +static inline int osdep_xenforeignmemory_resource_size(
> +    xenforeignmemory_handle *fmem, domid_t domid, unsigned int type,
> +    unsigned int id, unsigned long *nr_frames)
> +{
> +    errno =3D EOPNOTSUPP;
> +    return -1;
> +}
> +
>  #else
>  int osdep_xenforeignmemory_restrict(xenforeignmemory_handle *fmem,
>                                      domid_t domid);
> @@ -81,6 +92,9 @@ int osdep_xenforeignmemory_map_resource(
>      xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle =
*fres);
>  int osdep_xenforeignmemory_unmap_resource(
>      xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle =
*fres);
> +int osdep_xenforeignmemory_resource_size(
> +    xenforeignmemory_handle *fmem, domid_t domid, unsigned int type,
> +    unsigned int id, unsigned long *nr_frames);
>  #endif
>=20
>  #define PERROR(_f...) \
> --
> 2.11.0



