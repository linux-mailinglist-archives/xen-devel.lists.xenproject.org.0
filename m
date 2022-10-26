Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DACA60E980
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 21:47:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430771.682832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onmMt-0006Ms-So; Wed, 26 Oct 2022 19:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430771.682832; Wed, 26 Oct 2022 19:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onmMt-0006Jg-Pw; Wed, 26 Oct 2022 19:47:15 +0000
Received: by outflank-mailman (input) for mailman id 430771;
 Wed, 26 Oct 2022 19:47:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/Fg=23=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1onmMs-0006Ja-8r
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 19:47:14 +0000
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [2607:f8b0:4864:20::b2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc2c635e-5566-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 21:47:13 +0200 (CEST)
Received: by mail-yb1-xb2e.google.com with SMTP id o70so20355850yba.7
 for <xen-devel@lists.xenproject.org>; Wed, 26 Oct 2022 12:47:13 -0700 (PDT)
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
X-Inumbo-ID: fc2c635e-5566-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zteI1mSUj99/cE/1wEWV/kzRX00FnSv5Ujgd6O8BuH8=;
        b=k9gsSCdGL7Dv+x+5gfxA0A3xJv8jfPwexUdm6CPij1pGVY3msuk6YJ5dNpDlvNVaWz
         2dmTOtYjlJ61AoyoREbg2EiE8aqnIlJeoPaHhVG1vM0UWa53DrP5oEkCovHxQJqwQeDF
         jPqKLBJc0glFVF0Vg13wpPd4z6Dyw+aGZaVAhMrUiDJKopQL543i1ZRRicBYQ3egSKiD
         x24fHQvcvrG+b8QgrLXvQY4zL80F9bwNSbh9HAkrgISbxA3OnQB1/tBqueBOvy+vo+Xs
         fFz+5R9FNSH0VhPtaghWKEwpDItosPpxOeFUlI1JcuYq/8sP0hoDg2iSegFYkaFMr7NJ
         7p6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zteI1mSUj99/cE/1wEWV/kzRX00FnSv5Ujgd6O8BuH8=;
        b=lCsiCIEDfu8UGzzKdSpuH/5yQPBVZNGTQRPfIU+i/g5/pTrRtWGV8Ad4a6LA/rFGnT
         p9cmmU0BZwDwUaSOhPYjm/yTWwGEhn7Gr6MZFwl4AAz7uKP4QgNabrS2KI5ELpMtKBZx
         aNJkbBWWwbavJooikWK4gzVBLOkKAMiVwQROOSaTHAhjwvDAnAOJrrHKolArQsveNaFE
         +3yhBpd7SqAEulOQiizqJ7h5sw7BtbwP2xNOzo8mL3ZDjI4DOl297Je0hA/f9UjZ624/
         XN4Tz6XZygH0XB72xMA7hFfJBKKutYMDPAb/CBYh77LizB+9aBYf4YcU5jYzUNAxo9NW
         OYZQ==
X-Gm-Message-State: ACrzQf1Za5BPHQYQfAAQUgElNGsg3l+viVpCRcv0hWHm+DvYGn0T7WnN
	/0/GshokZC1Ng5bcO0qVsXbHPqryqLQSjP47hhY=
X-Google-Smtp-Source: AMsMyM6ssoal9uC9vpRfcH7lKXJezgHbNHk2N+NKYqCpcVt1+DKkUWATrRNurjSK7ujICg5PXUv0MtdoRctkX+5+QlY=
X-Received: by 2002:a5b:845:0:b0:683:6ed7:b3b6 with SMTP id
 v5-20020a5b0845000000b006836ed7b3b6mr40653150ybq.183.1666813631872; Wed, 26
 Oct 2022 12:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <854cdedcdd2bfff08ea45a3c13367c610d710aaf.1666630317.git.tamas.lengyel@intel.com>
 <0c7ca888-3142-1719-13c2-4f006ecdf683@citrix.com> <CABfawh=RXrPgj+MA-4QGogM0o3Oo4GEJ3ipbqHKE0TV4GHdCTg@mail.gmail.com>
 <f5673a0a-853e-fa2c-2f4c-e76b7b7aba87@suse.com> <CABfawhmjcv0mu4cqjTaOPxgrOuMQ5VyAA1OoNtOmr6g34a6Ezw@mail.gmail.com>
 <b4a7f3a4-1685-a14b-4800-2d1277a26a07@suse.com>
In-Reply-To: <b4a7f3a4-1685-a14b-4800-2d1277a26a07@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 26 Oct 2022 15:46:35 -0400
Message-ID: <CABfawhnPxXVMXshALk7Ee+drhU0o8pD2rJ6g6uY85wQw35sWEA@mail.gmail.com>
Subject: Re: [PATCH] xen/x86: Make XEN_DOMCTL_get_vcpu_msrs more configurable
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Roger Pau Monne <roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000006f44e305ebf54a2c"

--0000000000006f44e305ebf54a2c
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 26, 2022 at 8:22 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 26.10.2022 13:58, Tamas K Lengyel wrote:
> > On Wed, Oct 26, 2022, 7:48 AM Jan Beulich <jbeulich@suse.com> wrote:
> >
> >> On 26.10.2022 13:34, Tamas K Lengyel wrote:
> >>> On Wed, Oct 26, 2022, 7:06 AM Andrew Cooper <Andrew.Cooper3@citrix.com
>
> >>> wrote:
> >>>
> >>>> On 24/10/2022 17:58, Tamas K Lengyel wrote:
> >>>>> Currently the XEN_DOMCTL_get_vcpu_msrs is only capable of gathering
a
> >>>> handful
> >>>>> of predetermined vcpu MSRs. In our use-case gathering the vPMU MSRs
by
> >> an
> >>>>> external privileged tool is necessary, thus we extend the domctl to
> >>>> allow for
> >>>>> querying for any guest MSRs. To remain compatible with the existing
> >>>> setup if
> >>>>> no specific MSR is requested via the domctl the default list is
> >> returned.
> >>>>>
> >>>>> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> >>>>
> >>>> Naming aside, XEN_DOMCTL_{get,set}_vcpu_msrs is supposed to be "get
me
> >>>> all MSRs needed to migrate a vCPU".  (I do intend to retire the
> >>>> hypercall as part of fixing the Xen side of migration, but that's
ages
> >>>> away)
> >>>>
> >>>> It seems like what you want is something more like
> >>>> XEN_DOMCTL_{rd,wr}msr_list  (convenient timing, given the recent ISE
> >>>> update).  I think those would be better as a separate pair of
> >>>> hypercalls, rather than trying to repurpose an existing hypercall.
> >>>>
> >>>>
> >>>> As for actually getting the values, please fix up guest_{rd,wr}msr()
to
> >>>> access the perf MSRs safely.  I know the vpmu MSR handling is in a
> >>>> tragic state, but this new get_msr subop is making the problem even
more
> >>>> tangled.
> >>>>
> >>>
> >>> Adding a separate hypercall is fine.
> >>
> >> Which will then also avoid altering the behavior of the existing
hypercall:
> >> You can't just assume e.g. input fields to be zeroed (or otherwise
> >> suitably set) by existing callers, when those were previously output
only.
> >>
> >
> > I did add a memset to zero it on the single caller I could find.
>
> Some may deem this sufficient on the assumption that all users should
> go through the libxenguest function. But then at the minimum you want
> to update documentation in the public header. Yet then this wasn't
> the only issue I spotted (hence the use of "e.g.") - you also alter
> documented behavior as to the returned number of MSRs when the input
> value was too small, if I'm not mistaken.

No, there shouldn't have been any alteration of the previous behavior other
than assuming the buffer sent by the toolstack is zero initialized when the
default list is requested. Either way, adding the separate hypercall is
fine by me.

Tamas

--0000000000006f44e305ebf54a2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, Oct 26, 2022 at 8:22 AM Jan Beulich &lt;<a=
 href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br>&gt;=
<br>&gt; On 26.10.2022 13:58, Tamas K Lengyel wrote:<br>&gt; &gt; On Wed, O=
ct 26, 2022, 7:48 AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">j=
beulich@suse.com</a>&gt; wrote:<br>&gt; &gt;<br>&gt; &gt;&gt; On 26.10.2022=
 13:34, Tamas K Lengyel wrote:<br>&gt; &gt;&gt;&gt; On Wed, Oct 26, 2022, 7=
:06 AM Andrew Cooper &lt;<a href=3D"mailto:Andrew.Cooper3@citrix.com">Andre=
w.Cooper3@citrix.com</a>&gt;<br>&gt; &gt;&gt;&gt; wrote:<br>&gt; &gt;&gt;&g=
t;<br>&gt; &gt;&gt;&gt;&gt; On 24/10/2022 17:58, Tamas K Lengyel wrote:<br>=
&gt; &gt;&gt;&gt;&gt;&gt; Currently the XEN_DOMCTL_get_vcpu_msrs is only ca=
pable of gathering a<br>&gt; &gt;&gt;&gt;&gt; handful<br>&gt; &gt;&gt;&gt;&=
gt;&gt; of predetermined vcpu MSRs. In our use-case gathering the vPMU MSRs=
 by<br>&gt; &gt;&gt; an<br>&gt; &gt;&gt;&gt;&gt;&gt; external privileged to=
ol is necessary, thus we extend the domctl to<br>&gt; &gt;&gt;&gt;&gt; allo=
w for<br>&gt; &gt;&gt;&gt;&gt;&gt; querying for any guest MSRs. To remain c=
ompatible with the existing<br>&gt; &gt;&gt;&gt;&gt; setup if<br>&gt; &gt;&=
gt;&gt;&gt;&gt; no specific MSR is requested via the domctl the default lis=
t is<br>&gt; &gt;&gt; returned.<br>&gt; &gt;&gt;&gt;&gt;&gt;<br>&gt; &gt;&g=
t;&gt;&gt;&gt; Signed-off-by: Tamas K Lengyel &lt;<a href=3D"mailto:tamas.l=
engyel@intel.com">tamas.lengyel@intel.com</a>&gt;<br>&gt; &gt;&gt;&gt;&gt;<=
br>&gt; &gt;&gt;&gt;&gt; Naming aside, XEN_DOMCTL_{get,set}_vcpu_msrs is su=
pposed to be &quot;get me<br>&gt; &gt;&gt;&gt;&gt; all MSRs needed to migra=
te a vCPU&quot;. =C2=A0(I do intend to retire the<br>&gt; &gt;&gt;&gt;&gt; =
hypercall as part of fixing the Xen side of migration, but that&#39;s ages<=
br>&gt; &gt;&gt;&gt;&gt; away)<br>&gt; &gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt=
;&gt; It seems like what you want is something more like<br>&gt; &gt;&gt;&g=
t;&gt; XEN_DOMCTL_{rd,wr}msr_list =C2=A0(convenient timing, given the recen=
t ISE<br>&gt; &gt;&gt;&gt;&gt; update).=C2=A0 I think those would be better=
 as a separate pair of<br>&gt; &gt;&gt;&gt;&gt; hypercalls, rather than try=
ing to repurpose an existing hypercall.<br>&gt; &gt;&gt;&gt;&gt;<br>&gt; &g=
t;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt; As for actually getting the values,=
 please fix up guest_{rd,wr}msr() to<br>&gt; &gt;&gt;&gt;&gt; access the pe=
rf MSRs safely.=C2=A0 I know the vpmu MSR handling is in a<br>&gt; &gt;&gt;=
&gt;&gt; tragic state, but this new get_msr subop is making the problem eve=
n more<br>&gt; &gt;&gt;&gt;&gt; tangled.<br>&gt; &gt;&gt;&gt;&gt;<br>&gt; &=
gt;&gt;&gt;<br>&gt; &gt;&gt;&gt; Adding a separate hypercall is fine.<br>&g=
t; &gt;&gt;<br>&gt; &gt;&gt; Which will then also avoid altering the behavi=
or of the existing hypercall:<br>&gt; &gt;&gt; You can&#39;t just assume e.=
g. input fields to be zeroed (or otherwise<br>&gt; &gt;&gt; suitably set) b=
y existing callers, when those were previously output only.<br>&gt; &gt;&gt=
;<br>&gt; &gt;<br>&gt; &gt; I did add a memset to zero it on the single cal=
ler I could find.<br>&gt;<br>&gt; Some may deem this sufficient on the assu=
mption that all users should<br>&gt; go through the libxenguest function. B=
ut then at the minimum you want<br>&gt; to update documentation in the publ=
ic header. Yet then this wasn&#39;t<br>&gt; the only issue I spotted (hence=
 the use of &quot;e.g.&quot;) - you also alter<br>&gt; documented behavior =
as to the returned number of MSRs when the input<br>&gt; value was too smal=
l, if I&#39;m not mistaken.<br><div><br></div><div>No, there shouldn&#39;t =
have been any alteration of the previous behavior other than assuming the b=
uffer sent by the toolstack is zero initialized when the default list is re=
quested. Either way, adding the separate hypercall is fine by me.</div><div=
><br></div><div>Tamas<br></div></div>

--0000000000006f44e305ebf54a2c--

