Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ADEC76032
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 20:14:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167739.1493979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMA6Q-0007oe-2Z; Thu, 20 Nov 2025 19:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167739.1493979; Thu, 20 Nov 2025 19:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMA6P-0007mK-Ve; Thu, 20 Nov 2025 19:13:57 +0000
Received: by outflank-mailman (input) for mailman id 1167739;
 Thu, 20 Nov 2025 19:13:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r49+=54=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vMA6O-000753-ML
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 19:13:56 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e42a204-c645-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 20:13:55 +0100 (CET)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-399-AavvAK_sPLGzx3xXYBncyQ-1; Thu,
 20 Nov 2025 14:13:48 -0500
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 72F7B19541AF; Thu, 20 Nov 2025 19:13:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.18])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8119818004D8; Thu, 20 Nov 2025 19:13:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5665A21E66F8; Thu, 20 Nov 2025 20:13:39 +0100 (CET)
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
X-Inumbo-ID: 0e42a204-c645-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763666034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sx8qN/rQg9K32+B1nXrTKMNVKMJAAYsg2jr2Y0IDjq8=;
	b=DFOVozpAYzD+t0FujRAcOCAfPewNE2e5it49JKz0kujGIOnyQkIErJbTP5vnujkNf5ckDw
	6aZBJv6sO/PJDqHr6wJr3Ws4cfw7wVKw25xrVJbPfg0bXTnTxbHl9irVo2we1P5JXcPSAa
	5pQGn2iQ7A5Njm+6yz7XgUaJNpF2tc8=
X-MC-Unique: AavvAK_sPLGzx3xXYBncyQ-1
X-Mimecast-MFC-AGG-ID: AavvAK_sPLGzx3xXYBncyQ_1763666024
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com,
	pizhenwei@bytedance.com,
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
Subject: [PATCH 04/14] qga: Use error_setg_file_open() for better error messages
Date: Thu, 20 Nov 2025 20:13:29 +0100
Message-ID: <20251120191339.756429-5-armbru@redhat.com>
In-Reply-To: <20251120191339.756429-1-armbru@redhat.com>
References: <20251120191339.756429-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Error messages change from

    open("FNAME"): REASON

to

    Could not open 'FNAME': REASON

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qga/commands-linux.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/qga/commands-linux.c b/qga/commands-linux.c
index 4a09ddc760..5cf76ca2d9 100644
--- a/qga/commands-linux.c
+++ b/qga/commands-linux.c
@@ -1502,14 +1502,15 @@ static void transfer_vcpu(GuestLogicalProcessor *vcpu, bool sys2vcpu,
 
     dirfd = open(dirpath, O_RDONLY | O_DIRECTORY);
     if (dirfd == -1) {
-        error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
+        error_setg_file_open(errp, errno, dirpath);
         return;
     }
 
     fd = openat(dirfd, fn, sys2vcpu ? O_RDONLY : O_RDWR);
     if (fd == -1) {
         if (errno != ENOENT) {
-            error_setg_errno(errp, errno, "open(\"%s/%s\")", dirpath, fn);
+            error_setg_errno(errp, errno, "could not open %s/%s",
+                             dirpath, fn);
         } else if (sys2vcpu) {
             vcpu->online = true;
             vcpu->can_offline = false;
@@ -1711,7 +1712,7 @@ static void transfer_memory_block(GuestMemoryBlock *mem_blk, bool sys2memblk,
     dirfd = open(dirpath, O_RDONLY | O_DIRECTORY);
     if (dirfd == -1) {
         if (sys2memblk) {
-            error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
+            error_setg_file_open(errp, errno, dirpath);
         } else {
             if (errno == ENOENT) {
                 result->response = GUEST_MEMORY_BLOCK_RESPONSE_TYPE_NOT_FOUND;
@@ -1936,7 +1937,7 @@ static GuestDiskStatsInfoList *guest_get_diskstats(Error **errp)
 
     fp = fopen(diskstats, "r");
     if (fp  == NULL) {
-        error_setg_errno(errp, errno, "open(\"%s\")", diskstats);
+        error_setg_file_open(errp, errno, diskstats);
         return NULL;
     }
 
@@ -2047,7 +2048,7 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
 
     fp = fopen(cpustats, "r");
     if (fp  == NULL) {
-        error_setg_errno(errp, errno, "open(\"%s\")", cpustats);
+        error_setg_file_open(errp, errno, cpustats);
         return NULL;
     }
 
-- 
2.49.0


