Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B3824ABDC
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 02:14:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8YDB-000294-Dc; Thu, 20 Aug 2020 00:13:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fDGF=B6=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1k8YD8-00028z-T7
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 00:13:43 +0000
X-Inumbo-ID: 1c053953-073a-461d-8caa-a92490552d7d
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1c053953-073a-461d-8caa-a92490552d7d;
 Thu, 20 Aug 2020 00:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597882421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w2kAY76AR05cPx8u6ATTtTSwuUtxJ9FSP0MTr/x0z40=;
 b=NzKgu2hJM5tji7+aWiyz2IplRWTbU6RablVHX4Yb0Qv2AVsZaJhw4Ln5E4r46pcCr7sLQr
 6+LYrRYzlINDfF8wjr5kHBIbX6J+Tw1fAn9GvhDTrY5+vANRlHwhRKyZjRhSPH20M0CCio
 v9emVk0Mk2si92R9DPzNMKSwctmzrg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-Ix3XGAAAPj2DyFPH0XsZjA-1; Wed, 19 Aug 2020 20:13:39 -0400
X-MC-Unique: Ix3XGAAAPj2DyFPH0XsZjA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 871178030A2;
 Thu, 20 Aug 2020 00:13:38 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E09B7DFFB;
 Thu, 20 Aug 2020 00:13:37 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
Subject: [PATCH v2 26/58] xen-legacy-backend: Add missing typedef
 XenLegacyDevice
Date: Wed, 19 Aug 2020 20:12:04 -0400
Message-Id: <20200820001236.1284548-27-ehabkost@redhat.com>
In-Reply-To: <20200820001236.1284548-1-ehabkost@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
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


