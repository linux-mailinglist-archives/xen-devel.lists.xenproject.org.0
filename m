Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB0rBxgkD2rPGAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:26:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A655A849E
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:26:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315394.1585206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5Hh-0005jC-Gr; Thu, 21 May 2026 15:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315394.1585206; Thu, 21 May 2026 15:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5Hh-0005gv-E7; Thu, 21 May 2026 15:26:05 +0000
Received: by outflank-mailman (input) for mailman id 1315394;
 Thu, 21 May 2026 15:26:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1wQ5Hg-0005gp-S8
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:26:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1wQ5Hg-00GbV1-2d
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:26:04 +0000
Received: from mail-lj1-f182.google.com ([209.85.208.182])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1wQ5Hg-00H2WN-2F
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:26:04 +0000
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-393a49d2e5eso56671591fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 08:26:04 -0700 (PDT)
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
	From:MIME-Version; bh=B/dOMcUo+NynDZJBMEP2plK9/7TWgEZLokNt1WPfFwg=; b=FijcW0n
	gdU4Cyv7/9lVghVcm5TF29cIv9OXpfp/KgCdf6IL6ZkcCjDHJ7SM5V/WjFngGlQ3H7KUMbfqkzoA6
	nJyaoh0gXkaHGIT6+Bvoy6nFhGZdTOhpBiBsVcXLGo4pqUQCQeA5VkUCul0bQJ5UxMg6ZLcwMRIig
	uwNKsUeTWA=;
X-Gm-Message-State: AOJu0YyYTuufyDdqAnlPqNJ64+9iGDdD6zGrftGkcHwc9yV9S8OZXg1F
	o+HAhhhCuktj2PLm9fwxx7qJQ3GCKuhz2QmQ+moyT0Xz6t0RzNlFu3YEUHBDsPaPlWFUiucOO/x
	c2OeouXiSeG5FNI2jFjp5VkDMy5wsips=
X-Received: by 2002:a2e:bcc4:0:b0:38e:9277:6990 with SMTP id
 38308e7fff4ca-395ca6e11admr13909501fa.30.1779377163604; Thu, 21 May 2026
 08:26:03 -0700 (PDT)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Thu, 21 May 2026 17:25:52 +0200
X-Gmail-Original-Message-ID: <CAJbE=KzArS2AFm4rvb75=35Eyin2NOreh8H0bGcxCxZgwWWNBA@mail.gmail.com>
X-Gm-Features: AVHnY4Ja9BPvrkTRP9WIlaWGceJ2-z25aQVdd_bhaQ6K8kc1j9JSUDJ7--uNFdY
Message-ID: <CAJbE=KzArS2AFm4rvb75=35Eyin2NOreh8H0bGcxCxZgwWWNBA@mail.gmail.com>
Subject: [DISCUSSION] AI-assisted patch attribution guidance
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000c218440652558789"
X-Spamd-Result: default: False [-0.19 / 15.00];
	URI_COUNT_ODD(1.00)[9];
	DMARC_POLICY_ALLOW(-0.50)[xenproject.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[xenproject.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:url,xenproject.org:dkim,mail.gmail.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C2A655A849E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--000000000000c218440652558789
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

During this week's committers call, there was a request to seek broader
consensus among committers and maintainers before merging the proposed
Assisted-by: documentation patch.

The proposal is intentionally lightweight and focuses on:
- optional disclosure of AI-assisted tooling usage
- preserving contributor responsibility
- clarifying that AI tools cannot certify the DCO / Signed-off-by:

The current patch is inspired by similar Linux kernel guidance:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/process/coding-assistants.rst

Patch thread:
https://lists.xenproject.org/archives/html/xen-devel/2026-05/msg00993.html

At this stage, I=E2=80=99d mainly like to gather feedback on:
- whether Xen wants to document an Assisted-by: tag
- whether the proposed scope/wording feels appropriate
- whether there are concerns with the general direction

There was also discussion during the call about ensuring the Advisory Board
has an opportunity to raise any concerns before merging.

Thanks!


Cody Zuschlag
Xen Project - Community Manager

--000000000000c218440652558789
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,<br><br>During this week&#39;s committers call=
, there was a request to seek broader consensus among committers and mainta=
iners before merging the proposed Assisted-by: documentation patch.<br><br>=
The proposal is intentionally lightweight and focuses on:<br>- optional dis=
closure of AI-assisted tooling usage<br>- preserving contributor responsibi=
lity<br>- clarifying that AI tools cannot certify the DCO / Signed-off-by:<=
br><br>The current patch is inspired by similar Linux kernel guidance:<br><=
a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/Documentation/process/coding-assistants.rst">https://git.kernel.org/=
pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/codi=
ng-assistants.rst</a><br><br>Patch thread:<br><a href=3D"https://lists.xenp=
roject.org/archives/html/xen-devel/2026-05/msg00993.html">https://lists.xen=
project.org/archives/html/xen-devel/2026-05/msg00993.html</a><br><br>At thi=
s stage, I=E2=80=99d mainly like to gather feedback on:<br>- whether Xen wa=
nts to document an Assisted-by: tag<br>- whether the proposed scope/wording=
 feels appropriate<br>- whether there are concerns with the general directi=
on<br><br>There was also discussion during the call about ensuring the Advi=
sory Board has an opportunity to raise any concerns before merging.<br><br>=
Thanks!<br><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-s=
martmail=3D"gmail_signature"><div dir=3D"ltr"><img src=3D"https://ci3.googl=
eusercontent.com/mail-sig/AIorK4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36JrwBCQtitBS=
W_0NeDS6mBmJ2F4vZVE2oBOqnY6IaJUrl12"><br><div>Cody Zuschlag</div><div>Xen P=
roject - Community Manager</div></div></div></div></div>

--000000000000c218440652558789--

