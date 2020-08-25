Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 053BF251FE3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 21:23:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAeWL-00059w-0Q; Tue, 25 Aug 2020 19:22:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T2Dk=CD=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1kAeWJ-00059r-LI
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 19:22:11 +0000
X-Inumbo-ID: a81174e7-8075-40ab-b28c-221946bd4fbb
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a81174e7-8075-40ab-b28c-221946bd4fbb;
 Tue, 25 Aug 2020 19:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598383330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gt9CkYOq+0Pj+lGSQx+WwU97aF/UrPO4DGjM+V9JbnQ=;
 b=EsnhRAVhVMdE2moj4OJ/9AogXDQFWKup/EF32hZpwSXP93O/ZkJSwOlzavTs42dJUNL/48
 bkHJSpHVOevwR7HjfcgjfYwWOsIb66Z89RhBe82zO9PX/dlpqQC6lLIxs6YPFhTwntcA0d
 Gm+GgjGp/K4lq6rtRLdRX+m5FSuLxUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-LmtCgHTNNt6Nq-wwtzGAIw-1; Tue, 25 Aug 2020 15:22:06 -0400
X-MC-Unique: LmtCgHTNNt6Nq-wwtzGAIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CD2F51AE;
 Tue, 25 Aug 2020 19:22:05 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA67A7A40D;
 Tue, 25 Aug 2020 19:22:04 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
Subject: [PATCH v3 26/74] xen-legacy-backend: Add missing typedef
 XenLegacyDevice
Date: Tue, 25 Aug 2020 15:20:22 -0400
Message-Id: <20200825192110.3528606-27-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-1-ehabkost@redhat.com>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The typedef was used in the XENBACKEND_DEVICE macro, but it was
never defined.  Define the typedef close to the type checking
macro.

Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3: none

Changes series v1 -> v2: new patch in series v2

---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org
Cc: qemu-devel@nongnu.org
---
 include/hw/xen/xen-legacy-backend.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index 5e6c56c4d6..704bc7852b 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -9,6 +9,7 @@
 #define TYPE_XENSYSBUS "xen-sysbus"
 #define TYPE_XENBACKEND "xen-backend"
 
+typedef struct XenLegacyDevice XenLegacyDevice;
 #define XENBACKEND_DEVICE(obj) \
     OBJECT_CHECK(XenLegacyDevice, (obj), TYPE_XENBACKEND)
 
-- 
2.26.2


