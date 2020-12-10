Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F3A2D5C35
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 14:49:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49240.87059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMJ1-0006Pq-Kb; Thu, 10 Dec 2020 13:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49240.87059; Thu, 10 Dec 2020 13:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMJ1-0006PK-GL; Thu, 10 Dec 2020 13:48:27 +0000
Received: by outflank-mailman (input) for mailman id 49240;
 Thu, 10 Dec 2020 13:48:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nlUt=FO=redhat.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1knMIz-0006Ou-Pz
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:48:25 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 458557fb-3582-4815-a092-145740b29281;
 Thu, 10 Dec 2020 13:48:25 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-8PrYjN8sPoKWRVQm0sBUGQ-1; Thu, 10 Dec 2020 08:48:20 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 044E1107ACE4;
 Thu, 10 Dec 2020 13:48:19 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 428966064B;
 Thu, 10 Dec 2020 13:48:10 +0000 (UTC)
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
X-Inumbo-ID: 458557fb-3582-4815-a092-145740b29281
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607608105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ulMUWJhPnu4f0g/wIardZXW7c36v91u4ATkIG/ONjyg=;
	b=ArTQTcy3FXFs1jzLmExg4fo+1a9AkfgT5G2UqXmmCrl8lHbQyNhfBSQRpRj6E0pMBAGCMl
	5hdqmu1bftOnBvh18399JQ8Ns8TrvpEsOBB+dMETawNM5DoDOYWH5sch7U7YLUBlDCC50Q
	qALAWN7A/cDuPetGh9AEsCUotFOLkGQ=
X-MC-Unique: 8PrYjN8sPoKWRVQm0sBUGQ-1
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
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 01/13] qemu/atomic: Drop special case for unsupported compiler
Date: Thu, 10 Dec 2020 17:47:40 +0400
Message-Id: <20201210134752.780923-2-marcandre.lureau@redhat.com>
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since commit efc6c070aca ("configure: Add a test for the
minimum compiler version") the minimum compiler version
required for GCC is 4.8, which has the GCC BZ#36793 bug fixed.

We can safely remove the special case introduced in commit
a281ebc11a6 ("virtio: add missing mb() on notification").

With clang 3.4, __ATOMIC_RELAXED is defined, so the chunk to
remove (which is x86-specific), isn't reached either.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/atomic.h | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index c1d211a351..8f4b3a80fb 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -241,23 +241,6 @@
 
 #else /* __ATOMIC_RELAXED */
 
-/*
- * We use GCC builtin if it's available, as that can use mfence on
- * 32-bit as well, e.g. if built with -march=pentium-m. However, on
- * i386 the spec is buggy, and the implementation followed it until
- * 4.3 (http://gcc.gnu.org/bugzilla/show_bug.cgi?id=36793).
- */
-#if defined(__i386__) || defined(__x86_64__)
-#if !QEMU_GNUC_PREREQ(4, 4)
-#if defined __x86_64__
-#define smp_mb()    ({ asm volatile("mfence" ::: "memory"); (void)0; })
-#else
-#define smp_mb()    ({ asm volatile("lock; addl $0,0(%%esp) " ::: "memory"); (void)0; })
-#endif
-#endif
-#endif
-
-
 #ifdef __alpha__
 #define smp_read_barrier_depends()   asm volatile("mb":::"memory")
 #endif
-- 
2.29.0


