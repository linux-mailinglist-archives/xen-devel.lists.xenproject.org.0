Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3BBAF0D98
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:13:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030382.1404042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsae-0000FL-HE; Wed, 02 Jul 2025 08:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030382.1404042; Wed, 02 Jul 2025 08:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsae-0000DD-Do; Wed, 02 Jul 2025 08:13:12 +0000
Received: by outflank-mailman (input) for mailman id 1030382;
 Wed, 02 Jul 2025 08:13:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsac-00082X-UT
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:13:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6397136f-571c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 10:13:09 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D47E72117F;
 Wed,  2 Jul 2025 08:13:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA54D13A24;
 Wed,  2 Jul 2025 08:13:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xuohKBTqZGj8SAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:13:08 +0000
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
X-Inumbo-ID: 6397136f-571c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751443988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OogoM4iMQHWV+6sWu3sxpe6GFoI8m1ZNv0L6fcMW6nA=;
	b=N0rSvNMB3NiZDLE+mkszMPJA5aAkaURzSnb1wVGxCll7VqckVjuWLESyGNKVCOhL86z5zZ
	xu6g0JOOd1t1Vw/gx9po/Cs4r8Le3UjhZ4b44aukn9LhuSfvZ02j9qrrI2YmwJHkPbsML4
	EebUbhNlFlqzNjyhb9JagEqCLhpaN68=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751443988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OogoM4iMQHWV+6sWu3sxpe6GFoI8m1ZNv0L6fcMW6nA=;
	b=N0rSvNMB3NiZDLE+mkszMPJA5aAkaURzSnb1wVGxCll7VqckVjuWLESyGNKVCOhL86z5zZ
	xu6g0JOOd1t1Vw/gx9po/Cs4r8Le3UjhZ4b44aukn9LhuSfvZ02j9qrrI2YmwJHkPbsML4
	EebUbhNlFlqzNjyhb9JagEqCLhpaN68=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 02/19] mini-os: kexec: add O_CLOEXEC support
Date: Wed,  2 Jul 2025 10:12:37 +0200
Message-ID: <20250702081254.14383-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081254.14383-1-jgross@suse.com>
References: <20250702081254.14383-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

Define O_CLOEXEC as a non-zero value and add a kexec callback to cycle
over all open files to close them in case O_CLOEXEC was specified when
opening the file.

This requires the addition of a cloexec boolean in struct file.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/fcntl.h |  6 ++++++
 include/lib.h   |  1 +
 lib/sys.c       | 44 +++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/include/fcntl.h b/include/fcntl.h
index cc59b3ca..3205daed 100644
--- a/include/fcntl.h
+++ b/include/fcntl.h
@@ -3,6 +3,9 @@
 
 #ifdef HAVE_LIBC
 #include_next <fcntl.h>
+#ifndef O_CLOEXEC
+#define O_CLOEXEC	0x40000	/* Use newlib's value for WIN32 and CYGWIN. */
+#endif
 #else
 
 /* open/fcntl - O_SYNC is only implemented on blocks devices and on files
@@ -25,6 +28,9 @@
 #define O_DIRECTORY	0200000	/* must be a directory */
 #define O_NOFOLLOW	0400000 /* don't follow links */
 #define O_NOATIME	01000000
+#ifndef O_CLOEXEC
+#define O_CLOEXEC	02000000
+#endif
 
 #define F_DUPFD		0	/* dup */
 #define F_GETFD		1	/* get close_on_exec */
diff --git a/include/lib.h b/include/lib.h
index de67bab0..ea146496 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -174,6 +174,7 @@ extern struct wait_queue_head event_queue;
 struct file {
     unsigned int type;
     bool read;	/* maybe available for read */
+    bool cloexec;
     off_t offset;
     union {
         int fd; /* Any fd from an upper layer. */
diff --git a/lib/sys.c b/lib/sys.c
index 481067f7..7dc236e0 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -26,6 +26,7 @@
 #include <sched.h>
 #include <events.h>
 #include <wait.h>
+#include <kexec.h>
 #include <netfront.h>
 #include <blkfront.h>
 #include <fbfront.h>
@@ -221,6 +222,7 @@ int alloc_fd(unsigned int type)
 	if (files[i].type == FTYPE_NONE) {
 	    files[i].type = type;
             files[i].offset = 0;
+            files[i].cloexec = false;
 	    pthread_mutex_unlock(&fd_lock);
 	    return i;
 	}
@@ -231,6 +233,39 @@ int alloc_fd(unsigned int type)
 }
 EXPORT_SYMBOL(alloc_fd);
 
+#ifdef CONFIG_KEXEC
+static int kexec_close_files(bool undo)
+{
+    unsigned int i;
+    static int closed = 0;
+
+    if ( undo )
+    {
+        if ( closed )
+            printk("Can't undo closing files!\n");
+        closed = 0;
+
+        return 0;
+    }
+
+    pthread_mutex_lock(&fd_lock);
+
+    for ( i = 0; i < NOFILE; i++ )
+    {
+        if ( files[i].type != FTYPE_NONE && files[i].cloexec )
+        {
+            close(i);
+            closed++;
+        }
+    }
+
+    pthread_mutex_unlock(&fd_lock);
+
+    return 0;
+}
+kexec_call(kexec_close_files);
+#endif
+
 void close_all_files(void)
 {
     int i;
@@ -374,6 +409,7 @@ int open(const char *pathname, int flags, ...)
     struct mount_point *mnt;
     mode_t mode = 0;
     va_list ap;
+    int fd;
 
     if ( flags & O_CREAT )
     {
@@ -390,7 +426,13 @@ int open(const char *pathname, int flags, ...)
         mlen = strlen(mnt->path);
         if ( !strncmp(pathname, mnt->path, mlen) &&
              (pathname[mlen] == '/' || pathname[mlen] == 0) )
-            return mnt->open(mnt, pathname + mlen, flags, mode);
+        {
+            fd = mnt->open(mnt, pathname + mlen, flags, mode);
+            if ( fd >= 0 && (flags & O_CLOEXEC) )
+                files[fd].cloexec = true;
+
+            return fd;
+        }
     }
 
     errno = EIO;
-- 
2.43.0


