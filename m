Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r9LcNYy4R2qHeAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 15:26:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71344702D73
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 15:26:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=apertussolutions.com header.s=zoho header.b=uzD2s04W;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1353374.1609319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfduL-0006tf-4X; Fri, 03 Jul 2026 13:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353374.1609319; Fri, 03 Jul 2026 13:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfduL-0006rh-1T; Fri, 03 Jul 2026 13:26:17 +0000
Received: by outflank-mailman (input) for mailman id 1353374;
 Fri, 03 Jul 2026 13:26:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wfduJ-0006rb-MA
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 13:26:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfduJ-009BZo-2o
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 15:26:15 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a47b874-e002-0a2a0a5209dd-0a2a450acab4-2
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 15:26:14 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a47b874-e40e-0a2a450a0019-888fbc3352ad-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 15:26:14 +0200
Received: by mx.zohomail.com with SMTPS id 1783085163546356.15735760972905;
 Fri, 3 Jul 2026 06:26:03 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1783085165; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QDkFvulDrMEXanFNnGDyt5B2JOroMiaGAB9msIxYQ0RnI4d1zDTa8LDuq8Cye3IJgABvQCWw20ZfLYL98aG3YEm6K8gQpZmmvxSPn+FRJteR9QMat0QAtnCjRzoPQiB9u9mUsfcWMa2i2MQbjy6IBkgcEb+wNY5cqvwPCupvP1s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783085165; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ig8ANEKwi0TjwdlfQpJ6o8aEeNdrbGbOiuwMXYgrS2U=; 
	b=ESNqU2tILqAVYfuBgw7flcegEB4mBb3irmu+NBzlw8ZdsBpeDiPOrKlyNszl9WUuaJk+JTOdhzZbjJdI5lntT8Os9Ht9Bx9l5nrhSbU4VjwmTmcnS5CAVfYF9gqVm+l7SS4ZymA2Z513/Zs7WhcTMBWglv+dX1ih9fwBzk/KVYQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783085165;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ig8ANEKwi0TjwdlfQpJ6o8aEeNdrbGbOiuwMXYgrS2U=;
	b=uzD2s04WQqKV9AJIiueHwXOAScOqTq/yzbQTZmcANYurMm4O/i+83Wo85gujck4A
	EOFfSDCW+KabYJiz0IXrgNcT7OndIiqB68y9LpcFhJHSvIFOgcN6dbUMzVGoXTAvfOJ
	vR6Msy+zNqX1qawiFt6OP3sSMRzpf1I+1SnUt3VQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] maintiners: promote to argo maintainer
Date: Fri,  3 Jul 2026 09:18:55 -0400
Message-Id: <20260703131855.3256-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-4011c0/1783085174-3E20DDDE-F7003CE2/0/0
X-purgate-type: clean
X-purgate-size: 774
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[apertussolutions.com];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,apertussolutions.com:from_mime,apertussolutions.com:email,apertussolutions.com:mid,apertussolutions.com:dkim];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71344702D73

I have been involved with Argo since its inception and a reviewer for some
time. As Argo is a critical part of the solution I maintain, I am stepping up
to help oversee its ongoing maintenance.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81bd0dfeec30..e42afe70fc10 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -242,7 +242,7 @@ F:	xen/arch/x86/include/asm/hvm/svm/
 
 ARGO
 M:	Christopher Clark <christopher.w.clark@gmail.com>
-R:	Daniel P. Smith <dpsmith@apertussolutions.com>
+M:	Daniel P. Smith <dpsmith@apertussolutions.com>
 S:	Maintained
 F:	xen/include/public/argo.h
 F:	xen/include/xen/argo.h
-- 
2.39.5


