Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80967929154
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2024 08:28:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754598.1163044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPytr-00075V-UC; Sat, 06 Jul 2024 06:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754598.1163044; Sat, 06 Jul 2024 06:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPytr-00072x-Qk; Sat, 06 Jul 2024 06:27:59 +0000
Received: by outflank-mailman (input) for mailman id 754598;
 Sat, 06 Jul 2024 06:27:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymMv=OG=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sPytq-00072r-9o
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2024 06:27:58 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e21b0131-3b60-11ef-bbfb-fd08da9f4363;
 Sat, 06 Jul 2024 08:27:57 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a77d85f7fa3so166317166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2024 23:27:57 -0700 (PDT)
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
X-Inumbo-ID: e21b0131-3b60-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720247276; x=1720852076; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pvIUEf4OGw4szd3dnSi14gEwyaKCg7Ab/IbdT2ipIzg=;
        b=VP7HOSTP0CnHIOM7vxQqNEbJDMRW+ZNkA0SXmA2FccndDDkgsL82c9tdsNKMpCQLKe
         cleHGx31chq1/WlCESNYfvk5uMCUOJXPI5g96ff9ZYCgo+dF9Lm1T39kb4LnqitKcygM
         LzZwDTGoY08Yyo03Oj5ErLNNHhjGTzE4VAagLqd0qjo/Rm4hdRs2Cr463JN69Hd9bw7m
         OlRhlxnlufb4LdhxxwF5e+6pCZONIJxaJbuHIWP/dPgBCMg5+09rN9VDRF2FymbII6cf
         MlmuCimK+vm8UG0tVRz/9oN8GxQ7qLNMfCM9tvzJu/kFxicmv6PTwxugxNJ+NZIP1u7e
         4pvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720247276; x=1720852076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pvIUEf4OGw4szd3dnSi14gEwyaKCg7Ab/IbdT2ipIzg=;
        b=iY5GjuYsYEWm3zwUmDw44Ba86JdqJLEMg/+797Hm75nDxapp3YEW4p9qOQrXvyUsXP
         9aMohrfq7w8wdvIPA7RK4TijyXQdQuOT1akrhi3dWDH5iFg6L9IJTcxS4GH2NpryPcmR
         JWUIZuaWY5DvSSBFvpgDBZ/mg4/vz+ski9FjZPsfYCOvPUZ2cW9c+sHlFOrgmFrAOGQb
         tIRm+h0XT5xX48a+Ee6zeF3nQTncY7gnkDILr+itvLFdM+ncr2xr+Jge8rXBgSvp5GHX
         5/jzArkQFteBYbz5LAzvN77Uqqy0xlCyPfEHqtg4ulK3O0vvCcVwMEeotFCFCXw8FGev
         IiFg==
X-Forwarded-Encrypted: i=1; AJvYcCVSI9WIt/HR1knRPz6nz1sSsZUUCqB7R0siasbUW1PibngZYecMe33pcLqx2eH23Fj3M0/IZww1mQsMhP/zfmEC/HG5iyUz8qVKZdNkoFQ=
X-Gm-Message-State: AOJu0Yx+YjM43D4ou0fPrXPVBoQk3cky0n6tFI5ZvyT2cNVm2l50p3rh
	WiBp0z5SkV3S87ermxtmV2lBLRRO7k4yee5KFck96mxbMptuxCbYd55sRmyyXdFpoLasIT6q++J
	3SrEQY6RtRmuXH4x3qfbXDLxIxKQ=
X-Google-Smtp-Source: AGHT+IHb4euwyMG906Cgc/z+6QFks7kCcEVu5rz8RaCdbkYNp03KGEF87G5qUqigQ1YjyF5U+qdmoA3h1kC1O2PHljE=
X-Received: by 2002:a17:906:c14b:b0:a77:d9b5:ad4b with SMTP id
 a640c23a62f3a-a77d9b5db0cmr282609366b.9.1720247275819; Fri, 05 Jul 2024
 23:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240701224421.1432654-1-edgar.iglesias@gmail.com>
 <20240701224421.1432654-3-edgar.iglesias@gmail.com> <ZoawbAnukIBkYWCw@l14>
 <87wmm1m7i3.fsf@draig.linaro.org> <ZobuhcLHqUEy_bQs@toto>
In-Reply-To: <ZobuhcLHqUEy_bQs@toto>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Sat, 6 Jul 2024 09:27:43 +0300
Message-ID: <CAJy5ezrfbAzwPWg_YABLy5NwCUiNa31FFR1nAZzy-WC3vXrMhg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] xen: mapcache: Fix unmapping of first entries in buckets
To: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, qemu-devel@nongnu.org, sstabellini@kernel.org, 
	paul@xen.org, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000cd1a70061c8e471c"

--000000000000cd1a70061c8e471c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 9:48=E2=80=AFPM Edgar E. Iglesias <edgar.iglesias@am=
d.com>
wrote:

> On Thu, Jul 04, 2024 at 05:44:52PM +0100, Alex Benn=C3=A9e wrote:
> > Anthony PERARD <anthony.perard@vates.tech> writes:
> >
> > > On Tue, Jul 02, 2024 at 12:44:21AM +0200, Edgar E. Iglesias wrote:
> > >> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > >>
> > >> This fixes the clobbering of the entry->next pointer when
> > >> unmapping the first entry in a bucket of a mapcache.
> > >>
> > >> Fixes: 123acd816d ("xen: mapcache: Unmap first entries in buckets")
> > >> Reported-by: Anthony PERARD <anthony.perard@vates.tech>
> > >> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > >> ---
> > >>  hw/xen/xen-mapcache.c | 12 +++++++++++-
> > >>  1 file changed, 11 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> > >> index 5f23b0adbe..18ba7b1d8f 100644
> > >> --- a/hw/xen/xen-mapcache.c
> > >> +++ b/hw/xen/xen-mapcache.c
> > >> @@ -597,7 +597,17 @@ static void
> xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
> > >>          pentry->next =3D entry->next;
> > >>          g_free(entry);
> > >>      } else {
> > >> -        memset(entry, 0, sizeof *entry);
> > >> +        /*
> > >> +         * Invalidate mapping but keep entry->next pointing to the
> rest
> > >> +         * of the list.
> > >> +         *
> > >> +         * Note that lock is already zero here, otherwise we don't
> unmap.
> > >> +         */
> > >> +        entry->paddr_index =3D 0;
> > >> +        entry->vaddr_base =3D NULL;
> > >> +        entry->valid_mapping =3D NULL;
> > >> +        entry->flags =3D 0;
> > >> +        entry->size =3D 0;
> > >
> > > This kind of feels like mc->entry should be an array of pointer rathe=
r
> > > than an array of MapCacheEntry but that seems to work well enough and
> > > not the first time entries are been cleared like that.
> >
> > The use of a hand rolled list is a bit of a concern considering QEMU an=
d
> > Glib both provide various abstractions used around the rest of the code
> > base. The original patch that introduces the mapcache doesn't tell me
> > much about access patterns for the cache, just that it is trying to
> > solve memory exhaustion issues with lots of dynamic small mappings.
> >
> > Maybe a simpler structure is desirable?
> >
> > We also have an interval tree implementation ("qemu/interval-tree.h") i=
f
> > what we really want is a sorted tree of memory that can be iterated
> > locklessly.
> >
>
> Yes, it would be interesting to benchmark other options.
> I agree that we should at minimum reuse existing lists/hash tables.
>
> We've also had some discussions around removing it partially or
> alltogether but
> there are some concerns around that. We're going to need something to
> keep track of grants. For 32-bit hosts, it's a problem to exhaust virtual
> address-space if mapping all of the guest (are folks still using 32-bit
> hosts?).
> There may be other issues aswell.
>
> Some benefits are that we'll remove some of the complexity and latency fo=
r
> mapping
> and unmapping stuff continously.
>
>
One more thing I forgot to add is that IMO, these larger longer term
changes should not block this tiny bugfix...

Cheers,
Edgar

--000000000000cd1a70061c8e471c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jul 4, 2024 at 9:48=E2=80=AFPM Ed=
gar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@amd.com">edgar.iglesia=
s@amd.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Thu, Jul 04, 2024 at 05:44:52PM +010=
0, Alex Benn=C3=A9e wrote:<br>
&gt; Anthony PERARD &lt;anthony.perard@vates.tech&gt; writes:<br>
&gt; <br>
&gt; &gt; On Tue, Jul 02, 2024 at 12:44:21AM +0200, Edgar E. Iglesias wrote=
:<br>
&gt; &gt;&gt; From: &quot;Edgar E. Iglesias&quot; &lt;<a href=3D"mailto:edg=
ar.iglesias@amd.com" target=3D"_blank">edgar.iglesias@amd.com</a>&gt;<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; This fixes the clobbering of the entry-&gt;next pointer when<=
br>
&gt; &gt;&gt; unmapping the first entry in a bucket of a mapcache.<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; Fixes: 123acd816d (&quot;xen: mapcache: Unmap first entries i=
n buckets&quot;)<br>
&gt; &gt;&gt; Reported-by: Anthony PERARD &lt;anthony.perard@vates.tech&gt;=
<br>
&gt; &gt;&gt; Signed-off-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.=
iglesias@amd.com" target=3D"_blank">edgar.iglesias@amd.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 hw/xen/xen-mapcache.c | 12 +++++++++++-<br>
&gt; &gt;&gt;=C2=A0 1 file changed, 11 insertions(+), 1 deletion(-)<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c<br=
>
&gt; &gt;&gt; index 5f23b0adbe..18ba7b1d8f 100644<br>
&gt; &gt;&gt; --- a/hw/xen/xen-mapcache.c<br>
&gt; &gt;&gt; +++ b/hw/xen/xen-mapcache.c<br>
&gt; &gt;&gt; @@ -597,7 +597,17 @@ static void xen_invalidate_map_cache_ent=
ry_unlocked(MapCache *mc,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pentry-&gt;next =3D entry-&=
gt;next;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(entry);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(entry, 0, sizeof *entry);=
<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Invalidate mapping but k=
eep entry-&gt;next pointing to the rest<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* of the list.<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Note that lock is alread=
y zero here, otherwise we don&#39;t unmap.<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;paddr_index =3D 0;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;vaddr_base =3D NULL;<b=
r>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;valid_mapping =3D NULL=
;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;flags =3D 0;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;size =3D 0;<br>
&gt; &gt;<br>
&gt; &gt; This kind of feels like mc-&gt;entry should be an array of pointe=
r rather<br>
&gt; &gt; than an array of MapCacheEntry but that seems to work well enough=
 and<br>
&gt; &gt; not the first time entries are been cleared like that.<br>
&gt; <br>
&gt; The use of a hand rolled list is a bit of a concern considering QEMU a=
nd<br>
&gt; Glib both provide various abstractions used around the rest of the cod=
e<br>
&gt; base. The original patch that introduces the mapcache doesn&#39;t tell=
 me<br>
&gt; much about access patterns for the cache, just that it is trying to<br=
>
&gt; solve memory exhaustion issues with lots of dynamic small mappings.<br=
>
&gt; <br>
&gt; Maybe a simpler structure is desirable?<br>
&gt; <br>
&gt; We also have an interval tree implementation (&quot;qemu/interval-tree=
.h&quot;) if<br>
&gt; what we really want is a sorted tree of memory that can be iterated<br=
>
&gt; locklessly.<br>
&gt; <br>
<br>
Yes, it would be interesting to benchmark other options.<br>
I agree that we should at minimum reuse existing lists/hash tables.<br>
<br>
We&#39;ve also had some discussions around removing it partially or alltoge=
ther but<br>
there are some concerns around that. We&#39;re going to need something to<b=
r>
keep track of grants. For 32-bit hosts, it&#39;s a problem to exhaust virtu=
al<br>
address-space if mapping all of the guest (are folks still using 32-bit hos=
ts?).<br>
There may be other issues aswell.<br>
<br>
Some benefits are that we&#39;ll remove some of the complexity and latency =
for mapping<br>
and unmapping stuff continously.<br><br></blockquote><div><br></div><div>On=
e more thing I forgot to add is that IMO, these larger longer term changes =
should not block this tiny bugfix...</div><div><br></div><div>Cheers,</div>=
<div>Edgar=C2=A0<br></div></div></div>

--000000000000cd1a70061c8e471c--

