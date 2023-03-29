Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4926A6CD61C
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 11:13:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516125.799741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phRs4-0005c6-Bv; Wed, 29 Mar 2023 09:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516125.799741; Wed, 29 Mar 2023 09:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phRs4-0005Z7-8v; Wed, 29 Mar 2023 09:13:32 +0000
Received: by outflank-mailman (input) for mailman id 516125;
 Wed, 29 Mar 2023 09:13:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BI9Y=7V=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1phRs2-0005Z1-Sq
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 09:13:30 +0000
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [2607:f8b0:4864:20::92e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7e75e41-ce11-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 11:13:29 +0200 (CEST)
Received: by mail-ua1-x92e.google.com with SMTP id q8so3170701uas.7
 for <xen-devel@lists.xenproject.org>; Wed, 29 Mar 2023 02:13:29 -0700 (PDT)
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
X-Inumbo-ID: f7e75e41-ce11-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1680081208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O11jjMmM5RLColZIiysSNrOXRVv7fG3Cd/+0hEg2fCY=;
        b=sgIh60IzSHMtVkUn64VjdYhEyT0IBWmDEMB+lhcCsHSVWawQ6LJvkxJLHJBIEEZ0Fn
         On1l2VomWGn3OfsQHovhpehdQlkSA/F0y/2+1rf9A7x1AVfAlxt7IDO2zbUsUECj5GAw
         ukiafRWFionrLeohzDZQ5X/gkCO47RZp6uaTxS58b+ldPtFIqbuUvPzCDD2rP9oxtxjO
         1DYLpjxtfeyQnx4UesOXzChvokdY3bvngFQKI7oUk4NwyHKxvDymG1t6s1MFcJGpAN56
         owtYqUWhPFuPbhOYxAUeJAcW3SezkfEbKi0QaIOQST+bDbeHVy/c8A2ntFFvdIvIfxTZ
         NkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680081208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O11jjMmM5RLColZIiysSNrOXRVv7fG3Cd/+0hEg2fCY=;
        b=ulRkb9JlOwbxVnaDn0pNjhNE7CWv3jNprxUB3gp+hFuZ+hvYMKLcPwufE19GEH5rdQ
         xp5bGgZTHImbthOv2U3v8G0xtVDeHKnw20IWZl37Np1YWXQfeOIRTz7YnMgiT9BqusZT
         Svib7OTzUqDi5mlvha3BNPT6/wHnWpjbRtNX0ICiFCoFctixISqyGhXY25+kTCBUvpd1
         5qsNcp7RWpBKU0qBNQn0IG4XJS2aE4EyScnnq9DZFn4/6wcpNZ/pA0bkKF30aXytSOZQ
         qPPIa1mlf4UvxvLi/QzbOo4Gay4HyKGPZRNUl+mT668r8Mcpdn3tCll1VsS0y+B9US42
         efhA==
X-Gm-Message-State: AAQBX9ehWBT32Sygwg1uCPwSl4ui916F1gY1dCo5Uxgzyt+PkXK/bm6y
	6r1T6BrttQ7N3nTdGaxt3CYtBatDtJtKBNQUvMI=
X-Google-Smtp-Source: AKy350Y+oV4uEBGLPfz/3zUb9eosD3oeTvgrABqiDhKCgUQdD9vFzINfPJ83dYh1U0DVKBBmuTsLQ6K+m01atBJc0a0=
X-Received: by 2002:a1f:2997:0:b0:432:8b30:81b7 with SMTP id
 p145-20020a1f2997000000b004328b3081b7mr10179762vkp.2.1680081208255; Wed, 29
 Mar 2023 02:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
 <20230327194126.3573997-3-andrew.cooper3@citrix.com> <6b6b7da5-dd1a-1b17-b1ce-1b1adb687807@suse.com>
 <c6661fc2-bdc2-b953-88fb-7250eb2fce1b@citrix.com> <8ca9ddb1-d94a-7010-ab42-e6d0f0670aa3@suse.com>
In-Reply-To: <8ca9ddb1-d94a-7010-ab42-e6d0f0670aa3@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Wed, 29 Mar 2023 09:13:16 +0000
Message-ID: <CAFLBxZY98QO99+EAURNeDU+tNrLRGot0w2=ybfRWvFEq7XH9dg@mail.gmail.com>
Subject: Re: [PATCH 2/5] x86/ucode: Fold early_update_cache() into microcode_init_cache()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000009caac005f8066312"

--0000000000009caac005f8066312
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 4:58=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 28.03.2023 17:07, Andrew Cooper wrote:
> > On 28/03/2023 2:51 pm, Jan Beulich wrote:
> >> On 27.03.2023 21:41, Andrew Cooper wrote:
> >>> It is not valid to retain a bootstrap_map() across returning back to
> >>> __start_xen(), but various pointers get stashed across calls.
> >> It's error prone, yes, but "not valid" isn't really true imo: As long =
as
> >> nothing calls bootstrap_map(NULL) all mappings will remain as they are=
.
> >
> > And how is this code supposed to know whether it's stashed pointer is
> > any good or not?
> >
> > This is precisely "not valid" means.  It doesn't mean "it definitely
> > doesn't work", but very much does mean "can't rely on it working".
>
> Hmm, not my understanding of "not valid".
>

A "valid" approach or algorithm is one which can be relied on.  If an
approach or algorithm may sometimes work or may sometimes not work, it's
not valid.

That said:

* "Not valid" is kind of vague: it tells you think it's "bad", but not
how.  (Even "racy" or "risky" or "error-prone" are more descriptive,
because it prompts you for the types of problems to think about.) It's
usually better to state exactly what problems might happen if you do X,
rather than simply saying X is "not valid".

* It's usually better to propose specific alternate wording, rather than
arguing about whether a given wording is... er, valid or not.

 -George

--0000000000009caac005f8066312
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 28, 2023 at 4:58=E2=80=AF=
PM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 28.03.2023 17:07, Andrew Cooper wrote:<br>
&gt; On 28/03/2023 2:51 pm, Jan Beulich wrote:<br>
&gt;&gt; On 27.03.2023 21:41, Andrew Cooper wrote:<br>
&gt;&gt;&gt; It is not valid to retain a bootstrap_map() across returning b=
ack to<br>
&gt;&gt;&gt; __start_xen(), but various pointers get stashed across calls.<=
br>
&gt;&gt; It&#39;s error prone, yes, but &quot;not valid&quot; isn&#39;t rea=
lly true imo: As long as<br>
&gt;&gt; nothing calls bootstrap_map(NULL) all mappings will remain as they=
 are.<br>
&gt; <br>
&gt; And how is this code supposed to know whether it&#39;s stashed pointer=
 is<br>
&gt; any good or not?<br>
&gt; <br>
&gt; This is precisely &quot;not valid&quot; means.=C2=A0 It doesn&#39;t me=
an &quot;it definitely<br>
&gt; doesn&#39;t work&quot;, but very much does mean &quot;can&#39;t rely o=
n it working&quot;.<br>
<br>
Hmm, not my understanding of &quot;not valid&quot;.<br></blockquote><div><b=
r></div><div>A &quot;valid&quot; approach or algorithm is one which can be =
relied on.=C2=A0 If an approach or algorithm may sometimes work or may some=
times not work, it&#39;s not valid.</div><div><br></div><div>That said:</di=
v><div><br></div><div>* &quot;Not valid&quot; is kind of vague: it tells yo=
u think it&#39;s &quot;bad&quot;, but not how.=C2=A0 (Even &quot;racy&quot;=
 or &quot;risky&quot; or &quot;error-prone&quot; are more descriptive, beca=
use it prompts you for the types of problems to think about.) It&#39;s usua=
lly better to state exactly what problems might happen if you do X, rather =
than simply saying X is &quot;not valid&quot;.</div><div><br></div><div>* I=
t&#39;s usually better to propose specific alternate wording, rather than a=
rguing about whether a given wording is... er, valid or not.=C2=A0</div><di=
v><br></div><div>=C2=A0-George</div></div></div>

--0000000000009caac005f8066312--

