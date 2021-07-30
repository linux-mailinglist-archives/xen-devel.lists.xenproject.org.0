Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE423DB897
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 14:27:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162518.298042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9RbW-000504-4C; Fri, 30 Jul 2021 12:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162518.298042; Fri, 30 Jul 2021 12:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9RbW-0004x8-0E; Fri, 30 Jul 2021 12:27:06 +0000
Received: by outflank-mailman (input) for mailman id 162518;
 Fri, 30 Jul 2021 12:27:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MkAV=MW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m9RbV-0004PS-5J
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 12:27:05 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 794644bc-92da-4584-b995-127eed0518aa;
 Fri, 30 Jul 2021 12:26:59 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7FBB91FDE6;
 Fri, 30 Jul 2021 12:26:58 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 34345137F9;
 Fri, 30 Jul 2021 12:26:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id N2fkCBLwA2FOVgAAGKfGzw
 (envelope-from <jgross@suse.com>); Fri, 30 Jul 2021 12:26:58 +0000
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
X-Inumbo-ID: 794644bc-92da-4584-b995-127eed0518aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1627648018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LWzZkVzQMh0+aoBZBkmzQk3xk4z+Q2z4JMszPPOibOw=;
	b=WYl6cpBGp0twcPJ92td+t21lQeb0WVu5lO6+TuWJTP8yPjMtMqhOsZBF+Xz4EB96l/4ZYq
	HA/kYLx6ZGaJG5Yov2l3TwpGmGQjiQaoabFacepJTB+0l/ZDzScwmLduJYsXkt+VszDcUQ
	5NHI0NjiR++DrpWR1UTXTjQOBGiGPtY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 0/2] tools/xenstore: set resource limits of xenstored
Date: Fri, 30 Jul 2021 14:26:41 +0200
Message-Id: <20210730122643.2043-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set some limits for xenstored in order to avoid it being killed by
OOM killer, or to run out of file descriptors.

Changes in V3:
- make oom score configurable

Changes in V2:
- split into 2 patches
- set limits from start script

Juergen Gross (2):
  tools/xenstore: set oom score for xenstore daemon on Linux
  tools/xenstore: set open file descriptor limit for xenstored

 tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 14 ++++++++++++++
 tools/hotplug/Linux/launch-xenstore.in             |  9 +++++++++
 2 files changed, 23 insertions(+)

-- 
2.26.2


