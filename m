Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F85582F417
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 19:20:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667940.1039654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPo2h-0004Lk-VT; Tue, 16 Jan 2024 18:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667940.1039654; Tue, 16 Jan 2024 18:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPo2h-0004K5-Sq; Tue, 16 Jan 2024 18:20:07 +0000
Received: by outflank-mailman (input) for mailman id 667940;
 Tue, 16 Jan 2024 18:20:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Syk=I2=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rPo2g-0004Ex-6o
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 18:20:06 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id def8b9eb-b49b-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 19:20:05 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-557bfc7f7b4so15548069a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 10:20:05 -0800 (PST)
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
X-Inumbo-ID: def8b9eb-b49b-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1705429204; x=1706034004; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=djvNaPGdNM6JP18DEgpQPNZqqxx2Mkl0btfjrLqJIUY=;
        b=P6hC0tSIlnZs2gszhjdv/mLQbuKsQVdOQh3y+LVsmawna/oKrbkc+1RqEyg3riBTXy
         BANho9AI5s//5fmtBBWOiKoGGO2o7A53TD1aDRJam97E+GIGEbjGH2WNTzNXhaiWGnof
         qRM8gykmL3pP3AHHs5cJenAE7cbOMAwoAbuME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705429204; x=1706034004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djvNaPGdNM6JP18DEgpQPNZqqxx2Mkl0btfjrLqJIUY=;
        b=oafycZQXt95rAe6Xi8qgN4XkTPKrGWOy2bxdfRXLzZwUGSylaOoEcmn8I0lNsStW78
         gx1zsj587qPKse/KnH6uzKSmO7Fy/TpJyxOGG8vLNj/2Zr+CI8/Se/jmwf3D0st3nYlp
         weKJq8m/csMbNBmy+syNiXYn9R/lDji05UbH+//9nbtPKKv3fo/Rfh7DwLvzZ2/l7fpi
         +ZFiLpT5gg8R8tgWMjOYk1JTElzOh1BpF/QETuxfZB0Py4ojg8M6/YnyfRdakGQIi6Lc
         CAT4Q4zaD6R5D4mPhXKYXPhvnnhXRmCfcZEUlMw1wakDq+Bfqo3WC/IofGxL7tGyl3GN
         bI3g==
X-Gm-Message-State: AOJu0YyjpmBPcQTNfOyE9yU/Eb7SOpY2/giRhB8V3qs89aIJHJ6Qb9iD
	amZr3gWLSg5GsFbpLXcMa0ZpJ9wKyA7mEg77zKXL1XxQv/ewhlcvLSXs9wlRwyQ=
X-Google-Smtp-Source: AGHT+IE8hKRkESJQx4huWqgmeYQJEJpsdfWRjac+i1MjYYMxZEdEDnPtSAn5bb7K+Zh7VqxbCjJvfrpnUU5a+Rip/aY=
X-Received: by 2002:a17:907:a78b:b0:a2c:ea05:66b2 with SMTP id
 vx11-20020a170907a78b00b00a2cea0566b2mr7314967ejc.45.1705429204179; Tue, 16
 Jan 2024 10:20:04 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=xGuvvD24WCD6xsCVJDCgb44uh-214GO-ueTWqqeDrgjQ@mail.gmail.com>
In-Reply-To: <CAO-mL=xGuvvD24WCD6xsCVJDCgb44uh-214GO-ueTWqqeDrgjQ@mail.gmail.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 16 Jan 2024 18:19:27 +0000
Message-ID: <CAO-mL=z43+rfwWAdjFbVuvToiFPrSNYzNLYkUMcEnT6jxnQeRQ@mail.gmail.com>
Subject: Re: Governance change proposal on small updates
To: xen-devel@lists.xenproject.org
Cc: committers@xenproject.org
Content-Type: multipart/alternative; boundary="000000000000e7b4a9060f142df9"

--000000000000e7b4a9060f142df9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I have not had any further feedback opposing this proposal and will go
ahead with the changes.

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Thu, Dec 21, 2023 at 1:00=E2=80=AFPM Kelly Choi <kelly.choi@cloud.com> w=
rote:

> Hi all,
>
> I am proposing a small change in how we update non-trivial matters in our
> governance.
>
> Currently, any governance change requires a formal vote. However, there
> will be times when this is unnecessary and would hinder progress in the
> project. For example, my previous email proposal on changes to clarity an=
d
> inclusivity language. As it stands, I have not received any pushback or
> feedback from the community.
>
> To help us progress faster, I would suggest the following:
> -* Small changes will still need to be proposed to xen-devel and the
> community*
> *- The community is welcome to give as much feedback as necessary before
> any changes are made*
> *- Proposals can be changed/updated as needed, then resubmitted to the
> community *
> *- Anyone can object to these changes or call a vote within 30 days of th=
e
> proposal if deemed necessary*
> *- A committer must ack the change for it to go ahead*
> *- If the community manager does not hear any feedback within 30 days, th=
e
> changes can be acked by a committer and put into the governance*
> *- All important matters and policy changes to the community will still g=
o
> through a formal voting process. This change only applies to small matter=
s
> within the governance. *
>
> Examples:
> *- Wording or spelling changes*
> *- Updating small sentences or clarity changes*
> *- Adding examples to existing code of conduct policies*
>
> I welcome your thoughts on the above proposal.
> Please reply by 14th January 2024 should you have any objections to this.
> If by lazy consensus I do not hear back from this date, I will assume I
> have your agreement on this.
>
> Many thanks,
> Kelly Choi
>
> Community Manager
> Xen Project
>
>
> On Fri, Nov 24, 2023 at 10:57=E2=80=AFAM Kelly Choi <kelly.choi@cloud.com=
> wrote:
>
>> Hi all,
>>
>> Please see an updated Governance PR on GitLab here:
>> https://gitlab.com/xen-project/governance/governance/-/merge_requests/1
>>
>> Comments:
>>
>> Revise code of conduct for enhanced clarity, inclusivity, and
>> accountability
>>
>> In response to valuable feedback from community members and in alignment
>> with our ongoing commitment to creating a safe and welcoming space for
>> collaboration, this commit refines the code of conduct. The changes focu=
s
>> on:
>>
>>    - *Clarity:* Rewording sections to eliminate ambiguity and ensure
>>    that expectations are clearly communicated.
>>    - *Inclusivity:* Adding language to emphasize our dedication to
>>    diversity and inclusion, and providing examples to illustrate the typ=
es of
>>    behavior we encourage.
>>
>> These updates aim to foster a more positive and collaborative atmosphere
>> within our community. Please review the changes and don't hesitate to
>> provide further input or suggestions.
>>
>> Note that the patches should be read as a whole; I'm still learning git
>> and using the gitlab UI, which doesn't have a way to do history editing.
>> Many thanks,
>> Kelly Choi
>>
>> Open Source Community Manager
>> XenServer, Cloud Software Group
>>
>

--000000000000e7b4a9060f142df9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I have not had any further feed=
back opposing this proposal and will go ahead with the changes.=C2=A0</div>=
<div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div=
>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)">=
Community Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=C2=
=A0<br></div></div></div></div></div><br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 21, 2023 at 1:00=
=E2=80=AFPM Kelly Choi &lt;<a href=3D"mailto:kelly.choi@cloud.com">kelly.ch=
oi@cloud.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi all,<div><br></div><div>I =
am proposing a small change in how we update non-trivial matters in our gov=
ernance.</div><div><br></div><div>Currently, any governance=C2=A0change req=
uires a formal vote. However, there will be times when this is unnecessary =
and would hinder progress in the project. For example, my previous email pr=
oposal on changes to clarity and inclusivity language. As it stands, I have=
 not received any pushback or feedback from the community.=C2=A0</div><div>=
<br></div><div>To help us progress faster, I would suggest the following:</=
div><div>-<i>=C2=A0Small changes will still need to be proposed to xen-deve=
l and the community</i></div><div><i>- The community is welcome to give as =
much feedback as necessary before any changes are made</i><i><br></i></div>=
<div><i>- Proposals can be changed/updated as needed, then resubmitted to t=
he community=C2=A0</i></div><div><i>- Anyone can object to these changes or=
 call a vote within 30 days of the proposal if deemed necessary</i></div><d=
iv><i>- A committer must ack the change for it to go ahead</i></div><div><i=
>- If the community manager does not hear any feedback within 30 days, the =
changes can be acked=C2=A0by a committer and put into the governance</i></d=
iv><div><i><b>- All important matters and policy changes to the community w=
ill still go through a formal voting process. This change only applies to s=
mall matters within the governance.=C2=A0</b></i></div><div><br></div><div>=
Examples:</div><div><i>- Wording or spelling changes</i></div><div><i>- Upd=
ating small sentences or clarity changes</i></div><div><i>- Adding examples=
 to existing code of conduct policies</i></div><div><br></div><div>I welcom=
e your thoughts on the above proposal.=C2=A0</div><div><font color=3D"#ff00=
00">Please reply by 14th January 2024 should you have any objections to thi=
s.=C2=A0</font></div><div>If by lazy consensus I do not hear back from this=
 date, I will assume I have your agreement on this.=C2=A0</div><div><br cle=
ar=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"=
><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><div style=
=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"color:rgb(=
136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div><br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Fri, Nov 24, 2023 at 10:57=E2=80=AFAM Kelly Choi &lt;<a href=3D"mailto:k=
elly.choi@cloud.com" target=3D"_blank">kelly.choi@cloud.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
>Hi all,=C2=A0<div><br></div><div>Please see an updated Governance PR on Gi=
tLab here:</div><div><a href=3D"https://gitlab.com/xen-project/governance/g=
overnance/-/merge_requests/1" target=3D"_blank">https://gitlab.com/xen-proj=
ect/governance/governance/-/merge_requests/1</a>=C2=A0<br></div><div><p>Com=
ments:</p><p dir=3D"auto">Revise code of conduct for enhanced clarity, incl=
usivity, and accountability</p>
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
</blockquote></div>

--000000000000e7b4a9060f142df9--

