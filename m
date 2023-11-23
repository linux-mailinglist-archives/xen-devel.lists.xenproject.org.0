Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C227F6B34
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 05:18:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640122.997958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6NdR-0002aW-9I; Fri, 24 Nov 2023 04:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640122.997958; Fri, 24 Nov 2023 04:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6NdR-0002XX-6G; Fri, 24 Nov 2023 04:17:45 +0000
Received: by outflank-mailman (input) for mailman id 640122;
 Fri, 24 Nov 2023 04:17:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUjn=HF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r6NdP-0002UR-7i
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 04:17:43 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 689eb9fc-8a80-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 05:17:41 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 292AD1FD9A;
 Thu, 23 Nov 2023 16:08:18 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id E578D13A82;
 Thu, 23 Nov 2023 16:08:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id M0LINvF4X2UXFgAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 23 Nov 2023 16:08:17 +0000
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
X-Inumbo-ID: 689eb9fc-8a80-11ee-98e2-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 2/2] Mini-OS: keep a positive list of externally visible symbols
Date: Thu, 23 Nov 2023 17:08:04 +0100
Message-Id: <20231123160804.17621-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231123160804.17621-1-jgross@suse.com>
References: <20231123160804.17621-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++++++++++++
X-Spam-Score: 15.00
X-Rspamd-Server: rspamd1
X-Spam-Level: ***************
X-Rspamd-Queue-Id: 292AD1FD9A
X-Spam-Flag: YES
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Spamd-Result: default: False [15.00 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam: Yes

Add a mini-os.map file containing all global symbols that are allowed
to be referenced by an application or library. Hide all other symbols
of Mini-OS from being visible externally.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- added more symbols (Samuel Thibault)
- sorted symbols in each section alphabetically
---
 Makefile    |   3 +-
 mini-os.map | 295 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 297 insertions(+), 1 deletion(-)
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
index 00000000..58a3a0ee
--- /dev/null
+++ b/mini-os.map
@@ -0,0 +1,295 @@
+# Mini-OS symbols being externally visible
+# entry point
+_start
+# Mini-OS service functions
+alloc_fd
+alloc_file_type
+alloc_pages
+bind_pirq
+bind_virq
+block
+clear_evtchn
+console_print
+create_thread
+do_map_frames
+event_queue
+evtchn_alloc_unbound
+evtchn_bind_interdomain
+evtchn_get_peercontext
+exit_thread
+free_pages
+get_domid
+get_file_from_fd
+gntmap_fini
+gntmap_init
+gntmap_map_grant_refs
+gntmap_munmap
+gntmap_set_max_grants
+gnttabop_error
+gnttab_alloc_and_grant
+gnttab_grant_access
+gnttab_grant_transfer
+gnttab_end_transfer
+gnttab_end_access
+hypercall_page
+ioremap
+ioremap_nocache
+iounmap
+map_frames_ex
+map_frame_rw
+map_frame_virt
+mask_evtchn
+msleep
+need_pgt
+printk
+schedule
+stop_kernel
+unbind_evtchn
+unmap_frames
+unmask_evtchn
+wake
+xencons_ring_avail
+xprintk
+__local_irq_restore
+__local_irq_save
+# libgcc
+__divdi3
+__moddi3
+__qdivrem
+__udivdi3
+__udivmoddi4
+__umoddi3
+# libc
+accept
+bind
+cfmakeraw
+chdir
+clock_gettime
+close
+closedir
+closelog
+connect
+do_exit
+dup
+dup2
+err
+errx
+execv
+fcntl
+ffs
+ffsl
+ffsll
+fork
+free
+fstat64
+fsync
+ftruncate
+getegid
+geteuid
+getgid
+gethostname
+getpagesize
+getpeername
+getpid
+getsockname
+getsockopt
+gettimeofday
+getuid
+htonl
+htons
+inet_aton
+inet_ntoa
+ioctl
+isatty
+kill
+link
+listen
+lockf
+lseek64
+malloc
+memcmp
+memcpy
+memset
+mkdir
+mmap64
+munmap
+nanosleep
+nice
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
+realloc
+recv
+recvfrom
+rmdir
+sbrk
+scnprintf
+select
+select_read_flag
+send
+sendto
+setsid
+setsockopt
+shutdown
+sigaction
+sleep
+snprintf
+socket
+sprintf
+sscanf
+stat
+strcat
+strchr
+strcmp
+strcpy
+strdup
+strlen
+strncmp
+strncpy
+strnlen
+strrchr
+strstr
+strtoq
+strtoul
+strtouq
+sysconf
+syslog
+tcgetattr
+tcsetattr
+umask
+unlink
+usleep
+verr
+verrx
+vscnprintf
+vsnprintf
+vsprintf
+vsscanf
+vsyslog
+vwarn
+vwarnx
+waitpid
+warn
+warnx
+write
+_ctype
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
+shutdown_9pfront
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
+netfront_get_gateway
+netfront_get_netmask
+netfront_receive
+netfront_tap_open
+netfront_xmit
+networking_set_addr
+resume_netfront
+shutdown_netfront
+start_networking
+stop_networking
+suspend_netfront
+# pcifront driver
+init_pcifront
+pcifront_conf_read
+pcifront_conf_write
+pcifront_disable_msi
+pcifront_disable_msix
+pcifront_enable_msi
+pcifront_enable_msix
+pcifront_op
+pcifront_scan
+shutdown_pcifront
+# tpmback driver
+init_tpmback
+shutdown_tpmback
+tpmback_get_opaque
+tpmback_get_peercontext
+tpmback_get_uuid
+tpmback_num_frontends
+tpmback_req
+tpmback_req_any
+tpmback_resp
+tpmback_set_opaque
+tpmback_wait_for_frontend_connect
+# tpmfront driver
+init_tpmfront
+shutdown_tpmfront
+tpmfront_cmd
+tpmfront_open
+tpmfront_set_locality
+# tpm_tis driver
+init_tpm_tis
+init_tpm2_tis
+tpm_tis_cmd
+tpm_tis_open
+tpm_tis_request_locality
+# xenbus driver
+xenbus_get_perms
+xenbus_get_self_id
+xenbus_ls
+xenbus_msg_reply
+xenbus_printf
+xenbus_read
+xenbus_read_integer
+xenbus_read_uuid
+xenbus_rm
+xenbus_set_perms
+xenbus_transaction_end
+xenbus_switch_state
+xenbus_transaction_start
+xenbus_unwatch_path_token
+xenbus_wait_for_state_change
+xenbus_wait_for_value
+xenbus_wait_for_watch
+xenbus_wait_for_watch_return
+xenbus_watch_path_token
+xenbus_write
+xenstore_buf
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


