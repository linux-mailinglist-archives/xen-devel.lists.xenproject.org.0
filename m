Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C327E7D92
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:09:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630465.983302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U3O-0004Ol-LT; Fri, 10 Nov 2023 16:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630465.983302; Fri, 10 Nov 2023 16:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1U3O-0004N6-Ib; Fri, 10 Nov 2023 16:08:18 +0000
Received: by outflank-mailman (input) for mailman id 630465;
 Fri, 10 Nov 2023 16:08:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1U3M-00048H-MB
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:08:16 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a44d42c-7fe3-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 17:08:14 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A21742187C;
 Fri, 10 Nov 2023 16:08:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 86B2113398;
 Fri, 10 Nov 2023 16:08:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kG2FH2xVTmVfCAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 16:08:12 +0000
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
X-Inumbo-ID: 5a44d42c-7fe3-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699632492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KX1+eDPCalxeEFEgNKEP+cxmDRb/81lwwxJPAyo97p8=;
	b=L9r11Bm4y/+fJwlqKCNLLex1A43vSYJMwabGjObqK+M89XOC4w2PqCxN+9hEdQeXLgcWLs
	01k3padm3b4rDhdJO747kpz/WOGH4ulpWwfopn5X1711QHLZ7YaPdsbsGA2lGaChntxDBN
	okSazRAVPRjgmazZYTYiY7b9Q8Vca/8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 01/29] xen/public: add some more 9pfs xenstore paths
Date: Fri, 10 Nov 2023 17:07:36 +0100
Message-Id: <20231110160804.29021-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110160804.29021-1-jgross@suse.com>
References: <20231110160804.29021-1-jgross@suse.com>
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


