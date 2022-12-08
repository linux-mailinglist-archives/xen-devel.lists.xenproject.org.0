Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C8C646D9F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 11:54:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457035.714871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3EXt-00028T-Mw; Thu, 08 Dec 2022 10:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457035.714871; Thu, 08 Dec 2022 10:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3EXt-00025H-K7; Thu, 08 Dec 2022 10:54:29 +0000
Received: by outflank-mailman (input) for mailman id 457035;
 Thu, 08 Dec 2022 10:54:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vAIj=4G=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1p3EXs-00025A-9E
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 10:54:28 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae995f1f-76e6-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 11:54:27 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id gh17so2933575ejb.6
 for <xen-devel@lists.xenproject.org>; Thu, 08 Dec 2022 02:54:26 -0800 (PST)
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
X-Inumbo-ID: ae995f1f-76e6-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jtADbvUDX+u0ktQL+Civka+FzkUw/naPVODJeSiWUtQ=;
        b=D8ByAjdc/kaZsaO05uGzCl0n868WeUVwlQYeAvEaeLy9dVoSnnL6PrlufN/hGBbt4X
         BRttBV7XFrmwol9wR0hMoN0Y47947Xsj1aogUpv/nTfRbDPmaP3TWDDIalMBj2IosFNL
         /XWdV3V6SsyC/vmc824GLeDQgCevS21YQzRz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtADbvUDX+u0ktQL+Civka+FzkUw/naPVODJeSiWUtQ=;
        b=wE+d/4IhPphR4ReucJi6/SMyFu+Sbt4fhYTkDdTNOMJQgmUjUncUR26nx5uJ2HDx8d
         3Ah+mmmsxQTVTPjYpcNIDrSECU7XTJchEBihWbZppb10O7lSlgmtpKQrZmI5zHKik8wc
         BcD4v5CUqNkfO5DfPdf8d7htwvkxn4Xq3Bv0smKtXm4KsUqWRx4I0pc06PV3WMeFUb93
         UtMUaBZGG3h/H9Fnba4KfoynGLwBGVyCGdHrMIGQ9lBpixZBZDi0rKrLXg83dmyJZkaI
         jI70Q6lQSPaKzOdTbXkui6ns3SgSjcopXiu9/s3D4L+8QMkQJblSqMtC3mOkKQFcbs4y
         Di+g==
X-Gm-Message-State: ANoB5pm/TWUHdCBgERuUECse6YqJMJggYQSFuAqf4tWJkOIaxKEHPc7j
	7/ruLKlK96cFI5098xRqkmlOKMZ/IboeGV8p56J6V8MWpFCMEQ==
X-Google-Smtp-Source: AA0mqf5hwN2PWeF6+8OUg1KXgXwH6AED9voaqDrH9J4wMfZsFlP34CLjy7jaQUIswLa3m0+fQNjYxphVVvBR2vklN70=
X-Received: by 2002:a17:906:7f16:b0:7c0:f2cf:8e09 with SMTP id
 d22-20020a1709067f1600b007c0f2cf8e09mr12643647ejr.257.1670496865678; Thu, 08
 Dec 2022 02:54:25 -0800 (PST)
MIME-Version: 1.0
References: <20221208104924.76637-1-george.dunlap@cloud.com>
In-Reply-To: <20221208104924.76637-1-george.dunlap@cloud.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 8 Dec 2022 10:54:14 +0000
Message-ID: <CA+zSX=ZQPtn5SzhX2N6aFyCfRfN_CsboyB=XkRemCbHf4uhtqQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Clarify check-in requirements for
 mixed-author patches
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: multipart/alternative; boundary="0000000000004719a305ef4edce3"

--0000000000004719a305ef4edce3
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 8, 2022 at 10:49 AM George Dunlap <george.dunlap@cloud.com>
wrote:

> From: George Dunlap <george.dunlap@citrix.com>
>
> There was a question raised recently about the requriements for
> checking in a patch which was originally written by one maintainer,
> then picked up and modified by a second maintainer, and which they now both
> agree should be checked in.
>
> It was proposed that in that case, the following set of tags would suffice:
>
>    Signed-off-by: First Author <...>
>    Signed-off-by: Second Author <...>
>    Reviewed-by: First Author <...>
>
> The rationale was as follows:
>
> 1. The patch will be a mix of code, whose copyright is owned by the
> various authors (or the companies they work for).  It's important to
> keep this information around in the event, for instance, of a license
> change or something else requiring knowledge of the copyright owner.
>
> 2. The Signed-off-by of the Second Author approves not only their own
> code, but First Author's code; the Reviewed-by of the First Author
> approves not only their own code, but the Second Author's code.  Thus
> all the code has been approved by a maintainer, as well as someone who
> was not the author.
>
> In support of this, several arguments were put forward:
>
> * We shouldn't make it harder for maintainers to get their code in
>   than for non-maintiners
>
> * The system we set up should not add pointless bureaucracy; nor
>   discourage collaboration; nor encourage contributors to get around
>   the rules by dropping important information.  (For instance, by
>   removing the first SoB, so that the patch appears to have been
>   written entirely by Second Author.)
>
> Concerns were raised about two maintainers from the same company
> colluding to get a patch in from their company; but such maintainers
> could already collude, by working on the patch in secret, and posting
> it publicly with only a single author's SoB, and having the other
> person review it.
>
> There's also something slightly strange about adding "Reviewed-by" to
> code that you've written; but in the end you're reviewing not only the
> code itself, but the final arrangement of it.  There's no need to
> overcomplicate things.
>
> Encode this in MAINTAINERS as follows:
>
> * Refine the wording of requirement #2 in the check-in policy; such
> that *each change* must have approval from someone other than *the
> person who wrote it*.
>
> * Add a paragraph explicitly stating that the multiple-SoB-approval
>   system satisfies the requirements, and why.
>
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
>

For clarity: As of the community call, we don't have consensus on this; so
we should wait I think at least 2 weeks before checking it in to allow THE
REST to object if they wish (unless we get Acks / R-b's from everyone, of
course).

 -George

--0000000000004719a305ef4edce3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 8, 2022 at 10:49 AM Georg=
e Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com">george.dunlap@cloud=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">From: George Dunlap &lt;<a href=3D"mailto:george.dunlap@citrix.com" tar=
get=3D"_blank">george.dunlap@citrix.com</a>&gt;<br>
<br>
There was a question raised recently about the requriements for<br>
checking in a patch which was originally written by one maintainer,<br>
then picked up and modified by a second maintainer, and which they now both=
<br>
agree should be checked in.<br>
<br>
It was proposed that in that case, the following set of tags would suffice:=
<br>
<br>
=C2=A0 =C2=A0Signed-off-by: First Author &lt;...&gt;<br>
=C2=A0 =C2=A0Signed-off-by: Second Author &lt;...&gt;<br>
=C2=A0 =C2=A0Reviewed-by: First Author &lt;...&gt;<br>
<br>
The rationale was as follows:<br>
<br>
1. The patch will be a mix of code, whose copyright is owned by the<br>
various authors (or the companies they work for).=C2=A0 It&#39;s important =
to<br>
keep this information around in the event, for instance, of a license<br>
change or something else requiring knowledge of the copyright owner.<br>
<br>
2. The Signed-off-by of the Second Author approves not only their own<br>
code, but First Author&#39;s code; the Reviewed-by of the First Author<br>
approves not only their own code, but the Second Author&#39;s code.=C2=A0 T=
hus<br>
all the code has been approved by a maintainer, as well as someone who<br>
was not the author.<br>
<br>
In support of this, several arguments were put forward:<br>
<br>
* We shouldn&#39;t make it harder for maintainers to get their code in<br>
=C2=A0 than for non-maintiners<br>
<br>
* The system we set up should not add pointless bureaucracy; nor<br>
=C2=A0 discourage collaboration; nor encourage contributors to get around<b=
r>
=C2=A0 the rules by dropping important information.=C2=A0 (For instance, by=
<br>
=C2=A0 removing the first SoB, so that the patch appears to have been<br>
=C2=A0 written entirely by Second Author.)<br>
<br>
Concerns were raised about two maintainers from the same company<br>
colluding to get a patch in from their company; but such maintainers<br>
could already collude, by working on the patch in secret, and posting<br>
it publicly with only a single author&#39;s SoB, and having the other<br>
person review it.<br>
<br>
There&#39;s also something slightly strange about adding &quot;Reviewed-by&=
quot; to<br>
code that you&#39;ve written; but in the end you&#39;re reviewing not only =
the<br>
code itself, but the final arrangement of it.=C2=A0 There&#39;s no need to<=
br>
overcomplicate things.<br>
<br>
Encode this in MAINTAINERS as follows:<br>
<br>
* Refine the wording of requirement #2 in the check-in policy; such<br>
that *each change* must have approval from someone other than *the<br>
person who wrote it*.<br>
<br>
* Add a paragraph explicitly stating that the multiple-SoB-approval<br>
=C2=A0 system satisfies the requirements, and why.<br>
<br>
Signed-off-by: George Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com"=
 target=3D"_blank">george.dunlap@cloud.com</a>&gt;<br></blockquote><div><br=
></div><div>For clarity: As of the community call, we don&#39;t have consen=
sus on this; so we should wait I think at least 2 weeks before checking it =
in to allow THE REST to object if they wish (unless we get Acks / R-b&#39;s=
 from everyone, of course).</div><div><br></div><div>=C2=A0-George</div></d=
iv></div>

--0000000000004719a305ef4edce3--

