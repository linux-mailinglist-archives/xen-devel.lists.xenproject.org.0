Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E621E86A50B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 02:32:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686368.1068291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf8nP-00049U-Hp; Wed, 28 Feb 2024 01:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686368.1068291; Wed, 28 Feb 2024 01:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf8nP-00048Y-CZ; Wed, 28 Feb 2024 01:31:43 +0000
Received: by outflank-mailman (input) for mailman id 686368;
 Wed, 28 Feb 2024 01:31:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fDsi=KF=gmail.com=alexei.starovoitov@srs-se1.protection.inumbo.net>)
 id 1rf8nO-00048S-GS
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 01:31:42 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f155abc-d5d9-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 02:31:40 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41241f64c6bso38314935e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 17:31:40 -0800 (PST)
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
X-Inumbo-ID: 1f155abc-d5d9-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709083900; x=1709688700; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQB+JZ1G68ICyO1N3p0oqOVpl3RnCmkeQUi97bJMYlw=;
        b=lpV8t09eHyhd9CiSOkeN4xvqZ0whcw0CYYOaIZFc8JF3KInWBVEbCapI+QvC1x3EE4
         TTWRscfveLLgchiK/HMULXkwQHIhEvHfE9sGT4Ktsy9e6OgotyhiCHRC01/rRLB6sVlT
         DHFSixqz8XBhpwff9iNRraxQ99/bz0I8JeAKos+gDUtr6KGsFXG00kEM93HdQBZ/h55F
         bXbLkDyNdQba8ISStrEuaec3iZ98OgrrJURLiVJMHfyE8D4lfEp2kjzoh2ZccreOXRKt
         DwlBMvJYD7DH070lZ5IJa/OWS0OF1dgEIvJyvW5T73YYrI3BIOZqeFUzLp/bdfkWKA5G
         3ZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709083900; x=1709688700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQB+JZ1G68ICyO1N3p0oqOVpl3RnCmkeQUi97bJMYlw=;
        b=DFmsnXOxJ8jrJoRqXDWo+RV8nJHSaVQyx7hdoFBoqgkg85XmQDD7kOaT1fmxqZ7unq
         7jY4lT/qVSePf0hYpYdhS6ZzgCwx5aVyGJidlJUCh/phYmFFOpgyw3Q7VNQJSQ8bHshP
         f3AKZesSC40veAniBh9tL6F3GLW49TNCeDd7Kp71XvHApxH1Anz1GbfYbdPHrFxmz/pL
         w8hxb/AGEkX82fPIfJER25Ii/jQPBzdbUwb4xFIrie4bTt4TV0qMadRSV05tKElfXRhx
         NPt8UMcrHVjE3oq8z2UBMgFeB8zKFBLBkfI+4ZFQOJ1rISGJ93oZOyYSAqo/LhjxzEwF
         iIGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWt5Xief1EUIZ5umDEric2nQdlC8ojxKB4okUpNlSMB/PER397vU2NiTaZ99ojCAwDw++pKBnQGWnLePrYjIkU64Mb28H6Fw9Vhv1XwY8=
X-Gm-Message-State: AOJu0YyZS6k0f9enH+Uv7yyip329PTacK+WRhPbCJYkYxF0hGs9VZJ6N
	FbKUKTbsW72sjekf+UGLg4s3Odmqx3X9YB+i2uF2ItWHyiUTsIuTSoZvPhKizMqghqLDYYkRwa4
	zP7db/mvLDX3GoTH/3PJ3lxHFqWY=
X-Google-Smtp-Source: AGHT+IHW0RvW1Yw8eRC97o+L4oxzxSjZSar1xugDudti2CXKZy7764qOr6NgwPLSJiP97CBaYnawADxltOlqy8AvltM=
X-Received: by 2002:adf:db07:0:b0:33d:82ae:67f8 with SMTP id
 s7-20020adfdb07000000b0033d82ae67f8mr8131519wri.50.1709083899508; Tue, 27 Feb
 2024 17:31:39 -0800 (PST)
MIME-Version: 1.0
References: <20240223235728.13981-1-alexei.starovoitov@gmail.com>
 <20240223235728.13981-4-alexei.starovoitov@gmail.com> <Zd4jGhvb-Utdo2jU@infradead.org>
In-Reply-To: <Zd4jGhvb-Utdo2jU@infradead.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 27 Feb 2024 17:31:28 -0800
Message-ID: <CAADnVQ+f06b1hDrAyLM-OrzDfEEa=jtamJOKfEnEo4ewKPV0cA@mail.gmail.com>
Subject: Re: [PATCH v2 bpf-next 3/3] mm: Introduce VM_SPARSE kind and vm_area_[un]map_pages().
To: Christoph Hellwig <hch@infradead.org>
Cc: bpf <bpf@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Barret Rhoden <brho@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Lorenzo Stoakes <lstoakes@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, sstabellini@kernel.org, 
	Juergen Gross <jgross@suse.com>, linux-mm <linux-mm@kvack.org>, xen-devel@lists.xenproject.org, 
	Kernel Team <kernel-team@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 9:59=E2=80=AFAM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> > privately-managed pages into a sparse vm area with the following steps:
> >
> >   area =3D get_vm_area(area_size, VM_SPARSE);  // at bpf prog verificat=
ion time
> >   vm_area_map_pages(area, kaddr, 1, page);   // on demand
> >                     // it will return an error if kaddr is out of range
> >   vm_area_unmap_pages(area, kaddr, 1);
> >   free_vm_area(area);                        // after bpf prog is unloa=
ded
>
> I'm still wondering if this should just use an opaque cookie instead
> of exposing the vm_area.  But otherwise this mostly looks fine to me.

What would it look like with a cookie?
A static inline wrapper around get_vm_area() that returns area->addr ?
And the start address of vmap range will be such a cookie?

Then vm_area_map_pages() will be doing find_vm_area() for kaddr
to check that vm_area->flag & VM_SPARSE ?
That's fine,
but what would be an equivalent of void free_vm_area(struct vm_struct *area=
) ?
Another static inline wrapper similar to remove_vm_area()
that also does kfree(area); ?

Fine by me, but api isn't user friendly with such obfuscation.

I guess I don't understand the motivation to hide 'struct vm_struct *'.

> > +     if (addr < (unsigned long)area->addr || (void *)end > area->addr =
+ area->size)
> > +             return -ERANGE;
>
> This check is duplicated so many times that it really begs for a helper.

ok. will do.

> > +int vm_area_unmap_pages(struct vm_struct *area, unsigned long addr, un=
signed int count)
> > +{
> > +     unsigned long size =3D ((unsigned long)count) * PAGE_SIZE;
> > +     unsigned long end =3D addr + size;
> > +
> > +     if (WARN_ON_ONCE(!(area->flags & VM_SPARSE)))
> > +             return -EINVAL;
> > +     if (addr < (unsigned long)area->addr || (void *)end > area->addr =
+ area->size)
> > +             return -ERANGE;
> > +
> > +     vunmap_range(addr, end);
> > +     return 0;
>
> Does it make much sense to have an error return here vs just debug
> checks?  It's not like the caller can do much if it violates these
> basic invariants.

Ok. Will switch to void return.

Will reduce commit line logs to 75 chars in all patches as suggested.

re: VM_GRANT_TABLE or VM_XEN_GRANT_TABLE suggestion for patch 2.

I'm not sure it fits, since only one of get_vm_area() in xen code
is a grant table related. The other one is for xenbus that
creates a shared memory ring between domains.
So I'm planning to keep it as VM_XEN in the next revision unless
folks come up with a better name.

Thanks for the reviews.

