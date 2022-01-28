Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC78D49F598
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 09:49:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261890.453725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDMvW-0004mj-Ub; Fri, 28 Jan 2022 08:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261890.453725; Fri, 28 Jan 2022 08:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDMvW-0004jo-Qd; Fri, 28 Jan 2022 08:48:14 +0000
Received: by outflank-mailman (input) for mailman id 261890;
 Fri, 28 Jan 2022 08:48:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=STMZ=SM=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1nDMvV-0004ji-B7
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 08:48:13 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 062842b3-8017-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 09:48:12 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9012D21709;
 Fri, 28 Jan 2022 08:48:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B743D13A66;
 Fri, 28 Jan 2022 08:48:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PXH6Icmt82G6ZQAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Fri, 28 Jan 2022 08:48:09 +0000
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
X-Inumbo-ID: 062842b3-8017-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1643359691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JbbeLP0aFndZrYa+qtOS16mpujA3WDSJHYYzVCvj+vA=;
	b=DFKMOqyMPM3pkMeBGEeBlvySivcjkS/OXYKwTgf14Uc0DnKwZ/o9rdP/C0FNIY/9dVG2gH
	W0vvZPvUxnps+NQjdLZvIgE7XtBunJwyi9mgCwXzzLRNG5rs+d9gWewnwpiq+mASAUtN0/
	uUnTpJVgQo8N4BBZ+Q/i3+WLu7zKKL8=
Subject: [PATCH v2] tools/libs/light: don't touch nr_vcpus_out if listing
 vcpus and returning NULL
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Cc: James Fehlig <jfehlig@suse.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Date: Fri, 28 Jan 2022 09:48:05 +0100
Message-ID: <164335968477.24662.7673734521447971250.stgit@work>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

If we are in libxl_list_vcpu() and we are returning NULL, let's avoid
touching the output parameter *nr_vcpus_out, which the caller should
have initialized to 0.

The current behavior could be problematic if are creating a domain and,
in the meantime, an existing one is destroyed when we have already done
some steps of the loop. At which point, we'd return a NULL list of vcpus
but with something different than 0 as the number of vcpus in that list.
And this can cause troubles in the callers (e.g., nr_vcpus_on_nodes()),
when they do a libxl_vcpuinfo_list_free().

Crashes due to this are rare and difficult to reproduce, but have been
observed, with stack traces looking like this one:

#0  libxl_bitmap_dispose (map=map@entry=0x50) at libxl_utils.c:626
#1  0x00007fe72c993a32 in libxl_vcpuinfo_dispose (p=p@entry=0x38) at _libxl_types.c:692
#2  0x00007fe72c94e3c4 in libxl_vcpuinfo_list_free (list=0x0, nr=<optimized out>) at libxl_utils.c:1059
#3  0x00007fe72c9528bf in nr_vcpus_on_nodes (vcpus_on_node=0x7fe71000eb60, suitable_cpumap=0x7fe721df0d38, tinfo_elements=48, tinfo=0x7fe7101b3900, gc=0x7fe7101bbfa0) at libxl_numa.c:258
#4  libxl__get_numa_candidate (gc=gc@entry=0x7fe7100033a0, min_free_memkb=4233216, min_cpus=4, min_nodes=min_nodes@entry=0, max_nodes=max_nodes@entry=0, suitable_cpumap=suitable_cpumap@entry=0x7fe721df0d38, numa_cmpf=0x7fe72c940110 <numa_cmpf>, cndt_out=0x7fe721df0cf0, cndt_found=0x7fe721df0cb4) at libxl_numa.c:394
#5  0x00007fe72c94152b in numa_place_domain (d_config=0x7fe721df11b0, domid=975, gc=0x7fe7100033a0) at libxl_dom.c:209
#6  libxl__build_pre (gc=gc@entry=0x7fe7100033a0, domid=domid@entry=975, d_config=d_config@entry=0x7fe721df11b0, state=state@entry=0x7fe710077700) at libxl_dom.c:436
#7  0x00007fe72c92c4a5 in libxl__domain_build (gc=0x7fe7100033a0, d_config=d_config@entry=0x7fe721df11b0, domid=975, state=0x7fe710077700) at libxl_create.c:444
#8  0x00007fe72c92de8b in domcreate_bootloader_done (egc=0x7fe721df0f60, bl=0x7fe7100778c0, rc=<optimized out>) at libxl_create.c:1222
#9  0x00007fe72c980425 in libxl__bootloader_run (egc=egc@entry=0x7fe721df0f60, bl=bl@entry=0x7fe7100778c0) at libxl_bootloader.c:403
#10 0x00007fe72c92f281 in initiate_domain_create (egc=egc@entry=0x7fe721df0f60, dcs=dcs@entry=0x7fe7100771b0) at libxl_create.c:1159
#11 0x00007fe72c92f456 in do_domain_create (ctx=ctx@entry=0x7fe71001c840, d_config=d_config@entry=0x7fe721df11b0, domid=domid@entry=0x7fe721df10a8, restore_fd=restore_fd@entry=-1, send_back_fd=send_back_fd@entry=-1, params=params@entry=0x0, ao_how=0x0, aop_console_how=0x7fe721df10f0) at libxl_create.c:1856
#12 0x00007fe72c92f776 in libxl_domain_create_new (ctx=0x7fe71001c840, d_config=d_config@entry=0x7fe721df11b0, domid=domid@entry=0x7fe721df10a8, ao_how=ao_how@entry=0x0, aop_console_how=aop_console_how@entry=0x7fe721df10f0) at libxl_create.c:2075

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
Tested-by: James Fehlig <jfehlig@suse.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
---
This change should be backported to all supported branches.
---
Changes from v1:
- dropped patch 1; this one is enough of a fix
- removed an assert() deemed non necessary
- kept GC_FREE just before return in libxl_list_vcpu()
- nr_vcpus is now unsigned
- fix some typos
---
 tools/libs/light/libxl_domain.c |   14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 544a9bf59d..d438232117 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -1661,6 +1661,7 @@ libxl_vcpuinfo *libxl_list_vcpu(libxl_ctx *ctx, uint32_t domid,
     libxl_vcpuinfo *ptr, *ret;
     xc_domaininfo_t domaininfo;
     xc_vcpuinfo_t vcpuinfo;
+    unsigned int nr_vcpus;
 
     if (xc_domain_getinfolist(ctx->xch, domid, 1, &domaininfo) != 1) {
         LOGED(ERROR, domid, "Getting infolist");
@@ -1677,33 +1678,34 @@ libxl_vcpuinfo *libxl_list_vcpu(libxl_ctx *ctx, uint32_t domid,
     ret = ptr = libxl__calloc(NOGC, domaininfo.max_vcpu_id + 1,
                               sizeof(libxl_vcpuinfo));
 
-    for (*nr_vcpus_out = 0;
-         *nr_vcpus_out <= domaininfo.max_vcpu_id;
-         ++*nr_vcpus_out, ++ptr) {
+    for (nr_vcpus = 0;
+         nr_vcpus <= domaininfo.max_vcpu_id;
+         ++nr_vcpus, ++ptr) {
         libxl_bitmap_init(&ptr->cpumap);
         if (libxl_cpu_bitmap_alloc(ctx, &ptr->cpumap, 0))
             goto err;
         libxl_bitmap_init(&ptr->cpumap_soft);
         if (libxl_cpu_bitmap_alloc(ctx, &ptr->cpumap_soft, 0))
             goto err;
-        if (xc_vcpu_getinfo(ctx->xch, domid, *nr_vcpus_out, &vcpuinfo) == -1) {
+        if (xc_vcpu_getinfo(ctx->xch, domid, nr_vcpus, &vcpuinfo) == -1) {
             LOGED(ERROR, domid, "Getting vcpu info");
             goto err;
         }
 
-        if (xc_vcpu_getaffinity(ctx->xch, domid, *nr_vcpus_out,
+        if (xc_vcpu_getaffinity(ctx->xch, domid, nr_vcpus,
                                 ptr->cpumap.map, ptr->cpumap_soft.map,
                                 XEN_VCPUAFFINITY_SOFT|XEN_VCPUAFFINITY_HARD) == -1) {
             LOGED(ERROR, domid, "Getting vcpu affinity");
             goto err;
         }
-        ptr->vcpuid = *nr_vcpus_out;
+        ptr->vcpuid = nr_vcpus;
         ptr->cpu = vcpuinfo.cpu;
         ptr->online = !!vcpuinfo.online;
         ptr->blocked = !!vcpuinfo.blocked;
         ptr->running = !!vcpuinfo.running;
         ptr->vcpu_time = vcpuinfo.cpu_time;
     }
+    *nr_vcpus_out = nr_vcpus;
     GC_FREE;
     return ret;
 



