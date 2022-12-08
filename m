Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D93A646ED7
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 12:44:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457061.714908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3FJR-0001VE-26; Thu, 08 Dec 2022 11:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457061.714908; Thu, 08 Dec 2022 11:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3FJQ-0001SY-Uc; Thu, 08 Dec 2022 11:43:36 +0000
Received: by outflank-mailman (input) for mailman id 457061;
 Thu, 08 Dec 2022 11:43:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vAIj=4G=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1p3FJP-0001SQ-RN
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 11:43:35 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85d584d9-76ed-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 12:43:24 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id r26so1689730edc.10
 for <xen-devel@lists.xenproject.org>; Thu, 08 Dec 2022 03:43:34 -0800 (PST)
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
X-Inumbo-ID: 85d584d9-76ed-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3CyJ8A7vipnm77BA8o53i0kMJ7hFzp042GfIYDeSvik=;
        b=MdYLKX+Wr42Xo1uvzDoeWrJgAdeTgux3P2FSUQLjKU/JULt8aW/VDzWa7lUdoAuqVD
         IUra1ly/F6FvlWWn8XhLkNmU4lVUdwFDGUT/bVIw+UEMPhxMq2Yu48vVA4+Jjyw2oJeh
         UyYkTpwSRUWuoY9hpzv+sPyb2GIfSk08lpfFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3CyJ8A7vipnm77BA8o53i0kMJ7hFzp042GfIYDeSvik=;
        b=EHmpYGKM0duYiU21qaId4556h3ehjFiknAH24MmxhSqcZa12THB8/OkfdyZQ/6nln3
         vu0Zz+96ab9hmj8/VgZ1ZiLh2K12HI985pWovfNgVU/XGlShtGqFgo4xgyfxG7a13Qym
         x77IdVq13u6hZsTHuxuB6Kl/AnKu570zg4IFhcbr6gwSml/+TnzZaYK2ytljj7Z0RGCW
         c9HcYB3Q0e7icJUIVibmuO1ZfXdkQRTqcC8wAmpEweEX2TFVRTj9qFY6y/OH0J2q4YvZ
         cXRsBvi7cM1jb40iEjgrziTzUeG5WbGmmZc3LdyGaJAujQPpG1eAcvo5l3H22Jb0Nkag
         bm3Q==
X-Gm-Message-State: ANoB5plvtMzUkfpBxy1R7/qJp1Lg1K6/CW4Se6oP8GGlT3eJat0itkZe
	tgYReScipfPdJVJ53B0YxVk4Oi/TiRP7RaQE5hxCUw==
X-Google-Smtp-Source: AA0mqf5Y/w+mx38pw7GDGPlkxaGCYOmME7bOhrfdZIDMBnsIOtQLcGm4nPVXgO/TuoOYjBxasq1uTB+Xa6Ze3QXGNEY=
X-Received: by 2002:a05:6402:3789:b0:467:7664:c7f4 with SMTP id
 et9-20020a056402378900b004677664c7f4mr4057498edb.99.1670499814331; Thu, 08
 Dec 2022 03:43:34 -0800 (PST)
MIME-Version: 1.0
References: <20221208104924.76637-1-george.dunlap@cloud.com> <5a8d41c2-f9d0-cc83-e0f0-2623dccc85bf@suse.com>
In-Reply-To: <5a8d41c2-f9d0-cc83-e0f0-2623dccc85bf@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 8 Dec 2022 11:43:23 +0000
Message-ID: <CA+zSX=aHhE78v6jKuEzHgENLnSdZ4emvOKnveNK2WetZ+4BUBw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Clarify check-in requirements for
 mixed-author patches
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000007f94005ef4f8c6c"

--00000000000007f94005ef4f8c6c
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 8, 2022 at 11:34 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 08.12.2022 11:49, George Dunlap wrote:
> > From: George Dunlap <george.dunlap@citrix.com>
> >
> > There was a question raised recently about the requriements for
> > checking in a patch which was originally written by one maintainer,
> > then picked up and modified by a second maintainer, and which they now
> both
> > agree should be checked in.
> >
> > It was proposed that in that case, the following set of tags would
> suffice:
> >
> >    Signed-off-by: First Author <...>
> >    Signed-off-by: Second Author <...>
> >    Reviewed-by: First Author <...>
> >
> > The rationale was as follows:
> >
> > 1. The patch will be a mix of code, whose copyright is owned by the
> > various authors (or the companies they work for).  It's important to
> > keep this information around in the event, for instance, of a license
> > change or something else requiring knowledge of the copyright owner.
> >
> > 2. The Signed-off-by of the Second Author approves not only their own
> > code, but First Author's code;
>
> The wording in ./MAINTAINERS looks good to me, so it may be benign that
> here a perhaps relevant (in the course of development) aspect is not
> expressed correctly: Second Author may have fixed a bug in the original
> patch, which surely he then doesn't approve. So I'd be inclined to
> suggest making this "..., but also the unchanged parts of First Author's
> code".
>

Given the wording in #1, "The patch will be a mix of code...",   I think
the context should be clear, that we're talking about the code *in the
patch that's being submitted*, not some other code in some other patch
that's been submitted previously.

Since the actual change to the policy looks good to me:
> Acked-by: Jan Beulich <jbeulich@suse.com>
>

Thanks,
 -George

--00000000000007f94005ef4f8c6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 8, 2022 at 11:34 AM Jan B=
eulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 08.12.2=
022 11:49, George Dunlap wrote:<br>
&gt; From: George Dunlap &lt;<a href=3D"mailto:george.dunlap@citrix.com" ta=
rget=3D"_blank">george.dunlap@citrix.com</a>&gt;<br>
&gt; <br>
&gt; There was a question raised recently about the requriements for<br>
&gt; checking in a patch which was originally written by one maintainer,<br=
>
&gt; then picked up and modified by a second maintainer, and which they now=
 both<br>
&gt; agree should be checked in.<br>
&gt; <br>
&gt; It was proposed that in that case, the following set of tags would suf=
fice:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 Signed-off-by: First Author &lt;...&gt;<br>
&gt;=C2=A0 =C2=A0 Signed-off-by: Second Author &lt;...&gt;<br>
&gt;=C2=A0 =C2=A0 Reviewed-by: First Author &lt;...&gt;<br>
&gt; <br>
&gt; The rationale was as follows:<br>
&gt; <br>
&gt; 1. The patch will be a mix of code, whose copyright is owned by the<br=
>
&gt; various authors (or the companies they work for).=C2=A0 It&#39;s impor=
tant to<br>
&gt; keep this information around in the event, for instance, of a license<=
br>
&gt; change or something else requiring knowledge of the copyright owner.<b=
r>
&gt; <br>
&gt; 2. The Signed-off-by of the Second Author approves not only their own<=
br>
&gt; code, but First Author&#39;s code;<br>
<br>
The wording in ./MAINTAINERS looks good to me, so it may be benign that<br>
here a perhaps relevant (in the course of development) aspect is not<br>
expressed correctly: Second Author may have fixed a bug in the original<br>
patch, which surely he then doesn&#39;t approve. So I&#39;d be inclined to<=
br>
suggest making this &quot;..., but also the unchanged parts of First Author=
&#39;s<br>
code&quot;.<br></blockquote><div><br></div><div>Given the wording in #1, &q=
uot;The patch will be a mix of code...&quot;,=C2=A0 =C2=A0I think the conte=
xt should be clear, that we&#39;re talking about the code *in the patch tha=
t&#39;s being submitted*, not some other code in some other patch that&#39;=
s been submitted previously.</div><div><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Since the actual change to the policy looks good to=
 me:<br>
Acked-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_b=
lank">jbeulich@suse.com</a>&gt;<br></blockquote><div><br></div><div>Thanks,=
</div><div>=C2=A0-George</div></div></div>

--00000000000007f94005ef4f8c6c--

