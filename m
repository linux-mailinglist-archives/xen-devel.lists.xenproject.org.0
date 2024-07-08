Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 733F9929CB0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 09:02:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755041.1163325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQiOA-0006T9-LK; Mon, 08 Jul 2024 07:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755041.1163325; Mon, 08 Jul 2024 07:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQiOA-0006QD-HV; Mon, 08 Jul 2024 07:02:18 +0000
Received: by outflank-mailman (input) for mailman id 755041;
 Mon, 08 Jul 2024 07:02:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iX0w=OI=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sQiO9-0006O8-BW
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 07:02:17 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff80f4bb-3cf7-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 09:02:12 +0200 (CEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2c9a1ea8cc3so2140898a91.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 00:02:14 -0700 (PDT)
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
X-Inumbo-ID: ff80f4bb-3cf7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720422131; x=1721026931; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GlmUL91vpGYV8kIApe/neR3dKN+D50bYXKKcwSeCD2w=;
        b=bw9RHX+qgUUYto2rMNHi9tyowD7hk5kC42uOz3Cy6PawVCE1KmQMNT6/TOCoYMdwci
         AmH2TAwMkvp115hU/STCQAkHD7w7zysHzQq8Sn4HUAdeK9UxtGN1kLaA05nVjLzQfnSP
         mVDSF7//rkosIkUIAIdcL1++ewZ+fi3XAyxjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720422131; x=1721026931;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GlmUL91vpGYV8kIApe/neR3dKN+D50bYXKKcwSeCD2w=;
        b=VMZEL3ATZ8Ab/fBFSStQ9cw8WnJiZpFvr4Pe0BklUlnpIx9SoUPcyc/UrfkQRyTRdt
         AuF68GmGW3iggyHiBBq8FR/JlQZQCn/VNdEjE6ZowWWq7/3i0Zy/J9MCWdqtYXlGX8nx
         YY38fXuIV5Rc2rFmN1f20M3lAHdXPwou9MRKSKUlpSwlYhMRObbt45UB3Wpm0EchTA+i
         YHayXztv8YvoKpUqTC3IVxAkUgfnQXTiOqAwKxzy2YTQ47TQcGXNILzjf+Fo/zqy0I4O
         q4LcHDMHdZyZrumHiTrEaq/5bAr4j2xN2nN8oG8xwUX7fI0+zbRDv2/Vur+nannqw50v
         8wqQ==
X-Gm-Message-State: AOJu0Yw7SoNXQnWcuUbPoVeeFgnenlEo9qou6HVNEqP+LMulmT0Spru8
	tk99etfIBTTJnLPzWsqwv3L+OCuJRLbmMLOEUgtQlEQ9mpM/5UCgVNXeyfqza5X13pK7HqFPtDf
	wgzbUXSMjFgRpg3h7DoKcTjky8a1Dj7ykE358JehWZXwdN9XQBkw=
X-Google-Smtp-Source: AGHT+IG4oLgN0uuHrW6brQ5w/Svh+9g8TVl946X53n95/diA8Hc0wX8bpFGUqmG2FMzI6c4QmLT6vO8PyljN4ZPNeWg=
X-Received: by 2002:a17:90a:c381:b0:2c9:75a7:5c25 with SMTP id
 98e67ed59e1d1-2c99f3ac56cmr16051365a91.15.1720422131432; Mon, 08 Jul 2024
 00:02:11 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 8 Jul 2024 08:00:00 +0100
Message-ID: <CAO-mL=xEEdCjUWN3oqJEBjktH+dsJDXrQ2uHWD80bJJ32q3_pw@mail.gmail.com>
Subject: [Vote] Xen Project Code of Conduct Team Member
To: xen-devel <xen-devel@lists.xenproject.org>, 
	"xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>, win-pv-devel@lists.xenproject.org
Cc: committers@xenproject.org, minios-devel@lists.xenproject.org, 
	mirageos-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@cloud.com>
Content-Type: multipart/alternative; boundary="000000000000021b64061cb6fe20"

--000000000000021b64061cb6fe20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

As you are aware, George Dunlap has recently stepped down from the Xen
Project as a committer, but he was also a part of the Code of Conduct team.

As a result, Stefano will be the only member remaining on the CoC team. @Ro=
ger
Pau Monne <roger.pau@cloud.com> has volunteered to join the team, so that
there are at least two members.

In accordance with https://xenproject.org/developers/governance/, I need
the leadership teams of the three mature projects: the Hypervisor, the XAPI
project, and the Windows PV Driver project to vote on this proposal.

The specific voting rules, in this case, are outlined in the section:
https://www.xenproject.org/governance.html#project-decisions

I propose to tally the votes after July 31st, 2024. You can reply via email
in public or private:
+1: for proposal
-1: against proposal

Based upon previous communication and rules for voting:
The vote needs to achieve a 2/3 majority to pass.

Sub-project needs to achieve the following quorum of votes in favour for
the sub-project=E2=80=99s vote to count:
Hypervisor: 3 + votes
XAPI: 2 + votes
Windows PV Drivers: 1 + votes

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000021b64061cb6fe20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div><br></div><div>As you are aware, George =
Dunlap has recently stepped down from the Xen Project as a committer, but h=
e was also a part of the Code of Conduct team.</div><div><br></div><div>As =
a result, Stefano will be the only member remaining on the CoC team.=C2=A0<=
a class=3D"gmail_plusreply" id=3D"m_-6110525638451986579m_52176897574306858=
12m_2021811972426709313plusReplyChip-0" href=3D"mailto:roger.pau@cloud.com"=
 target=3D"_blank">@Roger Pau Monne</a>=C2=A0has volunteered to join the te=
am, so that there are at least two members.</div><div><br></div>In accordan=
ce with <a href=3D"https://xenproject.org/developers/governance/" target=3D=
"_blank">https://xenproject.org/developers/governance/</a>, I need the lead=
ership teams of the three mature projects: the Hypervisor, the XAPI project=
, and the Windows PV Driver project to vote on this proposal.<br><br>The sp=
ecific voting rules, in this case, are outlined in the section: <a href=3D"=
https://www.xenproject.org/governance.html#project-decisions" target=3D"_bl=
ank">https://www.xenproject.org/governance.html#project-decisions</a><div><=
br></div><div>I propose to tally the votes after July 31st, 2024. You can r=
eply via email in public or private:<br>+1: for proposal<br>-1: against pro=
posal</div><div><br></div><div>Based upon previous communication and rules =
for voting:</div><div>The vote needs to achieve a 2/3 majority to pass.<br>=
</div><div><br>Sub-project needs to achieve the following quorum of votes i=
n favour for the sub-project=E2=80=99s vote to count:<br>Hypervisor: 3 + vo=
tes<br>XAPI: 2 + votes<br>Windows PV Drivers: 1 + votes</div><div><br></div=
><div><div>Many thanks,<br></div><div><div dir=3D"ltr" class=3D"gmail_signa=
ture" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Kelly Choi</=
div><div><br></div><div><div style=3D"color:rgb(136,136,136)">Community Man=
ager</div><div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div>=
</div></div></div></div></div></div>

--000000000000021b64061cb6fe20--

