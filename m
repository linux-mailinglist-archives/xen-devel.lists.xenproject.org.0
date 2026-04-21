Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNt1Kncq52mo4wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:42:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6A4437C6D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:42:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288418.1568694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5kP-0002uq-Ad; Tue, 21 Apr 2026 07:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288418.1568694; Tue, 21 Apr 2026 07:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5kP-0002rk-76; Tue, 21 Apr 2026 07:42:17 +0000
Received: by outflank-mailman (input) for mailman id 1288418;
 Tue, 21 Apr 2026 07:42:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wF5kN-0002qs-OV
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 07:42:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF5kN-00G0Vt-4x
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:42:15 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e72a54-5cb7-0a2a0a5109dd-0a2a4505d38e-18
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:42:15 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e72a56-aaa8-0a2a45050019-c387df82dd06-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:42:14 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CD6526A7F5;
 Tue, 21 Apr 2026 07:42:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 91752593AF;
 Tue, 21 Apr 2026 07:42:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CTnhIVUq52n0NQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 21 Apr 2026 07:42:13 +0000
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
	t=1776757334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GiCl29ziqUuQLuJlMeZlJuHJz+kWks534SS9M1I17Ug=;
	b=Hz1QnGSfVZNt1eIuMY9LSbhvALsPzAAEqb24kuFoEf7N8HdzwPp01dHX1f4LTSxhhEphZn
	k8GJLiT/7Fq8IVvl8oQbdlC17I7L26lhf0edYr111rNhpvwwmEaCyyApWt3N7s1NK9lgAw
	10uVggoGl6l9Gei2zIU2HzEJijFqUNw=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Q3MqWZsL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776757333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GiCl29ziqUuQLuJlMeZlJuHJz+kWks534SS9M1I17Ug=;
	b=Q3MqWZsLsRb7dca3DyjcT7VPodi5wfSDUExbq4IX06CKABSf5G+xrLnivGlyjqVk0osqKt
	ecmPtLsQwsVk02f/NLIxoysdU+DloaA7bZJjvbTOOMNQAqkTqNwcfjcP7wKDq1hX9QV4JQ
	2VMYMAL+VXNk7O8WTJRbl0uq+zYp3x0=
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
Subject: [PATCH v2 0/9] tools/xenstored: add support for watch depth feature
Date: Tue, 21 Apr 2026 09:42:02 +0200
Message-ID: <20260421074211.308473-1-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-purgate-ID: tlsNG-c201ff/1776757334-2BD67443-C6CE8F72/0/0
X-purgate-type: clean
X-purgate-size: 2338
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 5F6A4437C6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In order to reduce excessive number of watch events the watch depth
feature has been defined, allowing the user to limit the number of
node levels below the watched node to cause events.

This series is implementing this feature for xenstored (including the
PV and PVH stubdom variants).

Possible users are:

- xl/libxl: use domid information for the special @introduceDomain and
  @releaseDomain watches, which will be available when using depth = 1

- xenconsoled, like xl/libxl

- any PV-device backends watching directories for added devices (no
  watch events when any device specific node is modified)

- any PV-device frontend and backend watching the "state" node of the
  other side, in case the other side plays dirty games by building
  large sub-trees beneath the "state" node

Changes in V2:
- some minor stale changes reverted
- last patch covered by the series now, man page updated

Juergen Gross (9):
  tools/xenstored: allow domU to get own features
  docs: clarify Xenstore watch depth feature
  tools/libs/store: add support to use watches with a depth parameter
  tools/xenstored: add depth information to watches
  tools/xenstored: add depth handling to XS_WATCH
  tools/xenstored: replace the fire_watches() exact parameter
  tools/xenstored: expand special watch handling with depth feature
  tools/xenstored: make XENSTORE_SERVER_FEATURE_WATCHDEPTH available
  tools/xs-clients: support depth with xenstore-watch

 docs/man/xenstore-watch.1.pod      |   9 ++
 docs/man/xl.cfg.5.pod.in           |   6 ++
 docs/misc/xenstore.txt             |  14 ++-
 tools/include/xenstore.h           |  16 +++
 tools/libs/store/libxenstore.map   |   2 +
 tools/libs/store/xs.c              | 102 +++++++++++++++---
 tools/xenstored/core.c             |  15 ++-
 tools/xenstored/domain.c           |  61 ++++++++---
 tools/xenstored/domain.h           |   2 +
 tools/xenstored/lu.c               |   3 +
 tools/xenstored/transaction.c      |  14 +--
 tools/xenstored/transaction.h      |   4 +-
 tools/xenstored/watch.c            | 161 ++++++++++++++++++++---------
 tools/xenstored/watch.h            |  10 +-
 tools/xs-clients/xenstore_client.c |  19 +++-
 xen/include/public/io/xs_wire.h    |   2 +
 16 files changed, 343 insertions(+), 97 deletions(-)

-- 
2.53.0


