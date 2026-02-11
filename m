Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKWRAIqzjGlLsQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 17:51:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B40112653C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 17:51:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227955.1534328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDQf-0000SJ-Vd; Wed, 11 Feb 2026 16:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227955.1534328; Wed, 11 Feb 2026 16:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDQf-0000Qk-SV; Wed, 11 Feb 2026 16:51:05 +0000
Received: by outflank-mailman (input) for mailman id 1227955;
 Wed, 11 Feb 2026 16:51:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vqDQe-0000Qe-Fx
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 16:51:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vqDQe-003YpK-1G
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 16:51:04 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vqDQd-003WfJ-2u
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 16:51:04 +0000
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-56739adfa1aso1468865e0c.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 08:51:04 -0800 (PST)
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
	d=xenproject.org; s=20200302mail; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:MIME-Version; bh=AN2WkJyjZxzrinD9uQ/yNy7nxYJlJXpKROwP0CR2fGU=; b=ln
	KBDt113XjtiF4R+S5lr8BTP2k9FJRm6F8YbQXX9Nu1v9DkR+6GO4qK99J0Ls7YBNZhQeudXFeP33+
	DiUqmVdWRh2bT6r3IpE+M+Tf2EU0R1nHVwEW9DgrFcW0c3EBZyiIyZV9w/qRRZr/Tj7CEl3YzamMa
	vyG0hq/pxfTQc+0=;
X-Gm-Message-State: AOJu0YyQtGKLcyuMJC4khCzc9uq770vDuVq9BsZlShjrLQAbQyV3UY+K
	b21xsrgibPiMeENLv/+P4BCUusdX2M/DNuu/LtUFvurDf+bTBRexotPkmtYaAniFKnzZOPzSw+b
	H5H5MhJ/d4VY12jL6MPtBA5ZstjX6LhI=
X-Received: by 2002:a05:6122:2c07:b0:567:4c2b:832 with SMTP id
 71dfb90a1353d-5674c2b0d9dmr646064e0c.7.1770828663746; Wed, 11 Feb 2026
 08:51:03 -0800 (PST)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Wed, 11 Feb 2026 17:50:52 +0100
X-Gmail-Original-Message-ID: <CAJbE=KwQft3ngvJVyqg2v7G-R99fsiYQZQUbajOWhXsQcDssuQ@mail.gmail.com>
X-Gm-Features: AZwV_QjGCrl7sIoiwcOqBUhfHs2Wjwqx--g4Yo2KguLhHsYJUxQuv_Gi25ihHW4
Message-ID: <CAJbE=KwQft3ngvJVyqg2v7G-R99fsiYQZQUbajOWhXsQcDssuQ@mail.gmail.com>
Subject: [ANNOUNCEMENT] Xen stable branch support extended to 5 years of
 security support
To: xen-devel@lists.xenproject.org
Cc: xen-announce@lists.xenprojet.org
Content-Type: multipart/alternative; boundary="00000000000075fb52064a8f2d53"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[xenproject.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xenproject.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:xen-announce@lists.xenprojet.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,xenproject.org:dkim];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[cody.zuschlag@xenproject.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[xenproject.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cody.zuschlag@xenproject.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7B40112653C
X-Rspamd-Action: no action

--00000000000075fb52064a8f2d53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Statement from the Xen Committers and Core Maintainers

TL;DR: All Xen releases will now have long-term support, with up to five
years of security support.

The Xen Committers and Core Maintainers have agreed to update the Xen
Project stable branch support policy to better align with common industry
expectations for long-term security maintenance.

Across open source infrastructure projects, a five-year security support
window is increasingly the norm, particularly in embedded and automotive
environments. Xen is already a strong fit in these domains, and clearer
long-term guarantees help downstreams plan with confidence.

Historically, Xen releases have received approximately 1.5 years of full
support, followed by security-only support up to 3 years total. With this
change, we are extending:

- Full support to 3 years
- Security support to 5 years total for each release

Effective immediately, the support policy is as follows:

Xen 4.20 and later
- 3 years of full support (bug fixes and security fixes)
- Followed by 2 years of security-only support
- For a total of 5 years of security support

Xen 4.17 to 4.19
- Security-only support up to a total of 5 years from original release
- No general bug-fix backports

This policy is being adopted as a baseline, and we will actively monitor
its impact on the stable and security maintenance effort. If experience
shows this model to be unsustainable or otherwise unworkable, the
Committers and Core Maintainers reserve the ability to revise the policy
with minimal disruption.

Because all Xen releases follow the same support timelines, we
intentionally avoid introducing LTS-branded branches. While the motivation
aligns with traditional LTS goals, using LTS terminology can imply that
only selected releases receive extended support. Our aim is consistent,
predictable security support across all releases.

This update strengthens Xen=E2=80=99s position in embedded and automotive u=
se
cases, while keeping the stable and security maintenance effort sustainable
and avoiding changes to release cadence.

The Xen Project website and documentation will be updated to reflect this
policy.
Cross-posted to xen-devel and xen-announce.

Very best regards,


Cody Zuschlag
Xen Project - Community Manager

--00000000000075fb52064a8f2d53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Statement from the Xen Committers and Core Maintainer=
s<br><br>TL;DR: All Xen releases will now have long-term support, with up t=
o five years of security support.<br><br>The Xen Committers and Core Mainta=
iners have agreed to update the Xen Project stable branch support policy to=
 better align with common industry expectations for long-term security main=
tenance.<br><br>Across open source infrastructure projects, a five-year sec=
urity support window is increasingly the norm, particularly in embedded and=
 automotive environments. Xen is already a strong fit in these domains, and=
 clearer long-term guarantees help downstreams plan with confidence.<br><br=
>Historically, Xen releases have received approximately 1.5 years of full s=
upport, followed by security-only support up to 3 years total. With this ch=
ange, we are extending:<br><br>- Full support to 3 years<br>- Security supp=
ort to 5 years total for each release<br><br>Effective immediately, the sup=
port policy is as follows:<br><br>Xen 4.20 and later<br>- 3 years of full s=
upport (bug fixes and security fixes)<br>- Followed by 2 years of security-=
only support<br>- For a total of 5 years of security support<br><br>Xen 4.1=
7 to 4.19<br>- Security-only support up to a total of 5 years from original=
 release<br>- No general bug-fix backports<br><br>This policy is being adop=
ted as a baseline, and we will actively monitor its impact on the stable an=
d security maintenance effort. If experience shows this model to be unsusta=
inable or otherwise unworkable, the Committers and Core Maintainers reserve=
 the ability to revise the policy with minimal disruption.<br><br>Because a=
ll Xen releases follow the same support timelines, we intentionally avoid i=
ntroducing LTS-branded branches. While the motivation aligns with tradition=
al LTS goals, using LTS terminology can imply that only selected releases r=
eceive extended support. Our aim is consistent, predictable security suppor=
t across all releases.<br><br>This update strengthens Xen=E2=80=99s positio=
n in embedded and automotive use cases, while keeping the stable and securi=
ty maintenance effort sustainable and avoiding changes to release cadence.<=
br><br>The Xen Project website and documentation will be updated to reflect=
 this policy.</div><div>Cross-posted to xen-devel and xen-announce.</div><d=
iv><br></div><div>Very best regards,</div><div><br></div><div><div dir=3D"l=
tr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><img src=3D"https://ci3.googleusercontent.com/mail-sig/AIorK4x5nkR=
DCOFJDJAv9aMXdZ0mghItsp3D36JrwBCQtitBSW_0NeDS6mBmJ2F4vZVE2oBOqnY6IaJUrl12">=
<br><div>Cody Zuschlag</div><div>Xen Project - Community Manager</div></div=
></div></div></div>

--00000000000075fb52064a8f2d53--

