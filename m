Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8BD91E292
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 16:35:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751738.1159784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOI7Z-000362-TJ; Mon, 01 Jul 2024 14:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751738.1159784; Mon, 01 Jul 2024 14:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOI7Z-000332-Pr; Mon, 01 Jul 2024 14:35:09 +0000
Received: by outflank-mailman (input) for mailman id 751738;
 Mon, 01 Jul 2024 14:35:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K0KN=OB=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sOI7Y-00032w-EE
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 14:35:08 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c391ace-37b7-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 16:35:06 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a6fe61793e2so152706266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 07:35:06 -0700 (PDT)
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
X-Inumbo-ID: 1c391ace-37b7-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719844506; x=1720449306; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eZww6N4FXnwd+gMZy4Nk8A9I2Qib6HFNI65vtKUOJiY=;
        b=cC9NyvdWzVE+jrYKpHZvB8H8LSxfdbXV7DSyuFaCokz2Bnl7Jh4PbVg40llSCHsZ8a
         SbXEhwjZalwZjqlUKipQk7irI1t25Rb2Rh0BKANeAvu9fwQfJAnTAIpEn++BslsZhfB/
         qkrk6gjFPQeqx4qO8FEbpWDP5wXs53C4HD4eOgNgswU0arOV4Yjkjm4ufpADIHlptFib
         izXQ54ln7FGCBcWrt9aBym44J2onav2NzTRADkkNUOyGWTg6TrWlefx/BNMFJIQN4RDT
         20xXMbrPVH0hnACk/no/hSvOKtaspJsbxR3cJ/EDZJZAwGUtW8Ccr4Yv4rM+WdlMLSah
         2BOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719844506; x=1720449306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZww6N4FXnwd+gMZy4Nk8A9I2Qib6HFNI65vtKUOJiY=;
        b=jGwA87z/t8uos8HAwfcBCbrz28+Ui/MST43/Fhzn94bt05kQ+tobQsGo8uhaEKGfvJ
         4AS/w7uvQ6bCe1zBf5Al+V/BOIoyDMTw5rVhEv7E3N5AhGeSe9kfkOOtD7enD7F1vJsd
         aB5AQDQQe2etMqGcRb36e7ph23+A1Tq2lO8GtcyR7m5uwaEZwkmM1ZFQjFzLUfwgPzl3
         UtyEVZX3ow/xKaxSFLKR3zYFRMi0n+CvKD1pi+DL0XQ74pK7LlsK/kqvR2tshcFCj+2V
         c3Z/jXvbRL46EhVMtnIldqJWVWcQ5SybYv6bgr3SvedxGNtaIk1W7JERoQKK2g4lyljP
         QbGg==
X-Forwarded-Encrypted: i=1; AJvYcCXOTJolgd+/qDZ0Rn1bOblx44mOOGhThmZ1l/WyperI6KSoBYZuyB+Dztr0SZXUwKOiR6LroUTfUkfF8EWx/bBH6u6+ZJqy0Pi5PFd7nsA=
X-Gm-Message-State: AOJu0Ywc631G6j5wbUxJUYHuoGeE9KFkYIB9D2tmixEJ3ICDh9+ZJSEW
	Qr1fRQG/s/06lU3IPBHgKtXU74ofcXjdW2DhkCKy4guWJw90duFlgc4ysbSuxTGTVGctogK5RDC
	q3EW9/qc5XvsBSg6JcZdmnZY5b+g=
X-Google-Smtp-Source: AGHT+IHRLrN6RbgnMhN+GP4BrC6L0LhuTVoWZrJC+PAQoWWAqLNzUu/TDjwQ6ko3aN82hro5kiwQGWdRDG4be7Jle5o=
X-Received: by 2002:a05:6402:1e88:b0:57c:6d89:eaef with SMTP id
 4fb4d7f45d1cf-5879f3ac701mr5577176a12.18.1719844505325; Mon, 01 Jul 2024
 07:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240529140739.1387692-1-edgar.iglesias@gmail.com>
 <20240529140739.1387692-3-edgar.iglesias@gmail.com> <ZoKnQLBwIwh004yy@l14>
 <CAJy5ezqdxQ_y_sCyP243yTfgOJfLh1COzN9Eg+PxxoaVeOh-mQ@mail.gmail.com> <CAJy5ezrSs8r=ibTgb_oURdFTDW07sVVBeU6Rw7jsM+iaqPLNgg@mail.gmail.com>
In-Reply-To: <CAJy5ezrSs8r=ibTgb_oURdFTDW07sVVBeU6Rw7jsM+iaqPLNgg@mail.gmail.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 1 Jul 2024 16:34:53 +0200
Message-ID: <CAJy5ezrPgUR3-gWK3Mfnc7iAgV3MEStSardY+0kkvHB+PHbe4w@mail.gmail.com>
Subject: Re: [PATCH v8 2/8] xen: mapcache: Unmap first entries in buckets
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000cf1678061c30803d"

--000000000000cf1678061c30803d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 4:30=E2=80=AFPM Edgar E. Iglesias <edgar.iglesias@gm=
ail.com>
wrote:

>
>
> On Mon, Jul 1, 2024 at 3:58=E2=80=AFPM Edgar E. Iglesias <edgar.iglesias@=
gmail.com>
> wrote:
>
>> On Mon, Jul 1, 2024 at 2:55=E2=80=AFPM Anthony PERARD <anthony.perard@va=
tes.tech>
>> wrote:
>>
>>> Hi all,
>>>
>>> Following this commit, a test which install Debian in a guest with OVMF
>>> as firmware started to fail. QEMU exit with an error when GRUB is
>>> running on the freshly installed Debian (I don't know if GRUB is
>>> starting Linux or not).
>>> The error is:
>>>     Bad ram offset ffffffffffffffff
>>>
>>> Some logs:
>>>
>>> http://logs.test-lab.xenproject.org/osstest/logs/186611/test-amd64-amd6=
4-xl-qemuu-ovmf-amd64/info.html
>>>
>>> Any idea? Something is trying to do something with the address "-1" whe=
n
>>> it shouldn't?
>>>
>>>
>> Hi Anothny,
>>
>> Yes, it looks like something is calling qemu_get_ram_block() on somethin=
g
>> that isn't mapped.
>> One possible path is in qemu_ram_block_from_host() but there may be
>> others.
>>
>> The following patch may help.
>> Any chance you could try to get a backtrace from QEMU when it failed?
>>
>> diff --git a/system/physmem.c b/system/physmem.c
>> index 33d09f7571..2669c4dbbb 100644
>> --- a/system/physmem.c
>> +++ b/system/physmem.c
>> @@ -2277,6 +2277,9 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, bool
>> round_offset,
>>          ram_addr_t ram_addr;
>>          RCU_READ_LOCK_GUARD();
>>          ram_addr =3D xen_ram_addr_from_mapcache(ptr);
>> +        if (ram_addr =3D=3D RAM_ADDR_INVALID) {
>> +            return NULL;
>> +        }
>>          block =3D qemu_get_ram_block(ram_addr);
>>          if (block) {
>>              *offset =3D ram_addr - block->offset;
>>
>>
>>
> One more thing, regarding this specific patch. I don't think we should
> clear the
> entire entry, the next field should be kept, otherwise we'll disconnect
> following
> mappings that will never be found again. IIUC, this could very well be
> causing the problem you see.
>
> Does the following make sense?
>
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index 5f23b0adbe..e9df53c19d 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -597,7 +597,14 @@ static void
> xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
>          pentry->next =3D entry->next;
>          g_free(entry);
>      } else {
> -        memset(entry, 0, sizeof *entry);
> +        /* Invalidate mapping.  */
> +        entry->paddr_index =3D 0;
> +        entry->vaddr_base =3D NULL;
> +        entry->size =3D 0;
> +        g_free(entry->valid_mapping);
> +        entry->valid_mapping =3D NULL;
> +        entry->flags =3D 0;
> +        /* Keep entry->next pointing to the rest of the list.  */
>      }
>  }
>
>
>

And here without double-freeing entry->valid_mapping:

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 5f23b0adbe..667807b3b6 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -597,7 +597,13 @@ static void
xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
         pentry->next =3D entry->next;
         g_free(entry);
     } else {
-        memset(entry, 0, sizeof *entry);
+        /* Invalidate mapping.  */
+        entry->paddr_index =3D 0;
+        entry->vaddr_base =3D NULL;
+        entry->size =3D 0;
+        entry->valid_mapping =3D NULL;
+        entry->flags =3D 0;
+        /* Keep entry->next pointing to the rest of the list.  */
     }
 }

--000000000000cf1678061c30803d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 1, 2024 at 4:30=E2=80=AFP=
M Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@gmail.com">edgar.i=
glesias@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 1, 2024 =
at 3:58=E2=80=AFPM Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@g=
mail.com" target=3D"_blank">edgar.iglesias@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div d=
ir=3D"ltr">On Mon, Jul 1, 2024 at 2:55=E2=80=AFPM Anthony PERARD &lt;anthon=
y.perard@vates.tech&gt; wrote:<br></div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hi all,<br>
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
iv><div><br></div></div></div></blockquote><div><br></div><div>One more thi=
ng, regarding this specific patch. I don&#39;t think we should clear the</d=
iv><div>entire entry, the next field should be kept, otherwise we&#39;ll di=
sconnect following</div><div>mappings that will never be found again. IIUC,=
 this could very well be causing the problem you see.</div><div><br></div><=
div>Does the following make sense?</div><div class=3D"gmail_quote"><br></di=
v>diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c<br>index 5f23b=
0adbe..e9df53c19d 100644<br>--- a/hw/xen/xen-mapcache.c<br>+++ b/hw/xen/xen=
-mapcache.c<br>@@ -597,7 +597,14 @@ static void xen_invalidate_map_cache_en=
try_unlocked(MapCache *mc,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pentry-&gt;=
next =3D entry-&gt;next;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(entry)=
;<br>=C2=A0 =C2=A0 =C2=A0} else {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(en=
try, 0, sizeof *entry);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Invalidate mappi=
ng. =C2=A0*/<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt;paddr_index =3D 0;<b=
r>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt;vaddr_base =3D NULL;<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0entry-&gt;size =3D 0;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0g=
_free(entry-&gt;valid_mapping);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt;v=
alid_mapping =3D NULL;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt;flags =3D =
0;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Keep entry-&gt;next pointing to the r=
est of the list. =C2=A0*/<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0}<br><div>=C2=
=A0<br></div><div><br></div></div></div></blockquote><div><br></div><div><b=
r></div><div>And here without double-freeing entry-&gt;valid_mapping:</div>=
<div><br></div><div>diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcach=
e.c<br>index 5f23b0adbe..667807b3b6 100644<br>--- a/hw/xen/xen-mapcache.c<b=
r>+++ b/hw/xen/xen-mapcache.c<br>@@ -597,7 +597,13 @@ static void xen_inval=
idate_map_cache_entry_unlocked(MapCache *mc,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pentry-&gt;next =3D entry-&gt;next;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0g_free(entry);<br>=C2=A0 =C2=A0 =C2=A0} else {<br>- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0memset(entry, 0, sizeof *entry);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* Invalidate mapping. =C2=A0*/<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt;p=
addr_index =3D 0;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt;vaddr_base =3D =
NULL;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt;size =3D 0;<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0entry-&gt;valid_mapping =3D NULL;<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0entry-&gt;flags =3D 0;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Keep en=
try-&gt;next pointing to the rest of the list. =C2=A0*/<br>=C2=A0 =C2=A0 =
=C2=A0}<br>=C2=A0}</div><div><br></div></div></div>

--000000000000cf1678061c30803d--

