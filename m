Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CBC71A28E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 17:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542626.846742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4kBu-0005yo-27; Thu, 01 Jun 2023 15:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542626.846742; Thu, 01 Jun 2023 15:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4kBt-0005tC-U2; Thu, 01 Jun 2023 15:26:17 +0000
Received: by outflank-mailman (input) for mailman id 542626;
 Thu, 01 Jun 2023 15:26:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z77Y=BV=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1q4kBs-0004Rb-HQ
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 15:26:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a535f5d2-0090-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 17:26:15 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-A75QHkCMNk6EcxhtamKjMA-1; Thu, 01 Jun 2023 11:26:12 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27CDE817050;
 Thu,  1 Jun 2023 15:26:11 +0000 (UTC)
Received: from localhost (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F5AF492B0A;
 Thu,  1 Jun 2023 15:26:10 +0000 (UTC)
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
X-Inumbo-ID: a535f5d2-0090-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685633174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nZ5BNX4c5KUjeA09sd5fBjLXzeUNTb+dTFMcgwON1rg=;
	b=BFHsDHUkIrWf3l41Zyu7jxYurU3jZ8bY0FMP1m8w2SypsGhcCvPwDUrJOJ6XF5qRp5vshj
	hg2dleZ7RzAavlkJhmW+PP8E1eK/zLI87GQW1kVoB3c0O84KZilBDnXhjeIRxIaa/h0dh5
	CfsVXjySxHFrDloptWNkvZsVL/UVGxc=
X-MC-Unique: A75QHkCMNk6EcxhtamKjMA-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Thomas Huth <thuth@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Eric Blake <eblake@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Raphael Norwitz <raphael.norwitz@nutanix.com>,
	kvm@vger.kernel.org
Subject: [PULL 8/8] qapi: add '@fdset' feature for BlockdevOptionsVirtioBlkVhostVdpa
Date: Thu,  1 Jun 2023 11:25:52 -0400
Message-Id: <20230601152552.1603119-9-stefanha@redhat.com>
In-Reply-To: <20230601152552.1603119-1-stefanha@redhat.com>
References: <20230601152552.1603119-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10

From: Stefano Garzarella <sgarzare@redhat.com>

The virtio-blk-vhost-vdpa driver in libblkio 1.3.0 supports the fd
passing through the new 'fd' property.

Since now we are using qemu_open() on '@path' if the virtio-blk driver
supports the fd passing, let's announce it.
In this way, the management layer can pass the file descriptor of an
already opened vhost-vdpa character device. This is useful especially
when the device can only be accessed with certain privileges.

Add the '@fdset' feature only when the virtio-blk-vhost-vdpa driver
in libblkio supports it.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Message-id: 20230530071941.8954-3-sgarzare@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qapi/block-core.json | 6 ++++++
 meson.build          | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 98d9116dae..4bf89171c6 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3955,10 +3955,16 @@
 #
 # @path: path to the vhost-vdpa character device.
 #
+# Features:
+# @fdset: Member @path supports the special "/dev/fdset/N" path
+#     (since 8.1)
+#
 # Since: 7.2
 ##
 { 'struct': 'BlockdevOptionsVirtioBlkVhostVdpa',
   'data': { 'path': 'str' },
+  'features': [ { 'name' :'fdset',
+                  'if': 'CONFIG_BLKIO_VHOST_VDPA_FD' } ],
   'if': 'CONFIG_BLKIO' }
 
 ##
diff --git a/meson.build b/meson.build
index bc76ea96bf..a61d3e9b06 100644
--- a/meson.build
+++ b/meson.build
@@ -2106,6 +2106,10 @@ config_host_data.set('CONFIG_LZO', lzo.found())
 config_host_data.set('CONFIG_MPATH', mpathpersist.found())
 config_host_data.set('CONFIG_MPATH_NEW_API', mpathpersist_new_api)
 config_host_data.set('CONFIG_BLKIO', blkio.found())
+if blkio.found()
+  config_host_data.set('CONFIG_BLKIO_VHOST_VDPA_FD',
+                       blkio.version().version_compare('>=1.3.0'))
+endif
 config_host_data.set('CONFIG_CURL', curl.found())
 config_host_data.set('CONFIG_CURSES', curses.found())
 config_host_data.set('CONFIG_GBM', gbm.found())
-- 
2.40.1


