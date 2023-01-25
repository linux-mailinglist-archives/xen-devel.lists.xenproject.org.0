Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3249C67B127
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 12:27:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484269.750819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKdvx-0005wl-9Q; Wed, 25 Jan 2023 11:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484269.750819; Wed, 25 Jan 2023 11:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKdvx-0005up-6c; Wed, 25 Jan 2023 11:27:17 +0000
Received: by outflank-mailman (input) for mailman id 484269;
 Wed, 25 Jan 2023 11:27:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=usdV=5W=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pKdvv-0004xI-TY
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 11:27:16 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37cb554e-9ca3-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 12:27:14 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id hw16so46690185ejc.10
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 03:27:14 -0800 (PST)
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
X-Inumbo-ID: 37cb554e-9ca3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m0cgVc512nKxxMxutLRM21GmDwdiwS769D7xbBd8UtA=;
        b=Sgw2BAFQKH4kfDnafvNiVrSlz4xLavNLjnyd8NgWGM7NNbhnXiFWwAvUDunh/O7txi
         Kowm6Kgy8OdLUZq/GLDhqme13diQfgFyW/o6A5aPNQECJJr5Pn/15cqDQ41mfJst3c5a
         dDLyqC40TsrQkTwgEsrIaMEWdfawlYMRISukQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m0cgVc512nKxxMxutLRM21GmDwdiwS769D7xbBd8UtA=;
        b=KIMdZDzR/qs4d7bTi3il5LoJPOSVKS3EvFt0dqzclBWKxgnYstslLlk0jU99OREakN
         aLjajbUbcLe2B10rT/Aqb/uCdLUwEgBoC0++eGEIPjQP3NLlGuzzf5XWPBu+5oERUbe8
         0dIaW3UAgJSkaYVyzwVLqvXC4OzUY4qNSaHdnwAb6xOdXrprLVSTGYZIYjTJmPrIjkZA
         900qazGd5CEcgze+5KHunrWp1NXMo6isqeLPmFuaMCj6gu++hVFsw/eOQC3F+NNRmNnV
         oYz+1GI96ULGYpAWDBRfloZkKdQxsHl/P3n0gWqrqWpbUd7ZhAEUjYyw9Y7Jf/6o60xQ
         B+Rg==
X-Gm-Message-State: AFqh2kowRFHZXD0fZQVowYcHMWKhiD7PXuUWMsKW6tghUh3WtVH8iZnI
	9WzKPCprFtmFmisPzKYpfbJF2vme6WddTZCtWAqX8Q==
X-Google-Smtp-Source: AMrXdXvF1luSpkwLOMxmHKNO87j6NmqDCbLqUoaIUkvwN3Ld0ih9sxMsnHz3B5zJWy1GL7ZqtMFhYTzcfxbmpbH+QRc=
X-Received: by 2002:a17:906:9156:b0:83f:cbc0:1b32 with SMTP id
 y22-20020a170906915600b0083fcbc01b32mr3683617ejw.296.1674646034571; Wed, 25
 Jan 2023 03:27:14 -0800 (PST)
MIME-Version: 1.0
References: <CAFD1rPdT5Tod+qdit50EWBN6WyRuK2ybb2G2HmOAayAV7uyBuA@mail.gmail.com>
 <7ddac120-29c5-d4fa-2bc7-9da6b1cf2dd9@citrix.com> <CAFD1rPfv1jCNkcPP1KBLDr1e+_aa7+aCphVTjZG-xAnbkcnNGQ@mail.gmail.com>
In-Reply-To: <CAFD1rPfv1jCNkcPP1KBLDr1e+_aa7+aCphVTjZG-xAnbkcnNGQ@mail.gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 25 Jan 2023 11:27:03 +0000
Message-ID: <CA+zSX=YW7tFzmreeh1YXaVoseUBjadsrCNRA8f5vf4EoknA2=g@mail.gmail.com>
Subject: Re: Usage of Xen Security Data in VulnerableCode
To: Tushar Goel <tushar.goel.dav@gmail.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Xen Security <security@xen.org>, 
	Philippe Ombredanne <pombredanne@nexb.com>, jmhoran@nexb.com
Content-Type: multipart/alternative; boundary="00000000000003fed105f314ea5c"

--00000000000003fed105f314ea5c
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 19, 2023 at 1:10 PM Tushar Goel <tushar.goel.dav@gmail.com>
wrote:

> Hi Andrew,
>
> > Maybe we want to make it CC-BY-4 to require people to reference back to
> > the canonical upstream ?
> Thanks for your response, can we have a more declarative statement on
> the license from your end
> and also can you please provide your acknowledgement over the usage of
> Xen security data in vulnerablecode.
>

Hey Tushar,

Informally, the Xen Project Security Team is happy for you to include the
data from xsa.json in your open-source vulnerability database.  As a
courtesy we'd request that it be documented where the information came
from.  (I think if the data includes links to then advisories on our
website, that will suffice.)

Formally, we're not copyright lawyers; but we don't think there's anything
copyright-able in the xsa.json: There is no editorial or creative control
in the generation of that file; it's just a collection of facts which you
could re-generate by scanning all the advisories.  (In fact that's exactly
how the file is created; i.e., the collection of advisory texts is our
"source of truth".)

We do have "Officially license all advisory text as CC-BY-4" on our to-do
list; if you'd be more comfortable with an official license for xsa.json as
well, we can add that to the list.

 -George

--00000000000003fed105f314ea5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 19, 2023 at 1:10 PM Tusha=
r Goel &lt;<a href=3D"mailto:tushar.goel.dav@gmail.com">tushar.goel.dav@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hi Andrew,<br>
<br>
&gt; Maybe we want to make it CC-BY-4 to require people to reference back t=
o<br>
&gt; the canonical upstream ?<br>
Thanks for your response, can we have a more declarative statement on<br>
the license from your end<br>
and also can you please provide your acknowledgement over the usage of<br>
Xen security data in vulnerablecode.<br></blockquote><div><br></div><div>He=
y Tushar,</div><div><br></div><div>Informally, the Xen Project Security Tea=
m is happy for you to include the data from xsa.json in your open-source vu=
lnerability database.=C2=A0 As a courtesy we&#39;d request that it be docum=
ented where the information came from.=C2=A0 (I think if the data includes =
links to then advisories on our website, that will suffice.)</div><div><br>=
</div><div>Formally, we&#39;re not copyright lawyers; but we don&#39;t thin=
k there&#39;s anything copyright-able in the xsa.json: There is no editoria=
l or creative control in the generation of that file; it&#39;s just a colle=
ction of facts which you could re-generate by scanning all the advisories.=
=C2=A0 (In fact that&#39;s exactly how the file is created; i.e., the colle=
ction of advisory texts is our &quot;source of truth&quot;.)</div><div><br>=
</div><div>We do have &quot;Officially license all advisory text as CC-BY-4=
&quot; on our to-do list; if you&#39;d be more comfortable with an official=
 license for xsa.json as well, we can add that to the list.</div><div><br><=
/div><div>=C2=A0-George</div></div></div>

--00000000000003fed105f314ea5c--

