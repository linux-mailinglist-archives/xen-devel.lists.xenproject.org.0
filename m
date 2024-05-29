Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3408D352A
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 13:11:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731810.1137531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCHCs-0007fa-5e; Wed, 29 May 2024 11:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731810.1137531; Wed, 29 May 2024 11:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCHCs-0007cO-2f; Wed, 29 May 2024 11:10:58 +0000
Received: by outflank-mailman (input) for mailman id 731810;
 Wed, 29 May 2024 11:10:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9nLQ=NA=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sCHCr-0007cG-7q
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 11:10:57 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1edde8be-1dac-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 13:10:56 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5785e443cf4so1950915a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 04:10:56 -0700 (PDT)
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
X-Inumbo-ID: 1edde8be-1dac-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716981056; x=1717585856; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gpZKrKra7Iqk+QjOMF+QAPCTFC0C0WSuN63kFGROMUo=;
        b=fsnbH7c0aVyebpPOTaEbBFJuuzT/vjNfdz8uFheBAYK59ghx4Swvo1ZK+TYKj6w+6b
         3VXcFyvEPhh4q+IEHMeEaTdsOaxuuhf9WqJp8zqC2ZNeh85Hs0swCKOf0dOXhiOiX4lD
         5Lz9R8Lb9h2NK/T9tFgOoZj48474Gs7dXnmbWff1BEAhiDv3Q0cpUyMFTiIsyqaFE3a3
         6nGDOK2nCYih8qkMJNS1rC3pO+2F4QvtrWAXvz1KkVv+2hpvPSeiVm5iHjTST1bTM+Sy
         NpQ8sU6x150iQKmli3qTND9XmJbQGIxw2H/ewVKCJbMMLS1nUAe85IM/RBB+GS1nxF5K
         4q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716981056; x=1717585856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpZKrKra7Iqk+QjOMF+QAPCTFC0C0WSuN63kFGROMUo=;
        b=hJ9RRZRVYBVc3A+1zl2UDNQg2y5TFPDlD5y3GQmprhyPrIqY46tFlNhkYDQxnp3Jf/
         +e22oPekVHfgvX4zkDv+YX+yE+wr8+rikPIJqKoMaIpmYp07TpzPfHHXl2acTGrP7IQV
         0a8Laz2D7NEuBTT1mGr8Q+VsSSwNNstVy8Hcvmu2sRFnr7t9+AkxibVEKs2NsqIl/vlA
         HvPmOnDT2oJrbc+NtfvG78uLvhonThiG/LTuf9jwR6oDIz9uNO+HFPEm2n5gN+qxkXEp
         CKJHgVcWOXIzD/4rXs3CQyOE31BpZlN7SdNZMR7pKN4ioLcSZf13r8cANie7SFGDUZqr
         pUTA==
X-Forwarded-Encrypted: i=1; AJvYcCWfFMFzaGYkHrpjqKUAC+I87L1P/6o9CryXNyaTvmY5BWUxFPDdyg7+YnSN9g3YRwlfxGzRBkAH3LUwgX5m+63X15qm4g9p92jz9GbCekI=
X-Gm-Message-State: AOJu0YwDal5swkvjJxiYTlLewdftcjvWlbWsFOYi028iK1O693POAFMl
	qxWquDPd7y1WQPZghkYMO4KwPDEvN8m4WMPHDfBVbdQ+ZnQpkFANP/elCI1Px1hyBB4Xw8tvZk4
	JRVNpv4GNSB97oDX6dxzgO8D8F8G6Hlwhdv0=
X-Google-Smtp-Source: AGHT+IGGjT/BPndtKnYGowXLebktl6eEnPT7PGwOc/WAfZDkZI+bPyxhUgP2QKo0/TNvru3Auo0+hOEzpXMHhwD4LJM=
X-Received: by 2002:a50:8a9c:0:b0:579:fb7e:210d with SMTP id
 4fb4d7f45d1cf-579fb7e2991mr2748072a12.1.1716981055398; Wed, 29 May 2024
 04:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240524105152.1301842-1-edgar.iglesias@gmail.com>
 <20240524105152.1301842-4-edgar.iglesias@gmail.com> <4025f82f-242c-4c3e-952e-8ecf7a66838f@linaro.org>
In-Reply-To: <4025f82f-242c-4c3e-952e-8ecf7a66838f@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Wed, 29 May 2024 13:10:43 +0200
Message-ID: <CAJy5ezpgANR4VuewnXs=MJwAfipxNq4+1r3LwY-f8-7_R6mwRQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/8] xen: Add xen_mr_is_memory()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>, David Hildenbrand <david@redhat.com>, 
	Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000e4a930061995cd5e"

--000000000000e4a930061995cd5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 6:25=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> Hi Edgar,
>
> On 24/5/24 12:51, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >
> > Add xen_mr_is_memory() to abstract away tests for the
> > xen_memory MR.
> >
> > No functional changes.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > Acked-by: David Hildenbrand <david@redhat.com>
> > ---
> >   hw/xen/xen-hvm-common.c | 10 ++++++++--
> >   include/sysemu/xen.h    |  8 ++++++++
> >   2 files changed, 16 insertions(+), 2 deletions(-)
>
> To consolidate we could add:
>
>    static MemoryRegion xen_memory;
>
>    MemoryRegion *xen_mr_memory_init(uint64_t block_len)
>    {
>       assert(!xen_memory.size);
>       memory_region_init_ram(&xen_memory, NULL, "xen.ram", block_len,
> &error_fatal);
>       return &xen_memory;
>    }
>
> and remove the extern declaration.
>

Thanks,

We have a future patch series in the workings that will add a PVH machine
for x86, I'll keep this in mind for then!


>
> > diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
> > index 754ec2e6cb..dc72f83bcb 100644
> > --- a/include/sysemu/xen.h
> > +++ b/include/sysemu/xen.h
> > @@ -34,6 +34,8 @@ void xen_hvm_modified_memory(ram_addr_t start,
> ram_addr_t length);
> >   void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
> >                      struct MemoryRegion *mr, Error **errp);
> >
> > +bool xen_mr_is_memory(MemoryRegion *mr);
> > +
> >   #else /* !CONFIG_XEN_IS_POSSIBLE */
> >
> >   #define xen_enabled() 0
> > @@ -47,6 +49,12 @@ static inline void xen_ram_alloc(ram_addr_t ram_addr=
,
> ram_addr_t size,
> >       g_assert_not_reached();
> >   }
> >
> > +static inline bool xen_mr_is_memory(MemoryRegion *mr)
> > +{
> > +    g_assert_not_reached();
> > +    return false;
>
> No need for the stub, just always declare xen_mr_is_memory() ...
> > +}
> > +
> >   #endif /* CONFIG_XEN_IS_POSSIBLE */
>
> ... here.
>
> >   #endif
>
> Removing the stub:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
>
Thanks Philippe, will remove the stubs in v8.

Cheers,
Edgar

--000000000000e4a930061995cd5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, May 27, 2024 at 6:25=E2=80=AFPM P=
hilippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@=
linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Hi Edgar,<br>
<br>
On 24/5/24 12:51, Edgar E. Iglesias wrote:<br>
&gt; From: &quot;Edgar E. Iglesias&quot; &lt;<a href=3D"mailto:edgar.iglesi=
as@amd.com" target=3D"_blank">edgar.iglesias@amd.com</a>&gt;<br>
&gt; <br>
&gt; Add xen_mr_is_memory() to abstract away tests for the<br>
&gt; xen_memory MR.<br>
&gt; <br>
&gt; No functional changes.<br>
&gt; <br>
&gt; Signed-off-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@=
amd.com" target=3D"_blank">edgar.iglesias@amd.com</a>&gt;<br>
&gt; Reviewed-by: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kern=
el.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
&gt; Acked-by: David Hildenbrand &lt;<a href=3D"mailto:david@redhat.com" ta=
rget=3D"_blank">david@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/xen/xen-hvm-common.c | 10 ++++++++--<br>
&gt;=C2=A0 =C2=A0include/sysemu/xen.h=C2=A0 =C2=A0 |=C2=A0 8 ++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 16 insertions(+), 2 deletions(-)<br>
<br>
To consolidate we could add:<br>
<br>
=C2=A0 =C2=A0static MemoryRegion xen_memory;<br>
<br>
=C2=A0 =C2=A0MemoryRegion *xen_mr_memory_init(uint64_t block_len)<br>
=C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 assert(!xen_memory.size);<br>
=C2=A0 =C2=A0 =C2=A0 memory_region_init_ram(&amp;xen_memory, NULL, &quot;xe=
n.ram&quot;, block_len, <br>
&amp;error_fatal);<br>
=C2=A0 =C2=A0 =C2=A0 return &amp;xen_memory;<br>
=C2=A0 =C2=A0}<br>
<br>
and remove the extern declaration.<br></blockquote><div><br></div><div>Than=
ks,</div><div><br></div><div>We have a future patch series in the workings =
that will add a PVH machine for x86, I&#39;ll keep this in mind for then!</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h<br>
&gt; index 754ec2e6cb..dc72f83bcb 100644<br>
&gt; --- a/include/sysemu/xen.h<br>
&gt; +++ b/include/sysemu/xen.h<br>
&gt; @@ -34,6 +34,8 @@ void xen_hvm_modified_memory(ram_addr_t start, ram_a=
ddr_t length);<br>
&gt;=C2=A0 =C2=A0void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 struct MemoryRegion *mr, Error **errp);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +bool xen_mr_is_memory(MemoryRegion *mr);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0#else /* !CONFIG_XEN_IS_POSSIBLE */<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#define xen_enabled() 0<br>
&gt; @@ -47,6 +49,12 @@ static inline void xen_ram_alloc(ram_addr_t ram_add=
r, ram_addr_t size,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_not_reached();<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static inline bool xen_mr_is_memory(MemoryRegion *mr)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 g_assert_not_reached();<br>
&gt; +=C2=A0 =C2=A0 return false;<br>
<br>
No need for the stub, just always declare xen_mr_is_memory() ...<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0#endif /* CONFIG_XEN_IS_POSSIBLE */<br>
<br>
... here.<br>
<br>
&gt;=C2=A0 =C2=A0#endif<br>
<br>
Removing the stub:<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linar=
o.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
<br></blockquote><div><br></div><div>Thanks Philippe, will remove the stubs=
 in v8.</div><div><br></div><div>Cheers,</div><div>Edgar</div></div></div>

--000000000000e4a930061995cd5e--

