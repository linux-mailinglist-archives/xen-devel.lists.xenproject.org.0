Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FB219845A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 21:25:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIzzH-0005y6-5A; Mon, 30 Mar 2020 19:22:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TZrn=5P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jIzzF-0005xt-Lf
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 19:22:17 +0000
X-Inumbo-ID: c3fd449e-72bb-11ea-83d8-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3fd449e-72bb-11ea-83d8-bc764e2007e4;
 Mon, 30 Mar 2020 19:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5RK/M/BD78N+wYg8aAJcgWTuFyhsFJhP/rvS9tnG5ds=; b=gbelpuF+8nz0EGiSJb3ROmX5Bv
 umYGB/CtTDuxmb+xsgzL0NFR5tPOe0tUb42dp6RXODkcn0OzQ6KMi2XYcbQzcmwTRjA/mik4lNUbe
 Moh7iklMlInYb6VDchoCZCSYSFrCr6wKSm0dKGmAer1iVQvH1bUKtEWU+d4yaAwJzdBY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIzzD-0003lr-9V; Mon, 30 Mar 2020 19:22:15 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIzzD-0007AJ-0d; Mon, 30 Mar 2020 19:22:15 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Mar 2020 20:21:56 +0100
Message-Id: <20200330192157.1335-8-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200330192157.1335-1-julien@xen.org>
References: <20200330192157.1335-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 7/8] tools/ocaml: libxb: Avoid to use
 String_val() when value is bytes
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, dfaggioli@suse.com,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Commit ec7d54dd1a "ocaml/libs/xb: Use bytes in place of strings for
mutable buffers" switch mutable buffers from string to bytes. However
the C code were still using String_Val() to access them.

While the underlying structure is the same between string and bytes, a
string is meant to be immutable. OCaml 4.06.1 and later will enforce it.
Therefore, it will not be possible to build the OCaml libs when using
-safe-string. This is because String_val() will return a const value.

To avoid plain cast in the code, the code is now switched to use
Bytes_val(). As the macro is not defined in older OCaml version, we need
to provide a stub.

Take the opportunity to switch to const the buffer in
ml_interface_write() as it should not be modified.

Reported-by: Dario Faggioli <dfaggioli@suse.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/ocaml/libs/xb/xs_ring_stubs.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/libs/xb/xs_ring_stubs.c b/tools/ocaml/libs/xb/xs_ring_stubs.c
index 473787064a..7537a23949 100644
--- a/tools/ocaml/libs/xb/xs_ring_stubs.c
+++ b/tools/ocaml/libs/xb/xs_ring_stubs.c
@@ -36,6 +36,14 @@
 
 #define GET_C_STRUCT(a) ((struct mmap_interface *) a)
 
+/*
+ * Bytes_val has been introduced by Ocaml 4.06.1. So define our own version
+ * if needed.
+ */
+#ifndef Bytes_val
+#define Bytes_val(x) ((unsigned char *) Bp_val(x))
+#endif
+
 CAMLprim value ml_interface_read(value ml_interface,
                                  value ml_buffer,
                                  value ml_len)
@@ -44,7 +52,7 @@ CAMLprim value ml_interface_read(value ml_interface,
 	CAMLlocal1(ml_result);
 
 	struct mmap_interface *interface = GET_C_STRUCT(ml_interface);
-	char *buffer = String_val(ml_buffer);
+	unsigned char *buffer = Bytes_val(ml_buffer);
 	int len = Int_val(ml_len);
 	int result;
 
@@ -103,7 +111,7 @@ CAMLprim value ml_interface_write(value ml_interface,
 	CAMLlocal1(ml_result);
 
 	struct mmap_interface *interface = GET_C_STRUCT(ml_interface);
-	char *buffer = String_val(ml_buffer);
+	const unsigned char *buffer = Bytes_val(ml_buffer);
 	int len = Int_val(ml_len);
 	int result;
 
-- 
2.17.1


