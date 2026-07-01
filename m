Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DlIONAb3RGqY4AoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 13:16:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 725BD6ECA7A
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 13:16:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=qrFnZYoG;
	dkim=pass header.d=suse.com header.s=susede1 header.b=qrFnZYoG;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1349770.1607413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wesvM-0000o9-Jd; Wed, 01 Jul 2026 11:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349770.1607413; Wed, 01 Jul 2026 11:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wesvM-0000ml-Gx; Wed, 01 Jul 2026 11:16:12 +0000
Received: by outflank-mailman (input) for mailman id 1349770;
 Wed, 01 Jul 2026 11:16:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wesvL-0000mf-5l
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 11:16:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wesvK-00AYiY-Ib
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 13:16:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a44f6f8-bab6-0a2a0a5309dd-0a2a450adfe2-10
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:16:10 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a44f6f9-e40e-0a2a450a0019-c387df82b2c6-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:16:09 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0BC0C73A64;
 Wed,  1 Jul 2026 11:16:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B0FF2779AA;
 Wed,  1 Jul 2026 11:16:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GjmxKfj2RGrOAQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 01 Jul 2026 11:16:08 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1782904569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JT7iBznZB9hYtU2hmcIVCoEf5jUDxb+Rih533/5awsQ=;
	b=qrFnZYoGs8bV/t9bkf3xiq/puwOmeYoEQXCcihKDLtmLaarzPkD+wQXK/2ZU5jng0Y7yip
	lWCjyWJNEausYb8DgjP7PxznkT4S6BkFza9PHXUAXmzHzfLee6OjfK+BOd4WG4tv24fbBU
	ImFKa65Yl0ozvK5sp3lFzrVc6z2Af1A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1782904569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JT7iBznZB9hYtU2hmcIVCoEf5jUDxb+Rih533/5awsQ=;
	b=qrFnZYoGs8bV/t9bkf3xiq/puwOmeYoEQXCcihKDLtmLaarzPkD+wQXK/2ZU5jng0Y7yip
	lWCjyWJNEausYb8DgjP7PxznkT4S6BkFza9PHXUAXmzHzfLee6OjfK+BOd4WG4tv24fbBU
	ImFKa65Yl0ozvK5sp3lFzrVc6z2Af1A=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <gwd@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/3] Change XEN_DOMCTL_setvcpuaffinity interface
Date: Wed,  1 Jul 2026 13:16:03 +0200
Message-ID: <20260701111606.4063972-1-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.01
X-purgate-ID: tlsNG-4011c0/1782904569-D7D33DDE-8163BA14/0/0
X-purgate-type: clean
X-purgate-size: 1184
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:anthony.perard@vates.tech,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 725BD6ECA7A

Today the XEN_DOMCTL_setvcpuaffinity hypercall will not only change the
affinity settings of a vcpu, it will return the new effective settings,
too.

In case an error happens during this hypercall, the expectation of the
caller is that the affinity of the vcpu didn't change. This isn't true,
however, if passing the new effective affinity back to the user is
failing.

Instead of making error handling in the hypervisor even more complex,
just change the interface by NOT passing back the new affinity. It can
easily be obtained by another XEN_DOMCTL_getvcpuaffinity call if
needed.

Juergen Gross (3):
  tools/libxl: don't rely on xc_vcpu_setaffinity() returned cpumaps
  xen: don't let XEN_DOMCTL_setvcpuaffinity return the new affinities
  tools/libxenctrl: rename parameters of xc_vcpu_setaffinity()

 tools/include/xenctrl.h        | 26 +++++-----------------
 tools/libs/ctrl/xc_domain.c    | 26 ++++++++++------------
 tools/libs/light/libxl_sched.c |  9 ++++++++
 xen/common/sched/core.c        | 40 ++++++++--------------------------
 xen/include/public/domctl.h    |  9 ++------
 5 files changed, 38 insertions(+), 72 deletions(-)

-- 
2.54.0


