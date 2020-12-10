Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC2C2D5C37
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 14:49:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49251.87083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMJT-0006c9-6e; Thu, 10 Dec 2020 13:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49251.87083; Thu, 10 Dec 2020 13:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMJT-0006bf-33; Thu, 10 Dec 2020 13:48:55 +0000
Received: by outflank-mailman (input) for mailman id 49251;
 Thu, 10 Dec 2020 13:48:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nlUt=FO=redhat.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1knMJS-0006bH-2f
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:48:54 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4897c4a1-b609-4ecf-8209-e86397e795cd;
 Thu, 10 Dec 2020 13:48:53 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-3rhGTMrfP0ODZkGQQriAyA-1; Thu, 10 Dec 2020 08:48:51 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D45791005E45;
 Thu, 10 Dec 2020 13:48:48 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D37D710016F6;
 Thu, 10 Dec 2020 13:48:35 +0000 (UTC)
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
X-Inumbo-ID: 4897c4a1-b609-4ecf-8209-e86397e795cd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607608133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1DdfdKdA7l8BixI1VKlgzbdz9vMe5mVRY9RuhcSENTs=;
	b=a3GdI08aPy7uMc9VHpSQ5bstbRBapA1JHGtbR90t3jvxOyVl+h56hqIH7+K/M8NW1KoZlt
	gCRE7kz7kKPdgtJIcdr9b0LhHG1UugYJIruL6H3RBSVtGVWK/QcloW0ROeROubIqnAsD/d
	fqxx1j83t5mJ2zLS+XAUnkz6eCYc9ac=
X-MC-Unique: 3rhGTMrfP0ODZkGQQriAyA-1
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
Subject: [PATCH v3 03/13] compiler.h: remove GCC < 3 __builtin_expect fallback
Date: Thu, 10 Dec 2020 17:47:42 +0400
Message-Id: <20201210134752.780923-4-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-1-marcandre.lureau@redhat.com>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since commit efc6c07 ("configure: Add a test for the minimum compiler
version"), QEMU explicitely depends on GCC >= 4.8.

(clang >= 3.4 advertizes itself as GCC >= 4.2 compatible and supports
__builtin_expect too)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/compiler.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index c76281f354..226ead6c90 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -44,10 +44,6 @@
 #endif
 
 #ifndef likely
-#if __GNUC__ < 3
-#define __builtin_expect(x, n) (x)
-#endif
-
 #define likely(x)   __builtin_expect(!!(x), 1)
 #define unlikely(x)   __builtin_expect(!!(x), 0)
 #endif
-- 
2.29.0


