Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D1042A623
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 15:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207220.362985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maI2U-0001rS-Pt; Tue, 12 Oct 2021 13:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207220.362985; Tue, 12 Oct 2021 13:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maI2U-0001k9-Ki; Tue, 12 Oct 2021 13:41:54 +0000
Received: by outflank-mailman (input) for mailman id 207220;
 Tue, 12 Oct 2021 13:41:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xSmm=PA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1maI2S-0001i7-TU
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 13:41:52 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 278c30b4-2b62-11ec-8129-12813bfff9fa;
 Tue, 12 Oct 2021 13:41:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ECD59200AB;
 Tue, 12 Oct 2021 13:41:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BA4CE13BC9;
 Tue, 12 Oct 2021 13:41:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Lfw2LJ6QZWGabgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 12 Oct 2021 13:41:50 +0000
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
X-Inumbo-ID: 278c30b4-2b62-11ec-8129-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634046110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uih8tIuxkl60Joc9qtXew+1sWSQCt+Ig3NkEphj54cI=;
	b=KrP0lCo/Ym6SbS0ILKKt2+kfUpdkqNu8Vei5s4fq/kJlZ892fyyxtgoTgA2+1amgCY/2gG
	EdTJflBnIJRDbhDpQ4whSjVGIT8SqziwcFW5/YZbOn/EDmJH/W9lsScFUOe5/a0nuSXoyh
	w8IRvht09vB8pw2hSHxLRGS+qbbZ2Kk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 0/2] tools/xenstore: set resource limits of xenstored
Date: Tue, 12 Oct 2021 15:41:46 +0200
Message-Id: <20211012134148.6280-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set some limits for xenstored in order to avoid it being killed by
OOM killer, or to run out of file descriptors.

Changes in V6:
- start daemon directly via prlimit

Changes in V5:
- respect /proc/sys/fs/nr_open (Ian Jackson)

Changes in V4:
- add comments
- switch to configure open file descriptors directly

Changes in V3:
- make oom score configurable

Changes in V2:
- split into 2 patches
- set limits from start script

Juergen Gross (2):
  tools/xenstore: set oom score for xenstore daemon on Linux
  tools/xenstore: set open file descriptor limit for xenstored

 .../Linux/init.d/sysconfig.xencommons.in      | 22 +++++++++++++++
 tools/hotplug/Linux/launch-xenstore.in        | 27 ++++++++++++++++++-
 2 files changed, 48 insertions(+), 1 deletion(-)

-- 
2.26.2


