Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEW1HTtrqWnH7AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 12:38:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23795210AE3
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 12:38:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246479.1545648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy724-0002Vb-Gy; Thu, 05 Mar 2026 11:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246479.1545648; Thu, 05 Mar 2026 11:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy724-0002St-Dm; Thu, 05 Mar 2026 11:38:20 +0000
Received: by outflank-mailman (input) for mailman id 1246479;
 Thu, 05 Mar 2026 11:38:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vy723-0002Sn-PB
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 11:38:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vy723-006XQq-2L
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 11:38:19 +0000
Received: from mail-lj1-f174.google.com ([209.85.208.174])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vy723-00097C-2A
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 11:38:19 +0000
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-389fa352b0eso127392171fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 03:38:19 -0800 (PST)
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
	From:MIME-Version; bh=t5++F147kVljeJObCX+Hq7bCYgIw+fILQWtbrnZag0Q=; b=gdBDpOp
	+/HNelwB9DULGKC0VDWHopHTUEqC7xaeGdhtbuwAFUjyEx18lfLYXT2I7Yif+jnXtiiTtAeIGUdVV
	ekrXUR0yeBfpmvdQ237HlyaW0RaIJk9HkW4hTig6ED3CyssyVvTUlhrvkRrp2YlVUqaBctor0mFGn
	IPK0bqLmMA=;
X-Gm-Message-State: AOJu0YxylZTqmGGC/SGURoY008UCeovjmvdrpKVqIuaNoQPtjdgxjexi
	CEnxeNwkRcweeTLDszfXl4O3r9neDZ4TJE6UVq4sl1VHUPVhNn1VP3pzwE/wUbtRpYUgQRvYBFe
	ZAJiNwZgS9nc0AYDPt0ZT1MhHo5egowM=
X-Received: by 2002:a2e:3c04:0:b0:385:f0ce:e222 with SMTP id
 38308e7fff4ca-38a2c7eb260mr23074891fa.41.1772710698530; Thu, 05 Mar 2026
 03:38:18 -0800 (PST)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Thu, 5 Mar 2026 12:38:07 +0100
X-Gmail-Original-Message-ID: <CAJbE=Ky4_S4ystqVhDj99=H8hQWn87bZP3nVoFQ3wVUkwFJydg@mail.gmail.com>
X-Gm-Features: AaiRm50KtKPF8U5Z6NytGmpHt15Pvsj5P0bMZnuY4uijKlnaCJq19i5vkW2lcuU
Message-ID: <CAJbE=Ky4_S4ystqVhDj99=H8hQWn87bZP3nVoFQ3wVUkwFJydg@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for March 5 (Today!) Xen Community
 Call @ 16:00 UTC
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000079bc3b064c455f85"
X-Rspamd-Queue-Id: 23795210AE3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	URI_COUNT_ODD(1.00)[9];
	DMARC_POLICY_ALLOW(-0.50)[xenproject.org,none];
	R_DKIM_ALLOW(-0.20)[xenproject.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,mail.gmail.com:mid,xenproject.org:dkim];
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
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

--00000000000079bc3b064c455f85
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

My apologies for the late notice this month, the short February month (with
some personal PTO) made this one sneak up on me. Today is March's Xen
Project Community Call (4 pm UK time).

We=E2=80=99d love for you to join. Feel free to participate or just observe=
. This
call is a great opportunity to see what the community is working on, align
our various efforts, and share updates. Everyone is welcome!

*Preparation:*

   - Add any proposed agenda items or missing action items:
   https://cryptpad.fr/pad/#/2/pad/edit/R-D-3LsJGJeZY8o2H9qpoFD5/
   - If any action items have been resolved or are no longer relevant, feel
   free to remove them from the doc. I attempted to clean up the doc, so fe=
el
   free to make any adjustments.



*Call Details:*

   - Date: Thursday, 5 March 2026
   - Time: 16:00 UTC (agenda begins at 16:05 UTC)
   - Find your local timezone here
   <https://www.worldtimebuddy.com/?qm=3D1&lid=3D5368361,2988507,5128581,26=
43743,100,1850147,6&h=3D2988507&date=3D2026-3-5&sln=3D17-18&hf=3Dundefined&=
c=3D1189>
   - Link to Join the Call: https://meet.jit.si/XenProjectCommunityCall


We plan to open the meeting room at 16:00 UTC, but to allow time for
switching between meetings and handling any technical issues, we=E2=80=99ll
officially start discussing the agenda at 16:05 UTC.

Want to be CC=E2=80=99d on future calls?

Add or remove yourself from our Sign-up Sheet
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>.

See you today!


Cody Zuschlag
Xen Project - Community Manager

--00000000000079bc3b064c455f85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi everyone,<br><br>My apologies for the late no=
tice this=C2=A0month, the short February month (with some personal PTO) mad=
e this one sneak up on me. Today is March&#39;s Xen Project=C2=A0<span clas=
s=3D"gmail-il">Community</span>=C2=A0Call (4 pm UK time).<br><br>We=E2=80=
=99d love for you to join. Feel free to participate or just observe. This c=
all is a great opportunity to see what the=C2=A0<span class=3D"gmail-il">co=
mmunity</span>=C2=A0is working on, align our various efforts, and share upd=
ates. Everyone is welcome!<br><br><b>Preparation:</b><br><ul><li style=3D"m=
argin-left:15px">Add any proposed agenda items or missing action items:=C2=
=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/R-D-3LsJGJeZY8o2H9qpoFD5=
/" target=3D"_blank">https://cryptpad.fr/pad/#/2/pad/edit/R-D-3LsJGJeZY8o2H=
9qpoFD5/</a></li><li style=3D"margin-left:15px">If any action items have be=
en resolved or are no longer relevant, feel free to remove them from the do=
c. I attempted to clean up the doc, so feel free to make any adjustments.</=
li></ul><br><b>Call Details:<br></b><ul><li style=3D"margin-left:15px">Date=
: Thursday, 5 March 2026</li><li style=3D"margin-left:15px">Time: 16:00 UTC=
 (agenda begins at 16:05 UTC)</li><li style=3D"margin-left:15px"><a href=3D=
"https://www.worldtimebuddy.com/?qm=3D1&amp;lid=3D5368361,2988507,5128581,2=
643743,100,1850147,6&amp;h=3D2988507&amp;date=3D2026-3-5&amp;sln=3D17-18&am=
p;hf=3Dundefined&amp;c=3D1189" target=3D"_blank">Find your local timezone h=
ere</a></li><li style=3D"margin-left:15px">Link to Join the Call:=C2=A0<a h=
ref=3D"https://meet.jit.si/XenProjectCommunityCall" target=3D"_blank">https=
://meet.jit.si/XenProjectCommunityCall</a></li></ul><br></div><div>We plan =
to open the meeting room at 16:00 UTC, but to allow time for switching betw=
een meetings and handling any technical issues, we=E2=80=99ll officially st=
art discussing the agenda at 16:05 UTC.<br><br>Want to be CC=E2=80=99d on f=
uture calls?<br><br>Add or remove yourself from our=C2=A0<a href=3D"https:/=
/cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/" target=3D"_blank">=
Sign-up Sheet</a>.<br><br>See you today!</div></div><div><br></div><div><di=
v dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">=
<div dir=3D"ltr"><img src=3D"https://ci3.googleusercontent.com/mail-sig/AIo=
rK4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36JrwBCQtitBSW_0NeDS6mBmJ2F4vZVE2oBOqnY6Ia=
JUrl12"><br><div>Cody Zuschlag</div><div>Xen Project - Community Manager</d=
iv></div></div></div></div>

--00000000000079bc3b064c455f85--

