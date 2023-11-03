Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E75D7DFDE1
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 03:10:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627051.977912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyjdM-0003GC-5v; Fri, 03 Nov 2023 02:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627051.977912; Fri, 03 Nov 2023 02:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyjdM-0003BU-2s; Fri, 03 Nov 2023 02:10:04 +0000
Received: by outflank-mailman (input) for mailman id 627051;
 Fri, 03 Nov 2023 02:10:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ed2V=GQ=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1qyjdL-0002vm-1s
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 02:10:03 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1747ee2a-79ee-11ee-9b0e-b553b5be7939;
 Fri, 03 Nov 2023 03:09:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 3DFF220155;
 Fri,  3 Nov 2023 03:09:59 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qGrFA2YTBLNr; Fri,  3 Nov 2023 03:09:59 +0100 (CET)
Received: from begin.home (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id ECE1920152;
 Fri,  3 Nov 2023 03:09:58 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.97-RC3)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1qyjdG-00000000WiV-2HNv; Fri, 03 Nov 2023 03:09:58 +0100
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
X-Inumbo-ID: 1747ee2a-79ee-11ee-9b0e-b553b5be7939
Date: Fri, 3 Nov 2023 03:09:58 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 2/2] Mini-OS: keep a positive list of externally visible
 symbols
Message-ID: <20231103020958.4fwx75czgkwa5oxt@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231101153551.11733-1-jgross@suse.com>
 <20231101153551.11733-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231101153551.11733-3-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Hello,

Juergen Gross, le mer. 01 nov. 2023 16:35:51 +0100, a ecrit:
> The symbols in mini-os.map have been obtained via building all defined
> and not failing stubdoms (caml-stubdom doesn't build).
> 
> +++ b/mini-os.map
> @@ -0,0 +1,187 @@
> +# Mini-OS symbols being externally visible
> +# entry point
> +_start
> +# Mini-OS service functions
> +alloc_fd
> +alloc_file_type
> +alloc_pages
> +bind_virq

I believe we also want bind_pirq

> +block
> +console_print
> +create_thread

Also
exit_thread
msleep

> +do_map_frames
> +free_pages
> +get_file_from_fd
> +hypercall_page
> +event_queue
> +evtchn_alloc_unbound
> +evtchn_bind_interdomain
> +evtchn_get_peercontext
> +gntmap_fini
> +gntmap_init
> +gntmap_map_grant_refs
> +gntmap_munmap
> +gntmap_set_max_grants
> +map_frames_ex

I believe we also want
map_frame_rw
map_frame_virt
unmap_frames

> +mask_evtchn

I believe we also want
clear_evtchn

> +need_pgt
> +printk
> +schedule
> +stop_kernel
> +unbind_evtchn
> +unmask_evtchn
> +wake
> +xencons_ring_avail

Only this xencons_ function? It's very surprising being alone

> +xprintk
> +__local_irq_restore
> +__local_irq_save

I guess we also want

gnttab_alloc_and_grant
gnttab_grant_access
gnttab_grant_transfer
gnttab_end_transfer
gnttab_end_access
gnttabop_error

ioremap
ioremap_nocache
iounmap

> +__udivdi3
> +__udivmoddi4
> +__umoddi3

Please put those in a libgcc section.

> +# libc

There are quite a few more that we'll want here: at least all of the
string/stdio operations of include/lib.h include/posix/strings.h (for the case when we don't
have newlib's libc)

Also,

ioctl
shutdown
getpeername
recvfrom
closelog
vsyslog
err
errx
warn
warnx
verr
verrx
vwarn
vwarnx
getuid
geteuid
getgid
getegid
gethostname
nice
_ctype
malloc
realloc
free

> +accept
> +bind
> +chdir
> +clock_gettime
> +close
> +closedir
> +connect
> +do_exit
> +dup
> +dup2
> +execv
> +fcntl
> +fork
> +fstat64
> +fsync
> +ftruncate
> +getpagesize
> +getpid
> +getsockname
> +getsockopt
> +gettimeofday
> +htonl
> +htons
> +inet_aton
> +inet_ntoa
> +isatty
> +kill
> +link
> +listen
> +lockf
> +lseek64
> +mkdir
> +mmap64
> +munmap
> +nanosleep
> +ntohl
> +ntohs
> +open64
> +opendir
> +openlog
> +pipe
> +poll
> +posix_openpt
> +read
> +readdir
> +recv
> +rmdir
> +sbrk
> +select
> +select_read_flag
> +send
> +sendto
> +setsid
> +setsockopt
> +sigaction
> +sleep
> +socket
> +stat
> +sysconf
> +syslog
> +tcgetattr
> +tcsetattr

I believe we also want cfmakeraw

> +umask
> +unlink
> +usleep
> +waitpid
> +write
> +_exit
> +_fini
> +_init
> +___lock_acquire
> +___lock_acquire_recursive
> +___lock_init_recursive
> +___lock_release
> +___lock_release_recursive
> +# 9pfront driver
> +init_9pfront
> +# blkfront driver
> +blkfront_aio
> +blkfront_aio_poll
> +blkfront_aio_push_operation
> +blkfront_io
> +blkfront_open
> +blkfront_queue
> +blkfront_sync
> +init_blkfront
> +shutdown_blkfront
> +# fbfront driver
> +fbfront_open
> +fbfront_receive
> +fbfront_resize
> +fbfront_update
> +init_fbfront
> +shutdown_fbfront
> +# kbdfront driver
> +init_kbdfront
> +kbdfront_open
> +kbdfront_receive
> +shutdown_kbdfront
> +# netfront driver
> +init_netfront
> +netfront_receive
> +netfront_tap_open
> +netfront_xmit
> +networking_set_addr
> +shutdown_netfront

I believe we also want
netfront_get_netmask
netfront_get_gateway
suspend_netfront
resume_netfront
start_networking
stop_networking
networking_set_addr

> +# pcifront driver
> +pcifront_conf_read
> +pcifront_conf_write
> +pcifront_scan
> +shutdown_pcifront

I believe we also want
init_pcifront
pcifront_op
pcifront_enable_msi
pcifront_disable_msi
pcifront_enable_msix
pcifront_disable_msiX

> +# tpmback driver
> +init_tpmback
> +shutdown_tpmback
> +tpmback_get_opaque
> +tpmback_get_peercontext
> +tpmback_get_uuid
> +tpmback_req_any
> +tpmback_resp
> +tpmback_set_opaque

I believe we also want
tpmback_req
tpmback_wait_for_frontend_connect
tpmback_num_frontends

> +# tpmfront driver
> +init_tpmfront
> +shutdown_tpmfront
> +tpmfront_cmd
> +tpmfront_open

I believe we also want tpmfront_set_locality

> +# tpm_tis driver
> +init_tpm_tis
> +init_tpm2_tis
> +tpm_tis_open
> +tpm_tis_request_locality

I believe we also want tpm_tis_cmd

> +# xenbus driver
> +xenbus_ls
> +xenbus_read
> +xenbus_wait_for_watch
> +xenbus_watch_path_token
> +xenbus_unwatch_path_token

Also
xenbus_wait_for_watch_return
xenbus_wait_for_value
xenbus_wait_for_state_change
xenbus_switch_state
xenbus_write
xenbus_msg_reply
xenbus_rm
xenbus_get_perms
xenbus_set_perms
xenbus_transaction_start
xenbus_transaction_end
xenbus_read_integer
xenbus_read_uuid
xenbus_printf
xenbus_get_self_id

> +xs_daemon_open
> +xs_directory
> +xs_fileno
> +xs_get_domain_path
> +xs_read
> +xs_read_watch
> +xs_rm
> +xs_unwatch
> +xs_watch
> +xs_write
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

