Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F02B8038AF
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 16:24:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647118.1009845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAn9-0005aW-3O; Mon, 04 Dec 2023 15:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647118.1009845; Mon, 04 Dec 2023 15:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAn9-0005Xl-0O; Mon, 04 Dec 2023 15:23:27 +0000
Received: by outflank-mailman (input) for mailman id 647118;
 Mon, 04 Dec 2023 15:23:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=THDE=HP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rAAn8-0005Xf-ER
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 15:23:26 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 109f680f-92b9-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 16:23:24 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A51A8220D9;
 Mon,  4 Dec 2023 15:23:23 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 7252513588;
 Mon,  4 Dec 2023 15:23:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id h2xNGuvubWUgJgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 04 Dec 2023 15:23:23 +0000
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
X-Inumbo-ID: 109f680f-92b9-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701703403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Lq1X+5oqV08B6nb7+2V7icPYOvOMJTkcMH+E08fMf0M=;
	b=ac9FqAIhC9mtWDQM+9haV58mVH6FZqxEBm0PINDBR7GMlhPUTnEkDQR3DCa6n99wubGiwr
	zfquuioZ4IAXa6cwZ0vY63Y5Zyeb50bQ/I7Kn66y0phwwBNeB2sxKnchnG9KIxg3oJomWs
	Byb6UBxGUSp6E6v+dXKl4GzPFJ2+UJM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v2 0/3] xen/sched: fixes and cleanup related to cpupools
Date: Mon,  4 Dec 2023 16:23:18 +0100
Message-Id: <20231204152321.16520-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spamd-Result: default: False [-0.30 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-0.991];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-0.997];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -0.30

Fix 2 bugs related to cpupool handling and do some related cleanups.

V2:
- send out the fixes tagged properly as "PATCH"
- add cleanup patch
 
Juergen Gross (3):
  xen/sched: fix adding offline cpu to cpupool
  xen/sched: fix sched_move_domain()
  xen/sched: do some minor cleanup of sched_move_domain()

 xen/common/sched/core.c    | 74 ++++++++++++++++++++------------------
 xen/common/sched/cpupool.c |  2 ++
 2 files changed, 41 insertions(+), 35 deletions(-)

-- 
2.35.3


