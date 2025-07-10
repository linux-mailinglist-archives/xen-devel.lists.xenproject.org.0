Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28926B004F2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 16:19:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039602.1411381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZs6c-0001Hi-SM; Thu, 10 Jul 2025 14:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039602.1411381; Thu, 10 Jul 2025 14:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZs6c-0001Eb-PS; Thu, 10 Jul 2025 14:18:34 +0000
Received: by outflank-mailman (input) for mailman id 1039602;
 Thu, 10 Jul 2025 14:18:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1uZs6b-0001EV-CA
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 14:18:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1uZs6b-00AWXf-0Z
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 14:18:33 +0000
Received: from mail-qk1-f175.google.com ([209.85.222.175])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1uZs6b-00DIJT-0N
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 14:18:33 +0000
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7d3f1bd7121so103521485a.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 07:18:33 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Type:To:Subject:Message-ID:Date:
	From:In-Reply-To:References:MIME-Version;
	bh=U84ec7bPZEnz74PGP2NgETP6gk+j4I7KvBCnicr/dis=; b=SCEpvIOY89CWR5aV01qBTrMTqM
	RoZlvR7FK4zmGF78zZcH3qqlKUeMZfCIfziRXctmJghUWxehz2ecB1It/UvXLqzBMiMixlqrHVh5K
	JTa84nhs2hfiGuPxE7NqHjBqG9fl9vXiwIWNxz3DADHIc5rj31rlJDs1BNzxiFFqcAj0=;
X-Gm-Message-State: AOJu0Yy06+78Y/hjNmTwZDiw3NZH+g/f6Adus/6EqUpj8uxty4d0NDGW
	AUaDD/QHmOkkiRrZbREUmMWvVrXvHlW+h+oC2DNp+JYzsCKfjBvmJzT+AmV1uFz25QSsKQ4gVxK
	wo6fYzr9ppXFTIcbPOt8fGGlP5Q4C9v0=
X-Google-Smtp-Source: AGHT+IHrIzXJak4rTsFQ8WvISNpGKGvJRJQ8DocehBxJzt2RWyk5G5m6Rdig6B4qb7A+zQTJJgCfWlpt0Awl28VcNuw=
X-Received: by 2002:a05:620a:a207:b0:7dd:b677:37c2 with SMTP id
 af79cd13be357-7ddb6773fdamr71099985a.6.1752157112562; Thu, 10 Jul 2025
 07:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAJbE=KwUwKZ8VEGm-q=qa35mtmE6Givm78xBKCZ5YmBjwc51QA@mail.gmail.com>
In-Reply-To: <CAJbE=KwUwKZ8VEGm-q=qa35mtmE6Givm78xBKCZ5YmBjwc51QA@mail.gmail.com>
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Thu, 10 Jul 2025 16:18:20 +0200
X-Gmail-Original-Message-ID: <CAJbE=Ky_zL5YwFc1CHs=Od3u-X8Bq7H6LQMEw8M8GB-Z_-Hmrg@mail.gmail.com>
X-Gm-Features: Ac12FXxaVgosjMKqSNqOBBMPB3uEczKQiiPKuy2Tu9bJSQrbD8Dw_8Pf7qmtBUQ
Message-ID: <CAJbE=Ky_zL5YwFc1CHs=Od3u-X8Bq7H6LQMEw8M8GB-Z_-Hmrg@mail.gmail.com>
Subject: Re: [ANNOUNCE] [NEW TIME] Call for agenda items for July 10, 2025
 Community Call @ 15:00 UTC
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000048fb48063993decb"

--00000000000048fb48063993decb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone. Just a friendly reminder that the July Xen Project Community
Call is happening in 45 minutes. Everyone is welcome!

Agenda: https://cryptpad.fr/pad/#/2/pad/edit/0f4wUR0R9bQp-kOVpzVp2rJl/

Meeting link: https://meet.jit.si/XenProjectCommunityCall

Hope to see you there!

Cody Zuschlag
Xen Project - Community Manager


On Wed, Jul 2, 2025 at 2:44=E2=80=AFPM Cody Zuschlag <cody.zuschlag@xenproj=
ect.org>
wrote:

> Hi everyone,
>
>
> *IMPORTANT: Due to public holidays in several countries, July's community
> call has been moved to Thursday, 10 July 2025.*
> We=E2=80=99re getting ready for June's Xen Project Community Call on *Thu=
rsday,
> 10 July 2025* at *15:00 UTC* (4 pm UK time). We=E2=80=99d love for you to=
 join.
> Feel free to just observe or jump in! This call is a great opportunity to
> see what the community is working on, align our various efforts, and shar=
e
> updates. Everyone is welcome!
>
> *Preparation:*
>
>    - Add any proposed agenda items or missing action items:
>    https://cryptpad.fr/pad/#/2/pad/edit/0f4wUR0R9bQp-kOVpzVp2rJl/
>    - If any action items have been resolved or are no longer relevant,
>    feel free to remove them from the doc.
>
> *Call Details:*
>
>    - *Date:* Thursday, 10 July 2025
>    - *Time:* 15:00 UTC (agenda begins at 15:05 UTC)
>       - Find your local timezone here
>       <https://www.worldtimebuddy.com/?qm=3D1&lid=3D100,2653941,2988507,5=
368361,5128581,1850147,123,1850147&h=3D2988507&date=3D2025-7-10&sln=3D17-18=
&hf=3Dundefined&c=3D1582>
>    - *Link to Join the Call:* https://meet.jit.si/XenProjectCommunityCall
>
> We plan to open the meeting room at 15:00 UTC, but to allow time for
> switching between meetings and handling any technical issues, we=E2=80=99=
ll
> officially start discussing the agenda at 15:05 UTC.
>
> *Want to be CC=E2=80=99d on future calls?*
>
> Add or remove yourself from our Sign-up Sheet
> <https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>.
>
>
> See you next week!
>
> Cody Zuschlag
> Xen Project - Community Manager
>

--00000000000048fb48063993decb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone. Just a friendly reminder that the July X=
en Project Community Call is happening in 45 minutes. Everyone is welcome!<=
br><br>Agenda: <a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/0f4wUR0R9bQp=
-kOVpzVp2rJl/">https://cryptpad.fr/pad/#/2/pad/edit/0f4wUR0R9bQp-kOVpzVp2rJ=
l/</a><br><br>Meeting link: <a href=3D"https://meet.jit.si/XenProjectCommun=
ityCall">https://meet.jit.si/XenProjectCommunityCall</a></div><div><br></di=
v><div>Hope to see you there!</div><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><img src=3D"htt=
ps://ci3.googleusercontent.com/mail-sig/AIorK4x5nkRDCOFJDJAv9aMXdZ0mghItsp3=
D36JrwBCQtitBSW_0NeDS6mBmJ2F4vZVE2oBOqnY6IaJUrl12"><br><div>Cody Zuschlag</=
div><div>Xen Project - Community Manager</div></div></div></div><br></div><=
br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jul 2, 2025 at 2:44=E2=80=AFPM Cody Zuschlag &lt;<a=
 href=3D"mailto:cody.zuschlag@xenproject.org">cody.zuschlag@xenproject.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div><div>Hi everyone,</div><div><br></div><b>IMPORTANT: Du=
e to public holidays in several countries, July&#39;s community call has be=
en moved to Thursday, 10 July 2025.<br></b><br><div>We=E2=80=99re getting r=
eady for June&#39;s Xen Project Community Call on=C2=A0<b>Thursday, 10 July=
 2025</b>=C2=A0at=C2=A0<b>15:00 UTC</b>=C2=A0(4 pm UK time). We=E2=80=99d l=
ove for you to join. Feel free to just observe or jump in! This call is a g=
reat opportunity to see what the community is working on, align our various=
 efforts, and share updates. Everyone is welcome!</div><div><p><b>Preparati=
on:</b></p></div><div><ul><li style=3D"margin-left:15px">Add any proposed a=
genda items or missing action items:=C2=A0<a href=3D"https://cryptpad.fr/pa=
d/#/2/pad/edit/0f4wUR0R9bQp-kOVpzVp2rJl/" target=3D"_blank">https://cryptpa=
d.fr/pad/#/2/pad/edit/0f4wUR0R9bQp-kOVpzVp2rJl/</a></li><li style=3D"margin=
-left:15px">If any action items have been resolved or are no longer relevan=
t, feel free to remove them from the doc.=C2=A0</li></ul></div><div><b>Call=
 Details:</b></div><div><ul><li style=3D"margin-left:15px"><b>Date:</b>=C2=
=A0Thursday, 10 July 2025</li><li style=3D"margin-left:15px"><b>Time:</b>=
=C2=A015:00 UTC (agenda begins at 15:05 UTC)</li><ul><li style=3D"margin-le=
ft:15px"><a href=3D"https://www.worldtimebuddy.com/?qm=3D1&amp;lid=3D100,26=
53941,2988507,5368361,5128581,1850147,123,1850147&amp;h=3D2988507&amp;date=
=3D2025-7-10&amp;sln=3D17-18&amp;hf=3Dundefined&amp;c=3D1582" target=3D"_bl=
ank">Find your local timezone here</a></li></ul><li style=3D"margin-left:15=
px"><b>Link to Join the Call:</b>=C2=A0<a href=3D"https://meet.jit.si/XenPr=
ojectCommunityCall" target=3D"_blank">https://meet.jit.si/XenProjectCommuni=
tyCall</a></li></ul></div><div><p>We plan to open the meeting room at 15:00=
 UTC, but to allow time for switching between meetings and handling any tec=
hnical issues, we=E2=80=99ll officially start discussing the agenda at 15:0=
5 UTC.</p><p><b>Want to be CC=E2=80=99d on future calls?</b><b></b></p><p>A=
dd or remove yourself from our=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/=
pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/" target=3D"_blank">Sign-up Sheet</a>.</p=
><ul></ul><div>See you next week!</div></div></div><div><div dir=3D"ltr" cl=
ass=3D"gmail_signature"><div dir=3D"ltr"><img src=3D"https://ci3.googleuser=
content.com/mail-sig/AIorK4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36JrwBCQtitBSW_0Ne=
DS6mBmJ2F4vZVE2oBOqnY6IaJUrl12"><br><div>Cody Zuschlag</div><div>Xen Projec=
t - Community Manager</div></div></div></div></div>
</blockquote></div>

--00000000000048fb48063993decb--

