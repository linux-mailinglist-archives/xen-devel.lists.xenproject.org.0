Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 393A4737D3F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 10:24:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552535.862670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBt81-0000Hq-8d; Wed, 21 Jun 2023 08:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552535.862670; Wed, 21 Jun 2023 08:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBt81-0000Fg-4Q; Wed, 21 Jun 2023 08:23:49 +0000
Received: by outflank-mailman (input) for mailman id 552535;
 Wed, 21 Jun 2023 08:23:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ii2n=CJ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qBt7y-0000Fa-QT
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 08:23:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef75bded-100c-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 10:23:44 +0200 (CEST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 03B954EE0741
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 10:23:44 +0200 (CEST)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-440ad8ea514so1146450137.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 01:23:43 -0700 (PDT)
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
X-Inumbo-ID: ef75bded-100c-11ee-8611-37d641c3527e
X-Gm-Message-State: AC+VfDxcUIUthqr/VnQHEKeadtWLQVyDM4WljfQX1215KEpa+a4a45wv
	jW+hQeWkuSBPJOee6Iu6Fursxnvwub5ZGWsSeR0=
X-Google-Smtp-Source: ACHHUZ4Qdos8w0VtMhZVyXu1zOF/k3b+oTGSXOgBqM5/UGFphu5EE/CbShaPQIBlDNTG6ShP116nJVNWQlM9gw3LVzM=
X-Received: by 2002:a67:db87:0:b0:440:c0dd:e7f7 with SMTP id
 f7-20020a67db87000000b00440c0dde7f7mr3169988vsk.4.1687335822711; Wed, 21 Jun
 2023 01:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <8aff4bc56b29372345e828462766d803b8c9b710.1687250177.git.gianluca.luparini@bugseng.com>
 <e737bdd5-e00d-ccfa-8d40-2e6cf846ed84@suse.com>
In-Reply-To: <e737bdd5-e00d-ccfa-8d40-2e6cf846ed84@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Date: Wed, 21 Jun 2023 10:23:31 +0200
X-Gmail-Original-Message-ID: <CAFHJcJt8HXcKMabwiWaqCVWC2q316_1ugj79Hvk-Aue6ASOa1Q@mail.gmail.com>
Message-ID: <CAFHJcJt8HXcKMabwiWaqCVWC2q316_1ugj79Hvk-Aue6ASOa1Q@mail.gmail.com>
Subject: Re: [XEN PATCH 05/13] xen/common: fixed violations of MISRA C:2012
 Rule 7.2
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Gianluca Luparini <gianluca.luparini@bugseng.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, Ayan Kumar <ayan.kumar.halder@amd.com>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000054623505fe9f7c33"

--00000000000054623505fe9f7c33
Content-Type: text/plain; charset="UTF-8"

Il giorno mar 20 giu 2023 alle ore 14:43 Jan Beulich <jbeulich@suse.com> ha
scritto:

> On 20.06.2023 12:34, Simone Ballarin wrote:
> > From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> >
> > The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> > "A "u" or "U" suffix shall be applied to all integer constants that are
> represented in an unsigned type".
> >
> > I propose to use "U" as a suffix to explicitly state when an integer
> constant is represented in an unsigned type.
> >
> > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > ---
> >  xen/common/device_tree.c        | 4 ++--
> >  xen/include/xen/libfdt/fdt.h    | 2 +-
> >  xen/include/xen/libfdt/libfdt.h | 2 +-
> >  3 files changed, 4 insertions(+), 4 deletions(-)
>
> I think me and a few other people being on Cc here is attributed to the
> (misleading) title. The set of touched files fully maps to "DEVICE TREE"
> in ./MAINTAINERS afaict, which the prefix in the title would then also
> be nice to express.
>

Yes, my bad. I will fix the commit name.


> That said I'm not sure whether libfdt code actually wants touching this
> way.
>
Yes, you are right. libfdt is out of scope. I will remove the changes in it.

>
> Jan
>


-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com
<http://bugseng.com>)

--00000000000054623505fe9f7c33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Il giorno mar 20 giu 2023 alle ore 14:43 =
Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_blank">jbeu=
lich@suse.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 20.06.2023 12:34, Simone Ballarin wrote:<br>
&gt; From: Gianluca Luparini &lt;<a href=3D"mailto:gianluca.luparini@bugsen=
g.com" target=3D"_blank">gianluca.luparini@bugseng.com</a>&gt;<br>
&gt; <br>
&gt; The xen sources contains violations of MISRA C:2012 Rule 7.2 whose hea=
dline states:<br>
&gt; &quot;A &quot;u&quot; or &quot;U&quot; suffix shall be applied to all =
integer constants that are represented in an unsigned type&quot;.<br>
&gt; <br>
&gt; I propose to use &quot;U&quot; as a suffix to explicitly state when an=
 integer constant is represented in an unsigned type.<br>
&gt; <br>
&gt; Signed-off-by: Simone Ballarin &lt;<a href=3D"mailto:simone.ballarin@b=
ugseng.com" target=3D"_blank">simone.ballarin@bugseng.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 xen/common/device_tree.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt;=C2=A0 xen/include/xen/libfdt/fdt.h=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 xen/include/xen/libfdt/libfdt.h | 2 +-<br>
&gt;=C2=A0 3 files changed, 4 insertions(+), 4 deletions(-)<br>
<br>
I think me and a few other people being on Cc here is attributed to the<br>
(misleading) title. The set of touched files fully maps to &quot;DEVICE TRE=
E&quot;<br>
in ./MAINTAINERS afaict, which the prefix in the title would then also<br>
be nice to express.<br></blockquote><div>=C2=A0</div><div>Yes, my bad. I wi=
ll fix the commit name. <br></div><div><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
That said I&#39;m not sure whether libfdt code actually wants touching this=
<br>
way.<br></blockquote><div>Yes, you are right. libfdt is out of scope. I wil=
l remove the changes in it.<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
Jan<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr">Simone Ballarin, M.Sc.<br><br><div>Field Application Engineer, BUGSENG =
(<a href=3D"http://bugseng.com" target=3D"_blank">https://bugseng.com</a>)<=
/div></div></div></div>

--00000000000054623505fe9f7c33--

