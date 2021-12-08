Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FDA46CF70
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 09:48:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242082.418761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muscC-0001td-9t; Wed, 08 Dec 2021 08:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242082.418761; Wed, 08 Dec 2021 08:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muscC-0001po-5Y; Wed, 08 Dec 2021 08:47:52 +0000
Received: by outflank-mailman (input) for mailman id 242082;
 Wed, 08 Dec 2021 08:47:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J2Or=QZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1muscA-0001K1-7I
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 08:47:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8503115e-5803-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 09:47:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0B6352191A;
 Wed,  8 Dec 2021 08:47:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D68F813F3B;
 Wed,  8 Dec 2021 08:47:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AOoeMzNxsGGzdQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 08 Dec 2021 08:47:47 +0000
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
X-Inumbo-ID: 8503115e-5803-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638953268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nT3PojRsjaFLQH8p/xAS/Bo0Edytu7k5yswmTd3p+WU=;
	b=UvBlVWL1x0/G7DJ4GahBrQIUwzTNp7P6vYBL61uj9csWpmzLvAgjU6q1K2PEqq5F7jKpjk
	oeSQqU35zbMmC3i4UhtxsDczk7qjozkgZIJyVfe9Ts6ej+AACj+iJiD6W7ODW0+jds/IH5
	g7UcKdnXiarpssq735mbcS1rfVXJW/Y=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 1/2] tools/helpers: fix PVH xenstore-stubdom console parameters
Date: Wed,  8 Dec 2021 09:47:44 +0100
Message-Id: <20211208084745.31082-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211208084745.31082-1-jgross@suse.com>
References: <20211208084745.31082-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using a PVH mode xenstore-stubdom the frame number of the console
should be a PFN instead of a MFN.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
V2:
- rename variable (Andrew Cooper)
---
 tools/helpers/init-xenstore-domain.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index b205a79ee6..9457d0251b 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -30,7 +30,7 @@ static char *param;
 static char *name = "Xenstore";
 static int memory;
 static int maxmem;
-static xen_pfn_t console_mfn;
+static xen_pfn_t console_gfn;
 static xc_evtchn_port_or_error_t console_evtchn;
 
 static struct option options[] = {
@@ -283,7 +283,9 @@ static int build(xc_interface *xch)
     }
 
     rv = 0;
-    console_mfn = xc_dom_p2m(dom, dom->console_pfn);
+    console_gfn = (dom->container_type == XC_DOM_PV_CONTAINER)
+                  ? xc_dom_p2m(dom, dom->console_pfn)
+                  : dom->console_pfn;
 
 err:
     if ( dom )
@@ -528,7 +530,7 @@ int main(int argc, char** argv)
     do_xs_write_dir_node(xsh, fe_path, "tty", "");
     snprintf(buf, 16, "%d", console_evtchn);
     do_xs_write_dir_node(xsh, fe_path, "port", buf);
-    snprintf(buf, 16, "%ld", console_mfn);
+    snprintf(buf, 16, "%ld", console_gfn);
     do_xs_write_dir_node(xsh, fe_path, "ring-ref", buf);
     xs_close(xsh);
 
-- 
2.26.2


