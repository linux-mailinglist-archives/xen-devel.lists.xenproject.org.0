Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E57AC364230
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 15:02:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112900.215234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYTXH-0000LE-65; Mon, 19 Apr 2021 13:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112900.215234; Mon, 19 Apr 2021 13:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYTXH-0000Ks-34; Mon, 19 Apr 2021 13:01:55 +0000
Received: by outflank-mailman (input) for mailman id 112900;
 Mon, 19 Apr 2021 13:01:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3mF=JQ=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lYTXF-0000Kj-TS
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 13:01:53 +0000
Received: from mx.upb.ro (unknown [141.85.13.200])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50124ff3-ad54-47c9-9f1c-e51125f8ae7e;
 Mon, 19 Apr 2021 13:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id C6E48B560053;
 Mon, 19 Apr 2021 16:01:50 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id GJZW3Ua5WQdA; Mon, 19 Apr 2021 16:01:48 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id CF696B5600AE;
 Mon, 19 Apr 2021 16:01:48 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QFE4my-dm-kM; Mon, 19 Apr 2021 16:01:48 +0300 (EEST)
Received: from localhost.localdomain (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id 6FD45B560053;
 Mon, 19 Apr 2021 16:01:48 +0300 (EEST)
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
X-Inumbo-ID: 50124ff3-ad54-47c9-9f1c-e51125f8ae7e
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/libs/light: Remove unnecessary libxl_list_vm() call
Date: Mon, 19 Apr 2021 16:01:42 +0300
Message-Id: <cf7c0f8869a087008fbe10888ebf96336b1ccb7b.1618837159.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The removed lines were initially added by commit 314e64084d31, but the
subsequent code which was using the nb_vm variable was later removed by
commit 2ba368d13893, which makes these lines of code an overlooked
reminiscence. Moreover, the call becomes very expensive when there is a
considerable number of VMs (~1000 instances) running on the host.

Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
---
 tools/libs/light/libxl_create.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_cre=
ate.c
index 0c64268f66..43e9ba9c63 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -578,7 +578,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_co=
nfig *d_config,
                        uint32_t *domid, bool soft_reset)
 {
     libxl_ctx *ctx =3D libxl__gc_owner(gc);
-    int ret, rc, nb_vm;
+    int ret, rc;
     const char *dom_type;
     char *uuid_string;
     char *dom_path, *vm_path, *libxl_path;
@@ -586,7 +586,6 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_co=
nfig *d_config,
     struct xs_permissions rwperm[1];
     struct xs_permissions noperm[1];
     xs_transaction_t t =3D 0;
-    libxl_vminfo *vm_list;
=20
     /* convenience aliases */
     libxl_domain_create_info *info =3D &d_config->c_info;
@@ -869,14 +868,6 @@ retry_transaction:
                         ARRAY_SIZE(rwperm));
     }
=20
-    vm_list =3D libxl_list_vm(ctx, &nb_vm);
-    if (!vm_list) {
-        LOGD(ERROR, *domid, "cannot get number of running guests");
-        rc =3D ERROR_FAIL;
-        goto out;
-    }
-    libxl_vminfo_list_free(vm_list, nb_vm);
-
     xs_write(ctx->xsh, t, GCSPRINTF("%s/uuid", vm_path), uuid_string, st=
rlen(uuid_string));
     xs_write(ctx->xsh, t, GCSPRINTF("%s/name", vm_path), info->name, str=
len(info->name));
=20
--=20
2.20.1


