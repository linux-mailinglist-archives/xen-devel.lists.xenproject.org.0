Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59FB84C2EC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 04:08:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677246.1053732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXYHd-0000T7-Ky; Wed, 07 Feb 2024 03:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677246.1053732; Wed, 07 Feb 2024 03:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXYHd-0000R1-Gp; Wed, 07 Feb 2024 03:07:33 +0000
Received: by outflank-mailman (input) for mailman id 677246;
 Wed, 07 Feb 2024 03:07:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MEJi=JQ=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1rXYHb-0000Qr-NH
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 03:07:31 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05a6f3cd-c566-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 04:07:26 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40fc22f372cso1058235e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 19:07:26 -0800 (PST)
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
X-Inumbo-ID: 05a6f3cd-c566-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1707275246; x=1707880046; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uYZgRtm/NRg2LmrWyVBtSGliVoI0O6GINp7/LJ89NqM=;
        b=oMBT1JkT7N3mDFKsfhZjhaDJ5Uzafk9JDOX9pTPXVZ+9ct/c5nf94RIufMBKep9cPH
         oVfUU4CuqsIS3Xr7lRzHJQym+LiFk4FBvYIO8MdXm6A5GnjUEGrNUufo71GJ62pIjZ08
         ZlvaGME24GcIi/0tw6C30B2KphEhv/EgX7uoio9clDkKQmFiPQFX3TWGSL0hO48Pnt+n
         L4IYFzYYpW3pmgo8AG0xuBMMDVbVtvx8rVEYMR4M4U7jGeiUkSJ1QQjAZe2eXKfAfHmQ
         miLDgAfK+bd1WrSoYGmMFdtSo9h/J3wDv8ak4bI+chg77ohFOShzp7wzhsIyjk9fAsbX
         cBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707275246; x=1707880046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYZgRtm/NRg2LmrWyVBtSGliVoI0O6GINp7/LJ89NqM=;
        b=YUWloTcRwMOskOk00qQ2Jz9Pvt1mJBn+I+eSAYog237SwYFTekqbkF4umIvtrX+c15
         2NaziQSxIRVT0PX+kUpcMEbcr504VcdwhBmzxswPD+3JH9fDNdM5wdNpp8tSWN4hhQM9
         FZOc8k7+RU7sAzlzlYZ17oBRo1Sz43Wk4KCR/PaLPrzL5X7jGr27jLqxfamDnrYQE4qO
         a2M0wK4xkRtKbgEESkvsTen1OlXafHxS31cxHy6W54HrQ+M5y1JuvYhZp9b8xI7TI1SS
         egVeDpB6imOfHkRIycUrnBQLXp2CkC5oxvO/P/7jwCKSyyK5zSFBNevmB37rYmr2rOdF
         pMiQ==
X-Gm-Message-State: AOJu0Yy6GXCJ/hKDxjYVsVf8C7TzdbYD3sRd2OTKj2863Gm7rlsxX/8L
	5nmEmpFW+qgBUgXSNKohMH+z3u2hP1ZwX5G2UFm/glkuMWpaP8HeUGWewZyY9Tqo1TcMm7xP9i7
	MnfsSsubl7pNK3jGYwfPGflgbgSI=
X-Google-Smtp-Source: AGHT+IGapBKOSKXmMlsTTb5PGPfOg/CbuyXGcWyhK2I00fBoRnUuydJDoQIsTgQc2FGNUbhxQyySvpjubq7LoYYTOpE=
X-Received: by 2002:a05:600c:3543:b0:40f:c1fc:e5b6 with SMTP id
 i3-20020a05600c354300b0040fc1fce5b6mr3218161wmq.38.1707275246051; Tue, 06 Feb
 2024 19:07:26 -0800 (PST)
MIME-Version: 1.0
References: <5d6c927e-7d7c-5754-e7eb-65d1e70f6222@suse.com>
 <7cce89f4-962e-bfbe-7d30-18fea7515bed@suse.com> <CAFLBxZZLJMWpf1fCNN4dhoDpYpW6O=V_C==-sCAZy6t4Df_yBw@mail.gmail.com>
 <47b5a1be-280c-4e8e-a5c5-6df7da657539@suse.com>
In-Reply-To: <47b5a1be-280c-4e8e-a5c5-6df7da657539@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Wed, 7 Feb 2024 03:07:14 +0000
Message-ID: <CAFLBxZY4hR6mxL_Zu+AYaNFsg528zmnL45K6tcE=_Lq7s5p=0w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86/p2m: aid the compiler in folding p2m_is_...()
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@cloud.com>
Content-Type: multipart/alternative; boundary="0000000000009326a10610c1fec1"

--0000000000009326a10610c1fec1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 10:15=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 01.02.2024 14:32, George Dunlap wrote:
> > On Thu, Jun 23, 2022 at 12:54=E2=80=AFPM Jan Beulich <jbeulich@suse.com=
> wrote:
> >
> >> By using | instead of || or (in the negated form) && chances increase
> >> for the compiler to recognize that both predicates can actually be
> >> folded into an expression requiring just a single branch (via OR-ing
> >> together the respective P2M_*_TYPES constants).
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >
> > Sorry for the delay.  Git complains that this patch is malformed:
> >
> > error: `git apply --index`: error: corrupt patch at line 28
> >
> > Similar complaint from patchew when it was posted:
> >
> > https://patchew.org/Xen/5d6c927e-7d7c-5754-e7eb-65d1e70f6222@suse.com/
>
> Not sure what to say. The patch surely is well-formed. It applies fine
> using patch (when not taken from email). When taken from email, patch
> mentions that it strips CRs (I'm running my email client on Windows),
> but the saved email still applies fine. "git am" indeed is unhappy
> when taking the plain file as saved from email, albeit here with an
> error different from yours. If I edit the saved email to retain just
> the From: and Subject: tags, all is fine.
>

That still doesn't work for me.


> I can't tell what git doesn't like. The error messages (the one you
> see and the one I got) tell me nothing.


The raw email looks like this:

```
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -379,7 +379,7 @@ struct page_info *p2m_get_page_from_gfn(
             return page;
=3D20
         /* Error path: not a suitable GFN at all */
-        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) &&
+        if ( !(p2m_is_ram(*t) | p2m_is_paging(*t) | p2m_is_pod(*t)) &&
              !mem_sharing_is_fork(p2m->domain) )
             return NULL;
     }
```

Note the "=3D20" at the beginning of the empty line.  Why `patch` handles i=
t
but `git am` doesn't, who knows.


> I'm also not aware of there
> being a requirement that patches I send via email need to be
> "git am"-able (unlike in xsa.git, where I edit patches enough to be
> suitable for that), nor am I aware how I would convince my email
> client and/or server to omit whatever git doesn't like or to add
> whatever git is missing.
>
> Bottom line - your response would be actionable by me only in so far
> as I could switch to using "git send-email". Which I'm afraid I'm not
> going to do unless left with no other choice. The way I've been
> sending patches has worked well for over 20 years, and for different
> projects. (I'm aware Andrew has some special "Jan" command to apply
> patches I send, but I don't know any specifics.)
>

In the general case, I'm not going to review a patch without being able to
see it in context; and it's not reasonable to expect reviewers to have
specific contributor-specific scripts for doing so.  If we run into this
issue in the future, and you want my review, you may have to post a git
tree somewhere, or attach the patch as an attachment or something.  (Or you
can try to figure out why `git am` isn't working and try to upstream a fix.=
)

That said, in this case, context isn't really necessary to understand the
change, so it won't be necessary.

The logic of the change is obviously correct; but it definitely reduces the
readability.  I kind of feel like whether this sort of optimization is
worth the benefits is more a general x86 maintainer policy decision.  Maybe
we can talk about it at the next maintainer's meeting I'll be at?

 -George

--0000000000009326a10610c1fec1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Feb 1, 2024 at 10:15=E2=80=AFPM J=
an Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&g=
t; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On 01.02.2024 14:32, George Dunlap wrote:<br>
&gt; On Thu, Jun 23, 2022 at 12:54=E2=80=AFPM Jan Beulich &lt;<a href=3D"ma=
ilto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrote:<=
br>
&gt; <br>
&gt;&gt; By using | instead of || or (in the negated form) &amp;&amp; chanc=
es increase<br>
&gt;&gt; for the compiler to recognize that both predicates can actually be=
<br>
&gt;&gt; folded into an expression requiring just a single branch (via OR-i=
ng<br>
&gt;&gt; together the respective P2M_*_TYPES constants).<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com=
" target=3D"_blank">jbeulich@suse.com</a>&gt;<br>
&gt;&gt;<br>
&gt; <br>
&gt; Sorry for the delay.=C2=A0 Git complains that this patch is malformed:=
<br>
&gt; <br>
&gt; error: `git apply --index`: error: corrupt patch at line 28<br>
&gt; <br>
&gt; Similar complaint from patchew when it was posted:<br>
&gt; <br>
&gt; <a href=3D"https://patchew.org/Xen/5d6c927e-7d7c-5754-e7eb-65d1e70f622=
2@suse.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/Xen/5=
d6c927e-7d7c-5754-e7eb-65d1e70f6222@suse.com/</a><br>
<br>
Not sure what to say. The patch surely is well-formed. It applies fine<br>
using patch (when not taken from email). When taken from email, patch<br>
mentions that it strips CRs (I&#39;m running my email client on Windows),<b=
r>
but the saved email still applies fine. &quot;git am&quot; indeed is unhapp=
y<br>
when taking the plain file as saved from email, albeit here with an<br>
error different from yours. If I edit the saved email to retain just<br>
the From: and Subject: tags, all is fine.<br></blockquote><div><br></div><d=
iv>That still doesn&#39;t work for me.</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">I can&#39;t tell what git doesn&#39;t l=
ike. The error messages (the one you<br>
see and the one I got) tell me nothing.</blockquote><div><br></div><div>The=
 raw email looks like this:</div><div><br></div><div>```</div><div>--- a/xe=
n/arch/x86/mm/p2m.c<br>+++ b/xen/arch/x86/mm/p2m.c<br>@@ -379,7 +379,7 @@ s=
truct page_info *p2m_get_page_from_gfn(<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return page;<br>=3D20<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* Error path: not a suitable GFN at all */<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if ( !p2m_is_ram(*t) &amp;&amp; !p2m_is_paging(*t) &amp;&amp; !p2m_is=
_pod(*t) &amp;&amp;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !(p2m_is_ram(*t) |=
 p2m_is_paging(*t) | p2m_is_pod(*t)) &amp;&amp;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 !mem_sharing_is_fork(p2m-&gt;domain) )<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>=C2=A0 =C2=A0 =C2=
=A0}<br></div><div>```</div><div><br></div><div>Note the &quot;=3D20&quot; =
at the beginning of the empty line.=C2=A0 Why `patch` handles it but `git a=
m` doesn&#39;t, who knows.</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"> I&#39;m also not aware of there<br>
being a requirement that patches I send via email need to be<br>
&quot;git am&quot;-able (unlike in xsa.git, where I edit patches enough to =
be<br>
suitable for that), nor am I aware how I would convince my email<br>
client and/or server to omit whatever git doesn&#39;t like or to add<br>
whatever git is missing.<br>
<br>
Bottom line - your response would be actionable by me only in so far<br>
as I could switch to using &quot;git send-email&quot;. Which I&#39;m afraid=
 I&#39;m not<br>
going to do unless left with no other choice. The way I&#39;ve been<br>
sending patches has worked well for over 20 years, and for different<br>
projects. (I&#39;m aware Andrew has some special &quot;Jan&quot; command to=
 apply<br>
patches I send, but I don&#39;t know any specifics.)<br></blockquote><div><=
br></div><div>In the general case, I&#39;m not going to review a patch with=
out being able to see it in context; and it&#39;s not reasonable to expect =
reviewers to have specific contributor-specific scripts for doing so.=C2=A0=
 If we run into this issue in the future, and you want my review, you may h=
ave to post a git tree somewhere, or attach the patch as an attachment or s=
omething.=C2=A0 (Or you can try to figure out why `git am` isn&#39;t workin=
g and try to upstream a fix.)</div><div><br></div><div>That said, in this c=
ase, context isn&#39;t really necessary to understand the change, so it won=
&#39;t be necessary.</div><div><br></div><div>The logic of the change is ob=
viously correct; but it definitely reduces the readability.=C2=A0 I kind of=
 feel like whether this sort of optimization is worth the benefits is more =
a general x86 maintainer policy decision.=C2=A0 Maybe we can talk about it =
at the next maintainer&#39;s meeting I&#39;ll be at?</div><div><br></div><d=
iv>=C2=A0-George</div></div></div>

--0000000000009326a10610c1fec1--

