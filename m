Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C254698E7
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:29:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239123.414477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEzm-0005d5-3B; Mon, 06 Dec 2021 14:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239123.414477; Mon, 06 Dec 2021 14:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEzl-0005aj-Vj; Mon, 06 Dec 2021 14:29:33 +0000
Received: by outflank-mailman (input) for mailman id 239123;
 Mon, 06 Dec 2021 14:29:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9VqD=QX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1muEzk-0005Zn-Qy
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:29:32 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed6f0b53-56a0-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 15:29:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E36001FD34;
 Mon,  6 Dec 2021 14:29:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B5F9913C32;
 Mon,  6 Dec 2021 14:29:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iJfiKksermHAOwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Dec 2021 14:29:31 +0000
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
X-Inumbo-ID: ed6f0b53-56a0-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638800971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nT3PojRsjaFLQH8p/xAS/Bo0Edytu7k5yswmTd3p+WU=;
	b=l/AVPQvCcOUNyZWRJHaL9WSGm7BqoSi1U3QcYqtENEdexWTxtvkGrsISDso9akMmqD1uPn
	fgqnDBzxPOM/frDFDx/yOV3tYPhPVbaRLTSe5gMhsWcVfP9l/S1Jod294ENh+5VOS1JSDh
	2wEy9V84fp0IoWopk3Cme8c1m3pYsLk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 1/2] tools/helpers: fix PVH xenstore-stubdom console parameters
Date: Mon,  6 Dec 2021 15:29:28 +0100
Message-Id: <20211206142929.29105-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211206142929.29105-1-jgross@suse.com>
References: <20211206142929.29105-1-jgross@suse.com>
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


