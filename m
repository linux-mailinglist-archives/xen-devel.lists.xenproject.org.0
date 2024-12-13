Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F8C9F11FC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 17:25:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856789.1269308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8Su-0000OG-Rw; Fri, 13 Dec 2024 16:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856789.1269308; Fri, 13 Dec 2024 16:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8Su-0000Lx-P2; Fri, 13 Dec 2024 16:24:32 +0000
Received: by outflank-mailman (input) for mailman id 856789;
 Fri, 13 Dec 2024 16:24:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tM8St-000061-0l
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 16:24:31 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bac62228-b96e-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 17:24:30 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0E33B1F394;
 Fri, 13 Dec 2024 16:24:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B0EF2137CF;
 Fri, 13 Dec 2024 16:24:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZJy9Kb1fXGfFSgAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 13 Dec 2024 16:24:29 +0000
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
X-Inumbo-ID: bac62228-b96e-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1734107070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L2xTCNjOjUSFogDUtL9Ml6AtqorKdQYe/34xDCxxxEg=;
	b=N0WIH8RnI/1mOHjyKiQTlZnM47OIhDo/MKwqVLwsLqpr4sZ8G9Hou564PpjpqRtfxE0z5q
	4tmuGh5OE3F7KKvgetQZoiV8QJWRO8sWyMmgZUj/DJJ3hZ4ps+eMbr/tS59jvaKocRiL52
	6wAMs0KUo7kKAgA3D9bsjw8AQ6H5Vik=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1734107070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L2xTCNjOjUSFogDUtL9Ml6AtqorKdQYe/34xDCxxxEg=;
	b=N0WIH8RnI/1mOHjyKiQTlZnM47OIhDo/MKwqVLwsLqpr4sZ8G9Hou564PpjpqRtfxE0z5q
	4tmuGh5OE3F7KKvgetQZoiV8QJWRO8sWyMmgZUj/DJJ3hZ4ps+eMbr/tS59jvaKocRiL52
	6wAMs0KUo7kKAgA3D9bsjw8AQ6H5Vik=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3 1/7] xen/xsm: make getdomaininfo xsm dummy checks more stringent
Date: Fri, 13 Dec 2024 17:24:15 +0100
Message-ID: <20241213162421.16782-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213162421.16782-1-jgross@suse.com>
References: <20241213162421.16782-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email]
X-Spam-Flag: NO
X-Spam-Level: 

Today the dummy XSM privilege checks for getdomaininfo are less
stringent than possible: they basically rely on the general
sysctl/domctl entry check to do all tests and then do the test with
the XSM_HOOK privilege, which is an "allow all" default.

Instead of XSM_HOOK use XSM_XS_PRIV, which is the privilege really
wanted. Note that this test is still wider than the sysctl entry test,
but there is no easy way to make both domctl and sysctl happy at the
same time.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
V2:
- new patch
---
 xen/common/domctl.c     | 2 +-
 xen/common/sysctl.c     | 2 +-
 xen/include/xsm/dummy.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index ea16b75910..444e072fdc 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -539,7 +539,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         break;
 
     case XEN_DOMCTL_getdomaininfo:
-        ret = xsm_getdomaininfo(XSM_HOOK, d);
+        ret = xsm_getdomaininfo(XSM_XS_PRIV, d);
         if ( ret )
             break;
 
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index d02f44fe3a..c2d99ae12e 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -89,7 +89,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
             if ( num_domains == op->u.getdomaininfolist.max_domains )
                 break;
 
-            if ( xsm_getdomaininfo(XSM_HOOK, d) )
+            if ( xsm_getdomaininfo(XSM_XS_PRIV, d) )
                 continue;
 
             getdomaininfo(d, &info);
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 7956f27a29..f8a3c4b81e 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -137,7 +137,7 @@ static XSM_INLINE int cf_check xsm_domain_create(
 static XSM_INLINE int cf_check xsm_getdomaininfo(
     XSM_DEFAULT_ARG struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_XS_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-- 
2.43.0


