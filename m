Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AC3823E0F
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:01:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661123.1030833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJbE-00088n-UQ; Thu, 04 Jan 2024 09:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661123.1030833; Thu, 04 Jan 2024 09:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJbE-00086Z-QE; Thu, 04 Jan 2024 09:01:12 +0000
Received: by outflank-mailman (input) for mailman id 661123;
 Thu, 04 Jan 2024 09:01:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJbD-00085z-Ri
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:01:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce16e9ce-aadf-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 10:01:10 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9B22C21F94;
 Thu,  4 Jan 2024 09:01:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B83813722;
 Thu,  4 Jan 2024 09:01:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PV71HNZzlmWHWAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:01:10 +0000
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
X-Inumbo-ID: ce16e9ce-aadf-11ee-98ef-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v3 02/33] xen/public: add some more 9pfs xenstore paths
Date: Thu,  4 Jan 2024 10:00:24 +0100
Message-Id: <20240104090055.27323-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240104090055.27323-1-jgross@suse.com>
References: <20240104090055.27323-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 9B22C21F94

Add some optional additional backend paths for 9pfs PV devices. Those
paths will be supported by the new xen-9pfsd 9pfs backend.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 xen/include/public/io/9pfs.h | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/xen/include/public/io/9pfs.h b/xen/include/public/io/9pfs.h
index 9ad2773082..ac4bf0434b 100644
--- a/xen/include/public/io/9pfs.h
+++ b/xen/include/public/io/9pfs.h
@@ -71,6 +71,40 @@
  *                 created on the guest (no user ownership squash or remap)
  *         Only "none" is supported in this version of the protocol.
  *
+ *    max-files
+ *         Values:        <uint32_t>
+ *
+ *         The maximum number of files (including directories) allowed for
+ *         this device. Backend support of this node is optional. If the node
+ *         is not present or the value is zero the number of files is not
+ *         limited.
+ *
+ *    max-open-files
+ *         Values:        <uint32_t>
+ *
+ *         The maximum number of files the guest is allowed to have opened
+ *         concurrently. Multiple concurrent opens of the same file are counted
+ *         individually. Backend support of this node is optional. If the node
+ *         is not present or the value is zero a backend specific default is
+ *         applied.
+ *
+ *    max-space
+ *         Values:        <uint32_t>
+ *
+ *         The maximum file space in MiBs the guest is allowed to use for this
+ *         device. Backend support of this node is optional. If the node is
+ *         not present or the value is zero the space is not limited.
+ *
+ *    auto-delete
+ *         Values:        <bool>
+ *
+ *         When set to "1" the backend will delete the file with the oldest
+ *         modification date below <path> in case the allowed maximum file
+ *         space (see <max-space>) or file number (see <max-files>) is being
+ *         exceeded due to guest activity (creation or extension of files).
+ *         Files currently opened by the guest won't be deleted. Backend
+ *         support of this node is optional.
+ *
  ******************************************************************************
  *                            Frontend XenBus Nodes
  ******************************************************************************
-- 
2.35.3


