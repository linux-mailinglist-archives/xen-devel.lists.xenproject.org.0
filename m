Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFBF431A91
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 15:17:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212240.370039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSVr-0001Fm-RP; Mon, 18 Oct 2021 13:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212240.370039; Mon, 18 Oct 2021 13:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSVr-0001Cx-OL; Mon, 18 Oct 2021 13:17:11 +0000
Received: by outflank-mailman (input) for mailman id 212240;
 Mon, 18 Oct 2021 13:17:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZ0x=PG=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1mcSVq-0001Cr-5a
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 13:17:10 +0000
Received: from MTA-08-3.privateemail.com (unknown [198.54.127.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1f40e90-3015-11ec-82d7-12813bfff9fa;
 Mon, 18 Oct 2021 13:17:08 +0000 (UTC)
Received: from mta-08.privateemail.com (localhost [127.0.0.1])
 by mta-08.privateemail.com (Postfix) with ESMTP id 9101018000BB
 for <xen-devel@lists.xenproject.org>; Mon, 18 Oct 2021 09:17:07 -0400 (EDT)
Received: from mail-yb1-f173.google.com (unknown [10.20.151.226])
 by mta-08.privateemail.com (Postfix) with ESMTPA id 6A5A318000B2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Oct 2021 09:17:07 -0400 (EDT)
Received: by mail-yb1-f173.google.com with SMTP id q189so2794946ybq.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Oct 2021 06:17:07 -0700 (PDT)
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
X-Inumbo-ID: b1f40e90-3015-11ec-82d7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1634563027;
	bh=sQZZFHl5Dl8asJgGz20aWayFRwxypZ4Jayizx7O6u2Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jG90ZtxVXFOxafMsCReF3xQZlVhmmzVrhZRJ+COxSfz9QcxLuzgAKPwvDnjMIBMSL
	 X41HtSOSjSFxmlNAYD3n5wKp1ZCYLbqaGZ50v8QmSQ3qxB4mQcdiplbFN6Q82/k88t
	 eL2unutwTKoHK0JOJE7GesYUnScJdMA8iiJ0gfHx1iKL8CaNlZ9+OI6i/x2zG6I5zJ
	 0vLeQqF6wk8neE8Cy9G69/bg3fC7cG12fjzIlXQItV9XNpLXDoVTXozaBJNJ/TbLSa
	 X6ITt+s8L4V+x4f1fpd0/R1RF9HSjhFUF2hT1N/oIvsZ2we+4hic75Lpmz6qcF73bV
	 NuMJvAgeskE9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1634563027;
	bh=sQZZFHl5Dl8asJgGz20aWayFRwxypZ4Jayizx7O6u2Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jG90ZtxVXFOxafMsCReF3xQZlVhmmzVrhZRJ+COxSfz9QcxLuzgAKPwvDnjMIBMSL
	 X41HtSOSjSFxmlNAYD3n5wKp1ZCYLbqaGZ50v8QmSQ3qxB4mQcdiplbFN6Q82/k88t
	 eL2unutwTKoHK0JOJE7GesYUnScJdMA8iiJ0gfHx1iKL8CaNlZ9+OI6i/x2zG6I5zJ
	 0vLeQqF6wk8neE8Cy9G69/bg3fC7cG12fjzIlXQItV9XNpLXDoVTXozaBJNJ/TbLSa
	 X6ITt+s8L4V+x4f1fpd0/R1RF9HSjhFUF2hT1N/oIvsZ2we+4hic75Lpmz6qcF73bV
	 NuMJvAgeskE9Q==
X-Gm-Message-State: AOAM533TMg2Icl6gaKT3TYYYjl9QZ/mmuZS+9/befpPWeDmltvFnt5f0
	mUw5khM7NQ94WezXSRbc/kO6nkckq+F7PM0PqNw=
X-Google-Smtp-Source: ABdhPJxLGOWRqX6MIVWSahltV3Qzg0iGuHP+5H2flEzGMJSBYsqU+yfAI/Az8PNIJudBuHw35oS6JKvCXvnw6mTR/4A=
X-Received: by 2002:a25:2cd6:: with SMTP id s205mr28943192ybs.367.1634563026625;
 Mon, 18 Oct 2021 06:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <f0de7945-84df-8668-f94a-c15cd5196be3@suse.com> <7f947b0b-4b65-51cb-c098-edf056610fb0@suse.com>
In-Reply-To: <7f947b0b-4b65-51cb-c098-edf056610fb0@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 18 Oct 2021 09:16:30 -0400
X-Gmail-Original-Message-ID: <CABfawhmYzu43sMSG_TD0kHhvEjQfo1S-d-iz6cqFwb4JNbjbDA@mail.gmail.com>
Message-ID: <CABfawhmYzu43sMSG_TD0kHhvEjQfo1S-d-iz6cqFwb4JNbjbDA@mail.gmail.com>
Subject: Re: Ping: [PATCH] x86/altp2m: don't consider "active" when enabling failed
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Alexandru Isaila <aisaila@bitdefender.com>
Content-Type: multipart/alternative; boundary="00000000000090b08805cea05cef"
X-Virus-Scanned: ClamAV using ClamSMTP

--00000000000090b08805cea05cef
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 4:26 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 25.08.2021 11:31, Jan Beulich wrote:
> > We should not rely on guests to not use altp2m after reporting failure
> > of HVMOP_altp2m_set_domain_state to them. Set "active" back to false in
> > this case.
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> Because of their relationship, I'm also Cc-ing the vm-event maintainers /
> reviewers: Maybe one of you would care to review this one?
>
> Jan
>
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -4609,6 +4609,8 @@ static int do_altp2m_op(
> >              if ( ostate )
> >                  p2m_flush_altp2m(d);
> >          }
> > +        else if ( rc )
> > +            d->arch.altp2m_active = false;
> >
> >          domain_unpause_except_self(d);
> >          break;


Reviewed-by: Tamas K Lengyel <tamas@tklengyel.com>

--00000000000090b08805cea05cef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 18, 2021 at 4:26 AM Jan B=
eulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 25.08.2=
021 11:31, Jan Beulich wrote:<br>
&gt; We should not rely on guests to not use altp2m after reporting failure=
<br>
&gt; of HVMOP_altp2m_set_domain_state to them. Set &quot;active&quot; back =
to false in<br>
&gt; this case.<br>
&gt; <br>
&gt; Signed-off-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" ta=
rget=3D"_blank">jbeulich@suse.com</a>&gt;<br>
<br>
Because of their relationship, I&#39;m also Cc-ing the vm-event maintainers=
 /<br>
reviewers: Maybe one of you would care to review this one?<br>
<br>
Jan<br>
<br>
&gt; --- a/xen/arch/x86/hvm/hvm.c<br>
&gt; +++ b/xen/arch/x86/hvm/hvm.c<br>
&gt; @@ -4609,6 +4609,8 @@ static int do_altp2m_op(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( ostate )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p2m_flus=
h_altp2m(d);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if ( rc )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;arch.altp2m_active =
=3D false;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 domain_unpause_except_self(d);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;</blockquote><div><br></div><d=
iv>Reviewed-by: Tamas K Lengyel &lt;<a href=3D"mailto:tamas@tklengyel.com">=
tamas@tklengyel.com</a>&gt;<br></div></div></div>

--00000000000090b08805cea05cef--

