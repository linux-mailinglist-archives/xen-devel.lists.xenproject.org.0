Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIsMBGr08WmElwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 14:07:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97361493DC9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 14:07:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297273.1573350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI3gX-0006UW-KL; Wed, 29 Apr 2026 12:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297273.1573350; Wed, 29 Apr 2026 12:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI3gX-0006Rd-Hg; Wed, 29 Apr 2026 12:06:33 +0000
Received: by outflank-mailman (input) for mailman id 1297273;
 Wed, 29 Apr 2026 12:06:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wI3gV-0006RX-DV
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 12:06:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI3gU-00FgZi-Py
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 14:06:30 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69f1f444-5cb7-0a2a0a5109dd-0a2a4503d97c-12
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 14:06:30 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69f1f446-672d-0a2a45030019-c387df838856-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 14:06:30 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CF08C5BD5F;
 Wed, 29 Apr 2026 12:06:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 94F26593B0;
 Wed, 29 Apr 2026 12:06:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1sI2Iz308Wk6VQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 29 Apr 2026 12:06:21 +0000
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
	t=1777464386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wbjluDVZotZt60L9F+RyvmJUG+lseQlcgdHyfdTEa3g=;
	b=VeGvPzIkKRE75NI8Ur7ooVJ618bEDtu+MaEvc7uEL/8HaDzpNXVKFAh3NnI9a4vgn2ctUX
	k730HN0WxLwrWUlsHwcShi3J++vB9aNyUk6XzPyn5NQr1Af9hQwqZcNVAqOoovrgx88ZUH
	RvhHXxFJFOX116yDBLEQ5NndFsS5gYs=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1777464381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wbjluDVZotZt60L9F+RyvmJUG+lseQlcgdHyfdTEa3g=;
	b=BLEcjP1eFCX1oX1o9NAHfJsOF4pLKWp+J148YMsmJ95qQv3fJ84J7Y6Vv/oIUnGRjukUQ0
	z+q5a3WMRUEbw5IbxYaPhkR0V+F+FpqVdmRSd1JX9z1GEYTgIIP1v9B9VcZoSFIXVA8FF3
	sRQ+zQLe7X8seeVWSuViYE85JnGdoxk=
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
Subject: [PATCH v2 0/4] tools/xenstore: fix issue related to XSA-417
Date: Wed, 29 Apr 2026 14:06:15 +0200
Message-ID: <20260429120619.1013440-1-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-purgate-ID: tlsNG-33051d/1777464390-A197D938-9D91CD56/0/0
X-purgate-type: clean
X-purgate-size: 2909
X-Rspamd-Queue-Id: 97361493DC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.966];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[11]

There is one corner case of XSA-417 which wasn't handled completely
with the patches back then.

The XSA-417 fixes tried to solve the problem, that a new domU would
inherit access permissions to access Xenstore entries with that domid
listed in the access rights. In order not to make it easy for a domU
to query existence of a domid, adding permission for a non-existing
domain is not rejected by Xenstore. The XSA-417 patches solved that
problem by adding a flag to a permission entry referencing a not
existing domain, indicating that the permission should not be
effective for Xenstore.

One corner case was not handled:

Consider guest 1 and guest 2 running. Guest 1 adds guest 2 to be able
to access a Xenstore entry. Now guest 2 is removed from the system and
a new guest 3 with the same domid as guest 2 had is being created.

When guest 3 would try now to access the Xenstore entry, it would fail,
as Xenstore would see that the Xenstore entry is older than guest 3.

But if guest 1 is modifying the permissions of the Xenstore entry
again, e.g. by adding another domain, the permission entry for guest 2
would lose its "special flag", resulting in guest 3 now really gaining
access to the Xenstore entry.

This series is fixing this problem by the following means:

- In order to allow guests to know that a Xenstore entry permission
  might have gone stale, allow unprivileged guests to receive
  @releaseDomain watch events. This doesn't open a security hole, as
  the only knowledge which can by gathered from that change is that a
  domain is gone, not that a domain with a specific domid is existing.

- When a domain is removed, remove all permissions relating to this
  domain from all Xenstore entries.

Note that this issue was discussed by the Xen security team and we
decided not to issue an XSA, as there are no known use cases where one
unprivileged guest would grant access to its Xenstore nodes to more
than one other unprivileged guests.

We decided to delay this patch series until the watch depth feature has
been committed, as with that feature available it is now possible for
a guest to handle the death of a specific domain in a sane way.

Changes in V2:
- some minor comments addressed

Denis Mukhin (1):
  xen/public: introduce DOMID_ANY

Juergen Gross (3):
  tools/xenstored: add support for "all domains" node permission
  tools/xenstored: allow @releaseDomain watch for all domains
  tools/xenstored: remove permissions related to dead domain

 docs/man/xl.cfg.5.pod.in        |  4 ++
 tools/xenstored/core.c          | 45 ++++++++++++++-----
 tools/xenstored/domain.c        | 78 +++++++++++++++++++++------------
 tools/xenstored/domain.h        |  3 +-
 xen/include/public/io/xs_wire.h |  2 +
 xen/include/public/xen.h        |  7 +++
 6 files changed, 100 insertions(+), 39 deletions(-)

-- 
2.53.0


