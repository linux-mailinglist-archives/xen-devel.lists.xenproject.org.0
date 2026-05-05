Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHifI0RN+ml0MQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 22:04:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA264D363A
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 22:04:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301069.1575408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKLyQ-0008SL-Oo; Tue, 05 May 2026 20:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301069.1575408; Tue, 05 May 2026 20:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKLyQ-0008Po-La; Tue, 05 May 2026 20:02:30 +0000
Received: by outflank-mailman (input) for mailman id 1301069;
 Tue, 05 May 2026 20:02:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1wKLyO-0008Pi-Qt
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 20:02:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1wKLyO-0015nh-2M
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 20:02:28 +0000
Received: from mail-lj1-f180.google.com ([209.85.208.180])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1wKLyO-00GDfj-27
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 20:02:28 +0000
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-38e97e73234so54819981fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 13:02:28 -0700 (PDT)
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
	From:MIME-Version; bh=rqePkcOqKKSlWKJFzPSR0bkrn6hbfy2LL5DYY7SBum8=; b=zT2fRlw
	phrMkxd2zV6e2R0fRg5kzxMXBXM2+CLQ70TeEtlBuKesJvqHCuPC/NEIGM4wSDUGVcOIcOKpVJbPd
	OjgbnnLwBbmkFrXYziAy1yGH9k9ZarffgCSYa61+DRnzWAreH8/HCCSwhD3nc9r7lt2pNxeV7Qwp3
	vTLy+fyFMg=;
X-Gm-Message-State: AOJu0YwzAMB5wNUiJhjyd+F0A4HF+Tx4BTG2YO5TxXOIoDIqluKmhVC9
	zwDmrMPrsJqcGaT64EMc282MB6Kr1DoJoFEjkdDXoGZ+XRdewniMrwNZJJFADaArEttKZRNUh2P
	m8MSNzJ+7w40NAOztxdJTJ6QWb1QzRSQ=
X-Received: by 2002:a2e:a588:0:b0:38e:a12c:418c with SMTP id
 38308e7fff4ca-393c410af2dmr2819051fa.11.1778011347480; Tue, 05 May 2026
 13:02:27 -0700 (PDT)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Tue, 5 May 2026 22:02:16 +0200
X-Gmail-Original-Message-ID: <CAJbE=KyTEfk_rrJgOfYBkLMQEUuheC+J9j_Aq+nFBRKbmFwmPg@mail.gmail.com>
X-Gm-Features: AVHnY4I0i28I8kZ_YWlqHZ5EDkxbkE2r30nYyvs7aHGvWHBLz6ipyX2TNDHTSGM
Message-ID: <CAJbE=KyTEfk_rrJgOfYBkLMQEUuheC+J9j_Aq+nFBRKbmFwmPg@mail.gmail.com>
Subject: [ANNOUNCE] - Call for agenda items for May 7 Xen Community Call @
 15:00 UTC
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000c5f5990651178608"
X-Rspamd-Queue-Id: CFA264D363A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	URI_COUNT_ODD(1.00)[5];
	DMARC_POLICY_ALLOW(-0.50)[xenproject.org,none];
	R_DKIM_ALLOW(-0.20)[xenproject.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jit.si:url,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[xenproject.org:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.680];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]

--000000000000c5f5990651178608
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

It=E2=80=99s time for the May Xen Project Community Call, happening this Th=
ursday
at 4 pm UK time.

We=E2=80=99d love to have you join. You=E2=80=99re welcome to participate o=
r just listen
in. It=E2=80=99s a great way to stay aligned, hear what others are working =
on, and
help move a few ongoing topics forward.

*Preparation*:
Please take a moment to review and update the agenda ahead of the call:
=F0=9F=91=89 Agenda <https://cryptpad.fr/pad/#/2/pad/edit/eJsr2xpwDAzk5xVxO=
mq+iB+G/>

Feel free to:
- Add topics or updates
- Suggest anything we can drop or defer
- Include links to patches, threads, or docs where helpful

*Call Details: *
Date: Thursday, 7 May 2026
Time: 15:00 UTC (agenda starts at 15:05 UTC)
Find your local timezone here
<https://www.worldtimebuddy.com/?qm=3D1&lid=3D2988507,2643743,100,5128581,5=
368361,1850147&h=3D2988507&date=3D2026-5-7&sln=3D17-18&hf=3D1>

Join: https://meet.jit.si/XenProjectCommunityCall

We=E2=80=99ll open the room at 15:00 UTC and start the agenda at 15:05 UTC =
to give
everyone a few minutes to join.

Want to be CC=E2=80=99d on future calls?
Add or remove yourself from our Sign-up Sheet
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>

See you there!


Cody Zuschlag
Xen Project - Community Manager

--000000000000c5f5990651178608
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div style=3D"font-size:inherit" dir=3D"auto">Hi ever=
yone,<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">It=E2=
=80=99s time for the May Xen Project Community Call, happening this Thursda=
y at 4 pm UK time.<br style=3D"font-size:inherit"><br style=3D"font-size:in=
herit">We=E2=80=99d love to have you join. You=E2=80=99re welcome to partic=
ipate or just listen in. It=E2=80=99s a great way to stay aligned, hear wha=
t others are working on, and help move a few ongoing topics forward.<br sty=
le=3D"font-size:inherit"><br style=3D"font-size:inherit"><b>Preparation</b>=
:  <br style=3D"font-size:inherit">Please take a moment to review and updat=
e the agenda ahead of the call:  <br style=3D"font-size:inherit">=F0=9F=91=
=89 <a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/eJsr2xpwDAzk5xVxOmq+iB+=
G/">Agenda</a><br><br style=3D"font-size:inherit">Feel free to:<br style=3D=
"font-size:inherit">- Add topics or updates  <br style=3D"font-size:inherit=
">- Suggest anything we can drop or defer  <br style=3D"font-size:inherit">=
- Include links to patches, threads, or docs where helpful  <br style=3D"fo=
nt-size:inherit"><br style=3D"font-size:inherit"><b>Call Details:  </b><br =
style=3D"font-size:inherit">Date: Thursday, 7 May 2026  <br style=3D"font-s=
ize:inherit">Time: 15:00 UTC (agenda starts at 15:05 UTC)  <br style=3D"fon=
t-size:inherit">Find your local timezone <a href=3D"https://www.worldtimebu=
ddy.com/?qm=3D1&amp;lid=3D2988507,2643743,100,5128581,5368361,1850147&amp;h=
=3D2988507&amp;date=3D2026-5-7&amp;sln=3D17-18&amp;hf=3D1">here</a><div sty=
le=3D"font-size:inherit"></div><br style=3D"font-size:inherit">Join: <a hre=
f=3D"https://meet.jit.si/XenProjectCommunityCall" target=3D"_blank">https:/=
/meet.jit.si/XenProjectCommunityCall</a>  <br style=3D"font-size:inherit"><=
br style=3D"font-size:inherit">We=E2=80=99ll open the room at 15:00 UTC and=
 start the agenda at 15:05 UTC to give everyone a few minutes to join.<br s=
tyle=3D"font-size:inherit"><br style=3D"font-size:inherit">Want to be CC=E2=
=80=99d on future calls?  <br style=3D"font-size:inherit">Add or remove you=
rself from our <a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAO=
e6RFPz0sRCf+/">Sign-up Sheet</a><div style=3D"font-size:inherit"></div><br =
style=3D"font-size:inherit">See you there!</div><br clear=3D"all"><div><div=
 dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><=
div dir=3D"ltr"><img src=3D"https://ci3.googleusercontent.com/mail-sig/AIor=
K4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36JrwBCQtitBSW_0NeDS6mBmJ2F4vZVE2oBOqnY6IaJ=
Url12"></div></div></div></div><div><div><div><div dir=3D"ltr" class=3D"gma=
il_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><br><div>=
Cody Zuschlag</div><div>Xen Project - Community Manager</div></div></div></=
div></div>
</div>
</div>

--000000000000c5f5990651178608--

