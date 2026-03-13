Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK3fCkXBs2mEagAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:48:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE9527EF57
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:48:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253346.1549616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xFU-0003VF-LY; Fri, 13 Mar 2026 07:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253346.1549616; Fri, 13 Mar 2026 07:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xFU-0003TM-Ij; Fri, 13 Mar 2026 07:47:56 +0000
Received: by outflank-mailman (input) for mailman id 1253346;
 Fri, 13 Mar 2026 07:47:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CqhT=BN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0xFT-0003TG-T3
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 07:47:55 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f17c9c2c-1eb0-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 08:47:54 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 862AD4E3F0;
 Fri, 13 Mar 2026 07:47:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4581A403F6;
 Fri, 13 Mar 2026 07:47:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id b3ACDynBs2mfGAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 13 Mar 2026 07:47:53 +0000
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
X-Inumbo-ID: f17c9c2c-1eb0-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773388073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vM0JxtxepxxjPoRZ8g1TfJI80befLzmI/O84xGr4URQ=;
	b=lDrWQ3b1XwPjnOiJAxy7BrEOi9hnp6YZcpOBTrvn+GWTGlqJidgrMP9hZQ1DAxobOqWqpy
	GkFItCjcS3O7PzpV4jA0E2NRaY+gJAkis5WEfGncceZhNbRkdmBEMjLUZQPZXZo2HTGHVc
	HnzGcj/TAWXf1pllfjxY4FyskrRff94=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773388073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vM0JxtxepxxjPoRZ8g1TfJI80befLzmI/O84xGr4URQ=;
	b=lDrWQ3b1XwPjnOiJAxy7BrEOi9hnp6YZcpOBTrvn+GWTGlqJidgrMP9hZQ1DAxobOqWqpy
	GkFItCjcS3O7PzpV4jA0E2NRaY+gJAkis5WEfGncceZhNbRkdmBEMjLUZQPZXZo2HTGHVc
	HnzGcj/TAWXf1pllfjxY4FyskrRff94=
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
Subject: [PATCH 0/8] tools/xenstored: add support for watch depth feature
Date: Fri, 13 Mar 2026 08:47:43 +0100
Message-ID: <20260313074751.2904215-1-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: CAE9527EF57
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

This series has been tested with a modified xenstore-watch client.
The modification will be sent as soon as the pending series of the
xs-clients has been applied.

Note that the watch depth series depends on the still pending series
"tools: add support for per-domain xenstore quota".

Juergen Gross (8):
  tools/xenstored: allow domU to get own features
  docs: clarify Xenstore watch depth feature
  tools/libs/store: add support to use watches with a depth parameter
  tools/xenstored: add depth information to watches
  tools/xenstored: add depth handling to XS_WATCH
  tools/xenstored: replace the fire_watches() exact parameter
  tools/xenstored: expand special watch handling with depth feature
  tools/xenstored: make XENSTORE_SERVER_FEATURE_WATCHDEPTH available

 docs/man/xl.cfg.5.pod.in         |   6 ++
 docs/misc/xenstore.txt           |  14 ++-
 tools/include/xenstore.h         |  16 +++
 tools/libs/store/libxenstore.map |   2 +
 tools/libs/store/xs.c            | 116 ++++++++++++++++++----
 tools/xenstored/core.c           |  15 ++-
 tools/xenstored/domain.c         |  64 +++++++++---
 tools/xenstored/domain.h         |   2 +
 tools/xenstored/lu.c             |   3 +
 tools/xenstored/transaction.c    |  14 +--
 tools/xenstored/transaction.h    |   4 +-
 tools/xenstored/watch.c          | 161 ++++++++++++++++++++++---------
 tools/xenstored/watch.h          |  10 +-
 xen/include/public/io/xs_wire.h  |   2 +
 14 files changed, 328 insertions(+), 101 deletions(-)

-- 
2.53.0


