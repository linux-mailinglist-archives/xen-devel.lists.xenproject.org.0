Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6265A36226
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 16:47:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888934.1298202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tixuT-00072y-2N; Fri, 14 Feb 2025 15:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888934.1298202; Fri, 14 Feb 2025 15:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tixuS-00070D-Us; Fri, 14 Feb 2025 15:47:20 +0000
Received: by outflank-mailman (input) for mailman id 888934;
 Fri, 14 Feb 2025 15:47:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iCm0=VF=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1tixuQ-000706-UE
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 15:47:18 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7891cbf-eaea-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 16:47:16 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-308f71d5efcso21801811fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 07:47:16 -0800 (PST)
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
X-Inumbo-ID: f7891cbf-eaea-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1739548036; x=1740152836; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u/4Px52YWadeojR7NgmOLbLRpKX9OaBtemLD0xvlLQ8=;
        b=e5tqxwLgIwhyyPe4uTWGXSEZ5KaOUY0C3EEL4YwCUlK44kqjOjt+JwcucS4yGt/4iI
         khmVuZ5/sWefR7HLBSD+dYtPKtkpBA8QRGLe0cXDcNyD7HDjpZfGjqcUFzMpp07TMvDY
         Q6t0t1Re+AaLlsR+Iqo6x5ddjkDVM/OwHwLHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739548036; x=1740152836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/4Px52YWadeojR7NgmOLbLRpKX9OaBtemLD0xvlLQ8=;
        b=pBrJjM1UHpiO1hxv1XerPX6buhqo2j4Wc9YW1M51HxMtubPOIhUTLHgbClOHCdRx44
         Qrh1NdEfuiAhh7mOgH6CAR9yxwUVLCdCC5Xgozxbqe+/Pko83VlauoYpt5S8bv7G5P2U
         3uq8+noiQemgTKz3+KN/M2zFAG+NRFVxtqXMSV5xIXXb3pyCkVftJxOupGi3/g3/fqmZ
         rMDrN+41BN6rhcb2PkPYPaNJxghLtFhmm/2v4okyKe3UP683d1+cVllDWFNjT8lWnokl
         2eZmQuWJn+IIJCcDUuE/9JMo8SMghaZ8ng/dOUoAqRwBAyf0hCmiA/TROU8OqFHvRkwh
         AN4g==
X-Gm-Message-State: AOJu0YwWkc/JtoENBL8ffEqT14crFMR6kNg9+Ry5aWTtLQwk7VIIeWWW
	vzYIAs2f7gGS+oCK8OGwNu/QGP6A52EhagXBymdnlFPtQFkRJsovlHGlANDYwIZvOLcwzgeUBcP
	N3ZZbjsin0oqPi+1AtGo0xTGDwSkCSSH5/Rdf6w==
X-Gm-Gg: ASbGncvLPGCrMbHPocjBNP/sEtqUI0VLLSjcxub2rOtmfhFqiPvx+yV3dqmMHuhhCCn
	X9dk3Yx3y+6SY5udV4L4DlHt2C8xkpWyyswG42snqMJoYM3JoFy5oosFAKr4hjnZnJF8tFro=
X-Google-Smtp-Source: AGHT+IG5hm5jZac9fwbXAQpFuLXJBHwmDRevCXFq44tyvBaez7irUbSiU65dTl6bX4RHaWrHUk0u6WStXFu26wwblcY=
X-Received: by 2002:a05:651c:542:b0:308:e9ae:b5a9 with SMTP id
 38308e7fff4ca-3090379da66mr43891821fa.6.1739548036153; Fri, 14 Feb 2025
 07:47:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1739546412.git.andrii.sultanov@cloud.com>
 <0545259ba8f7c54b6fd6c82b185bdee475694747.1739546412.git.andrii.sultanov@cloud.com>
 <850c2854-17ee-42d7-856a-44604f755941@citrix.com>
In-Reply-To: <850c2854-17ee-42d7-856a-44604f755941@citrix.com>
From: Andrii Sultanov <andrii.sultanov@cloud.com>
Date: Fri, 14 Feb 2025 15:47:04 +0000
X-Gm-Features: AWEUYZl6jAAAM9zBqHZQePt0bb1wtmRJ0vLMFfnfcvZx-UaD0fRm2bFUpGZsUwo
Message-ID: <CAAa3AOOYpak4987-7H71CpaBcHyHOOYUL0w6rqVDM17yTvTYJg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] tools/ocaml: Fix oxenstored build warning
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, Christian Lindig <christian.lindig@cloud.com>
Content-Type: multipart/alternative; boundary="000000000000c3e0cc062e1c16d8"

--000000000000c3e0cc062e1c16d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> What's this hunk for?  There's a change in poll.ml, but I don't see why
> it would need to change this list.

Otherwise Poll doesn't pick up Utils as its dependency - I guess before it
was always independent and didn't need anything like that


On Fri, Feb 14, 2025 at 3:42=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com>
wrote:

> On 14/02/2025 3:24 pm, Andrii Sultanov wrote:
> > OCaml, in preparation for a renaming of the error string associated wit=
h
> > conversion failure in 'int_of_string' functions, started to issue this
> > warning:
> > ```
> > File "process.ml", line 440, characters 13-28:
> > 440 |   | (Failure "int_of_string")    -> reply_error "EINVAL"
> >                    ^^^^^^^^^^^^^^^
> > Warning 52 [fragile-literal-pattern]: Code should not depend on the
> actual values of
> > this constructor's arguments. They are only for information
> > and may change in future versions. (See manual section 11.5)
> > ```
> >
> > Deal with this at the source, and instead create our own stable
> > ConversionFailure exception that's raised on the None case in
> > 'int_of_string_opt'.
> >
> > 'c_int_of_string' is safe and does not raise such exceptions.
> >
> > Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
> > Acked-by: Christian Lindig <christian.lindig@cloud.com>
> > ---
> > Changes since v1:
> > * Revert logging added to error handling in process.ml, return just
> "EINVAL"
>
> Thanks.  This looks better.  One quick question.
>
> > ---
> >  tools/ocaml/xenstored/Makefile     |  1 +
> >  tools/ocaml/xenstored/perms.ml     |  2 +-
> >  tools/ocaml/xenstored/poll.ml      |  2 +-
> >  tools/ocaml/xenstored/process.ml   | 18 +++++++++---------
> >  tools/ocaml/xenstored/utils.ml     | 10 ++++++++--
> >  tools/ocaml/xenstored/xenstored.ml | 16 ++++++++--------
> >  6 files changed, 28 insertions(+), 21 deletions(-)
> >
> > diff --git a/tools/ocaml/xenstored/Makefile
> b/tools/ocaml/xenstored/Makefile
> > index 5e8210a906..c333394a34 100644
> > --- a/tools/ocaml/xenstored/Makefile
> > +++ b/tools/ocaml/xenstored/Makefile
> > @@ -54,6 +54,7 @@ OBJS =3D paths \
> >       history \
> >       parse_arg \
> >       process \
> > +     poll \
> >       xenstored
> >
>
> What's this hunk for?  There's a change in poll.ml, but I don't see why
> it would need to change this list.
>
> ~Andrew
>

--000000000000c3e0cc062e1c16d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail-c-message_kit__blocks gmail-c-message_=
kit__blocks--rich_text" style=3D"box-sizing:inherit;max-width:none;margin-b=
ottom:4px"><div class=3D"gmail-c-message__message_blocks gmail-c-message__m=
essage_blocks--rich_text" style=3D"box-sizing:inherit;max-width:none"><div =
class=3D"gmail-p-block_kit_renderer" style=3D"box-sizing:inherit;width:1169=
.01px"><div class=3D"gmail-p-block_kit_renderer__block_wrapper gmail-p-bloc=
k_kit_renderer__block_wrapper--first" style=3D"box-sizing:inherit;display:f=
lex"><div class=3D"gmail-p-rich_text_block" dir=3D"auto" style=3D"box-sizin=
g:inherit;text-align:left;width:1169.01px;font-size:15px;line-height:1.4666=
8"><div class=3D"gmail-p-rich_text_section" style=3D"box-sizing:inherit">&g=
t;=20
What&#39;s this hunk for?=C2=A0 There&#39;s a change in <a href=3D"http://p=
oll.ml" rel=3D"noreferrer" target=3D"_blank">poll.ml</a>, but I don&#39;t s=
ee why<br>
&gt; it would need to change this list.<font color=3D"#888888"><br></font>

<br></div><div class=3D"gmail-p-rich_text_section" style=3D"box-sizing:inhe=
rit">Otherwise Poll doesn&#39;t pick up Utils as its dependency - I guess b=
efore it was always independent and didn&#39;t need anything like that</div=
></div></div></div></div></div><br></div><br><div class=3D"gmail_quote gmai=
l_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 14, 20=
25 at 3:42=E2=80=AFPM Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@ci=
trix.com">andrew.cooper3@citrix.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On 14/02/2025 3:24 pm, Andrii Sultanov w=
rote:<br>
&gt; OCaml, in preparation for a renaming of the error string associated wi=
th<br>
&gt; conversion failure in &#39;int_of_string&#39; functions, started to is=
sue this<br>
&gt; warning:<br>
&gt; ```<br>
&gt; File &quot;<a href=3D"http://process.ml" rel=3D"noreferrer" target=3D"=
_blank">process.ml</a>&quot;, line 440, characters 13-28:<br>
&gt; 440 |=C2=A0 =C2=A0| (Failure &quot;int_of_string&quot;)=C2=A0 =C2=A0 -=
&gt; reply_error &quot;EINVAL&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^=
^^^^^^^^^^^^^^<br>
&gt; Warning 52 [fragile-literal-pattern]: Code should not depend on the ac=
tual values of<br>
&gt; this constructor&#39;s arguments. They are only for information<br>
&gt; and may change in future versions. (See manual section 11.5)<br>
&gt; ```<br>
&gt;<br>
&gt; Deal with this at the source, and instead create our own stable<br>
&gt; ConversionFailure exception that&#39;s raised on the None case in<br>
&gt; &#39;int_of_string_opt&#39;.<br>
&gt;<br>
&gt; &#39;c_int_of_string&#39; is safe and does not raise such exceptions.<=
br>
&gt;<br>
&gt; Signed-off-by: Andrii Sultanov &lt;<a href=3D"mailto:andrii.sultanov@c=
loud.com" target=3D"_blank">andrii.sultanov@cloud.com</a>&gt;<br>
&gt; Acked-by: Christian Lindig &lt;<a href=3D"mailto:christian.lindig@clou=
d.com" target=3D"_blank">christian.lindig@cloud.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes since v1:<br>
&gt; * Revert logging added to error handling in <a href=3D"http://process.=
ml" rel=3D"noreferrer" target=3D"_blank">process.ml</a>, return just &quot;=
EINVAL&quot;<br>
<br>
Thanks.=C2=A0 This looks better.=C2=A0 One quick question.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 tools/ocaml/xenstored/Makefile=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br=
>
&gt;=C2=A0 tools/ocaml/xenstored/<a href=3D"http://perms.ml" rel=3D"norefer=
rer" target=3D"_blank">perms.ml</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 tools/ocaml/xenstored/<a href=3D"http://poll.ml" rel=3D"noreferr=
er" target=3D"_blank">poll.ml</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 tools/ocaml/xenstored/<a href=3D"http://process.ml" rel=3D"noref=
errer" target=3D"_blank">process.ml</a>=C2=A0 =C2=A0| 18 +++++++++---------=
<br>
&gt;=C2=A0 tools/ocaml/xenstored/<a href=3D"http://utils.ml" rel=3D"norefer=
rer" target=3D"_blank">utils.ml</a>=C2=A0 =C2=A0 =C2=A0| 10 ++++++++--<br>
&gt;=C2=A0 tools/ocaml/xenstored/<a href=3D"http://xenstored.ml" rel=3D"nor=
eferrer" target=3D"_blank">xenstored.ml</a> | 16 ++++++++--------<br>
&gt;=C2=A0 6 files changed, 28 insertions(+), 21 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tools/ocaml/xenstored/Makefile b/tools/ocaml/xenstored/Ma=
kefile<br>
&gt; index 5e8210a906..c333394a34 100644<br>
&gt; --- a/tools/ocaml/xenstored/Makefile<br>
&gt; +++ b/tools/ocaml/xenstored/Makefile<br>
&gt; @@ -54,6 +54,7 @@ OBJS =3D paths \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0history \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0parse_arg \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0process \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0poll \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xenstored<br>
&gt;=C2=A0 <br>
<br>
What&#39;s this hunk for?=C2=A0 There&#39;s a change in <a href=3D"http://p=
oll.ml" rel=3D"noreferrer" target=3D"_blank">poll.ml</a>, but I don&#39;t s=
ee why<br>
it would need to change this list.<br>
<br>
~Andrew<br>
</blockquote></div>

--000000000000c3e0cc062e1c16d8--

