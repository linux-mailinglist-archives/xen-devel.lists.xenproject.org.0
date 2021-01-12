Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B83002F385F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 19:19:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65855.116714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOFs-0004UB-G4; Tue, 12 Jan 2021 18:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65855.116714; Tue, 12 Jan 2021 18:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOFs-0004TS-AQ; Tue, 12 Jan 2021 18:18:56 +0000
Received: by outflank-mailman (input) for mailman id 65855;
 Tue, 12 Jan 2021 18:18:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu5a=GP=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kzOCy-0003Yo-2I
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:15:56 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1e179bf-6ef8-4498-b424-c170b8a7aeda;
 Tue, 12 Jan 2021 18:14:20 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10CIEHSk021407;
 Tue, 12 Jan 2021 19:14:17 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10CIDhQT016579;
 Tue, 12 Jan 2021 19:13:43 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id BAE3D7218; Tue, 12 Jan 2021 19:13:43 +0100 (MET)
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
X-Inumbo-ID: c1e179bf-6ef8-4498-b424-c170b8a7aeda
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] libs/light: fix uuid on NetBSD
Date: Tue, 12 Jan 2021 19:12:35 +0100
Message-Id: <20210112181242.1570-15-bouyer@antioche.eu.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 12 Jan 2021 19:14:17 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

From: Manuel Bouyer <bouyer@netbsd.org>

NetBSD uses the same uuid library as FreeBSD. As this is in a
__FreeBSD__ || __NetBSD__ block, just drop the #ifdef __FreeBSD__
and dead code.

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/libs/light/libxl_uuid.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/tools/libs/light/libxl_uuid.c b/tools/libs/light/libxl_uuid.c
index dadb79bad8..7b68270a33 100644
--- a/tools/libs/light/libxl_uuid.c
+++ b/tools/libs/light/libxl_uuid.c
@@ -82,7 +82,6 @@ void libxl_uuid_generate(libxl_uuid *uuid)
     uuid_enc_be(uuid->uuid, &nat_uuid);
 }
 
-#ifdef __FreeBSD__
 int libxl_uuid_from_string(libxl_uuid *uuid, const char *in)
 {
     uint32_t status;
@@ -95,19 +94,6 @@ int libxl_uuid_from_string(libxl_uuid *uuid, const char *in)
 
     return 0;
 }
-#else
-#define LIBXL__UUID_PTRS(uuid) &uuid[0], &uuid[1], &uuid[2], &uuid[3], \
-                               &uuid[4], &uuid[5], &uuid[6], &uuid[7], \
-                               &uuid[8], &uuid[9], &uuid[10],&uuid[11], \
-                               &uuid[12],&uuid[13],&uuid[14],&uuid[15]
-int libxl_uuid_from_string(libxl_uuid *uuid, const char *in)
-{
-    if ( sscanf(in, LIBXL_UUID_FMT, LIBXL__UUID_PTRS(uuid->uuid)) != sizeof(uuid->uuid) )
-        return -1;
-    return 0;
-}
-#undef LIBXL__UUID_PTRS
-#endif
 
 void libxl_uuid_copy(libxl_ctx *ctx_opt, libxl_uuid *dst,
                      const libxl_uuid *src)
@@ -120,7 +106,6 @@ void libxl_uuid_clear(libxl_uuid *uuid)
     memset(&uuid->uuid, 0, sizeof(uuid->uuid));
 }
 
-#ifdef __FreeBSD__
 int libxl_uuid_compare(const libxl_uuid *uuid1, const libxl_uuid *uuid2)
 {
     uuid_t nat_uuid1, nat_uuid2;
@@ -130,12 +115,6 @@ int libxl_uuid_compare(const libxl_uuid *uuid1, const libxl_uuid *uuid2)
 
     return uuid_compare(&nat_uuid1, &nat_uuid2, NULL);
 }
-#else
-int libxl_uuid_compare(const libxl_uuid *uuid1, const libxl_uuid *uuid2)
-{
-     return memcmp(uuid1->uuid, uuid2->uuid, sizeof(uuid1->uuid));
-}
-#endif
 
 const uint8_t *libxl_uuid_bytearray_const(const libxl_uuid *uuid)
 {
-- 
2.29.2


