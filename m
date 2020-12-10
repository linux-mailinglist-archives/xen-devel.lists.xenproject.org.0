Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8261D2D5C3E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 14:49:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49265.87120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMKM-0006y1-8u; Thu, 10 Dec 2020 13:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49265.87120; Thu, 10 Dec 2020 13:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMKM-0006xZ-2I; Thu, 10 Dec 2020 13:49:50 +0000
Received: by outflank-mailman (input) for mailman id 49265;
 Thu, 10 Dec 2020 13:49:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nlUt=FO=redhat.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1knMKK-0006vX-Ep
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:49:48 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 63ae00f5-a893-456d-8a2a-2acd1aef07f7;
 Thu, 10 Dec 2020 13:49:45 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-wSJyU3UuOkCKoQd_7B4-4g-1; Thu, 10 Dec 2020 08:49:41 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9659107ACE4;
 Thu, 10 Dec 2020 13:49:39 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AE7B5C1C4;
 Thu, 10 Dec 2020 13:49:27 +0000 (UTC)
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
X-Inumbo-ID: 63ae00f5-a893-456d-8a2a-2acd1aef07f7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607608185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iHYSa9kEpwoKzIqL0kHciIz6Aw/ueVjJb1/YiLOQ2lU=;
	b=PWeD6ogERY3OVZgXFvXfWlGIDhAxwR6vP3/codNXBXPdxcBFtkAvgyUdlpA30lwt3MhfG3
	Fw0MX0bYKMd4exQojM4bnVJJv1+igCJLJfssAR/C29c1mdt0bUIqxJcOKXa3uaLi2v8U/j
	j+cK0TyVY4g3A7yWg6CHfcaQCg13PQM=
X-MC-Unique: wSJyU3UuOkCKoQd_7B4-4g-1
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
Subject: [PATCH v3 06/13] virtiofsd: replace _Static_assert with QEMU_BUILD_BUG_ON
Date: Thu, 10 Dec 2020 17:47:45 +0400
Message-Id: <20201210134752.780923-7-marcandre.lureau@redhat.com>
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

This allows to get rid of a check for older GCC version (which was a bit
bogus too since it was falling back on c++ version..)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tools/virtiofsd/fuse_common.h | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
index 5aee5193eb..a2484060b6 100644
--- a/tools/virtiofsd/fuse_common.h
+++ b/tools/virtiofsd/fuse_common.h
@@ -809,15 +809,6 @@ void fuse_remove_signal_handlers(struct fuse_session *se);
  *
  * On 32bit systems please add -D_FILE_OFFSET_BITS=64 to your compile flags!
  */
-
-#if defined(__GNUC__) &&                                      \
-    (__GNUC__ > 4 || __GNUC__ == 4 && __GNUC_MINOR__ >= 6) && \
-    !defined __cplusplus
-_Static_assert(sizeof(off_t) == 8, "fuse: off_t must be 64bit");
-#else
-struct _fuse_off_t_must_be_64bit_dummy_struct {
-    unsigned _fuse_off_t_must_be_64bit:((sizeof(off_t) == 8) ? 1 : -1);
-};
-#endif
+QEMU_BUILD_BUG_ON(sizeof(off_t) != 8);
 
 #endif /* FUSE_COMMON_H_ */
-- 
2.29.0


