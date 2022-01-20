Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B20D494D93
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 13:02:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259038.446719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAW9K-0007d1-KF; Thu, 20 Jan 2022 12:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259038.446719; Thu, 20 Jan 2022 12:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAW9K-0007b6-Gw; Thu, 20 Jan 2022 12:02:42 +0000
Received: by outflank-mailman (input) for mailman id 259038;
 Thu, 20 Jan 2022 12:02:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fK7G=SE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nAW9I-0007ap-OR
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 12:02:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd5fd82b-79e8-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 13:02:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 46747210F3;
 Thu, 20 Jan 2022 12:02:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0EAC213B51;
 Thu, 20 Jan 2022 12:02:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id e8A9Al9P6WF5UwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 20 Jan 2022 12:02:39 +0000
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
X-Inumbo-ID: dd5fd82b-79e8-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642680159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pu+D+XCV5vakBgyLlB2J5yNghvXJQ9cT+8my8T+L11k=;
	b=X6beP5Ngcl4eVjHJpM0EKkOCYAV4C41eLBljmf7IWzB+hQrR2tWmlcoNq3itVBPCeYkTtx
	FPVE1smtCfVw4mb4iiR3tvDNkR6bVX0br/9xMHTCH4kCPD6IX/+qyG1JK2R+ZZ1TuDDRcI
	FhX7eZQpY97ijjNr3OmeQOqJtpvFkDg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 0/3] tools/xenstore: simplify hashtable implementation
Date: Thu, 20 Jan 2022 13:02:33 +0100
Message-Id: <20220120120236.13826-1-jgross@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do some simplifications in the hashtable implementation not touching
the hashtable interfaces.

Juergen Gross (3):
  tools/xenstore: merge hashtable_private.h into hashtable.c
  tools/xenstore: fix hashtable_expand() zeroing new area
  tools/xenstore: drop DEFINE_HASHTABLE_* macros and usage intro

 tools/xenstore/hashtable.c         | 34 ++++++++++--
 tools/xenstore/hashtable.h         | 76 --------------------------
 tools/xenstore/hashtable_private.h | 85 ------------------------------
 3 files changed, 29 insertions(+), 166 deletions(-)
 delete mode 100644 tools/xenstore/hashtable_private.h

-- 
2.31.1


