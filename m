Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF482816DD
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 17:42:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2234.6628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kONBy-00071m-0K; Fri, 02 Oct 2020 15:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2234.6628; Fri, 02 Oct 2020 15:41:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kONBx-00070g-Q6; Fri, 02 Oct 2020 15:41:53 +0000
Received: by outflank-mailman (input) for mailman id 2234;
 Fri, 02 Oct 2020 15:41:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kONBw-0006vD-9T
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:41:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 763a8954-9454-401c-b98d-f5c3d1e992f8;
 Fri, 02 Oct 2020 15:41:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33DA2ACC8;
 Fri,  2 Oct 2020 15:41:45 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kONBw-0006vD-9T
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:41:52 +0000
X-Inumbo-ID: 763a8954-9454-401c-b98d-f5c3d1e992f8
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 763a8954-9454-401c-b98d-f5c3d1e992f8;
	Fri, 02 Oct 2020 15:41:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601653305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6NXymCcIW4Fjm67kMAu1GZlcSOUTMK3m1fQFdWrEW6A=;
	b=ht1KggQYReLOBEjjwP8uq8Grnk1/oAKhl8LjXUDMC35tiXMauCdt+3LQX/Dd9mbJ5L9EVe
	c2c7BPdeMhSo/q+1HDhGueqb09UTbBu62wTChL9mndUUJaT/1N8NBnpraUp2ITS1YjzaRi
	uM21An7wQm2n4kUXcnaIe4QMd9krXz0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 33DA2ACC8;
	Fri,  2 Oct 2020 15:41:45 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/5] tools/xenstore: remove socket-only option from xenstore client
Date: Fri,  2 Oct 2020 17:41:37 +0200
Message-Id: <20201002154141.11677-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201002154141.11677-1-jgross@suse.com>
References: <20201002154141.11677-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Xenstore access commands (xenstore-*) have the possibility to limit
connection to Xenstore to a local socket (option "-s"). This is an
option making no sense at all, as either there is only a socket, so
the option would be a nop, or there is no socket at all (in case
Xenstore is running in a stubdom or the client is called in a domU),
so specifying the option would just lead to failure.

So drop that option completely.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/man/xenstore-chmod.1.pod    | 4 ----
 docs/man/xenstore-ls.1.pod       | 4 ----
 docs/man/xenstore-read.1.pod     | 4 ----
 docs/man/xenstore-write.1.pod    | 4 ----
 tools/xenstore/xenstore_client.c | 8 ++------
 5 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/docs/man/xenstore-chmod.1.pod b/docs/man/xenstore-chmod.1.pod
index d76f34723d..d221f5dffc 100644
--- a/docs/man/xenstore-chmod.1.pod
+++ b/docs/man/xenstore-chmod.1.pod
@@ -46,10 +46,6 @@ write, and set permissions).
 
 Apply the permissions to the key and all its I<children>.
 
-=item B<-s>
-
-Connect to the Xenstore daemon using a local socket only.
-
 =item B<-u>
 
 Apply the permissions to the key and all its I<parents>.
diff --git a/docs/man/xenstore-ls.1.pod b/docs/man/xenstore-ls.1.pod
index 8dac931e94..a9f8b32653 100644
--- a/docs/man/xenstore-ls.1.pod
+++ b/docs/man/xenstore-ls.1.pod
@@ -50,10 +50,6 @@ I<and> the permissions for any domain not explicitly listed in
 subsequent entries.  The key owner always has full access (read,
 write, and set permissions).
 
-=item B<-s>
-
-Connect to the Xenstore daemon using a local socket only.
-
 =back
 
 =head1 BUGS
diff --git a/docs/man/xenstore-read.1.pod b/docs/man/xenstore-read.1.pod
index f5a7bb7e46..c7768cbbe5 100644
--- a/docs/man/xenstore-read.1.pod
+++ b/docs/man/xenstore-read.1.pod
@@ -16,10 +16,6 @@ Read values of one or more Xenstore I<PATH>s.
 
 Prefix value with key name.
 
-=item B<-s>
-
-Connect to the Xenstore daemon using a local socket only.
-
 =item B<-R>
 
 Read raw value, skip escaping non-printable characters (\x..).
diff --git a/docs/man/xenstore-write.1.pod b/docs/man/xenstore-write.1.pod
index d1b011236a..a0b1bca333 100644
--- a/docs/man/xenstore-write.1.pod
+++ b/docs/man/xenstore-write.1.pod
@@ -13,10 +13,6 @@ provided to write them at once - in one Xenstore transaction.
 
 =over
 
-=item B<-s>
-
-Connect to the Xenstore daemon using a local socket only.
-
 =item B<-R>
 
 Write raw value, skip parsing escaped characters (\x..).
diff --git a/tools/xenstore/xenstore_client.c b/tools/xenstore/xenstore_client.c
index ae7ed3eb9e..8015bfe5be 100644
--- a/tools/xenstore/xenstore_client.c
+++ b/tools/xenstore/xenstore_client.c
@@ -530,7 +530,7 @@ main(int argc, char **argv)
 {
     struct xs_handle *xsh;
     xs_transaction_t xth = XBT_NULL;
-    int ret = 0, socket = 0;
+    int ret = 0;
     int prefix = 0;
     int tidy = 0;
     int upto = 0;
@@ -565,7 +565,6 @@ main(int argc, char **argv)
 	static struct option long_options[] = {
 	    {"help",    0, 0, 'h'},
 	    {"flat",    0, 0, 'f'}, /* MODE_ls */
-	    {"socket",  0, 0, 's'},
 	    {"prefix",  0, 0, 'p'}, /* MODE_read || MODE_list || MODE_ls */
 	    {"tidy",    0, 0, 't'}, /* MODE_rm */
 	    {"upto",    0, 0, 'u'}, /* MODE_chmod */
@@ -593,9 +592,6 @@ main(int argc, char **argv)
 		usage(mode, switch_argv, argv[0]);
 	    }
             break;
-        case 's':
-            socket = 1;
-            break;
 	case 'p':
 	    if ( mode == MODE_read || mode == MODE_list || mode == MODE_ls )
 		prefix = 1;
@@ -675,7 +671,7 @@ main(int argc, char **argv)
 	    max_width = ws.ws_col - 2;
     }
 
-    xsh = xs_open(socket ? XS_OPEN_SOCKETONLY : 0);
+    xsh = xs_open(0);
     if (xsh == NULL) err(1, "xs_open");
 
 again:
-- 
2.26.2


