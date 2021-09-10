Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9641D4066EF
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 07:55:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184033.332552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOZVb-00037Q-8q; Fri, 10 Sep 2021 05:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184033.332552; Fri, 10 Sep 2021 05:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOZVb-00035b-59; Fri, 10 Sep 2021 05:55:31 +0000
Received: by outflank-mailman (input) for mailman id 184033;
 Fri, 10 Sep 2021 05:55:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dvCC=OA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mOZVZ-0002mm-C9
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 05:55:29 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af7f13f4-11fb-11ec-b210-12813bfff9fa;
 Fri, 10 Sep 2021 05:55:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C6B74223C1;
 Fri, 10 Sep 2021 05:55:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6713113D02;
 Fri, 10 Sep 2021 05:55:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id M3SlF0nzOmEDEAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Sep 2021 05:55:21 +0000
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
X-Inumbo-ID: af7f13f4-11fb-11ec-b210-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631253321; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=m9R6JMYMRyyJJMwi14rsvjDv5ZbRSUEL1JTkP/zl71I=;
	b=AqR0Gj8KqJV2nWhzwhz9cjIVThvMswcrr6OaewBuqcbcHEpN5owh/OfSmx98kppJv7Ruti
	2JodyrqHo8v81cw4voAhWxt6X0FjT91RG5EcimLdUYSWmYgf7iprNiA7S0TEdDJQNvdKR5
	c86qmwD18M4nV+Rz+j40fVKvv7zKW4U=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v3 0/3] disable building of pv-grub and qemu-trad per default
Date: Fri, 10 Sep 2021 07:55:15 +0200
Message-Id: <20210910055518.562-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a first step of deprecating pv-grub and qemu-trad including
ioemu-stubdom. Switch the default to not building it.

Changes in V3:
- rename pv-grub32 make target

Changes in V2:
- new patch 3
- added CHANGELOG.md entry in patch 2

Juergen Gross (3):
  stubdom: fix build with disabled pv-grub
  stubdom: disable building pv-grub
  tools: disable building qemu-trad per default

 CHANGELOG.md         |  5 +++++
 Makefile             |  4 ++--
 stubdom/Makefile     | 13 +++++++++++++
 stubdom/configure    | 16 ++--------------
 stubdom/configure.ac | 10 ++--------
 tools/configure      | 17 ++---------------
 tools/configure.ac   | 13 +------------
 7 files changed, 27 insertions(+), 51 deletions(-)

-- 
2.26.2


