Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCD47DE34A
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 16:36:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626511.976816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyDGM-00087g-9Y; Wed, 01 Nov 2023 15:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626511.976816; Wed, 01 Nov 2023 15:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyDGM-00084T-67; Wed, 01 Nov 2023 15:36:10 +0000
Received: by outflank-mailman (input) for mailman id 626511;
 Wed, 01 Nov 2023 15:36:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qyDGL-0007ME-4B
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 15:36:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e9696e8-78cc-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 16:36:05 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 030EA1F853;
 Wed,  1 Nov 2023 15:36:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CB0C81348D;
 Wed,  1 Nov 2023 15:36:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3qEwMGRwQmWRKgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 15:36:04 +0000
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
X-Inumbo-ID: 5e9696e8-78cc-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698852965; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+tQcJhL3TubDFRQm2Z/oJsx9loCXJJxp9HJkDad5qZg=;
	b=ksAkMrHVDV5Uktl8AazwsakYBeMeU8xOXVITvDggocGrbd2gOTpea/gsoLckmBj9aShWnt
	pImZt2Q8ONB9LiJ4+OrYvnpQ0+1pg6KzMGobTu5n5pUHbb8jbZzIbvgyB/lRe3ku4O+ZMV
	hqntZ4I8GYnJBTefltFzshb1q9vfCdg=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/2] Mini-OS: keep a positive list of externally visible symbols
Date: Wed,  1 Nov 2023 16:35:51 +0100
Message-Id: <20231101153551.11733-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101153551.11733-1-jgross@suse.com>
References: <20231101153551.11733-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a mini-os.map file containing all global symbols that are allowed
to be referenced by an application or library. Hide all other symbols
of Mini-OS from being visible externally.

The symbols in mini-os.map have been obtained via building all defined
and not failing stubdoms (caml-stubdom doesn't build).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Makefile    |   3 +-
 mini-os.map | 187 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 189 insertions(+), 1 deletion(-)
 create mode 100644 mini-os.map

diff --git a/Makefile b/Makefile
index 85c6db75..d4768110 100644
--- a/Makefile
+++ b/Makefile
@@ -164,8 +164,9 @@ endif
 $(OBJ_DIR)/arch/x86/minios-x86%.lds:  arch/x86/minios-x86.lds.S
 	$(CPP) $(ASFLAGS) -P $< -o $@
 
-$(OBJ_DIR)/$(TARGET)-kern.o: $(OBJS) arch_lib $(OBJ_DIR)/$(TARGET_ARCH_DIR)/minios-$(MINIOS_TARGET_ARCH).lds
+$(OBJ_DIR)/$(TARGET)-kern.o: $(OBJS) arch_lib $(OBJ_DIR)/$(TARGET_ARCH_DIR)/minios-$(MINIOS_TARGET_ARCH).lds mini-os.map
 	$(LD) -r $(LDFLAGS) $(HEAD_OBJ) $(OBJS) $(LDARCHLIB) -o $@
+	$(OBJCOPY) -w -G $(GLOBAL_PREFIX)* --keep-global-symbols=mini-os.map $@ $@
 
 $(OBJ_DIR)/$(TARGET): $(OBJ_DIR)/$(TARGET)-kern.o $(APP_O)
 	$(LD) -r $(LDFLAGS) $(OBJ_DIR)/$(TARGET)-kern.o $(APP_O) $(LDLIBS) -o $@.o
diff --git a/mini-os.map b/mini-os.map
new file mode 100644
index 00000000..b62806e1
--- /dev/null
+++ b/mini-os.map
@@ -0,0 +1,187 @@
+# Mini-OS symbols being externally visible
+# entry point
+_start
+# Mini-OS service functions
+alloc_fd
+alloc_file_type
+alloc_pages
+bind_virq
+block
+console_print
+create_thread
+do_map_frames
+free_pages
+get_file_from_fd
+hypercall_page
+event_queue
+evtchn_alloc_unbound
+evtchn_bind_interdomain
+evtchn_get_peercontext
+gntmap_fini
+gntmap_init
+gntmap_map_grant_refs
+gntmap_munmap
+gntmap_set_max_grants
+map_frames_ex
+mask_evtchn
+need_pgt
+printk
+schedule
+stop_kernel
+unbind_evtchn
+unmask_evtchn
+wake
+xencons_ring_avail
+xprintk
+__local_irq_restore
+__local_irq_save
+__udivdi3
+__udivmoddi4
+__umoddi3
+# libc
+accept
+bind
+chdir
+clock_gettime
+close
+closedir
+connect
+do_exit
+dup
+dup2
+execv
+fcntl
+fork
+fstat64
+fsync
+ftruncate
+getpagesize
+getpid
+getsockname
+getsockopt
+gettimeofday
+htonl
+htons
+inet_aton
+inet_ntoa
+isatty
+kill
+link
+listen
+lockf
+lseek64
+mkdir
+mmap64
+munmap
+nanosleep
+ntohl
+ntohs
+open64
+opendir
+openlog
+pipe
+poll
+posix_openpt
+read
+readdir
+recv
+rmdir
+sbrk
+select
+select_read_flag
+send
+sendto
+setsid
+setsockopt
+sigaction
+sleep
+socket
+stat
+sysconf
+syslog
+tcgetattr
+tcsetattr
+umask
+unlink
+usleep
+waitpid
+write
+_exit
+_fini
+_init
+___lock_acquire
+___lock_acquire_recursive
+___lock_init_recursive
+___lock_release
+___lock_release_recursive
+# 9pfront driver
+init_9pfront
+# blkfront driver
+blkfront_aio
+blkfront_aio_poll
+blkfront_aio_push_operation
+blkfront_io
+blkfront_open
+blkfront_queue
+blkfront_sync
+init_blkfront
+shutdown_blkfront
+# fbfront driver
+fbfront_open
+fbfront_receive
+fbfront_resize
+fbfront_update
+init_fbfront
+shutdown_fbfront
+# kbdfront driver
+init_kbdfront
+kbdfront_open
+kbdfront_receive
+shutdown_kbdfront
+# netfront driver
+init_netfront
+netfront_receive
+netfront_tap_open
+netfront_xmit
+networking_set_addr
+shutdown_netfront
+# pcifront driver
+pcifront_conf_read
+pcifront_conf_write
+pcifront_scan
+shutdown_pcifront
+# tpmback driver
+init_tpmback
+shutdown_tpmback
+tpmback_get_opaque
+tpmback_get_peercontext
+tpmback_get_uuid
+tpmback_req_any
+tpmback_resp
+tpmback_set_opaque
+# tpmfront driver
+init_tpmfront
+shutdown_tpmfront
+tpmfront_cmd
+tpmfront_open
+# tpm_tis driver
+init_tpm_tis
+init_tpm2_tis
+tpm_tis_open
+tpm_tis_request_locality
+# xenbus driver
+xenbus_ls
+xenbus_read
+xenbus_wait_for_watch
+xenbus_watch_path_token
+xenbus_unwatch_path_token
+xs_daemon_open
+xs_directory
+xs_fileno
+xs_get_domain_path
+xs_read
+xs_read_watch
+xs_rm
+xs_unwatch
+xs_watch
+xs_write
-- 
2.35.3


