Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7457F8363A0
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 13:46:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669817.1042277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRtgr-0001ps-FN; Mon, 22 Jan 2024 12:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669817.1042277; Mon, 22 Jan 2024 12:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRtgr-0001lP-Az; Mon, 22 Jan 2024 12:46:13 +0000
Received: by outflank-mailman (input) for mailman id 669817;
 Mon, 22 Jan 2024 12:46:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wscu=JA=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rRtgp-0001gs-CH
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 12:46:11 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36dc0878-b924-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 13:46:08 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a30799d6aa0so51094966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 04:46:08 -0800 (PST)
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
X-Inumbo-ID: 36dc0878-b924-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1705927568; x=1706532368; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QwGlIcefQzi5b40xbeEKbeTOU3dzkT6CGrYmuReqn2c=;
        b=DNS4RNVmwO/0Y4aWK4oWJ4SESow1iM783oyfmj/0o7Gmxv6W+rFtr/kIglPGKU/FPI
         7VLDa4AOvRr9jLtA57buLHN49XPk7vYSNuTjy391HLoo2CM1iN4eh7eWPTYUkysTDtuK
         4Of33LPhoDUPCEXHrpvZDsYukGGB95zJVLXCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705927568; x=1706532368;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QwGlIcefQzi5b40xbeEKbeTOU3dzkT6CGrYmuReqn2c=;
        b=tHfqeFUQxJfVUtcKJFnurO89OOmV4XafBCuw44/khr3Kics7x2qipZbhH0Q0yAbVVX
         GAQY5DTWPiGQiUTZFuXjUV4ycJ0CrByEp2XvJ8j1M/Y0n+BiS/4PP2LGeWFgDBQARN8d
         vxmncGWGH08CganD9n01HSobHjhtFtl69C4voeCITM/iYDZp1rVCXnlw0tGuQJ+64ewu
         MNnwZUnfuNVL0uLi3cg4jwT76kcI+PiCQsx9EviGgc3AUIYH6ISmNx3vZ5MVkdI5+N4J
         zsK0B0ykm8d8cGTNjPWQN+WDsJ4/xreDgKFKf8fXxYK3NDe0lq27cX4l53Wx9kCQkVFc
         T70Q==
X-Gm-Message-State: AOJu0YziNd6LBi4SAsl2YnslO6fUUVbrnhtny7DhNbrezCJ1C6FKW+9w
	lu9JQDk+P98JWc6xTL1moLK8YWDQz/marbcMF759jXH0hD/oQiIP9tEGa7q/Mtz6J07/uyxK6KG
	dCPSe83i8Vnzzd1sp6JgDmQR7t/C0jeMzouNOkKyRK3ZHDh5VAld1eE8y
X-Google-Smtp-Source: AGHT+IGC0/JlLZg8TWbLba4VuF2MVtVxKCBVT6+8Xc8Kex+IvnLIprDgyspMKjNkEFR7RWAYJUp452SpkOumtYtun6c=
X-Received: by 2002:a17:907:9251:b0:a2f:de86:5cdd with SMTP id
 kb17-20020a170907925100b00a2fde865cddmr1352263ejb.41.1705927567754; Mon, 22
 Jan 2024 04:46:07 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=yeRn02O9vN-fNnSuXpvWq1_cYDLPDc=Le+nC3gTnkUpw@mail.gmail.com>
In-Reply-To: <CAO-mL=yeRn02O9vN-fNnSuXpvWq1_cYDLPDc=Le+nC3gTnkUpw@mail.gmail.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 22 Jan 2024 12:45:32 +0000
Message-ID: <CAO-mL=wP+PhtW092dS6Dj2h5n=2t5qYWttqNAiMEa4f6YScBeA@mail.gmail.com>
Subject: =?UTF-8?Q?Fwd=3A_The_Xen_Project=E2=80=99s_20th_Anniversary_=2D_Upcoming?=
	=?UTF-8?Q?_Social_Event=21?=
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000b05e21060f88367a"

--000000000000b05e21060f88367a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

A reminder our next social will be on *Wednesday 21st February 2024 in
Cambridge! *
Please reply to me directly if you're interested in attending.

Have a chance to connect with the community! Food and drinks will be
provided.

Many thanks,
Kelly Choi

Community Manager
Xen Project


---------- Forwarded message ---------
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, Nov 23, 2023 at 1:01=E2=80=AFPM
Subject: The Xen Project=E2=80=99s 20th Anniversary - Upcoming Social Event=
!
To: <advisory-board@lists.xenproject.org>, <xen-devel@lists.xenproject.org>=
,
<xen-users@lists.xenproject.org>


*The Xen Project=E2=80=99s 20th Anniversary*

*Let's get together for an informal social, likely to be pizza/drinks and
getting involved with the community. I hope to run these in future
locations to give everyone a chance to attend.*

*Date placeholder: Wednesday 21st February 2024*
*Location: Cambridge*
*Details TBC - **If you're interested, please reply to me directly and I
will add you to the list.*

*Celebrating Two Decades of Innovation*

It=E2=80=99s hard to believe that two decades have passed since the incepti=
on of
the Xen Project, a trailblazing force in the world of open-source
virtualization. As we raise our glasses to commemorate this momentous
occasion, it=E2=80=99s not just a celebration of time but a reflection on t=
he
incredible journey that has defined the Xen Project=E2=80=99s legacy.

*A Legacy of Innovation*

In the year 2003, the Xen Project emerged as a pioneering open-source
hypervisor, laying the groundwork for some of the most influential cloud
infrastructures that shape our digital landscape today. Over the past 20
years, the Xen Project has not only endured but has thrived, continuously
evolving to meet the dynamic demands of the ever-changing tech landscape.

*Driving Technological Frontiers*

From data center and server virtualization to cloud computing, desktop
virtualization, and fortifying desktop security and hardware appliances,
the Xen Project has been at the forefront of driving technological
innovation. With 20 years of relentless development, it has become
synonymous with reliability, scalability, and adaptability.

*Venturing into New Horizons*

As we celebrate this milestone, we also look forward to the exciting new
territories that the Xen Project is venturing into. From embedded
virtualization to even making strides in the automotive industry, the Xen
Project continues to push boundaries and redefine what=E2=80=99s possible i=
n the
world of open-source virtualization.

*The Annual Event: Xen Project Developer and Design Summit*

At the heart of this remarkable journey is the Xen Project Developer and
Design Summit, an annual gathering of the community=E2=80=99s brilliant min=
ds and
power users. More than just a conference, it=E2=80=99s a celebration of ide=
a
exchange, a showcase of the latest advancements, a platform for sharing
invaluable experiences, and a forum for strategic planning and
collaborative efforts. Be sure to look out for our upcoming event in 2024.

*A Vibrant Community Defining the Future*

Beyond the code and technological achievements, the Xen Project=E2=80=99s s=
trength
lies in its vibrant community. It=E2=80=99s a community that has come toget=
her to
celebrate successes, overcome challenges, and collectively shape the future
of open-source virtualization technology. Even to this day, community
contributions and reviews are still going!

*Looking Ahead*

As we commemorate 20 years of innovation, we also eagerly anticipate the
next chapter in the Xen Project=E2=80=99s journey. With gratitude for the p=
ast and
excitement for the future, we extend our deepest thanks to everyone who has
contributed to this incredible legacy.

Here=E2=80=99s to 20 years of pushing boundaries, fostering collaboration, =
and
shaping the digital landscape.

Happy anniversary, Xen Project! The best is yet to come and I can=E2=80=99t=
 wait to
see what we all achieve.

Many thanks,
Kelly Choi

Open Source Community Manager
XenServer, Cloud Software Group

--000000000000b05e21060f88367a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div><br></div><div>A reminder our next socia=
l will be on=C2=A0<i><b>Wednesday 21st February 2024 in Cambridge!=C2=A0</b=
></i></div><div>Please reply to me directly if you&#39;re interested in att=
ending.</div><div><br></div><div>Have a chance to connect with the communit=
y! Food and drinks will be provided.</div><div><b><i><br clear=3D"all"></i>=
</b><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail=
_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><d=
iv><br></div><div><div style=3D"color:rgb(136,136,136)">Community Manager</=
div><div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></div>=
</div></div></div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">---------- Forwarded message ---------<br>From: <strong cla=
ss=3D"gmail_sendername" dir=3D"auto">Kelly Choi</strong> <span dir=3D"auto"=
>&lt;<a href=3D"mailto:kelly.choi@cloud.com">kelly.choi@cloud.com</a>&gt;</=
span><br>Date: Thu, Nov 23, 2023 at 1:01=E2=80=AFPM<br>Subject: The Xen Pro=
ject=E2=80=99s 20th Anniversary - Upcoming Social Event! <br>To:  &lt;<a hr=
ef=3D"mailto:advisory-board@lists.xenproject.org">advisory-board@lists.xenp=
roject.org</a>&gt;,  &lt;<a href=3D"mailto:xen-devel@lists.xenproject.org">=
xen-devel@lists.xenproject.org</a>&gt;,  &lt;<a href=3D"mailto:xen-users@li=
sts.xenproject.org">xen-users@lists.xenproject.org</a>&gt;<br></div><br><br=
><div dir=3D"ltr"><div><b>The Xen Project=E2=80=99s 20th Anniversary</b></d=
iv><div><br></div><div><i>Let&#39;s get=C2=A0together for an informal socia=
l, likely to be pizza/drinks and getting involved with the community. I hop=
e to run these in future locations to give everyone a chance to attend.</i>=
</div><div><i><br></i></div><div><i><b>Date placeholder: Wednesday 21st Feb=
ruary 2024</b></i></div><div><i><b>Location: Cambridge</b></i></div><div><i=
><b>Details TBC -=C2=A0</b></i><b><font color=3D"#ff0000"><i>If you&#39;re =
interested, please reply to me directly and I will add you to the list.</i>=
</font></b></div><div><br></div><div><b>Celebrating Two Decades of Innovati=
on</b><br></div><div><b><br></b></div><div>It=E2=80=99s hard to believe tha=
t two decades have passed since the inception of the Xen Project, a trailbl=
azing force in the world of open-source virtualization. As we raise our gla=
sses to commemorate this momentous occasion, it=E2=80=99s not just a celebr=
ation of time but a reflection on the incredible journey that has defined t=
he Xen Project=E2=80=99s legacy.<br><b><br>A Legacy of Innovation</b><br><b=
r>In the year 2003, the Xen Project emerged as a pioneering open-source hyp=
ervisor, laying the groundwork for some of the most influential cloud infra=
structures that shape our digital landscape today. Over the past 20 years, =
the Xen Project has not only endured but has thrived, continuously evolving=
 to meet the dynamic demands of the ever-changing tech landscape.<br><b><br=
>Driving Technological Frontiers</b><br><br>From data center and server vir=
tualization to cloud computing, desktop virtualization, and fortifying desk=
top security and hardware appliances, the Xen Project has been at the foref=
ront of driving technological innovation. With 20 years of relentless devel=
opment, it has become synonymous with reliability, scalability, and adaptab=
ility.<br><b><br>Venturing into New Horizons</b><br><br>As we celebrate thi=
s milestone, we also look forward to the exciting new territories that the =
Xen Project is venturing into. From embedded virtualization to even making =
strides in the automotive industry, the Xen Project continues to push bound=
aries and redefine what=E2=80=99s possible in the world of open-source virt=
ualization.<br><b><br>The Annual Event: Xen Project Developer and Design Su=
mmit</b><br><br>At the heart of this remarkable journey is the Xen Project =
Developer and Design Summit, an annual gathering of the community=E2=80=99s=
 brilliant minds and power users. More than just a conference, it=E2=80=99s=
 a celebration of idea exchange, a showcase of the latest advancements, a p=
latform for sharing invaluable experiences, and a forum for strategic plann=
ing and collaborative efforts. Be sure to look out for our upcoming event i=
n 2024.<br><b><br>A Vibrant Community Defining the Future</b><br><br>Beyond=
 the code and technological achievements, the Xen Project=E2=80=99s strengt=
h lies in its vibrant community. It=E2=80=99s a community that has come tog=
ether to celebrate successes, overcome challenges, and collectively shape t=
he future of open-source virtualization technology. Even to this day, commu=
nity contributions and reviews are still going!<br><br><b>Looking Ahead</b>=
<br><br>As we commemorate 20 years of innovation, we also eagerly anticipat=
e the next chapter in the Xen Project=E2=80=99s journey. With gratitude for=
 the past and excitement for the future, we extend our deepest thanks to ev=
eryone who has contributed to this incredible legacy.<br><br>Here=E2=80=99s=
 to 20 years of pushing boundaries, fostering collaboration, and shaping th=
e digital landscape.<br><br>Happy anniversary, Xen Project! The best is yet=
 to come and I can=E2=80=99t wait to see what we all achieve.<br></div><div=
><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Cho=
i</div><div><br></div><div><div style=3D"color:rgb(136,136,136)">Open Sourc=
e Community Manager</div><div style=3D"color:rgb(136,136,136)">XenServer, C=
loud Software Group</div></div></div></div></div></div>
</div></div></div>

--000000000000b05e21060f88367a--

