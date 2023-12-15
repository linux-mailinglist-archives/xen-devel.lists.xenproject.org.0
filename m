Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A508814782
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 12:59:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655078.1022742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE6qq-0004Za-1Z; Fri, 15 Dec 2023 11:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655078.1022742; Fri, 15 Dec 2023 11:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE6qp-0004Xu-Uy; Fri, 15 Dec 2023 11:59:31 +0000
Received: by outflank-mailman (input) for mailman id 655078;
 Fri, 15 Dec 2023 11:59:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P6RE=H2=redhat.com=fweimer@srs-se1.protection.inumbo.net>)
 id 1rE6qo-0004Xh-2P
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 11:59:30 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65b75d8c-9b41-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 12:59:28 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-587X5X2KM4K_b81SrIwdzg-1; Fri, 15 Dec 2023 06:59:25 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD707879843
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 11:59:25 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.192.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CF0C1121306
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 11:59:25 +0000 (UTC)
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
X-Inumbo-ID: 65b75d8c-9b41-11ee-98ea-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702641567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=b1+pg+WM6+oojv3iHQ79WbEbE+ZjsqgernGureeLzb8=;
	b=WEY6M9F4TKJ67rDUftHf2wIv4Nh9StF5/XwPMaPft0FUtkkbtdbpk53o89Si9fKMdDQO6r
	+MEbaUKEnvXKIq/n5ISIvwgFR/hgsBw/QTqBkQzcf+dPYQLiXFqlfZNtjUgAxKjxBQIzpS
	I7yL8kjmDRHULmrhPAXUfCtzFfyXbl0=
X-MC-Unique: 587X5X2KM4K_b81SrIwdzg-1
From: Florian Weimer <fweimer@redhat.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] Fix C compatibility issue in mini-os
Date: Fri, 15 Dec 2023 12:59:23 +0100
Message-ID: <87edfn8yn8.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

The cc-option check always fails (that, it picks the second option
unconditionally) if the compiler does not support implicit conversion
from integers to pointers.  Just drop the initialization because it
seems unnecessary in this context.

Related to:

  <https://fedoraproject.org/wiki/Changes/PortingToModernC>
  <https://fedoraproject.org/wiki/Toolchain/PortingToModernC>

Signed-off-by: Florian Weimer <fweimer@redhat.com>

diff --git a/Config.mk b/Config.mk
index f2d1f0a..b7c9887 100644
--- a/Config.mk
+++ b/Config.mk
@@ -21,7 +21,7 @@ endef
 # of which would indicate an "unrecognized command-line option" warning/error.
 #
 # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
-cc-option = $(shell if test -z "`echo 'void*p=1;' | \
+cc-option = $(shell if test -z "`echo 'void*p;' | \
               $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2) -`"; \
               then echo "$(2)"; else echo "$(3)"; fi ;)
 


