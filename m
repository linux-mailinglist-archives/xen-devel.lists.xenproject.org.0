Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3F87DDE78
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:33:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626228.976322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7bV-0006Ed-JY; Wed, 01 Nov 2023 09:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626228.976322; Wed, 01 Nov 2023 09:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7bV-0006Bt-Fc; Wed, 01 Nov 2023 09:33:37 +0000
Received: by outflank-mailman (input) for mailman id 626228;
 Wed, 01 Nov 2023 09:33:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7bT-0005E0-9T
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:33:35 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba4e3bae-7899-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:33:34 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6F5481F74A;
 Wed,  1 Nov 2023 09:33:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5593113460;
 Wed,  1 Nov 2023 09:33:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HrKPE24bQmWgCAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:33:34 +0000
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
X-Inumbo-ID: ba4e3bae-7899-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KX1+eDPCalxeEFEgNKEP+cxmDRb/81lwwxJPAyo97p8=;
	b=WSXsFID7DYLhmnxGXvKweUBY3i7yGXby1zTK3AGZr86Zo8taPPKPldaKwHeQsyU4nOxmrc
	+reDoRvzVt0rgkQer482r4vayPWu+gbIDirL4jJS7YCNHE951FOyqSL+M6FtdfrJWfS7Qz
	Q+IztHn/l618cpy1VAGAJKOTxte2xLY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH 01/29] xen/public: add some more 9pfs xenstore paths
Date: Wed,  1 Nov 2023 10:32:57 +0100
Message-Id: <20231101093325.30302-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some optional additional backend paths for 9pfs PV devices. Those
paths will be supported by the new xenlogd 9pfs backend.

Signed-off-by: Juergen Gross <jgross@suse.com>
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


