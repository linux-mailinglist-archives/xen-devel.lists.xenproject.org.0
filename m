Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFD891E1B5
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 16:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751697.1159723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHYY-0003Ns-Vw; Mon, 01 Jul 2024 13:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751697.1159723; Mon, 01 Jul 2024 13:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHYY-0003MF-T4; Mon, 01 Jul 2024 13:58:58 +0000
Received: by outflank-mailman (input) for mailman id 751697;
 Mon, 01 Jul 2024 13:58:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K0KN=OB=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sOHYX-0003Lq-2m
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 13:58:57 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dba1f1d-37b2-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 15:58:54 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a6cb130027aso165075266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 06:58:54 -0700 (PDT)
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
X-Inumbo-ID: 0dba1f1d-37b2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719842334; x=1720447134; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2l6Wd4cvO4L+9S28hCH23khCgRnt+TeEyOTCmlDi2/8=;
        b=ElMtruEeY56HtHngb291Xtud+o1rKLFj1NyE+IPHb8TEkNTBfc42nS/Ktnt3sq51fg
         Yl5Bt5X8refV0rMEjDkrdiNmJsGoH8SBT2/MM2NN5gdYEgjBK0ze4FWuC2cRdaAapiw2
         yqRk11W69xG6RuHGzM5cxMQ7iNKdZ1JmFA5ixzX5r9pF0kJJHm4OrbGUuni5bxyY4nzm
         cRzUQSIX6W3iUcGuQj50iNuVbPbJX735BQhgtlc9xd060ul8TZJgZka4xfeHBhBUx9oV
         +F4bIoXYgGJ9xCydRB8w7GP89sJna/FR6+TpXstpQm3Dc7gyz7BpkhWaMXsR238g91fY
         Jo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719842334; x=1720447134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2l6Wd4cvO4L+9S28hCH23khCgRnt+TeEyOTCmlDi2/8=;
        b=iXIrJkENnBXjABTK44rMEx5P+biCuX8/kgwBS/4QeW0D3snZesonGWVitJvdJqGztt
         uqyM9meK6KDYV1sZsWSRQI3Jb+M+YvikrNiStMBbfoREevh7XF/NWoz37tkwRlF2TSgi
         wyhjrudn4tvDMXJmM89tKCIgi8Rv30+hMIwYS0/q+kiZ1b3CujSZ6knL4dG38bKqn/7B
         Lh5I3/WyL6NPrUq3vp0jIwJ0TtlyFQ374gVbCH3L23KhWcffUNN6WfuEE9QHDhu1xBi2
         s2JdhaSWlUAk/oKqTjS22MOmXvhA3mvL8HnJVQfRdCJPN1WnZMDv6PMBnMxCc4PlmjDd
         Fs4w==
X-Forwarded-Encrypted: i=1; AJvYcCUnA8LgDFA+b94ltCnpv56xhOBbx8pLBeEIzn6UIu73nEmCgxjGVdaDa6ahsVocL0p0Dtc/Wxr3zAT6JmeQhnjbwzfC3ReAYk/K8kT3Xkg=
X-Gm-Message-State: AOJu0YzD5DhE1PTjrB/t73/QOt00EQcESwXAXRGGOyXSUgzeSSkXmJww
	NQ+mda/bvLysWZ8HUXDxkLYx2eBaXpIsHKjGmivsd9zpJ+lX11fzEyGrHF/aViZ8c0v6CSnmr2A
	kkCxHaDs147/WN6EhnsnnD8x2OiE=
X-Google-Smtp-Source: AGHT+IHPkJGi6sKvrK3ZL/jjJi7NohZrE0FEhPTBDfBZ4RV4H+qPLVgghHFMsp/qQP+s7uD7YxRUc87cEK7UFQjhJAE=
X-Received: by 2002:a05:6402:358a:b0:582:8746:6534 with SMTP id
 4fb4d7f45d1cf-587a0822baemr4766634a12.28.1719842333548; Mon, 01 Jul 2024
 06:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240529140739.1387692-1-edgar.iglesias@gmail.com>
 <20240529140739.1387692-3-edgar.iglesias@gmail.com> <ZoKnQLBwIwh004yy@l14>
In-Reply-To: <ZoKnQLBwIwh004yy@l14>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 1 Jul 2024 15:58:41 +0200
Message-ID: <CAJy5ezqdxQ_y_sCyP243yTfgOJfLh1COzN9Eg+PxxoaVeOh-mQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/8] xen: mapcache: Unmap first entries in buckets
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000005c6c64061c2fffef"

--0000000000005c6c64061c2fffef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 2:55=E2=80=AFPM Anthony PERARD <anthony.perard@vates=
.tech>
wrote:

> Hi all,
>
> Following this commit, a test which install Debian in a guest with OVMF
> as firmware started to fail. QEMU exit with an error when GRUB is
> running on the freshly installed Debian (I don't know if GRUB is
> starting Linux or not).
> The error is:
>     Bad ram offset ffffffffffffffff
>
> Some logs:
>
> http://logs.test-lab.xenproject.org/osstest/logs/186611/test-amd64-amd64-=
xl-qemuu-ovmf-amd64/info.html
>
> Any idea? Something is trying to do something with the address "-1" when
> it shouldn't?
>
>
Hi Anothny,

Yes, it looks like something is calling qemu_get_ram_block() on something
that isn't mapped.
One possible path is in qemu_ram_block_from_host() but there may be others.

The following patch may help.
Any chance you could try to get a backtrace from QEMU when it failed?

diff --git a/system/physmem.c b/system/physmem.c
index 33d09f7571..2669c4dbbb 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -2277,6 +2277,9 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, bool
round_offset,
         ram_addr_t ram_addr;
         RCU_READ_LOCK_GUARD();
         ram_addr =3D xen_ram_addr_from_mapcache(ptr);
+        if (ram_addr =3D=3D RAM_ADDR_INVALID) {
+            return NULL;
+        }
         block =3D qemu_get_ram_block(ram_addr);
         if (block) {
             *offset =3D ram_addr - block->offset;





> Cheers,
>
> Anthony
>
> On Wed, May 29, 2024 at 04:07:33PM +0200, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >
> > When invalidating memory ranges, if we happen to hit the first
> > entry in a bucket we were never unmapping it. This was harmless
> > for foreign mappings but now that we're looking to reuse the
> > mapcache for transient grant mappings, we must unmap entries
> > when invalidated.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > ---
> >  hw/xen/xen-mapcache.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> > index bc860f4373..ec95445696 100644
> > --- a/hw/xen/xen-mapcache.c
> > +++ b/hw/xen/xen-mapcache.c
> > @@ -491,18 +491,23 @@ static void
> xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
> >          return;
> >      }
> >      entry->lock--;
> > -    if (entry->lock > 0 || pentry =3D=3D NULL) {
> > +    if (entry->lock > 0) {
> >          return;
> >      }
> >
> > -    pentry->next =3D entry->next;
> >      ram_block_notify_remove(entry->vaddr_base, entry->size,
> entry->size);
> >      if (munmap(entry->vaddr_base, entry->size) !=3D 0) {
> >          perror("unmap fails");
> >          exit(-1);
> >      }
> > +
> >      g_free(entry->valid_mapping);
> > -    g_free(entry);
> > +    if (pentry) {
> > +        pentry->next =3D entry->next;
> > +        g_free(entry);
> > +    } else {
> > +        memset(entry, 0, sizeof *entry);
> > +    }
> >  }
> >
> >  typedef struct XenMapCacheData {
> > --
> > 2.40.1
> >
> >
> --
>
> Anthony Perard | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech
>

--0000000000005c6c64061c2fffef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Jul 1, 2024 at 2:55=E2=80=AFPM An=
thony PERARD &lt;anthony.perard@vates.tech&gt; wrote:<br></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi all,<=
br>
<br>
Following this commit, a test which install Debian in a guest with OVMF<br>
as firmware started to fail. QEMU exit with an error when GRUB is<br>
running on the freshly installed Debian (I don&#39;t know if GRUB is<br>
starting Linux or not).<br>
The error is:<br>
=C2=A0 =C2=A0 Bad ram offset ffffffffffffffff<br>
<br>
Some logs:<br>
<a href=3D"http://logs.test-lab.xenproject.org/osstest/logs/186611/test-amd=
64-amd64-xl-qemuu-ovmf-amd64/info.html" rel=3D"noreferrer" target=3D"_blank=
">http://logs.test-lab.xenproject.org/osstest/logs/186611/test-amd64-amd64-=
xl-qemuu-ovmf-amd64/info.html</a><br>
<br>
Any idea? Something is trying to do something with the address &quot;-1&quo=
t; when<br>
it shouldn&#39;t?<br>
<br></blockquote><div><br></div><div>Hi Anothny,</div><div><br></div><div>Y=
es, it looks like something is calling=C2=A0qemu_get_ram_block() on somethi=
ng that isn&#39;t mapped.</div><div>One possible path is in=C2=A0qemu_ram_b=
lock_from_host() but there may be others.</div><div><br></div><div>The=C2=
=A0following patch may help.</div><div>Any chance you could try to get a ba=
cktrace from QEMU when it failed?</div><div><br></div><div>diff --git a/sys=
tem/physmem.c b/system/physmem.c<br>index 33d09f7571..2669c4dbbb 100644<br>=
--- a/system/physmem.c<br>+++ b/system/physmem.c<br>@@ -2277,6 +2277,9 @@ R=
AMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0ram_addr_t ram_addr;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0RCU_READ_LOCK_GUARD();<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ram_a=
ddr =3D xen_ram_addr_from_mapcache(ptr);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 (ram_addr =3D=3D RAM_ADDR_INVALID) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return NULL;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0block =3D qemu_get_ram_block(ram_addr);<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if (block) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0*offset =3D ram_addr - block-&gt;offset;<br></div><div><br></d=
iv><div><br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
Cheers,<br>
<br>
Anthony<br>
<br>
On Wed, May 29, 2024 at 04:07:33PM +0200, Edgar E. Iglesias wrote:<br>
&gt; From: &quot;Edgar E. Iglesias&quot; &lt;<a href=3D"mailto:edgar.iglesi=
as@amd.com" target=3D"_blank">edgar.iglesias@amd.com</a>&gt;<br>
&gt; <br>
&gt; When invalidating memory ranges, if we happen to hit the first<br>
&gt; entry in a bucket we were never unmapping it. This was harmless<br>
&gt; for foreign mappings but now that we&#39;re looking to reuse the<br>
&gt; mapcache for transient grant mappings, we must unmap entries<br>
&gt; when invalidated.<br>
&gt; <br>
&gt; Signed-off-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@=
amd.com" target=3D"_blank">edgar.iglesias@amd.com</a>&gt;<br>
&gt; Reviewed-by: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kern=
el.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/xen/xen-mapcache.c | 11 ++++++++---<br>
&gt;=C2=A0 1 file changed, 8 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c<br>
&gt; index bc860f4373..ec95445696 100644<br>
&gt; --- a/hw/xen/xen-mapcache.c<br>
&gt; +++ b/hw/xen/xen-mapcache.c<br>
&gt; @@ -491,18 +491,23 @@ static void xen_invalidate_map_cache_entry_unloc=
ked(MapCache *mc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 entry-&gt;lock--;<br>
&gt; -=C2=A0 =C2=A0 if (entry-&gt;lock &gt; 0 || pentry =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 if (entry-&gt;lock &gt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 pentry-&gt;next =3D entry-&gt;next;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ram_block_notify_remove(entry-&gt;vaddr_base, entr=
y-&gt;size, entry-&gt;size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (munmap(entry-&gt;vaddr_base, entry-&gt;size) !=
=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perror(&quot;unmap fails&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_free(entry-&gt;valid_mapping);<br>
&gt; -=C2=A0 =C2=A0 g_free(entry);<br>
&gt; +=C2=A0 =C2=A0 if (pentry) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pentry-&gt;next =3D entry-&gt;next;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(entry);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(entry, 0, sizeof *entry);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 typedef struct XenMapCacheData {<br>
&gt; -- <br>
&gt; 2.40.1<br>
&gt; <br>
&gt; <br>
-- <br>
<br>
Anthony Perard | Vates XCP-ng Developer<br>
<br>
XCP-ng &amp; Xen Orchestra - Vates solutions<br>
<br>
web: <a href=3D"https://vates.tech" rel=3D"noreferrer" target=3D"_blank">ht=
tps://vates.tech</a><br>
</blockquote></div></div>

--0000000000005c6c64061c2fffef--

