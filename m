Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E9D8B9B84
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 15:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715830.1117763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2WNb-00069U-7b; Thu, 02 May 2024 13:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715830.1117763; Thu, 02 May 2024 13:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2WNb-00067e-52; Thu, 02 May 2024 13:21:43 +0000
Received: by outflank-mailman (input) for mailman id 715830;
 Thu, 02 May 2024 13:21:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+3sG=MF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1s2WNZ-00067Y-Fi
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 13:21:41 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e92fc707-0886-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 15:21:40 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B50A31FBB6;
 Thu,  2 May 2024 13:21:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 876EC1386E;
 Thu,  2 May 2024 13:21:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QZaTH2KTM2acTAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 02 May 2024 13:21:38 +0000
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
X-Inumbo-ID: e92fc707-0886-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1714656099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=W0UBg54t8/+8VJyJ7E60mws+UPuTMw8aFgHfUteifWk=;
	b=ocSqdOGL39EmmuLr8CRjlQIjzIQdRYgVRKyDAcnYRopWLdv8Ul0lWJn6t3Ub4Cd30CkEV0
	5pbCmHVmB5Z1GybWmHJieDozNdgCaIiyA0cDNW61oEqdksyeLn6RbdyidjHLnUgDQdGlf+
	B7XxU7fcZqCz70fzT988siomb3gGlfs=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=mIial2bY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1714656098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=W0UBg54t8/+8VJyJ7E60mws+UPuTMw8aFgHfUteifWk=;
	b=mIial2bYLyrAa77O0BDevQzy/j9naVCaSEQA9tCJu4eRzVN/BWo+zCyjxLhZ+39yPIm55J
	uAQ5DvXW9p9+a5QoioQZLr87yPttX3/YHaWZ3FvN/pMmqfQdge2e4QmyeDQ/4vIfZ6VLOR
	M3HyOQhl5JQKBtDrq7PWLgxTCoqiOwc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH] tools/tests: don't let test-xenstore write nodes exceeding default size
Date: Thu,  2 May 2024 15:21:36 +0200
Message-Id: <20240502132136.532-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-0.02 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	BAYES_HAM(-0.01)[47.29%];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Flag: NO
X-Spam-Score: -0.02
X-Spamd-Bar: /
X-Rspamd-Queue-Id: B50A31FBB6
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Today test-xenstore will write nodes with 3000 bytes node data. This
size is exceeding the default quota for the allowed node size. While
working in dom0 with C-xenstored, OCAML-xenstored does not like that.

Use a size of 2000 instead, which is lower than the allowed default
node size of 2048.

Fixes: 3afc5e4a5b75 ("tools/tests: add xenstore testing framework")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/tests/xenstore/test-xenstore.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/tests/xenstore/test-xenstore.c b/tools/tests/xenstore/test-xenstore.c
index d7d44cc0fa..7a9bd9afb3 100644
--- a/tools/tests/xenstore/test-xenstore.c
+++ b/tools/tests/xenstore/test-xenstore.c
@@ -408,9 +408,9 @@ static int test_ta3_deinit(uintptr_t par)
 #define TEST(s, f, p, l) { s, f ## _init, f, f ## _deinit, (uintptr_t)(p), l }
 struct test tests[] = {
 TEST("read 1", test_read, 1, "Read node with 1 byte data"),
-TEST("read 3000", test_read, 3000, "Read node with 3000 bytes data"),
+TEST("read 2000", test_read, 2000, "Read node with 2000 bytes data"),
 TEST("write 1", test_write, 1, "Write node with 1 byte data"),
-TEST("write 3000", test_write, 3000, "Write node with 3000 bytes data"),
+TEST("write 2000", test_write, 2000, "Write node with 2000 bytes data"),
 TEST("dir", test_dir, 0, "List directory"),
 TEST("rm node", test_rm, 0, "Remove single node"),
 TEST("rm dir", test_rm, WRITE_BUFFERS_N, "Remove node with sub-nodes"),
-- 
2.35.3


