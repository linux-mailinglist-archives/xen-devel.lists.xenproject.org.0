Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E681F804418
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 02:32:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647366.1010433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAKIB-00077x-WE; Tue, 05 Dec 2023 01:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647366.1010433; Tue, 05 Dec 2023 01:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAKIB-00075f-RA; Tue, 05 Dec 2023 01:32:07 +0000
Received: by outflank-mailman (input) for mailman id 647366;
 Tue, 05 Dec 2023 01:32:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t8Su=HQ=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rAKIA-00075X-7i
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 01:32:06 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17d4e86b-930e-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 02:32:03 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a0029289b1bso659656966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 17:32:03 -0800 (PST)
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
X-Inumbo-ID: 17d4e86b-930e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701739923; x=1702344723; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Q79mS7K1AUoyftnmiKiPwwtRfwl5V1DKCGolJPsZbs=;
        b=aYgONVK+I06jlq9GhhHi3uZf3pu8QaMI0/9e9QMfk/xS00fbbjUZKHtKyrHdZ/S0YS
         jpcfGzfjbk9n25mdUc7TA+xBmGaT9vlPhG3Ww0m5ZKzuMSYXO62vylEdSnJGghxfLKKk
         AQoaqngwNYLKk9Dpbn3yW6fPZQbR3S7skMac8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701739923; x=1702344723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Q79mS7K1AUoyftnmiKiPwwtRfwl5V1DKCGolJPsZbs=;
        b=mz4hi/KwdnuuzLp1GH51kRXMj7JSmxgUDeoWDfiZqX875X7iIyFuzuzNj8kl90VF02
         BXGvOyntou6razQ2DZE6dQi3w4L74KYTI7AYqZ7kkC7E4Nu30PCAlcKgPr0fVILDXcRe
         pR1udtefKXOcsiJi44g3e+FB2khRbZWg/G2cDRtKUTnp3OI36q/AL+B6V49Ia6EmLqMK
         vNLzgBZpdZ5dRIRYLLJhDqU/PTjApzgRB0oZl6G8j/CxI4p6uGBs6Vyl5OXCbGldt7bZ
         v03ToJGW5OlT4kDpW3CRF9WbNuLdCbp4V+ci0XAZ4Y5Vqlj96AaUzmzWcyOXpNqpTUsq
         5bWw==
X-Gm-Message-State: AOJu0Yz//512NZIrkyBaickBRtdby1TL+3aCgw5U4nHzwKwRqzS+qYt4
	qzH3/B5ucuaMlarIBqlLLJmeOVI03e7JYz7i4zY7hA==
X-Google-Smtp-Source: AGHT+IHAz/TuRNsDxwREuqrJuS2CFa9qUIFwRThJsfHnn0V2B6RJmtG8kGJOk8V1WmhMHfjN5FC0f+mEPhwYTLfbqyk=
X-Received: by 2002:a17:906:101d:b0:a18:97fb:138a with SMTP id
 29-20020a170906101d00b00a1897fb138amr4183404ejm.62.1701739922963; Mon, 04 Dec
 2023 17:32:02 -0800 (PST)
MIME-Version: 1.0
References: <62E07D85-2601-406F-AC27-956BF986ED7F@gmail.com>
In-Reply-To: <62E07D85-2601-406F-AC27-956BF986ED7F@gmail.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 5 Dec 2023 01:31:26 +0000
Message-ID: <CAO-mL=xuSYjhpB1ZwobC8bN+s-iY8j4CBvngqJjo5UXcbRUpMw@mail.gmail.com>
Subject: Re: Informal voting proposal
To: Rich Persaud <persaur@gmail.com>
Cc: committers@xenproject.org, openxt <openxt@googlegroups.com>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000009bd6b3060bb933c1"

--0000000000009bd6b3060bb933c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rich,

I am away on business travel, so did not see your reply before sending my
last email.

The problem we have noted is that there are frequent disagreements within
the project, mainly due to a difference in opinion among other factors. As
a bid to help us move quicker and progress within the community, the
informal voting method was suggested. There probably are many cases where
this can be applicable, but historically a formal vote is a long process
that many want to avoid.

A solution orientated approach is the reason for suggesting a method such
as informal voting. Rather than approaching each problem with a unique
process, this approach encourages the community to work together to achieve
a consensus. Only when this is not possible, then informal voting should be
called.

The informal voting aims to consider multiple solutions, before deciding
between the best two. So I'd disagree with your point that it is either one
solution or no solution.
Instead, the informal voting process aims to empower individuals to present
the best solutions after discussions. I would suggest that historical test
cases be used here as part of the argument whilst presenting the solution.
Again, if we considered every single solution and still disagreed then this
would defeat the point of a vote. It would also be time consuming for
members involved to consistently argue the benefits of each point when it
is clear there are disagreements.

For specific test cases, I agree this would be helpful to have. This would
fit better in aspirational guidelines within governance documents as to
what has happened previously, the solution in that instance, and how it was
resolved.

Our goal here is to progress whilst achieving a majority consensus. It
doesn't mean that the informal voted decision cannot be reviewed when
things change, but this solution will help break up disagreements and avoid
stagnation. Processes such as these will always be reviewed to ensure
consistent improvements in our ways of working.

On a more positive note, it's great to hear your opinion. It simply means
that you and others within the community care and want the best out of the
project.




On Fri, 1 Dec 2023 at 18:08, Rich Persaud <persaur@gmail.com> wrote:

> On Nov 6, 2023, at 13:53, Kelly Choi <kelly.choi@cloud.com> wrote:
>
>
> =EF=BB=BF
> Hi all,
>
> As an open-source community, there will always be differences of opinion
> in approaches and the way we think. It is imperative, however, that we vi=
ew
> this diversity as a source of strength rather than a hindrance.
>
> Recent deliberations within our project have led to certain matters being
> put on hold due to an inability to reach a consensus. While formal voting
> procedures serve their purpose, they can be time-consuming and may not
> always lead to meaningful progress.
>
> Having received agreement from a few maintainers already, I would like to
> propose the following:
>
> *Informal voting method:*
>
>    1. Each project should ideally have more than 2 maintainers to
>    facilitate impartial discussions. Projects lacking this configuration =
will
>    be addressed at a later stage.
>    2. Anyone in the community is welcome to voice their opinions, ideas,
>    and concerns about any patch or contribution.
>    3. If members cannot agree, the majority informal vote of the
>    maintainers will be the decision that stands. For instance, if, after
>    careful consideration of all suggestions and concerns, 2 out of 3
>    maintainers endorse a solution within the x86 subsystem, it shall be t=
he
>    decision we move forward with.
>    4. Naturally, there may be exceptional circumstances, as such, a
>    formal vote may be warranted but should happen only a few times a year=
 for
>    serious cases only.
>    5. Informal votes can be as easy as 2 out of 3 maintainers providing
>    their Acked-by/Reviewed-by tag. Alternatively, Maintainers can call an
>    informal vote by simply emailing the thread with "informal vote propos=
ed,
>    option 1 and option 2."
>    6. *All maintainers should reply with their vote within 5 working
>    days.*
>    7. Please note that with any new process, there will always be room
>    for improvement and we will reiterate where needed.
>
> Ultimately our goal here is to prevent the project coming to a standstill
> while deliberating decisions that we all cannot agree on. This may mean
> compromising in the short term but I am sure the long-term benefits will
> stand for themselves.
>
> *If you have any strong objections to the informal voting, please let me
> know by 30th November 2023. *
> *Should I receive no objections, the process will be implemented as of 1s=
t
> December 2023.*
>
>
> Apologies for the late response, I was recently asked to look at this
> thread, and it's now the end of my Nov 30th USA day.
>
> In order to evaluate new governance proposals, historical test cases are
> needed.  Then the existing process, proposed process (and other candidate
> processes!) can be applied to each test case in turn, so we can evaluate
> the benefits and costs of each candidate.
>
> If the problem is not defined, how can candidate solutions be evaluated?
> Perhaps those who have responded to the thread have already discussed the
> problem(s) elsewhere, but we need to include them in the public, on-list
> discussion record.
>
>
> Again there will be times for that call for flexibility, but we should
> always aim to have a vote for two of the best solutions to avoid the
> project coming to another standstill.
>
>
> Unless I am mistaken, only *one* solution has been proposed for a problem
> that has zero on-list examples or test cases.  The community is being giv=
en
> a choice between one solution and no solution?
>
> If we can define the problem, with more than one historical example, then
> we can consider multiple solutions, pick *two* of the best solutions, and
> approve one of the solutions for implementation.
>
> Regards,
> Rich
>
> p.s. This is a strong objection to the absence of a problem definition.
>

--0000000000009bd6b3060bb933c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">Hi Rich,</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">I am away on business travel, so did not see your reply=
 before sending my last email.=C2=A0<br></div><div dir=3D"auto"><br></div><=
div>The problem we have noted is that there are frequent disagreements with=
in the project, mainly due to a difference in opinion among other factors. =
As a bid to help us move quicker and progress within the community, the inf=
ormal voting method was suggested. There probably are many cases where this=
 can be applicable, but historically a formal vote is a long process that m=
any want to avoid.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>A solution orientated approach is the reason for suggesting a method such =
as informal voting. Rather than approaching each problem with a unique proc=
ess, this approach encourages=C2=A0the community to work together to achiev=
e a consensus. Only when this is not possible, then informal voting should =
be called.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">The inf=
ormal voting aims to consider multiple solutions, before deciding between t=
he best two. So I&#39;d disagree with your point that it is either one solu=
tion or no solution.</div><div dir=3D"auto">Instead, the informal voting pr=
ocess aims to empower individuals to present the best solutions after discu=
ssions. I would suggest that historical test cases be used here as part of =
the argument whilst presenting the solution. Again, if we considered every =
single solution and still disagreed then this would defeat the point of a v=
ote. It would also be time consuming for members involved to consistently a=
rgue the benefits of each point when it is clear there are disagreements.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">For specific test cases, =
I agree this would be helpful to have. This would fit better in aspirationa=
l guidelines within governance documents as to what has happened previously=
, the solution in that instance, and how it was resolved.=C2=A0</div><div d=
ir=3D"auto"><br></div><div>Our goal here is to progress whilst achieving a =
majority consensus. It doesn&#39;t mean that the informal voted decision ca=
nnot be reviewed when things change, but this solution will help break up d=
isagreements and avoid stagnation. Processes such as these will always be=
=C2=A0reviewed to ensure consistent improvements in our ways of working.=C2=
=A0</div><div><br></div><div>On a more positive note, it&#39;s great to hea=
r your opinion. It simply means that you and others within the community ca=
re and want the best out of the project.=C2=A0</div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 1=
 Dec 2023 at 18:08, Rich Persaud &lt;<a href=3D"mailto:persaur@gmail.com" t=
arget=3D"_blank">persaur@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"ltr">On Nov=
 6, 2023, at 13:53, Kelly Choi &lt;<a href=3D"mailto:kelly.choi@cloud.com" =
target=3D"_blank">kelly.choi@cloud.com</a>&gt; wrote:<div dir=3D"ltr"><div =
dir=3D"ltr"><blockquote type=3D"cite"><br></blockquote></div><blockquote ty=
pe=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr">Hi all,<div><br>As a=
n open-source community, there will always be differences of opinion in app=
roaches and the way we think. It is imperative, however, that we view this =
diversity as a source of strength rather than a hindrance.<br><br>Recent de=
liberations within our project have led to certain matters being put on hol=
d due to an inability to reach a consensus. While formal voting procedures =
serve their purpose, they can be time-consuming and may not always lead to =
meaningful progress.<div><br></div><div>Having received agreement from a fe=
w maintainers already, I would like to propose=C2=A0the following:</div><di=
v><br></div><div><b>Informal voting method:</b></div><div><ol><li>Each proj=
ect should ideally have more than 2 maintainers to facilitate impartial dis=
cussions. Projects lacking this configuration will be addressed at a later =
stage.</li><li>Anyone in the community is welcome to voice their opinions, =
ideas, and concerns about any patch or contribution.</li><li>If members can=
not agree, the majority informal vote of the maintainers will be the decisi=
on that stands. For instance, if, after careful consideration of all sugges=
tions and concerns, 2 out of 3 maintainers endorse a solution within the x8=
6 subsystem, it shall be the decision we move forward with.</li><li>Natural=
ly, there may be exceptional circumstances, as such, a formal vote may be w=
arranted but should happen only a few times a year for serious cases only.<=
/li><li>Informal votes can be as easy as 2 out of 3 maintainers providing t=
heir Acked-by/Reviewed-by tag. Alternatively, Maintainers can call an infor=
mal vote by simply emailing the thread with &quot;informal vote proposed, o=
ption 1 and option 2.&quot;=C2=A0</li><li><b>All maintainers should reply w=
ith their vote within 5 working days.</b>=C2=A0=C2=A0</li><li>Please note t=
hat with any new process, there will always be room for improvement and we =
will reiterate where needed.</li></ol><div>Ultimately=C2=A0our goal here is=
 to prevent the project coming to a standstill while deliberating decisions=
 that=C2=A0we all cannot agree on. This may mean compromising in the short =
term but I am sure the long-term benefits will stand for themselves.=C2=A0=
=C2=A0</div><div><font color=3D"#ff0000"><br></font></div><div><font color=
=3D"#ff0000"><b>If you have any strong objections to the informal voting, p=
lease let me know by <u>30th November 2023.=C2=A0</u></b></font></div><div>=
<font color=3D"#ff0000"><b>Should I receive no objections, the process will=
 be implemented as of 1st December 2023.</b></font></div><div><br></div></d=
iv></div></div>
</div></blockquote><br><div>Apologies for the late response, I was recently=
 asked to look at this thread, and it&#39;s now the end of my Nov 30th USA =
day.</div><div><br></div><div>In order to evaluate new governance proposals=
, historical test cases are needed.=C2=A0 Then the existing process, propos=
ed process (and other candidate processes!) can be applied to each test cas=
e in turn, so we can evaluate the benefits and costs of each candidate. =C2=
=A0</div><div><br></div><div>If the problem is not defined, how can candida=
te solutions be evaluated?=C2=A0 Perhaps those who have responded to the th=
read have already discussed the problem(s) elsewhere, but we need to includ=
e them in the public, on-list discussion record.</div><div><br></div><div><=
br></div><div><blockquote type=3D"cite"><span style=3D"color:rgb(255,0,0);b=
ackground-color:rgb(255,255,255)">Again there will be times for that call f=
or flexibility, but we should always aim to have a vote for two of the best=
 solutions to avoid the project coming to another standstill.=C2=A0</span><=
/blockquote></div><div><br></div><div>Unless I am mistaken, only <b>one</b>=
 solution has been proposed for a problem that has zero on-list examples or=
 test cases.=C2=A0 The community is being given a choice between one soluti=
on and no solution? =C2=A0</div><div><br></div><div>If we can define the pr=
oblem, with more than one historical example, then we can consider multiple=
 solutions, pick <b>two</b> of the best solutions, and approve one of the s=
olutions for implementation.</div><div><br></div><div>Regards,</div><div>Ri=
ch</div><div><br></div><div><div>p.s. This is a strong objection to the abs=
ence of a problem definition.</div></div></div></div></div></blockquote></d=
iv></div>

--0000000000009bd6b3060bb933c1--

