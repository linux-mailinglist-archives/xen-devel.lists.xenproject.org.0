Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAqyBBtrnWnhPwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:10:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65711844BF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:10:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239566.1540966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoR3-0005NY-S8; Tue, 24 Feb 2026 09:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239566.1540966; Tue, 24 Feb 2026 09:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoR3-0005Kr-PE; Tue, 24 Feb 2026 09:10:29 +0000
Received: by outflank-mailman (input) for mailman id 1239566;
 Tue, 24 Feb 2026 09:10:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+kWt=A4=linux-mail.net=dt@srs-se1.protection.inumbo.net>)
 id 1vuoR1-0005Kh-OF
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 09:10:28 +0000
Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch
 [79.135.106.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7c1dbb0-1160-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 10:10:25 +0100 (CET)
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
X-Inumbo-ID: a7c1dbb0-1160-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux-mail.net;
	s=protonmail; t=1771924224; x=1772183424;
	bh=hmCCodP6ILfYzHeYMGfQMZKpk8QNNXkJ2el02ynxmoM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AJpR02z1d2PZ4TCePIIGRi2UT49zeAl64Y2dAKhdPdj8pSy0gJY/TT1JJ6f2257w8
	 0/D2A/DrT3VC3FRG1KGIvckWP3766Ar92vEzfNJVhDx47itBAvkxqQEf7JQ8sYwP6N
	 2H8BbxR9cSHPkxE2bEE4uEGswusGJwsDUK0wCiWbs4cMaPxMJZFHCRKEvyMPm4UCGs
	 EDjA5VNj/wQXyxCvt+YiazdjUZ/22a/4nQ7XdPnzt+LXaBWMArajIa/FFVGqaHo+LR
	 mSxtgvbtsO9FPcBg3VqVlRwllfMI97Uoapo7Vygdg71zWDyx11zmwwFhoe3TpMAzvb
	 BUHP72VsVrd/w==
Date: Tue, 24 Feb 2026 09:10:19 +0000
To: Jan Beulich <jbeulich@suse.com>
From: "David Thomson (dt@linux.com)" <dt@linux-mail.net>
Cc: boris.ostrovsky@oracle.com, sstabellini@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, jgross@suse.com
Subject: Re: [PATCH] xen/acpi-processor: fix _CST detection using undersized evaluation buffer
Message-ID: <FvW05oEjY785ua6lBtiEat0hzzY8RM9BeRC-RTwpIQ8QYO7lMvYmJ78U8C0S0vT_TRg4YX4-TzoGEsDvqwUVeX9w89FR47MYWR1oxpFJCBo=@linux-mail.net>
In-Reply-To: <e983d7a2-2c8a-46d4-8112-0d2f2045c93f@suse.com>
References: <20260223195602.17122-1-dt@linux-mail.net> <e983d7a2-2c8a-46d4-8112-0d2f2045c93f@suse.com>
Feedback-ID: 176297775:user:proton
X-Pm-Message-ID: 87b72af72c34525a5deec4dee2366d398fa1be24
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linux-mail.net,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[linux-mail.net:s=protonmail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:boris.ostrovsky@oracle.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dt@linux-mail.net,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dt@linux-mail.net,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[linux-mail.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-mail.net:mid,linux-mail.net:dkim]
X-Rspamd-Queue-Id: A65711844BF
X-Rspamd-Action: no action

> I understand you reflect original behavior in this regard, but why involv=
e any
> ACPI function here at all when pblk is non-zero? I.e. why not swap the op=
erands
> of && ? Object evaluation could have wanted side effects (in which case,
> however, some different change would be needed here), but checking for me=
thod
> presence surely hasn't.
>=20
> Jan
>=20
You're right on both counts. The original evaluate_object() call at least h=
ad the appearance of wanting the result (even though buf was undersized and=
 the result was never used). A pure presence check has no such pretense. Sw=
apping the operands is the obvious improvement. I think dropping the _CST c=
heck entirely is also defensible since C-state support is confirmed when pb=
lk is set. But I'm not certain there's no edge case where pblk is non-zero =
and _CST is also not present, so I'd defer to your judgement.

Would you prefer:
a) if (pblk && acpi_has_method(handle, "_CST"))
b) just if (pblk)

Happy to send a v2 either way.

DT

