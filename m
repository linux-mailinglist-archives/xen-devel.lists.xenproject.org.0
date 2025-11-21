Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD743C78FB7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 13:15:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168993.1494908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMQ2W-0002U8-BU; Fri, 21 Nov 2025 12:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168993.1494908; Fri, 21 Nov 2025 12:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMQ2W-0002Oy-3V; Fri, 21 Nov 2025 12:15:00 +0000
Received: by outflank-mailman (input) for mailman id 1168993;
 Fri, 21 Nov 2025 12:14:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VODq=55=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vMQ2T-000110-SV
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 12:14:57 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae51edf8-c6d3-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 13:14:52 +0100 (CET)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-298-J3mo8o2FOba0ZJnznZes4g-1; Fri,
 21 Nov 2025 07:14:47 -0500
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6FF25180034A; Fri, 21 Nov 2025 12:14:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.3])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 05D4030044DC; Fri, 21 Nov 2025 12:14:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9569B21E66F8; Fri, 21 Nov 2025 13:14:38 +0100 (CET)
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
X-Inumbo-ID: ae51edf8-c6d3-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763727291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LvfjndzC9yIe2vReLTAtPHT920hAL1fUKXGYa8VIiFA=;
	b=BJJMHGu+w5E4AN7NpeSWwrF3qWHCBJvlkDXH3QtGT90VDyZt9VyhAH4euZzldULzIlyVuv
	tlYGc+KwV06walXr7khFsWIzWQRVM//hLDi+uQsasZA4/PfHRx/e4NIpsB7asDWxNHmFI2
	O5bWi/Q+3HXsyMXhXfxfEv8qYCfmpxk=
X-MC-Unique: J3mo8o2FOba0ZJnznZes4g-1
X-Mimecast-MFC-AGG-ID: J3mo8o2FOba0ZJnznZes4g_1763727284
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
Subject: [PATCH v2 04/15] tap-solaris: Use error_setg_file_open() for better error messages
Date: Fri, 21 Nov 2025 13:14:27 +0100
Message-ID: <20251121121438.1249498-5-armbru@redhat.com>
In-Reply-To: <20251121121438.1249498-1-armbru@redhat.com>
References: <20251121121438.1249498-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Error messages change from

    Can't open /dev/ip (actually /dev/udp)
    Can't open /dev/tap
    Can't open /dev/tap (2)

to

    Could not open '/dev/udp': REASON
    Could not open '/dev/tap': REASON

where REASON is the value of strerror(errno).

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dave@treblig.org>
---
 net/tap-solaris.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index 75397e6c54..faf7922ea8 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -87,13 +87,13 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
 
     ip_fd = RETRY_ON_EINTR(open("/dev/udp", O_RDWR, 0));
     if (ip_fd < 0) {
-        error_setg(errp, "Can't open /dev/ip (actually /dev/udp)");
+        error_setg_file_open(errp, errno, "/dev/udp");
         return -1;
     }
 
     tap_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
     if (tap_fd < 0) {
-        error_setg(errp, "Can't open /dev/tap");
+        error_setg_file_open(errp, errno, "/dev/tap");
         return -1;
     }
 
@@ -107,7 +107,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
 
     if_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
     if (if_fd < 0) {
-        error_setg(errp, "Can't open /dev/tap (2)");
+        error_setg_file_open(errp, errno, "/dev/tap");
         return -1;
     }
     if(ioctl(if_fd, I_PUSH, "ip") < 0){
-- 
2.49.0


