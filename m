Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C539917A9
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2024 17:16:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810957.1223644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx6Vn-0006Vl-BH; Sat, 05 Oct 2024 15:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810957.1223644; Sat, 05 Oct 2024 15:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx6Vn-0006Tj-8G; Sat, 05 Oct 2024 15:16:03 +0000
Received: by outflank-mailman (input) for mailman id 810957;
 Sat, 05 Oct 2024 15:16:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=edRR=RB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sx6Vl-0006TD-OK
 for xen-devel@lists.xenproject.org; Sat, 05 Oct 2024 15:16:01 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b98a526f-832c-11ef-a0bb-8be0dac302b0;
 Sat, 05 Oct 2024 17:16:00 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6E2631FE1A;
 Sat,  5 Oct 2024 15:15:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2CA8013A8F;
 Sat,  5 Oct 2024 15:15:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BB5HCS5YAWfwCAAAD6G6ig
 (envelope-from <jgross@suse.com>); Sat, 05 Oct 2024 15:15:58 +0000
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
X-Inumbo-ID: b98a526f-832c-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728141358; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HPdwuqGA7z8EJBMd2vQxym4phrJ0tE0TYVW2NGLkHuk=;
	b=qepeY9qR5p+HPhmRmFhWAtQ7M+O/H0QaCpy47X7zbanVFeyk5+BMqqZVfLjyzQyBk76iQq
	3NDb5cVo6UVLwTXNuhS5qNdxnp2cdoIrgG5txXQhuo1YAsVcWShfGjDfldCD1X+o3LslPQ
	H0TNPJk9wjKp9DKJC/Artk2x5iNCsmU=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728141358; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HPdwuqGA7z8EJBMd2vQxym4phrJ0tE0TYVW2NGLkHuk=;
	b=qepeY9qR5p+HPhmRmFhWAtQ7M+O/H0QaCpy47X7zbanVFeyk5+BMqqZVfLjyzQyBk76iQq
	3NDb5cVo6UVLwTXNuhS5qNdxnp2cdoIrgG5txXQhuo1YAsVcWShfGjDfldCD1X+o3LslPQ
	H0TNPJk9wjKp9DKJC/Artk2x5iNCsmU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 1/4] stubdom: add local .gitignore file
Date: Sat,  5 Oct 2024 17:15:45 +0200
Message-ID: <20241005151548.29184-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005151548.29184-1-jgross@suse.com>
References: <20241005151548.29184-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.78
X-Spamd-Result: default: False [-6.78 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.18)[-0.886];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Add a stubdom specfic .gitignore file.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore         | 37 +------------------------------------
 stubdom/.gitignore | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 36 deletions(-)
 create mode 100644 stubdom/.gitignore

diff --git a/.gitignore b/.gitignore
index d88be80b28..5c13fb5878 100644
--- a/.gitignore
+++ b/.gitignore
@@ -39,7 +39,6 @@ cscope.po.out
 .vscode
 
 dist
-stubdom/*.tar.gz
 
 autom4te.cache/
 automation/build/yocto/*.dockerfile
@@ -66,41 +65,7 @@ docs/pdf/
 docs/txt/
 extras/
 install/*
-stubdom/*-minios-config.mk
-stubdom/autom4te.cache/
-stubdom/binutils-*
-stubdom/config.cache
-stubdom/config.log
-stubdom/config.status
-stubdom/cross-root-*
-stubdom/gcc-*
-stubdom/gmp-*
-stubdom/grub-*
-stubdom/include
-stubdom/ioemu
-stubdom/ioemu/
-stubdom/libs-*
-stubdom/libxencall-*
-stubdom/libxenevtchn-*
-stubdom/libxenforeignmemory-*
-stubdom/libxengnttab-*
-stubdom/libxentoolcore-*
-stubdom/libxentoollog-*
-stubdom/lwip-*
-stubdom/lwip/
-stubdom/mini-os-*
-stubdom/mk-headers-*
-stubdom/newlib-1.*
-stubdom/newlib-x86*
-stubdom/pciutils-*
-stubdom/pkg-config/*
-stubdom/polarssl-*
-stubdom/stubdompath.sh
-stubdom/tpm_emulator-*
-stubdom/vtpm/vtpm_manager.h
-stubdom/xenstore
-stubdom/xenstorepvh
-stubdom/zlib-*
+
 tools/*/build/lib*/*.py
 tools/autom4te.cache/
 tools/config.h
diff --git a/stubdom/.gitignore b/stubdom/.gitignore
new file mode 100644
index 0000000000..10e2547a22
--- /dev/null
+++ b/stubdom/.gitignore
@@ -0,0 +1,36 @@
+/*.tar.gz
+/*-minios-config.mk
+/autom4te.cache/
+/binutils-*
+/config.cache
+/config.log
+/config.status
+/cross-root-*
+/gcc-*
+/gmp-*
+/grub-*
+/include
+/ioemu
+/ioemu/
+/libs-*
+/libxencall-*
+/libxenevtchn-*
+/libxenforeignmemory-*
+/libxengnttab-*
+/libxentoolcore-*
+/libxentoollog-*
+/lwip-*
+/lwip/
+/mini-os-*
+/mk-headers-*
+/newlib-1.*
+/newlib-x86*
+/pciutils-*
+/pkg-config/*
+/polarssl-*
+/stubdompath.sh
+/tpm_emulator-*
+/vtpm/vtpm_manager.h
+/xenstore
+/xenstorepvh
+/zlib-*
-- 
2.43.0


