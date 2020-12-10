Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 864242D5C3C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 14:49:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49257.87095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMJn-0006jT-Hc; Thu, 10 Dec 2020 13:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49257.87095; Thu, 10 Dec 2020 13:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMJn-0006iu-DZ; Thu, 10 Dec 2020 13:49:15 +0000
Received: by outflank-mailman (input) for mailman id 49257;
 Thu, 10 Dec 2020 13:49:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nlUt=FO=redhat.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1knMJl-0006hu-QX
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:49:13 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 21b8f01f-55b9-48e6-bbe1-a4a823d5b3bd;
 Thu, 10 Dec 2020 13:49:13 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-tt29vyJuMMCsKfnRw_kDUw-1; Thu, 10 Dec 2020 08:49:08 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08B9315732;
 Thu, 10 Dec 2020 13:49:07 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E42817046C;
 Thu, 10 Dec 2020 13:48:52 +0000 (UTC)
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
X-Inumbo-ID: 21b8f01f-55b9-48e6-bbe1-a4a823d5b3bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607608153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7laBw/T720iHN/BJanY29fxaiafvWQ3ZmcJva9ZXuMM=;
	b=ANqaQT1lsdDYaddE5Ao3ia4AWUQA6ms+ISiHhRX+lcKKyTSCFUrGPnDEFz+eLKc5CF2UCA
	2mANAcMRDg5sCa1RoVnPdOfoJZ5xc/ec1phnziOgzQz1vEFZXc8EcMgVyu4driASHBiTm9
	Pbrh87A2JLiFpCt7MEJwhJmsipW8M2U=
X-MC-Unique: tt29vyJuMMCsKfnRw_kDUw-1
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: philmd@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 04/13] qemu-plugin.h: remove GCC < 4
Date: Thu, 10 Dec 2020 17:47:43 +0400
Message-Id: <20201210134752.780923-5-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-1-marcandre.lureau@redhat.com>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since commit efc6c07 ("configure: Add a test for the minimum compiler
version"), QEMU explicitely depends on GCC >= 4.8.

(clang >= 3.4 advertizes itself as GCC >= 4.2 compatible)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index bab8b0d4b3..5775e82c4e 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -28,13 +28,8 @@
   #endif
   #define QEMU_PLUGIN_LOCAL
 #else
-  #if __GNUC__ >= 4
-    #define QEMU_PLUGIN_EXPORT __attribute__((visibility("default")))
-    #define QEMU_PLUGIN_LOCAL  __attribute__((visibility("hidden")))
-  #else
-    #define QEMU_PLUGIN_EXPORT
-    #define QEMU_PLUGIN_LOCAL
-  #endif
+  #define QEMU_PLUGIN_EXPORT __attribute__((visibility("default")))
+  #define QEMU_PLUGIN_LOCAL  __attribute__((visibility("hidden")))
 #endif
 
 typedef uint64_t qemu_plugin_id_t;
-- 
2.29.0


