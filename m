Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C8B929D66
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 09:44:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755082.1163350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQj1v-00050V-SW; Mon, 08 Jul 2024 07:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755082.1163350; Mon, 08 Jul 2024 07:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQj1v-0004yK-Pv; Mon, 08 Jul 2024 07:43:23 +0000
Received: by outflank-mailman (input) for mailman id 755082;
 Mon, 08 Jul 2024 07:23:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sWbT=OI=cloud.com=owen.smith@srs-se1.protection.inumbo.net>)
 id 1sQiig-00026x-3q
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 07:23:30 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8bf70e8-3cfa-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 09:23:28 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52e9fe05354so5214144e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 00:23:28 -0700 (PDT)
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
X-Inumbo-ID: f8bf70e8-3cfa-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720423408; x=1721028208; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QA5XKySHBbQyTCaAwDrcN0EPTjdnFOPBEWnC3CbkYW0=;
        b=FnZrnRYm5+CLrE5a+v75zdg+ecqfB37DxYRsAC4wB2RF7kLy+ykJ7bDsv3BQDbp6eC
         kITzBJjbE/rlcKlH7P9lpMPgiqaBY81FgILuQJGOaTM6y6/ts8i3hq8sQkFK/iBNC6wN
         6LZBAmboJgbQhaFpnZ8IO0XlvWyVqv3r2qThU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720423408; x=1721028208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QA5XKySHBbQyTCaAwDrcN0EPTjdnFOPBEWnC3CbkYW0=;
        b=PE1gThB2RbMtOHZ9UKXP/cSDYLh/Jhb++UATCtHtRtVbBD8tLky6KbrRe8t3zOimGX
         i07x0ccEA01ULBv1SGVE+hpWrrqSCMYzxvajGNl64BJTNxlnF/dYjny/yw1tO3ly9TiS
         CgaJvDcYXqYwDJpBHPqjLo5DrUedV3UIRtUvs1EkBdsoF2EH7ju79n53U0yjtdbEM2eH
         adYsN7LBzHxpEDNTmqOWj3H7spI5J0noZr9lhRAwS93li/Uj43bNm2kdyTOfMAQeNX3f
         VrX4Z5qvcu7qh4lTw81fmyCXO6j+Bi7t8ex0emMu/VMguOgbXS8hM0Pp5F+LPmZdcQtY
         tqsg==
X-Gm-Message-State: AOJu0YwQaJRgTVoC4HXVNyyN7VSZLf1v7BMIdySo2D4ec5mZI7Mny8Ts
	6b5xLjiETvg41tUM60aoDFyUpofdubfUTx6eQaSObyeJh+v1S7gtfiFbuA3KDOkATw5zjOHkmTa
	f3s3ZZJgkP2X/7Ymd4TG8bysOGK0SBnoVqDA4
X-Google-Smtp-Source: AGHT+IFccTZJINWUE5iwTO3jg+NpURSgSFe3gLg8I1IMugGEqoLZMNPVbq7mLwVoWuCNOvk/e5rLlHTjh2WNsaY/ypk=
X-Received: by 2002:ac2:5050:0:b0:52e:747f:46d9 with SMTP id
 2adb3069b0e04-52ea0629af0mr8702168e87.17.1720423407795; Mon, 08 Jul 2024
 00:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAO-mL=xEEdCjUWN3oqJEBjktH+dsJDXrQ2uHWD80bJJ32q3_pw@mail.gmail.com>
In-Reply-To: <CAO-mL=xEEdCjUWN3oqJEBjktH+dsJDXrQ2uHWD80bJJ32q3_pw@mail.gmail.com>
From: Owen Smith <owen.smith@cloud.com>
Date: Mon, 8 Jul 2024 08:23:15 +0100
Message-ID: <CAC_UY88mKye2Ti5pmOuFZqP1nR5WQdYXWeqGR7fdukjoFS2BmA@mail.gmail.com>
Subject: Re: [Vote] Xen Project Code of Conduct Team Member
To: Kelly Choi <kelly.choi@cloud.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	"xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>, win-pv-devel@lists.xenproject.org, 
	committers@xenproject.org, minios-devel@lists.xenproject.org, 
	mirageos-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@cloud.com>
Content-Type: multipart/alternative; boundary="00000000000015e34b061cb74a0a"

--00000000000015e34b061cb74a0a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+1

On Mon, Jul 8, 2024 at 8:02=E2=80=AFAM Kelly Choi <kelly.choi@cloud.com> wr=
ote:

> Hi all,
>
> As you are aware, George Dunlap has recently stepped down from the Xen
> Project as a committer, but he was also a part of the Code of Conduct tea=
m.
>
> As a result, Stefano will be the only member remaining on the CoC team. @=
Roger
> Pau Monne <roger.pau@cloud.com> has volunteered to join the team, so that
> there are at least two members.
>
> In accordance with https://xenproject.org/developers/governance/, I need
> the leadership teams of the three mature projects: the Hypervisor, the XA=
PI
> project, and the Windows PV Driver project to vote on this proposal.
>
> The specific voting rules, in this case, are outlined in the section:
> https://www.xenproject.org/governance.html#project-decisions
>
> I propose to tally the votes after July 31st, 2024. You can reply via
> email in public or private:
> +1: for proposal
> -1: against proposal
>
> Based upon previous communication and rules for voting:
> The vote needs to achieve a 2/3 majority to pass.
>
> Sub-project needs to achieve the following quorum of votes in favour for
> the sub-project=E2=80=99s vote to count:
> Hypervisor: 3 + votes
> XAPI: 2 + votes
> Windows PV Drivers: 1 + votes
>
> Many thanks,
> Kelly Choi
>
> Community Manager
> Xen Project
>

--00000000000015e34b061cb74a0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e">+1<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jul 8, 2024 at 8:02=E2=80=AFAM Kelly Choi &lt;<a hr=
ef=3D"mailto:kelly.choi@cloud.com">kelly.choi@cloud.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi =
all,=C2=A0<div><br></div><div>As you are aware, George Dunlap has recently =
stepped down from the Xen Project as a committer, but he was also a part of=
 the Code of Conduct team.</div><div><br></div><div>As a result, Stefano wi=
ll be the only member remaining on the CoC team.=C2=A0<a class=3D"gmail_plu=
sreply" id=3D"m_4169227896029523200m_-6110525638451986579m_5217689757430685=
812m_2021811972426709313plusReplyChip-0" href=3D"mailto:roger.pau@cloud.com=
" target=3D"_blank">@Roger Pau Monne</a>=C2=A0has volunteered to join the t=
eam, so that there are at least two members.</div><div><br></div>In accorda=
nce with <a href=3D"https://xenproject.org/developers/governance/" target=
=3D"_blank">https://xenproject.org/developers/governance/</a>, I need the l=
eadership teams of the three mature projects: the Hypervisor, the XAPI proj=
ect, and the Windows PV Driver project to vote on this proposal.<br><br>The=
 specific voting rules, in this case, are outlined in the section: <a href=
=3D"https://www.xenproject.org/governance.html#project-decisions" target=3D=
"_blank">https://www.xenproject.org/governance.html#project-decisions</a><d=
iv><br></div><div>I propose to tally the votes after July 31st, 2024. You c=
an reply via email in public or private:<br>+1: for proposal<br>-1: against=
 proposal</div><div><br></div><div>Based upon previous communication and ru=
les for voting:</div><div>The vote needs to achieve a 2/3 majority to pass.=
<br></div><div><br>Sub-project needs to achieve the following quorum of vot=
es in favour for the sub-project=E2=80=99s vote to count:<br>Hypervisor: 3 =
+ votes<br>XAPI: 2 + votes<br>Windows PV Drivers: 1 + votes</div><div><br><=
/div><div><div>Many thanks,<br></div><div><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div>Kelly Choi</div><div><br></div><div><div st=
yle=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"color:r=
gb(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div></div><=
/div>
</blockquote></div>

--00000000000015e34b061cb74a0a--

