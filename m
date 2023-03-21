Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC076C324F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 14:08:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512622.792641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pebiv-0000ur-3c; Tue, 21 Mar 2023 13:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512622.792641; Tue, 21 Mar 2023 13:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pebiu-0000rg-Vt; Tue, 21 Mar 2023 13:08:20 +0000
Received: by outflank-mailman (input) for mailman id 512622;
 Tue, 21 Mar 2023 13:08:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FZzN=7N=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1pebit-0000rU-CG
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 13:08:19 +0000
Received: from so254-35.mailgun.net (so254-35.mailgun.net [198.61.254.35])
 by se1-gles-flk1.inumbo.com (Halon) with UTF8SMTPS
 id 710fbd5c-c7e9-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 14:08:16 +0100 (CET)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177]) by
 88001cc23a1c with SMTP id 6419ac3e061a559e845abd7d (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Tue, 21 Mar 2023 13:08:14 GMT
Received: by mail-yb1-f177.google.com with SMTP id y5so16997754ybu.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Mar 2023 06:08:14 -0700 (PDT)
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
X-Inumbo-ID: 710fbd5c-c7e9-11ed-b464-930f4c7d94ae
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1679404094; x=1679411294; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=C76n9MzvuFEiEuZhT6ZAcEqNaf6oKUJutM+tFNJKj90=;
 b=Gh6Ry2qaQM7gm67UxLxC8juK4sLARCoVvsathWCbPRxtuurF8tlrczgtnUfH2z8ObfQp6fp0y3BvdSQaH1vNLCvCdzJV2f6MUHLPE9xw+kXWy+RUzDxwCdnqbO9hVjgHc7p1ij9B6uo7z3hPVLvQft/gfJIJksa615rPaR851tmIylUfpVOSVpLTpf3HfN+7Sd6e3CUd14yyYz17UO4/Cc/uODaod6JDU4ZdlpMDApVo7WkPgjEy1uxrPUyg2ogGvb0AY3U5AEzRAeNDJADb08DMbX132Y4OOspQR/W1MFMoKHnqk5XEw9UGtrn4CTVKZobSNZNJ2hy39MJsdKO3/Q==
X-Mailgun-Sending-Ip: 198.61.254.35
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AAQBX9fQ9h5pnUDm7Rg4MoD35Ps63heeHZih9jC4oH5FLbzwFmcpR4pQ
	Fffh3nYc6KzcrFs5cxR5y7gHyMWE+C8ygmq39Zk=
X-Google-Smtp-Source: AKy350Zs5bxYRV3+naK4t19NxKzg/7whL0BXfNUZcnW4yap2r/O7pcjH/2kUYsqNGK0cj96HDCTAL3YvvfQw0pZ15VE=
X-Received: by 2002:a05:6902:102e:b0:b47:9e93:47a0 with SMTP id
 x14-20020a056902102e00b00b479e9347a0mr1460849ybt.6.1679404094509; Tue, 21 Mar
 2023 06:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <e047a7a7-2e45-48de-2cb4-69001e95e1a8@list.ru> <CABfawhncTLzRvHYF3SyhdidfobP9PB3YOZ9oTjRREjKs07KtXQ@mail.gmail.com>
 <c5ea0f53-8cc9-509e-6c82-deea00f1ed74@list.ru> <CABfawhnRmGwB4VTx2i9Wg2c8dfyKqU5zM6MnWsMHBOfXA43+qA@mail.gmail.com>
 <d6c137a1-4662-68ef-1ed4-8e9355e0290c@list.ru>
In-Reply-To: <d6c137a1-4662-68ef-1ed4-8e9355e0290c@list.ru>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 21 Mar 2023 09:07:37 -0400
X-Gmail-Original-Message-ID: <CABfawhkbEkLOpQE6ZquAW5FnOmH7j-B+CCSUaYuDtM2_VKoXpg@mail.gmail.com>
Message-ID: <CABfawhkbEkLOpQE6ZquAW5FnOmH7j-B+CCSUaYuDtM2_VKoXpg@mail.gmail.com>
Subject: Re: [XEN PATCH v1 1/1] x86/domctl: add gva_to_gfn command
To: =?UTF-8?B?0JrQvtCy0LDQu9GR0LIg0KHQtdGA0LPQtdC5?= <valor@list.ru>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Dmitry Isaykin <isaikin-dmitry@yandex.ru>
Content-Type: multipart/alternative; boundary="0000000000007cda4105f768bcb8"

--0000000000007cda4105f768bcb8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 3:49=E2=80=AFAM =D0=9A=D0=BE=D0=B2=D0=B0=D0=BB=D1=
=91=D0=B2 =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 <valor@list.ru> wrote:
>
>
>
> 21.03.2023 2:34, Tamas K Lengyel =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >
> >
> > On Mon, Mar 20, 2023 at 3:23=E2=80=AFPM =D0=9A=D0=BE=D0=B2=D0=B0=D0=BB=
=D1=91=D0=B2 =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 <valor@list.ru
> > <mailto:valor@list.ru>> wrote:
> >  >
> >  >
> >  >
> >  > 21.03.2023 1:51, Tamas K Lengyel wrote:
> >  > >
> >  > >
> >  > > On Mon, Mar 20, 2023 at 12:32=E2=80=AFPM =D0=9A=D0=BE=D0=B2=D0=B0=
=D0=BB=D1=91=D0=B2 =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 <valor@list.ru
> > <mailto:valor@list.ru>
> >  > > <mailto:valor@list.ru <mailto:valor@list.ru>>> wrote:
> >  > >  >
> >  > >  > gva_to_gfn command used for fast address translation in LibVMI
> > project.
> >  > >  > With such a command it is possible to perform address
translation in
> >  > >  > single call instead of series of queries to get every page
table.
> >  > >
> >  > > You have a couple assumptions here:
> >  > >   - Xen will always have a direct map of the entire guest memory -
> > there
> >  > > are already plans to move away from that. Without that this
approach
> >  > > won't have any advantage over doing the same mapping by LibVMI
> >  >
> >  > Thanks! I didn't know about the plan. Though I use this patch
> >  > back ported into 4.16.
> >  >
> >  > >   - LibVMI has to map every page for each page table for every
lookup -
> >  > > you have to do that only for the first, afterwards the pages on
which
> >  > > the pagetable is are kept in a cache and subsequent lookups would
be
> >  > > actually faster then having to do this domctl since you can keep
being
> >  > > in the same process instead of having to jump to Xen.
> >  >
> >  > Yes. I know about the page cache. But I have faced with several
issues
> >  > with cache like this one https://github.com/libvmi/libvmi/pull/1058
> > <https://github.com/libvmi/libvmi/pull/1058> .
> >  > So I had to disable the cache.
> >
> > The issue you linked to is an issue with a stale v2p cache, which is a
> > virtual TLB. The cache I talked about is the page cache, which is just
> > maintaining a list of the pages that were accessed by LibVMI for future
> > accesses. You can have one and not the other (ie. ./configure
> > --disable-address-cache --enable-page-cache).
> >
> > Tamas
>
> Thanks. I know about the page cache. Though I'm not familiar with
> it close enough.
>
> As far as I understand at the time the page cache implementation in
> LibVMI looks like this:
> 1. Call sequence: vmi_read > vmi_read_page > driver_read_page >
>     xen_read_page > memory_cache_insert ..> get_memory_data >
>     xen_get_memory > xen_get_memory_pfn > xc_map_foreign_range
> 2. This is perfectly valid while guest OS keeps page there. And
>     physical pages are always there.
> 3. To renew cache the "age_limit" counter is used.
> 4. In Xen driver implementation in LibVMI the "age_limit" is
>     disabled.
> 5. Also it is possible to invalidate cache with "xen_write" or
>     "vmi_pagecache_flush". But it is not used.
> 6. Other way to avoid too big cache is cache size limit. So on
>     every insert half of the cache is dropped on size overflow.
>
> So the only thing we should know is valid mapping of guest
> virtual address to guest physical address.
>
> And the slow paths are:
> 1. A first traversal of new page table set. E.g. for the new process.
> 2. Or new subset of page tables for known process.
> 3. Subsequent page access after cache clean on size overflow.
>
> Am I right?
>
> The main idea behind the patch:
> 1. For the very first time it would be done faster with hypercall.
> 2. For subsequent calls v2p translation cache could be used (used in
>     my current work in LibVMI).
> 3. To avoid errors with stale cache v2p cache could be invalidated
>     on every event (VMI_FLUSH_RATE =3D 1).

If you set a flush rate to 1 then you would effectively run without any
caching between events. It will still be costly. Yes, you save some
performance on having to map the pages because Xen already has them but
overall this is still a subpar solution.

IMHO you are not addressing the real issue, which is just the lack of hooks
into the OS that would tell you when the v2p cache actually needs to be
invalidated. The OS does TLB maintenance already when it updates its
pagetables. If you wrote logic to hook into that, you wouldn't have to
disable the caches or run with flush rate =3D 1. On the DRAKVUF side this h=
as
been a TODO for a long time
https://github.com/tklengyel/drakvuf/blob/df2d274dfe349bbdacdb121229707f6c9=
1449b38/src/libdrakvuf/private.h#L140.
If you had those hooks into the TLB maintenance logic you could just use
the existing page-cache and be done with it. Yes, the very first access may
still be slower than the hypercall but I doubt it would be noticeable in
the long run.

Tamas

--0000000000007cda4105f768bcb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Tue, Mar 21, 2023 at 3:49=E2=80=AFAM =D0=9A=D0=
=BE=D0=B2=D0=B0=D0=BB=D1=91=D0=B2 =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 &lt;=
<a href=3D"mailto:valor@list.ru">valor@list.ru</a>&gt; wrote:<br>&gt;<br>&g=
t;<br>&gt;<br>&gt; 21.03.2023 2:34, Tamas K Lengyel =D0=BF=D0=B8=D1=88=D0=
=B5=D1=82:<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; On Mon, Mar 20, 2023 at 3=
:23=E2=80=AFPM =D0=9A=D0=BE=D0=B2=D0=B0=D0=BB=D1=91=D0=B2 =D0=A1=D0=B5=D1=
=80=D0=B3=D0=B5=D0=B9 &lt;<a href=3D"mailto:valor@list.ru">valor@list.ru</a=
><br>&gt; &gt; &lt;mailto:<a href=3D"mailto:valor@list.ru">valor@list.ru</a=
>&gt;&gt; wrote:<br>&gt; &gt; =C2=A0&gt;<br>&gt; &gt; =C2=A0&gt;<br>&gt; &g=
t; =C2=A0&gt;<br>&gt; &gt; =C2=A0&gt; 21.03.2023 1:51, Tamas K Lengyel wrot=
e:<br>&gt; &gt; =C2=A0&gt; &gt;<br>&gt; &gt; =C2=A0&gt; &gt;<br>&gt; &gt; =
=C2=A0&gt; &gt; On Mon, Mar 20, 2023 at 12:32=E2=80=AFPM =D0=9A=D0=BE=D0=B2=
=D0=B0=D0=BB=D1=91=D0=B2 =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 &lt;<a href=
=3D"mailto:valor@list.ru">valor@list.ru</a><br>&gt; &gt; &lt;mailto:<a href=
=3D"mailto:valor@list.ru">valor@list.ru</a>&gt;<br>&gt; &gt; =C2=A0&gt; &gt=
; &lt;mailto:<a href=3D"mailto:valor@list.ru">valor@list.ru</a> &lt;mailto:=
<a href=3D"mailto:valor@list.ru">valor@list.ru</a>&gt;&gt;&gt; wrote:<br>&g=
t; &gt; =C2=A0&gt; &gt; =C2=A0&gt;<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; =
gva_to_gfn command used for fast address translation in LibVMI<br>&gt; &gt;=
 project.<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; With such a command it is=
 possible to perform address translation in<br>&gt; &gt; =C2=A0&gt; &gt; =
=C2=A0&gt; single call instead of series of queries to get every page table=
.<br>&gt; &gt; =C2=A0&gt; &gt;<br>&gt; &gt; =C2=A0&gt; &gt; You have a coup=
le assumptions here:<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0 - Xen will always =
have a direct map of the entire guest memory -<br>&gt; &gt; there<br>&gt; &=
gt; =C2=A0&gt; &gt; are already plans to move away from that. Without that =
this approach<br>&gt; &gt; =C2=A0&gt; &gt; won&#39;t have any advantage ove=
r doing the same mapping by LibVMI<br>&gt; &gt; =C2=A0&gt;<br>&gt; &gt; =C2=
=A0&gt; Thanks! I didn&#39;t know about the plan. Though I use this patch<b=
r>&gt; &gt; =C2=A0&gt; back ported into 4.16.<br>&gt; &gt; =C2=A0&gt;<br>&g=
t; &gt; =C2=A0&gt; &gt; =C2=A0 - LibVMI has to map every page for each page=
 table for every lookup -<br>&gt; &gt; =C2=A0&gt; &gt; you have to do that =
only for the first, afterwards the pages on which<br>&gt; &gt; =C2=A0&gt; &=
gt; the pagetable is are kept in a cache and subsequent lookups would be<br=
>&gt; &gt; =C2=A0&gt; &gt; actually faster then having to do this domctl si=
nce you can keep being<br>&gt; &gt; =C2=A0&gt; &gt; in the same process ins=
tead of having to jump to Xen.<br>&gt; &gt; =C2=A0&gt;<br>&gt; &gt; =C2=A0&=
gt; Yes. I know about the page cache. But I have faced with several issues<=
br>&gt; &gt; =C2=A0&gt; with cache like this one <a href=3D"https://github.=
com/libvmi/libvmi/pull/1058">https://github.com/libvmi/libvmi/pull/1058</a>=
<br>&gt; &gt; &lt;<a href=3D"https://github.com/libvmi/libvmi/pull/1058">ht=
tps://github.com/libvmi/libvmi/pull/1058</a>&gt; .<br>&gt; &gt; =C2=A0&gt; =
So I had to disable the cache.<br>&gt; &gt;<br>&gt; &gt; The issue you link=
ed to is an issue with a stale v2p cache, which is a<br>&gt; &gt; virtual T=
LB. The cache I talked about is the page cache, which is just<br>&gt; &gt; =
maintaining a list of the pages that were accessed by LibVMI for future<br>=
&gt; &gt; accesses. You can have one and not the other (ie. ./configure <br=
>&gt; &gt; --disable-address-cache --enable-page-cache).<br>&gt; &gt;<br>&g=
t; &gt; Tamas<br>&gt;<br>&gt; Thanks. I know about the page cache. Though I=
&#39;m not familiar with<br>&gt; it close enough.<br>&gt;<br>&gt; As far as=
 I understand at the time the page cache implementation in<br>&gt; LibVMI l=
ooks like this:<br>&gt; 1. Call sequence: vmi_read &gt; vmi_read_page &gt; =
driver_read_page &gt;<br>&gt; =C2=A0 =C2=A0 xen_read_page &gt; memory_cache=
_insert ..&gt; get_memory_data &gt;<br>&gt; =C2=A0 =C2=A0 xen_get_memory &g=
t; xen_get_memory_pfn &gt; xc_map_foreign_range<br>&gt; 2. This is perfectl=
y valid while guest OS keeps page there. And<br>&gt; =C2=A0 =C2=A0 physical=
 pages are always there.<br>&gt; 3. To renew cache the &quot;age_limit&quot=
; counter is used.<br>&gt; 4. In Xen driver implementation in LibVMI the &q=
uot;age_limit&quot; is<br>&gt; =C2=A0 =C2=A0 disabled.<br>&gt; 5. Also it i=
s possible to invalidate cache with &quot;xen_write&quot; or<br>&gt; =C2=A0=
 =C2=A0 &quot;vmi_pagecache_flush&quot;. But it is not used.<br>&gt; 6. Oth=
er way to avoid too big cache is cache size limit. So on<br><div>&gt; =C2=
=A0 =C2=A0 every insert half of the cache is dropped on size overflow.</div=
>&gt;<br>&gt; So the only thing we should know is valid mapping of guest<br=
>&gt; virtual address to guest physical address.<br>&gt;<br>&gt; And the sl=
ow paths are:<br>&gt; 1. A first traversal of new page table set. E.g. for =
the new process.<br>&gt; 2. Or new subset of page tables for known process.=
<br>&gt; 3. Subsequent page access after cache clean on size overflow.<br>&=
gt;<br>&gt; Am I right?<br>&gt;<br>&gt; The main idea behind the patch:<br>=
&gt; 1. For the very first time it would be done faster with hypercall.<br>=
&gt; 2. For subsequent calls v2p translation cache could be used (used in<b=
r>&gt; =C2=A0 =C2=A0 my current work in LibVMI).<br>&gt; 3. To avoid errors=
 with stale cache v2p cache could be invalidated<br>&gt; =C2=A0 =C2=A0 on e=
very event (VMI_FLUSH_RATE =3D 1).<br><div><br></div><div>If you set a flus=
h rate to 1 then you would effectively run without any caching between even=
ts. It will still be costly. Yes, you save some performance on having to ma=
p the pages because Xen already has them but overall this is still a subpar=
 solution.<br></div><div><br></div><div>IMHO you are not addressing the rea=
l issue, which is just the lack of hooks into the OS that would tell you wh=
en the v2p cache actually needs to be invalidated. The OS does TLB maintena=
nce already when it updates its pagetables. If you wrote logic to hook into=
 that, you wouldn&#39;t have to disable the caches or run with flush rate =
=3D 1. On the DRAKVUF side this has been a TODO for a long time <a href=3D"=
https://github.com/tklengyel/drakvuf/blob/df2d274dfe349bbdacdb121229707f6c9=
1449b38/src/libdrakvuf/private.h#L140">https://github.com/tklengyel/drakvuf=
/blob/df2d274dfe349bbdacdb121229707f6c91449b38/src/libdrakvuf/private.h#L14=
0</a>. If you had those hooks into the TLB maintenance logic you could just=
 use the existing page-cache and be done with it. Yes, the very first acces=
s may still be slower than the hypercall but I doubt it would be noticeable=
 in the long run.<br></div><div><br></div><div>Tamas<br></div></div>

--0000000000007cda4105f768bcb8--

