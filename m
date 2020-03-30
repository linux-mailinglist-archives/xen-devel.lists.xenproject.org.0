Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B78A1198458
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 21:25:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIzzY-00067D-CB; Mon, 30 Mar 2020 19:22:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TZrn=5P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jIzzX-00066b-6R
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 19:22:35 +0000
X-Inumbo-ID: c4a4302e-72bb-11ea-b9f4-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4a4302e-72bb-11ea-b9f4-12813bfff9fa;
 Mon, 30 Mar 2020 19:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ar+pkUkHO0IhgHIuaQM/KErTZxeGYex2N8R3XcCHzrQ=; b=eAP96CDy+hf5LJjWKoslWCgnDV
 OBlDEhaQoQj082EWORgY45D5O5I4WegRSYbXD9+2//3vREl11FF+w0VcF2kCnqgSrtTmqanAsNBpK
 Y2Ha3KBi3ShH+xu21RbgHeoDNkWzNUtdUwUHxtJM762kIWqu+ujOJvTy/l4RWhbHEV/E=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIzzE-0003lx-Io; Mon, 30 Mar 2020 19:22:16 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIzzE-0007AJ-9t; Mon, 30 Mar 2020 19:22:16 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Mar 2020 20:21:57 +0100
Message-Id: <20200330192157.1335-9-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200330192157.1335-1-julien@xen.org>
References: <20200330192157.1335-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 8/8] tools/ocaml: Fix stubs build when OCaml has
 been compiled with -safe-string
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

The OCaml code has been fixed to handle properly -safe-string in Xen
4.11, however the stubs part were missed.

On OCaml newer than 4.06.1, String_Val() will return a const char *
when using -safe-string leading to build failure when this is used
in place where char * is expected.

The main use in Xen code base is when a new string is allocated. The
suggested approach by the OCaml community [1] is to use the helper
caml_alloc_initialized_string() but it was introduced by OCaml 4.06.1.

The next best approach is to cast String_val() to (char *) as the helper
would have done. So use it when we need to update the new string using
memcpy().

Take the opportunity to remove the unnecessary cast of the source as
mempcy() is expecting a void *.

[1] https://github.com/ocaml/ocaml/pull/1274

Reported-by: Dario Faggioli <dfaggioli@suse.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---

    I thought about detecting whether caml_alloc_initialized_string()
    strings exist and implement it if not. This requires a bit more
    work, so I would like to get feedback first whether this is worth
    it.
---
 tools/ocaml/libs/xb/xenbus_stubs.c  | 2 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/ocaml/libs/xb/xenbus_stubs.c b/tools/ocaml/libs/xb/xenbus_stubs.c
index 001bb03371..3065181a55 100644
--- a/tools/ocaml/libs/xb/xenbus_stubs.c
+++ b/tools/ocaml/libs/xb/xenbus_stubs.c
@@ -65,7 +65,7 @@ CAMLprim value stub_string_of_header(value tid, value rid, value ty, value len)
 	};
 
 	ret = caml_alloc_string(sizeof(struct xsd_sockmsg));
-	memcpy(String_val(ret), &xsd, sizeof(struct xsd_sockmsg));
+	memcpy((char *) String_val(ret), &xsd, sizeof(struct xsd_sockmsg));
 
 	CAMLreturn(ret);
 }
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 0fdbeac158..94aba38a42 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -501,7 +501,7 @@ CAMLprim value stub_xc_vcpu_context_get(value xch, value domid,
 		failwith_xc(_H(xch));
 
 	context = caml_alloc_string(sizeof(ctxt));
-	memcpy(String_val(context), (char *) &ctxt.c, sizeof(ctxt.c));
+	memcpy((char *) String_val(context), &ctxt.c, sizeof(ctxt.c));
 
 	CAMLreturn(context);
 }
@@ -680,7 +680,7 @@ CAMLprim value stub_xc_readconsolering(value xch)
 		conring_size = size;
 
 	ring = caml_alloc_string(count);
-	memcpy(String_val(ring), str, count);
+	memcpy((char *) String_val(ring), str, count);
 	free(str);
 
 	CAMLreturn(ring);
-- 
2.17.1


