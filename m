Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLWaLvR302nPiQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 11:08:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4253A270C
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 11:08:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274196.1560381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9fux-0007w0-OX; Mon, 06 Apr 2026 09:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274196.1560381; Mon, 06 Apr 2026 09:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9fux-0007ti-Ll; Mon, 06 Apr 2026 09:06:47 +0000
Received: by outflank-mailman (input) for mailman id 1274196;
 Mon, 06 Apr 2026 09:06:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1w9fuv-0007tc-Ra
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 09:06:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1w9fuw-00COtD-01
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 09:06:45 +0000
Received: from mail-lf1-f41.google.com ([209.85.167.41])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1w9fuw-002gaR-03
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 09:06:45 +0000
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5a2c9932781so3780490e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 02:06:45 -0700 (PDT)
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
	From:MIME-Version; bh=uRb9zU1nhO8e66PvPrcitDqoBWT7m96rvAgdxUxGxxs=; b=mYSZfzT
	kWYD341u2Uz2w/rIJJwJ+q4QpGR6Qid3R2rds/c2vj5uOocP+gdze1/9fm/NRrd6UlqpshNWKVh9B
	x7OyiapT72MiHC0aCZtjzEq5fziYIy/fH1+Ap5GndSqesaDZ4t8MrK8ReJl+L8xhlhaPaVW4w6v69
	45puPP0Sto=;
X-Gm-Message-State: AOJu0YzCnj97ZOndULFE5VDV1okf/mTf1xOg9N3ma8O2V2wNE4Xb0RPk
	9OzywR8f1syHfV90YLfqq4gYLB5VgoKzLefOwQdA7iTr8X+cYly7Eubydk612e0CI4QUi8O6pJ4
	lGr2+tXZyy98RnSqN8M3O5Zjhv1owdco=
X-Received: by 2002:a05:6512:3a93:b0:5a1:334a:dd62 with SMTP id
 2adb3069b0e04-5a2c8d8f938mr4230825e87.13.1775466403726; Mon, 06 Apr 2026
 02:06:43 -0700 (PDT)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Mon, 6 Apr 2026 11:06:32 +0200
X-Gmail-Original-Message-ID: <CAJbE=KyqAjLWvjkfuxsCgM-xX8+HcYUdJwf-gfTKZUtGE50wSw@mail.gmail.com>
X-Gm-Features: AQROBzDr_VmetOvd5rMOvgnacPtnetEjpPE4300kz-lR7yQQw5yD1vBdap3V09I
Message-ID: <CAJbE=KyqAjLWvjkfuxsCgM-xX8+HcYUdJwf-gfTKZUtGE50wSw@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for April 9 Xen Community Call @
 15:00 UTC
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000004e0cfb064ec6fc20"
X-Spamd-Result: default: False [-0.19 / 15.00];
	URI_COUNT_ODD(1.00)[5];
	DMARC_POLICY_ALLOW(-0.50)[xenproject.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xenproject.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,jit.si:url,xenproject.org:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 5A4253A270C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--0000000000004e0cfb064ec6fc20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

It=E2=80=99s time for the April Xen Project Community Call, happening this =
Thursday
at 4 pm UK time.

We=E2=80=99d love to have you join. You=E2=80=99re welcome to participate o=
r just listen
in. It=E2=80=99s a good chance to stay aligned, hear what others are workin=
g on,
and share updates across the community.


*Preparation:  *Please take a moment to review and update the agenda ahead
of the call:
=F0=9F=91=89 Agenda
<https://docs.google.com/document/d/1kJmtG6RzNDzqgvLuOZK4JYrriFApdcpl69KHJW=
EPDKE/edit?usp=3Dsharing>


*Feel free to:*- Add topics or updates
- Clean up anything that=E2=80=99s no longer relevant
- Drop in links to patches, threads, or docs where helpful


*Call Details:  *Date: Thursday, 9 April 2026
Time: 15:00 UTC (agenda starts at 15:05 UTC)
Find your local timezone here
<https://www.worldtimebuddy.com/?qm=3D1&lid=3D5368361,2988507,5128581,26437=
43,100,1850147,6&h=3D2988507&date=3D2026-4-9&sln=3D17-18&hf=3Dundefined&c=
=3D1450>

Join: https://meet.jit.si/XenProjectCommunityCall

We=E2=80=99ll open the room at 15:00 UTC and start the agenda at 15:05 UTC =
to give
folks a few minutes to join.

Want to be CC=E2=80=99d on future calls?
Add or remove yourself from our Sign-up Sheet
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>.

See you there!


Cody Zuschlag
Xen Project - Community Manager

--0000000000004e0cfb064ec6fc20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,<br><br>It=E2=80=99s time for the April X=
en Project Community Call, happening this Thursday at 4 pm UK time.<br><br>=
We=E2=80=99d love to have you join. You=E2=80=99re welcome to participate o=
r just listen in. It=E2=80=99s a good chance to stay aligned, hear what oth=
ers are working on, and share updates across the community.<br><br><b>Prepa=
ration: =C2=A0<br></b>Please take a moment to review and update the agenda =
ahead of the call: =C2=A0<br>=F0=9F=91=89=C2=A0<a href=3D"https://docs.goog=
le.com/document/d/1kJmtG6RzNDzqgvLuOZK4JYrriFApdcpl69KHJWEPDKE/edit?usp=3Ds=
haring">Agenda</a><br><br><b>Feel free to:<br></b>- Add topics or updates =
=C2=A0<br>- Clean up anything that=E2=80=99s no longer relevant =C2=A0<br>-=
 Drop in links to patches, threads, or docs where helpful =C2=A0<br><br><b>=
Call Details: =C2=A0<br></b>Date: Thursday, 9 April 2026 =C2=A0<br>Time: 15=
:00 UTC (agenda starts at 15:05 UTC) =C2=A0<br><a href=3D"https://www.world=
timebuddy.com/?qm=3D1&amp;lid=3D5368361,2988507,5128581,2643743,100,1850147=
,6&amp;h=3D2988507&amp;date=3D2026-4-9&amp;sln=3D17-18&amp;hf=3Dundefined&a=
mp;c=3D1450">Find your local timezone here</a> =C2=A0<br>Join: <a href=3D"h=
ttps://meet.jit.si/XenProjectCommunityCall">https://meet.jit.si/XenProjectC=
ommunityCall </a>=C2=A0<br><br>We=E2=80=99ll open the room at 15:00 UTC and=
 start the agenda at 15:05 UTC to give folks a few minutes to join.</div><d=
iv><br></div><div>Want to be CC=E2=80=99d on future calls?<br>Add or remove=
 yourself from our=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9v=
GzihPxxAOe6RFPz0sRCf+/" target=3D"_blank">Sign-up Sheet</a>.<br><br>See you=
 there!</div><div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature"=
 data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><img src=3D"https://ci=
3.googleusercontent.com/mail-sig/AIorK4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36JrwB=
CQtitBSW_0NeDS6mBmJ2F4vZVE2oBOqnY6IaJUrl12"><br><div>Cody Zuschlag</div><di=
v>Xen Project - Community Manager</div></div></div></div></div>

--0000000000004e0cfb064ec6fc20--

