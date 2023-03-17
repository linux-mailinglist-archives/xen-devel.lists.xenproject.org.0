Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7DA6BE972
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 13:38:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511055.789810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd9LT-000715-GM; Fri, 17 Mar 2023 12:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511055.789810; Fri, 17 Mar 2023 12:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd9LT-0006yI-DA; Fri, 17 Mar 2023 12:38:07 +0000
Received: by outflank-mailman (input) for mailman id 511055;
 Fri, 17 Mar 2023 12:38:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fona=7J=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pd9LS-0006yC-Dk
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 12:38:06 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f9e20c9-c4c0-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 13:38:04 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id b13so4901197ljf.6
 for <xen-devel@lists.xenproject.org>; Fri, 17 Mar 2023 05:38:04 -0700 (PDT)
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
X-Inumbo-ID: 8f9e20c9-c4c0-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1679056683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tklupWDgHgYUOaoX0vF1Vnub78/xesq7JkRgozmUpcA=;
        b=lzyHcdNZuJw11PkrwofH1plJr3hWCyqx3bLf7SnE7cAQttgh2ZZdstC+qYRZwFtLFo
         psJwurRxQSfu9C3y6XNHSyIM6H/wYh5afb5rz2NmJ/X4ZYSKfPzoFn5pqRKoKw6Pw1LT
         p6A2zMuhn+F1OTJmhNfCZhHpiDQD3r4Ml9w0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679056683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tklupWDgHgYUOaoX0vF1Vnub78/xesq7JkRgozmUpcA=;
        b=an5+3/hKn1rCmJAqgueKK/yq2dPUDtdmtM6LyyydTxD3wfYoAQ+skd0CcT7s965Mt3
         Q/4CGhgfL1RRw2o81TBi1oYlk0fdfCPzIHQti+mi+pwFuG64naxwAtbmNKX6lNe6s2wM
         LNZbYkOKXusLlXevxmTUMJ5Oxtje2CmupKo0wFBIZyRZkfEdad8/xCrbPBM4qOMkoLVd
         WHT10tlEvEQ7Ni1wddRJn2shcFxzPPMCBidWigrqQMapUabSVjs81Q0pGM7ExmIGiRW6
         F+ahm89ubhLHHpuSn7NNw6gr5OhJYXqTwBwkcJyzjIsgJQ8ejMTgNo971uNJNYwCBoUz
         pTRA==
X-Gm-Message-State: AO0yUKUYpi5OkDD5po7o8PFUh+G5RYcMQpsKOdFaB93h9sv3RNPU8UYm
	PMPzW4Hj7OA0kIR1MsJOLPCQyEmz4ICDVvvg+4mmNQ==
X-Google-Smtp-Source: AK7set8tQV0LiHxQ8FcWKwf5iLQpg0uPrU3xV0nbhyf+WhkrPD4hgMbJd4Th9kOrRGMpOP4mYA2k30ZlOLf4IQFtCG8=
X-Received: by 2002:a2e:2419:0:b0:299:7665:7e61 with SMTP id
 k25-20020a2e2419000000b0029976657e61mr2085147ljk.6.1679056683681; Fri, 17 Mar
 2023 05:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230316171634.320626-1-marmarek@invisiblethingslab.com>
 <20230316171634.320626-4-marmarek@invisiblethingslab.com> <afe67927-0f62-511b-012f-2f2deedbf4e6@suse.com>
In-Reply-To: <afe67927-0f62-511b-012f-2f2deedbf4e6@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 17 Mar 2023 12:37:52 +0000
Message-ID: <CA+zSX=bHyn-v77shA9xGaacjXcQ0U0tTg2V0U2t0FVML7WFJqw@mail.gmail.com>
Subject: Re: [PATCH 4/4] Update README to state Python3 requirement
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000305df105f717d94c"

--000000000000305df105f717d94c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 8:46=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 16.03.2023 18:16, Marek Marczykowski-G=C3=B3recki wrote:
> > Python2 is not supported anymore.
>
> There are two things here which concern me: For one, how come this is
> at the end of a series? You want to keep in mind that any series may
> be committed piecemeal (unless an indication to the contrary is in
> the cover letter, but there's none here in the first place).
>
> The other aspect is that there's no indication here of it being
> consensus that we raise the baseline requirement for Python, and for
> Python alone. A decision towards the wider topic of raising baseline
> requirements is, as you may recall from the meeting in Cambridge,
> still pending.
>

To me, the idea behind that discussion was that if we agree on a policy --
or at least general principles -- then we can avoid having to have
discussions on a case-by-case basis.  The fact that the discussion is still
open isn't a reason not to deprecate features; it just means that we still
need to discuss each one on its merits.

Given that Python 2 was announced unsupported years ago now, it seems
obvious to me that we should stop trying to support it.

Are you arguing that we *should* continue to support Python2?  Do you think
anyone will?

If so, please either make that case, or recommend that we raise the profile
of this so that others can.

 -George

--000000000000305df105f717d94c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 17, 2023 at 8:46=E2=80=AF=
AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 16.03.2023 18:16, Marek Marczykowski-G=C3=B3recki wrote:<br>
&gt; Python2 is not supported anymore.<br>
<br>
There are two things here which concern me: For one, how come this is<br>
at the end of a series? You want to keep in mind that any series may<br>
be committed piecemeal (unless an indication to the contrary is in<br>
the cover letter, but there&#39;s none here in the first place).<br>
<br>
The other aspect is that there&#39;s no indication here of it being<br>
consensus that we raise the baseline requirement for Python, and for<br>
Python alone. A decision towards the wider topic of raising baseline<br>
requirements is, as you may recall from the meeting in Cambridge,<br>
still pending.<br></blockquote><div><br></div><div>To me, the idea behind t=
hat discussion was that if we agree on a policy -- or at least general prin=
ciples -- then we can avoid having to have discussions on a case-by-case ba=
sis.=C2=A0 The fact that the discussion is still open isn&#39;t a reason no=
t to deprecate features; it just means that we still need to discuss each o=
ne on its merits.</div><div><br></div><div>Given that Python 2 was announce=
d unsupported years ago now, it seems obvious to me that we should stop try=
ing to support it.</div><div><br></div><div>Are you arguing that we *should=
* continue to support Python2?=C2=A0 Do you think anyone will?</div><div><b=
r></div><div>If so, please either make that case, or recommend that we rais=
e the profile of this so that others can.</div><div><br></div><div>=C2=A0-G=
eorge=C2=A0</div></div></div>

--000000000000305df105f717d94c--

