Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FEE925AC7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 13:03:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752945.1161195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOxlZ-0002Oc-HC; Wed, 03 Jul 2024 11:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752945.1161195; Wed, 03 Jul 2024 11:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOxlZ-0002M8-DZ; Wed, 03 Jul 2024 11:03:13 +0000
Received: by outflank-mailman (input) for mailman id 752945;
 Wed, 03 Jul 2024 11:03:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xq3e=OD=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sOxlY-0002Lx-Ec
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 11:03:12 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d671aedc-392b-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 13:03:11 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-58b447c519eso2654380a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 04:03:11 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab065213sm501358766b.132.2024.07.03.04.03.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 04:03:10 -0700 (PDT)
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
X-Inumbo-ID: d671aedc-392b-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720004591; x=1720609391; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSr/TpptrSrF5qBNkDNHmTEXSX1VMYrO/UeSz7uqPWY=;
        b=fHSL1qy7KPrwxd+IgJPJOIeFRIorvQM4TnoykE8VQqtmemZbKqNEZv5BCIyKV4WdJw
         Ga1XpX7NdZeA+wObOqXnPh6Iqx0sg4UCEPjT8eG1SJlJ54bWRMOpbeKW5EERP6jSUfP4
         qat2y4F+Locydnv0kZk+U+LJOB/M6+lPGe8Yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720004591; x=1720609391;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eSr/TpptrSrF5qBNkDNHmTEXSX1VMYrO/UeSz7uqPWY=;
        b=MOOzZ8MNUKIRr7qCio6wTuQ64jaKUNO8/5pG9Tu/l99abcsx2cRFAR935BYZeWZyHT
         qviX4VVvEGzuNZw7Fe4dwHIM/UFtiiejLpxbW5K9WRlRfLYzHEpUgpSUh3i35JDMwqlR
         rzDwy0daKe8UuhPfgJah3RiCi3kCPqe8p/4hg68Xe/UqEARQJ7S+426bkhGgtJux3m17
         V7XrMLxlOKQSHYsPdJmnsCNunYhPkcOVoMBVC59bTCGHkIwdHLJ7hY16qN5iX61INUYx
         GAEJS3yFMjGkehKUgsUI2gjGXJi9djKzCQs/PAmM6iVdtI2jWp+WbBWxuH4xJWjn3IK3
         tKpg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ/fpKi4z7SK9QRMGz3+VNXGv9nM8hKPv1PlrP/N4pzq2vjvfxZmQsFw0WvqUZsKRNNxKOgj+8+jlW73QJeEsbgIxKF56sxAPRE0MZylU=
X-Gm-Message-State: AOJu0YwXX8Jd/QrMYq4p1WrTENZNUGES1Q38FfGC+uCk46jQ9iOvd3ju
	1oWTd+alFnSrTfPAe4vvx1IVw9pmAHu3YiuXPvrjZbCPXoX+cZvewVBOrEGA/JY=
X-Google-Smtp-Source: AGHT+IFMD9pNQaiC3o6i36Z8SdWM/VZtga4/mMv3zQwWG5r8NLtNs8d4NzxMm0Zi43cD/AjW2fV5BQ==
X-Received: by 2002:a17:906:b287:b0:a70:978c:fe51 with SMTP id a640c23a62f3a-a75144f62d9mr645799366b.53.1720004591026;
        Wed, 03 Jul 2024 04:03:11 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jul 2024 12:03:08 +0100
Message-Id: <D2FUQNREKW6A.1RX24HQ9XJBA7@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Julien Grall"
 <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>,
 "Xen-devel" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.19?] xen/vmap: Document the vmap header
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.17.0
References: <b19a5ca7abd27bd4f31a0d87573687297dd7df58.1719849287.git.alejandro.vallejo@cloud.com> <95f8c522-f66e-48cd-bf7c-6033614e7bbf@suse.com>
In-Reply-To: <95f8c522-f66e-48cd-bf7c-6033614e7bbf@suse.com>

On Wed Jul 3, 2024 at 8:41 AM BST, Jan Beulich wrote:
> On 02.07.2024 15:03, Alejandro Vallejo wrote:
> > --- a/xen/include/xen/vmap.h
> > +++ b/xen/include/xen/vmap.h
> > @@ -1,34 +1,131 @@
> > +/*
> > + * Interface to map physical memory onto contiguous virtual memory are=
as.
> > + *
> > + * Two ranges of linear address space are reserved for this purpose: A=
 general
> > + * purpose area (VMAP_DEFAULT) and a livepatch-specific area (VMAP_XEN=
). The
> > + * latter is used when loading livepatches and the former for everythi=
ng else.
> > + */
> >  #if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
> >  #define __XEN_VMAP_H__
> > =20
> >  #include <xen/mm-frame.h>
> >  #include <xen/page-size.h>
> > =20
> > +/** Identifiers for the linear ranges tracked by vmap */
>
> Here and below: Why /** ? Seeing ...
>
> >  enum vmap_region {
> > +    /*
> > +     * Region used for general purpose RW mappings. Mapping/allocating=
 memory
> > +     * here can induce extra allocations for the supporting page table=
s.
> > +     */
>
> ... this vs ...
>
> >      VMAP_DEFAULT,
> > +    /**
> > +     * Region used for loading livepatches. Can't use VMAP_DEFAULT bec=
ause it
> > +     * must live close to the running Xen image. The caller also ensur=
es all
> > +     * page tables are already in place with adequate PTE flags.
> > +     */
>
> ... this, it's not even looking to be consistent.
>
> >      VMAP_XEN,
> > +    /** Sentinel value for bounds checking */
> >      VMAP_REGION_NR,
> >  };

Double stars are Doxygen style for documenting interfaces. I don't mind get=
ting
rid of those. Some functions exhibit them in the arm port, but it's true
virtually nothing in common Xen does. VMAP_XEN's comment was meant to have =
it
too, I just missed it :)

> > =20
> > +/**
> > + * Runtime initialiser for each vmap region type
> > + *
> > + * Must only be called once per vmap region type.
> > + *
> > + * @param type  Designation of the region to initialise.
> > + * @param start Start address of the `type` region.
> > + * @param end   End address (not inclusive) of the `type` region
> > + */
> >  void vm_init_type(enum vmap_region type, void *start, void *end);
> > =20
> > +/**
> > + * Maps a range of physical ranges onto a single virtual range
>
> Largely related to it not really being clear what "a range of physical ra=
nges"
> actually is, maybe "a set of physical ranges"?

Ack. I like your phrasing better.

>
> > + * `mfn` is an array of `nr` physical ranges, each of which is `granul=
arity`
> > + * pages wide. `type` defines which vmap region to use for the mapping=
 and
> > + * `flags` is the PTE flags the page table leaves are meant to have.
> > + *
> > + * Typically used via the vmap() and vmap_contig() helpers.
> > + *
> > + * @param mfn          Array of mfns
> > + * @param granularity  Number of contiguous pages each mfn represents
> > + * @param nr           Number of mfns in the `mfn` array
> > + * @param align        Alignment of the virtual area to map
> > + * @param flags        PTE flags for the leaves of the PT tree.
> > + * @param type         Which region to create the mappings on
> > + */
> >  void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int =
nr,
> >               unsigned int align, unsigned int flags, enum vmap_region =
type);
> > +
> > +/**
> > + * Map an arrray of pages contiguously into the VMAP_DEFAULT vmap regi=
on
>
> Nit: One r too many in "array".

Sure.

>
> > + * @param[in] mfn Pointer to the base of an array of mfns
> > + * @param[in] nr  Number of mfns in the array
> > + */
> >  void *vmap(const mfn_t *mfn, unsigned int nr);
> > +
> > +/**
> > + * Maps physically contiguous pages onto the VMAP_DEFAULT vmap region
> > + *
> > + * Used when the directmap is unavailable (i.e: due to secret hiding)
>
> Please omit this. There's no reason to suggest it can't also be used for
> other purposes.

Sure.

>
> > + * @param mfn Base mfn of the physical region
> > + * @param nr  Number of mfns in the physical region
> > + */
> >  void *vmap_contig(mfn_t mfn, unsigned int nr);
> > +
> > +/**
> > + * Unmaps a range of virtually contiguous memory from one of the vmap =
regions
> > + *
> > + * The system remembers internally how wide the mapping is and unmaps =
it all.
> > + * It also can determine the vmap region type from the `va`.
> > + *
> > + * @param va Virtual base address of the range to unmap
> > + */
> >  void vunmap(const void *va);
> > =20
> > +/**
> > + * Allocate `size` octets of possibly non-contiguous physical memory a=
nd map
> > + * them contiguously in the VMAP_DEFAULT vmap region
> > + *
> > + * The system remembers internally how wide the mapping is and unmaps =
it all.
>
> This is a verbatim copy of what you say for vunmap(), yet it looks unrela=
ted
> here. Maybe you meant to edit it after copy-and-paste? Or maybe this was
> meant to go ...

Yeah, that shouldn't be there and was meant to go...

>
> > + * @param size Pointer to the base of an array of mfns
> > + * @return Pointer to the mapped area on success; NULL otherwise.
> > + */
> >  void *vmalloc(size_t size);
> > +
> > +/** Same as vmalloc(), but for the VMAP_XEN vmap region. */
> >  void *vmalloc_xen(size_t size);
> > =20
> > +/** Same as vmalloc(), but set the contents to zero before returning *=
/
> >  void *vzalloc(size_t size);
> > +
> > +/**
> > + * Unmap and free memory from vmalloc(), vmalloc_xen() or vzalloc()
> > + *
> > + * @param va Virtual base address of the range to free and unmap
> > + */
> >  void vfree(void *va);
>
> ... here?

... there.

>
> Also, if you want this to be considered for 4.19, please don't forget to =
Cc
> Oleksii.
>
> Jan

Will do on v2.

Cheers,
Alejandro


