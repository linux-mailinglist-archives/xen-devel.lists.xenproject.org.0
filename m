Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB345800693
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 10:08:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645387.1007539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8zVi-0004bw-Js; Fri, 01 Dec 2023 09:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645387.1007539; Fri, 01 Dec 2023 09:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8zVi-0004ZR-GP; Fri, 01 Dec 2023 09:08:34 +0000
Received: by outflank-mailman (input) for mailman id 645387;
 Fri, 01 Dec 2023 09:08:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mgf8=HM=gmail.com=persaur@srs-se1.protection.inumbo.net>)
 id 1r8zVh-0004ZL-5b
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 09:08:33 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32969520-9029-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 10:08:31 +0100 (CET)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-77dccb3e4baso102108185a.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 01:08:31 -0800 (PST)
Received: from smtpclient.apple (static-198-54-130-110.cust.tzulo.com.
 [198.54.130.110]) by smtp.gmail.com with ESMTPSA id
 m12-20020ae9e00c000000b0077d74129bd6sm1301913qkk.66.2023.12.01.01.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Dec 2023 01:08:29 -0800 (PST)
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
X-Inumbo-ID: 32969520-9029-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701421711; x=1702026511; darn=lists.xenproject.org;
        h=to:cc:date:message-id:subject:mime-version:from
         :content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5F983s+7WU0Y+C/2K+NkSeb3vLoUdLIE9JN8H81SM0=;
        b=EGH08O/RreyG0LYyAFnRln8Vw7u5+YpAC7YzhxrnTccwZNDCZCnQZx8COKPrxy4RfG
         KAMqPwvtKCrOg2jKvX5IrnE++UAStvxYCRenobyeTq5aH4OrYelcHqDRawHk32tHS/lr
         qhtywdiDXtCIxaQsHPDxKoA3HA1/IGPxzVXj/j4y7iT+qtaAtJ6X6ydDebxQsLiRx09o
         j/4q2SXTWMONsh+eBag8EOMMSF6vf4DA5qB6KNwQ4Fgb6bfzQD/xJKy1PWV+kM4F1s7g
         LWM0+c5bhe0p9EE+OQSElsdIX56s0JZgGoTjG00JPw6zpKTyfpdS/EeZ9OIO6oOE8+iB
         cnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701421711; x=1702026511;
        h=to:cc:date:message-id:subject:mime-version:from
         :content-transfer-encoding:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n5F983s+7WU0Y+C/2K+NkSeb3vLoUdLIE9JN8H81SM0=;
        b=Ef9fIGKqnjaDQLugkcUEpDcuVe95A1KCI8Lo1tCKzHs8CPBfwhV8VaUytQTmybZ7J8
         2bZdbWGo+gs3rRtu3yfvisfNEhAS5sNf4ab6ZfqtXVkUXLy4vSnt73zOcCJSB7NWUNgz
         tbkHdJ2QWsXQDPHyX6J3UhyCLX8ucwp6/pnw5Aa02hnbZxqFM3PjfPUiGvEjCM0q2Awm
         lbWWqF0+z3EAPye2wHjrSnrWs7S3gxbux67fgkeKHIEmnXntoFJTlFRZ6xR/MWyCwRMi
         ytvQHjuHzFP996sGw2pqBaKhjimb3bIz9NMdUBdVB1sayw127pMzoOL/E6dpf8yKJbpF
         qhmw==
X-Gm-Message-State: AOJu0YxPq6d6044z7DSGcYfI1jCR6FACjRpiJfeFpbZ1Dl9HAqLR4Tkf
	XQu9fC4Cy5w+A8uOmFHBlcU=
X-Google-Smtp-Source: AGHT+IFPhGImyfxXqgcap3JuoNCqIkIrBotw1M585YVqWgViSPaUYCVURXMlTdkPX5AUeyoM/oiEWQ==
X-Received: by 2002:a05:620a:a5e:b0:77d:73fd:e89f with SMTP id j30-20020a05620a0a5e00b0077d73fde89fmr23316161qka.46.1701421710494;
        Fri, 01 Dec 2023 01:08:30 -0800 (PST)
Content-Type: multipart/alternative; boundary=Apple-Mail-5C152658-3C45-42F5-8C93-4913B517824E
Content-Transfer-Encoding: 7bit
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Informal voting proposal
Message-Id: <62E07D85-2601-406F-AC27-956BF986ED7F@gmail.com>
Date: Fri, 1 Dec 2023 04:08:18 -0500
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org,
 openxt <openxt@googlegroups.com>
To: Kelly Choi <kelly.choi@cloud.com>
X-Mailer: iPad Mail (20H115)


--Apple-Mail-5C152658-3C45-42F5-8C93-4913B517824E
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Nov 6, 2023, at 13:53, Kelly Choi <kelly.choi@cloud.com> wrote:
> =EF=BB=BF
> Hi all,
>=20
> As an open-source community, there will always be differences of opinion i=
n approaches and the way we think. It is imperative, however, that we view t=
his diversity as a source of strength rather than a hindrance.
>=20
> Recent deliberations within our project have led to certain matters being p=
ut on hold due to an inability to reach a consensus. While formal voting pro=
cedures serve their purpose, they can be time-consuming and may not always l=
ead to meaningful progress.
>=20
> Having received agreement from a few maintainers already, I would like to p=
ropose the following:
>=20
> Informal voting method:
> Each project should ideally have more than 2 maintainers to facilitate imp=
artial discussions. Projects lacking this configuration will be addressed at=
 a later stage.
> Anyone in the community is welcome to voice their opinions, ideas, and con=
cerns about any patch or contribution.
> If members cannot agree, the majority informal vote of the maintainers wil=
l be the decision that stands. For instance, if, after careful consideration=
 of all suggestions and concerns, 2 out of 3 maintainers endorse a solution w=
ithin the x86 subsystem, it shall be the decision we move forward with.
> Naturally, there may be exceptional circumstances, as such, a formal vote m=
ay be warranted but should happen only a few times a year for serious cases o=
nly.
> Informal votes can be as easy as 2 out of 3 maintainers providing their Ac=
ked-by/Reviewed-by tag. Alternatively, Maintainers can call an informal vote=
 by simply emailing the thread with "informal vote proposed, option 1 and op=
tion 2."=20
> All maintainers should reply with their vote within 5 working days. =20
> Please note that with any new process, there will always be room for impro=
vement and we will reiterate where needed.
> Ultimately our goal here is to prevent the project coming to a standstill w=
hile deliberating decisions that we all cannot agree on. This may mean compr=
omising in the short term but I am sure the long-term benefits will stand fo=
r themselves. =20
>=20
> If you have any strong objections to the informal voting, please let me kn=
ow by 30th November 2023.=20
> Should I receive no objections, the process will be implemented as of 1st D=
ecember 2023.
>=20

Apologies for the late response, I was recently asked to look at this thread=
, and it's now the end of my Nov 30th USA day.

In order to evaluate new governance proposals, historical test cases are nee=
ded.  Then the existing process, proposed process (and other candidate proce=
sses!) can be applied to each test case in turn, so we can evaluate the bene=
fits and costs of each candidate. =20

If the problem is not defined, how can candidate solutions be evaluated?  Pe=
rhaps those who have responded to the thread have already discussed the prob=
lem(s) elsewhere, but we need to include them in the public, on-list discuss=
ion record.


> Again there will be times for that call for flexibility, but we should alw=
ays aim to have a vote for two of the best solutions to avoid the project co=
ming to another standstill.=20


Unless I am mistaken, only one solution has been proposed for a problem that=
 has zero on-list examples or test cases.  The community is being given a ch=
oice between one solution and no solution? =20

If we can define the problem, with more than one historical example, then we=
 can consider multiple solutions, pick two of the best solutions, and approv=
e one of the solutions for implementation.

Regards,
Rich

p.s. This is a strong objection to the absence of a problem definition.=

--Apple-Mail-5C152658-3C45-42F5-8C93-4913B517824E
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">On Nov 6, 2023, at 13:53, K=
elly Choi &lt;kelly.choi@cloud.com&gt; wrote:<div dir=3D"ltr"><div dir=3D"lt=
r"><blockquote type=3D"cite"><br></blockquote></div><blockquote type=3D"cite=
"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr">Hi all,<div><br>As an open-sour=
ce community, there will always be differences of opinion in approaches and t=
he way we think. It is imperative, however, that we view this diversity as a=
 source of strength rather than a hindrance.<br><br>Recent deliberations wit=
hin our project have led to certain matters being put on hold due to an inab=
ility to reach a consensus. While formal voting procedures serve their purpo=
se, they can be time-consuming and may not always lead to meaningful progres=
s.<div><br></div><div>Having received agreement from a few maintainers alrea=
dy, I would like to propose&nbsp;the following:</div><div><br></div><div><b>=
Informal voting method:</b></div><div><ol><li>Each project should ideally ha=
ve more than 2 maintainers to facilitate impartial discussions. Projects lac=
king this configuration will be addressed at a later stage.</li><li>Anyone i=
n the community is welcome to voice their opinions, ideas, and concerns abou=
t any patch or contribution.</li><li>If members cannot agree, the majority i=
nformal vote of the maintainers will be the decision that stands. For instan=
ce, if, after careful consideration of all suggestions and concerns, 2 out o=
f 3 maintainers endorse a solution within the x86 subsystem, it shall be the=
 decision we move forward with.</li><li>Naturally, there may be exceptional c=
ircumstances, as such, a formal vote may be warranted but should happen only=
 a few times a year for serious cases only.</li><li>Informal votes can be as=
 easy as 2 out of 3 maintainers providing their Acked-by/Reviewed-by tag. Al=
ternatively, Maintainers can call an informal vote by simply emailing the th=
read with "informal vote proposed, option 1 and option 2."&nbsp;</li><li><b>=
All maintainers should reply with their vote within 5 working days.</b>&nbsp=
;&nbsp;</li><li>Please note that with any new process, there will always be r=
oom for improvement and we will reiterate where needed.</li></ol><div>Ultima=
tely&nbsp;our goal here is to prevent the project coming to a standstill whi=
le deliberating decisions that&nbsp;we all cannot agree on. This may mean co=
mpromising in the short term but I am sure the long-term benefits will stand=
 for themselves.&nbsp;&nbsp;</div><div><font color=3D"#ff0000"><br></font></=
div><div><font color=3D"#ff0000"><b>If you have any strong objections to the=
 informal voting, please let me know by <u>30th November 2023.&nbsp;</u></b>=
</font></div><div><font color=3D"#ff0000"><b>Should I receive no objections,=
 the process will be implemented as of 1st December 2023.</b></font></div><d=
iv><br></div></div></div></div>
</div></blockquote><br><div>Apologies for the late response, I was recently a=
sked to look at this thread, and it's now the end of my Nov 30th USA day.</d=
iv><div><br></div><div>In order to evaluate new governance proposals, histor=
ical test cases are needed. &nbsp;Then the existing process, proposed proces=
s (and other candidate processes!) can be applied to each test case in turn,=
 so we can evaluate the benefits and costs of each candidate. &nbsp;</div><d=
iv><br></div><div>If the problem is not defined, how can candidate solutions=
 be evaluated? &nbsp;Perhaps those who have responded to the thread have alr=
eady discussed the problem(s) elsewhere, but we need to include them in the p=
ublic, on-list discussion record.</div><div><br></div><div><br></div><div><b=
lockquote type=3D"cite"><span style=3D"-webkit-text-size-adjust: auto; caret=
-color: rgb(255, 0, 0); color: rgb(255, 0, 0); background-color: rgb(255, 25=
5, 255);">Again there will be times for that call for flexibility, but we sh=
ould always aim to have a vote for two of the best solutions to avoid the pr=
oject coming to another standstill.&nbsp;</span></blockquote></div><div><br>=
</div><div>Unless I am mistaken, only <b>one</b> solution has been proposed f=
or a problem that has zero on-list examples or test cases. &nbsp;The communi=
ty is being given a choice between one solution and no solution? &nbsp;</div=
><div><br></div><div>If we can define the problem, with more than one histor=
ical example, then we can consider multiple solutions, pick <b>two</b> of th=
e best solutions, and approve one of the solutions for implementation.</div>=
<div><br></div><div>Regards,</div><div>Rich</div><div><br></div><div><div>p.=
s. This is a strong objection to the absence of a problem definition.</div><=
/div></div></div></body></html>=

--Apple-Mail-5C152658-3C45-42F5-8C93-4913B517824E--

