Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0EB72C9BC
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 17:20:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547310.854628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8jKz-000121-44; Mon, 12 Jun 2023 15:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547310.854628; Mon, 12 Jun 2023 15:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8jKz-0000zg-0Z; Mon, 12 Jun 2023 15:20:09 +0000
Received: by outflank-mailman (input) for mailman id 547310;
 Mon, 12 Jun 2023 15:20:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSOl=CA=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1q8jKx-0000yI-H3
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 15:20:07 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c6c4bee-0934-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 17:20:06 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b1bdfe51f8so66427281fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 08:20:06 -0700 (PDT)
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
X-Inumbo-ID: 9c6c4bee-0934-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1686583206; x=1689175206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9STugGM9E7fBDOgF9MU/+Q3JjBle1xujN0bX4eP8zgo=;
        b=aAkSUnr5fOM3YUzjcBKtdI+fC23E//NPs/VIch2u0xJF4e7Lj+EiDHUXRDXy2KTxOL
         XDurBjWTjrBfQHO/13ngI5r0JaId8LFCVHCBTUI0BzY6GkbgyYwVRiLsIXByuhuZJ7+J
         24egTuBVJsjGXQJnj2k05YMwDDFfftlyjqxpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686583206; x=1689175206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9STugGM9E7fBDOgF9MU/+Q3JjBle1xujN0bX4eP8zgo=;
        b=MhEcDbA7r9JLiZHArufRs+6x/4lWOnLY+lh3stcGuA6XyAKOKYjeb4Cmh2D/Tv4nfh
         +W0iVt5FjCGSVZ7kfSsXtAI2FRV83yT5tIoOLoZm5g6GI3M1HfdQSLiU5yNN7Fxs3lMt
         EBReX9khTUHPse7N/oB/A5uPmzk+kyX2zEAY+qOEPPstmlk0y3FzZWs/e012oSYhC4e4
         Hnk2W3Mm97l8OGMcW683IfKTvPGmuAE9tId7QKfE2VZ0mTUugjhdqcHo6sGP+tBFRa4m
         mPjoNVtvfuynYhvhLED4Wifryk0z9yvi3CQz6yULf9J6o9UbMCqG/RrNew13RZf3DYl9
         IfIg==
X-Gm-Message-State: AC+VfDyUp0mvVLxJH6RU/EfLq/y8m5oq8nohD508kkNC+Aq5j62U1c8N
	6OxSbQRgccaqkHdmTCjdcAtkOeKjJab7T58p2Cuv4w==
X-Google-Smtp-Source: ACHHUZ7vEiezo+cbwkhm6uxhqEZgiDR0smkutLS0ZLDSa/6jgOBYqG+1+MUWkIM5ru1uo3Y76aGLRrgLs3nKUTKIzxU=
X-Received: by 2002:a2e:3314:0:b0:2a8:baea:2554 with SMTP id
 d20-20020a2e3314000000b002a8baea2554mr2361748ljc.3.1686583205740; Mon, 12 Jun
 2023 08:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1686148363.git.shawn@anastas.io> <e9a4878544d264688578d7899867df7e8207aba5.1686148363.git.shawn@anastas.io>
 <0c0a19de-dde3-8b98-4354-6d3d2019179b@suse.com> <0b24d36b-adbc-9e7c-df6e-8754c269855d@citrix.com>
 <d0d9b1be-a9e2-fff9-d631-149086ea1dfe@suse.com> <d52feaa7-4217-973e-19fe-9ec027eed5fc@citrix.com>
 <1c35f696-5a65-06da-8af5-685b8ad2e849@xen.org> <e16bcfa1-2b40-6bf0-57c9-5045ae1fdf80@citrix.com>
 <bcbab76d-ca8c-0772-3a9f-59fef3a2b5f5@xen.org> <CT87KSPVSBUG.2C4SWW2EDTA5Z@Shawns-Mac-mini.lan>
 <3a7eca41-0ecf-4bf1-1daf-9d66f4aa6400@xen.org>
In-Reply-To: <3a7eca41-0ecf-4bf1-1daf-9d66f4aa6400@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 12 Jun 2023 16:19:54 +0100
Message-ID: <CA+zSX=bZ7yx90geyCo3x0jxJy7X2f4E2XiazYEn0EDE+4O==pQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] xen/ppc: Implement early serial printk on PaPR/pseries
To: Julien Grall <julien@xen.org>
Cc: Shawn Anastasio <shawn@anastas.io>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, tpearson@raptorengineering.com, 
	George Dunlap <george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Shawn Anastasio <shawnanastasio@raptorengineering.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000dcda4205fdf0408f"

--000000000000dcda4205fdf0408f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 9, 2023 at 5:07=E2=80=AFPM Julien Grall <julien@xen.org> wrote:

> Hi Shawn,
>
> On 09/06/2023 16:01, Shawn Anastasio wrote:
> > On Fri Jun 9, 2023 at 5:12 AM CDT, Julien Grall wrote:
> >> Strictly speaking we can refuse any code. That count for license as
> >> well. Anyway, I didn't request a change here. I merely pointed out tha=
t
> >> any use of GPLv2+ should be justified because on Arm most of the peopl=
e
> >> don't pay attention on the license and pick the one from an existing
> file.
> >
> > Hi Julien,
> >
> > The choice of GPLv2+ for many of the files in this patchset was indeed
> > inherited from old IBM-written Xen code that the files in question were
> > derived from. I did not realize it was permissible or even desirable to
> > relicense those to GPLv2-only.
> >
> > As for the new files, GPLv2+ was chosen to remain consistent and to ope=
n
> > the door for future derivations from GPLv2+ licensed code, either from
> > the older Xen tree or from the Linux ppc tree, much of which is also
> > licensed as GPLv2+. If it would reduce friction, these files could be
> > relicensed to GPLv2-only.
>
> (Before someone points out, I know this is already a problem on other
> part of Xen. But it would be ideal if we avoid spreading this mess on
> new architectures :).
>
> Thanks for the explanations. To clarify, are you saying that all the
> files will be GPLv2+ or just some?
>
> If the latter, then my concern would be that if you need to import
> GPLv2-only code, then you may need to write your code in a different
> file. This may become messy to handle and some developer may end up to
> be confused.
>
> I am not a lawyer though, so you may want to check the implications here.
>

Shawn,

Again sorry that you've sort of bumped a hornet's nest here.

Just to clarify, the situation as I understand it is:

1. Large parts of Xen, being inherited from the Linux Kernel, are
GPLv2-only; and the documentation clearly states that code is GPLv2-only
unless explicitly stated otherwise.

2. Some individual files in Xen are labelled as GPLv2-or-later; but as they
rely on the "only" files, Xen as a whole can only be compiled under a GPLv2
license.

3. New contributions to a file assumed to have the same license as the
header of the file; i.e., the code contained in patches to GPLv2-or-later
files is assumed to be granted according to a GPLv2-or-later license.

4. In the past, the legal teams of some contributors -- namely ARM -- were
wary of the GPLv3; specifically the patent grant.  Since ARM doesn't make
anything themselves, their patents are literally their product; they need
to be very careful of not accidentally granting them to the world.  I think
one thing ARM may have been afraid of at some point is one of their
engineers accidentally submitting a patch to a GPLv2-or-later file which
would, when taken with a GPLv3 (or GPLv4 license, once it comes out) cause
them to lose too much control over their IP.

My understanding is that Julien is afraid that if the "GPLv2-or-later"
files start to proliferate, that companies like ARM will start to become
more wary of contributing; and so has been generally trying to encourage
new files to be labelled "GPLv2-only" unless there's a good reason to do
otherwise.  (Other issues like copying code from GPLv2-only are potential
pitfalls as well, but probably less important.)

HOWEVER, as Andrew says, there is no official policy at this point; all the
document say is that GPLv2-only is the default unless explicitly stated
otherwise.

Furthermore, the concerns raised by ARM's legal team were nearly a decade
ago; it's not clear to me whether they still care that much.

All that to say: If you don't mind and feel that you can do so legally,
then consider switching to GPLv2-only; but if you don't want to and/or feel
that you can't do so legally, feel free to leave it as-is.

Additionally, I think it would be good if the community *did* have a
discussion about whether we want an official policy; so that either we can
point people to the relevant doc (with explanation), or stop bothering
about it. :-)

 -George

--000000000000dcda4205fdf0408f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 9, 2023 at 5:07=E2=80=AFP=
M Julien Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Shawn=
,<br>
<br>
On 09/06/2023 16:01, Shawn Anastasio wrote:<br>
&gt; On Fri Jun 9, 2023 at 5:12 AM CDT, Julien Grall wrote:<br>
&gt;&gt; Strictly speaking we can refuse any code. That count for license a=
s<br>
&gt;&gt; well. Anyway, I didn&#39;t request a change here. I merely pointed=
 out that<br>
&gt;&gt; any use of GPLv2+ should be justified because on Arm most of the p=
eople<br>
&gt;&gt; don&#39;t pay attention on the license and pick the one from an ex=
isting file.<br>
&gt; <br>
&gt; Hi Julien,<br>
&gt; <br>
&gt; The choice of GPLv2+ for many of the files in this patchset was indeed=
<br>
&gt; inherited from old IBM-written Xen code that the files in question wer=
e<br>
&gt; derived from. I did not realize it was permissible or even desirable t=
o<br>
&gt; relicense those to GPLv2-only.<br>
&gt; <br>
&gt; As for the new files, GPLv2+ was chosen to remain consistent and to op=
en<br>
&gt; the door for future derivations from GPLv2+ licensed code, either from=
<br>
&gt; the older Xen tree or from the Linux ppc tree, much of which is also<b=
r>
&gt; licensed as GPLv2+. If it would reduce friction, these files could be<=
br>
&gt; relicensed to GPLv2-only.<br>
<br>
(Before someone points out, I know this is already a problem on other <br>
part of Xen. But it would be ideal if we avoid spreading this mess on <br>
new architectures :).<br>
<br>
Thanks for the explanations. To clarify, are you saying that all the <br>
files will be GPLv2+ or just some?<br>
<br>
If the latter, then my concern would be that if you need to import <br>
GPLv2-only code, then you may need to write your code in a different <br>
file. This may become messy to handle and some developer may end up to <br>
be confused.<br>
<br>
I am not a lawyer though, so you may want to check the implications here.<b=
r></blockquote><div><br></div><div>Shawn,</div><div><br></div><div>Again so=
rry that you&#39;ve sort of bumped a hornet&#39;s nest here.</div><div><br>=
</div><div>Just to clarify, the situation as I understand it is:</div><div>=
<br></div><div>1. Large parts of Xen, being inherited from the Linux Kernel=
, are GPLv2-only; and the documentation clearly states that code is GPLv2-o=
nly unless explicitly stated otherwise.</div><div><br></div><div>2. Some in=
dividual files in Xen are labelled as GPLv2-or-later; but as they rely on t=
he &quot;only&quot; files, Xen as a whole can only be compiled under a GPLv=
2 license.</div><div><br></div><div>3. New contributions to a file assumed =
to have the same license as the header of the file; i.e., the code containe=
d in patches to GPLv2-or-later files is assumed to be granted according to =
a GPLv2-or-later license.</div><div><br></div><div>4. In the past, the lega=
l teams of some contributors -- namely ARM -- were wary of the GPLv3; speci=
fically the patent grant.=C2=A0 Since ARM doesn&#39;t make anything themsel=
ves, their patents are literally their product; they need to be very carefu=
l of not accidentally granting them to the world.=C2=A0 I think one thing A=
RM may have been afraid of at some point is one of their engineers accident=
ally submitting a patch to a GPLv2-or-later file which would, when taken wi=
th a GPLv3 (or GPLv4 license, once it comes out) cause them to lose too muc=
h control over their IP.</div><div><br></div><div>My understanding is that =
Julien is afraid that if the &quot;GPLv2-or-later&quot; files start to prol=
iferate, that companies like ARM will start to become more wary of contribu=
ting; and so has been generally trying to encourage new files to be labelle=
d &quot;GPLv2-only&quot; unless there&#39;s a good reason to do otherwise.=
=C2=A0 (Other issues like copying code from GPLv2-only are potential pitfal=
ls as well, but probably less important.)</div><div><br></div><div>HOWEVER,=
 as Andrew says, there is no official policy at this point; all the documen=
t say is that GPLv2-only is the default unless explicitly stated otherwise.=
</div><div><br></div><div>Furthermore, the concerns raised by ARM&#39;s leg=
al team were nearly a decade ago; it&#39;s not clear to me whether they sti=
ll care that much.</div><div><br></div><div>All that to say: If you don&#39=
;t mind and feel that you can do so legally, then consider switching to GPL=
v2-only; but if you don&#39;t want to and/or feel that you can&#39;t do so =
legally, feel free to leave it as-is.</div><div><br></div><div>Additionally=
, I think it would be good if the community *did* have a discussion about w=
hether we want an official policy; so that either we can point people to th=
e relevant doc (with explanation), or stop bothering about it. :-)</div><di=
v><br></div><div>=C2=A0-George</div><div><br></div><div><br></div></div></d=
iv>

--000000000000dcda4205fdf0408f--

