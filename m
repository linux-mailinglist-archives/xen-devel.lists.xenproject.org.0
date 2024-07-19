Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06E1937710
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2024 13:14:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760996.1170976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUlYY-0001ba-9w; Fri, 19 Jul 2024 11:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760996.1170976; Fri, 19 Jul 2024 11:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUlYY-0001aQ-6z; Fri, 19 Jul 2024 11:13:46 +0000
Received: by outflank-mailman (input) for mailman id 760996;
 Fri, 19 Jul 2024 11:13:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y74h=OT=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sUlYW-0001YK-U9
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2024 11:13:44 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4e1c071-45bf-11ef-8776-851b0ebba9a2;
 Fri, 19 Jul 2024 13:13:42 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5a10bb7bcd0so1041268a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2024 04:13:42 -0700 (PDT)
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
X-Inumbo-ID: f4e1c071-45bf-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721387622; x=1721992422; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5e7wKCkzNVlPlHXDTLl/rmjv17vv+TYao9fpalfP0SY=;
        b=ADwOtJLbN+JvJpno4O8CnEb87H2z/D5AhH44F28stOJGxuUpiTTZBTox+J58gVyqYh
         ZSKWJFVk6yQ3nA3RCTtz4zQrHrdcGuDuGI+kfaTO3tBxgFC43FUTF51Uko36QIdHUwkQ
         oZaghE/BbD9neA63QOAxrHy3DJXUt3YgAkBl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721387622; x=1721992422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5e7wKCkzNVlPlHXDTLl/rmjv17vv+TYao9fpalfP0SY=;
        b=wO5fJd5Ag6CyYhNe4ez/CuwA4iheE4/nJIXlwfr21ljhzngMhkxoR4qv+p7N0OKB7S
         qzqhgyfa+khbtIAQTK53w46IMS+qwOzgqo5Go5rxhqKytr/b+LBXLjcvbiJiqUmWJ4zj
         Qe8AXDP3DYvG6wlxGoS5ANlHDBNkwh6bEsSFEiMIqj/B9JVgl2DYg7OXR62bMcZSdBRE
         ZhTXdaI5LddEwPpJ3xCD1JPgKI0vmHEaPhqZWk7Dni2TpomdiB8/4ZYlGlNRY2hGoW0s
         Eu73tUlUoAGL9WQNO5Um+B1eyEnbDnCNY0zItmQ87H4IBOdug0N/a8Y2f8NiPsl3WaGF
         Xh/w==
X-Forwarded-Encrypted: i=1; AJvYcCVtYwPJrWUvoIpwug7GX+ijILN7K5/GVGer/eIFekg5+3xoRkhjGPqnNVp/EE6nuwOQgHKVzJXatO7VVqMvXbOIDidm8y72omW3Y4T+a7A=
X-Gm-Message-State: AOJu0Yy2Sy/OROZC76A9VXZcYKYIxQuQoflEShxGY+CiR3AKmuYXSnfF
	J4QBcwEyWtm5EuRMTFEj6jIbOKM4DEVTBLNkZYkpyicZGm5s+YO20H9iqp0koVG7vCa02P/ZG1m
	V6s8lIZZxAay0AfjFA85sU4BBxdH9iwgwT9NULw==
X-Google-Smtp-Source: AGHT+IE2E6/0CR/edfh7Q2HPb/VFViuIMYHUXMOIzEDWTbjY5p+yMMocv/qWDt07IMeaBdZj5Uh0C1g8GkzU4fm8wKg=
X-Received: by 2002:a17:906:2f0b:b0:a77:dbf0:d30 with SMTP id
 a640c23a62f3a-a7a011b6466mr523528966b.41.1721387621269; Fri, 19 Jul 2024
 04:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAO-mL=xEEdCjUWN3oqJEBjktH+dsJDXrQ2uHWD80bJJ32q3_pw@mail.gmail.com>
 <925ec9b8-83b3-473c-aa7c-dd825cdc3b9a@xen.org>
In-Reply-To: <925ec9b8-83b3-473c-aa7c-dd825cdc3b9a@xen.org>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 19 Jul 2024 12:13:05 +0100
Message-ID: <CAO-mL=yhMDuvMOWHU93jNLgxOJe4_Bir44UC23+HoAfj0yK=Tw@mail.gmail.com>
Subject: Re: [Vote] Xen Project Code of Conduct Team Member
To: win-pv-devel@lists.xenproject.org, 
	xen-devel <xen-devel@lists.xenproject.org>, 
	"xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>, minios-devel@lists.xenproject.org, 
	mirageos-devel@lists.xenproject.org
Cc: committers@xenproject.org, Roger Pau Monne <roger.pau@cloud.com>
Content-Type: multipart/alternative; boundary="000000000000afe24c061d97c966"

--000000000000afe24c061d97c966
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I have received all votes from leadership teams of three mature projects
and achieved a quorum on this proposal.
Votes have been received both in public and private.

The outcome of votes:
Hypervisor: +3
Windows PV: +2
XAPI: +2

Roger will be added as the new code of conduct team member.

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Tue, Jul 9, 2024 at 6:42=E2=80=AFAM Julien Grall <julien@xen.org> wrote:

>
>
> On 08/07/2024 10:00, Kelly Choi wrote:
> > Hi all,
> >
> > As you are aware, George Dunlap has recently stepped down from the Xen
> > Project as a committer, but he was also a part of the Code of Conduct
> team.
> >
> > As a result, Stefano will be the only member remaining on the CoC team.
> @Roger
> > Pau Monne <roger.pau@cloud.com> has volunteered to join the team, so
> that
> > there are at least two members.
> >
> > In accordance with https://xenproject.org/developers/governance/, I nee=
d
> > the leadership teams of the three mature projects: the Hypervisor, the
> XAPI
> > project, and the Windows PV Driver project to vote on this proposal.
> >
> > The specific voting rules, in this case, are outlined in the section:
> > https://www.xenproject.org/governance.html#project-decisions
> >
> > I propose to tally the votes after July 31st, 2024. You can reply via
> email
> > in public or private:
> > +1: for proposal
> > -1: against proposal
>
> +1
>
> Cheers,
>
> --
> Julien Grall
>

--000000000000afe24c061d97c966
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi all,<div><br></div><div>I have receive=
d all votes from leadership=C2=A0teams=C2=A0of three mature projects and ac=
hieved a quorum=C2=A0on this proposal.</div><div>Votes have been received b=
oth in public and private.</div><div><br></div><div>The outcome of votes:</=
div><div>Hypervisor:=C2=A0+3</div><div>Windows PV:=C2=A0+2</div><div>XAPI:=
=C2=A0+2</div><div><br></div><div>Roger will be added as the new code of co=
nduct team member.=C2=A0</div><div><br></div><div><div><div dir=3D"ltr" cla=
ss=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly C=
hoi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)">Communit=
y Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br><=
/div></div></div></div></div><br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 9, 2024 at 6:42=E2=80=AF=
AM Julien Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 08/07/2024 10:00, Kelly Choi wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; As you are aware, George Dunlap has recently stepped down from the Xen=
<br>
&gt; Project as a committer, but he was also a part of the Code of Conduct =
team.<br>
&gt; <br>
&gt; As a result, Stefano will be the only member remaining on the CoC team=
. @Roger<br>
&gt; Pau Monne &lt;<a href=3D"mailto:roger.pau@cloud.com" target=3D"_blank"=
>roger.pau@cloud.com</a>&gt; has volunteered to join the team, so that<br>
&gt; there are at least two members.<br>
&gt; <br>
&gt; In accordance with <a href=3D"https://xenproject.org/developers/govern=
ance/" rel=3D"noreferrer" target=3D"_blank">https://xenproject.org/develope=
rs/governance/</a>, I need<br>
&gt; the leadership teams of the three mature projects: the Hypervisor, the=
 XAPI<br>
&gt; project, and the Windows PV Driver project to vote on this proposal.<b=
r>
&gt; <br>
&gt; The specific voting rules, in this case, are outlined in the section:<=
br>
&gt; <a href=3D"https://www.xenproject.org/governance.html#project-decision=
s" rel=3D"noreferrer" target=3D"_blank">https://www.xenproject.org/governan=
ce.html#project-decisions</a><br>
&gt; <br>
&gt; I propose to tally the votes after July 31st, 2024. You can reply via =
email<br>
&gt; in public or private:<br>
&gt; +1: for proposal<br>
&gt; -1: against proposal<br>
<br>
+1<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div></div>

--000000000000afe24c061d97c966--

