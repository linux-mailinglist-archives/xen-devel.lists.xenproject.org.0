Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7343FC78F9B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 13:15:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168999.1494970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMQ2d-0004Il-QR; Fri, 21 Nov 2025 12:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168999.1494970; Fri, 21 Nov 2025 12:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMQ2d-00045Y-Af; Fri, 21 Nov 2025 12:15:07 +0000
Received: by outflank-mailman (input) for mailman id 1168999;
 Fri, 21 Nov 2025 12:15:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VODq=55=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vMQ2Z-000110-Tc
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 12:15:03 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b149dc15-c6d3-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 13:14:57 +0100 (CET)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-536-KEwxzFw_O_aBSQQYGuDLyQ-1; Fri,
 21 Nov 2025 07:14:50 -0500
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C1525195609D; Fri, 21 Nov 2025 12:14:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.3])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CDC6A18004D8; Fri, 21 Nov 2025 12:14:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C5B6E21E676A; Fri, 21 Nov 2025 13:14:38 +0100 (CET)
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
X-Inumbo-ID: b149dc15-c6d3-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763727296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PVQXGNJdcClwDB+2E7ow8Z/C597X2bSbqnOJ1Z7jY2c=;
	b=OKaPwC7W9p+RJO3bbOhb1UhQlXWpNMaGYLocKjUa5QkEAxuUzv2zZCUX3olBhzdmiZGnv9
	Z1qL6/EY4FJxL3DxUG2+5oImKuNQ7dqKC1sj37uJoJLY3g4oXkMENaRBqKKk82xwsHX/J/
	BVzXPzYz8W3jKHQjvlQcMlIpYo7vDjU=
X-MC-Unique: KEwxzFw_O_aBSQQYGuDLyQ-1
X-Mimecast-MFC-AGG-ID: KEwxzFw_O_aBSQQYGuDLyQ_1763727286
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com,
	zhenwei.pi@linux.dev,
	alistair.francis@wdc.com,
	stefanb@linux.vnet.ibm.com,
	kwolf@redhat.com,
	hreitz@redhat.com,
	sw@weilnetz.de,
	qemu_oss@crudebyte.com,
	groug@kaod.org,
	mst@redhat.com,
	imammedo@redhat.com,
	anisinha@redhat.com,
	kraxel@redhat.com,
	shentey@gmail.com,
	npiggin@gmail.com,
	harshpb@linux.ibm.com,
	sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	edgar.iglesias@gmail.com,
	elena.ufimtseva@oracle.com,
	jag.raman@oracle.com,
	sgarzare@redhat.com,
	pbonzini@redhat.com,
	fam@euphon.net,
	philmd@linaro.org,
	alex@shazbot.org,
	clg@redhat.com,
	peterx@redhat.com,
	farosas@suse.de,
	lizhijian@fujitsu.com,
	dave@treblig.org,
	jasowang@redhat.com,
	samuel.thibault@ens-lyon.org,
	michael.roth@amd.com,
	kkostiuk@redhat.com,
	zhao1.liu@intel.com,
	mtosatti@redhat.com,
	rathc@linux.ibm.com,
	palmer@dabbelt.com,
	liwei1518@gmail.com,
	dbarboza@ventanamicro.com,
	zhiwei_liu@linux.alibaba.com,
	marcandre.lureau@redhat.com,
	qemu-block@nongnu.org,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 12/15] error: Use error_setg_errno() to improve error messages
Date: Fri, 21 Nov 2025 13:14:35 +0100
Message-ID: <20251121121438.1249498-13-armbru@redhat.com>
In-Reply-To: <20251121121438.1249498-1-armbru@redhat.com>
References: <20251121121438.1249498-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

A few error messages show numeric errno codes.  Use error_setg_errno()
to show human-readable text instead.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 backends/cryptodev-lkcf.c   |  2 +-
 hw/ppc/spapr.c              |  6 +++---
 hw/vfio/migration-multifd.c |  5 +++--
 migration/rdma.c            |  3 +--
 net/l2tpv3.c                |  6 ++----
 target/riscv/kvm/kvm-cpu.c  | 11 ++++++-----
 6 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/backends/cryptodev-lkcf.c b/backends/cryptodev-lkcf.c
index 97a8a8812c..40c7bd3c5a 100644
--- a/backends/cryptodev-lkcf.c
+++ b/backends/cryptodev-lkcf.c
@@ -218,7 +218,7 @@ static void cryptodev_lkcf_init(CryptoDevBackend *backend, Error **errp)
     }
     lkcf->eventfd = eventfd(0, 0);
     if (lkcf->eventfd < 0) {
-        error_setg(errp, "Failed to create eventfd: %d", errno);
+        error_setg_errno(errp, errno, "Failed to create eventfd");
         return;
     }
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 99b843ba2f..cdab822c88 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2699,9 +2699,9 @@ static void spapr_set_vsmt_mode(SpaprMachineState *spapr, Error **errp)
         ret = kvmppc_set_smt_threads(spapr->vsmt);
         if (ret) {
             /* Looks like KVM isn't able to change VSMT mode */
-            error_setg(&local_err,
-                       "Failed to set KVM's VSMT mode to %d (errno %d)",
-                       spapr->vsmt, ret);
+            error_setg_errno(&local_err, -ret,
+                             "Failed to set KVM's VSMT mode to %d",
+                             spapr->vsmt);
             /* We can live with that if the default one is big enough
              * for the number of threads, and a submultiple of the one
              * we want.  In this case we'll waste some vcpu ids, but
diff --git a/hw/vfio/migration-multifd.c b/hw/vfio/migration-multifd.c
index e4785031a7..4a855f4e12 100644
--- a/hw/vfio/migration-multifd.c
+++ b/hw/vfio/migration-multifd.c
@@ -725,8 +725,9 @@ vfio_multifd_save_complete_precopy_thread(SaveCompletePrecopyThreadData *d,
         data_size = read(migration->data_fd, &packet->data,
                          migration->data_buffer_size);
         if (data_size < 0) {
-            error_setg(errp, "%s: reading state buffer %" PRIu32 " failed: %d",
-                       vbasedev->name, idx, errno);
+            error_setg_errno(errp, errno,
+                             "%s: reading state buffer %" PRIu32 " failed",
+                             vbasedev->name, idx);
             goto thread_exit;
         } else if (data_size == 0) {
             break;
diff --git a/migration/rdma.c b/migration/rdma.c
index 337b415889..9e301cf917 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -2349,8 +2349,7 @@ static int qemu_get_cm_event_timeout(RDMAContext *rdma,
         error_setg(errp, "RDMA ERROR: poll cm event timeout");
         return -1;
     } else if (ret < 0) {
-        error_setg(errp, "RDMA ERROR: failed to poll cm event, errno=%i",
-                   errno);
+        error_setg_errno(errp, errno, "RDMA ERROR: failed to poll cm event");
         return -1;
     } else if (poll_fd.revents & POLLIN) {
         if (rdma_get_cm_event(rdma->channel, cm_event) < 0) {
diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index cdfc641aa6..3044fa4608 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -639,13 +639,11 @@ int net_init_l2tpv3(const Netdev *netdev,
     }
     fd = socket(result->ai_family, result->ai_socktype, result->ai_protocol);
     if (fd == -1) {
-        fd = -errno;
-        error_setg(errp, "socket creation failed, errno = %d",
-                   -fd);
+        error_setg_errno(errp, errno, "socket creation failed");
         goto outerr;
     }
     if (bind(fd, (struct sockaddr *) result->ai_addr, result->ai_addrlen)) {
-        error_setg(errp, "could not bind socket err=%i", errno);
+        error_setg_errno(errp, errno, "could not bind socket");
         goto outerr;
     }
     if (!qemu_set_blocking(fd, false, errp)) {
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 47e672c7aa..c73f1cd5cf 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1996,8 +1996,8 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
     if (riscv_has_ext(&cpu->env, RVV)) {
         ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
         if (ret) {
-            error_setg(errp, "Error in prctl PR_RISCV_V_SET_CONTROL, code: %s",
-                       strerrorname_np(errno));
+            error_setg_errno(errp, errno,
+                             "Error in prctl PR_RISCV_V_SET_CONTROL");
             return false;
         }
     }
@@ -2032,7 +2032,8 @@ void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
         reg.addr = (uint64_t)&val;
         ret = ioctl(kvmcpu.cpufd, KVM_GET_ONE_REG, &reg);
         if (ret != 0) {
-            error_setg(errp, "Unable to read cbom_blocksize, error %d", errno);
+            error_setg(errp, errno,
+                       "Unable to read cbom_blocksize");
             return;
         }
 
@@ -2051,7 +2052,7 @@ void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
         reg.addr = (uint64_t)&val;
         ret = ioctl(kvmcpu.cpufd, KVM_GET_ONE_REG, &reg);
         if (ret != 0) {
-            error_setg(errp, "Unable to read cboz_blocksize, error %d", errno);
+            error_setg_errno(errp, errno, "Unable to read cboz_blocksize");
             return;
         }
 
@@ -2073,7 +2074,7 @@ void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
         reg.addr = (uint64_t)&val;
         ret = ioctl(kvmcpu.cpufd, KVM_GET_ONE_REG, &reg);
         if (ret != 0) {
-            error_setg(errp, "Unable to read vlenb register, error %d", errno);
+            error_setg_errno(errp, errno, "Unable to read vlenb register");
             return;
         }
 
-- 
2.49.0


