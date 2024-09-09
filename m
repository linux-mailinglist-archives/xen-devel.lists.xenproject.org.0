Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA24971B0E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 15:30:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794506.1203461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sneT4-0007Iv-Jd; Mon, 09 Sep 2024 13:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794506.1203461; Mon, 09 Sep 2024 13:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sneT4-0007HQ-Gw; Mon, 09 Sep 2024 13:30:10 +0000
Received: by outflank-mailman (input) for mailman id 794506;
 Mon, 09 Sep 2024 13:30:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dA/l=QH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sneT3-0007HK-4w
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 13:30:09 +0000
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [2607:f8b0:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a08db85e-6eaf-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 15:30:07 +0200 (CEST)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3e03981dad2so926970b6e.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 06:30:07 -0700 (PDT)
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
X-Inumbo-ID: a08db85e-6eaf-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725888606; x=1726493406; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mpdOmBzuqf2pllUSiu5hMmuu7c9MO96xAZRVZFSnJ6I=;
        b=VtEduvtcaqOv1K1v9NRFesj5rc+rCnRKr+enwqPK/THGpQwu2yDmuVF7qG1n9KdwE/
         /fCNENQM8aagzslflMWy5NvHJEl2NvXF6iLIkW0RcgdlJ8BlZCEvHc7oChjDYcJc0MJr
         pFM0MaGUNi0XYfYvUpq95ldeYeMuAQlRxthJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725888606; x=1726493406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpdOmBzuqf2pllUSiu5hMmuu7c9MO96xAZRVZFSnJ6I=;
        b=AAy6a/nL2bCDfT0ZhIvBDS4GfGM2NgVkgmd558zfyWKcacQ06iMnxV/VFK2ihfGLRS
         8gySfC9zuK0WGX0AjNu1Nqo1mHpDuAfmCt8SAMzYyFlfsP18THmUpgIoBJwPl3vniSFE
         6oSfPnpXBbSuM2IZuOOcJSILKplSCzEf/SXJI6vevyrrZbI5qlZXnWewqRBOQ8j5e5Bm
         ZY5lBq/Z+Gjn93HnfbN9YQ07reHJiTPAJrbBv2nC6fI4Vah7g1iJl5shcQNXkkj7hLBn
         bF0Nq6Jj3iBRVG5xGmF1pYATFx/PtJMdMVe7cJYtVGYwCMVL9F5U2DfKByrG8CVFqGAD
         twmg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ3BPpQ+e5S4goi/tNX2VDskGQ0zotsBKMJ6q5pmDfpA0WUMd5rN7VZmVNnRxEoSjGYcTYYzzBre0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSYkPmY26+7FfUJxf5dUsOq4n+Owv9hlSnNYpP7IDa1TqcfZ7C
	Fl1oRVEvtPuscJcSyW2SuBKH3bUYu3hngj+raHcLi/7GuKE1vpaje0J4XQ/8DavD2jhAcD3daIs
	2R1SYzNB2gQbN15icAxcsZ7PBMQeFFAoERAz/QA==
X-Google-Smtp-Source: AGHT+IGjWUT+bax2xtlK0HYNB/ClcHziStkl0jsbJlWA3rEnu0c6sEzkXtmcNpSRXuuizRXMOxoY7AegQbboi1HHxTY=
X-Received: by 2002:a05:6808:2220:b0:3e0:4260:7912 with SMTP id
 5614622812f47-3e042607b2dmr1678715b6e.19.1725888605852; Mon, 09 Sep 2024
 06:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240909131419.127276-1-frediano.ziglio@cloud.com> <ef183e7c-7775-42fb-b826-20d97bb0a3ba@suse.com>
In-Reply-To: <ef183e7c-7775-42fb-b826-20d97bb0a3ba@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 9 Sep 2024 14:29:55 +0100
Message-ID: <CACHz=Zji4MwpO+c7q-vPjU+Qm1nmLgbk3hoGk7dJiKkw6=gsqw@mail.gmail.com>
Subject: Re: [PATCH v2] mm: Unify PRI_gfn and PRI_mfn macros
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000004635750621afc105"

--0000000000004635750621afc105
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 2:21=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:

> On 09.09.2024 15:14, Frediano Ziglio wrote:
> > @@ -4334,7 +4334,7 @@ static void gnttab_usage_print(struct domain *rd)
> >          first =3D 0;
> >
> >          /*      [0xXXX]  ddddd 0xXXXXX 0xXXXXXXXX      ddddd 0xXXXXXX
> 0xXX */
> > -        printk("[0x%03x]  %5d 0x%"PRI_mfn" 0x%08x      %5d
> 0x%06"PRIx64" 0x%02x\n",
> > +        printk("[0x%03x]  %5d %"PRI_mfn" 0x%08x      %5d 0x%06"PRIx64"
> 0x%02x\n",
> >                 ref, act->domid, mfn_x(act->mfn), act->pin,
> >                 sha->domid, frame, status);
>
> Sadly this is where things break: The columnar view will no longer be
> retained
> even on systems with memory only below 4Gb. I have to admit I'm not sure
> in how
> far we can deem this acceptable.
>
> Jan
>

I suppose this line is more the exception to the rule.
One option would be to define the macros to just take care of the type and
base (like standards like PRIx64) and specify all in the strings (so having
"%#"PRI_mfn or "0x%05"PRI_mfn).
Or define 2 macros, one for default format (I would go for PRI_mfn) and
another for raw format (like PRIx_mfn).

Frediano

--0000000000004635750621afc105
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Sep 9, 2024 at 2:21=E2=80=AFPM Jan Beulich &lt;<a href=3D"ma=
ilto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 09.09.2024 15:14, Frediano Zigl=
io wrote:<br>
&gt; @@ -4334,7 +4334,7 @@ static void gnttab_usage_print(struct domain *rd=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 first =3D 0;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0 [0xXXX]=C2=A0=
 ddddd 0xXXXXX 0xXXXXXXXX=C2=A0 =C2=A0 =C2=A0 ddddd 0xXXXXXX 0xXX */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(&quot;[0x%03x]=C2=A0 %5d 0x%&quot;=
PRI_mfn&quot; 0x%08x=C2=A0 =C2=A0 =C2=A0 %5d 0x%06&quot;PRIx64&quot; 0x%02x=
\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(&quot;[0x%03x]=C2=A0 %5d %&quot;PR=
I_mfn&quot; 0x%08x=C2=A0 =C2=A0 =C2=A0 %5d 0x%06&quot;PRIx64&quot; 0x%02x\n=
&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ref, act-=
&gt;domid, mfn_x(act-&gt;mfn), act-&gt;pin,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sha-&gt;d=
omid, frame, status);<br>
<br>
Sadly this is where things break: The columnar view will no longer be retai=
ned<br>
even on systems with memory only below 4Gb. I have to admit I&#39;m not sur=
e in how<br>
far we can deem this acceptable.<br>
<br>
Jan<br></blockquote><div><br></div><div>I suppose this line is more the exc=
eption to the rule.</div><div>One option would be to define the macros to j=
ust take care of the type and base (like standards like PRIx64) and specify=
 all in the strings (so having &quot;%#&quot;PRI_mfn or &quot;0x%05&quot;PR=
I_mfn).</div><div>Or define 2 macros, one for default format (I would go fo=
r PRI_mfn) and another for raw format (like PRIx_mfn).<br></div><div><br></=
div><div>Frediano</div><div>=C2=A0<br></div></div></div>

--0000000000004635750621afc105--

