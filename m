Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nBXnBLY+RWoe9QoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 18:22:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFB96EFB5E
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 18:22:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xenproject.org header.s=20200302mail header.b=3t3vfSSz;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1350242.1607765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wexgk-0001Qk-KV; Wed, 01 Jul 2026 16:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350242.1607765; Wed, 01 Jul 2026 16:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wexgk-0001O6-Hk; Wed, 01 Jul 2026 16:21:26 +0000
Received: by outflank-mailman (input) for mailman id 1350242;
 Wed, 01 Jul 2026 16:21:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1wexgj-0001Nz-IC
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 16:21:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1wexgi-002ATM-2p;
 Wed, 01 Jul 2026 16:21:24 +0000
Received: from [2a01:cb15:80c2:5100:ab28:926e:d542:4784] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1wexgi-004Str-0r;
 Wed, 01 Jul 2026 16:21:24 +0000
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From;
	bh=1G8TPQ9nlhomp1gZxwftFAjMBKP13Qts8muVskspAPk=; b=3t3vfSSzcJ3uaQy3gSX087FhJM
	0Ja44iWmuunYrVmkFzHpnOhfPx6EcnE7wUBv2/lmhG88Rahugenw8wUmTaEH49CXW0H8nqZtZYLKC
	Vt4psi5W8JZ6jBr39Nl6roVKS5XNztAnKFlrAWrTm1Cg6OmJKvpp1xj8B/u2RwWdxHhU=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] get_maintainer: Add maintainers based on keyword after removing THE REST
Date: Wed,  1 Jul 2026 18:20:22 +0200
Message-ID: <20260701162022.30265-1-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[xenproject.org,none];
	R_DKIM_ALLOW(-0.20)[xenproject.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[anthony@xenproject.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[xenproject.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email];
	FROM_NEQ_ENVFROM(0.00)[anthony@xenproject.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACFB96EFB5E

From: Anthony PERARD <anthony.perard@vates.tech>

There's some logic to avoid CC committers (THE REST section) when a
file is fully maintained by a list of maintainers. There's also some
logic to add maintainers if a patch or file contains some keywords.

We do add maintainers based on keyword to the list of $email_to before
checking if we can remove emails from THE REST. And at the time when
checking if we can drop THE REST, we've lost the information which
tell if the maintainers was added because of a keyword of because they
maintain the file.

Reorder the logic, add maintainers based on keywords only after
checking if we can drop THE REST.

For example, if we have a file covered by a sections with only
reviewers, but this file also contains the keyword "XSM", then:
    scripts/get_maintainer.pl -f $file
would suppress THE REST without this patch.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 scripts/get_maintainer.pl | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 533d0df72ac1..b788665c08b2 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -720,13 +720,6 @@ sub get_maintainers {
 	$suppress_the_rest = 0 if $file_maintained_by_the_rest;
     }
 
-    if ($keywords) {
-	@keyword_tvi = sort_and_uniq(@keyword_tvi);
-	foreach my $line (@keyword_tvi) {
-	    add_categories($line);
-	}
-    }
-
     if ($email_drop_the_rest_supporter_if_supporter_found &&
 	$suppress_the_rest && $#email_to > 0) {
         my @email_new;
@@ -748,6 +741,13 @@ sub get_maintainers {
             if $do_replace;
     }
 
+    if ($keywords) {
+	@keyword_tvi = sort_and_uniq(@keyword_tvi);
+	foreach my $line (@keyword_tvi) {
+	    add_categories($line);
+	}
+    }
+
     foreach my $email (@email_to, @list_to) {
 	$email->[0] = deduplicate_email($email->[0]);
     }
-- 
Anthony PERARD


