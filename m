Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94411690B7F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 15:17:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492504.762063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7jF-0007XB-Gj; Thu, 09 Feb 2023 14:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492504.762063; Thu, 09 Feb 2023 14:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7jF-0007Tt-Dn; Thu, 09 Feb 2023 14:16:49 +0000
Received: by outflank-mailman (input) for mailman id 492504;
 Thu, 09 Feb 2023 14:16:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIAB=6F=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pQ7jD-0007Tn-T4
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 14:16:47 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62aa6125-a884-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 15:16:46 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id h17so2205986ljq.4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 06:16:46 -0800 (PST)
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
X-Inumbo-ID: 62aa6125-a884-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mYBVpQ5IUOfQCY2t2hp407RYRtDn73JjCCQEERmdOxQ=;
        b=VV1AFx2F+J7Vg3JIVVr8s1OnLH/wc/Z+gQriHsCOERx17Tf4VfoeQSCIQCTjdZGBk6
         BFCKsvRX4UXGVqNsVz6NK+6BMIp0zYwe3wK2Pd9Ese4o1LblULkGBgENsvN8+GBGipAL
         TOtzsXaQnfRWSIOXziPjXWSaPbSyIbfm3OtVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYBVpQ5IUOfQCY2t2hp407RYRtDn73JjCCQEERmdOxQ=;
        b=YHSYKOAdXAUn6Pd/cVoDprOKz0BvK6jl/xzDfWhiCzFmcUxBzrHCkBVilyLmEc/Q5V
         LiTSCVBHzjeZ2c69IM0LQAKFQGGAQGdRvbqRpPpWzCXaynCmmCi0pT5gwAU8slYOYn/m
         +q/r8bg7EwfFf5rH7SQ5fZf3R2n6pE0q45dM4/ZNSQjhLpJuZx6sb3uh7tob1UKF1RMU
         yR0Ws/nGsEKe5FFV7HyZUcKtSLp+tmw/zxnue9SrOVBJWOXwVpo3NsLVARjHAUowRJZC
         HkalLm8X9M2miI1GhAtFtWBtUTnRq3+qZBMnPHtCaaSv56JItktHTSNvFuZEAyZY6wBk
         qnbg==
X-Gm-Message-State: AO0yUKU+ADZSur5eJyUF252tPxzSXXIiRa1705dCFbIVQkSCaekYGoCM
	rRCrHVAz1C9dvdury6wRHFEpNgyXoi3TYwZR8yz6ZQ==
X-Google-Smtp-Source: AK7set/QrMN9v3tpc5aA25agRnmx13ZvshQhU07KiTjWlC3RmdWdYdsK/wsk16BhpW/Fz4QSgpRQf3hsichDLkEXBJs=
X-Received: by 2002:a2e:7a09:0:b0:293:2e0a:da94 with SMTP id
 v9-20020a2e7a09000000b002932e0ada94mr616027ljc.136.1675952205932; Thu, 09 Feb
 2023 06:16:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675889601.git.demi@invisiblethingslab.com>
 <6ff3e64e1dafd869caf23660cafdd46070209e2e.1675889602.git.demi@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2302081456060.4661@ubuntu-linux-20-04-desktop> <Y+QuaDrn6EUti0ZR@itl-email>
In-Reply-To: <Y+QuaDrn6EUti0ZR@itl-email>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 9 Feb 2023 14:16:34 +0000
Message-ID: <CA+zSX=ZDaFSFNmF6YtZWZ=bGOTKgEjg-po1Qhds9pxNFz008FA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] GPL License Boilerplate: Switch from HTTP to HTTPS
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Samuel Thibault <samuel.thibault@ens-lyon.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
	Quan Xu <quan.xu0@gmail.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Nick Rosbrook <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Paul Durrant <paul@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Tim Deegan <tim@xen.org>, Christopher Clark <christopher.w.clark@gmail.com>, 
	Dario Faggioli <dfaggioli@suse.com>, Rahul Singh <rahul.singh@arm.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Content-Type: multipart/alternative; boundary="000000000000e5420405f4450719"

--000000000000e5420405f4450719
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 8, 2023 at 11:21 PM Demi Marie Obenour <
demi@invisiblethingslab.com> wrote:

> On Wed, Feb 08, 2023 at 02:58:38PM -0800, Stefano Stabellini wrote:
> > On Wed, 8 Feb 2023, Demi Marie Obenour wrote:
> > > Obtaining code over an insecure transport is a terrible idea for
> > > blatently obvious reasons.  Even for non-executable data, insecure
> > > transports are considered deprecated.
> > >
> > > This patch changes GPL boilerplate.
> > >
> > > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> >
> > For the licensing boilerplate, I think it would be better to switch to
> > SPDX instead.
> >
> > That said, given that you have already done the work to covert the GPL
> > boilerplate everywhere, I think this is OK. But if you have time and
> > energy I would love to see a patch switching to SPDX in as many places
> > as possible.
>
> The only part of this patch I actually wrote is the commit message.  The
> rest was generatedy by:
>
>     git ls-files -z |
>     xargs -0 -- sed -Ei -- 's@(http)(://www\.gnu\.org)@\1s\2@g'
>
> followed by the usual git stuff.


Thank you for doing this; but unfortunately, to feel comfortable giving an
'R-b', we'd want to have some confidence that the new URLs were correct;
making this patch as posted is basically impossible to review, even knowing
the rune used to create it.

I think if you specifically focused only on the URL in the license
boilerplate (i.e., http://www.gnu.org/licenses/), and included the runes
used to create it in the commit message, then it should be easier to review.

Alternately, if you had some runes you'd used to verify that the new URLs
worked, then we could review *that* instead of reviewing all of the
individual URLs.

That said, since it's been suggested that we intend to move over to SPDX
entirely, I'd understand if you didn't want to put in the extra effort here.

 -George

--000000000000e5420405f4450719
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 8, 2023 at 11:21 PM Demi =
Marie Obenour &lt;<a href=3D"mailto:demi@invisiblethingslab.com" target=3D"=
_blank">demi@invisiblethingslab.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Wed, Feb 08, 2023 at 02:58:38PM -0800=
, Stefano Stabellini wrote:<br>
&gt; On Wed, 8 Feb 2023, Demi Marie Obenour wrote:<br>
&gt; &gt; Obtaining code over an insecure transport is a terrible idea for<=
br>
&gt; &gt; blatently obvious reasons.=C2=A0 Even for non-executable data, in=
secure<br>
&gt; &gt; transports are considered deprecated.<br>
&gt; &gt; <br>
&gt; &gt; This patch changes GPL boilerplate.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Demi Marie Obenour &lt;<a href=3D"mailto:demi@invi=
siblethingslab.com" target=3D"_blank">demi@invisiblethingslab.com</a>&gt;<b=
r>
&gt; <br>
&gt; For the licensing boilerplate, I think it would be better to switch to=
<br>
&gt; SPDX instead.<br>
&gt; <br>
&gt; That said, given that you have already done the work to covert the GPL=
<br>
&gt; boilerplate everywhere, I think this is OK. But if you have time and<b=
r>
&gt; energy I would love to see a patch switching to SPDX in as many places=
<br>
&gt; as possible.<br>
<br>
The only part of this patch I actually wrote is the commit message.=C2=A0 T=
he<br>
rest was generatedy by:<br>
<br>
=C2=A0 =C2=A0 git ls-files -z |<br>
=C2=A0 =C2=A0 xargs -0 -- sed -Ei -- &#39;s@(http)(://www\.gnu\.org)@\1s\2@=
g&#39;<br>
<br>
followed by the usual git stuff.=C2=A0 </blockquote><div><br></div><div>Tha=
nk you for doing this; but unfortunately, to feel comfortable giving an &#3=
9;R-b&#39;, we&#39;d want to have some confidence that the new URLs were co=
rrect; making this patch as posted is basically impossible to review, even =
knowing the rune used to create it.</div><div><br></div><div>I think if you=
 specifically focused only on the URL in the license boilerplate (i.e.,=C2=
=A0<a href=3D"http://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_b=
lank">http://www.gnu.org/licenses/</a>), and included the runes used to cre=
ate it in the commit message, then it should be easier to review.</div><div=
><br></div><div>Alternately, if you had some runes you&#39;d used to verify=
 that the new URLs worked, then we could review *that* instead of reviewing=
 all of the individual URLs.</div><div><br></div><div>That said, since it&#=
39;s been suggested that we intend to move over to SPDX entirely, I&#39;d u=
nderstand if you didn&#39;t want to put in the extra effort here.</div><div=
><br></div><div>=C2=A0-George</div></div></div>

--000000000000e5420405f4450719--

