Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLjCJNyo+WnF+gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 10:22:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BD34C899C
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 10:22:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300312.1574835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKB34-00089w-51; Tue, 05 May 2026 08:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300312.1574835; Tue, 05 May 2026 08:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKB34-000878-1i; Tue, 05 May 2026 08:22:34 +0000
Received: by outflank-mailman (input) for mailman id 1300312;
 Tue, 05 May 2026 08:22:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tip-bot2@linutronix.de>) id 1wKB32-000872-2P
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 08:22:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKB31-00Bd9G-9s
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:22:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tip-bot2@linutronix.de>)
 id 69f9a8c1-2eae-0a2a0a5409dd-0a2a4508a534-16
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 10:22:31 +0200
Received: from [193.142.43.55] (helo=galois.linutronix.de)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <tip-bot2@linutronix.de>)
 id 69f9a8c6-63b5-0a2a45080019-c18e2b379026-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 10:22:30 +0200
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=2020 header.d=linutronix.de header.i="@linutronix.de" header.h="From:Sender:Reply-to:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"; dkim=permerror header.s=2020e header.d=linutronix.de header.i="@linutronix.de"
Date: Tue, 05 May 2026 08:22:28 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777969350;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NfJ1YduhltV+uaN4L6tWu1N+7FQbIUL59Zqc4X2ZkGQ=;
	b=BLC5MlbLbTtsTdDUzIrgvGle47013JfO2P/gEVbfxVRGNqTkmkoWfpuFBPyo8A2zvRwx3V
	pemz6g+A+NPc5JyB1R8Bjwqi6yzFBzlJHw84q5SxCgDxKOjZIfJSQbcIQct+T6VyvElDww
	HHlPE6rIYYWt8VzlQNE8unryG5ndPjS0HOivgYPoJq/fK4UdIsAcNPJ5NdQvx8l74M2Lxv
	KOWINWXnEYKVQSJtb7ytgRyZdIK+mB2t6SfsOanNI0UErzijCu1/1s/+DH2EOPJ25AnbS4
	AfRCnZXsR0Myknv/jI3vs5u5CG1I8o5KF8I63OcWtFnbiX48GuTdaCpmNu9vlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777969350;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NfJ1YduhltV+uaN4L6tWu1N+7FQbIUL59Zqc4X2ZkGQ=;
	b=S/w43rLBt5Tlyfy2AJR2F2D4w9Nnj9xNeQTvWXi6LzsE3IlB0iWK0QJRapaesXJcLpCvzi
	HeHF3ogJfKcy7ZBA==
From: "tip-bot2 for Juergen Gross" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] x86/xen: Fix a potential problem in
 xen_e820_resolve_conflicts()
Cc: Juergen Gross <jgross@suse.com>, Ingo Molnar <mingo@kernel.org>,
 xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260505080653.197775-1-jgross@suse.com>
References: <20260505080653.197775-1-jgross@suse.com>
MIME-Version: 1.0
Message-ID: <177796934897.424702.11107616066849971102.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1777969351-C2975DB1-57E2DF78/0/0
X-purgate-type: clean
X-purgate-size: 1961
X-Rspamd-Queue-Id: 48BD34C899C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-tip-commits@vger.kernel.org,m:jgross@suse.com,m:mingo@kernel.org,m:xen-devel@lists.xenproject.org,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tip-bot2@linutronix.de,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[linux-kernel@vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tip-bot2@linutronix.de,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     5f8719945244dd65b5fa06195f4600db62581610
Gitweb:        https://git.kernel.org/tip/5f8719945244dd65b5fa06195f4600db625=
81610
Author:        Juergen Gross <jgross@suse.com>
AuthorDate:    Tue, 05 May 2026 10:06:53 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 05 May 2026 10:17:00 +02:00

x86/xen: Fix a potential problem in xen_e820_resolve_conflicts()

When fixing a conflict in xen_e820_resolve_conflicts(), the loop over
the E820 map entries needs to be restarted, as the E820 map will have
been modified by the fix. Otherwise entries might be skipped by
accident.

Fixes: be35d91c8880 ("xen: tolerate ACPI NVS memory overlapping with Xen allo=
cated memory")
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: xen-devel@lists.xenproject.org
Link: https://patch.msgid.link/20260505080653.197775-1-jgross@suse.com
---
 arch/x86/xen/setup.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index ac8021c..bb95a05 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -695,17 +695,22 @@ static void __init xen_e820_resolve_conflicts(phys_addr=
_t start,
 		return;
=20
 	end =3D start + size;
-	entry =3D xen_e820_table.entries;
+	mapcnt =3D 0;
=20
-	for (mapcnt =3D 0; mapcnt < xen_e820_table.nr_entries; mapcnt++) {
+	while (mapcnt < xen_e820_table.nr_entries) {
+		entry =3D xen_e820_table.entries + mapcnt;
 		if (entry->addr >=3D end)
 			return;
=20
 		if (entry->addr + entry->size > start &&
-		    entry->type =3D=3D E820_TYPE_NVS)
+		    entry->type =3D=3D E820_TYPE_NVS) {
 			xen_e820_swap_entry_with_ram(entry);
+			/* E820 map has been changed, restart loop! */
+			mapcnt =3D 0;
+			continue;
+		}
=20
-		entry++;
+		mapcnt++;
 	}
 }
=20

