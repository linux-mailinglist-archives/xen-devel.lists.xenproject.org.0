Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA0EACF901
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 22:59:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007592.1386880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNHfp-0005sP-Ln; Thu, 05 Jun 2025 20:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007592.1386880; Thu, 05 Jun 2025 20:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNHfp-0005pg-HW; Thu, 05 Jun 2025 20:58:53 +0000
Received: by outflank-mailman (input) for mailman id 1007592;
 Thu, 05 Jun 2025 20:58:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XjUw=YU=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1uNHfo-0005pa-M9
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 20:58:52 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df96ca3e-424f-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 22:58:50 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-32a61af11ffso15830671fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 13:58:47 -0700 (PDT)
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
X-Inumbo-ID: df96ca3e-424f-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749157126; x=1749761926; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0TgkpRK/oltZr7kizvAssmxFNxTBwjN1tXXnvLvlvRo=;
        b=bOm6CrxrJ3Y78ch0JxUXCGX4R8xHY9k4EUhlehrnGfmHSTUDOrQ0XK1NLCjayJbHoz
         uPK/86mlrTZQ6mX+EJRfBh8+cyqNEnTEyzZLvE7N3LJqhDt4LduBjIkXzEEltJht4vCr
         VTdQZO0isTAp6icgO92LwWRyFELSNhZSGfYMMewAiE2wYeKDNiWi2FvPdRImwLVLu168
         02RH+iurDpPtnP1QTKFV/M7t1cR5258pCWSMTv0dEvRYJ5kIMp4ya6cAD1iuFoyqoHMd
         fPDQ546zXIE/4Gi024dxVb7z2i28ZpaZWRQNam5zpAg53S0Uno8zXxiWoUqcv6HVRLEZ
         y8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749157126; x=1749761926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0TgkpRK/oltZr7kizvAssmxFNxTBwjN1tXXnvLvlvRo=;
        b=JGxmSMXbeU07wJewslclbHpMebQAfiyZW2nL5+J48Gu3neV2B+30TtM3ZEqHWVBjUG
         c1Z94o5pNMtNGWONcAQkduM8hhwGPdQFeco0CDTveY22VWKtssvf71kS+KwhsvZRoVB8
         a3EC9lhb++RW3jQNZqetdRckRPz1trfGHwFBxDqOwV0RfypJjyQu8gZCJpFua0GTxgZF
         1OBg9aa5Cb3Mf8jr4jjUItgLXUqgri+yG/NfxYnoWSJO97SAvdJhlGmiYfvaAFZHwlJY
         /Uz42mGySh/GVpplUvU3+80try7Cw0ea0sj0wIlXgHcPOyNv3iutkK+EWwPkTrYNUkRR
         bS7A==
X-Gm-Message-State: AOJu0YxUstJ0toUsWn2G5rK1vUdElLvPc0S2ASMGQAFeTZ2neUQfN6wg
	d98hcYf6A57Yivj8w7QsA63uc5DaZSwhmarbcR8NoCWbSPPshiERSxwCRGv5Rr/OQqBJ+HcH0q5
	+nwdmGLYEziLN/TsBsp74VC8m4i6e5sY=
X-Gm-Gg: ASbGnctwDeiV0d46+Bvc1D6UlcZy8AZ3eF3NZ54KnNMc/sDLHhBLTEtWBcyMptF5Q/u
	MRVba9dXGsWwi5hy+z0JpW3vgcoiH5G8MiUijSXO1LM7rt5gj5m1XjepCvyKeO2nguQaLDUrIeT
	mYE5w+oCMP7z5QngdA/7/s6MpajYW058Q=
X-Google-Smtp-Source: AGHT+IGLAXRYJ1kj0oTaQ+zdoFvMv1FkKnoq45sTpsEu5vEl5dHXU5S4gdLBALfBiCfyHD84Hc0jXG6TIBHUbqJF8U0=
X-Received: by 2002:a05:651c:1a0c:b0:329:143e:ca3d with SMTP id
 38308e7fff4ca-32ad11c3e29mr15481731fa.11.1749157126118; Thu, 05 Jun 2025
 13:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250528211040.10562-1-christopher.w.clark@gmail.com> <f05fb94f-91ba-4abe-b59a-c14e25388e68@vates.tech>
In-Reply-To: <f05fb94f-91ba-4abe-b59a-c14e25388e68@vates.tech>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 5 Jun 2025 21:58:34 +0100
X-Gm-Features: AX0GCFtqAAxkT7e_oERL_Qkze87xfEf3IKtv5qc-Rvr82bKQubYMW4WV68nKi10
Message-ID: <CACMJ4GZfhwoL-yT1cPssiaqdkaYwZBnAG9AVEomiGYmh_qgHyg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] docs: add documentation for Argo as a feature
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, 
	Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="00000000000028a3ce0636d961cd"

--00000000000028a3ce0636d961cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 11:40=E2=80=AFPM Teddy Astie <teddy.astie@vates.tec=
h> wrote:

> Hello Christopher,
>

Hi Teddy, thanks for the review.


>
> Le 28/05/2025 =C3=A0 23:13, Christopher Clark a =C3=A9crit :
> > Adds approachable documentation describing system components and
> > introduces the support statement for feature status.
> ...
> > +# Overview
> > +
> > +Argo is a lightweight data transport for communication between virtual
> > +machines, with a simple hypervisor interface that is accessible for
> > +building embedded systems and designed to work with familiar primitive=
s
> > +within guest OS kernels. It supports policy control over communication
> > +and isolation between VMs.
> > +
> > +# User details
> > +
> > +Argo is present in Xen, included since Xen 4.12. A Linux device driver
> > +and userspace library are available and Argo is regularly tested in th=
e
> > +Xen Continuous Integration system.
> > +
>
> Not really related to the documentation itself, but it would be
> preferable to have the Linux driver upstreamed such as this sentence
> sounds more as "it is supported" rather than "it's possible to make it
> work".
>

I agree and I can work on a better description for the next posting.


>
> It would also make Argo easier to integrate in Xen-based projects.
>

Yes (for systems with Linux).


>
> > +To configure a Xen system to enable Argo:
> > +
> > +* ensure that Argo is enabled in the hypervisor with KConfig option
> > +
> > +* enable Argo on the Xen hypervisor command line
> > +
> > +* load the Argo guest kernel device driver
> > +
> > +* ensure that the Argo guest libraries are installed
> > +
> > +The guest userspace libraries support software designed for Argo
> > +interfaces and also enables software designed for networks to
> > +communicate between VMs by Argo.  This allows platform software to be
> > +plumbed easily between virtual machines, without requiring networking
> > +and with system policy controls over this communication.
> > +
> > +# Technical details
> > +
> > +## Argo components
> > +
> > +* Xen: Argo in the hypervisor provides communication between virtual
> > +  machines.
> > +
> > +* Guest kernel: driver provides interfaces for data transport for use
> > +  within the kernel, and implements familiar abstractions for
> > +  networking software.
> > +
> > +* Guest libraries: provide application-level support for interdomain
> > +  communication.
> > +
>
> That sounds a bit confusing to me, the guest kernel provides familiar
> abstractions for networking software (I hear through that something like
> sockets), yet we still have guest libraries for application-level support=
.
>
> I think the guest libraries provide a shim for some of the argo-specific
> aspects (like ioctls and sockaddr_argo related bits); while the
> interface is more unix-oriented with regular sockets operations
> (sendmsg, ...).
>

OK, I wasn't sure what level of detail would be wanted for this so it's
useful to know, thanks.


>
> > +## Argo implementation within Xen
> > +
> > +See the public Xen headers for the primary interface documentation.
> > +
>
> There is the design document in docs/designs/argo.pandoc that explains
> the inner design inside Xen. I think the public headers are more for
> guest consumption.
>

OK, I'll add reference to the design document.


>
> As this document also targets guest developers, it would be great to
> have some guidance (e.g a docs document) on how a guest should implement
> argo support.
>

Thanks, I appreciate the enthusiasm for it to be written!

best,

Christopher

--00000000000028a3ce0636d961cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, May 29, 2025 at 11:40=E2=80=AFPM =
Teddy Astie &lt;teddy.astie@vates.tech&gt; wrote:</div><div class=3D"gmail_=
quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Hello Christopher,<br></blockquote><div><br></div><div>Hi Teddy, thanks=
 for the review.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
Le 28/05/2025 =C3=A0 23:13, Christopher Clark a =C3=A9crit=C2=A0:<br>
&gt; Adds approachable documentation describing system components and<br>
&gt; introduces the support statement for feature status.<br>...<br>
&gt; +# Overview<br>
&gt; +<br>
&gt; +Argo is a lightweight data transport for communication between virtua=
l<br>
&gt; +machines, with a simple hypervisor interface that is accessible for<b=
r>
&gt; +building embedded systems and designed to work with familiar primitiv=
es<br>
&gt; +within guest OS kernels. It supports policy control over communicatio=
n<br>
&gt; +and isolation between VMs.<br>
&gt; +<br>
&gt; +# User details<br>
&gt; +<br>
&gt; +Argo is present in Xen, included since Xen 4.12. A Linux device drive=
r<br>
&gt; +and userspace library are available and Argo is regularly tested in t=
he<br>
&gt; +Xen Continuous Integration system.<br>
&gt; +<br>
<br>
Not really related to the documentation itself, but it would be <br>
preferable to have the Linux driver upstreamed such as this sentence <br>
sounds more as &quot;it is supported&quot; rather than &quot;it&#39;s possi=
ble to make it <br>
work&quot;.<br></blockquote><div><br></div><div>I agree and I can work on a=
 better description for the next posting.</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
It would also make Argo easier to integrate in Xen-based projects.<br></blo=
ckquote><div><br></div><div>Yes (for systems with Linux).</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +To configure a Xen system to enable Argo:<br>
&gt; +<br>
&gt; +* ensure that Argo is enabled in the hypervisor with KConfig option<b=
r>
&gt; +<br>
&gt; +* enable Argo on the Xen hypervisor command line<br>
&gt; +<br>
&gt; +* load the Argo guest kernel device driver<br>
&gt; +<br>
&gt; +* ensure that the Argo guest libraries are installed<br>
&gt; +<br>
&gt; +The guest userspace libraries support software designed for Argo<br>
&gt; +interfaces and also enables software designed for networks to<br>
&gt; +communicate between VMs by Argo.=C2=A0 This allows platform software =
to be<br>
&gt; +plumbed easily between virtual machines, without requiring networking=
<br>
&gt; +and with system policy controls over this communication.<br>
&gt; +<br>
&gt; +# Technical details<br>
&gt; +<br>
&gt; +## Argo components<br>
&gt; +<br>
&gt; +* Xen: Argo in the hypervisor provides communication between virtual<=
br>
&gt; +=C2=A0 machines.<br>
&gt; +<br>
&gt; +* Guest kernel: driver provides interfaces for data transport for use=
<br>
&gt; +=C2=A0 within the kernel, and implements familiar abstractions for<br=
>
&gt; +=C2=A0 networking software.<br>
&gt; +<br>
&gt; +* Guest libraries: provide application-level support for interdomain<=
br>
&gt; +=C2=A0 communication.<br>
&gt; +<br>
<br>
That sounds a bit confusing to me, the guest kernel provides familiar <br>
abstractions for networking software (I hear through that something like <b=
r>
sockets), yet we still have guest libraries for application-level support.<=
br>
<br>
I think the guest libraries provide a shim for some of the argo-specific <b=
r>
aspects (like ioctls and sockaddr_argo related bits); while the <br>
interface is more unix-oriented with regular sockets operations <br>
(sendmsg, ...).<br></blockquote><div><br></div><div>OK, I wasn&#39;t sure w=
hat level of detail would be wanted for this so it&#39;s useful to know, th=
anks.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
&gt; +## Argo implementation within Xen<br>
&gt; +<br>
&gt; +See the public Xen headers for the primary interface documentation.<b=
r>
&gt; +<br>
<br>
There is the design document in docs/designs/argo.pandoc that explains <br>
the inner design inside Xen. I think the public headers are more for <br>
guest consumption.<br></blockquote><div><br></div><div>OK, I&#39;ll add ref=
erence to the design document.</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
As this document also targets guest developers, it would be great to <br>
have some guidance (e.g a docs document) on how a guest should implement <b=
r>
argo support.<br></blockquote><div><br></div><div>Thanks, I appreciate the =
enthusiasm for it to be written!</div><div><br></div><div>best,</div><div><=
br></div><div>Christopher</div><div>=C2=A0<br><br></div></div></div>

--00000000000028a3ce0636d961cd--

