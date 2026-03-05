Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOUuI6GKqWki+gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:52:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B8F212C79
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:52:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246664.1545771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy97f-0008PP-CZ; Thu, 05 Mar 2026 13:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246664.1545771; Thu, 05 Mar 2026 13:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy97f-0008Mw-9Y; Thu, 05 Mar 2026 13:52:15 +0000
Received: by outflank-mailman (input) for mailman id 1246664;
 Thu, 05 Mar 2026 13:52:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y0Pc=BF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vy97c-0008Mq-W3
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 13:52:13 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 820ae696-189a-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 14:52:11 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6414C3F904;
 Thu,  5 Mar 2026 13:52:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A6DC3EA68;
 Thu,  5 Mar 2026 13:52:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id pHcFDYqKqWlKTgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 05 Mar 2026 13:52:10 +0000
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
X-Inumbo-ID: 820ae696-189a-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772718730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=x/tKo6sO/yEl7rIclC8Ou/RxLmCoSVX2S0UQLahfY5Y=;
	b=W8Njhtr8phGTTkrM/iWOk5nQ1OdpnM8IfavIGp92qr8ObGu4rpQJ/w6Ox0t7RK/Nkdl+Ku
	OjOsm8qme8KAc81wZk3rG5EkzEVOK36uO0X+Ar41yoDvxHVqR9BF0BsPERcLRkrLUtCZMK
	RhaB1iGTPJS1VAsnFa5jaLFPPTJilvU=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772718730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=x/tKo6sO/yEl7rIclC8Ou/RxLmCoSVX2S0UQLahfY5Y=;
	b=W8Njhtr8phGTTkrM/iWOk5nQ1OdpnM8IfavIGp92qr8ObGu4rpQJ/w6Ox0t7RK/Nkdl+Ku
	OjOsm8qme8KAc81wZk3rG5EkzEVOK36uO0X+Ar41yoDvxHVqR9BF0BsPERcLRkrLUtCZMK
	RhaB1iGTPJS1VAsnFa5jaLFPPTJilvU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH 00/11] tools: add support for per-domain xenstore quota
Date: Thu,  5 Mar 2026 14:51:57 +0100
Message-ID: <20260305135208.2208663-1-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.79
X-Spam-Level: 
X-Rspamd-Queue-Id: 85B8F212C79
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,m:enr0n@ubuntu.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

This series is adding support for per-domain Xenstore quota to:

- xenstored
- libxenstore
- libxl
- xl

With this it is possible to e.g. allow larger limits for driver
domains.

Juergen Gross (11):
  tools/libs/store: add get- and set-quota related functions
  tools/xenstored: add central quota check functions
  tools/xenstored: rework hard_quotas and soft_quotas arrays
  tools/xenstored: add GLOBAL_QUOTA_DATA record for live update
  tools/xenstored: split acc[] array in struct domain
  tools/xenstored: add infrastructure for per-domain quotas
  tools/xenstored: implement the GET/SET_QUOTA commands
  tools/libxl: add functions for retrieving and setting xenstore quota
  tools/libxl: add support for xenstore quota in domain_config
  tools/xl: add xl commands for xenstore quota operations
  tools/xl: add support for xenstore quota setting via domain config

 docs/man/xl.cfg.5.pod.in             |  13 +
 tools/golang/xenlight/helpers.gen.go |  84 +++++
 tools/golang/xenlight/types.gen.go   |  10 +
 tools/include/libxl.h                |  20 ++
 tools/include/xenstore.h             |  19 ++
 tools/libs/light/Makefile            |   1 +
 tools/libs/light/libxl_dom.c         |   8 +
 tools/libs/light/libxl_domain.c      |  10 +
 tools/libs/light/libxl_types.idl     |  10 +
 tools/libs/light/libxl_xsquota.c     | 102 ++++++
 tools/libs/store/Makefile            |   2 +-
 tools/libs/store/libxenstore.map     |   8 +
 tools/libs/store/xs.c                | 111 +++++++
 tools/xenstored/control.c            |  24 +-
 tools/xenstored/core.c               |  41 ++-
 tools/xenstored/domain.c             | 457 +++++++++++++++++++++------
 tools/xenstored/domain.h             |  32 +-
 tools/xenstored/lu.c                 |   6 +
 tools/xenstored/transaction.c        |   2 +-
 tools/xenstored/watch.c              |   4 +-
 tools/xl/Makefile                    |   1 +
 tools/xl/xl.h                        |   2 +
 tools/xl/xl_cmdtable.c               |  10 +
 tools/xl/xl_parse.c                  |  48 ++-
 tools/xl/xl_parse.h                  |   1 +
 tools/xl/xl_xsquota.c                |  88 ++++++
 26 files changed, 972 insertions(+), 142 deletions(-)
 create mode 100644 tools/libs/light/libxl_xsquota.c
 create mode 100644 tools/xl/xl_xsquota.c

-- 
2.53.0


