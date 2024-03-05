Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF54A8711CC
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 01:39:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688547.1072810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhIpf-0006j4-Ib; Tue, 05 Mar 2024 00:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688547.1072810; Tue, 05 Mar 2024 00:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhIpf-0006g2-FU; Tue, 05 Mar 2024 00:38:59 +0000
Received: by outflank-mailman (input) for mailman id 688547;
 Tue, 05 Mar 2024 00:38:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BjVz=KL=gmail.com=alexei.starovoitov@srs-se1.protection.inumbo.net>)
 id 1rhIpe-0006fw-GY
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 00:38:58 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c04df180-da88-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 01:38:57 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-412e4426e32so10656975e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 16:38:57 -0800 (PST)
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
X-Inumbo-ID: c04df180-da88-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709599137; x=1710203937; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bj5zoTI69PLp3cR+V6/5ODnZceaydtC6xTdxHYis12E=;
        b=Ij+Ono4rXLyWddkT3NuS7WfxVqkRdf12Skm7fLOEVYLqcgwtfcO3MW9y15v0yx+pVc
         Rtr6v/GKW5n9tNHkU7+Yu4lj/tgUSwy4AGTtt87816BSOS/hjRt4+v9LbNe+w4f3XCO4
         Kq8udCK4r6dMdLbaqSfAVEbX0zWgPAZsN6+WxnL1XljHpkkcHkWVnVfWDnZd+bWjrHKM
         5B93Y1BlleUzh5I/mu42ehycUNN263f/sZb5lN53Ll9kSI21TMgh4OzECmfz4f7oeTG8
         /71JuqPLsfFCn/fi7NE3EVOFY7gvRKc3lxIywvEXwDo4q8uPq6rvDIqsph2EpKebzRBS
         tlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709599137; x=1710203937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bj5zoTI69PLp3cR+V6/5ODnZceaydtC6xTdxHYis12E=;
        b=GobK3iFOL20FPtj/iLHVBki4bq20kWz630TaOEqSTfe+4MoalaxnVQ8KJAmHj2JIPy
         wkb6N86EJlufWxHLrRzMiwOIDM7nSDwN+Xs7gGpL2S1qr5onHbpBBVJQQuIlKZe7lLGS
         gRSIeMV87W/akRwS4tx5jT8hUaPLeixROFXc++3a7WymkXz8Ka+N27ccJ46c00fK0Qkx
         1Tz0B2tlk8maHl8kKNk8RxJ94nMH0tA0UjB/WGfz7qJKhrFx61JauFF/hEQ6ctbKYzfR
         nrAFotEIshkHPItrIdQDrE5gss0HoPsrS5L++o8iXJBwwgKAh2FqQLtNvtIcEcRX96T+
         YT2A==
X-Forwarded-Encrypted: i=1; AJvYcCV9PESO/rDzc6jOUFpcDQOeORS9o/WB2tq2El4nwuIqn2H0OijmmvBxIXYb55YxIEFRtYt8wken9ar+OvRvCCaezQOANI3BB/7I+uRQMco=
X-Gm-Message-State: AOJu0YywFBkDO3P8Cmn4+MDreVw9ToBuj9D364QJcA4/uaXoitKRyy4r
	HCi26cofmwx3samTTBmEe48FnO5hgBVfOn/d4Z6JgWMN8j05KjcSa5OqOCWGGePyO+fah4GflSd
	au374t5lqsoxrQv5yrzRNe8xge0I=
X-Google-Smtp-Source: AGHT+IHPuUlqp1ldZ1+USNRqTG8hjmjknNCOaSaQz6ztGJruA1SPY5lwFtYqj/d3Q7KwH/p72Add+tEiks5hC80Uxqg=
X-Received: by 2002:a05:600c:444e:b0:412:ecc4:3c3a with SMTP id
 v14-20020a05600c444e00b00412ecc43c3amr154280wmn.40.1709599136434; Mon, 04 Mar
 2024 16:38:56 -0800 (PST)
MIME-Version: 1.0
References: <20240223235728.13981-1-alexei.starovoitov@gmail.com>
 <20240223235728.13981-3-alexei.starovoitov@gmail.com> <ZeV-IE-65yiIwFSY@kernel.org>
In-Reply-To: <ZeV-IE-65yiIwFSY@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 4 Mar 2024 16:38:45 -0800
Message-ID: <CAADnVQL4iEhc4nAoeE57Q3=X0_uh37ZDW_SOw1CicD1L7eTU6w@mail.gmail.com>
Subject: Re: [PATCH v2 bpf-next 2/3] mm, xen: Separate xen use cases from ioremap.
To: Mike Rapoport <rppt@kernel.org>
Cc: bpf <bpf@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Barret Rhoden <brho@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Lorenzo Stoakes <lstoakes@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, sstabellini@kernel.org, 
	Juergen Gross <jgross@suse.com>, linux-mm <linux-mm@kvack.org>, xen-devel@lists.xenproject.org, 
	Kernel Team <kernel-team@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 3, 2024 at 11:55=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Fri, Feb 23, 2024 at 03:57:27PM -0800, Alexei Starovoitov wrote:
> > From: Alexei Starovoitov <ast@kernel.org>
> >
> > xen grant table and xenbus ring are not ioremap the way arch specific c=
ode is using it,
> > so let's add VM_XEN flag to separate them from VM_IOREMAP users.
> > xen will not and should not be calling ioremap_page_range() on that ran=
ge.
> > /proc/vmallocinfo will print such region as "xen" instead of "ioremap" =
as well.
> >
> > Signed-off-by: Alexei Starovoitov <ast@kernel.org>
> > ---
> >  arch/x86/xen/grant-table.c         | 2 +-
> >  drivers/xen/xenbus/xenbus_client.c | 2 +-
> >  include/linux/vmalloc.h            | 1 +
> >  mm/vmalloc.c                       | 7 +++++--
> >  4 files changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/x86/xen/grant-table.c b/arch/x86/xen/grant-table.c
> > index 1e681bf62561..b816db0349c4 100644
> > --- a/arch/x86/xen/grant-table.c
> > +++ b/arch/x86/xen/grant-table.c
> > @@ -104,7 +104,7 @@ static int arch_gnttab_valloc(struct gnttab_vm_area=
 *area, unsigned nr_frames)
> >       area->ptes =3D kmalloc_array(nr_frames, sizeof(*area->ptes), GFP_=
KERNEL);
> >       if (area->ptes =3D=3D NULL)
> >               return -ENOMEM;
> > -     area->area =3D get_vm_area(PAGE_SIZE * nr_frames, VM_IOREMAP);
> > +     area->area =3D get_vm_area(PAGE_SIZE * nr_frames, VM_XEN);
> >       if (!area->area)
> >               goto out_free_ptes;
> >       if (apply_to_page_range(&init_mm, (unsigned long)area->area->addr=
,
> > diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xe=
nbus_client.c
> > index 32835b4b9bc5..b9c81a2d578b 100644
> > --- a/drivers/xen/xenbus/xenbus_client.c
> > +++ b/drivers/xen/xenbus/xenbus_client.c
> > @@ -758,7 +758,7 @@ static int xenbus_map_ring_pv(struct xenbus_device =
*dev,
> >       bool leaked =3D false;
> >       int err =3D -ENOMEM;
> >
> > -     area =3D get_vm_area(XEN_PAGE_SIZE * nr_grefs, VM_IOREMAP);
> > +     area =3D get_vm_area(XEN_PAGE_SIZE * nr_grefs, VM_XEN);
> >       if (!area)
> >               return -ENOMEM;
> >       if (apply_to_page_range(&init_mm, (unsigned long)area->addr,
> > diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
> > index c720be70c8dd..223e51c243bc 100644
> > --- a/include/linux/vmalloc.h
> > +++ b/include/linux/vmalloc.h
> > @@ -28,6 +28,7 @@ struct iov_iter;            /* in uio.h */
> >  #define VM_FLUSH_RESET_PERMS 0x00000100      /* reset direct map and f=
lush TLB on unmap, can't be freed in atomic context */
> >  #define VM_MAP_PUT_PAGES     0x00000200      /* put pages and free arr=
ay in vfree */
> >  #define VM_ALLOW_HUGE_VMAP   0x00000400      /* Allow for huge pages o=
n archs with HAVE_ARCH_HUGE_VMALLOC */
> > +#define VM_XEN                       0x00000800      /* xen use cases =
*/
> >
> >  #if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) &=
& \
> >       !defined(CONFIG_KASAN_VMALLOC)
>
> There's also VM_DEFER_KMEMLEAK a line below:

Ohh. Good catch. Will fix.

> I think it makes sense to use an enumeration for vm_flags, just like as
> Suren did for GFP
> (https://lore.kernel.org/linux-mm/20240224015800.2569851-1-surenb@google.=
com/)

Hmm. I'm pretty sure Christoph hates BIT macro obfuscation.
I'm not a fan of it either, though we use it in bpf in a few places.
If mm folks prefer that style they can do such conversion later.

