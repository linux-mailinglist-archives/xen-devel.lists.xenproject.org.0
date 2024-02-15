Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2092E85676E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 16:24:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681860.1060839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1radbD-000334-Gb; Thu, 15 Feb 2024 15:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681860.1060839; Thu, 15 Feb 2024 15:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1radbD-000315-Dw; Thu, 15 Feb 2024 15:24:31 +0000
Received: by outflank-mailman (input) for mailman id 681860;
 Thu, 15 Feb 2024 15:24:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4buu=JY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1radbC-00030z-8I
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 15:24:30 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e66b770-cc16-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 16:24:27 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9212B1F37C;
 Thu, 15 Feb 2024 15:24:27 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 65666139D0;
 Thu, 15 Feb 2024 15:24:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id SvsjF6sszmUKNAAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 15 Feb 2024 15:24:27 +0000
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
X-Inumbo-ID: 4e66b770-cc16-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708010667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=w8YrKr7y5fp/hYmK3TluFyGEjlZFNDerawHnk8q2R7I=;
	b=qfSo7lpGs27P15YkSHy28TPxqlVfMSXrbcvQ13hP4+iy+cCdzDuRRqf7lvV7F0jwTqw9Zf
	xdtXWAlxi0OQJI6Z0+chJSu3xiI1SVCNSVoJO0nBKmKDJGb2WQT1SK/Vacst1weY4UanNQ
	U9ALm1BQr7d9uuGGdwT0F+Ys7p6tdF0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708010667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=w8YrKr7y5fp/hYmK3TluFyGEjlZFNDerawHnk8q2R7I=;
	b=qfSo7lpGs27P15YkSHy28TPxqlVfMSXrbcvQ13hP4+iy+cCdzDuRRqf7lvV7F0jwTqw9Zf
	xdtXWAlxi0OQJI6Z0+chJSu3xiI1SVCNSVoJO0nBKmKDJGb2WQT1SK/Vacst1weY4UanNQ
	U9ALm1BQr7d9uuGGdwT0F+Ys7p6tdF0=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.8-rc5
Date: Thu, 15 Feb 2024 16:24:26 +0100
Message-Id: <20240215152426.1114-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.8a-rc5-tag

xen: branch for v6.8-rc5

It contains the following fixes and simple cleanups:

- A fix using a proper flexible array instead of a one-element array in order to
  avoid array-bounds sanitizer errors.

- A fix adding NULL pointer checks after allocating memory.

- A cleanup using memdup_array_user() instead of open-coding it.

- A fix for a rare race condition in Xen event channel allocation code.

- A small series making struct bus_type instances const.

- A fix of kerneldoc inline comments to match reality.


Thanks.

Juergen

 arch/x86/xen/smp.c                 | 12 ++++++++++++
 drivers/xen/events/events_base.c   |  8 ++++++--
 drivers/xen/gntalloc.c             |  2 +-
 drivers/xen/pcpu.c                 |  2 +-
 drivers/xen/privcmd.c              | 15 +++++----------
 drivers/xen/xen-balloon.c          |  2 +-
 drivers/xen/xenbus/xenbus_client.c | 15 +++++++++------
 include/uapi/xen/gntalloc.h        |  5 ++++-
 8 files changed, 39 insertions(+), 22 deletions(-)

Kees Cook (1):
      xen/gntalloc: Replace UAPI 1-element array

Kunwu Chan (1):
      x86/xen: Add some null pointer checking to smp.c

Markus Elfring (1):
      xen/privcmd: Use memdup_array_user() in alloc_ioreq()

Maximilian Heyne (1):
      xen/events: close evtchn after mapping cleanup

Ricardo B. Marliere (2):
      xen: pcpu: make xen_pcpu_subsys const
      xen: balloon: make balloon_subsys const

SeongJae Park (1):
      xen/xenbus: document will_handle argument for xenbus_watch_path()

