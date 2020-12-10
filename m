Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEFF2D5C41
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 14:50:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49282.87155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMKx-0007z3-5k; Thu, 10 Dec 2020 13:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49282.87155; Thu, 10 Dec 2020 13:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMKx-0007yc-2H; Thu, 10 Dec 2020 13:50:27 +0000
Received: by outflank-mailman (input) for mailman id 49282;
 Thu, 10 Dec 2020 13:50:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nlUt=FO=redhat.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1knMKv-00073v-Es
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:50:25 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2a74ba27-cd5e-4a6b-8b69-3da677a654ee;
 Thu, 10 Dec 2020 13:50:21 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-Gmi7SMuINcumk-1cNlsFsA-1; Thu, 10 Dec 2020 08:50:19 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79F67100C662;
 Thu, 10 Dec 2020 13:50:17 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06182709A0;
 Thu, 10 Dec 2020 13:50:05 +0000 (UTC)
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
X-Inumbo-ID: 2a74ba27-cd5e-4a6b-8b69-3da677a654ee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607608220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=655teq4WQH113PO8F0kS3wL4OZKf3txyzGY5haGVOpE=;
	b=iOk1ZZZbmSaC4t74ALXYq1wQzlzd/EaoS6VEfl+7CHTEfP8Cso0/cPKRJXn0Sb1grYaQXE
	7ajBmjD3E9tFgCpbgln2IcAQY1vzhwLw7NywdoieILo0I6/NNcpsWc80Y4403Z6AtaJSDw
	LIe/63q7kPRTTldA3uE4vxIanyzXLGM=
X-MC-Unique: Gmi7SMuINcumk-1cNlsFsA-1
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
Subject: [PATCH v3 09/13] poison: remove GNUC check
Date: Thu, 10 Dec 2020 17:47:48 +0400
Message-Id: <20201210134752.780923-10-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-1-marcandre.lureau@redhat.com>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marc-André Lureau <marcandre.lureau@redhat.com>

QEMU requires Clang or GCC, that define and support __GNUC__ extensions

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/poison.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/poison.h b/include/exec/poison.h
index 7b9ac361dc..d7ae1f23e7 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -3,7 +3,6 @@
 
 #ifndef HW_POISON_H
 #define HW_POISON_H
-#ifdef __GNUC__
 
 #pragma GCC poison TARGET_I386
 #pragma GCC poison TARGET_X86_64
@@ -93,4 +92,3 @@
 #pragma GCC poison CONFIG_SOFTMMU
 
 #endif
-#endif
-- 
2.29.0


