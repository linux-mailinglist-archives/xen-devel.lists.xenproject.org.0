Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CRpKxo6gmmVQgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 19:10:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46488DD5BB
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 19:10:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219666.1528525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKqk-0003M4-2K; Tue, 03 Feb 2026 18:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219666.1528525; Tue, 03 Feb 2026 18:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKqj-0003LY-Ur; Tue, 03 Feb 2026 18:10:05 +0000
Received: by outflank-mailman (input) for mailman id 1219666;
 Tue, 03 Feb 2026 18:10:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vnKqi-00030g-8c
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 18:10:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vnKqi-0014eP-1g
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 18:10:04 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vnKqi-00FhnJ-0W
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 18:10:04 +0000
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-560227999d2so2247816e0c.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 10:10:04 -0800 (PST)
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
	From:MIME-Version; bh=nfUgb2rr3hKaUs/X3OZNRCZJ1Olxd1VmiOYt/cj9PcY=; b=YUxlg0H
	U2TKt+s7+CT8gMEKV7aUH/766e3n5FQ+UM4UnxCIwETumtSChOIuvEKDAioDqpOv9vo5M0NFC+JAi
	F2dC6m478ebYA8whSF9/GLxV8tErUavrRWKLWphlpk+OQMbJ9AYcLs/JL8qEIkAQgXw5NzYXkXw3+
	tPjg7l5iSI=;
X-Gm-Message-State: AOJu0YzfncWIwqKYURMdRriYUQTZcihEQoxxRGa8b5un1U2Q5daBSbSS
	/G+wEVRTGiTH3iUnzB9uCjcAzQMlj73875p14WDQ0AXFmGOTEd/xNB+sjtc2b+PNscrYEUvBCJ7
	7wp/r8Q78rxQt5kkFnSu5Z7L+DQt7vnM=
X-Received: by 2002:a05:6122:ca9:b0:539:2a2c:6efe with SMTP id
 71dfb90a1353d-566e7fa4f87mr186589e0c.4.1770142203766; Tue, 03 Feb 2026
 10:10:03 -0800 (PST)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Tue, 3 Feb 2026 19:09:52 +0100
X-Gmail-Original-Message-ID: <CAJbE=KypsawebDO6dajT_J=H=gOhn_KsLHDFZu0rLaHGk2umAQ@mail.gmail.com>
X-Gm-Features: AZwV_Qg4oLqnAuzUlf0GsLYDqJ_2TbCHMU3zMqMBZSeO-UH_W_C0ZdD8bvcViyo
Message-ID: <CAJbE=KypsawebDO6dajT_J=H=gOhn_KsLHDFZu0rLaHGk2umAQ@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for February 5 Xen Community Call @
 16:00 UTC
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000041ee7e0649ef59dc"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	URI_COUNT_ODD(1.00)[9];
	DMARC_POLICY_ALLOW(-0.50)[xenproject.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xenproject.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,cryptpad.fr:url,worldtimebuddy.com:url];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[xenproject.org:+];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[cody.zuschlag@xenproject.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cody.zuschlag@xenproject.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 46488DD5BB
X-Rspamd-Action: no action

--00000000000041ee7e0649ef59dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

We=E2=80=99re getting ready for February's Xen Project Community Call on Th=
ursday,
5 February 2026 at 16:00 UTC (4 pm UK time).

We=E2=80=99d love for you to join. Feel free to participate or just observe=
. This
call is a great opportunity to see what the community is working on, align
our various efforts, and share updates. Everyone is welcome!

*Preparation:*

   - Add any proposed agenda items or missing action items:
   https://cryptpad.fr/pad/#/2/pad/edit/tRcgCf32woHY2Yu4V3WJAbIU/
   - If any action items have been resolved or are no longer relevant, feel
   free to remove them from the doc. I attempted to clean up the doc, so fe=
el
   free to make any adjustments.



*Call Details:*

   - Date: Thursday, 5 February 2026
   - Time: 16:00 UTC (agenda begins at 16:05 UTC)
   - Find your local timezone here
   <https://www.worldtimebuddy.com/?qm=3D1&lid=3D5368361,2988507,5128581,26=
43743,100,1850147,6&h=3D2988507&date=3D2026-2-5&sln=3D17-18&hf=3Dundefined&=
c=3D1196>
   - Link to Join the Call: https://meet.jit.si/XenProjectCommunityCall


We plan to open the meeting room at 16:00 UTC, but to allow time for
switching between meetings and handling any technical issues, we=E2=80=99ll
officially start discussing the agenda at 16:05 UTC.

Want to be CC=E2=80=99d on future calls?

Add or remove yourself from our Sign-up Sheet
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>.

See you Thursday!


Cody Zuschlag
Xen Project - Community Manager

--00000000000041ee7e0649ef59dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi everyone,<br><br>We=E2=80=99re getting ready =
for February&#39;s Xen Project Community Call on Thursday, 5 February 2026 =
at 16:00 UTC (4 pm UK time).<br><br>We=E2=80=99d love for you to join. Feel=
 free to participate or just observe. This call is a great opportunity to s=
ee what the community is working on, align our various efforts, and share u=
pdates. Everyone is welcome!<br><br><b>Preparation:</b><br><ul><li style=3D=
"margin-left:15px">Add any proposed agenda items or missing action items: <=
a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/tRcgCf32woHY2Yu4V3WJAbIU/">h=
ttps://cryptpad.fr/pad/#/2/pad/edit/tRcgCf32woHY2Yu4V3WJAbIU/</a></li><li s=
tyle=3D"margin-left:15px">If any action items have been resolved or are no =
longer relevant, feel free to remove them from the doc. I attempted to clea=
n up the doc, so feel free to make any adjustments.</li></ul><br><b>Call De=
tails:<br></b><ul><li style=3D"margin-left:15px">Date: Thursday, 5 February=
 2026</li><li style=3D"margin-left:15px">Time: 16:00 UTC (agenda begins at =
16:05 UTC)</li><li style=3D"margin-left:15px"><a href=3D"https://www.worldt=
imebuddy.com/?qm=3D1&amp;lid=3D5368361,2988507,5128581,2643743,100,1850147,=
6&amp;h=3D2988507&amp;date=3D2026-2-5&amp;sln=3D17-18&amp;hf=3Dundefined&am=
p;c=3D1196" target=3D"_blank">Find your local timezone here</a></li><li sty=
le=3D"margin-left:15px">Link to Join the Call:=C2=A0<a href=3D"https://meet=
.jit.si/XenProjectCommunityCall" target=3D"_blank">https://meet.jit.si/XenP=
rojectCommunityCall</a></li></ul><br></div><div>We plan to open the meeting=
 room at 16:00 UTC, but to allow time for switching between meetings and ha=
ndling any technical issues, we=E2=80=99ll officially start discussing the =
agenda at 16:05 UTC.<br><br>Want to be CC=E2=80=99d on future calls?<br><br=
>Add or remove yourself from our=C2=A0<a href=3D"https://cryptpad.fr/pad/#/=
2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/" target=3D"_blank">Sign-up Sheet</a>.<=
br><br>See you Thursday!</div></div><div><br></div><div><div dir=3D"ltr" cl=
ass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"=
><img src=3D"https://ci3.googleusercontent.com/mail-sig/AIorK4x5nkRDCOFJDJA=
v9aMXdZ0mghItsp3D36JrwBCQtitBSW_0NeDS6mBmJ2F4vZVE2oBOqnY6IaJUrl12"><br><div=
>Cody Zuschlag</div><div>Xen Project - Community Manager</div></div></div><=
/div></div>

--00000000000041ee7e0649ef59dc--

