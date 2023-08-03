Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6A376ED2E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 16:50:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576449.902595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZeF-0003E0-HV; Thu, 03 Aug 2023 14:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576449.902595; Thu, 03 Aug 2023 14:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZeF-0003CF-EB; Thu, 03 Aug 2023 14:49:55 +0000
Received: by outflank-mailman (input) for mailman id 576449;
 Thu, 03 Aug 2023 14:49:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k1st=DU=tibco.com=kecho@srs-se1.protection.inumbo.net>)
 id 1qRZdZ-0003BH-D6
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 14:49:13 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8e255c9-320c-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 16:49:12 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fe07f0636bso1845244e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Aug 2023 07:49:12 -0700 (PDT)
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
X-Inumbo-ID: e8e255c9-320c-11ee-b268-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1691074151; x=1691678951;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LtTQGZNo5YSjoPnpB3y/JCSf673ZWqc5kxtsocf7clY=;
        b=EdBWOU/8ZnyKuo8MAcOfcoO/f35LQ2pcQfn87HkvsSbt+A6X2kPFV5gguIZla4W9CB
         6r6AUF5fdojgppa5aN2vRBPSte6rxfPsmDR2dzf7kOHhhjeD6xiZtgCZ/Sv0cyICFddu
         uEcklozGVKGVqg9Suf3dL4JsqPis0k82+TboA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691074151; x=1691678951;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LtTQGZNo5YSjoPnpB3y/JCSf673ZWqc5kxtsocf7clY=;
        b=OYENOSShAYbWZagWR4xubkGJ0JvlqTjid+Hs9t7NGRnYjvvW79D4sCDUluKedmqpSB
         msCDyYv/DIwaAFH12Wn5bLvLCp/eA4hZ3cAUeLsVF9BQS1RqaPj5DQXvw76DXBsNjyVh
         cASExxiCx4AnKV7PxPZVlX1MBJFbB1tr9oQ9ML41fFEZdXbFqNEM7BWY36bKGl1fxNMJ
         BjZ9QrCBRZXNC3AmUN32ocMsvYZDbusmQPdvZHUFTS34J958RNeAQkfqv1WaPw4po115
         /EMNKAcxG/KRmL1nEWYruUA3NqNEQIC/6dB9kjcp29OhRuj2P7Tz7H5Ava1LuiplKz4K
         rhMQ==
X-Gm-Message-State: ABy/qLZo6XRlIMFN0+hqSnYsdVNg610SL7qsIC9B/R83BRwacI+rfEiT
	HuCG4lkEcY2O+XQEbasLnP4AkQDP1I1f6kudWttvVqHzeSoKnPvMnxwyRIFy9Gf62A==
X-Google-Smtp-Source: APBJJlEz825szI+9GBb01xYOoTAD2buEEi9Y2nDZmnt6/Id3lSKe/rHLLYg7Q+b+DnaKtCWKxd8hUU26FA7vTWAFm60=
X-Received: by 2002:a19:8c5c:0:b0:4fb:cabd:2a66 with SMTP id
 i28-20020a198c5c000000b004fbcabd2a66mr7113632lfj.21.1691074151428; Thu, 03
 Aug 2023 07:49:11 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 3 Aug 2023 15:48:36 +0100
Message-ID: <CAO-mL=yUogtHyY6jgBo_6W4WfhypmoF8wsJDA3TOzPV74+j8Eg@mail.gmail.com>
Subject: Call for agenda items for 03/08/23 Community Call @ 1500 UTC
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000015cdb4060205e2d7"

--00000000000015cdb4060205e2d7
Content-Type: text/plain; charset="UTF-8"

Hi all,

The proposed agenda is in this link
<https://cryptpad.fr/pad/#/2/pad/edit/vQgbgUdA3hhXYK2XS79CAgEs/>and you can
edit to add items.  Alternatively, you can reply to this mail directly.

Agenda items appreciated a few days before the call: please put your name
besides items if you edit the document.

Note the following administrative conventions for the call:
* Unless, agreed in the previous meeting otherwise, the call is on the 1st
Thursday of each month at 1600 British Time (either GMT or BST)
* I usually send out a meeting reminder a few days before with a
provisional agenda

* To allow time to switch between meetings, we'll plan on starting the
agenda at 16:05 sharp.  Aim to join by 16:03 if possible to allocate time
to sort out technical difficulties &c

* If you want to be CC'ed please add or remove yourself from the
sign-up-sheet at
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/

*George is on PTO this week, so I will be hosting this call with the help
from the community.

== Dial-in Information ==
## Meeting time
16:00 - 17:00 British time
Further International meeting times:
<https://www.timeanddate.com/worldclock/meetingdetails.html?year=2020&month=4&day=2&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179>
<https://www.timeanddate.com/worldclock/meetingdetails.html?year=2021&month=04&day=8&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179>
https://www.timeanddate.com/worldclock/meetingdetails.html?year=2023&month=5&day=4&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179


## Dial in details
Web: https://meet.jit.si/XenProjectCommunityCall

Dial-in info and pin can be found here:

https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall
Many thanks,
Kelly Choi

Open Source Community Manager, XenServer
Cloud Software Group

--00000000000015cdb4060205e2d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hi all,</p><p>The proposed agenda is in this<a href=3D"=
https://cryptpad.fr/pad/#/2/pad/edit/vQgbgUdA3hhXYK2XS79CAgEs/"> link </a>a=
nd you can edit to add items.=C2=A0 Alternatively, you can reply to this ma=
il directly.<br></p><p>Agenda items appreciated a few days before the call:=
 please put your name besides items if you edit the document.<br></p><p>Not=
e the following administrative conventions for the call:<br>* Unless, agree=
d in the previous meeting otherwise, the call is on the 1st Thursday of eac=
h month at 1600 British Time (either GMT or BST)<br>* I usually send out a =
meeting reminder a few days before with a provisional agenda<br></p><p>* To=
 allow time to switch between meetings, we&#39;ll plan on starting the agen=
da at 16:05 sharp.=C2=A0 Aim to join by 16:03 if possible to allocate time =
to sort out technical difficulties &amp;c</p><p>* If you want to be CC&#39;=
ed please add or remove yourself from the sign-up-sheet at=C2=A0<a href=3D"=
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/">https://cry=
ptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a><br></p><p>*George i=
s on PTO this week, so I will be hosting this call with the help from the c=
ommunity.=C2=A0</p><p>=3D=3D Dial-in Information =3D=3D<br>## Meeting time<=
br>16:00 - 17:00 British time<br>Further International meeting times:=C2=A0=
<a href=3D"https://www.timeanddate.com/worldclock/meetingdetails.html?year=
=3D2020&amp;month=3D4&amp;day=3D2&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp=
;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179"></a><a href=3D"https://ww=
w.timeanddate.com/worldclock/meetingdetails.html?year=3D2021&amp;month=3D04=
&amp;day=3D8&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D3=
7&amp;p3=3D224&amp;p4=3D179"></a><a href=3D"https://www.timeanddate.com/wor=
ldclock/meetingdetails.html?year=3D2023&amp;month=3D5&amp;day=3D4&amp;hour=
=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=
=3D179">https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2=
023&amp;month=3D5&amp;day=3D4&amp;hour=3D15&amp;min=3D0&amp;sec=3D0&amp;p1=
=3D1234&amp;p2=3D37&amp;p3=3D224&amp;p4=3D179</a><br></p><p><br>## Dial in =
details<br>Web:=C2=A0<a href=3D"https://meet.jit.si/XenProjectCommunityCall=
">https://meet.jit.si/XenProjectCommunityCall</a><br></p><p>Dial-in info an=
d pin can be found here:<br></p><p><a href=3D"https://meet.jit.si/static/di=
alInInfo.html?room=3DXenProjectCommunityCall">https://meet.jit.si/static/di=
alInInfo.html?room=3DXenProjectCommunityCall</a></p><div><div dir=3D"ltr" c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr=
"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><div styl=
e=3D"color:rgb(136,136,136)">Open Source Community Manager, XenServer</div>=
<div style=3D"color:rgb(136,136,136)">Cloud Software Group</div></div></div=
></div></div></div>

--00000000000015cdb4060205e2d7--

