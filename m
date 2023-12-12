Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF48180F38A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 17:49:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653327.1019788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD5wi-0001gy-Kd; Tue, 12 Dec 2023 16:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653327.1019788; Tue, 12 Dec 2023 16:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD5wi-0001do-HJ; Tue, 12 Dec 2023 16:49:24 +0000
Received: by outflank-mailman (input) for mailman id 653327;
 Tue, 12 Dec 2023 16:49:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=akbp=HX=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rD5wh-0001di-4D
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 16:49:23 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6653f56d-990e-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 17:49:22 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50bf26b677dso5599739e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 08:49:22 -0800 (PST)
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
X-Inumbo-ID: 6653f56d-990e-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1702399761; x=1703004561; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cKTOdYUJEYfM6/WDe/biSrugSZBK3LNWZp0xO7aItBU=;
        b=eJ72m+kH8vsiPw0GPPnE7+1EjiDUAxVLE0tpew3GLl3CapFVXizwOxUzlt4F2qYoIi
         mWa3O/XLQpj9CObq4KQZUglqxlGSQ1Yyz5warcOz6IL+4q7Opmg8DBlGbsP7/ctQoejO
         MWz1SCHmjPcL/01L2oK2GXq8ZqV1jjaPRIgaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702399761; x=1703004561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKTOdYUJEYfM6/WDe/biSrugSZBK3LNWZp0xO7aItBU=;
        b=Peu+SnWJNr4yo/nV6533hrDouJ9tDgRHdoVburvQQJHc/o9Pl3hIbpfmwcW1SHCtAM
         YDhDOeorPgQ3ObR+iTi+QG759Q0P7tZl0dCR+33B4tbf9Ds/3CRYtilChI3w8fruZX9S
         ZLeuHek4GL+AAF+7TdfTMqXHbnOYqeJJ+r3bIhooFR6stTIphEaKEhg/6xxixsRmXk1U
         zzj1Hb00LVYhII0QWmToMzf9b1JoQMz7rvX9AMoy5jaGmafCZJJ1isssd6EpSWJ1q/Je
         IiHbjzgk0L8goVLyfXbwJ9y/JIHnRlXHOGmUMG62jEpWuIhOPXMD1HFaya9Cq8fgUxJu
         6LRQ==
X-Gm-Message-State: AOJu0YwXRIziadRh4n+CpvrIvtGbw9t3xbTpJFkg0l15vV/ceOY3RQ4d
	ErefjHGwTXilrfFaZQeazhdIbohV3RTygZTjVYVwsKbot4KnE8yiK00=
X-Google-Smtp-Source: AGHT+IEmi4KySntacweR1iV9QEX6e74pJ4ZAzj4v15T/crxnOJ5CoCnC37VQjCm5mGmKJ7/VGgKAWV+ctFn4iYbUo3s=
X-Received: by 2002:a05:6512:a82:b0:50d:fb23:9c23 with SMTP id
 m2-20020a0565120a8200b0050dfb239c23mr1644553lfu.187.1702399761518; Tue, 12
 Dec 2023 08:49:21 -0800 (PST)
MIME-Version: 1.0
References: <87plzmcoj5.fsf@vates.fr>
In-Reply-To: <87plzmcoj5.fsf@vates.fr>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 12 Dec 2023 16:48:45 +0000
Message-ID: <CAO-mL=yCD8+kQNhmK1fNQ7=VcgzrmN=9cTGeE3eyUHs83sJC1A@mail.gmail.com>
Subject: Re: Improving conflict resolution inside the Xen Project
To: "Charles-H. Schulz" <charles.schulz@vates.fr>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000000d3417060c52d51e"

--0000000000000d3417060c52d51e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Charles,

Thank you for your suggestion.

I will factor this into the discussion I am having this week with the
conduct/governance team.
I will also share the proposed plans with the community and advisory board
as soon as I have details. Please rest assured that all members will have a
chance to discuss these proposals before anything gets implemented.

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Mon, Dec 4, 2023 at 9:20=E2=80=AFAM Charles-H. Schulz <charles.schulz@va=
tes.fr>
wrote:

> Hello,
>
> Following up on the discussions on the use of certain terms and the way t=
o
> handle disagreements that ultimately lead to conflicts, I would like to
> suggest certain mecanisms to more effectively handle such conflicts. This
> does not mean I'm against any informal or formal voting - I think it was
> the
> right thing to do at the right time. But looking forward we need to handl=
e
> conflicts resolution in a way that inflicts the minimum possible tension
> and
> paralysis on the code contributions and bug fixing.
>
> This means that we need to move to a model that's already quite common
> in other projects, namely, a model where conflicts resolution is dealt wi=
th
> processes implemented by one of the more or less formal committees
> chartered
> or existing in the community governance.
>
> What this would imply: in the absence of a more complex governance within
> the
> Xen Project I suggest the Advisory Board be put in charge of conflicts
> resolution. With a simple process that I (and others hopefully) will
> clarify
> soon, the Advisory Board would within a specific timeframe collect and
> analyze the conflict either on its own or called upon by one or more
> community members. It could effectively talk in more detail and off lists
> to
> the relevant persons and then suggest a way out of the conflict.
>
> Ideally - it's Monday and Christmas is not far so let's dream a bit -  th=
is
> would lift the burden of the conflict management away from the developmen=
t
> list and allow it to be focused on development. The Advisory Board should
> in
> these cases work in harmony with the informally proposed Technical Adviso=
y
> Board in order to ensure its decisions are not just the consensus of its
> own
> members but are well understood throughout the project.
>
> Hope this helps,
> --
> Charles-H. Schulz
> Vates SAS.
>
>

--0000000000000d3417060c52d51e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Charles,<div><br></div><div>Thank you for your suggesti=
on.=C2=A0</div><div><br></div><div>I will factor this into the discussion I=
 am having this week with the conduct/governance team.=C2=A0</div><div>I wi=
ll also share the proposed plans with the community and advisory board as s=
oon as I have details. Please rest assured that all members will have a cha=
nce to discuss these proposals before anything gets implemented.=C2=A0</div=
><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><di=
v>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)"=
>Community Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=
=C2=A0<br></div></div></div></div></div><br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 4, 2023 at 9:=
20=E2=80=AFAM Charles-H. Schulz &lt;<a href=3D"mailto:charles.schulz@vates.=
fr">charles.schulz@vates.fr</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Hello,<br>
<br>
Following up on the discussions on the use of certain terms and the way to<=
br>
handle disagreements that ultimately lead to conflicts, I would like to<br>
suggest certain mecanisms to more effectively handle such conflicts. This<b=
r>
does not mean I&#39;m against any informal or formal voting - I think it wa=
s the<br>
right thing to do at the right time. But looking forward we need to handle<=
br>
conflicts resolution in a way that inflicts the minimum possible tension an=
d<br>
paralysis on the code contributions and bug fixing.<br>
<br>
This means that we need to move to a model that&#39;s already quite common<=
br>
in other projects, namely, a model where conflicts resolution is dealt with=
<br>
processes implemented by one of the more or less formal committees chartere=
d<br>
or existing in the community governance.<br>
<br>
What this would imply: in the absence of a more complex governance within t=
he<br>
Xen Project I suggest the Advisory Board be put in charge of conflicts<br>
resolution. With a simple process that I (and others hopefully) will clarif=
y<br>
soon, the Advisory Board would within a specific timeframe collect and<br>
analyze the conflict either on its own or called upon by one or more<br>
community members. It could effectively talk in more detail and off lists t=
o<br>
the relevant persons and then suggest a way out of the conflict.<br>
<br>
Ideally - it&#39;s Monday and Christmas is not far so let&#39;s dream a bit=
 -=C2=A0 this<br>
would lift the burden of the conflict management away from the development<=
br>
list and allow it to be focused on development. The Advisory Board should i=
n<br>
these cases work in harmony with the informally proposed Technical Advisoy<=
br>
Board in order to ensure its decisions are not just the consensus of its ow=
n<br>
members but are well understood throughout the project.<br>
<br>
Hope this helps,<br>
-- <br>
Charles-H. Schulz<br>
Vates SAS.<br>
<br>
</blockquote></div>

--0000000000000d3417060c52d51e--

