Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D66C760F3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 20:22:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167847.1494080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMAEE-0006MX-Fr; Thu, 20 Nov 2025 19:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167847.1494080; Thu, 20 Nov 2025 19:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMAEE-0006K0-CO; Thu, 20 Nov 2025 19:22:02 +0000
Received: by outflank-mailman (input) for mailman id 1167847;
 Thu, 20 Nov 2025 19:22:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r49+=54=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vMA6W-000753-2o
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 19:14:04 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1284e8f3-c645-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 20:14:02 +0100 (CET)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-203-b5T3lBd2OV2uCxy3edrDZw-1; Thu,
 20 Nov 2025 14:13:55 -0500
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 66F73195422D; Thu, 20 Nov 2025 19:13:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.18])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D535A1800984; Thu, 20 Nov 2025 19:13:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 87A9C21EC344; Thu, 20 Nov 2025 20:13:39 +0100 (CET)
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
X-Inumbo-ID: 1284e8f3-c645-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763666041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tDP8FM9QFpX4om5r6DeJVNNuFVvQYDlKs2mHtRlqAfQ=;
	b=bhL5jXuE7BzqC+kaQcGXbmf3+wuGd+buT1SjP4uXi96+XARZ0qk7VGi4w2/g3TV4nTco/B
	3zCtXq4e/IaRz8sjp2Mn6kB8MdIqlRAjlrrnPzLZ+fMofgJBBlyUGNTsBfP63lag8yw1Bq
	ZbFHV1VP9NGHBYDA1Ty+8RXs3ghflSk=
X-MC-Unique: b5T3lBd2OV2uCxy3edrDZw-1
X-Mimecast-MFC-AGG-ID: b5T3lBd2OV2uCxy3edrDZw_1763666026
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
Subject: [PATCH 13/14] qga/commands-win32: Use error_setg_win32() for better error messages
Date: Thu, 20 Nov 2025 20:13:38 +0100
Message-ID: <20251120191339.756429-14-armbru@redhat.com>
In-Reply-To: <20251120191339.756429-1-armbru@redhat.com>
References: <20251120191339.756429-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

We include numeric GetLastError() codes in error messages in a few
places, like this:

    error_setg(errp, "GRIPE: %d", (int)GetLastError());

Show text instead, like this:

    error_setg_win32(errp, GetLastError(), "GRIPE");

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qga/commands-win32.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index acc2c11589..0fd0c966e4 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -1798,8 +1798,8 @@ void qmp_guest_set_time(bool has_time, int64_t time_ns, Error **errp)
     tf.dwHighDateTime = (DWORD) (time >> 32);
 
     if (!FileTimeToSystemTime(&tf, &ts)) {
-        error_setg(errp, "Failed to convert system time %d",
-                   (int)GetLastError());
+        error_setg_win32(errp, GetLastError(),
+                         "Failed to convert system time");
         return;
     }
 
@@ -1810,7 +1810,8 @@ void qmp_guest_set_time(bool has_time, int64_t time_ns, Error **errp)
     }
 
     if (!SetSystemTime(&ts)) {
-        error_setg(errp, "Failed to set time to guest: %d", (int)GetLastError());
+        error_setg_win32(errp, GetLastError(),
+                         "Failed to set time to guest");
         return;
     }
 }
@@ -1834,13 +1835,12 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
         (length > sizeof(SYSTEM_LOGICAL_PROCESSOR_INFORMATION))) {
         ptr = pslpi = g_malloc0(length);
         if (GetLogicalProcessorInformation(pslpi, &length) == FALSE) {
-            error_setg(&local_err, "Failed to get processor information: %d",
-                       (int)GetLastError());
+            error_setg_win32(&local_err, GetLastError(),
+                             "Failed to get processor information");
         }
     } else {
-        error_setg(&local_err,
-                   "Failed to get processor information buffer length: %d",
-                   (int)GetLastError());
+        error_setg_win32(&local_err, GetLastError(),
+                         "Failed to get processor information buffer length");
     }
 
     while ((local_err == NULL) && (length > 0)) {
-- 
2.49.0


