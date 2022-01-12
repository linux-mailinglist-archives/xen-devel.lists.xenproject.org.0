Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B10B48C89E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 17:42:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256747.440771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7gh0-0006x3-C4; Wed, 12 Jan 2022 16:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256747.440771; Wed, 12 Jan 2022 16:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7gh0-0006to-8n; Wed, 12 Jan 2022 16:41:46 +0000
Received: by outflank-mailman (input) for mailman id 256747;
 Wed, 12 Jan 2022 16:41:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytoJ=R4=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1n7ggz-0006Zx-1p
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 16:41:45 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86aa41ae-73c6-11ec-bd6f-bfb69f65cdc7;
 Wed, 12 Jan 2022 17:41:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 17D161F3A3;
 Wed, 12 Jan 2022 16:41:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CDBB813BE6;
 Wed, 12 Jan 2022 16:41:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FLEHMMcE32HATAAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Wed, 12 Jan 2022 16:41:43 +0000
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
X-Inumbo-ID: 86aa41ae-73c6-11ec-bd6f-bfb69f65cdc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642005704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oqPxnpqVpg7+ZYnFXNDLlT5wDVvRC/DohNLeViPfz9I=;
	b=o7UjMZMAn2RHLUfPI7b6G/Phj+NqEBug1EBKWEpZqDAukpIwTKmIC0Q8X9NPgz4DwevFIW
	yZgHuKNFEkkGSlFyej1THoCNs/NVFXV+RdhdNIYl7X63T1WisCwfrzv9kP5GivIGYWz3DI
	E0rhY8HZaqdnpONpYnkeKux48PuUWwU=
Subject: [PATCH 2/2] tools/libs/light: don't touch nr_vcpus_out if listing
 vcpus and returning NULL
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Cc: James Fehlig <jfehlig@suse.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Date: Wed, 12 Jan 2022 17:41:42 +0100
Message-ID: <164200570276.24755.1849386285622380597.stgit@work>
In-Reply-To: <164200566223.24755.262723784847161301.stgit@work>
References: <164200566223.24755.262723784847161301.stgit@work>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

If we are in libvxl_list_vcpu() and we are returning NULL, let's avoid
touching the output parameter *nr_vcpus_out (which should contain the
number of vcpus in the list). Ideally, the caller initialized it to 0,
which is therefore consistent with us returning NULL (or, as an alternative,
we can explicitly set it to 0 if we're returning null... But just not
touching it seems the best behavior).

In fact, the current behavior is especially problematic if, for
instance, a domain is destroyed after we have done some steps of the
for() loop. In which case, calls like xc_vcpu_getinfo() or
xc_vcpu_getaffinity() will start to fail, and we return back to the
caller inconsistent information, such as a NULL list of vcpus, but a
modified and not 0 any longer, number of vcpus in the list.

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
Tested-by: James Fehlig <jfehlig@suse.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
---
 tools/libs/light/libxl_domain.c |   14 ++++++++------
 tools/libs/light/libxl_numa.c   |    4 +++-
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 544a9bf59d..aabc264e16 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -1661,6 +1661,7 @@ libxl_vcpuinfo *libxl_list_vcpu(libxl_ctx *ctx, uint32_t domid,
     libxl_vcpuinfo *ptr, *ret;
     xc_domaininfo_t domaininfo;
     xc_vcpuinfo_t vcpuinfo;
+    int nr_vcpus;
 
     if (xc_domain_getinfolist(ctx->xch, domid, 1, &domaininfo) != 1) {
         LOGED(ERROR, domid, "Getting infolist");
@@ -1677,27 +1678,27 @@ libxl_vcpuinfo *libxl_list_vcpu(libxl_ctx *ctx, uint32_t domid,
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
@@ -1705,6 +1706,7 @@ libxl_vcpuinfo *libxl_list_vcpu(libxl_ctx *ctx, uint32_t domid,
         ptr->vcpu_time = vcpuinfo.cpu_time;
     }
     GC_FREE;
+    *nr_vcpus_out = nr_vcpus;
     return ret;
 
 err:
diff --git a/tools/libs/light/libxl_numa.c b/tools/libs/light/libxl_numa.c
index 3679028c79..b04e3917a0 100644
--- a/tools/libs/light/libxl_numa.c
+++ b/tools/libs/light/libxl_numa.c
@@ -219,8 +219,10 @@ static int nr_vcpus_on_nodes(libxl__gc *gc, libxl_cputopology *tinfo,
             goto next;
 
         vinfo = libxl_list_vcpu(CTX, dinfo[i].domid, &nr_dom_vcpus, &nr_cpus);
-        if (vinfo == NULL)
+        if (vinfo == NULL) {
+            assert(nr_dom_vcpus == 0);
             goto next;
+        }
 
         /* Retrieve the domain's node-affinity map */
         libxl_domain_get_nodeaffinity(CTX, dinfo[i].domid, &dom_nodemap);



