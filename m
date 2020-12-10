Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0819D2D5C43
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 14:51:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49290.87179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMLP-0008Ko-Pl; Thu, 10 Dec 2020 13:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49290.87179; Thu, 10 Dec 2020 13:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMLP-0008KF-LP; Thu, 10 Dec 2020 13:50:55 +0000
Received: by outflank-mailman (input) for mailman id 49290;
 Thu, 10 Dec 2020 13:50:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nlUt=FO=redhat.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1knMLO-0008JM-5n
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:50:54 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 7111a8d4-b178-4bd1-8218-37c919e727c2;
 Thu, 10 Dec 2020 13:50:53 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-LBqTJH63OeGNdFIMlkfKdw-1; Thu, 10 Dec 2020 08:50:48 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D6A4100C666;
 Thu, 10 Dec 2020 13:50:47 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 446095C1C4;
 Thu, 10 Dec 2020 13:50:36 +0000 (UTC)
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
X-Inumbo-ID: 7111a8d4-b178-4bd1-8218-37c919e727c2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607608253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hcVdp1z/ZHZ0T5ogC3rWT4bNutncQowkRPo6+7t0mqE=;
	b=H/ty3W1o8G+q6IQjVHdwXrXHcGpe6dx6sFdFUU6zcAqFCJNT4EEmNs6islaboIbK/NBvzs
	Yb8iWS5YNnwTuhH6T9kjJ0TpyFBWTrYw2qtEFHXd5KIN9NSrfwJn9q9EQAqfVnT5KsfaFU
	lU26CtP629eUIp4jij/TRwcmRnSOWV0=
X-MC-Unique: LBqTJH63OeGNdFIMlkfKdw-1
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
Subject: [PATCH v3 11/13] compiler: remove GNUC check
Date: Thu, 10 Dec 2020 17:47:50 +0400
Message-Id: <20201210134752.780923-12-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-1-marcandre.lureau@redhat.com>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marc-André Lureau <marcandre.lureau@redhat.com>

QEMU requires Clang or GCC, that define and support __GNUC__ extensions.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/compiler.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 6212295e52..5e6cf2c8e8 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -64,14 +64,10 @@
     (offsetof(container, field) + sizeof_field(container, field))
 
 /* Convert from a base type to a parent type, with compile time checking.  */
-#ifdef __GNUC__
 #define DO_UPCAST(type, field, dev) ( __extension__ ( { \
     char __attribute__((unused)) offset_must_be_zero[ \
         -offsetof(type, field)]; \
     container_of(dev, type, field);}))
-#else
-#define DO_UPCAST(type, field, dev) container_of(dev, type, field)
-#endif
 
 #define typeof_field(type, field) typeof(((type *)0)->field)
 #define type_check(t1,t2) ((t1*)0 - (t2*)0)
@@ -102,7 +98,7 @@
 #if defined(__clang__)
 /* clang doesn't support gnu_printf, so use printf. */
 # define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
-#elif defined(__GNUC__)
+#else
 /* Use gnu_printf (qemu uses standard format strings). */
 # define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
 # if defined(_WIN32)
@@ -112,8 +108,6 @@
  */
 #  define __printf__ __gnu_printf__
 # endif
-#else
-#define GCC_FMT_ATTR(n, m)
 #endif
 
 #ifndef __has_warning
-- 
2.29.0


