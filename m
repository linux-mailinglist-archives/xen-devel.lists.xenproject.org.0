Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 137D32D5C45
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 14:51:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49295.87191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMLg-0008SV-3s; Thu, 10 Dec 2020 13:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49295.87191; Thu, 10 Dec 2020 13:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMLf-0008S3-VS; Thu, 10 Dec 2020 13:51:11 +0000
Received: by outflank-mailman (input) for mailman id 49295;
 Thu, 10 Dec 2020 13:51:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nlUt=FO=redhat.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1knMLe-0008Pb-1s
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:51:10 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c60d29e6-9b24-42e1-9539-30dca2762416;
 Thu, 10 Dec 2020 13:51:08 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-iPA-pKwJOj-482M4VtH90w-1; Thu, 10 Dec 2020 08:51:04 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2125107ACE6;
 Thu, 10 Dec 2020 13:51:02 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E56CB6E717;
 Thu, 10 Dec 2020 13:50:51 +0000 (UTC)
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
X-Inumbo-ID: c60d29e6-9b24-42e1-9539-30dca2762416
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607608268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/Yso0JMCvkfnEynmDIuRnHbevbaJM9mZp2hfr8WVNA=;
	b=UxzRuB7sLDu0rMOMLu9BWUnRpJsDH9a5Q6pOoyhh+rq+7lxeIYwdmsbLEOMBWtOiwxxztM
	bIbDO+0gcxn32rFuJyB70+YCFcLdDm2UpMYRq9R78efh0Y9WoHJ0JlOwVK3jUq2HWn/grr
	ZBJJWYrZDI2LWQkEC4DoiSpUoSDHiEI=
X-MC-Unique: iPA-pKwJOj-482M4VtH90w-1
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
Subject: [PATCH v3 12/13] linux-user: remove GNUC check
Date: Thu, 10 Dec 2020 17:47:51 +0400
Message-Id: <20201210134752.780923-13-marcandre.lureau@redhat.com>
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

QEMU requires Clang or GCC, that define and support __GNUC__ extensions.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/strace.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 11fea14fba..e00275fcb5 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -24,7 +24,6 @@ struct syscallname {
                    abi_long, abi_long, abi_long);
 };
 
-#ifdef __GNUC__
 /*
  * It is possible that target doesn't have syscall that uses
  * following flags but we don't want the compiler to warn
@@ -32,9 +31,6 @@ struct syscallname {
  * functions.  It is ok to keep them while not used.
  */
 #define UNUSED __attribute__ ((unused))
-#else
-#define UNUSED
-#endif
 
 /*
  * Structure used to translate flag values into strings.  This is
-- 
2.29.0


