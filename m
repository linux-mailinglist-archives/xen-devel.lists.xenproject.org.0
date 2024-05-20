Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4CD8C9EDD
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 16:34:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726172.1130417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s945S-0003Ig-36; Mon, 20 May 2024 14:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726172.1130417; Mon, 20 May 2024 14:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s945S-0003GC-0N; Mon, 20 May 2024 14:34:02 +0000
Received: by outflank-mailman (input) for mailman id 726172;
 Mon, 20 May 2024 14:34:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+3cx=MX=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s945Q-0003G6-1O
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 14:34:00 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd81f8d0-16b5-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 16:33:57 +0200 (CEST)
Received: from mail.solinno.uk (localhost [127.0.0.1])
 by doppler.solinno.uk (Postfix) with ESMTP id 922B38006F;
 Mon, 20 May 2024 15:33:56 +0100 (BST)
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
X-Inumbo-ID: fd81f8d0-16b5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1716215636;
	bh=umNSVV7br+LWKfpTsCOsdtnYlHjj/kq7PBIz0k7y5gM=;
	h=Date:From:To:Cc:Subject:From;
	b=g0q7NgJmLs1wkcowodrDQ9+3ZDBeSjCIzLXEkKc49Lijx2vkEr9VMOerwi3p3u2wc
	 AbETm2LaYC+JFh9UzVEf2QNUr0o8WjOZs6bQE5K3ZBD/kV1dpKE3fRnYEtFweuEU8M
	 Td3W12JjWyp/Vbz7JQtdD9JRuY+cDxjLan0SLUhY=
MIME-Version: 1.0
Date: Mon, 20 May 2024 15:33:56 +0100
From: Leigh Brown <leigh@solinno.co.uk>
To: Xen Devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk
 <jandryuk@gmail.com>
Subject: xl list -l aborts with double free error with vlan patches
Message-ID: <0d8fbde01bedf97dcd7540ceea6c42ab@solinno.co.uk>
X-Sender: leigh@solinno.co.uk
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hello,

When running xl list -l with my VLAN patches applied, a double free 
error is raised. I'm unable to determine why.

broken: 0cc01c603f4287233715a526b056bc20e0e97412 (HEAD) tools/xl: add 
vlan keyword to vif option
okay:   3bc14e4fa4b9832888710759a7dbe5f0d239f33b tools/libs/light: Add 
vlan field to libxl_device_nic
okay:   e27fc7d15eab79e604e8b8728778594accc23cf1 tools/xentop: Fix cpu% 
sort order

Any suggestions appreciated...

Debug run and backtrace:

(gdb) run -vvvv list -l
Starting program: /usr/sbin/xl -vvvv list -l
[Thread debugging using libthread_db enabled]
Using host libthread_db library 
"/lib/x86_64-linux-gnu/libthread_db.so.1".
libxl: debug: libxl_domain.c:2295:libxl_retrieve_domain_configuration: 
ao 0x555555592f50: create: how=(nil) callback=(nil) 
poller=0x55555559dde0
[Detaching after fork from child process 1044]
libxl: debug: libxl_domain.c:2311:libxl_retrieve_domain_configuration: 
ao 0x555555592f50: inprogress: poller=0x55555559dde0, flags=i
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end: No 
vbd from xenstore
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end: No 
vif from xenstore
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end: No 
vtpm from xenstore
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end: No 
vusb from xenstore
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end: No 
vusb from xenstore
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end: No 
pci from xenstore
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end: No 
vdispl from xenstore
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end: No 
vsnd from xenstore
libxl: debug: libxl_qmp.c:1920:libxl__ev_qmp_dispose:  ev 0x5555555a0240
libxl: debug: libxl_event.c:2067:libxl__ao_complete: ao 0x555555592f50: 
complete, rc=0
libxl: debug: libxl_event.c:2036:libxl__ao__destroy: ao 0x555555592f50: 
destroy
libxl: debug: libxl_domain.c:2295:libxl_retrieve_domain_configuration: 
Domain 1:ao 0x55555559f830: create: how=(nil) callback=(nil) 
poller=0x55555559dde0
[Detaching after fork from child process 1045]
libxl: debug: libxl_domain.c:2311:libxl_retrieve_domain_configuration: 
Domain 1:ao 0x55555559f830: inprogress: poller=0x55555559dde0, flags=i
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end: 
Domain 1:No vtpm from xenstore
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end: 
Domain 1:No vusb from xenstore
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end: 
Domain 1:No vusb from xenstore
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end: 
Domain 1:No pci from xenstore
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end: 
Domain 1:No vdispl from xenstore
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end: 
Domain 1:No vsnd from xenstore
libxl: debug: libxl_qmp.c:1920:libxl__ev_qmp_dispose: Domain 1: ev 
0x5555555a2820
libxl: debug: libxl_event.c:2067:libxl__ao_complete: ao 0x55555559f830: 
complete, rc=0
libxl: debug: libxl_event.c:2036:libxl__ao__destroy: ao 0x55555559f830: 
destroy
free(): double free detected in tcache 2

Program received signal SIGABRT, Aborted.
__pthread_kill_implementation (threadid=<optimized out>, 
signo=signo@entry=6, no_tid=no_tid@entry=0) at ./nptl/pthread_kill.c:44
44	./nptl/pthread_kill.c: No such file or directory.
(gdb) bt
#0  __pthread_kill_implementation (threadid=<optimized out>, 
signo=signo@entry=6, no_tid=no_tid@entry=0) at ./nptl/pthread_kill.c:44
#1  0x00007ffff7d5de8f in __pthread_kill_internal (signo=6, 
threadid=<optimized out>) at ./nptl/pthread_kill.c:78
#2  0x00007ffff7d0efb2 in __GI_raise (sig=sig@entry=6) at 
../sysdeps/posix/raise.c:26
#3  0x00007ffff7cf9472 in __GI_abort () at ./stdlib/abort.c:79
#4  0x00007ffff7d52430 in __libc_message (action=action@entry=do_abort, 
fmt=fmt@entry=0x7ffff7e6c459 "%s\n") at 
../sysdeps/posix/libc_fatal.c:155
#5  0x00007ffff7d677aa in malloc_printerr (str=str@entry=0x7ffff7e6f098 
"free(): double free detected in tcache 2") at ./malloc/malloc.c:5660
#6  0x00007ffff7d69a36 in _int_free (av=0x7ffff7ea5c60 <main_arena>, 
p=0x5555555a0f90, have_lock=have_lock@entry=0) at ./malloc/malloc.c:4469
#7  0x00007ffff7d6be8f in __GI___libc_free (mem=<optimized out>) at 
./malloc/malloc.c:3385
#8  0x00007ffff7f160a3 in libxl__free_all (gc=gc@entry=0x55555559f870) 
at libxl_internal.c:86
#9  0x00007ffff7f27c11 in libxl__ao__destroy (ctx=0x555555591850, 
ao=ao@entry=0x55555559f830) at libxl_event.c:2039
#10 0x00007ffff7f27c3e in ao__check_destroy (ctx=<optimized out>, 
ao=ao@entry=0x55555559f830) at libxl_event.c:2028
#11 0x00007ffff7f27c76 in ao__manip_leave (ctx=<optimized out>, 
ao=ao@entry=0x55555559f830) at libxl_event.c:2021
#12 0x00007ffff7f2948f in libxl__ao_inprogress 
(ao=ao@entry=0x55555559f830, file=file@entry=0x7ffff7f80866 
"libxl_domain.c", line=line@entry=2311,
     func=func@entry=0x7ffff7f814a0 <__func__.3> 
"libxl_retrieve_domain_configuration") at libxl_event.c:2235
#13 0x00007ffff7f46add in libxl_retrieve_domain_configuration 
(ctx=<optimized out>, domid=<optimized out>, 
d_config=d_config@entry=0x7fffffffe510, ao_how=ao_how@entry=0x0)
     at libxl_domain.c:2311
#14 0x00005555555744f2 in list_domains_details 
(info=info@entry=0x5555555aa1e0, nb_domain=2) at xl_info.c:479
#15 0x0000555555575e21 in main_list (argc=<optimized out>, 
argv=<optimized out>) at xl_info.c:582
#16 0x0000555555561b55 in main (argc=2, argv=0x7fffffffecd8) at xl.c:451

Regards,

Leigh.

