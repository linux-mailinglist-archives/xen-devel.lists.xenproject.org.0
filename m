Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED59C9917A5
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2024 17:16:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810958.1223654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx6Vq-0006mw-Iv; Sat, 05 Oct 2024 15:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810958.1223654; Sat, 05 Oct 2024 15:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx6Vq-0006kO-Es; Sat, 05 Oct 2024 15:16:06 +0000
Received: by outflank-mailman (input) for mailman id 810958;
 Sat, 05 Oct 2024 15:16:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=edRR=RB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sx6Vp-0006TD-3r
 for xen-devel@lists.xenproject.org; Sat, 05 Oct 2024 15:16:05 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcdfd6bc-832c-11ef-a0bb-8be0dac302b0;
 Sat, 05 Oct 2024 17:16:04 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0F20B1FDBD;
 Sat,  5 Oct 2024 15:16:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D131E13A8F;
 Sat,  5 Oct 2024 15:16:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3XJtMTNYAWf1CAAAD6G6ig
 (envelope-from <jgross@suse.com>); Sat, 05 Oct 2024 15:16:03 +0000
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
X-Inumbo-ID: bcdfd6bc-832c-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728141364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gqQWygSSK4ytl3fKX2xJfCRM7bub9g07ORkZhe7KAkQ=;
	b=G/GENQ8FHHuThLUbP6nX92T+t5BxBIGtZ7/Ii0BO/IrfOjzKCljvJdjgADziygNVySe9Bk
	R0sXlh3rKRkp7lLILgz8VKGuRd26SFut/3L0SDKLsExjYqAhD8x/jdfUSKkcqoADjX+n/u
	PjwXdCDIus0gT7UVpM1BSo6wnLc3qEM=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728141364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gqQWygSSK4ytl3fKX2xJfCRM7bub9g07ORkZhe7KAkQ=;
	b=G/GENQ8FHHuThLUbP6nX92T+t5BxBIGtZ7/Ii0BO/IrfOjzKCljvJdjgADziygNVySe9Bk
	R0sXlh3rKRkp7lLILgz8VKGuRd26SFut/3L0SDKLsExjYqAhD8x/jdfUSKkcqoADjX+n/u
	PjwXdCDIus0gT7UVpM1BSo6wnLc3qEM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: [PATCH 2/4] stubdom: explcitly add libc and lwip Mini-OS config options
Date: Sat,  5 Oct 2024 17:15:46 +0200
Message-ID: <20241005151548.29184-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005151548.29184-1-jgross@suse.com>
References: <20241005151548.29184-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -5.30
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,ens-lyon.org,tycho.nsa.gov,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 

Today the Mini-OS build systems derives libc and lwip config options
from the stubdom and LWIPDIR make variables supplied by the Xen build
system.

In order to prepare those being explicit Mini-OS config options, add
them to the related stubdom Mini-OS config files.

While at it remove the CONFIG_START_NETWORK setting from config files
disabling lwip, as CONFIG_START_NETWORK requires lwip for becoming
effective.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/c/minios.cfg           | 2 ++
 stubdom/grub/minios.cfg        | 3 ++-
 stubdom/ioemu-minios.cfg       | 2 ++
 stubdom/vtpm/minios.cfg        | 3 ++-
 stubdom/vtpmmgr/minios.cfg     | 3 ++-
 stubdom/xenstore-minios.cfg    | 1 +
 stubdom/xenstorepvh-minios.cfg | 1 +
 7 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/stubdom/c/minios.cfg b/stubdom/c/minios.cfg
index e69de29bb2..56d65510cd 100644
--- a/stubdom/c/minios.cfg
+++ b/stubdom/c/minios.cfg
@@ -0,0 +1,2 @@
+CONFIG_LIBC=y
+CONFIG_LWIP=y
diff --git a/stubdom/grub/minios.cfg b/stubdom/grub/minios.cfg
index 8df49092cd..5145b357e0 100644
--- a/stubdom/grub/minios.cfg
+++ b/stubdom/grub/minios.cfg
@@ -1,3 +1,4 @@
-CONFIG_START_NETWORK=n
+CONFIG_LIBC=y
+CONFIG_LWIP=n
 CONFIG_SPARSE_BSS=n
 CONFIG_TPMFRONT=y
diff --git a/stubdom/ioemu-minios.cfg b/stubdom/ioemu-minios.cfg
index a65baa3765..6153ae05f8 100644
--- a/stubdom/ioemu-minios.cfg
+++ b/stubdom/ioemu-minios.cfg
@@ -1,3 +1,5 @@
+CONFIG_LIBC=y
+CONFIG_LWIP=y
 CONFIG_START_NETWORK=n
 CONFIG_QEMU_XS_ARGS=y
 CONFIG_PCIFRONT=y
diff --git a/stubdom/vtpm/minios.cfg b/stubdom/vtpm/minios.cfg
index 31652ee4f2..22f66f1351 100644
--- a/stubdom/vtpm/minios.cfg
+++ b/stubdom/vtpm/minios.cfg
@@ -1,7 +1,8 @@
+CONFIG_LIBC=y
+CONFIG_LWIP=n
 CONFIG_TPMFRONT=y
 CONFIG_TPM_TIS=n
 CONFIG_TPMBACK=y
-CONFIG_START_NETWORK=n
 CONFIG_TEST=n
 CONFIG_PCIFRONT=n
 CONFIG_BLKFRONT=y
diff --git a/stubdom/vtpmmgr/minios.cfg b/stubdom/vtpmmgr/minios.cfg
index 3fb383d30f..a9f13a2fd2 100644
--- a/stubdom/vtpmmgr/minios.cfg
+++ b/stubdom/vtpmmgr/minios.cfg
@@ -1,7 +1,8 @@
+CONFIG_LIBC=y
+CONFIG_LWIP=n
 CONFIG_TPMFRONT=y
 CONFIG_TPM_TIS=y
 CONFIG_TPMBACK=y
-CONFIG_START_NETWORK=n
 CONFIG_TEST=n
 CONFIG_PCIFRONT=n
 CONFIG_BLKFRONT=y
diff --git a/stubdom/xenstore-minios.cfg b/stubdom/xenstore-minios.cfg
index 239da519b9..0252b59432 100644
--- a/stubdom/xenstore-minios.cfg
+++ b/stubdom/xenstore-minios.cfg
@@ -1,3 +1,4 @@
+CONFIG_LIBC=y
 CONFIG_BLKFRONT=n
 CONFIG_NETFRONT=n
 CONFIG_FBFRONT=n
diff --git a/stubdom/xenstorepvh-minios.cfg b/stubdom/xenstorepvh-minios.cfg
index 752b90d7d3..62a228f33d 100644
--- a/stubdom/xenstorepvh-minios.cfg
+++ b/stubdom/xenstorepvh-minios.cfg
@@ -1,3 +1,4 @@
+CONFIG_LIBC=y
 CONFIG_PARAVIRT=n
 CONFIG_BLKFRONT=n
 CONFIG_NETFRONT=n
-- 
2.43.0


