Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEykKOeexmnrMQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 16:14:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AAB346864
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 16:14:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265858.1556606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w68tO-0003Cg-Pf; Fri, 27 Mar 2026 15:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265858.1556606; Fri, 27 Mar 2026 15:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w68tO-00039d-Mm; Fri, 27 Mar 2026 15:14:34 +0000
Received: by outflank-mailman (input) for mailman id 1265858;
 Fri, 27 Mar 2026 15:14:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1w68tN-00039X-Qa
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 15:14:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w68tN-00Dlc6-55
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 16:14:33 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69c69ed3-5cb7-0a2a0a5109dd-0a2a4502bfca-16
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 16:14:32 +0100
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jgross@suse.com>)
 id 69c69ed8-63bb-0a2a45020019-c387df8282de-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 16:14:32 +0100
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8ED3C4D535;
 Fri, 27 Mar 2026 15:14:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BC6B4A0A2;
 Fri, 27 Mar 2026 15:14:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Z+5sEdiexmnSfwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 27 Mar 2026 15:14:32 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774624472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=u+v235gKbnonYGl0XF3mG3PKEgLDPwuoPDKs8Ee7J8g=;
	b=I85Dwcd964mb3UyD756jSW1cm3hsm6Pe6tO9r2czWu3rDTQR01eKJCod4NUyOpCiAPjqvx
	FqjEvB7b/O5BSn5FQBC79/OvuHaxqFAl4Q6Y+oc7CHotdStJIG+z4euUWmmzJsrZrdv8nN
	VoP7J9qPtv563dlFxFc14u3ALTjGOyA=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774624472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=u+v235gKbnonYGl0XF3mG3PKEgLDPwuoPDKs8Ee7J8g=;
	b=I85Dwcd964mb3UyD756jSW1cm3hsm6Pe6tO9r2czWu3rDTQR01eKJCod4NUyOpCiAPjqvx
	FqjEvB7b/O5BSn5FQBC79/OvuHaxqFAl4Q6Y+oc7CHotdStJIG+z4euUWmmzJsrZrdv8nN
	VoP7J9qPtv563dlFxFc14u3ALTjGOyA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] Config: update Mini-OS commit id
Date: Fri, 27 Mar 2026 16:14:29 +0100
Message-ID: <20260327151429.438096-1-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-purgate-ID: tlsNG-720697/1774624472-400A9DB8-F848DF38/0/0
X-purgate-type: clean
X-purgate-size: 725
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 53AAB346864
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the newest Mini-OS.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index fdc0245079..b3d48e49c7 100644
--- a/Config.mk
+++ b/Config.mk
@@ -217,7 +217,7 @@ QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
 QEMU_UPSTREAM_REVISION ?= master
 
 MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
-MINIOS_UPSTREAM_REVISION ?= 6732fd42d8eb8d0af9f5eb54aca17f4c250213a8
+MINIOS_UPSTREAM_REVISION ?= b6f79f5f44cf69044079c042b88fe9d75367642e
 
 SEABIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/seabios.git
 SEABIOS_UPSTREAM_REVISION ?= rel-1.17.0
-- 
2.53.0


