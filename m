Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F41C4052C0
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 14:49:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183221.331282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOJUl-000595-Dm; Thu, 09 Sep 2021 12:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183221.331282; Thu, 09 Sep 2021 12:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOJUl-00055J-8x; Thu, 09 Sep 2021 12:49:35 +0000
Received: by outflank-mailman (input) for mailman id 183221;
 Thu, 09 Sep 2021 12:49:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vCZp=N7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mOJUj-0004eL-DT
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 12:49:33 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e0b0f30-116c-11ec-b1b2-12813bfff9fa;
 Thu, 09 Sep 2021 12:49:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1DCAB222ED;
 Thu,  9 Sep 2021 12:49:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF60013C53;
 Thu,  9 Sep 2021 12:49:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zvm/J9YCOmEyAgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 09 Sep 2021 12:49:26 +0000
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
X-Inumbo-ID: 5e0b0f30-116c-11ec-b1b2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631191767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Toydu0D3i5KxQN6Ya4n3cSCDGf0+3fEILAITE1BDLrs=;
	b=ijCsBqW1VXyQN96muFlMPS3yHJjQsSe+cfU1movOzZjVvgyH2rUgrcS/QAXag1ltTECEh9
	KtSOHW+2kxtZYEsZbyStJRAwYe0j7ahHYj3oCkk5VeVwSkWOc5R89bHsslsTZx6h0aAagf
	5kCWaaEvUYdF1bf4kioYMivTZ4s4CHM=
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
Subject: [PATCH v2 0/3] disable building of pv-grub and qemu-trad per default
Date: Thu,  9 Sep 2021 14:49:21 +0200
Message-Id: <20210909124924.1698-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a first step of deprecating pv-grub and qemu-trad including
ioemu-stubdom. Switch the default to not building it.

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


