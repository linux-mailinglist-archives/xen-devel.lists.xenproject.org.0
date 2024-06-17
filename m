Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 280B690B313
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 16:58:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742413.1149231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDnh-0002h2-3A; Mon, 17 Jun 2024 14:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742413.1149231; Mon, 17 Jun 2024 14:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDng-0002cm-Uw; Mon, 17 Jun 2024 14:57:40 +0000
Received: by outflank-mailman (input) for mailman id 742413;
 Mon, 17 Jun 2024 14:57:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MAK4=NT=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sJDng-0002Xy-5P
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 14:57:40 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efc4343c-2cb9-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 16:57:37 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57c7ec8f1fcso5216677a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 07:57:37 -0700 (PDT)
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
X-Inumbo-ID: efc4343c-2cb9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1718636257; x=1719241057; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=86RGoK/LDSuEJM28NytYmGjmR2Si4KO8R4io5TDshLc=;
        b=Vw4k54V0/DPTdamFs23VB1sg3ijxrN7W0dQvEWo8KFIJPt3QTnwdHfN3ZjJteR9/MK
         flmueD65LYXWggjR84jo5XRx5ObyLIUzIrPnby1cxFuciSVxm+Tn34ePXNd2axCLzU9P
         xVRguTZON8DIskK7bQ+EWqAXqYOiiWmM1sXcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718636257; x=1719241057;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=86RGoK/LDSuEJM28NytYmGjmR2Si4KO8R4io5TDshLc=;
        b=LAqEB5xSb0KGsoxU2TJ6RaMEJW9Mq9XX6rmTP/jq7oHl+q50C1cYm7BYc/frdnsTtG
         aMgBCq2Oe5/trslWT1OqBxut9E2DVFXU0xpYGHFyPuwbhfYVlRpAtjkkq2DNrcOLzPCA
         hY0mjEiyVncAjVn3VD2I24YZPyr4g6ojP5p3e85focWV75KpHX7+Pv/rXKORl9c4jAq1
         hskqvbFWyhsIim5dxZzxsV6BbUc4q9TlPekUKta4H90dCjU2R0/MKvmw2m0MFFdOskwS
         5EH/cHNClvMQSujrClgMaPIBzx2d+eu6KMnovx2C0nyfLr6FFp8PKRQfCZ2p2fg/KwlW
         hG7g==
X-Gm-Message-State: AOJu0YyFVYMmSBdthft7icbL7GDMkuAbeAp0OPqPtm91HgUrtI7ypSxX
	V+1teBeU/Fhe3C4dQilSe48O8EWYCk0c/Y3a795ZNQtDjFnOmUc0ESq7Tjw1TJRr43/NzkRjsam
	hCZ3xaqVBzxb8bj8MipK8kWL4uPTypjhF7n0epXNuPcDOroNWQLo=
X-Google-Smtp-Source: AGHT+IGGRM6D9hTWHjtjGlMUp6snqCC/84qOFHQ1BwiqlZGWGsK8A6Qfje7lcdpAij0pjJa1LKLf6vVAXVQx2NhurFM=
X-Received: by 2002:a50:d70a:0:b0:57c:6b49:af5 with SMTP id
 4fb4d7f45d1cf-57cbd69e833mr7462718a12.29.1718636256601; Mon, 17 Jun 2024
 07:57:36 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 17 Jun 2024 15:57:01 +0100
Message-ID: <CAO-mL=zsrUQypSBRyV18dMZUMM8s3BJBQQ_t7wH9XJYq+NfHDg@mail.gmail.com>
Subject: [Volunteers needed] - Host a local Xen Meetup
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000092bdac061b172f67"

--00000000000092bdac061b172f67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Xen Community!

I'm on the lookout for volunteers who are willing to host some local Xen
events or workshops.

The goal of our meetups is to connect our community members. Meetups allow
members (that=E2=80=99s you) to network, collaborate, and have a pulse on t=
heir
local network. We welcome professionals at all stages of their careers.

Some examples:

   - Hosting a local Xen pub social/meetup in your area
   - Hosting a workshop at a University
   - Hosting a design session
   - Introducing the community to open source and what the Xen Project
   is about
   - Running a joint local meetup with other open-source projects (e.g.
   safety)

I want to get involved, what do I need to do?

   - Contact me (community manager) with some ideas and locations. Many
   companies are open to hosting their office as a meetup space.
   - We'll work closely together to set up an agenda and I'll support with
   promotional activities
   - Gather some interest
   - Submit the budget you would require (e.g. =C2=A3200 for some pizza dur=
ing
   the workshop/event)
   - Let us know if you need some swag for the event
   - Set up a date and start inviting your local community
   - All we ask is that you write up a small event summary/take some photos

Many thanks,
Kelly Choi

Community Manager
Xen Project

--00000000000092bdac061b172f67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Xen Community!=C2=A0<div><br></div><div>I&#39;m on t=
he lookout for volunteers who are willing to host some local Xen events or =
workshops.</div><div><br></div><div>The goal of our meetups is to connect o=
ur community members. Meetups allow members (that=E2=80=99s you) to network=
, collaborate, and have a pulse on their local network. We welcome professi=
onals at all stages of their careers.<br></div><div><br></div><div>Some exa=
mples:</div><div><ul><li>Hosting a local Xen pub social/meetup in your area=
</li><li>Hosting a workshop at a University=C2=A0</li><li>Hosting a design =
session=C2=A0</li><li>Introducing the community to open source and what the=
 Xen Project is=C2=A0about</li><li>Running a joint local meetup with other =
open-source projects (e.g. safety)</li></ul><div>I want to get involved, wh=
at do I need to do?</div></div><div><ul><li>Contact me (community manager) =
with some ideas and locations. Many companies are open to hosting their off=
ice as a meetup space.=C2=A0</li><li>We&#39;ll work closely together to set=
 up an agenda and I&#39;ll support with promotional=C2=A0activities</li><li=
>Gather some interest=C2=A0</li><li>Submit the budget you would require (e.=
g. =C2=A3200 for some pizza during the workshop/event)</li><li>Let us know =
if you need some swag for=C2=A0the event</li><li>Set up a date and start in=
viting your local community</li><li>All we ask is that you write up a small=
 event summary/take some photos=C2=A0</li></ul></div><div><div dir=3D"ltr" =
class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"lt=
r"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><div sty=
le=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"color:rg=
b(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div></div>

--00000000000092bdac061b172f67--

