Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1238B94B2
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 08:32:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715546.1117252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2PzY-00077s-Nf; Thu, 02 May 2024 06:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715546.1117252; Thu, 02 May 2024 06:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2PzY-000761-Jq; Thu, 02 May 2024 06:32:28 +0000
Received: by outflank-mailman (input) for mailman id 715546;
 Thu, 02 May 2024 06:32:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1TOG=MF=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s2PzW-00075p-8D
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 06:32:26 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd0aea44-084d-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 08:32:25 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57232e47a81so2446643a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 23:32:25 -0700 (PDT)
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
X-Inumbo-ID: bd0aea44-084d-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714631544; x=1715236344; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EYclx16HNFs8YntLtI93PesjTHQNuEjlTaisfuEtSc=;
        b=J9B6rvZFd8X8yhJy0C34mD5BzX1niwsDKld2wIayulNt65xcQPKwlOsV1Uqm0rzJNc
         eLwhv/24IZfqW40Z5af/pCThcSDf1lXNyQ8sG59ppmfEMmuZ8EZ/jNcvipkv50sc0edV
         Ql8iLzf9/NSO80fKlxXkcg257aJwwJv1jR+REnAT8VfNY47LA5GuRgvRlEA4S+VvxmbA
         IumT/QCnr+NSbEkDz+7rf6aEp3w6qE7QmvcJu+oGQrXV/f179uuXmuWQzg0QfYIvrJCi
         hsFLvTc6wpwGA6TSb+3m53FsXuNXskIZItXaWtK8F1vR+QxJO/8Q3tpHfuGvS/vAiDWc
         b0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714631544; x=1715236344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EYclx16HNFs8YntLtI93PesjTHQNuEjlTaisfuEtSc=;
        b=YwHYwJmPYrOKSPmfVKEFVQkbfzEN4O/wRVxMBEcu4AWdyvPwF0onbrAjDKvWa+WXen
         RCwQeZmYnd4g91kyyn8ntFNEfCibJOmCETu2Pq7JdhrU0n5Z9pgFDEk8Pq8IQZJO/IRW
         4xfvgk7fHBO9f9rf9GpkkCSmSQCEITZsMvhVFnhK8sLacGMJTu1Wc/9vuFyLFXdxkS0B
         C6l4AAXpM/IfhKuTGTvdzXQW+9EKYGBbcpxjECu4m2FXbKJbJ4rLMTu8YmEo6Jxippv8
         oxKvyhTtT543TLayI2MUBSh78f8qOWP3gWTEgx6o3cgzjMYT4VJkfV8vaxTpbzPvh8hZ
         tZ9w==
X-Forwarded-Encrypted: i=1; AJvYcCVtWHYOwbWAWI1ieDsVhK5/6pcVr7zspg2yaq3LYFX2ZR3UAhFB6zHXJllallAAXzA/CZEosAzH0pFhq9ZkRXb2Usqw8fMTJamkQI94+mY=
X-Gm-Message-State: AOJu0YxI3EWZpqFDsh65JUMYfgcgewCSAXsMpJ0Xr0UgSusLS/griDwj
	BC7a5HcCrTsp0WHMV5ZWvZC84hE9pMppWn/5UWMf5SNArX9d70RUBsDSS/H7kXc51ZvAJNcr7BV
	OZh7PJIzjoNkua8I9+KVG74WMuoI=
X-Google-Smtp-Source: AGHT+IHa+J7ytWh1ojM1i3gs+HSyTqEKairXLG5kBCLQOfyxqSWNggYlnQsg4jVmTkw5jE+i7zSPz/srdxbFnfvcN9o=
X-Received: by 2002:a50:c054:0:b0:56e:7281:55eb with SMTP id
 u20-20020a50c054000000b0056e728155ebmr1387706edd.9.1714631544216; Wed, 01 May
 2024 23:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
 <20240430164939.925307-8-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2405011345140.497719@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2405011345140.497719@ubuntu-linux-20-04-desktop>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 2 May 2024 08:32:11 +0200
Message-ID: <CAJy5ezq2PBXMXGMFORfuDVeC_t4S=9AF6b_pur9kD26fhBPhwA@mail.gmail.com>
Subject: Re: [PATCH v4 07/17] xen: mapcache: Refactor xen_replace_cache_entry_unlocked
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, jgross@suse.com, 
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 1, 2024 at 10:46=E2=80=AFPM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >
> > Add MapCache argument to xen_replace_cache_entry_unlocked in
> > preparation for supporting multiple map caches.
> >
> > No functional change.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >  hw/xen/xen-mapcache.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> > index d2deff70c8..6e758eff94 100644
> > --- a/hw/xen/xen-mapcache.c
> > +++ b/hw/xen/xen-mapcache.c
> > @@ -556,7 +556,8 @@ void xen_invalidate_map_cache(void)
> >      mapcache_unlock(mapcache);
> >  }
> >
> > -static uint8_t *xen_replace_cache_entry_unlocked(hwaddr old_phys_addr,
> > +static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
> > +                                                 hwaddr old_phys_addr,
> >                                                   hwaddr new_phys_addr,
> >                                                   hwaddr size)
> >  {
> > @@ -578,7 +579,7 @@ static uint8_t *xen_replace_cache_entry_unlocked(hw=
addr old_phys_addr,
> >          cache_size +=3D MCACHE_BUCKET_SIZE - (cache_size % MCACHE_BUCK=
ET_SIZE);
> >      }
> >
> > -    entry =3D &mapcache->entry[address_index % mapcache->nr_buckets];
> > +    entry =3D &mc->entry[address_index % mc->nr_buckets];
> >      while (entry && !(entry->paddr_index =3D=3D address_index &&
> >                        entry->size =3D=3D cache_size)) {
> >          entry =3D entry->next;
>
> There is still a global mapcache pointer in use in this function:
>
>   xen_remap_bucket(mapcache, entry, entry->vaddr_base,
>


Thanks! I had accidentally put the change to use mc in future patches.
Will fix in v5.

Cheers,
Edgar


>
> > @@ -614,7 +615,8 @@ uint8_t *xen_replace_cache_entry(hwaddr old_phys_ad=
dr,
> >      uint8_t *p;
> >
> >      mapcache_lock(mapcache);
> > -    p =3D xen_replace_cache_entry_unlocked(old_phys_addr, new_phys_add=
r, size);
> > +    p =3D xen_replace_cache_entry_unlocked(mapcache, old_phys_addr,
> > +                                         new_phys_addr, size);
> >      mapcache_unlock(mapcache);
> >      return p;
> >  }
> > --
> > 2.40.1
> >

