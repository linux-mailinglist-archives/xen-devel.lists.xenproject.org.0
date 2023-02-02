Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F38216879C2
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 11:05:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488625.756782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNWSb-0000CM-Iy; Thu, 02 Feb 2023 10:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488625.756782; Thu, 02 Feb 2023 10:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNWSb-0000AQ-G5; Thu, 02 Feb 2023 10:04:53 +0000
Received: by outflank-mailman (input) for mailman id 488625;
 Thu, 02 Feb 2023 10:04:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H2wX=56=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pNWSa-0000AJ-EG
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 10:04:52 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05b97a15-a2e1-11ed-b63b-5f92e7d2e73a;
 Thu, 02 Feb 2023 11:04:47 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id bk15so4385187ejb.9
 for <xen-devel@lists.xenproject.org>; Thu, 02 Feb 2023 02:04:48 -0800 (PST)
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
X-Inumbo-ID: 05b97a15-a2e1-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MQDiLZo7zTWXPLch69kob9AYmFaKQp5JLZ/Kup7RSmw=;
        b=CbEyipfp6XEPDGORaqazWtoePPd7FsnWFxWc/sPlrdV9hWgennvo7g5JTVsXPj44to
         R67li+Id1XZzUmSbfvfMrxYllaNLUk3qtzhjTMIrxsqU+adTcExsHzsFst8/Bm/pIqwE
         LkGlIi6g+LOphoMwFQbVeu+aU/UuC+PgTMMxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQDiLZo7zTWXPLch69kob9AYmFaKQp5JLZ/Kup7RSmw=;
        b=hDJ7c6E6lCDlvHwSTD7ZdoC7KfWf3bbBgOHG8rn71PcoEixbDJLA3xbwdU2VKdy0TZ
         8AV9GiOnGPTv8tqWtJDN/NGpTMC92XH3jklAsVdSsgP7e6l+qr77omcqbtXpBH3brREd
         CbRhxMvEJcVmRreJaczt2ZxPtw6CsHLNn+2cTrmipx34fD73dFsZst5FhhlKuJAjHIqJ
         zjakXUPcpYYYCu3TfLWss6/IOfZMVTN8ZOqC17l2g15S1eDBLeZTDSaa+NmjoQpOThKH
         qMr84owRTj5GYdue11B/dUpeVCGIloD9/0fY5EbuYQtC6GV/XDZXr5QvTd5+Z4J0a4re
         iW6g==
X-Gm-Message-State: AO0yUKV/WGj1j4QT0veqTPi9zpL+LP1xYdZIAvSRPyRV3I8rv6HRvV8y
	gNT/JbOSg54mccRgdzeiUgYcwIq8By3mtGssoYfyaQ==
X-Google-Smtp-Source: AK7set+aDB8eCGU7tcCR6hKyAYPMkRAd95qykUBBqHOhAIPAHAV92fYAfSQTTFIpvLn7i+ZRvLvYo5W7th+7Up9Tp1g=
X-Received: by 2002:a17:906:31cf:b0:850:2768:735e with SMTP id
 f15-20020a17090631cf00b008502768735emr1791639ejf.64.1675332288477; Thu, 02
 Feb 2023 02:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20230120220004.7456-1-andrew.cooper3@citrix.com>
 <AS8PR08MB79918B0D0329A2B722B773EB92CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9abcfc06-1401-cdb7-a1f1-670cd307a593@srcf.net> <CA+zSX=ZdQi5RsSUPRTKyY63=--GoXwea-MXyN7xbovKeo9jRug@mail.gmail.com>
 <AS8PR08MB7991C8898F8008BB64E4DCB092D69@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB7991C8898F8008BB64E4DCB092D69@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 2 Feb 2023 10:04:37 +0000
Message-ID: <CA+zSX=b76sAFdTcvwJ4kF-kRnwo9x8jmG8QoGmROrnADm40xLw@mail.gmail.com>
Subject: Re: [PATCH] Changelog: Add details about new features for SPR
To: Henry Wang <Henry.Wang@arm.com>
Cc: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
Content-Type: multipart/alternative; boundary="000000000000ef90e305f3b4b177"

--000000000000ef90e305f3b4b177
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 2, 2023 at 2:05 AM Henry Wang <Henry.Wang@arm.com> wrote:

> Hi George,
>
>
>
> > From: George Dunlap <george.dunlap@cloud.com>
>
> > Subject: Re: [PATCH] Changelog: Add details about new features for SPR
>
> >
>
> > One approach would be to have someone / something (either the release
> manager, or an automated script)
>
>
>
> An automated script would be best if possible IMHO, as the email
>
> content would be pretty much fixed/predictable and the email is
>
> sent periodically.
>
>
>
> > periodically (monthly?  Bi-weekly?) email each maintainer a list of the
> commits under their remit, with an encouragement to consider what entries
> could be added to CHANGELOG.md.  i.e., something like this:
>
> >
>
> > 8<---
>
> > Dear $MAINTAINER_NAME,
>
> >
>
> > During the last $TIME_PERIOD, the commits below have been checked into
> the tree which modify code under your maintainership.  Please ensure that
> necessary changes to CHANGELOG.md have also been comitted.
>
> >
>
> > Thanks,
>
> > $SENDER
>
> >
>
> > $GIT_LOG
>
> > ---->8
>
> >
>
> > Ideally this would prompt maintainers to get into the habit of always
> asking for CHANGELOG entries to be added during review (which would also
> get developers into the habit of always including them); at which point the
> maintainers could just skim the commits in the email and only add he odd
> CHANGELOG that they may have forgotten.
>
> >
>
> > Thoughts?
>
>
>
> I like this idea very much :) Just a small question: As a developer, it is
>
> not really clear to me that under what criteria would a patch/series
>
> deserve for a changelog entry. Personally I would try to include the
>
> CHANGELOG into my changes in the future if this criteria is cleared.
>

What I would personally like to see is something that can create a document
like this:

https://go.dev/doc/go1.20

I'm not sure exactly how to quantify that level of description; nor exactly
what other people have in mind.

 -George

>

--000000000000ef90e305f3b4b177
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 2, 2023 at 2:05 AM Henry =
Wang &lt;<a href=3D"mailto:Henry.Wang@arm.com">Henry.Wang@arm.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"msg8507475333917824981">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_8507475333917824981WordSection1">
<p class=3D"MsoNormal">Hi George,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">&gt; From: George Dunlap &lt;<a href=3D"mailto:georg=
e.dunlap@cloud.com" target=3D"_blank">george.dunlap@cloud.com</a>&gt; <u></=
u><u></u></p>
<p class=3D"MsoNormal">&gt; Subject: Re: [PATCH] Changelog: Add details abo=
ut new features for SPR<u></u><u></u></p>
<p class=3D"MsoNormal">&gt;<u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">&gt; One approach would be to have someone / somethi=
ng (either the release manager, or an automated script)
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">An automated script would be best if possible IMHO, =
as the email<u></u><u></u></p>
<p class=3D"MsoNormal">content would be pretty much fixed/predictable and t=
he email is<u></u><u></u></p>
<p class=3D"MsoNormal">sent periodically. <u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">&gt; periodically (monthly?=C2=A0 Bi-weekly?) email =
each maintainer a list of the commits under their remit, with an encouragem=
ent to consider what entries could be added to CHANGELOG.md.=C2=A0 i.e., so=
mething like this:<u></u><u></u></p>
<p class=3D"MsoNormal">&gt;<u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">&gt; 8&lt;---<u></u><u></u></p>
<p class=3D"MsoNormal">&gt; Dear $MAINTAINER_NAME,<u></u><u></u></p>
<p class=3D"MsoNormal">&gt;<u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">&gt; During the last $TIME_PERIOD, the commits below=
 have been checked into the tree which modify code under your maintainershi=
p.=C2=A0 Please ensure that necessary changes to CHANGELOG.md have also bee=
n comitted.<u></u><u></u></p>
<p class=3D"MsoNormal">&gt;<u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">&gt; Thanks,<u></u><u></u></p>
<p class=3D"MsoNormal">&gt;=C2=A0$SENDER<u></u><u></u></p>
<p class=3D"MsoNormal">&gt;<u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">&gt; $GIT_LOG<u></u><u></u></p>
<p class=3D"MsoNormal">&gt; ----&gt;8<u></u><u></u></p>
<p class=3D"MsoNormal">&gt;<u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">&gt; Ideally this would prompt maintainers to get in=
to the habit of always asking for CHANGELOG entries to be added during revi=
ew (which would also get developers into the habit of always including them=
); at which point the maintainers could
 just skim the commits in the email and only add he odd CHANGELOG that they=
 may have forgotten.<u></u><u></u></p>
<p class=3D"MsoNormal">&gt;<u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">&gt; Thoughts?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I like this idea very much :) Just a small question:=
 As a developer, it is<u></u><u></u></p>
<p class=3D"MsoNormal">not really clear to me that under what criteria woul=
d a patch/series<u></u><u></u></p>
<p class=3D"MsoNormal">deserve for a changelog entry. Personally I would tr=
y to include the<u></u><u></u></p>
<p class=3D"MsoNormal">CHANGELOG into my changes in the future if this crit=
eria is cleared.</p></div></div></div></blockquote><div><br></div><div>What=
 I would personally like to see is something that can create a document lik=
e this:</div><div><br></div><div><a href=3D"https://go.dev/doc/go1.20">http=
s://go.dev/doc/go1.20</a><br></div><div><br></div><div>I&#39;m not sure exa=
ctly how to quantify that level of description; nor exactly what other peop=
le have in mind.</div><div><br></div><div>=C2=A0-George</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div class=3D"msg8507475333917824981"><=
div lang=3D"EN-US" style=3D"overflow-wrap: break-word;"><div class=3D"m_850=
7475333917824981WordSection1">
</div>
</div>

</div></blockquote></div></div>

--000000000000ef90e305f3b4b177--

