Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FC642F179
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 14:52:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210478.367378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbMh0-0001dQ-I1; Fri, 15 Oct 2021 12:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210478.367378; Fri, 15 Oct 2021 12:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbMh0-0001aK-D8; Fri, 15 Oct 2021 12:52:10 +0000
Received: by outflank-mailman (input) for mailman id 210478;
 Fri, 15 Oct 2021 12:52:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=esao=PD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mbMgz-00012o-2z
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 12:52:09 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40cbc8a5-4797-46f1-86f7-a8bb1b3388ee;
 Fri, 15 Oct 2021 12:52:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4FF3621A63;
 Fri, 15 Oct 2021 12:52:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 20ED713FC3;
 Fri, 15 Oct 2021 12:52:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YOatBnN5aWEYHgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 15 Oct 2021 12:52:03 +0000
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
X-Inumbo-ID: 40cbc8a5-4797-46f1-86f7-a8bb1b3388ee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634302323; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YcsMVWc26F4IzPW2qrnc4ICY7a8VQjWrlsP2Sb59fyU=;
	b=b5jLXeJGRzgnF+yPJZIrIJWvYnXluHjYMdVg9xIscKbfTQKjyiujP9hn1EeaijyMyOD9RS
	zAYSX0PULlPGj5LPeX02dGUILdmViL492DfiIV7HiDsCy0TfKQQXrYkLq3BnsvahvzQI7n
	Ug5PjXPL/n3M/X2YjaHH9lF50c0dsGQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 04/12] xen/x86: modify hvm_memory_op() prototype
Date: Fri, 15 Oct 2021 14:51:44 +0200
Message-Id: <20211015125152.25198-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211015125152.25198-1-jgross@suse.com>
References: <20211015125152.25198-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hvm_memory_op() should take an unsigned long as cmd, like
do_memory_op().

As hvm_memory_op() is basically just calling do_memory_op() (or
compat_memory_op()) passing through the parameters the cmd parameter
should have no smaller size than that of the called functions.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/hvm/hypercall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 5be1050453..9d3b193bad 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -31,7 +31,7 @@
 #include <public/hvm/hvm_op.h>
 #include <public/hvm/params.h>
 
-static long hvm_memory_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+static long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc;
 
-- 
2.26.2


