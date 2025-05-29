Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAED5AC84D9
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 01:10:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000235.1380578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKmNs-0004og-CA; Thu, 29 May 2025 23:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000235.1380578; Thu, 29 May 2025 23:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKmNs-0004m2-9Y; Thu, 29 May 2025 23:10:00 +0000
Received: by outflank-mailman (input) for mailman id 1000235;
 Thu, 29 May 2025 23:09:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vAvS=YN=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1uKmNq-0004lw-A1
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 23:09:58 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08eefaef-3ce2-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 01:09:56 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-32923999549so12733281fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 May 2025 16:09:56 -0700 (PDT)
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
X-Inumbo-ID: 08eefaef-3ce2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748560195; x=1749164995; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pjTGqoRj94PC8pzd3IIf1OitKHN6xY8jwMkO8kw9Yh0=;
        b=YF7PHBE+yKNSFGDyfy7FRuGnR3zDUrnPIcyN29pRm2BcqrNJyAdHxm31QsH8wmwPQy
         uPJbXwxrwaX75CVVIP3C1Hj/LWPCjZDX/7B4WIRf4Xj7F55KUJZQtFK6BNC5NUsTCraT
         wIl/HjmBF/vfRQSTuFL8gc0o42uhnZXmDMcCLaGwQBqLFHnjdiROJyGt8H0ueZEWrnP/
         etPdLOEOKB/UA+mqDslXc3lCY/MAmw/PGtMLtF51LlElGJY5aYnFjgNEQXZotOPYJtap
         cWR7WI8z2EhyVQ6Ftp8Pw31xmZueLLM7/+e4X9q5QXNt/8+P/K/fJJybvcG9uewMqdMb
         E3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748560195; x=1749164995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjTGqoRj94PC8pzd3IIf1OitKHN6xY8jwMkO8kw9Yh0=;
        b=bctOunfZgWiBrjDLJ4q8yxwPp5K8JhU0RBojSk6/1C0DiY/j7Wz8vRFWSc910ovry+
         TFlP+rWNfXDkmJ2Y4y8aQqoqLwg/Opy/RxIlzAj1n+B4oAeCWEJVLfFkQGvuh4j3g3au
         xaOUGeWXmGBQ0kJ0uhfpLHDfPCKFfwLkJWvr9AyehywWRbmczYREs8OShFGN1N6qs6wn
         l5jD358c5bDrYxSNpL4HNV0CslgPhAP8eMkeUx7/UCeyF0P3qej2XXwGswSZpsoHWxSv
         /9QcGBnQ6YIZLnhFUvjkPuHbGrA1GizG3KLofF0GsQQvKdt4swL+UQkvRWHOiti4jW2+
         WqfQ==
X-Gm-Message-State: AOJu0YyMrpwxEV5eyQgxMbPvr8sPvI0tnvcPskrOl1pAj8C7DQK+UNnf
	zWNAnesCE4VsB/qOVPBJ/z97KQnq7D/JI7ZFrI76c5eegSIJTALBpSP5SyUOKtX3Xie5VJblcXv
	kx3H000sCgM9Xcr4umkUoO42xB9h5nvA=
X-Gm-Gg: ASbGncsQpAmIugdaFWVFs4HKYdvIAUvHO6nbxeoivWYYmWhhHTosYjBnvQqelqD0Hwc
	GYwTx/V6TGJZT8E7P/JaYvbSg32YuRKSDOQmnLvJ4ch8O5ZJmOvH52zxgwIBTpSXivLdO2NM6bS
	hWYBLAnzHKOItdiTlajNeWGhVNrqKo1//k0/HEXnAPcw==
X-Google-Smtp-Source: AGHT+IFJCxmqslJx8E6DJPgHojK4mbvM7D3ysBo1BmnswaJU/UloGUAjnsD4/SESm2dwNrcJR2HA0eGuBkQWNm7PW1k=
X-Received: by 2002:a05:651c:b2c:b0:327:fec0:b85d with SMTP id
 38308e7fff4ca-32a8cda6f69mr6176341fa.21.1748560195012; Thu, 29 May 2025
 16:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250520141027.120958-1-andrew.cooper3@citrix.com>
 <CACMJ4GY83K7-MvzViM5EwfJEQo9n0Ym_5NZYt9tx=uHBB8gB8Q@mail.gmail.com> <0a2a1ff2-d2fa-4331-acad-0e825421e95e@citrix.com>
In-Reply-To: <0a2a1ff2-d2fa-4331-acad-0e825421e95e@citrix.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Fri, 30 May 2025 00:09:43 +0100
X-Gm-Features: AX0GCFvOYY8nwxuVSlzd5U_xW-Ex1kQ2SYwJWmqfsXQ-YsyE1GvMF-vQOOSOY7c
Message-ID: <CACMJ4Gb0qs8c7RQKE84eeZ5s6uRj+vKBmvLKe691fUXaAwJMCw@mail.gmail.com>
Subject: Re: [PATCH] xen/argo: Command line handling improvements
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, Denis Mukhin <dmkhn@proton.me>
Content-Type: multipart/alternative; boundary="0000000000004acbb106364e6552"

--0000000000004acbb106364e6552
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 9:43=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com>
wrote:

> On 21/05/2025 2:01 am, Christopher Clark wrote:
> > On Tue, May 20, 2025 at 3:10=E2=80=AFPM Andrew Cooper
> > <andrew.cooper3@citrix.com> wrote:
> >
> >     Treat "argo" on the command line as a positive boolean, rather
> >     than requiring
> >     the user to pass "argo=3D1/on/enable/true".
>

I have tested that this patch does change the command line behaviour as
described, and doesn't prevent the existing valid options from parsing and
acting as they currently do, to enable and disable the subsystem, so that
is positive. I do have significant reservations stated below, however.


> >
> >     Move both opt_argo* variables into __ro_after_init.  They're set
> >     during
> >     command line parsing and never modified thereafter.
>

I haven't directly tested this aspect of the patch.


> >
> >
> > Instead of binding to static values set at boot, would
> > boolean_runtime_param be acceptable?
>
> No, for several reasons.
>

Thanks for the reply, your perspective is helpful.


>
> Sure, you could dynamically turn it on, but existing domains can't use
> it because argo_init() wasn't called on them.  Now consider what happens
> when dynamically turning it off behind the back of a domain which was
> using it.
>

> All the existing runtime controls are for properties that are not
> visible to guests.  Adding opt_argo to this list would create a lot of
> carnage.
>

OK, your aversion to it is clear and I'm not pushing to make that change.


>
> (Like almost everything else in Xen), Argo is entirely broken with
> respect to enumeration and controls.  And while this isn't your fault
> for having copied the status quo, it is still a problem needing fixing.
>
> Argo's availability needs advertising to the toolstack like all other
> features, and the toolstack needs to be able to choose the Argo settings
> on a per-VM basis.  Like everything else about VMs, the Argo-ness must
> be invariant for the lifetime of the domain.


> This means changes to sysctls/domctls, which IMO are prerequisites for
> Argo to move from Tech Preview to Supported.  In a world where such
> controls existed, the argo cmdline option would really only be for
> someone trying to disable Argo globally.
>

The above is why I'd prefer not to apply this patch: at the moment, the
population of Argo developers and system integrators do not create or use
bootloader configuration files with the single "argo" keyword on the Xen
command line. (They use "argo=3D1" or similar instead.)

Once a change such as this is merged, then there is a new behaviour that is
made available, and a new expectation created not to change the behaviour
of the standalone command line option (ie. "argo").

I'd like to retain using the standalone argo keyword for when the only boot
option that is necessary is just a simple on or off. At the moment, that's
not the case: the suboption ("mac-permissive=3D1") is valid to either inclu=
de
or omit, and there is work to do in order to enable retiring it - and
hopefully it will enable behaviour similar to the wider connectivity of
that option by default, which will not be the case for a system with "argo"
on the command line if just this current patch is applied.


>
> This particular patch comes simply from me trying to experiment with
> Argo to sort out the XTF test, and deciding that the behaviour was
> objectionable enough that I'd improve it.
>

I agree with the end goal; but don't think this is the right next step to
get there, and I don't think the existing situation is sufficiently
objectionable to make this change this way.

Christopher



>
> ~Andrew
>

--0000000000004acbb106364e6552
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, May 21, 2025 at 9:43=E2=80=AFPM A=
ndrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew.cooper=
3@citrix.com</a>&gt; wrote:</div><div class=3D"gmail_quote gmail_quote_cont=
ainer"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On 21/05/2025 2:01=
 am, Christopher Clark wrote:<br>
&gt; On Tue, May 20, 2025 at 3:10=E2=80=AFPM Andrew Cooper<br>
&gt; &lt;<a href=3D"mailto:andrew.cooper3@citrix.com" target=3D"_blank">and=
rew.cooper3@citrix.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Treat &quot;argo&quot; on the command line as a pos=
itive boolean, rather<br>
&gt;=C2=A0 =C2=A0 =C2=A0than requiring<br>
&gt;=C2=A0 =C2=A0 =C2=A0the user to pass &quot;argo=3D1/on/enable/true&quot=
;.<br></blockquote><div><br></div><div>I have tested that this patch does c=
hange the command line behaviour as described, and doesn&#39;t prevent the =
existing valid options from parsing and acting as they currently do, to ena=
ble and disable the subsystem, so that is positive. I do have significant r=
eservations stated below, however.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Move both opt_argo* variables into __ro_after_init.=
=C2=A0 They&#39;re set<br>
&gt;=C2=A0 =C2=A0 =C2=A0during<br>
&gt;=C2=A0 =C2=A0 =C2=A0command line parsing and never modified thereafter.=
<br></blockquote><div><br></div><div>I haven&#39;t directly tested this asp=
ect of the patch.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
&gt;<br>
&gt;<br>
&gt; Instead of binding to static values set at boot, would<br>
&gt; boolean_runtime_param be acceptable?<br>
<br>
No, for several reasons.<br></blockquote><div><br></div><div>Thanks for the=
 reply, your perspective is helpful.</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
Sure, you could dynamically turn it on, but existing domains can&#39;t use<=
br>
it because argo_init() wasn&#39;t called on them.=C2=A0 Now consider what h=
appens<br>
when dynamically turning it off behind the back of a domain which was<br>
using it.<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><br>
All the existing runtime controls are for properties that are not<br>
visible to guests.=C2=A0 Adding opt_argo to this list would create a lot of=
<br>
carnage.<br></blockquote><div><br></div><div>OK, your aversion to it is cle=
ar and I&#39;m not pushing to make that change.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><br>
(Like almost everything else in Xen), Argo is entirely broken with<br>
respect to enumeration and controls.=C2=A0 And while this isn&#39;t your fa=
ult<br>
for having copied the status quo, it is still a problem needing fixing.<br>
<br>
Argo&#39;s availability needs advertising to the toolstack like all other<b=
r>
features, and the toolstack needs to be able to choose the Argo settings<br=
>
on a per-VM basis.=C2=A0 Like everything else about VMs, the Argo-ness must=
<br>
be invariant for the lifetime of the domain.</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
This means changes to sysctls/domctls, which IMO are prerequisites for<br>
Argo to move from Tech Preview to Supported.=C2=A0 In a world where such<br=
>
controls existed, the argo cmdline option would really only be for<br>
someone trying to disable Argo globally.<br></blockquote><div><br></div><di=
v>The=C2=A0above is why I&#39;d prefer not to apply this patch: at the mome=
nt, the population of Argo developers and system integrators do not create =
or use bootloader configuration files with the single &quot;argo&quot; keyw=
ord on the Xen command line. (They use &quot;argo=3D1&quot; or similar inst=
ead.)</div><div><br></div><div>Once a change such as this is merged, then t=
here is a new behaviour that is made available, and a new expectation creat=
ed not to change the behaviour of the standalone command line option (ie. &=
quot;argo&quot;).</div><div><br></div><div>I&#39;d like to retain using the=
 standalone argo keyword for when the only boot option that is necessary is=
 just a simple on or off. At the moment, that&#39;s not the case: the subop=
tion (&quot;mac-permissive=3D1&quot;) is valid to either include or omit, a=
nd there is work to do in order to=C2=A0enable retiring it - and hopefully =
it will enable behaviour similar to the wider connectivity of that option b=
y default, which will not be the case for a system with &quot;argo&quot; on=
 the command line if just this current patch is applied.</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
This particular patch comes simply from me trying to experiment with<br>
Argo to sort out the XTF test, and deciding that the behaviour was<br>
objectionable enough that I&#39;d improve it.<br></blockquote><div><br></di=
v><div>I agree with the end goal; but don&#39;t think this is the right nex=
t step to get there, and I don&#39;t think the existing situation is suffic=
iently objectionable to make this change this way.</div><div><br></div><div=
>Christopher</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
~Andrew<br>
</blockquote></div></div>

--0000000000004acbb106364e6552--

