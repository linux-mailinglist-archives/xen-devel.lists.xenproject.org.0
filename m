Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CyJKh7hnGnCLwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 00:22:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A7B17F38A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 00:22:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239385.1540800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vufEe-0002Xb-6K; Mon, 23 Feb 2026 23:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239385.1540800; Mon, 23 Feb 2026 23:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vufEe-0002UY-2j; Mon, 23 Feb 2026 23:21:04 +0000
Received: by outflank-mailman (input) for mailman id 1239385;
 Mon, 23 Feb 2026 23:21:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9i6L=A3=linux-mail.net=dt@srs-se1.protection.inumbo.net>)
 id 1vufEc-0002US-0C
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 23:21:02 +0000
Received: from mail-106116.protonmail.ch (mail-106116.protonmail.ch
 [79.135.106.116]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e7663a1-110e-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 00:20:57 +0100 (CET)
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
X-Inumbo-ID: 4e7663a1-110e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux-mail.net;
	s=protonmail; t=1771888855; x=1772148055;
	bh=zZ6o690imIyQK5YKLNY2mgRufwrVGddSMQy0XRCV9pE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IbFxcHeFf++gjrGsoyN/jsH0tyk5Q5uJZ8fDuAHYLGTvfxX/cqaQBimWeYBmAS3ff
	 h1Y2YMZ/4SoKCYvqhkDfWZVUzExLrCvvbZskUhIdRPj11qSu8Uj9L5lVcb7nOBp051
	 x5SIaKY/7aRAQxZaGbImG4j4XA9fGUEstmNpmYCG0y8LAFelBswvGUt62H2taKumV+
	 aQ1jVOtZmGdYSpLxqeGwoxYK1Y9QVPzm/YfuG8cqZ4q7/qL73q1/Tg3EJK8qW9bnLz
	 iVfOknEXXm3geJt5kETdimcG80lbVA5QYghtDl9nwat4HY0cTp5YJJ9TVQ34ueBpLO
	 d6W1tQI+ABl8Q==
Date: Mon, 23 Feb 2026 23:20:49 +0000
To: Elliott Mitchell <ehem+xen@m5p.com>
From: "David Thomson (dt@linux.com)" <dt@linux-mail.net>
Cc: "jgross@suse.com" <jgross@suse.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] xen/acpi-processor: fix _CST detection using undersized evaluation buffer
Message-ID: <Gq4_Jcq53jjUk5tvLe3lydIKvn05aKmNjEN1dMVF-AWNNWMDR-xdYGLuLT_wcmOw8FAXV-ZCByuC1BDjJXMiAyKTX-P9w2bjsTvTLhxMbD8=@linux-mail.net>
In-Reply-To: <aZzAYEo0S3pP4HUG@mattapan.m5p.com>
References: <20260223195602.17122-1-dt@linux-mail.net> <aZzAYEo0S3pP4HUG@mattapan.m5p.com>
Feedback-ID: 176297775:user:proton
X-Pm-Message-ID: 5e1005990ce03e26f257d4135ee4089fd8b48255
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux-mail.net,quarantine];
	R_DKIM_ALLOW(-0.20)[linux-mail.net:s=protonmail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ehem+xen@m5p.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:ehem@m5p.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[linux-mail.net:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER(0.00)[dt@linux-mail.net,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dt@linux-mail.net,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel,xen];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 51A7B17F38A
X-Rspamd-Action: no action

> I had reported this a while ago.  My workaround had been to allow
> domain 0 to have maximum vCPUs, then offline most of them.  Very
> suboptimal, but did drop power use/heat generation.
>=20
> My next testing opportunity is likely to be in anywhere from 1 week to
> 2 months.  I'll be testing then, though the patch may already have gotten
> in.
Thanks for confirming. Your max-vCPUs workaround makes sense and forces Pha=
se 1 to cover all PCPUs. Let me know how testing goes.

DT

