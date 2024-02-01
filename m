Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 540628455C8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 11:52:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674289.1049152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVUfP-0003DY-69; Thu, 01 Feb 2024 10:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674289.1049152; Thu, 01 Feb 2024 10:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVUfP-0003Ac-1I; Thu, 01 Feb 2024 10:51:35 +0000
Received: by outflank-mailman (input) for mailman id 674289;
 Thu, 01 Feb 2024 10:51:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9oxY=JK=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rVUfN-00039n-Fr
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 10:51:33 +0000
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [2a00:1450:4864:20::643])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc50aee3-c0ef-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 11:51:32 +0100 (CET)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-a36126ee41eso94269566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 02:51:32 -0800 (PST)
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
X-Inumbo-ID: dc50aee3-c0ef-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706784692; x=1707389492; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/e2n3brzjS7sgJpoVZMw+wyx5Jd+q7mbKNa90maiaTQ=;
        b=dhCn9V9PyHw/jMSSThJKcZazcGT0Ygrk9XRlz1ekQnVK/DqKL+ZEyhd1so3LFbKSdK
         8f5vqBuvT6fjQvvR1TvxNKfB4AzVPWJMCZgxkBOq3w4Nq7Lkm5p846MNWjLdM0N8mG/P
         y++MTWL+J1lJgJ6umQGZKPHS3euwd6w76Bgms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706784692; x=1707389492;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/e2n3brzjS7sgJpoVZMw+wyx5Jd+q7mbKNa90maiaTQ=;
        b=qJobS1l2p+MR6g+GD1nl/X2UtCyEVEzi8JjZA1eX//MwHaQ4/cb4TXfNCNTvyc0mSS
         +DnTobC52jipNJyI4FFQi0VTDIoJbqTRaCY1S1azUhaVLxURfB8oemoB6dierJ2QteGQ
         +3FBLaEHqoR/3lbdBUU1AoBjM4gK4cvwthWF5qVD3Q4FnTRWWf5RttJjN+lECXMhL2/1
         lQJuVe17It5uPBP/54+HLsf9ltxGjqHMQ/v/1vQ5ljP4A73Px5vAe+WTc0hWtEuzAllz
         50eQ13CGc5gQertXwCRS8ycOyeXTJdPM1kmz1b/2YVVxcV5qQXZphJvF9Lra/uBoxyH6
         fOkw==
X-Gm-Message-State: AOJu0Yz7xDIprxD8PnECTrPPIoMQugcP+hURP+xsggOum85h5IsQJAGI
	sjPMV9n/ABUCO+9GtHEMKi63F7GYhcNKHQanVLQHYf459iIzlnQj0muKhsfL8OqIHOn/HT2XvY+
	r6MT7F6EanHNxeDn75kt80cxXtQ50Ofbm0ruTJN84Ju2TsKkXfRIOoUrl
X-Google-Smtp-Source: AGHT+IEXayaWwGkYdvNw1Kt8cebqMKuLrh2e2Ffv7xtSrxXGNYNcl4BoF9N5/TgmA9WxTDbpmM0GBh/Od+Ej/yB/fPI=
X-Received: by 2002:a17:906:6857:b0:a35:5b6:1e0f with SMTP id
 a23-20020a170906685700b00a3505b61e0fmr3210597ejs.71.1706784691644; Thu, 01
 Feb 2024 02:51:31 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 1 Feb 2024 10:50:55 +0000
Message-ID: <CAO-mL=zKzc9BJ5+emfq+L-m5+3t83TYOQmsFNWuKNPvYnJpqcA@mail.gmail.com>
Subject: Upcoming Social Event - Location!
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000040f1ec06104fc74e"

--00000000000040f1ec06104fc74e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm pleased to announce the location of our next social event!
Join and chat with the Xen community, there will also be free food and
drinks.

*Date:* Wednesday 21st February 2024

*Time:* 5:30pm - 9pm (you are welcome to stay later if you wish)

*Location:*
The Portland Arms
129 Chesterton Rd Cambridge
www.theportlandarms.co.uk
T: 01223 357268

*Getting to the venue (more information here
<https://theportlandarms.co.uk/wp/access-info/>):*
There are pay and display spaces (free after 5pm) on Milton Road to the
East of us or opposite on Chesterton Road. The nearest bus stops are:
Chesterton Road, opposite the pub outside Hing Hung restaurant, and on
Milton Road, near Westbrook centre, Citi 1, 9, X9 and The Busway. Cambridge
North rail station is 2.3 miles away and Cambridge Central station is 2.4
miles.

*To anticipate the number of attendees, please email me indicating you wish
to attend. *
*If you have any food allergies, let me know ahead of time. *

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

--00000000000040f1ec06104fc74e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div><br></div><div>I&#39;m pleased to announ=
ce the location of our next social event!</div><div>Join and chat with the =
Xen community, there will also be free food and drinks.</div><div><br></div=
><div><b>Date:</b> Wednesday 21st February 2024<br><b><br></b></div><div><b=
>Time:</b> 5:30pm - 9pm (you are welcome to stay later if you wish)<br></di=
v><b><div><b><br></b></div>Location:</b><br>The Portland Arms<br>129 Cheste=
rton Rd Cambridge<br><a href=3D"http://www.theportlandarms.co.uk" target=3D=
"_blank">www.theportlandarms.co.uk</a><br>T: 01223 357268<div><br></div><di=
v><b>Getting to the venue (<a href=3D"https://theportlandarms.co.uk/wp/acce=
ss-info/" target=3D"_blank">more information here</a>):</b></div><div>There=
 are pay and display spaces (free after 5pm) on Milton Road to the East of =
us or opposite on Chesterton Road. The nearest bus stops are: Chesterton Ro=
ad, opposite the pub outside Hing Hung restaurant, and on Milton Road, near=
 Westbrook centre, Citi 1, 9, X9 and The Busway. Cambridge North rail stati=
on is 2.3 miles away and Cambridge Central station is 2.4 miles.=C2=A0</div=
><br><div><div><div><b>To anticipate the number of attendees, please email =
me=C2=A0indicating you wish to attend.=C2=A0</b></div><div><b>If you have a=
ny food allergies, let me know ahead of time.=C2=A0</b></div><div><br></div=
><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_si=
gnature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div>=
<br></div><div><div style=3D"color:rgb(136,136,136)">Community Manager</div=
><div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></d=
iv></div></div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">---------- Forwarded message ---------<br>From: <strong class=
=3D"gmail_sendername" dir=3D"auto">Kelly Choi</strong> <span dir=3D"auto">&=
lt;<a href=3D"mailto:kelly.choi@cloud.com" target=3D"_blank">kelly.choi@clo=
ud.com</a>&gt;</span><br>Date: Thu, Nov 23, 2023 at 1:01=E2=80=AFPM<br>Subj=
ect: The Xen Project=E2=80=99s 20th Anniversary - Upcoming Social Event! <b=
r>To:  &lt;<a href=3D"mailto:advisory-board@lists.xenproject.org" target=3D=
"_blank">advisory-board@lists.xenproject.org</a>&gt;,  &lt;<a href=3D"mailt=
o:xen-devel@lists.xenproject.org" target=3D"_blank">xen-devel@lists.xenproj=
ect.org</a>&gt;,  &lt;<a href=3D"mailto:xen-users@lists.xenproject.org" tar=
get=3D"_blank">xen-users@lists.xenproject.org</a>&gt;<br></div><br><br><div=
 dir=3D"ltr"><div><b>The Xen Project=E2=80=99s 20th Anniversary</b></div><d=
iv><br></div><div><i>Let&#39;s get=C2=A0together for an informal social, li=
kely to be pizza/drinks and getting involved with the community. I hope to =
run these in future locations to give everyone a chance to attend.</i></div=
><div><i><br></i></div><div><i><b>Date placeholder: Wednesday 21st February=
 2024</b></i></div><div><i><b>Location: Cambridge</b></i></div><div><i><b>D=
etails TBC -=C2=A0</b></i><b><font color=3D"#ff0000"><i>If you&#39;re inter=
ested, please reply to me directly and I will add you to the list.</i></fon=
t></b></div><div><br></div><div><b>Celebrating Two Decades of Innovation</b=
><br></div><div><b><br></b></div><div>It=E2=80=99s hard to believe that two=
 decades have passed since the inception of the Xen Project, a trailblazing=
 force in the world of open-source virtualization. As we raise our glasses =
to commemorate this momentous occasion, it=E2=80=99s not just a celebration=
 of time but a reflection on the incredible journey that has defined the Xe=
n Project=E2=80=99s legacy.<br><b><br>A Legacy of Innovation</b><br><br>In =
the year 2003, the Xen Project emerged as a pioneering open-source hypervis=
or, laying the groundwork for some of the most influential cloud infrastruc=
tures that shape our digital landscape today. Over the past 20 years, the X=
en Project has not only endured but has thrived, continuously evolving to m=
eet the dynamic demands of the ever-changing tech landscape.<br><b><br>Driv=
ing Technological Frontiers</b><br><br>From data center and server virtuali=
zation to cloud computing, desktop virtualization, and fortifying desktop s=
ecurity and hardware appliances, the Xen Project has been at the forefront =
of driving technological innovation. With 20 years of relentless developmen=
t, it has become synonymous with reliability, scalability, and adaptability=
.<br><b><br>Venturing into New Horizons</b><br><br>As we celebrate this mil=
estone, we also look forward to the exciting new territories that the Xen P=
roject is venturing into. From embedded virtualization to even making strid=
es in the automotive industry, the Xen Project continues to push boundaries=
 and redefine what=E2=80=99s possible in the world of open-source virtualiz=
ation.<br><b><br>The Annual Event: Xen Project Developer and Design Summit<=
/b><br><br>At the heart of this remarkable journey is the Xen Project Devel=
oper and Design Summit, an annual gathering of the community=E2=80=99s bril=
liant minds and power users. More than just a conference, it=E2=80=99s a ce=
lebration of idea exchange, a showcase of the latest advancements, a platfo=
rm for sharing invaluable experiences, and a forum for strategic planning a=
nd collaborative efforts. Be sure to look out for our upcoming event in 202=
4.<br><b><br>A Vibrant Community Defining the Future</b><br><br>Beyond the =
code and technological achievements, the Xen Project=E2=80=99s strength lie=
s in its vibrant community. It=E2=80=99s a community that has come together=
 to celebrate successes, overcome challenges, and collectively shape the fu=
ture of open-source virtualization technology. Even to this day, community =
contributions and reviews are still going!<br><br><b>Looking Ahead</b><br><=
br>As we commemorate 20 years of innovation, we also eagerly anticipate the=
 next chapter in the Xen Project=E2=80=99s journey. With gratitude for the =
past and excitement for the future, we extend our deepest thanks to everyon=
e who has contributed to this incredible legacy.<br><br>Here=E2=80=99s to 2=
0 years of pushing boundaries, fostering collaboration, and shaping the dig=
ital landscape.<br><br>Happy anniversary, Xen Project! The best is yet to c=
ome and I can=E2=80=99t wait to see what we all achieve.<br></div><div><br>=
</div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gma=
il_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div>=
<div><br></div><div><div style=3D"color:rgb(136,136,136)">Open Source Commu=
nity Manager</div><div style=3D"color:rgb(136,136,136)">XenServer, Cloud So=
ftware Group</div></div></div></div></div></div>
</div></div></div></div>

--00000000000040f1ec06104fc74e--

