Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A3E46D78A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 16:56:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242365.419290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzIu-0003xW-7N; Wed, 08 Dec 2021 15:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242365.419290; Wed, 08 Dec 2021 15:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzIt-0003cp-4c; Wed, 08 Dec 2021 15:56:23 +0000
Received: by outflank-mailman (input) for mailman id 242365;
 Wed, 08 Dec 2021 15:56:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J2Or=QZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1muzIm-0001Lz-Gx
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 15:56:16 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e67c314-583f-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 16:56:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1E4241FE0C;
 Wed,  8 Dec 2021 15:56:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D8D4C13C8E;
 Wed,  8 Dec 2021 15:56:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yLyrM5zVsGHIXwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 08 Dec 2021 15:56:12 +0000
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
X-Inumbo-ID: 5e67c314-583f-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638978973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0EFSnHVw6cnDzHQVQhnjfL6RwtaM6YAZunMTPJmxhog=;
	b=s0EWc156YyrnRi9jWgnsTFzBP5o3+MdaGEu9kmrwqCwH/hnjXqvY0QRWhxDNM5+QM7+GRo
	sypHZRtfN0oTrd4ozI89r3gwDc++ja1iUJpCisduLUj2ggN3Qyp47QxAoek42Co5DE1C9z
	peAvux6CsxhqlY4vz0H38Aif5P46Rx8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 12/13] xen: drop calls_to_multicall performance counter
Date: Wed,  8 Dec 2021 16:56:05 +0100
Message-Id: <20211208155606.20029-13-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211208155606.20029-1-jgross@suse.com>
References: <20211208155606.20029-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The calls_to_multicall performance counter is basically redundant to
the multicall hypercall counter. The only difference is the counting
of continuation calls, which isn't really that interesting.

Drop the calls_to_multicall performance counter.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V2:
- new patch
---
 xen/common/multicall.c       | 1 -
 xen/include/xen/perfc_defn.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/xen/common/multicall.c b/xen/common/multicall.c
index 7b20717c88..2e66f9f0c1 100644
--- a/xen/common/multicall.c
+++ b/xen/common/multicall.c
@@ -114,7 +114,6 @@ do_multicall(
     if ( unlikely(disp == mc_preempt) && i < nr_calls )
         goto preempted;
 
-    perfc_incr(calls_to_multicall);
     perfc_add(calls_from_multicall, i);
     mcs->flags = 0;
     return rc;
diff --git a/xen/include/xen/perfc_defn.h b/xen/include/xen/perfc_defn.h
index 08b182ccd9..eb6152859e 100644
--- a/xen/include/xen/perfc_defn.h
+++ b/xen/include/xen/perfc_defn.h
@@ -6,7 +6,6 @@
 
 PERFCOUNTER_ARRAY(hypercalls,           "hypercalls", NR_hypercalls)
 
-PERFCOUNTER(calls_to_multicall,         "calls to multicall")
 PERFCOUNTER(calls_from_multicall,       "calls from multicall")
 
 PERFCOUNTER(irqs,                   "#interrupts")
-- 
2.26.2


