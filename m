Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0852C91EA54
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 23:29:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751873.1159962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOOZZ-0004Sv-HJ; Mon, 01 Jul 2024 21:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751873.1159962; Mon, 01 Jul 2024 21:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOOZZ-0004QL-ES; Mon, 01 Jul 2024 21:28:29 +0000
Received: by outflank-mailman (input) for mailman id 751873;
 Mon, 01 Jul 2024 21:28:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K0KN=OB=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sOOZY-0004QE-Bt
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 21:28:28 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9d9942d-37f0-11ef-a59d-41c015c667e1;
 Mon, 01 Jul 2024 23:28:26 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a7fso40336161fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 14:28:25 -0700 (PDT)
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
X-Inumbo-ID: d9d9942d-37f0-11ef-a59d-41c015c667e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719869305; x=1720474105; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z47rrp19EOR62kU/hDwPlQ1816uy8bL5lJvENesMmgY=;
        b=RTIRry9sUX17x5XyYKtkaAMXkgmRT4gFHX1tS2f/8wnEs4197xJ5XQ/Ug6fMXPFC9i
         C/CT3wsgrWs42uADd4It9ax+hmCWJE8qOzQ4xQlt8trjjOhQm8U81h7KWV6HqNWBZb4+
         oDAtvuZ2VEQEndG8WH6OlwhTO+aaDp2Z3wdIvX9Nf28z708FNKK7DCfXqewFkiSA7d8l
         7A37UH/pHzvCpvAQUDiG/J9aYQVhgWHuMRbjw0v41r+XtyHApxmTWqZ9qYIa1CDrDWXe
         SHKqn3OMNZPNLe16G5nd18NUY4qMkDrFy1LELqgpVL3HEIKZGeaYhmO0kuBRHzOKQuVM
         9QDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719869305; x=1720474105;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z47rrp19EOR62kU/hDwPlQ1816uy8bL5lJvENesMmgY=;
        b=Qnj2vSptx0jOfS8k9cD7wBv6f8v+Ht9l7lct9RC5G8lF0LDw7/lh8tDlx9jJJy1z3K
         84RV/k6liw5ZlltSeg0olET3Y0c/i//7WujIkfKLl2OV7LibqP2h53eSz9QrkH+pGiRq
         YluNZcDUzzZP8MLIPV7d1LMo3E+WHW2baaMCOZw6zZcG2vCsTFt4nmZD0i6j78FDW05o
         l54albOzkRJYYEfQjT4j17EbhIt12A6P6niBqhv1iQ2hH6IXLhGCSu4PW2gZtw5fbgzF
         xd4goKtBBP4DV0phOFWJWgJOHbzr/cuyIZrk+MYkWM4gDZlfAFTlaXf4sHJyldc9SNJ8
         +lVw==
X-Forwarded-Encrypted: i=1; AJvYcCWqyzygviuwgELowdsIZd1++FiqF4Gd82GHAKRr6T+qwINLJagfTvo5xSjvA56SO2mDcqMYWtDFyJpgHQpHzrCXIQny8Mu79119+BxaiHY=
X-Gm-Message-State: AOJu0YyeLSIzwfdXTmxDhqd7c5xUec9oxwbsKIUPou64s5Q5T/hVqvdn
	vhPyRbRLxzhNDkmj6ZeMkrx3jYVqKLYoGCZnsDiLFootZm3i0l6ohKjMOkXgyLXYfcBjSPiN5em
	U7USsDRye2Syn2fZ58sPlxAD4VUs=
X-Google-Smtp-Source: AGHT+IGn6UXqDPbj97fDpIgnnXUu/Lf1rP+lX4sbufQ99fwsUqIs7xnpg1D8xQYFasR5QGaGQdiYgEwIGSii1OkkBRY=
X-Received: by 2002:a2e:a58a:0:b0:2eb:ef78:29c8 with SMTP id
 38308e7fff4ca-2ee5e39400cmr46083061fa.14.1719869304619; Mon, 01 Jul 2024
 14:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240529140739.1387692-1-edgar.iglesias@gmail.com>
 <20240529140739.1387692-3-edgar.iglesias@gmail.com> <ZoKnQLBwIwh004yy@l14>
 <CAJy5ezqdxQ_y_sCyP243yTfgOJfLh1COzN9Eg+PxxoaVeOh-mQ@mail.gmail.com>
 <CAJy5ezrSs8r=ibTgb_oURdFTDW07sVVBeU6Rw7jsM+iaqPLNgg@mail.gmail.com>
 <CAJy5ezrPgUR3-gWK3Mfnc7iAgV3MEStSardY+0kkvHB+PHbe4w@mail.gmail.com> <ZoLXe9wjyXCU88Y0@l14>
In-Reply-To: <ZoLXe9wjyXCU88Y0@l14>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 1 Jul 2024 23:28:12 +0200
Message-ID: <CAJy5ezqO=YX-z6qN4U_jkrxw=y-4a4buv3GYnWDNafKKn+EqgQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/8] xen: mapcache: Unmap first entries in buckets
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000f64895061c3646e5"

--000000000000f64895061c3646e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 6:21=E2=80=AFPM Anthony PERARD <anthony.perard@vates=
.tech>
wrote:

> On Mon, Jul 01, 2024 at 04:34:53PM +0200, Edgar E. Iglesias wrote:
> > On Mon, Jul 1, 2024 at 4:30=E2=80=AFPM Edgar E. Iglesias <
> edgar.iglesias@gmail.com>
> > wrote:
> > > On Mon, Jul 1, 2024 at 3:58=E2=80=AFPM Edgar E. Iglesias <
> edgar.iglesias@gmail.com>
> > > wrote:
> > >> Any chance you could try to get a backtrace from QEMU when it failed=
?
>
> Here it is:
>
>
> #3  0x00007fa8762f4472 in __GI_abort () at ./stdlib/abort.c:79
>         save_stage =3D 1
>         act =3D {__sigaction_handler =3D {sa_handler =3D 0x20, sa_sigacti=
on =3D
> 0x20}, sa_mask =3D {__val =3D {94603440166168, 18446744073709551615,
> 94603406369640, 0, 0, 94603406346720, 94603440166168, 140361486774256, 0,
> 140361486773376, 94603401285536, 140361496232688, 94603440166096,
> 140361486773456, 94603401289576, 140360849280256}}, sa_flags =3D -1804462=
896,
> sa_restorer =3D 0x748f2d40}
> #4  0x0000560a92230f0d in qemu_get_ram_block (addr=3D18446744073709551615=
)
> at ../system/physmem.c:801
>         block =3D 0x0
> #5  0x0000560a922350ab in qemu_ram_block_from_host (ptr=3D0x7fa84e8fcd00,
> round_offset=3Dfalse, offset=3D0x7fa8748f2de8) at ../system/physmem.c:228=
0
>         ram_addr =3D 18446744073709551615
>         _rcu_read_auto =3D 0x1
>         block =3D 0x0
>         host =3D 0x7fa84e8fcd00 ""
>         _rcu_read_auto =3D 0x7fa8751f8288
> #6  0x0000560a92229669 in memory_region_from_host (ptr=3D0x7fa84e8fcd00,
> offset=3D0x7fa8748f2de8) at ../system/memory.c:2440
>         block =3D 0x0
> #7  0x0000560a92237418 in address_space_unmap (as=3D0x560a94b05a20,
> buffer=3D0x7fa84e8fcd00, len=3D32768, is_write=3Dtrue, access_len=3D32768=
) at
> ../system/physmem.c:3246
>         mr =3D 0x0
>         addr1 =3D 0
>         __PRETTY_FUNCTION__ =3D "address_space_unmap"
> #8  0x0000560a91fd6cd3 in dma_memory_unmap (as=3D0x560a94b05a20,
> buffer=3D0x7fa84e8fcd00, len=3D32768, dir=3DDMA_DIRECTION_FROM_DEVICE,
> access_len=3D32768) at /root/build/qemu/include/sysemu/dma.h:236
> #9  0x0000560a91fd763d in dma_blk_unmap (dbs=3D0x560a94d87400) at
> ../system/dma-helpers.c:93
>         i =3D 1
> #10 0x0000560a91fd76e6 in dma_complete (dbs=3D0x560a94d87400, ret=3D0) at
> ../system/dma-helpers.c:105
>         __PRETTY_FUNCTION__ =3D "dma_complete"
> #11 0x0000560a91fd781c in dma_blk_cb (opaque=3D0x560a94d87400, ret=3D0) a=
t
> ../system/dma-helpers.c:129
>         dbs =3D 0x560a94d87400
>         ctx =3D 0x560a9448da90
>         cur_addr =3D 0
>         cur_len =3D 0
>         mem =3D 0x0
>         __PRETTY_FUNCTION__ =3D "dma_blk_cb"
> #12 0x0000560a9232e974 in blk_aio_complete (acb=3D0x560a9448d5f0) at
> ../block/block-backend.c:1555
> #13 0x0000560a9232ebd1 in blk_aio_read_entry (opaque=3D0x560a9448d5f0) at
> ../block/block-backend.c:1610
>         acb =3D 0x560a9448d5f0
>         rwco =3D 0x560a9448d618
>         qiov =3D 0x560a94d87460
>         __PRETTY_FUNCTION__ =3D "blk_aio_read_entry"
>
> > > One more thing, regarding this specific patch. I don't think we shoul=
d
> > > clear the
> > > entire entry, the next field should be kept, otherwise we'll disconne=
ct
> > > following
> > > mappings that will never be found again. IIUC, this could very well b=
e
> > > causing the problem you see.
> > >
> > > Does the following make sense?
> > >
> > And here without double-freeing entry->valid_mapping:
> >
> > diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> > index 5f23b0adbe..667807b3b6 100644
> > --- a/hw/xen/xen-mapcache.c
> > +++ b/hw/xen/xen-mapcache.c
> > @@ -597,7 +597,13 @@ static void
> > xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
> >          pentry->next =3D entry->next;
> >          g_free(entry);
> >      } else {
> > -        memset(entry, 0, sizeof *entry);
> > +        /* Invalidate mapping.  */
> > +        entry->paddr_index =3D 0;
> > +        entry->vaddr_base =3D NULL;
> > +        entry->size =3D 0;
> > +        entry->valid_mapping =3D NULL;
> > +        entry->flags =3D 0;
> > +        /* Keep entry->next pointing to the rest of the list.  */
> >      }
> >  }
>
> I've tried this patch, and that fix the issue I've seen. I'll run more
> tests on it, just in case, but there's no reason that would break
> something else.
>
> Cheers,
>

Thanks Anthony, I'll send out a proper patch tomorrow.

Cheers,
Edgar

--000000000000f64895061c3646e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 1, 2024 at 6:21=E2=80=AFP=
M Anthony PERARD &lt;anthony.perard@vates.tech&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Mon, Jul 01, 2024 at 04:34:53P=
M +0200, Edgar E. Iglesias wrote:<br>
&gt; On Mon, Jul 1, 2024 at 4:30=E2=80=AFPM Edgar E. Iglesias &lt;<a href=
=3D"mailto:edgar.iglesias@gmail.com" target=3D"_blank">edgar.iglesias@gmail=
.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; On Mon, Jul 1, 2024 at 3:58=E2=80=AFPM Edgar E. Iglesias &lt;<a h=
ref=3D"mailto:edgar.iglesias@gmail.com" target=3D"_blank">edgar.iglesias@gm=
ail.com</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt;&gt; Any chance you could try to get a backtrace from QEMU when it=
 failed?<br>
<br>
Here it is:<br>
<br>
<br>
#3=C2=A0 0x00007fa8762f4472 in __GI_abort () at ./stdlib/abort.c:79<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 save_stage =3D 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 act =3D {__sigaction_handler =3D {sa_handler =
=3D 0x20, sa_sigaction =3D 0x20}, sa_mask =3D {__val =3D {94603440166168, 1=
8446744073709551615, 94603406369640, 0, 0, 94603406346720, 94603440166168, =
140361486774256, 0, 140361486773376, 94603401285536, 140361496232688, 94603=
440166096, 140361486773456, 94603401289576, 140360849280256}}, sa_flags =3D=
 -1804462896, sa_restorer =3D 0x748f2d40}<br>
#4=C2=A0 0x0000560a92230f0d in qemu_get_ram_block (addr=3D18446744073709551=
615) at ../system/physmem.c:801<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 block =3D 0x0<br>
#5=C2=A0 0x0000560a922350ab in qemu_ram_block_from_host (ptr=3D0x7fa84e8fcd=
00, round_offset=3Dfalse, offset=3D0x7fa8748f2de8) at ../system/physmem.c:2=
280<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ram_addr =3D 18446744073709551615<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 _rcu_read_auto =3D 0x1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 block =3D 0x0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 host =3D 0x7fa84e8fcd00 &quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 _rcu_read_auto =3D 0x7fa8751f8288<br>
#6=C2=A0 0x0000560a92229669 in memory_region_from_host (ptr=3D0x7fa84e8fcd0=
0, offset=3D0x7fa8748f2de8) at ../system/memory.c:2440<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 block =3D 0x0<br>
#7=C2=A0 0x0000560a92237418 in address_space_unmap (as=3D0x560a94b05a20, bu=
ffer=3D0x7fa84e8fcd00, len=3D32768, is_write=3Dtrue, access_len=3D32768) at=
 ../system/physmem.c:3246<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mr =3D 0x0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr1 =3D 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __PRETTY_FUNCTION__ =3D &quot;address_space_unm=
ap&quot;<br>
#8=C2=A0 0x0000560a91fd6cd3 in dma_memory_unmap (as=3D0x560a94b05a20, buffe=
r=3D0x7fa84e8fcd00, len=3D32768, dir=3DDMA_DIRECTION_FROM_DEVICE, access_le=
n=3D32768) at /root/build/qemu/include/sysemu/dma.h:236<br>
#9=C2=A0 0x0000560a91fd763d in dma_blk_unmap (dbs=3D0x560a94d87400) at ../s=
ystem/dma-helpers.c:93<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D 1<br>
#10 0x0000560a91fd76e6 in dma_complete (dbs=3D0x560a94d87400, ret=3D0) at .=
./system/dma-helpers.c:105<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __PRETTY_FUNCTION__ =3D &quot;dma_complete&quot=
;<br>
#11 0x0000560a91fd781c in dma_blk_cb (opaque=3D0x560a94d87400, ret=3D0) at =
../system/dma-helpers.c:129<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dbs =3D 0x560a94d87400<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx =3D 0x560a9448da90<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cur_addr =3D 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cur_len =3D 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem =3D 0x0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __PRETTY_FUNCTION__ =3D &quot;dma_blk_cb&quot;<=
br>
#12 0x0000560a9232e974 in blk_aio_complete (acb=3D0x560a9448d5f0) at ../blo=
ck/block-backend.c:1555<br>
#13 0x0000560a9232ebd1 in blk_aio_read_entry (opaque=3D0x560a9448d5f0) at .=
./block/block-backend.c:1610<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 acb =3D 0x560a9448d5f0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rwco =3D 0x560a9448d618<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 qiov =3D 0x560a94d87460<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __PRETTY_FUNCTION__ =3D &quot;blk_aio_read_entr=
y&quot;<br>
<br>
&gt; &gt; One more thing, regarding this specific patch. I don&#39;t think =
we should<br>
&gt; &gt; clear the<br>
&gt; &gt; entire entry, the next field should be kept, otherwise we&#39;ll =
disconnect<br>
&gt; &gt; following<br>
&gt; &gt; mappings that will never be found again. IIUC, this could very we=
ll be<br>
&gt; &gt; causing the problem you see.<br>
&gt; &gt;<br>
&gt; &gt; Does the following make sense?<br>
&gt; &gt;<br>
&gt; And here without double-freeing entry-&gt;valid_mapping:<br>
&gt; <br>
&gt; diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c<br>
&gt; index 5f23b0adbe..667807b3b6 100644<br>
&gt; --- a/hw/xen/xen-mapcache.c<br>
&gt; +++ b/hw/xen/xen-mapcache.c<br>
&gt; @@ -597,7 +597,13 @@ static void<br>
&gt; xen_invalidate_map_cache_entry_unlocked(MapCache *mc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pentry-&gt;next =3D entry-&gt;next;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(entry);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(entry, 0, sizeof *entry);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Invalidate mapping.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;paddr_index =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;vaddr_base =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;size =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;valid_mapping =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;flags =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Keep entry-&gt;next pointing to the re=
st of the list.=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
<br>
I&#39;ve tried this patch, and that fix the issue I&#39;ve seen. I&#39;ll r=
un more<br>
tests on it, just in case, but there&#39;s no reason that would break<br>
something else.<br>
<br>
Cheers,<br></blockquote><div><br></div><div>Thanks Anthony, I&#39;ll send o=
ut a proper patch tomorrow.</div><div><br></div><div>Cheers,</div><div>Edga=
r=C2=A0</div></div></div>

--000000000000f64895061c3646e5--

