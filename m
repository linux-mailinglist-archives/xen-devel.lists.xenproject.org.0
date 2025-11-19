Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4341EC6EB84
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 14:09:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165960.1492637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLhvt-0004BS-1G; Wed, 19 Nov 2025 13:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165960.1492637; Wed, 19 Nov 2025 13:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLhvs-0004A8-Rt; Wed, 19 Nov 2025 13:09:12 +0000
Received: by outflank-mailman (input) for mailman id 1165960;
 Wed, 19 Nov 2025 13:09:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aBqX=53=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vLhvr-0003iP-4Q
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 13:09:11 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef988f31-c548-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 14:09:10 +0100 (CET)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-55-fWja6XeyMdqUfO5drj9beA-1; Wed,
 19 Nov 2025 08:09:05 -0500
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 37A2A1800343; Wed, 19 Nov 2025 13:09:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.18])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4FCEF1800451; Wed, 19 Nov 2025 13:08:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 79C9C21E6935; Wed, 19 Nov 2025 14:08:55 +0100 (CET)
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
X-Inumbo-ID: ef988f31-c548-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763557749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D6teciZy8520fQI1QLTUyVGW20QyuWqmo6xWXoR980s=;
	b=NwMAWEPkE0StnviJUnR3Qs1gjynzrnenKXqiwyX9jtEbP3VlX+BtvTXUE/TzEG3nGjuJ6s
	Ky/wFjVf5PNFhPx56TlPqgmEQSG9xlEizZI3F1F7iEsAAP5Uzxav/75UBR5bXD9/znXyZ8
	AL2HOcKHrclsfjKEC1cw6bJEtz3cnPM=
X-MC-Unique: fWja6XeyMdqUfO5drj9beA-1
X-Mimecast-MFC-AGG-ID: fWja6XeyMdqUfO5drj9beA_1763557740
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	hreitz@redhat.com,
	mst@redhat.com,
	imammedo@redhat.com,
	anisinha@redhat.com,
	gengdongjiu1@gmail.com,
	peter.maydell@linaro.org,
	alistair@alistair23.me,
	edgar.iglesias@gmail.com,
	npiggin@gmail.com,
	harshpb@linux.ibm.com,
	palmer@dabbelt.com,
	liwei1518@gmail.com,
	dbarboza@ventanamicro.com,
	zhiwei_liu@linux.alibaba.com,
	sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	berrange@redhat.com,
	peterx@redhat.com,
	farosas@suse.de,
	eblake@redhat.com,
	vsementsov@yandex-team.ru,
	eduardo@habkost.net,
	marcel.apfelbaum@gmail.com,
	philmd@linaro.org,
	wangyanan55@huawei.com,
	zhao1.liu@intel.com,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/5] hw/core/loader: Make load_elf_hdr() return bool, simplify caller
Date: Wed, 19 Nov 2025 14:08:51 +0100
Message-ID: <20251119130855.105479-2-armbru@redhat.com>
In-Reply-To: <20251119130855.105479-1-armbru@redhat.com>
References: <20251119130855.105479-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/loader.h |  4 +++-
 hw/arm/boot.c       |  6 +-----
 hw/core/loader.c    |  8 ++++++--
 hw/riscv/spike.c    | 10 +---------
 4 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index d035e72748..6f91703503 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -188,8 +188,10 @@ ssize_t load_elf(const char *filename,
  *
  * Inspect an ELF file's header. Read its full header contents into a
  * buffer and/or determine if the ELF is 64bit.
+ *
+ * Returns true on success, false on failure.
  */
-void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp);
+bool load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp);
 
 ssize_t load_aout(const char *filename, hwaddr addr, int max_sz,
                   bool big_endian, hwaddr target_page_size);
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b91660208f..06b303aab8 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -766,16 +766,12 @@ static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
     int data_swab = 0;
     int elf_data_order;
     ssize_t ret;
-    Error *err = NULL;
 
-
-    load_elf_hdr(info->kernel_filename, &elf_header, &elf_is64, &err);
-    if (err) {
+    if (!load_elf_hdr(info->kernel_filename, &elf_header, &elf_is64, NULL)) {
         /*
          * If the file is not an ELF file we silently return.
          * The caller will fall back to try other formats.
          */
-        error_free(err);
         return -1;
     }
 
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 590c5b02aa..10687fe1c8 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -364,8 +364,9 @@ const char *load_elf_strerror(ssize_t error)
     }
 }
 
-void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp)
+bool load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp)
 {
+    bool ok = false;
     int fd;
     uint8_t e_ident_local[EI_NIDENT];
     uint8_t *e_ident;
@@ -380,7 +381,7 @@ void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp)
     fd = open(filename, O_RDONLY | O_BINARY);
     if (fd < 0) {
         error_setg_errno(errp, errno, "Failed to open file: %s", filename);
-        return;
+        return false;
     }
     if (read(fd, hdr, EI_NIDENT) != EI_NIDENT) {
         error_setg_errno(errp, errno, "Failed to read file: %s", filename);
@@ -415,8 +416,11 @@ void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp)
         off += br;
     }
 
+    ok = true;
+
 fail:
     close(fd);
+    return ok;
 }
 
 /* return < 0 if error, otherwise the number of bytes loaded in memory */
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index b0bab3fe00..8531e1d121 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -180,15 +180,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
 
 static bool spike_test_elf_image(char *filename)
 {
-    Error *err = NULL;
-
-    load_elf_hdr(filename, NULL, NULL, &err);
-    if (err) {
-        error_free(err);
-        return false;
-    } else {
-        return true;
-    }
+    return load_elf_hdr(filename, NULL, NULL, NULL);
 }
 
 static void spike_board_init(MachineState *machine)
-- 
2.49.0


