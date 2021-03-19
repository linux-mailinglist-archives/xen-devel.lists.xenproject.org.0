Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B018A341B12
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 12:07:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99170.188394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNCxZ-0001NJ-4v; Fri, 19 Mar 2021 11:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99170.188394; Fri, 19 Mar 2021 11:06:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNCxZ-0001Mx-1c; Fri, 19 Mar 2021 11:06:29 +0000
Received: by outflank-mailman (input) for mailman id 99170;
 Fri, 19 Mar 2021 11:06:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AwH3=IR=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1lNCxW-0001Ms-TO
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 11:06:26 +0000
Received: from MTA-13-4.privateemail.com (unknown [198.54.127.109])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba289b2c-bdbe-44f8-88f4-7fd22dc5fe01;
 Fri, 19 Mar 2021 11:06:25 +0000 (UTC)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id BC1D180066
 for <xen-devel@lists.xenproject.org>; Fri, 19 Mar 2021 07:06:24 -0400 (EDT)
Received: from mail-wr1-f44.google.com (unknown [10.20.151.227])
 by mta-13.privateemail.com (Postfix) with ESMTPA id 81EDA8005D
 for <xen-devel@lists.xenproject.org>; Fri, 19 Mar 2021 07:06:24 -0400 (EDT)
Received: by mail-wr1-f44.google.com with SMTP id z2so8669881wrl.5
 for <xen-devel@lists.xenproject.org>; Fri, 19 Mar 2021 04:06:24 -0700 (PDT)
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
X-Inumbo-ID: ba289b2c-bdbe-44f8-88f4-7fd22dc5fe01
X-Gm-Message-State: AOAM533VJXnVe4NR1kaH7keU4yreT7lq4GX4GWzL2Ml84dYDCtSTp6pk
	gycjXljQWFaqwo4GMlWR8Lwyh0UI/oRBDss6Xf8=
X-Google-Smtp-Source: ABdhPJx5Sa+PV1wA7EMvqa8I5iJZNyowPoY+9fO8ufPGL/y4Nnvl2HGNLOVfV2BeAUdA/y4OuUZgNMypGYLGMOaH09c=
X-Received: by 2002:a05:6000:1868:: with SMTP id d8mr3950424wri.301.1616151983275;
 Fri, 19 Mar 2021 04:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <bdeaf7893acd6497cc2b88f3a1357d1299960e9b.1616103095.git.tamas.lengyel@intel.com>
 <193bfae5-a80a-d02a-377d-c9e11ad038a8@suse.com>
In-Reply-To: <193bfae5-a80a-d02a-377d-c9e11ad038a8@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 19 Mar 2021 07:06:10 -0400
X-Gmail-Original-Message-ID: <CABfawhmaUXSJkEG3hOQGFHMD=anN5Vs-uGosXP2NDTUDS2HDvA@mail.gmail.com>
Message-ID: <CABfawhmaUXSJkEG3hOQGFHMD=anN5Vs-uGosXP2NDTUDS2HDvA@mail.gmail.com>
Subject: Re: [PATCH for-4.15] x86/mem_sharing: copy parent VM's hostp2m's
 max_mapped_pfn during forking
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000ddcee005bde1b4dd"
X-Virus-Scanned: ClamAV using ClamSMTP

--000000000000ddcee005bde1b4dd
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 19, 2021, 6:23 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 18.03.2021 22:36, Tamas K Lengyel wrote:
> > --- a/xen/arch/x86/mm/mem_sharing.c
> > +++ b/xen/arch/x86/mm/mem_sharing.c
> > @@ -1761,6 +1761,7 @@ static int copy_settings(struct domain *cd, struct
> domain *d)
> >          return rc;
> >
> >      copy_tsc(cd, d);
> > +    p2m_get_hostp2m(cd)->max_mapped_pfn =
> p2m_get_hostp2m(d)->max_mapped_pfn;
>
> Makes sense to me, yes, but then an immediate question is: What
> about the somewhat similar {min,max}_remapped_gfn fields? Which
> of course implies the more general question of how alternate
> p2m-s (are supposed to) get treated in the first place. From my
> looking at it, fork() doesn't appear to also fork those, but
> also doesn't appear to refuse cloning when altp2m is in use.
>

It's untested, forking and altp2m is not currently used simultaniously.
Don't know if it should be restricted as not working as I haven't tested
it. Both forking and altp2m is experimental so there be dragons. At some
point I would like to be able to use altp2m in forks but forking a domain
that has altp2m enabled will likely be a setup that's too insane to try to
get working.

Tamas

>

--000000000000ddcee005bde1b4dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Mar 19, 2021, 6:23 AM Jan Beulich &lt;<a href=
=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 18.03.2021 22:36, Tamas K Lengyel wrote:<br>
&gt; --- a/xen/arch/x86/mm/mem_sharing.c<br>
&gt; +++ b/xen/arch/x86/mm/mem_sharing.c<br>
&gt; @@ -1761,6 +1761,7 @@ static int copy_settings(struct domain *cd, stru=
ct domain *d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rc;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 copy_tsc(cd, d);<br>
&gt; +=C2=A0 =C2=A0 p2m_get_hostp2m(cd)-&gt;max_mapped_pfn =3D p2m_get_host=
p2m(d)-&gt;max_mapped_pfn;<br>
<br>
Makes sense to me, yes, but then an immediate question is: What<br>
about the somewhat similar {min,max}_remapped_gfn fields? Which<br>
of course implies the more general question of how alternate<br>
p2m-s (are supposed to) get treated in the first place. From my<br>
looking at it, fork() doesn&#39;t appear to also fork those, but<br>
also doesn&#39;t appear to refuse cloning when altp2m is in use.<br></block=
quote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">It&#39;s un=
tested, forking and altp2m is not currently used simultaniously. Don&#39;t =
know if it should be restricted as not working as I haven&#39;t tested it. =
Both forking and altp2m is experimental so there be dragons. At some point =
I would like to be able to use altp2m in forks but forking a domain that ha=
s altp2m enabled will likely be a setup that&#39;s too insane to try to get=
 working.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Tamas</div><di=
v dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000ddcee005bde1b4dd--

