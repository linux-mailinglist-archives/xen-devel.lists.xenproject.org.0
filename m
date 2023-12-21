Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 307F381B6C5
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 14:00:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658879.1028311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGIfQ-0003ya-K8; Thu, 21 Dec 2023 13:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658879.1028311; Thu, 21 Dec 2023 13:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGIfQ-0003wX-HD; Thu, 21 Dec 2023 13:00:48 +0000
Received: by outflank-mailman (input) for mailman id 658879;
 Thu, 21 Dec 2023 13:00:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kIw=IA=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rGIfP-0003wR-Aq
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 13:00:47 +0000
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [2607:f8b0:4864:20::b34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3a63a57-a000-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 14:00:45 +0100 (CET)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-dbd4a10735eso754068276.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 05:00:45 -0800 (PST)
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
X-Inumbo-ID: f3a63a57-a000-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1703163643; x=1703768443; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Oxc55xU72Qxmrctlu5SXlDHbgYQMGAQr2o95oPhqITs=;
        b=SLMQP96x2tqPYh3NXZpEavHiItAZanyENVDeoykFJYs/kqHhCSFdPUbO4dXJnsqGlE
         op2ssiBEutvloSYr2vUlBWn4MMUyibRNrNMxBqPrB/WmdWUXybjwDpf1rcYHEyKD+Z9a
         QFGfQ8O3WhNZ2FkQgiwym+N4M81HYg2M8bU3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703163643; x=1703768443;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oxc55xU72Qxmrctlu5SXlDHbgYQMGAQr2o95oPhqITs=;
        b=IyvlRAMBAu9Up1ax/i/Ui4GpLSlE/TKJ7zIt1nCZaFF7i4aVifVxoYtGeDBb6WJLZY
         hzY/7cnvFdn1vDHTjgW50vOhYA/QWg20SkTV4lJaQ/1FWKFZEEwo0chIoil+UcMVx8jW
         ieBwwhjzkOSel61ELdawYseXhsgZszTaeNCjAdmKuftEFwb5HohvrrakAjIiCAZxI6pV
         Icb+scW9dkaLI1Uglu5aokq779602tqDl0C2+ao/1i9vemDmUdyWht4knrEK/iH3j+tv
         0xdobFFMS5T3aArVqRPB9EqcqgjUt9cjIToujq7dhWgVgfuzBSDTPvmw9fBIvioGRdRN
         VypQ==
X-Gm-Message-State: AOJu0Yy/ztkYlWC8y1k+W6OqiVAoQpwYz7+SLPfBILcEXTlkgw++7CYh
	EqLIq+axkp+KSOmctqi3Yx3XIgwtmBTKIwFfchhSdnO9T2ej6oVYvTc=
X-Google-Smtp-Source: AGHT+IEP6y/c4G4+yTkvePcO57lO7HPUvA0Uei9zJ/Cgf4wXhm/PF4r7ycRj7mKcDMkbUlkYnmBz81i2E95LGtKang4=
X-Received: by 2002:a25:adc1:0:b0:db9:6dbb:8680 with SMTP id
 d1-20020a25adc1000000b00db96dbb8680mr1060429ybe.41.1703163643052; Thu, 21 Dec
 2023 05:00:43 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 21 Dec 2023 13:00:06 +0000
Message-ID: <CAO-mL=xGuvvD24WCD6xsCVJDCgb44uh-214GO-ueTWqqeDrgjQ@mail.gmail.com>
Subject: Governance change proposal on small updates
To: xen-devel@lists.xenproject.org
Cc: committers@xenproject.org
Content-Type: multipart/alternative; boundary="000000000000f05e7e060d04af3a"

--000000000000f05e7e060d04af3a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am proposing a small change in how we update non-trivial matters in our
governance.

Currently, any governance change requires a formal vote. However, there
will be times when this is unnecessary and would hinder progress in the
project. For example, my previous email proposal on changes to clarity and
inclusivity language. As it stands, I have not received any pushback or
feedback from the community.

To help us progress faster, I would suggest the following:
-* Small changes will still need to be proposed to xen-devel and the
community*
*- The community is welcome to give as much feedback as necessary before
any changes are made*
*- Proposals can be changed/updated as needed, then resubmitted to the
community *
*- Anyone can object to these changes or call a vote within 30 days of the
proposal if deemed necessary*
*- A committer must ack the change for it to go ahead*
*- If the community manager does not hear any feedback within 30 days, the
changes can be acked by a committer and put into the governance*
*- All important matters and policy changes to the community will still go
through a formal voting process. This change only applies to small matters
within the governance. *

Examples:
*- Wording or spelling changes*
*- Updating small sentences or clarity changes*
*- Adding examples to existing code of conduct policies*

I welcome your thoughts on the above proposal.
Please reply by 14th January 2024 should you have any objections to this.
If by lazy consensus I do not hear back from this date, I will assume I
have your agreement on this.

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Fri, Nov 24, 2023 at 10:57=E2=80=AFAM Kelly Choi <kelly.choi@cloud.com> =
wrote:

> Hi all,
>
> Please see an updated Governance PR on GitLab here:
> https://gitlab.com/xen-project/governance/governance/-/merge_requests/1
>
> Comments:
>
> Revise code of conduct for enhanced clarity, inclusivity, and
> accountability
>
> In response to valuable feedback from community members and in alignment
> with our ongoing commitment to creating a safe and welcoming space for
> collaboration, this commit refines the code of conduct. The changes focus
> on:
>
>    - *Clarity:* Rewording sections to eliminate ambiguity and ensure that
>    expectations are clearly communicated.
>    - *Inclusivity:* Adding language to emphasize our dedication to
>    diversity and inclusion, and providing examples to illustrate the type=
s of
>    behavior we encourage.
>
> These updates aim to foster a more positive and collaborative atmosphere
> within our community. Please review the changes and don't hesitate to
> provide further input or suggestions.
>
> Note that the patches should be read as a whole; I'm still learning git
> and using the gitlab UI, which doesn't have a way to do history editing.
> Many thanks,
> Kelly Choi
>
> Open Source Community Manager
> XenServer, Cloud Software Group
>

--000000000000f05e7e060d04af3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi all,<div><br></div><div>I am proposing=
 a small change in how we update non-trivial matters in our governance.</di=
v><div><br></div><div>Currently, any governance=C2=A0change requires a form=
al vote. However, there will be times when this is unnecessary and would hi=
nder progress in the project. For example, my previous email proposal on ch=
anges to clarity and inclusivity language. As it stands, I have not receive=
d any pushback or feedback from the community.=C2=A0</div><div><br></div><d=
iv>To help us progress faster, I would suggest the following:</div><div>-<i=
>=C2=A0Small changes will still need to be proposed to xen-devel and the co=
mmunity</i></div><div><i>- The community is welcome to give as much feedbac=
k as necessary before any changes are made</i><i><br></i></div><div><i>- Pr=
oposals can be changed/updated as needed, then resubmitted to the community=
=C2=A0</i></div><div><i>- Anyone can object to these changes or call a vote=
 within 30 days of the proposal if deemed necessary</i></div><div><i>- A co=
mmitter must ack the change for it to go ahead</i></div><div><i>- If the co=
mmunity manager does not hear any feedback within 30 days, the changes can =
be acked=C2=A0by a committer and put into the governance</i></div><div><i><=
b>- All important matters and policy changes to the community will still go=
 through a formal voting process. This change only applies to small matters=
 within the governance.=C2=A0</b></i></div><div><br></div><div>Examples:</d=
iv><div><i>- Wording or spelling changes</i></div><div><i>- Updating small =
sentences or clarity changes</i></div><div><i>- Adding examples to existing=
 code of conduct policies</i></div><div><br></div><div>I welcome your thoug=
hts on the above proposal.=C2=A0</div><div><font color=3D"#ff0000">Please r=
eply by 14th January 2024 should you have any objections to this.=C2=A0</fo=
nt></div><div>If by lazy consensus I do not hear back from this date, I wil=
l assume I have your agreement on this.=C2=A0</div><div><br clear=3D"all"><=
div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Many t=
hanks,</div><div>Kelly Choi</div><div><br></div><div><div style=3D"color:rg=
b(136,136,136)">Community Manager</div><div style=3D"color:rgb(136,136,136)=
">Xen Project=C2=A0<br></div></div></div></div></div><br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov =
24, 2023 at 10:57=E2=80=AFAM Kelly Choi &lt;<a href=3D"mailto:kelly.choi@cl=
oud.com" target=3D"_blank">kelly.choi@cloud.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi all,=C2=
=A0<div><br></div><div>Please see an updated Governance PR on GitLab here:<=
/div><div><a href=3D"https://gitlab.com/xen-project/governance/governance/-=
/merge_requests/1" target=3D"_blank">https://gitlab.com/xen-project/governa=
nce/governance/-/merge_requests/1</a>=C2=A0<br></div><div><p>Comments:</p><=
p dir=3D"auto">Revise code of conduct for enhanced clarity, inclusivity, an=
d accountability</p>
<p dir=3D"auto">In response to valuable feedback from community members and=
 in alignment with our ongoing commitment to creating a safe and welcoming =
space for collaboration, this commit refines the code of conduct. The chang=
es focus on:</p>
<ul dir=3D"auto">
<li>
<strong>Clarity:</strong> Rewording sections to eliminate ambiguity and ens=
ure that expectations are clearly communicated.</li>
<li>
<strong>Inclusivity:</strong> Adding language to emphasize our dedication t=
o diversity and inclusion, and providing examples to illustrate the types o=
f behavior we encourage.</li>
</ul>
<p dir=3D"auto">These updates aim to foster a more positive and collaborati=
ve atmosphere within our community. Please review the changes and don&#39;t=
 hesitate to provide further input or suggestions.</p>
<p dir=3D"auto">Note that the patches should be read as a whole; I&#39;m st=
ill learning git and using the gitlab UI, which doesn&#39;t have a way to d=
o history editing.</p></div><div><div><div dir=3D"ltr" class=3D"gmail_signa=
ture"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br=
></div><div><div style=3D"color:rgb(136,136,136)">Open Source Community Man=
ager</div><div style=3D"color:rgb(136,136,136)">XenServer, Cloud Software G=
roup</div></div></div></div></div></div></div>
</blockquote></div></div>

--000000000000f05e7e060d04af3a--

